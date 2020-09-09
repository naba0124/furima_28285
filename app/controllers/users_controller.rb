class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @nickname = current_user.nickname
    @items = current_user.items
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params) # 更新出来たかを条件分岐する
      redirect_to root_path
    else
      redirect_to edit_user_path
    end
  end

  def create
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :birthday, :firstname, :lastname, :firstname_kana, :lastname_kana)
  end
end
