FactoryBot.define do
  factory :user do
    first_name            { 'あべ' }
    first_name_kana       { 'カタカナ' }
    second_name             { '阿部' }
    second_name_kana        { 'カタカナ' }
    nickname { 'abe' }
    birthday { '2020-10-10' }
    email                 { Faker::Internet.free_email }
    password              { '00000q' }
    password_confirmation { password }
  end
end
