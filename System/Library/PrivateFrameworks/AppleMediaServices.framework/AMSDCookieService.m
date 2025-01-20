@interface AMSDCookieService
+ (AMSDCookieService)sharedService;
+ (BOOL)isConnectionEntitled:(id)a3;
- (AMSDCookieService)init;
- (AMSLRUCache)altDSIDHashCache;
- (AMSLRUCache)cookieDatabaseCache;
- (AMSLRUCache)cookiePropertyCache;
- (AMSLRUCache)dsidHashCache;
- (OS_dispatch_queue)queue;
- (id)_alliTunesAccountIdentifiers;
- (id)_cachedCookieDatabaseForPath:(id)a3;
- (id)_cachedCookiePropertiesForIdentifier:(id)a3;
- (id)_cookieDatabaseForAccount:(id)a3 error:(id *)a4;
- (id)_uniqueIdentifiersForAccount:(id)a3 error:(id *)a4;
- (id)clearDanglingCookieDatabases;
- (id)getCookiePropertiesForAccount:(id)a3 cookieDatabaseOnly:(BOOL)a4 error:(id *)a5;
- (void)_cacheCookieDatabase:(id)a3 withPath:(id)a4;
- (void)_cacheCookieProperties:(id)a3 forIdentifier:(id)a4;
- (void)_clearAllCachedCookieProperties;
- (void)clearAllCachedCookieProperties;
- (void)clearDanglingCookieDatabasesWithCompletion:(id)a3;
- (void)getCookieDatabasePathForAccount:(id)a3 withCompletion:(id)a4;
- (void)getCookiePropertiesForAccount:(id)a3 cookieDatabaseOnly:(BOOL)a4 withCompletion:(id)a5;
- (void)getCookiePropertiesForAccount:(id)a3 withCompletion:(id)a4;
- (void)updateCookiesWithCookiePropertiesToAdd:(id)a3 cookiePropertiesToRemove:(id)a4 forAccount:(id)a5 withCompletion:(id)a6;
@end

@implementation AMSDCookieService

- (id)_alliTunesAccountIdentifiers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ams_fetchiTunesAccounts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ams_fetchiTunesSandboxAccounts"));
  v11[0] = v4;
  v11[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithAll:](&OBJC_CLASS___AMSPromise, "promiseWithAll:", v6));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000CD9C;
  v10[3] = &unk_1000D5F28;
  v10[4] = self;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 thenWithBlock:v10]);

  return v8;
}

- (void)_cacheCookieProperties:(id)a3 forIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[AMSDCookieService queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsCookiesConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsCookiesConfig"));
  if (!v10) {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = AMSLogKey();
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    uint64_t v15 = objc_opt_class(self, v14);
    uint64_t v16 = v15;
    if (v13)
    {
      uint64_t v17 = AMSLogKey();
      uint64_t v4 = objc_claimAutoreleasedReturnValue(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v16,  v4));
    }

    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: ", v15));
    }

    uint64_t v19 = AMSHashIfNeeded(v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    uint64_t v21 = AMSHashIfNeeded(v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    *(_DWORD *)buf = 138543874;
    v25 = v18;
    __int16 v26 = 2114;
    v27 = v20;
    __int16 v28 = 2114;
    v29 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%{public}@Caching cookies. cookies = %{public}@ | accountIdentifier = %{public}@",  buf,  0x20u);
    if (v13)
    {

      v18 = (void *)v4;
    }
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDCookieService cookiePropertyCache](self, "cookiePropertyCache"));
  [v23 setObject:v7 forKey:v8];
}

- (id)_cachedCookiePropertiesForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[AMSDCookieService queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsCookiesConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsCookiesConfig"));
  if (!v6) {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = objc_opt_class(self, v8);
    uint64_t v10 = AMSLogKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = AMSHashIfNeeded(v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    int v17 = 138543874;
    uint64_t v18 = v9;
    __int16 v19 = 2114;
    v20 = v11;
    __int16 v21 = 2114;
    v22 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%{public}@: [%{public}@] Retrieving cached cookies. accountIdentifier = %{public}@",  (uint8_t *)&v17,  0x20u);
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDCookieService cookiePropertyCache](self, "cookiePropertyCache"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v4]);

  return v15;
}

- (void)_clearAllCachedCookieProperties
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[AMSDCookieService queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsCookiesConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsCookiesConfig"));
  if (!v4) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = objc_opt_class(self, v6);
    uint64_t v8 = AMSLogKey();
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v11 = 138543618;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    uint64_t v14 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%{public}@: [%{public}@] Clearing all cached cookies.",  (uint8_t *)&v11,  0x16u);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDCookieService cookiePropertyCache](self, "cookiePropertyCache"));
  [v10 removeAllObjects];
}

- (void)_cacheCookieDatabase:(id)a3 withPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[AMSDCookieService queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsCookiesConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsCookiesConfig"));
  if (!v9) {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = objc_opt_class(self, v11);
    uint64_t v13 = AMSLogKey();
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = AMSHashIfNeeded(v6);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    uint64_t v17 = AMSHashIfNeeded(v7);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    int v20 = 138544130;
    uint64_t v21 = v12;
    __int16 v22 = 2114;
    v23 = v14;
    __int16 v24 = 2114;
    v25 = v16;
    __int16 v26 = 2114;
    v27 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%{public}@: [%{public}@] Caching cookie database. database = %{public}@ | dbPath = %{public}@",  (uint8_t *)&v20,  0x2Au);
  }

  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDCookieService cookieDatabaseCache](self, "cookieDatabaseCache"));
  [v19 setObject:v6 forKey:v7];
}

- (id)_cachedCookieDatabaseForPath:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[AMSDCookieService queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsCookiesConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsCookiesConfig"));
  if (!v6) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = objc_opt_class(self, v8);
    uint64_t v10 = AMSLogKey();
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = AMSHashIfNeeded(v4);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    int v17 = 138543874;
    uint64_t v18 = v9;
    __int16 v19 = 2114;
    int v20 = v11;
    __int16 v21 = 2114;
    __int16 v22 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%{public}@: [%{public}@] Retrieving cached cookie database. dbPath = %{public}@",  (uint8_t *)&v17,  0x20u);
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDCookieService cookieDatabaseCache](self, "cookieDatabaseCache"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v4]);

  return v15;
}

