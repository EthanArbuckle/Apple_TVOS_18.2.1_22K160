@interface AMSDBiometricsTokenUpdateTask
+ (AMSThreadSafeDictionary)lockUptimeDictionary;
+ (id)confirmationDialogRequestForBiometricsType:(int64_t)a3 clientInfo:(id)a4 acceptActionIdentifier:(id *)a5 declineActionIdentifier:(id *)a6;
- (ACAccount)account;
- (AMSDBiometricsTokenUpdateTask)initWithAccount:(id)a3;
- (AMSProcessInfo)clientInfo;
- (AMSSecurityClientInterface)delegate;
- (AMSURLSession)session;
- (BOOL)_canAttemptTokenUpdate:(id *)a3;
- (BOOL)_isSupported:(id *)a3;
- (BOOL)_isSupportedMediaType:(id)a3;
- (BOOL)_presentConfirmation:(id *)a3 currentBiometricsState:(int64_t *)a4;
- (BOOL)_runConfirmationDialogWithError:(id *)a3;
- (BOOL)_shouldCreateCertsWithOption:(id)a3 forCerts:(id)a4;
- (BOOL)_updateTokens:(id *)a3 currentBiometricsState:(int64_t *)a4;
- (BOOL)isUserInitiated;
- (BOOL)shouldGenerateKeysOnly;
- (BOOL)shouldRequestConfirmation;
- (NSDictionary)additionalDialogMetrics;
- (id)_buildRequestBodyWithStyle:(unint64_t)a3 primaryCerts:(id)a4 extendedCerts:(id)a5;
- (id)_buildRequestWithBody:(id)a3 bag:(id)a4;
- (id)_handleDialogRequest:(id)a3;
- (id)_keychainOptionWithPurpose:(unint64_t)a3 style:(unint64_t)a4 regenerate:(BOOL)a5;
- (id)_lookupAttestationForOption:(id)a3;
- (id)performUpdate;
- (int64_t)_runUpdateRequestWithStyle:(unint64_t)a3 primaryCerts:(id)a4 extendedCerts:(id)a5 error:(id *)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6;
- (void)setAdditionalDialogMetrics:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSession:(id)a3;
- (void)setShouldGenerateKeysOnly:(BOOL)a3;
- (void)setShouldRequestConfirmation:(BOOL)a3;
- (void)setUserInitiated:(BOOL)a3;
@end

@implementation AMSDBiometricsTokenUpdateTask

- (AMSDBiometricsTokenUpdateTask)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AMSDBiometricsTokenUpdateTask;
  v6 = -[AMSDBiometricsTokenUpdateTask init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

+ (id)confirmationDialogRequestForBiometricsType:(int64_t)a3 clientInfo:(id)a4 acceptActionIdentifier:(id *)a5 declineActionIdentifier:(id *)a6
{
  v8 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___AMSBiometricsTokenUpdateTask, a2));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"TOUCHID_CONFIRMATION_DIALOG_OPT_IN" value:&stru_1000DB220 table:0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDialogAction actionWithTitle:](&OBJC_CLASS___AMSDialogAction, "actionWithTitle:", v10));

  v13 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___AMSBiometricsTokenUpdateTask, v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue( [v14 localizedStringForKey:@"TOUCHID_CONFIRMATION_DIALOG_OPT_OUT" value:&stru_1000DB220 table:0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDialogAction actionWithTitle:](&OBJC_CLASS___AMSDialogAction, "actionWithTitle:", v15));

  id v17 = objc_alloc(&OBJC_CLASS___AMSDialogRequest);
  v19 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___AMSBiometricsTokenUpdateTask, v18));
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue( [v20 localizedStringForKey:@"TOUCHID_CONFIRMATION_DIALOG_TITLE" value:&stru_1000DB220 table:0]);
  v23 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___AMSBiometricsTokenUpdateTask, v22));
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue( [v24 localizedStringForKey:@"TOUCHID_CONFIRMATION_DIALOG_MESSAGE" value:&stru_1000DB220 table:0]);
  id v26 = [v17 initWithTitle:v21 message:v25];

  v29[0] = v11;
  v29[1] = v16;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 2LL));
  [v26 setButtonActions:v27];

  if (a5) {
    *a5 = (id)objc_claimAutoreleasedReturnValue([v11 identifier]);
  }
  if (a6) {
    *a6 = (id)objc_claimAutoreleasedReturnValue([v16 identifier]);
  }

  return v26;
}

