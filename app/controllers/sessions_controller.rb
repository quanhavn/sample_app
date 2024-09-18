class SessionsController < ApplicationController
  include SessionsHelper
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user&.authenticate(params[:session][:password])
      reset_session
      params[:session][:remember_me] == 1 ? remember(user) : forget(user)
      log_in(user)
      redirect_to user
    else
      flash[:danger] = 'Invalid password/email combination'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url, status: :see_other
  end
end
