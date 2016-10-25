class Prototype < ActiveRecord::Base
  include Paginate
  belongs_to :user
  has_many :capturedimages, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_one :main_image, -> { where(role: 0) }, class_name: "Capturedimage"
  accepts_nested_attributes_for :capturedimages, allow_destroy: true, reject_if: proc { |attributes| attributes['picture'].blank? }
  validates_presence_of :title, :catchcopy, :concept
  acts_as_taggable
  acts_as_taggable_on :prototypes
  acts_as_ordered_taggable_on :prototypes

  def like_user(user)
    likes.find_by(user_id: user)
  end

  def posted_date(time)
    time.strftime('%Y/%m/%d')
  end
end
