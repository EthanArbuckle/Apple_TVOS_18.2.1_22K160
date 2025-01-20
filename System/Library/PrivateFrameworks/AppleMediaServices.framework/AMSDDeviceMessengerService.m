@interface AMSDDeviceMessengerService
+ (AMSDDeviceMessengerService)sharedService;
+ (BOOL)isConnectionEntitled:(id)a3;
- (AMSDDeviceMessengerService)init;
- (BOOL)_attemptAutomaticHandleForMessage:(id)a3;
- (BOOL)_sendMessage:(id)a3 withReplyHandler:(id)a4;
- (IDSService)service;
- (NSArray)cachedMessages;
- (NSMutableArray)delegates;
- (NSMutableDictionary)outgoingMessageReplyHandlers;
- (OS_dispatch_queue)dispatchQueue;
- (id)_determineDestinationsForMessage:(id)a3;
- (id)_getSavedMessages;
- (id)_messageWithProtobuf:(id)a3 fromID:(id)a4 context:(id)a5;
- (id)_replyForIncomingMessage:(id)a3;
- (id)_saveLocation;
- (int64_t)_determineDeviceTypeFromDeviceID:(id)a3 devices:(id)a4;
- (void)_cleanupSavedMessages;
- (void)_clearMessage:(id)a3;
- (void)_enumerateDelegatesWithBlock:(id)a3;
- (void)_handleErrorForIdentifier:(id)a3 error:(id)a4;
- (void)_handleIncomingMessage:(id)a3;
- (void)_handleIncomingReply:(id)a3;
- (void)_overwriteSavedMessages:(id)a3;
- (void)_saveMessage:(id)a3;
- (void)addDelegate:(id)a3;
- (void)getMessagesWithPurpose:(int64_t)a3 completion:(id)a4;
- (void)sendMessage:(id)a3 completion:(id)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)setCachedMessages:(id)a3;
- (void)setDelegates:(id)a3;
@end

@implementation AMSDDeviceMessengerService

+ (AMSDDeviceMessengerService)sharedService
{
  if (qword_1000F1F98 != -1) {
    dispatch_once(&qword_1000F1F98, &stru_1000D6228);
  }
  return (AMSDDeviceMessengerService *)(id)qword_1000F1FA0;
}

- (AMSDDeviceMessengerService)init
{
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___AMSDDeviceMessengerService;
  v2 = -[AMSDDeviceMessengerService init](&v33, "init");
  if (!v2)
  {
LABEL_8:
    v18 = v2;
    goto LABEL_21;
  }

  dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.amsaccountsd.IDS", v4);
  dispatchQueue = v2->_dispatchQueue;
  v2->_dispatchQueue = (OS_dispatch_queue *)v5;

  v7 = -[IDSService initWithService:]( objc_alloc(&OBJC_CLASS___IDSService),  "initWithService:",  @"com.apple.private.alloy.amsaccountsync");
  service = v2->_service;
  v2->_service = v7;

  if (v2->_service)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    if (!v9) {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = objc_opt_class(v2, v11);
      *(_DWORD *)buf = 138543618;
      uint64_t v35 = v12;
      __int16 v36 = 2114;
      v37 = @"com.apple.private.alloy.amsaccountsync";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Listening for service: %{public}@",  buf,  0x16u);
    }

    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    delegates = v2->_delegates;
    v2->_delegates = v13;

    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    outgoingMessageReplyHandlers = v2->_outgoingMessageReplyHandlers;
    v2->_outgoingMessageReplyHandlers = v15;

    -[IDSService addDelegate:queue:](v2->_service, "addDelegate:queue:", v2, v2->_dispatchQueue);
    v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[AMSDDeviceMessengerService dispatchQueue](v2, "dispatchQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100013A68;
    block[3] = &unk_1000D5AB0;
    v32 = v2;
    dispatch_async(v17, block);

    goto LABEL_8;
  }

  unsigned int v19 = +[AMSUnitTests isRunningUnitTests](&OBJC_CLASS___AMSUnitTests, "isRunningUnitTests");
  uint64_t v20 = objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  v21 = (void *)v20;
  if (v19)
  {
    if (!v20) {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 OSLogObject]);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = objc_opt_class(v2, v23);
      *(_DWORD *)buf = 138543618;
      uint64_t v35 = v24;
      __int16 v36 = 2114;
      v37 = @"com.apple.private.alloy.amsaccountsync";
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%{public}@: Failed to create service: %{public}@",  buf,  0x16u);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    [v25 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v26 userInfo:0];
  }

  else
  {
    if (!v20) {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 OSLogObject]);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      uint64_t v29 = objc_opt_class(v2, v28);
      *(_DWORD *)buf = 138543618;
      uint64_t v35 = v29;
      __int16 v36 = 2114;
      v37 = @"com.apple.private.alloy.amsaccountsync";
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_FAULT,  "%{public}@: Failed to create service: %{public}@",  buf,  0x16u);
    }
  }

  v18 = 0LL;
