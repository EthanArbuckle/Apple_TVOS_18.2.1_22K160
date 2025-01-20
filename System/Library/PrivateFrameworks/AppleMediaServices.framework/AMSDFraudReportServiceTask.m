@interface AMSDFraudReportServiceTask
+ (id)determineAccountForAccount:(id)a3;
+ (id)grandSlamTokenIdentifierForAuthenticationTokenType:(unint64_t)a3;
+ (id)performSilentAuthAndFetchTokenForAccount:(id)a3 tokenIdentifier:(id)a4;
+ (id)requestBodyParametersForRequest:(id)a3 odiAssessmentProvider:(id)a4;
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSDFraudReportServiceTask)initWithAccount:(id)a3 bag:(id)a4;
- (AMSDFraudReportServiceTask)initWithAccount:(id)a3 bag:(id)a4 initialAuthTokenProvider:(id)a5 authTokenRefreshProvider:(id)a6 odiAssessmentProvider:(id)a7 deviceIdentitySigningProvider:(id)a8;
- (id)appendTokenIfNeededToRequest:(id)a3 forAccount:(id)a4 tokenIdentifier:(id)a5;
- (id)fetchTokenForAccount:(id)a3 tokenIdentifier:(id)a4;
- (id)handleExpiredAuthenticationTokenErrorWithResult:(id)a3 error:(id)a4 forRequest:(id)a5 account:(id)a6 tokenIdentifier:(id)a7;
- (id)performReceiveFraudReportForServiceRequest:(id)a3;
- (id)requestEncoderWithAccount:(id)a3;
@end

@implementation AMSDFraudReportServiceTask

- (AMSDFraudReportServiceTask)initWithAccount:(id)a3 bag:(id)a4 initialAuthTokenProvider:(id)a5 authTokenRefreshProvider:(id)a6 odiAssessmentProvider:(id)a7 deviceIdentitySigningProvider:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (v16 && v17 && v18 && v19 && (v21 = v20) != 0LL)
  {
    v38.receiver = self;
    v38.super_class = (Class)&OBJC_CLASS___AMSDFraudReportServiceTask;
    v22 = -[AMSDFraudReportServiceTask init](&v38, "init");
    v23 = v22;
    if (v22)
    {
      objc_storeStrong((id *)&v22->_account, a3);
      objc_storeStrong((id *)&v23->_bag, a4);
      id v24 = objc_retainBlock(v17);
      id initialAuthTokenProvider = v23->_initialAuthTokenProvider;
      v23->_id initialAuthTokenProvider = v24;

      id v26 = objc_retainBlock(v18);
      id authTokenRefreshProvider = v23->_authTokenRefreshProvider;
      v23->_id authTokenRefreshProvider = v26;

      id v28 = objc_retainBlock(v19);
      id odiAssessmentProvider = v23->_odiAssessmentProvider;
      v23->_id odiAssessmentProvider = v28;

      id v30 = objc_retainBlock(v21);
      id deviceIdentitySigningProvider = v23->_deviceIdentitySigningProvider;
      v23->_id deviceIdentitySigningProvider = v30;
    }

    return v23;
  }

  else
  {
    id v33 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  @"bag, authenticationTokenRefreshProvider, odiAssessmentProvider and deviceIdentitySigningProvider must all be non-nil",  0LL));
    objc_exception_throw(v33);
    return -[AMSDFraudReportServiceTask initWithAccount:bag:](v34, v35, v36, v37);
  }

- (AMSDFraudReportServiceTask)initWithAccount:(id)a3 bag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10001AE64;
  v10[3] = &unk_1000D6508;
  objc_copyWeak(&v11, &location);
  v8 = -[AMSDFraudReportServiceTask initWithAccount:bag:initialAuthTokenProvider:authTokenRefreshProvider:odiAssessmentProvider:deviceIdentitySigningProvider:]( self,  "initWithAccount:bag:initialAuthTokenProvider:authTokenRefreshProvider:odiAssessmentProvider:deviceIdentitySigningProvider:",  v6,  v7,  &stru_1000D6480,  &stru_1000D64A0,  &stru_1000D64E0,  v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v8;
}

- (id)performReceiveFraudReportForServiceRequest:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10001AFAC;
  v6[3] = &unk_1000D6648;
  id v7 = self;
  id v8 = a3;
  id v3 = v8;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDFraudReportServiceTask performTaskWithPromiseBlock:](v7, "performTaskWithPromiseBlock:", v6));

  return v4;
}

