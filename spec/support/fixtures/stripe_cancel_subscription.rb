def stripe_cancel_subscription_response
  {
    "id": "sub_7qWA7rCDQmllX7",
    "object": "subscription",
    "application_fee_percent": nil,
    "cancel_at_period_end": false,
    "canceled_at": nil,
    "current_period_end": 1457192091,
    "current_period_start": 1454600091,
    "customer": "cus_7plEoIo9TfMtNg",
    "discount": nil,
    "ended_at": nil,
    "metadata": {
    },
    "plan": {
      "id": "ca-basic",
      "object": "plan",
      "amount": 200,
      "created": 1454324603,
      "currency": "eur",
      "interval": "month",
      "interval_count": 1,
      "livemode": false,
      "metadata": {
      },
      "name": "Chief Awesome Basic",
      "statement_descriptor": "Chief Awesome",
      "trial_period_days": 30
    },
    "quantity": 1,
    "start": 1454600091,
    "status": "canceled",
    "tax_percent": nil,
    "trial_end": 1457192091,
    "trial_start": 1454600091
  }.to_json
  end
  