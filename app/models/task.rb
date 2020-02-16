class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  has_many :tag_associations, dependent: :delete_all
  has_many :tags, through: :tag_associations

  validates_presence_of :title, :user

  validates :title, :uniqueness => {:scope=>:user_id}

  scope :by_category, -> (cat_id) { where category_id: (cat_id)}
  scope :by_tags, -> (tag_id) { Task.joins(:tags).where(tags: { id: tag_id }) }


  scope :completed, ->  { where is_done: :true}

  self.per_page = 30

  def self.search(pattern)
    if pattern.blank?
      all
    else
      where('title LIKE ? or note LIKE ?', "%#{pattern}%", "%#{pattern}%"  )
    end
  end

  def self.filter_category(pattern)
    if pattern.blank?
      all
    else
      by_category(pattern)
    end
  end

  def self.filter_tags(pattern)
    if pattern.length <= 1
      all
    else
      by_tags(pattern)
    end
  end




end
