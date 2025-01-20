@interface AMSVerifyCredentialsTask
+ (id)_fetchSecondaryPasswordForAccount:(id)a3;
+ (void)_postAuthenticationBeganNotification;
+ (void)_postAuthenticationFailedNotification;
+ (void)_postAuthenticationFinishedNotification;
+ (void)_postAuthenticationSubmittedNotification;
- (ACAccount)account;
- (ACDAccountStore)accountStore;
- (AMSAuthenticateMetrics)metrics;
- (AMSAuthenticateOptions)options;
- (AMSBagProtocol)bag;
- (AMSDialogRequest)dialogRequest;
- (AMSVerifyCredentialsTask)initWithAccount:(id)a3 accountStore:(id)a4 bag:(id)a5 options:(id)a6;
- (BOOL)AMSURLSession:(id)a3 task:(id)a4 shouldFailWithServerError:(id)a5;
- (BOOL)accountWasOriginallyActive;
- (id)_createAuthenticateRequestEncoder;
- (id)_createAuthenticateRequestForAccount:(id)a3 URL:(id)a4 requestEncoder:(id)a5;
- (id)_createAuthenticateRequestParametersForAccount:(id)a3;
- (id)_createUpdatedAccountWithAuthenticationResult:(id)a3;
- (id)_generatePasswordIfNeeded;
- (id)_processAuthenticationFailureWithResult:(id)a3;
- (id)_promiseOfAccountFromResult:(id)a3 orError:(id)a4;
- (id)performTask;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6;
- (void)_handleBiometricsForAuthenticatedAccount:(id)a3;
- (void)_handleDeviceOffersForAuthenticatedAccount:(id)a3;
- (void)_handleIDMSRetentionForAuthenticatedAccount:(id)a3;
- (void)_processAuthenticationSuccessWithResult:(id)a3 authenticatedAccount:(id)a4;
- (void)_removeInactiveDuplicatesForAuthenticatedAccount:(id)a3;
- (void)_removeRenewCredentialsFollowUp;
- (void)_retainIDMS:(BOOL)a3 forAccount:(id)a4;
- (void)_startDataSyncForAccount:(id)a3;
- (void)setDialogRequest:(id)a3;
- (void)setMetrics:(id)a3;
@end

@implementation AMSVerifyCredentialsTask

- (AMSVerifyCredentialsTask)initWithAccount:(id)a3 accountStore:(id)a4 bag:(id)a5 options:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___AMSVerifyCredentialsTask;
  v15 = -[AMSVerifyCredentialsTask init](&v29, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_account, a3);
    objc_storeStrong((id *)&v16->_accountStore, a4);
    objc_storeStrong((id *)&v16->_bag, a5);
    v17 = -[AMSAuthenticateMetrics initWithBag:](objc_alloc(&OBJC_CLASS___AMSAuthenticateMetrics), "initWithBag:", v13);
    metrics = v16->_metrics;
    v16->_metrics = v17;

    objc_storeStrong((id *)&v16->_options, a6);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v12 accountWithIdentifier:v19]);
    v16->_accountWasOriginallyActive = [v20 isActive];

    v21 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
    if (!v21) {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 OSLogObject]);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = objc_opt_class(v16);
      uint64_t v24 = AMSLogKey(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      uint64_t v26 = AMSHashIfNeeded(v11);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      *(_DWORD *)buf = 138543874;
      uint64_t v31 = v23;
      __int16 v32 = 2114;
      v33 = v25;
      __int16 v34 = 2114;
      v35 = v27;
      _os_log_impl( &dword_0,  v22,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Creating an AMSVerifyCredentialsTask. account = %{public}@",  buf,  0x20u);
    }
  }

  return v16;
}

- (id)performTask
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_7394;
  v3[3] = &unk_14578;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue( -[AMSVerifyCredentialsTask performTaskWithPromiseBlock:]( self,  "performTaskWithPromiseBlock:",  v3));
}

