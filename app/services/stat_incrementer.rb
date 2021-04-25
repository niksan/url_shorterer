class StatIncrementer < ApplicationService
  def initialize(short_code:, ip:)
    @short_code = short_code
    @ip = ip
  end

  def call
    increment_stat
    url
  end

  private

  attr_reader :short_code, :ip

  def increment_stat
    return unless url

    UrlStat.find_or_create_by!(url_id: url.id, ip: ip)
  end

  def url
    @url ||= Url.find_by(short: short_code)
  end
end
