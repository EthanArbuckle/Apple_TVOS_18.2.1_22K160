@interface FAFetchFamilyCircleOperation
- (BOOL)_isCacheValid:(id)a3;
- (BOOL)_shouldFetchFromServer:(id)a3;
- (BOOL)_signedInAccountMatchesApproverRequirementsFromCache:(id)a3;
- (BOOL)promptUserToResolveAuthenticatonFailure;
- (BOOL)signedInAccountShouldBeApprover;
- (FAFamilyCircleCacheProtocol)cache;
- (FAFetchFamilyCircleOperation)initWithNetworkService:(id)a3 cache:(id)a4 marqueeCacheHanlder:(id)a5 requestCoalescer:(id)a6 familyRefreshActivityScheduler:(id)a7;
- (FAFetchFamilyCircleOperation)initWithNetworkService:(id)a3 cache:(id)a4 marqueeCacheHanlder:(id)a5 requestCoalescer:(id)a6 familyRefreshActivityScheduler:(id)a7 rateLimiter:(id)a8;
- (FARateLimiting)rateLimiter;
- (NSString)clientProcess;
- (NSString)context;
- (id)_accountStore;
- (id)_familyCircleWithResponse:(id)a3;
- (id)_fetchCircleRequestWithCacheResponse:(id)a3;
- (id)_renewCredentials;
- (id)cachePolicyString;
- (id)fetchCircleFromServer;
- (id)fetchCircleFromServerWithCacheResponse:(id)a3;
- (id)fetchFamilyCircle;
- (id)username;
- (unint64_t)cachePolicy;
- (void)familyCircleWithServerResponse:(id)a3 responseHeaders:(id)a4 completion:(id)a5;
- (void)setCache:(id)a3;
- (void)setCachePolicy:(unint64_t)a3;
- (void)setClientProcess:(id)a3;
- (void)setContext:(id)a3;
- (void)setPromptUserToResolveAuthenticatonFailure:(BOOL)a3;
- (void)setRateLimiter:(id)a3;
- (void)setSignedInAccountShouldBeApprover:(BOOL)a3;
- (void)updateUserDefaultsWithFamilyCircle:(id)a3;
@end

@implementation FAFetchFamilyCircleOperation

- (FAFetchFamilyCircleOperation)initWithNetworkService:(id)a3 cache:(id)a4 marqueeCacheHanlder:(id)a5 requestCoalescer:(id)a6 familyRefreshActivityScheduler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = -[FARateLimiter initWithIdentifier:]( objc_alloc(&OBJC_CLASS___FARateLimiter),  "initWithIdentifier:",  @"FAFetchFamilyCircleOperation");
  v18 = -[FAFetchFamilyCircleOperation initWithNetworkService:cache:marqueeCacheHanlder:requestCoalescer:familyRefreshActivityScheduler:rateLimiter:]( self,  "initWithNetworkService:cache:marqueeCacheHanlder:requestCoalescer:familyRefreshActivityScheduler:rateLimiter:",  v16,  v15,  v14,  v13,  v12,  v17);

  return v18;
}

- (FAFetchFamilyCircleOperation)initWithNetworkService:(id)a3 cache:(id)a4 marqueeCacheHanlder:(id)a5 requestCoalescer:(id)a6 familyRefreshActivityScheduler:(id)a7 rateLimiter:(id)a8
{
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___FAFetchFamilyCircleOperation;
  v18 = -[FANetworkClient initWithNetworkService:](&v23, "initWithNetworkService:", a3);
  v19 = v18;
  if (v18)
  {
    v18->_cachePolicy = 1LL;
    objc_storeStrong((id *)&v18->_cache, a4);
    objc_storeStrong((id *)&v19->_requestCoalescer, a6);
    objc_storeStrong((id *)&v19->_marqueeCacheHandler, a5);
    objc_storeStrong((id *)&v19->_familyRefreshActivityScheduler, a7);
    objc_storeStrong((id *)&v19->_rateLimiter, a8);
  }

  return v19;
}