- (id)_cookieDatabaseForAccount:(id)a3 error:(id *)a4
{
  v5 = self;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[AMSDCookieService _uniqueIdentifiersForAccount:error:]( self,  "_uniqueIdentifiersForAccount:error:",  a3));
  id v7 = v6;
  if (v6 && [v6 count])
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[AMSCookieDatabase databasePathForIdentifiers:error:]( &OBJC_CLASS___AMSCookieDatabase,  "databasePathForIdentifiers:error:",  v7,  a4));
    if (v8)
    {
      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[AMSDCookieService _cachedCookieDatabaseForPath:](v5, "_cachedCookieDatabaseForPath:", v8));
      if (v9)
      {
        uint64_t v10 = (void *)v9;
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsCookiesConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsCookiesConfig"));
        if (!v11) {
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
        }
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          uint64_t v13 = AMSLogKey();
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          uint64_t v16 = objc_opt_class(v5, v15);
          uint64_t v17 = v16;
          if (v14)
          {
            uint64_t v18 = AMSLogKey();
            v5 = (AMSDCookieService *)objc_claimAutoreleasedReturnValue(v18);
            __int16 v19 = (AMSDCookieService *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v17,  v5));
          }

          else
          {
            __int16 v19 = (AMSDCookieService *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: ",  v16));
          }

          uint64_t v20 = AMSHashIfNeeded(v10);
          __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          *(_DWORD *)buf = 138543618;
          __int16 v24 = v19;
          __int16 v25 = 2114;
          __int16 v26 = v21;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%{public}@Found cached cookie database. %{public}@",  buf,  0x16u);
          if (v14)
          {

            __int16 v19 = v5;
          }
        }
      }

      else
      {
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[AMSCookieDatabase cookieDatabaseForIdentifiers:error:]( &OBJC_CLASS___AMSCookieDatabase,  "cookieDatabaseForIdentifiers:error:",  v7,  a4));
        if (v10) {
          -[AMSDCookieService _cacheCookieDatabase:withPath:](v5, "_cacheCookieDatabase:withPath:", v10, v8);
        }
      }
    }

    else
    {
      uint64_t v10 = 0LL;
    }
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  return v10;
}

- (id)_uniqueIdentifiersForAccount:(id)a3 error:(id *)a4
{
  id v7 = a3;
  uint64_t v8 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsCookiesConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsCookiesConfig"));
  if (!v9) {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = AMSLogKey();
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v14 = objc_opt_class(self, v13);
    if (v12)
    {
      uint64_t v15 = AMSLogKey();
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      uint64_t v17 = NSStringFromSelector(a2);
      uint64_t v4 = objc_claimAutoreleasedReturnValue(v17);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] %@ ",  v14,  v16,  v4));
    }

    else
    {
      __int16 v19 = NSStringFromSelector(a2);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v19);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: %@ ",  v14,  v16));
    }

    uint64_t v20 = AMSHashIfNeeded(v7);
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    *(_DWORD *)buf = 138543618;
    v217 = v18;
    __int16 v218 = 2114;
    v219 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%{public}@Determining identifier(s) for account: %{public}@",  buf,  0x16u);
    if (v12)
    {

      uint64_t v18 = (void *)v4;
    }

    uint64_t v8 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
  }

  v199 = a4;

  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 3LL));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 3LL));
  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ams_DSID"));
  __int16 v25 = v24;
  v210 = v24;
  v211 = v23;
  v209 = self;
  id v212 = v7;
  if (v24)
  {
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v24 stringValue]);
    if (objc_msgSend(v7, "ams_isSandboxAccount"))
    {
      uint64_t v27 = objc_claimAutoreleasedReturnValue([v26 stringByAppendingString:@".sandbox"]);

      __int16 v26 = (void *)v27;
    }

    __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDCookieService dsidHashCache](self, "dsidHashCache"));
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:v26]);

    if (v29)
    {
      v30 = 0LL;
    }

    else
    {
      id v215 = 0LL;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "ams_sha512HashStringUsingEncoding:error:", 4, &v215));
      id v42 = v215;
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDCookieService dsidHashCache](self, "dsidHashCache"));
      [v43 setObject:v29 forKey:v25];

      if (!v29)
      {
        if (!v42) {
          goto LABEL_33;
        }
        v30 = v42;
        v57 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsCookiesConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsCookiesConfig"));
        if (!v57) {
          v57 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
        }
        v58 = (os_log_s *)objc_claimAutoreleasedReturnValue([v57 OSLogObject]);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          v201 = v30;
          uint64_t v59 = AMSLogKey();
          v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
          uint64_t v62 = objc_opt_class(self, v61);
          if (v60)
          {
            uint64_t v63 = AMSLogKey();
            uint64_t v64 = objc_claimAutoreleasedReturnValue(v63);
            v65 = NSStringFromSelector(a2);
            uint64_t v197 = objc_claimAutoreleasedReturnValue(v65);
            v198 = (void *)v64;
            v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] %@ ",  v62,  v64,  v197));
          }

          else
          {
            v187 = NSStringFromSelector(a2);
            v198 = (void *)objc_claimAutoreleasedReturnValue(v187);
            v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: %@ ",  v62,  v198));
          }

          uint64_t v188 = AMSHashIfNeeded(v25);
          v189 = (void *)objc_claimAutoreleasedReturnValue(v188);
          v30 = v201;
          uint64_t v190 = AMSLogableError(v201);
          v191 = (void *)objc_claimAutoreleasedReturnValue(v190);
          *(_DWORD *)buf = 138543874;
          v217 = v66;
          __int16 v218 = 2114;
          v219 = v189;
          __int16 v220 = 2114;
          v221 = v191;
          _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_ERROR,  "%{public}@Could not hash DSID: %{public}@ | error: %{public}@",  buf,  0x20u);
          if (v60)
          {

            v66 = (void *)v197;
          }

          __int16 v25 = v210;
          v23 = v211;
          uint64_t v8 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
        }

        [v23 addObject:v30];
LABEL_32:

