class Category < ApplicationRecord
  belongs_to :user
  has_many :tasks

  validates_presence_of :title, :color, :user

  self.per_page = 5
end
