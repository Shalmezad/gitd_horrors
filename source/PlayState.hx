package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.util.FlxSpriteUtil;

class PlayState extends FlxState
{
  private var COIN_FIRE_RATE:Int = 30;
  private var SPIKE_FIRE_RATE:Int = 45;

  private var player:Player;
  private var moneyCannon:Cannon;
  private var painCannon:Cannon;

  private var coinFireCooldown:Int = 30;
  private var spikeFireCooldown:Int = 30;

  private var coins:FlxTypedGroup<Coin>;
  private var spikes:FlxTypedGroup<Spike>;

  private var coinText:FlxText;
  private var healthText:FlxText;

  private var coinCount:Int = 0;

  private var healthCount:Int = 3;

	override public function create():Void
	{
		super.create();
    bgColor= 0x00DDDD;
    moneyCannon = new Cannon();
    painCannon = new Cannon("assets/images/pain_cannon.png", -1.1);
    player = new Player();
    coins = new FlxTypedGroup<Coin>();
    spikes = new FlxTypedGroup<Spike>();

    healthText = new FlxText(20,10, 200, "Health: 0");
    coinText = new FlxText(20,20, 200, "Coins: 0");

    add(new Cloud(0,0,1,1));
    add(new Cloud(0,0,2,2, "assets/images/cloud2.png"));
    add(coins);
    add(spikes);
    add(moneyCannon);
    add(painCannon);
    add(player);
    add(healthText);
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
    FlxG.overlap(spikes, player, spikePlayerOverlap);
    coinText.text = "Coins: " + coinCount;
    healthText.text = "Health: " + healthCount;
    //coin firing
    coinFireCooldown --;
    if(coinFireCooldown <= 0)
    {
      fireCoin();
    }
    //spike firing
    spikeFireCooldown--;
    if(spikeFireCooldown <= 0)
    {
      fireSpike();
    }
	}	


  private function fireCoin():Void
  {
    var coin:Coin = coins.recycle(Coin);
    coin.resetCoin(moneyCannon.x, moneyCannon.y, moneyCannon.angle);
    coinFireCooldown = COIN_FIRE_RATE;
  }


  private function fireSpike():Void
  {
    var spike:Spike= spikes.recycle(Spike);
    spike.resetCoin(painCannon.x, painCannon.y, painCannon.angle);
    spikeFireCooldown = SPIKE_FIRE_RATE;
  }

  private function coinPlayerOverlap(coin:Dynamic, player:Dynamic):Void
  {
    if(coin.alive)
    {
      coin.kill();
      coinCount++;
    }
  }

  private function spikePlayerOverlap(spike:Dynamic, player:Dynamic):Void
  {
    if(spike.alive && !FlxSpriteUtil.isFlickering(player))
    {
      FlxSpriteUtil.flicker(player, 1);
      healthCount--;
      spike.kill();
      coinCount= Std.int(coinCount/2);
    }
  }

}
