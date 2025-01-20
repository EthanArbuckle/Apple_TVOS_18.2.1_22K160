@interface AKAuthenticationSurrogateManager
- (AKAuthenticationSurrogateManager)initWithDelegate:(id)a3;
- (AKSurrogateAuthenticationIDGenerator)surrogateIDGenerator;
- (BOOL)_isClientWaitingForSurrogateAuth:(id)a3;
- (BOOL)_launchAppleIDSettingsForContext:(id)a3 withCheckinID:(id)a4;
- (BOOL)hasRegisteredSurrogateForContext:(id)a3;
- (BOOL)isSurrogateAuthInProgressForClientBundleID:(id)a3;
- (BOOL)isWaitingForSettingsSurrogateAuth;
- (NSMutableDictionary)inProgressSurrogates;
- (OS_dispatch_queue)surrogateQueue;
- (id)_fetchSurrogateForClientBundleID:(id)a3;
- (id)_fetchSurrogateWithRegistrationID:(id)a3;
- (void)_clearSurrogate:(id)a3;
- (void)_handleError:(id)a3 logMessage:(id)a4 withUIWorkBlock:(id)a5;
- (void)_stopWaitingForCheckInWithContext:(id)a3 andError:(id)a4;
- (void)_waitForSurrogateCheckInWithContext:(id)a3 withUIWorkBlock:(id)a4 client:(id)a5 andCheckInID:(id)a6;
- (void)performUIWorkWithSurrogateContext:(id)a3 uiWorkBlock:(id)a4;
- (void)registerUISurrogateContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)setInProgressSurrogates:(id)a3;
- (void)setSurrogateIDGenerator:(id)a3;
- (void)setSurrogateQueue:(id)a3;
- (void)unregisterUISurrogateForContext:(id)a3;
- (void)waitForRemoteViewServiceWithContext:(id)a3 client:(id)a4 uiWorkBlock:(id)a5;
- (void)waitForSettingsWithContext:(id)a3 client:(id)a4 requireFullUICapability:(BOOL)a5 allowRedirectToSettings:(BOOL)a6 uiWorkBlock:(id)a7;
@end

@implementation AKAuthenticationSurrogateManager

- (AKAuthenticationSurrogateManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___AKAuthenticationSurrogateManager;
  v5 = -[AKAuthenticationSurrogateManager init](&v22, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    accountManager = v6->_accountManager;
    v6->_accountManager = (AKAccountManager *)v7;

    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_t v11 = dispatch_queue_create("AKUISurrogateQueue", v10);
    surrogateQueue = v6->_surrogateQueue;
    v6->_surrogateQueue = (OS_dispatch_queue *)v11;

    v13 = objc_alloc_init(&OBJC_CLASS___NSLock);
    surrogateCheckinIDLock = v6->_surrogateCheckinIDLock;
    v6->_surrogateCheckinIDLock = v13;

    v15 = objc_opt_new(&OBJC_CLASS___AKAuthenticationSettingsLauncher);
    settingsLauncher = v6->_settingsLauncher;
    v6->_settingsLauncher = v15;

    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    inProgressSurrogates = v6->_inProgressSurrogates;
    v6->_inProgressSurrogates = (NSMutableDictionary *)v17;

    v19 = objc_opt_new(&OBJC_CLASS___AKSurrogateAuthenticationIDGenerator);
    surrogateIDGenerator = v6->_surrogateIDGenerator;
    v6->_surrogateIDGenerator = v19;
  }

  return v6;
}

- (BOOL)hasRegisteredSurrogateForContext:(id)a3
{
  surrogateCheckinIDLock = self->_surrogateCheckinIDLock;
  id v5 = a3;
  -[NSLock lock](surrogateCheckinIDLock, "lock");
  inProgressSurrogates = self->_inProgressSurrogates;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 _identifier]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](inProgressSurrogates, "objectForKeyedSubscript:", v7));
  dispatch_queue_attr_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 surrogateContext]);
  LOBYTE(v5) = v9 != 0LL;

  -[NSLock unlock](self->_surrogateCheckinIDLock, "unlock");
  return (char)v5;
}

