@interface VPPRepair
+ (BOOL)shouldAttemptToRepairApplication:(id)a3 options:(id)a4 logKey:(id)a5;
- (ApplicationRepairDelegate)delegate;
- (BOOL)repairApplication:(id)a3 error:(id *)a4;
- (NSArray)repairedBundleIDs;
- (NSString)repairType;
- (VPPRepair)init;
- (_TtC9appstored6LogKey)logKey;
- (int)fairPlayStatus;
- (void)setDelegate:(id)a3;
- (void)setLogKey:(id)a3;
@end

@implementation VPPRepair

- (VPPRepair)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VPPRepair;
  result = -[VPPRepair init](&v3, "init");
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (ApplicationRepairDelegate)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0x10000LL);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return (ApplicationRepairDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options(p_lock, 0x10000LL);
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (int)fairPlayStatus
{
  return 0;
}

- (_TtC9appstored6LogKey)logKey
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0x10000LL);
  id v4 = -[LogKey copy](self->_logKey, "copy");
  os_unfair_lock_unlock(p_lock);
  return (_TtC9appstored6LogKey *)v4;
}

- (NSArray)repairedBundleIDs
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0x10000LL);
  id v4 = -[NSArray copy](self->_repairedBundleIDs, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSString)repairType
{
  return (NSString *)@"VPP";
}

+ (BOOL)shouldAttemptToRepairApplication:(id)a3 options:(id)a4 logKey:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  if ([v6 isConfiguratorInstall])
  {
    if ([v6 hasMIDBasedSINF] && !objc_msgSend(v6, "missingRequiredSINF"))
    {
      uint64_t v11 = ASDLogHandleForCategory(28LL);
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543874;
        id v14 = v7;
        __int16 v15 = 1024;
        unsigned int v16 = [v6 hasMIDBasedSINF];
        __int16 v17 = 1024;
        unsigned int v18 = [v6 missingRequiredSINF];
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[VPP/%{public}@] Will not attempt vpp SINF recovery with hasMIDBasedSINF: %{BOOL}d missingRequireSINF: %d",  (uint8_t *)&v13,  0x18u);
      }

      BOOL v10 = 0;
    }

    else
    {
      uint64_t v8 = ASDLogHandleForCategory(28LL);
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543362;
        id v14 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[VPP/%{public}@] Will attempt vpp SINF recovery",  (uint8_t *)&v13,  0xCu);
      }

      BOOL v10 = 1;
    }
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)repairApplication:(id)a3 error:(id *)a4
{
  uint64_t v5 = ASDLogHandleForCategory(28LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    *(_DWORD *)buf = 138412290;
    v38 = logKey;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%@] Attempting VPP SINF migration", buf, 0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationProxy bundleID](self->_application, "bundleID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Migrating VPP SINF"));
  +[AITransactionLog logStep:byParty:phase:success:forBundleID:description:]( &OBJC_CLASS___AITransactionLog,  "logStep:byParty:phase:success:forBundleID:description:",  13LL,  3LL,  1LL,  1LL,  v8,  v9);

  BOOL v10 = objc_alloc_init(&OBJC_CLASS___ASDManagedApplicationRequestOptions);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationProxy bundleID](self->_application, "bundleID"));
  -[ASDManagedApplicationRequestOptions setBundleIdentifier:](v10, "setBundleIdentifier:", v11);

  v12 = sub_100240B98((id *)objc_alloc(&OBJC_CLASS___ManagedApplicationTask), v10, @"com.apple.appstored");
  taskQueue = self->_taskQueue;
  v44 = v12;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v44, 1LL));
  if (taskQueue) {
    -[NSOperationQueue addOperations:waitUntilFinished:]( taskQueue->_operationQueue,  "addOperations:waitUntilFinished:",  v14,  1LL);
  }

  if (v12)
  {
    char v16 = *((_BYTE *)v12 + 24);
    BOOL v17 = (char *)v12[21] - 1 < (char *)2;
    id v18 = objc_getProperty(v12, v15, 32LL, 1);
    if ((v16 & 1) != 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationProxy bundleID](self->_application, "bundleID"));

      if (v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationProxy bundleID](self->_application, "bundleID"));
        v43 = v21;
        int v19 = 1;
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v43, 1LL));
        sub_1001D4474((uint64_t)self, v22);
      }

      else
      {
        int v19 = 1;
      }
    }

    else
    {
      int v19 = 0;
    }
  }

  else
  {
    id v18 = 0LL;
    int v19 = 0;
    BOOL v17 = 0LL;
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationProxy bundleID](self->_application, "bundleID", a4));
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Migrating VPP SINF completed"));
  +[AITransactionLog logStep:byParty:phase:success:forBundleID:description:]( &OBJC_CLASS___AITransactionLog,  "logStep:byParty:phase:success:forBundleID:description:",  13LL,  3LL,  2LL,  v17,  v23,  v24);

  uint64_t v25 = ASDLogHandleForCategory(28LL);
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = self->_logKey;
    *(_DWORD *)buf = 138412802;
    v38 = v27;
    __int16 v39 = 1024;
    int v40 = v19;
    __int16 v41 = 1024;
    BOOL v42 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "[%@] Completed with result: %d SINF migrated: %d",  buf,  0x18u);
  }

  if (v17)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationProxy bundleID](self->_application, "bundleID"));

    if (v28)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationProxy bundleID](self->_application, "bundleID"));
      v36 = v29;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v36, 1LL));
      sub_1001D4474((uint64_t)self, v30);
    }
  }

  else if (v35)
  {
    if (v18)
    {
      void *v35 = v18;
    }

    else
    {
      uint64_t v31 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 543LL, 0LL, 0LL);
      id v32 = objc_claimAutoreleasedReturnValue(v31);
      void *v35 = v32;
    }
  }

  return v17;
}

- (void)setLogKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end