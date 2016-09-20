class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :capturedimages
  accepts_nested_attributes_for :capturedimages
end
