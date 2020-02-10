class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tasks
  has_many :categories
  has_many :tags

  validates_presence_of :username, :email

  validates :email, uniqueness: true
  validates :username, uniqueness: true

  attr_accessor :login
end
