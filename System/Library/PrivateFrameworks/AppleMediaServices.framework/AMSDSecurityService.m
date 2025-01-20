@interface AMSDSecurityService
+ (BOOL)isConnectionEntitled:(id)a3;
+ (OS_dispatch_queue)sharedPerformQueue;
- (AMSSecurityClientInterface)delegate;
- (BOOL)isActionSupportedForType:(int64_t)a3 account:(id)a4 options:(id)a5 error:(id *)a6;
- (void)_absintheHeadersForRequest:(id)a3 bag:(id)a4 buyParams:(id)a5 completion:(id)a6;
- (void)deleteAllKeysWithCompletion:(id)a3;
- (void)handleResponse:(id)a3 completion:(id)a4;
- (void)hasKeysForAccount:(id)a3 forSignaturePurpose:(unint64_t)a4 completion:(id)a5;
- (void)isActionSupportedForType:(int64_t)a3 account:(id)a4 options:(id)a5 completion:(id)a6;
- (void)isBiometricsAvailableForAccount:(id)a3 completion:(id)a4;
- (void)isDeviceInBiometricLockoutWithCompletion:(id)a3;
- (void)isIdentityMapValidWithCompletion:(id)a3;
- (void)paymentServicesMerchantURLWithCompletion:(id)a3;
- (void)performBiometricTokenUpdateWithAccount:(id)a3 clientInfo:(id)a4 additionalDialogMetrics:(id)a5 shouldGenerateKeysOnly:(BOOL)a6 shouldRequestConfirmation:(BOOL)a7 userInitiated:(BOOL)a8 completion:(id)a9;
- (void)performClientCertChainRequestWithOptions:(id)a3 completion:(id)a4;
- (void)performSilentEnrollmentWithRequest:(id)a3 logKey:(id)a4 completion:(id)a5;
- (void)saveIdentityMapWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)shouldAttemptApplePayWithAccount:(id)a3 options:(id)a4 countryCode:(id)a5 paymentNetworks:(id)a6 completion:(id)a7;
- (void)shouldAttemptApplePayWithCountryCode:(id)a3 paymentNetworks:(id)a4 completion:(id)a5;
- (void)signChallengeForRequest:(id)a3 completion:(id)a4;
- (void)signedHeadersForRequest:(id)a3 buyParams:(id)a4 completion:(id)a5;
@end

@implementation AMSDSecurityService

+ (OS_dispatch_queue)sharedPerformQueue
{
  if (qword_1000F2108 != -1) {
    dispatch_once(&qword_1000F2108, &stru_1000D7D48);
  }
  return (OS_dispatch_queue *)(id)qword_1000F2110;
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

- (void)performClientCertChainRequestWithOptions:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unsigned __int8 v7 = -[AMSDClientCertificateTask initWithOptions:]( objc_alloc(&OBJC_CLASS___AMSDClientCertificateTask),  "initWithOptions:",  v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDClientCertificateTask performClientCertChainRequest](v7, "performClientCertChainRequest"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000428F0;
  v10[3] = &unk_1000D7D70;
  id v11 = v5;
  id v9 = v5;
  [v8 addFinishBlock:v10];
}

- (void)isIdentityMapValidWithCompletion:(id)a3
{
  id v5 = a3;
  id v3 = +[AMSBiometrics isIdentityMapValid](&OBJC_CLASS___AMSBiometrics, "isIdentityMapValid");
  uint64_t v4 = v5;
  if (v5)
  {
    (*((void (**)(id, id, void))v5 + 2))(v5, v3, 0LL);
    uint64_t v4 = v5;
  }
}

- (void)saveIdentityMapWithCompletion:(id)a3
{
  id v4 = a3;
  +[AMSBiometrics saveIdentityMap](&OBJC_CLASS___AMSBiometrics, "saveIdentityMap");
  id v3 = v4;
  if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0LL);
    id v3 = v4;
  }
}

