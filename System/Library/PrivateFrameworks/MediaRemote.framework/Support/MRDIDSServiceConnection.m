@interface MRDIDSServiceConnection
- (BOOL)isConnected;
- (BOOL)sendMessage:(id)a3 type:(id)a4 destination:(id)a5 session:(id)a6 options:(id)a7 priority:(int64_t)a8;
- (BOOL)sendMessage:(id)a3 type:(id)a4 destination:(id)a5 session:(id)a6 options:(id)a7 priority:(int64_t)a8 response:(id)a9;
- (IDSDevice)device;
- (IDSService)idsService;
- (MRDIDSService)mrService;
- (MRDIDSServiceConnection)init;
- (MRDIDSServiceConnection)initWithDevice:(id)a3;
- (MRDIDSServiceConnection)initWithDeviceUID:(id)a3;
- (NSString)debugDescription;
- (NSString)deviceUID;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (id)_configurationFromDestination:(id)a3 session:(id)a4;
- (id)connectionHandler;
- (id)invalidationHandler;
- (unint64_t)_generateMessageID;
- (unint64_t)totalOutgoingMessageCount;
- (void)_maybeDeviceConnectionStatusChanged;
- (void)dealloc;
- (void)handleDidReceiveResetConnectionRequest;
- (void)handleIncomingMessage:(id)a3 type:(id)a4 destination:(id)a5 session:(id)a6 messageID:(id)a7 replyID:(id)a8;
- (void)removeMessageHandlerForType:(id)a3;
- (void)removeMessageHandlerForType:(id)a3 destination:(id)a4 session:(id)a5;
- (void)resetConnection;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)setConnectionHandler:(id)a3;
- (void)setDevice:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setMessageHandler:(id)a3 forType:(id)a4;
- (void)setMessageHandler:(id)a3 forType:(id)a4 destination:(id)a5 session:(id)a6;
- (void)setQueue:(id)a3;
@end

@implementation MRDIDSServiceConnection

- (MRDIDSServiceConnection)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MRDIDSServiceConnection;
  v2 = -[MRDIDSServiceConnection init](&v12, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.mediaremote.MRDIDSServiceConnection", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[MRDIDSService sharedService](&OBJC_CLASS___MRDIDSService, "sharedService"));
    mrService = v2->_mrService;
    v2->_mrService = (MRDIDSService *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[MRDIDSService idsService](v2->_mrService, "idsService"));
    idsService = v2->_idsService;
    v2->_idsService = (IDSService *)v9;

    -[IDSService addDelegate:queue:](v2->_idsService, "addDelegate:queue:", v2, v2->_queue);
  }

  return v2;
}

- (MRDIDSServiceConnection)initWithDevice:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIDOverride]);
  v6 = -[MRDIDSServiceConnection initWithDeviceUID:](self, "initWithDeviceUID:", v5);

  if (v6) {
    -[MRDIDSServiceConnection setDevice:](v6, "setDevice:", v4);
  }

  return v6;
}

- (MRDIDSServiceConnection)initWithDeviceUID:(id)a3
{
  id v5 = a3;
  v6 = -[MRDIDSServiceConnection init](self, "init");
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_deviceUID, a3);
    objc_initWeak(&location, v7);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10012C6E0;
    v12[3] = &unk_1003A1D88;
    objc_copyWeak(&v13, &location);
    -[MRDIDSServiceConnection setMessageHandler:forType:]( v7,  "setMessageHandler:forType:",  v12,  MRIDSServiceMessageTypeResetConnection);
    queue = (dispatch_queue_s *)v7->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10012C70C;
    block[3] = &unk_100399250;
    v11 = v7;
    dispatch_async(queue, block);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)dealloc
{
  if (self->_serviceHandlerToken)
  {
    -[MRDIDSService removeHandler:](self->_mrService, "removeHandler:");
    id serviceHandlerToken = self->_serviceHandlerToken;
    self->_id serviceHandlerToken = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRDIDSServiceConnection;
  -[MRDIDSServiceConnection dealloc](&v4, "dealloc");
}

- (NSString)debugDescription
{
  dispatch_queue_attr_t v3 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"<%@:%p {\n",  objc_opt_class(self),  self);
  objc_super v4 = self;
  objc_sync_enter(v4);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @" deviceUID = %@\n", v4->_deviceUID);
  uint64_t v5 = MRCreateIndentedDebugDescriptionFromObject(v4->_device);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @" device = %@\n", v6);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @" service = %@\n", v4->_mrService);
  uint64_t v7 = MRCreateIndentedDebugDescriptionFromObject(v4->_messageHandlers);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @" messageHandlers = %@\n", v8);

  uint64_t v9 = MRCreateIndentedDebugDescriptionFromObject(v4->_destinationMessageHandlers);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @" destinationMessageHandlers = %@\n", v10);

  uint64_t v11 = MRCreateIndentedDebugDescriptionFromObject(v4->_responseHandlers);
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @" responseMessageHandlers = %@\n", v12);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @" deviceMessageHandler = %@\n", v4->_serviceHandlerToken);
  id v13 = objc_retainBlock(v4->_invalidationHandler);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @" invalidationHandler = %@\n", v13);

  id v14 = objc_retainBlock(v4->_connectionHandler);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @" connectionHandler = %@\n", v14);

  objc_sync_exit(v4);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"}>");
  return (NSString *)v3;
}

