@interface AKTokenManager
+ (AKTokenManager)sharedInstance;
- (AAFKeychainManager)keychainManager;
- (AKTokenCache)tokenCache;
- (AKTokenKeychain)tokenKeychain;
- (AKTokenManager)init;
- (BOOL)_deleteTokenWithIdentifer:(id)a3 altDSID:(id)a4 account:(id)a5 credential:(id)a6 error:(id *)a7;
- (BOOL)deleteTokenFromCacheWithIdentifer:(id)a3 altDSID:(id)a4 error:(id *)a5;
- (BOOL)synchronizeTokensForAllAccounts:(id *)a3;
- (BOOL)synchronizeTokensForAltDSID:(id)a3 account:(id)a4 error:(id *)a5;
- (BOOL)updateToken:(id)a3 identifier:(id)a4 altDSID:(id)a5 account:(id)a6 credential:(id)a7 error:(id *)a8;
- (OS_dispatch_queue)tokenManagerQueue;
- (id)synchronizedCredentialForAccount:(id)a3;
- (id)tokenWithIdentifier:(id)a3 altDSID:(id)a4 forAccount:(id)a5 error:(id *)a6;
- (id)tokenWithIdentifier:(id)a3 altDSID:(id)a4 forAccount:(id)a5 shouldSync:(BOOL)a6 error:(id *)a7;
- (void)setKeychainManager:(id)a3;
- (void)setTokenCache:(id)a3;
- (void)setTokenKeychain:(id)a3;
- (void)setTokenManagerQueue:(id)a3;
@end

@implementation AKTokenManager

+ (AKTokenManager)sharedInstance
{
  if (qword_10020F518 != -1) {
    dispatch_once(&qword_10020F518, &stru_1001C9CD8);
  }
  return (AKTokenManager *)(id)qword_10020F510;
}

- (AKTokenManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___AKTokenManager;
  v2 = -[AKTokenManager init](&v14, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.authkit.AKTokenManagerQueue", v4);
    tokenManagerQueue = v2->_tokenManagerQueue;
    v2->_tokenManagerQueue = (OS_dispatch_queue *)v5;

    v7 = objc_opt_new(&OBJC_CLASS___AAFKeychainManager);
    keychainManager = v2->_keychainManager;
    v2->_keychainManager = v7;

    v9 = objc_opt_new(&OBJC_CLASS___AKTokenCache);
    tokenCache = v2->_tokenCache;
    v2->_tokenCache = v9;

    v11 = objc_opt_new(&OBJC_CLASS___AKTokenKeychain);
    tokenKeychain = v2->_tokenKeychain;
    v2->_tokenKeychain = v11;
  }

  return v2;
}

- (BOOL)updateToken:(id)a3 identifier:(id)a4 altDSID:(id)a5 account:(id)a6 credential:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  uint64_t v19 = _AKLogSystem(v18);
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_10013B3D0();
  }

  if (v15 && v16)
  {
    if (v14)
    {
      tokenManagerQueue = (dispatch_queue_s *)self->_tokenManagerQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100085138;
      block[3] = &unk_1001C9D00;
      id v30 = v15;
      id v31 = v16;
      id v32 = v14;
      v33 = self;
      v36 = a8;
      id v34 = v17;
      id v35 = v18;
      dispatch_sync(tokenManagerQueue, block);
      unsigned __int8 v23 = a8 == 0LL;
    }

    else
    {
      uint64_t v26 = _AKLogSystem(v21);
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        sub_10013B3A4();
      }

      unsigned __int8 v23 = -[AKTokenManager _deleteTokenWithIdentifer:altDSID:account:credential:error:]( self,  "_deleteTokenWithIdentifer:altDSID:account:credential:error:",  v15,  v16,  v17,  v18,  a8);
    }
  }

  else
  {
    uint64_t v24 = _AKLogSystem(v21);
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      sub_10013B378();
    }

    unsigned __int8 v23 = 0;
  }

  return v23;
}

- (BOOL)deleteTokenFromCacheWithIdentifer:(id)a3 altDSID:(id)a4 error:(id *)a5
{
  return -[AKTokenManager _deleteTokenWithIdentifer:altDSID:account:credential:error:]( self,  "_deleteTokenWithIdentifer:altDSID:account:credential:error:",  a3,  a4,  0LL,  0LL,  a5);
}

- (id)tokenWithIdentifier:(id)a3 altDSID:(id)a4 forAccount:(id)a5 error:(id *)a6
{
  return -[AKTokenManager tokenWithIdentifier:altDSID:forAccount:shouldSync:error:]( self,  "tokenWithIdentifier:altDSID:forAccount:shouldSync:error:",  a3,  a4,  a5,  0LL,  a6);
}

- (id)tokenWithIdentifier:(id)a3 altDSID:(id)a4 forAccount:(id)a5 shouldSync:(BOOL)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = _AKLogSystem(v14);
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_10013B4E0();
  }

  if (!v12)
  {
    uint64_t v23 = _AKLogSystem(v17);
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10013B3FC();
    }

    if (a7)
    {
      uint64_t v25 = -7009LL;
LABEL_16:
      id v22 = 0LL;
      *a7 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", v25));
      goto LABEL_18;
    }

