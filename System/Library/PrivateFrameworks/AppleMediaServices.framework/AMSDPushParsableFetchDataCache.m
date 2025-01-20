@interface AMSDPushParsableFetchDataCache
+ (id)_dataCacheService;
+ (void)handleNotificationPayload:(id)a3 config:(id)a4 bag:(id)a5;
@end

@implementation AMSDPushParsableFetchDataCache

+ (void)handleNotificationPayload:(id)a3 config:(id)a4 bag:(id)a5
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 accountIdentifier]);
  if (!v7)
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsConfig"));
    if (!v12) {
      id v12 = (id)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    uint64_t v15 = objc_opt_class(a1, v14);
    uint64_t v17 = AMSLogKey(v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    *(_DWORD *)buf = 138543618;
    uint64_t v39 = v15;
    __int16 v40 = 2114;
    v41 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Skipping fetch data push - no account",  buf,  0x16u);
    goto LABEL_25;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 aps]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"payloadType"]);

  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString, v10);
  if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0) {
    id v12 = v9;
  }
  else {
    id v12 = 0LL;
  }

  if ([v12 isEqualToString:@"mercury:marketing-cache-sync"])
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue([v6 aps]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"cacheTypeIds"]);

    uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSArray, v21);
    if ((objc_opt_isKindOfClass(v20, v22) & 1) != 0) {
      v13 = v20;
    }
    else {
      v13 = 0LL;
    }

    if (!-[os_log_s count](v13, "count")) {
      goto LABEL_26;
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsConfig"));
    if (!v27) {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 OSLogObject]);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = objc_opt_class(a1, v29);
      uint64_t v32 = AMSLogKey(v30, v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      *(_DWORD *)buf = 138543618;
      uint64_t v39 = v30;
      __int16 v40 = 2114;
      v41 = v33;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Updating data cache",  buf,  0x16u);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue([a1 _dataCacheService]);
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v13));
    v35 = (void *)objc_claimAutoreleasedReturnValue([v18 updateCacheForAccountDSID:v7 withCacheTypeIDs:v34]);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_100034C10;
    v37[3] = &unk_1000D76B0;
    v37[4] = a1;
    [v35 addFinishBlock:v37];

LABEL_25:
LABEL_26:

    goto LABEL_27;
  }

  if ([v12 isEqualToString:@"commerce:account-cache-sync"])
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue([v6 aps]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"payloadVersion"]);

    uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSNumber, v25);
    if ((objc_opt_isKindOfClass(v24, v26) & 1) != 0) {
      v13 = v24;
    }
    else {
      v13 = 0LL;
    }

    if (-[os_log_s longLongValue](v13, "longLongValue") != (id)1) {
      goto LABEL_26;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[CachedServerDataService sharedService]( &OBJC_CLASS____TtC12amsaccountsd23CachedServerDataService,  "sharedService"));
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_100034D3C;
    v36[3] = &unk_1000D76D0;
    v36[4] = a1;
    objc_msgSend(v18, "scheduleSyncFromPushWithDsid:completionHandler:", objc_msgSend(v7, "unsignedLongLongValue"), v36);
    goto LABEL_25;
  }

+ (id)_dataCacheService
{
  return objc_alloc_init(&OBJC_CLASS___AMSServerDataCacheService);
}

@end