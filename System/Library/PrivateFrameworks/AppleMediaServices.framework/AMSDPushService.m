@interface AMSDPushService
+ (AMSDPushService)sharedService;
+ (BOOL)isConnectionEntitled:(id)a3;
- (AMSDPushService)init;
- (AMSPushHandler)pushHandler;
- (APSConnection)productionConnection;
- (MGNotificationTokenStruct)deviceNameChangedToken;
- (NSArray)classConsumers;
- (NSArray)instanceConsumers;
- (NSMutableDictionary)connections;
- (NSMutableDictionary)pushTokens;
- (OS_dispatch_queue)connectionQueue;
- (OS_dispatch_queue)registerTaskQueue;
- (id)_bagForAccount:(id)a3;
- (id)_connectionForEnvironment:(id)a3;
- (id)_establishConnectionsIfNeeded;
- (id)_postPushTokensIfNeeded;
- (id)_postPushTokensWithOptions:(int64_t)a3;
- (id)_productionPushAccounts;
- (id)_pushEnvironmentForAccount:(id)a3;
- (id)_pushEnvironmentFromBag:(id)a3;
- (id)_pushTokenForEnvironment:(id)a3;
- (id)_registerAccounts:(id)a3 withOptions:(int64_t)a4;
- (id)_sandboxPushAccounts;
- (id)_startConnectionWithEnvironment:(id)a3;
- (id)forceRegisterAccount:(id)a3;
- (os_unfair_lock_s)connectionLock;
- (void)_bagChanged;
- (void)_deviceNameChanged;
- (void)_establishConnectionsAndPostPushTokens;
- (void)_shutDownConnection:(id)a3 forEnvironment:(id)a4;
- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connectionDidReconnect:(id)a3;
- (void)dealloc;
- (void)registerAllTokens;
- (void)registerTokensIfNeeded;
- (void)setClassConsumers:(id)a3;
- (void)setDeviceNameChangedToken:(MGNotificationTokenStruct *)a3;
- (void)setInstanceConsumers:(id)a3;
- (void)setProductionConnection:(id)a3;
- (void)setRegisterTaskQueue:(id)a3;
@end

@implementation AMSDPushService