- (void)setDevice:(id)a3
{
  objc_super v4 = (IDSDevice *)a3;
  uint64_t v6 = _MRLogForCategory(9LL, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIDSServiceConnection device](self, "device"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIDOverride]);
    *(_DWORD *)buf = 138412802;
    v19 = self;
    __int16 v20 = 2112;
    v21 = v9;
    __int16 v22 = 2112;
    v23 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MRDIDSServiceConnection] %@ Setting IDSDevice from %@ to %@",  buf,  0x20u);
  }

  v10 = self;
  objc_sync_enter(v10);
  if (v10->_serviceHandlerToken)
  {
    -[MRDIDSService removeHandler:](v10->_mrService, "removeHandler:");
    id serviceHandlerToken = v10->_serviceHandlerToken;
    v10->_id serviceHandlerToken = 0LL;
  }

  if (v4)
  {
    objc_initWeak((id *)buf, v10);
    mrService = v10->_mrService;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10012CB28;
    v16[3] = &unk_1003A1DB0;
    objc_copyWeak(&v17, (id *)buf);
    uint64_t v13 = objc_claimAutoreleasedReturnValue( -[MRDIDSService _addMessageHandlerForDevice:handler:]( mrService,  "_addMessageHandlerForDevice:handler:",  v4,  v16));
    id v14 = v10->_serviceHandlerToken;
    v10->_id serviceHandlerToken = (id)v13;

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }

  device = v10->_device;
  v10->_device = v4;

  objc_sync_exit(v10);
}

- (IDSDevice)device
{
  v2 = self;
  objc_sync_enter(v2);
  dispatch_queue_attr_t v3 = v2->_device;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)name
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIDSServiceConnection device](self, "device"));
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 name]);

  return (NSString *)v3;
}

- (BOOL)isConnected
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIDSServiceConnection device](self, "device"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (void)resetConnection
{
  if (-[MRDIDSServiceConnection isConnected](self, "isConnected")) {
    -[MRDIDSServiceConnection sendMessage:type:destination:session:options:priority:]( self,  "sendMessage:type:destination:session:options:priority:",  0LL,  MRIDSServiceMessageTypeResetConnection,  0LL,  0LL,  0LL,  300LL);
  }
}

- (BOOL)sendMessage:(id)a3 type:(id)a4 destination:(id)a5 session:(id)a6 options:(id)a7 priority:(int64_t)a8
{
  return -[MRDIDSServiceConnection sendMessage:type:destination:session:options:priority:response:]( self,  "sendMessage:type:destination:session:options:priority:response:",  a3,  a4,  a5,  a6,  a7,  a8,  0LL);
}

- (BOOL)sendMessage:(id)a3 type:(id)a4 destination:(id)a5 session:(id)a6 options:(id)a7 priority:(int64_t)a8 response:(id)a9
{
  mrService = self->_mrService;
  id v17 = a9;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIDSServiceConnection device](self, "device"));
  LOBYTE(a8) = -[MRDIDSService _sendMessage:device:type:destination:session:options:priority:replyID:response:]( mrService,  "_sendMessage:device:type:destination:session:options:priority:replyID:response:",  v22,  v23,  v21,  v20,  v19,  v18,  a8,  0LL,  v17);

  return a8;
}

