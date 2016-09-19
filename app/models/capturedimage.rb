class Capturedimage < ActiveRecord::Base
  belongs_to :prototype
  # carrierwaveとモデルの関連付け
  mount_uploader :picture, PictureUploader
end