- (BOOL)isActionSupportedForType:(int64_t)a3 account:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  uint64_t v14 = AMSSetLogKeyIfNeeded(v11, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v31 = 0LL;
  id v16 = +[AMSKeychain copyAccessControlRefWithAccount:options:error:]( &OBJC_CLASS___AMSKeychain,  "copyAccessControlRefWithAccount:options:error:",  v11,  v10,  &v31);

  id v17 = v31;
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    if (!v18) {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 OSLogObject]);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v21 = (void *)objc_opt_class(self, v20);
      *(_DWORD *)buf = 138543874;
      v33 = v21;
      __int16 v34 = 2114;
      v35 = v15;
      __int16 v36 = 2114;
      id v37 = v17;
      id v22 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] ACL copy failed with error: %{public}@",  buf,  0x20u);
    }

    unsigned __int8 v23 = 0;
    if (a6) {
      *a6 = v17;
    }
  }

  else
  {
    unsigned __int8 v23 = +[AMSBiometrics isActionSupported:withAccessControl:]( &OBJC_CLASS___AMSBiometrics,  "isActionSupported:withAccessControl:",  a3,  v16);
    if ((v23 & 1) == 0)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[AMSBiometrics ACLVersionForAccessControl:]( &OBJC_CLASS___AMSBiometrics,  "ACLVersionForAccessControl:",  v16));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      if (!v25) {
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 OSLogObject]);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v28 = (void *)objc_opt_class(self, v27);
        *(_DWORD *)buf = 138543874;
        v33 = v28;
        __int16 v34 = 2114;
        v35 = v15;
        __int16 v36 = 2114;
        id v37 = v24;
        id v29 = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Skipping biometric/ACL check for bad ACL version: %{public}@",  buf,  0x20u);
      }
    }

    if (v16) {
      CFRelease(v16);
    }
  }

  return v23;
}

- (void)hasKeysForAccount:(id)a3 forSignaturePurpose:(unint64_t)a4 completion:(id)a5
{
  unsigned __int8 v7 = (void (**)(id, id, id))a5;
  id v10 = 0LL;
  id v8 = +[AMSBiometrics hasKeysForAccount:forSignaturePurpose:withError:]( &OBJC_CLASS___AMSBiometrics,  "hasKeysForAccount:forSignaturePurpose:withError:",  a3,  a4,  &v10);
  id v9 = v10;
  if (v7) {
    v7[2](v7, v8, v9);
  }
}

- (void)isDeviceInBiometricLockoutWithCompletion:(id)a3
{
  id v5 = a3;
  id v3 = +[AMSBiometrics isDeviceInBiometricLockout](&OBJC_CLASS___AMSBiometrics, "isDeviceInBiometricLockout");
  id v4 = v5;
  if (v5)
  {
    (*((void (**)(id, id))v5 + 2))(v5, v3);
    id v4 = v5;
  }
}

- (void)deleteAllKeysWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id, void *))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  if (!v5) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    uint64_t v9 = AMSLogKey(v7, v8);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v12 = objc_opt_class(self, v11);
    uint64_t v14 = v12;
    if (v10)
    {
      uint64_t v15 = AMSLogKey(v12, v13);
      self = (AMSDSecurityService *)objc_claimAutoreleasedReturnValue(v15);
      id v16 = (AMSDSecurityService *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v14,  self));
    }

    else
    {
      id v16 = (AMSDSecurityService *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: ",  v12));
    }

    *(_DWORD *)buf = 138543362;
    unsigned __int8 v23 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@Requested to delete all biometrics keys.",  buf,  0xCu);
    if (v10)
    {

      id v16 = self;
    }
  }

  id v21 = 0LL;
  id v17 = +[AMSBiometrics deleteAllKeysWithError:](&OBJC_CLASS___AMSBiometrics, "deleteAllKeysWithError:", &v21);
  id v18 = v21;
  v19 = v18;
  if (v4)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "ams_sanitizedForSecureCoding"));
    v4[2](v4, v17, v20);
  }
}

