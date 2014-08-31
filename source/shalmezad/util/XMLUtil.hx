package shalmezad.util;

class XMLUtil
{
    public static function buildXml( nodeType:String ):Xml
    {
        var xmlString:String = "<?xml version=\"1.0\" encoding=\"utf-8\" ?>";
        xmlString += "<" + nodeType + ">";
        xmlString += "</" + nodeType + ">";
        return Xml.parse( xmlString ).firstElement( );
    }
}
