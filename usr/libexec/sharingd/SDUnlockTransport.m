@interface SDUnlockTransport
- (IDSService)autoUnlockService;
- (NSMutableDictionary)completionHandlersByMessageIdentifier;
- (NSMutableDictionary)sendDatesByMessageIdentifier;
- (SDUnlockTransport)init;
- (id)activeDevice;
- (id)dataFromUUID:(id)a3;
- (id)idsDeviceForUniqueID:(id)a3;
- (id)sendAutoUnlockPayload:(id)a3 toDevice:(id)a4 type:(unsigned __int16)a5 sessionID:(id)a6 queueOneID:(id)a7 timeout:(id)a8 completion:(id)a9;
- (id)transferDataFromPayload:(id)a3 sessionID:(id)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
@end

@implementation SDUnlockTransport

- (SDUnlockTransport)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDUnlockTransport;
  v2 = -[SDUnlockTransport init](&v8, "init");
  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  completionHandlersByMessageIdentifier = v2->_completionHandlersByMessageIdentifier;
  v2->_completionHandlersByMessageIdentifier = (NSMutableDictionary *)v3;

  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  sendDatesByMessageIdentifier = v2->_sendDatesByMessageIdentifier;
  v2->_sendDatesByMessageIdentifier = (NSMutableDictionary *)v5;

  return v2;
}

- (id)dataFromUUID:(id)a3
{
  v4[0] = 0LL;
  v4[1] = 0LL;
  [a3 getUUIDBytes:v4];
  return (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v4,  16LL));
}

- (id)transferDataFromPayload:(id)a3 sessionID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = objc_opt_new(&OBJC_CLASS___SDAutoUnlockSessionWrapper);
  -[SDAutoUnlockSessionWrapper setVersion:](v8, "setVersion:", 1LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockTransport dataFromUUID:](self, "dataFromUUID:", v6));

  -[SDAutoUnlockSessionWrapper setSessionID:](v8, "setSessionID:", v9);
  -[SDAutoUnlockSessionWrapper setPayload:](v8, "setPayload:", v7);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionWrapper data](v8, "data"));
  return v10;
}

- (id)activeDevice
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockTransport autoUnlockService](self, "autoUnlockService", 0LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 devices]);

  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        if ([v7 isActive])
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

