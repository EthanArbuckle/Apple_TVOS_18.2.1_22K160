@interface AMSDCloudKitDataSource
- (AMSDCloudDataManagerDataSourceDelegate)delegate;
- (AMSDCloudKitDataSource)init;
- (NSString)pushNotificationTopic;
- (id)containerWithContainerIdentifier:(id)a3 options:(id)a4;
- (void)_accountChanged:(id)a3;
- (void)dealloc;
- (void)handlePushNotification:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation AMSDCloudKitDataSource

- (AMSDCloudKitDataSource)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AMSDCloudKitDataSource;
  v2 = -[AMSDCloudKitDataSource init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 addObserver:v2 selector:"_accountChanged:" name:CKAccountChangedNotification object:0];
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AMSDCloudKitDataSource;
  -[AMSDCloudKitDataSource dealloc](&v4, "dealloc");
}

- (NSString)pushNotificationTopic
{
  return (NSString *)[@"com.apple.icloud-container." stringByAppendingString:@"com.apple.amsaccountsd"];
}

- (id)containerWithContainerIdentifier:(id)a3 options:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  if (v5)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___CKContainerOptions);
    objc_msgSend(v7, "setUseZoneWidePCS:", objc_msgSend(v5, "recordZoneEncryption"));
    id v8 = [[CKContainerID alloc] initWithContainerIdentifier:v6 environment:1];

    v9 = -[CKContainer initWithContainerID:options:]( objc_alloc(&OBJC_CLASS___CKContainer),  "initWithContainerID:options:",  v8,  v7);
  }

  else
  {
    id v7 = [[CKContainerID alloc] initWithContainerIdentifier:v6 environment:1];

    v9 = -[CKContainer initWithContainerID:](objc_alloc(&OBJC_CLASS___CKContainer), "initWithContainerID:", v7);
  }

  return v9;
}

- (void)handlePushNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
  if (!v5) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class(self, v7);
    uint64_t v9 = AMSLogKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    int v41 = 138543618;
    uint64_t v42 = v8;
    __int16 v43 = 2114;
    v44 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Handling a CloudKit push notification.",  (uint8_t *)&v41,  0x16u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[CKNotification notificationFromRemoteNotificationDictionary:]( &OBJC_CLASS___CKNotification,  "notificationFromRemoteNotificationDictionary:",  v11));

  if (v12)
  {
    id v13 = v12;
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___CKDatabaseNotification, v14);
    if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0) {
      id v16 = v13;
    }
    else {
      id v16 = 0LL;
    }

    uint64_t v25 = objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsMultiUserConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsMultiUserConfig"));
    v17 = (void *)v25;
    if (v16)
    {
      if (!v25) {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 OSLogObject]);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = objc_opt_class(self, v27);
        uint64_t v29 = AMSLogKey();
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        id v31 = [v16 databaseScope];
        int v41 = 138543874;
        uint64_t v42 = v28;
        __int16 v43 = 2114;
        v44 = v30;
        __int16 v45 = 2048;
        id v46 = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] A CloudKit database changed. databaseScope = %ld",  (uint8_t *)&v41,  0x20u);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDCloudKitDataSource delegate](self, "delegate"));
      [v17 cloudDataManagerDataSource:self didChangeWithType:1];
    }

    else
    {
      if (!v25) {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 OSLogObject]);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        uint64_t v34 = objc_opt_class(self, v33);
        uint64_t v35 = AMSLogKey();
        v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
        v38 = (objc_class *)objc_opt_class(v13, v37);
        v39 = NSStringFromClass(v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
        int v41 = 138543874;
        uint64_t v42 = v34;
        __int16 v43 = 2114;
        v44 = v36;
        __int16 v45 = 2114;
        id v46 = v40;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] We don't know how to handle the notification. notification.class = %{public}@",  (uint8_t *)&v41,  0x20u);
      }
    }
  }

  else
  {
    id v16 = (id)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
    if (!v16) {
      id v16 = (id)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = objc_opt_class(self, v18);
      uint64_t v20 = AMSLogKey();
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
      uint64_t v23 = AMSHashIfNeeded(v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      int v41 = 138543874;
      uint64_t v42 = v19;
      __int16 v43 = 2114;
      v44 = v21;
      __int16 v45 = 2114;
      id v46 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to create a CKNotification from the message's userInfo. userInfo = %{public}@",  (uint8_t *)&v41,  0x20u);
    }
  }
}

- (void)_accountChanged:(id)a3
{
  id v4 = (id)AMSSetLogKey(0LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
  if (!v5) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class(self, v7);
    uint64_t v9 = AMSLogKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    int v12 = 138543618;
    uint64_t v13 = v8;
    __int16 v14 = 2114;
    uint64_t v15 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] The CloudKit account changed.",  (uint8_t *)&v12,  0x16u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDCloudKitDataSource delegate](self, "delegate"));
  [v11 cloudDataManagerDataSource:self didChangeWithType:0];
}

- (AMSDCloudDataManagerDataSourceDelegate)delegate
{
  return (AMSDCloudDataManagerDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end