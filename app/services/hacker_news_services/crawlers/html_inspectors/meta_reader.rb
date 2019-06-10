module HackerNewsServices::Crawlers::HtmlInspectors
  # Reading meta tags in general
  class MetaReader < Base
    META = {
      title: 'meta[property="og:title"]',
      image: 'meta[property="og:image"]',
      excerpt: 'meta[property="og:description"]'
    }.freeze

    def title
      @html.at(META[:title]).try(:[], 'content')
    end

    def image
      @html.at(META[:image]).try(:[], 'content')
    end

    def excerpt
      @html.at(META[:excerpt]).try(:[], 'content')
    end
  end
end
