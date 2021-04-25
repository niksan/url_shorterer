class ShortUrlGenerator < ApplicationService
  START_POS = 8
  END_POS = 16

  def initialize(url)
    @url = url
  end

  def call
    generate_short_code
  end

  private

  attr_reader :url

  def generate_short_code
    Digest::SHA1.hexdigest(secret_string)[START_POS..END_POS]
  end

  def secret_string
    url + Time.current.to_s
  end
end