LABEL_33:
        id v7 = v212;
        goto LABEL_45;
      }

      v30 = v42;
    }

    v44 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsCookiesConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsCookiesConfig"));
    if (!v44) {
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v45 = (os_log_s *)objc_claimAutoreleasedReturnValue([v44 OSLogObject]);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
    {
      v200 = v30;
      v46 = self;
      v47 = v22;
      uint64_t v48 = AMSLogKey();
      v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
      uint64_t v51 = objc_opt_class(v46, v50);
      if (v49)
      {
        uint64_t v52 = AMSLogKey();
        v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
        v54 = NSStringFromSelector(a2);
        __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] %@ ",  v51,  v53,  v22));
      }

      else
      {
        v56 = NSStringFromSelector(a2);
        v53 = (void *)objc_claimAutoreleasedReturnValue(v56);
        v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: %@ ",  v51,  v53));
      }

      *(_DWORD *)buf = 138543618;
      v217 = v55;
      __int16 v218 = 2114;
      v219 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEBUG,  "%{public}@Adding identifier for DSID: %{public}@",  buf,  0x16u);
      v30 = v200;
      if (v49)
      {

        v55 = v22;
      }

      __int16 v22 = v47;
      __int16 v25 = v210;
      v23 = v211;
      uint64_t v8 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
      self = v209;
    }

    [v22 addObject:v29];
    goto LABEL_32;
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsCookiesConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsCookiesConfig"));
  if (!v31) {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v31 OSLogObject]);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    v33 = v22;
    uint64_t v34 = AMSLogKey();
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    uint64_t v37 = objc_opt_class(self, v36);
    if (v35)
    {
      uint64_t v38 = AMSLogKey();
      v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
      v40 = NSStringFromSelector(a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] %@ ",  v37,  v39,  v23));
    }

    else
    {
      v67 = NSStringFromSelector(a2);
      v39 = (void *)objc_claimAutoreleasedReturnValue(v67);
      v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: %@ ",  v37,  v39));
    }

    *(_DWORD *)buf = 138543362;
    v217 = v41;
    _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEBUG,  "%{public}@Skipping DSID as the account doesn’t have one.",  buf,  0xCu);
    if (v35)
    {

      v41 = v23;
    }

    __int16 v22 = v33;
    __int16 v25 = 0LL;
    v23 = v211;
    uint64_t v8 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
  }

  uint64_t v68 = AMSError(111LL, @"Account Missing DSID", 0LL, 0LL);
  __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(v68);
  [v23 addObject:v26];
LABEL_45:

  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ams_altDSID"));
  if (objc_msgSend(v7, "ams_isSandboxAccount"))
  {
    uint64_t v70 = objc_claimAutoreleasedReturnValue([v69 stringByAppendingString:@".sandbox"]);

    v69 = (void *)v70;
  }

  if (!v69)
  {
    v74 = (void *)objc_claimAutoreleasedReturnValue([v8[507] sharedAccountsCookiesConfig]);
    if (!v74) {
      v74 = (void *)objc_claimAutoreleasedReturnValue([v8[507] sharedConfig]);
    }
    v75 = (os_log_s *)objc_claimAutoreleasedReturnValue([v74 OSLogObject]);
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
    {
      v76 = v22;
      uint64_t v77 = AMSLogKey();
      v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
      uint64_t v80 = objc_opt_class(self, v79);
      if (v78)
      {
        uint64_t v81 = AMSLogKey();
        v82 = (void *)objc_claimAutoreleasedReturnValue(v81);
        v83 = NSStringFromSelector(a2);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] %@ ",  v80,  v82,  v23));
      }

      else
      {
        v109 = NSStringFromSelector(a2);
        v82 = (void *)objc_claimAutoreleasedReturnValue(v109);
        v84 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: %@ ",  v80,  v82));
      }

      *(_DWORD *)buf = 138543362;
      v217 = v84;
      _os_log_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_DEBUG,  "%{public}@Skipping AltDSID as the account doesn’t have one.",  buf,  0xCu);
      if (v78)
      {

        v84 = v23;
      }

      __int16 v22 = v76;
      __int16 v25 = v210;
      v23 = v211;
      uint64_t v8 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
      v69 = 0LL;
    }

    uint64_t v110 = AMSError(112LL, @"Account Missing AltDSID", 0LL, 0LL);
    id v73 = (id)objc_claimAutoreleasedReturnValue(v110);
    [v23 addObject:v73];
    goto LABEL_78;
  }

  v71 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDCookieService altDSIDHashCache](self, "altDSIDHashCache"));
  v72 = (void *)objc_claimAutoreleasedReturnValue([v71 objectForKey:v69]);

  if (v72)
  {
    id v73 = 0LL;
  }

  else
  {
    v85 = self;
    id v214 = 0LL;
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "ams_sha512HashStringUsingEncoding:error:", 4, &v214));
    id v73 = v214;
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDCookieService altDSIDHashCache](v85, "altDSIDHashCache"));
    [v86 setObject:v72 forKey:v69];

    if (!v72)
    {
      id v7 = v212;
      if (!v73) {
        goto LABEL_79;
      }
      v99 = (void *)objc_claimAutoreleasedReturnValue([v8[507] sharedAccountsCookiesConfig]);
      if (!v99) {
        v99 = (void *)objc_claimAutoreleasedReturnValue([v8[507] sharedConfig]);
      }
      v100 = (os_log_s *)objc_claimAutoreleasedReturnValue([v99 OSLogObject]);
      if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
      {
        uint64_t v101 = AMSLogKey();
        v102 = (void *)objc_claimAutoreleasedReturnValue(v101);
        uint64_t v104 = objc_opt_class(v209, v103);
        if (v102)
        {
          uint64_t v105 = AMSLogKey();
          uint64_t v106 = objc_claimAutoreleasedReturnValue(v105);
          v107 = NSStringFromSelector(a2);
          v198 = (void *)objc_claimAutoreleasedReturnValue(v107);
          v203 = (void *)v106;
          v108 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] %@ ",  v104,  v106,  v198));
        }

        else
        {
          v192 = NSStringFromSelector(a2);
          v203 = (void *)objc_claimAutoreleasedReturnValue(v192);
          v108 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: %@ ",  v104,  v203));
        }

        uint64_t v193 = AMSHashIfNeeded(v69);
        v194 = (void *)objc_claimAutoreleasedReturnValue(v193);
        uint64_t v195 = AMSLogableError(v73);
        v196 = (void *)objc_claimAutoreleasedReturnValue(v195);
        *(_DWORD *)buf = 138543874;
        v217 = v108;
        __int16 v218 = 2114;
        v219 = v194;
        __int16 v220 = 2114;
        v221 = v196;
        _os_log_impl( (void *)&_mh_execute_header,  v100,  OS_LOG_TYPE_ERROR,  "%{public}@Could not hash AltDSID: %{public}@ | error: %{public}@",  buf,  0x20u);
        if (v102)
        {

          v108 = v198;
        }

        __int16 v25 = v210;
        v23 = v211;
        uint64_t v8 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
      }

      [v23 addObject:v73];
      goto LABEL_66;
    }
  }

  v87 = (void *)objc_claimAutoreleasedReturnValue([v8[507] sharedAccountsCookiesConfig]);
  if (!v87) {
    v87 = (void *)objc_claimAutoreleasedReturnValue([v8[507] sharedConfig]);
  }
  v88 = (os_log_s *)objc_claimAutoreleasedReturnValue([v87 OSLogObject]);
  if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
  {
    v202 = v69;
    v89 = v22;
    uint64_t v90 = AMSLogKey();
    v91 = (void *)objc_claimAutoreleasedReturnValue(v90);
    uint64_t v93 = objc_opt_class(v209, v92);
    if (v91)
    {
      uint64_t v94 = AMSLogKey();
      v95 = (void *)objc_claimAutoreleasedReturnValue(v94);
      v96 = NSStringFromSelector(a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v96);
      v97 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] %@ ",  v93,  v95,  v23));
    }

    else
    {
      v98 = NSStringFromSelector(a2);
      v95 = (void *)objc_claimAutoreleasedReturnValue(v98);
      v97 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: %@ ",  v93,  v95));
    }

    *(_DWORD *)buf = 138543618;
    v217 = v97;
    __int16 v218 = 2114;
    v219 = v72;
    _os_log_impl( (void *)&_mh_execute_header,  v88,  OS_LOG_TYPE_DEBUG,  "%{public}@Adding identifier for AltDSID: %{public}@",  buf,  0x16u);
    if (v91)
    {

      v97 = v23;
    }

    __int16 v22 = v89;
    __int16 v25 = v210;
    v23 = v211;
    uint64_t v8 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
    v69 = v202;
  }

  [v22 addObject:v72];
