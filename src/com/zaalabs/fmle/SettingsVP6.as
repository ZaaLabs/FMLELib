package com.zaalabs.fmle
{
    public class SettingsVP6  implements IAdvancedSettings
    {
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
        
        // Quality Settings
        public static const QUALITY_BEST:String = "Best Quality - Lower Framerate"; 
        public static const QUALITY_GREAT:String = "Great Quality - Avg Framerate"; 
        public static const QUALITY_GOOD:String = "Good Quality - Good Framerate"; 
        public static const QUALITY_AVG:String = "Avg Quality - Great Framerate"; 
        public static const QUALITY_LOWER:String = "Lower Quality - Best Framerate"; 
        
        // Noise Reduction Settings
        public static const NOISE_REDUCTION_NONE:String = "None";
        public static const NOISE_REDUCTION_SLIGHT:String = "Slight";
        public static const NOISE_REDUCTION_LOW:String = "Low";
        public static const NOISE_REDUCTION_AVERAGE:String = "Average";
        public static const NOISE_REDUCTION_EXTREME:String = "Extreme";
        
        // Datarate Window Settings
        public static const DATARATE_TINY:String = "Tiny";
        public static const DATARATE_SMALL:String = "Small";
        public static const DATARATE_MEDIUM:String = "Medium";
        public static const DATARATE_LARGE:String = "Large";
        public static const DATARATE_HUGE:String = "Huge";
        
        // CPU Usage Settings
        public static const CPU_USAGE_VERY_LOW:String = "Very Low";
        public static const CPU_USAGE_LOW:String = "Low";
        public static const CPU_USAGE_AVERAGE:String = "Average";
        public static const CPU_USAGE_DEDICATED:String = "Dedicated";
        
        // Now the actual settings
        public var keyframeFrequency:String = KEYFRAME_5S;
        public var quality:String = QUALITY_GOOD;
        public var noiseReduction:String = NOISE_REDUCTION_NONE;
        public var datarateWindow:String = DATARATE_MEDIUM;
        public var cpuUsage:String = CPU_USAGE_DEDICATED;
        
        public function toXML():XML
        {
            return new XML(toString());
        }
        
        public function toString():String
        {
            var output:String = "<advanced>" +
                "<keyframe_frequency>" + keyframeFrequency + "</keyframe_frequency>" +
                "<quality>" + quality + "</quality>" +
                "<noise_reduction>" + noiseReduction + "</noise_reduction>" +
                "<datarate_window>" + datarateWindow + "</datarate_window>" +
                "<cpu_usage>" + cpuUsage + "</cpu_usage>" +
                "</advanced>"
            
            return output;
        }
    }
}