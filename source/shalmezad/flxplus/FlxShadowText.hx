package shalmezad.flxplus;

//import flixel.group.FlxGroup;
import flixel.text.FlxText;

class FlxShadowText extends FlxGroupXY
{
  var txt1:FlxText;
  var txt2:FlxText;

  public var text(default,set):String;
  public var width(get,null):Float;
  public var height(get,null):Float;

  public function new(x:Int = 0, y:Int = 0, width:Int = 100, text:String = "")
  {
    super();
    this.x = x;
    this.y = y;
    txt2 = new FlxText(x+1,y+1,width,text);
    txt1 = new FlxText(x,y,width,text);
    txt2.color = 0xFF000000;
    txt1.color = 0xFFFFFFFF;
    add(txt2);
    add(txt1);
  }


  public function set_text(t:String):String
  {
    text = t;
    txt2.text = text;
    txt1.text = text;
    return text;
  }

  public function get_width():Float
  {
    return txt1.width;
  }

    public function get_height():Float
    {
    return txt2.height;
    }

}
