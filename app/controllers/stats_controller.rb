class StatsController < ApplicationController
  def index
    render plain: stat_count.to_s
  end

  private

  def stat_count
    UrlStat.select(:ip).distinct.where(url_id: url.id).count
  end

  def url
    Url.find_by(short: params[:url_id])
  end
end
