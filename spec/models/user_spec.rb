require 'spec_helper'
require 'rails_helper'

describe User do
  it {should validate_presence_of :name}
  it {should validate_presence_of :email }
  it {should validate_presence_of :uid }
  it {should validate_presence_of :provider }
end
