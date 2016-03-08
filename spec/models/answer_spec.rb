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

describe Answer do
  describe "validations" do
    it { should validate_presence_of :question }
    it { should validate_presence_of :user }
  end

  describe "associations" do
    it { should belong_to :user }
    it { should belong_to :question }
  end
end
