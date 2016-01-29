class Hangout < ApplicationRecord
  validates :url, presence: true
  validates :url, format: { with: URI.regexp, message: "Enter a valid hangout url" }
  before_save :shorten_url, if: :url_changed?

  private
  def shorten_url
    b = Bitly.client.shorten(url)
    self.url = b.short_url
  end
end
