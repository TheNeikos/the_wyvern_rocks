class QuoteTag < BBCode::Tag
  block_name :quote, :argument

  on_layout do |args|
    user = User.find_by_id(args[1])
    render(partial: 'bbcode/userquote', locals: { user: user, message: args[2], user_name: args[1] })
  end
end
