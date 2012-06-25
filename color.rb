# -*- coding: utf-8 -*-

class Color
  
  COLOR_NAME = { "aliceblue" => [240, 248, 255], "lightgreen" => [144, 238, 144],
"antiquewhite" => [250, 235, 215], "lightgrey" => [211, 211, 211],
"aqua" => [0, 255, 255], "lightpink" => [255, 182, 193],
"aquamarine" => [127, 255, 212], "lightsalmon" => [255, 160, 122],
"azure" => [240, 255, 255], "lightseagreen" => [32, 178, 170],
"beige" => [245, 245, 220], "lightskyblue" => [135, 206, 250],
"bisque" => [255, 228, 196], "lightslategray" => [119, 136, 153],
"black" => [0, 0, 0], "lightsteelblue" => [176, 196, 222],
"blanchedalmond" => [255, 235, 205],
"lightyellow" => [255, 255, 224],
"blue" => [0, 0, 255], "lime" => [0, 255, 0],
"blueviolet" => [138, 43, 226],
"limegreen" => [50, 205, 50],
"brass" => [181, 166, 66],
"linen" => [250, 240, 230],
"brown" => [165, 42, 42],
"magenta" => [255, 0, 255],
"burlywood" => [222, 184, 135],
"maroon" => [128, 0, 0],
"cadetblue" => [95, 158, 160],
"mediumaquamarine" => [102, 205, 170],
"chartreuse" => [127, 255, 0],
"mediumblue" => [0, 0, 205],
"chocolate" => [210, 105, 30],
"mediumorchid" => [186, 85, 211],
"coolcopper" => [217, 135, 25],
"mediumpurple" => [147, 112, 219],
"copper" => [191, 0, 223],
"mediumseagreen" => [60, 179, 113],
"coral" => [255, 127, 80],
"mediumslateblue" => [123, 104, 238],
"cornflower" => [191, 239, 223],
"mediumspringgreen" => [0, 250, 154],
"cornflowerblue" => [100, 149, 237],
"mediumturquoise" => [72, 209, 204],
"cornsilk" => [255, 248, 220],
"mediumvioletred" => [199, 21, 133],
"crimson" => [220, 20, 60],
"midnightblue" => [25, 25, 112],
"cyan" => [0, 255, 255],
"mintcream" => [245, 255, 250],
"darkblue" => [0, 0, 139],
"mistyrose" => [255, 228, 225],
"darkbrown" => [218, 11, 0],
"moccasin" => [255, 228, 181],
"darkcyan" => [0, 139, 139],
"navajowhite" => [255, 222, 173],
"darkgoldenrod" => [184, 134, 11],
"navy" => [0, 0, 128],
"darkgray" => [169, 169, 169],
"oldlace" => [253, 245, 230],
"darkgreen" => [0, 100, 0],
"olive" => [128, 128, 0],
"darkkhaki" => [189, 183, 107],
"olivedrab" => [107, 142, 35],
"darkmagenta" => [139, 0, 139],
"orange" => [255, 165, 0],
"darkolivegreen" => [85, 107, 47],
"orangered" => [255, 69, 0],
"darkorange" => [255, 140, 0],
"orchid" => [218, 112, 214],
"darkorchid" => [153, 50, 204],
"palegoldenrod" => [238, 232, 170],
"darkred" => [139, 0, 0],
"palegreen" => [152, 251, 152],
"darksalmon" => [233, 150, 122],
"paleturquoise" => [175, 238, 238],
"darkseagreen" => [143, 188, 143],
"palevioletred" => [219, 112, 147],
"darkslateblue" => [72, 61, 139],
"papayawhip" => [255, 239, 213],
"darkslategray" => [47, 79, 79],
"peachpuff" => [255, 218, 185],
"darkturquoise" => [0, 206, 209],
"peru" => [205, 133, 63],
"darkviolet" => [148, 0, 211],
"pink" => [255, 192, 203],
"deeppink" => [255, 20, 147],
"plum" => [221, 160, 221],
"deepskyblue" => [0, 191, 255],
"powderblue" => [176, 224, 230],
"dimgray" => [105, 105, 105],
"purple" => [128, 0, 128],
"dodgerblue" => [30, 144, 255],
"red" => [255, 0, 0],
"feldsper" => [254, 208, 224],
"richblue" => [12, 176, 224],
"firebrick" => [178, 34, 34],
"rosybrown" => [188, 143, 143],
"floralwhite" => [255, 250, 240],
"royalblue" => [65, 105, 225],
"forestgreen" => [34, 139, 34],
"saddlebrown" => [139, 69, 19],
"fuchsia" => [255, 0, 255],
"salmon" => [250, 128, 114],
"gainsboro" => [220, 220, 220],
"sandybrown" => [244, 164, 96],
"ghostwhite" => [248, 248, 255],
"seagreen" => [46, 139, 87],
"gold" => [255, 215, 0],
"seashell" => [255, 245, 238],
"goldenrod" => [218, 165, 32],
"sienna" => [160, 82, 45],
"gray" => [128, 128, 128],
"silver" => [192, 192, 192],
"green" => [0, 128, 0],
"skyblue" => [135, 206, 235],
"greenyellow" => [173, 255, 47],
"slateblue" => [106, 90, 205],
"honeydew" => [240, 255, 240],
"slategray" => [112, 128, 144],
"hotpink" => [255, 105, 180],
"snow" => [255, 250, 250],
"indianred" => [205, 92, 92],
"springgreen" => [0, 255, 127],
"indigo" => [75, 0, 130],
"steelblue" => [70, 130, 180],
"ivory" => [255, 255, 240],
"tan" => [210, 180, 140],
"khaki" => [240, 230, 140],
"teal" => [0, 128, 128],
"lavender" => [230, 230, 250],
"thistle" => [216, 191, 216],
"lavenderblush" => [255, 240, 245],
"tomato" => [255, 99, 71],
"lawngreen" => [124, 252, 0],
"turquoise" => [64, 224, 208],
"lemonchiffon" => [255, 250, 205],
"violet" => [238, 130, 238],
"lightblue" => [173, 216, 230],
"wheat" => [245, 222, 179],
"lightcoral" => [240, 128, 128],
"white" => [255, 255, 255],
"lightcyan" => [224, 255, 255],
"whitesmoke" => [245, 245, 245],
"lightgoldenrodyellow" => [250, 250, 210],
"yellow" => [255, 255, 0],
"yellowgreen" => [154, 205, 50]
  }
  
  def initialize(arg = nil)
    @red, @gre, @blu = 0, 0, 0
    
    if arg.class == String.new.class
      if COLOR_NAME[arg]
        @red, @gre, @blu = COLOR_NAME[arg]
      elsif arg =~ /^#[0-9a-f]{6}/
        @red, @gre, @blu = arg[1..2].hex, arg[3..4].hex, arg[5..6].hex
      end
    elsif arg.class == Array.new.class
      @red, @gre, @blu = arg.map{|item| item.to_i }
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

