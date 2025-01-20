@interface VOTMain
+ (id)commandPath;
+ (id)processIdentifier;
+ (id)versionString;
- (BOOL)keepAlive;
- (VOTMain)initWithArgc:(int)a3 argv:(const char *)a4;
- (id)_setCommandHelpEnabled:(id)a3;
- (id)_setHintsEnabled:(id)a3;
- (id)_setLogMask:(id)a3;
- (id)_setMuteSound:(id)a3;
- (id)_setMuteSpeech:(id)a3;
- (id)_setSpeechLogging:(id)a3;
- (int)run;
- (void)_registerMachServer;
- (void)dealloc;
- (void)setKeepAlive:(BOOL)a3;
- (void)stop;
@end

@implementation VOTMain

- (VOTMain)initWithArgc:(int)a3 argv:(const char *)a4
{
  uint64_t v5 = *(void *)&a3;
  NSSetUncaughtExceptionHandler((NSUncaughtExceptionHandler *)sub_100049DEC);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___VOTMain;
  v7 = -[VOTMain initWithArgc:argv:](&v9, "initWithArgc:argv:", v5, a4);
  signal(15, (void (__cdecl *)(int))sub_100006644);
  if (v7)
  {
    objc_storeStrong((id *)&qword_1001ACBA0, v7);
    -[VOTMain addOption:argument:target:action:argumentDescription:required:]( v7,  "addOption:argument:target:action:argumentDescription:required:",  108LL,  @"logmask",  v7,  "_setLogMask:",  @"comma separated list of log masks (mask1,mask2,...).",  0LL);
    -[VOTMain addOption:argument:target:action:argumentDescription:required:]( v7,  "addOption:argument:target:action:argumentDescription:required:",  113LL,  0LL,  v7,  "_setMuteSpeech:",  0LL,  0LL);
    -[VOTMain addOption:argument:target:action:argumentDescription:required:]( v7,  "addOption:argument:target:action:argumentDescription:required:",  110LL,  0LL,  v7,  "_setMuteSound:",  0LL,  0LL);
    -[VOTMain addOption:argument:target:action:argumentDescription:required:]( v7,  "addOption:argument:target:action:argumentDescription:required:",  104LL,  0LL,  v7,  "_setHintsEnabled:",  0LL,  0LL);
    -[VOTMain addOption:argument:target:action:argumentDescription:required:]( v7,  "addOption:argument:target:action:argumentDescription:required:",  99LL,  0LL,  v7,  "_setCommandHelpEnabled:",  0LL,  0LL);
    +[SCRCThread setDefaultThreadPriority:](&OBJC_CLASS___SCRCThread, "setDefaultThreadPriority:", 47LL);
  }

  return v7;
}

- (void)dealloc
{
  v3 = (void *)qword_1001ACBA0;
  qword_1001ACBA0 = 0LL;

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VOTMain;
  -[VOTMain dealloc](&v4, "dealloc");
}

+ (id)processIdentifier
{
  return @"com.apple.VoiceOverTouch";
}

+ (id)versionString
{
  return @"VoiceOverTouch.  Version 1.0.";
}

+ (id)commandPath
{
  return @"/System/Library/CoreServices/VoiceOverTouch.bundle/vot";
}

- (void)_registerMachServer
{
  id v2 = objc_claimAutoreleasedReturnValue(+[VOTMain processIdentifier](&OBJC_CLASS___VOTMain, "processIdentifier"));
  v3 = (const char *)[v2 UTF8String];

  mach_port_t sp = 0;
  bootstrap_look_up(bootstrap_port, v3, &sp);
  if (bootstrap_check_in(bootstrap_port, v3, &sp))
  {
    char v6 = 1;
    _AXLogWithFacility(1LL, 0LL, 1LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0.0, v6, @"Could not check in as: %s", v3);
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006008;
  block[3] = &unk_100176B60;
  mach_port_t v8 = sp;
  dispatch_async(v5, block);
}

- (void)setKeepAlive:(BOOL)a3
{
  BOOL v7 = a3;
  if (vproc_swap_integer(0LL, 7LL, &v7, 0LL))
  {
    uint64_t v5 = VOTLogLifeCycle();
    char v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000EED4C(v6);
    }
  }

  self->_keepAlive = a3;
}

- (int)run
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___VOTMain;
  int v3 = -[VOTMain run](&v21, "run");
  if (!v3)
  {
    uint64_t v4 = ((uint64_t (*)(void))VOTLogLifeCycle)();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      char v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTMain appName](self, "appName"));
      *(_DWORD *)buf = 138543362;
      v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "=== Starting %{public}@ ===", buf, 0xCu);
    }

    uint64_t v7 = VOTLogElement();
    mach_port_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "VOT-Startup",  "",  buf,  2u);
    }

    objc_super v9 = objc_autoreleasePoolPush();
    id v10 = [objc_allocWithZone((Class)VOTWorkspace) init];
    if (v10)
    {
      -[VOTMain setKeepAlive:](self, "setKeepAlive:", 1LL);
      if (self->_speechLogging) {
        [v10 setSpeechLogging:1];
      }
      [v10 setSpeechMuted:self->_muteSpeech];
      [v10 setSoundMuted:self->_muteSound];
      if (self->_commandHelpEnabled)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[VOTCommandHelper commandHelper](&OBJC_CLASS___VOTCommandHelper, "commandHelper"));
        [v11 setHelpEnabled:1];
      }

      if (self->_hintsEnabled
        || (v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance")),
            unsigned int v13 = [v12 voiceOverHintsEnabled],
            v12,
            v13))
      {
        [v10 setHintsEnabled:1];
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      objc_msgSend(v10, "setNavigateImagesOption:", objc_msgSend(v14, "voiceOverNavigateImagesOption"));

      -[VOTMain _registerMachServer](self, "_registerMachServer");
      objc_autoreleasePoolPop(v9);
      [v10 run];
      uint64_t v15 = VOTLogLifeCycle(-[VOTMain setKeepAlive:](self, "setKeepAlive:", 0LL));
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[VOTMain appName](self, "appName"));
        *(_DWORD *)buf = 138543362;
        v23 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "=== Stopping %{public}@ ===", buf, 0xCu);
      }
    }

    else
    {
      uint64_t v18 = ((uint64_t (*)(void))VOTLogLifeCycle)();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Workspace refused to start - AX not enabled ===",  buf,  2u);
      }

      objc_autoreleasePoolPop(v9);
    }
  }

  return v3;
}

- (void)stop
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___VOTMain;
  -[VOTMain stop](&v2, "stop");
  [(id)VOTSharedWorkspace stop:0];
}

- (id)_setSpeechLogging:(id)a3
{
  return +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
}

- (id)_setHintsEnabled:(id)a3
{
  self->_hintsEnabled = 1;
  return +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
}

- (id)_setMuteSound:(id)a3
{
  self->_muteSound = 1;
  return +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
}

- (id)_setMuteSpeech:(id)a3
{
  self->_muteSpeech = 1;
  return +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
}

- (id)_setLogMask:(id)a3
{
  self->_logMaskSet = 1;
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a3 componentsSeparatedByString:@","]);
  SCRCLogInitializeWithKeys();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));

  return v4;
}

- (id)_setCommandHelpEnabled:(id)a3
{
  self->_commandHelpEnabled = 1;
  return +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
}

- (BOOL)keepAlive
{
  return self->_keepAlive;
}

@end