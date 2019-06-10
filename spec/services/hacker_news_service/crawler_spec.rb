require 'rails_helper'

describe HackerNewsServices::Crawler do

  before(:all) do
    @crawler = HackerNewsServices::Crawler.new('https://news.ycombinator.com/best')
  end

  describe '#latest_news' do
    before(:each) do
      @results = @crawler.latest_news(limit:2)
    end

    it 'returns data' do
      expect(@results.blank?).to be(false)
    end

    it 'returns an array' do
      expect(@results.is_a? Array).to be(true)
    end

    it 'returns an array of HackerNew' do
      expect(@results.first.is_a? HackerNew).to be(true)
    end
  end
end