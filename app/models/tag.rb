class Tag < ApplicationRecord
  belongs_to :user
  has_many :tag_associations, dependent: :delete_all
  has_many :tasks, through: :tag_associations

  validates_presence_of :title, :color, :user

  self.per_page = 30
end