- (id)performUpdate
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100005778;
  v3[3] = &unk_1000D5C50;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue( -[AMSDBiometricsTokenUpdateTask performBinaryTaskWithBlock:]( self,  "performBinaryTaskWithBlock:",  v3));
}

- (BOOL)_presentConfirmation:(id *)a3 currentBiometricsState:(int64_t *)a4
{
  if (!-[AMSDBiometricsTokenUpdateTask shouldRequestConfirmation](self, "shouldRequestConfirmation")) {
    return 0;
  }
  id v12 = 0LL;
  unsigned __int8 v7 = -[AMSDBiometricsTokenUpdateTask _runConfirmationDialogWithError:](self, "_runConfirmationDialogWithError:", &v12);
  id v8 = v12;
  objc_super v9 = v8;
  if ((v7 & 1) == 0 && [v8 code] == (id)6)
  {
    *a4 = 2LL;
    +[AMSDefaults setDeviceBiometricsState:](&OBJC_CLASS___AMSDefaults, "setDeviceBiometricsState:", 2LL);
  }

  if (a3) {
    *a3 = v9;
  }
  BOOL v10 = v9 == 0LL;

  return v10;
}

- (id)_keychainOptionWithPurpose:(unint64_t)a3 style:(unint64_t)a4 regenerate:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = objc_alloc_init(&OBJC_CLASS___AMSKeychainOptions);
  -[AMSKeychainOptions setStyle:](v8, "setStyle:", a4);
  -[AMSKeychainOptions setPurpose:](v8, "setPurpose:", a3);
  -[AMSKeychainOptions setRegenerateKeys:](v8, "setRegenerateKeys:", v5);
  return v8;
}

- (id)_lookupAttestationForOption:(id)a3
{
  id v4 = a3;
  if ([v4 regenerateKeys])
  {
    BOOL v5 = 0LL;
  }

  else
  {
    unint64_t v6 = (unint64_t)[v4 style];
    if (v6 > 5)
    {
      id v7 = 0LL;
      BOOL v5 = 0LL;
    }

    else
    {
      if (((1LL << v6) & 0x39) != 0)
      {
        id v24 = 0LL;
        BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[AMSKeychain certificateChainStringsForOptions:error:]( &OBJC_CLASS___AMSKeychain,  "certificateChainStringsForOptions:error:",  v4,  &v24));
        id v7 = v24;
        id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedBiometricsConfig](&OBJC_CLASS___AMSLogConfig, "sharedBiometricsConfig"));
        if (!v8) {
          id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
        }
        objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v11 = (void *)objc_opt_class(self, v10);
          id v12 = v11;
          uint64_t v13 = AMSLogKey();
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          id v15 = [v5 count];
          *(_DWORD *)buf = 138544130;
          id v26 = v11;
          __int16 v27 = 2114;
          v28 = v14;
          __int16 v29 = 2050;
          id v30 = v15;
          __int16 v31 = 2114;
          id v32 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Found %{public}ld certs in chain (primary), error: %{public}@",  buf,  0x2Au);
        }
      }

      else
      {
        id v23 = 0LL;
        BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[AMSAttestation attestationWithOptions:error:]( &OBJC_CLASS___AMSAttestation,  "attestationWithOptions:error:",  v4,  &v23));
        id v7 = v23;
        id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedBiometricsConfig](&OBJC_CLASS___AMSLogConfig, "sharedBiometricsConfig"));
        if (!v8) {
          id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
        }
        objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id v17 = (void *)objc_opt_class(self, v16);
          id v18 = v17;
          uint64_t v19 = AMSLogKey();
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v5 count]));
          *(_DWORD *)buf = 138544130;
          id v26 = v17;
          __int16 v27 = 2114;
          v28 = v20;
          __int16 v29 = 2114;
          id v30 = v21;
          __int16 v31 = 2114;
          id v32 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Did fetch attestation: %{public}@, error: %{public}@",  buf,  0x2Au);
        }
      }
    }
  }

  return v5;
}