- (AMSDPushService)init
{
  v45.receiver = self;
  v45.super_class = (Class)&OBJC_CLASS___AMSDPushService;
  v2 = -[AMSDPushService init](&v45, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
    if (!v3) {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = objc_opt_class(v2, v5);
      uint64_t v8 = AMSLogKey(v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      *(_DWORD *)buf = 138543618;
      uint64_t v50 = v6;
      __int16 v51 = 2114;
      v52 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Starting Service",  buf,  0x16u);
    }

    dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.AMSDPushService", v11);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v12;

    dispatch_queue_attr_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v14);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.AMSDPushService.registerTask", v15);
    registerTaskQueue = v2->_registerTaskQueue;
    v2->_registerTaskQueue = (OS_dispatch_queue *)v16;

    v2->_connectionLock._os_unfair_lock_opaque = 0;
    v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    connections = v2->_connections;
    v2->_connections = v18;

    v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    pushTokens = v2->_pushTokens;
    v2->_pushTokens = v20;

    classConsumers = v2->_classConsumers;
    v2->_classConsumers = (NSArray *)&__NSArray0__struct;

    if (+[AMSUnitTests isRunningUnitTests](&OBJC_CLASS___AMSUnitTests, "isRunningUnitTests"))
    {
      instanceConsumers = v2->_instanceConsumers;
      v2->_instanceConsumers = (NSArray *)&__NSArray0__struct;
    }

    else
    {
      uint64_t v24 = objc_claimAutoreleasedReturnValue(+[AMSDMultiUserController sharedController](&OBJC_CLASS___AMSDMultiUserController, "sharedController"));
      instanceConsumers = (void *)v24;
      if (v24)
      {
        uint64_t v48 = v24;
        uint64_t v25 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v48, 1LL));
        v26 = v2->_instanceConsumers;
        v2->_instanceConsumers = (NSArray *)v25;
      }

      else
      {
        v26 = v2->_instanceConsumers;
        v2->_instanceConsumers = (NSArray *)&__NSArray0__struct;
      }
    }

    v47[0] = @"26";
    v47[1] = AMSPushActionTypeAlertNotification;
    v47[2] = AMSPushActionTypeDismissQRDialog;
    v47[3] = AMSPushActionTypeEngagement;
    v47[4] = AMSPushActionTypeRichNotification;
    v47[5] = AMSPushActionTypeFetchDataCache;
    v47[6] = AMSPushActionTypeFollowUp;
    v47[7] = @"24";
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v47, 8LL));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v27));

    id v29 = objc_alloc(&OBJC_CLASS___AMSPushConfiguration);
    id v30 = [v28 copy];
    id v31 = [v29 initWithEnabledActionTypes:v30];

    v32 = objc_alloc(&OBJC_CLASS___AMSDPushHandler);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDBag defaultBag](&OBJC_CLASS___AMSDBag, "defaultBag"));
    v34 = -[AMSDPushHandler initWithConfiguration:bag:](v32, "initWithConfiguration:bag:", v31, v33);
    pushHandler = v2->_pushHandler;
    v2->_pushHandler = (AMSPushHandler *)v34;

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v36 addObserver:v2 selector:"_bagChanged" name:AMSBagChangedNotification object:0];

    objc_initWeak((id *)buf, v2);
    v46 = @"UserAssignedDeviceName";
    v37 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v46, 1LL);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_1000370D0;
    v43[3] = &unk_1000D7798;
    objc_copyWeak(&v44, (id *)buf);
    v2->_deviceNameChangedToken = (MGNotificationTokenStruct *)MGRegisterForUpdates(v37, 0LL, 0LL, v43);
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDBag defaultBag](&OBJC_CLASS___AMSDBag, "defaultBag"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDPushService _pushEnvironmentFromBag:](v2, "_pushEnvironmentFromBag:", v38));

    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_1000370FC;
    v41[3] = &unk_1000D77C0;
    v42 = v2;
    [v39 addSuccessBlock:v41];

    objc_destroyWeak(&v44);
    objc_destroyWeak((id *)buf);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AMSDPushService;
  -[AMSDPushService dealloc](&v3, "dealloc");
}

+ (AMSDPushService)sharedService
{
  if (qword_1000F20F8 != -1) {
    dispatch_once(&qword_1000F20F8, &stru_1000D77E0);
  }
  return (AMSDPushService *)(id)qword_1000F2100;
}

- (id)forceRegisterAccount:(id)a3
{
  if (a3)
  {
    id v12 = a3;
    id v4 = a3;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[AMSDPushService _registerAccounts:withOptions:]( self,  "_registerAccounts:withOptions:",  v5,  1LL,  v12));
    return v6;
  }

  else
  {
    id v8 = 0LL;
    uint64_t v9 = AMSError(107LL, @"No account provided", 0LL, 0LL);
    dispatch_queue_attr_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithError:](&OBJC_CLASS___AMSPromise, "promiseWithError:", v10));

    return v11;
  }

+ (BOOL)isConnectionEntitled:(id)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([a3 valueForEntitlement:@"com.apple.private.applemediaservices"]);
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

- (void)registerAllTokens
{
  id v3 = (id)AMSSetLogKey(0LL);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v4) {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class(self, v6);
    uint64_t v9 = AMSLogKey(v7, v8);
    dispatch_queue_attr_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = v7;
    __int16 v27 = 2114;
    v28 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Received request to register all tokens",  buf,  0x16u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDPushService _establishConnectionsIfNeeded](self, "_establishConnectionsIfNeeded"));
  id v24 = 0LL;
  unsigned __int8 v12 = [v11 resultWithError:&v24];
  id v13 = v24;

  if ((v12 & 1) != 0)
  {
    dispatch_queue_attr_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDPushService _postPushTokensWithOptions:](self, "_postPushTokensWithOptions:", 1LL));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1000375A0;
    v23[3] = &unk_1000D7808;
    v23[4] = self;
    [v14 addFinishBlock:v23];
  }

  else
  {
    dispatch_queue_attr_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
    if (!v14) {
      dispatch_queue_attr_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = objc_opt_class(self, v16);
      uint64_t v19 = AMSLogKey(v17, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      uint64_t v21 = AMSLogableError(v13);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      *(_DWORD *)buf = 138543874;
      uint64_t v26 = v17;
      __int16 v27 = 2114;
      v28 = v20;
      __int16 v29 = 2114;
      id v30 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to establish connections. error = %{public}@",  buf,  0x20u);
    }
  }
}

