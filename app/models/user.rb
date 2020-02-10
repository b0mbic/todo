class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tasks
  has_many :categories
  has_many :tags



  validates :email, presence: :true, uniqueness: { case_sensitive: false }
  validates :username, presence: :true, uniqueness: { case_sensitive: false }

end
