package shalmezad.debug;

class Logger
{
    public static var INFO:Int = 0;
    public static var DEBUG:Int = 1;
    public static var WARNING:Int = 2;
    public static var ERROR:Int = 3;

    public static var allowLog:Bool = false;
    public static var debugLevel:Int = 2;


    public static function log( level:Int, s:String )
    {
        if ( allowLog && level >= debugLevel )
        {
            trace( "SHALMEZAD " + s );
        }
    }
}