- (id)_promiseOfAccountFromResult:(id)a3 orError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
  if (!v8) {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class(self);
    uint64_t v11 = AMSLogKey(v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = AMSHashIfNeeded(v6);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = AMSHashIfNeeded(v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    int v39 = 138544130;
    uint64_t v40 = v10;
    __int16 v41 = 2114;
    v42 = v12;
    __int16 v43 = 2114;
    v44 = v14;
    __int16 v45 = 2114;
    v46 = v16;
    _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] The authentication finished. result = %{public}@ | error = %{public}@",  (uint8_t *)&v39,  0x2Au);
  }

  if (v6)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( -[AMSVerifyCredentialsTask _createUpdatedAccountWithAuthenticationResult:]( self,  "_createUpdatedAccountWithAuthenticationResult:",  v6));
    -[AMSVerifyCredentialsTask _handleIDMSRetentionForAuthenticatedAccount:]( self,  "_handleIDMSRetentionForAuthenticatedAccount:",  v17);
    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
      if (!v18) {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 OSLogObject]);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = objc_opt_class(self);
        uint64_t v21 = AMSLogKey(v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        uint64_t v23 = AMSHashIfNeeded(v6);
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        uint64_t v25 = AMSHashIfNeeded(v17);
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        int v39 = 138544130;
        uint64_t v40 = v20;
        __int16 v41 = 2114;
        v42 = v22;
        __int16 v43 = 2114;
        v44 = v24;
        __int16 v45 = 2114;
        v46 = v26;
        _os_log_impl( &dword_0,  v19,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] The authentication succeeded. result = %{public}@ | authenticatedAccount = %{public}@",  (uint8_t *)&v39,  0x2Au);
      }

      -[AMSVerifyCredentialsTask _processAuthenticationSuccessWithResult:authenticatedAccount:]( self,  "_processAuthenticationSuccessWithResult:authenticatedAccount:",  v6,  v17);
      id v27 = [[AMSPromiseResult alloc] initWithResult:v17 error:0];
      goto LABEL_19;
    }

    id v28 = (id)objc_claimAutoreleasedReturnValue( -[AMSVerifyCredentialsTask _processAuthenticationFailureWithResult:]( self,  "_processAuthenticationFailureWithResult:",  v6));
  }

  else
  {
    -[AMSVerifyCredentialsTask _handleIDMSRetentionForAuthenticatedAccount:]( self,  "_handleIDMSRetentionForAuthenticatedAccount:",  0LL);
    id v28 = v7;
  }

  v17 = v28;
  objc_super v29 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
  if (!v29) {
    objc_super v29 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 OSLogObject]);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    uint64_t v31 = objc_opt_class(self);
    uint64_t v32 = AMSLogKey(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    uint64_t v34 = AMSHashIfNeeded(v17);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    int v39 = 138543874;
    uint64_t v40 = v31;
    __int16 v41 = 2114;
    v42 = v33;
    __int16 v43 = 2114;
    v44 = v35;
    _os_log_impl( &dword_0,  v30,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] The authentication failed. error = %{public}@",  (uint8_t *)&v39,  0x20u);
  }

  id v36 = objc_alloc(&OBJC_CLASS___AMSPromiseResult);
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "ams_sanitizedForSecureCoding"));
  id v27 = [v36 initWithResult:0 error:v37];

LABEL_19:
  return v27;
}

- (void)_startDataSyncForAccount:(id)a3
{
  id v3 = a3;
  id v7 = [[AMSEngagement alloc] initWithoutBag];
  id v4 = [v7 fetchMetricsIdentifiers];
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[AMSAccountCachedServerData sharedInstance]( &OBJC_CLASS___AMSAccountCachedServerData,  "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ams_accountID"));

  [v5 accountAuthSyncForAccountID:v6];
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  v8 = (void (**)(id, void, id))a6;
  -[AMSVerifyCredentialsTask setDialogRequest:](self, "setDialogRequest:", a5);
  uint64_t v9 = AMSError(100LL, @"Authentication Interrupted", @"The authentication resulted in a dialog.", 0LL);
  id v10 = (id)objc_claimAutoreleasedReturnValue(v9);
  v8[2](v8, 0LL, v10);
}

- (BOOL)AMSURLSession:(id)a3 task:(id)a4 shouldFailWithServerError:(id)a5
{
  return 0;
}

- (id)_createAuthenticateRequestEncoder
{
  id v3 = objc_alloc(&OBJC_CLASS___AMSURLRequestEncoder);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask bag](self, "bag"));
  id v5 = [v3 initWithBag:v4];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask options](self, "options"));
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 clientInfo]);
  [v5 setClientInfo:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask options](self, "options"));
  LOBYTE(v7) = [v8 allowServerDialogs];

  if ((v7 & 1) == 0) {
    [v5 setDialogOptions:1];
  }
  [v5 setIncludeClientVersions:0];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask options](self, "options"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 logKey]);
  [v5 setLogUUID:v10];

  [v5 setMescalType:1];
  [v5 setRequestEncoding:2];
  [v5 setShouldSetCookiesFromResponse:0];
  [v5 setShouldSetStorefrontFromResponse:0];
  return v5;
}

- (id)_createAuthenticateRequestForAccount:(id)a3 URL:(id)a4 requestEncoder:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [v8 setAccount:v10];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[AMSVerifyCredentialsTask _createAuthenticateRequestParametersForAccount:]( self,  "_createAuthenticateRequestParametersForAccount:",  v10));

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 requestWithMethod:4 bagURL:v9 parameters:v11]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_82C0;
  v15[3] = &unk_145C8;
  v15[4] = self;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 thenWithBlock:v15]);

  return v13;
}

