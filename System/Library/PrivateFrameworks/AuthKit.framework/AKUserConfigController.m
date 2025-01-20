@interface AKUserConfigController
+ (id)sharedController;
- (AKUserConfigController)init;
- (id)_decodeConfigurationInfo:(id)a3;
- (id)_requestProvider:(id)a3 client:(id)a4 dataCenter:(id)a5 urlBagKey:(id)a6;
- (id)_userConfigChangeNotificationDictionaryForAccount:(id)a3 configurationInfo:(id)a4;
- (void)fetchUserConfigForAltDSID:(id)a3 client:(id)a4 dataCenter:(id)a5 forIdentifiers:(id)a6 completion:(id)a7;
- (void)processPushMessage:(id)a3;
- (void)setUserConfigForAltDSID:(id)a3 client:(id)a4 configurationInfo:(id)a5 forIdentifier:(id)a6 completion:(id)a7;
- (void)updateUserConfigForAccount:(id)a3 configurationInfo:(id)a4;
- (void)updateUserConfigForAltDSID:(id)a3 configurationInfo:(id)a4;
@end

@implementation AKUserConfigController

+ (id)sharedController
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006B398;
  block[3] = &unk_1001C8DA0;
  block[4] = a1;
  if (qword_10020F470 != -1) {
    dispatch_once(&qword_10020F470, block);
  }
  return (id)qword_10020F468;
}

- (AKUserConfigController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AKUserConfigController;
  v2 = -[AKUserConfigController init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    accountManager = v2->_accountManager;
    v2->_accountManager = (AKAccountManager *)v3;
  }

  return v2;
}

- (void)fetchUserConfigForAltDSID:(id)a3 client:(id)a4 dataCenter:(id)a5 forIdentifiers:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void (**)(id, void, void *))a7;
  uint64_t isKindOfClass = (uint64_t)[v15 count];
  if (!isKindOfClass
    || (uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSArray, v18),
        uint64_t isKindOfClass = objc_opt_isKindOfClass(v15, v19),
        (isKindOfClass & 1) == 0)
    || (v20 = (void *)objc_claimAutoreleasedReturnValue([v15 firstObject]),
        uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSString, v21),
        char v23 = objc_opt_isKindOfClass(v20, v22),
        v20,
        (v23 & 1) == 0))
  {
    uint64_t v30 = _AKLogSystem(isKindOfClass);
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_100137DE8((uint64_t)v15, v31);
    }

    uint64_t v32 = -7053LL;
    goto LABEL_9;
  }

  uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSString, v24);
  uint64_t v26 = objc_opt_isKindOfClass(v12, v25);
  if ((v26 & 1) == 0)
  {
    uint64_t v33 = _AKLogSystem(v26);
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_100137E6C();
    }

    uint64_t v32 = -7025LL;
LABEL_9:
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", v32));
    v16[2](v16, 0LL, v27);
    goto LABEL_10;
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue( -[AKUserConfigController _requestProvider:client:dataCenter:urlBagKey:]( self,  "_requestProvider:client:dataCenter:urlBagKey:",  v12,  v13,  v14,  AKURLBagKeyFetchConfigData));
  v38 = @"cdks";
  id v39 = v15;
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));
  [v27 setAuthKitBody:v28];

  v29 = -[AKServiceControllerImpl initWithRequestProvider:]( objc_alloc(&OBJC_CLASS___AKServiceControllerImpl),  "initWithRequestProvider:",  v27);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_10006B6C4;
  v35[3] = &unk_1001C6568;
  v37 = v16;
  v35[4] = self;
  id v36 = v12;
  -[AKServiceControllerImpl executeRequestWithCompletion:](v29, "executeRequestWithCompletion:", v35);

LABEL_10:
}

