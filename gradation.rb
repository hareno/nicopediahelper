#! -*- encoding: utf-8 -*=
require './color.rb'

module Gradation
  
  #module mehods
  def grad_ary(n, m, size)
    ary = Array.new(size, 0)
    diff = (m - n).to_f / (size - 1).to_f
    size.times{|i|
      ary[i] = (n + diff*i).to_i
    }
    ary
  end
  
  def grad_colors(color1, color2, size)
    rary = grad_ary(color1.get_r, color2.get_r, size)
    gary = grad_ary(color1.get_g, color2.get_g, size)
    bary = grad_ary(color1.get_b, color2.get_b, size)
    
    ary = Array.new(size)
    
    size.times{|i|
      ary[i] = sprintf("#%02x%02x%02x", rary[i], gary[i], bary[i])
    }
    
    ary
  end
  
  def create_grad(color1, color2 = Color.new("white"),
    wide = 5, size = 20, type = "length")
    
    ary = grad_colors(color1, color2, size)
    str = ""
    
    case type
    when "length"
      ary.each{|item|
        str += "<div style=\"padding-top: #{wide}px; background-color: #{item};\">\n"
      }
    when "cross"
      ary.each{|item|
        str += "<div style=\"padding-left: #{wide}px; background-color: #{item};\">\n"
      }
    else
      ary.each{|item|
        str += "<div style=\"padding: #{wide}px; background-color: #{item};\">\n"
      }
    end
    
    return str
  end
  
end

if __FILE__ == "gradation.rb"
  
  include Gradation
  
  color1 = Color.new(ARGV[0])
  
  str = create_grad(color1, Color.new("white"))
  
  print str
  
end
