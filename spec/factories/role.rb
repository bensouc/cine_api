# frozen_string_literal: true

FactoryBot.define do
  factory :role do
    character_name { "Dr. Alan Grant" }
    association :movie
    association :actor
  end
end
