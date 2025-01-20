@interface MRDGroupSessionTransport
- (BOOL)shouldUseSystemAuthenticationPrompt;
- (BOOL)supportsIdleDisconnection;
- (BOOL)supportsReconnection;
- (MRAVOutputDevice)outputDevice;
- (MRDGroupSessionTransport)initWithOutputDevice:(id)a3;
- (MRDGroupSessionTransportConnection)connection;
- (NSError)connectionError;
- (id)createConnectionWithUserInfo:(id)a3;
- (id)description;
- (id)deviceInfo;
- (id)error;
- (id)hostname;
- (id)name;
- (id)subscribedPlayerPaths;
- (id)uid;
- (int64_t)port;
- (void)resetWithError:(id)a3;
- (void)setConnection:(id)a3;
- (void)setConnectionError:(id)a3;
@end

@implementation MRDGroupSessionTransport

- (MRDGroupSessionTransport)initWithOutputDevice:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MRDGroupSessionTransport;
  v6 = -[MRDGroupSessionTransport init](&v14, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_outputDevice, a3);
    v8 = objc_alloc(&OBJC_CLASS___MRClient);
    v9 = -[MRClient initWithBundleIdentifier:]( v8,  "initWithBundleIdentifier:",  kMRMediaRemoteSystemMediaApplicationDisplayIdentifier);
    v10 = -[MRPlayerPath initWithOrigin:client:player:]( objc_alloc(&OBJC_CLASS___MRPlayerPath),  "initWithOrigin:client:player:",  0LL,  v9,  0LL);
    v15 = v10;
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
    subscribedPlayerPaths = v7->_subscribedPlayerPaths;
    v7->_subscribedPlayerPaths = (NSArray *)v11;
  }

  return v7;
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVOutputDevice uid](self->_outputDevice, "uid"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVOutputDevice groupSessionInfo](self->_outputDevice, "groupSessionInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@:%p identifier=%@ info=%@>",  v3,  self,  v4,  v5));

  return v6;
}

- (id)createConnectionWithUserInfo:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 groupSessionServer]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sessionManager]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 session]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionTransport outputDevice](self, "outputDevice"));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v8 groupID]);

  id v10 = (id)objc_claimAutoreleasedReturnValue([v7 identifier]);
  if (v10 == v9)
  {
  }

  else
  {
    uint64_t v11 = v10;
    unsigned __int8 v12 = [v10 isEqual:v9];

    if ((v12 & 1) == 0)
    {
      uint64_t v13 = MRGroupSessionError;
      objc_super v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Could not find session corresponding to identifier: %@",  v9));
      id v15 = +[NSError msv_errorWithDomain:code:debugDescription:]( &OBJC_CLASS___NSError,  "msv_errorWithDomain:code:debugDescription:",  v13,  2LL,  @"%@",  v14);
LABEL_8:
      v22 = (void *)objc_claimAutoreleasedReturnValue(v15);
      -[MRDGroupSessionTransport setConnectionError:](self, "setConnectionError:", v22);

      v20 = 0LL;
      goto LABEL_9;
    }
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v7 leader]);

  if (!v16)
  {
    uint64_t v21 = MRGroupSessionError;
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Could not find session leader on session: %@",  v7));
    id v15 = +[NSError msv_errorWithDomain:code:debugDescription:]( &OBJC_CLASS___NSError,  "msv_errorWithDomain:code:debugDescription:",  v21,  8LL,  @"%@",  v14);
    goto LABEL_8;
  }

  v17 = objc_alloc(&OBJC_CLASS___MRDGroupSessionTransportConnection);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v7 leader]);
  v19 = -[MRDGroupSessionTransportConnection initWithGroupSession:participant:]( v17,  "initWithGroupSession:participant:",  v7,  v18);
  -[MRDGroupSessionTransport setConnection:](self, "setConnection:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionTransport connection](self, "connection"));
LABEL_9:

  return v20;
}

- (BOOL)supportsReconnection
{
  return 0;
}

- (BOOL)supportsIdleDisconnection
{
  return 0;
}

- (void)resetWithError:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MRLogForCategory(12LL, v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionTransport] %@ Reset with error: %@",  (uint8_t *)&v9,  0x16u);
  }

  -[MRDGroupSessionTransport setConnectionError:](self, "setConnectionError:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionTransport connection](self, "connection"));
  [v8 closeWithError:v4];
}

- (id)deviceInfo
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___MRDeviceInfo);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionTransport outputDevice](self, "outputDevice"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  -[MRDeviceInfo setName:](v3, "setName:", v5);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionTransport outputDevice](self, "outputDevice"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 primaryID]);
  -[MRDeviceInfo setDeviceUID:](v3, "setDeviceUID:", v7);

  return v3;
}

- (id)uid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionTransport outputDevice](self, "outputDevice"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 uid]);

  return v3;
}

- (id)name
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionTransport outputDevice](self, "outputDevice"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 name]);

  return v3;
}

- (id)hostname
{
  return &stru_1003AE680;
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
  return -[MRDGroupSessionTransport connectionError](self, "connectionError");
}

- (id)subscribedPlayerPaths
{
  return self->_subscribedPlayerPaths;
}

- (MRAVOutputDevice)outputDevice
{
  return self->_outputDevice;
}

- (MRDGroupSessionTransportConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSError)connectionError
{
  return self->_connectionError;
}

- (void)setConnectionError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end