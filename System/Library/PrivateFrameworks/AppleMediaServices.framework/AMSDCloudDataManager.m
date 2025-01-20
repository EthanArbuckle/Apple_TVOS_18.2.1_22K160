@interface AMSDCloudDataManager
+ (unint64_t)multiUserStatusForRecord:(id)a3 withHomeManager:(id)a4;
+ (void)handleRecordZoneFetchFailed:(id)a3 inDatabase:(id)a4 withError:(id)a5;
- (AMSDCloudDataManager)initWithDataSource:(id)a3;
- (AMSDCloudDataManagerDataSource)dataSource;
- (AMSThreadSafeDictionary)containers;
- (NSString)pushNotificationTopic;
- (id)containerWithContainerIdentifier:(id)a3;
- (id)containerWithContainerIdentifier:(id)a3 options:(id)a4;
- (void)handlePushNotification:(id)a3;
- (void)setContainers:(id)a3;
- (void)setDataSource:(id)a3;
@end

@implementation AMSDCloudDataManager

+ (unint64_t)multiUserStatusForRecord:(id)a3 withHomeManager:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDHomeManager identifiersForRecord:](&OBJC_CLASS___AMSDHomeManager, "identifiersForRecord:", a3));
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 first]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v5 homeWithHomeIdentifier:v8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 resultWithError:0]);

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 users]);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_10000BBC0;
      v15[3] = &unk_1000D5ED8;
      id v16 = v7;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ams_firstObjectPassingTest:", v15));

      if (v12) {
        unint64_t v13 = +[AMSDHomeManager multiUserStatusForHomeUser:inHome:]( &OBJC_CLASS___AMSDHomeManager,  "multiUserStatusForHomeUser:inHome:",  v12,  v10);
      }
      else {
        unint64_t v13 = 0LL;
      }
    }

    else
    {
      unint64_t v13 = 0LL;
    }
  }

  else
  {
    unint64_t v13 = 0LL;
  }

  return v13;
}

- (AMSDCloudDataManager)initWithDataSource:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___AMSDCloudDataManager;
  v6 = -[AMSDCloudDataManager init](&v10, "init");
  if (v6)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___AMSThreadSafeDictionary);
    containers = v6->_containers;
    v6->_containers = v7;

    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v6;
}

- (NSString)pushNotificationTopic
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDCloudDataManager dataSource](self, "dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 pushNotificationTopic]);

  return (NSString *)v3;
}

- (id)containerWithContainerIdentifier:(id)a3
{
  return -[AMSDCloudDataManager containerWithContainerIdentifier:options:]( self,  "containerWithContainerIdentifier:options:",  a3,  0LL);
}

- (id)containerWithContainerIdentifier:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = (char *)&_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
  if (!v10) {
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = AMSLogKey();
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    uint64_t v15 = objc_opt_class(self, v14);
    v39 = self;
    if (v13)
    {
      uint64_t v16 = AMSLogKey();
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = NSStringFromSelector(a2);
      a2 = (SEL)objc_claimAutoreleasedReturnValue(v18);
      v19 = (char *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] %@ ",  v15,  v17,  a2));
    }

    else
    {
      v20 = NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v19 = (char *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: %@ ",  v15,  v17));
    }

    uint64_t v21 = AMSHashIfNeeded(v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    uint64_t v23 = AMSHashIfNeeded(v8);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    *(_DWORD *)buf = 138543874;
    v44 = v19;
    __int16 v45 = 2114;
    v46 = v22;
    __int16 v47 = 2114;
    v48 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%{public}@identifier: %{public}@ | options = %{public}@",  buf,  0x20u);
    if (v13)
    {

      v19 = (char *)a2;
    }

    self = v39;
    v9 = (char *)&_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
  }

  if (v7)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDCloudDataManager containers](self, "containers"));
    id v26 = (id)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:v7]);

    if (v26) {
      goto LABEL_25;
    }
  }

  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
    if (!v27) {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 OSLogObject]);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = AMSLogKey();
      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      uint64_t v32 = objc_opt_class(self, v31);
      uint64_t v33 = v32;
      if (v30)
      {
        uint64_t v34 = AMSLogKey();
        v9 = (char *)objc_claimAutoreleasedReturnValue(v34);
        v35 = (char *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v33,  v9));
      }

      else
      {
        v35 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: ", v32));
      }

      *(_DWORD *)buf = 138543362;
      v44 = v35;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%{public}@Attempting to create a cloud container with no identifier",  buf,  0xCu);
      if (v30)
      {

        v35 = v9;
      }
    }
  }

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDCloudDataManager dataSource](self, "dataSource"));
  id v26 = (id)objc_claimAutoreleasedReturnValue([v36 containerWithContainerIdentifier:v7 options:v8]);

  if (v7)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDCloudDataManager containers](self, "containers"));
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_10000C0B4;
    v40[3] = &unk_1000D5F00;
    id v26 = v26;
    id v41 = v26;
    id v42 = v7;
    [v37 readWrite:v40];
  }

