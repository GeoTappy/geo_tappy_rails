# {
#   "id"=>"1480779002190132", "email"=>"harry_pvgmtkp_potter@tfbnw.net",
#   "first_name"=>"Harry", "gender"=>"male", "last_name"=>"Potter",
#   "link"=>"https://www.facebook.com/app_scoped_user_id/1480779002190132/",
#   "locale"=>"en_US", "name"=>"Harry Potter", "timezone"=>0,
#   "updated_time"=>"2014-10-10T21:56:25+0000", "verified"=>false
# }
module FetchStrategy
  class Facebook
    attr_accessor :token

    FIELDS = %w[id first_name last_name email cover]

    def initialize(token)
      self.token = token
    end

    def user_attributes
      {
        first_name:        user_data['first_name'],
        last_name:         user_data['last_name'],
        email:             user_data['email'],
        profile_photo_url: profile_photo_url,
        cover_photo_url:   cover_photo_url
      }
    end

    def provider
      'facebook'
    end

    def friends
      graph.get_connections('me', 'friends')
    end

    def email
      user_data['email']
    end

    def account_id
      user_data['id']
    end

    def profile_photo_url
      graph.get_picture('me', type: 'normal')
    end

    def cover_photo_url
      user_data.fetch('cover', {})['source']
    end

    def graph
      @graph ||= Koala::Facebook::API.new(token)
    end

    private

    def user_data
      @user_data ||= graph.get_object('me', fields: FIELDS.join(','))
    end
  end
end
