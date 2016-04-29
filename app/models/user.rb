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

class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :uid, presence: true
  validates :provider, presence: true

  has_one :subscription
  has_one :membership, dependent: :destroy
  has_one :team, through: :membership

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]

      domain = user.email.split("@").last
      if Team.where(domain: domain).exists?
        team = Team.where(domain: domain).first
        Membership.create do |membership|
          membership.user = user
          membership.team = team
        end
      else
        user.team = Team.new(
          name: domain,
          domain: domain,
          owner: user
        )
        Membership.create do |membership|
          membership.user = user
          membership.team = user.team
        end
      end
    end
  end

  def email_domain
    self.email.split("@").last
  end
end
