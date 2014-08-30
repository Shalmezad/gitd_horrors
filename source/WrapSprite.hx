package ;

import flixel.FlxSprite;

class WrapSprite extends FlxSprite
{

  private function wrapAround():Void
  {
    if(this.x < 0)
    {
      this.x += Main.gameWidth;
    } 
    if(this.y < 0)
    {
      this.y += Main.gameHeight;
    }
    if(this.x > Main.gameWidth)
    {
      this.x -= Main.gameWidth;
    }
    if(this.y > Main.gameHeight)
    {
      this.y -= Main.gameHeight;
    }
  }
}