- (BOOL)isSurrogateAuthInProgressForClientBundleID:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[AKAuthenticationSurrogateManager _fetchSurrogateForClientBundleID:]( self,  "_fetchSurrogateForClientBundleID:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 surrogateContext]);
  BOOL v5 = v4 != 0LL;

  return v5;
}

- (BOOL)isWaitingForSettingsSurrogateAuth
{
  return self->_settingsSurrogationInProgress;
}

- (void)waitForRemoteViewServiceWithContext:(id)a3 client:(id)a4 uiWorkBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  surrogateQueue = (dispatch_queue_s *)self->_surrogateQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000224F8;
  v15[3] = &unk_1001C71E0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(surrogateQueue, v15);
}

- (void)waitForSettingsWithContext:(id)a3 client:(id)a4 requireFullUICapability:(BOOL)a5 allowRedirectToSettings:(BOOL)a6 uiWorkBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  surrogateQueue = (dispatch_queue_s *)self->_surrogateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100022A48;
  block[3] = &unk_1001C7230;
  block[4] = self;
  id v20 = v13;
  BOOL v23 = a6;
  id v21 = v12;
  id v22 = v14;
  BOOL v24 = a5;
  id v16 = v12;
  id v17 = v14;
  id v18 = v13;
  dispatch_async(surrogateQueue, block);
}

- (void)performUIWorkWithSurrogateContext:(id)a3 uiWorkBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  surrogateQueue = (dispatch_queue_s *)self->_surrogateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100023008;
  block[3] = &unk_1001C7280;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(surrogateQueue, block);
}

- (void)registerUISurrogateContext:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  surrogateQueue = (dispatch_queue_s *)self->_surrogateQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100023370;
  v15[3] = &unk_1001C6E88;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(surrogateQueue, v15);
}

- (void)unregisterUISurrogateForContext:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 _identifier]);
  -[NSLock lock](self->_surrogateCheckinIDLock, "lock");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthenticationSurrogateManager inProgressSurrogates](self, "inProgressSurrogates"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  uint64_t v7 = _AKLogSystem(-[NSLock unlock](self->_surrogateCheckinIDLock, "unlock"));
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 surrogateClient]);
      dispatch_queue_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 surrogateRegistrationID]);
      int v14 = 138412546;
      v15 = v10;
      __int16 v16 = 2112;
      id v17 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "UI surrogate for client %@ with surrogate ID %@ is checking out.",  (uint8_t *)&v14,  0x16u);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 surrogateCompletion]);
    if (v12)
    {
      id v13 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v6 surrogateCompletion]);
      v13[2](v13, 0LL, 0LL);
    }

    -[AKAuthenticationSurrogateManager _clearSurrogate:](self, "_clearSurrogate:", v6);
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10012E59C();
    }
  }
}

- (BOOL)_isClientWaitingForSurrogateAuth:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 bundleID]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( -[AKAuthenticationSurrogateManager _fetchSurrogateForClientBundleID:]( self,  "_fetchSurrogateForClientBundleID:",  v4));
  LOBYTE(self) = v5 != 0LL;

  return (char)self;
}

- (void)_waitForSurrogateCheckInWithContext:(id)a3 withUIWorkBlock:(id)a4 client:(id)a5 andCheckInID:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = _AKLogSystem(v13);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412546;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Waiting for UI surrogate for client %@ with surrogate ID %@ to check in...",  (uint8_t *)&v20,  0x16u);
  }

  -[NSLock lock](self->_surrogateCheckinIDLock, "lock");
  __int16 v16 = objc_opt_new(&OBJC_CLASS___AKAuthenticationSurrogateModel);
  -[AKAuthenticationSurrogateModel setPendingClientUIWork:](v16, "setPendingClientUIWork:", v12);

  -[AKAuthenticationSurrogateModel setPendingBGContext:](v16, "setPendingBGContext:", v13);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleID]);
  -[AKAuthenticationSurrogateModel setPendingClientBundle:](v16, "setPendingClientBundle:", v17);

  -[AKAuthenticationSurrogateModel setSurrogateRegistrationID:](v16, "setSurrogateRegistrationID:", v11);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthenticationSurrogateManager inProgressSurrogates](self, "inProgressSurrogates"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v13 _identifier]);

  [v18 setObject:v16 forKeyedSubscript:v19];
  -[NSLock unlock](self->_surrogateCheckinIDLock, "unlock");
}

