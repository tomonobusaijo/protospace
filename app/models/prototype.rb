class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :capturedimages
  accepts_nested_attributes_for :capturedimages, allow_destroy: true, reject_if: proc { |attributes| attributes['picture'].blank? }
end
