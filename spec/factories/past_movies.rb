FactoryBot.define do
  factory :past_movie do
    title {"hello!"}
    genre {"action"}
    review {"hogehogehoge"}
    image {"test_image.jpg"}
    user
  end
end