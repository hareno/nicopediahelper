# -*- coding: utf-8 -*-
#! /usr/bin/ruby
require 'kconv'

class VocaloMovieData
  
  # 初期化
  def initialize()
    @name = ""
    @releace = ""
    @hall_of_fame = ""
    @musician = ""
    @id = ""
    @vocal = ""
    
    self
  end
  
  # 曲名の抽出
  def simply_name(str)
    str = str.toutf8
    if str =~ /【.*【/
      str.gsub!(/^[ \s]*【[^【]*】/, "")
      str.gsub!(/[ \s]*【.*】.*/, "")
      str.lstrip!
    elsif str =~ /【/
      str.gsub!(/[　\s]*【[^【]*】[　\s]*/, "")
      str.lstrip!
    end
    if str =~ /[\[「『].*[「『\]]/
      str.sub!(/^[\[「『][^\[「『]*[」』\]][ 　\s]*/, "")
      str.gsub!(/[ 　\s]*[\[「『].*[」』\]].*/, "")
      str.lstrip!
    elsif str =~ /[「]/
      str.sub!(/.*「/, "")
      str.sub!(/」/, "")
    end
    if str =~ /feat[.] /
      str.sub!(/[ \s]*feat[.] .*/, "")
    end
    str.chomp!
    return str
  end
  
#setter
  def set_name(str)
    @name = simply_name(str)
  end
  
  def set_releace(str)
    str =~ /^\d{4}年\d{2}月\d{2}日 \d{2}:\d{2}/
    t_str = $~.to_s + "n"
    year = /\d{4}/.match(t_str).to_a[0]
    mon = /\d{2}月/.match(t_str).to_a[0]
    day = /\d{2}日/.match(t_str).to_a[0]
    hour = /\d{2}:/.match(t_str).to_a[0]
    min = /\d{2}n/.match(t_str).to_a[0]
    @releace = Time.local(year, mon, day, hour, min)
  end
  
  def set_else(str)
    ary = str.split(/,[\s]*/)
    @hall_of_fame = ary[0]
    @musician = ary[1]
    @vocal = ary[2]
    str =~ /[sn][mo]\d*/
    @id = $~.to_s
    self
  end
  
# getter
  def getid
    @id
  end
  def gethalldate
    @hall_of_fame
  end
  def getmusician
    @musician
  end
  def getname
    @name
  end
  def getvocal
    @vocal
  end
  def getreleace
    @releace
  end
end

class MusicDataList
  
  def initialize()
    @list = Array.new
  end
  
  def add(musicdata)
    @list << musicdata
  end
  
  def sort_hall
    @list
  end
end


class MusicDataList
  @list = Array.new
  
  def create_table(musicdata)
    str = "<tr>
<td><iframe class=\"nicovideo\" src=\"http://ext.nicovideo.jp/thumb/#{musicdata.getid}\" 
frameborder=\"0\" height=\"176\" scrolling=\"no\" width=\"312\"></iframe></td>
<td style=\"vertical-align: middle;\">
<ul>
<li>#{musicdata.getid}</li>
<li>#{musicdata.gethalldate}</li>
<li>#{musicdata.getmusician}</li>
<li>#{musicdata.getvocal}</li>
</ul>
</td>
</tr>\n"  
    return str
  end
  
  def calender_table(musicdata)
"\n\n<tr style=\"border-bottom: 1px dotted #cccccc;\">
<td style=\"width: 95px; vertical-align: middle; border-style: none;\">
<a style=\"background-image: none;\" href=\"http://www.nicovideo.jp/watch/#{musicdata.getid}\" rel=\"nofollow\" target=\"_blank\">
<img style=\"width: 91px; height: 70px;\" src=\"http://tn-skr.smilevideo.jp/smile?i=#{(musicdata.getid).slice(2..10)}\" /></a></td>
<td style=\"border-style: none; vertical-align: middle; line-height: normal;\">
<div>#{musicdata.getreleace}<br /> #{musicdata.getname}<br /> #{musicdata.getmusician}<br /> #{musicdata.getvocal}</div>
</td>
</tr>\n\n"
    end
  
  def to_table
    str = ""
    @list.sort{|a, b|
      (b.gethalldate <=> a.gethalldate)
    }.each{|musicdata|
      str += create_table(musicdata)
    }
    return str
  end
  
  def to_calender
    str = ""
    @list.sort{|a, b|
      a.getreleace <=> b.getreleace
    }.each{|musicdata|
      str += calender_table(musicdata)
    }
    return str
  end
  
end


if __FILE__ == "vocalo.rb"
  if ARGV[0]
    readfile = ARGV[0].to_s
  else
    raise "args error: need 1 or 2 args."
  end
  
  f = IO.readlines(readfile)

  list = MusicDataList.new
  
  0.step(f.length, 15) {|index|
    break if f[index+14].to_s == ""
    m = VocaloMovieData.new
    m.set_name(f[index + 3])
    m.set_releace(f[index + 12])
    m.set_else(f[index + 14])
    list.add(m)
  }
  
  str = list.to_calender
  
  open((ARGV[1] || "calender.txt"), "w"){|f|
    list.to_table.each_line{|line|
      f << line
    }
    
    f << "\n\n"
    
    str.each_line{|line|
      f << line
    }
  }
  
end
