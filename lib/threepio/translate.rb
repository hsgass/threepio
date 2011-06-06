require_relative '../config'
require_relative 'google_translation'
require 'rest_client'
require 'rexml/document'

module Threepio
  extend Config

  def self.bing(phrase, locale)
    r = RestClient.get "#{bing_url}&from=en&to=#{locale}&text=#{phrase}"
    doc = REXML::Document.new r
    doc.elements.first.text
  end

  def self.google(phrase, locale)
    GoogleTranslation.new(RestClient.get "#{google_url}&target=#{locale}&q=#{phrase}").to_s
  end
end