- (BOOL)synchronizeTokensForAltDSID:(id)a3 account:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = 1;
  id v11 =  -[AKTokenManager tokenWithIdentifier:altDSID:forAccount:shouldSync:error:]( self,  "tokenWithIdentifier:altDSID:forAccount:shouldSync:error:",  ACContinuationTokenKey,  v8,  v9,  1LL,  a5);
  id v12 =  -[AKTokenManager tokenWithIdentifier:altDSID:forAccount:shouldSync:error:]( self,  "tokenWithIdentifier:altDSID:forAccount:shouldSync:error:",  ACPasswordResetTokenKey,  v8,  v9,  1LL,  a5);
  id v13 =  -[AKTokenManager tokenWithIdentifier:altDSID:forAccount:shouldSync:error:]( self,  "tokenWithIdentifier:altDSID:forAccount:shouldSync:error:",  ACHeartbeatTokenKey,  v8,  v9,  1LL,  a5);
  if (a5) {
    BOOL v10 = *a5 == 0LL;
  }

  return v10;
}

- (BOOL)synchronizeTokensForAllAccounts:(id *)a3
{
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allAuthKitAccountsWithError:0]);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v22;
    *(void *)&__int128 v8 = 138412290LL;
    __int128 v20 = v8;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "altDSIDForAccount:", v12, v20));
        if ([v13 length])
        {
          BOOL v14 = -[AKTokenManager synchronizeTokensForAltDSID:account:error:]( self,  "synchronizeTokensForAltDSID:account:error:",  v13,  v12,  a3);
          if (!v14)
          {
            uint64_t v15 = _AKLogSystem(v14);
            id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              id v17 = *a3;
              *(_DWORD *)buf = v20;
              id v26 = v17;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "AKTokenManager sync hit an error: %@.",  buf,  0xCu);
            }
          }
        }
      }

      id v9 = [v6 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }

    while (v9);
  }

  if (a3) {
    BOOL v18 = *a3 == 0LL;
  }
  else {
    BOOL v18 = 1;
  }

  return v18;
}

- (BOOL)_deleteTokenWithIdentifer:(id)a3 altDSID:(id)a4 account:(id)a5 credential:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = _AKLogSystem(v15);
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_10013B7E8();
  }

  if (v13)
  {
    v40[0] = 0LL;
    v40[1] = v40;
    v40[2] = 0x3032000000LL;
    v40[3] = sub_1000854F4;
    v40[4] = sub_100085504;
    id v41 = v14;
    tokenManagerQueue = (dispatch_queue_s *)self->_tokenManagerQueue;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_100085F74;
    v33[3] = &unk_1001C9D50;
    id v34 = v12;
    id v35 = v13;
    v36 = self;
    v38 = v40;
    v39 = a7;
    id v37 = v15;
    dispatch_sync(tokenManagerQueue, v33);
    BOOL v21 = a7 == 0LL;
    if (a7)
    {
      uint64_t v22 = _AKLogSystem(v20);
      __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        sub_10013B780((uint64_t)a7, v23, v24, v25, v26, v27, v28, v29);
      }
    }

    _Block_object_dispose(v40, 8);
  }

  else
  {
    uint64_t v30 = _AKLogSystem(v18);
    id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      sub_10013B754();
    }

    BOOL v21 = 0;
  }

  return v21;
}

- (id)synchronizedCredentialForAccount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _AKLogSystem(v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10013B840();
  }

  id v21 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 credentialWithError:&v21]);
  id v8 = v21;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
  unsigned int v10 = [v9 isTokenCacheEnabled];

  if (v10 && v7)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 accountPropertyForKey:AKAltDSID]);
    uint64_t v12 = ACContinuationTokenKey;
    uint64_t v20 = 0LL;
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[AKTokenManager tokenWithIdentifier:altDSID:forAccount:error:]( self,  "tokenWithIdentifier:altDSID:forAccount:error:",  ACContinuationTokenKey,  v11,  v4,  &v20));
    uint64_t v14 = ACPasswordResetTokenKey;
    uint64_t v19 = 0LL;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[AKTokenManager tokenWithIdentifier:altDSID:forAccount:error:]( self,  "tokenWithIdentifier:altDSID:forAccount:error:",  ACPasswordResetTokenKey,  v11,  v4,  &v19));
    if (v13)
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 stringValue]);
      [v7 setCredentialItem:v16 forKey:v12];
    }

    if (v15)
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 stringValue]);
      [v7 setCredentialItem:v17 forKey:v14];
    }
  }

  return v7;
}

- (AAFKeychainManager)keychainManager
{
  return self->_keychainManager;
}

- (void)setKeychainManager:(id)a3
{
}

- (OS_dispatch_queue)tokenManagerQueue
{
  return self->_tokenManagerQueue;
}

- (void)setTokenManagerQueue:(id)a3
{
}

- (AKTokenCache)tokenCache
{
  return self->_tokenCache;
}

- (void)setTokenCache:(id)a3
{
}

- (AKTokenKeychain)tokenKeychain
{
  return self->_tokenKeychain;
}

- (void)setTokenKeychain:(id)a3
{
}

- (void).cxx_destruct
{
}

@end