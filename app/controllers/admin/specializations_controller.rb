class Admin::SpecializationsController < ApplicationController
  before_action :set_specialization, only: %i[new create edit update show destroy]

  respond_to :html, :js, :json

  def index
    @specializations = Specialization.all

    respond_with @specializations
  end

  def create
    @specialization.save
    respond_with @specialization, location: [:admin, @specialization]
  end

  def update
    @specialization.update(specialization_params)

    respond_with @specialization, location: [:admin, @specialization]
  end

  def destroy
    @specialization.destroy
    respond_with :admin, @specialization
  end

  private
  def specialization_params
    params.require(:specialization).permit(policy(@specialization || Specialization).permitted_attributes)
  end

  def set_specialization
    @specialization ||= case action_name
      when *%w(new) then Specialization.new
      when *%w(create) then Specialization.new(specialization_params)
      when *%w(show edit update destroy) then Specialization.find(params[:id])
    end
  end
end
