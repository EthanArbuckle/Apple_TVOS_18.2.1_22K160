@interface LakituAccount
+ (id)personaAwareAccountWithDSID:(id)a3;
- (ACAccount)account;
- (LakituAccount)initWithACAccount:(id)a3;
- (NSString)altDSID;
- (NSString)authToken;
- (NSString)dsid;
- (NSString)escrowURL;
- (NSString)iCloudEnv;
- (void)setAccount:(id)a3;
@end

@implementation LakituAccount

+ (id)personaAwareAccountWithDSID:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!&kAAProtocoliCloudAccountKey)
  {
    uint64_t v6 = CloudServicesLog(v4);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "AppleAccount.framework is not available",  buf,  2u);
    }

    id v8 = 0LL;
    goto LABEL_34;
  }

  if (sub_10003E420())
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "aa_primaryAppleAccount"));
    v7 = v10;
    if (v5
      && (v11 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s aa_personID](v10, "aa_personID")),
          unsigned int v12 = [v5 isEqualToString:v11],
          v11,
          !v12))
    {
      uint64_t v28 = CloudServicesLog(v13);
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v45 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "using non-primary DSID: %{private}@",  buf,  0xCu);
      }

      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "aa_appleAccountWithPersonID:", v5));
    }

    else
    {
      v14 = v7;
    }

    v27 = v14;
    if (!v14)
    {
      uint64_t v30 = CloudServicesLog(0LL);
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "unable to determine AppleAccount", buf, 2u);
      }
    }
  }

  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](&OBJC_CLASS___UMUserManager, "sharedManager"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 currentPersona]);

    if ([v16 isDataSeparatedPersona])
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v16 userPersonaUniqueString]);

      if (v9)
      {
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "aa_appleAccounts"));
        id v19 = [v18 countByEnumeratingWithState:&v39 objects:v43 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v40;
LABEL_13:
          uint64_t v22 = 0LL;
          while (1)
          {
            if (*(void *)v40 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v39 + 1) + 8 * v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue([v23 personaIdentifier]);
            unsigned __int8 v25 = [v9 isEqualToString:v24];

            if ((v25 & 1) != 0) {
              break;
            }
            if (v20 == (id)++v22)
            {
              id v20 = [v18 countByEnumeratingWithState:&v39 objects:v43 count:16];
              if (v20) {
                goto LABEL_13;
              }
              goto LABEL_19;
            }
          }

          v7 = v23;

          if (!v7) {
            goto LABEL_21;
          }
          if (v5)
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s aa_personID](v7, "aa_personID"));
            unsigned __int8 v34 = [v5 isEqualToString:v33];

            if ((v34 & 1) == 0)
            {
              uint64_t v36 = CloudServicesLog(v35);
              v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138477827;
                v45 = v5;
                _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "specified DSID %{private}@ does not match current persona",  buf,  0xCu);
              }

              goto LABEL_23;
            }
          }

          goto LABEL_32;
        }

- (LakituAccount)initWithACAccount:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (&kAAProtocoliCloudAccountKey)
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___LakituAccount;
    v9 = -[LakituAccount init](&v12, "init");
    v10 = v9;
    if (v9) {
      -[LakituAccount setAccount:](v9, "setAccount:", v5);
    }
    self = v10;
    id v8 = self;
  }

  else
  {
    uint64_t v6 = CloudServicesLog(v4);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "AppleAccount.framework is not available",  buf,  2u);
    }

    id v8 = 0LL;
  }

  return v8;
}

- (NSString)dsid
{
  v3 = objc_autoreleasePoolPush();
  uint64_t v4 = CloudServicesLog(v3);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "getting dsid", (uint8_t *)&v13, 2u);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[LakituAccount account](self, "account"));
  id v7 = objc_msgSend(v6, "aa_isPrimaryEmailVerified");
  if ((_DWORD)v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aa_personID"));
    uint64_t v9 = CloudServicesLog(v8);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "got dsid: %@", (uint8_t *)&v13, 0xCu);
    }
  }

  else
  {
    uint64_t v11 = CloudServicesLog(v7);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100048350();
    }
    id v8 = 0LL;
  }

  objc_autoreleasePoolPop(v3);
  return (NSString *)v8;
}

- (NSString)altDSID
{
  v3 = objc_autoreleasePoolPush();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[LakituAccount account](self, "account"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aa_altDSID"));

  objc_autoreleasePoolPop(v3);
  return (NSString *)v5;
}

- (NSString)authToken
{
  v3 = objc_autoreleasePoolPush();
  uint64_t v4 = CloudServicesLog(v3);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "getting auth token", buf, 2u);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[LakituAccount account](self, "account"));
  id v7 = objc_msgSend(v6, "aa_isPrimaryEmailVerified");
  if ((_DWORD)v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
    id v18 = 0LL;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 credentialForAccount:v6 error:&v18]);
    v10 = (os_log_s *)v18;
    uint64_t v11 = v10;
    if (v9)
    {
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v9 token]);
      uint64_t v13 = CloudServicesLog(v12);
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "got auth token", buf, 2u);
      }
    }

    else
    {
      uint64_t v16 = CloudServicesLog(v10);
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v11;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Error accessing auth token: %@", buf, 0xCu);
      }

      objc_super v12 = 0LL;
    }
  }

  else
  {
    uint64_t v15 = CloudServicesLog(v7);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100048350();
    }
    objc_super v12 = 0LL;
  }

  objc_autoreleasePoolPop(v3);
  return (NSString *)v12;
}

- (NSString)escrowURL
{
  v3 = objc_autoreleasePoolPush();
  uint64_t v4 = CloudServicesLog(v3);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "getting escrowURL", buf, 2u);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[LakituAccount account](self, "account"));
  id v7 = objc_msgSend(v6, "aa_isPrimaryEmailVerified");
  if ((_DWORD)v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 propertiesForDataclass:kAccountDataclassKeychainSync]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"escrowProxyUrl"]);

    uint64_t v11 = CloudServicesLog(v10);
    objc_super v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "got escrowURL", v15, 2u);
    }
  }

  else
  {
    uint64_t v13 = CloudServicesLog(v7);
    objc_super v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100048350();
    }
    uint64_t v9 = 0LL;
  }

  objc_autoreleasePoolPop(v3);
  return (NSString *)v9;
}

- (NSString)iCloudEnv
{
  v3 = objc_autoreleasePoolPush();
  uint64_t v4 = CloudServicesLog(v3);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "getting iCloud env", buf, 2u);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[LakituAccount account](self, "account"));
  id v7 = objc_msgSend(v6, "aa_isPrimaryEmailVerified");
  if ((_DWORD)v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 dataclassProperties]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kAAProtocoliCloudAccountKey]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"iCloudEnv"]);

    uint64_t v12 = CloudServicesLog(v11);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "got iCloud env", v16, 2u);
    }
  }

  else
  {
    uint64_t v14 = CloudServicesLog(v7);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100048350();
    }
    uint64_t v10 = 0LL;
  }

  objc_autoreleasePoolPop(v3);
  return (NSString *)v10;
}

- (ACAccount)account
{
  return (ACAccount *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end