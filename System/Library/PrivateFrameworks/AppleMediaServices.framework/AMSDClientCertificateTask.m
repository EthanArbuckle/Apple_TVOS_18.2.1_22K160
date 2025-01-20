@interface AMSDClientCertificateTask
- (AMSDClientCertificateTask)initWithOptions:(id)a3;
- (AMSKeychainOptions)options;
- (id)_baaOptionsWithOptions:(id)a3 error:(id *)a4;
- (id)performClientCertChainRequest;
- (void)setOptions:(id)a3;
@end

@implementation AMSDClientCertificateTask

- (AMSDClientCertificateTask)initWithOptions:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AMSDClientCertificateTask;
  v6 = -[AMSDClientCertificateTask init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_options, a3);
  }

  return v7;
}

- (id)performClientCertChainRequest
{
  if ((DeviceIdentityIsSupported(self, a2) & 1) != 0)
  {
    objc_initWeak(&location, self);
    id v3 = objc_alloc(&OBJC_CLASS___AMSMutableLazyPromise);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100009A98;
    v9[3] = &unk_1000D5DF0;
    objc_copyWeak(&v10, &location);
    id v4 = [v3 initWithBlock:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    return v4;
  }

  else
  {
    uint64_t v6 = AMSError(5LL, @"Platform Not Supported", @"Device Identity not supported.", 0LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithError:](&OBJC_CLASS___AMSPromise, "promiseWithError:", v7));

    return v8;
  }

- (id)_baaOptionsWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v6 = AMSSetLogKeyIfNeeded(self, a2, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDClientCertificateTask options](self, "options"));
  id v24 = 0LL;
  id v10 = +[AMSKeychain createAccessControlRefWithOptions:error:]( &OBJC_CLASS___AMSKeychain,  "createAccessControlRefWithOptions:error:",  v9,  &v24);
  id v11 = v24;

  if (v10)
  {
    if (!v11) {
      goto LABEL_14;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAttestationConfig](&OBJC_CLASS___AMSLogConfig, "sharedAttestationConfig"));
    if (!v12) {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_opt_class(self, v14);
      *(_DWORD *)buf = 138543874;
      uint64_t v27 = v15;
      __int16 v28 = 2114;
      v29 = v7;
      __int16 v30 = 2114;
      id v31 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Create Cert Chain: ACL creation failed with error: %{public}@",  buf,  0x20u);
    }
  }

  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAttestationConfig](&OBJC_CLASS___AMSLogConfig, "sharedAttestationConfig"));
    if (!v16) {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = objc_opt_class(self, v18);
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v19;
      __int16 v28 = 2114;
      v29 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Create Cert Chain: ACL creation failed",  buf,  0x16u);
    }

    uint64_t v20 = AMSError(600LL, @"Keychain Error", @"Failed to create ACL for cert chain", 0LL);
    v12 = v11;
    id v11 = (id)objc_claimAutoreleasedReturnValue(v20);
  }

LABEL_14:
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  kMAOptionsBAAIgnoreExistingKeychainItems);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v10,  kMAOptionsBAAAccessControls);

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  &off_1000DEBA8,  kMAOptionsBAANetworkTimeoutInterval);
  v25[0] = kMAOptionsBAAOIDAccessControls;
  v25[1] = kMAOptionsBAAOIDUCRTDeviceIdentifiers;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 2LL));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v21,  kMAOptionsBAAOIDSToInclude);

  if (a4) {
    *a4 = v11;
  }
  id v22 = -[NSMutableDictionary copy](v8, "copy");

  return v22;
}

- (AMSKeychainOptions)options
{
  return (AMSKeychainOptions *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end