LABEL_66:
  id v7 = v212;
LABEL_78:

LABEL_79:
  v111 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  v112 = v111;
  if (!v111)
  {
    if (os_variant_has_internal_content("com.apple.AppleMediaServices"))
    {
      unsigned int v125 = +[AMSUnitTests isRunningUnitTests](&OBJC_CLASS___AMSUnitTests, "isRunningUnitTests");
      uint64_t v126 = objc_claimAutoreleasedReturnValue([v8[507] sharedAccountsCookiesConfig]);
      v127 = (void *)v126;
      if (v125)
      {
        if (!v126) {
          v127 = (void *)objc_claimAutoreleasedReturnValue([v8[507] sharedConfig]);
        }
        v128 = (os_log_s *)objc_claimAutoreleasedReturnValue([v127 OSLogObject]);
        if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
        {
          v205 = v69;
          uint64_t v129 = AMSLogKey();
          v130 = (void *)objc_claimAutoreleasedReturnValue(v129);
          uint64_t v132 = objc_opt_class(v209, v131);
          uint64_t v133 = v132;
          v134 = v22;
          if (v130)
          {
            uint64_t v135 = AMSLogKey();
            v23 = (void *)objc_claimAutoreleasedReturnValue(v135);
            v136 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v133,  v23));
          }

          else
          {
            v136 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: ",  v132));
          }

          uint64_t v173 = AMSHashIfNeeded(v7);
          v174 = (void *)objc_claimAutoreleasedReturnValue(v173);
          *(_DWORD *)buf = 138543618;
          v217 = v136;
          __int16 v218 = 2114;
          v219 = v174;
          _os_log_impl( (void *)&_mh_execute_header,  v128,  OS_LOG_TYPE_ERROR,  "%{public}@Empty identifier for account: %{public}@",  buf,  0x16u);
          if (v130)
          {

            v136 = v23;
          }

          __int16 v22 = v134;
          __int16 v25 = v210;
          v23 = v211;
          uint64_t v8 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
          v69 = v205;
        }

        v127 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        v146 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8[507] sharedAccountsCookiesConfig]);
        [v127 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v146 userInfo:0];
      }

      else
      {
        if (!v126) {
          v127 = (void *)objc_claimAutoreleasedReturnValue([v8[507] sharedConfig]);
        }
        v146 = (os_log_s *)objc_claimAutoreleasedReturnValue([v127 OSLogObject]);
        if (os_log_type_enabled(v146, OS_LOG_TYPE_FAULT))
        {
          v207 = v69;
          uint64_t v147 = AMSLogKey();
          v148 = (void *)objc_claimAutoreleasedReturnValue(v147);
          uint64_t v150 = objc_opt_class(v209, v149);
          uint64_t v151 = v150;
          v152 = v22;
          if (v148)
          {
            uint64_t v153 = AMSLogKey();
            v23 = (void *)objc_claimAutoreleasedReturnValue(v153);
            v154 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v151,  v23));
          }

          else
          {
            v154 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: ",  v150));
          }

          uint64_t v175 = AMSHashIfNeeded(v7);
          v176 = (void *)objc_claimAutoreleasedReturnValue(v175);
          *(_DWORD *)buf = 138543618;
          v217 = v154;
          __int16 v218 = 2114;
          v219 = v176;
          _os_log_impl( (void *)&_mh_execute_header,  v146,  OS_LOG_TYPE_FAULT,  "%{public}@Empty identifier for account: %{public}@",  buf,  0x16u);
          if (v148)
          {

            v154 = v23;
          }

          __int16 v22 = v152;
          __int16 v25 = v210;
          v23 = v211;
          v69 = v207;
        }
      }
    }

    v170 = @"Account Missing Identifier";
    uint64_t v172 = 113LL;
    v171 = 0LL;
    goto LABEL_134;
  }

  if (([v111 containsString:@"/"] & 1) != 0
    || ([v112 containsString:@"."] & 1) != 0
    || [v112 containsString:@"~"])
  {
    if (os_variant_has_internal_content("com.apple.AppleMediaServices"))
    {
      unsigned int v113 = +[AMSUnitTests isRunningUnitTests](&OBJC_CLASS___AMSUnitTests, "isRunningUnitTests");
      uint64_t v114 = objc_claimAutoreleasedReturnValue([v8[507] sharedAccountsCookiesConfig]);
      v115 = (void *)v114;
      if (v113)
      {
        if (!v114) {
          v115 = (void *)objc_claimAutoreleasedReturnValue([v8[507] sharedConfig]);
        }
        v116 = (os_log_s *)objc_claimAutoreleasedReturnValue([v115 OSLogObject]);
        if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
        {
          v204 = v69;
          uint64_t v117 = AMSLogKey();
          v118 = (void *)objc_claimAutoreleasedReturnValue(v117);
          uint64_t v120 = objc_opt_class(v209, v119);
          uint64_t v121 = v120;
          v122 = v22;
          if (v118)
          {
            uint64_t v123 = AMSLogKey();
            v23 = (void *)objc_claimAutoreleasedReturnValue(v123);
            v124 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v121,  v23));
          }

          else
          {
            v124 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: ",  v120));
          }

          uint64_t v166 = AMSHashIfNeeded(v7);
          v167 = (void *)objc_claimAutoreleasedReturnValue(v166);
          *(_DWORD *)buf = 138543618;
          v217 = v124;
          __int16 v218 = 2114;
          v219 = v167;
          _os_log_impl( (void *)&_mh_execute_header,  v116,  OS_LOG_TYPE_ERROR,  "%{public}@Invalid identifier for account: %{public}@",  buf,  0x16u);
          if (v118)
          {

            v124 = v23;
          }

          __int16 v22 = v122;
          __int16 v25 = v210;
          v23 = v211;
          uint64_t v8 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
          v69 = v204;
        }

        v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        v137 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8[507] sharedAccountsCookiesConfig]);
        [v115 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v137 userInfo:0];
      }

      else
      {
        if (!v114) {
          v115 = (void *)objc_claimAutoreleasedReturnValue([v8[507] sharedConfig]);
        }
        v137 = (os_log_s *)objc_claimAutoreleasedReturnValue([v115 OSLogObject]);
        if (os_log_type_enabled(v137, OS_LOG_TYPE_FAULT))
        {
          v206 = v69;
          uint64_t v138 = AMSLogKey();
          v139 = (void *)objc_claimAutoreleasedReturnValue(v138);
          uint64_t v141 = objc_opt_class(v209, v140);
          uint64_t v142 = v141;
          v143 = v22;
          if (v139)
          {
            uint64_t v144 = AMSLogKey();
            v23 = (void *)objc_claimAutoreleasedReturnValue(v144);
            v145 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v142,  v23));
          }

          else
          {
            v145 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: ",  v141));
          }

          uint64_t v168 = AMSHashIfNeeded(v7);
          v169 = (void *)objc_claimAutoreleasedReturnValue(v168);
          *(_DWORD *)buf = 138543618;
          v217 = v145;
          __int16 v218 = 2114;
          v219 = v169;
          _os_log_impl( (void *)&_mh_execute_header,  v137,  OS_LOG_TYPE_FAULT,  "%{public}@Invalid identifier for account: %{public}@",  buf,  0x16u);
          if (v139)
          {

            v145 = v23;
          }

          __int16 v22 = v143;
          __int16 v25 = v210;
          v23 = v211;
          v69 = v206;
        }
      }
    }

    v170 = @"Invalid account identifier";
    v171 = @"Expected the account identifier not to contain path components";
    uint64_t v172 = 2LL;
