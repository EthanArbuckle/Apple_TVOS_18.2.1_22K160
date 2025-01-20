@interface AMSDBackgroundActivityScheduler
- (AMSDBackgroundActivityScheduler)initWithIdentifier:(id)a3;
- (BOOL)allowBattery;
- (BOOL)repeats;
- (BOOL)requireInexpensiveNetworkConnection;
- (BOOL)requireNetworkConnection;
- (NSString)identifier;
- (double)interval;
- (id)activityBlock;
- (int64_t)qualityOfService;
- (void)checkIn;
- (void)invalidate;
- (void)schedule;
- (void)setActivityBlock:(id)a3;
- (void)setAllowBattery:(BOOL)a3;
- (void)setInterval:(double)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setRepeats:(BOOL)a3;
- (void)setRequireInexpensiveNetworkConnection:(BOOL)a3;
- (void)setRequireNetworkConnection:(BOOL)a3;
@end

@implementation AMSDBackgroundActivityScheduler

- (AMSDBackgroundActivityScheduler)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AMSDBackgroundActivityScheduler;
  v6 = -[AMSDBackgroundActivityScheduler init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v7->_qualityOfService = 9LL;
  }

  return v7;
}

- (void)setRequireInexpensiveNetworkConnection:(BOOL)a3
{
  if (self->_requireInexpensiveNetworkConnection != a3)
  {
    self->_requireInexpensiveNetworkConnection = a3;
    if (a3) {
      -[AMSDBackgroundActivityScheduler setRequireNetworkConnection:](self, "setRequireNetworkConnection:", 1LL);
    }
  }

- (void)setRequireNetworkConnection:(BOOL)a3
{
  if (self->_requireNetworkConnection != a3)
  {
    self->_requireNetworkConnection = a3;
    if (!a3) {
      -[AMSDBackgroundActivityScheduler setRequireInexpensiveNetworkConnection:]( self,  "setRequireInexpensiveNetworkConnection:",  0LL);
    }
  }

- (void)checkIn
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v3) {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = objc_opt_class(self, v5);
    uint64_t v7 = AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDBackgroundActivityScheduler identifier](self, "identifier"));
    int v14 = 138543874;
    uint64_t v15 = v6;
    __int16 v16 = 2114;
    v17 = v8;
    __int16 v18 = 2114;
    v19 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%{public}@: [%{public}@] Checking in. identifier = %{public}@",  (uint8_t *)&v14,  0x20u);
  }

  v10 = objc_alloc(&OBJC_CLASS___NSBackgroundActivityScheduler);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDBackgroundActivityScheduler identifier](self, "identifier"));
  v12 = -[NSBackgroundActivityScheduler initWithIdentifier:](v10, "initWithIdentifier:", v11);

  -[NSBackgroundActivityScheduler setPreregistered:](v12, "setPreregistered:", 1LL);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDBackgroundActivityScheduler activityBlock](self, "activityBlock"));
  -[NSBackgroundActivityScheduler scheduleWithBlock:](v12, "scheduleWithBlock:", v13);
}

- (void)invalidate
{
  v3 = objc_alloc(&OBJC_CLASS___NSBackgroundActivityScheduler);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDBackgroundActivityScheduler identifier](self, "identifier"));
  uint64_t v5 = -[NSBackgroundActivityScheduler initWithIdentifier:](v3, "initWithIdentifier:", v4);

  -[NSBackgroundActivityScheduler invalidate](v5, "invalidate");
}

