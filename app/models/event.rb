class Event < ApplicationRecord
  belongs_to :organizer, class_name: 'User'
  has_many :signups, dependent: :destroy
  has_many :users, through: :signups

  has_many_attached :resources

  validates :name, :description, :location, :date, presence: true
  validates :resources, attached: true, content_type: ['application/pdf', 'image/png', 'image/jpeg', 'text/csv']
end