@interface MRDIDSTransportConnection
- (BOOL)isValid;
- (MRDIDSServiceConnection)connection;
- (MRDIDSTransportConnection)initWithConnection:(id)a3 type:(id)a4 destination:(id)a5 session:(id)a6;
- (NSString)destination;
- (NSString)session;
- (NSString)type;
- (id)_exportDescriptorForOutputDevice:(id)a3 endpoint:(id)a4 remoteControl:(BOOL)a5;
- (id)debugDescription;
- (id)error;
- (id)exportEndpoint:(id)a3;
- (id)exportOutputDevice:(id)a3 endpoint:(id)a4;
- (id)runLoop;
- (int64_t)_idsPriorityFromPriority:(int64_t)a3;
- (unint64_t)sendTransportData:(id)a3 options:(id)a4;
- (void)closeWithError:(id)a3;
- (void)dealloc;
@end

@implementation MRDIDSTransportConnection

- (MRDIDSTransportConnection)initWithConnection:(id)a3 type:(id)a4 destination:(id)a5 session:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___MRDIDSTransportConnection;
  v15 = -[MRDIDSTransportConnection init](&v22, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_connection, a3);
    objc_storeStrong((id *)&v16->_type, a4);
    objc_storeStrong((id *)&v16->_destination, a5);
    objc_storeStrong((id *)&v16->_session, a6);
    objc_initWeak(&location, v16);
    connection = v16->_connection;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10006D20C;
    v19[3] = &unk_10039C5B8;
    objc_copyWeak(&v20, &location);
    -[MRDIDSServiceConnection setMessageHandler:forType:destination:session:]( connection,  "setMessageHandler:forType:destination:session:",  v19,  v16->_type,  v16->_destination,  v14);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v16;
}

- (void)dealloc
{
  v3 = -[NSError initWithMRError:description:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithMRError:description:",  104LL,  @"MRIDSCompanionTransportConnection.dealloc");
  -[MRDIDSTransportConnection closeWithError:](self, "closeWithError:", v3);

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRDIDSTransportConnection;
  -[MRDIDSTransportConnection dealloc](&v4, "dealloc");
}

- (id)debugDescription
{
  v3 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"<%@:%p {\n",  objc_opt_class(self),  self);
  objc_super v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = MRCreateIndentedDebugDescriptionFromObject(v4->_connection);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @" connection = %@\n", v6);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @" type = %@\n", v4->_type);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @" destination = %@\n", v4->_destination);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @" session = %@\n", v4->_session);
  unsigned int v7 = -[MRDIDSTransportConnection isValid](v4, "isValid");
  v8 = @"NO";
  if (v7) {
    v8 = @"YES";
  }
  -[NSMutableString appendFormat:](v3, "appendFormat:", @" isValid = %@\n", v8);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @" error = %@\n", v4->_error);
  objc_sync_exit(v4);

  -[NSMutableString appendString:](v3, "appendString:", @"}>");
  return v3;
}

- (BOOL)isValid
{
  return -[MRDIDSServiceConnection isConnected](self->_connection, "isConnected");
}

- (id)error
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = -[NSError copy](v2->_error, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (id)runLoop
{
  return 0LL;
}

- (unint64_t)sendTransportData:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int64_t v8 = -[MRDIDSTransportConnection _idsPriorityFromPriority:]( self,  "_idsPriorityFromPriority:",  [v6 priority]);
  unsigned __int8 v9 = [v6 isWaking];

  if ((v9 & 1) != 0)
  {
    v10 = 0LL;
  }

  else
  {
    uint64_t v13 = IDSSendMessageOptionNonWakingKey;
    id v14 = &__kCFBooleanTrue;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
  }

  -[MRDIDSServiceConnection sendMessage:type:destination:session:options:priority:]( self->_connection,  "sendMessage:type:destination:session:options:priority:",  v7,  self->_type,  self->_destination,  self->_session,  v10,  v8);
  id v11 = [v7 length];

  return (unint64_t)v11;
}

- (void)closeWithError:(id)a3
{
  int64_t v8 = (NSError *)a3;
  objc_super v4 = self;
  objc_sync_enter(v4);
  connection = v4->_connection;
  if (connection)
  {
    -[MRDIDSServiceConnection removeMessageHandlerForType:destination:session:]( connection,  "removeMessageHandlerForType:destination:session:",  v4->_type,  v4->_destination,  v4->_session);
    id v6 = v8;
    if (!v8) {
      id v6 = -[NSError initWithMRError:](objc_alloc(&OBJC_CLASS___NSError), "initWithMRError:", 104LL);
    }
    int64_t v8 = v6;
    objc_storeStrong((id *)&v4->_error, v6);
    id v7 = v4->_connection;
    v4->_connection = 0LL;

    objc_sync_exit(v4);
    -[MRDIDSTransportConnection _notifyDelegateDidCloseWithError:](v4, "_notifyDelegateDidCloseWithError:", v8);
  }

  else
  {
    objc_sync_exit(v4);
  }
}

