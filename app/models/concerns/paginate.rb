module Paginate
  extend ActiveSupport::Concern
  include Kaminari::PageScopeMethods

  included do
    scope :paginate, ->(p, i) { page(p[:page]).per(i) }
  end
end
