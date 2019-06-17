class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :bio, :genres, :email, :read_books, :reading_list, :book_clubs

  # has_many :books,

  def read_books
      object.user_books.map do |user_book|
        {
          reader_rating: user_book.reader_rating,
          reader_review: user_book.reader_review,
          reader_suggestion: user_book.reader_suggestion,
          book_detail: {
            id: user_book.book.id,
            url_link: user_book.book.url_link,
            title: user_book.book.title,
            author: user_book.book.author,
            content: user_book.book.content,
            genre: user_book.book.genre
          }
        }
      end
    #   object.books.map do |book|
    #   {
    #     id: book.id,
    #     url_link: book.url_link,
    #     title: book.title,
    #     author: book.author,
    #     content: book.content,
    #     genre: book.genre
    #   }
    # end
  end

  def reading_list
    object.wish_list_books.map do |book|
      {
        id: book.id,
        url_link: book.url_link,
        title: book.title,
        author: book.author,
        content: book.content,
        genre: book.genre
      }
    end
  end

  def book_clubs
    object.book_clubs.map do |club|
      club.to_json
    end
  end

end
