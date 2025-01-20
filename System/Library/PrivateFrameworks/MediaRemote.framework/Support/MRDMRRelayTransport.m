@interface MRDMRRelayTransport
- (BOOL)requiresCustomPairing;
- (BOOL)shouldUseSystemAuthenticationPrompt;
- (BOOL)supportsIdleDisconnection;
- (BOOL)supportsReconnection;
- (MRAVOutputDevice)outputDevice;
- (MRDMRRelayTransport)initWithOutputDevice:(id)a3;
- (id)createConnectionWithUserInfo:(id)a3;
- (id)debugDescription;
- (id)deviceInfo;
- (id)error;
- (id)hostname;
- (id)name;
- (id)uid;
- (int64_t)port;
- (void)setError:(id)a3;
- (void)setOutputDevice:(id)a3;
@end

@implementation MRDMRRelayTransport

- (MRDMRRelayTransport)initWithOutputDevice:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MRDMRRelayTransport;
  v5 = -[MRDMRRelayTransport init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[MRDMRRelayTransport setOutputDevice:](v5, "setOutputDevice:", v4);
  }

  return v6;
}

- (id)debugDescription
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = objc_opt_class(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMRRelayTransport outputDevice](v2, "outputDevice"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 debugName]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMRRelayTransport error](v2, "error"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p {\n   outputDevice = %@\n   error = %@\n}>",  v3,  v2,  v5,  v6));

  objc_sync_exit(v2);
  return v7;
}

- (id)createConnectionWithUserInfo:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = sub_1001077B0;
  v19 = sub_1001077C0;
  id v20 = 0LL;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[MRDMRRelayConnectionManager sharedManager]( &OBJC_CLASS___MRDMRRelayConnectionManager,  "sharedManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMRRelayTransport outputDevice](self, "outputDevice"));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uid]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1001077C8;
  v12[3] = &unk_1003A1088;
  v12[4] = self;
  v14 = &v15;
  v9 = v5;
  v13 = v9;
  [v6 waitForConnectionWithOutputDeviceUID:v8 timeout:v12 completion:7.0];

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (id)deviceInfo
{
  return 0LL;
}

- (id)uid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMRRelayTransport outputDevice](self, "outputDevice"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 uid]);

  return v3;
}

- (id)name
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMRRelayTransport outputDevice](self, "outputDevice"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 name]);

  return v3;
}

- (id)hostname
{
  return 0LL;
}

- (int64_t)port
{
  return 0LL;
}

- (BOOL)shouldUseSystemAuthenticationPrompt
{
  return 0;
}

- (id)error
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = -[NSError copy](v2->_error, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (void)setError:(id)a3
{
  id v4 = (NSError *)a3;
  obj = self;
  objc_sync_enter(obj);
  error = obj->_error;
  obj->_error = v4;

  objc_sync_exit(obj);
}

- (BOOL)requiresCustomPairing
{
  return 0;
}

- (BOOL)supportsIdleDisconnection
{
  return 0;
}

- (BOOL)supportsReconnection
{
  return 0;
}

- (MRAVOutputDevice)outputDevice
{
  return self->_outputDevice;
}

- (void)setOutputDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end