- (void)registerTokensIfNeeded
{
  id v3 = (id)AMSSetLogKey(0LL);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v4) {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class(self, v6);
    uint64_t v9 = AMSLogKey(v7, v8);
    dispatch_queue_attr_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    int v11 = 138543618;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    dispatch_queue_attr_t v14 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Received request to register tokens",  (uint8_t *)&v11,  0x16u);
  }

  -[AMSDPushService _establishConnectionsAndPostPushTokens](self, "_establishConnectionsAndPostPushTokens");
  -[AMSDPushService _updateDeviceAccountPrivacyIfNeeded](self, "_updateDeviceAccountPrivacyIfNeeded");
}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (id)AMSSetLogKey(0LL);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v7) {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class(self, v9);
    uint64_t v12 = AMSLogKey(v10, v11);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    dispatch_queue_attr_t v14 = (void *)v13;
    v15 = @"false";
    int v17 = 138543874;
    uint64_t v18 = v10;
    __int16 v19 = 2114;
    if (v4) {
      v15 = @"true";
    }
    uint64_t v20 = v13;
    __int16 v21 = 2114;
    v22 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] APS is connected: %{public}@",  (uint8_t *)&v17,  0x20u);
  }

  if (v4)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDPushService _postPushTokensIfNeeded](self, "_postPushTokensIfNeeded"));
    [v16 resultWithError:0];
  }

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5 = a4;
  id v6 = (id)AMSSetLogKey(0LL);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v7) {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class(self, v9);
    uint64_t v12 = AMSLogKey(v10, v11);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    *(_DWORD *)buf = 138543618;
    uint64_t v46 = v10;
    __int16 v47 = 2114;
    uint64_t v48 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Received message",  buf,  0x16u);
  }

  dispatch_queue_attr_t v14 = (void *)objc_claimAutoreleasedReturnValue([v5 topic]);
  unsigned int v15 = [v14 isEqualToString:@"com.apple.amsaccountsd"];

  if (v15)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
    int v17 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDPushService pushHandler](self, "pushHandler"));
    unsigned int v18 = [v17 shouldHandleNotification:v16];

    if (v18)
    {
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDPushService pushHandler](self, "pushHandler"));
      [v19 handleNotification:v16];
    }

    else
    {
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsDaemonConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsDaemonConfig"));
      if (!v19) {
        __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      __int16 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 OSLogObject]);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v31 = objc_opt_class(self, v30);
        uint64_t v33 = AMSLogKey(v31, v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        *(_DWORD *)buf = 138543618;
        uint64_t v46 = v31;
        __int16 v47 = 2114;
        uint64_t v48 = v34;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Message not handled and dropped.",  buf,  0x16u);
      }
    }
  }

  else
  {
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDPushService classConsumers](self, "classConsumers"));
    id v21 = [v20 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v40;
      do
      {
        for (i = 0LL; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v40 != v23) {
            objc_enumerationMutation(v20);
          }
          [*(id *)(*((void *)&v39 + 1) + 8 * (void)i) handlePushNotification:v5];
        }

        id v22 = [v20 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }

      while (v22);
    }

    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDPushService instanceConsumers](self, "instanceConsumers", 0LL));
    id v25 = [v16 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v36;
      do
      {
        for (j = 0LL; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v36 != v27) {
            objc_enumerationMutation(v16);
          }
          [*(id *)(*((void *)&v35 + 1) + 8 * (void)j) handlePushNotification:v5];
        }

        id v26 = [v16 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }

      while (v26);
    }
  }
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (id)AMSSetLogKey(0LL);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v9) {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_opt_class(self, v11);
    uint64_t v14 = AMSLogKey(v12, v13);
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 base64EncodedStringWithOptions:0]);
    uint64_t v17 = AMSHashIfNeeded(v16);
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    *(_DWORD *)buf = 138543874;
    uint64_t v45 = v12;
    __int16 v46 = 2114;
    __int16 v47 = v15;
    __int16 v48 = 2114;
    v49 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Received token: %{public}@",  buf,  0x20u);
  }

  os_unfair_lock_assert_not_owner(&self->_connectionLock);
  os_unfair_lock_lock_with_options(&self->_connectionLock, 0x10000LL);
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_connections, "allKeys"));
  id v20 = [v19 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v40;
    do
    {
      for (i = 0LL; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v40 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v39 + 1) + 8LL * (void)i);
        id v25 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connections, "objectForKeyedSubscript:", v24));

        if (v25 == v6) {
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_pushTokens,  "setObject:forKeyedSubscript:",  v7,  v24);
        }
      }

      id v21 = [v19 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }

    while (v21);
  }

  os_unfair_lock_assert_owner(&self->_connectionLock);
  os_unfair_lock_unlock(&self->_connectionLock);
  if ((+[AMSUnitTests isRunningUnitTests](&OBJC_CLASS___AMSUnitTests, "isRunningUnitTests") & 1) == 0)
  {
    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDPushService _postPushTokensIfNeeded](self, "_postPushTokensIfNeeded"));
    id v38 = 0LL;
    unsigned __int8 v27 = [v26 resultWithError:&v38];
    id v28 = v38;

    if ((v27 & 1) == 0)
    {
      __int16 v29 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsDaemonConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsDaemonConfig"));
      if (!v29) {
        __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 OSLogObject]);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        uint64_t v32 = objc_opt_class(self, v31);
        uint64_t v34 = AMSLogKey(v32, v33);
        __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
        uint64_t v36 = AMSLogableError(v28);
        __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
        *(_DWORD *)buf = 138543874;
        uint64_t v45 = v32;
        __int16 v46 = 2114;
        __int16 v47 = v35;
        __int16 v48 = 2114;
        v49 = v37;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to post push tokens. %{public}@",  buf,  0x20u);
      }
    }
  }
}

