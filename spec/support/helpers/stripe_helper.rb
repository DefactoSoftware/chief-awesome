module StripeHelper
  def stub_create_customer
    stub_request(:post, "https://api.stripe.com/v1/customers").
            with(:body => { "email" => "123@example.com", "plan"=>"ca-basic", "quantity"=>"1" },
                 :headers => { "Authorization" => "Bearer #{ENV['STRIPE_SECRET_KEY']}" }).
            to_return(:status => 200, :body => stripe_customer_response, :headers => {})
  end

  def stub_retrieve_customer
    stub_request(:get, "https://api.stripe.com/v1/customers/cus_7plEoIo9TfMtNg").
            with(:headers => { "Authorization" => "Bearer #{ENV['STRIPE_SECRET_KEY']}" }).
            to_return(:status => 200, :body => stripe_customer_response, :headers => {})
  end

  def stub_retrieve_subscription
    stub_request(:get, "https://api.stripe.com/v1/customers/cus_7plEoIo9TfMtNg/subscriptions/sub_7qWA7rCDQmllX7").
            with(:headers => { "Authorization" => "Bearer #{ENV['STRIPE_SECRET_KEY']}" }).
            to_return(:status => 200, :body => stripe_subscription_response, :headers => {})
  end

  def stub_cancel_subscription
    stub_request(:delete, "https://api.stripe.com/v1/customers/cus_7plEoIo9TfMtNg/subscriptions/sub_7qWA7rCDQmllX7").
            with(:headers => { "Authorization" => "Bearer #{ENV['STRIPE_SECRET_KEY']}" }).
            to_return(:status => 200, :body => stripe_cancel_subscription_response, :headers => {})
  end

  def stub_retrieve_card
    stub_request(:get, "https://api.stripe.com/v1/customers/cus_7plEoIo9TfMtNg/sources/card_16HGPKJeM8v0iz4rDttgXKVA").
            with(:headers => { "Authorization" => "Bearer #{ENV['STRIPE_SECRET_KEY']}" }).
            to_return(:status => 200, :body => stripe_card_response, :headers => {}) 
  end

  def stub_new_card
    stub_request(:post, "https://api.stripe.com/v1/customers/cus_7plEoIo9TfMtNg/sources").
           with(:headers => { "Authorization" => "Bearer #{ENV['STRIPE_SECRET_KEY']}" }).
           to_return(:status => 200, :body => stripe_new_card_response, :headers => {})
  end

  def stub_delete_card
    stub_request(:delete, "https://api.stripe.com/v1/customers/cus_7plEoIo9TfMtNg/sources/card_16HGPKJeM8v0iz4rDttgXKVA").
            with(:headers => { "Authorization" => "Bearer #{ENV['STRIPE_SECRET_KEY']}" }).
            to_return(:status => 200, :body => stripe_delete_card_response, :headers => {})
  end
end
