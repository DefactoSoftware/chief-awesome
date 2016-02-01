class SubscriptionsController < ApplicationController
  before_filter :authorize
  before_action :set_stripe_customer, only: [:show, :update, :destroy]

  def show
  end

  def create
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      plan: "ca-basic",
      quantity: User.count,
      email: current_user.email
    )

    resource.update(
      stripe_id: customer.id
    )

    redirect_to subscription_path
  end

  def update
    customer = @stripe_customer

    card_id = customer.sources.data[0].id 

    customer.sources.retrieve(card_id).delete() 

    customer.sources.create(
      source: params[:stripeToken]
    ) 

    redirect_to subscription_path
  end

  def destroy
    customer = @stripe_customer
    card_id = customer.sources.data[0].id 
    customer.sources.retrieve(card_id).delete()

    @subscription.destroy
    redirect_to subscription_path
  end

  private

  def resource
    @subscription ||= Subscription.find_or_initialize_by(user: current_user)
  end

  def set_stripe_customer
    @stripe_customer ||= Stripe::Customer.retrieve(resource.stripe_id) if resource.stripe_id
  end
end
