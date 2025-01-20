@interface MRDIDSTransport
- (BOOL)shouldUseSystemAuthenticationPrompt;
- (BOOL)supportsIdleDisconnection;
- (MRAVOutputDevice)outputDevice;
- (MRDIDSServiceConnection)idsConnection;
- (MRDIDSTransport)initWithOutputDevice:(id)a3;
- (MRDIDSTransportConnection)transport;
- (NSString)sessionUID;
- (id)_createConnectionWithUserInfo:(id)a3;
- (id)_generateSessionUID;
- (id)createConnectionWithUserInfo:(id)a3;
- (id)debugDescription;
- (id)deviceInfo;
- (id)error;
- (id)hostname;
- (id)name;
- (id)uid;
- (int64_t)port;
- (void)_synchronized_setSessionUID:(id)a3;
- (void)resetWithError:(id)a3;
- (void)setIdsConnection:(id)a3;
- (void)setSessionUID:(id)a3;
- (void)setShouldUseSystemAuthenticationPrompt:(BOOL)a3;
- (void)setTransport:(id)a3;
@end

@implementation MRDIDSTransport

- (MRDIDSTransport)initWithOutputDevice:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MRDIDSTransport;
  v6 = -[MRDIDSTransport init](&v19, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_outputDevice, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___MRDeviceInfo);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
    -[MRDeviceInfo setName:](v8, "setName:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue([v5 primaryID]);
    -[MRDeviceInfo setDeviceUID:](v8, "setDeviceUID:", v10);

    objc_storeStrong((id *)&v7->_deviceInfo, v8);
    v11 = objc_alloc(&OBJC_CLASS___MRDIDSServiceConnection);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRDeviceInfo deviceUID](v8, "deviceUID"));
    v13 = -[MRDIDSServiceConnection initWithDeviceUID:](v11, "initWithDeviceUID:", v12);
    idsConnection = v7->_idsConnection;
    v7->_idsConnection = v13;

    objc_initWeak(&location, v7);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100065D54;
    v16[3] = &unk_10039C500;
    objc_copyWeak(&v17, &location);
    -[MRDIDSServiceConnection setInvalidationHandler:](v7->_idsConnection, "setInvalidationHandler:", v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (id)debugDescription
{
  v3 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"<%@:%p {\n",  objc_opt_class(self),  self);
  v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = MRCreateIndentedDebugDescriptionFromObject(v4->_idsConnection);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @" connection = %@\n", v6);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @" outputDevice = %@\n", v4->_outputDevice);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @" session = %@\n", v4->_sessionUID);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @" error = %@\n", v4->_error);
  objc_sync_exit(v4);

  -[NSMutableString appendString:](v3, "appendString:", @"}>");
  return v3;
}

- (id)name
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIDSTransport deviceInfo](self, "deviceInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 name]);

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

- (id)uid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIDSTransport deviceInfo](self, "deviceInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 WHAIdentifier]);

  return v3;
}

- (id)error
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_error;
  objc_sync_exit(v2);

  return v3;
}

- (id)createConnectionWithUserInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIDSTransport sessionUID](self, "sessionUID"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIDSTransport _generateSessionUID](self, "_generateSessionUID"));
    -[MRDIDSTransport setSessionUID:](self, "setSessionUID:", v6);

    v7 = dispatch_group_create();
    idsConnection = self->_idsConnection;
    uint64_t v9 = MRIDSServiceMessageTypeProtobuf;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIDSTransport uid](self, "uid"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIDSTransport sessionUID](self, "sessionUID"));
    -[MRDIDSServiceConnection setMessageHandler:forType:destination:session:]( idsConnection,  "setMessageHandler:forType:destination:session:",  &stru_10039C540,  v9,  v10,  v11);

    dispatch_group_enter(v7);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100066298;
    v17[3] = &unk_100399250;
    v12 = v7;
    v18 = v12;
    -[MRDIDSServiceConnection setConnectionHandler:](self->_idsConnection, "setConnectionHandler:", v17);
    if (-[MRDIDSServiceConnection isConnected](self->_idsConnection, "isConnected")) {
      dispatch_group_leave(v12);
    }
    v13 = (MRDIDSTransportConnection *)objc_claimAutoreleasedReturnValue( -[MRDIDSTransport _createConnectionWithUserInfo:]( self,  "_createConnectionWithUserInfo:",  v4));
    transport = self->_transport;
    self->_transport = v13;
  }

  v15 = self->_transport;

  return v15;
}

