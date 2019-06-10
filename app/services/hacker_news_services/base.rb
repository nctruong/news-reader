module HackerNewsServices
  class Base
    attr_accessor :crawler

    def initialize(crawler)
      @crawler = crawler
    end

    def data
      raise NotImplementedError
    end
  end
end