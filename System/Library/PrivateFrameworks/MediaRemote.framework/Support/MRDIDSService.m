@interface MRDIDSService
+ (id)sharedService;
- (BOOL)_sendMessage:(id)a3 device:(id)a4 type:(id)a5 destination:(id)a6 session:(id)a7 options:(id)a8 priority:(int64_t)a9 replyID:(id)a10 response:(id)a11;
- (BOOL)sendMessage:(id)a3 device:(id)a4 type:(id)a5 destination:(id)a6 session:(id)a7 options:(id)a8 priority:(int64_t)a9 response:(id)a10;
- (IDSService)idsService;
- (MRDIDSService)initWithService:(id)a3;
- (NSMutableDictionary)deviceMessageHandlers;
- (NSMutableDictionary)responseHandlers;
- (NSMutableDictionary)totalMessageHandlers;
- (NSString)debugDescription;
- (OS_dispatch_queue)queue;
- (id)_addMessageHandler:(id)a3;
- (id)_addMessageHandlerForDevice:(id)a3 handler:(id)a4;
- (id)addMessageHandler:(id)a3;
- (id)addMessageHandlerForDevice:(id)a3 handler:(id)a4;
- (unint64_t)_generateMessageID;
- (unint64_t)totalOutgoingMessageCount;
- (void)removeHandler:(id)a3;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setDeviceMessageHandlers:(id)a3;
- (void)setQueue:(id)a3;
- (void)setResponseHandlers:(id)a3;
- (void)setTotalMessageHandlers:(id)a3;
@end

@implementation MRDIDSService

+ (id)sharedService
{
  if (qword_1003FDC48 != -1) {
    dispatch_once(&qword_1003FDC48, &stru_10039AC70);
  }
  return (id)qword_1003FDC40;
}

- (MRDIDSService)initWithService:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MRDIDSService;
  v3 = -[MRDIDSService init](&v11, "init", a3);
  if (v3)
  {
    dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.mediaremote.MRDIDSService", v5);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[IDSService mr_sharedIDSService](&OBJC_CLASS___IDSService, "mr_sharedIDSService"));
    idsService = v3->_idsService;
    v3->_idsService = (IDSService *)v8;

    -[IDSService addDelegate:queue:](v3->_idsService, "addDelegate:queue:", v3, v3->_queue);
  }

  return v3;
}

- (NSString)debugDescription
{
  v3 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"<%@:%p {\n",  objc_opt_class(self),  self);
  dispatch_queue_attr_t v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = MRCreateIndentedDebugDescriptionFromObject(v4->_idsService);
  dispatch_queue_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @" service=%@\n", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](v4->_idsService, "devices"));
  uint64_t v8 = MRCreateIndentedDebugDescriptionFromArray(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @" devices=%@\n", v9);

  uint64_t v10 = MRCreateIndentedDebugDescriptionFromObject(v4->_totalMessageHandlers);
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @" messageHandlers = %@\n", v11);

  uint64_t v12 = MRCreateIndentedDebugDescriptionFromObject(v4->_deviceMessageHandlers);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @" deviceMessageHandlers = %@\n", v13);

  objc_sync_exit(v4);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"}>");
  return (NSString *)v3;
}

- (id)addMessageHandlerForDevice:(id)a3 handler:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000376D8;
  v9[3] = &unk_10039AC98;
  id v10 = a4;
  id v6 = v10;
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[MRDIDSService _addMessageHandlerForDevice:handler:]( self,  "_addMessageHandlerForDevice:handler:",  a3,  v9));

  return v7;
}

- (id)addMessageHandler:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100037768;
  v7[3] = &unk_10039ACC0;
  id v8 = a3;
  id v4 = v8;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIDSService _addMessageHandler:](self, "_addMessageHandler:", v7));

  return v5;
}

- (id)_addMessageHandlerForDevice:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIDOverride]);
  v9 = self;
  objc_sync_enter(v9);
  deviceMessageHandlers = v9->_deviceMessageHandlers;
  if (!deviceMessageHandlers)
  {
    objc_super v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v12 = v9->_deviceMessageHandlers;
    v9->_deviceMessageHandlers = v11;

    deviceMessageHandlers = v9->_deviceMessageHandlers;
  }

  v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( deviceMessageHandlers,  "objectForKeyedSubscript:",  v8));
  if (!v13)
  {
    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v9->_deviceMessageHandlers,  "setObject:forKeyedSubscript:",  v13,  v8);
  }

  v14 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", arc4random());
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = [v7 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v16, v15);

  objc_sync_exit(v9);
  return v15;
}

