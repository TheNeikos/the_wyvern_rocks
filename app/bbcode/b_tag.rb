class BTag < BBCode::Tag
  block_options :content

  on_layout do |content|
    "<strong>#{content}</strong>"
  end
end
