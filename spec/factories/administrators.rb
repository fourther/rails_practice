FactoryGirl.define do
    factory :administrator do
        sequence(:email) { |n| "member#{n}@examle" }
        password 'pw'
        suspended false
    end
end