@interface AMSDServiceConnection
+ (NSString)machServiceName;
- (AMSDServiceConnection)initWithConnection:(id)a3;
- (NSMutableSet)retainer;
- (NSString)logKey;
- (NSXPCConnection)remoteConnection;
- (void)_provideService:(id)a3 delegate:(id)a4 withReply:(id)a5;
- (void)dealloc;
- (void)getAccountCachedServerDataServiceProxyWithReplyHandler:(id)a3;
- (void)getAccountSignOutServiceProxyWithReplyHandler:(id)a3;
- (void)getCookieServiceProxyWithReplyHandler:(id)a3;
- (void)getDeviceMessengerServiceProxyWithDelegate:(id)a3 replyHandler:(id)a4;
- (void)getDismissQRDialogServiceProxyWithReplyHandler:(id)a3;
- (void)getFraudReportServiceProxyWithReplyHandler:(id)a3;
- (void)getKeychainServiceProxyWithReplyHandler:(id)a3;
- (void)getPaymentConfirmationServiceProxyWithReplyHandler:(id)a3;
- (void)getPaymentValidationServiceProxyWithReplyHandler:(id)a3;
- (void)getPurchaseServiceProxyWithReplyHandler:(id)a3;
- (void)getPushNotificationServiceProxyWithReplyHandler:(id)a3;
- (void)getSecurityServiceProxyWithDelegate:(id)a3 replyHandler:(id)a4;
- (void)setLogKey:(id)a3;
- (void)setRemoteConnection:(id)a3;
- (void)setRetainer:(id)a3;
@end

@implementation AMSDServiceConnection

- (AMSDServiceConnection)initWithConnection:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___AMSDServiceConnection;
  v6 = -[AMSDServiceConnection init](&v16, "init");
  v8 = v6;
  if (v6)
  {
    uint64_t v9 = AMSLogKey(v6, v7);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    logKey = v8->_logKey;
    v8->_logKey = (NSString *)v10;

    objc_storeStrong((id *)&v8->_remoteConnection, a3);
    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    retainer = v8->_retainer;
    v8->_retainer = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDaemonConnectionInterface interface](&OBJC_CLASS___AMSDaemonConnectionInterface, "interface"));
    [v5 setExportedInterface:v14];

    [v5 setExportedObject:v8];
  }

  return v8;
}

+ (NSString)machServiceName
{
  return (NSString *)@"com.apple.xpc.amsaccountsd";
}

- (void)getCookieServiceProxyWithReplyHandler:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[AMSDCookieService sharedService](&OBJC_CLASS___AMSDCookieService, "sharedService"));
  -[AMSDServiceConnection _provideService:delegate:withReply:](self, "_provideService:delegate:withReply:", v5, 0LL, v4);
}

- (void)getDeviceMessengerServiceProxyWithDelegate:(id)a3 replyHandler:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDDeviceMessengerService sharedService](&OBJC_CLASS___AMSDDeviceMessengerService, "sharedService"));
  if (v8) {
    [v7 addDelegate:v8];
  }
  -[AMSDServiceConnection _provideService:delegate:withReply:](self, "_provideService:delegate:withReply:", v7, v8, v6);
}

- (void)getDismissQRDialogServiceProxyWithReplyHandler:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[AMSDDismissQRDialogService sharedService](&OBJC_CLASS___AMSDDismissQRDialogService, "sharedService"));
  -[AMSDServiceConnection _provideService:delegate:withReply:](self, "_provideService:delegate:withReply:", v5, 0LL, v4);
}

- (void)getFraudReportServiceProxyWithReplyHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___AMSDFraudReportService);
  -[AMSDServiceConnection _provideService:delegate:withReply:](self, "_provideService:delegate:withReply:", v5, 0LL, v4);
}

- (void)getKeychainServiceProxyWithReplyHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___AMSDKeychainService);
  -[AMSDServiceConnection _provideService:delegate:withReply:](self, "_provideService:delegate:withReply:", v5, 0LL, v4);
}

- (void)getPaymentConfirmationServiceProxyWithReplyHandler:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[AMSDPaymentViewService sharedService](&OBJC_CLASS___AMSDPaymentViewService, "sharedService"));
  -[AMSDServiceConnection _provideService:delegate:withReply:](self, "_provideService:delegate:withReply:", v5, 0LL, v4);
}

