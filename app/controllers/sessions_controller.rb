class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email,password)
      flash[:success]
      redirect_to @user
    else
      flash.now[:danger] = 'ログインに成功しました。'
      render 'new'
    end
  end

  def destroy
  end
  
  private
  
  def login(email,password)
    @use = User.find_by(email: email)
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      return true
    else
      return false
    end
  end
end
