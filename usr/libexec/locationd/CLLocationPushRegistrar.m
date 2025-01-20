@interface CLLocationPushRegistrar
+ (id)sharedRegistrar;
- (NSXPCConnection)connection;
- (void)connect;
- (void)dealloc;
- (void)registerForPushToken:(id)a3 completion:(id)a4;
- (void)setConnection:(id)a3;
- (void)setLocationPushesActive:(BOOL)a3 forAppBundleIdentifier:(id)a4 completion:(id)a5;
@end

@implementation CLLocationPushRegistrar

+ (id)sharedRegistrar
{
  if (qword_101998250 != -1) {
    dispatch_once(&qword_101998250, &stru_10184B090);
  }
  return (id)qword_101998258;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLLocationPushRegistrar;
  -[CLLocationPushRegistrar dealloc](&v3, "dealloc");
}

- (void)connect
{
  objc_super v3 = -[NSXPCConnection initWithMachServiceName:options:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithMachServiceName:options:",  @"com.apple.locationpushd.pushregistration",  4096LL);
  self->_connection = v3;
  if (v3)
  {
    -[NSXPCConnection setRemoteObjectInterface:]( self->_connection,  "setRemoteObjectInterface:",  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___LPPushTokenServerProtocol));
    connection = self->_connection;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1006E3430;
    v7[3] = &unk_10181A288;
    v7[4] = self;
    -[NSXPCConnection setInvalidationHandler:](connection, "setInvalidationHandler:", v7);
    v5 = self->_connection;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1006E35D4;
    v6[3] = &unk_10181A288;
    v6[4] = self;
    -[NSXPCConnection setInterruptionHandler:](v5, "setInterruptionHandler:", v6);
    -[NSXPCConnection resume](self->_connection, "resume");
  }

- (void)registerForPushToken:(id)a3 completion:(id)a4
{
  connection = self->_connection;
  if (!connection)
  {
    -[CLLocationPushRegistrar connect](self, "connect");
    connection = self->_connection;
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1006E3800;
  v8[3] = &unk_10184B0B8;
  v8[4] = a4;
  objc_msgSend( -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy"),  "registerForPushToken:completion:",  a3,  v8);
}

- (void)setLocationPushesActive:(BOOL)a3 forAppBundleIdentifier:(id)a4 completion:(id)a5
{
  BOOL v7 = a3;
  connection = self->_connection;
  if (!connection)
  {
    -[CLLocationPushRegistrar connect](self, "connect");
    connection = self->_connection;
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1006E389C;
  v10[3] = &unk_10184B0E0;
  v10[4] = a5;
  objc_msgSend( -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy"),  "setLocationPushesActive:forAppBundleIdentifier:completion:",  v7,  a4,  v10);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

@end