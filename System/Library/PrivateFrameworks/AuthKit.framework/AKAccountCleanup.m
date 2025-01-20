@interface AKAccountCleanup
- (AKAccountCleanup)init;
- (id)_eligibleCleanupAccounts;
- (id)_inMemoryTokensForAccounts:(id)a3;
- (void)_cleanupAccountsToRemove:(id)a3 accountsToSave:(id)a4 completion:(id)a5;
- (void)_removeAccounts:(id)a3;
- (void)_saveAccounts:(id)a3 inMemoryTokens:(id)a4 completion:(id)a5;
- (void)cleanupStaleAccountsWithCompletion:(id)a3;
@end

@implementation AKAccountCleanup

- (AKAccountCleanup)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___AKAccountCleanup;
  v2 = -[AKAccountCleanup init](&v12, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    accountManager = v2->_accountManager;
    v2->_accountManager = (AKAccountManager *)v3;

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("AKAccountManager.groupedAccountCleanup", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    dispatch_group_t v9 = dispatch_group_create();
    group = v2->_group;
    v2->_group = (OS_dispatch_group *)v9;
  }

  return v2;
}

- (void)cleanupStaleAccountsWithCompletion:(id)a3
{
  id v42 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountCleanup _eligibleCleanupAccounts](self, "_eligibleCleanupAccounts"));
  uint64_t v5 = _AKLogSystem(v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v58 = [v4 count];
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Checking if IDMS account cleanup is necessary (%lu accounts found)...",  buf,  0xCu);
  }

  v45 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v52;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v52 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager altDSIDForAccount:](self->_accountManager, "altDSIDForAccount:", v13));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager servicesUsingAccount:](self->_accountManager, "servicesUsingAccount:", v13));
        if ([v15 count])
        {
          [v7 setObject:v13 forKeyedSubscript:v14];
        }

        else
        {
          uint64_t v16 = _AKLogSystem(0LL);
          v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v58 = v13;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Removing unusued IDMS account %@...",  buf,  0xCu);
          }

          -[NSMutableSet addObject:](v45, "addObject:", v13);
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v51 objects:v56 count:16];
    }

    while (v10);
  }

  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id obj = v8;
  id v18 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v48;
    do
    {
      for (j = 0LL; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v48 != v20) {
          objc_enumerationMutation(obj);
        }
        v22 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)j);
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager altDSIDForAccount:](self->_accountManager, "altDSIDForAccount:", v22));
        v24 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v23]);
        v25 = (void *)objc_claimAutoreleasedReturnValue([v24 identifier]);
        v26 = (void *)objc_claimAutoreleasedReturnValue([v22 identifier]);

        if (v25 == v26)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
          unsigned int v33 = [v32 isTokenCacheEnabled];

          if (v33)
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(+[AKTokenManager sharedInstance](&OBJC_CLASS___AKTokenManager, "sharedInstance"));
            id v46 = 0LL;
            unsigned __int8 v35 = [v34 synchronizeTokensForAltDSID:v23 account:v24 error:&v46];
            id v36 = v46;

            if ((v35 & 1) == 0)
            {
              uint64_t v38 = _AKLogSystem(v37);
              v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                id v58 = v36;
                _os_log_debug_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEBUG,  "AKTokenManager sync hit an error: %@.",  buf,  0xCu);
              }
            }
          }
        }

        else if (v24)
        {
          uint64_t v28 = _AKLogSystem(v27);
          v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v58 = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Preserving IDMS account %@...",  buf,  0xCu);
          }

          uint64_t v30 = _AKLogSystem([v43 setObject:v24 forKeyedSubscript:v23]);
          v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v58 = v22;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Removing duplicate IDMS account %@...",  buf,  0xCu);
          }

          -[NSMutableSet addObject:](v45, "addObject:", v22);
        }
      }

      id v19 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
    }

    while (v19);
  }

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v45, "allObjects"));
  v41 = (void *)objc_claimAutoreleasedReturnValue([v43 allValues]);
  -[AKAccountCleanup _cleanupAccountsToRemove:accountsToSave:completion:]( self,  "_cleanupAccountsToRemove:accountsToSave:completion:",  v40,  v41,  v42);
}

- (id)_eligibleCleanupAccounts
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager allAuthKitAccountsWithError:]( self->_accountManager,  "allAuthKitAccountsWithError:",  0LL));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10001DD38;
  v6[3] = &unk_1001C6E60;
  v6[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "aaf_filter:", v6));

  return v4;
}

- (void)_cleanupAccountsToRemove:(id)a3 accountsToSave:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountCleanup _inMemoryTokensForAccounts:](self, "_inMemoryTokensForAccounts:", v8));
  -[AKAccountCleanup _removeAccounts:](self, "_removeAccounts:", v10);

  queue = (dispatch_queue_s *)self->_queue;
  group = self->_group;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10001DEC4;
  v17[3] = &unk_1001C6E88;
  v17[4] = self;
  id v18 = v8;
  id v19 = v11;
  id v20 = v9;
  id v14 = v9;
  id v15 = v11;
  id v16 = v8;
  dispatch_group_notify((dispatch_group_t)group, queue, v17);
}

- (id)_inMemoryTokensForAccounts:(id)a3
{
  id v4 = a3;
  v22 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v25;
    *(void *)&__int128 v7 = 138412546LL;
    __int128 v21 = v7;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)i);
        objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager altDSIDForAccount:](self->_accountManager, "altDSIDForAccount:", v11, v21));
        accountManager = self->_accountManager;
        id v23 = 0LL;
        id v14 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager allTokensForAccount:error:]( accountManager,  "allTokensForAccount:error:",  v11,  &v23));
        id v15 = v23;
        id v16 = v15;
        if (v15)
        {
          uint64_t v17 = _AKLogSystem(v15);
          id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v21;
            uint64_t v29 = v11;
            __int16 v30 = 2112;
            v31 = v16;
            _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Something went wrong when fetching tokens for account %@. Error: %@",  buf,  0x16u);
          }
        }

        else
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v14, v12);
        }
      }

      id v8 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }

    while (v8);
  }

  id v19 = -[NSMutableDictionary copy](v22, "copy");
  return v19;
}

- (void)_removeAccounts:(id)a3
{
  id v4 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)v8);
        dispatch_group_enter((dispatch_group_t)self->_group);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager store](self->_accountManager, "store"));
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472LL;
        v11[2] = sub_10001E21C;
        v11[3] = &unk_1001C6EB0;
        v11[4] = v9;
        v11[5] = self;
        [v10 removeAccount:v9 withCompletionHandler:v11];

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }
}

- (void)_saveAccounts:(id)a3 inMemoryTokens:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v18 = a4;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v16 = (void (**)(void))a5;
  id obj = v8;
  id v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)i);
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472LL;
        v20[2] = sub_10001E594;
        v20[3] = &unk_1001C6510;
        v20[4] = self;
        v20[5] = v12;
        id v21 = v18;
        +[AKAccountManager performWithinPersonaForAccount:withBlock:]( &OBJC_CLASS___AKAccountManager,  "performWithinPersonaForAccount:withBlock:",  v12,  v20);
      }

      id v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v9);
  }

  uint64_t v14 = _AKLogSystem(v13);
  __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Done removing unused and duplicate IDMS accounts.",  buf,  2u);
  }

  if (v16) {
    v16[2](v16);
  }
}

- (void).cxx_destruct
{
}

  ;
}

@end