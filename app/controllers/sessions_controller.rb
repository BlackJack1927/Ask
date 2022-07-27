class SessionsController < ApplicationController
  def new
  end

  def create
    user_params = params.require(:session)
    user = User.find_by(email: user_params[:email])&.authenticate(user_params[:password])#&. не вдаст ошибки если значение НИЛ
  if user.present?
    session[:user_id] = user.id
  redirect_to root_path, notice: 'You entered on site'
else
  flash.now[:alert] = 'Danger!!!'
  render :new
  end
end

def destroy
session.delete(:user_id)

redirect_to root_path, notice: "Re-Login)))"
end

end
