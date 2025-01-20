@interface DaemonBiometricStore
+ (BOOL)tokenUpdateShouldStartWithLogKey:(id)a3;
+ (id)_dispatchQueueUpdateToken;
+ (int64_t)tokenUpdateState;
+ (void)_handleMessage:(id)a3 connection:(id)a4 withReplyBlock:(id)a5;
+ (void)_resetAccount:(id)a3 withConnection:(id)a4;
+ (void)getAllCachedBiometricHTTPHeadersWithMessage:(id)a3 connection:(id)a4;
+ (void)getCachedBiometricAuthenticationContextWithMessage:(id)a3 connection:(id)a4;
+ (void)getCachedBiometricHTTPHeadersWithMessage:(id)a3 connection:(id)a4;
+ (void)getConstraintsDictionaryWithMessage:(id)a3 connection:(id)a4;
+ (void)getCurrentACLVersionWithMessage:(id)a3 connection:(id)a4;
+ (void)getIdentityMapCountWithMessage:(id)a3 connection:(id)a4;
+ (void)getKeyCountWithMessage:(id)a3 connection:(id)a4;
+ (void)getStateWithMessage:(id)a3 connection:(id)a4;
+ (void)isIdentityMapValidWithMessage:(id)a3 connection:(id)a4;
+ (void)observeXPCServer:(id)a3;
+ (void)resetAccountWithMessage:(id)a3 connection:(id)a4;
+ (void)resetWithMessage:(id)a3 connection:(id)a4;
+ (void)saveIdentityMapWithMessage:(id)a3 connection:(id)a4;
+ (void)setAllowedWithMessage:(id)a3 connection:(id)a4;
+ (void)setEnabledWithMessage:(id)a3 connection:(id)a4;
+ (void)tokenUpdateDidFinishWithLogKey:(id)a3;
+ (void)tokenUpdateDidFinishWithMessage:(id)a3 connection:(id)a4;
+ (void)tokenUpdateShouldStartWithMessage:(id)a3 connection:(id)a4;
+ (void)tokenUpdateStateWithMessage:(id)a3 connection:(id)a4;
- (BOOL)canPerformBiometricOptIn;
- (BOOL)isBiometricStateEnabled;
- (BOOL)isIdentityMapValidForAccountIdentifier:(id)a3;
- (NSNumber)lastRegisteredAccountIdentifier;
- (id)_bootDate;
- (id)identityMap;
- (int64_t)biometricState;
- (int64_t)tokenAvailabilityForAccountIdentifier:(id)a3;
- (unint64_t)keyCountForAccountIdentifier:(id)a3;
- (void)_deleteKeychainTokensForAccountIdentifier:(id)a3;
- (void)clearLastRegisteredAccountIdentifier;
- (void)obliterateBiometricsForAccountIdentifier:(id)a3;
- (void)registerAccountIdentifier:(id)a3;
- (void)setBiometricState:(int64_t)a3;
@end

@implementation DaemonBiometricStore

- (int64_t)biometricState
{
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue( @"AMSDeviceBiometricsState",  @"com.apple.AppleMediaServices",  0LL);
  if (AppIntegerValue == 2) {
    return 1LL;
  }
  else {
    return 2LL * (AppIntegerValue == 1);
  }
}

- (BOOL)canPerformBiometricOptIn
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DaemonBiometricStore identityMap](self, "identityMap"));
  if ([v2 count])
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    unsigned __int8 v4 = [v3 isPasscodeSet];
  }

  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)clearLastRegisteredAccountIdentifier
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v3) {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v4 = [v3 shouldLog];
  else {
    LODWORD(v5) = v4;
  }
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v5 = v5;
  }
  else {
    v5 &= 2u;
  }
  if (!(_DWORD)v5) {
    goto LABEL_12;
  }
  int v9 = 138543362;
  id v10 = (id)objc_opt_class(self);
  id v7 = v10;
  v8 = (void *)_os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "%{public}@: Clearing biometric account identifier",  &v9,  12);

  if (v8)
  {
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v8,  4LL));
    free(v8);
    SSFileLog(v3, @"%@");
LABEL_12:
  }

  CFPreferencesSetAppValue(@"BiometricAccountID", 0LL, kSSUserDefaultsIdentifier);
}

