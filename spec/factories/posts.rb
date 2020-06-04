FactoryBot.define do

  factory :post do
    text     {"かわいい"}
    image    {File.open("#{Rails.root}/public/images/test_image.jpg")}
  end

end 