LABEL_21:

  return v18;
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[AMSDDeviceMessengerService dispatchQueue](self, "dispatchQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100013B08;
  v7[3] = &unk_1000D60B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

+ (BOOL)isConnectionEntitled:(id)a3
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 valueForEntitlement:@"com.apple.private.applemediaservices"]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    id v6 = v3;
  }
  else {
    id v6 = 0LL;
  }

  unsigned __int8 v7 = [v6 BOOLValue];
  return v7;
}

- (void)getMessagesWithPurpose:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  if (!v7) {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = objc_opt_class(self, v9);
    __int16 v16 = 2048;
    int64_t v17 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Fetching messages with purpose: %ld",  buf,  0x16u);
  }

  v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[AMSDDeviceMessengerService dispatchQueue](self, "dispatchQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100013D40;
  v12[3] = &unk_1000D6250;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  dispatch_async(v10, v12);
}

- (void)sendMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  if (!v8) {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_opt_class(self, v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 logKey]);
    *(_DWORD *)buf = 138543874;
    uint64_t v20 = v11;
    __int16 v21 = 2114;
    v22 = v12;
    __int16 v23 = 2114;
    id v24 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Sending message: %{public}@",  buf,  0x20u);
  }

  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[AMSDDeviceMessengerService dispatchQueue](self, "dispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100013F34;
  block[3] = &unk_1000D6010;
  void block[4] = self;
  id v17 = v6;
  id v18 = v7;
  id v14 = v7;
  id v15 = v6;
  dispatch_async(v13, block);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v10 = a5;
  id v11 = a7;
  if (!a6)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    if (!v12) {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138543874;
      uint64_t v16 = objc_opt_class(self, v14);
      __int16 v17 = 2114;
      id v18 = v10;
      __int16 v19 = 2114;
      id v20 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%{public}@: Message encountered error. ID: %{public}@ %{public}@",  (uint8_t *)&v15,  0x20u);
    }

    -[AMSDDeviceMessengerService _handleErrorForIdentifier:error:](self, "_handleErrorForIdentifier:error:", v10, v11);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a6;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[AMSDDeviceMessengerService _messageWithProtobuf:fromID:context:]( self,  "_messageWithProtobuf:fromID:context:",  a5,  v10,  a7));
  uint64_t v12 = objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  id v13 = (void *)v12;
  if (v11)
  {
    if (!v12) {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = objc_opt_class(self, v15);
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v11 logKey]);
      int v20 = 138544130;
      uint64_t v21 = v16;
      __int16 v22 = 2114;
      id v23 = v17;
      __int16 v24 = 2114;
      id v25 = v10;
      __int16 v26 = 2114;
      v27 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Received message from: %{public}@ message: %{public}@",  (uint8_t *)&v20,  0x2Au);
    }

    else {
      -[AMSDDeviceMessengerService _handleIncomingMessage:](self, "_handleIncomingMessage:", v11);
    }
  }

  else
  {
    if (!v12) {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v20 = 138543618;
      uint64_t v21 = objc_opt_class(self, v19);
      __int16 v22 = 2114;
      id v23 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%{public}@: Failed to decode received message from: %{public}@",  (uint8_t *)&v20,  0x16u);
    }
  }
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  if (!v6) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 138543618;
    uint64_t v10 = objc_opt_class(self, v8);
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%{public}@: Devices changed: %{public}@",  (uint8_t *)&v9,  0x16u);
  }

  -[AMSDDeviceMessengerService _enumerateDelegatesWithBlock:](self, "_enumerateDelegatesWithBlock:", &stru_1000D62B8);
}

- (BOOL)_attemptAutomaticHandleForMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 purpose];
  if (v5 == (id)1) {
    -[AMSDDeviceMessengerService _clearMessage:](self, "_clearMessage:", v4);
  }

  return v5 == (id)1;
}

- (id)_determineDestinationsForMessage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDDeviceMessengerService service](self, "service"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "amsa_allDevices"));

  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 destination]);
  id v9 = [v8 type];

  if (v9 == (id)3)
  {
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v4 destination]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);

    if (!v18) {
      goto LABEL_27;
    }
    id v10 = (id)objc_claimAutoreleasedReturnValue([v4 destination]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
    -[NSMutableSet addObject:](v7, "addObject:", v19);
  }

  else if (v9 == (id)2)
  {
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    id v10 = v6;
    id v20 = [v10 countByEnumeratingWithState:&v34 objects:v50 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v35;
      do
      {
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v35 != v22) {
            objc_enumerationMutation(v10);
          }
          __int16 v24 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
          if (objc_msgSend(v24, "isLocallyPaired", (void)v34))
          {
            id v25 = (void *)IDSCopyIDForDevice(v24);
            -[NSMutableSet addObject:](v7, "addObject:", v25);
          }
        }

        id v21 = [v10 countByEnumeratingWithState:&v34 objects:v50 count:16];
      }

      while (v21);
    }
  }

  else
  {
    if (v9 != (id)1) {
      goto LABEL_27;
    }
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id v10 = v6;
    id v11 = [v10 countByEnumeratingWithState:&v38 objects:v51 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v39;
      do
      {
        for (j = 0LL; j != v12; j = (char *)j + 1)
        {
          if (*(void *)v39 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)j);
          if ([v15 isLocallyPaired] && objc_msgSend(v15, "isActive"))
          {
            uint64_t v16 = (void *)IDSCopyIDForDevice(v15);
            -[NSMutableSet addObject:](v7, "addObject:", v16);
          }
        }

        id v12 = [v10 countByEnumeratingWithState:&v38 objects:v51 count:16];
      }

      while (v12);
    }
  }

LABEL_27:
  __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig", (void)v34));
  if (!v26) {
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v26 OSLogObject]);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v29 = objc_opt_class(self, v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue([v4 logKey]);
    v31 = (void *)objc_claimAutoreleasedReturnValue([v4 destination]);
    id v32 = [v31 type];
    *(_DWORD *)buf = 138544130;
    uint64_t v43 = v29;
    __int16 v44 = 2114;
    v45 = v30;
    __int16 v46 = 2048;
    id v47 = v32;
    __int16 v48 = 2114;
    v49 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Determined destinations for type: %ld result: %{public}@",  buf,  0x2Au);
  }

  return v7;
}

- (int64_t)_determineDeviceTypeFromDeviceID:(id)a3 devices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    if (v7)
    {
      id v8 = v7;
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDDeviceMessengerService service](self, "service"));
      id v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "amsa_allDevices"));
    }

    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v11 = v8;
    int64_t v9 = (int64_t)[v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v11);
          }
          uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v15 = (void *)IDSCopyIDForDevice(v14);
          if (objc_msgSend(v15, "isEqualToString:", v6, (void)v17))
          {
            if ([v14 isLocallyPaired]
              && ([v14 isActive] & 1) != 0)
            {
              int64_t v9 = 1LL;
            }

            else if ([v14 isLocallyPaired])
            {
              int64_t v9 = 2LL;
            }

            else
            {
              int64_t v9 = 3LL;
            }

            goto LABEL_22;
          }
        }

        int64_t v9 = (int64_t)[v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

- (void)_enumerateDelegatesWithBlock:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[AMSDDeviceMessengerService dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v5);

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDDeviceMessengerService delegates](self, "delegates", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v18 + 1) + 8 * (void)v10) weakObjectValue]);
        if (v11) {
          v4[2](v4, v11);
        }

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v8);
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDDeviceMessengerService delegates](self, "delegates"));
  uint64_t v13 = (char *)[v12 count];

  if ((uint64_t)(v13 - 1) >= 0)
  {
    do
    {
      --v13;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDDeviceMessengerService delegates](self, "delegates"));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:v13]);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 weakObjectValue]);

      if (!v16)
      {
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDDeviceMessengerService delegates](self, "delegates"));
        [v17 removeObjectAtIndex:v13];
      }
    }

    while ((uint64_t)v13 > 0);
  }
}

