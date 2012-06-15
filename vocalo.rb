# -*- coding: utf-8 -*-
#! /usr/bin/ruby
require 'kconv'

class VocaloMovieData
  
  # 初期化
  def initialize()
    @name = ""
    @releace = Time.new
    @hall_of_fame = ""
    @musician = ""
    @id = ""
    @vocal = ""
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
  
  def str_to_time(str)
    str =~ /^\d{4}年\d{2}月\d{2}日 \d{2}:\d{2}/
    t_str = $~.to_s + "n"
    year = /\d{4}/.match(t_str).to_a[0]
    mon = /\d{2}月/.match(t_str).to_a[0]
    day = /\d{2}日/.match(t_str).to_a[0]
    hour = /\d{2}:/.match(t_str).to_a[0]
    min = /\d{2}n/.match(t_str).to_a[0]
    Time.local(year, mon, day, hour, min)
  end
  
  def set_releace(str)
    @releace = str_to_time(str)
  end
  
  def set_else(str)
    ary = str.split(/,[\s]*/)
    @hall_of_fame = str_to_time(ary[0])
    @musician = ary[1]
    @vocal = ary[2]
    str =~ /[sn][mo]\d*/
    @id = $~.to_s
    self
  end
  
# getter
  def get_id
    @id
  end
  def get_halldate
    @hall_of_fame
  end
  def get_musician
    @musician
  end
  def get_name
    @name
  end
  def get_vocal
    @vocal
  end
  def get_releace
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
<td><iframe class=\"nicovideo\" src=\"http://ext.nicovideo.jp/thumb/#{musicdata.get_id}\" 
frameborder=\"0\" height=\"176\" scrolling=\"no\" width=\"312\"></iframe></td>
<td style=\"vertical-align: middle;\">
<ul>
<li>#{musicdata.get_id}</li>
<li>#{musicdata.get_halldate}</li>
<li>#{musicdata.get_musician}</li>
<li>#{musicdata.get_vocal}</li>
</ul>
</td>
</tr>\n"  
    return str
  end
  
  def calender_table(musicdata)
"\n\n<tr style=\"border-bottom: 1px dotted #cccccc;\">
<td style=\"width: 95px; vertical-align: middle; border-style: none;\">
<a style=\"background-image: none;\" href=\"http://www.nicovideo.jp/watch/#{musicdata.get_id}\" rel=\"nofollow\" target=\"_blank\">
<img style=\"width: 91px; height: 70px;\" src=\"http://tn-skr.smilevideo.jp/smile?i=#{(musicdata.get_id).slice(2..10)}\" /></a></td>
<td style=\"border-style: none; vertical-align: middle; line-height: normal;\">
<div>#{musicdata.get_releace}<br /> #{musicdata.get_name}<br /> #{musicdata.get_musician}<br /> #{musicdata.get_vocal}</div>
</td>
</tr>\n\n"
    end
  
  def to_table
    str = ""
    @list.sort{|a, b|
      (b.get_halldate <=> a.get_halldate)
    }.each{|musicdata|
      str += create_table(musicdata)
    }
    return str
  end
  
  def to_calender
    str = ""
    @list.sort{|a, b|
      a.get_releace <=> b.get_releace
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
