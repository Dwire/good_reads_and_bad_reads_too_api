class Api::V1::BooksController < ApplicationController
  before_action :current_book, only: [:show]

  def index
    @books = Book.all
    render json: @books, status: 200
  end

  def show
    @book_conversations = @book.conversation
  end

  def search
    # NOTE: this is all just a test to the good reads api

    apiKey = ENV["GOOD_READS_API_KEY"]
    term = search_params[:search_term]
    if term.length > 1
      res = RestClient.get "https://www.goodreads.com/search.xml?key=#{apiKey}&q=#{term}"
      doc = Nokogiri::XML(res.body)
      final_output = Hash.from_xml(doc.to_s)

      render json: final_output, status: 200
    else

    end
    # final_output["GoodreadsResponse"]["search"]["results"]["work"]
  end

  private

  def books_params
    params.requir(:book).permit(:title, :author, :page_count, :content, :url_link, :genre)
  end

  def search_params
    params.permit(:search_term)
  end

  def current_book
    @book = Book.find(params[:id])
  end

end
