class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  def pundit_user
    byebug
    current_user
  end
end
