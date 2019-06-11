require 'rails_helper'

describe HackerNewsServices::BestNews do

  before(:all) do
  end

  describe '#data' do
    before(:each) do
      crawler = HackerNewsServices::Crawlers::BestNews.new
      @results = crawler.data
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