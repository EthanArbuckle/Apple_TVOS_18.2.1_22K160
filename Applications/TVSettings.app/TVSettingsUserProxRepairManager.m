@interface TVSettingsUserProxRepairManager
- (ACAccountStore)accountStore;
- (BOOL)authenticateAccountsService:(id)a3 shouldSignInAccounts:(id)a4;
- (NSArray)signedInAccounts;
- (NSRecursiveLock)lock;
- (PBSIgnoreUserProfileAccountNotificationsAssertion)ignoreAccountNotificationAssertion;
- (PBSUserProfile)userProfile;
- (RBSAssertion)processAssertion;
- (SFAuthenticateAccountsService)authService;
- (TVSettingsUserProfilesValidator)userProfilesValidator;
- (TVSettingsUserProxRepairManager)init;
- (TVSettingsUserProxRepairManagerDelegate)delegate;
- (UMUserPersonaContext)initialPersonaContext;
- (int64_t)state;
- (void)_adoptPersona;
- (void)_cancelIfNotConnectedYet;
- (void)_cleanUp;
- (void)_finish;
- (void)_finishWithError:(id)a3;
- (void)_handleAuthServiceProgressEvent:(unsigned int)a3 info:(id)a4;
- (void)_restorePersona;
- (void)authenticateAccountsService:(id)a3 didAttemptSignInWithAccountType:(unsigned int)a4;
- (void)authenticateAccountsService:(id)a3 didFinishAuthentication:(id)a4;
- (void)authenticateAccountsService:(id)a3 willAttemptSignInWithAccountType:(unsigned int)a4;
- (void)dealloc;
- (void)setAccountStore:(id)a3;
- (void)setAuthService:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIgnoreAccountNotificationAssertion:(id)a3;
- (void)setInitialPersonaContext:(id)a3;
- (void)setLock:(id)a3;
- (void)setProcessAssertion:(id)a3;
- (void)setSignedInAccounts:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setUserProfile:(id)a3;
- (void)setUserProfilesValidator:(id)a3;
- (void)startWithUser:(id)a3 needsCDPRepair:(BOOL)a4;
- (void)stop;
@end

@implementation TVSettingsUserProxRepairManager

- (TVSettingsUserProxRepairManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSettingsUserProxRepairManager;
  v2 = -[TVSettingsUserProxRepairManager init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSRecursiveLock);
    lock = v2->_lock;
    v2->_lock = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___TVSettingsUserProfilesValidator);
    userProfilesValidator = v2->_userProfilesValidator;
    v2->_userProfilesValidator = v5;
  }

  return v2;
}

- (void)startWithUser:(id)a3 needsCDPRepair:(BOOL)a4
{
  id v6 = a3;
  lock = self->_lock;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10005DE3C;
  v10[3] = &unk_100190DE8;
  v10[4] = self;
  id v11 = v6;
  BOOL v12 = a4;
  objc_super v8 = lock;
  id v9 = v6;
  -[NSRecursiveLock lock](v8, "lock");
  sub_10005DE3C((uint64_t)v10);
  -[NSRecursiveLock unlock](v8, "unlock");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSettingsUserProxRepairManager;
  -[TVSettingsUserProxRepairManager dealloc](&v3, "dealloc");
}

- (void)stop
{
  lock = self->_lock;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10005E648;
  v4[3] = &unk_10018E440;
  v4[4] = self;
  objc_super v3 = lock;
  -[NSRecursiveLock lock](v3, "lock");
  sub_10005E648((uint64_t)v4);
  -[NSRecursiveLock unlock](v3, "unlock");
}

- (BOOL)authenticateAccountsService:(id)a3 shouldSignInAccounts:(id)a4
{
  id v6 = a3;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v7 = a4;
  objc_super v8 = 0LL;
  id v9 = 0LL;
  id v10 = [v7 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v37;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v37 != v11) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
        unsigned int v14 = [v13 type];
        if (v14 == 3)
        {
          uint64_t v17 = objc_claimAutoreleasedReturnValue([v13 altDSID]);
          v16 = v8;
          objc_super v8 = (void *)v17;
        }

        else
        {
          if (v14 != 1) {
            continue;
          }
          uint64_t v15 = objc_claimAutoreleasedReturnValue([v13 altDSID]);
          v16 = v9;
          id v9 = (void *)v15;
        }
      }

      id v10 = [v7 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }

    while (v10);
  }

  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  char v35 = 1;
  lock = self->_lock;
  v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472LL;
  v26 = sub_10005E9CC;
  v27 = &unk_100190E10;
  v28 = self;
  id v19 = v9;
  id v29 = v19;
  id v20 = v8;
  id v30 = v20;
  v31 = &v32;
  v21 = &v24;
  v22 = lock;
  -[NSRecursiveLock lock](v22, "lock", v24, v25);
  v26((uint64_t)v21);

  -[NSRecursiveLock unlock](v22, "unlock");
  LOBYTE(v22) = *((_BYTE *)v33 + 24) != 0;

  _Block_object_dispose(&v32, 8);
  return (char)v22;
}

