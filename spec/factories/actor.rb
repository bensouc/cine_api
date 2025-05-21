# frozen_string_literal: true

FactoryBot.define do
  factory :actor do
    name { "Tom Hanks" }
    bio { "Famous actor" }
    birthdate { "1956-07-09" }
  end
end
