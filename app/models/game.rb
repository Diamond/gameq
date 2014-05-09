class Game < ActiveRecord::Base

  validates_uniqueness_of :name

  scope :complete,   -> { where(completed: true) }
  scope :incomplete, -> { where(completed: false) }
end