- (id)handleExpiredAuthenticationTokenErrorWithResult:(id)a3 error:(id)a4 forRequest:(id)a5 account:(id)a6 tokenIdentifier:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v12)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 response]);
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse, v18);
    if ((objc_opt_isKindOfClass(v17, v19) & 1) != 0) {
      id v20 = v17;
    }
    else {
      id v20 = 0LL;
    }

    id v28 = [v20 statusCode];
    if (v28 == (id)401) {
      goto LABEL_9;
    }
    uint64_t v27 = objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithResult:](&OBJC_CLASS___AMSPromise, "promiseWithResult:", v12));
LABEL_15:
    objc_super v38 = (void *)v27;
    goto LABEL_16;
  }

  if (!AMSErrorIsEqual(v13, AMSErrorDomain, 301LL)
    || (v21 = (void *)objc_claimAutoreleasedReturnValue([v13 userInfo]),
        v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:AMSErrorUserInfoKeyStatusCode]),
        unsigned __int8 v23 = [v22 isEqual:&off_1000DEBC0],
        v22,
        v21,
        (v23 & 1) == 0))
  {
    uint64_t v27 = objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithError:](&OBJC_CLASS___AMSPromise, "promiseWithError:", v13));
    goto LABEL_15;
  }

+ (id)determineAccountForAccount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = AMSAccountMediaTypeProduction;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_iTunesAccountForAccount:forMediaType:createIfNeeded:", v4, v5, 1));

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10001C3D8;
    v11[3] = &unk_1000D6698;
    id v13 = a1;
    id v12 = v4;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 continueWithBlock:v11]);
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ams_fetchLocaliTunesAccount"));
  }

  return v8;
}

+ (id)grandSlamTokenIdentifierForAuthenticationTokenType:(unint64_t)a3
{
  if (a3 == 1) {
    return @"com.apple.gs.tdmv2.auth";
  }
  if (a3)
  {
    unsigned int v5 = +[AMSUnitTests isRunningUnitTests](&OBJC_CLASS___AMSUnitTests, "isRunningUnitTests");
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedFraudReportConfig](&OBJC_CLASS___AMSLogConfig, "sharedFraudReportConfig"));
    id v7 = (void *)v6;
    if (v5)
    {
      if (!v6) {
        id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      if (v9)
      {
        uint64_t v12 = AMSSetLogKeyIfNeeded(v9, v10, v11);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        int v21 = 138543874;
        id v22 = a1;
        __int16 v23 = 2114;
        uint64_t v24 = v13;
        __int16 v25 = 2050;
        unint64_t v26 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Unknown authentication token type (%{public}lu) passed, using non-JWT token identifier",  (uint8_t *)&v21,  0x20u);
      }

      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedFraudReportConfig](&OBJC_CLASS___AMSLogConfig, "sharedFraudReportConfig"));
      [v7 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v14 userInfo:0];
    }

    else
    {
      if (!v6) {
        id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
      BOOL v16 = os_log_type_enabled(v14, OS_LOG_TYPE_FAULT);
      if (v16)
      {
        uint64_t v19 = AMSSetLogKeyIfNeeded(v16, v17, v18);
        id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        int v21 = 138543874;
        id v22 = a1;
        __int16 v23 = 2114;
        uint64_t v24 = v20;
        __int16 v25 = 2050;
        unint64_t v26 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_FAULT,  "%{public}@: [%{public}@] Unknown authentication token type (%{public}lu) passed, using non-JWT token identifier",  (uint8_t *)&v21,  0x20u);
      }
    }
  }

  return @"com.apple.gs.tdm.auth";
}

- (id)appendTokenIfNeededToRequest:(id)a3 forAccount:(id)a4 tokenIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v13 = AMSSetLogKeyIfNeeded(v10, v11, v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (v9 && !objc_msgSend(v9, "ams_isLocalAccount"))
  {
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue( -[AMSDFraudReportServiceTask fetchTokenForAccount:tokenIdentifier:]( self,  "fetchTokenForAccount:tokenIdentifier:",  v9,  v10));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10001C98C;
    v25[3] = &unk_1000D66C0;
    id v26 = v8;
    id v27 = v10;
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v23 continueWithBlock:v25]);
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedFraudReportConfig](&OBJC_CLASS___AMSLogConfig, "sharedFraudReportConfig"));
    if (!v15) {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    BOOL v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (v17)
    {
      uint64_t v20 = AMSSetLogKeyIfNeeded(v17, v18, v19);
      int v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = self;
      __int16 v30 = 2114;
      v31 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Unable to look up token for no or local account",  buf,  0x16u);
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithResult:](&OBJC_CLASS___AMSPromise, "promiseWithResult:", v8));
  }

  return v22;
}

