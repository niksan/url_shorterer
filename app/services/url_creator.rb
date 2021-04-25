class UrlCreator < ApplicationService
  ATTEMPTS = 10

  def initialize(url, short_url_generator)
    @url = url
    @short_url_generator = short_url_generator
    @attempt_number = 0
  end

  def call
    safe_create_url
  end

  private

  attr_reader :url, :short_url_generator, :attempt_number

  def safe_create_url
    attempt_number += 1
    create_url
  # if we are already have the same short url
  rescue ActiveRecord::RecordInvalid
    retry if attempt_number <= ATTEMPTS
  end

  def create_url
    short_url = short_url_generator.call(url)
    Url.create!(full: url, short: short_url)
  end
end