- (void)setMessageHandler:(id)a3 forType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  if (!v8->_messageHandlers)
  {
    uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    messageHandlers = v8->_messageHandlers;
    v8->_messageHandlers = v9;
  }

  id v11 = [v6 copy];
  id v12 = objc_retainBlock(v11);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_messageHandlers, "setObject:forKeyedSubscript:", v12, v7);

  uint64_t v14 = _MRLogForCategory(9LL, v13);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = v8->_messageHandlers;
    int v17 = 138412802;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v7;
    __int16 v21 = 2112;
    id v22 = v16;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "[MRDIDSServiceConnection] %@ Added handler for %@ %@",  (uint8_t *)&v17,  0x20u);
  }

  objc_sync_exit(v8);
}

- (void)setMessageHandler:(id)a3 forType:(id)a4 destination:(id)a5 session:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = self;
  objc_sync_enter(v14);
  destinationMessageHandlers = v14->_destinationMessageHandlers;
  if (!destinationMessageHandlers)
  {
    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    int v17 = v14->_destinationMessageHandlers;
    v14->_destinationMessageHandlers = v16;

    destinationMessageHandlers = v14->_destinationMessageHandlers;
  }

  id v18 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( destinationMessageHandlers,  "objectForKeyedSubscript:",  v11));
  if (!v18)
  {
    id v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v14->_destinationMessageHandlers,  "setObject:forKeyedSubscript:",  v18,  v11);
  }

  id v19 = [v10 copy];
  id v20 = (void *)objc_claimAutoreleasedReturnValue( -[MRDIDSServiceConnection _configurationFromDestination:session:]( v14,  "_configurationFromDestination:session:",  v12,  v13));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v19, v20);

  uint64_t v22 = _MRLogForCategory(9LL, v21);
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v24 = v14->_destinationMessageHandlers;
    int v25 = 138413058;
    id v26 = v11;
    __int16 v27 = 2112;
    id v28 = v12;
    __int16 v29 = 2112;
    id v30 = v13;
    __int16 v31 = 2112;
    v32 = v24;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "[MRDIDSServiceConnection] Added destination handler for type=%@, destination=%@, session=%@, %@",  (uint8_t *)&v25,  0x2Au);
  }

  objc_sync_exit(v14);
}

- (void)removeMessageHandlerForType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5->_messageHandlers, "objectForKeyedSubscript:", v4));

  if (v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_messageHandlers, "setObject:forKeyedSubscript:", 0LL, v4);
    uint64_t v8 = _MRLogForCategory(9LL, v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1002BA7A4((uint64_t)v4, (uint64_t *)&v5->_messageHandlers, v9);
    }
  }

  objc_sync_exit(v5);
}

- (void)removeMessageHandlerForType:(id)a3 destination:(id)a4 session:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  objc_sync_enter(v11);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[MRDIDSServiceConnection _configurationFromDestination:session:]( v11,  "_configurationFromDestination:session:",  v9,  v10));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v11->_destinationMessageHandlers,  "objectForKeyedSubscript:",  v8));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v12]);

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v11->_destinationMessageHandlers,  "objectForKeyedSubscript:",  v8));
    [v15 setObject:0 forKeyedSubscript:v12];

    uint64_t v17 = _MRLogForCategory(9LL, v16);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      destinationMessageHandlers = v11->_destinationMessageHandlers;
      int v20 = 138413058;
      id v21 = v8;
      __int16 v22 = 2112;
      id v23 = v9;
      __int16 v24 = 2112;
      id v25 = v10;
      __int16 v26 = 2112;
      __int16 v27 = destinationMessageHandlers;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "[MRDIDSServiceConnection] Remove destination handler for type=%@, destination=%@, session=%@, %@",  (uint8_t *)&v20,  0x2Au);
    }
  }

  objc_sync_exit(v11);
}

- (void)handleDidReceiveResetConnectionRequest
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10012D428;
  block[3] = &unk_100399250;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
}

