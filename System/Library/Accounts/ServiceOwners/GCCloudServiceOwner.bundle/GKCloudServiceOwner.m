@interface GKCloudServiceOwner
+ (NSArray)supportedServices;
- (ACAccountStore)accountStore;
- (BOOL)BOOLFromAuthenticationContext:(id)a3 key:(id)a4;
- (GKCloudServiceOwner)initWithAccountStore:(id)a3;
- (PBSUserProfileManager)profileManager;
- (id)DSIDForAccount:(id)a3 service:(id)a4;
- (id)_gameCenterAccountType;
- (id)accountForService:(id)a3;
- (id)accountMatchingUsername:(id)a3 serviceType:(id)a4;
- (id)accountsForService:(id)a3;
- (id)altDSIDForAccount:(id)a3 service:(id)a4;
- (id)nameComponentsForAccount:(id)a3 service:(id)a4;
- (void)authenticateWithContext:(id)a3 completion:(id)a4;
- (void)setAccountStore:(id)a3;
- (void)setProfileManager:(id)a3;
- (void)signInService:(id)a3 withContext:(id)a4 completion:(id)a5;
- (void)signOutService:(id)a3 withContext:(id)a4 completion:(id)a5;
@end

@implementation GKCloudServiceOwner

+ (NSArray)supportedServices
{
  uint64_t v3 = AIDAServiceTypeGameCenter;
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v3,  1LL));
}

- (GKCloudServiceOwner)initWithAccountStore:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___GKCloudServiceOwner;
  v6 = -[GKCloudServiceOwner init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountStore, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
    profileManager = v7->_profileManager;
    v7->_profileManager = (PBSUserProfileManager *)v8;
  }

  return v7;
}

- (id)_gameCenterAccountType
{
  return -[ACAccountStore accountTypeWithAccountTypeIdentifier:]( self->_accountStore,  "accountTypeWithAccountTypeIdentifier:",  ACAccountTypeIdentifierGameCenter);
}

- (id)accountForService:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudServiceOwner profileManager](self, "profileManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 userProfilesSnapshot]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 primaryUserProfile]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 gameCenterAltDSID]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudServiceOwner accountsForService:](self, "accountsForService:", v4));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1BE8;
  v14[3] = &unk_41E0;
  v14[4] = self;
  id v15 = v4;
  id v16 = v8;
  id v10 = v8;
  id v11 = v4;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 _gkFirstObjectPassingTest:v14]);

  return v12;
}

- (id)accountMatchingUsername:(id)a3 serviceType:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudServiceOwner accountsForService:](self, "accountsForService:", a4));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1D40;
  v14[3] = &unk_4208;
  id v8 = v6;
  id v15 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 _gkFilterWithBlock:v14]);
  if ((unint64_t)[v9 count] >= 2)
  {
    if (!os_log_GKGeneral) {
      id v10 = (id)GKOSLoggers();
    }
    id v11 = (os_log_s *)os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_2910(v11);
    }
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);

  return v12;
}

- (id)accountsForService:(id)a3
{
  accountStore = self->_accountStore;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKCloudServiceOwner _gameCenterAccountType](self, "_gameCenterAccountType", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore accountsWithAccountType:](accountStore, "accountsWithAccountType:", v4));

  return v5;
}

- (void)signInService:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  id v11 = objc_alloc(&OBJC_CLASS___NSUserDefaults);
  v12 = -[NSUserDefaults initWithSuiteName:](v11, "initWithSuiteName:", GKDaemonIdentifier);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 signInContexts]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:AIDAServiceTypeGameCenter]);
  unsigned int v15 = -[GKCloudServiceOwner BOOLFromAuthenticationContext:key:]( self,  "BOOLFromAuthenticationContext:key:",  v14,  @"settingsToggleSignIn");

  id v16 = (os_log_s *)os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v17 = (id)GKOSLoggers();
    id v16 = (os_log_s *)os_log_GKGeneral;
  }

  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v44 = v15;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Attempting to sign in with opt in flag of %d", buf, 8u);
  }

  if (([v9 shouldForceOperation] | v15) == 1)
  {
    -[NSUserDefaults removeObjectForKey:](v12, "removeObjectForKey:", GKOptedOutOfGameCenter);
  }

  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v12, "objectForKey:", GKOptedOutOfGameCenter));
    unsigned int v19 = [v18 BOOLValue];

    if (v19)
    {
      v20 = (os_log_s *)os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        id v21 = (id)GKOSLoggers();
        v20 = (os_log_s *)os_log_GKGeneral;
      }

      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_INFO,  "Game Center cloud service owner is ignoring callback after authentication since user has opted out of Game Center.",  buf,  2u);
      }

      uint64_t v22 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  GKInternalErrorDomain,  100LL,  0LL));
      goto LABEL_18;
    }
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  if (![v23 isAccountModificationRestricted])
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
    unsigned int v25 = [v24 isGameCenterRestricted];

    if (v25) {
      goto LABEL_16;
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue([v9 authenticationResults]);
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:AKAuthenticationAppleIDAuthModeKey]);
    v30 = (char *)[v29 unsignedIntegerValue];

    if (v30 == (_BYTE *)&dword_0 + 2)
    {
      uint64_t v26 = 4LL;
      goto LABEL_17;
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue([v9 authenticationResults]);
    v27 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:AKAuthenticationUsernameKey]);

    v32 = (void *)objc_claimAutoreleasedReturnValue( -[GKCloudServiceOwner accountMatchingUsername:serviceType:]( self,  "accountMatchingUsername:serviceType:",  v27,  v8));
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKCloudServiceOwner.m",  201LL,  "-[GKCloudServiceOwner signInService:withContext:completion:]"));
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v33));

    if (v32)
    {
      if (([v9 shouldForceOperation] & 1) == 0)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[GKDaemonProxy proxyForLocalPlayer](&OBJC_CLASS___GKDaemonProxy, "proxyForLocalPlayer"));
        v36 = (void *)objc_claimAutoreleasedReturnValue([v35 utilityServicePrivate]);
        [v36 updateNotificationTopicsForcefully:0];

        v10[2](v10, 1LL, 0LL);
        goto LABEL_27;
      }

      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472LL;
      v40[2] = sub_228C;
      v40[3] = &unk_4258;
      v40[4] = self;
      id v41 = v8;
      id v42 = v9;
      [v34 perform:v40];
    }

    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_2328;
    v37[3] = &unk_4280;
    v37[4] = self;
    id v38 = v9;
    v39 = v10;
    [v34 notifyOnMainQueueWithBlock:v37];

