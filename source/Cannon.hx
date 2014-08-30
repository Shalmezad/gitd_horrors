package;

import flixel.FlxSprite;
import flixel.math.FlxRandom;

class Cannon extends WrapSprite 
{

  var _random:FlxRandom = null;
  var rotateDir:Float;
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

  public function new(graphicPath:String = "assets/images/money_cannon.png", rotateDir:Float = 1)
  {
    super(Main.gameWidth/2, Main.gameHeight/2);
    loadGraphic(graphicPath);
    maxVelocity.x = 80;
    maxVelocity.y = 80;
    this.rotateDir = rotateDir;
  }


  override public function update():Void
  {
    super.update();
    this.angle += rotateDir;
    this.acceleration.x += getRandomInt(0,100)/100.0 - .5;
    this.acceleration.y += getRandomInt(0,100)/100.0 - .5;
    wrapAround();
  }
}
