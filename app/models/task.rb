class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  has_many :tag_associations, dependent: :delete_all
  has_many :tags, through: :tag_associations

  validates_presence_of :title, :user

  scope :by_category, -> (cat_id) { where category_id: (cat_id)}

  self.per_page = 3
end
