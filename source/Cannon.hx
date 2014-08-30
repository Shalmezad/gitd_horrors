package;

import flixel.FlxSprite;
import flixel.math.FlxRandom;

class Cannon extends WrapSprite 
{

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

  public function new()
  {
    super();
    loadGraphic("assets/images/money_cannon.png");
    maxVelocity.x = 80;
    maxVelocity.y = 80;
  }


  override public function update():Void
  {
    super.update();
    this.angle += 1;
    this.acceleration.x += getRandomInt(0,100)/100.0 - .5;
    this.acceleration.y += getRandomInt(0,100)/100.0 - .5;
    wrapAround();
  }
}
