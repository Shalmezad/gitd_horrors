package shalmezad.flxplus;

import shalmezad.flxplus.FlxShadowText;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.group.FlxGroup;

/**
    Acts just like Android's toast.
    Nothing more than a temporary popup that disappears after a short time
 */
class FlxToast extends FlxGroup
{
    private var PADDING:Int = 2;
    var fText:FlxShadowText;
    var bg:FlxSprite;

    public function new(x:Int=0, y:Int=0, width:Int=0, text:String="")
    {
       super();
       fText = new FlxShadowText(x,y,width,text);
       //fText.autoSize = true;
       //fText.resetSize();
        trace(fText.width);
       bg = new FlxSprite(x - PADDING, y-PADDING);
       bg.makeGraphic(Std.int(fText.width + PADDING*2), Std.int(fText.height + PADDING * 2), 0xFF666666);
       add(bg);
       add(fText);
    }



}
