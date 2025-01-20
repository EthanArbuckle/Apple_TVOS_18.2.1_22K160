@interface AMSDPaymentViewService
+ (BOOL)isConnectionEntitled:(id)a3;
+ (id)sharedService;
- (void)presentPaymentConfirmationWithContext:(id)a3 completion:(id)a4;
@end

@implementation AMSDPaymentViewService

+ (id)sharedService
{
  if (qword_1000F2068 != -1) {
    dispatch_once(&qword_1000F2068, &stru_1000D74E8);
  }
  return (id)qword_1000F2070;
}

+ (BOOL)isConnectionEntitled:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 valueForEntitlement:@"com.apple.private.applemediaservices"]);
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

- (void)presentPaymentConfirmationWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  if (!v8) {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_opt_class(self, v10);
    uint64_t v13 = AMSLogKey(v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = AMSHashIfNeeded(v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    *(_DWORD *)buf = 138543874;
    uint64_t v23 = v11;
    __int16 v24 = 2114;
    v25 = v14;
    __int16 v26 = 2114;
    v27 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Performing payment confirmation in amsaccountsd with context: %{public}@",  buf,  0x20u);
  }

  id v17 = objc_alloc_init(&OBJC_CLASS___AMSPaymentViewProviderSessionTask);
  [v17 setPaymentContext:v6];
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 performSession]);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100032ABC;
  v20[3] = &unk_1000D7510;
  v20[4] = self;
  id v21 = v7;
  id v19 = v7;
  [v18 resultWithCompletion:v20];
}

@end