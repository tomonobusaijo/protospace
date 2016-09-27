class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :prototype, counter_cache: true
end
