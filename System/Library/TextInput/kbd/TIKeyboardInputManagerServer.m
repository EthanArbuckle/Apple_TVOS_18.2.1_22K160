@interface TIKeyboardInputManagerServer
+ (id)sharedKeyboardInputManagerServer;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (TIKeyboardInputManagerServer)init;
- (id)reduceCacheToSize:(int)a3;
- (void)appleKeyboardsSettingsChanged:(id)a3;
- (void)checkAndFlushDynamicCaches;
- (void)dealloc;
- (void)handleMemoryPressureLevel:(unint64_t)a3 excessMemoryInBytes:(unint64_t)a4;
- (void)keyboardActivityDidTransition:(id)a3;
- (void)prepareForActivity;
- (void)prepareForInactivity;
@end

@implementation TIKeyboardInputManagerServer

+ (id)sharedKeyboardInputManagerServer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004F60;
  block[3] = &unk_100014728;
  block[4] = a1;
  if (qword_10001E230 != -1) {
    dispatch_once(&qword_10001E230, block);
  }
  return (id)qword_10001E228;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardActivityController sharedController]( &OBJC_CLASS___TIKeyboardActivityController,  "sharedController"));
  [v3 removeActivityObserver:self];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self];

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0LL);
  -[NSXPCListener invalidate](self->_listener, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TIKeyboardInputManagerServer;
  -[TIKeyboardInputManagerServer dealloc](&v5, "dealloc");
}

- (TIKeyboardInputManagerServer)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TIKeyboardInputManagerServer;
  v2 = -[TIKeyboardInputManagerServer init](&v12, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    lastFlush = v2->_lastFlush;
    v2->_lastFlush = (NSDate *)v3;

    objc_super v5 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.TextInput");
    listener = v2->_listener;
    v2->_listener = v5;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener _setQueue:](v2->_listener, "_setQueue:", &_dispatch_main_q);
    -[NSXPCListener resume](v2->_listener, "resume");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v7 addObserver:v2 selector:"appleKeyboardsSettingsChanged:" name:@"AppleKeyboardsContinuousPathSettingsChangedNotification" object:0];

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v8 addObserver:v2 selector:"appleKeyboardsSettingsChanged:" name:TIAppleKeyboardsPreferencesChangedNotification_Private object:0];

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v9 addObserver:v2 selector:"appleKeyboardsSettingsChanged:" name:@"AppleKeyboardsInternalSettingsChangedNotification" object:0];

    v10 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardActivityController sharedController]( &OBJC_CLASS___TIKeyboardActivityController,  "sharedController"));
    [v10 addActivityObserver:v2];
  }

  return v2;
}

- (void)appleKeyboardsSettingsChanged:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    objc_super v5 = "-[TIKeyboardInputManagerServer appleKeyboardsSettingsChanged:]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s  Keyboard settings changed. Releasing input managers.",  (uint8_t *)&v4,  0xCu);
  }

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardInputManagerLoader sharedLoader]( &OBJC_CLASS___TIKeyboardInputManagerLoader,  "sharedLoader"));
  [v3 releaseAllInputManagers];
}

- (id)reduceCacheToSize:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    v8 = "-[TIKeyboardInputManagerServer reduceCacheToSize:]";
    __int16 v9 = 2048;
    uint64_t v10 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s  Reduce cache to size=%lu",  (uint8_t *)&v7,  0x16u);
  }

  int v4 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardInputManagerLoader sharedLoader]( &OBJC_CLASS___TIKeyboardInputManagerLoader,  "sharedLoader"));
  [v4 reduceInputManagerCacheToSize:v3 switchingToInputMode:0];
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentLoadedInputModes]);
  +[TILanguageModelLoaderManager dropResourcesExcludingInputModes:]( &OBJC_CLASS___TILanguageModelLoaderManager,  "dropResourcesExcludingInputModes:",  v5);

  return v5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[TIKeyboardInputManagerServer listener:shouldAcceptNewConnection:]";
    __int16 v17 = 1024;
    unsigned int v18 = [v4 processIdentifier];
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s  Establishing connection with PID %d",  buf,  0x12u);
  }

  objc_super v5 = (void *)objc_opt_new(&OBJC_CLASS___TIKeyboardInputManagerPolymorph);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[TIKBDClientProxy KBDClientProxyWithConnection:]( &OBJC_CLASS___TIKBDClientProxy,  "KBDClientProxyWithConnection:",  v4));
  [v5 setClientProxy:v6];

  [v4 setExportedObject:v5];
  int v7 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardInputManagerStub serverInterface]( &OBJC_CLASS___TIKeyboardInputManagerStub,  "serverInterface"));
  [v4 setExportedInterface:v7];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100005534;
  v13[3] = &unk_1000148D0;
  id v14 = v4;
  id v8 = v4;
  [v8 setInvalidationHandler:v13];
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___TIKeyboardInputManagerToImplProtocol));
  [v8 setRemoteObjectInterface:v9];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardInputManagerLoader sharedLoader]( &OBJC_CLASS___TIKeyboardInputManagerLoader,  "sharedLoader"));
  [v10 startSyncHelper];

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardInputManagerLoader sharedLoader]( &OBJC_CLASS___TIKeyboardInputManagerLoader,  "sharedLoader"));
  [v11 setInteractingConnection:v8];

  [v8 _setQueue:&_dispatch_main_q];
  [v8 resume];

  return 1;
}