- (id)_createAuthenticateRequestParametersForAccount:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary ams_setNullableObject:forKey:]( v5,  "ams_setNullableObject:forKey:",  &__kCFBooleanTrue,  @"createSession");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask options](self, "options"));
  uint64_t v7 = (char *)[v6 credentialSource];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v7));
  -[NSMutableDictionary ams_setNullableObject:forKey:]( v5,  "ams_setNullableObject:forKey:",  v8,  @"credentialSource");

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDevice deviceGUID](&OBJC_CLASS___AMSDevice, "deviceGUID"));
  -[NSMutableDictionary ams_setNullableObject:forKey:](v5, "ams_setNullableObject:forKey:", v9, @"guid");

  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_homeID"));
  -[NSMutableDictionary ams_setNullableObject:forKey:](v5, "ams_setNullableObject:forKey:", v10, @"homeId");

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", (unint64_t)(v7 - 5) < 2));
  -[NSMutableDictionary ams_setNullableObject:forKey:]( v5,  "ams_setNullableObject:forKey:",  v11,  @"isSilentAuthentication");

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 credential]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 password]);
  if (v7 == (_BYTE *)&dword_4 + 2) {
    id v14 = @"homeToken";
  }
  else {
    id v14 = @"password";
  }
  -[NSMutableDictionary ams_setNullableObject:forKey:](v5, "ams_setNullableObject:forKey:", v13, v14);

  -[NSMutableDictionary ams_setNullableObject:forKey:](v5, "ams_setNullableObject:forKey:", @"0", @"rmp");
  v20[0] = @"free";
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[AMSSyncPasswordSettingsTask serverValueForFreePasswordSetting:]( AMSSyncPasswordSettingsTask,  "serverValueForFreePasswordSetting:",  objc_msgSend(v4, "ams_freePasswordPromptSetting")));
  v20[1] = @"paid";
  v21[0] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[AMSSyncPasswordSettingsTask serverValueForPaidPasswordSetting:]( AMSSyncPasswordSettingsTask,  "serverValueForPaidPasswordSetting:",  objc_msgSend(v4, "ams_paidPasswordPromptSetting")));
  v21[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));
  -[NSMutableDictionary ams_setNullableObject:forKey:]( v5,  "ams_setNullableObject:forKey:",  v17,  @"passwordSettings");

  v18 = (void *)objc_claimAutoreleasedReturnValue([v4 username]);
  -[NSMutableDictionary ams_setNullableObject:forKey:](v5, "ams_setNullableObject:forKey:", v18, @"appleId");

  +[AMSDevice setDeviceOffersCheckEncodingForRequestParameters:]( &OBJC_CLASS___AMSDevice,  "setDeviceOffersCheckEncodingForRequestParameters:",  v5);
  return v5;
}

- (id)_createUpdatedAccountWithAuthenticationResult:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
    id v7 = v5;
  }
  else {
    id v7 = 0LL;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ams_username"));
  if (![v8 length])
  {
    id v95 = 0LL;
    goto LABEL_49;
  }

  v104 = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask account](self, "account"));
  id v10 = [v9 copy];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask accountStore](self, "accountStore"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ams_altDSID"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ams_DSID"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ams_username"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ams_iTunesAccountWithAltDSID:DSID:username:", v12, v13, v14));

  v100 = self;
  id v102 = v4;
  v103 = v15;
  if (v15 && objc_msgSend(v10, "ams_isDuplicate:", v15))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
    if (!v16) {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = objc_opt_class(self);
      uint64_t v19 = AMSLogKey(v18);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      uint64_t v21 = AMSHashIfNeeded(v15);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      *(_DWORD *)buf = 138543874;
      uint64_t v107 = v18;
      __int16 v108 = 2114;
      v109 = v20;
      __int16 v110 = 2114;
      v111 = v22;
      _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] A duplicate account was added while the authentication was in progress. We'll update th e already existing account. existingAccount = %{public}@",  buf,  0x20u);

      uint64_t v15 = v103;
    }

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask options](self, "options"));
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 clientInfo]);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 accountMediaType]);
    if (objc_msgSend(v10, "ams_isActiveForMediaType:", v25))
    {
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask options](self, "options"));
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 clientInfo]);
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 accountMediaType]);
      unsigned __int8 v29 = objc_msgSend(v103, "ams_isActiveForMediaType:", v28);

      self = v100;
      uint64_t v15 = v103;

      if ((v29 & 1) != 0)
      {
LABEL_19:
        v35 = (void *)objc_claimAutoreleasedReturnValue([v10 credential]);
        [v15 setCredential:v35];

        id v36 = v15;
        id v10 = v36;
        goto LABEL_20;
      }

      v30 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
      if (!v30) {
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v30 OSLogObject]);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v32 = objc_opt_class(v100);
        uint64_t v33 = AMSLogKey(v32);
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        *(_DWORD *)buf = 138543618;
        uint64_t v107 = v32;
        __int16 v108 = 2114;
        v109 = v34;
        _os_log_impl( &dword_0,  v31,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] The existing account wasn't active, but our just authenticated account was active. Up dating the existing account to be active.",  buf,  0x16u);
      }

      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask options](v100, "options"));
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 clientInfo]);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 accountMediaType]);
      objc_msgSend(v103, "ams_setActive:forMediaType:", 1, v25);
    }

    goto LABEL_19;
  }

+ (id)_fetchSecondaryPasswordForAccount:(id)a3
{
  return 0LL;
}

- (id)_generatePasswordIfNeeded
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask account](self, "account"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ams_password"));

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask account](self, "account"));
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithResult:](&OBJC_CLASS___AMSPromise, "promiseWithResult:", v5));
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
    if (!v7) {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class(self);
      uint64_t v10 = AMSLogKey(v9);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v9;
      __int16 v29 = 2114;
      v30 = v11;
      _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] The account has no password.",  buf,  0x16u);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask options](self, "options"));
    uint64_t v13 = (char *)[v12 allowPasswordGeneration];

    if (v13 != (_BYTE *)&dword_0 + 1
      && (v13
       || (id v14 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask options](self, "options")),
           uint64_t v15 = (char *)[v14 authenticationType],
           v14,
           v15 == (_BYTE *)&dword_0 + 2)))
    {
      uint64_t v16 = AMSError( 11LL,  @"Interactive Auth Required",  @"The client disallowed silent authentications.",  0LL);
      id v17 = (id)objc_claimAutoreleasedReturnValue(v16);
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithError:](&OBJC_CLASS___AMSPromise, "promiseWithError:", v17));
    }

    else
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask options](self, "options"));
      id v17 = [v18 copy];

      [v17 setAuthenticationType:1];
      id v19 = objc_alloc(&OBJC_CLASS___AMSAuthKitUpdateTask);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask account](self, "account"));
      id v21 = [v19 initWithAccount:v20 options:v17];

      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 performAuthKitUpdate]);
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v22 thenWithBlock:&stru_14608]);
    }

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_9980;
    v26[3] = &unk_14630;
    v26[4] = self;
    [v5 addErrorBlock:v26];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_9AB0;
    v25[3] = &unk_14658;
    v25[4] = self;
    [v5 addSuccessBlock:v25];
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 catchWithBlock:&stru_14698]);
  }

  uint64_t v23 = (void *)v6;

  return v23;
}

