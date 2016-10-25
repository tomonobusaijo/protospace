class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include Paginate
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :prototypes
  has_many :likes
  has_many :comments
  validates_presence_of :name, :member, :profile, :works, :avatar
end
