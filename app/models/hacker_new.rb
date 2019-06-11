class HackerNew
  EXPIRES_IN = 3.days

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  extend ActiveModel::Callbacks

  attr_accessor :title, :image, :excerpt, :link, :simplified_content

  validates_presence_of :title
  validates_presence_of :excerpt
  validates_presence_of :link

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  def self.find_in_cache(link)
    return HackerNew.cache(link) if Rails.cache.exist? link
    nil
  end

  def self.cache(cache_key, opts = {})
    Rails.cache.fetch("#{cache_key}", expires_in: opts[:expires_in] || EXPIRES_IN) do
      yield
    end
  end
end