class ImgTag < BBCode::Tag
  block_name :img, :argument, :no_closing_tag

  on_layout do |args|
    source = args[1].gsub(/javascript:/, '')
    unless source =~ /^https?:\/\//
      source.prepend '//'
    end
    "<img src='#{source}' class='img-responsive'>"
  end
end
