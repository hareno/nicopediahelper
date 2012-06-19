#! -*- encoding: utf-8 -*=

module Gradation

  class Color
    
    def initialize(arg = nil)
      if arg.class == String.new.class
        
        case arg
        when "white"
          @red, @gre, @blu = 255, 255, 255
        when "red"
          @red, @gre, @blu = 255, 0, 0
        when "green"
          @red, @gre, @blu = 0, 255, 0
        when "blue"
          @red, @gre, @blu = 0, 0, 255
        else
          if arg =~ /^#[0-9a-f]{6}/
            @red, @gre, @blu = arg[1..2].hex, arg[3..4].hex, arg[5..6].hex
          else
            @red, @gre, @blu = 0, 0, 0
          end
        end
      elsif arg.class == Array.new.class
        @red, @gre, @blu = arg.map{|item| item.to_i }
      else
        @red, @gre, @blu = 0, 0, 0
      end
    end
    
    def to_s
      sprintf("#%02x%02x%02x", @red, @gre, @blu)
    end
    
    #getter
    def get_r
      @red
    end
    def get_g
      @gre
    end
    def get_b
      @blu
    end
  end
  
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
    wide = 10, size = 10, type = "length")
    
    ary = grad_colors(color1, color2, size)
    str = ""
    
    case type
    when "length"
      ary.each{|item|
        str += "<div style=\"background-color: #{item};\"><div style=\"height: #{wide}px;\"></div>\n"
      }
    when "cross"
      ary.each{|item|
        str += "<div style=\"margin-left: #{wide}px; background-color: #{item};\">\n"
      }
    else
      ary.each{|item|
        str += "<div style=\"padding: #{wide}px; background-color: #{item};\">\n"
      }
    end
    
    return str
  end
  
end