- (void)handlePushNotification:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[AMSDCloudDataManager dataSource](self, "dataSource"));
  [v5 handlePushNotification:v4];
}

+ (void)handleRecordZoneFetchFailed:(id)a3 inDatabase:(id)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_msgSend(v10, "ams_hasDomain:code:", @"AMSDCloudDataErrorDomain", 1))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
    if (!v11) {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = objc_opt_class(a1, v13);
      uint64_t v15 = AMSLogKey();
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      uint64_t v17 = AMSHashIfNeeded(v8);
      id v41 = v8;
      id v18 = a1;
      v19 = (void *)objc_claimAutoreleasedReturnValue(v17);
      uint64_t v20 = AMSHashIfNeeded(v9);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      uint64_t v22 = AMSHashIfNeeded(v10);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      *(_DWORD *)buf = 138544386;
      uint64_t v46 = v14;
      __int16 v47 = 2114;
      v48 = v16;
      __int16 v49 = 2114;
      v50 = v19;
      __int16 v51 = 2114;
      v52 = v21;
      __int16 v53 = 2114;
      v54 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Encryption keys are missing for a record zone. zoneIdentifier = %{public}@ | database = %{public}@ | error = %{public}@",  buf,  0x34u);

      a1 = v18;
      id v8 = v41;
    }

    if ([v9 isPrivateDatabase])
    {
      id v44 = v8;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v44, 1LL));
      v25 = (void *)objc_claimAutoreleasedReturnValue([v9 deleteRecordZonesWithRecordZoneIdentifiers:v24]);
      id v43 = 0LL;
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 resultWithError:&v43]);
      id v27 = v43;

      if (!v26) {
        goto LABEL_11;
      }
    }

    else if ([v9 isSharedDatabase])
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue([v9 shareForRecordZoneIdentifier:v8]);
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 identifier]);
      v30 = (void *)objc_claimAutoreleasedReturnValue([v9 deleteRecordWithRecordIdentifier:v29 missingEncryptionIdentity:1]);
      id v42 = 0LL;
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 resultWithError:&v42]);
      id v27 = v42;

      if (!v31)
      {
LABEL_11:
        uint64_t v32 = (AMSDRefreshMultiUserOptions *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig",  v41));
        if (!v32) {
          uint64_t v32 = (AMSDRefreshMultiUserOptions *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedConfig"));
        }
        uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserOptions OSLogObject](v32, "OSLogObject"));
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          uint64_t v35 = objc_opt_class(a1, v34);
          uint64_t v36 = AMSLogKey();
          v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
          uint64_t v38 = AMSHashIfNeeded(v27);
          v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
          *(_DWORD *)buf = 138543874;
          uint64_t v46 = v35;
          __int16 v47 = 2114;
          v48 = v37;
          __int16 v49 = 2114;
          v50 = v39;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to cleanup a record zone with missing encryption keys. error = %{public}@",  buf,  0x20u);
        }

        goto LABEL_17;
      }
    }

    else
    {
      id v27 = 0LL;
    }

    uint64_t v32 = -[AMSDRefreshMultiUserOptions initWithReason:]( objc_alloc(&OBJC_CLASS___AMSDRefreshMultiUserOptions),  "initWithReason:",  @"Missing encryption keys.");
    -[AMSDRefreshMultiUserOptions setSchedulingInterval:](v32, "setSchedulingInterval:", 60.0);
    -[AMSDRefreshMultiUserOptions setShouldUseCloudData:](v32, "setShouldUseCloudData:", 1LL);
    uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[AMSDMultiUserController sharedController]( &OBJC_CLASS___AMSDMultiUserController,  "sharedController"));
    id v40 = -[os_log_s refreshWithOptions:](v33, "refreshWithOptions:", v32);
LABEL_17:
  }
}

- (AMSThreadSafeDictionary)containers
{
  return self->_containers;
}

- (void)setContainers:(id)a3
{
}

- (AMSDCloudDataManagerDataSource)dataSource
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