- (void)_handleIDMSRetentionForAuthenticatedAccount:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 isActive];
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
    if (!v7) {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class(self);
      uint64_t v10 = AMSLogKey(v9);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      uint64_t v12 = AMSHashIfNeeded(v5);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      int v39 = 138544130;
      uint64_t v40 = v9;
      __int16 v41 = 2114;
      v42 = v11;
      __int16 v43 = 1024;
      LODWORD(v44[0]) = (_DWORD)v6;
      WORD2(v44[0]) = 2114;
      *(void *)((char *)v44 + 6) = v13;
      _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] retainIDMS = %d | authenticatedAccount = %{public}@",  (uint8_t *)&v39,  0x26u);
    }

    -[AMSVerifyCredentialsTask _retainIDMS:forAccount:](self, "_retainIDMS:forAccount:", v6, v5);
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask accountStore](self, "accountStore"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask account](self, "account"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ams_altDSID"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask account](self, "account"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "ams_DSID"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask account](self, "account"));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 username]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ams_iTunesAccountWithAltDSID:DSID:username:", v16, v18, v20));

    if (v21)
    {
      id v22 = [v21 isActive];
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
      if (!v23) {
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 OSLogObject]);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = objc_opt_class(self);
        uint64_t v26 = AMSLogKey(v25);
        id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        uint64_t v28 = AMSHashIfNeeded(v21);
        __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        int v39 = 138544130;
        uint64_t v40 = v25;
        __int16 v41 = 2114;
        v42 = v27;
        __int16 v43 = 1024;
        LODWORD(v44[0]) = (_DWORD)v22;
        WORD2(v44[0]) = 2114;
        *(void *)((char *)v44 + 6) = v29;
        _os_log_impl( &dword_0,  v24,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] retainIDMS = %d | accountOnDevice = %{public}@",  (uint8_t *)&v39,  0x26u);
      }

      -[AMSVerifyCredentialsTask _retainIDMS:forAccount:](self, "_retainIDMS:forAccount:", v22, v21);
    }

    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
      if (!v30) {
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v30 OSLogObject]);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v32 = objc_opt_class(self);
        uint64_t v33 = AMSLogKey(v32);
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask account](self, "account"));
        uint64_t v36 = AMSHashIfNeeded(v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
        int v39 = 138543874;
        uint64_t v40 = v32;
        __int16 v41 = 2114;
        v42 = v34;
        __int16 v43 = 2114;
        v44[0] = v37;
        _os_log_impl( &dword_0,  v31,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] retainIDMS = 0 | self.account = %{public}@",  (uint8_t *)&v39,  0x20u);
      }

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask account](self, "account"));
      -[AMSVerifyCredentialsTask _retainIDMS:forAccount:](self, "_retainIDMS:forAccount:", 0LL, v38);
    }
  }
}

- (void)_handleDeviceOffersForAuthenticatedAccount:(id)a3
{
  id v4 = a3;
  if ((+[AMSDefaults didRetrieveDeviceOffers](&OBJC_CLASS___AMSDefaults, "didRetrieveDeviceOffers") & 1) == 0)
  {
    id v5 = objc_alloc(&OBJC_CLASS___AMSDeviceOfferRegistrationTask);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask bag](self, "bag"));
    id v7 = [v5 initWithAccount:v4 bag:v6];

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 perform]);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_A0C8;
    v10[3] = &unk_14630;
    v10[4] = self;
    [v8 addErrorBlock:v10];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_A1E4;
    v9[3] = &unk_14700;
    v9[4] = self;
    [v8 addSuccessBlock:v9];
  }
}

- (void)_handleBiometricsForAuthenticatedAccount:(id)a3
{
  if (([a3 isActive] & 1) == 0)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
    if (!v11) {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    uint64_t v17 = objc_opt_class(self);
    uint64_t v18 = AMSLogKey(v17);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v18);
    int v19 = 138543618;
    uint64_t v20 = v17;
    __int16 v21 = 2114;
    id v22 = v15;
    uint64_t v16 = "%{public}@: [%{public}@] Skipping biometrics update. The account is inactive.";
    goto LABEL_15;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask options](self, "options"));
  id v5 = (char *)[v4 credentialSource];

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
  if (!v6) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class(self);
    uint64_t v9 = AMSLogKey(v8);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    int v19 = 138543874;
    uint64_t v20 = v8;
    __int16 v21 = 2114;
    id v22 = v10;
    __int16 v23 = 2048;
    id v24 = v5;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Determining whether we need to provision biometrics. credentialSource = %ld",  (uint8_t *)&v19,  0x20u);
  }

  if (v5 == (_BYTE *)&dword_4 + 1)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
    if (!v11) {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    uint64_t v13 = objc_opt_class(self);
    uint64_t v14 = AMSLogKey(v13);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    int v19 = 138543618;
    uint64_t v20 = v13;
    __int16 v21 = 2114;
    id v22 = v15;
    uint64_t v16 = "%{public}@: [%{public}@] Skipping biometrics provisioning. The authentication was silent.";
LABEL_15:
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v19, 0x16u);