- (void)_handleErrorForIdentifier:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[AMSDDeviceMessengerService dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDDeviceMessengerService outgoingMessageReplyHandlers](self, "outgoingMessageReplyHandlers"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v6]);

  if (v10)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    uint64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    __int128 v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472LL;
    __int128 v19 = sub_100014F30;
    __int128 v20 = &unk_1000D6250;
    id v22 = v10;
    id v21 = v7;
    dispatch_async(v12, &v17);

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[AMSDDeviceMessengerService outgoingMessageReplyHandlers]( self,  "outgoingMessageReplyHandlers",  v17,  v18,  v19,  v20));
    [v13 setObject:0 forKeyedSubscript:v6];

    uint64_t v14 = v22;
  }

  else
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    if (!v14) {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = objc_opt_class(self, v16);
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%{public}@: Message error is missing a reply block",  buf,  0xCu);
    }
  }
}

- (void)_handleIncomingMessage:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!-[AMSDDeviceMessengerService _attemptAutomaticHandleForMessage:](self, "_attemptAutomaticHandleForMessage:", v4)) {
    -[AMSDDeviceMessengerService _saveMessage:](self, "_saveMessage:", v4);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100015018;
  v7[3] = &unk_1000D62E0;
  id v5 = v4;
  id v8 = v5;
  -[AMSDDeviceMessengerService _enumerateDelegatesWithBlock:](self, "_enumerateDelegatesWithBlock:", v7);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDDeviceMessengerService _replyForIncomingMessage:](self, "_replyForIncomingMessage:", v5));
  if (v6) {
    -[AMSDDeviceMessengerService _sendMessage:withReplyHandler:](self, "_sendMessage:withReplyHandler:", v6, 0LL);
  }
}

- (void)_handleIncomingReply:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDDeviceMessengerService outgoingMessageReplyHandlers](self, "outgoingMessageReplyHandlers"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 messageID]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);

  if (v7)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100015278;
    block[3] = &unk_1000D6250;
    id v23 = v7;
    id v10 = v4;
    id v22 = v10;
    dispatch_async(v9, block);

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10001528C;
    v19[3] = &unk_1000D62E0;
    id v11 = v10;
    id v20 = v11;
    -[AMSDDeviceMessengerService _enumerateDelegatesWithBlock:](self, "_enumerateDelegatesWithBlock:", v19);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDDeviceMessengerService outgoingMessageReplyHandlers](self, "outgoingMessageReplyHandlers"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 messageID]);
    [v12 setObject:0 forKeyedSubscript:v13];

    uint64_t v14 = v23;
  }

  else
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    if (!v14) {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = objc_opt_class(self, v16);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v4 logKey]);
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v17;
      __int16 v26 = 2114;
      v27 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Received reply but no handler exists",  buf,  0x16u);
    }
  }
}

