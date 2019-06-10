module HackerNewsServices::Crawlers
  class Base
    attr_accessor :url, :inspector

    def initialize(url, inspector = HackerNewsServices::Crawlers::HtmlInspectors::BestNews)
      @url = url
      @inspector = inspector
    end

    def data
      raise NotImplementedError
    end
  end
end