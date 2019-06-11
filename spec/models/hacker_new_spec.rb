require 'rails_helper'

describe HackerNew, type: :model do
  describe 'valid' do
    it 'has title' do
      news = HackerNew.new(title:'title', image:'image.png', excerpt: 'Excerpt', link: 'link')
      expect(news.valid?).to be(true)
    end
  end

  describe 'invalid' do
    it 'is invalid without a title' do
      news = HackerNew.new(image:'image.png', excerpt: 'Excerpt', link: 'link')
      news.valid?
      expect(news.errors[:title]).to include("can't be blank")
    end

    it 'is invalid without a excerpt' do
      news = HackerNew.new(image:'image.png', title: 'title', link: 'link')
      news.valid?
      expect(news.errors[:excerpt]).to include("can't be blank")
    end

    it 'is invalid without a link' do
      news = HackerNew.new(image:'image.png', title: 'title', excerpt: 'excerpt')
      news.valid?
      expect(news.errors[:link]).to include("can't be blank")
    end
  end
end