@interface TransparencyAccount
+ (BOOL)eligibleForOptIn;
+ (BOOL)initiateCredentialRenewal:(id *)a3 completionHandler:(id)a4;
+ (BOOL)isAccountsErrorRetryable:(id)a3;
+ (id)authToken:(id *)a3;
+ (id)cloudKitAccount:(id)a3;
+ (id)createAuthToken:(id)a3 authToken:(id)a4;
+ (id)createAuthkitSession;
+ (id)primaryAccount:(id *)a3;
+ (id)sharedAccountStore;
+ (id)sharedManager;
+ (int64_t)accountLevelErrorCodeForLevel:(id)a3;
+ (unint64_t)accountLevel:(id)a3;
+ (void)startMetrics:(id)a3 idsAccountTracker:(id)a4;
- (ACAccountStore)store;
- (BOOL)eligibleForOptIn:(id)a3;
- (TransparencyAccount)init;
- (double)accountsdRetryTimeout;
- (id)cloudKitAccount:(id)a3;
- (id)fetchAccountsRetryingWithTimeout:(double)a3 error:(id *)a4;
- (id)primaryAccount:(id *)a3;
- (int64_t)ktAccountStatus:(id)a3 idsAccountsTracker:(id)a4 error:(id *)a5;
- (unint64_t)accountLevel:(id)a3;
- (void)setAccountsdRetryTimeout:(double)a3;
- (void)setStore:(id)a3;
@end

@implementation TransparencyAccount

+ (id)createAuthkitSession
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bundleIdentifier]);

  id v4 = [[AKAppleIDSession alloc] initWithIdentifier:v3];
  return v4;
}

- (TransparencyAccount)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TransparencyAccount;
  v2 = -[TransparencyAccount init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___ACAccountStore);
    -[TransparencyAccount setStore:](v2, "setStore:", v3);

    -[TransparencyAccount setAccountsdRetryTimeout:](v2, "setAccountsdRetryTimeout:", 30.0);
    id v4 = v2;
  }

  return v2;
}

- (unint64_t)accountLevel:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  v5 = v4;
  if (v4)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v4 altDSIDForAccount:v3]);
    if (v6)
    {
      id v12 = 0LL;
      v7 = (void *)objc_claimAutoreleasedReturnValue([v5 authKitAccountWithAltDSID:v6 error:&v12]);
      id v8 = v12;
      if (v7)
      {
        id v9 = [v5 securityLevelForAccount:v7];
      }

      else
      {
        if (qword_1002EEEE0 != -1) {
          dispatch_once(&qword_1002EEEE0, &stru_100289A20);
        }
        v10 = (os_log_s *)qword_1002EEEE8;
        if (os_log_type_enabled((os_log_t)qword_1002EEEE8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v14 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "TransparencyAccount authKitAccountWithAltDSID failed: %{public}@",  buf,  0xCu);
        }

        id v9 = 0LL;
      }
    }

    else
    {
      id v9 = 0LL;
    }
  }

  else
  {
    id v9 = 0LL;
  }

  return (unint64_t)v9;
}

