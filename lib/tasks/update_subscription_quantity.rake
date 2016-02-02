desc "Update the subscription quantity in stripe"
task update_subscription_quantity: :environment do
  if Subscription.any?
    stripe_id = Subscription.last.stripe_id
    subscription_id = Subscription.last.subscription_id
    customer = Stripe::Customer.retrieve(stripe_id)
    subscription = customer.subscriptions.retrieve(subscription_id)
    subscription.quantity = User.count
    subscription.save
    puts "updated the subscription quantity to #{User.count}"
  else
    puts "there's no subscription to update"
  end
end