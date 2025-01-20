@interface NSPUserEventAgentFileHandleMaintainer
+ (id)sharedEventAgentMaintainer;
- (BOOL)didInitialLaunch;
- (BOOL)receivedEventToken;
- (NSMutableArray)fileHandleReaderSources;
- (OS_dispatch_source)fileHandleReaderSettingTimer;
- (unint64_t)eventToken;
- (void)cancelFileHandleReaderSources;
- (void)checkDeviceFirstUnlock;
- (void)handleProviderAction:(int64_t)a3 token:(unint64_t)a4 event:(id)a5;
- (void)launchOwner;
- (void)provider;
- (void)setDidInitialLaunch:(BOOL)a3;
- (void)setEventToken:(unint64_t)a3;
- (void)setFileHandleReaderSettingTimer:(id)a3;
- (void)setFileHandleReaderSources:(id)a3;
- (void)setProvider:(void *)a3;
- (void)setReceivedEventToken:(BOOL)a3;
- (void)setupReadabilityHandlers;
- (void)startEventAgentModeWithEventName:(id)a3;
- (void)startFileHandleReader:(id)a3;
- (void)startFileHandleReaderSettingTimer;
- (void)stopFileHandleReaderSettingTimer;
@end

@implementation NSPUserEventAgentFileHandleMaintainer

- (void)checkDeviceFirstUnlock
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_77D8;
  block[3] = &unk_14930;
  block[4] = self;
  if (qword_17E20 != -1) {
    dispatch_once(&qword_17E20, block);
  }
}

+ (id)sharedEventAgentMaintainer
{
  if (qword_17E30 != -1) {
    dispatch_once(&qword_17E30, &stru_14950);
  }
  return (id)qword_17E28;
}

- (void)startEventAgentModeWithEventName:(id)a3
{
}

- (void)handleProviderAction:(int64_t)a3 token:(unint64_t)a4 event:(id)a5
{
  id v8 = a5;
  v9 = self;
  objc_sync_enter(v9);
  id v10 = nplog_obj();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_BE50(a3, a4, v11);
  }

  if (a3 == 1)
  {
    -[NSPUserEventAgentFileHandleMaintainer setEventToken:](v9, "setEventToken:", a4);
    -[NSPUserEventAgentFileHandleMaintainer stopFileHandleReaderSettingTimer](v9, "stopFileHandleReaderSettingTimer");
    -[NSPUserEventAgentFileHandleMaintainer resetFileHandlesFromEvent:](v9, "resetFileHandlesFromEvent:", v8);
    -[NSPUserEventAgentFileHandleMaintainer cancelFileHandleReaderSources](v9, "cancelFileHandleReaderSources");
    -[NSPUserEventAgentFileHandleMaintainer setupReadabilityHandlers](v9, "setupReadabilityHandlers");
    -[NSPUserEventAgentFileHandleMaintainer checkDeviceFirstUnlock](v9, "checkDeviceFirstUnlock");
    -[NSPUserEventAgentFileHandleMaintainer setReceivedEventToken:](v9, "setReceivedEventToken:", 1LL);
  }

  objc_sync_exit(v9);
}

- (void)startFileHandleReaderSettingTimer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSPUserEventAgentFileHandleMaintainer fileHandleReaderSettingTimer]( self,  "fileHandleReaderSettingTimer"));

  if (!v3)
  {
    -[NSPUserEventAgentFileHandleMaintainer provider](self, "provider");
    xpc_event_provider_get_queue();
  }

- (void)stopFileHandleReaderSettingTimer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSPUserEventAgentFileHandleMaintainer fileHandleReaderSettingTimer]( self,  "fileHandleReaderSettingTimer"));

  if (v3)
  {
    v4 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue( -[NSPUserEventAgentFileHandleMaintainer fileHandleReaderSettingTimer]( self,  "fileHandleReaderSettingTimer"));
    dispatch_source_cancel(v4);

    -[NSPUserEventAgentFileHandleMaintainer setFileHandleReaderSettingTimer:]( self,  "setFileHandleReaderSettingTimer:",  0LL);
  }

- (void)cancelFileHandleReaderSources
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPUserEventAgentFileHandleMaintainer fileHandleReaderSources](self, "fileHandleReaderSources"));

  if (v3)
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSPUserEventAgentFileHandleMaintainer fileHandleReaderSources]( self,  "fileHandleReaderSources",  0LL));
    id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        id v8 = 0LL;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v10 + 1) + 8LL * (void)v8));
          id v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }

      while (v6);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPUserEventAgentFileHandleMaintainer fileHandleReaderSources](self, "fileHandleReaderSources"));
    [v9 removeAllObjects];
  }

- (void)startFileHandleReader:(id)a3
{
}

- (void)setupReadabilityHandlers
{
  v2 = self;
  objc_sync_enter(v2);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_8198;
  v3[3] = &unk_149A0;
  v3[4] = v2;
  -[NSPUserEventAgentFileHandleMaintainer iterateFileHandlesWithBlock:](v2, "iterateFileHandlesWithBlock:", v3);
  objc_sync_exit(v2);
}

- (void)launchOwner
{
  obj = self;
  objc_sync_enter(obj);
  if (-[NSPUserEventAgentFileHandleMaintainer receivedEventToken](obj, "receivedEventToken"))
  {
    kdebug_trace(732954644LL, 0LL, 0LL, 0LL, 0LL);
    objc_claimAutoreleasedReturnValue(-[NSPUserEventAgentFileHandleMaintainer createEvent](obj, "createEvent"));
    -[NSPUserEventAgentFileHandleMaintainer provider](obj, "provider");
    -[NSPUserEventAgentFileHandleMaintainer eventToken](obj, "eventToken");
    xpc_event_provider_token_fire();
  }

  objc_sync_exit(obj);
}

- (BOOL)receivedEventToken
{
  return self->_receivedEventToken;
}

- (void)setReceivedEventToken:(BOOL)a3
{
  self->_receivedEventToken = a3;
}

- (void)provider
{
  return self->_provider;
}

- (void)setProvider:(void *)a3
{
  self->_provider = a3;
}

- (unint64_t)eventToken
{
  return self->_eventToken;
}

- (void)setEventToken:(unint64_t)a3
{
  self->_eventToken = a3;
}

- (BOOL)didInitialLaunch
{
  return self->_didInitialLaunch;
}

- (void)setDidInitialLaunch:(BOOL)a3
{
  self->_didInitialLaunch = a3;
}

- (OS_dispatch_source)fileHandleReaderSettingTimer
{
  return self->_fileHandleReaderSettingTimer;
}

- (void)setFileHandleReaderSettingTimer:(id)a3
{
}

- (NSMutableArray)fileHandleReaderSources
{
  return self->_fileHandleReaderSources;
}

- (void)setFileHandleReaderSources:(id)a3
{
}

- (void).cxx_destruct
{
}

@end