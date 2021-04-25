class UrlsController < ApplicationController
  def create
    short_code = UrlCreator.call(url: url_param, short_url_generator: ShortUrlGenerator)
    render plain: url_url(short_code)
  end

  private

  def url_param
    params[:url]
  end

  def short_url_param
    params[:short_url]
  end
end
