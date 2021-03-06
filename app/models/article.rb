class Article < ApplicationRecord

  has_many :article_categories
  has_many :categories, through: :article_categories
  
  belongs_to :user

  validates :title, presence: true,length: {minimum:3,maximum:40}
  validates :description, presence: true , length: {minimum:10,maximum:200000}

end
