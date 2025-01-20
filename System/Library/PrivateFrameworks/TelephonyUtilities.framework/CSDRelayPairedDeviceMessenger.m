@interface CSDRelayPairedDeviceMessenger
- (CSDRelayPairedDeviceMessenger)initWithQueue:(id)a3;
- (NSMutableSet)identifiersWaitingForAcknowledgement;
- (OS_dispatch_queue)queue;
- (id)_sendMessageOptionsWithTimeout:(double)a3 wantsAcknowledgement:(BOOL)a4;
- (void)_retryReliableMessageWithIdentifierIfNecessary:(id)a3 message:(id)a4 timeout:(double)a5 maximumRetryAttempts:(unint64_t)a6;
- (void)dealloc;
- (void)sendMessage:(id)a3 completionHandler:(id)a4;
- (void)sendMessage:(id)a3 timeout:(double)a4 wantsAcknowledgement:(BOOL)a5 maximumRetryAttempts:(unint64_t)a6 completionHandler:(id)a7;
- (void)sendMessage:(id)a3 wantsAcknowledgement:(BOOL)a4 completionHandler:(id)a5;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setIdentifiersWaitingForAcknowledgement:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSDRelayPairedDeviceMessenger

- (CSDRelayPairedDeviceMessenger)initWithQueue:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CSDRelayPairedDeviceMessenger;
  v6 = -[CSDRelayPairedDeviceMessenger init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    identifiersWaitingForAcknowledgement = v7->_identifiersWaitingForAcknowledgement;
    v7->_identifiersWaitingForAcknowledgement = (NSMutableSet *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CSDRelayIDSService sharedInstance](&OBJC_CLASS___CSDRelayIDSService, "sharedInstance"));
    [v10 addServiceDelegate:v7 queue:v7->_queue];
  }

  return v7;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSDRelayIDSService sharedInstance](&OBJC_CLASS___CSDRelayIDSService, "sharedInstance"));
  [v3 removeServiceDelegate:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSDRelayPairedDeviceMessenger;
  -[CSDRelayPairedDeviceMessenger dealloc](&v4, "dealloc");
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  id v7 = a5;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayPairedDeviceMessenger queue](self, "queue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10009F820;
  v10[3] = &unk_1003D7758;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, v10);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayPairedDeviceMessenger queue](self, "queue"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10009FA38;
  v18[3] = &unk_1003D8FE0;
  BOOL v22 = a6;
  id v19 = v12;
  id v20 = v11;
  id v21 = v13;
  id v15 = v13;
  id v16 = v11;
  id v17 = v12;
  dispatch_async(v14, v18);
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = (CSDMessagingRelayMessage *)a6;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDestination destinationWithURI:](&OBJC_CLASS___IDSDestination, "destinationWithURI:", v9));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[CSDRelayIDSService sharedInstance](&OBJC_CLASS___CSDRelayIDSService, "sharedInstance"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 deviceForFromID:v9]);

  v14 = -[CSDMessagingRelayMessage initWithData:]( objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage),  "initWithData:",  v10);
  if (v13)
  {
    unsigned int v15 = [v13 isDefaultPairedDevice];
    id v16 = sub_1001704C4();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v18)
      {
        id v19 = (CSDMessagingRelayMessage *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage typeString](v14, "typeString"));
        *(_DWORD *)buf = 138413058;
        v31 = v19;
        __int16 v32 = 2112;
        v33 = v11;
        __int16 v34 = 2112;
        v35 = v13;
        __int16 v36 = 2112;
        v37 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Incoming message of type %@ from destination %@ device %@: %@",  buf,  0x2Au);
      }

      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
      id v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v20 queue]);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_10009FDFC;
      v26[3] = &unk_1003D7B28;
      v26[4] = self;
      v27 = v14;
      id v28 = v11;
      id v29 = v13;
      dispatch_async(v21, v26);
    }

    else
    {
      if (v18)
      {
        *(_DWORD *)buf = 138412546;
        v31 = v14;
        __int16 v32 = 2112;
        v33 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[WARN] Received message %@ from device %@ but it is not the default paired device",  buf,  0x16u);
      }
    }
  }

  else
  {
    id v22 = sub_1001704C4();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[CSDRelayIDSService sharedInstance](&OBJC_CLASS___CSDRelayIDSService, "sharedInstance"));
      v25 = (void *)objc_claimAutoreleasedReturnValue([v24 devices]);
      *(_DWORD *)buf = 138412546;
      v31 = v9;
      __int16 v32 = 2112;
      v33 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "[WARN] No device found for fromID %@. All devices: %@",  buf,  0x16u);
    }
  }
}

