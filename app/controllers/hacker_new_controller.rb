require 'nokogiri'
require 'open-uri'
class HackerNewController < ApplicationController
  def best
    @results = HackerNewsServices::Crawlers::BestNews.new.data
  end

  def show
    link = params[:link]
    news = HackerNew.find_in_cache(link)
    unless news.nil?
      render json: {
          state: 'done',
          excerpt: news.excerpt,
          image: news.image,
          body: render_to_string(partial: 'single_news', locals: { news: news })
      }
    else
      render json: { state: 'inspecting' }
    end
  end
end
