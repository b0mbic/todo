class TagAssociation < ApplicationRecord
  belongs_to :tag
  belongs_to :task

  validates_presence_of :tag, :task


end
