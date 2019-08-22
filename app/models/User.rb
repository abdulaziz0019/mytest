class User < ApplicationRecord
  # set the relation
has_many :articles, dependent: :destroy
# before data save in database ensure
before_save{self.email =  email.downcase }
  # to save data plz validate
  validates :username, presence:true , length:{minimum:1,maximum:10},uniqueness:{case_sensitive:false}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email , presence:true, uniqueness:{case_sensitive:false}, format:{ with: VALID_EMAIL_REGEX}

  #secure password
  has_secure_password


end
