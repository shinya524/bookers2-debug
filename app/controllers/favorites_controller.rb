class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    books = Book.all
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
  end

  

end
