class Subscription < ActiveRecord::Base
  belongs_to :user

  def cost_per_month
    cost_per_month = User.count * ENV['PRICE_PER_USER'].to_i
  end
end