class Site
  include Cerubis::Method

  attr :title
  attr :homepage

  cerubis_method :title, :homepage

  def initialize(title, homepage)
    @title    = title
    @homepage = homepage
  end
end
