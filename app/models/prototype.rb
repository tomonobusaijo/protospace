class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :capturedimages, dependent: :delete_all
  accepts_nested_attributes_for :capturedimages, allow_destroy: true, reject_if: proc { |attributes| attributes['picture'].blank? }
end