- (void)_stopWaitingForCheckInWithContext:(id)a3 andError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[NSLock lock](self->_surrogateCheckinIDLock, "lock");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthenticationSurrogateManager inProgressSurrogates](self, "inProgressSurrogates"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 _identifier]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);

  if (v10)
  {
    uint64_t v12 = _AKLogSystem(v11);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 surrogateClient]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v10 surrogateRegistrationID]);
      int v20 = 138412546;
      id v21 = v14;
      __int16 v22 = 2112;
      id v23 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Stop waiting for UI surrogate for client %@ with surrogate ID %@!",  (uint8_t *)&v20,  0x16u);
    }

    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v10 surrogateCompletion]);
    if (v16)
    {
      id v17 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v10 surrogateCompletion]);
      ((void (**)(void, void, id))v17)[2](v17, 0LL, v7);
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthenticationSurrogateManager inProgressSurrogates](self, "inProgressSurrogates"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 _identifier]);
    [v18 setObject:0 forKeyedSubscript:v19];
  }

  -[NSLock unlock](self->_surrogateCheckinIDLock, "unlock");
}

- (void)_handleError:(id)a3 logMessage:(id)a4 withUIWorkBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" AKAuthenticationSurrogateManager Error: %@",  v8));
  uint64_t v12 = _AKLogSystem(v11);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_10012E600(v9, (uint64_t)v11, v13);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained uiWorkQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100023CB4;
  block[3] = &unk_1001C7258;
  id v19 = v8;
  id v20 = v10;
  id v16 = v8;
  id v17 = v10;
  dispatch_async(v15, block);
}

- (id)_fetchSurrogateForClientBundleID:(id)a3
{
  id v4 = a3;
  -[NSLock lock](self->_surrogateCheckinIDLock, "lock");
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthenticationSurrogateManager inProgressSurrogates](self, "inProgressSurrogates", 0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pendingClientBundle]);
        unsigned int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (id)_fetchSurrogateWithRegistrationID:(id)a3
{
  id v4 = a3;
  -[NSLock lock](self->_surrogateCheckinIDLock, "lock");
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthenticationSurrogateManager inProgressSurrogates](self, "inProgressSurrogates", 0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 surrogateRegistrationID]);
        unsigned int v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (void)_clearSurrogate:(id)a3
{
  id v4 = a3;
  -[NSLock lock](self->_surrogateCheckinIDLock, "lock");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthenticationSurrogateManager inProgressSurrogates](self, "inProgressSurrogates"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeysForObject:v4]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);

  if (v7)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthenticationSurrogateManager inProgressSurrogates](self, "inProgressSurrogates"));
    [v9 setObject:0 forKeyedSubscript:v7];

    self->_settingsSurrogationInProgress = 0;
  }

  else
  {
    uint64_t v10 = _AKLogSystem(v8);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10012E684(v4, v11);
    }
  }

  -[NSLock unlock](self->_surrogateCheckinIDLock, "unlock");
}

- (BOOL)_launchAppleIDSettingsForContext:(id)a3 withCheckinID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 _capabilityForUIDisplay] == (id)4)
  {
    uint64_t v8 = _AKLogSystem(4LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v12 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Settings redirect not supported by context",  v12,  2u);
    }

    BOOL v10 = 1;
  }

  else
  {
    BOOL v10 = -[AKAuthenticationSettingsLauncher launchSettingsForContext:withCheckinID:]( self->_settingsLauncher,  "launchSettingsForContext:withCheckinID:",  v6,  v7);
  }

  return v10;
}

- (AKSurrogateAuthenticationIDGenerator)surrogateIDGenerator
{
  return self->_surrogateIDGenerator;
}

- (void)setSurrogateIDGenerator:(id)a3
{
}

- (OS_dispatch_queue)surrogateQueue
{
  return self->_surrogateQueue;
}

- (void)setSurrogateQueue:(id)a3
{
}

- (NSMutableDictionary)inProgressSurrogates
{
  return self->_inProgressSurrogates;
}

- (void)setInProgressSurrogates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end