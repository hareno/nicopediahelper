# -*- encoding: utf-8 -*-
#!/usr/bin/ruby

module NicoNico

  def self.get_videoiframe(id, height = 176, width = 312)
"<iframe class=\"nicovideo\" 
src=\"http://ext.nicovideo.jp/thumb/#{id}\" 
frameborder=\"0\" 
height=\"#{height}\" 
scrolling=\"no\" 
width=\"#{width}\"></iframe>"
  end
  
  def self.get_thumb(id, width=91, height=70)
"<a style=\"background-image: none;\" 
href=\"http://www.nicovideo.jp/watch/#{id}\" 
rel=\"nofollow\" target=\"_blank\">
<img style=\"width: #{width}px; height: #{height}px;\" 
src=\"http://tn-skr.smilevideo.jp/smile?i=#{id.slice(2..10)}\" /></a>"
  end
  
end
