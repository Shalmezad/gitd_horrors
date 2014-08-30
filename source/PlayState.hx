package;

import flixel.FlxState;
import flixel.FlxG;

class PlayState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up. 
	 */

  private var player:Player;
  private var moneyCannon:Cannon;
  private var painCannon:Cannon;

	override public function create():Void
	{
		super.create();
    bgColor= 0x00DDDD;
    moneyCannon = new Cannon();
    painCannon = new Cannon("assets/images/pain_cannon.png", -1.1);
    player = new Player();

    add(moneyCannon);
    add(painCannon);

    add(player);
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
	}	
}
