# frozen_string_literal: true

# This will guess the User class
FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name  { 'Doe' }
    admin { false }
  end
end
