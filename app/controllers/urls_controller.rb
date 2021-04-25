class UrlsController < ApplicationController
  def create
    short_url = UrlCreator.call(url, ShortUrlGenerator)
    render json: { short_url: short_url }
  end

  private

  def url
    params[:url]
  end
end