- (id)identityMap
{
  return 0LL;
}

- (BOOL)isBiometricStateEnabled
{
  return CFPreferencesGetAppIntegerValue(@"BiometricStateEnabled", kSSUserDefaultsIdentifier, 0LL) == 2;
}

- (BOOL)isIdentityMapValidForAccountIdentifier:(id)a3
{
  return 0;
}

- (unint64_t)keyCountForAccountIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[DaemonBiometricKeychain sharedInstance](&OBJC_CLASS___DaemonBiometricKeychain, "sharedInstance"));
  id v31 = 0LL;
  v6 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v5,  "publicKeyDataForAccountIdentifier_:purpose:regenerateKeys:error:",  v4,  0,  0,  &v31));
  id v7 = v31;

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v8) {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v9 = [v8 shouldLog];
    else {
      LODWORD(v10) = v9;
    }
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      uint64_t v10 = v10;
    }
    else {
      v10 &= 2u;
    }
    if ((_DWORD)v10)
    {
      v12 = (void *)objc_opt_class(self);
      int v32 = 138543618;
      v33 = v12;
      __int16 v34 = 2114;
      id v35 = v7;
      id v13 = v12;
      v14 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  16LL,  "%{public}@: Failed to query public key for purchase with error: %{public}@",  &v32,  22);

      if (!v14)
      {
LABEL_14:

        goto LABEL_15;
      }

      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v14,  4LL));
      free(v14);
      v28 = v11;
      SSFileLog(v8, @"%@");
    }

    goto LABEL_14;
  }

- (NSNumber)lastRegisteredAccountIdentifier
{
  return (NSNumber *)(id)CFPreferencesCopyAppValue( @"BiometricAccountID",  kSSUserDefaultsIdentifier);
}

- (int64_t)tokenAvailabilityForAccountIdentifier:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    int64_t v17 = 4LL;
    goto LABEL_23;
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned int v6 = [v5 isPasscodeSet];

  if (!v6
    || (id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DaemonBiometricStore identityMap](self, "identityMap")),
        id v8 = [v7 count],
        v7,
        !v8))
  {
    int64_t v17 = 3LL;
    goto LABEL_23;
  }

  if (!-[DaemonBiometricStore isIdentityMapValidForAccountIdentifier:]( self,  "isIdentityMapValidForAccountIdentifier:",  v4))
  {
    int64_t v17 = 2LL;
    goto LABEL_23;
  }

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[DaemonBiometricStore lastRegisteredAccountIdentifier](self, "lastRegisteredAccountIdentifier"));
  unsigned __int8 v10 = [v9 isEqualToNumber:v4];

  if ((v10 & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharediTunesStoreConfig](&OBJC_CLASS___SSLogConfig, "sharediTunesStoreConfig"));
    if (!v11) {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v12 = [v11 shouldLog];
    else {
      LODWORD(v13) = v12;
    }
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v13 = v13;
    }
    else {
      v13 &= 2u;
    }
    if ((_DWORD)v13)
    {
      int v19 = 138543362;
      id v20 = (id)objc_opt_class(self);
      id v15 = v20;
      v16 = (void *)_os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "%{public}@: Invalid account state detected, but will continue with biometric authorization.",  &v19,  12);

      if (!v16)
      {
LABEL_18:

        goto LABEL_19;
      }

      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v16,  4LL));
      free(v16);
      SSFileLog(v11, @"%@");
    }

    goto LABEL_18;
  }

- (void)obliterateBiometricsForAccountIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v5) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v6 = [v5 shouldLog];
  else {
    LODWORD(v7) = v6;
  }
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v7 = v7;
  }
  else {
    v7 &= 2u;
  }
  if (!(_DWORD)v7) {
    goto LABEL_12;
  }
  int v11 = 138543618;
  id v12 = (id)objc_opt_class(self);
  __int16 v13 = 2112;
  id v14 = v4;
  id v9 = v12;
  unsigned __int8 v10 = (void *)_os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "%{public}@: Resetting biometrics for DSID: %@",  &v11,  22);

  if (v10)
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v10,  4LL));
    free(v10);
    SSFileLog(v5, @"%@");
