module HackerNewsServices::Crawlers::HtmlInspectors
  class Base
    def initialize(html)
      @html = html
    end
  end
end