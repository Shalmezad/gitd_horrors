package;

import flixel.FlxSprite;
import flixel.FlxG;

class Spike extends FlxSprite
{
  var VELOCITY:Float = 30;
  private function new(x:Float, y:Float, angle:Float)
  {
    super();
  }

  public function resetCoin(x:Float, y:Float, angle:Float)
  {
    this.x = x;
    this.y = y;
    this.angle = angle;
    this.velocity.x = Math.cos(angle * Math.PI / 180.0) * VELOCITY;
    this.velocity.y = Math.sin(angle * Math.PI / 180.0) * VELOCITY;
    loadGraphic("assets/images/spike.png");
  }

  override public function update():Void
  {
    super.update();
    if(!isOnScreen(FlxG.camera))
    {
      kill();
    }
  }
}
