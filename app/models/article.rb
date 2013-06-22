class Article < ActiveRecord::Base
  attr_accessible :author_name, :content, :name

  has_many :comments, :as => :commentable
end
