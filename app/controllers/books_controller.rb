class BooksController < ApplicationController


# 投稿・一覧設定
  def index
  	# Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
  	@book = Book.new
     # 全てのデータを取り出して、格納
    @books = Book.all
  end

  # 投稿設定
  def create

  	# ストロングパラメータを使用
  	@book = Book.new(book_params)
    @books = Book.all
      ### 投稿時の条件分岐 ###
      # DBに保存
  	 if @book.save
      # サクセスメッセージ表示
      flash[:notice] = "Book was successfully created."
  	  # 詳細画面へリダイレクト
  	  redirect_to book_path(@book.id)
      else
      #@books = Book.all
      flash[:alert] = "ERROR!! can't be blank"
      render :index
      end

  end

  # 詳細ページ設定
  def show
    # 取得したURLを@bookに格納
    @book = Book.find(params[:id])
  end

  # 編集ページ設定
  def edit
    # 取得したURLを@bookに格納
    @book = Book.find(params[:id])
  end
  # 編集を保存
  def update
    book = Book.find(params[:id])
    # DBに上書き
    book.update(book_params)
    # 投稿・一覧ページへリダイレクト
    redirect_to book_path(book.id)
    # サクセスメッセージ表示
    flash[:notice] = "Book was successfully updated."
  end

  # 削除設定
  def destroy
    # データ（レコード）を１件取得
    book = Book.find(params[:id])
    # データ（レコード）を削除
    book.destroy
    # 投稿・一覧画面へリダイレクト
    redirect_to books_path
  end

  # 戻る設定
  def back
    # 投稿・一覧設定へリダイレクト
    redirect_to books_path
  end

  private

  # 投稿データの受け取り
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
