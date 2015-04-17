class ITag < BBCode::Tag
  block_name :i

  on_layout do |args|
    "<em>#{args[1]}</em>"
  end
end
