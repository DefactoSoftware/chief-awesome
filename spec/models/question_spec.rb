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

describe Question do
  describe "validations" do
    it { should validate_presence_of :user }
  end

  describe "associations" do
    it { should belong_to :user }
    it { should have_many :answers }
  end
end
