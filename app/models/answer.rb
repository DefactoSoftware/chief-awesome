class Answer < ActiveRecord::Base
  validates :user, presence: true
  validates :question, presence: true
  validates :body, presence: true

  belongs_to :question
  belongs_to :user

  scope :not_empty, -> { where.not(id: nil) }
end

# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  body        :string
#  question_id :integer          not null
#  user_id     :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#
