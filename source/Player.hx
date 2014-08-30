package ;

import flixel.FlxSprite;
import flixel.FlxG;

class Player extends FlxSprite
{
  var MOVE_ACCEL:Float = 2; 
  public function new()
  {
    super();
    loadGraphic("assets/images/earl.png", true, 42, 30);
    this.animation.add("still", [0]);
    this.animation.add("move", [0,1], 5, true);
    this.animation.play("still");

    this.drag.x = 80;
    this.drag.y = 80;
  }

  override public function update():Void
  {
    super.update();
    this.acceleration.x = 0;
    this.acceleration.y = 0;
    if(FlxG.keys.pressed.RIGHT || FlxG.keys.pressed.D)
    {
      this.angle += 1;
    }
    else if(FlxG.keys.pressed.LEFT || FlxG.keys.pressed.A)
    {
      this.angle -= 1;
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
