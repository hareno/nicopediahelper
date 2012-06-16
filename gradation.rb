#! -*- encoding: utf-8 -*=

class Color
    
  def initialize(arg = "")
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
        @red, @gre, @blu = 0, 0, 0
      end
    elsif arg.class == Array.new.class
      @red, @gre, @blu = arg.map{|item| item.to_i }
    else
      @red, @gre, @blu = 0, 0, 0
    end
  end
  
  def grad_ary(n, m, size)
    ary = Array.new(size, 0)
    diff = (m - n).to_f / (size - 1).to_f
    size.times{|i|
      ary[i] = (n + diff*i).to_i
    }
    ary
  end
  
  def create_grad(color2 = Color.new("white"),
    wide = 5, size = 10)
    
    rary = grad_ary(get_r, color2.get_r, size)
    gary = grad_ary(get_g, color2.get_g, size)
    bary = grad_ary(get_b, color2.get_b, size)
    
    ary = Array.new(size)
    
    size.times{|i|
      ary[i] = sprintf("#%02x%02x%02x", rary[i], gary[i], bary[i])
    }
    ary
  end
  
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
