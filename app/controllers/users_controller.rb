class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	# ユーザー投稿画像を表示
  	@books = @user.books
  end
end
