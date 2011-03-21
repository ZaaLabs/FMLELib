package com.zaalabs.fmle
{
    import flash.desktop.NativeProcess;
    import flash.desktop.NativeProcessStartupInfo;
    import flash.events.EventDispatcher;
    import flash.events.NativeProcessExitEvent;
    import flash.events.ProgressEvent;
    import flash.filesystem.File;
    import flash.filesystem.FileMode;
    import flash.filesystem.FileStream;
    import flash.utils.Dictionary;
    
    public class FMLEManager extends EventDispatcher
    {
        protected var _fmleFile:File;
        protected var _processes:Dictionary = new Dictionary(true);
        
        public function FMLEManager(fmlePath:String)
        {
            if(NativeProcess.isSupported)
            {
                var file:File = new File(fmlePath);
                if(file.exists)
                {
                    trace("FMLEcmd Found");
                    _fmleFile = file;           
                }
                else
                {
                    trace("ERROR :: Could not find FMLECmd at the path provided: "+fmlePath);
                }
            }
            else
            {
				// Make sure you set the following in the application descriptor:
				// <supportedProfiles>extendedDesktop</supportedProfiles>
                trace("ERROR :: Native Process is not supported"); 
            }
        }
        
        public function startEncoding(id:String, config:FMLEConfig):FMLEProcess
        {
            var profile:File = new File(File.userDirectory.nativePath + "/encoding/profiles/"+id+".xml");
            profile.parent.createDirectory();
            var fs:FileStream = new FileStream();
            fs.open(profile, FileMode.WRITE);
            fs.writeUTFBytes(config.toXML());
            fs.close();
            
            // Create the logs directory specified in the config
            var logsDir:File = new File(config.logDirectory);
            logsDir.createDirectory();
            
            var npsi:NativeProcessStartupInfo = new NativeProcessStartupInfo();
            npsi.executable = _fmleFile;
            
            var args:Vector.<String> = new Vector.<String>();
            // Profile Flag
            args.push("/p");
            args.push(profile.nativePath);
            // Use defaults if they are missing (recommended)
            args.push("/d");           
            
            npsi.arguments = args;
            
            var process:FMLEProcess = new FMLEProcess();
            process.id = id;
            process.addEventListener(ProgressEvent.STANDARD_OUTPUT_DATA, onOutputData);
            process.addEventListener(ProgressEvent.STANDARD_ERROR_DATA, onErrorData);
            process.addEventListener(NativeProcessExitEvent.EXIT, onExit);
            process.start(npsi);
            
            _processes[id] = process;
            
            return process;    
        }
        
        public function stopEncoding(id:String):void
        {
            FMLEProcess(_processes[id]).exit(true);
        }
        
        public function stopAllEncoding():void
        {
            for each(var process:FMLEProcess in _processes)
            {
                process.exit(true);
            }
        }
        
        protected function onOutputData(event:ProgressEvent):void
        {
            var process:FMLEProcess = FMLEProcess(event.target);
            trace(process.id + " :: "+ process.standardOutput.readUTFBytes(process.standardOutput.bytesAvailable));
        }
        
        protected function onErrorData(event:ProgressEvent):void
        {
            trace("onError");
        }
        
        protected function onExit(event:NativeProcessExitEvent):void
        {
            trace("onExit");
        }
        
    }
}