LABEL_27:
    goto LABEL_19;
  }

LABEL_16:
  uint64_t v26 = 10LL;
LABEL_17:
  uint64_t v22 = objc_claimAutoreleasedReturnValue( +[NSError userErrorForCode:underlyingError:]( &OBJC_CLASS___NSError,  "userErrorForCode:underlyingError:",  v26,  0LL));
LABEL_18:
  v27 = (void *)v22;
  v10[2](v10, 0LL, v22);
LABEL_19:
}

- (void)authenticateWithContext:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 authenticationResults]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:AKAuthenticationUsernameKey]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 authenticationResults]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:AKAuthenticationPasswordKey]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 authenticationResults]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:AKAuthenticationAlternateDSIDKey]);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_2474;
  v14[3] = &unk_42A8;
  id v15 = v5;
  id v13 = v5;
  +[GKLocalPlayer authenticatePlayerWithUsername:password:altDSID:completionHandler:]( &OBJC_CLASS___GKLocalPlayer,  "authenticatePlayerWithUsername:password:altDSID:completionHandler:",  v8,  v10,  v12,  v14);
}

- (void)signOutService:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(id, void, void *))a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  unsigned int v10 = [v9 isAccountModificationRestricted];

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError userErrorForCode:underlyingError:]( &OBJC_CLASS___NSError,  "userErrorForCode:underlyingError:",  10LL,  0LL));
    v8[2](v8, 0LL, v11);
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKLocalPlayer localPlayer](&OBJC_CLASS___GKLocalPlayer, "localPlayer"));
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v7 signOutContexts]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:AIDAServiceTypeGameCenter]);
      BOOL v14 = -[GKCloudServiceOwner BOOLFromAuthenticationContext:key:]( self,  "BOOLFromAuthenticationContext:key:",  v13,  @"settingsToggleSignOut");

      id v15 = (os_log_s *)os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        id v16 = (id)GKOSLoggers();
        id v15 = (os_log_s *)os_log_GKGeneral;
      }

      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        BOOL v20 = v14;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Signing out with opt out flag of %d", buf, 8u);
      }

      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_26A4;
      v17[3] = &unk_42D0;
      v18 = v8;
      [v11 signOutAndOptOut:v14 completionHandler:v17];
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_2950();
      }
      v8[2](v8, 0LL, 0LL);
    }
  }
}

- (BOOL)BOOLFromAuthenticationContext:(id)a3 key:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0) {
    unsigned __int8 v8 = [v5 BOOLValueFromKey:v6 defaultValue:0];
  }
  else {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)nameComponentsForAccount:(id)a3 service:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKLocalPlayer localPlayer](&OBJC_CLASS___GKLocalPlayer, "localPlayer", a3, a4));
  id v5 = objc_alloc_init(&OBJC_CLASS___NSPersonNameComponents);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 firstName]);
  -[NSPersonNameComponents setGivenName:](v5, "setGivenName:", v6);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 lastName]);
  -[NSPersonNameComponents setFamilyName:](v5, "setFamilyName:", v7);

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v4 alias]);
  -[NSPersonNameComponents setNickname:](v5, "setNickname:", v8);

  return v5;
}

- (id)DSIDForAccount:(id)a3 service:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", @"dsid", a4));
  if ([v4 length]) {
    id v5 = v4;
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (id)altDSIDForAccount:(id)a3 service:(id)a4
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"GKEnvironment"]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"altDSID-%@", v5));

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v6]);
  return v7;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (PBSUserProfileManager)profileManager
{
  return self->_profileManager;
}

- (void)setProfileManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end