- (id)_messageWithProtobuf:(id)a3 fromID:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 type] == 1
    && (id v11 = objc_alloc(&OBJC_CLASS___AMSXDProtoMessage),
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 data]),
        uint64_t v13 = -[AMSXDProtoMessage initWithData:](v11, "initWithData:", v12),
        v12,
        v13))
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[AMSXDMessage messageFromProtoMessage:]( &OBJC_CLASS___AMSXDMessage,  "messageFromProtoMessage:",  v13));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[AMSXDDevice deviceFromIdentifier:](&OBJC_CLASS___AMSXDDevice, "deviceFromIdentifier:", v9));
    [v14 setOrigin:v15];

    int64_t v16 = -[AMSDDeviceMessengerService _determineDeviceTypeFromDeviceID:devices:]( self,  "_determineDeviceTypeFromDeviceID:devices:",  v9,  0LL);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v14 origin]);
    [v17 setType:v16];

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    [v14 setReceiptDate:v18];

    if ([v14 isReply])
    {
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v10 incomingResponseIdentifier]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v14 messageID]);
      unsigned __int8 v21 = [v19 isEqualToString:v20];

      if ((v21 & 1) == 0)
      {
        id v22 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
        if (!v22) {
          id v22 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
        }
        id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 OSLogObject]);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          uint64_t v31 = objc_opt_class(self, v24);
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v14 logKey]);
          __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v14 messageID]);
          *(_DWORD *)buf = 138544130;
          uint64_t v33 = v31;
          __int16 v34 = 2114;
          id v35 = v25;
          __int16 v36 = 2114;
          __int128 v37 = v19;
          __int16 v38 = 2114;
          __int128 v39 = v26;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] messageID doesn't match the encoded message. %{public}@ != %{public}@",  buf,  0x2Au);
        }
      }

      [v14 setMessageID:v19];
    }

    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue([v10 outgoingResponseIdentifier]);
      [v14 setMessageID:v30];
    }
  }

  else
  {
    uint64_t v13 = (AMSXDProtoMessage *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    if (!v13) {
      uint64_t v13 = (AMSXDProtoMessage *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[AMSXDProtoMessage OSLogObject](v13, "OSLogObject"));
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = objc_opt_class(self, v28);
      __int16 v34 = 2114;
      id v35 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%{public}@: Failed to decode protobuf data from: %{public}@",  buf,  0x16u);
    }

    uint64_t v14 = 0LL;
  }

  return v14;
}

- (id)_replyForIncomingMessage:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 identifier]);
  id v5 = (void *)v4;
  if (v4) {
    id v6 = (const __CFString *)v4;
  }
  else {
    id v6 = &stru_1000DB220;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue([@"reply-" stringByAppendingString:v6]);

  id v8 = objc_alloc(&OBJC_CLASS___AMSXDMessage);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 origin]);
  id v10 = objc_msgSend(v8, "initWithIdentifier:destination:purpose:object:", v7, v9, objc_msgSend(v3, "purpose"), 0);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 messageID]);
  [v10 setMessageID:v11];

  [v10 setIsReply:1];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v3 logKey]);

  [v10 setLogKey:v12];
  return v10;
}

- (BOOL)_sendMessage:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[AMSDDeviceMessengerService _determineDestinationsForMessage:]( self,  "_determineDestinationsForMessage:",  v6));
  __int128 v39 = v8;
  if ([v8 count])
  {
    [v6 setDestination:0];
  }

  else
  {
    __int16 v38 = (void *)objc_claimAutoreleasedReturnValue([v6 logKey]);
    uint64_t v15 = AMSErrorWithFormat(2LL, @"Device Message Send Failed", @"[%@] No destination found");
    id v16 = (id)objc_claimAutoreleasedReturnValue(v15);

    objc_msgSend(v6, "setDestination:", 0, v38);
    if (v16) {
      goto LABEL_25;
    }
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 createProtoMessage]);
  id v10 = objc_alloc(&OBJC_CLASS___IDSProtobuf);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 data]);
  id v12 = [v10 initWithProtobufData:v11 type:1 isResponse:0];

  if (v12)
  {

    goto LABEL_5;
  }

  __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v6 logKey]);
  uint64_t v30 = AMSErrorWithFormat(2LL, @"Device Message Send Failed", @"[%@] No payload found");
  id v16 = (id)objc_claimAutoreleasedReturnValue(v30);

  if (v16)
  {
LABEL_25:
    id v19 = 0LL;
    LOBYTE(v18) = 0;
    id v12 = 0LL;
    goto LABEL_26;
  }

- (void)_cleanupSavedMessages
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[AMSDDeviceMessengerService dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[AMSDDeviceMessengerService _getSavedMessages](self, "_getSavedMessages"));
  -[AMSDDeviceMessengerService _overwriteSavedMessages:](self, "_overwriteSavedMessages:", v4);
}

