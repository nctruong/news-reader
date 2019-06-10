require 'rails_helper'

describe HackerNewsServices::Crawler do

  before(:all) do
    @crawler = HackerNewsServices::Crawler.new('https://news.ycombinator.com/best')
  end

  describe '#latest_news' do
    it 'returns data' do
      expect(@crawler.latest_news.blank?).to be(false)
    end

    it 'returns an array' do
      expect(@crawler.latest_news.is_a? Array).to be(true)
    end

    it 'returns an array of HackerNew' do
      expect(@crawler.latest_news.first.is_a? HackerNew).to be(true)
    end
  end
end