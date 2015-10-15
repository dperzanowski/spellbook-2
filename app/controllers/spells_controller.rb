class SpellsController < ApplicationController

  def index
    @spells = Spell.all
  end

  def show
    @spell = Spell.find(params[:id])
  end

  private
  def spell_params
    params.require(:spell).permit(policy(@spell || Spell).permitted_attributes)
  end
end
