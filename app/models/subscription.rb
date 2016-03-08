# == Schema Information
#
# Table name: subscriptions
#
#  id              :integer          not null, primary key
#  stripe_id       :string
#  subscription_id :string
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Subscription < ActiveRecord::Base
  belongs_to :user

  def cost_per_month
    cost_per_month = User.count * ENV["PRICE_PER_USER"].to_i
  end
end
