class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings
  serialize :photos, Array
  mount_uploaders :photos, PhotoUploader
end