- (BOOL)_shouldCreateCertsWithOption:(id)a3 forCerts:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = ![v5 style] && objc_msgSend(v6, "count") != (id)2
    || [v5 style] == (id)3 && objc_msgSend(v6, "count") != (id)2
    || [v5 style] == (id)4 && objc_msgSend(v6, "count") != (id)2
    || [v5 style] == (id)5 && objc_msgSend(v6, "count") != (id)2
    || [v5 style] == (id)1 && objc_msgSend(v6, "count") != (id)1
    || [v5 style] == (id)2 && objc_msgSend(v6, "count") != (id)1;

  return v7;
}

- (BOOL)_updateTokens:(id *)a3 currentBiometricsState:(int64_t *)a4
{
  id v5 = +[AMSKeychainOptions preferredAttestationStyle]( &OBJC_CLASS___AMSKeychainOptions,  "preferredAttestationStyle",  a3,  a4);
  char v6 = 1;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( -[AMSDBiometricsTokenUpdateTask _keychainOptionWithPurpose:style:regenerate:]( self,  "_keychainOptionWithPurpose:style:regenerate:",  0LL,  v5,  1LL));
  id v58 = v5;
  v62 = (void *)objc_claimAutoreleasedReturnValue( -[AMSDBiometricsTokenUpdateTask _keychainOptionWithPurpose:style:regenerate:]( self,  "_keychainOptionWithPurpose:style:regenerate:",  1LL,  v5,  1LL));
  id v8 = 0LL;
  objc_super v9 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
  v59 = v7;
  while (1)
  {
    char v10 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue( -[AMSDBiometricsTokenUpdateTask _lookupAttestationForOption:]( self,  "_lookupAttestationForOption:",  v7));
    char v60 = v10;
    if (-[AMSDBiometricsTokenUpdateTask _shouldCreateCertsWithOption:forCerts:]( self,  "_shouldCreateCertsWithOption:forCerts:",  v7,  v11))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v9[507] sharedBiometricsConfig]);
      if (!v12) {
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v9[507] sharedConfig]);
      }
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = (void *)objc_opt_class(self, v14);
        id v16 = v15;
        uint64_t v17 = AMSLogKey();
        id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        id v19 = [v59 style];
        *(_DWORD *)buf = 138543874;
        v67 = v15;
        __int16 v68 = 2114;
        v69 = v18;
        __int16 v70 = 2048;
        id v71 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Creating attestation tokens (primary) for style: %ld",  buf,  0x20u);
      }

      id v65 = v8;
      BOOL v7 = v59;
      v61 = (void *)objc_claimAutoreleasedReturnValue( +[AMSAttestation attestationWithOptions:error:]( &OBJC_CLASS___AMSAttestation,  "attestationWithOptions:error:",  v59,  &v65));
      id v20 = v65;

      v21 = (void *)objc_claimAutoreleasedReturnValue([v9[507] sharedBiometricsConfig]);
      if (!v21) {
        v21 = (void *)objc_claimAutoreleasedReturnValue([v9[507] sharedConfig]);
      }
      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 OSLogObject]);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = (void *)objc_opt_class(self, v23);
        id v25 = v24;
        uint64_t v26 = AMSLogKey();
        __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        id v28 = [v61 count];
        id v29 = [v59 style];
        *(_DWORD *)buf = 138544386;
        v67 = v24;
        __int16 v68 = 2114;
        v69 = v27;
        __int16 v70 = 2048;
        id v71 = v28;
        objc_super v9 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
        __int16 v72 = 2048;
        id v73 = v29;
        __int16 v74 = 2114;
        id v75 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Finished creating attestation tokens (primary). Count: %ld, Style: %ld, error: %{public}@",  buf,  0x34u);
      }
    }

    else
    {
      v61 = v11;
      id v20 = v8;
    }

    id v64 = v20;
    id v30 = (void *)objc_claimAutoreleasedReturnValue( +[AMSAttestation attestationWithOptions:error:]( &OBJC_CLASS___AMSAttestation,  "attestationWithOptions:error:",  v62,  &v64));
    id v8 = v64;

    __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v9[507] sharedBiometricsConfig]);
    if (!v31) {
      __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v9[507] sharedConfig]);
    }
    id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v31 OSLogObject]);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v34 = (void *)objc_opt_class(self, v33);
      id v35 = v34;
      uint64_t v36 = AMSSetLogKeyIfNeeded();
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v30 count]));
      v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v62 style]));
      *(_DWORD *)buf = 138544386;
      v67 = v34;
      objc_super v9 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
      __int16 v68 = 2114;
      v69 = v37;
      __int16 v70 = 2114;
      id v71 = v38;
      __int16 v72 = 2114;
      id v73 = v39;
      __int16 v74 = 2114;
      id v75 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Finished creating attestation tokens (extended). Count: %{public}@, Style: %{public}@, error: %{public}@",  buf,  0x34u);

      BOOL v7 = v59;
    }

    if (v8 || -[AMSDBiometricsTokenUpdateTask shouldGenerateKeysOnly](self, "shouldGenerateKeysOnly")) {
      break;
    }
    v40 = (void *)objc_claimAutoreleasedReturnValue([v9[507] sharedBiometricsConfig]);
    if (!v40) {
      v40 = (void *)objc_claimAutoreleasedReturnValue([v9[507] sharedConfig]);
    }
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue([v40 OSLogObject]);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v43 = (void *)objc_opt_class(self, v42);
      id v44 = v43;
      uint64_t v45 = AMSLogKey();
      v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
      *(_DWORD *)buf = 138543618;
      v67 = v43;
      __int16 v68 = 2114;
      v69 = v46;
      _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Running update request",  buf,  0x16u);

      objc_super v9 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
    }

    id v63 = 0LL;
    v47 = v61;
    int64_t v48 = -[AMSDBiometricsTokenUpdateTask _runUpdateRequestWithStyle:primaryCerts:extendedCerts:error:]( self,  "_runUpdateRequestWithStyle:primaryCerts:extendedCerts:error:",  v58,  v61,  v30,  &v63);
    id v8 = v63;
    if (v48 != 498) {
      goto LABEL_33;
    }
    [v7 setRegenerateKeys:1];
    [v62 setRegenerateKeys:1];

    char v6 = 0;
    if ((v60 & 1) == 0) {
      goto LABEL_34;
    }
  }

  if (-[AMSDBiometricsTokenUpdateTask shouldGenerateKeysOnly](self, "shouldGenerateKeysOnly"))
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue([v9[507] sharedBiometricsConfig]);
    v47 = v61;
    if (!v49) {
      v49 = (void *)objc_claimAutoreleasedReturnValue([v9[507] sharedConfig]);
    }
    v50 = (os_log_s *)objc_claimAutoreleasedReturnValue([v49 OSLogObject]);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v52 = (void *)objc_opt_class(self, v51);
      id v53 = v52;
      uint64_t v54 = AMSLogKey();
      v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
      *(_DWORD *)buf = 138543618;
      v67 = v52;
      __int16 v68 = 2114;
      v69 = v55;
      _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Skipping attestation due to shouldGenerateKeysOnly being set",  buf,  0x16u);
    }
  }

  else
  {
    v47 = v61;
  }

