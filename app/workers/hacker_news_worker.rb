class HackerNewsWorker
  include Sidekiq::Worker

  def perform(inspector, href)
    inspected_data = inspector.constantize.new(Nokogiri::HTML(open href)).to_h(link: href)
    HackerNew.cache(href) do
      HackerNew.new cached_data(inspected_data)
    end
  end

  private

  def cached_data(inspected_data)
    {
        title:   inspected_data[:title],
        image:   inspected_data[:image],
        excerpt: inspected_data[:excerpt],
        link:    inspected_data[:link],
        simplified_content: Readability::Document.new(open(inspected_data[:link]).read).content
    }
  end
end