+ (BOOL)isAccountsErrorRetryable:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
    else {
      BOOL v6 = 0;
    }
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)fetchAccountsRetryingWithTimeout:(double)a3 error:(id *)a4
{
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dateByAddingTimeInterval:a3]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyAccount store](self, "store"));
  id v25 = 0LL;
  id v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "aa_appleAccountsWithError:", &v25));
  id v11 = v25;

  if (v10)
  {
    int v12 = 0;
LABEL_3:
    if (qword_1002EEEE0 != -1) {
      dispatch_once(&qword_1002EEEE0, &stru_100289A40);
    }
    v13 = (os_log_s *)qword_1002EEEE8;
    if (os_log_type_enabled((os_log_t)qword_1002EEEE8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v27 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "TransparencyAccount found accounts after (%d) attempts",  buf,  8u);
    }

    id v10 = v10;
  }

  else
  {
    v24 = a4;
    int v12 = 0;
    while (1)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      id v16 = [v8 compare:v15];

      if (v16 == (id)-1LL) {
        break;
      }
      if (v12 == 5 || !objc_msgSend((id)objc_opt_class(self, v17), "isAccountsErrorRetryable:", v11))
      {
        v20 = v24;
        if (qword_1002EEEE0 != -1) {
          dispatch_once(&qword_1002EEEE0, &stru_100289AA0);
        }
        v21 = (os_log_s *)qword_1002EEEE8;
        if (os_log_type_enabled((os_log_t)qword_1002EEEE8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v27 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "TransparencyAccount: Can't talk with accountsd: %@",  buf,  0xCu);
        }

        if (v24)
        {
          id v22 = v11;
LABEL_31:
          id *v20 = v22;
          goto LABEL_8;
        }

        goto LABEL_8;
      }

      if (qword_1002EEEE0 != -1) {
        dispatch_once(&qword_1002EEEE0, &stru_100289A80);
      }
      v18 = (os_log_s *)qword_1002EEEE8;
      if (os_log_type_enabled((os_log_t)qword_1002EEEE8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v27 = v12;
        *(_WORD *)&v27[4] = 2112;
        *(void *)&v27[6] = v11;
        __int16 v28 = 2112;
        v29 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "TransparencyAccount retrying accountsd XPC, (%d, %@) timeout: %@",  buf,  0x1Cu);
      }

      ++v12;

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyAccount store](self, "store"));
      id v25 = 0LL;
      id v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "aa_appleAccountsWithError:", &v25));
      id v11 = v25;

      if (v10) {
        goto LABEL_3;
      }
    }

    if (qword_1002EEEE0 != -1) {
      dispatch_once(&qword_1002EEEE0, &stru_100289A60);
    }
    v20 = v24;
    v23 = (os_log_s *)qword_1002EEEE8;
    if (os_log_type_enabled((os_log_t)qword_1002EEEE8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v27 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "TransparencyAccount timed out, retry try: %d",  buf,  8u);
    }

    if (v24)
    {
      id v22 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  kTransparencyErrorAccount,  -394LL,  v11,  @"Account framework timeout"));
      goto LABEL_31;
    }
  }

- (id)primaryAccount:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyAccount store](self, "store"));
  if (v5)
  {
    -[TransparencyAccount accountsdRetryTimeout](self, "accountsdRetryTimeout");
    id v25 = 0LL;
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( -[TransparencyAccount fetchAccountsRetryingWithTimeout:error:]( self,  "fetchAccountsRetryingWithTimeout:error:",  &v25));
    id v7 = v25;
    id v8 = v7;
    if (v6)
    {
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      id v9 = v6;
      id v10 = [v9 countByEnumeratingWithState:&v21 objects:v28 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v22;
        uint64_t v13 = AAAccountClassPrimary;
LABEL_5:
        uint64_t v14 = 0LL;
        while (1)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          v15 = *(void **)(*((void *)&v21 + 1) + 8 * v14);
          if (v11 == (id)++v14)
          {
            id v11 = [v9 countByEnumeratingWithState:&v21 objects:v28 count:16];
            if (v11) {
              goto LABEL_5;
            }
            goto LABEL_11;
          }
        }

        id v17 = v15;

        if (v17) {
          goto LABEL_29;
        }
      }

      else
      {
LABEL_11:
      }

      if (qword_1002EEEE0 != -1) {
        dispatch_once(&qword_1002EEEE0, &stru_100289AE0);
      }
      v18 = (os_log_s *)qword_1002EEEE8;
      if (os_log_type_enabled((os_log_t)qword_1002EEEE8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "No primary AppleAccount found: %@",  buf,  0xCu);
      }

      if (a3)
      {
        id v19 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  kTransparencyErrorAccount,  -117LL,  v8,  @"No primary AppleAccount found"));
LABEL_27:
        id v17 = 0LL;
        *a3 = v19;
LABEL_29:

        goto LABEL_30;
      }
    }

    else if (a3)
    {
      id v19 = v7;
      goto LABEL_27;
    }

    id v17 = 0LL;
    goto LABEL_29;
  }

  if (qword_1002EEEE0 != -1) {
    dispatch_once(&qword_1002EEEE0, &stru_100289AC0);
  }
  id v16 = (os_log_s *)qword_1002EEEE8;
  if (os_log_type_enabled((os_log_t)qword_1002EEEE8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "No ACAccountStore found", buf, 2u);
  }

  id v17 = 0LL;
  if (a3) {
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorAccount,  -116LL,  @"No account store found"));
  }
