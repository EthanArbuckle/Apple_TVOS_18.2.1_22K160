@interface AMSDAccountSignOutService
+ (BOOL)isConnectionEntitled:(id)a3;
- (void)performAccountSignOutTasksForAccountWithID:(id)a3;
@end

@implementation AMSDAccountSignOutService

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

- (void)performAccountSignOutTasksForAccountWithID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  if (!v5) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class(self, v7);
    uint64_t v9 = AMSLogKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)buf = 138543874;
    uint64_t v16 = v8;
    __int16 v17 = 2114;
    v18 = v10;
    __int16 v19 = 2114;
    id v20 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Performing sign-out tasks in amsaccountsd for: %{public}@",  buf,  0x20u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[CachedServerDataService sharedService]( &OBJC_CLASS____TtC12amsaccountsd23CachedServerDataService,  "sharedService"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100004804;
  v13[3] = &unk_1000D5C18;
  v13[4] = self;
  id v14 = v4;
  id v12 = v4;
  [v11 removeDataFor:v12 completionHandler:v13];
}

@end