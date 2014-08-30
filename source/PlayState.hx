package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
  private var FIRE_RATE:Int = 30;

  private var player:Player;
  private var moneyCannon:Cannon;
  private var painCannon:Cannon;

  private var fireCooldown:Int = 30;

  private var coins:FlxTypedGroup<Coin>;

  private var coinText:FlxText;

  private var coinCount:Int = 0;

	override public function create():Void
	{
		super.create();
    bgColor= 0x00DDDD;
    moneyCannon = new Cannon();
    painCannon = new Cannon("assets/images/pain_cannon.png", -1.1);
    player = new Player();
    coins = new FlxTypedGroup<Coin>();
    coinText = new FlxText(20,20, 200, "Coins: 0");

    add(coins);
    add(moneyCannon);
    add(painCannon);
    add(player);
    add(coinText);
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
    moneyCannon = null;
    painCannon = null;
    player = null;
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
    FlxG.overlap(coins, player, coinPlayerOverlap);
    coinText.text = "Coins: " + coinCount;
    fireCooldown --;
    if(fireCooldown <= 0)
    {
      fire();
    }
	}	


  private function fire():Void
  {
    var coin:Coin = coins.recycle(Coin);
    coin.resetCoin(moneyCannon.x, moneyCannon.y, moneyCannon.angle);
    fireCooldown = FIRE_RATE;
  }

  private function coinPlayerOverlap(coin:Dynamic, player:Dynamic):Void
  {
    if(coin.alive)
    {
      coin.kill();
      coinCount++;
    }
  }

}