LABEL_16:
  }

- (id)_processAuthenticationFailureWithResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AMSLogKey(v4);
  uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
  if (!v6)
  {
    uint64_t v7 = AMSSetLogKeyIfNeeded();
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v7);
  }

  v85 = (void *)v6;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
  if (!v8) {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = objc_opt_class(self);
    uint64_t v11 = AMSHashIfNeeded(v4);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
    uint64_t v14 = AMSHashIfNeeded(v13);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(_DWORD *)buf = 138544130;
    uint64_t v93 = v10;
    __int16 v94 = 2114;
    id v95 = v85;
    __int16 v96 = 2114;
    uint64_t v97 = v12;
    __int16 v98 = 2112;
    uint64_t v99 = v15;
    _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] The authentication failed. result = %{public}@ | result.object = %@",  buf,  0x2Au);
  }

  [(id)objc_opt_class(self) _postAuthenticationFailedNotification];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0) {
    id v18 = v16;
  }
  else {
    id v18 = 0LL;
  }

  int v19 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask options](self, "options"));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 clientInfo]);
  uint64_t v21 = objc_claimAutoreleasedReturnValue([v20 accountMediaType]);

  v86 = (void *)v21;
  if (!v21) {
    v86 = (void *)objc_claimAutoreleasedReturnValue( +[AMSProcessInfo defaultMediaTypeForCurrentProcess]( &OBJC_CLASS___AMSProcessInfo,  "defaultMediaTypeForCurrentProcess"));
  }
  id v84 = v18;
  v83 = (char *)objc_msgSend(v18, "ams_errorCode");
  id v22 = v85;
  if (v83 == "md.dylib" && -[AMSVerifyCredentialsTask accountWasOriginallyActive](self, "accountWasOriginallyActive"))
  {
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
    if (!v23) {
      __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 OSLogObject]);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = objc_opt_class(self);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask account](self, "account"));
      uint64_t v27 = AMSHashIfNeeded(v26);
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      *(_DWORD *)buf = 138543874;
      uint64_t v93 = v25;
      __int16 v94 = 2114;
      id v95 = v85;
      __int16 v96 = 2114;
      uint64_t v97 = v28;
      _os_log_impl( &dword_0,  v24,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Received an Account Conversion Needed error for the active account, storing cookies on the account. account = %{public}@",  buf,  0x20u);
    }

    __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask account](self, "account"));
    if (v29) {
      goto LABEL_25;
    }
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask accountStore](self, "accountStore"));
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "ams_localiTunesAccountForAccountMediaType:", v86));
  id v89 = 0LL;
  __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v31 resultWithError:&v89]);
  id v32 = v89;

  if (v29)
  {
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
    if (!v33) {
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue([v33 OSLogObject]);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = objc_opt_class(self);
      uint64_t v36 = AMSHashIfNeeded(v29);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      *(_DWORD *)buf = 138543874;
      uint64_t v93 = v35;
      __int16 v94 = 2114;
      id v95 = v85;
      __int16 v96 = 2114;
      uint64_t v97 = v37;
      _os_log_impl( &dword_0,  v34,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Using the local account for cookie storage. account = %{public}@",  buf,  0x20u);
    }

LABEL_25:
    v38 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
    if (!v38) {
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    int v39 = (os_log_s *)objc_claimAutoreleasedReturnValue([v38 OSLogObject]);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v40 = objc_opt_class(self);
      uint64_t v41 = AMSHashIfNeeded(v29);
      v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
      *(_DWORD *)buf = 138543874;
      uint64_t v93 = v40;
      __int16 v94 = 2114;
      id v95 = v85;
      __int16 v96 = 2114;
      uint64_t v97 = v42;
      _os_log_impl( &dword_0,  v39,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Saving cookies. account = %{public}@",  buf,  0x20u);
    }

    __int16 v43 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask accountStore](self, "accountStore"));
    id v88 = 0LL;
    unsigned __int8 v44 = objc_msgSend(v43, "ams_addCookiesForResult:account:error:", v4, v29, &v88);
    __int16 v45 = (os_log_s *)v88;

    uint64_t v46 = objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
    unsigned __int8 v47 = (void *)v46;
    if ((v44 & 1) != 0)
    {
      if (!v46) {
        unsigned __int8 v47 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      v48 = (os_log_s *)objc_claimAutoreleasedReturnValue([v47 OSLogObject]);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v49 = objc_opt_class(self);
        *(_DWORD *)buf = 138543618;
        uint64_t v93 = v49;
        __int16 v94 = 2114;
        id v95 = v85;
        _os_log_impl( &dword_0,  v48,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Saving cookies succeeded.",  buf,  0x16u);
      }
    }

    else
    {
      if (!v46) {
        unsigned __int8 v47 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      v48 = (os_log_s *)objc_claimAutoreleasedReturnValue([v47 OSLogObject]);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        uint64_t v50 = objc_opt_class(self);
        uint64_t v51 = AMSHashIfNeeded(v4);
        v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
        uint64_t v53 = AMSHashIfNeeded(v45);
        v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
        uint64_t v55 = AMSHashIfNeeded(v29);
        id v82 = v4;
        v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
        *(_DWORD *)buf = 138544386;
        uint64_t v93 = v50;
        __int16 v94 = 2114;
        id v95 = v85;
        __int16 v96 = 2112;
        uint64_t v97 = v52;
        __int16 v98 = 2114;
        uint64_t v99 = v54;
        __int16 v100 = 2114;
        v101 = v56;
        _os_log_impl( &dword_0,  v48,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Saving response cookies to the account failed. result = %{result}@ | error = %{public }@ | account = %{public}@",  buf,  0x34u);

        id v4 = v82;
        id v22 = v85;
      }
    }

    goto LABEL_39;
  }

  uint64_t v59 = objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
  v60 = (void *)v59;
  if (v32)
  {
    if (!v59) {
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    unsigned __int8 v61 = (os_log_s *)objc_claimAutoreleasedReturnValue([v60 OSLogObject]);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      uint64_t v62 = objc_opt_class(self);
      uint64_t v63 = AMSLogableError(v32);
      uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
      *(_DWORD *)buf = 138543874;
      uint64_t v93 = v62;
      __int16 v94 = 2114;
      id v95 = v85;
      __int16 v96 = 2114;
      uint64_t v97 = v64;
      _os_log_impl( &dword_0,  v61,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to retrieve the local iTunes account for cookie storage. error = %{public}@",  buf,  0x20u);
    }
  }

  else
  {
    if (!v59) {
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    unsigned __int8 v61 = (os_log_s *)objc_claimAutoreleasedReturnValue([v60 OSLogObject]);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      uint64_t v80 = objc_opt_class(self);
      *(_DWORD *)buf = 138543618;
      uint64_t v93 = v80;
      __int16 v94 = 2114;
      id v95 = v85;
      _os_log_impl( &dword_0,  v61,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to retrieve the local iTunes account for cookie storage and didn’t get an error.",  buf,  0x16u);
    }
  }

  __int16 v29 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
  if (!v29) {
    __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  __int16 v45 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 OSLogObject]);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v81 = objc_opt_class(self);
    *(_DWORD *)buf = 138543618;
    uint64_t v93 = v81;
    __int16 v94 = 2114;
    id v95 = v85;
    _os_log_impl( &dword_0,  v45,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Not saving cookies, no account to save to.",  buf,  0x16u);
  }

- (void)_processAuthenticationSuccessWithResult:(id)a3 authenticatedAccount:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
  if (!v8) {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class(self);
    uint64_t v11 = AMSLogKey(v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = AMSHashIfNeeded(v6);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    int v62 = 138543874;
    uint64_t v63 = v10;
    __int16 v64 = 2114;
    uint64_t v65 = v12;
    __int16 v66 = 2114;
    uint64_t v67 = v14;
    _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] The authentication succeeded. authenticatedAccount = %{public}@",  (uint8_t *)&v62,  0x20u);
  }

  [sub_B764() beginSuspendingSubscriptionStatusChangeNotifications];
  objc_msgSend(v6, "ams_addCookiesForResult:", v7);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask accountStore](self, "accountStore"));
  objc_msgSend(v15, "ams_addCookiesForResult:account:error:", v7, 0, 0);

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 object]);
  uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  id v18 = 0LL;
  if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0) {
    id v18 = v16;
  }

  int v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "ams_secureToken"));
  if (v19)
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
    if (!v21) {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 OSLogObject]);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = objc_opt_class(self);
      uint64_t v24 = AMSLogKey(v23);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      int v62 = 138543618;
      uint64_t v63 = v23;
      __int16 v64 = 2114;
      uint64_t v65 = v25;
      _os_log_impl( &dword_0,  v22,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Received a strong token.",  (uint8_t *)&v62,  0x16u);
    }

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask accountStore](self, "accountStore"));
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "ams_secureToken"));
    unsigned __int8 v28 = objc_msgSend(v26, "ams_setSecureToken:forAccount:error:", v27, v6, 0);

    if ((v28 & 1) == 0)
    {
      __int16 v29 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
      if (!v29) {
        __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 OSLogObject]);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v31 = objc_opt_class(self);
        uint64_t v32 = AMSLogKey(v31);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
        uint64_t v34 = AMSHashIfNeeded(0LL);
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
        int v62 = 138543874;
        uint64_t v63 = v31;
        __int16 v64 = 2114;
        uint64_t v65 = v33;
        __int16 v66 = 2114;
        uint64_t v67 = v35;
        _os_log_impl( &dword_0,  v30,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Failed to set the strong token. error = %{public}@",  (uint8_t *)&v62,  0x20u);
      }
    }
  }

  uint64_t v36 = AMSLogKey(v20);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  +[AMSDevice tearDownAllDeviceOfferFollowUpsForAccount:logKey:]( &OBJC_CLASS___AMSDevice,  "tearDownAllDeviceOfferFollowUpsForAccount:logKey:",  v6,  v37);

  uint64_t v39 = AMSLogKey(v38);
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
  unsigned int v41 = +[AMSDevice saveDeviceOffersForAccount:response:logKey:]( &OBJC_CLASS___AMSDevice,  "saveDeviceOffersForAccount:response:logKey:",  v6,  v18,  v40);

  if (v41)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedDeviceOffersConfig](&OBJC_CLASS___AMSLogConfig, "sharedDeviceOffersConfig"));
    if (!v42) {
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    __int16 v43 = (os_log_s *)objc_claimAutoreleasedReturnValue([v42 OSLogObject]);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v44 = objc_opt_class(self);
      uint64_t v45 = AMSLogKey(v44);
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
      int v62 = 138543618;
      uint64_t v63 = v44;
      __int16 v64 = 2114;
      uint64_t v65 = v46;
      _os_log_impl( &dword_0,  v43,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] The authentication response had device offers.",  (uint8_t *)&v62,  0x16u);
    }

    unsigned __int8 v47 = +[AMSProcessInfo isBuddyRunning](&OBJC_CLASS___AMSProcessInfo, "isBuddyRunning");
    uint64_t v48 = objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedDeviceOffersConfig](&OBJC_CLASS___AMSLogConfig, "sharedDeviceOffersConfig"));
    uint64_t v49 = (void *)v48;
    if ((v47 & 1) != 0)
    {
      if (!v48) {
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      uint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue([v49 OSLogObject]);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v51 = objc_opt_class(self);
        uint64_t v52 = AMSLogKey(v51);
        uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
        int v62 = 138543618;
        uint64_t v63 = v51;
        __int16 v64 = 2114;
        uint64_t v65 = v53;
        _os_log_impl( &dword_0,  v50,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Refusing to post device offer follow-ups because we're running in Buddy.",  (uint8_t *)&v62,  0x16u);
      }
    }

    else
    {
      if (!v48) {
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      v54 = (os_log_s *)objc_claimAutoreleasedReturnValue([v49 OSLogObject]);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v55 = objc_opt_class(self);
        uint64_t v56 = AMSLogKey(v55);
        v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
        int v62 = 138543618;
        uint64_t v63 = v55;
        __int16 v64 = 2114;
        uint64_t v65 = v57;
        _os_log_impl( &dword_0,  v54,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Posting follow-ups for the device offers.",  (uint8_t *)&v62,  0x16u);
      }

      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask bag](self, "bag"));
      uint64_t v58 = AMSLogKey(v49);
      uint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
      +[AMSDevice postAllDeviceOfferFollowUpsForAccount:priority:bag:logKey:]( &OBJC_CLASS___AMSDevice,  "postAllDeviceOfferFollowUpsForAccount:priority:bag:logKey:",  v6,  0LL,  v49,  v50);
    }
  }

  if ((+[AMSUnitTests isRunningUnitTests](&OBJC_CLASS___AMSUnitTests, "isRunningUnitTests") & 1) == 0)
  {
    id v59 = sub_B764();
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_DSID"));
    [v59 updateWithResponseDictionary:v18 accountIdentifier:v60];

    [sub_B764() endSuspendingSubscriptionStatusChangeNotifications];
  }

  unsigned __int8 v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  objc_msgSend(v6, "ams_setLastAuthenticated:", v61);

  objc_msgSend(v6, "ams_setServerResponse:", v18);
  -[AMSVerifyCredentialsTask _handleBiometricsForAuthenticatedAccount:]( self,  "_handleBiometricsForAuthenticatedAccount:",  v6);
  -[AMSVerifyCredentialsTask _handleDeviceOffersForAuthenticatedAccount:]( self,  "_handleDeviceOffersForAuthenticatedAccount:",  v6);
  -[AMSVerifyCredentialsTask _removeInactiveDuplicatesForAuthenticatedAccount:]( self,  "_removeInactiveDuplicatesForAuthenticatedAccount:",  v6);
  -[AMSVerifyCredentialsTask _removeRenewCredentialsFollowUp](self, "_removeRenewCredentialsFollowUp");
}

