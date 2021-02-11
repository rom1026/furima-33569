FactoryBot.define do
  factory :user do
    nickname              { 'takumi' }
    email                 { 'test@gmail.com' }
    password              { 'shimano1026' }
    password_confirmation { password }
    last_name             { '島野' }
    first_name            { '工' }
    katakana_last_name    { 'シマノ' }
    katakana_first_name   { 'タクミ' }
    birth_date            { '1996-10-26' }
  end
end
