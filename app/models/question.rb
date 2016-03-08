# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  user_id     :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#

class Question < ActiveRecord::Base
  validates :user, :title, presence: true

  belongs_to :user
  has_many :answers, dependent: :destroy
end
