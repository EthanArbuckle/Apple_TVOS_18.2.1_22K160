@interface ContactsSupportServiceDelegate
+ (id)os_log;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CNScheduler)workQueue;
- (CNTCC)tccServices;
- (ContactsSupportServiceDelegate)init;
- (ContactsSupportServiceDelegate)initWithServiceProvider:(id)a3 schedulerProvider:(id)a4 tccServices:(id)a5;
- (id)serviceProvider;
@end

@implementation ContactsSupportServiceDelegate

+ (id)os_log
{
  if (qword_10001F5C0 != -1) {
    dispatch_once(&qword_10001F5C0, &stru_100018AA8);
  }
  return (id)qword_10001F5C8;
}

- (ContactsSupportServiceDelegate)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CNSchedulerProvider providerWithBackgroundConcurrencyLimit:]( &OBJC_CLASS___CNSchedulerProvider,  "providerWithBackgroundConcurrencyLimit:",  3LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CNTCCFactory defaultTCC](&OBJC_CLASS___CNTCCFactory, "defaultTCC"));
  v5 = -[ContactsSupportServiceDelegate initWithServiceProvider:schedulerProvider:tccServices:]( self,  "initWithServiceProvider:schedulerProvider:tccServices:",  &stru_100018AE8,  v3,  v4);

  return v5;
}

- (ContactsSupportServiceDelegate)initWithServiceProvider:(id)a3 schedulerProvider:(id)a4 tccServices:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___ContactsSupportServiceDelegate;
  v11 = -[ContactsSupportServiceDelegate init](&v18, "init");
  if (v11)
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v9 backgroundScheduler]);
    workQueue = v11->_workQueue;
    v11->_workQueue = (CNScheduler *)v12;

    id v14 = [v8 copy];
    id serviceProvider = v11->_serviceProvider;
    v11->_id serviceProvider = v14;

    objc_storeStrong((id *)&v11->_tccServices, a5);
    v16 = v11;
  }

  return v11;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v8 = objc_msgSend((id)objc_opt_class(self, v6, v7), "os_log");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceName]);
    int v17 = 138412290;
    objc_super v18 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "shouldAcceptNewConnection: service name = %@",  (uint8_t *)&v17,  0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[CNXPCContactsSupport serviceProtocolInterface]( &OBJC_CLASS___CNXPCContactsSupport,  "serviceProtocolInterface"));
  [v5 setExportedInterface:v11];
  uint64_t v12 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[ContactsSupportServiceDelegate serviceProvider]( self,  "serviceProvider"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSupportServiceDelegate workQueue](self, "workQueue"));
  uint64_t v14 = ((uint64_t (**)(void, void *, id))v12)[2](v12, v13, v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  [v5 setExportedObject:v15];
  [v5 resume];

  return 1;
}

- (id)serviceProvider
{
  return self->_serviceProvider;
}

- (CNScheduler)workQueue
{
  return self->_workQueue;
}

- (CNTCC)tccServices
{
  return self->_tccServices;
}

- (void).cxx_destruct
{
}

@end