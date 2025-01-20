@interface NotifierDelegate
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)start;
@end

@implementation NotifierDelegate

+ (id)sharedInstance
{
  if (qword_10000D9F8 != -1) {
    dispatch_once(&qword_10000D9F8, &stru_100008228);
  }
  return (id)qword_10000D9F0;
}

- (void)start
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NotificationController sharedController](&OBJC_CLASS___NotificationController, "sharedController"));
  [v3 start];

  v4 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.familynotification.agent");
  listener = self->_listener;
  self->_listener = v4;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  -[NSXPCListener resume](self->_listener, "resume");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___FAFamilyNotifierAgentProtocol));
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray);
  v7 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v6,  objc_opt_class(&OBJC_CLASS___FAFamilyNotification),  0LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v5 setClasses:v8 forSelector:"pendingNotificationsWithIdentifier:replyBlock:" argumentIndex:0 ofReply:1];

  [v4 setExportedInterface:v5];
  v9 = -[NotifierInterface initWithXPCConnection:]( objc_alloc(&OBJC_CLASS___NotifierInterface),  "initWithXPCConnection:",  v4);
  [v4 setExportedObject:v9];
  [v4 resume];

  return 1;
}

- (void).cxx_destruct
{
}

@end