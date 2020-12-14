FactoryBot.define do
  factory :account do
    name { 'joao' }
    balance { 0 }
    user {create(:user)}
  end
end
