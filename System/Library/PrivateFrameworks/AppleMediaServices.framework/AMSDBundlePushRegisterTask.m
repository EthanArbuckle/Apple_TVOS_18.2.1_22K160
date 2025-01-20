@interface AMSDBundlePushRegisterTask
+ (BOOL)_shouldThrottleForAccount:(id)a3 environment:(id)a4;
+ (BOOL)_shouldThrottleForAccount:(id)a3 environment:(id)a4 currentTimestamp:(double)a5;
+ (BOOL)shouldPerformForAccount:(id)a3 environment:(id)a4 token:(id)a5;
+ (id)_createCriteriaWithToken:(id)a3;
+ (id)_sharedTokenLock;
+ (void)_updateThrottleForAccount:(id)a3 environment:(id)a4;
+ (void)_updateThrottleForAccount:(id)a3 environment:(id)a4 throttleTime:(id)a5;
- (ACAccount)account;
- (AMSBag)bag;
- (AMSDBundlePushRegisterTask)initWithAccount:(id)a3 token:(id)a4 environment:(id)a5 bag:(id)a6;
- (NSData)token;
- (NSString)environment;
- (id)perform;
- (void)_updateCachedCriteriaWithToken:(id)a3;
@end

@implementation AMSDBundlePushRegisterTask

- (AMSDBundlePushRegisterTask)initWithAccount:(id)a3 token:(id)a4 environment:(id)a5 bag:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___AMSDBundlePushRegisterTask;
  v15 = -[AMSDBundlePushRegisterTask init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_account, a3);
    objc_storeStrong((id *)&v16->_bag, a6);
    objc_storeStrong((id *)&v16->_environment, a5);
    objc_storeStrong((id *)&v16->_token, a4);
  }

  return v16;
}

- (id)perform
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000087DC;
  v3[3] = &unk_1000D5C50;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue( -[AMSDBundlePushRegisterTask performBinaryTaskWithBlock:]( self,  "performBinaryTaskWithBlock:",  v3));
}

+ (BOOL)shouldPerformForAccount:(id)a3 environment:(id)a4 token:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (!v8 || !v9 || !v10)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
    if (!v12) {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    uint64_t v23 = objc_opt_class(a1, v22);
    uint64_t v24 = AMSLogKey();
    v17 = (void *)objc_claimAutoreleasedReturnValue(v24);
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v8 username]);
    uint64_t v25 = AMSHashIfNeeded(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v25);
    *(_DWORD *)buf = 138544130;
    uint64_t v44 = v23;
    __int16 v45 = 2114;
    v46 = v17;
    __int16 v47 = 2114;
    id v48 = v9;
    __int16 v49 = 2112;
    id v50 = v20;
    v21 = "%{public}@: [%{public}@] No account, environment or token to perform registration. (env: %{public}@, dsid: %@)";
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v21, buf, 0x2Au);

LABEL_19:
LABEL_20:
    char v30 = 0;
    goto LABEL_21;
  }

  if ((objc_msgSend(v8, "ams_isLocalAccount") & 1) == 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
    if (!v12) {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    uint64_t v27 = objc_opt_class(a1, v26);
    uint64_t v28 = AMSLogKey();
    v17 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ams_DSID"));
    *(_DWORD *)buf = 138544130;
    uint64_t v44 = v27;
    __int16 v45 = 2114;
    v46 = v17;
    __int16 v47 = 2114;
    id v48 = v9;
    __int16 v49 = 2112;
    id v50 = v29;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Account is not a local account. (env: %{public}@, dsid: %@)",  buf,  0x2Au);

    goto LABEL_19;
  }

  if ([a1 _shouldThrottleForAccount:v8 environment:v9])
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
    if (!v12) {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    uint64_t v15 = objc_opt_class(a1, v14);
    uint64_t v16 = AMSLogKey();
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v8 username]);
    uint64_t v19 = AMSHashIfNeeded(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    *(_DWORD *)buf = 138544130;
    uint64_t v44 = v15;
    __int16 v45 = 2114;
    v46 = v17;
    __int16 v47 = 2114;
    id v48 = v20;
    __int16 v49 = 2114;
    id v50 = v9;
    v21 = "%{public}@: [%{public}@] Throttling registration for account: %{public}@ environment: %{public}@";
    goto LABEL_14;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _createCriteriaWithToken:v11]);
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ams_registerSuccessCriteria"));
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:v9]);

  unsigned int v33 = -[os_log_s isEqualToString:](v13, "isEqualToString:", v12);
  if (v33)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
    if (!v34) {
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue([v34 OSLogObject]);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v41 = objc_opt_class(a1, v36);
      uint64_t v37 = AMSLogKey();
      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      v42 = (void *)objc_claimAutoreleasedReturnValue([v8 username]);
      uint64_t v39 = AMSHashIfNeeded(v42);
      v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
      *(_DWORD *)buf = 138543874;
      uint64_t v44 = v41;
      __int16 v45 = 2114;
      v46 = v38;
      __int16 v47 = 2114;
      id v48 = v40;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Already posted registration for %{public}@",  buf,  0x20u);
    }
  }

  char v30 = v33 ^ 1;