LABEL_134:
    uint64_t v177 = AMSError(v172, v170, v171, 0LL);
    v178 = (void *)objc_claimAutoreleasedReturnValue(v177);
    v179 = v23;
    goto LABEL_135;
  }

  v155 = (void *)objc_claimAutoreleasedReturnValue([v8[507] sharedAccountsCookiesConfig]);
  if (!v155) {
    v155 = (void *)objc_claimAutoreleasedReturnValue([v8[507] sharedConfig]);
  }
  v156 = (os_log_s *)objc_claimAutoreleasedReturnValue([v155 OSLogObject]);
  if (os_log_type_enabled(v156, OS_LOG_TYPE_DEBUG))
  {
    v208 = v69;
    v157 = v22;
    uint64_t v158 = AMSLogKey();
    v159 = (void *)objc_claimAutoreleasedReturnValue(v158);
    uint64_t v161 = objc_opt_class(v209, v160);
    if (v159)
    {
      uint64_t v162 = AMSLogKey();
      v163 = (void *)objc_claimAutoreleasedReturnValue(v162);
      v164 = NSStringFromSelector(a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v164);
      v165 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] %@ ",  v161,  v163,  v23));
    }

    else
    {
      v186 = NSStringFromSelector(a2);
      v163 = (void *)objc_claimAutoreleasedReturnValue(v186);
      v165 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: %@ ",  v161,  v163));
    }

    *(_DWORD *)buf = 138543618;
    v217 = v165;
    __int16 v218 = 2114;
    v219 = v112;
    _os_log_impl( (void *)&_mh_execute_header,  v156,  OS_LOG_TYPE_DEBUG,  "%{public}@Adding account identifier: %{public}@",  buf,  0x16u);
    if (v159)
    {

      v165 = v23;
    }

    __int16 v22 = v157;
    __int16 v25 = v210;
    v23 = v211;
    v69 = v208;
  }

  v178 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  v179 = v22;
