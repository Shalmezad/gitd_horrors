package ;

import flixel.FlxSprite;
import flixel.FlxG;

class Player extends WrapSprite 
{
  var MOVE_ACCEL:Float = 6; 
  var TURN_SPEED:Float = 3;
  public function new()
  {
    super();
    loadGraphic("assets/images/earl.png", true, 42, 30);
    this.animation.add("still", [0]);
    this.animation.add("move", [0,1], 5, true);
    this.animation.play("still");

    this.drag.x = 160;
    this.drag.y = 160;
    this.maxVelocity.x = 160;
    this.maxVelocity.y = 160;
  }

  override public function update():Void
  {
    super.update();
    this.acceleration.x = 0;
    this.acceleration.y = 0;
    if(FlxG.keys.pressed.RIGHT || FlxG.keys.pressed.D)
    {
      this.angle += TURN_SPEED;
    }
    else if(FlxG.keys.pressed.LEFT || FlxG.keys.pressed.A)
    {
      this.angle -= TURN_SPEED;
    }
    if(FlxG.keys.pressed.UP || FlxG.keys.pressed.W)
    {
      this.velocity.x += Math.cos((angle)* Math.PI / 180) * MOVE_ACCEL;
      this.velocity.y += Math.sin((angle) * Math.PI / 180) * MOVE_ACCEL;
    }
    if(Math.abs(this.velocity.x) > .2 || Math.abs(this.velocity.y) > .2)
    {
      this.animation.play("move");
    }
    else
    {
      this.animation.play("still");
    }
    wrapAround();
  }


}
