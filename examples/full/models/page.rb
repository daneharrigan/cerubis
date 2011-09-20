class Page
  include Cerubis::Method

  attr :title
  attr :subpages

  cerubis_method :title, :subpages, :permalink

  def initialize(title, subpages=[])
    @title    = title
    @subpages = subpages
  end

  def permalink
    "/#{@title.downcase.gsub(/\s/,'-')}"
  end
end
