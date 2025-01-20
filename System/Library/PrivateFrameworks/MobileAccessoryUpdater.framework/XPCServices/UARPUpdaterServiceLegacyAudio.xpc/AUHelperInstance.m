@interface AUHelperInstance
+ (AUHelperInstance)sharedInstance;
+ (id)xpcConnectionToHelper;
- (AUHelperInstance)init;
- (AUHelperServiceProtocol)remoteObject;
@end

@implementation AUHelperInstance

- (AUHelperInstance)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AUHelperInstance;
  v2 = -[AUHelperInstance init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[AUHelperInstance xpcConnectionToHelper](&OBJC_CLASS___AUHelperInstance, "xpcConnectionToHelper"));
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v3;
  }

  return v2;
}

+ (AUHelperInstance)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000C7FC;
  block[3] = &unk_10002D738;
  block[4] = a1;
  if (qword_10003DEB0 != -1) {
    dispatch_once(&qword_10003DEB0, block);
  }
  return (AUHelperInstance *)(id)qword_10003DEA8;
}

- (AUHelperServiceProtocol)remoteObject
{
  xpcConnection = self->_xpcConnection;
  if (xpcConnection) {
    xpcConnection = (NSXPCConnection *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( xpcConnection,  "synchronousRemoteObjectProxyWithErrorHandler:",  &stru_10002D778));
  }
  return (AUHelperServiceProtocol *)xpcConnection;
}

+ (id)xpcConnectionToHelper
{
  v2 = -[NSXPCConnection initWithMachServiceName:options:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithMachServiceName:options:",  @"com.apple.accessoryupdater.launchauhelper",  4096LL);
  if (v2)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AUHelperServiceProtocol));
    -[NSXPCConnection setRemoteObjectInterface:](v2, "setRemoteObjectInterface:", v3);
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSArray);
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSURL);
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSError);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSData);
    v10 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v4,  v5,  v6,  v7,  v8,  v9,  objc_opt_class(&OBJC_CLASS___NSNumber),  0LL);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectInterface](v2, "remoteObjectInterface"));
    [v12 setClasses:v11 forSelector:"userPreferenceSetObject:forSuite:withKey:" argumentIndex:0 ofReply:0];

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectInterface](v2, "remoteObjectInterface"));
    [v13 setClasses:v11 forSelector:"userPreferenceObjectForSuite:withKey:withReply:" argumentIndex:0 ofReply:1];

    -[NSXPCConnection resume](v2, "resume");
    v14 = v2;
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100017AA0();
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end