- (void)_clearMessage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDDeviceMessengerService _getSavedMessages](self, "_getSavedMessages"));
  id v6 = [v5 mutableCopy];

  if ([v6 count])
  {
    id v24 = [v6 count];
    id v7 = [v6 count];
    if ((uint64_t)v7 - 1 >= 0)
    {
      uint64_t v8 = (uint64_t)v7;
      id v9 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
      id v10 = _NSConcreteStackBlock;
      id v25 = v6;
      do
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:--v8]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
        unsigned int v14 = [v12 isEqualToString:v13];

        if (v14)
        {
          [v6 removeObjectAtIndex:v8];
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9[507] sharedConfig]);
          if (!v15) {
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9[507] sharedConfig]);
          }
          id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v18 = objc_opt_class(self, v17);
            id v19 = v4;
            id v20 = self;
            unsigned __int8 v21 = v9;
            uint64_t v22 = v10;
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v11 logKey]);
            *(_DWORD *)buf = 138543874;
            uint64_t v29 = v18;
            __int16 v30 = 2114;
            uint64_t v31 = v23;
            __int16 v32 = 2114;
            uint64_t v33 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Clearing message: %{public}@",  buf,  0x20u);

            id v10 = v22;
            id v9 = v21;
            self = v20;
            id v4 = v19;
            id v6 = v25;
          }

          v26[0] = v10;
          v26[1] = 3221225472LL;
          v26[2] = sub_100015E94;
          v26[3] = &unk_1000D62E0;
          id v27 = v11;
          -[AMSDDeviceMessengerService _enumerateDelegatesWithBlock:](self, "_enumerateDelegatesWithBlock:", v26);
        }
      }

      while (v8 > 0);
    }

    if ([v6 count] != v24) {
      -[AMSDDeviceMessengerService _overwriteSavedMessages:](self, "_overwriteSavedMessages:", v6);
    }
  }
}

- (id)_getSavedMessages
{
  v2 = self;
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[AMSDDeviceMessengerService dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDDeviceMessengerService cachedMessages](v2, "cachedMessages"));
  if (v4) {
    return (id)objc_claimAutoreleasedReturnValue(-[AMSDDeviceMessengerService cachedMessages](v2, "cachedMessages"));
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDDeviceMessengerService _saveLocation](v2, "_saveLocation"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
  unsigned int v9 = [v6 fileExistsAtPath:v8];

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDDeviceMessengerService _saveLocation](v2, "_saveLocation"));
    id v45 = 0LL;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v10,  0LL,  &v45));
    id v12 = v45;

    if (!v12 && v11)
    {
      id v44 = 0LL;
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v11,  0LL,  &v44));
      id v12 = v44;
      if (!v12 && v13)
      {
        __int16 v36 = v11;
        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDDeviceMessengerService service](v2, "service"));
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "amsa_allDevices"));

        __int128 v37 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        id obj = v13;
        id v16 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
        if (v16)
        {
          id v17 = v16;
          char v39 = 0;
          uint64_t v18 = *(void *)v41;
          do
          {
            for (uint64_t i = 0LL; i != v17; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v41 != v18) {
                objc_enumerationMutation(obj);
              }
              id v20 = [[AMSXDMessage alloc] initWithJSONDictionary:*(void *)(*((void *)&v40 + 1) + 8 * (void)i)];
              unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 origin]);
              uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 identifier]);
              uint64_t v23 = v2;
              id v24 = -[AMSDDeviceMessengerService _determineDeviceTypeFromDeviceID:devices:]( v2,  "_determineDeviceTypeFromDeviceID:devices:",  v22,  v15);
              id v25 = (void *)objc_claimAutoreleasedReturnValue([v20 origin]);
              [v25 setType:v24];

              else {
                char v39 = 1;
              }
              v2 = v23;
            }

            id v17 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
          }

          while (v17);
        }

        else
        {
          char v39 = 0;
        }

        if ((v39 & 1) != 0)
        {
          __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
          id v11 = v36;
          if (!v32) {
            __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
          }
          uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue([v32 OSLogObject]);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            uint64_t v35 = objc_opt_class(v2, v34);
            *(_DWORD *)buf = 138543362;
            uint64_t v47 = v35;
            _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "%{public}@: Found invalid messages",  buf,  0xCu);
          }

          __int16 v30 = v37;
          -[AMSDDeviceMessengerService _overwriteSavedMessages:](v2, "_overwriteSavedMessages:", v37);
          id v12 = 0LL;
        }

        else
        {
          id v12 = 0LL;
          id v11 = v36;
          __int16 v30 = v37;
        }

        goto LABEL_29;
      }
    }

    if (v12)
    {
      __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      if (!v26) {
        __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v26 OSLogObject]);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = objc_opt_class(v2, v28);
        *(_DWORD *)buf = 138543618;
        uint64_t v47 = v29;
        __int16 v48 = 2114;
        id v49 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%{public}@: Failed to fetch saved messages. Error: %{public}@",  buf,  0x16u);
      }
    }
  }

  else
  {
    id v11 = 0LL;
    id v12 = 0LL;
  }

  __int16 v30 = 0LL;
