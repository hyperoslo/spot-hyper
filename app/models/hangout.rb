class Hangout < ApplicationRecord
  validates :url, presence: true
  validates :url, format: { with: URI.regexp, message: "Enter a valid hangout url" }
  before_save :shorten_url

  private
  def shorten_url
    b = Bitly.client.shorten(self.url)
    self.url = b.short_url
  end
end
