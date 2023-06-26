class User < ApplicationRecord
  # validates :name, presence: true
  # validates :email, presence: true
  # #Rails 04 User 新規登録　課題
  # #1
  # validates :password, length: { in: 8..32 }
  # #2
  # validates :password,presence: true, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\z/i }
  # #3
  # validates :email, presence: true, format: {with: /[a-zA-Z0-9._+]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*/}
  # #4
  # validates :name, length: {maximum: 15 }
  
  # has_secure_password
  
  # has_many :topics
  # has_many :favorites
  # has_many :favorite_topics, through: :favorites, source: 'topic'
  
  validates :name, presence: true, length: { maximum: 15 }   # validates :email, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\z/i }  
  validates :email, presence: true, format: { with: /[a-zA-Z0-9._+]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*/ } 
  #パスワードの文字数制限を追加する   #validates :password, length: { in: 8..32 }  
  #パスワードをアルファベット、数字の混合のみ可能にしてください   
  PW_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\z/i 
  validates :password, presence: true, format: { with: PW_REGEX } 
  
  has_secure_password
  
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  has_many :comments
  has_many :comments_topics, through: :comments, source: 'topic'

end
