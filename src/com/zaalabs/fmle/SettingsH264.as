package com.zaalabs.fmle
{
    public class SettingsH264 implements IAdvancedSettings
    {
        // Profile Settings
        public static const PROFILE_BASELINE:String = "Baseline";
        public static const PROFILE_MAIN:String = "Main";
        
        // Level Settings
        public static const LEVEL_1_0:String = "1.0"; 
        public static const LEVEL_1_B:String = "1b"; 
        public static const LEVEL_1_1:String = "1.1"; 
        public static const LEVEL_1_2:String = "1.2"; 
        public static const LEVEL_1_3:String = "1.3"; 
        public static const LEVEL_2_0:String = "2.0"; 
        public static const LEVEL_2_1:String = "2.1"; 
        public static const LEVEL_2_2:String = "2.2"; 
        public static const LEVEL_3_0:String = "3.0"; 
        public static const LEVEL_3_1:String = "3.1"; 
        public static const LEVEL_3_2:String = "3.2"; 
        public static const LEVEL_4_0:String = "4.0"; 
        public static const LEVEL_4_1:String = "4.1"; 
        public static const LEVEL_4_2:String = "4.2"; 
        public static const LEVEL_5_0:String = "5.0"; 
        public static const LEVEL_5_1:String = "5.1"; 
        
        // Keyframe Frequency Settings
        public static const KEYFRAME_1S:String = "1 Second"; 
        public static const KEYFRAME_2S:String = "2 Seconds"; 
        public static const KEYFRAME_3S:String = "3 Seconds"; 
        public static const KEYFRAME_4S:String = "4 Seconds"; 
        public static const KEYFRAME_5S:String = "5 Seconds"; 
        public static const KEYFRAME_6S:String = "6 Seconds"; 
        public static const KEYFRAME_7S:String = "7 Seconds"; 
        public static const KEYFRAME_8S:String = "8 Seconds"; 
        public static const KEYFRAME_9S:String = "9 Seconds"; 
        public static const KEYFRAME_10S:String = "10 Seconds"; 
        
        // Now the actual settings
        public var profile:String = PROFILE_MAIN;
        public var level:String = LEVEL_2_1;
        public var keyframeFrequency:String = KEYFRAME_5S;
        
        public function toXML():XML
        {
            return new XML(toString());
        }
        
        public function toString():String
        {
            var settings:String = "<advanced>" +
                "<profile>" + profile + "</profile>" +
                "<level>" + level + "</level>" +
                "<keyframe_frequency>" + keyframeFrequency + "</keyframe_frequency>" +
                "</advanced>";
            
            return settings;
        }
    }
}