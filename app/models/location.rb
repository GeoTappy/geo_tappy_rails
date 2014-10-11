class Location < ActiveRecord::Base
  belongs_to :user
  belongs_to :share

  def coordinates
    "#{lat},#{lng}"
  end
end
