class HackerNewsPresenter < Base
  def load
    HackerNew.cache(model.link) do
      Readability::Document.new(open(model.link).read).content
    end
  end
end