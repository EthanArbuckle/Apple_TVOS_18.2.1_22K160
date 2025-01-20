@interface AMSCloudKitDataSource
- (AMSCloudDataManagerDataSourceDelegate)delegate;
- (AMSCloudKitDataSource)init;
- (AMSCloudKitDataSource)initWithPushNotificationTopic:(id)a3;
- (BOOL)useSandboxEnvironment;
- (NSString)pushNotificationTopic;
- (id)containerWithContainerIdentifier:(id)a3 options:(id)a4;
- (void)_accountChanged:(id)a3;
- (void)_identityUpdated:(id)a3;
- (void)dealloc;
- (void)handlePushNotification:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPushNotificationTopic:(id)a3;
- (void)setUseSandboxEnvironment:(BOOL)a3;
@end

@implementation AMSCloudKitDataSource

- (AMSCloudKitDataSource)initWithPushNotificationTopic:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AMSCloudKitDataSource;
  v5 = -[AMSCloudKitDataSource init](&v9, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 addObserver:v5 selector:"_accountChanged:" name:CKAccountChangedNotification object:0];

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v7 addObserver:v5 selector:"_identityUpdated:" name:CKIdentityUpdateNotification object:0];

    -[AMSCloudKitDataSource setPushNotificationTopic:](v5, "setPushNotificationTopic:", v4);
  }

  return v5;
}

- (AMSCloudKitDataSource)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( [@"com.apple.icloud-container." stringByAppendingString:@"com.apple.amsaccountsd"]);
  id v4 = -[AMSCloudKitDataSource initWithPushNotificationTopic:](self, "initWithPushNotificationTopic:", v3);

  return v4;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AMSCloudKitDataSource;
  -[AMSCloudKitDataSource dealloc](&v4, "dealloc");
}

- (id)containerWithContainerIdentifier:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (-[AMSCloudKitDataSource useSandboxEnvironment](self, "useSandboxEnvironment")) {
    uint64_t v8 = 2LL;
  }
  else {
    uint64_t v8 = 1LL;
  }
  if (v6)
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___CKContainerOptions);
    objc_msgSend(v9, "setUseZoneWidePCS:", objc_msgSend(v6, "recordZoneEncryption"));
    id v10 = [[CKContainerID alloc] initWithContainerIdentifier:v7 environment:v8];

    v11 = -[CKContainer initWithContainerID:options:]( objc_alloc(&OBJC_CLASS___CKContainer),  "initWithContainerID:options:",  v10,  v9);
  }

  else
  {
    id v9 = [[CKContainerID alloc] initWithContainerIdentifier:v7 environment:v8];

    v11 = -[CKContainer initWithContainerID:](objc_alloc(&OBJC_CLASS___CKContainer), "initWithContainerID:", v9);
  }

  return v11;
}

- (void)handlePushNotification:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
  if (!v5) {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class(self);
    uint64_t v8 = AMSLogKey(v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v35 = 138543618;
    uint64_t v36 = v7;
    __int16 v37 = 2114;
    v38 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Handling a CloudKit push notification.",  (uint8_t *)&v35,  0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[CKNotification notificationFromRemoteNotificationDictionary:]( &OBJC_CLASS___CKNotification,  "notificationFromRemoteNotificationDictionary:",  v10));

  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___CKDatabaseNotification);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0) {
      id v14 = v12;
    }
    else {
      id v14 = 0LL;
    }

    uint64_t v22 = objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsMultiUserConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsMultiUserConfig"));
    v15 = (void *)v22;
    if (v14)
    {
      if (!v22) {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = objc_opt_class(self);
        uint64_t v25 = AMSLogKey(v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        id v27 = [v14 databaseScope];
        int v35 = 138543874;
        uint64_t v36 = v24;
        __int16 v37 = 2114;
        v38 = v26;
        __int16 v39 = 2048;
        id v40 = v27;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] A CloudKit database changed. databaseScope = %ld",  (uint8_t *)&v35,  0x20u);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[AMSCloudKitDataSource delegate](self, "delegate"));
      [v15 dataSourceDidChange:self];
    }

    else
    {
      if (!v22) {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = objc_opt_class(self);
        uint64_t v30 = AMSLogKey(v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        v32 = (objc_class *)objc_opt_class(v12);
        v33 = NSStringFromClass(v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        int v35 = 138543874;
        uint64_t v36 = v29;
        __int16 v37 = 2114;
        v38 = v31;
        __int16 v39 = 2114;
        id v40 = v34;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] We don't know how to handle the notification. notification.class = %{public}@",  (uint8_t *)&v35,  0x20u);
      }
    }
  }

  else
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
    if (!v14) {
      id v14 = (id)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = objc_opt_class(self);
      uint64_t v17 = AMSLogKey(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
      uint64_t v20 = AMSHashIfNeeded(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      int v35 = 138543874;
      uint64_t v36 = v16;
      __int16 v37 = 2114;
      v38 = v18;
      __int16 v39 = 2114;
      id v40 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v15,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to create a CKNotification from the message's userInfo. userInfo = %{public}@",  (uint8_t *)&v35,  0x20u);
    }
  }
}

- (void)_accountChanged:(id)a3
{
  id v4 = (id)AMSSetLogKey(0LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
  if (!v5) {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class(self);
    uint64_t v8 = AMSLogKey(v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v14 = 138543618;
    uint64_t v15 = v7;
    __int16 v16 = 2114;
    uint64_t v17 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] The CloudKit account changed.",  (uint8_t *)&v14,  0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[AMSCloudKitDataSource delegate](self, "delegate"));
  char v11 = objc_opt_respondsToSelector(v10, "dataSourceAccountDidChange:");

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[AMSCloudKitDataSource delegate](self, "delegate"));
  uint64_t v13 = v12;
  if ((v11 & 1) != 0) {
    [v12 dataSourceAccountDidChange:self];
  }
  else {
    [v12 dataSourceDidChange:self];
  }
}

- (void)_identityUpdated:(id)a3
{
  id v4 = (id)AMSSetLogKey(0LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
  if (!v5) {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class(self);
    uint64_t v8 = AMSLogKey(v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v14 = 138543618;
    uint64_t v15 = v7;
    __int16 v16 = 2114;
    uint64_t v17 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] The CloudKit PCS identity updated.",  (uint8_t *)&v14,  0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[AMSCloudKitDataSource delegate](self, "delegate"));
  char v11 = objc_opt_respondsToSelector(v10, "dataSourceAccountDidChange:");

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[AMSCloudKitDataSource delegate](self, "delegate"));
  uint64_t v13 = v12;
  if ((v11 & 1) != 0) {
    [v12 dataSourceAccountDidChange:self];
  }
  else {
    [v12 dataSourceDidChange:self];
  }
}

- (AMSCloudDataManagerDataSourceDelegate)delegate
{
  return (AMSCloudDataManagerDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)useSandboxEnvironment
{
  return self->_useSandboxEnvironment;
}

- (void)setUseSandboxEnvironment:(BOOL)a3
{
  self->_useSandboxEnvironment = a3;
}

- (NSString)pushNotificationTopic
{
  return self->_pushNotificationTopic;
}

- (void)setPushNotificationTopic:(id)a3
{
}

- (void).cxx_destruct
{
}

@end