- (void)connectionDidReconnect:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsDaemonConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsDaemonConfig",  a3));
  if (!v4) {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class(self, v6);
    uint64_t v9 = AMSLogKey(v7, v8);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    int v12 = 138543618;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    unsigned int v15 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] APS reconnected.",  (uint8_t *)&v12,  0x16u);
  }

  id v11 = -[AMSDPushService _postPushTokensIfNeeded](self, "_postPushTokensIfNeeded");
}

- (void)_bagChanged
{
  id v3 = (id)AMSSetLogKey(0LL);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v4) {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class(self, v6);
    uint64_t v9 = AMSLogKey(v7, v8);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    int v11 = 138543618;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    __int16 v14 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Bag changed",  (uint8_t *)&v11,  0x16u);
  }

  -[AMSDPushService _establishConnectionsAndPostPushTokens](self, "_establishConnectionsAndPostPushTokens");
}

- (void)_deviceNameChanged
{
  id v3 = (id)AMSSetLogKey(0LL);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v4) {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class(self, v6);
    uint64_t v9 = AMSLogKey(v7, v8);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)buf = 138543618;
    uint64_t v25 = v7;
    __int16 v26 = 2114;
    unsigned __int8 v27 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Device name changed",  buf,  0x16u);
  }

  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDPushService _postPushTokensIfNeeded](self, "_postPushTokensIfNeeded"));
  id v23 = 0LL;
  unsigned __int8 v12 = [v11 resultWithError:&v23];
  id v13 = v23;

  if ((v12 & 1) == 0)
  {
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
    if (!v14) {
      __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = objc_opt_class(self, v16);
      uint64_t v19 = AMSLogKey(v17, v18);
      id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      uint64_t v21 = AMSLogableError(v13);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      *(_DWORD *)buf = 138543874;
      uint64_t v25 = v17;
      __int16 v26 = 2114;
      unsigned __int8 v27 = v20;
      __int16 v28 = 2114;
      __int16 v29 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to post push tokens. %{public}@",  buf,  0x20u);
    }
  }
}

- (id)_productionPushAccounts
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", AMSAccountMediaTypeProduction, 0LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ams_iTunesAccountsForMediaTypes:", v2));

  return v4;
}

