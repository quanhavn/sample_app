class SessionsController < ApplicationController
  include SessionsHelper
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    puts user

    if user&.authenticate(params[:session][:password])
      reset_session
      log_in(user)
      redirect_to user
    else
      flash[:danger] = 'Invalid password/email combination'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    log_out
    redirect_to root_url, notice: 'You have logged out', status: :see_other
  end
end
