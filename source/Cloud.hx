package;

import flixel.FlxSprite;
import shalmezad.flxplus.FlxGroupXY;

class Cloud extends FlxGroupXY
{
  public function new(x:Float, y:Float, xVel:Float, yVel:Float, source:String = "assets/images/cloud1.png")
  {
    super();
    for(i in 0...2)
    {
      for(j in 0...2)
      {
        var cloud:FlxSprite = new FlxSprite(x + i * 320,y + j * 240);
        cloud.loadGraphic(source);
        add(cloud);
      }
    }
    this.velocity.x = xVel;
    this.velocity.y = yVel;
  }


  override public function update():Void
  {
    super.update();
    if(this.x < -320)
    {
      this.x += 320;
    }
    if(this.y < -240)
    {
      this.y += 240;
    }
    if(this.x > 0)
    {
      this.x -= 320;
    }
    if(this.y > 0)
    {
      this.y -= 240;
    }
  }
}
