class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessor :password, :password_confirmation

  validates :email, presence: true, uniqueness: true
  validates_confirmation_of :password
end
