class Shortener < ApplicationRecord

  validates :original_url, presence: true, uniqueness: true, on: :create
  before_create :generate_short_url, :sanitize

  URL_LENGHT = 6

  def generate_short_url
    url = ([*('a'..'z'), *('0'..'9')]).sample(URL_LENGHT).join
    existing_url = Shortener.find_by(shorten_url: url)
    existing_url.present? ? self.generate_short_url : self.shorten_url = url
  end

  def sanitize
    self.original_url.strip!
    self.sanitized_url = self.original_url.downcase.gsub(/(https:?:\/\/)|(www\.)/,"")
    self.sanitized_url = "http://#{self.sanitized_url}"
  end
end