- (void)setUserConfigForAltDSID:(id)a3 client:(id)a4 configurationInfo:(id)a5 forIdentifier:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void (**)(id, void, void *))a7;
  uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString, v17);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v15, v18);
  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v29 = _AKLogSystem(isKindOfClass);
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_10013801C();
    }

    uint64_t v31 = -7053LL;
    goto LABEL_13;
  }

  uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSString, v20);
  uint64_t v22 = objc_opt_isKindOfClass(v12, v21);
  if ((v22 & 1) == 0)
  {
    uint64_t v32 = _AKLogSystem(v22);
    uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_100137E6C();
    }

    uint64_t v31 = -7025LL;
LABEL_13:
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", v31));
    v16[2](v16, 0LL, v25);
    goto LABEL_21;
  }

  id v42 = 0LL;
  char v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v14,  200LL,  0LL,  &v42));
  id v24 = v42;
  uint64_t v25 = v24;
  if (v24)
  {
    uint64_t v26 = _AKLogSystem(v24);
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_100137FBC();
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ak_errorWithCode:underlyingError:]( &OBJC_CLASS___NSError,  "ak_errorWithCode:underlyingError:",  -7054LL,  v25));
    v16[2](v16, 0LL, v28);
  }

  else
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue([v23 base64EncodedStringWithOptions:0]);
    if (v28)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue( -[AKUserConfigController _requestProvider:client:dataCenter:urlBagKey:]( self,  "_requestProvider:client:dataCenter:urlBagKey:",  v12,  v13,  0LL,  AKURLBagKeyConfigurationInfo));
      id v43 = v15;
      v44 = v28;
      v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL));
      [v34 setAuthKitBody:v35];

      id v36 = -[AKServiceControllerImpl initWithRequestProvider:]( objc_alloc(&OBJC_CLASS___AKServiceControllerImpl),  "initWithRequestProvider:",  v34);
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472LL;
      v39[2] = sub_10006BC78;
      v39[3] = &unk_1001C7F68;
      v41 = v16;
      id v40 = v12;
      -[AKServiceControllerImpl executeRequestWithCompletion:](v36, "executeRequestWithCompletion:", v39);
    }

    else
    {
      uint64_t v37 = _AKLogSystem(0LL);
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_100137F90();
      }

      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7054LL));
      v16[2](v16, 0LL, v34);
    }
  }

LABEL_21:
}

- (void)updateUserConfigForAltDSID:(id)a3 configurationInfo:(id)a4
{
  accountManager = self->_accountManager;
  id v7 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue( -[AKAccountManager authKitAccountWithAltDSID:error:]( accountManager,  "authKitAccountWithAltDSID:error:",  a3,  0LL));
  -[AKUserConfigController updateUserConfigForAccount:configurationInfo:]( self,  "updateUserConfigForAccount:configurationInfo:",  v8,  v7);
}

- (void)updateUserConfigForAccount:(id)a3 configurationInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    uint64_t v21 = _AKLogSystem(v7);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1001380DC();
    }
    id v9 = 0LL;
    goto LABEL_19;
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue( -[AKUserConfigController _userConfigChangeNotificationDictionaryForAccount:configurationInfo:]( self,  "_userConfigChangeNotificationDictionaryForAccount:configurationInfo:",  v6,  v7));
  if ([v9 count])
  {
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v9 = v9;
    id v10 = [v9 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v27;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)i);
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v14]);
          -[AKAccountManager setConfigValue:forKey:forAccount:]( self->_accountManager,  "setConfigValue:forKey:forAccount:",  v15,  v14,  v6);
        }

        id v11 = [v9 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }

      while (v11);

      accountManager = self->_accountManager;
      id v25 = 0LL;
      unsigned int v17 = -[AKAccountManager saveAccount:error:](accountManager, "saveAccount:error:", v6, &v25);
      uint64_t v18 = (os_log_s *)v25;
      uint64_t v19 = _AKLogSystem(v18);
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        LODWORD(v31[0]) = v17;
        WORD2(v31[0]) = 2112;
        *(void *)((char *)v31 + 6) = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Did Configuration info save to account: %{BOOL}d with error: %@",  buf,  0x12u);
      }
    }

    else
    {
      uint64_t v18 = 0LL;
      uint64_t v20 = (os_log_s *)v9;
    }

    uint64_t v23 = _AKLogSystem(v22);
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31[0] = v9;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Updated User Configs %@", buf, 0xCu);
    }

