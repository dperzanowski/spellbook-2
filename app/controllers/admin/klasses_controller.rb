class Admin::KlassesController < ApplicationController
  before_action :set_klass, only: %i[new create edit update show destroy]
  before_action ->{authorize @klass}, only: %i[new create edit update show destroy]

  respond_to :html, :js, :json

  def index
    @klasses = Klass.all
    authorize @klasses

    respond_with @klasses
  end

  def create
    @klass.save
    respond_with @klass, location: [:admin, @klass]
  end

  def update
    @klass.update(klass_params)

    respond_with @klass, location: [:admin, @klass]
  end

  def destroy
    @klass.destroy
    respond_with @klass, location: [:admin, @klass]
  end

  private
  def klass_params
    params.require(:klass).permit(policy(@klass || Klass).permitted_attributes)
  end

  def set_klass
    @klass ||= case action_name
      when *%w(new) then Klass.new
      when *%w(create) then Klass.new(klass_params)
      when *%w(show edit update destroy) then Klass.find(params[:id])
    end
  end
end