LABEL_135:
  [v179 addObject:v178];

  if (![v22 count])
  {
    if ((unint64_t)[v23 count] < 2)
    {
      v181 = v199;
      if ([v23 count] == (id)1)
      {
        if (v199)
        {
          v183 = (void *)objc_claimAutoreleasedReturnValue([v23 objectAtIndexedSubscript:0]);
          goto LABEL_145;
        }
      }

      else if (v199)
      {
        uint64_t v184 = AMSError(0LL, 0LL, 0LL, 0LL);
        v183 = (void *)objc_claimAutoreleasedReturnValue(v184);
        goto LABEL_145;
      }
    }

    else
    {
      v181 = v199;
      if (v199)
      {
        uint64_t v182 = AMSErrorWithMultipleUnderlyingErrors( 2LL,  @"Account missing identifiers",  @"The account is missing multiple identifiers.",  v23);
        v183 = (void *)objc_claimAutoreleasedReturnValue(v182);
LABEL_145:
        id v180 = 0LL;
        id *v181 = v183;
        goto LABEL_147;
      }
    }

    id v180 = 0LL;
    goto LABEL_147;
  }

  id v180 = v22;
LABEL_147:

  return v180;
}

- (AMSDCookieService)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___AMSDCookieService;
  v2 = -[AMSDCookieService init](&v16, "init");
  if (v2)
  {
    v3 = -[AMSLRUCache initWithMaxSize:](objc_alloc(&OBJC_CLASS___AMSLRUCache), "initWithMaxSize:", 10LL);
    altDSIDHashCache = v2->_altDSIDHashCache;
    v2->_altDSIDHashCache = v3;

    v5 = -[AMSLRUCache initWithMaxSize:](objc_alloc(&OBJC_CLASS___AMSLRUCache), "initWithMaxSize:", 10LL);
    dsidHashCache = v2->_dsidHashCache;
    v2->_dsidHashCache = v5;

    id v7 = objc_alloc_init(&OBJC_CLASS___AMSLRUCache);
    cookiePropertyCache = v2->_cookiePropertyCache;
    v2->_cookiePropertyCache = v7;

    uint64_t v9 = -[AMSLRUCache initWithMaxSize:](objc_alloc(&OBJC_CLASS___AMSLRUCache), "initWithMaxSize:", 10LL);
    cookieDatabaseCache = v2->_cookieDatabaseCache;
    v2->_cookieDatabaseCache = v9;

    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.AppleMediaServices.CookieStorage", v12);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v13;
  }

  return v2;
}

+ (AMSDCookieService)sharedService
{
  if (qword_1000F1F80 != -1) {
    dispatch_once(&qword_1000F1F80, &stru_1000D5F48);
  }
  return (AMSDCookieService *)(id)qword_1000F1F88;
}

- (void)clearAllCachedCookieProperties
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsCookiesConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsCookiesConfig"));
  if (!v5) {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = AMSLogKey();
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v10 = objc_opt_class(self, v9);
    uint64_t v11 = v10;
    if (v8)
    {
      uint64_t v12 = AMSLogKey();
      uint64_t v2 = objc_claimAutoreleasedReturnValue(v12);
      dispatch_queue_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v11,  v2));
    }

    else
    {
      dispatch_queue_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: ", v10));
    }

    uint64_t v14 = NSStringFromSelector(a2);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(_DWORD *)buf = 138543618;
    __int16 v19 = v13;
    __int16 v20 = 2114;
    __int16 v21 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%{public}@%{public}@ - taking keepalive transaction",  buf,  0x16u);
    if (v8)
    {

      dispatch_queue_t v13 = (void *)v2;
    }
  }

  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDCookieService queue](self, "queue"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10000F1C4;
  v17[3] = &unk_1000D5F70;
  v17[4] = self;
  v17[5] = a2;
  +[AMSDTransactionStore takeKeepAliveTransaction:withQueue:whilePerformingBlock:]( &OBJC_CLASS___AMSDTransactionStore,  "takeKeepAliveTransaction:withQueue:whilePerformingBlock:",  @"com.apple.amsaccountsd.AMSDCookieService.clearAllCachedCookies",  v16,  v17);
}

- (id)clearDanglingCookieDatabases
{
  uint64_t v3 = AMSLogKey(self, a2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[AMSDTransactionStore takeKeepAliveTransaction:]( &OBJC_CLASS___AMSDTransactionStore,  "takeKeepAliveTransaction:",  @"com.apple.amsaccountsd.AMSDCookieService.clearDanglingCookieDatabases");
  v5 = objc_alloc_init(&OBJC_CLASS___AMSMutableBinaryPromise);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDCookieService _alliTunesAccountIdentifiers](self, "_alliTunesAccountIdentifiers"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  void v11[2] = sub_10000F574;
  v11[3] = &unk_1000D5FC0;
  v11[4] = self;
  id v12 = v4;
  dispatch_queue_t v13 = @"com.apple.amsaccountsd.AMSDCookieService.clearDanglingCookieDatabases";
  id v7 = v4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 thenWithBlock:v11]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 binaryPromiseAdapter]);
  -[AMSMutableBinaryPromise finishWithPromise:](v5, "finishWithPromise:", v9);

  return v5;
}

- (void)clearDanglingCookieDatabasesWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDCookieService clearDanglingCookieDatabases](self, "clearDanglingCookieDatabases"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000F850;
  v7[3] = &unk_1000D5FE8;
  id v8 = v4;
  id v6 = v4;
  [v5 addFinishBlock:v7];
}

- (void)getCookieDatabasePathForAccount:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDCookieService queue](self, "queue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  void v11[2] = sub_10000F978;
  v11[3] = &unk_1000D6010;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  +[AMSDTransactionStore takeKeepAliveTransaction:withQueue:whilePerformingSyncBlock:]( &OBJC_CLASS___AMSDTransactionStore,  "takeKeepAliveTransaction:withQueue:whilePerformingSyncBlock:",  @"com.apple.amsaccountsd.AMSDCookieService.getCookieDatabasePath",  v8,  v11);
}

- (void)getCookiePropertiesForAccount:(id)a3 withCompletion:(id)a4
{
}

