class Content

  attr_accessor :podcasts

  def initialize
    super
    @podcasts = [] # better way to initialize this variable? Need it as Array
  end

end
