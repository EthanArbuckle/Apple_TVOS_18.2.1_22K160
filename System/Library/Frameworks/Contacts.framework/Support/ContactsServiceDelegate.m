@interface ContactsServiceDelegate
+ (id)os_log;
- (BOOL)isClientAuthorizedAccessForConnection:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CNScheduler)highPriorityWorkQueue;
- (CNScheduler)workQueue;
- (CNTCC)tccServices;
- (ContactsServiceDelegate)init;
- (ContactsServiceDelegate)initWithServiceProvider:(id)a3 schedulerProvider:(id)a4 highPrioritySchedulerProvider:(id)a5 tccServices:(id)a6;
- (id)bundleIdentifierForConnection:(id)a3;
- (id)serviceProvider;
@end

@implementation ContactsServiceDelegate

+ (id)os_log
{
  if (qword_10001F6A0 != -1) {
    dispatch_once(&qword_10001F6A0, &stru_100018F18);
  }
  return (id)qword_10001F6A8;
}

- (ContactsServiceDelegate)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CNSchedulerProvider providerWithBackgroundConcurrencyLimit:]( &OBJC_CLASS___CNSchedulerProvider,  "providerWithBackgroundConcurrencyLimit:",  3LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[CNSchedulerProvider providerWithBackgroundConcurrencyLimit:]( &OBJC_CLASS___CNSchedulerProvider,  "providerWithBackgroundConcurrencyLimit:",  3LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CNTCCFactory defaultTCC](&OBJC_CLASS___CNTCCFactory, "defaultTCC"));
  v6 = -[ContactsServiceDelegate initWithServiceProvider:schedulerProvider:highPrioritySchedulerProvider:tccServices:]( self,  "initWithServiceProvider:schedulerProvider:highPrioritySchedulerProvider:tccServices:",  &stru_100018F58,  v3,  v4,  v5);

  return v6;
}

- (ContactsServiceDelegate)initWithServiceProvider:(id)a3 schedulerProvider:(id)a4 highPrioritySchedulerProvider:(id)a5 tccServices:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___ContactsServiceDelegate;
  v14 = -[ContactsServiceDelegate init](&v23, "init");
  if (v14)
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v11 backgroundScheduler]);
    workQueue = v14->_workQueue;
    v14->_workQueue = (CNScheduler *)v15;

    uint64_t v17 = objc_claimAutoreleasedReturnValue([v12 backgroundScheduler]);
    highPriorityWorkQueue = v14->_highPriorityWorkQueue;
    v14->_highPriorityWorkQueue = (CNScheduler *)v17;

    id v19 = [v10 copy];
    id serviceProvider = v14->_serviceProvider;
    v14->_id serviceProvider = v19;

    objc_storeStrong((id *)&v14->_tccServices, a6);
    v21 = v14;
  }

  return v14;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceName]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsServiceDelegate bundleIdentifierForConnection:](self, "bundleIdentifierForConnection:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CNXPCDataMapper serviceProtocolInterface](&OBJC_CLASS___CNXPCDataMapper, "serviceProtocolInterface"));
  [v5 setExportedInterface:v8];
  BOOL v10 = -[ContactsServiceDelegate isClientAuthorizedAccessForConnection:]( self,  "isClientAuthorizedAccessForConnection:",  v5);
  if (v10)
  {
    id v11 = (uint64_t (**)(void, void, void, void))objc_claimAutoreleasedReturnValue( -[ContactsServiceDelegate serviceProvider]( self,  "serviceProvider"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsServiceDelegate workQueue](self, "workQueue"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsServiceDelegate highPriorityWorkQueue](self, "highPriorityWorkQueue"));
    uint64_t v14 = ((uint64_t (**)(void, void *, void *, id))v11)[2](v11, v12, v13, v5);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    [v5 setExportedObject:v15];
    [v5 resume];
    id v17 = objc_msgSend((id)objc_opt_class(self, v16), "os_log");
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138543618;
      objc_super v23 = v6;
      __int16 v24 = 2114;
      v25 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "shouldAcceptNewConnection: Accepted [%{public}@, %{public}@]",  (uint8_t *)&v22,  0x16u);
    }
  }

  else
  {
    id v19 = objc_msgSend((id)objc_opt_class(self, v9), "os_log");
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138543618;
      objc_super v23 = v6;
      __int16 v24 = 2114;
      v25 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "shouldAcceptNewConnection: Not authorized [%{public}@, %{public}@]",  (uint8_t *)&v22,  0x16u);
    }

    [v5 invalidate];
  }

  return v10;
}

- (id)bundleIdentifierForConnection:(id)a3
{
  if (a3) {
    [a3 auditToken];
  }
  else {
    memset(v6, 0, sizeof(v6));
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CNAuditToken auditToken:](&OBJC_CLASS___CNAuditToken, "auditToken:", v6));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[CNAuditTokenUtilities bundleIdentifierForAuditToken:]( &OBJC_CLASS___CNAuditTokenUtilities,  "bundleIdentifierForAuditToken:",  v3));

  return v4;
}

- (BOOL)isClientAuthorizedAccessForConnection:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4) {
    [v4 auditToken];
  }
  else {
    memset(v23, 0, sizeof(v23));
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CNAuditToken auditToken:](&OBJC_CLASS___CNAuditToken, "auditToken:", v23));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsServiceDelegate tccServices](self, "tccServices"));
  unint64_t v8 = (unint64_t)[v7 checkAuthorizationStatusOfAuditToken:v6 assumedIdentity:0];

  if ((v8 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    BOOL v9 = 1;
  }

  else
  {
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[CNEnvironment currentEnvironment](&OBJC_CLASS___CNEnvironment, "currentEnvironment"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 entitlementVerifier]);
    if (v5) {
      [v5 auditToken];
    }
    else {
      memset(v22, 0, sizeof(v22));
    }
    uint64_t v12 = CNEntitlementNameTCCUncoupledProcess;
    uint64_t v24 = CNEntitlementNameTCCUncoupledProcess;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
    id v21 = 0LL;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 valuesForAuditToken:v22 forEntitlements:v13 error:&v21]);
    id v15 = v21;

    if (v15)
    {
      id v17 = objc_msgSend((id)objc_opt_class(self, v16), "os_log");
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10000E99C((uint64_t)v15, v18);
      }
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v12]);
    BOOL v9 = v19 != 0LL;
  }

  return v9;
}

- (id)serviceProvider
{
  return self->_serviceProvider;
}

- (CNScheduler)workQueue
{
  return self->_workQueue;
}

- (CNScheduler)highPriorityWorkQueue
{
  return self->_highPriorityWorkQueue;
}

- (CNTCC)tccServices
{
  return self->_tccServices;
}

- (void).cxx_destruct
{
}

@end