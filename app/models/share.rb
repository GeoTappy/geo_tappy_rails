class Share < ActiveRecord::Base
  belongs_to :user

  has_one :location

  has_many :user_shares
end
