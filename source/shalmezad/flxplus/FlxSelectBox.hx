package shalmezad.flxplus;

import flixel.FlxSprite;
import flixel.util.FlxPoint;
import flixel.util.FlxSpriteUtil;

class FlxSelectBox extends FlxSprite
{
    public var startPoint:FlxPoint = new FlxPoint(0, 0);
    public var currentPoint:FlxPoint = new FlxPoint(0, 0);

    public var lineStyle:LineStyle;
    public var drawStyle:DrawStyle;
    public var fillStyle:FillStyle;

    public var left(get, never):Float;
    public var right(get, never):Float;
    public var top(get, never):Float;
    public var bottom(get, never):Float;

    public function new( ):Void
    {
        super( );
        lineStyle = { color: 0xFFFFFFFF, thickness:2}
        drawStyle = {};
        fillStyle = {};
        //makeGraphic(Main.gameWidth,Main.gameHeight,0x00000000);
    }

    override public function update( ):Void
    {
        super.update( );
        if ( visible )
        {
            redraw( );
        }
    }

    public function start( x:Int, y:Int )
    {
        currentPoint.x = x;
        startPoint.x = x;
        currentPoint.y = y;
        startPoint.y = y;
        visible = true;
        redraw( );
    }

    private function redraw( ):Void
    {
        x = left;
        y = top;
        width = right - left;
        height = bottom - top;
        makeGraphic( Std.int( width ), Std.int( height ), 0x00000000 );

        //top line
        //FlxSpriteUtil.drawLine(this, left, top, right, top, lineStyle, drawStyle);
        //this is the bottom line
        //FlxSpriteUtil.drawLine(this, left, bottom-1, right, bottom-1, lineStyle, drawStyle);
        //left line
        //FlxSpriteUtil.drawLine(this, left, top, left, bottom, lineStyle, drawStyle);
        //This is the right line
        //FlxSpriteUtil.drawLine(this, right-1, top, right-1, bottom, lineStyle, drawStyle);
        FlxSpriteUtil.drawRect( this, left, top, width, height, 0xFFFFFFFF, lineStyle, fillStyle, drawStyle );
    }

    private function get_left( ):Float
    {
        return Math.min( startPoint.x, currentPoint.x );
    }

    private function get_right( ):Float
    {
        return Math.max( startPoint.x, currentPoint.x );
    }

    private function get_top( ):Float
    {
        return Math.min( startPoint.y, currentPoint.y );
    }

    private function get_bottom( ):Float
    {
        return Math.max( startPoint.y, currentPoint.y );
    }

}
