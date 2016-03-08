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

require "spec_helper"

describe User do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :uid }
    it { should validate_presence_of :provider }
  end

  describe "associations" do
    it { should have_many :questions }
    it { should have_many :answers }
  end
end