LABEL_29:
  if (-[NSMutableArray count](v30, "count")) {
    -[AMSDDeviceMessengerService setCachedMessages:](v2, "setCachedMessages:", v30);
  }
  uint64_t v31 = v30;

  return v31;
}

- (void)_overwriteSavedMessages:(id)a3
{
  id v4 = a3;
  __int128 v42 = self;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[AMSDDeviceMessengerService dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfigOversize](&OBJC_CLASS___AMSLogConfig, "sharedConfigOversize"));
  if (!v6) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v51 = objc_opt_class(v42, v8);
    __int16 v52 = 2114;
    id v53 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%{public}@: Saving messages: %{public}@",  buf,  0x16u);
  }

  __int128 v41 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id v9 = v4;
  id v10 = [v9 countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v47;
    do
    {
      for (uint64_t i = 0LL; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v47 != v12) {
          objc_enumerationMutation(v9);
        }
        unsigned int v14 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
        if (([v14 isReply] & 1) == 0)
        {
          if ([v14 isExpired])
          {
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
            if (!v15) {
              uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
            }
            id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v18 = objc_opt_class(v42, v17);
              id v19 = (void *)objc_claimAutoreleasedReturnValue([v14 logKey]);
              *(_DWORD *)buf = 138543874;
              uint64_t v51 = v18;
              __int16 v52 = 2114;
              id v53 = v19;
              __int16 v54 = 2114;
              v55 = v14;
              _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Removing expired message: %{public}@",  buf,  0x20u);
            }

            goto LABEL_22;
          }

          id v20 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
          id v21 = [v20 length];

          if (v21)
          {
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 JSONDictionary]);
            -[NSMutableArray addObject:](v41, "addObject:", v15);
          }

          else
          {
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
            if (!v15) {
              uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
            }
            id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              uint64_t v23 = objc_opt_class(v42, v22);
              id v24 = (void *)objc_claimAutoreleasedReturnValue([v14 logKey]);
              *(_DWORD *)buf = 138543874;
              uint64_t v51 = v23;
              __int16 v52 = 2114;
              id v53 = v24;
              __int16 v54 = 2114;
              v55 = v14;
              _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Removing message with empty identifier: %{public}@",  buf,  0x20u);
            }

- (void)_saveMessage:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[AMSDDeviceMessengerService dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v5);

  if (!v4)
  {
    uint64_t v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    if (!v12) {
      uint64_t v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSMutableArray OSLogObject](v12, "OSLogObject"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v33 = objc_opt_class(self, v14);
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@: No message to save", buf, 0xCu);
    }

    goto LABEL_13;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  id v7 = [v6 length];

  if (!v7)
  {
    uint64_t v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    if (!v12) {
      uint64_t v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSMutableArray OSLogObject](v12, "OSLogObject"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = objc_opt_class(self, v15);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v4 logKey]);
      *(_DWORD *)buf = 138543874;
      uint64_t v33 = v16;
      __int16 v34 = 2114;
      uint64_t v35 = v17;
      __int16 v36 = 2114;
      id v37 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Message is missing an identifier: %{public}@",  buf,  0x20u);
    }

- (id)_saveLocation
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL ams_cachesDirectory](&OBJC_CLASS___NSURL, "ams_cachesDirectory"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLByAppendingPathComponent:@"AMSXDMessages.json"]);

  return v3;
}

- (NSArray)cachedMessages
{
  return self->_cachedMessages;
}

- (void)setCachedMessages:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (NSMutableArray)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
}

- (NSMutableDictionary)outgoingMessageReplyHandlers
{
  return self->_outgoingMessageReplyHandlers;
}

- (IDSService)service
{
  return self->_service;
}

- (void).cxx_destruct
{
}

@end