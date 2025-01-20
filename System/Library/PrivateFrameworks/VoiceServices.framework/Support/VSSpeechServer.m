@interface VSSpeechServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)listener;
- (VSSpeechServer)init;
- (__CFRunLoopSource)runloopSourceRef;
- (unint64_t)connectionCount;
- (void)dealloc;
- (void)resume;
- (void)scheduleBackgroundTasks;
- (void)setConnectionCount:(unint64_t)a3;
- (void)setListener:(id)a3;
- (void)setRunloopSourceRef:(__CFRunLoopSource *)a3;
@end

@implementation VSSpeechServer

- (VSSpeechServer)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___VSSpeechServer;
  v2 = -[VSSpeechServer init](&v7, "init");
  if (v2)
  {
    v3 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    v4 = -[NSXPCListener initWithMachServiceName:](v3, "initWithMachServiceName:", VSTTSMachServiceName);
    listener = v2->_listener;
    v2->_listener = v4;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[VSSpeechServer scheduleBackgroundTasks](v2, "scheduleBackgroundTasks");
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VSSpeechServer;
  -[VSSpeechServer dealloc](&v3, "dealloc");
}

- (void)resume
{
}

- (void)scheduleBackgroundTasks
{
  if ((+[VSFeatureFlags useSiriTTSServiceV2](&OBJC_CLASS___VSFeatureFlags, "useSiriTTSServiceV2") & 1) == 0)
  {
    xpc_activity_register("com.apple.voiced", XPC_ACTIVITY_CHECK_IN, &stru_1000FAAD8);
    xpc_activity_register("com.apple.voiced.weekly", XPC_ACTIVITY_CHECK_IN, &stru_1000FAB38);
    if (+[VSNeuralTTSUtils isANECompilationPlatform]( &OBJC_CLASS___VSNeuralTTSUtils,  "isANECompilationPlatform"))
    {
    }
  }

- (void)setConnectionCount:(unint64_t)a3
{
  self->_connectionCount = a3;
  runloopSourceRef = self->_runloopSourceRef;
  if (a3)
  {
    if (!runloopSourceRef)
    {
      runloopSourceRef = sub_1000E2268(0LL, 0LL);
      self->_runloopSourceRef = runloopSourceRef;
      if (runloopSourceRef)
      {
        Current = CFRunLoopGetCurrent();
        CFRunLoopAddSource(Current, self->_runloopSourceRef, kCFRunLoopDefaultMode);
        runloopSourceRef = self->_runloopSourceRef;
      }
    }

    sub_1000E234C(runloopSourceRef, 1);
  }

  else
  {
    sub_1000E234C(runloopSourceRef, 0);
    sub_1000E2408(self->_runloopSourceRef);
    CFRunLoopSourceInvalidate(self->_runloopSourceRef);
    CFRelease(self->_runloopSourceRef);
    self->_runloopSourceRef = 0LL;
  }

  pthread_mutex_unlock(&stru_1000FDB00);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___VSSpeechServiceDelegate));
  [v5 setRemoteObjectInterface:v6];

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___VSSpeechXPCServiceProtocol));
  v22[0] = objc_opt_class(&OBJC_CLASS___NSArray);
  v22[1] = objc_opt_class(&OBJC_CLASS___VSVoiceAsset);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));

  [v7 setClasses:v9 forSelector:"setSubscribedVoiceAssets:withClientID:forAccessoryID:" argumentIndex:0 ofReply:0];
  [v7 setClasses:v9 forSelector:"triggerCellularDownloadedVoiceAssets:withClientID:" argumentIndex:0 ofReply:0];
  v21[0] = objc_opt_class(&OBJC_CLASS___VSSpeechRequest);
  v21[1] = objc_opt_class(&OBJC_CLASS___VSPresynthesizedAudioRequest);
  v21[2] = objc_opt_class(&OBJC_CLASS___NSData);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 3LL));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v10));

  [v7 setClasses:v11 forSelector:"startPresynthesizedAudioRequest:" argumentIndex:0 ofReply:0];
  [v5 setExportedInterface:v7];
  id v12 = [[VSSpeechXPCHandler alloc] initWithConnection:v5];
  [v5 setExportedObject:v12];
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_1000EC988;
  v18 = &unk_1000FAB80;
  id v19 = v12;
  v20 = self;
  id v13 = v12;
  [v5 setInvalidationHandler:&v15];
  objc_msgSend(v5, "resume", v15, v16, v17, v18);

  -[VSSpeechServer setConnectionCount:]( self,  "setConnectionCount:",  (char *)-[VSSpeechServer connectionCount](self, "connectionCount") + 1);
  return 1;
}

- (unint64_t)connectionCount
{
  return self->_connectionCount;
}

- (__CFRunLoopSource)runloopSourceRef
{
  return self->_runloopSourceRef;
}

- (void)setRunloopSourceRef:(__CFRunLoopSource *)a3
{
  self->_runloopSourceRef = a3;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (void).cxx_destruct
{
}

@end