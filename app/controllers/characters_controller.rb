class CharactersController < ApplicationController
  before_action :set_character, only: %i[new create edit update show destroy]

  respond_to :html, :js, :json

  def index
    @characters = Character.all

    respond_with @characters
  end

  def create
    @character.save
    respond_with @character
  end

  def update
    @character.update(character_params)

    respond_with @character
  end

  def destroy
    @character.destroy
    respond_with @character
  end

  private

  def character_params
    params.require(:character).permit(permitted_attributes)
  end

  def permitted_attributes
    policy(@character || Character).permitted_attributes
  end

  def set_character
    @character ||= case action_name
      when *%w(new) then Character.new
      when *%w(create) then Character.new(character_params)
      when *%w(show edit update destroy) then Character.find(params[:id])
    end
  end
end
