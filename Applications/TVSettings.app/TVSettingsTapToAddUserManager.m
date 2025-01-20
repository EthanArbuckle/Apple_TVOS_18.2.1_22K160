@interface TVSettingsTapToAddUserManager
- (ACAccountStore)accountStore;
- (BOOL)authenticateAccountsService:(id)a3 shouldSignInAccounts:(id)a4;
- (BOOL)isNewPersona;
- (BOOL)isVoiceProfileAvailable;
- (NSArray)homeUserIdentifiers;
- (NSArray)preferredLanguages;
- (NSArray)signedInAccounts;
- (NSRecursiveLock)lock;
- (NSString)localeIdentifier;
- (NSString)personaIdentifier;
- (NSString)preferredLanguageCode;
- (PBSIgnoreUserProfileAccountNotificationsAssertion)ignoreAccountNotificationAssertion;
- (PBSUserProfile)addedUserProfile;
- (RBSAssertion)processAssertion;
- (SFAuthenticateAccountsService)authService;
- (TVCSHomeManager)homeManager;
- (TVSettingsTapToAddUserManager)initWithUserProfileType:(int64_t)a3;
- (TVSettingsTapToAddUserManagerDelegate)delegate;
- (TVSettingsUserProfilesValidator)userProfilesValidator;
- (UMUserPersonaContext)initialPersonaContext;
- (id)_result;
- (int64_t)state;
- (int64_t)userProfileType;
- (void)_adoptPersona;
- (void)_beginHomeKitSetup;
- (void)_cancelIfNotConnectedYet;
- (void)_cleanUp;
- (void)_deletePersonaIfNeeded;
- (void)_finish;
- (void)_finishWithError:(id)a3;
- (void)_handleHomeConfigurationStateChange;
- (void)_handleSetupServiceProgressEvent:(unsigned int)a3 info:(id)a4;
- (void)_restorePersona;
- (void)_start;
- (void)authenticateAccountsService:(id)a3 didAttemptSignInWithAccountType:(unsigned int)a4;
- (void)authenticateAccountsService:(id)a3 didFinishAuthentication:(id)a4;
- (void)authenticateAccountsService:(id)a3 willAttemptSignInWithAccountType:(unsigned int)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAccountStore:(id)a3;
- (void)setAddedUserProfile:(id)a3;
- (void)setAuthService:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setHomeUserIdentifiers:(id)a3;
- (void)setIgnoreAccountNotificationAssertion:(id)a3;
- (void)setInitialPersonaContext:(id)a3;
- (void)setIsNewPersona:(BOOL)a3;
- (void)setIsVoiceProfileAvailable:(BOOL)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setLock:(id)a3;
- (void)setPersonaIdentifier:(id)a3;
- (void)setPreferredLanguageCode:(id)a3;
- (void)setPreferredLanguages:(id)a3;
- (void)setProcessAssertion:(id)a3;
- (void)setSignedInAccounts:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setUserProfileType:(int64_t)a3;
- (void)setUserProfilesValidator:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation TVSettingsTapToAddUserManager

- (TVSettingsTapToAddUserManager)initWithUserProfileType:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVSettingsTapToAddUserManager;
  v4 = -[TVSettingsTapToAddUserManager init](&v12, "init");
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___NSRecursiveLock);
    lock = v4->_lock;
    v4->_lock = v5;

    v4->_userProfileType = a3;
    v4->_state = 0LL;
    v7 = objc_alloc_init(&OBJC_CLASS___TVSettingsUserProfilesValidator);
    userProfilesValidator = v4->_userProfilesValidator;
    v4->_userProfilesValidator = v7;

    -[TVSettingsUserProfilesValidator setUserActionType:](v4->_userProfilesValidator, "setUserActionType:", 1LL);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
    accountStore = v4->_accountStore;
    v4->_accountStore = (ACAccountStore *)v9;
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSettingsTapToAddUserManager;
  -[TVSettingsTapToAddUserManager dealloc](&v3, "dealloc");
}

- (void)start
{
  lock = self->_lock;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000D9EA0;
  v4[3] = &unk_10018E440;
  v4[4] = self;
  objc_super v3 = lock;
  -[NSRecursiveLock lock](v3, "lock");
  sub_1000D9EA0((uint64_t)v4);
  -[NSRecursiveLock unlock](v3, "unlock");
}

- (void)stop
{
  lock = self->_lock;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000DA2AC;
  v4[3] = &unk_10018E440;
  v4[4] = self;
  objc_super v3 = lock;
  -[NSRecursiveLock lock](v3, "lock");
  sub_1000DA2AC((uint64_t)v4);
  -[NSRecursiveLock unlock](v3, "unlock");
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v8[2] = sub_1000DA550;
  v8[3] = &unk_10018E468;
  id v9 = v4;
  v10 = self;
  v6 = lock;
  id v7 = v4;
  -[NSRecursiveLock lock](v6, "lock", _NSConcreteStackBlock, 3221225472LL);
  sub_1000DA550((uint64_t)v8);
  -[NSRecursiveLock unlock](v6, "unlock");
}