- (BOOL)_isSupported:(id *)a3
{
  if (+[AMSBiometrics type](&OBJC_CLASS___AMSBiometrics, "type")
    && +[AMSBiometrics type](&OBJC_CLASS___AMSBiometrics, "type") != (id)1)
  {
    id v5 = 0LL;
    BOOL v6 = 1;
  }

  else
  {
    uint64_t v4 = AMSError(5LL, @"Token Update Error", @"Platform does not have LocalAuth", 0LL);
    id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
    if (a3)
    {
      id v5 = v5;
      BOOL v6 = 0;
      *a3 = v5;
    }

    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (BOOL)_canAttemptTokenUpdate:(id *)a3
{
  uint64_t v29 = 0LL;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  char v32 = 1;
  uint64_t v23 = 0LL;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  uint64_t v26 = sub_100006D44;
  __int16 v27 = sub_100006D54;
  id v28 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v5 systemUptime];
  uint64_t v7 = v6;

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDBiometricsTokenUpdateTask account](self, "account"));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);

  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "lockUptimeDictionary");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100006D5C;
  v17[3] = &unk_1000D5C78;
  id v13 = v9;
  uint64_t v22 = v7;
  id v18 = v13;
  id v19 = self;
  id v20 = &v29;
  v21 = &v23;
  [v12 readWrite:v17];

  int v14 = *((unsigned __int8 *)v30 + 24);
  if (a3 && !*((_BYTE *)v30 + 24))
  {
    *a3 = (id) v24[5];
    int v14 = *((unsigned __int8 *)v30 + 24);
  }

  BOOL v15 = v14 != 0;

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
  return v15;
}

