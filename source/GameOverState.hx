package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.ui.FlxButton;
import shalmezad.flxplus.FlxShadowText;

/**
 * A FlxState which can be used for the game's menu.
 */
class GameOverState extends FlxState
{
  var score:Int = 0;
  var tick:Int = 0;
  public function new(score:Int = 0)
  {
    super();
    this.score = score;
  }
	override public function create():Void
	{
		super.create();
    bgColor = 0x00DDDD;
    add(new Cloud(0,0,1,1));
    add(new Cloud(0,0,2,2, "assets/images/cloud2.png"));
    add(new FlxShadowText(40,40,200, "Game Over", 20)); 
    add(new FlxShadowText(80,160, 200, "Final Score: " + score, 20));
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
    tick++;
    if(tick > 300)
    {
      FlxG.switchState(new MenuState());
    }
	}	
}
