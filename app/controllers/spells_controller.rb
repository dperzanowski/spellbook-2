class SpellsController < ApplicationController
  before_action :set_spell, only: %i[new create edit update show destroy]

  respond_to :html, :js, :json

  def index
    @spell_schools = Spell.order(school: :asc).uniq.pluck(:school)
    @spell_levels = Spell.order(level: :asc).uniq.pluck(:level)
    # @player_classes = PlayerClass.order(name: :asc).uniq.pluck(:name)
    @spell_sources = Spell.order(source: :asc).uniq.pluck(:source)

    @spells = Spell.order(:name).page params[:page]

    if params['filters'].present?
      params['filters']['spell_levels'] = params['filters']['spell_levels'].reject {|item| item.empty?}
      params['filters']['spell_schools'] = params['filters']['spell_schools'].reject {|item| item.empty?}
      params['filters']['spell_source'] = params['filters']['spell_source'].reject {|item| item.empty?}
      params['filters']['spell_types'] = params['filters']['spell_types'].reject {|item| item.empty?}

      @spells = Spell.where(nil)
      # @spells = PlayerClass.where(name: params['filters'][:player_class]).first.spells if(params['filters'][:player_class]).present?
      @spells = @spells.level(params['filters']['spell_levels']) if (params['filters']['spell_levels'].present?)
      @spells = @spells.school(params['filters']['spell_schools']) if (params['filters']['spell_schools'].present?)
      @spells = @spells.source(params['filters']['spell_source']) if (params['filters']['spell_source'].present?)
      @spells = @spells.ritual(params['filters']['spell_types']) if (params['filters']['spell_types'].present?)
    end

    respond_with @spells
  end

  def create
    @spell.save
    respond_with @spell
  end

  def update
    @spell.update(spell_params)

    respond_with @spell
  end

  def destroy
    @spell.destroy
    respond_with @spell
  end

  private
  def spell_params
    params.require(:spell).permit(policy(@spell || Spell).permitted_attributes)
  end

  def set_spell
    @spell ||= case action_name
      when *%w(new) then Spell.new
      when *%w(create) then Spell.new(spell_params)
      when *%w(show edit update destroy) then Spell.find(params[:id])
    end
  end
end