LABEL_30:

  return v17;
}

- (id)cloudKitAccount:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 childAccountsWithAccountTypeIdentifier:ACAccountTypeIdentifierCloudKit]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);

  return v4;
}

+ (id)sharedManager
{
  if (qword_1002EEEF8 != -1) {
    dispatch_once(&qword_1002EEEF8, &stru_100289B00);
  }
  return (id)qword_1002EEEF0;
}

+ (id)sharedAccountStore
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAccount sharedManager](&OBJC_CLASS___TransparencyAccount, "sharedManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 store]);

  return v3;
}

+ (void)startMetrics:(id)a3 idsAccountTracker:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_1002EEEE0 != -1) {
    dispatch_once(&qword_1002EEEE0, &stru_100289B20);
  }
  id v7 = (os_log_s *)qword_1002EEEE8;
  if (os_log_type_enabled((os_log_t)qword_1002EEEE8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "TransparencyAccount startMetrics", buf, 2u);
  }

  double v8 = SFAnalyticsSamplerIntervalOncePerReport;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001C6F10;
  v10[3] = &unk_100289B68;
  id v11 = v6;
  id v9 = v6;
  [v5 addMultiSamplerForName:@"TransparencyAccountMultiSampler" withTimeInterval:v10 block:v8];
}

+ (int64_t)accountLevelErrorCodeForLevel:(id)a3
{
  id v3 = (char *)[a3 unsignedIntegerValue];
  else {
    return -153LL - (void)v3;
  }
}

+ (id)createAuthToken:(id)a3 authToken:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendString:](v7, "appendString:", v6);

  -[NSMutableString appendString:](v7, "appendString:", @":");
  -[NSMutableString appendString:](v7, "appendString:", v5);

  double v8 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendString:](v8, "appendString:", @"X-MobileMe-AuthToken ");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableString dataUsingEncoding:](v7, "dataUsingEncoding:", 4LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 base64EncodedStringWithOptions:0]);
  -[NSMutableString appendString:](v8, "appendString:", v10);

  return v8;
}

+ (unint64_t)accountLevel:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAccount sharedManager](&OBJC_CLASS___TransparencyAccount, "sharedManager"));
  id v5 = [v4 accountLevel:v3];

  return (unint64_t)v5;
}

+ (BOOL)eligibleForOptIn
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAccount primaryAccount:](&OBJC_CLASS___TransparencyAccount, "primaryAccount:", 0LL));
  if (v2) {
    BOOL v3 = (id)+[TransparencyAccount accountLevel:](&OBJC_CLASS___TransparencyAccount, "accountLevel:", v2) == (id)4;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)eligibleForOptIn:(id)a3
{
  return (id)+[TransparencyAccount accountLevel:](&OBJC_CLASS___TransparencyAccount, "accountLevel:", a3) == (id)4;
}