- (id)_sandboxPushAccounts
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  AMSAccountMediaTypeAppStoreBeta,  AMSAccountMediaTypeAppStoreSandbox,  0LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ams_iTunesAccountsForMediaTypes:", v2));

  return v4;
}

- (id)_bagForAccount:(id)a3
{
  if (objc_msgSend(a3, "ams_isSandboxAccount")) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDBag bagForMediaType:]( &OBJC_CLASS___AMSDBag,  "bagForMediaType:",  AMSAccountMediaTypeAppStoreSandbox));
  }
  else {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDBag defaultBag](&OBJC_CLASS___AMSDBag, "defaultBag"));
  }
  return v3;
}

- (id)_connectionForEnvironment:(id)a3
{
  p_connectionLock = &self->_connectionLock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_connectionLock);
  os_unfair_lock_lock_with_options(p_connectionLock, 0x10000LL);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connections, "objectForKeyedSubscript:", v5));

  os_unfair_lock_assert_owner(p_connectionLock);
  os_unfair_lock_unlock(p_connectionLock);
  return v6;
}

- (void)_establishConnectionsAndPostPushTokens
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDPushService _establishConnectionsIfNeeded](self, "_establishConnectionsIfNeeded"));
  id v15 = 0LL;
  unsigned __int8 v4 = [v3 resultWithError:&v15];
  id v5 = v15;

  if ((v4 & 1) != 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDPushService _postPushTokensIfNeeded](self, "_postPushTokensIfNeeded"));
    [v6 resultWithError:0];
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
    if (!v6) {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class(self, v8);
      uint64_t v11 = AMSLogKey(v9, v10);
      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      uint64_t v13 = AMSLogableError(v5);
      __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      *(_DWORD *)buf = 138543874;
      uint64_t v17 = v9;
      __int16 v18 = 2114;
      uint64_t v19 = v12;
      __int16 v20 = 2114;
      uint64_t v21 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to establish connections. error = %{public}@",  buf,  0x20u);
    }
  }
}

- (id)_establishConnectionsIfNeeded
{
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDPushService _productionPushAccounts](self, "_productionPushAccounts"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDPushService _sandboxPushAccounts](self, "_sandboxPushAccounts"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v14 thenWithBlock:&stru_1000D7828]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 thenWithBlock:&stru_1000D7848]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100038968;
  v17[3] = &unk_1000D6DF8;
  v17[4] = self;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 thenWithBlock:v17]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100038A6C;
  v16[3] = &unk_1000D6DF8;
  v16[4] = self;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 thenWithBlock:v16]);
  v18[0] = v7;
  v18[1] = v6;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithAll:](&OBJC_CLASS___AMSPromise, "promiseWithAll:", v8));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 thenWithBlock:&stru_1000D78C8]);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100038D04;
  v15[3] = &unk_1000D5F28;
  v15[4] = self;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 thenWithBlock:v15]);
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 binaryPromiseAdapter]);

  return v12;
}

- (id)_pushEnvironmentForAccount:(id)a3
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDPushService _bagForAccount:](self, "_bagForAccount:", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDPushService _pushEnvironmentFromBag:](self, "_pushEnvironmentFromBag:", v4));

  return v5;
}

- (id)_pushEnvironmentFromBag:(id)a3
{
  id v4 = a3;
  id v5 = +[AMSDefaults pushEnvironment](&OBJC_CLASS___AMSDefaults, "pushEnvironment");
  if (v5 == (id)1)
  {
    uint64_t v6 = (id *)&APSEnvironmentProduction;
  }

  else
  {
    if (v5 != (id)2) {
      goto LABEL_7;
    }
    uint64_t v6 = (id *)&APSEnvironmentDevelopment;
  }

  id v7 = *v6;
  if (v7)
  {
    id v8 = v7;
LABEL_9:
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithResult:](&OBJC_CLASS___AMSPromise, "promiseWithResult:", v8));
    goto LABEL_10;
  }

- (id)_pushTokenForEnvironment:(id)a3
{
  p_connectionLock = &self->_connectionLock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_connectionLock);
  os_unfair_lock_lock_with_options(p_connectionLock, 0x10000LL);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_pushTokens, "objectForKeyedSubscript:", v5));

  os_unfair_lock_assert_owner(p_connectionLock);
  os_unfair_lock_unlock(p_connectionLock);
  return v6;
}

