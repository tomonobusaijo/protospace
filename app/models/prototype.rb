class Prototype < ActiveRecord::Base
  include Paginate
  belongs_to :user
  has_many :capturedimages, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  accepts_nested_attributes_for :capturedimages, allow_destroy: true, reject_if: proc { |attributes| attributes['picture'].blank? }
  validates :title, :catchcopy, :concept, presence: true
  acts_as_taggable
  acts_as_taggable_on :prototypes
  acts_as_ordered_taggable_on :prototypes

  def like_user(user)
    likes.find_by(user_id: user)
  end
end
