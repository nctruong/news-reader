module HackerNewsServices::Crawlers
  class BestNews < NewsList
    PATH = 'table.itemlist tr.athing td.title a.storylink'.freeze

    private

    def create_element(tag)
      attr = inspector.new(get_html tag.href).to_h(title: tag.title)
      HackerNew.new attr
    end

    def collect_tags(opts = {})
      data = get_html.css(PATH)
      limit = opts[:limit] || data.size
      data.take(limit).collect { |a| ATag.new(a.text, a['href']) }
    end
  end

  ATag = Struct.new(:title, :href)
end
