# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string
#  domain     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class TeamsController < ApplicationController
  def index
  end
end
