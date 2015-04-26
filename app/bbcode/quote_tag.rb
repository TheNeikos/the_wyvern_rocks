class QuoteTag < BBCode::Tag
  block_options :argument, :content

  on_layout do |arg, content|
    user = User.find_by_id(arg)
    render(partial: 'bbcode/userquote', locals: { user: user, message: content, user_name: arg })
  end
end
