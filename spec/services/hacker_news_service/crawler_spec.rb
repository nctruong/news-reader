require 'rails_helper'

describe HackerNewsServices::Crawler do

  before(:all) do
    @crawler = HackerNewsServices::Crawler.new('https://news.ycombinator.com/best')
  end

  describe '#latest_news' do
    it 'returns data' do
      expect(@crawler.latest_news.blank?).to be(false)
    end
  end
end