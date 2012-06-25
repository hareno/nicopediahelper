# -*- coding: utf-8 -*-
#! /usr/bin/ruby
require 'kconv'
load './niconico.rb'

class VocaloMovieData
  
  # 初期化
  def initialize()
    @name = ""
    @releace = Time.new
    @hall_of_fame = Time.new
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
    @hall_of_fame.strftime("%Y年%m月%d日 %H:%M")
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
    @releace.strftime("%Y年%m月%d日 %H:%M")
  end
end


class MusicDataList

  def initialize
    @list = Array.new
  end
  
  def add(m)
    if m.class != VocaloMovieData.new.class
      raise m.to_s+" is not VocaloMovieData class."
    end
    @list << m
    m
  end
  
  def readfile(filename)
    f = IO.readlines(filename)
    f.map!{|str|
      str.toutf8
    }
    n = 0
    
    f.length.times{|i|
      if f[i].to_s =~ /^宣伝する/
        n = i - 1
        break
      end
    }
    
    n.step(f.length, 15) {|index|
      break if f[index+14].to_s == ""
      m = VocaloMovieData.new
      m.set_name(f[index + 3])
      m.set_releace(f[index + 12])
      m.set_else(f[index + 14])
      add(m)
    }
    
    @list
  end
  
  def create_table(musicdata)
    str = "<tr>
<td>#{NicoNico::get_videoiframe(musicdata.get_id)}</td>
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

"\n\n<tr style=\"border-bottom: 1px dotted #cccccc;\"><td style=\"width: 
95px; vertical-align: middle; border-style: 
none;\">#{NicoNico::get_thumb(musicdata.get_id, 91, 70)}</td>
<td style=\"border-style: none; 
vertical-align: middle; line-height: 
normal;\">
<div>#{musicdata.get_releace}<br /> #{musicdata.get_name}<br 
/> #{musicdata.get_musician}<br /> 
#{musicdata.get_vocal}</div></td></tr>\n\n"

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


def main(rfile, wfile = "output.txt")
  list = MusicDataList.new
  list.readfile(rfile)
  
  open(wfile, "w"){|f|
    list.to_table.each_line{|line|
      f << line.tosjis
    }
    f << "\n\n"
    f << list.to_calender.tosjis
  }
end

if __FILE__ == "vocalo.rb"
  
  raise ArgumentError, "args error: #{ARGV.size}" if ARGV.size < 1
  
  if ARGV.size == 1
    main(ARGV[0])
  else
    main(ARGV[0], ARGV[1])
  end
  
end
