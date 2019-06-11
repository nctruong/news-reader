module HackerNewsServices::Crawlers
  class Base
    attr_accessor :url, :inspector

    def data
      raise NotImplementedError
    end
  end
end