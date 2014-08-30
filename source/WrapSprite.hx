package ;

import flixel.FlxSprite;

class WrapSprite extends FlxSprite
{

  private function wrapAround():Void
  {
    if(this.x + this.width < 0)
    {
      this.x += Main.gameWidth + this.width;
    } 
    if(this.y + this.height < 0)
    {
      this.y += Main.gameHeight + this.height;
    }
    if(this.x > Main.gameWidth)
    {
      this.x -= Main.gameWidth + this.width;
    }
    if(this.y > Main.gameHeight)
    {
      this.y -= Main.gameHeight + this.height;
    }
  }
}
