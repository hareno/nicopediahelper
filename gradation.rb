#! -*- encoding: utf-8 -*=

class Color
    
  def initialize(str = "")
    case str
    when "white"
      @red, @gre, @blu = 255, 255, 255
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
    bary = grad_ary(get_g, color2.get_b, size)
    
    ary = Array.new(size)
    
    size.times{|i|
      ary[i] = "#" + rary[i].to_s(16) + gary[i].to_s(16) + bary[i].to_s(16)
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
