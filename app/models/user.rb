
class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :uid, presence: true
  validates :provider, presence: true

  has_one :subscription
  has_many :questions
  has_many :answers

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
    end
  end
end

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  uid        :string
#  provider   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
