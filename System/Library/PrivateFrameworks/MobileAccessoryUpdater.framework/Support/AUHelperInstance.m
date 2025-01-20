@interface AUHelperInstance
+ (AUHelperInstance)sharedInstance;
+ (id)xpcConnectionToHelper;
- (AUHelperInstance)init;
- (AUHelperServiceProtocol)remoteObject;
@end

@implementation AUHelperInstance

- (AUHelperInstance)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AUHelperInstance;
  v2 = -[AUHelperInstance init](&v4, "init");
  if (v2) {
    v2->_xpcConnection = (NSXPCConnection *)+[AUHelperInstance xpcConnectionToHelper]( &OBJC_CLASS___AUHelperInstance,  "xpcConnectionToHelper");
  }
  return v2;
}

+ (AUHelperInstance)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100001E9C;
  block[3] = &unk_100074F50;
  block[4] = a1;
  if (qword_10008E318 != -1) {
    dispatch_once(&qword_10008E318, block);
  }
  return (AUHelperInstance *)qword_10008E310;
}

- (AUHelperServiceProtocol)remoteObject
{
  result = (AUHelperServiceProtocol *)self->_xpcConnection;
  if (result) {
    return (AUHelperServiceProtocol *)-[AUHelperServiceProtocol synchronousRemoteObjectProxyWithErrorHandler:]( result,  "synchronousRemoteObjectProxyWithErrorHandler:",  &stru_100074F70);
  }
  return result;
}

+ (id)xpcConnectionToHelper
{
  v2 = -[NSXPCConnection initWithMachServiceName:options:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithMachServiceName:options:",  @"com.apple.accessoryupdater.launchauhelper",  4096LL);
  if (v2)
  {
    -[NSXPCConnection setRemoteObjectInterface:]( v2,  "setRemoteObjectInterface:",  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AUHelperServiceProtocol));
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray);
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSURL);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSError);
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSData);
    v9 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v3,  v4,  v5,  v6,  v7,  v8,  objc_opt_class(&OBJC_CLASS___NSNumber),  0LL);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( -[NSXPCConnection remoteObjectInterface](v2, "remoteObjectInterface"),  "setClasses:forSelector:argumentIndex:ofReply:",  v9,  "userPreferenceSetObject:forSuite:withKey:",  0LL,  0LL);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( -[NSXPCConnection remoteObjectInterface](v2, "remoteObjectInterface"),  "setClasses:forSelector:argumentIndex:ofReply:",  v9,  "userPreferenceObjectForSuite:withKey:withReply:",  0LL,  1LL);
    -[NSXPCConnection resume](v2, "resume");
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100047D20();
  }

  return v2;
}

@end