- (BOOL)_runConfirmationDialogWithError:(id *)a3
{
  id v5 = (void *)objc_opt_class(self, a2);
  id v6 = +[AMSBiometrics type](&OBJC_CLASS___AMSBiometrics, "type");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDBiometricsTokenUpdateTask clientInfo](self, "clientInfo"));
  id v44 = 0LL;
  id v45 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( [v5 confirmationDialogRequestForBiometricsType:v6 clientInfo:v7 acceptActionIdentifier:&v45 declineActionIdentifier:&v44]);
  id v9 = v45;
  id v10 = v44;

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDBiometricsTokenUpdateTask _handleDialogRequest:](self, "_handleDialogRequest:", v8));
  id v43 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 resultWithError:&v43]);
  id v13 = v43;

  int v14 = (void *)objc_claimAutoreleasedReturnValue([v12 selectedActionIdentifier]);
  unsigned int v15 = [v14 isEqualToString:v9];

  if (v15)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedBiometricsConfig](&OBJC_CLASS___AMSLogConfig, "sharedBiometricsConfig"));
    if (!v16) {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = a3;
      id v20 = (void *)objc_opt_class(self, v18);
      id v39 = v20;
      uint64_t v21 = AMSLogKey();
      v41 = v8;
      id v22 = v9;
      id v23 = v10;
      id v24 = (void *)objc_claimAutoreleasedReturnValue(v21);
      *(_DWORD *)buf = 138543618;
      v47 = v20;
      a3 = v19;
      __int16 v48 = 2114;
      v49 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Biometrics confirmation dialog accepted",  buf,  0x16u);

      id v10 = v23;
      id v9 = v22;
      id v8 = v41;
    }
  }

  else
  {
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v12 selectedActionIdentifier]);
    id v42 = v10;
    unsigned int v26 = [v25 isEqualToString:v10];

    if (v26)
    {
      __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedBiometricsConfig](&OBJC_CLASS___AMSLogConfig, "sharedBiometricsConfig"));
      if (!v27) {
        __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 OSLogObject]);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        id v30 = (void *)objc_opt_class(self, v29);
        id v40 = v30;
        uint64_t v31 = AMSLogKey();
        char v32 = a3;
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v31);
        *(_DWORD *)buf = 138543618;
        v47 = v30;
        __int16 v48 = 2114;
        v49 = v33;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Biometrics confirmation dialog declined",  buf,  0x16u);

        a3 = v32;
      }

      v34 = @"User declined biometrics dialog";
      uint64_t v35 = 6LL;
      id v36 = 0LL;
    }

    else
    {
      v34 = @"Could not handle dialog request";
      uint64_t v35 = 0LL;
      id v36 = v13;
    }

    uint64_t v37 = AMSError(v35, @"Token Update Error", v34, v36);
    id v16 = v13;
    id v13 = (id)objc_claimAutoreleasedReturnValue(v37);
    id v10 = v42;
  }

  -[AMSDBiometricsTokenUpdateTask _sendMetricsForDialog](self, "_sendMetricsForDialog");
  if (a3) {
    *a3 = v13;
  }

  return v13 == 0LL;
}

- (id)_buildRequestBodyWithStyle:(unint64_t)a3 primaryCerts:(id)a4 extendedCerts:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v10 = v9;
  if (a3 - 1 > 1)
  {
    if (v7) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v7,  @"primaryX509Chain");
    }
    if (v8) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v8,  @"extendedX509Chain");
    }
  }

  else
  {
    if ([v7 count])
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:0]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v11,  @"touchIdAttestation");
    }

    if ([v8 count])
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:0]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v12,  @"extendedAttestation");
    }
  }

  return v10;
}