- (id)_postPushTokensIfNeeded
{
  return -[AMSDPushService _postPushTokensWithOptions:](self, "_postPushTokensWithOptions:", 0LL);
}

- (id)_postPushTokensWithOptions:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v5) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = objc_opt_class(self, v7);
    uint64_t v10 = AMSLogKey(v8, v9);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 138543618;
    uint64_t v33 = v8;
    __int16 v34 = 2114;
    __int128 v35 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%{public}@: [%{public}@] Received request to post push token if needed.",  buf,  0x16u);
  }

  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDPushService _productionPushAccounts](self, "_productionPushAccounts"));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_1000396C8;
  v29[3] = &unk_1000D7958;
  uint64_t v30 = &stru_1000D7930;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 thenWithBlock:v29]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDPushService _sandboxPushAccounts](self, "_sandboxPushAccounts"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100039718;
  v27[3] = &unk_1000D7958;
  __int16 v28 = &stru_1000D7930;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 thenWithBlock:v27]);

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ams_fetchLocaliTunesAccount"));
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 thenWithBlock:&stru_1000D7978]);

  v31[0] = v13;
  v31[1] = v15;
  v31[2] = v18;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 3LL));
  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithAll:](&OBJC_CLASS___AMSPromise, "promiseWithAll:", v19));
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 thenWithBlock:&stru_1000D7998]);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000398D8;
  v26[3] = &unk_1000D79C0;
  v26[4] = self;
  v26[5] = a3;
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 thenWithBlock:v26]);

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000398E8;
  v25[3] = &unk_1000D5AD8;
  v25[4] = self;
  [v22 addErrorBlock:v25];
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 binaryPromiseAdapter]);

  return v23;
}

- (id)_registerAccounts:(id)a3 withOptions:(int64_t)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    void v18[2] = sub_100039BC0;
    v18[3] = &unk_1000D7A38;
    v18[4] = self;
    v18[5] = a4;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_mapWithTransform:", v18));
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithAll:](&OBJC_CLASS___AMSPromise, "promiseWithAll:", v7));
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
    if (!v9) {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = objc_opt_class(self, v11);
      uint64_t v14 = AMSLogKey(v12, v13);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v12;
      __int16 v21 = 2114;
      uint64_t v22 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%{public}@: [%{public}@] No accounts to register.",  buf,  0x16u);
    }

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBinaryPromise promiseWithSuccess](&OBJC_CLASS___AMSBinaryPromise, "promiseWithSuccess"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 promiseAdapter]);
  }

  uint64_t v16 = (void *)v8;

  return v16;
}

- (void)_shutDownConnection:(id)a3 forEnvironment:(id)a4
{
  p_connectionLock = &self->_connectionLock;
  id v8 = a4;
  id v7 = a3;
  os_unfair_lock_assert_owner(p_connectionLock);
  [v7 shutdown];

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_connections, "setObject:forKeyedSubscript:", 0LL, v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pushTokens, "setObject:forKeyedSubscript:", 0LL, v8);
}

