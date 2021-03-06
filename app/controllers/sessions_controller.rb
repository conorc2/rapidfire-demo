class SessionsController < ApplicationController
  def new
  end

  def create
    if create_params[:email] == 'admin@example.com' &&
        create_params[:password] == 'password'
      session[:user_id] = User.first.id
      redirect_to rapidfire.root_path
    else
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  private

  def create_params
    params.require(:user).permit(:email, :password)
  end
end
