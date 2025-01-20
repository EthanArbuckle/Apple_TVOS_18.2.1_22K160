@interface AKPrivateEmailDaemonService
- (AKClient)client;
- (AKPrivateEmailDaemonService)init;
- (AKPrivateEmailDaemonService)initWithClient:(id)a3;
- (BOOL)_verifyEntitlements;
- (void)_cacheFetchedPrivateEmail:(id)a3 keyAlreadyHashed:(BOOL)a4 error:(id)a5 completion:(id)a6;
- (void)_performFetchSiwAHmeRequestWithContext:(id)a3 completion:(id)a4;
- (void)_performRegisterRequestWithContext:(id)a3 completion:(id)a4;
- (void)_performRequestForContext:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)deletePrivateEmailDatabaseWithCompletion:(id)a3;
- (void)fetchPrivateEmailForAltDSID:(id)a3 withKey:(id)a4 completion:(id)a5;
- (void)fetchPrivateEmailWithContext:(id)a3 completion:(id)a4;
- (void)fetchSignInWithApplePrivateEmailWithContext:(id)a3 completion:(id)a4;
- (void)getContextForRequestContext:(id)a3 completion:(id)a4;
- (void)listAllPrivateEmailsForAltDSID:(id)a3 completion:(id)a4;
- (void)lookupPrivateEmailForAltDSID:(id)a3 withKey:(id)a4 completion:(id)a5;
- (void)lookupPrivateEmailWithContext:(id)a3 completion:(id)a4;
- (void)presentPrivateEmailUIForContext:(id)a3 completion:(id)a4;
- (void)privateEmailListVersionWithCompletion:(id)a3;
- (void)registerPrivateEmailForAltDSID:(id)a3 withKey:(id)a4 completion:(id)a5;
- (void)registerPrivateEmailWithContext:(id)a3 completion:(id)a4;
- (void)removePrivateEmailKey:(id)a3 completion:(id)a4;
- (void)removePrivateEmailWithContext:(id)a3 completion:(id)a4;
@end

@implementation AKPrivateEmailDaemonService

- (AKPrivateEmailDaemonService)init
{
  return 0LL;
}

- (AKPrivateEmailDaemonService)initWithClient:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___AKPrivateEmailDaemonService;
  v6 = -[AKPrivateEmailDaemonService init](&v13, "init");
  v8 = v6;
  if (v6)
  {
    uint64_t v9 = _AKLogHme(v6, v7);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleID]);
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Private email service initialized with client id %@",  buf,  0xCu);
    }

    objc_storeStrong((id *)&v8->_client, a3);
  }

  return v8;
}

- (void)dealloc
{
  uint64_t v3 = _AKLogHme(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Private email service deallocated", buf, 2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AKPrivateEmailDaemonService;
  -[AKPrivateEmailDaemonService dealloc](&v5, "dealloc");
}

- (void)lookupPrivateEmailForAltDSID:(id)a3 withKey:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[AKPrivateEmailContext alloc] initWithKey:v9 altDSID:v10];

  -[AKPrivateEmailDaemonService lookupPrivateEmailWithContext:completion:]( self,  "lookupPrivateEmailWithContext:completion:",  v11,  v8);
}

- (void)lookupPrivateEmailWithContext:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void *, id))a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 altDSID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 authKitAccountWithAltDSID:v8 error:0]);

  if (v9)
  {
    [v5 sanitiseInternalState];
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[AKPrivateEmailStoreManager sharedInstance]( &OBJC_CLASS___AKPrivateEmailStoreManager,  "sharedInstance"));
    id v24 = 0LL;
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v12 emailForContext:v5 error:&v24]);
    id v14 = v24;
    uint64_t v16 = _AKLogHme(v14, v15);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue([v5 key]);
        v20 = (void *)objc_claimAutoreleasedReturnValue([v5 clientAppBundleId]);
        *(_DWORD *)buf = 138412802;
        v26 = v19;
        __int16 v27 = 2112;
        v28 = v13;
        __int16 v29 = 2112;
        v30 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Email found for %@: %@ [bundle:%@]",  buf,  0x20u);
