@interface FollowUpServer
+ (id)_executablePathForPID:(int)a3;
+ (id)fl_getProcNameForPID:(int)a3;
- (BOOL)_connectionHasEntitlement:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (FollowUpServer)init;
- (NSMutableSet)unentitledClients;
- (NSXPCListener)listener;
- (void)_beginObservingLanguageChangeNotfication;
- (void)_stopObservingLanguageChangeNotification;
- (void)dealloc;
- (void)lightStart;
- (void)setListener:(id)a3;
- (void)setUnentitledClients:(id)a3;
- (void)start;
@end

@implementation FollowUpServer

- (FollowUpServer)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___FollowUpServer;
  v2 = -[FollowUpServer init](&v7, "init");
  if (v2)
  {
    v3 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.corefollowup.agent");
    listener = v2->_listener;
    v2->_listener = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    -[FollowUpServer setUnentitledClients:](v2, "setUnentitledClients:", v5);
  }

  return v2;
}

- (void)start
{
}

- (void)lightStart
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  BOOL v6 = -[FollowUpServer _connectionHasEntitlement:](self, "_connectionHasEntitlement:", v5);
  if (v6)
  {
    objc_super v7 = -[ClientInterface initWithXPCConnection:]( objc_alloc(&OBJC_CLASS___ClientInterface),  "initWithXPCConnection:",  v5);
    uint64_t v8 = FLDaemonExportedInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    [v5 setExportedInterface:v9];

    [v5 setExportedObject:v7];
    [v5 resume];
  }

  else
  {
    objc_super v7 = (ClientInterface *)objc_claimAutoreleasedReturnValue( +[FollowUpServer fl_getProcNameForPID:]( FollowUpServer,  "fl_getProcNameForPID:",  [v5 processIdentifier]));
    id v10 = [v5 processIdentifier];

    id v5 = (id)objc_claimAutoreleasedReturnValue(+[FollowUpServer _executablePathForPID:](&OBJC_CLASS___FollowUpServer, "_executablePathForPID:", v10));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FollowUpServer unentitledClients](self, "unentitledClients"));
    LOBYTE(v10) = [v11 containsObject:v7];

    if ((v10 & 1) == 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unentitled connection to followupd from %@ at %@",  v7,  v5));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[FollowUpServer unentitledClients](self, "unentitledClients"));
      [v13 addObject:v7];

      if (qword_10001E378)
      {
        free((void *)qword_10001E378);
        qword_10001E378 = 0LL;
      }

      id v14 = v12;
      qword_10001E378 = (uint64_t)strdup((const char *)[v14 UTF8String]);
      qword_10001E330 = qword_10001E378;
      uint64_t v16 = _FLLogSystem(qword_10001E378, v15);
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        sub_10000E5A4((uint64_t)v14, v17);
      }
    }
  }

  return v6;
}

- (BOOL)_connectionHasEntitlement:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 valueForEntitlement:@"com.apple.private.followup"]);
  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)) {
    unsigned __int8 v5 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

+ (id)_executablePathForPID:(int)a3
{
  return  -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  buffer,  proc_pidpath(a3, buffer, 0x1000u),  4LL);
}

+ (id)fl_getProcNameForPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (proc_name(a3, buffer, 0x100u) >= 1)
  {
    uint64_t v4 = buffer;
LABEL_6:
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4));
    goto LABEL_7;
  }

  size_t v8 = 648LL;
  *(void *)v11 = 0xE00000001LL;
  int v12 = 1;
  int v13 = v3;
  char v10 = 0;
  int v5 = sysctl(v11, 4u, v9, &v8, 0LL, 0LL);
  BOOL v6 = 0LL;
  if (!v5 && v10)
  {
    uint64_t v4 = &v10;
    goto LABEL_6;
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___FollowUpServer;
  -[FollowUpServer dealloc](&v3, "dealloc");
}

- (void)_beginObservingLanguageChangeNotfication
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)sub_100005638,  @"com.apple.language.changed",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_stopObservingLanguageChangeNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.language.changed", 0LL);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSMutableSet)unentitledClients
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setUnentitledClients:(id)a3
{
}

- (void).cxx_destruct
{
}

@end