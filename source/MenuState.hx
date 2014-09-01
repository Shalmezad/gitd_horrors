package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.ui.FlxButton;
import shalmezad.flxplus.FlxShadowText;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
  var goText:FlxShadowText;
  var tick:Int = 0;
  var FLASH_TICK:Int = 40;
	override public function create():Void
	{
		super.create();
    bgColor = 0x00DDDD;
    add(new Cloud(0,0,1,1));
    add(new Cloud(0,0,2,2, "assets/images/cloud2.png"));
    add(new FlxShadowText(40,40,200, "Earl the horror", 40)); 
    add(new FlxShadowText(240,220, 60, "Shalmezad"));

    goText = new FlxShadowText(80,180, 200, "Press SPACE", 20);
    add(goText);

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
    if(tick > FLASH_TICK)
    {
      goText.visible = false;
    }
    if(tick > FLASH_TICK * 2)
    {
      goText.visible = true;
      tick = 0;
    }
    if(FlxG.keys.pressed.SPACE)
    {
      FlxG.switchState(new PlayState());
    }
	}	
}