- (void)getCookiePropertiesForAccount:(id)a3 cookieDatabaseOnly:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsCookiesConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsCookiesConfig"));
  if (!v11) {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = objc_opt_class(self, v13);
    uint64_t v16 = AMSLogKey(v14, v15);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    uint64_t v18 = AMSHashIfNeeded(v9);
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    __int16 v20 = (void *)v19;
    __int16 v21 = @"false";
    *(_DWORD *)buf = 138544130;
    uint64_t v31 = v14;
    __int16 v32 = 2114;
    if (v6) {
      __int16 v21 = @"true";
    }
    v33 = v17;
    __int16 v34 = 2114;
    uint64_t v35 = v19;
    __int16 v36 = 2114;
    uint64_t v37 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "%{public}@: [%{public}@] Getting cookies. account = %{public}@ | cookieDatabaseOnly = %{public}@",  buf,  0x2Au);
  }

  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDCookieService queue](self, "queue"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10000FC2C;
  v25[3] = &unk_1000D6038;
  v25[4] = self;
  id v26 = v9;
  BOOL v29 = v6;
  id v27 = v10;
  SEL v28 = a2;
  id v23 = v10;
  id v24 = v9;
  +[AMSDTransactionStore takeKeepAliveTransaction:withQueue:whilePerformingSyncBlock:]( &OBJC_CLASS___AMSDTransactionStore,  "takeKeepAliveTransaction:withQueue:whilePerformingSyncBlock:",  @"com.apple.amsaccountsd.AMSDCookieService.getCookies",  v22,  v25);
}

