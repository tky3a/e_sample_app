class UsersController < ApplicationController

  #showのみをサインインなしで閲覧可能にする(indexは閲覧にサインインが必要)
  before_action :authenticate_user!, :except=>[:show]
  #削除はサインインしたadminユーザーしか出来ない
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end


  def show
    @user = User.find(params[:id])
  end

  private
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
