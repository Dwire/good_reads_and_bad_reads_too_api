class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :bio, :genres, :read_books, :reading_list, :book_clubs

  # has_many :books,

  def read_books
      object.books.map do |book|
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
