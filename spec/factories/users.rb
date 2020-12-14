# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'joao' }
    email { Faker::Internet.email }
    password { '123456' }
  end
end
