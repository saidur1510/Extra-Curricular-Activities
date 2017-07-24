FactoryGirl.define do
  factory :extracurricularactivity do
    name { Faker::Lorem.word }
    department { Faker::Lorem.word }
    interest { Faker::Lorem.word }
  end
end