- (void)_removeInactiveDuplicatesForAuthenticatedAccount:(id)a3
{
  id v4 = a3;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  uint64_t v26 = self;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask accountStore](self, "accountStore"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accounts]);

  id v7 = [v6 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v31;
    id v25 = v4;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        if (([v11 isActive] & 1) == 0)
        {
          id v12 = objc_msgSend(v4, "ams_isDuplicate:", v11);
          if ((_DWORD)v12)
          {
            uint64_t v13 = AMSLogKey(v12);
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
            if (!v15) {
              uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
            }
            uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v17 = objc_opt_class(v26);
              if (v14) {
                id v18 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v17,  v14);
              }
              else {
                id v18 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: ",  v17,  v24);
              }
              int v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
              uint64_t v20 = AMSHashIfNeeded(v11);
              uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
              *(_DWORD *)buf = 138543618;
              uint64_t v35 = v19;
              __int16 v36 = 2114;
              v37 = v21;
              _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}@Removing an inactive duplicate of the account we just authenticated. duplicateAccount = %{public}@",  buf,  0x16u);

              id v4 = v25;
            }

            id v22 = (void *)objc_claimAutoreleasedReturnValue(-[AMSVerifyCredentialsTask accountStore](v26, "accountStore"));
            v27[0] = _NSConcreteStackBlock;
            v27[1] = 3221225472LL;
            v27[2] = sub_BAD0;
            v27[3] = &unk_14728;
            id v28 = v14;
            __int16 v29 = v26;
            id v23 = v14;
            [v22 removeAccount:v11 withCompletionHandler:v27];
          }
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }

    while (v8);
  }
}

