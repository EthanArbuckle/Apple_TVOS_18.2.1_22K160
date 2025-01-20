@interface AKAuthModeController
- ($1A23BB056C565A410801C90FE7234890)_authModeInfoFromResponse:(id)a3;
- ($1A23BB056C565A410801C90FE7234890)_unknownAuthModeInfo;
- (BOOL)_isClientEntitledForAuthMode:(id)a3;
- (id)_authModeErrorFromError:(id)a3;
- (void)_executeFetchAuthModeInfoWithContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)_saveAuthMode:(id)a3 withContext:(id)a4;
- (void)fetchAuthModeWithContext:(id)a3 client:(id)a4 completion:(id)a5;
@end

@implementation AKAuthModeController

- (void)fetchAuthModeWithContext:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[AKAuthModeController _isClientEntitledForAuthMode:](self, "_isClientEntitledForAuthMode:", v9))
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10009F3AC;
    v15[3] = &unk_1001C6568;
    id v17 = v10;
    v15[4] = self;
    id v16 = v8;
    -[AKAuthModeController _executeFetchAuthModeInfoWithContext:client:completion:]( self,  "_executeFetchAuthModeInfoWithContext:client:completion:",  v16,  v9,  v15);
  }

  else
  {
    id v11 = -[AKAuthModeController _unknownAuthModeInfo](self, "_unknownAuthModeInfo");
    uint64_t v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7026LL));
    (*((void (**)(id, id, uint64_t, void *))v10 + 2))(v10, v11, v13, v14);
  }
}

- (BOOL)_isClientEntitledForAuthMode:(id)a3
{
  id v3 = [a3 hasInternalPrivateAccess];
  BOOL v4 = (char)v3;
  if ((v3 & 1) == 0)
  {
    uint64_t v5 = _AKLogSystem(v3);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10013F858(v6);
    }
  }

  return v4;
}

- ($1A23BB056C565A410801C90FE7234890)_unknownAuthModeInfo
{
  unint64_t v2 = 0LL;
  BOOL v3 = 0LL;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)_executeFetchAuthModeInfoWithContext:(id)a3 client:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc(&OBJC_CLASS___AKAuthModeRequestProvider);
  uint64_t v12 = -[AKURLRequestProviderImpl initWithContext:urlBagKey:]( v10,  "initWithContext:urlBagKey:",  v9,  AKURLBagKeyFetchAuthenticationMode);

  -[AKURLRequestProviderImpl setClient:](v12, "setClient:", v8);
  id v11 = -[AKServiceControllerImpl initWithRequestProvider:]( objc_alloc(&OBJC_CLASS___AKServiceControllerImpl),  "initWithRequestProvider:",  v12);
  -[AKServiceControllerImpl executeRequestWithCompletion:](v11, "executeRequestWithCompletion:", v7);
}

- (id)_authModeErrorFromError:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:AKErrorStatusCodeKey]);

  if ([v5 integerValue] == (id)-28043)
  {
    uint64_t v6 = -7093LL;
LABEL_9:
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", v6));
    uint64_t v9 = _AKLogSystem(v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10013F898();
    }

    goto LABEL_12;
  }

  if ([v5 integerValue] == (id)-28044)
  {
    uint64_t v6 = -7094LL;
    goto LABEL_9;
  }

  if ([v5 integerValue] == (id)-310003)
  {
    uint64_t v6 = -7100LL;
    goto LABEL_9;
  }

  id v7 = [v5 integerValue];
  if (v7 == (id)-80039LL)
  {
    uint64_t v6 = -7120LL;
    goto LABEL_9;
  }

  uint64_t v12 = _AKLogSystem(v7);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_10013F8F8();
  }

  id v8 = v3;
LABEL_12:

  return v8;
}

- ($1A23BB056C565A410801C90FE7234890)_authModeInfoFromResponse:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[AAFSerialization dictionaryFromObject:ofType:]( &OBJC_CLASS___AAFSerialization,  "dictionaryFromObject:ofType:",  a3,  @"application/x-plist"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:AKAuthenticationModeKey]);
  id v5 = [v4 unsignedIntegerValue];

  if (+[AKFeatureManager isEnforceMDMPolicyEnabled]( &OBJC_CLASS___AKFeatureManager,  "isEnforceMDMPolicyEnabled"))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:AKMDMInfoRequiredKey]);
    uint64_t v7 = [v6 BOOLValue];
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  unint64_t v8 = (unint64_t)v5;
  BOOL v9 = v7;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- (void)_saveAuthMode:(id)a3 withContext:(id)a4
{
  unint64_t var0 = a3.var0;
  id v17 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "authKitAccount:", &v17, *(void *)&a3.var1));
  id v6 = v17;
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = _AKLogSystem(v6);
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10013F9B8();
    }
  }

  else
  {
    uint64_t v10 = _AKLogSystem(0LL);
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    BOOL v11 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        v19 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Saving auth mode to AuthKit account %@.",  buf,  0xCu);
      }

      BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
      -[os_log_s setAuthenticationMode:forAccount:](v9, "setAuthenticationMode:forAccount:", var0, v5);
      id v16 = 0LL;
      -[os_log_s saveAccount:error:](v9, "saveAccount:error:", v5, &v16);
      id v12 = v16;
      uint64_t v13 = v12;
      if (v12)
      {
        uint64_t v14 = _AKLogSystem(v12);
        v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_10013F958();
        }
      }
    }

    else if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "No AuthKit account found, skipping auth mode save.",  buf,  2u);
    }
  }
}

@end