- (id)_addMessageHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (!v5->_totalMessageHandlers)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    totalMessageHandlers = v5->_totalMessageHandlers;
    v5->_totalMessageHandlers = v6;
  }

  id v8 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", arc4random());
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = [v4 copy];
  id v11 = objc_retainBlock(v10);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5->_totalMessageHandlers,  "setObject:forKeyedSubscript:",  v11,  v9);

  objc_sync_exit(v5);
  return v9;
}

- (void)removeHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  deviceMessageHandlers = v5->_deviceMessageHandlers;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100037A48;
  v8[3] = &unk_10039ACE8;
  id v7 = v4;
  id v9 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( deviceMessageHandlers,  "enumerateKeysAndObjectsUsingBlock:",  v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5->_totalMessageHandlers,  "setObject:forKeyedSubscript:",  0LL,  v7);

  objc_sync_exit(v5);
}

- (BOOL)sendMessage:(id)a3 device:(id)a4 type:(id)a5 destination:(id)a6 session:(id)a7 options:(id)a8 priority:(int64_t)a9 response:(id)a10
{
  return -[MRDIDSService _sendMessage:device:type:destination:session:options:priority:replyID:response:]( self,  "_sendMessage:device:type:destination:session:options:priority:replyID:response:",  a3,  a4,  a5,  a6,  a7,  a8,  a9,  0LL,  a10);
}

