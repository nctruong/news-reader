class HackerNew
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :title, :image, :excerpt, :link

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
end