class UTag < BBCode::Tag
  block_options :content

  on_layout do |content|
    "<span class='underline'>#{content}</span>"
  end
end