- (int64_t)ktAccountStatus:(id)a3 idsAccountsTracker:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
LABEL_4:
    unint64_t v12 = -[TransparencyAccount accountLevel:](self, "accountLevel:", v8);
    if (v12 == 4)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "aa_personID"));
      if (v13)
      {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyAccount cloudKitAccount:](self, "cloudKitAccount:", v8));
        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue([v9 messagesStatus]);

          if (v15)
          {
            if ([v9 haveIDSAccount:v13])
            {
              int64_t v16 = 0LL;
            }

            else
            {
              if (qword_1002EEEE0 != -1) {
                dispatch_once(&qword_1002EEEE0, &stru_100289C28);
              }
              __int128 v23 = (os_log_s *)qword_1002EEEE8;
              if (os_log_type_enabled((os_log_t)qword_1002EEEE8, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "TransparencyAccount ids and CK doesn't match",  buf,  2u);
              }

              int64_t v16 = 5LL;
            }
          }

          else
          {
            if (qword_1002EEEE0 != -1) {
              dispatch_once(&qword_1002EEEE0, &stru_100289C08);
            }
            __int128 v22 = (os_log_s *)qword_1002EEEE8;
            if (os_log_type_enabled((os_log_t)qword_1002EEEE8, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "TransparencyAccount no IDS account",  buf,  2u);
            }

            int64_t v16 = 4LL;
          }
        }

        else
        {
          if (qword_1002EEEE0 != -1) {
            dispatch_once(&qword_1002EEEE0, &stru_100289BE8);
          }
          __int128 v21 = (os_log_s *)qword_1002EEEE8;
          if (os_log_type_enabled((os_log_t)qword_1002EEEE8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v27 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "TransparencyAccount no cloudkit account: %@",  buf,  0xCu);
          }

          int64_t v16 = 3LL;
        }
      }

      else
      {
        if (qword_1002EEEE0 != -1) {
          dispatch_once(&qword_1002EEEE0, &stru_100289BC8);
        }
        id v19 = (os_log_s *)qword_1002EEEE8;
        if (os_log_type_enabled((os_log_t)qword_1002EEEE8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v27 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "TransparencyAccount no account dsid: %@",  buf,  0xCu);
        }

        int64_t v16 = 2LL;
      }
    }

    else
    {
      int v17 = v12;
      if (qword_1002EEEE0 != -1) {
        dispatch_once(&qword_1002EEEE0, &stru_100289BA8);
      }
      v18 = (os_log_s *)qword_1002EEEE8;
      if (os_log_type_enabled((os_log_t)qword_1002EEEE8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v27) = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "TransparencyAccount level not HSA2: %d",  buf,  8u);
      }

      int64_t v16 = 2LL;
    }

    goto LABEL_44;
  }

  id v25 = 0LL;
  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[TransparencyAccount primaryAccount:](self, "primaryAccount:", &v25));
  id v11 = v25;
  id v8 = v11;
  if (v10)
  {

    id v8 = (id)v10;
    goto LABEL_4;
  }

  if (qword_1002EEEE0 != -1) {
    dispatch_once(&qword_1002EEEE0, &stru_100289B88);
  }
  v20 = (os_log_s *)qword_1002EEEE8;
  if (os_log_type_enabled((os_log_t)qword_1002EEEE8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "TransparencyAccount no default: %@", buf, 0xCu);
  }

  if (a5)
  {
    id v8 = v8;
    *a5 = v8;
  }

  int64_t v16 = 1LL;
LABEL_44:

  return v16;
}

+ (id)primaryAccount:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedManager]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 primaryAccount:a3]);

  return v5;
}

+ (id)cloudKitAccount:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedManager]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 cloudKitAccount:v4]);

  return v6;
}

