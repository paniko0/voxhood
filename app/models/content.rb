class Content
  include ActiveModel::Model

  attr_accessor :podcasts

  alias :read_attribute_for_serialization :send

  def initialize
    super
    @podcasts = [] # better way to initialize this variable? Need it as Array
  end

end
