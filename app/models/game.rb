class Game < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true

  scope :complete,   -> { where(completed: true) }
  scope :incomplete, -> { where(completed: false) }
end
