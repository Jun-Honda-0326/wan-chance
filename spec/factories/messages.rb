FactoryBot.define do

  factory :message do
    message     {"こんにちは"}
    user
    room
  end

end
