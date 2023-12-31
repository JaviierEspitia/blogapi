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
class User < ApplicationRecord

  has_many :posts

  validates :email, presence: true
  validates :auth_token, presence: true
  validates :name, presence: true

  after_initialize :generate_auth_token


  def generate_auth_token
    unless auth_token.present?
      self.auth_token = TokenGenerationService.generate()
    end
  end
end