- (id)username
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FANetworkClient networkService](self, "networkService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 account]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "aa_personID"));

  return v4;
}

- (id)fetchFamilyCircle
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FANetworkClient networkService](self, "networkService"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 ensureDeviceUnlockedSinceBoot]);
  v5 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v4 then]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10000320C;
  v17[3] = &unk_100040EA0;
  v17[4] = self;
  uint64_t v6 = ((uint64_t (**)(void, void *))v5)[2](v5, v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v7 then]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100003248;
  v16[3] = &unk_100040F08;
  v16[4] = self;
  uint64_t v9 = ((uint64_t (**)(void, void *))v8)[2](v8, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v10 then]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000032BC;
  v15[3] = &unk_100040F58;
  v15[4] = self;
  uint64_t v12 = ((uint64_t (**)(void, void *))v11)[2](v11, v15);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  return v13;
}

- (BOOL)_shouldFetchFromServer:(id)a3
{
  id v5 = a3;
  uint64_t v6 = -[FAFetchFamilyCircleOperation cachePolicy](self, "cachePolicy");
  if (v6 > 1)
  {
    if (v6 == 1000)
    {
      uint64_t v17 = _FALogSystem(1000LL, v7);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v25 = 0;
        v19 = "Attempting to fetch the family circle from the server because cachePolicy=FACachePolicyInternalReloadIgnoringCache";
        v20 = (uint8_t *)&v25;
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v19, v20, 2u);
      }

- (BOOL)_isCacheValid:(id)a3
{
  id v4 = a3;
  uint64_t AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AlwaysUseCache", @"com.apple.familycircle", 0LL);
  if ((_DWORD)AppBooleanValue)
  {
    uint64_t v7 = _FALogSystem(AppBooleanValue, v6);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "WARNING: Skipping cache validation for family circle due to preferences override",  v12,  2u);
    }

    BOOL v9 = 1;
  }

  else
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 familyCircleIfFresh]);
    BOOL v9 = -[FAFetchFamilyCircleOperation _signedInAccountMatchesApproverRequirementsFromCache:]( self,  "_signedInAccountMatchesApproverRequirementsFromCache:",  v10);
  }

  return v9;
}

- (BOOL)_signedInAccountMatchesApproverRequirementsFromCache:(id)a3
{
  id v4 = a3;
  if (-[FAFetchFamilyCircleOperation signedInAccountShouldBeApprover](self, "signedInAccountShouldBeApprover"))
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "members", 0));
    id v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v18;
      while (2)
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v5);
          }
          BOOL v9 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
          if ([v9 isMe])
          {
            id v6 = v9;
            goto LABEL_13;
          }
        }

        id v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

- (id)fetchCircleFromServer
{
  return -[FAFetchFamilyCircleOperation fetchCircleFromServerWithCacheResponse:]( self,  "fetchCircleFromServerWithCacheResponse:",  0LL);
}

- (id)fetchCircleFromServerWithCacheResponse:(id)a3
{
  id v4 = a3;
  BOOL v5 = (id)-[FAFetchFamilyCircleOperation cachePolicy](self, "cachePolicy") == (id)1000
    || (id)-[FAFetchFamilyCircleOperation cachePolicy](self, "cachePolicy") == (id)2;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[FAFetchFamilyCircleOperation rateLimiter](self, "rateLimiter"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[FAFetchFamilyCircleOperation clientProcess](self, "clientProcess"));
  [v6 recordCallWithClientName:v7];

  requestCoalescer = self->_requestCoalescer;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100003A4C;
  v12[3] = &unk_100040FF8;
  v12[4] = self;
  id v13 = v4;
  id v9 = v4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[FARequestCoalescer performBlockForKey:force:block:]( requestCoalescer,  "performBlockForKey:force:block:",  @"FAFetchFamilyCircleOperationKey",  v5,  v12));

  return v10;
}