- (id)exportEndpoint:(id)a3
{
  id v4 = a3;
  if ([v4 isLocalEndpoint])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 groupLeader]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[MRDIDSTransportConnection _exportDescriptorForOutputDevice:endpoint:remoteControl:]( self,  "_exportDescriptorForOutputDevice:endpoint:remoteControl:",  v5,  v4,  1LL));

    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 outputDevices]);
      v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472LL;
      v17 = sub_10006D88C;
      v18 = &unk_10039B9A8;
      v19 = self;
      id v8 = v4;
      id v20 = v8;
      unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mr_compactMap:", &v15));
      id v10 = objc_msgSend(v9, "mutableCopy", v15, v16, v17, v18, v19);

      [v10 addObject:v6];
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 descriptor]);
      [v11 setDesignatedGroupLeader:v6];
      [v11 setOutputDevices:v10];
      id v12 = -[MRAVDistantEndpoint initWithDescriptor:]( objc_alloc(&OBJC_CLASS___MRAVDistantEndpoint),  "initWithDescriptor:",  v11);
    }

    else
    {
      id v12 = 0LL;
    }
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 designatedGroupLeader]);
    id v12 = (MRAVDistantEndpoint *)objc_claimAutoreleasedReturnValue([v13 uid]);

    if (v12) {
      id v12 = (MRAVDistantEndpoint *)v4;
    }
  }

  return v12;
}

- (id)exportOutputDevice:(id)a3 endpoint:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MRDIDSTransportConnection _exportDescriptorForOutputDevice:endpoint:remoteControl:]( self,  "_exportDescriptorForOutputDevice:endpoint:remoteControl:",  a3,  a4,  0LL));
  uint64_t v5 = -[MRAVDistantOutputDevice initWithDescriptor:]( objc_alloc(&OBJC_CLASS___MRAVDistantOutputDevice),  "initWithDescriptor:",  v4);

  return v5;
}

- (int64_t)_idsPriorityFromPriority:(int64_t)a3
{
  else {
    return qword_10034B7F8[a3];
  }
}

- (id)_exportDescriptorForOutputDevice:(id)a3 endpoint:(id)a4 remoteControl:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v7 descriptor]);
  [v9 setTransportType:4];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MRDeviceInfoRequest deviceInfoForOrigin:]( &OBJC_CLASS___MRDeviceInfoRequest,  "deviceInfoForOrigin:",  v10));

  if (v5)
  {
    unsigned int v12 = 1;
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 uid]);
    unsigned int v12 = [v8 containsOutputDeviceWithUID:v13];
  }

  if ([v7 isLocalDevice])
  {
    objc_msgSend( v9,  "setHostDeviceClass:",  _MRDeviceInfoMessageProtobuf_DeviceClassFromModel(objc_msgSend(v11, "deviceClass")));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 modelID]);
    [v9 setModelID:v14];

    v15 = (void *)IDSCopyLocalDeviceUniqueID();
    [v9 setPrimaryUID:v15];

    if ((v12 & 1) != 0)
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 groupUID]);
      [v9 setGroupID:v16];

      [v9 setGroupContainsGroupLeader:1];
      [v9 setIsRemoteControllable:1];
      [v9 setIsGroupLeader:1];
      [v9 setIsLocalDevice:0];
      v17 = (void *)objc_claimAutoreleasedReturnValue([v8 outputDevices]);
      objc_msgSend(v9, "setIsProxyGroupPlayer:", objc_msgSend(v17, "mr_any:", &stru_10039C960));
    }

    else
    {
      [v9 setGroupID:0];
      [v9 setGroupContainsGroupLeader:0];
      [v9 setIsRemoteControllable:0];
      [v9 setIsGroupLeader:0];
      [v9 setIsLocalDevice:0];
      [v9 setIsProxyGroupPlayer:0];
    }

    if ([v7 deviceType] == 4)
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v7 sourceInfo]);
      unsigned __int8 v21 = [v20 multipleBuiltInDevices];

      if ((v21 & 1) == 0)
      {
        objc_super v22 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedModelName]);
        [v9 setName:v22];
      }
    }

    if (v5)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue([v11 WHAIdentifier]);
      [v9 setUniqueIdentifier:v23];

      v19 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedModelName]);
      [v9 setName:v19];
      goto LABEL_16;
    }
  }

  else if (([v8 isLocalEndpoint] & v12) == 1)
  {
    [v9 setIsRemoteControllable:1];
    [v9 setIsGroupLeader:0];
    v18 = (void *)objc_claimAutoreleasedReturnValue([v7 groupID]);

    if (!v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue([v11 groupUID]);
      [v9 setGroupID:v19];
LABEL_16:
    }
  }

  return v9;
}

- (MRDIDSServiceConnection)connection
{
  return self->_connection;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)destination
{
  return self->_destination;
}

- (NSString)session
{
  return self->_session;
}

- (void).cxx_destruct
{
}

@end