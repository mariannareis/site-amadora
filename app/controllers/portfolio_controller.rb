class PortfolioController < ApplicationController

  def get_photos(this_id)
    FlickRaw.api_key="c89310ca79d3f18b181802680724efb2"
    FlickRaw.shared_secret="cba17e8a36ed9b17"
    @photos = flickr.photos.search(:user_id => '59000182@N03', :tags => 'portfolio')
    id = @photos[this_id].id
    secret = @photos[this_id].secret
    @photo = FlickRaw.url_b(flickr.photos.getInfo :photo_id => id, :secret => secret)
    @photo_title = @photos[this_id].title
    @id = this_id
  end

  def what
    get_photos(params[:id].to_i)
  end


end