LABEL_19:
  }
}

- (void)processPushMessage:(id)a3
{
  id v4 = a3;
  if ([v4 command] == (id)1400)
  {
    uint64_t v5 = _AKLogSystem(1400LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Handling push in config controller with command AKPushMessageCommandAccountInfoChanged...",  buf,  2u);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"userinfodata"]);

    if (v8)
    {
      uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:AKConfigDataVersion]);
      if (v9)
      {
        id v10 = (void *)v9;
        accountManager = self->_accountManager;
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 altDSID]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager authKitAccountWithAltDSID:error:]( accountManager,  "authKitAccountWithAltDSID:error:",  v12,  0LL));

        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager configDataVersionForAccount:]( self->_accountManager,  "configDataVersionForAccount:",  v13));
        if (!v14 || ([v10 isEqual:v14] & 1) == 0)
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 eventDetails]);
          v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"dataCenter"]);

          unsigned int v17 = (void *)os_transaction_create("com.apple.akd.fetch-configs");
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v4 altDSID]);
          uint64_t v24 = AKAllConfigsKey;
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v24,  1LL));
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472LL;
          v21[2] = nullsub_4;
          v21[3] = &unk_1001C9180;
          id v22 = v17;
          id v20 = v17;
          -[AKUserConfigController fetchUserConfigForAltDSID:client:dataCenter:forIdentifiers:completion:]( self,  "fetchUserConfigForAltDSID:client:dataCenter:forIdentifiers:completion:",  v18,  0LL,  v16,  v19,  v21);
        }
      }
    }
  }
}

- (id)_requestProvider:(id)a3 client:(id)a4 dataCenter:(id)a5 urlBagKey:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationContext);
  -[AKAppleIDAuthenticationContext setAltDSID:](v13, "setAltDSID:", v12);

  uint64_t v14 = -[AKURLRequestProviderImpl initWithContext:urlBagKey:]( objc_alloc(&OBJC_CLASS___AKGrandSlamRequestProvider),  "initWithContext:urlBagKey:",  v13,  v9);
  -[AKURLRequestProviderImpl setClient:](v14, "setClient:", v11);

  -[AKGrandSlamRequestProvider setAuthenticatedRequest:](v14, "setAuthenticatedRequest:", 1LL);
  -[AKURLRequestProviderImpl setDataCenterIdentifier:](v14, "setDataCenterIdentifier:", v10);

  return v14;
}

- (id)_decodeConfigurationInfo:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"cd"]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary, v4);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v3, v5);
  if ((isKindOfClass & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[AKAuthenticationServerResponse decodedConfigurationInfo:]( &OBJC_CLASS___AKAuthenticationServerResponse,  "decodedConfigurationInfo:",  v3));
    uint64_t v8 = _AKLogSystem(v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);
      int v13 = 138412290;
      uint64_t v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Fetch configuration info completed with keys: %@",  (uint8_t *)&v13,  0xCu);
    }
  }

  else
  {
    uint64_t v11 = _AKLogSystem(isKindOfClass);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100138108();
    }
    id v7 = 0LL;
  }

  return v7;
}

- (id)_userConfigChangeNotificationDictionaryForAccount:(id)a3 configurationInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v14, (void)v20));
        uint64_t v16 = objc_claimAutoreleasedReturnValue(-[AKAccountManager configValue:forAccount:](self->_accountManager, "configValue:forAccount:", v14, v6));
        unsigned int v17 = (void *)v16;
      }

      id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v11);
  }

  id v18 = [v8 copy];
  return v18;
}

- (void).cxx_destruct
{
}

@end