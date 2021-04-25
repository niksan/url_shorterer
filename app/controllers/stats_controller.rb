class StatsController < ApplicationController
  def index
    count = StatCounter.call(params[:url_id])
    render plain: count.to_s
  end
end
