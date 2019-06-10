module HackerNewsServices
  ATag = Struct.new(:title, :href)

  class Crawler < Base
    PATH = 'table.itemlist tr.athing td.title a.storylink'.freeze
    META = {
      image: 'meta[property="og:image"]',
      excerpt: 'meta[property="og:description"]'
    }.freeze

    def latest_news(opts = {})
      collect_a_tags(limit: opts[:limit]).each_with_object([]) do |a, res|
        data = get(a.href)
        res << HackerNew.new(title: a.title, image: image(data), excerpt: excerpt(data))
      end
    end

    private

    def image(data)
      data.at(META[:image]).try(:[], 'content')
    end

    def excerpt(data)
      data.at(META[:excerpt]).try(:[], 'content')
    end

    def collect_a_tags(opts = {})
      data = get.css(PATH)
      limit = opts[:limit] || data.size
      data.take(limit).collect do |a|
        ATag.new(a.text, a['href'])
      end
    end

    def get(href = nil)
      Nokogiri::HTML(open(href || url))
    end

    def get_src_link_preview(html)
      data = Nokogiri::HTML(html)
      return nil if data.css('img').empty?
      data.css('img')[0]['src']
    end

    def get_external_content(data)
      img = data.at('meta[property="og:image"]')
      desc = data.at('meta[property="og:description"]')
    end
  end
end