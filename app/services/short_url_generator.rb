class ShortUrlGenerator < ApplicationService
  START_POS = 8
  END_POS = 16

  def initialize(url)
    @url = url
  end

  def call
    Digest::SHA1.hexdigest(secret_string)[START_POS..END_POS]
  end

  private

  attr_reader :url

  def secret_string
    url + Time.current.to_s
  end
end