- (id)_buildRequestWithBody:(id)a3 bag:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDBiometricsTokenUpdateTask clientInfo](self, "clientInfo"));
  if (!v8)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSProcessInfo currentProcess](&OBJC_CLASS___AMSProcessInfo, "currentProcess"));
    [v8 setAccountMediaType:AMSAccountMediaTypeProduction];
  }

  id v9 = [[AMSURLRequestEncoder alloc] initWithBag:v6];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDBiometricsTokenUpdateTask account](self, "account"));
  [v9 setAccount:v10];

  [v9 setClientInfo:v8];
  [v9 setRequestEncoding:2];
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 URLForKey:@"update-touch-id-settings"]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 requestWithMethod:4 bagURL:v11 parameters:v7]);
  return v12;
}

- (BOOL)_isSupportedMediaType:(id)a3
{
  id v3 = a3;
  else {
    unsigned int v4 = [v3 isEqualToString:AMSAccountMediaTypeAppStoreBeta] ^ 1;
  }

  return v4;
}

- (int64_t)_runUpdateRequestWithStyle:(unint64_t)a3 primaryCerts:(id)a4 extendedCerts:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedBiometricsConfig](&OBJC_CLASS___AMSLogConfig, "sharedBiometricsConfig"));
  if (!v11) {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = (void *)objc_opt_class(self, v13);
    id v15 = v14;
    uint64_t v16 = AMSLogKey();
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    *(_DWORD *)buf = 138544130;
    id v45 = v14;
    __int16 v46 = 2114;
    v47 = v17;
    __int16 v48 = 2048;
    id v49 = [v9 count];
    __int16 v50 = 2048;
    id v51 = [v10 count];
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Running update task. (primaryCount: %ld, extendedCount: %ld)",  buf,  0x2Au);
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[AMSProcessInfo currentProcess](&OBJC_CLASS___AMSProcessInfo, "currentProcess"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 accountMediaType]);

  if (-[AMSDBiometricsTokenUpdateTask _isSupportedMediaType:](self, "_isSupportedMediaType:", v19))
  {
    id v40 = v9;
    id v20 = (void *)objc_claimAutoreleasedReturnValue( -[AMSDBiometricsTokenUpdateTask _buildRequestBodyWithStyle:primaryCerts:extendedCerts:]( self,  "_buildRequestBodyWithStyle:primaryCerts:extendedCerts:",  a3,  v9,  v10));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDBag defaultBag](&OBJC_CLASS___AMSDBag, "defaultBag"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue( -[AMSDBiometricsTokenUpdateTask _buildRequestWithBody:bag:]( self,  "_buildRequestWithBody:bag:",  v20,  v21));

    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_100007B38;
    v43[3] = &unk_1000D5CA0;
    v43[4] = self;
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 thenWithBlock:v43]);
    id v42 = 0LL;
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 resultWithError:&v42]);
    id v25 = v42;
    unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDBiometricsTokenUpdateTask session](self, "session"));
    [v26 invalidateAndCancel];

    if (v25)
    {
      id v27 = 0LL;
    }

    else
    {
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v24 object]);
      uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSDictionary, v34);
      if ((objc_opt_isKindOfClass(v33, v35) & 1) != 0) {
        id v36 = v33;
      }
      else {
        id v36 = 0LL;
      }

      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:@"status"]);
      if ((objc_opt_respondsToSelector(v37, "integerValue") & 1) != 0)
      {
        id v27 = [v37 integerValue];
        id v25 = 0LL;
      }

      else
      {
        uint64_t v38 = AMSError(301LL, @"Token Update Error", @"Received invalid response", 0LL);
        id v25 = (id)objc_claimAutoreleasedReturnValue(v38);
        id v27 = 0LL;
      }
    }

    if (a6) {
      *a6 = v25;
    }

    id v9 = v40;
  }

  else
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedBiometricsConfig](&OBJC_CLASS___AMSLogConfig, "sharedBiometricsConfig"));
    if (!v20) {
      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v20 OSLogObject]);
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = (void *)objc_opt_class(self, v28);
      id v30 = v29;
      uint64_t v31 = AMSLogKey();
      char v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      *(_DWORD *)buf = 138543874;
      id v45 = v29;
      __int16 v46 = 2114;
      v47 = v32;
      __int16 v48 = 2114;
      id v49 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v22,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Skipping biometrics task for media type. processMediaType = %{public}@",  buf,  0x20u);
    }

    id v27 = 0LL;
  }

  return (int64_t)v27;
}