LABEL_12:
  }

  -[DaemonBiometricStore setBiometricState:](self, "setBiometricState:", 0LL);
}

- (void)registerAccountIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v5) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v6 = [v5 shouldLog];
  else {
    LODWORD(v7) = v6;
  }
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v7 = v7;
  }
  else {
    v7 &= 2u;
  }
  if (!(_DWORD)v7) {
    goto LABEL_12;
  }
  int v12 = 138543618;
  id v13 = (id)objc_opt_class(self);
  __int16 v14 = 2114;
  id v15 = v4;
  id v9 = v13;
  unsigned __int8 v10 = (void *)_os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "%{public}@: Registering biometric account identifier for DSID: %{public}@",  &v12,  22);

  if (v10)
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v10,  4LL));
    free(v10);
    SSFileLog(v5, @"%@");
LABEL_12:
  }

  int v11 = (const __CFString *)kSSUserDefaultsIdentifier;
  CFPreferencesSetAppValue(@"BiometricAccountID", v4, kSSUserDefaultsIdentifier);
  CFPreferencesAppSynchronize(v11);
}

- (void)setBiometricState:(int64_t)a3
{
  if (-[DaemonBiometricStore biometricState](self, "biometricState") != a3)
  {
    uint64_t v5 = -[NSNumber initWithInteger:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInteger:", a3);
    unsigned int v6 = (const __CFString *)kSSUserDefaultsIdentifier;
    value = v5;
    CFPreferencesSetAppValue(@"BiometricState", v5, kSSUserDefaultsIdentifier);
    if ((unint64_t)(a3 - 1) >= 2)
    {
      CFPreferencesAppSynchronize(v6);
    }

    else
    {
      CFPreferencesSetAppValue(@"BiometricStateEnabled", value, v6);
      CFPreferencesAppSynchronize(v6);
      if (a3 == 1)
      {
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DaemonBiometricStore lastRegisteredAccountIdentifier](self, "lastRegisteredAccountIdentifier"));
        if (v7) {
          -[DaemonBiometricStore _deleteKeychainTokensForAccountIdentifier:]( self,  "_deleteKeychainTokensForAccountIdentifier:",  v7);
        }
        id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 activeAccount]);
        unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueIdentifier]);

        if (v10 && (!v7 || ([v10 isEqualToNumber:v7] & 1) == 0)) {
          -[DaemonBiometricStore _deleteKeychainTokensForAccountIdentifier:]( self,  "_deleteKeychainTokensForAccountIdentifier:",  v10);
        }
      }
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, kSSBiometricsStateChangedNotification, 0LL, 0LL, 1u);
  }

+ (void)tokenUpdateDidFinishWithLogKey:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class(a1) _dispatchQueueUpdateToken];
  unsigned int v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100140240;
  block[3] = &unk_10034AC30;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, block);
}

+ (BOOL)tokenUpdateShouldStartWithLogKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 1;
  id v5 = [(id)objc_opt_class(a1) _dispatchQueueUpdateToken];
  unsigned int v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001404A0;
  v9[3] = &unk_10034CA68;
  id v10 = v4;
  int v11 = &v12;
  id v7 = v4;
  dispatch_sync(v6, v9);

  LOBYTE(v6) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)v6;
}

+ (int64_t)tokenUpdateState
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v10 = 0LL;
  id v2 = [(id)objc_opt_class(a1) _dispatchQueueUpdateToken];
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v2);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100140BA8;
  block[3] = &unk_10034F8E8;
  void block[4] = &v7;
  dispatch_sync(v3, block);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