- (void)isActionSupportedForType:(int64_t)a3 account:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (void (**)(id, BOOL, os_log_s *))a6;
  uint64_t v15 = AMSSetLogKeyIfNeeded(v12, v13, v14);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  if (!v17) {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 OSLogObject]);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = v16;
    uint64_t v21 = objc_opt_class(self, v19);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    uint64_t v23 = AMSHashIfNeeded(v10);
    id v35 = v10;
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    uint64_t v25 = AMSHashIfNeeded(v11);
    __int16 v34 = v12;
    int64_t v26 = a3;
    uint64_t v27 = self;
    v28 = (void *)objc_claimAutoreleasedReturnValue(v25);
    *(_DWORD *)buf = 138544386;
    uint64_t v38 = v21;
    id v16 = v20;
    __int16 v39 = 2114;
    v40 = v20;
    __int16 v41 = 2114;
    v42 = v22;
    __int16 v43 = 2114;
    v44 = v24;
    __int16 v45 = 2114;
    v46 = v28;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Checking auto enrollment for action type = %{public}@ | account = %{public}@ | options = %{public}@",  buf,  0x34u);

    self = v27;
    a3 = v26;
    uint64_t v12 = v34;

    id v10 = v35;
  }

  if (v12)
  {
    id v36 = 0LL;
    BOOL v29 = -[AMSDSecurityService isActionSupportedForType:account:options:error:]( self,  "isActionSupportedForType:account:options:error:",  a3,  v10,  v11,  &v36);
    id v30 = v36;
    id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "ams_sanitizedForSecureCoding"));
    v12[2](v12, v29, v31);
  }

  else
  {
    id v30 = (id)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    if (!v30) {
      id v30 = (id)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v30 OSLogObject]);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = objc_opt_class(self, v32);
      *(_DWORD *)buf = 138543618;
      uint64_t v38 = v33;
      __int16 v39 = 2114;
      v40 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Checking auto enrollment for action type failed for no completion handler",  buf,  0x16u);
    }
  }
}

- (void)isBiometricsAvailableForAccount:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v5 = +[AMSBiometrics isAvailableForAccount:](&OBJC_CLASS___AMSBiometrics, "isAvailableForAccount:", a3);
  id v6 = v7;
  if (v7)
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v5, 0LL);
    id v6 = v7;
  }
}

- (void)performBiometricTokenUpdateWithAccount:(id)a3 clientInfo:(id)a4 additionalDialogMetrics:(id)a5 shouldGenerateKeysOnly:(BOOL)a6 shouldRequestConfirmation:(BOOL)a7 userInitiated:(BOOL)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a9;
  id v20 = objc_msgSend((id)objc_opt_class(self, v19), "sharedPerformQueue");
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100043358;
  v26[3] = &unk_1000D7D98;
  v26[4] = self;
  id v27 = v15;
  id v28 = v17;
  id v29 = v16;
  BOOL v31 = a6;
  BOOL v32 = a7;
  BOOL v33 = a8;
  id v30 = v18;
  id v22 = v18;
  id v23 = v16;
  id v24 = v17;
  id v25 = v15;
  +[AMSDTransactionStore takeKeepAliveTransaction:withQueue:whilePerformingBlock:]( &OBJC_CLASS___AMSDTransactionStore,  "takeKeepAliveTransaction:withQueue:whilePerformingBlock:",  @"com.apple.amsaccountsd.biometrics",  v21,  v26);
}

- (void)paymentServicesMerchantURLWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  uint64_t v7 = AMSSetLogKeyIfNeeded(v4, v5, v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  id v10 = (void *)v9;
  if (v4)
  {
    if (!v9) {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_opt_class(self, v12);
      uint64_t v16 = AMSSetLogKeyIfNeeded(v13, v14, v15);
      id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      int v21 = 138543618;
      uint64_t v22 = v13;
      __int16 v23 = 2114;
      id v24 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] [apple-pay-classic] Platform not supported",  (uint8_t *)&v21,  0x16u);
    }

    uint64_t v18 = AMSError(5LL, @"Platform Not Supported", @"Platform Not Supported", 0LL);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v4[2](v4, 0LL, v10);
  }

  else
  {
    if (!v9) {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v21 = 138543618;
      uint64_t v22 = objc_opt_class(self, v20);
      __int16 v23 = 2114;
      id v24 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] [apple-pay-classic] Merchant URL lookup failed for no completion handler",  (uint8_t *)&v21,  0x16u);
    }
  }
}

