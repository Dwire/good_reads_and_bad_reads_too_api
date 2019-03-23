class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :page_count, :author, :content, :url_link, :genre
end
