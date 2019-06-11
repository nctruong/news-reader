module HackerNewsServices::Crawlers
  class BestNews < NewsList
    PATH = 'table.itemlist tr.athing td.title a.storylink'.freeze

    def initialize
      @url = 'https://news.ycombinator.com/best'
      @inspector = HackerNewsServices::Crawlers::HtmlInspectors::BestNews
    end

    private

    def create_element(tag)
      if Rails.cache.exist? tag.href
        return HackerNew.cache(tag.href)
      else
        HackerNewsWorker.perform_async(inspector, tag.href)
        return HackerNew.new(title: tag.title, link: tag.href, excerpt: 'inspecting')
      end
    end

    def collect_tags(opts = {})
      data = get_html.css(PATH)
      limit = opts[:limit] || data.size
      data.take(limit).collect { |a| ATag.new(a.text, a['href']) }
    end
  end

  ATag = Struct.new(:title, :href)
end