- (void)_removeRenewCredentialsFollowUp
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
  if (!v4) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    uint64_t v7 = AMSLogKey(v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = objc_opt_class(self);
    uint64_t v10 = v9;
    if (v8)
    {
      uint64_t v11 = AMSLogKey(v9);
      uint64_t v2 = objc_claimAutoreleasedReturnValue(v11);
      id v12 = (AMSVerifyCredentialsTask *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v10,  v2));
    }

    else
    {
      id v12 = (AMSVerifyCredentialsTask *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: ",  v9));
    }

    *(_DWORD *)buf = 138543362;
    v37 = v12;
    _os_log_impl( &dword_0,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@Clearing the renew credentials follow-up following a successful authentication.",  buf,  0xCu);
    if (v8)
    {

      id v12 = (AMSVerifyCredentialsTask *)v2;
    }
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[AMSRenewAccountCredentialsFollowUpItem clear]( &OBJC_CLASS___AMSRenewAccountCredentialsFollowUpItem,  "clear"));
  id v35 = 0LL;
  unsigned int v14 = [v13 resultWithError:&v35];
  id v15 = v35;

  uint64_t v16 = objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
  uint64_t v17 = (void *)v16;
  if (v14)
  {
    if (!v16) {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 OSLogObject]);
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
    if (v19)
    {
      uint64_t v20 = AMSLogKey(v19);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      uint64_t v22 = objc_opt_class(self);
      uint64_t v23 = v22;
      if (v21)
      {
        uint64_t v24 = AMSLogKey(v22);
        self = (AMSVerifyCredentialsTask *)objc_claimAutoreleasedReturnValue(v24);
        id v25 = (AMSVerifyCredentialsTask *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v23,  self));
      }

      else
      {
        id v25 = (AMSVerifyCredentialsTask *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: ",  v22));
      }

      *(_DWORD *)buf = 138543362;
      v37 = v25;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "%{public}@Successfully cleared follow-up.", buf, 0xCu);
      if (v21)
      {

        id v25 = self;
      }
    }
  }

  else
  {
    if (!v16) {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 OSLogObject]);
    BOOL v26 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      uint64_t v27 = AMSLogKey(v26);
      id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      uint64_t v29 = objc_opt_class(self);
      uint64_t v30 = v29;
      if (v28)
      {
        uint64_t v31 = AMSLogKey(v29);
        self = (AMSVerifyCredentialsTask *)objc_claimAutoreleasedReturnValue(v31);
        __int128 v32 = (AMSVerifyCredentialsTask *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v30,  self));
      }

      else
      {
        __int128 v32 = (AMSVerifyCredentialsTask *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: ",  v29));
      }

      uint64_t v33 = AMSLogableError(v15);
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      *(_DWORD *)buf = 138543618;
      v37 = v32;
      __int16 v38 = 2114;
      uint64_t v39 = v34;
      _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_ERROR,  "%{public}@Error clearing the renew credentials follow-up: %{public}@",  buf,  0x16u);
      if (v28)
      {

        __int128 v32 = self;
      }
    }
  }
}

