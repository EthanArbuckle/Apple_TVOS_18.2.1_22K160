@interface ANDaemon
+ (id)_nameForProcessWithPID:(int)a3;
+ (id)sharedInstance;
- (ANDaemon)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)dealloc;
- (void)start;
@end

@implementation ANDaemon

+ (id)sharedInstance
{
  if (qword_1000115A8 != -1) {
    dispatch_once(&qword_1000115A8, &stru_10000C3F0);
  }
  return (id)qword_1000115A0;
}

- (ANDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ANDaemon;
  v2 = -[ANDaemon init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___ANNotificationController);
    notificationController = v2->_notificationController;
    v2->_notificationController = v3;
  }

  return v2;
}

- (void)dealloc
{
  listener = self->_listener;
  if (listener)
  {
    -[NSXPCListener invalidate](listener, "invalidate");
    -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0LL);
    v4 = self->_listener;
    self->_listener = 0LL;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ANDaemon;
  -[ANDaemon dealloc](&v5, "dealloc");
}

- (void)start
{
  v3 = objc_alloc(&OBJC_CLASS___NSXPCListener);
  v4 = -[NSXPCListener initWithMachServiceName:](v3, "initWithMachServiceName:", ANDaemonMachServiceName);
  listener = self->_listener;
  self->_listener = v4;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  -[NSXPCListener resume](self->_listener, "resume");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[ANDaemon _nameForProcessWithPID:]( ANDaemon,  "_nameForProcessWithPID:",  [v5 processIdentifier]));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:ANAccountNotificationClientEntitlement]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v7, v8);
  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v18 = _ANLogSystem(isKindOfClass);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100008414();
    }
    goto LABEL_10;
  }

  id v10 = [v7 BOOLValue];
  char v11 = (char)v10;
  uint64_t v12 = _ANLogSystem(v10);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if ((v11 & 1) == 0)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100008398();
    }
LABEL_10:
    BOOL v17 = 0;
    goto LABEL_11;
  }

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v28 = "-[ANDaemon listener:shouldAcceptNewConnection:]";
    __int16 v29 = 1024;
    int v30 = 82;
    __int16 v31 = 2112;
    v32 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s (%d) \"New incoming connection from %@.\"",  buf,  0x1Cu);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[ANDaemonInterface XPCInterface](&OBJC_CLASS___ANDaemonInterface, "XPCInterface"));
  [v5 setExportedInterface:v15];

  [v5 setExportedObject:self->_notificationController];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100006EBC;
  v25[3] = &unk_10000C370;
  v16 = v6;
  v26 = v16;
  [v5 setInterruptionHandler:v25];
  v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472LL;
  v22 = sub_100006F04;
  v23 = &unk_10000C370;
  v24 = v16;
  [v5 setInvalidationHandler:&v20];
  objc_msgSend(v5, "resume", v20, v21, v22, v23);

  BOOL v17 = 1;
  v14 = v26;
LABEL_11:

  return v17;
}

+ (id)_nameForProcessWithPID:(int)a3
{
  size_t v5 = 648LL;
  dword_10001145C = a3;
  byte_1000116A3 = 0;
  if (sysctl(dword_100011450, 4u, &unk_1000115B0, &v5, 0LL, 0LL)) {
    return @"?";
  }
  if (byte_1000116A3) {
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  &byte_1000116A3));
  }
  else {
    v4 = @"exited?";
  }
  return v4;
}

- (void).cxx_destruct
{
}

@end