+ (void)observeXPCServer:(id)a3
{
  id v4 = a3;
  [v4 addObserver:a1 selector:"getAllCachedBiometricHTTPHeadersWithMessage:connection:" forMessage:203];
  [v4 addObserver:a1 selector:"getCachedBiometricAuthenticationContextWithMessage:connection:" forMessage:195];
  [v4 addObserver:a1 selector:"getCachedBiometricHTTPHeadersWithMessage:connection:" forMessage:196];
  [v4 addObserver:a1 selector:"getConstraintsDictionaryWithMessage:connection:" forMessage:214];
  [v4 addObserver:a1 selector:"getCurrentACLVersionWithMessage:connection:" forMessage:213];
  [v4 addObserver:a1 selector:"getIdentityMapCountWithMessage:connection:" forMessage:182];
  [v4 addObserver:a1 selector:"getKeyCountWithMessage:connection:" forMessage:202];
  [v4 addObserver:a1 selector:"getStateWithMessage:connection:" forMessage:122];
  [v4 addObserver:a1 selector:"isIdentityMapValidWithMessage:connection:" forMessage:183];
  [v4 addObserver:a1 selector:"resetAccountWithMessage:connection:" forMessage:125];
  [v4 addObserver:a1 selector:"resetWithMessage:connection:" forMessage:124];
  [v4 addObserver:a1 selector:"saveIdentityMapWithMessage:connection:" forMessage:184];
  [v4 addObserver:a1 selector:"setEnabledWithMessage:connection:" forMessage:123];
  [v4 addObserver:a1 selector:"setAllowedWithMessage:connection:" forMessage:126];
  [v4 addObserver:a1 selector:"tokenUpdateDidFinishWithMessage:connection:" forMessage:206];
  [v4 addObserver:a1 selector:"tokenUpdateShouldStartWithMessage:connection:" forMessage:207];
  [v4 addObserver:a1 selector:"tokenUpdateStateWithMessage:connection:" forMessage:208];
}

+ (void)getAllCachedBiometricHTTPHeadersWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001412E0;
  v7[3] = &unk_10034D908;
  id v8 = a3;
  id v9 = a1;
  id v6 = v8;
  [a1 _handleMessage:v6 connection:a4 withReplyBlock:v7];
}

+ (void)getCachedBiometricAuthenticationContextWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001419A4;
  v7[3] = &unk_10034D908;
  id v8 = a3;
  id v9 = a1;
  id v6 = v8;
  [a1 _handleMessage:v6 connection:a4 withReplyBlock:v7];
}

+ (void)getCachedBiometricHTTPHeadersWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100141DB8;
  v7[3] = &unk_10034D908;
  id v8 = a3;
  id v9 = a1;
  id v6 = v8;
  [a1 _handleMessage:v6 connection:a4 withReplyBlock:v7];
}

+ (void)getConstraintsDictionaryWithMessage:(id)a3 connection:(id)a4
{
}

+ (void)getCurrentACLVersionWithMessage:(id)a3 connection:(id)a4
{
}

+ (void)getIdentityMapCountWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100142498;
  v4[3] = &unk_10034F968;
  v4[4] = a1;
  [a1 _handleMessage:a3 connection:a4 withReplyBlock:v4];
}

+ (void)getKeyCountWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100142608;
  v7[3] = &unk_10034D908;
  id v8 = a3;
  id v9 = a1;
  id v6 = v8;
  [a1 _handleMessage:v6 connection:a4 withReplyBlock:v7];
}

+ (void)getStateWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001428AC;
  v4[3] = &unk_10034F968;
  v4[4] = a1;
  [a1 _handleMessage:a3 connection:a4 withReplyBlock:v4];
}

+ (void)isIdentityMapValidWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100142D1C;
  v7[3] = &unk_10034D908;
  id v8 = a3;
  id v9 = a1;
  id v6 = v8;
  [a1 _handleMessage:v6 connection:a4 withReplyBlock:v7];
}

+ (void)resetAccountWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100142EB8;
  v9[3] = &unk_10034D930;
  id v11 = a4;
  id v12 = a1;
  id v10 = v6;
  id v7 = v11;
  id v8 = v6;
  [a1 _handleMessage:v8 connection:v7 withReplyBlock:v9];
}

+ (void)resetWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100143028;
  v7[3] = &unk_10034D908;
  id v8 = a4;
  id v9 = a1;
  id v6 = v8;
  [a1 _handleMessage:a3 connection:v6 withReplyBlock:v7];
}

+ (void)saveIdentityMapWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001431B0;
  v7[3] = &unk_10034D908;
  id v8 = a3;
  id v9 = a1;
  id v6 = v8;
  [a1 _handleMessage:v6 connection:a4 withReplyBlock:v7];
}

+ (void)setAllowedWithMessage:(id)a3 connection:(id)a4
{
}

