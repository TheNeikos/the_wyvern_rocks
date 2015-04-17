class UTag < BBCode::Tag
  block_name :u

  on_layout do |args|
    "<span class='underline'>#{args[1]}</span>"
  end
end
