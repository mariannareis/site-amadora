require 'flickraw'

FlickRaw.api_key="c89310ca79d3f18b181802680724efb2"
FlickRaw.shared_secret="cba17e8a36ed9b17"

photos_of_portfolio = flickr.photos.search(:user_id => '59000182@N03', :tags => 'portfolio')

puts photos_of_portfolio.size

for x in (0...photos_of_portfolio.size) do
  id = photos_of_portfolio[x].id
  secret = photos_of_portfolio[x].secret
  puts FlickRaw.url_b(flickr.photos.getInfo :photo_id => id, :secret => secret)
end