- (BOOL)_sendMessage:(id)a3 device:(id)a4 type:(id)a5 destination:(id)a6 session:(id)a7 options:(id)a8 priority:(int64_t)a9 replyID:(id)a10 response:(id)a11
{
  id v52 = a3;
  id v17 = a4;
  id v53 = a5;
  id v54 = a6;
  id v55 = a7;
  id v49 = a8;
  id v51 = a10;
  id v18 = a11;
  unint64_t v19 = -[MRDIDSService _generateMessageID](self, "_generateMessageID");
  if (v18)
  {
    v20 = self;
    objc_sync_enter(v20);
    if (!v20->_responseHandlers)
    {
      v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      responseHandlers = v20->_responseHandlers;
      v20->_responseHandlers = v21;
    }

    id v23 = objc_msgSend(v18, "copy", v49);
    id v24 = objc_retainBlock(v23);
    v25 = v20->_responseHandlers;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v19));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v24, v26);

    objc_sync_exit(v20);
  }

  v27 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v19));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v27, "setObject:forKeyedSubscript:", v28, @"messageid");

  -[NSMutableDictionary setObject:forKeyedSubscript:](v27, "setObject:forKeyedSubscript:", v54, @"destination");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v27, "setObject:forKeyedSubscript:", v55, @"session");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v27, "setObject:forKeyedSubscript:", v52, @"data");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v27, "setObject:forKeyedSubscript:", v53, @"type");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v27, "setObject:forKeyedSubscript:", v51, @"replyid");
  v29 = (void *)IDSCopyIDForDevice(v17);
  uint64_t v31 = _MRLogForCategory(9LL, v30);
  v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue([v17 uniqueIDOverride]);
    v34 = (void *)objc_claimAutoreleasedReturnValue([v17 name]);
    *(_DWORD *)buf = 138414338;
    v59 = self;
    __int16 v60 = 2048;
    unint64_t v61 = v19;
    __int16 v62 = 2112;
    v63 = v29;
    __int16 v64 = 2112;
    v65 = v33;
    __int16 v66 = 2112;
    v67 = v34;
    __int16 v68 = 2112;
    id v69 = v52;
    __int16 v70 = 2112;
    id v71 = v53;
    __int16 v72 = 2112;
    id v73 = v54;
    __int16 v74 = 2112;
    id v75 = v55;
    _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "[MRDIDSService] %@ Message Sent<%lu>: idsDestination=%@ device=%@:%@ data=%@ type=%@ destination=%@ session=%@",  buf,  0x5Cu);
  }

  v35 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v49);
  uint64_t v36 = IDSSendMessageOptionFireAndForgetKey;
  v37 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v35,  "objectForKeyedSubscript:",  IDSSendMessageOptionFireAndForgetKey));
  BOOL v38 = v37 == 0LL;

  if (v38)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v36);
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", IDSMaxMessageTimeout));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v35,  "setObject:forKeyedSubscript:",  v39,  IDSSendMessageOptionTimeoutKey);
  }

  idsService = self->_idsService;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v29, v49));
  id v56 = 0LL;
  id v57 = 0LL;
  unsigned __int8 v42 = -[IDSService sendMessage:toDestinations:priority:options:identifier:error:]( idsService,  "sendMessage:toDestinations:priority:options:identifier:error:",  v27,  v41,  a9,  v35,  &v57,  &v56);
  id v43 = v57;
  id v44 = v56;

  if ((v42 & 1) == 0)
  {
    uint64_t v46 = _MRLogForCategory(9LL, v45);
    v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      sub_1002B54C8((uint64_t)self, (uint64_t)v44, v47);
    }
  }

  return v42;
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v37 = a3;
  id v31 = a4;
  id v12 = a5;
  id v38 = a6;
  id v32 = a7;
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"type"]);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"destination"]);
  v34 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"session"]);
  v40 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"data"]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"messageid"]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"replyid"]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v37 deviceForFromID:v38]);
  v39 = -[MRDIDSServiceMessage initWithID:data:device:service:]( objc_alloc(&OBJC_CLASS___MRDIDSServiceMessage),  "initWithID:data:device:service:",  v13,  v40,  v15,  self);
  uint64_t v17 = _MRLogForCategory(9LL, v16);
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v15 uniqueIDOverride]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v15 name]);
    *(_DWORD *)buf = 138414338;
    __int16 v62 = self;
    __int16 v63 = 2112;
    __int16 v64 = v13;
    __int16 v65 = 2112;
    __int16 v66 = v40;
    __int16 v67 = 2112;
    __int16 v68 = v19;
    __int16 v69 = 2112;
    __int16 v70 = v20;
    __int16 v71 = 2112;
    __int16 v72 = v36;
    __int16 v73 = 2112;
    __int16 v74 = v35;
    __int16 v75 = 2112;
    v76 = v34;
    __int16 v77 = 2112;
    v78 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[MRDIDSService] %@ Message received<%@>: data=%@ device=%@:%@ type=%@ destination=%@ session=%@ replyID=%@",  buf,  0x5Cu);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue([v15 uniqueIDOverride]);
  v22 = self;
  objc_sync_enter(v22);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v22->_totalMessageHandlers, "allValues"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v22->_deviceMessageHandlers,  "objectForKeyedSubscript:",  v21));
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 allValues]);

  if (v14) {
    v25 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v22->_responseHandlers,  "objectForKeyedSubscript:",  v14));
  }
  else {
    v25 = 0LL;
  }
  objc_sync_exit(v22);

  if (v25)
  {
    queue = (dispatch_queue_s *)v22->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100038478;
    block[3] = &unk_10039AD10;
    v27 = &v60;
    id v60 = v25;
    v28 = (id *)&v59;
    v59 = v39;
    dispatch_async(queue, block);
LABEL_12:

    goto LABEL_13;
  }

  if ([v33 count])
  {
    v29 = (dispatch_queue_s *)v22->_queue;
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472LL;
    v49[2] = sub_100038488;
    v49[3] = &unk_10039AD60;
    id v50 = v33;
    id v51 = v39;
    id v52 = v15;
    id v53 = v36;
    id v54 = v35;
    id v55 = v34;
    id v56 = v13;
    id v57 = v14;
    dispatch_async(v29, v49);
  }

  if ([v24 count])
  {
    uint64_t v30 = (dispatch_queue_s *)v22->_queue;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_10003858C;
    v41[3] = &unk_10039ADB0;
    id v42 = v24;
    id v43 = v39;
    id v44 = v36;
    id v45 = v35;
    id v46 = v34;
    id v47 = v13;
    id v48 = v14;
    dispatch_async(v30, v41);

    v27 = &v42;
    v28 = (id *)&v43;
    goto LABEL_12;
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

- (IDSService)idsService
{
  return self->_idsService;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)responseHandlers
{
  return self->_responseHandlers;
}

- (void)setResponseHandlers:(id)a3
{
}

- (NSMutableDictionary)deviceMessageHandlers
{
  return self->_deviceMessageHandlers;
}

- (void)setDeviceMessageHandlers:(id)a3
{
}

- (NSMutableDictionary)totalMessageHandlers
{
  return self->_totalMessageHandlers;
}

- (void)setTotalMessageHandlers:(id)a3
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