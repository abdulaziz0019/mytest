class Category < ApplicationRecord

has_many :article_categories
has_many :articles, through: :article_categories

  validates :name, presence: true
  validates :name, uniqueness: true


end
