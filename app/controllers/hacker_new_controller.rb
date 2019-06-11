require 'nokogiri'
require 'open-uri'
class HackerNewController < ApplicationController
  def best
    crawler = HackerNewsServices::Crawlers::BestNews.new('https://news.ycombinator.com/best')
    @results = crawler.data(limit: 5)
  end
end