- (id)_fetchCircleRequestWithCacheResponse:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_alloc(&OBJC_CLASS___AAFPromise);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100003DA0;
  v13[3] = &unk_100041048;
  v13[4] = self;
  id v14 = v4;
  id v6 = v4;
  uint64_t v7 = -[AAFPromise initWithBlock:](v5, "initWithBlock:", v13);
  v8 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue(-[AAFPromise then](v7, "then"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000043E8;
  v12[3] = &unk_100041070;
  v12[4] = self;
  uint64_t v9 = ((uint64_t (**)(void, void *))v8)[2](v8, v12);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

- (id)_familyCircleWithResponse:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_alloc(&OBJC_CLASS___AAFPromise);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100004490;
  v9[3] = &unk_100041048;
  id v10 = v4;
  uint64_t v11 = self;
  id v6 = v4;
  uint64_t v7 = -[AAFPromise initWithBlock:](v5, "initWithBlock:", v9);

  return v7;
}

- (id)_renewCredentials
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100004648;
  v3[3] = &unk_1000410C0;
  v3[4] = self;
  return -[AAFPromise initWithBlock:](objc_alloc(&OBJC_CLASS___AAFPromise), "initWithBlock:", v3);
}

- (id)cachePolicyString
{
  unint64_t v2 = -[FAFetchFamilyCircleOperation cachePolicy](self, "cachePolicy");
  if (v2 > 2) {
    return @"Internal-Reload-Ignoring-Cache";
  }
  else {
    return *(&off_100041108 + v2);
  }
}

- (id)_accountStore
{
  accountStore = self->_accountStore;
  if (!accountStore)
  {
    id v4 = (ACAccountStore *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
    BOOL v5 = self->_accountStore;
    self->_accountStore = v4;

    accountStore = self->_accountStore;
  }

  return accountStore;
}

- (void)updateUserDefaultsWithFamilyCircle:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v3 members]);
  id v6 = [v5 count];

  uint64_t v9 = _FALogSystem(v7, v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v11)
    {
      int v30 = 136315138;
      v31 = "-[FAFetchFamilyCircleOperation updateUserDefaultsWithFamilyCircle:]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: cache family count more than 0",  (uint8_t *)&v30,  0xCu);
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v3 members]);
    id v13 = [v12 count];
    [v4 setInteger:v13 forKey:FAFamilySettingRowFamilyCountKey];
  }

  else
  {
    if (v11)
    {
      int v30 = 136315138;
      v31 = "-[FAFetchFamilyCircleOperation updateUserDefaultsWithFamilyCircle:]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: delete cached family count",  (uint8_t *)&v30,  0xCu);
    }

    [v4 removeObjectForKey:FAFamilySettingRowFamilyCountKey];
  }

  if (_os_feature_enabled_impl("Family", "BetterPendingInvites"))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 pendingMembers]);
    uint64_t v15 = (uint64_t)[v14 count];

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v3 pendingInvitesOnly]);
    uint64_t v17 = (uint64_t)[v16 count];

    uint64_t v20 = _FALogSystem(v18, v19);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v15 < 1)
    {
      if (v22)
      {
        int v30 = 136315138;
        v31 = "-[FAFetchFamilyCircleOperation updateUserDefaultsWithFamilyCircle:]";
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%s: delete cached invitation count count",  (uint8_t *)&v30,  0xCu);
      }

      __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      [v23 removeObjectForKey:FAFamilySettingRowPendingInvitesKey];
    }

    else
    {
      if (v22)
      {
        int v30 = 136315138;
        v31 = "-[FAFetchFamilyCircleOperation updateUserDefaultsWithFamilyCircle:]";
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%s: cache pending invites count more than 1",  (uint8_t *)&v30,  0xCu);
      }

      __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      [v23 setInteger:v15 forKey:FAFamilySettingRowPendingInvitesKey];
    }

    uint64_t v26 = _FALogSystem(v24, v25);
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if (v17 < 1)
    {
      if (v28)
      {
        int v30 = 136315138;
        v31 = "-[FAFetchFamilyCircleOperation updateUserDefaultsWithFamilyCircle:]";
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%s: delete cached  count count",  (uint8_t *)&v30,  0xCu);
      }

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      [v29 removeObjectForKey:FAFamilyInvitationsReceivedKey];
    }

    else
    {
      if (v28)
      {
        int v30 = 136315138;
        v31 = "-[FAFetchFamilyCircleOperation updateUserDefaultsWithFamilyCircle:]";
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%s: cache inviters count more than 1",  (uint8_t *)&v30,  0xCu);
      }

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      [v29 setInteger:v17 forKey:FAFamilyInvitationsReceivedKey];
    }
  }
}

