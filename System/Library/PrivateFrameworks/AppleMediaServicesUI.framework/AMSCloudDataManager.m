@interface AMSCloudDataManager
+ (void)handleRecordZoneFetchFailed:(id)a3 inDatabase:(id)a4 withError:(id)a5;
- (AMSCloudDataManager)initWithDataSource:(id)a3;
- (AMSCloudDataManagerDataSource)dataSource;
- (NSMutableDictionary)containers;
- (NSString)pushNotificationTopic;
- (id)containerWithContainerIdentifier:(id)a3;
- (id)containerWithContainerIdentifier:(id)a3 options:(id)a4;
- (void)handlePushNotification:(id)a3;
- (void)setContainers:(id)a3;
- (void)setDataSource:(id)a3;
@end

@implementation AMSCloudDataManager

- (AMSCloudDataManager)initWithDataSource:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___AMSCloudDataManager;
  v6 = -[AMSCloudDataManager init](&v10, "init");
  if (v6)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    containers = v6->_containers;
    v6->_containers = v7;

    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v6;
}

- (NSString)pushNotificationTopic
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AMSCloudDataManager dataSource](self, "dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 pushNotificationTopic]);

  return (NSString *)v3;
}

- (id)containerWithContainerIdentifier:(id)a3
{
  return -[AMSCloudDataManager containerWithContainerIdentifier:options:]( self,  "containerWithContainerIdentifier:options:",  a3,  0LL);
}

- (id)containerWithContainerIdentifier:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AMSCloudDataManager containers](self, "containers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v6]);

  if (!v9)
  {
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[AMSCloudDataManager dataSource](self, "dataSource"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v10 containerWithContainerIdentifier:v6 options:v7]);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AMSCloudDataManager containers](self, "containers"));
    [v11 setObject:v9 forKeyedSubscript:v6];
  }

  return v9;
}

- (void)handlePushNotification:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[AMSCloudDataManager dataSource](self, "dataSource"));
  [v5 handlePushNotification:v4];
}

+ (void)handleRecordZoneFetchFailed:(id)a3 inDatabase:(id)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_msgSend(v10, "ams_hasDomain:code:", @"AMSCloudDataErrorDomain", 1))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
    if (!v11) {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_opt_class(a1);
      uint64_t v14 = AMSLogKey(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      uint64_t v16 = AMSHashIfNeeded(v8);
      id v38 = v8;
      id v17 = a1;
      v18 = (void *)objc_claimAutoreleasedReturnValue(v16);
      uint64_t v19 = AMSHashIfNeeded(v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      uint64_t v21 = AMSHashIfNeeded(v10);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      *(_DWORD *)buf = 138544386;
      uint64_t v43 = v13;
      __int16 v44 = 2114;
      v45 = v15;
      __int16 v46 = 2114;
      v47 = v18;
      __int16 v48 = 2114;
      v49 = v20;
      __int16 v50 = 2114;
      v51 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Encryption keys are missing for a record zone. zoneIdentifier = %{public}@ | database = %{public}@ | error = %{public}@",  buf,  0x34u);

      a1 = v17;
      id v8 = v38;
    }

    if ([v9 isPrivateDatabase])
    {
      id v41 = v8;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v41, 1LL));
      v24 = (void *)objc_claimAutoreleasedReturnValue([v9 deleteRecordZonesWithRecordZoneIdentifiers:v23]);
      id v40 = 0LL;
      v25 = (void *)objc_claimAutoreleasedReturnValue([v24 resultWithError:&v40]);
      id v26 = v40;

      if (!v25) {
        goto LABEL_11;
      }
    }

    else if ([v9 isSharedDatabase])
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue([v9 shareForRecordZoneIdentifier:v8]);
      v28 = (void *)objc_claimAutoreleasedReturnValue([v27 identifier]);
      v29 = (void *)objc_claimAutoreleasedReturnValue([v9 deleteRecordWithRecordIdentifier:v28 missingEncryptionIdentity:1]);
      id v39 = 0LL;
      v30 = (void *)objc_claimAutoreleasedReturnValue([v29 resultWithError:&v39]);
      id v26 = v39;

      if (!v30)
      {
LABEL_11:
        v31 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
        if (!v31) {
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
        }
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v31 OSLogObject]);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          uint64_t v33 = objc_opt_class(a1);
          uint64_t v34 = AMSLogKey(v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
          uint64_t v36 = AMSHashIfNeeded(v26);
          v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
          *(_DWORD *)buf = 138543874;
          uint64_t v43 = v33;
          __int16 v44 = 2114;
          v45 = v35;
          __int16 v46 = 2114;
          v47 = v37;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to cleanup a record zone with missing encryption keys. error = %{public}@",  buf,  0x20u);
        }
      }
    }

    else
    {
      id v26 = 0LL;
    }
  }
}

- (NSMutableDictionary)containers
{
  return self->_containers;
}

- (void)setContainers:(id)a3
{
}

- (AMSCloudDataManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end