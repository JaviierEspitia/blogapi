FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    published {
      r = rand(0..1)
      if r == 0
        false
      else
        true
      end
    }
    user # references a user of Factory bot
  end

  factory :published_post, class: 'Post' do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    published { true }
    user # references a user of Factory bot
  end

end
