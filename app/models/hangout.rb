class Hangout < ApplicationRecord
  validates :url, presence: true
  validates :url, format: { with: URI.regexp, message: "Enter a valid hangout url" }
end
