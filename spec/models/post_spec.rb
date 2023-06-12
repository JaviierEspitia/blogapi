# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :string
#  published  :boolean
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Post, type: :model do

  describe "validations" do
    it "validate presence of required fields" do
      should validate_presence_of(:title)
      should validate_presence_of(:content)
      should validate_presence_of(:user_id)
    end
  end
end
