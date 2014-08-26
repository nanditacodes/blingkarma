class UsersController < ApplicationController

  def account
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      @user = current_user
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :address, :phone_number)
  end
end