- (void)_retainIDMS:(BOOL)a3 forAccount:(id)a4
{
}

+ (void)_postAuthenticationBeganNotification
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
  if (!v3) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = objc_opt_class(a1);
    uint64_t v6 = AMSLogKey(v5);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    int v10 = 138543618;
    uint64_t v11 = v5;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_INFO,  "%{public}@: [%{public}@] Authentication began. Setting AuthenticationStarted to now.",  (uint8_t *)&v10,  0x16u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  +[AMSDefaults setAuthenticationStarted:](&OBJC_CLASS___AMSDefaults, "setAuthenticationStarted:", v8);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.StoreServices.authbegin", 0LL, 0LL, 1u);
}

+ (void)_postAuthenticationFailedNotification
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
  if (!v3) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = objc_opt_class(a1);
    uint64_t v6 = AMSLogKey(v5);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    int v9 = 138543618;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    __int16 v12 = v7;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_INFO,  "%{public}@: [%{public}@] Authentication failed. Setting AuthenticationStarted to nil.",  (uint8_t *)&v9,  0x16u);
  }

  +[AMSDefaults setAuthenticationStarted:](&OBJC_CLASS___AMSDefaults, "setAuthenticationStarted:", 0LL);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.StoreServices.authfail", 0LL, 0LL, 1u);
}

+ (void)_postAuthenticationFinishedNotification
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
  if (!v3) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = objc_opt_class(a1);
    uint64_t v6 = AMSLogKey(v5);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    int v9 = 138543618;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    __int16 v12 = v7;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_INFO,  "%{public}@: [%{public}@] Authentication finished. Setting AuthenticationStarted to nil.",  (uint8_t *)&v9,  0x16u);
  }

  +[AMSDefaults setAuthenticationStarted:](&OBJC_CLASS___AMSDefaults, "setAuthenticationStarted:", 0LL);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.StoreServices.authfinish", 0LL, 0LL, 1u);
}

+ (void)_postAuthenticationSubmittedNotification
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsAuthenticationPluginConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsAuthenticationPluginConfig"));
  if (!v3) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = objc_opt_class(a1);
    uint64_t v6 = AMSLogKey(v5);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    int v9 = 138543618;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    __int16 v12 = v7;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_INFO,  "%{public}@: [%{public}@] Authentication submitted.",  (uint8_t *)&v9,  0x16u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.StoreServices.authsubmit", 0LL, 0LL, 1u);
}

- (ACAccount)account
{
  return self->_account;
}

- (ACDAccountStore)accountStore
{
  return self->_accountStore;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (AMSAuthenticateOptions)options
{
  return self->_options;
}

- (BOOL)accountWasOriginallyActive
{
  return self->_accountWasOriginallyActive;
}

- (AMSDialogRequest)dialogRequest
{
  return self->_dialogRequest;
}

- (void)setDialogRequest:(id)a3
{
}

- (AMSAuthenticateMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (void).cxx_destruct
{
}

@end