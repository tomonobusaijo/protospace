class Capturedimage < ActiveRecord::Base
  belongs_to :prototype
  enum role: { main: 0, sub: 1 }
  # carrierwaveとモデルの関連付け
  mount_uploader :picture, PictureUploader
end