- (void)familyCircleWithServerResponse:(id)a3 responseHeaders:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"status"]);
  if (v11
    && (uint64_t v12 = (void *)v11,
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"status"]),
        id v14 = [v13 integerValue],
        v13,
        v12,
        !v14))
  {
    uint64_t v15 = -[FAFamilyCircle initWithServerResponse:]( objc_alloc(&OBJC_CLASS___FAFamilyCircle),  "initWithServerResponse:",  v8);
    -[FAFetchFamilyCircleOperation updateUserDefaultsWithFamilyCircle:]( self,  "updateUserDefaultsWithFamilyCircle:",  v15);
    if (v15)
    {
      cache = self->_cache;
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"X-Apple-Cache-ServerTag"]);
      v27 = (void *)objc_claimAutoreleasedReturnValue( -[FAFamilyCircleCacheProtocol updateWithFamilyCircle:serverTag:]( cache,  "updateWithFamilyCircle:serverTag:",  v15,  v26));
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_1000050B4;
      v28[3] = &unk_1000410E8;
      v28[4] = self;
      id v30 = v10;
      uint64_t v15 = v15;
      v29 = v15;
      [v27 onComplete:v28];
    }

    else
    {
      (*((void (**)(id, void, void))v10 + 2))(v10, 0LL, 0LL);
    }
  }

  else
  {
    uint64_t v15 = (FAFamilyCircle *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"status-message"]);

    if (v16)
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"status-message"]);
      -[FAFamilyCircle setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  v17,  NSLocalizedDescriptionKey);
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"status"]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"FAFetchFamilyCircleErrorDomain",  [v18 integerValue],  v15));

    uint64_t v22 = _FALogSystem(v20, v21);
    __int16 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v32 = (id)objc_opt_class(self);
      __int16 v33 = 2112;
      id v34 = v8;
      id v24 = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%@: Error in server response - %@",  buf,  0x16u);
    }

    (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v19);
  }
}

- (BOOL)signedInAccountShouldBeApprover
{
  return self->_signedInAccountShouldBeApprover;
}

- (void)setSignedInAccountShouldBeApprover:(BOOL)a3
{
  self->_signedInAccountShouldBeApprover = a3;
}

- (unint64_t)cachePolicy
{
  return self->_cachePolicy;
}

- (void)setCachePolicy:(unint64_t)a3
{
  self->_cachePolicy = a3;
}

- (NSString)clientProcess
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setClientProcess:(id)a3
{
}

- (NSString)context
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setContext:(id)a3
{
}

- (BOOL)promptUserToResolveAuthenticatonFailure
{
  return self->_promptUserToResolveAuthenticatonFailure;
}

- (void)setPromptUserToResolveAuthenticatonFailure:(BOOL)a3
{
  self->_promptUserToResolveAuthenticatonFailure = a3;
}

- (FARateLimiting)rateLimiter
{
  return self->_rateLimiter;
}

- (void)setRateLimiter:(id)a3
{
}

- (FAFamilyCircleCacheProtocol)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end