- (id)_handleDialogRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___AMSMutablePromise);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedBiometricsConfig](&OBJC_CLASS___AMSLogConfig, "sharedBiometricsConfig"));
  if (!v6) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_opt_class(self, v8);
    id v10 = v9;
    uint64_t v11 = AMSLogKey();
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 138543874;
    id v20 = v9;
    __int16 v21 = 2114;
    id v22 = v12;
    __int16 v23 = 2114;
    id v24 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Informing delegate about dialog request. Request: %{public}@",  buf,  0x20u);
  }

  objc_initWeak((id *)buf, self);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDBiometricsTokenUpdateTask delegate](self, "delegate"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100007E44;
  v16[3] = &unk_1000D5CC8;
  objc_copyWeak(&v18, (id *)buf);
  int v14 = v5;
  uint64_t v17 = v14;
  [v13 handleDialogRequest:v4 completion:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);

  return v14;
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  id v27 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void, void *))a6;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedBiometricsConfig](&OBJC_CLASS___AMSLogConfig, "sharedBiometricsConfig"));
  if (!v13) {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = (void *)objc_opt_class(self, v15);
    id v17 = v16;
    uint64_t v18 = AMSLogKey();
    id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    uint64_t v20 = AMSHashIfNeeded(v11);
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    *(_DWORD *)buf = 138543874;
    char v32 = v16;
    __int16 v33 = 2114;
    uint64_t v34 = v19;
    __int16 v35 = 2114;
    id v36 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Informing delegate about authenticate request. Request: %{public}@",  buf,  0x20u);
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDBiometricsTokenUpdateTask delegate](self, "delegate"));
  BOOL v23 = v22 == 0LL;

  if (v23)
  {
    uint64_t v25 = AMSError( 2LL,  @"Biometric Authentication Failed",  @"No delegate to perform biometric authentication",  0LL);
    unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v12[2](v12, 0LL, v26);
  }

  else
  {
    objc_initWeak((id *)buf, self);
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDBiometricsTokenUpdateTask delegate](self, "delegate"));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_100008250;
    v28[3] = &unk_1000D5CF0;
    objc_copyWeak(&v30, (id *)buf);
    uint64_t v29 = v12;
    [v24 handleAuthenticateRequest:v11 completion:v28];

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
  }
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  id v8 = a6;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDBiometricsTokenUpdateTask _handleDialogRequest:](self, "_handleDialogRequest:", a5));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100008490;
  v11[3] = &unk_1000D5D18;
  id v12 = v8;
  id v10 = v8;
  [v9 addFinishBlock:v11];
}

- (ACAccount)account
{
  return self->_account;
}

- (NSDictionary)additionalDialogMetrics
{
  return self->_additionalDialogMetrics;
}

- (void)setAdditionalDialogMetrics:(id)a3
{
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
}

- (AMSSecurityClientInterface)delegate
{
  return (AMSSecurityClientInterface *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldGenerateKeysOnly
{
  return self->_shouldGenerateKeysOnly;
}

- (void)setShouldGenerateKeysOnly:(BOOL)a3
{
  self->_shouldGenerateKeysOnly = a3;
}

- (BOOL)shouldRequestConfirmation
{
  return self->_shouldRequestConfirmation;
}

- (void)setShouldRequestConfirmation:(BOOL)a3
{
  self->_shouldRequestConfirmation = a3;
}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (AMSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (AMSThreadSafeDictionary)lockUptimeDictionary
{
  if (qword_1000F1F60 != -1) {
    dispatch_once(&qword_1000F1F60, &stru_1000D5D58);
  }
  return (AMSThreadSafeDictionary *)(id)qword_1000F1F68;
}

@end