- (id)getCookiePropertiesForAccount:(id)a3 cookieDatabaseOnly:(BOOL)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = v8;
  if (a4
    || (id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]), v10, !v10)
    || (uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]),
        id v12 = (void *)objc_claimAutoreleasedReturnValue( -[AMSDCookieService _cachedCookiePropertiesForIdentifier:]( self,  "_cachedCookiePropertiesForIdentifier:",  v11)),  v11,  !v12))
  {
    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue( -[AMSDCookieService _cookieDatabaseForAccount:error:]( self,  "_cookieDatabaseForAccount:error:",  v9,  a5));
    uint64_t v13 = v25;
    if (v25)
    {
      uint64_t v26 = objc_claimAutoreleasedReturnValue([v25 cookiePropertiesWithError:a5]);
      if (v26)
      {
        id v27 = (void *)v26;
        if (a4)
        {
          id v28 = 0LL;
          goto LABEL_37;
        }

        id v42 = (void *)objc_claimAutoreleasedReturnValue([v9 accountPropertyForKey:@"cookies"]);
        if (v42)
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsCookiesConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsCookiesConfig"));
          if (!v43) {
            v43 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
          }
          v44 = (os_log_s *)objc_claimAutoreleasedReturnValue([v43 OSLogObject]);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v46 = objc_opt_class(self, v45);
            uint64_t v48 = AMSLogKey(v46, v47);
            v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
            *(_DWORD *)buf = 138543618;
            uint64_t v83 = v46;
            __int16 v84 = 2114;
            v85 = v49;
            _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEBUG,  "%{public}@: [%{public}@] Account has unexpected cookies in Accounts database. Cookies should be in coookie database instead. These cookies will migrated on next account save.",  buf,  0x16u);
          }

          uint64_t v51 = objc_opt_class(&OBJC_CLASS___NSArray, v50);
          if ((objc_opt_isKindOfClass(v42, v51) & 1) != 0)
          {
            id v28 = v42;
LABEL_36:

LABEL_37:
            if ([v28 count])
            {
              v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSHTTPCookie ams_cookiesByMergingProperties:intoProperties:]( &OBJC_CLASS___NSHTTPCookie,  "ams_cookiesByMergingProperties:intoProperties:",  v28,  v27));
              uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSHTTPCookie ams_propertiesForCookies:]( &OBJC_CLASS___NSHTTPCookie,  "ams_propertiesForCookies:",  v60));

              uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsCookiesConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsCookiesConfig"));
              if (!v62) {
                uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
              }
              uint64_t v63 = (os_log_s *)objc_claimAutoreleasedReturnValue([v62 OSLogObject]);
              if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v79 = objc_opt_class(self, v64);
                uint64_t v66 = AMSLogKey(v79, v65);
                uint64_t v81 = self;
                v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
                id v78 = [v61 count];
                id v68 = [v28 count];
                id v69 = [v60 count];
                *(_DWORD *)buf = 138544386;
                uint64_t v83 = v79;
                __int16 v84 = 2114;
                v85 = v67;
                __int16 v86 = 2048;
                id v87 = v78;
                __int16 v88 = 2048;
                id v89 = v68;
                __int16 v90 = 2048;
                id v91 = v69;
                _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Loaded %lu cookie property dictionaries from database, %lu from Accounts. Par sed and merged into %lu total cookies.",  buf,  0x34u);

                self = v81;
              }

              if (a4) {
                goto LABEL_47;
              }
            }

            else
            {
              uint64_t v61 = v27;
              if (a4)
              {
LABEL_47:
                id v14 = v61;
                id v12 = v14;
                goto LABEL_48;
              }
            }

            uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);

            if (v70)
            {
              v71 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
              -[AMSDCookieService _cacheCookieProperties:forIdentifier:]( self,  "_cacheCookieProperties:forIdentifier:",  v61,  v71);
            }

            goto LABEL_47;
          }

          uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsCookiesConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsCookiesConfig"));
          if (!v52) {
            uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
          }
          v53 = (os_log_s *)objc_claimAutoreleasedReturnValue([v52 OSLogObject]);
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            uint64_t v80 = objc_opt_class(self, v54);
            uint64_t v56 = AMSLogKey(v80, v55);
            v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
            uint64_t v58 = AMSHashIfNeeded(v42);
            uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
            *(_DWORD *)buf = 138543874;
            uint64_t v83 = v80;
            __int16 v84 = 2114;
            v85 = v57;
            __int16 v86 = 2114;
            id v87 = v59;
            _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Unexpected value in Accounts database for cookies: %{public}@",  buf,  0x20u);
          }
        }

        id v28 = 0LL;
        goto LABEL_36;
      }

      id v14 = (id)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsCookiesConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsCookiesConfig"));
      if (!v14) {
        id v14 = (id)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      id v28 = (id)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
      if (!os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
      {
LABEL_22:
        id v12 = 0LL;
LABEL_48:

        goto LABEL_49;
      }

      uint64_t v38 = objc_opt_class(self, v37);
      uint64_t v40 = AMSLogKey(v38, v39);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v40);
      uint64_t v41 = AMSLogableError(*a5);
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(v41);
      *(_DWORD *)buf = 138543874;
      uint64_t v83 = v38;
      __int16 v84 = 2114;
      v85 = v33;
      __int16 v86 = 2114;
      id v87 = v35;
      __int16 v36 = "%{public}@: [%{public}@] Error getting cookie properties: %{public}@";
    }

    else
    {
      id v14 = (id)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsCookiesConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsCookiesConfig"));
      if (!v14) {
        id v14 = (id)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      id v28 = (id)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
      if (!os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
      uint64_t v30 = objc_opt_class(self, v29);
      uint64_t v32 = AMSLogKey(v30, v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      uint64_t v34 = AMSLogableError(*a5);
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      *(_DWORD *)buf = 138543874;
      uint64_t v83 = v30;
      __int16 v84 = 2114;
      v85 = v33;
      __int16 v86 = 2114;
      id v87 = v35;
      __int16 v36 = "%{public}@: [%{public}@] Error getting cookie database: %{public}@";
    }

    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v28, OS_LOG_TYPE_ERROR, v36, buf, 0x20u);

    goto LABEL_22;
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsCookiesConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsCookiesConfig"));
  if (!v13) {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v14 = (id)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
  BOOL v15 = os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEBUG);
  if (v15)
  {
    uint64_t v17 = AMSLogKey(v15, v16);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    uint64_t v20 = objc_opt_class(self, v19);
    uint64_t v22 = v20;
    if (v18)
    {
      uint64_t v23 = AMSLogKey(v20, v21);
      self = (AMSDCookieService *)objc_claimAutoreleasedReturnValue(v23);
      id v24 = (AMSDCookieService *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v22,  self));
    }

    else
    {
      id v24 = (AMSDCookieService *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: ",  v20));
    }

    uint64_t v73 = AMSHashIfNeeded(v12);
    v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
    v75 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    uint64_t v76 = AMSHashIfNeeded(v75);
    uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue(v76);
    *(_DWORD *)buf = 138543874;
    uint64_t v83 = (uint64_t)v24;
    __int16 v84 = 2114;
    v85 = v74;
    __int16 v86 = 2114;
    id v87 = v77;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  OS_LOG_TYPE_DEBUG,  "%{public}@Found cached cookie properties. cookieProperties = %{public}@ | identifier = %{public}@",  buf,  0x20u);

    if (v18)
    {

      id v24 = self;
    }
  }

- (void)updateCookiesWithCookiePropertiesToAdd:(id)a3 cookiePropertiesToRemove:(id)a4 forAccount:(id)a5 withCompletion:(id)a6
{
  id v32 = a3;
  id v10 = a4;
  id v31 = a5;
  id v11 = a6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsCookiesConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsCookiesConfig"));
  if (!v12) {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = objc_opt_class(self, v14);
    uint64_t v17 = AMSLogKey(v15, v16);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    uint64_t v19 = (uint64_t (*)(uint64_t, uint64_t))[v32 count];
    id v20 = [v10 count];
    uint64_t v21 = AMSHashIfNeeded(v31);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    *(_DWORD *)buf = 138544386;
    *(void *)&uint8_t buf[4] = v15;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v18;
    *(_WORD *)&buf[22] = 2048;
    uint64_t v47 = v19;
    *(_WORD *)uint64_t v48 = 2048;
    *(void *)&v48[2] = v20;
    *(_WORD *)&v48[10] = 2114;
    *(void *)&v48[12] = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%{public}@: [%{public}@] Updating cookies with %lu to add and %lu to remove. account = %{public}@",  buf,  0x34u);
  }

  v44[0] = 0LL;
  v44[1] = v44;
  v44[2] = 0x2020000000LL;
  char v45 = 0;
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  uint64_t v47 = sub_100010A80;
  *(void *)uint64_t v48 = sub_100010A90;
  *(void *)&v48[8] = 0LL;
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDCookieService queue](self, "queue"));
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_100010A98;
  v37[3] = &unk_1000D6060;
  v37[4] = self;
  SEL v43 = a2;
  id v26 = v31;
  id v38 = v26;
  id v27 = v32;
  id v39 = v27;
  id v28 = v10;
  id v40 = v28;
  uint64_t v41 = v44;
  id v42 = buf;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100010F00;
  v33[3] = &unk_1000D6088;
  id v29 = v11;
  id v34 = v29;
  uint64_t v35 = v44;
  __int16 v36 = buf;
  +[AMSDTransactionStore takeKeepAliveTransaction:withQueue:postActionQueue:whilePerformingBlockOnQueue:postAction:]( &OBJC_CLASS___AMSDTransactionStore,  "takeKeepAliveTransaction:withQueue:postActionQueue:whilePerformingBlockOnQueue:postAction:",  @"com.apple.amsaccountsd.AMSDCookieService.updateCookies",  v23,  v25,  v37,  v33);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v44, 8);
}

+ (BOOL)isConnectionEntitled:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForEntitlement:@"com.apple.private.applemediaservices"]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    id v7 = v4;
  }
  else {
    id v7 = 0LL;
  }

  if ([v7 BOOLValue])
  {
    unsigned __int8 v8 = 1;
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForEntitlement:@"com.apple.itunesstored.private"]);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber, v10);
    if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0) {
      id v12 = v9;
    }
    else {
      id v12 = 0LL;
    }

    unsigned __int8 v8 = [v12 BOOLValue];
  }

  return v8;
}

- (AMSLRUCache)altDSIDHashCache
{
  return self->_altDSIDHashCache;
}

- (AMSLRUCache)dsidHashCache
{
  return self->_dsidHashCache;
}

- (AMSLRUCache)cookiePropertyCache
{
  return self->_cookiePropertyCache;
}

- (AMSLRUCache)cookieDatabaseCache
{
  return self->_cookieDatabaseCache;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

@end