- (id)_sendMessageOptionsWithTimeout:(double)a3 wantsAcknowledgement:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  3LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
  [v6 setObject:v7 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];

  [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionFireAndForgetKey];
  uint64_t v8 = IDSSendMessageOptionForceLocalDeliveryKey;
  [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionForceLocalDeliveryKey];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  [v6 setObject:v9 forKeyedSubscript:IDSSendMessageOptionWantsClientAcknowledgementKey];

  if (+[IDSDevice pairedDeviceUniqueIDOverrideExists](&OBJC_CLASS___IDSDevice, "pairedDeviceUniqueIDOverrideExists"))
  {
    id v10 = sub_1001704C4();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[WARN] Removing IDSSendMessageOptionForceLocalDeliveryKey key from sendMessage options because pairedDeviceUniqu eIDOverride exists",  v14,  2u);
    }

    [v6 removeObjectForKey:v8];
  }

  id v12 = [v6 copy];

  return v12;
}

- (void)_retryReliableMessageWithIdentifierIfNecessary:(id)a3 message:(id)a4 timeout:(double)a5 maximumRetryAttempts:(unint64_t)a6
{
  id v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayPairedDeviceMessenger queue](self, "queue"));
  dispatch_assert_queue_V2(v12);

  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayPairedDeviceMessenger identifiersWaitingForAcknowledgement]( self,  "identifiersWaitingForAcknowledgement"));
  unsigned __int8 v14 = [v13 containsObject:v10];

  if ((v14 & 1) != 0)
  {
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayPairedDeviceMessenger identifiersWaitingForAcknowledgement]( self,  "identifiersWaitingForAcknowledgement"));
    [v15 removeObject:v10];

    id v16 = sub_1001704C4();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (a6)
    {
      if (v18)
      {
        *(_DWORD *)buf = 138412290;
        v24 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Retrying message send with identifier: %@",  buf,  0xCu);
      }

      -[CSDRelayPairedDeviceMessenger sendMessage:timeout:wantsAcknowledgement:maximumRetryAttempts:completionHandler:]( self,  "sendMessage:timeout:wantsAcknowledgement:maximumRetryAttempts:completionHandler:",  v11,  1LL,  a6 - 1,  0LL,  a5);
    }

    else
    {
      if (v18)
      {
        id v21 = [v11 type];
        if (v21 >= 0x39) {
          id v22 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  v21));
        }
        else {
          id v22 = off_1003D9050[(int)v21];
        }
        *(_DWORD *)buf = 138412546;
        v24 = v22;
        __int16 v25 = 2112;
        v26 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[WARN] Not attempting retry since we are out of retry attempts for %@ message with identifier: %@",  buf,  0x16u);
      }
    }
  }

  else
  {
    id v19 = sub_1001704C4();
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Not attempting retry since message is no longer waiting for acknowledgement: %@",  buf,  0xCu);
    }
  }
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
}

- (void)sendMessage:(id)a3 wantsAcknowledgement:(BOOL)a4 completionHandler:(id)a5
{
  double v5 = 15.0;
  if (a4) {
    double v5 = 30.0;
  }
  -[CSDRelayPairedDeviceMessenger sendMessage:timeout:wantsAcknowledgement:maximumRetryAttempts:completionHandler:]( self,  "sendMessage:timeout:wantsAcknowledgement:maximumRetryAttempts:completionHandler:",  a3,  v5);
}

- (void)sendMessage:(id)a3 timeout:(double)a4 wantsAcknowledgement:(BOOL)a5 maximumRetryAttempts:(unint64_t)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  unsigned __int8 v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayPairedDeviceMessenger queue](self, "queue"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000A02F4;
  v17[3] = &unk_1003D9030;
  double v20 = a4;
  BOOL v22 = a5;
  v17[4] = self;
  id v18 = v12;
  id v19 = v13;
  unint64_t v21 = a6;
  id v15 = v13;
  id v16 = v12;
  dispatch_async(v14, v17);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableSet)identifiersWaitingForAcknowledgement
{
  return self->_identifiersWaitingForAcknowledgement;
}

- (void)setIdentifiersWaitingForAcknowledgement:(id)a3
{
}

- (void).cxx_destruct
{
}

@end