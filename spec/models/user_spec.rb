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
  it {should validate_presence_of :name}
  it {should validate_presence_of :email }
  it {should validate_presence_of :uid }
  it {should validate_presence_of :provider }
end
