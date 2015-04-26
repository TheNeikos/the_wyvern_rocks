class ImgTag < BBCode::Tag
  block_options :argument

  on_layout do |arg|
    source = arg.gsub(/javascript:/, '')
    unless source =~ /^https?:\/\//
      source.prepend '//'
    end
    "<img src='#{source}' class='img-responsive'>"
  end
end