- (id)_startConnectionWithEnvironment:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_connectionLock);
  os_unfair_lock_lock(&self->_connectionLock);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connections, "objectForKeyedSubscript:", v4));
  if (v5)
  {
    os_unfair_lock_assert_owner(&self->_connectionLock);
    os_unfair_lock_unlock(&self->_connectionLock);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBinaryPromise promiseWithSuccess](&OBJC_CLASS___AMSBinaryPromise, "promiseWithSuccess"));
  }

  else if ((+[APSConnection isValidEnvironment:](&OBJC_CLASS___APSConnection, "isValidEnvironment:", v4) & 1) != 0)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[NSMutableArray addObject:](v7, "addObject:", @"com.apple.amsaccountsd");
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDPushService classConsumers](self, "classConsumers"));
    id v9 = [v8 countByEnumeratingWithState:&v48 objects:v61 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v49;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v49 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)i);
          if ([v13 shouldEnablePushTopic])
          {
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 pushTopic]);
            -[NSMutableArray addObject:](v7, "addObject:", v14);
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v48 objects:v61 count:16];
      }

      while (v10);
    }

    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDPushService instanceConsumers](self, "instanceConsumers"));
    id v16 = [v15 countByEnumeratingWithState:&v44 objects:v60 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v45;
      do
      {
        for (j = 0LL; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v45 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)j);
          if ([v20 shouldEnablePushTopic])
          {
            __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 pushTopic]);
            -[NSMutableArray addObject:](v7, "addObject:", v21);
          }
        }

        id v17 = [v15 countByEnumeratingWithState:&v44 objects:v60 count:16];
      }

      while (v17);
    }

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
    if (!v22) {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 OSLogObject]);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = objc_opt_class(self, v24);
      uint64_t v27 = AMSLogKey(v25, v26);
      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      *(_DWORD *)buf = 138544130;
      uint64_t v53 = v25;
      __int16 v54 = 2114;
      v55 = v28;
      __int16 v56 = 2114;
      id v57 = v4;
      __int16 v58 = 2114;
      v59 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Starting APS connection. (environment: %{public}@; topics: %{public}@)",
        buf,
        0x2Au);
    }

    __int16 v29 = objc_alloc(&OBJC_CLASS___APSConnection);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDPushService connectionQueue](self, "connectionQueue"));
    uint64_t v31 = -[APSConnection initWithEnvironmentName:namedDelegatePort:queue:]( v29,  "initWithEnvironmentName:namedDelegatePort:queue:",  v4,  @"com.apple.aps.amsaccountsd",  v30);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_connections, "setObject:forKeyedSubscript:", v31, v4);
    os_unfair_lock_assert_owner(&self->_connectionLock);
    os_unfair_lock_unlock(&self->_connectionLock);
    -[APSConnection setDelegate:](v31, "setDelegate:", self);
    -[APSConnection _setEnabledTopics:](v31, "_setEnabledTopics:", v7);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBinaryPromise promiseWithSuccess](&OBJC_CLASS___AMSBinaryPromise, "promiseWithSuccess"));
  }

  else
  {
    os_unfair_lock_assert_owner(&self->_connectionLock);
    os_unfair_lock_unlock(&self->_connectionLock);
    uint64_t v32 = AMSErrorWithFormat(2LL, @"Push Error", @"Environment is invalid: %@");
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    __int16 v34 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsDaemonConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsDaemonConfig",  v4));
    if (!v34) {
      __int16 v34 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    __int128 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue([v34 OSLogObject]);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = objc_opt_class(self, v36);
      uint64_t v39 = AMSLogKey(v37, v38);
      __int128 v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
      uint64_t v41 = AMSLogableError(v33);
      __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
      *(_DWORD *)buf = 138543874;
      uint64_t v53 = v37;
      __int16 v54 = 2114;
      v55 = v40;
      __int16 v56 = 2114;
      id v57 = v42;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to start APS connection. %{public}@",  buf,  0x20u);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBinaryPromise promiseWithError:](&OBJC_CLASS___AMSBinaryPromise, "promiseWithError:", v33));
  }

  return v6;
}

- (NSArray)classConsumers
{
  return self->_classConsumers;
}

- (void)setClassConsumers:(id)a3
{
}

- (os_unfair_lock_s)connectionLock
{
  return self->_connectionLock;
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (NSMutableDictionary)connections
{
  return self->_connections;
}

- (NSArray)instanceConsumers
{
  return self->_instanceConsumers;
}

- (void)setInstanceConsumers:(id)a3
{
}

- (APSConnection)productionConnection
{
  return self->_productionConnection;
}

- (void)setProductionConnection:(id)a3
{
}

- (AMSPushHandler)pushHandler
{
  return self->_pushHandler;
}

- (NSMutableDictionary)pushTokens
{
  return self->_pushTokens;
}

- (OS_dispatch_queue)registerTaskQueue
{
  return self->_registerTaskQueue;
}

- (void)setRegisterTaskQueue:(id)a3
{
}

- (MGNotificationTokenStruct)deviceNameChangedToken
{
  return self->_deviceNameChangedToken;
}

- (void)setDeviceNameChangedToken:(MGNotificationTokenStruct *)a3
{
  self->_deviceNameChangedToken = a3;
}

- (void).cxx_destruct
{
}

@end