LABEL_21:

  return v30;
}

+ (id)_createCriteriaWithToken:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDevice deviceName](&OBJC_CLASS___AMSDevice, "deviceName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDevice buildVersion](&OBJC_CLASS___AMSDevice, "buildVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 base64EncodedStringWithOptions:0]);

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<bundle; %@; %@; %@>",
                   v4,
                   v5,
                   v6));

  return v7;
}

+ (id)_sharedTokenLock
{
  if (qword_1000F1F70 != -1) {
    dispatch_once(&qword_1000F1F70, &stru_1000D5D78);
  }
  return (id)qword_1000F1F78;
}

+ (BOOL)_shouldThrottleForAccount:(id)a3 environment:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  LOBYTE(a1) = objc_msgSend(a1, "_shouldThrottleForAccount:environment:currentTimestamp:", v7, v6);

  return (char)a1;
}

+ (BOOL)_shouldThrottleForAccount:(id)a3 environment:(id)a4 currentTimestamp:(double)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ams_pushRegistrationThrottleMap"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ams_DSID"));

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"bundle-%@-%@",  v10,  v7));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v11]);
  [v12 doubleValue];
  BOOL v14 = a5 - v13 < 3600.0;

  return v14;
}

- (void)_updateCachedCriteriaWithToken:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDBundlePushRegisterTask account](self, "account"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ams_registerSuccessCriteria"));
  id v7 = [v6 mutableCopy];
  id v8 = v7;
  if (v7) {
    id v9 = (NSMutableDictionary *)v7;
  }
  else {
    id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  objc_super v18 = v9;

  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_createCriteriaWithToken:", v4);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDBundlePushRegisterTask environment](self, "environment"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v12, v13);

  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDBundlePushRegisterTask account](self, "account"));
  objc_msgSend(v14, "ams_setRegisterSuccessCriteria:", v18);

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDBundlePushRegisterTask account](self, "account"));
  id v17 = objc_msgSend(v15, "ams_saveAccount:", v16);
}

+ (void)_updateThrottleForAccount:(id)a3 environment:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [a1 _updateThrottleForAccount:v7 environment:v6 throttleTime:v8];
}

+ (void)_updateThrottleForAccount:(id)a3 environment:(id)a4 throttleTime:(id)a5
{
  id v19 = a3;
  id v7 = a5;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "ams_pushRegistrationThrottleMap"));
  id v10 = [v9 mutableCopy];
  id v11 = v10;
  if (v10) {
    id v12 = (NSMutableDictionary *)v10;
  }
  else {
    id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  double v13 = v12;

  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "ams_DSID"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"bundle-%@-%@",  v14,  v8));

  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v7, v15);
  id v16 = -[NSMutableDictionary copy](v13, "copy");
  objc_msgSend(v19, "ams_setPushRegistrationThrottleMap:", v16);

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  id v18 = objc_msgSend(v17, "ams_saveAccount:", v19);

  +[AMSStorage amsd_setPushRegistrationThrottleMap:]( &OBJC_CLASS___AMSStorage,  "amsd_setPushRegistrationThrottleMap:",  0LL);
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSBag)bag
{
  return self->_bag;
}

- (NSString)environment
{
  return self->_environment;
}

- (NSData)token
{
  return self->_token;
}

- (void).cxx_destruct
{
}

@end