+ (void)setEnabledWithMessage:(id)a3 connection:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100143420;
  v8[3] = &unk_10034D930;
  id v10 = a3;
  id v11 = a1;
  id v9 = a4;
  id v6 = v10;
  id v7 = v9;
  [a1 _handleMessage:v6 connection:v7 withReplyBlock:v8];
}

+ (void)tokenUpdateDidFinishWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, a1);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100143A58;
  v9[3] = &unk_10034F9D8;
  objc_copyWeak(&v11, &location);
  id v8 = v6;
  id v10 = v8;
  [a1 _handleMessage:v8 connection:v7 withReplyBlock:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

+ (void)tokenUpdateShouldStartWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, a1);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100143C14;
  v9[3] = &unk_10034F9D8;
  objc_copyWeak(&v11, &location);
  id v8 = v6;
  id v10 = v8;
  [a1 _handleMessage:v8 connection:v7 withReplyBlock:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

+ (void)tokenUpdateStateWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, a1);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100143DD8;
  v8[3] = &unk_10034FA00;
  objc_copyWeak(&v9, &location);
  [a1 _handleMessage:v6 connection:v7 withReplyBlock:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

+ (void)_handleMessage:(id)a3 connection:(id)a4 withReplyBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100143F74;
  v16[3] = &unk_10034D958;
  id v17 = v9;
  id v18 = v8;
  id v19 = v10;
  id v20 = a1;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  dispatch_async(v12, v16);
}

- (id)_bootDate
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v2 systemUptime];
  double v4 = v3;

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dateByAddingTimeInterval:-v4]);

  return v6;
}

- (void)_deleteKeychainTokensForAccountIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[DaemonBiometricKeychain sharedInstance](&OBJC_CLASS___DaemonBiometricKeychain, "sharedInstance"));
  id v15 = 0LL;
  unsigned __int8 v6 = objc_msgSend(v5, "deleteKeychainTokensForAccountIdentifier_:error:", v4, &v15);
  id v7 = v15;

  if ((v6 & 1) == 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v8) {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v9 = [v8 shouldLog];
    else {
      LODWORD(v10) = v9;
    }
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v10 = v10;
    }
    else {
      v10 &= 2u;
    }
    if ((_DWORD)v10)
    {
      id v12 = (void *)objc_opt_class(self);
      int v16 = 138543874;
      id v17 = v12;
      __int16 v18 = 2112;
      id v19 = v4;
      __int16 v20 = 2114;
      id v21 = v7;
      id v13 = v12;
      id v14 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "%{public}@: Reset keychain tokens failed while disabling biometric state for DSID: %@, error: %{public}@",  &v16,  32);

      if (!v14)
      {
LABEL_14:

        goto LABEL_15;
      }

      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v14,  4LL));
      free(v14);
      SSFileLog(v8, @"%@");
    }

    goto LABEL_14;
  }

+ (void)_resetAccount:(id)a3 withConnection:(id)a4
{
  id v6 = a3;
  id v7 = (void *)SSXPCConnectionCopyClientIdentifier(a4, 0LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  unsigned int v9 = [v8 shouldLog];
  else {
    LODWORD(v10) = v9;
  }
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v10 = v10;
  }
  else {
    v10 &= 2u;
  }
  if (!(_DWORD)v10) {
    goto LABEL_10;
  }
  int v15 = 138543874;
  id v16 = (id)objc_opt_class(a1);
  __int16 v17 = 2112;
  id v18 = v6;
  __int16 v19 = 2114;
  __int16 v20 = v7;
  id v12 = v16;
  id v13 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "%{public}@: Resetting biometrics for account %@, client = %{public}@",  &v15,  32);

  if (v13)
  {
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v13,  4LL));
    free(v13);
    SSFileLog(v8, @"%@");
LABEL_10:
  }

  id v14 = objc_alloc_init((Class)a1);
  [v14 obliterateBiometricsForAccountIdentifier:v6];
}

+ (id)_dispatchQueueUpdateToken
{
  if (qword_1003A3510 != -1) {
    dispatch_once(&qword_1003A3510, &stru_10034FA20);
  }
  return (id)qword_1003A3518;
}

@end