- (id)fetchTokenForAccount:(id)a3 tokenIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = AMSSetLogKeyIfNeeded(v7, v8, v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = (*((uint64_t (**)(void))self->_initialAuthTokenProvider + 2))();
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10001CAE4;
  v19[3] = &unk_1000D6670;
  v19[4] = self;
  id v20 = v11;
  id v21 = v7;
  id v22 = v6;
  id v14 = v6;
  id v15 = v7;
  id v16 = v11;
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v13 continueWithBlock:v19]);

  return v17;
}

+ (id)performSilentAuthAndFetchTokenForAccount:(id)a3 tokenIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = AMSSetLogKeyIfNeeded(v7, v8, v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedFraudReportConfig](&OBJC_CLASS___AMSLogConfig, "sharedFraudReportConfig"));
  if (!v12) {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v27 = a1;
    __int16 v28 = 2114;
    uint64_t v29 = v11;
    __int16 v30 = 2114;
    id v31 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Token with identifier '%{public}@' not found. Attempting to perform silent auth.",  buf,  0x20u);
  }

  id v14 = objc_alloc_init(&OBJC_CLASS___AMSAuthenticateOptions);
  [v14 setDebugReason:@"fraud score report"];
  [v14 setAuthenticationType:1];
  [v14 setCanMakeAccountActive:0];
  [v14 setServiceIdentifier:v7];
  id v15 = [[AMSAuthenticateTask alloc] initWithAccount:v6 options:v14];
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 performAuthentication]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10001CE40;
  v22[3] = &unk_1000D6738;
  id v23 = v6;
  id v24 = v7;
  id v25 = v14;
  id v17 = v14;
  id v18 = v7;
  id v19 = v6;
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v16 continueWithBlock:v22]);

  return v20;
}

- (id)requestEncoderWithAccount:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___AMSURLRequestEncoder);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDFraudReportServiceTask bag](self, "bag"));
  id v7 = [v5 initWithBag:v6];

  [v7 setDialogOptions:1];
  [v7 setRequestEncoding:3];
  id v8 = [v7 setUrlKnownToBeTrusted:1];
  uint64_t v10 = AMSLogKey(v8, v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  [v7 setLogUUID:v11];

  [v7 setAccount:v4];
  return v7;
}

+ (id)requestBodyParametersForRequest:(id)a3 odiAssessmentProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v10 = AMSSetLogKeyIfNeeded(v7, v8, v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v34[0] = @"namespace";
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 nameSpace]);
  v35[0] = v12;
  v34[1] = @"t1";
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 blindedMessage]);
  v35[1] = v13;
  v34[2] = @"rs";
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( NSNumber,  "numberWithUnsignedChar:",  [v7 reportedScore]));
  v35[2] = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v34,  3LL));
  id v16 = [v15 mutableCopy];

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 keyID]);
  [v16 setObject:v17 forKeyedSubscript:@"kid"];

  if (v6)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedFraudReportConfig](&OBJC_CLASS___AMSLogConfig, "sharedFraudReportConfig"));
    if (!v18) {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 OSLogObject]);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v31 = a1;
      __int16 v32 = 2114;
      uint64_t v33 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Requesting ODI assessment.",  buf,  0x16u);
    }

    id v20 = objc_opt_new(&OBJC_CLASS___AMSMutablePromise);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10001D4B0;
    v25[3] = &unk_1000D6760;
    id v29 = a1;
    id v26 = v11;
    id v27 = v16;
    id v21 = v20;
    __int16 v28 = v21;
    [v6 assessmentWithCompletion:v25];
    id v22 = v28;
    id v23 = v21;
  }

  else
  {
    id v23 = (AMSMutablePromise *)objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithResult:](&OBJC_CLASS___AMSPromise, "promiseWithResult:", v16));
  }

  return v23;
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void).cxx_destruct
{
}

@end