- (void)handleIncomingMessage:(id)a3 type:(id)a4 destination:(id)a5 session:(id)a6 messageID:(id)a7 replyID:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v41 = a7;
  id v18 = a8;
  uint64_t v20 = _MRLogForCategory(9LL, v19);
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v14 data]);
    *(_DWORD *)buf = 138413826;
    v54 = self;
    __int16 v55 = 2112;
    id v56 = v41;
    __int16 v57 = 2112;
    v58 = v22;
    __int16 v59 = 2112;
    id v60 = v15;
    __int16 v61 = 2112;
    id v62 = v16;
    __int16 v63 = 2112;
    id v64 = v17;
    __int16 v65 = 2112;
    id v66 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[MRDIDSServiceConnection] %@ Message received<%@>: data=%@ type=%@ destination=%@ session=%@ replyID=%@",  buf,  0x48u);
  }

  id v23 = self;
  objc_sync_enter(v23);
  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v23->_messageHandlers,  "objectForKeyedSubscript:",  v15));
  id v25 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v23->_destinationMessageHandlers,  "objectForKeyedSubscript:",  v15));
  __int16 v26 = (void *)objc_claimAutoreleasedReturnValue( -[MRDIDSServiceConnection _configurationFromDestination:session:]( v23,  "_configurationFromDestination:session:",  v16,  v17));
  __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:v26]);

  if (v18)
  {
    id v28 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v23->_responseHandlers,  "objectForKeyedSubscript:",  v18));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v23->_responseHandlers,  "setObject:forKeyedSubscript:",  0LL,  v18);
  }

  else
  {
    id v28 = 0LL;
  }

  objc_sync_exit(v23);
  if (v28)
  {
    id v39 = v18;
    v40 = v24;
    id v29 = v17;
    id v30 = v16;
    queue = (dispatch_queue_s *)v23->_queue;
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472LL;
    v50[2] = sub_10012D8E4;
    v50[3] = &unk_10039AD10;
    v32 = v14;
    v33 = &v52;
    id v52 = v28;
    v34 = &v51;
    v35 = v32;
    id v51 = v32;
    v36 = v50;
LABEL_12:
    dispatch_async(queue, v36);

    id v14 = v35;
    id v16 = v30;
    id v17 = v29;
    id v18 = v39;
    __int16 v24 = v40;

    goto LABEL_13;
  }

  if (v24)
  {
    v37 = (dispatch_queue_s *)v23->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10012D8F4;
    block[3] = &unk_10039D0C8;
    id v49 = v24;
    id v46 = v14;
    id v47 = v16;
    id v48 = v17;
    dispatch_async(v37, block);
  }

  if (v27)
  {
    id v39 = v18;
    v40 = v24;
    id v29 = v17;
    id v30 = v16;
    queue = (dispatch_queue_s *)v23->_queue;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_10012D908;
    v42[3] = &unk_10039AD10;
    v38 = v14;
    v33 = &v44;
    id v44 = v27;
    v34 = &v43;
    v35 = v38;
    id v43 = v38;
    v36 = v42;
    goto LABEL_12;
  }

- (void)_maybeDeviceConnectionStatusChanged
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_idsService, "devices"));
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v21;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIDOverride]);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIDSServiceConnection deviceUID](self, "deviceUID"));
        unsigned int v11 = [v9 isEqualToString:v10];

        if (v11)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

- (unint64_t)_generateMessageID
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = v2->_totalOutgoingMessageCount + 1;
  v2->_totalOutgoingMessageCount = v3;
  objc_sync_exit(v2);

  return v3;
}

- (id)_configurationFromDestination:(id)a3 session:(id)a4
{
  id v5 = (__CFString *)a4;
  uint64_t v6 = (__CFString *)a3;
  uint64_t v7 = objc_alloc(&OBJC_CLASS___NSString);
  id v8 = @"default";
  if (v6) {
    id v9 = v6;
  }
  else {
    id v9 = @"default";
  }
  if (v5) {
    id v8 = v5;
  }
  id v10 = -[NSString initWithFormat:](v7, "initWithFormat:", @"%@-%@", v9, v8);

  return v10;
}

- (NSString)deviceUID
{
  return self->_deviceUID;
}

- (MRDIDSService)mrService
{
  return self->_mrService;
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)connectionHandler
{
  return self->_connectionHandler;
}

- (void)setConnectionHandler:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)totalOutgoingMessageCount
{
  return self->_totalOutgoingMessageCount;
}

- (void).cxx_destruct
{
}

@end