- (id)_createConnectionWithUserInfo:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  v31 = sub_100066518;
  v32 = sub_100066528;
  id v33 = 0LL;
  id v27 = 0LL;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v4,  200LL,  0LL,  &v27));
  id v7 = v27;
  idsConnection = self->_idsConnection;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIDSTransport uid](self, "uid"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIDSTransport sessionUID](self, "sessionUID"));
  uint64_t v11 = MRIDSServiceMessageTypeConnectRemoteControl;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100066530;
  v24[3] = &unk_10039C590;
  v26 = &v28;
  v12 = v5;
  v25 = v12;
  -[MRDIDSServiceConnection sendMessage:type:destination:session:options:priority:response:]( idsConnection,  "sendMessage:type:destination:session:options:priority:response:",  v6,  v11,  v9,  v10,  0LL,  300LL,  v24);

  if (self->_shouldUseSystemAuthenticationPrompt) {
    int64_t v13 = 90000000000LL;
  }
  else {
    int64_t v13 = 14000000000LL;
  }
  dispatch_time_t v14 = dispatch_time(0LL, v13);
  uint64_t v15 = dispatch_semaphore_wait(v12, v14);
  v16 = (void *)v29[5];
  if (v15 || v16)
  {
    v22 = v16;
    v21 = 0LL;
    error = self->_error;
    self->_error = v22;
  }

  else
  {
    id v17 = objc_alloc(&OBJC_CLASS___MRDIDSTransportConnection);
    v18 = self->_idsConnection;
    error = (NSError *)objc_claimAutoreleasedReturnValue(-[MRDIDSTransport uid](self, "uid"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIDSTransport sessionUID](self, "sessionUID"));
    v21 = -[MRDIDSTransportConnection initWithConnection:type:destination:session:]( v17,  "initWithConnection:type:destination:session:",  v18,  MRIDSServiceMessageTypeRemoteControl,  error,  v20);
  }

  _Block_object_dispose(&v28, 8);
  return v21;
}

- (void)resetWithError:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  -[MRDIDSTransportConnection closeWithError:](v4->_transport, "closeWithError:", v5);
  objc_sync_exit(v4);
}

- (BOOL)supportsIdleDisconnection
{
  return 1;
}

- (void)setSessionUID:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  -[MRDIDSTransport _synchronized_setSessionUID:](v4, "_synchronized_setSessionUID:", v5);
  objc_sync_exit(v4);
}

- (void)_synchronized_setSessionUID:(id)a3
{
  id v5 = a3;
  p_sessionUID = &self->_sessionUID;
  if (self->_sessionUID)
  {
    idsConnection = self->_idsConnection;
    uint64_t v8 = MRIDSServiceMessageTypeDisconnectRemoteControl;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIDSTransport uid](self, "uid"));
    -[MRDIDSServiceConnection removeMessageHandlerForType:destination:session:]( idsConnection,  "removeMessageHandlerForType:destination:session:",  v8,  v9,  *p_sessionUID);
  }

  objc_storeStrong((id *)&self->_sessionUID, a3);
  if (*p_sessionUID)
  {
    objc_initWeak(&location, self);
    v10 = self->_idsConnection;
    objc_copyWeak(&v13, &location);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[MRDIDSTransport uid]( self,  "uid",  _NSConcreteStackBlock,  3221225472LL,  sub_100066840,  &unk_10039C5B8));
    -[MRDIDSServiceConnection setMessageHandler:forType:destination:session:]( v10,  "setMessageHandler:forType:destination:session:",  &v12,  MRIDSServiceMessageTypeDisconnectRemoteControl,  v11,  *p_sessionUID);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (id)_generateSessionUID
{
  v2 = objc_alloc(&OBJC_CLASS___NSString);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 UUIDString]);
  id v5 = -[NSString initWithFormat:](v2, "initWithFormat:", @"%@-%d", v4, ++dword_1003FDD10);

  return v5;
}

- (BOOL)shouldUseSystemAuthenticationPrompt
{
  return self->_shouldUseSystemAuthenticationPrompt;
}

- (void)setShouldUseSystemAuthenticationPrompt:(BOOL)a3
{
  self->_shouldUseSystemAuthenticationPrompt = a3;
}

- (id)deviceInfo
{
  return self->_deviceInfo;
}

- (NSString)sessionUID
{
  return self->_sessionUID;
}

- (MRAVOutputDevice)outputDevice
{
  return self->_outputDevice;
}

- (MRDIDSTransportConnection)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
}

- (MRDIDSServiceConnection)idsConnection
{
  return self->_idsConnection;
}

- (void)setIdsConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end