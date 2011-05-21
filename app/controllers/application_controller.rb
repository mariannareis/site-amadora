class ApplicationController < ActionController::Base
  protect_from_forgery

    def rss
      @pages = Pages.find(:all, :order => "id DESC", :limit => 10)
      render :layout => false
      response.headers["Content-Type"] = "application/xml; charset=utf-8"
    end

    respond_to do |format|
      format.html
      format.rss { render :layout => false } #index.rss.builder
    end



end