- (void)authenticateAccountsService:(id)a3 willAttemptSignInWithAccountType:(unsigned int)a4
{
  lock = self->_lock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10005EB74;
  v6[3] = &unk_10018E440;
  v6[4] = self;
  v5 = lock;
  -[NSRecursiveLock lock](v5, "lock");
  sub_10005EB74((uint64_t)v6);
  -[NSRecursiveLock unlock](v5, "unlock");
}

- (void)authenticateAccountsService:(id)a3 didAttemptSignInWithAccountType:(unsigned int)a4
{
  lock = self->_lock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10005EBF4;
  v6[3] = &unk_10018E440;
  v6[4] = self;
  v5 = lock;
  -[NSRecursiveLock lock](v5, "lock");
  sub_10005EBF4((uint64_t)v6);
  -[NSRecursiveLock unlock](v5, "unlock");
}

- (void)authenticateAccountsService:(id)a3 didFinishAuthentication:(id)a4
{
  id v5 = a4;
  lock = self->_lock;
  v9[2] = sub_10005EC98;
  v9[3] = &unk_10018E468;
  v9[4] = self;
  id v10 = v5;
  id v7 = lock;
  id v8 = v5;
  -[NSRecursiveLock lock](v7, "lock", _NSConcreteStackBlock, 3221225472LL);
  sub_10005EC98((uint64_t)v9);
  -[NSRecursiveLock unlock](v7, "unlock");
}

- (void)_handleAuthServiceProgressEvent:(unsigned int)a3 info:(id)a4
{
  id v6 = a4;
  lock = self->_lock;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10005ED80;
  v10[3] = &unk_100190E38;
  unsigned int v12 = a3;
  v10[4] = self;
  id v11 = v6;
  id v8 = lock;
  id v9 = v6;
  -[NSRecursiveLock lock](v8, "lock");
  sub_10005ED80((uint64_t)v10);
  -[NSRecursiveLock unlock](v8, "unlock");
}

- (void)_adoptPersona
{
  lock = self->_lock;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10005F82C;
  v4[3] = &unk_10018E440;
  v4[4] = self;
  objc_super v3 = lock;
  -[NSRecursiveLock lock](v3, "lock");
  sub_10005F82C((uint64_t)v4);
  -[NSRecursiveLock unlock](v3, "unlock");
}

- (void)_restorePersona
{
  lock = self->_lock;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10005FB2C;
  v4[3] = &unk_10018E440;
  v4[4] = self;
  objc_super v3 = lock;
  -[NSRecursiveLock lock](v3, "lock");
  sub_10005FB2C((uint64_t)v4);
  -[NSRecursiveLock unlock](v3, "unlock");
}

- (void)_finish
{
  lock = self->_lock;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10005FC94;
  v4[3] = &unk_10018E440;
  v4[4] = self;
  objc_super v3 = lock;
  -[NSRecursiveLock lock](v3, "lock");
  sub_10005FC94((uint64_t)v4);
  -[NSRecursiveLock unlock](v3, "unlock");
}

- (void)_finishWithError:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v8[2] = sub_100060428;
  v8[3] = &unk_10018E468;
  v8[4] = self;
  id v9 = v4;
  id v6 = lock;
  id v7 = v4;
  -[NSRecursiveLock lock](v6, "lock", _NSConcreteStackBlock, 3221225472LL);
  sub_100060428((uint64_t)v8);
  -[NSRecursiveLock unlock](v6, "unlock");
}

- (void)_cleanUp
{
  lock = self->_lock;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100060954;
  v4[3] = &unk_10018E440;
  v4[4] = self;
  objc_super v3 = lock;
  -[NSRecursiveLock lock](v3, "lock");
  sub_100060954((uint64_t)v4);
  -[NSRecursiveLock unlock](v3, "unlock");
}

- (void)_cancelIfNotConnectedYet
{
  lock = self->_lock;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100060A90;
  v4[3] = &unk_10018E440;
  v4[4] = self;
  objc_super v3 = lock;
  -[NSRecursiveLock lock](v3, "lock");
  sub_100060A90(v4);
  -[NSRecursiveLock unlock](v3, "unlock");
}

- (TVSettingsUserProxRepairManagerDelegate)delegate
{
  return (TVSettingsUserProxRepairManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (SFAuthenticateAccountsService)authService
{
  return self->_authService;
}

- (void)setAuthService:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (PBSUserProfile)userProfile
{
  return self->_userProfile;
}

- (void)setUserProfile:(id)a3
{
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (PBSIgnoreUserProfileAccountNotificationsAssertion)ignoreAccountNotificationAssertion
{
  return self->_ignoreAccountNotificationAssertion;
}

- (void)setIgnoreAccountNotificationAssertion:(id)a3
{
}

- (RBSAssertion)processAssertion
{
  return self->_processAssertion;
}

- (void)setProcessAssertion:(id)a3
{
}

- (TVSettingsUserProfilesValidator)userProfilesValidator
{
  return self->_userProfilesValidator;
}

- (void)setUserProfilesValidator:(id)a3
{
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (NSArray)signedInAccounts
{
  return self->_signedInAccounts;
}

- (void)setSignedInAccounts:(id)a3
{
}

- (UMUserPersonaContext)initialPersonaContext
{
  return self->_initialPersonaContext;
}

- (void)setInitialPersonaContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end