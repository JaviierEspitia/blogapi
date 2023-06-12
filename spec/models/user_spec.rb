# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  auth_token :string
#  email      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do

  describe "validations" do
    it "validate presence of required fields" do
      should validate_presence_of(:email)
      should validate_presence_of(:name)
      should validate_presence_of(:auth_token)
    end

    it "validate relations" do
      should have_many(:posts)
    end

  end
end
