class UserShare < ActiveRecord::Base
  belongs_to :user
  belongs_to :share
end