- (void)shouldAttemptApplePayWithAccount:(id)a3 options:(id)a4 countryCode:(id)a5 paymentNetworks:(id)a6 completion:(id)a7
{
  id v47 = a3;
  id v13 = a4;
  id v14 = a5;
  id v46 = a6;
  uint64_t v15 = (void (**)(id, void, void *))a7;
  uint64_t v18 = AMSSetLogKeyIfNeeded(v15, v16, v17);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  if (!v20) {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 OSLogObject]);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = objc_opt_class(self, v22);
    id v24 = NSStringFromSelector(a2);
    __int16 v43 = self;
    id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    uint64_t v26 = AMSHashIfNeeded(v47);
    id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    uint64_t v28 = AMSHashIfNeeded(v13);
    v44 = v15;
    id v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    uint64_t v30 = AMSHashIfNeeded(v14);
    id v45 = v13;
    BOOL v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    uint64_t v32 = AMSHashIfNeeded(v46);
    BOOL v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    *(_DWORD *)buf = 138544898;
    uint64_t v49 = v23;
    __int16 v50 = 2114;
    v51 = v19;
    __int16 v52 = 2114;
    v53 = v25;
    __int16 v54 = 2114;
    v55 = v27;
    __int16 v56 = 2114;
    v57 = v29;
    __int16 v58 = 2114;
    v59 = v31;
    __int16 v60 = 2114;
    v61 = v33;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] [apple-pay-classic] %{public}@ account = %{public}@ | options = %{public}@ | countryCode = %{public}@ | paymentNetworks = %{public}@",  buf,  0x48u);

    id v13 = v45;
    uint64_t v15 = v44;

    self = v43;
  }

  uint64_t v34 = objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  id v35 = (void *)v34;
  if (v15)
  {
    if (!v34) {
      id v35 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "OSLogObject", v43));
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      uint64_t v38 = objc_opt_class(self, v37);
      *(_DWORD *)buf = 138543618;
      uint64_t v49 = v38;
      __int16 v50 = 2114;
      v51 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] [apple-pay-classic] Platform not supported",  buf,  0x16u);
    }

    uint64_t v39 = AMSError(5LL, @"Platform Not Supported", @"Platform Not Supported", 0LL);
    id v35 = (void *)objc_claimAutoreleasedReturnValue(v39);
    v15[2](v15, 0LL, v35);
  }

  else
  {
    if (!v34) {
      id v35 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "OSLogObject", v43));
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      uint64_t v42 = objc_opt_class(self, v41);
      *(_DWORD *)buf = 138543618;
      uint64_t v49 = v42;
      __int16 v50 = 2114;
      v51 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] [apple-pay-classic] Apple Pay Classic evaluation failed for no completion block",  buf,  0x16u);
    }
  }
}

