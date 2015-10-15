class SpellsController < ApplicationController
  before_action :set_spell, only: %i[new create edit update show destroy]

  respond_to :html, :js, :json

  def index
    @spells = Spell.all
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
