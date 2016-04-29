def stripe_customer_response
    {
      "id": "cus_7plEoIo9TfMtNg",
      "object": "customer",
      "account_balance": 0,
      "created": 1454424064,
      "currency": "eur",
      "default_source": "card_16HGPKJeM8v0iz4rDttgXKVA",
      "delinquent": false,
      "description": "Customer for test@example.com",
      "discount": nil,
      "email": "123@example.com",
      "livemode": false,
      "metadata": {
      },
      "shipping": nil,
      "sources": {
        "object": "list",
        "data": [
          {
            "id": "card_16HGPKJeM8v0iz4rDttgXKVA",
            "object": "card",
            "address_city": nil,
            "address_country": nil,
            "address_line1": nil,
            "address_line1_check": nil,
            "address_line2": nil,
            "address_state": nil,
            "address_zip": nil,
            "address_zip_check": nil,
            "brand": "Visa",
            "country": "US",
            "customer": "cus_7plEoIo9TfMtNg",
            "cvc_check": "pass",
            "dynamic_last4": nil,
            "exp_month": 8,
            "exp_year": 2016,
            "funding": "credit",
            "last4": "4242",
            "metadata": {
            },
            "name": nil,
            "tokenization_method": nil
          }
        ],
        "has_more": false,
        "total_count": 1,
        "url": "/v1/customers/cus_7plEoIo9TfMtNg/sources"
      },
      "subscriptions": {
        "object": "list",
        "data": [
          {
            "id": "sub_7qWA7rCDQmllX7",
            "object": "subscription",
            "application_fee_percent": nil,
            "cancel_at_period_end": false,
            "canceled_at": nil,
            "current_period_end": 1456930893,
            "current_period_start": 1454425293,
            "customer": "cus_7plEoIo9TfMtNg",
            "discount": nil,
            "ended_at": nil,
            "metadata": {
            },
            "plan": {
              "id": "value",
              "object": "plan",
              "amount": 200,
              "created": 1452265371,
              "currency": "eur",
              "interval": "month",
              "interval_count": 1,
              "livemode": false,
              "metadata": {
              },
              "name": "value",
              "statement_descriptor": nil,
              "trial_period_days": nil
            },
            "quantity": 1,
            "start": 1454425293,
            "status": "active",
            "tax_percent": nil,
            "trial_end": nil,
            "trial_start": nil
          }
        ],
        "has_more": false,
        "total_count": 0,
        "url": "/v1/customers/cus_7plEoIo9TfMtNg/subscriptions"
      }
    }.to_json
  end