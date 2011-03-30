package com.zaalabs.fmle
{
    import flash.filesystem.File;
    import flash.filesystem.FileStream;
    import flash.media.Camera;
    import flash.utils.describeType;
    
    public class FMLEConfig
    {
        [Embed(source="assets/FMLE_3_2_ProfileTemplate.xml", mimeType="application/octet-stream")]
        protected const EmbeddedTemplate:Class;
        
        //////////////////////////////////////////////////////////////////////////////
        // 
        //  Public Properties
        //
        //////////////////////////////////////////////////////////////////////////////
        
        // capture
        public var captureInputName:String = Camera.getCamera().name;
        public var captureFramerate:String = "20.00";
        public var captureWidth:int = 320;
        public var captureHeight:int = 240;
        
        // encode
        public var encodeFormat:String = "H.264";
        public var encodeDataRate:String = "200;";
        public var encodeOutputSize:String = "320x240;";
        
        // publish
        public var outputURL:String = "rtmp:/live";
        public var outputURLBackup:String = "";
        public var outputStreamName:String = "test_stream";
        
        // metadata
        public var metaAuthor:String = "";
        public var metaCopyright:String = "";
        public var metaDescription:String = "";
        public var metaKeywords:String = "";
        public var metaRating:String = "";
        public var metaTitle:String = "";
        
        // logging
        public var logLevel:int = 100;
        public var logDirectory:String = File.userDirectory.nativePath + File.separator + "encoding" + File.separator + "logs";
        
        //////////////////////////////////////////////////////////////////////////////
        // 
        //  Public Methods
        //
        //////////////////////////////////////////////////////////////////////////////
        
        public function toXML():XML
        {
            var fields:Array = getFields();
            var template:String = new EmbeddedTemplate();
            
            for each(var field:String in fields)
            {
                template = replace(template, "#{"+field+"}", this[field]);
            }
            
            var profileXML:XML = new XML(template);
            
            return profileXML;
        }
        
        //////////////////////////////////////////////////////////////////////////////
        // 
        //  Protected Methods
        //
        //////////////////////////////////////////////////////////////////////////////
        
        protected function replace(source:String, token:String, value:String):String 
        {
            return source.split(token).join(value);
        }
        
        protected function getFields():Array
        {
            var varList:XMLList = describeType(FMLEConfig)..variable;
            var fields:Array = []
            
            for(var i:int; i < varList.length(); i++)
            {
                fields.push(varList[i].@name);
            }
            
            return fields;
        }
    }
}