LABEL_10:
      }
    }

    else if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue([v5 altDSID]);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v5 key]);
      v23 = (void *)objc_claimAutoreleasedReturnValue([v5 clientAppBundleId]);
      *(_DWORD *)buf = 138412802;
      v26 = v19;
      __int16 v27 = 2112;
      v28 = v20;
      __int16 v29 = 2112;
      v30 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "No match found with given altDSID: %@ for key %@ [bundle:%@]",  buf,  0x20u);

      goto LABEL_10;
    }

    goto LABEL_12;
  }

  uint64_t v21 = _AKLogHme(v10, v11);
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_100135AF4(v5, v22);
  }

  id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7025LL));
  objc_super v13 = 0LL;
LABEL_12:
  v6[2](v6, v13, v14);
}

- (void)fetchPrivateEmailForAltDSID:(id)a3 withKey:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[AKPrivateEmailContext alloc] initWithKey:v9 altDSID:v10];

  -[AKPrivateEmailDaemonService fetchPrivateEmailWithContext:completion:]( self,  "fetchPrivateEmailWithContext:completion:",  v11,  v8);
}

- (void)fetchPrivateEmailWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = -[AKPrivateEmailDaemonService _verifyEntitlements](self, "_verifyEntitlements");
  if (v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSID]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v10 authKitAccountWithAltDSID:v11 error:0]);

    if (v12)
    {
      [v6 sanitiseInternalState];
      id v41 = 0LL;
      unsigned __int8 v15 = +[AKPrivateEmailValidator canPerformRequestWithAccount:error:]( &OBJC_CLASS___AKPrivateEmailValidator,  "canPerformRequestWithAccount:error:",  v12,  &v41);
      id v16 = v41;
      id v18 = v16;
      if ((v15 & 1) != 0)
      {
        uint64_t v19 = _AKLogHme(v16, v17);
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v43 = v6;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[ios] requesting for %@", buf, 0xCu);
        }

        -[AKPrivateEmailDaemonService _performRequestForContext:completion:]( self,  "_performRequestForContext:completion:",  v6,  v7);
      }

      else
      {
        v45[0] = NSLocalizedDescriptionKey;
        v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
        v36 = (void *)objc_claimAutoreleasedReturnValue( [v37 localizedStringForKey:@"HME_ERROR_ALERT_INSUFFICIENT_SECURITY_LEVEL_TITLE" value:&stru_1001D1450 table:@"Localizable"]);
        v46[0] = v36;
        v45[1] = NSLocalizedFailureReasonErrorKey;
        v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
        v34 = (void *)objc_claimAutoreleasedReturnValue( [v35 localizedStringForKey:@"HME_ERROR_ALERT_INSUFFICIENT_SECURITY_LEVEL_MESSAGE" value:&stru_1001D1450 table:@"Localizable"]);
        v46[1] = v34;
        v45[2] = NSLocalizedRecoveryOptionsErrorKey;
        v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
        v26 = (void *)objc_claimAutoreleasedReturnValue( [v25 localizedStringForKey:@"HME_ERROR_ALERT_BUTTON_CONTINUE" value:&stru_1001D1450 table:@"Localizable"]);
        v44[0] = v26;
        __int16 v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
        v28 = (void *)objc_claimAutoreleasedReturnValue( [v27 localizedStringForKey:@"HME_ERROR_ALERT_BUTTON_CLOSE" value:&stru_1001D1450 table:@"Localizable"]);
        v44[1] = v28;
        __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v44, 2LL));
        v46[2] = v29;
        v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v46,  v45,  3LL));

        v31 = (void *)objc_claimAutoreleasedReturnValue([v18 domain]);
        v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  v31,  [v18 code],  v30));

        v33 = (void *)objc_claimAutoreleasedReturnValue(+[AKAlertHandler sharedInstance](&OBJC_CLASS___AKAlertHandler, "sharedInstance"));
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472LL;
        v38[2] = sub_100058E88;
        v38[3] = &unk_1001C6B38;
        id v40 = v7;
        id v18 = v18;
        id v39 = v18;
        [v33 showAlertForError:v32 withCompletion:v38];
      }
    }

    else
    {
      uint64_t v23 = _AKLogHme(v13, v14);
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_100135B74(v6, v24);
      }

      id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7025LL));
      (*((void (**)(id, void, id))v7 + 2))(v7, 0LL, v18);
    }
  }

  else
  {
    uint64_t v21 = _AKLogHme(v8, v9);
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100135BF4(v6, v22);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7026LL));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v12);
  }
}

