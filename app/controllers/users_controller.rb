class UsersController < ApplicationController

  def index
    @user.user_id = current_user.id

    @user.save
    # ユーザー投稿画像を表示
    @books = @user.books
  end

  def show
  	# 取得URLをuserに格納
  	@user = User.find(params[:id])
  	# 保存
  	@user.save
  	# ユーザー投稿画像を表示
  	@books = @user.books
  end

  #def alluser
   # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    #@user = User.new
     # 全てのデータを取り出して、格納
    #@users = User.all
  #end

  # プロフィール編集アクションを定義
  def edit
    @user = User.find(params[:id])
  end

  # プロフィール画像保存
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :iintroduction)
  end
end
