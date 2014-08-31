package shalmezad.debug;

import flixel.FlxSprite;
import flixel.util.FlxSpriteUtil;
import flixel.util.FlxPoint;

class LineOverlay extends FlxSprite
{

    public var startPoint:FlxPoint = new FlxPoint(0, 0);
    public var endPoint:FlxPoint = new FlxPoint(0, 0);
    public var lineStyle:LineStyle = {color: 0xFF00FFFF, thickness: 2};
    public var drawStyle:DrawStyle = {};

    public function new( )
    {
        super( 0, 0 );
        makeGraphic( Main.gameWidth, Main.gameHeight, 0x00000000 );
        scrollFactor.x = 0;
        scrollFactor.y = 0;
    }

    override public function update( ):Void
    {
        super.update( );
        FlxSpriteUtil.fill( this, 0x00000000 );
        FlxSpriteUtil.drawLine( this, startPoint.x, startPoint.y, endPoint.x, endPoint.y, lineStyle, drawStyle );
    }
}
