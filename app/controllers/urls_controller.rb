class UrlsController < ApplicationController
  def create
    short_code = UrlCreator.call(url: params[:url], short_url_generator: ShortUrlGenerator)
    render plain: url_url(short_code)
  end

  def show
    url = StatIncrementer.call(short_code: params[:id], ip: request.remote_ip)
    render plain: url&.full
  end
end
