module HackerNewsServices
  class Base
    attr_reader :url, :opts

    def initialize(url, opts = {})
      @url = url
      @opts = opts
    end

    def get
      raise NotImplementedError
    end
  end
end