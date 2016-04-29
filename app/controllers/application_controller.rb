class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :current_team

  def authorize
    redirect_to root_path, alert: "Not authorized" unless current_user
  end

  def authorize_owner
    redirect_to root_path, alert: "Not authorized" unless current_user == current_team.owner
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_team
    @current_team = current_user.team
  end

end
