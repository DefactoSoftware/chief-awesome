require "spec_helper"

feature "user manages his or her subscription" do
  before :each do
    sign_in_user
    stub_create_customer
    stub_retrieve_customer
    stub_retrieve_card
    stub_new_card
    stub_delete_card
    stub_retrieve_subscription
    stub_cancel_subscription
    add_billing_info
  end

  scenario "user subscribes with credit card" do
    expect(page).to have_content("Credit card: **** **** **** ****4242")
    expect(page).to have_content("Subscription owner: Han Solo")
    expect(Subscription.where(stripe_id: "cus_7plEoIo9TfMtNg",
                              subscription_id: "sub_7qWA7rCDQmllX7")).to be_present
    expect(Subscription.last.user.name).to eq("Han Solo")
  end

  scenario "user changes credit card" do
    click_link "Change billing info"
    click_button "Save Card"

    assert_requested stub_delete_card, times: 1
    assert_requested stub_new_card, times: 1
  end

  scenario "user cancels subscription" do
    click_link "Cancel subscription"

    expect(Subscription.where(stripe_id: "cus_7plEoIo9TfMtNg",
                              subscription_id: "sub_7qWA7rCDQmllX7")).not_to be_present
    expect(page).not_to have_content("Credit card: **** **** **** ****4242")
    expect(page).not_to have_content("Subscription owner: Han Solo")
  end

  private

  def add_billing_info
    visit subscription_path
    click_link "Add billing info"
    click_button "Save Card"
  end
end