- (void)registerPrivateEmailForAltDSID:(id)a3 withKey:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc(&OBJC_CLASS___AKPrivateEmailContext);
  id v12 = [v11 initWithKey:v9 altDSID:v10 originType:AKPrivateEmailOriginTypeMailApp originIdentifier:0];

  -[AKPrivateEmailDaemonService registerPrivateEmailWithContext:completion:]( self,  "registerPrivateEmailWithContext:completion:",  v12,  v8);
}

- (void)registerPrivateEmailWithContext:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7027LL));
  (*((void (**)(id, void, id))a4 + 2))(v5, 0LL, v6);
}

- (void)getContextForRequestContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  BOOL v8 = -[AKPrivateEmailDaemonService _verifyEntitlements](self, "_verifyEntitlements");
  if (!v8)
  {
    uint64_t v20 = _AKLogHme(v8, v9);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100135D94();
    }

    uint64_t v22 = -7026LL;
    goto LABEL_15;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSID]);

  if (!v10)
  {
    uint64_t v23 = _AKLogHme(v11, v12);
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100135C74();
    }

    uint64_t v22 = -7025LL;
    goto LABEL_15;
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSID]);
  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v13 authKitAccountWithAltDSID:v14 error:0]);

  if (!v15)
  {
    uint64_t v25 = _AKLogHme(v16, v17);
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_100135CD4();
    }

    uint64_t v22 = -7044LL;
LABEL_15:
    id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", v22));
    v7[2](v7, 0LL, v19);
    goto LABEL_16;
  }

  [v6 sanitiseInternalState];
  id v19 = [[AKPrivateEmailContext alloc] initWithContext:v6 client:self->_client];
  if (v19)
  {
    ((void (**)(id, id, id))v7)[2](v7, v19, 0LL);
  }

  else
  {
    uint64_t v27 = _AKLogHme(0LL, v18);
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_100135D34();
    }

    __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7011LL));
    v7[2](v7, 0LL, v29);
  }

- (void)listAllPrivateEmailsForAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, id))a4;
  BOOL v8 = -[AKPrivateEmailDaemonService _verifyEntitlements](self, "_verifyEntitlements");
  if (v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 authKitAccountWithAltDSID:v6 error:0]);

    if (v11)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[AKPrivateEmailStoreManager sharedInstance]( &OBJC_CLASS___AKPrivateEmailStoreManager,  "sharedInstance"));
      id v25 = 0LL;
      uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 fetchAllPrivateEmailsWithError:&v25]);
      id v16 = v25;
      uint64_t v18 = _AKLogHme(v16, v17);
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      uint64_t v20 = v19;
      if (v16)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_100135E54();
        }
      }

      else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v27 = v15;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Private Emails found: %@", buf, 0xCu);
      }
    }

    else
    {
      uint64_t v23 = _AKLogHme(v12, v13);
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_100135DF4();
      }

      id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7055LL));
      uint64_t v15 = 0LL;
    }

    v7[2](v7, v15, v16);

    id v7 = (void (**)(id, uint64_t, id))v15;
  }

  else
  {
    uint64_t v21 = _AKLogHme(v8, v9);
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100135EB4();
    }

    id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7026LL));
    v7[2](v7, 0LL, v16);
  }
}

- (void)presentPrivateEmailUIForContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = _AKLogSystem(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100135F14(v9);
  }

  client = self->_client;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000594E4;
  v13[3] = &unk_1001C8648;
  id v14 = v6;
  id v11 = v6;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient proxyWithErrorHandler:](client, "proxyWithErrorHandler:", v13));
  [v12 presentPrivateEmailUIForContext:v7 completion:v11];
}

- (void)deletePrivateEmailDatabaseWithCompletion:(id)a3
{
  v4 = a3;
  if (!-[AKClient hasInternalAccess](self->_client, "hasInternalAccess"))
  {
    BOOL v5 = -[AKClient hasOwnerAccess](self->_client, "hasOwnerAccess");
    if (!v5)
    {
      uint64_t v13 = _AKLogHme(v5, v6);
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100133188();
      }

      id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7026LL));
      uint64_t v9 = (void (*)(void *, uint64_t, id))v4[2];
      goto LABEL_8;
    }
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[AKPrivateEmailStoreManager sharedInstance]( &OBJC_CLASS___AKPrivateEmailStoreManager,  "sharedInstance"));
  id v15 = 0LL;
  [v7 clearDatabase:&v15];
  id v8 = v15;

  uint64_t v9 = (void (*)(void *, uint64_t, id))v4[2];
  if (v8)
  {
LABEL_8:
    id v10 = v4;
    uint64_t v11 = 0LL;
    id v12 = v8;
    goto LABEL_9;
  }

  id v10 = v4;
  uint64_t v11 = 1LL;
  id v12 = 0LL;
