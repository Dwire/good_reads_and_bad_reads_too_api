class UserBooksController < ApplicationController
  def index
    @user_books = UserBook.all
  end
end
