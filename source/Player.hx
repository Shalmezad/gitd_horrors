package ;

import flixel.FlxSprite;
import flixel.FlxG;

class Player extends FlxSprite
{
  //Note: size is 42x30 on a 84x30 spritesheet (earl.png)
  public function new()
  {
    super();
    loadGraphic("assets/images/earl.png", true, 42, 30);
    this.animation.add("still", [0]);
    this.animation.add("move", [0,1], 5, true);
    this.animation.play("still");
  }

  override public function update():Void
  {
    super.update();
    if(FlxG.keys.pressed.RIGHT)
    {
      this.angle += 1;
    }
    else if(FlxG.keys.pressed.LEFT)
    {
      this.angle -= 1;
    }
  }
}
