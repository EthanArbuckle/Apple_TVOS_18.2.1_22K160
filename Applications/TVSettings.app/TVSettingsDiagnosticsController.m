@interface TVSettingsDiagnosticsController
- (BOOL)checkTicketNumber:(id)a3;
- (BOOL)pingOutstanding;
- (NSTimer)timer;
- (TVSettingsDiagnosticsController)init;
- (int64_t)sessionState;
- (void)_pollForSession:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)launch;
- (void)launchWithTicketNumber:(id)a3;
- (void)pollForSession;
- (void)setPingOutstanding:(BOOL)a3;
- (void)setSessionState:(int64_t)a3;
- (void)setTimer:(id)a3;
@end

@implementation TVSettingsDiagnosticsController

- (TVSettingsDiagnosticsController)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVSettingsDiagnosticsController;
  v2 = -[TVSettingsDiagnosticsController init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    v2->_sessionState = 0LL;
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences preferencesWithDomain:]( &OBJC_CLASS___TVSPreferences,  "preferencesWithDomain:",  @"com.apple.TVSettingsDiagnostics"));
    [v4 doubleForKey:@"pollSeconds" defaultValue:10.0];
    if (v5 > 0.0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  v3,  "_pollForSession:",  0LL,  1LL));
      -[TVSettingsDiagnosticsController setTimer:](v3, "setTimer:", v6);

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v7 addObserver:v3 selector:"didBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];
    }
  }

  return v3;
}

- (void)invalidate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsDiagnosticsController timer](self, "timer"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsDiagnosticsController timer](self, "timer"));
    [v4 invalidate];

    -[TVSettingsDiagnosticsController setTimer:](self, "setTimer:", 0LL);
  }

  -[TVSettingsDiagnosticsController setPingOutstanding:](self, "setPingOutstanding:", 0LL);
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsDiagnosticsController;
  -[TVSettingsDiagnosticsController dealloc](&v4, "dealloc");
}

- (void)pollForSession
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsDiagnosticsController timer](self, "timer"));
  -[TVSettingsDiagnosticsController _pollForSession:](self, "_pollForSession:", v3);
}

- (void)_pollForSession:(id)a3
{
  id v4 = a3;
  if (!-[TVSettingsDiagnosticsController pingOutstanding](self, "pingOutstanding"))
  {
    v13 = 0LL;
    if (!qword_1001E17B0)
    {
      *(_OWORD *)location = off_100190F90;
      uint64_t v15 = 0LL;
      qword_1001E17B0 = _sl_dlopen(location, &v13);
      double v5 = v13;
      if (qword_1001E17B0)
      {
        if (!v13) {
          goto LABEL_5;
        }
      }

      else
      {
        double v5 = (void *)abort_report_np("%s", (const char *)v13);
        __break(1u);
      }

      free(v5);
    }

- (BOOL)checkTicketNumber:(id)a3
{
  id v3 = a3;
  id v4 = -[NSXPCConnection initWithServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithServiceName:",  @"com.apple.DiagnosticsSessionAvailibility");
  double v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___DADiagnosticsSessionAvailabilityProtocol));
  -[NSXPCConnection setRemoteObjectInterface:](v4, "setRemoteObjectInterface:", v5);

  -[NSXPCConnection resume](v4, "resume");
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  char v18 = 0;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](v4, "remoteObjectProxy"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000612F0;
  v11[3] = &unk_100190F70;
  v8 = v4;
  id v12 = v8;
  v14 = &v15;
  objc_super v9 = v6;
  v13 = v9;
  [v7 checkAvailabilityWithTicketNumber:v3 response:v11];

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v7) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)v7;
}

- (void)launch
{
}

- (void)launchWithTicketNumber:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (v4 && [v4 length])
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"diagnostics://%@",  v8));
    dispatch_semaphore_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v5));

LABEL_6:
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    [v7 openURL:v6 withCompletionHandler:0];

    goto LABEL_7;
  }

  if (-[TVSettingsDiagnosticsController sessionState](self, "sessionState"))
  {
    dispatch_semaphore_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"diagnostics://"));
    goto LABEL_6;
  }

- (int64_t)sessionState
{
  return self->_sessionState;
}

- (void)setSessionState:(int64_t)a3
{
  self->_sessionState = a3;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (BOOL)pingOutstanding
{
  return self->_pingOutstanding;
}

- (void)setPingOutstanding:(BOOL)a3
{
  self->_pingOutstanding = a3;
}

- (void).cxx_destruct
{
}

@end