module HackerNewsServices::Crawlers::HtmlInspectors
  # Optional News Info
  class BestNews < MetaReader
    def to_h(params = {})
      {
          title:   params[:title] || title,
          image:   params[:image] || image,
          excerpt: params[:excerpt] || excerpt
      }
    end
  end
end
