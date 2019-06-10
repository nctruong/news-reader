module HackerNewsServices::Crawlers
  class NewsList < Base

    def data(opts = {})
      atags = collect_tags(limit: opts[:limit]).collect do |tag|
        create_element tag
      end
      block_given? ? yield(atags) : atags
    end

    private

    def create_element(tag)
      raise NotImplementedError
    end

    def collect_tags(opts = {})
      raise NotImplementedError
    end

    def get_html(href = nil)
      Nokogiri::HTML(open(href || url))
    end
  end
end
