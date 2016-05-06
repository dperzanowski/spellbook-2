class SpellsController < ApplicationController

  before_action :set_spell, only: %i[new create edit update show destroy]

  respond_to :html, :js, :json

  def index
    @spell_schools = Spell.order(school: :asc).uniq.pluck(:school)
    @spell_levels = Spell.order(level: :asc).uniq.pluck(:level)
    @spell_sources = Spell.order(source: :asc).uniq.pluck(:source)

    @spells = Spell.all.filter(params.slice(:level, :school, :source, :type))

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
