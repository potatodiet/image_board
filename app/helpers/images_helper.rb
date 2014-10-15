module ImagesHelper
  def link_to_source(source)
    domain = source.split("://", 2)[1]
    link_to(domain, source)
  end
end
