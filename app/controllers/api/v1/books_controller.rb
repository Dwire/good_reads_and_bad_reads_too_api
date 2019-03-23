class Api::V1::BooksController < ApplicationController
  before_action :current_book, only: [:show]

  def index
    @books = Book.all
    render json: @books, status: 200
  end

  def show
    @book_conversations = @book.conversation

    # NOTE: this is all just a test to the good reads api
    res = RestClient.get 'https://www.goodreads.com/search.xml?key=IHvX4yayH8zIus6rew&q=Ender%27s+Game'
    doc = Nokogiri::XML(res.body)
    final_output = Hash.from_xml(doc.to_s)
    # final_output["GoodreadsResponse"]["search"]["results"]["work"]

  end

  private

  def books_params
    params.requir(:book).permit(:title, :author, :page_count, :content, :url_link, :genre)
  end

  def current_book
    @book = Book.find(params[:id])
  end

end
