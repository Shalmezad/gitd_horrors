package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.math.FlxRandom;

class Coin extends FlxSprite
{

  var VELOCITY:Float = 40;
  public var value:Int = 1;
  var _random:FlxRandom = null;

  private function getRandomInt(min:Int, max:Int):Int
  {
    #if MATH_RANDOM_INTRANGED
      return FlxRandom.intRanged(min, max);
    #else
          if(_random == null)
          {
            _random = new FlxRandom();
          }
          return _random.int(min, max);
    #end
  }

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
    var type:Int = getRandomInt(0,10);
    if(type < 5)
    {
      value = 1;
      loadGraphic("assets/images/bronze_coin.png");
    }
    else if(type < 8)
    {
      value = 3;
      loadGraphic("assets/images/silver_coin.png");
    }
    else
    {
      value = 10;
      loadGraphic("assets/images/gold_coin.png");
    }
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