- (BOOL)authenticateAccountsService:(id)a3 shouldSignInAccounts:(id)a4
{
  id v6 = a3;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v7 = a4;
  v8 = 0LL;
  id v9 = 0LL;
  id v10 = [v7 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
        unsigned int v14 = [v13 type];
        if (v14 == 3)
        {
          uint64_t v17 = objc_claimAutoreleasedReturnValue([v13 altDSID]);
          v16 = v8;
          v8 = (void *)v17;
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

      id v10 = [v7 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }

    while (v10);
  }

  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  lock = self->_lock;
  v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472LL;
  v26 = sub_1000DA7F8;
  v27 = &unk_100194B60;
  v31 = &v32;
  v28 = self;
  id v19 = v9;
  id v29 = v19;
  id v20 = v8;
  id v30 = v20;
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
  v6[2] = sub_1000DA8F0;
  v6[3] = &unk_10018E440;
  v6[4] = self;
  v5 = lock;
  -[NSRecursiveLock lock](v5, "lock");
  sub_1000DA8F0((uint64_t)v6);
  -[NSRecursiveLock unlock](v5, "unlock");
}

- (void)authenticateAccountsService:(id)a3 didAttemptSignInWithAccountType:(unsigned int)a4
{
  lock = self->_lock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000DA970;
  v6[3] = &unk_10018E440;
  v6[4] = self;
  v5 = lock;
  -[NSRecursiveLock lock](v5, "lock");
  sub_1000DA970((uint64_t)v6);
  -[NSRecursiveLock unlock](v5, "unlock");
}

- (void)authenticateAccountsService:(id)a3 didFinishAuthentication:(id)a4
{
  id v5 = a4;
  lock = self->_lock;
  v9[2] = sub_1000DAA14;
  v9[3] = &unk_10018E468;
  v9[4] = self;
  id v10 = v5;
  id v7 = lock;
  id v8 = v5;
  -[NSRecursiveLock lock](v7, "lock", _NSConcreteStackBlock, 3221225472LL);
  sub_1000DAA14((uint64_t)v9);
  -[NSRecursiveLock unlock](v7, "unlock");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001E0B18 == a6)
  {
    -[TVSettingsTapToAddUserManager _handleHomeConfigurationStateChange]( self,  "_handleHomeConfigurationStateChange",  a3,  a4,  a5);
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___TVSettingsTapToAddUserManager;
    -[TVSettingsTapToAddUserManager observeValueForKeyPath:ofObject:change:context:]( &v6,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)_start
{
  lock = self->_lock;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000DABB0;
  v4[3] = &unk_10018E440;
  v4[4] = self;
  objc_super v3 = lock;
  -[NSRecursiveLock lock](v3, "lock");
  sub_1000DABB0((uint64_t)v4);
  -[NSRecursiveLock unlock](v3, "unlock");
}

- (void)_adoptPersona
{
  lock = self->_lock;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000DB214;
  v4[3] = &unk_10018E440;
  v4[4] = self;
  objc_super v3 = lock;
  -[NSRecursiveLock lock](v3, "lock");
  sub_1000DB214((uint64_t)v4);
  -[NSRecursiveLock unlock](v3, "unlock");
}

- (void)_restorePersona
{
  lock = self->_lock;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000DB4D8;
  v4[3] = &unk_10018E440;
  v4[4] = self;
  objc_super v3 = lock;
  -[NSRecursiveLock lock](v3, "lock");
  sub_1000DB4D8((uint64_t)v4);
  -[NSRecursiveLock unlock](v3, "unlock");
}

- (void)_handleSetupServiceProgressEvent:(unsigned int)a3 info:(id)a4
{
  id v6 = a4;
  lock = self->_lock;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000DB674;
  v10[3] = &unk_100190E38;
  unsigned int v12 = a3;
  v10[4] = self;
  id v11 = v6;
  id v8 = lock;
  id v9 = v6;
  -[NSRecursiveLock lock](v8, "lock");
  sub_1000DB674((uint64_t)v10);
  -[NSRecursiveLock unlock](v8, "unlock");
}

- (void)_finish
{
  lock = self->_lock;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000DC0FC;
  v4[3] = &unk_10018E440;
  v4[4] = self;
  objc_super v3 = lock;
  -[NSRecursiveLock lock](v3, "lock");
  sub_1000DC0FC((uint64_t)v4);
  -[NSRecursiveLock unlock](v3, "unlock");
}

- (void)_beginHomeKitSetup
{
  lock = self->_lock;
  v4[2] = sub_1000DCD18;
  v4[3] = &unk_10018EE18;
  v4[4] = self;
  void v4[5] = a2;
  objc_super v3 = lock;
  -[NSRecursiveLock lock](v3, "lock", _NSConcreteStackBlock, 3221225472LL);
  sub_1000DCD18((uint64_t)v4);
  -[NSRecursiveLock unlock](v3, "unlock");
}

- (void)_handleHomeConfigurationStateChange
{
  lock = self->_lock;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000DCF90;
  v4[3] = &unk_10018E440;
  v4[4] = self;
  objc_super v3 = lock;
  -[NSRecursiveLock lock](v3, "lock");
  sub_1000DCF90((uint64_t)v4);
  -[NSRecursiveLock unlock](v3, "unlock");
}

- (void)_finishWithError:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v8[2] = sub_1000DD410;
  v8[3] = &unk_10018E468;
  void v8[4] = self;
  id v9 = v4;
  id v6 = lock;
  id v7 = v4;
  -[NSRecursiveLock lock](v6, "lock", _NSConcreteStackBlock, 3221225472LL);
  sub_1000DD410((uint64_t)v8);
  -[NSRecursiveLock unlock](v6, "unlock");
}

- (void)_deletePersonaIfNeeded
{
  lock = self->_lock;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000DDA80;
  v4[3] = &unk_10018E440;
  v4[4] = self;
  objc_super v3 = lock;
  -[NSRecursiveLock lock](v3, "lock");
  sub_1000DDA80((uint64_t)v4);
  -[NSRecursiveLock unlock](v3, "unlock");
}

- (void)_cleanUp
{
  lock = self->_lock;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000DDCAC;
  v4[3] = &unk_10018E440;
  v4[4] = self;
  objc_super v3 = lock;
  -[NSRecursiveLock lock](v3, "lock");
  sub_1000DDCAC((uint64_t)v4);
  -[NSRecursiveLock unlock](v3, "unlock");
}

- (void)_cancelIfNotConnectedYet
{
  lock = self->_lock;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000DDE48;
  v4[3] = &unk_10018E440;
  v4[4] = self;
  objc_super v3 = lock;
  -[NSRecursiveLock lock](v3, "lock");
  sub_1000DDE48(v4);
  -[NSRecursiveLock unlock](v3, "unlock");
}

- (id)_result
{
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  v26 = sub_1000DE124;
  v27 = sub_1000DE134;
  id v28 = 0LL;
  lock = self->_lock;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  id v19 = sub_1000DE13C;
  id v20 = &unk_100190E88;
  v21 = self;
  v22 = &v23;
  id v5 = v18;
  id v6 = lock;
  -[NSRecursiveLock lock](v6, "lock");
  v19((uint64_t)v5);

  -[NSRecursiveLock unlock](v6, "unlock");
  id v7 = (void *)v24[5];
  if (!v7)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"result != nil"));
    id v11 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      unsigned int v12 = NSStringFromSelector(a2);
      id v13 = (id)objc_claimAutoreleasedReturnValue(v12);
      unsigned int v14 = (objc_class *)objc_opt_class(self);
      uint64_t v15 = NSStringFromClass(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      *(_DWORD *)buf = 138544642;
      id v30 = v13;
      __int16 v31 = 2114;
      uint64_t v32 = v16;
      __int16 v33 = 2048;
      uint64_t v34 = self;
      __int16 v35 = 2114;
      __int128 v36 = @"TVSettingsTapToAddUserManager.m";
      __int16 v37 = 1024;
      int v38 = 714;
      __int16 v39 = 2114;
      v40 = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    uint64_t v17 = _bs_set_crash_log_message([v10 UTF8String]);
    sub_1000FD10C(v17);
  }

  id v8 = v7;
  _Block_object_dispose(&v23, 8);

  return v8;
}

