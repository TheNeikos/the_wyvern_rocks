class ITag < BBCode::Tag
  block_options :content

  on_layout do |content|
    "<em>#{content}</em>"
  end
end
