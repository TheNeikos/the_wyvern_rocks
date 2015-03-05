module BBRuby
  @@tags['Link'] = [
      /\[url=(?:&quot;)?(.*?)(?:&quot;)?\](.*?)\[\/url\]/mi,
      '<a href="\1" rel="nofollow">\2</a>',
      'Hyperlink to somewhere else',
      'Maybe try looking on [url=http://google.com]Google[/url]?',
      :link]
  @@tags['Link (Implied)'] = [
      /\[url\](.*?)\[\/url\]/mi,
      '<a href="\1" rel="nofollow">\1</a>',
      'Hyperlink (implied)',
      'Maybe try looking on [url]http://google.com[/url]',
      :link]
  @@tags['Link (Automatic)'] = [
      %r{(\A|\s)(https?://[^\s<]+)},
      ' <a href="\2" rel="nofollow">\2</a>',
      'Hyperlink (automatic)',
      'Maybe try looking on http://www.google.com',
      :link]
  @@tags['Link (Automatic without leading http(s))'] = [
      /(\A|\s)(www\.[^\s<]+)/,
      ' <a href="http://\2" rel="nofollow">\2</a>',
      'Hyperlink (automatic without leading http(s))',
      'Maybe try looking on www.google.com',
      :link]
end