- (void)getPaymentValidationServiceProxyWithReplyHandler:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[AMSDPaymentValidationService sharedService](&OBJC_CLASS___AMSDPaymentValidationService, "sharedService"));
  -[AMSDServiceConnection _provideService:delegate:withReply:](self, "_provideService:delegate:withReply:", v5, 0LL, v4);
}

- (void)getPurchaseServiceProxyWithReplyHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___AMSDPurchaseService);
  -[AMSDServiceConnection _provideService:delegate:withReply:](self, "_provideService:delegate:withReply:", v5, 0LL, v4);
}

- (void)getPushNotificationServiceProxyWithReplyHandler:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[AMSDPushService sharedService](&OBJC_CLASS___AMSDPushService, "sharedService"));
  -[AMSDServiceConnection _provideService:delegate:withReply:](self, "_provideService:delegate:withReply:", v5, 0LL, v4);
}

- (void)getSecurityServiceProxyWithDelegate:(id)a3 replyHandler:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___AMSDSecurityService);
  if (v8) {
    -[AMSDSecurityService setDelegate:](v7, "setDelegate:", v8);
  }
  -[AMSDServiceConnection _provideService:delegate:withReply:](self, "_provideService:delegate:withReply:", v7, v8, v6);
}

- (void)getAccountCachedServerDataServiceProxyWithReplyHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___AMSDAccountCachedServerDataService);
  -[AMSDServiceConnection _provideService:delegate:withReply:](self, "_provideService:delegate:withReply:", v5, 0LL, v4);
}

- (void)getAccountSignOutServiceProxyWithReplyHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___AMSDAccountSignOutService);
  -[AMSDServiceConnection _provideService:delegate:withReply:](self, "_provideService:delegate:withReply:", v5, 0LL, v4);
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v3) {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = (id)objc_opt_class(&OBJC_CLASS___AMSDServiceConnection, v5);
    id v6 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%{public}@: deallocated", buf, 0xCu);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___AMSDServiceConnection;
  -[AMSDServiceConnection dealloc](&v7, "dealloc");
}

- (void)_provideService:(id)a3 delegate:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, void *))a5;
  uint64_t v12 = objc_opt_class(v8, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDServiceConnection remoteConnection](self, "remoteConnection"));
  LOBYTE(v12) = [(id)v12 isConnectionEntitled:v13];

  if ((v12 & 1) != 0)
  {
    v14 = 0LL;
    if (v8) {
      goto LABEL_3;
    }
LABEL_10:
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    if (!v21) {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 OSLogObject]);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = objc_opt_class(self, v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDServiceConnection logKey](self, "logKey"));
      int v29 = 138543618;
      uint64_t v30 = v24;
      __int16 v31 = 2114;
      v32 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] No service found",  (uint8_t *)&v29,  0x16u);
    }

    uint64_t v26 = AMSError(11LL, @"Connection Failed", @"No service found", 0LL);
    uint64_t v27 = objc_claimAutoreleasedReturnValue(v26);

    v14 = (void *)v27;
    if (v27) {
      goto LABEL_4;
    }
    goto LABEL_15;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  if (!v15) {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  objc_super v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    uint64_t v18 = objc_opt_class(self, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDServiceConnection logKey](self, "logKey"));
    int v29 = 138543874;
    uint64_t v30 = v18;
    __int16 v31 = 2114;
    v32 = v19;
    __int16 v33 = 2114;
    id v34 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Not entitled for service: %{public}@",  (uint8_t *)&v29,  0x20u);
  }

  uint64_t v20 = AMSError(11LL, @"Connection Failed", @"Not entitled for service", 0LL);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v20);
  if (!v8) {
    goto LABEL_10;
  }
LABEL_3:
  if (v14)
  {
LABEL_4:
    v10[2](v10, 0LL, v14);
    goto LABEL_18;
  }

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
}

- (NSXPCConnection)remoteConnection
{
  return self->_remoteConnection;
}

- (void)setRemoteConnection:(id)a3
{
}

- (NSMutableSet)retainer
{
  return self->_retainer;
}

- (void)setRetainer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end