- (TVSettingsTapToAddUserManagerDelegate)delegate
{
  return (TVSettingsTapToAddUserManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (SFAuthenticateAccountsService)authService
{
  return self->_authService;
}

- (void)setAuthService:(id)a3
{
}

- (NSString)personaIdentifier
{
  return self->_personaIdentifier;
}

- (void)setPersonaIdentifier:(id)a3
{
}

- (UMUserPersonaContext)initialPersonaContext
{
  return self->_initialPersonaContext;
}

- (void)setInitialPersonaContext:(id)a3
{
}

- (BOOL)isNewPersona
{
  return self->_isNewPersona;
}

- (void)setIsNewPersona:(BOOL)a3
{
  self->_isNewPersona = a3;
}

- (int64_t)userProfileType
{
  return self->_userProfileType;
}

- (void)setUserProfileType:(int64_t)a3
{
  self->_userProfileType = a3;
}

- (NSArray)signedInAccounts
{
  return self->_signedInAccounts;
}

- (void)setSignedInAccounts:(id)a3
{
}

- (NSArray)homeUserIdentifiers
{
  return self->_homeUserIdentifiers;
}

- (void)setHomeUserIdentifiers:(id)a3
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

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (TVCSHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
}

- (PBSUserProfile)addedUserProfile
{
  return self->_addedUserProfile;
}

- (void)setAddedUserProfile:(id)a3
{
}

- (BOOL)isVoiceProfileAvailable
{
  return self->_isVoiceProfileAvailable;
}

- (void)setIsVoiceProfileAvailable:(BOOL)a3
{
  self->_isVoiceProfileAvailable = a3;
}

- (NSString)preferredLanguageCode
{
  return self->_preferredLanguageCode;
}

- (void)setPreferredLanguageCode:(id)a3
{
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
}

- (NSArray)preferredLanguages
{
  return self->_preferredLanguages;
}

- (void)setPreferredLanguages:(id)a3
{
}

- (void).cxx_destruct
{
}

@end