- (void)schedule
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v3) {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class(self, v5);
    uint64_t v7 = AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDBackgroundActivityScheduler identifier](self, "identifier"));
    int v64 = 138543874;
    uint64_t v65 = v6;
    __int16 v66 = 2114;
    v67 = v8;
    __int16 v68 = 2114;
    int64_t v69 = (int64_t)v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Scheduling a block for later execution. identifier = %{public}@ | options = {",  (uint8_t *)&v64,  0x20u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v10) {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = objc_opt_class(self, v12);
    uint64_t v14 = AMSLogKey();
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (-[AMSDBackgroundActivityScheduler allowBattery](self, "allowBattery")) {
      __int16 v16 = @"true";
    }
    else {
      __int16 v16 = @"false";
    }
    int v64 = 138543874;
    uint64_t v65 = v13;
    __int16 v66 = 2114;
    v67 = v15;
    __int16 v68 = 2114;
    int64_t v69 = (int64_t)v16;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@]   allowBattery = %{public}@",  (uint8_t *)&v64,  0x20u);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v17) {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 OSLogObject]);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = objc_opt_class(self, v19);
    uint64_t v21 = AMSLogKey();
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    -[AMSDBackgroundActivityScheduler interval](self, "interval");
    int v64 = 138543874;
    uint64_t v65 = v20;
    __int16 v66 = 2114;
    v67 = v22;
    __int16 v68 = 2048;
    int64_t v69 = v23;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@]   interval = %lf",  (uint8_t *)&v64,  0x20u);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v24) {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 OSLogObject]);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = objc_opt_class(self, v26);
    uint64_t v28 = AMSLogKey();
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    int64_t v30 = -[AMSDBackgroundActivityScheduler qualityOfService](self, "qualityOfService");
    int v64 = 138543874;
    uint64_t v65 = v27;
    __int16 v66 = 2114;
    v67 = v29;
    __int16 v68 = 2048;
    int64_t v69 = v30;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@]   qualityOfService = %ld",  (uint8_t *)&v64,  0x20u);
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v31) {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v31 OSLogObject]);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v34 = objc_opt_class(self, v33);
    uint64_t v35 = AMSLogKey();
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    if (-[AMSDBackgroundActivityScheduler repeats](self, "repeats")) {
      v37 = @"true";
    }
    else {
      v37 = @"false";
    }
    int v64 = 138543874;
    uint64_t v65 = v34;
    __int16 v66 = 2114;
    v67 = v36;
    __int16 v68 = 2114;
    int64_t v69 = (int64_t)v37;
    _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@]   repeats = %{public}@",  (uint8_t *)&v64,  0x20u);
  }

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v38) {
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v39 = (os_log_s *)objc_claimAutoreleasedReturnValue([v38 OSLogObject]);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v41 = objc_opt_class(self, v40);
    uint64_t v42 = AMSLogKey();
    v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
    if (-[AMSDBackgroundActivityScheduler requireInexpensiveNetworkConnection]( self,  "requireInexpensiveNetworkConnection"))
    {
      v44 = @"true";
    }

    else
    {
      v44 = @"false";
    }

    int v64 = 138543874;
    uint64_t v65 = v41;
    __int16 v66 = 2114;
    v67 = v43;
    __int16 v68 = 2114;
    int64_t v69 = (int64_t)v44;
    _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@]   requireInexpensiveNetworkConnection = %{public}@",  (uint8_t *)&v64,  0x20u);
  }

  v45 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v45) {
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v46 = (os_log_s *)objc_claimAutoreleasedReturnValue([v45 OSLogObject]);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v48 = objc_opt_class(self, v47);
    uint64_t v49 = AMSLogKey();
    v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
    if (-[AMSDBackgroundActivityScheduler requireNetworkConnection](self, "requireNetworkConnection")) {
      v51 = @"true";
    }
    else {
      v51 = @"false";
    }
    int v64 = 138543874;
    uint64_t v65 = v48;
    __int16 v66 = 2114;
    v67 = v50;
    __int16 v68 = 2114;
    int64_t v69 = (int64_t)v51;
    _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@]   requireNetworkConnection = %{public}@",  (uint8_t *)&v64,  0x20u);
  }

  v52 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v52) {
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v53 = (os_log_s *)objc_claimAutoreleasedReturnValue([v52 OSLogObject]);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v55 = objc_opt_class(self, v54);
    uint64_t v56 = AMSLogKey();
    v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
    int v64 = 138543618;
    uint64_t v65 = v55;
    __int16 v66 = 2114;
    v67 = v57;
    _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] }",  (uint8_t *)&v64,  0x16u);
  }

  v58 = objc_alloc(&OBJC_CLASS___NSBackgroundActivityScheduler);
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDBackgroundActivityScheduler identifier](self, "identifier"));
  v60 = -[NSBackgroundActivityScheduler initWithIdentifier:](v58, "initWithIdentifier:", v59);

  -[AMSDBackgroundActivityScheduler interval](self, "interval");
  -[NSBackgroundActivityScheduler setInterval:](v60, "setInterval:", fmax(v61, 2.0));
  -[NSBackgroundActivityScheduler setQualityOfService:]( v60,  "setQualityOfService:",  -[AMSDBackgroundActivityScheduler qualityOfService](self, "qualityOfService"));
  -[NSBackgroundActivityScheduler setRepeats:]( v60,  "setRepeats:",  -[AMSDBackgroundActivityScheduler repeats](self, "repeats"));
  xpc_object_t v62 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL( v62,  XPC_ACTIVITY_ALLOW_BATTERY,  -[AMSDBackgroundActivityScheduler allowBattery](self, "allowBattery"));
  xpc_dictionary_set_BOOL( v62,  XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY,  -[AMSDBackgroundActivityScheduler requireInexpensiveNetworkConnection](self, "requireInexpensiveNetworkConnection"));
  xpc_dictionary_set_BOOL( v62,  XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY,  -[AMSDBackgroundActivityScheduler requireNetworkConnection](self, "requireNetworkConnection"));
  -[NSBackgroundActivityScheduler _setAdditionalXPCActivityProperties:]( v60,  "_setAdditionalXPCActivityProperties:",  v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDBackgroundActivityScheduler activityBlock](self, "activityBlock"));
  -[NSBackgroundActivityScheduler scheduleWithBlock:](v60, "scheduleWithBlock:", v63);
}

- (id)activityBlock
{
  return self->_activityBlock;
}

- (void)setActivityBlock:(id)a3
{
}

- (BOOL)allowBattery
{
  return self->_allowBattery;
}

- (void)setAllowBattery:(BOOL)a3
{
  self->_allowBattery = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (BOOL)repeats
{
  return self->_repeats;
}

- (void)setRepeats:(BOOL)a3
{
  self->_repeats = a3;
}

- (BOOL)requireInexpensiveNetworkConnection
{
  return self->_requireInexpensiveNetworkConnection;
}

- (BOOL)requireNetworkConnection
{
  return self->_requireNetworkConnection;
}

- (void).cxx_destruct
{
}

@end