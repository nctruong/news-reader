module HackerNewsServices
  class BestNews < Base
    def data(opts = {})
      crawler.data opts
    end
  end
end