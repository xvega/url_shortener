FactoryBot.define do
  factory :shortener do
    original_url { 'https://github.com/xvega/url_shortener/tree/master/spec' }
    shorten_url { 'h1876b' }
    sanitized_url { 'http://github.com/xvega/url_shortener/tree/master/spec' }
  end
end