- (void)keyboardActivityDidTransition:(id)a3
{
  id v4 = a3;
  if ([v4 toState] == (id)3)
  {
    -[TIKeyboardInputManagerServer prepareForInactivity](self, "prepareForInactivity");
  }

  else if ([v4 fromState] == (id)3)
  {
    -[TIKeyboardInputManagerServer prepareForActivity](self, "prepareForActivity");
  }
}

- (void)handleMemoryPressureLevel:(unint64_t)a3 excessMemoryInBytes:(unint64_t)a4
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[TIKeyboardInputManagerServer handleMemoryPressureLevel:excessMemoryInBytes:]";
    __int16 v9 = 2048;
    unint64_t v10 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s  Received memory pressure level %ld",  (uint8_t *)&v7,  0x16u);
  }

  if (a3 - 1 > 2) {
    v6 = 0LL;
  }
  else {
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[TIKeyboardInputManagerServer reduceCacheToSize:]( self,  "reduceCacheToSize:",  dword_10000EEB8[a3 - 1]));
  }
  +[TILanguageModelLoaderManager flushDynamicResourcesForInputModes:]( &OBJC_CLASS___TILanguageModelLoaderManager,  "flushDynamicResourcesForInputModes:",  v6);
}

- (void)prepareForInactivity
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = "-[TIKeyboardInputManagerServer prepareForInactivity]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s  Preparing keyboard for inactivity",  (uint8_t *)&v5,  0xCu);
  }

  id v3 = -[TIKeyboardInputManagerServer reduceCacheToSize:](self, "reduceCacheToSize:", 2LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardInputManagerLoader sharedLoader]( &OBJC_CLASS___TIKeyboardInputManagerLoader,  "sharedLoader"));
  [v4 prepareForKeyboardInactivity];
  -[TIKeyboardInputManagerServer checkAndFlushDynamicCaches](self, "checkAndFlushDynamicCaches");
}

- (void)checkAndFlushDynamicCaches
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v3 timeIntervalSinceDate:self->_lastFlush];
  double v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[TIPreferencesController sharedPreferencesController]( &OBJC_CLASS___TIPreferencesController,  "sharedPreferencesController"));
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForPreferenceKey:TIKeyboardFlushDynamicCachePeriodPreference]);

  double v8 = 10800.0;
  if (v7)
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
    {
      [v7 floatValue];
      double v8 = v10;
    }
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315650;
    id v14 = "-[TIKeyboardInputManagerServer checkAndFlushDynamicCaches]";
    __int16 v15 = 2048;
    double v16 = v5;
    __int16 v17 = 2048;
    double v18 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s  Preparing keyboard for inactivity, last flush at %lf, flush period: %lf",  (uint8_t *)&v13,  0x20u);
  }

  if (v5 > v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      id v14 = "-[TIKeyboardInputManagerServer checkAndFlushDynamicCaches]";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s  Flushing the dynamic resources on inactivity",  (uint8_t *)&v13,  0xCu);
    }

    +[TILanguageModelLoaderManager flushDynamicLearningCaches]( &OBJC_CLASS___TILanguageModelLoaderManager,  "flushDynamicLearningCaches");
    v11 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    lastFlush = self->_lastFlush;
    self->_lastFlush = v11;
  }
}

- (void)prepareForActivity
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    double v4 = "-[TIKeyboardInputManagerServer prepareForActivity]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s  Preparing keyboard for activity",  (uint8_t *)&v3,  0xCu);
  }

  +[TILanguageModelLoaderManager wireAllLanguageModelMemory]( &OBJC_CLASS___TILanguageModelLoaderManager,  "wireAllLanguageModelMemory");
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardInputManagerLoader sharedLoader]( &OBJC_CLASS___TIKeyboardInputManagerLoader,  "sharedLoader"));
  [v2 prepareForKeyboardActivity];
}

- (void).cxx_destruct
{
}

@end