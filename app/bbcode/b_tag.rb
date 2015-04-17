class BTag < BBCode::Tag
  block_name :b

  on_layout do |args|
    "<strong>#{args[1]}</strong>"
  end
end
