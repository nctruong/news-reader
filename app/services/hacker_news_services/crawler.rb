module HackerNewsServices
  class Crawler < Base
    def get
      Nokogiri::HTML(open(url))
    end

    def latest_news
      get
    end
  end
end