+ (id)authToken:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAccount primaryAccount:](&OBJC_CLASS___TransparencyAccount, "primaryAccount:"));
  id v5 = v4;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 credential]);
    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_personID"));
      if (v7)
      {
        unint64_t v8 = +[TransparencyAccount accountLevel:](&OBJC_CLASS___TransparencyAccount, "accountLevel:", v5);
        if (qword_1002EEEE0 != -1) {
          dispatch_once(&qword_1002EEEE0, &stru_100289C88);
        }
        id v9 = (void *)qword_1002EEEE8;
        if (os_log_type_enabled((os_log_t)qword_1002EEEE8, OS_LOG_TYPE_INFO))
        {
          uint64_t v10 = v9;
          id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v8));
          *(_DWORD *)buf = 138412290;
          v35 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Obtaining credential from account of security level %@",  buf,  0xCu);
        }

        unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 credentialItemForKey:ACKeyTransparencyTokenKey]);
        if (v12)
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAccount createAuthToken:authToken:]( &OBJC_CLASS___TransparencyAccount,  "createAuthToken:authToken:",  v7,  v12));
          if (qword_1002EEEE0 != -1) {
            dispatch_once(&qword_1002EEEE0, &stru_100289CC8);
          }
          uint64_t v14 = (os_log_s *)qword_1002EEEE8;
          if (os_log_type_enabled((os_log_t)qword_1002EEEE8, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v13;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Authorization token: %@", buf, 0xCu);
          }
        }

        else
        {
          if (qword_1002EEEE0 != -1) {
            dispatch_once(&qword_1002EEEE0, &stru_100289CA8);
          }
          __int128 v24 = (void *)qword_1002EEEE8;
          if (os_log_type_enabled((os_log_t)qword_1002EEEE8, OS_LOG_TYPE_ERROR))
          {
            id v25 = v24;
            v26 = (void *)objc_claimAutoreleasedReturnValue([v5 username]);
            id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v8));
            *(_DWORD *)buf = 138412802;
            v35 = v26;
            __int16 v36 = 2112;
            v37 = v27;
            __int16 v38 = 2112;
            v39 = v7;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "Account %@ of level %@ does not have KeyTransparencyToken(%@)",  buf,  0x20u);
          }

          if (a3)
          {
            uint64_t v33 = kTransparencyErrorAccount;
            __int16 v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v8));
            int64_t v29 = +[TransparencyAccount accountLevelErrorCodeForLevel:]( &OBJC_CLASS___TransparencyAccount,  "accountLevelErrorCodeForLevel:",  v28);
            v30 = (void *)objc_claimAutoreleasedReturnValue([v5 username]);
            v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v8));
            *a3 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  v33,  v29,  @"Account %@ of level %@ does not have KeyTransparencyToken(%@)",  v30,  v31,  v7));
          }

          uint64_t v13 = 0LL;
        }
      }

      else
      {
        if (qword_1002EEEE0 != -1) {
          dispatch_once(&qword_1002EEEE0, &stru_100289C68);
        }
        v20 = (void *)qword_1002EEEE8;
        if (os_log_type_enabled((os_log_t)qword_1002EEEE8, OS_LOG_TYPE_ERROR))
        {
          __int128 v21 = v20;
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v5 username]);
          *(_DWORD *)buf = 138412546;
          v35 = v22;
          __int16 v36 = 2112;
          v37 = 0LL;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Account %@ does not have personId(%@)",  buf,  0x16u);
        }

        if (!a3)
        {
          uint64_t v13 = 0LL;
          goto LABEL_34;
        }

        uint64_t v23 = kTransparencyErrorAccount;
        unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 username]);
        uint64_t v13 = 0LL;
        *a3 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  v23,  -152LL,  @"Account %@ does not have personId(%@)",  v12,  0LL));
      }
    }

    else
    {
      if (qword_1002EEEE0 != -1) {
        dispatch_once(&qword_1002EEEE0, &stru_100289C48);
      }
      v15 = (void *)qword_1002EEEE8;
      if (os_log_type_enabled((os_log_t)qword_1002EEEE8, OS_LOG_TYPE_ERROR))
      {
        int64_t v16 = v15;
        int v17 = (void *)objc_claimAutoreleasedReturnValue([v5 username]);
        *(_DWORD *)buf = 138412290;
        v35 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Account %@ missing credentials", buf, 0xCu);
      }

      if (!a3)
      {
        uint64_t v13 = 0LL;
        goto LABEL_35;
      }

      uint64_t v18 = kTransparencyErrorAccount;
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 username]);
      id v19 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  v18,  -118LL,  @"Account %@ missing credentials",  v7));
      uint64_t v13 = 0LL;
      *a3 = v19;
    }

+ (BOOL)initiateCredentialRenewal:(id *)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAccount primaryAccount:](&OBJC_CLASS___TransparencyAccount, "primaryAccount:", a3));
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAccount sharedAccountStore](&OBJC_CLASS___TransparencyAccount, "sharedAccountStore"));
    v14[0] = kACRenewCredentialsShouldAvoidUIKey;
    v14[1] = kACRenewCredentialsShouldForceKey;
    v15[0] = &__kCFBooleanTrue;
    v15[1] = &__kCFBooleanFalse;
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1001C8268;
    v11[3] = &unk_10027A6F8;
    id v12 = v5;
    [v7 renewCredentialsForAccount:v6 options:v8 completion:v11];
  }

  else
  {
    if (qword_1002EEEE0 != -1) {
      dispatch_once(&qword_1002EEEE0, &stru_100289CE8);
    }
    id v9 = (os_log_s *)qword_1002EEEE8;
    if (os_log_type_enabled((os_log_t)qword_1002EEEE8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Unable to renew credentials -- no primary account",  buf,  2u);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorAccount,  -117LL,  @"Account credential renewal failed -- no account"));
    (*((void (**)(id, void *))v5 + 2))(v5, v7);
  }

  return v6 != 0LL;
}

- (ACAccountStore)store
{
  return (ACAccountStore *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setStore:(id)a3
{
}

- (double)accountsdRetryTimeout
{
  return self->_accountsdRetryTimeout;
}

- (void)setAccountsdRetryTimeout:(double)a3
{
  self->_accountsdRetryTimeout = a3;
}

- (void).cxx_destruct
{
}

@end