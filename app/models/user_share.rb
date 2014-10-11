class UserShare < ActiveRecord::Base
  belongs_to :user
  belongs_to :share

  def send_push_notification
    Rails.logger.info "Created user share for #{user.id}"
  end
end