LABEL_9:
  v9(v10, v11, v12);
}

- (void)privateEmailListVersionWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  if (-[AKClient hasInternalAccess](self->_client, "hasInternalAccess")
    || (BOOL v5 = -[AKClient hasOwnerAccess](self->_client, "hasOwnerAccess")))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[AKPrivateEmailStoreManager sharedInstance]( &OBJC_CLASS___AKPrivateEmailStoreManager,  "sharedInstance"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentEmailListVersion]);

    v4[2](v4, v8, 0LL);
  }

  else
  {
    uint64_t v9 = _AKLogHme(v5, v6);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100133188();
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7026LL));
    ((void (**)(id, void *, void *))v4)[2](v4, 0LL, v11);
  }
}

- (void)removePrivateEmailKey:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[AKPrivateEmailContext alloc] initWithKey:v7];

  -[AKPrivateEmailDaemonService removePrivateEmailWithContext:completion:]( self,  "removePrivateEmailWithContext:completion:",  v8,  v6);
}

- (void)removePrivateEmailWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  BOOL v8 = -[AKClient hasPrivateAccess](self->_client, "hasPrivateAccess");
  if (!v8)
  {
    BOOL v8 = -[AKClient hasOwnerAccess](self->_client, "hasOwnerAccess");
    if (!v8)
    {
      uint64_t v19 = _AKLogHme(v8, v9);
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1001360B8();
      }

      id v13 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7026LL));
      goto LABEL_15;
    }
  }

  uint64_t v10 = _AKLogHme(v8, v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_10013608C();
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[AKPrivateEmailStoreManager sharedInstance]( &OBJC_CLASS___AKPrivateEmailStoreManager,  "sharedInstance"));
  id v21 = 0LL;
  [v12 removePrivateEmailForContext:v6 error:&v21];
  id v13 = v21;

  uint64_t v16 = _AKLogHme(v14, v15);
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
  if (v13)
  {
    if (v18) {
      sub_10013602C();
    }

LABEL_15:
    v7[2](v7, v13);
    goto LABEL_16;
  }

  if (v18) {
    sub_100136000();
  }

  v7[2](v7, 0LL);
LABEL_16:
}

- (void)fetchSignInWithApplePrivateEmailWithContext:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7027LL));
  (*((void (**)(id, void, id))a4 + 2))(v5, 0LL, v6);
}

- (void)_performRequestForContext:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7027LL));
  (*((void (**)(id, void, id))a4 + 2))(v5, 0LL, v6);
}

- (void)_performRegisterRequestWithContext:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7027LL));
  (*((void (**)(id, void, id))a4 + 2))(v5, 0LL, v6);
}

- (void)_performFetchSiwAHmeRequestWithContext:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7027LL));
  (*((void (**)(id, void, id))a4 + 2))(v5, 0LL, v6);
}

- (void)_cacheFetchedPrivateEmail:(id)a3 keyAlreadyHashed:(BOOL)a4 error:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = (void (**)(id, id, id))a6;
  if (v9)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[AKPrivateEmailStoreManager sharedInstance]( &OBJC_CLASS___AKPrivateEmailStoreManager,  "sharedInstance"));
    id v18 = 0LL;
    [v12 setPrivateEmail:v9 keyAlreadyHashed:v8 error:&v18];
    id v13 = v18;
    uint64_t v15 = v13;
    if (v13)
    {
      uint64_t v16 = _AKLogHme(v13, v14);
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1001360E4();
      }
    }
  }

  v11[2](v11, v9, v10);
}

- (BOOL)_verifyEntitlements
{
  unsigned int v3 = -[AKClient hasOwnerAccess](self->_client, "hasOwnerAccess");
  unsigned int v4 = -[AKClient hasInternalAccess](self->_client, "hasInternalAccess");
  BOOL v5 = -[AKClient hasPrivateAccess](self->_client, "hasPrivateAccess");
  if (v3)
  {
    uint64_t v7 = _AKLogHme(v5, v6);
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Owner detected!", (uint8_t *)&v12, 2u);
    }

- (AKClient)client
{
  return self->_client;
}

- (void).cxx_destruct
{
}

@end