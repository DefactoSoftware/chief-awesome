class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :uid, presence: true
  validates :provider, presence: true

  has_one :subscription

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
    end
  end
end
