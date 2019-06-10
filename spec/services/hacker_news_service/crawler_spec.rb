require 'spec_helper'

describe HackerNewsService::Crawler do

  before(:all) do
    @crawler = HackerNewsService::Crawler.new('https://news.ycombinator.com/best')
  end

  describe '#latest_news' do
    it 'returns data' do
      expect(@crawler.latest_news.blank?).to be(false)
    end
  end
end