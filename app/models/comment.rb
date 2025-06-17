class Comment < ApplicationRecord
      belongs_to :user
      belongs_to :post 

      validates :text, :post_id, :user_id, presence: true

      delegate :email, to: :user, prefix: true
end
