class User < ApplicationRecord
  
  validates :username, presence: true 

  def self.find_or_create_by_auth(access_token)
    data = access_token.info
    @user = User.where(email: data['email']).first
    @user.uid = data
    # Uncomment the section below if you want users to be created if they don't exist
    # unless user
    #     user = User.create(name: data['name'],
    #        email: data['email'],
    #        password: Devise.friendly_token[0,20]
    #     )
    # end
    @user
  end
end
