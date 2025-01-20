@interface AMSDPushRegisterTask
+ (BOOL)_shouldThrottleForAccount:(id)a3 environment:(id)a4;
+ (BOOL)_shouldThrottleForAccount:(id)a3 environment:(id)a4 currentTimestamp:(double)a5;
+ (id)_createCriteriaWithToken:(id)a3;
+ (id)shouldPerformForAccount:(id)a3 environment:(id)a4 token:(id)a5;
+ (void)_updateThrottleForAccount:(id)a3 environment:(id)a4;
+ (void)_updateThrottleForAccount:(id)a3 environment:(id)a4 throttleTime:(id)a5;
- (ACAccount)account;
- (AMSBag)bag;
- (AMSDPushRegisterTask)initWithAccount:(id)a3 token:(id)a4 environment:(id)a5 bag:(id)a6;
- (NSData)token;
- (NSString)environment;
- (id)perform;
- (void)_updateCachedCriteriaWithToken:(id)a3;
@end

@implementation AMSDPushRegisterTask

- (AMSDPushRegisterTask)initWithAccount:(id)a3 token:(id)a4 environment:(id)a5 bag:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___AMSDPushRegisterTask;
  v15 = -[AMSDPushRegisterTask init](&v22, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_account, a3);
    v17 = (NSData *)[v12 copy];
    token = v16->_token;
    v16->_token = v17;

    v19 = (NSString *)[v13 copy];
    environment = v16->_environment;
    v16->_environment = v19;

    objc_storeStrong((id *)&v16->_bag, a6);
  }

  return v16;
}

- (id)perform
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003562C;
  v5[3] = &unk_1000D5B50;
  v5[4] = self;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDPushRegisterTask performTaskWithPromiseBlock:](self, "performTaskWithPromiseBlock:", v5));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 binaryPromiseAdapter]);

  return v3;
}

+ (id)shouldPerformForAccount:(id)a3 environment:(id)a4 token:(id)a5
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
    BOOL v24 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (!v24) {
      goto LABEL_25;
    }
    uint64_t v26 = AMSLogKey(v24, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    uint64_t v29 = objc_opt_class(a1, v28);
    uint64_t v31 = v29;
    if (v27)
    {
      uint64_t v32 = AMSLogKey(v29, v30);
      uint64_t v44 = objc_claimAutoreleasedReturnValue(v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v31,  v44));
    }

    else
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: ", v29));
    }

    uint64_t v36 = AMSHashIfNeeded(v9);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    uint64_t v38 = AMSHashIfNeeded(v8);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    uint64_t v40 = AMSHashIfNeeded(v11);
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    *(_DWORD *)buf = 138544130;
    id v51 = v33;
    __int16 v52 = 2114;
    v53 = v37;
    __int16 v54 = 2114;
    v55 = v39;
    __int16 v56 = 2114;
    v57 = v41;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@No account, environment or token to perform registration. Skipping registration. environment: %{public}@ | account: %{public}@ | token: %{public}@)",  buf,  0x2Au);
    if (v27)
    {

      v33 = (void *)v44;
    }

    goto LABEL_24;
  }

  if (objc_msgSend(v8, "ams_isLocalAccount"))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
    if (!v12) {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (!v14) {
      goto LABEL_25;
    }
    uint64_t v16 = AMSLogKey(v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    uint64_t v19 = objc_opt_class(a1, v18);
    uint64_t v21 = v19;
    if (v17)
    {
      uint64_t v22 = AMSLogKey(v19, v20);
      a1 = (id)objc_claimAutoreleasedReturnValue(v22);
      id v23 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v21,  a1));
    }

    else
    {
      id v23 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: ", v19));
    }

    uint64_t v42 = AMSHashIfNeeded(v9);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v42);
    *(_DWORD *)buf = 138543618;
    id v51 = v23;
    __int16 v52 = 2114;
    v53 = v37;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@Not posting token for the local account. (env: %{public}@)",  buf,  0x16u);
    if (v17)
    {

      id v23 = a1;
    }

LABEL_24:
LABEL_25:

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithResult:](&OBJC_CLASS___AMSPromise, "promiseWithResult:", &__kCFBooleanFalse));
    goto LABEL_26;
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue( +[AMSPushHandler accountIsEligibleForPushNotifications:accountStore:]( &OBJC_CLASS___AMSPushHandler,  "accountIsEligibleForPushNotifications:accountStore:",  v8,  0LL));
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_1000362F0;
  v45[3] = &unk_1000D7770;
  id v49 = a1;
  id v46 = v8;
  id v47 = v9;
  id v48 = v11;
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 thenWithBlock:v45]);

LABEL_26:
  return v35;
}

+ (id)_createCriteriaWithToken:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDevice deviceName](&OBJC_CLASS___AMSDevice, "deviceName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDevice buildVersion](&OBJC_CLASS___AMSDevice, "buildVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 base64EncodedStringWithOptions:0]);

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@; %@; %@>",
                   v4,
                   v5,
                   v6));

  return v7;
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

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v10, v7));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v11]);
  [v12 doubleValue];
  BOOL v14 = a5 - v13 < 3600.0;

  return v14;
}

- (void)_updateCachedCriteriaWithToken:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDPushRegisterTask account](self, "account"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ams_registerSuccessCriteria"));
  id v7 = [v6 mutableCopy];
  id v8 = v7;
  if (v7) {
    id v9 = (NSMutableDictionary *)v7;
  }
  else {
    id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  uint64_t v18 = v9;

  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_createCriteriaWithToken:", v4);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDPushRegisterTask environment](self, "environment"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v12, v13);

  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDPushRegisterTask account](self, "account"));
  objc_msgSend(v14, "ams_setRegisterSuccessCriteria:", v18);

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDPushRegisterTask account](self, "account"));
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
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v14, v8));

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