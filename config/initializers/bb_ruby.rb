module BBRuby
  @@tags = {}

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
  @@tags['Bold'] = [
    /\[b(:.*)?\](.*?)\[\/b\1?\]/mi,
    '<strong>\2</strong>', #Proc alternative for example: lambda{ |e| "<strong>#{e[2]}</strong>" }
    'Embolden text',
    'Look [b]here[/b]',
    :bold]
  @@tags['Italics'] = [
    /\[i(:.+)?\](.*?)\[\/i\1?\]/mi,
    '<em>\2</em>',
    'Italicize or emphasize text',
    'Even my [i]cat[/i] was chasing the mailman!',
    :italics]
  @@tags['Underline'] = [
    /\[u(:.+)?\](.*?)\[\/u\1?\]/mi,
    '<span style="text-decoration:underline;">\2</span>',
    'Underline',
    'Use it for [u]important[/u] things or something',
    :underline]
  @@tags['Strikeout'] = [
    /\[s(:.+)?\](.*?)\[\/s\1?\]/mi,
    '<del>\2</del>',
    'Strikeout',
    '[s]nevermind[/s]',
    :strikeout]
  @@tags['Image (Alternative)'] = [
    /\[img=([^\[\]].*?)\.(#{@@imageformats})\]/im,
      '<img class="img-responsive" src="\1.\2" alt="" />',
      'Display an image (alternative format)',
      '[img=http://myimage.com/logo.gif]',
      :image]
  @@tags['Image'] = [
    /\[img(:.+)?\]([^\[\]].*?)\.(#{@@imageformats})\[\/img\1?\]/im,
      '<img class="img-responsive" src="\2.\3" alt="" />',
      'Display an image',
      'Check out this crazy cat: [img]http://catsweekly.com/crazycat.jpg[/img]',
      :image]
  @@tags['Left'] = [
    /\[left(:.+)?\](.*?)\[\/left\1?\]/mi,
    "<div style=\"text-align: left;\">\\2</div>",
    'Aligns contents along the left side',
    '[left]Left-aligned content[/left]',
    :left]
  @@tags['Center'] = [
    /\[center(:.+)?\](.*?)\[\/center\1?\]/mi,
    "<div style=\"text-align: center;\">\\2</div>",
    'Aligns contents on the center',
    '[center]Centered content[/center]',
    :center]
  @@tags['Right'] = [
    /\[right(:.+)?\](.*?)\[\/right\1?\]/mi,
    "<div style=\"text-align: right;\">\\2</div>",
    'Aligns contents along the right side',
    '[right]Right-aligned content[/right]',
    :right]
  @@tags['Line break'] = [
    /\[br\]/mi,
    "<br />",
    'Inserts line break tag',
    'One[br]Two[br]Three lines!',
    :br]
end
