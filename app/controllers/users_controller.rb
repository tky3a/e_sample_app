class UsersController < ApplicationController

  #showのみをサインインなしで閲覧可能にする(indexは閲覧にサインインが必要)
  before_action :authenticate_user!, :except=>[:show]

  def index
    @users = User.paginate(page: params[:page])

  end

  def show
    @user = User.find_by(params[:id])
  end
end
