class SubscriptionsController < ApplicationController
  before_action :authorize
  before_action :set_stripe_customer, only: [:show, :update, :destroy]

  def show
  end

  def create
    Subscription.transaction do
      customer = Stripe::Customer.create(
        source: params[:stripeToken],
        plan: "ca-basic",
        quantity: User.count,
        email: current_user.email
      )
      resource.update(
        stripe_id: customer.id,
        subscription_id: customer.subscriptions.data[0].id
      )
    end

    redirect_to subscription_path
  end

  def update
    customer = @stripe_customer

    delete_stripe_default_card
    customer.sources.create(
      source: params[:stripeToken]
    )

    redirect_to subscription_path
  end

  def destroy
    @subscription.transaction do
      delete_stripe_default_card
      delete_stripe_subscription
      @subscription.destroy
    end

    redirect_to subscription_path
  end

  private

  def resource
    @subscription ||= Subscription.find_or_initialize_by(user: current_user)
  end

  def set_stripe_customer
    @stripe_customer ||= Stripe::Customer.retrieve(resource.stripe_id) if resource.stripe_id
  end

  def delete_stripe_default_card
    card_id = @stripe_customer.sources.data[0].id
    @stripe_customer.sources.retrieve(card_id).delete
  end

  def delete_stripe_subscription
    @stripe_customer.subscriptions.retrieve(@subscription.subscription_id).delete
  end
end
