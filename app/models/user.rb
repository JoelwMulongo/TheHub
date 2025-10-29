class User < ApplicationRecord
  has_secure_password

  has_many :organized_events, class_name: 'Event', foreign_key: :organizer_id, dependent: :destroy
  has_many :signups, dependent: :destroy
  has_many :events, through: :signups

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end