- (void)shouldAttemptApplePayWithCountryCode:(id)a3 paymentNetworks:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void, void *))a5;
  uint64_t v14 = AMSSetLogKeyIfNeeded(v11, v12, v13);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  if (!v16) {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = v11;
    uint64_t v20 = v15;
    uint64_t v21 = objc_opt_class(self, v18);
    uint64_t v22 = NSStringFromSelector(a2);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    uint64_t v24 = AMSHashIfNeeded(v9);
    id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    uint64_t v26 = AMSHashIfNeeded(v10);
    uint64_t v39 = self;
    id v27 = v10;
    id v28 = v9;
    id v29 = (void *)objc_claimAutoreleasedReturnValue(v26);
    *(_DWORD *)buf = 138544386;
    uint64_t v41 = v21;
    uint64_t v15 = v20;
    id v11 = v19;
    __int16 v42 = 2114;
    __int16 v43 = v15;
    __int16 v44 = 2114;
    id v45 = v23;
    __int16 v46 = 2114;
    id v47 = v25;
    __int16 v48 = 2114;
    uint64_t v49 = v29;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] [apple-pay-classic] %{public}@ | countryCode = %{public}@ | paymentNetworks = %{public}@",  buf,  0x34u);

    id v9 = v28;
    id v10 = v27;
    self = v39;
  }

  uint64_t v30 = objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  BOOL v31 = (void *)v30;
  if (v11)
  {
    if (!v30) {
      BOOL v31 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v31 OSLogObject]);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = objc_opt_class(self, v33);
      *(_DWORD *)buf = 138543618;
      uint64_t v41 = v34;
      __int16 v42 = 2114;
      __int16 v43 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] [apple-pay-classic] Platform not supported",  buf,  0x16u);
    }

    uint64_t v35 = AMSError(5LL, @"Platform Not Supported", @"Platform Not Supported", 0LL);
    BOOL v31 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v11[2](v11, 0LL, v31);
  }

  else
  {
    if (!v30) {
      BOOL v31 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue([v31 OSLogObject]);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      uint64_t v38 = objc_opt_class(self, v37);
      *(_DWORD *)buf = 138543618;
      uint64_t v41 = v38;
      __int16 v42 = 2114;
      __int16 v43 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] [apple-pay-classic] Apple Pay Classic evaluation failed for no completion block",  buf,  0x16u);
    }
  }
}

- (void)signedHeadersForRequest:(id)a3 buyParams:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v12 = objc_msgSend((id)objc_opt_class(self, v11), "sharedPerformQueue");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000440EC;
  v17[3] = &unk_1000D7DE8;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  +[AMSDTransactionStore takeKeepAliveTransaction:withQueue:whilePerformingBlock:]( &OBJC_CLASS___AMSDTransactionStore,  "takeKeepAliveTransaction:withQueue:whilePerformingBlock:",  @"com.apple.amsaccountsd.signingsecurity",  v13,  v17);
}

- (void)signChallengeForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v9 = objc_msgSend((id)objc_opt_class(self, v8), "sharedPerformQueue");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000442C8;
  v13[3] = &unk_1000D6208;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  +[AMSDTransactionStore takeKeepAliveTransaction:withQueue:whilePerformingBlock:]( &OBJC_CLASS___AMSDTransactionStore,  "takeKeepAliveTransaction:withQueue:whilePerformingBlock:",  @"com.apple.amsaccountsd.biometrics",  v10,  v13);
}

- (void)performSilentEnrollmentWithRequest:(id)a3 logKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v13 = v10;
  if (!v9)
  {
    uint64_t v14 = AMSSetLogKeyIfNeeded(v10, v11, v12);
    id v9 = (id)objc_claimAutoreleasedReturnValue(v14);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  if (!v15) {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = objc_opt_class(self, v17);
    __int16 v27 = 2114;
    id v28 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Starting silent-enrollment payment session",  buf,  0x16u);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[AMSURLSession defaultSession](&OBJC_CLASS___AMSURLSession, "defaultSession"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100044548;
  v22[3] = &unk_1000D7E10;
  v22[4] = self;
  id v23 = v9;
  id v24 = v13;
  id v19 = v13;
  id v20 = v9;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v18 dataTaskWithRequest:v8 completionHandler:v22]);

  [v21 resume];
}

- (void)handleResponse:(id)a3 completion:(id)a4
{
  uint64_t v5 = (void (**)(id, id))a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDBag defaultBag](&OBJC_CLASS___AMSDBag, "defaultBag"));
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[AMSAbsinthe handleResponse:bag:](&OBJC_CLASS___AMSAbsinthe, "handleResponse:bag:", v6, v7));

  v5[2](v5, v8);
}

- (void)_absintheHeadersForRequest:(id)a3 bag:(id)a4 buyParams:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[AMSAbsinthe headersForRequest:buyParams:bag:]( &OBJC_CLASS___AMSAbsinthe,  "headersForRequest:buyParams:bag:",  a3,  a5,  a4));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100044984;
  v12[3] = &unk_1000D7DC0;
  id v13 = v9;
  id v11 = v9;
  [v10 addFinishBlock:v12];
}

- (AMSSecurityClientInterface)delegate
{
  return (AMSSecurityClientInterface *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end