- (id)idsDeviceForUniqueID:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockTransport autoUnlockService](self, "autoUnlockService", 0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 devices]);

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        __int128 v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueIDOverride]);
        unsigned int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (id)sendAutoUnlockPayload:(id)a3 toDevice:(id)a4 type:(unsigned __int16)a5 sessionID:(id)a6 queueOneID:(id)a7 timeout:(id)a8 completion:(id)a9
{
  uint64_t v12 = a5;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v54 = a9;
  v55 = (void *)objc_claimAutoreleasedReturnValue( -[SDUnlockTransport transferDataFromPayload:sessionID:]( self,  "transferDataFromPayload:sessionID:",  a3,  v16));
  id v19 = [v15 isEqualToString:IDSDefaultPairedDevice];
  if ((_DWORD)v19)
  {
    uint64_t v20 = auto_unlock_log(v19);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10011A784(v21);
    }
LABEL_11:

    goto LABEL_12;
  }

  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SDUnlockTransport idsDeviceForUniqueID:](self, "idsDeviceForUniqueID:", v15));
  uint64_t v22 = IDSCopyIDForDevice();
  if (!v22)
  {
    uint64_t v30 = auto_unlock_log(0LL);
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_10011A7C4();
    }

    goto LABEL_11;
  }

  v23 = (void *)v22;
  v24 = objc_alloc(&OBJC_CLASS___NSMutableSet);
  v62 = v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v62, 1LL));
  v26 = -[NSMutableSet initWithArray:](v24, "initWithArray:", v25);

  if (!v26)
  {
LABEL_12:
    uint64_t v32 = auto_unlock_log(v27);
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v59 = (NSString *)v15;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "No destinations for device ID: %@",  buf,  0xCu);
    }

    v26 = 0LL;
    id v33 = 0LL;
    id v34 = 0LL;
    v35 = v54;
    goto LABEL_15;
  }

  v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v29 = v28;
  if (v18)
  {
    -[os_log_s setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v18, IDSSendMessageOptionTimeoutKey);
  }

  else
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", IDSMaxMessageTimeout));
    -[os_log_s setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v37, IDSSendMessageOptionTimeoutKey);
  }

  id v52 = v18;
  -[os_log_s setObject:forKeyedSubscript:]( v29,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  IDSSendMessageOptionEnforceRemoteTimeoutsKey);
  if (v17) {
    -[os_log_s setObject:forKeyedSubscript:]( v29,  "setObject:forKeyedSubscript:",  v17,  IDSSendMessageOptionQueueOneIdentifierKey);
  }
  id v53 = v17;
  -[SDUnlockTransport updateSendOptions:](self, "updateSendOptions:", v29);
  id v38 = [[IDSProtobuf alloc] initWithProtobufData:v55 type:v12 isResponse:0];
  uint64_t v39 = v12;
  kdebug_trace(725287032LL, v12, 0LL, 0LL, 0LL);
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockTransport autoUnlockService](self, "autoUnlockService"));
  id v56 = 0LL;
  id v57 = 0LL;
  v51 = v38;
  LODWORD(v38) = [v40 sendProtobuf:v38 toDestinations:v26 priority:300 options:v29 identifier:&v57 error:&v56];
  id v33 = v57;
  id v34 = v56;

  v41 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"type: %d, sessionID: %ld, destinations: %@",  v39,  v16,  v26);
  uint64_t v42 = auto_unlock_log(v41);
  v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
  v44 = v43;
  v50 = v41;
  if ((_DWORD)v38)
  {
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v59 = v41;
      __int16 v60 = 2112;
      id v61 = v33;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Sending %@, identifier: %@", buf, 0x16u);
    }

    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockTransport sendDatesByMessageIdentifier](self, "sendDatesByMessageIdentifier"));
    [v46 setObject:v45 forKeyedSubscript:v33];

    v35 = v54;
    if (v54)
    {
      id v47 = [v54 copy];
      id v48 = objc_retainBlock(v47);
      v49 = (void *)objc_claimAutoreleasedReturnValue( -[SDUnlockTransport completionHandlersByMessageIdentifier]( self,  "completionHandlersByMessageIdentifier"));
      [v49 setObject:v48 forKeyedSubscript:v33];

      v35 = v54;
    }

    -[SDUnlockTransport handleSuccessfulMessageSentWithIdentifier:sessionID:]( self,  "handleSuccessfulMessageSentWithIdentifier:sessionID:",  v33,  v16);
    id v18 = v52;
    id v17 = v53;
  }

  else
  {
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      sub_10011A828();
    }

    id v18 = v52;
    id v17 = v53;
    v35 = v54;
    if (v54) {
      (*((void (**)(id, void, id))v54 + 2))(v54, 0LL, v34);
    }
  }

LABEL_15:
  return v33;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v10 = a5;
  id v11 = a7;
  uint64_t v12 = kdebug_trace(725287036LL, 0LL, 0LL, 0LL, 0LL);
  uint64_t v13 = auto_unlock_log(v12);
  __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      id v15 = @"YES";
    }
    else {
      id v15 = @"NO";
    }
    id v16 = objc_opt_new(&OBJC_CLASS___NSDate);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockTransport sendDatesByMessageIdentifier](self, "sendDatesByMessageIdentifier"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v10]);
    -[NSDate timeIntervalSinceDate:](v16, "timeIntervalSinceDate:", v18);
    int v24 = 138413058;
    v25 = v15;
    __int16 v26 = 2112;
    id v27 = v10;
    __int16 v28 = 2048;
    uint64_t v29 = v19;
    __int16 v30 = 2112;
    id v31 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "success = %@, identifier = %@, time = %.2f, error = %@",  (uint8_t *)&v24,  0x2Au);
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockTransport sendDatesByMessageIdentifier](self, "sendDatesByMessageIdentifier"));
  [v20 removeObjectForKey:v10];

  v21 = (void *)objc_claimAutoreleasedReturnValue( -[SDUnlockTransport completionHandlersByMessageIdentifier]( self,  "completionHandlersByMessageIdentifier"));
  uint64_t v22 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v10]);

  if (v22)
  {
    ((void (**)(void, BOOL, id))v22)[2](v22, v8, v11);
    v23 = (void *)objc_claimAutoreleasedReturnValue( -[SDUnlockTransport completionHandlersByMessageIdentifier]( self,  "completionHandlersByMessageIdentifier"));
    [v23 removeObjectForKey:v10];
  }
}

- (IDSService)autoUnlockService
{
  return self->_autoUnlockService;
}

- (NSMutableDictionary)completionHandlersByMessageIdentifier
{
  return self->_completionHandlersByMessageIdentifier;
}

- (NSMutableDictionary)sendDatesByMessageIdentifier
{
  return self->_sendDatesByMessageIdentifier;
}

- (void).cxx_destruct
{
}

@end