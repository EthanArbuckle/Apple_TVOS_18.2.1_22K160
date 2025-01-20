@interface IDSDSignInResponder
- (BOOL)_gameCenterShouldSigninOnModify;
- (BOOL)_shouldServiceBeDisabledOnSignOut:(id)a3 forDomain:(int64_t)a4;
- (BOOL)_shouldServiceBeEnabledOnSignIn:(id)a3 forDomain:(int64_t)a4;
- (FTPasswordManager)passwordManager;
- (IDSDAccountController)accountController;
- (IDSDRegistrationControl)registrationControl;
- (IDSDServiceController)serviceController;
- (IDSDSignInResponder)initWithAccountController:(id)a3 serviceController:(id)a4 passwordManager:(id)a5 registrationConductor:(id)a6 deviceSupport:(id)a7 registrationControl:(id)a8 registrationController:(id)a9 userStore:(id)a10;
- (IDSDSignInResponder)initWithUserStore:(id)a3;
- (IDSDSignInResponderDeviceSupport)deviceSupport;
- (IDSRegistrationConductor)registrationConductor;
- (IDSRegistrationController)registrationController;
- (IDSServerBag)serverBag;
- (IDSUserStore)userStore;
- (id)accountStore;
- (void)_modifyDomainWithUsername:(id)a3;
- (void)_modifyGameCenterAccountPropertiesForUsername:(id)a3;
- (void)_signInDomain:(int64_t)a3 withUsername:(id)a4 authToken:(id)a5 password:(id)a6 accountInfo:(id)a7 accountStatus:(id)a8 handles:(id)a9;
- (void)_signOutDomain:(int64_t)a3;
- (void)_updateDomainWithUsername:(id)a3 accountInfo:(id)a4;
- (void)gameCenterModifyForUserName:(id)a3;
- (void)gameCenterSignInWithUsername:(id)a3 authToken:(id)a4 password:(id)a5 accountInfo:(id)a6 accountStatus:(id)a7 handles:(id)a8;
- (void)gameCenterSignOut;
- (void)iCloudModifyForUsername:(id)a3;
- (void)iCloudSignInWithUsername:(id)a3 authToken:(id)a4 password:(id)a5 accountInfo:(id)a6 accountStatus:(id)a7 handles:(id)a8;
- (void)iCloudSignOut;
- (void)iCloudUpdateForUsername:(id)a3 accountInfo:(id)a4;
- (void)iTunesSignInWithUsername:(id)a3 authToken:(id)a4 password:(id)a5 accountInfo:(id)a6 accountStatus:(id)a7 handles:(id)a8;
- (void)iTunesSignOut;
- (void)setServerBag:(id)a3;
- (void)updateUserWithOldUsername:(id)a3 newUsername:(id)a4;
@end

@implementation IDSDSignInResponder

- (IDSDSignInResponder)initWithUserStore:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 registrationConductor]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FTPasswordManager sharedInstance](&OBJC_CLASS___FTPasswordManager, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDRegistrationControl sharedInstance](&OBJC_CLASS___IDSDRegistrationControl, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationController sharedInstance](&OBJC_CLASS___IDSRegistrationController, "sharedInstance"));
  v13 = -[IDSDSignInResponder initWithAccountController:serviceController:passwordManager:registrationConductor:deviceSupport:registrationControl:registrationController:userStore:]( self,  "initWithAccountController:serviceController:passwordManager:registrationConductor:deviceSupport:registrationCo ntrol:registrationController:userStore:",  v7,  v8,  v9,  v6,  v10,  v11,  v12,  v4);

  return v13;
}

- (IDSDSignInResponder)initWithAccountController:(id)a3 serviceController:(id)a4 passwordManager:(id)a5 registrationConductor:(id)a6 deviceSupport:(id)a7 registrationControl:(id)a8 registrationController:(id)a9 userStore:(id)a10
{
  id v29 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  id v25 = a7;
  id v24 = a8;
  id v23 = a9;
  id v17 = a10;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___IDSDSignInResponder;
  v18 = -[IDSDSignInResponder init](&v30, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_accountController, a3);
    objc_storeStrong((id *)&v19->_serviceController, a4);
    objc_storeStrong((id *)&v19->_passwordManager, a5);
    objc_storeStrong((id *)&v19->_registrationConductor, a6);
    objc_storeStrong((id *)&v19->_deviceSupport, a7);
    objc_storeStrong((id *)&v19->_registrationControl, a8);
    objc_storeStrong((id *)&v19->_registrationController, a9);
    objc_storeStrong((id *)&v19->_userStore, a10);
    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
    serverBag = v19->_serverBag;
    v19->_serverBag = (IDSServerBag *)v20;
  }

  return v19;
}

- (id)accountStore
{
  return objc_alloc_init((Class)IMWeakLinkClass(@"ACAccountStore", @"Accounts"));
}

- (BOOL)_gameCenterShouldSigninOnModify
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder serverBag](self, "serverBag"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"gamecenter-signin-on-modify"]);

  if (v3 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0)) {
    unsigned __int8 v6 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

- (BOOL)_shouldServiceBeEnabledOnSignIn:(id)a3 forDomain:(int64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 3LL:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder serviceController](self, "serviceController"));
      id v9 = (id)objc_claimAutoreleasedReturnValue([v8 gameCenterService]);
LABEL_9:
      unsigned __int8 v7 = v9 == v6;

      goto LABEL_10;
    case 2LL:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder serviceController](self, "serviceController"));
      id v9 = (id)objc_claimAutoreleasedReturnValue([v8 iTunesService]);
      goto LABEL_9;
    case 1LL:
      unsigned __int8 v7 = [v6 iCloudBasedService];
      goto LABEL_10;
  }

- (BOOL)_shouldServiceBeDisabledOnSignOut:(id)a3 forDomain:(int64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 3LL:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder serviceController](self, "serviceController"));
      id v9 = (id)objc_claimAutoreleasedReturnValue([v8 gameCenterService]);
LABEL_9:
      unsigned __int8 v7 = v9 == v6;

      goto LABEL_10;
    case 2LL:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder serviceController](self, "serviceController"));
      id v9 = (id)objc_claimAutoreleasedReturnValue([v8 iTunesService]);
      goto LABEL_9;
    case 1LL:
      unsigned __int8 v7 = [v6 iCloudBasedService];
      goto LABEL_10;
  }

- (void)iCloudSignInWithUsername:(id)a3 authToken:(id)a4 password:(id)a5 accountInfo:(id)a6 accountStatus:(id)a7 handles:(id)a8
{
}

- (void)iCloudUpdateForUsername:(id)a3 accountInfo:(id)a4
{
}

- (void)iCloudModifyForUsername:(id)a3
{
}

- (void)iCloudSignOut
{
}

- (void)iTunesSignInWithUsername:(id)a3 authToken:(id)a4 password:(id)a5 accountInfo:(id)a6 accountStatus:(id)a7 handles:(id)a8
{
}

- (void)iTunesSignOut
{
}

- (void)gameCenterSignInWithUsername:(id)a3 authToken:(id)a4 password:(id)a5 accountInfo:(id)a6 accountStatus:(id)a7 handles:(id)a8
{
}

- (void)gameCenterSignOut
{
}

- (void)gameCenterModifyForUserName:(id)a3
{
}

- (void)updateUserWithOldUsername:(id)a3 newUsername:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder passwordManager](self, "passwordManager"));
  [v8 updatePreviousUsername:v6 toNewUsername:v7];

  id v9 = self;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder serviceController](self, "serviceController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allServices]);

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id obj = v11;
  id v12 = [obj countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v12)
  {
    id v14 = v12;
    uint64_t v15 = *(void *)v27;
    *(void *)&__int128 v13 = 138413058LL;
    __int128 v24 = v13;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog iCloud](&OBJC_CLASS___IMRGLog, "iCloud", v24));
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);
          *(_DWORD *)buf = 138412802;
          id v31 = v6;
          __int16 v32 = 2112;
          id v33 = v7;
          __int16 v34 = 2112;
          v35 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Checking if loginID update is needed for existing account on service { oldUsername: %@, newUsername: %@, ser viceIdentifier: %@ }",  buf,  0x20u);
        }

        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder accountController](v9, "accountController"));
        v21 = (void *)objc_claimAutoreleasedReturnValue([v20 existingAccountOnService:v17 withType:1 loginID:v6]);

        if (v21)
        {
          v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog iCloud](&OBJC_CLASS___IMRGLog, "iCloud"));
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            id v23 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);
            *(_DWORD *)buf = v24;
            id v31 = v6;
            __int16 v32 = 2112;
            id v33 = v7;
            __int16 v34 = 2112;
            v35 = v23;
            __int16 v36 = 2112;
            v37 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Updating loginID on existing account { oldUsername: %@, newUsername: %@, serviceIdentifier: %@, account: %@ }",  buf,  0x2Au);
          }

          [v21 setLoginID:v7];
        }
      }

      id v14 = [obj countByEnumeratingWithState:&v26 objects:v38 count:16];
    }

    while (v14);
  }
}

- (void)_signInDomain:(int64_t)a3 withUsername:(id)a4 authToken:(id)a5 password:(id)a6 accountInfo:(id)a7 accountStatus:(id)a8 handles:(id)a9
{
  id v107 = a4;
  id v98 = a5;
  id v95 = a6;
  id v96 = a7;
  v94 = (__CFString *)a8;
  id v97 = a9;
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog iCloud](&OBJC_CLASS___IMRGLog, "iCloud"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    else {
      v16 = *(&off_1008FDD48 + a3);
    }
    id v17 = [v95 length];
    *(_DWORD *)buf = 138413570;
    v18 = @"YES";
    v128 = v16;
    __int16 v129 = 2112;
    if (!v17) {
      v18 = @"NO";
    }
    id v130 = v107;
    __int16 v131 = 2112;
    id v132 = v98;
    __int16 v133 = 2112;
    v134 = v18;
    __int16 v135 = 2112;
    v136 = v94;
    __int16 v137 = 2112;
    id v138 = v97;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "IDS responding to sign-in { domain: %@, username: %@, token: %@, hasPassword: %@, accountStatus: %@, handles: %@ }",  buf,  0x3Eu);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder accountController](self, "accountController"));
  unsigned int v20 = [v19 hasHardDeregistered];

  if (v20)
  {
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog iCloud](&OBJC_CLASS___IMRGLog, "iCloud"));
    v22 = v107;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Device has hard deregistered -- ignoring sign-in",  buf,  2u);
    }

    __int128 v24 = v97;
    id v23 = v98;
    goto LABEL_84;
  }

  v22 = v107;
  if (![v107 length])
  {
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog iCloud](&OBJC_CLASS___IMRGLog, "iCloud"));
    __int128 v24 = v97;
    id v23 = v98;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "No username provided -- ignoring sign-in",  buf,  2u);
    }

    goto LABEL_84;
  }

  if (a3 == 1)
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder deviceSupport](self, "deviceSupport"));
    unsigned __int8 v26 = [v25 isGreenTea];

    if ((v26 & 1) == 0)
    {
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder registrationControl](self, "registrationControl"));
      [v27 updateRegistrationType:0 toState:2 error:0];
    }

    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder registrationController](self, "registrationController"));
    [v28 noteiCloudSignInTime];

    v22 = v107;
  }

  uint64_t v29 = objc_claimAutoreleasedReturnValue([v96 objectForKey:kIDSServiceDefaultsSelfHandleKey]);
  objc_super v30 = (void *)objc_claimAutoreleasedReturnValue([v96 objectForKey:kIDSServiceDefaultsAuthorizationIDKey]);
  v93 = (os_log_s *)v29;
  if ([v98 length])
  {
    id v31 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder passwordManager](self, "passwordManager"));
    __int16 v32 = v22;
    id v33 = v31;
    [v31 setAuthTokenForProfileID:v30 username:v32 service:IDSServiceKey authToken:v98 selfHandle:v29 accountStatus:&off_100947578 outRequestID:0 completionBlock:0];
LABEL_23:
    id v34 = v97;
    goto LABEL_24;
  }

  if ([v95 length])
  {
    id v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder passwordManager](self, "passwordManager"));
    [v33 setPasswordForProfileID:v30 username:v107 service:IDSServiceKey password:v95 outRequestID:0 completionBlock:0];
    goto LABEL_23;
  }

  id v34 = v97;
  if (!v94) {
    goto LABEL_25;
  }
  id v91 = -[__CFString integerValue](v94, "integerValue");
  if (v91)
  {
    if (v91 != (id)5103 && v91 != (id)5100) {
      goto LABEL_25;
    }
  }

  v92 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog iCloud](&OBJC_CLASS___IMRGLog, "iCloud"));
  if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v128 = v94;
    _os_log_impl( (void *)&_mh_execute_header,  v92,  OS_LOG_TYPE_DEFAULT,  "Saving status to the account { accountStatus: %@ }",  buf,  0xCu);
  }

  id v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder passwordManager](self, "passwordManager"));
  [v33 setAccountStatus:v94 forProfileID:v30 username:v107 service:IDSServiceKey];
LABEL_24:

LABEL_25:
  if (v34)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder passwordManager](self, "passwordManager"));
    [v35 setHandlesForProfileID:v30 username:v107 service:IDSServiceKey handles:v34];
  }

  v109 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v96);
  __int128 v120 = 0u;
  __int128 v121 = 0u;
  __int128 v122 = 0u;
  __int128 v123 = 0u;
  __int16 v36 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder serviceController](self, "serviceController"));
  v37 = (void *)objc_claimAutoreleasedReturnValue([v36 allServices]);

  id obj = v37;
  id v38 = [v37 countByEnumeratingWithState:&v120 objects:v126 count:16];
  v22 = v107;
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v121;
    v41 = _NSConcreteStackBlock;
    p_cache = &OBJC_CLASS___IDSActivityPushListener.cache;
    v100 = v30;
    int64_t v101 = a3;
    uint64_t v99 = *(void *)v121;
    do
    {
      v43 = 0LL;
      id v102 = v39;
      do
      {
        if (*(void *)v121 != v40) {
          objc_enumerationMutation(obj);
        }
        v44 = *(__CFString **)(*((void *)&v120 + 1) + 8LL * (void)v43);
        if (-[IDSDSignInResponder _shouldServiceBeEnabledOnSignIn:forDomain:]( self,  "_shouldServiceBeEnabledOnSignIn:forDomain:",  v44,  a3))
        {
          v106 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          v45 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder accountController](self, "accountController"));
          v46 = (IDSDAccount *)objc_claimAutoreleasedReturnValue([v45 existingAccountOnService:v44 withType:1 loginID:v22]);

          if (v46)
          {
            -[IDSDAccount _updateAccountWithAccountInfo:](v46, "_updateAccountWithAccountInfo:", v109);
            v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog iCloud](&OBJC_CLASS___IMRGLog, "iCloud"));
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              v48 = v46;
              v49 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount smallDescription](v46, "smallDescription"));
              *(_DWORD *)buf = 138412546;
              v128 = v44;
              __int16 v129 = 2112;
              id v130 = v49;
              _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Updated existing account with account info { service: %@, account: %@ }",  buf,  0x16u);

              goto LABEL_39;
            }
          }

          else
          {
            v50 = objc_alloc(&OBJC_CLASS___IDSDAccount);
            v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
            v48 = -[IDSDAccount initWithLoginID:service:uniqueID:accountType:accountConfig:]( v50,  "initWithLoginID:service:uniqueID:accountType:accountConfig:",  v22,  v44,  v51,  1LL,  v109);

            v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog iCloud](&OBJC_CLASS___IMRGLog, "iCloud"));
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            {
              v53 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount smallDescription](v48, "smallDescription"));
              *(_DWORD *)buf = 138412546;
              v128 = v44;
              __int16 v129 = 2112;
              id v130 = v53;
              _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "Created new account for sign-in { service: %@, account: %@ }",  buf,  0x16u);
            }

            v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder accountController](self, "accountController"));
            -[os_log_s addAccount:](v47, "addAccount:", v48);
LABEL_39:
            v46 = v48;
          }

          v54 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder deviceSupport](self, "deviceSupport"));
          if ([v54 registrationSupported])
          {
            v55 = v46;
            v56 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder registrationController](self, "registrationController"));
            if (([v56 systemSupportsPhoneNumberRegistration] & 1) == 0)
            {

              v46 = v55;
              goto LABEL_47;
            }

            unsigned int v57 = -[__CFString wantsPhoneNumberAccount](v44, "wantsPhoneNumberAccount");

            v46 = v55;
            if (v57)
            {
              v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog iCloud](&OBJC_CLASS___IMRGLog, "iCloud"));
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "Triggering DS realm reload",  buf,  2u);
              }

              v54 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder userStore](self, "userStore"));
              [v54 reloadUsersForRealm:1];
              goto LABEL_47;
            }
          }

          else
          {
LABEL_47:
          }

          v105 = v43;
          v59 = v41;
          -[NSMutableArray addObject:](v106, "addObject:", v46);
          v60 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
          v104 = v46;
          v61 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](v46, "service"));
          v62 = (void *)objc_claimAutoreleasedReturnValue([v60 linkedServicesForService:v61]);

          __int128 v118 = 0u;
          __int128 v119 = 0u;
          __int128 v116 = 0u;
          __int128 v117 = 0u;
          id v108 = v62;
          id v63 = [v108 countByEnumeratingWithState:&v116 objects:v125 count:16];
          if (v63)
          {
            id v64 = v63;
            uint64_t v65 = *(void *)v117;
            do
            {
              for (i = 0LL; i != v64; i = (char *)i + 1)
              {
                if (*(void *)v117 != v65) {
                  objc_enumerationMutation(v108);
                }
                v67 = *(__CFString **)(*((void *)&v116 + 1) + 8LL * (void)i);
                if (-[__CFString disabledOnTinkerWatch](v67, "disabledOnTinkerWatch"))
                {
                  v68 = (void *)objc_claimAutoreleasedReturnValue([p_cache + 408 sharedInstance]);
                  unsigned __int8 v69 = [v68 isCurrentDeviceTinkerConfiguredWatch];

                  if ((v69 & 1) != 0) {
                    continue;
                  }
                }

                v70 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder accountController](self, "accountController"));
                v71 = (IDSDAccount *)objc_claimAutoreleasedReturnValue([v70 existingAccountOnService:v67 withType:1 loginID:v22]);

                if (v71)
                {
                  -[IDSDAccount _updateAccountWithAccountInfo:](v71, "_updateAccountWithAccountInfo:", v109);
                  v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog iCloud](&OBJC_CLASS___IMRGLog, "iCloud"));
                  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                  {
                    v73 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount smallDescription](v71, "smallDescription"));
                    *(_DWORD *)buf = 138412546;
                    v128 = v67;
                    __int16 v129 = 2112;
                    id v130 = v73;
                    _os_log_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_DEFAULT,  "Updated existing linked account with account info { service: %@, account: %@ }",  buf,  0x16u);

                    v22 = v107;
                  }
                }

                else
                {
                  v74 = objc_alloc(&OBJC_CLASS___IDSDAccount);
                  v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
                  v71 = -[IDSDAccount initWithLoginID:service:uniqueID:accountType:accountConfig:]( v74,  "initWithLoginID:service:uniqueID:accountType:accountConfig:",  v22,  v67,  v75,  1LL,  v109);

                  v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog iCloud](&OBJC_CLASS___IMRGLog, "iCloud"));
                  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
                  {
                    v77 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount smallDescription](v71, "smallDescription"));
                    *(_DWORD *)buf = 138412546;
                    v128 = v67;
                    __int16 v129 = 2112;
                    id v130 = v77;
                    _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_DEFAULT,  "Created new linked account for sign-in { service: %@, account: %@ }",  buf,  0x16u);

                    v22 = v107;
                  }

                  v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder accountController](self, "accountController"));
                  -[os_log_s addAccount:](v72, "addAccount:", v71);
                }
              }

              id v64 = [v108 countByEnumeratingWithState:&v116 objects:v125 count:16];
            }

            while (v64);
          }

          __int128 v114 = 0u;
          __int128 v115 = 0u;
          __int128 v112 = 0u;
          __int128 v113 = 0u;
          v78 = v106;
          id v79 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v78,  "countByEnumeratingWithState:objects:count:",  &v112,  v124,  16LL);
          v41 = v59;
          if (v79)
          {
            id v80 = v79;
            uint64_t v81 = *(void *)v113;
            do
            {
              for (j = 0LL; j != v80; j = (char *)j + 1)
              {
                if (*(void *)v113 != v81) {
                  objc_enumerationMutation(v78);
                }
                v83 = *(void **)(*((void *)&v112 + 1) + 8LL * (void)j);
                v84 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder accountController](self, "accountController"));
                v85 = (void *)objc_claimAutoreleasedReturnValue([v83 uniqueID]);
                [v84 enableAccountWithUniqueID:v85];

                v86 = (void *)objc_claimAutoreleasedReturnValue([v83 linkedAccounts]);
                v41 = v59;
                v111[0] = v59;
                v111[1] = 3221225472LL;
                v111[2] = sub_1001F7988;
                v111[3] = &unk_1008F9CE0;
                v111[4] = self;
                objc_msgSend(v86, "__imForEach:", v111);

                unsigned int v87 = [v83 registrationStatus];
                if (v87 != -1 && v87 != 5) {
                  [v83 registerAccount];
                }
                v89 = (void *)objc_claimAutoreleasedReturnValue([v83 linkedAccounts]);
                v110[0] = v59;
                v110[1] = 3221225472LL;
                v110[2] = sub_1001F79EC;
                v110[3] = &unk_1008F9CE0;
                v110[4] = v83;
                objc_msgSend(v89, "__imForEach:", v110);
              }

              id v80 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v78,  "countByEnumeratingWithState:objects:count:",  &v112,  v124,  16LL);
            }

            while (v80);
          }

          v22 = v107;
          objc_super v30 = v100;
          a3 = v101;
          id v39 = v102;
          uint64_t v40 = v99;
          p_cache = (void **)(&OBJC_CLASS___IDSActivityPushListener + 16);
          v43 = v105;
        }

        v43 = (char *)v43 + 1;
      }

      while (v43 != v39);
      id v39 = [obj countByEnumeratingWithState:&v120 objects:v126 count:16];
    }

    while (v39);
  }

  id v23 = v98;
  if (a3 == 1)
  {
    id v90 = [v22 length];
    if (v98)
    {
      if (v90) {
        -[IDSDSignInResponder _reregisterAndReProvisionForEDULoginWithUsername:]( self,  "_reregisterAndReProvisionForEDULoginWithUsername:",  v22);
      }
    }
  }

  __int128 v24 = v97;
  v21 = v93;
LABEL_84:
}

- (void)_signOutDomain:(int64_t)a3
{
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog iCloud](&OBJC_CLASS___IMRGLog, "iCloud"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    else {
      id v6 = *(&off_1008FDD48 + a3);
    }
    *(_DWORD *)buf = 138412290;
    v50 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "IDS responding to sign-out { domain: %@ }",  buf,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder accountController](self, "accountController"));
  unsigned int v8 = [v7 hasHardDeregistered];

  if (v8)
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog iCloud](&OBJC_CLASS___IMRGLog, "iCloud"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Device has hard deregistered -- ignoring sign-out",  buf,  2u);
    }

    goto LABEL_34;
  }

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder serviceController](self, "serviceController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allServices]);

  id obj = v11;
  id v12 = [v11 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v44;
    uint64_t v33 = *(void *)v44;
    int64_t v34 = a3;
    do
    {
      uint64_t v15 = 0LL;
      id v35 = v13;
      do
      {
        if (*(void *)v44 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v43 + 1) + 8LL * (void)v15);
        if (-[IDSDSignInResponder _shouldServiceBeDisabledOnSignOut:forDomain:]( self,  "_shouldServiceBeDisabledOnSignOut:forDomain:",  v16,  a3))
        {
          v37 = v15;
          id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder accountController](self, "accountController"));
          v18 = (void *)objc_claimAutoreleasedReturnValue([v17 accountsOnService:v16]);
          id v19 = [v18 _copyForEnumerating];

          __int128 v41 = 0u;
          __int128 v42 = 0u;
          __int128 v39 = 0u;
          __int128 v40 = 0u;
          id v20 = v19;
          id v21 = [v20 countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (v21)
          {
            id v22 = v21;
            uint64_t v23 = *(void *)v40;
            do
            {
              for (i = 0LL; i != v22; i = (char *)i + 1)
              {
                if (*(void *)v40 != v23) {
                  objc_enumerationMutation(v20);
                }
                id v25 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
                unsigned int v26 = [v25 accountType];
                __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog iCloud](&OBJC_CLASS___IMRGLog, "iCloud"));
                BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
                if (v26 == 1)
                {
                  if (v28)
                  {
                    uint64_t v29 = (__CFString *)objc_claimAutoreleasedReturnValue([v25 smallDescription]);
                    *(_DWORD *)buf = 138412290;
                    v50 = v29;
                    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Removing account for sign-out { account: %@ }",  buf,  0xCu);
                  }

                  objc_super v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder accountController](self, "accountController"));
                  [v30 removeAccount:v25];

                  id v31 = (void *)objc_claimAutoreleasedReturnValue([v25 linkedAccounts]);
                  v38[0] = _NSConcreteStackBlock;
                  v38[1] = 3221225472LL;
                  v38[2] = sub_1001F7E90;
                  v38[3] = &unk_1008F9CE0;
                  v38[4] = self;
                  objc_msgSend(v31, "__imForEach:", v38);
                }

                else
                {
                  if (v28)
                  {
                    __int16 v32 = (__CFString *)objc_claimAutoreleasedReturnValue([v25 smallDescription]);
                    *(_DWORD *)buf = 138412290;
                    v50 = v32;
                    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Skipping removal of non-Apple ID account for sign-out { account: %@ }",  buf,  0xCu);
                  }
                }
              }

              id v22 = [v20 countByEnumeratingWithState:&v39 objects:v47 count:16];
            }

            while (v22);
          }

          uint64_t v14 = v33;
          a3 = v34;
          id v13 = v35;
          uint64_t v15 = v37;
        }

        uint64_t v15 = (char *)v15 + 1;
      }

      while (v15 != v13);
      id v13 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }

    while (v13);
  }

  if (a3 == 1)
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder userStore](self, "userStore"));
    -[os_log_s reloadUsersForRealm:](v9, "reloadUsersForRealm:", 1LL);
LABEL_34:
  }

- (void)_updateDomainWithUsername:(id)a3 accountInfo:(id)a4
{
  id v63 = a3;
  id v6 = a4;
  uint64_t Delta = IDSAuthenticationDelegateUpdateTimeOfLastAuthenticationResponseAndGetDelta();
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(Delta);
  id v9 = &IMInsertBoolsToXPCDictionary_ptr;
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v91 = v63;
    __int16 v92 = 2112;
    id v93 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "IDS responding to updated account info { username: %@, accountInfo: %@ }",  buf,  0x16u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder accountController](self, "accountController"));
  unsigned int v12 = [v11 hasHardDeregistered];

  if (!v12)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder accountStore](self, "accountStore"));
    if (qword_1009BEE48 != -1) {
      dispatch_once(&qword_1009BEE48, &stru_1008FDD08);
    }
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 accountTypeWithAccountTypeIdentifier:qword_1009BEE50]);
    if (v13)
    {
      __int128 v83 = 0u;
      __int128 v84 = 0u;
      __int128 v85 = 0u;
      __int128 v86 = 0u;
      id v15 = (id)objc_claimAutoreleasedReturnValue([v14 accountsWithAccountType:v13]);
      id v16 = [v15 countByEnumeratingWithState:&v83 objects:v89 count:16];
      if (v16)
      {
        id v17 = v16;
        v66 = self;
        v60 = v13;
        uint64_t v18 = *(void *)v84;
        while (2)
        {
          for (i = 0LL; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v84 != v18) {
              objc_enumerationMutation(v15);
            }
            id v20 = *(void **)(*((void *)&v83 + 1) + 8LL * (void)i);
            id v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "accountPropertyForKey:", @"primaryAccount", v60));
            unsigned int v22 = [v21 BOOLValue];

            if (v22)
            {
              uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v20 username]);
              unsigned __int8 v24 = [v63 isEqualToIgnoringCase:v23];

              if ((v24 & 1) != 0)
              {
                char v25 = 1;
                goto LABEL_21;
              }
            }
          }

          id v17 = [v15 countByEnumeratingWithState:&v83 objects:v89 count:16];
          if (v17) {
            continue;
          }
          break;
        }

        char v25 = 0;
LABEL_21:
        id v13 = v60;
        self = v66;
      }

      else
      {
        char v25 = 0;
      }

      id v9 = &IMInsertBoolsToXPCDictionary_ptr;
    }

    else
    {
      char v25 = 0;
    }

    unsigned int v26 = _NSConcreteStackBlock;
    v81[0] = _NSConcreteStackBlock;
    v81[1] = 3221225472LL;
    v81[2] = sub_1001F85EC;
    v81[3] = &unk_1008FDCE8;
    id v6 = v6;
    id v82 = v6;
    __int128 v27 = objc_retainBlock(v81);
    BOOL v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    if ((v25 & 1) != 0)
    {
      if (v29)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Update called but for the primary iCloud -- committing update to relevant accounts",  buf,  2u);
      }

      v61 = v13;
      v62 = v8;

      __int128 v79 = 0u;
      __int128 v80 = 0u;
      __int128 v77 = 0u;
      __int128 v78 = 0u;
      objc_super v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder serviceController](self, "serviceController"));
      id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 allServices]);

      id v32 = [v31 countByEnumeratingWithState:&v77 objects:v88 count:16];
      if (v32)
      {
        id v33 = v32;
        uint64_t v34 = *(void *)v78;
        uint64_t v65 = v31;
        v67 = self;
        uint64_t v64 = *(void *)v78;
        do
        {
          id v35 = 0LL;
          id v68 = v33;
          do
          {
            if (*(void *)v78 != v34) {
              objc_enumerationMutation(v31);
            }
            __int16 v36 = *(void **)(*((void *)&v77 + 1) + 8LL * (void)v35);
            if (objc_msgSend(v36, "iCloudBasedService", v61)
              && ![v36 adHocServiceType])
            {
              unsigned __int8 v69 = v35;
              v37 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder accountController](self, "accountController"));
              id v38 = (void *)objc_claimAutoreleasedReturnValue([v37 accountsOnService:v36 withType:1]);
              id v39 = [v38 _copyForEnumerating];

              __int128 v75 = 0u;
              __int128 v76 = 0u;
              __int128 v73 = 0u;
              __int128 v74 = 0u;
              id v40 = v39;
              id v41 = [v40 countByEnumeratingWithState:&v73 objects:v87 count:16];
              if (v41)
              {
                id v42 = v41;
                uint64_t v43 = *(void *)v74;
                do
                {
                  __int128 v44 = 0LL;
                  id v70 = v42;
                  do
                  {
                    if (*(void *)v74 != v43) {
                      objc_enumerationMutation(v40);
                    }
                    __int128 v45 = *(void **)(*((void *)&v73 + 1) + 8LL * (void)v44);
                    if ([v45 accountType] == 1)
                    {
                      __int128 v46 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9[440] iCloud]);
                      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                      {
                        uint64_t v47 = v43;
                        id v48 = v40;
                        v49 = v27;
                        id v50 = v6;
                        v51 = v26;
                        v52 = v9;
                        v53 = (void *)objc_claimAutoreleasedReturnValue([v45 smallDescription]);
                        *(_DWORD *)buf = 138412290;
                        id v91 = v53;
                        _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "Updating matching account (and linked accounts) with account info { account: %@ }",  buf,  0xCu);

                        id v9 = v52;
                        unsigned int v26 = v51;
                        id v6 = v50;
                        __int128 v27 = v49;
                        id v40 = v48;
                        uint64_t v43 = v47;
                        id v42 = v70;
                      }

                      uint64_t v54 = ((uint64_t (*)(void *, void *))v27[2])(v27, v45);
                      v55 = (void *)objc_claimAutoreleasedReturnValue(v54);

                      [v45 _updateAccountWithAccountInfo:v55];
                      v56 = (void *)objc_claimAutoreleasedReturnValue([v45 linkedAccounts]);
                      v71[0] = v26;
                      v71[1] = 3221225472LL;
                      v71[2] = sub_1001F8748;
                      v71[3] = &unk_1008F9CE0;
                      id v6 = v55;
                      id v72 = v6;
                      objc_msgSend(v56, "__imForEach:", v71);
                    }

                    __int128 v44 = (char *)v44 + 1;
                  }

                  while (v42 != v44);
                  id v42 = [v40 countByEnumeratingWithState:&v73 objects:v87 count:16];
                }

                while (v42);
              }

              id v31 = v65;
              self = v67;
              uint64_t v34 = v64;
              id v33 = v68;
              id v35 = v69;
            }

            id v35 = (char *)v35 + 1;
          }

          while (v35 != v33);
          id v33 = [v31 countByEnumeratingWithState:&v77 objects:v88 count:16];
        }

        while (v33);
      }

      unsigned int v8 = v62;
      if (!v62)
      {
        id v13 = v61;
        goto LABEL_53;
      }

      id v57 = objc_alloc(&OBJC_CLASS___IDSRegistrationAuthenticationParametersReceivedMetric);
      [v62 doubleValue];
      BOOL v28 = (os_log_s *)objc_msgSend(v57, "initWithErrorCode:timeIntervalSinceAuthenticationParameterRequest:", 0);
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAWDLogger logger](&OBJC_CLASS___IDSAWDLogger, "logger"));
      [v58 logMetric:v28];

      v59 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
      [v59 logMetric:v28];

      id v13 = v61;
    }

    else if (v29)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Update called but for account other than the primary iCloud -- ignoring update",  buf,  2u);
    }

LABEL_53:
    goto LABEL_54;
  }

  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog iCloud](&OBJC_CLASS___IMRGLog, "iCloud"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  " Device has hard deregistered -- ignoring update",  buf,  2u);
  }

- (void)_modifyDomainWithUsername:(id)a3
{
  id v4 = a3;
  uint64_t v5 = &IMInsertBoolsToXPCDictionary_ptr;
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  id v7 = &off_100717000;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "IDS responding to account modification { username: %@ }",  buf,  0xCu);
  }

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder accountStore](self, "accountStore"));
  if (qword_1009BEE58 != -1) {
    dispatch_once(&qword_1009BEE58, &stru_1008FDD28);
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 accountTypeWithAccountTypeIdentifier:qword_1009BEE60]);
  if (v9)
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue([v8 accountsWithAccountType:v9]);
    id v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v11)
    {
      unsigned int v22 = self;
      uint64_t v12 = *(void *)v24;
      while (2)
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 username]);
          unsigned int v16 = [v4 isEqualToIgnoringCase:v15];

          if (v16)
          {
            id v11 = v14;
            goto LABEL_16;
          }
        }

        id v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v11) {
          continue;
        }
        break;
      }

- (void)_modifyGameCenterAccountPropertiesForUsername:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "IDS responding to account modification for GameCenter domain { username: %@ }",  (uint8_t *)&v19,  0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder passwordManager](self, "passwordManager"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 gameCenterPropertiesFromAccountWithUsername:v4]);

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder serviceController](self, "serviceController"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 gameCenterService]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSignInResponder accountController](self, "accountController"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 existingAccountOnService:v9 withType:1 loginID:v4]);

  if (v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 gameCenterData]);
    unsigned __int8 v13 = [v12 isEqual:v7];
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if ((v13 & 1) != 0)
    {
      if (v15)
      {
        LOWORD(v19) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Account data is up to date with IDS, ignoring notification",  (uint8_t *)&v19,  2u);
      }
    }

    else
    {
      if (v15)
      {
        int v19 = 138412546;
        id v20 = v12;
        __int16 v21 = 2112;
        unsigned int v22 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Initiating a reregister to update Game Center specific user data. Data stored in IDS {%@}, updated data receiv ed from accounts {%@}",  (uint8_t *)&v19,  0x16u);
      }

      [v11 reregister];
    }
  }

  else
  {
    unsigned int v16 = -[IDSDSignInResponder _gameCenterShouldSigninOnModify](self, "_gameCenterShouldSigninOnModify");
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        int v19 = 138412290;
        id v20 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "No GameCenter IDSDAccount found with username {%@}. Trying to sign in.",  (uint8_t *)&v19,  0xCu);
      }

      -[IDSDSignInResponder gameCenterSignInWithUsername:authToken:password:accountInfo:accountStatus:handles:]( self,  "gameCenterSignInWithUsername:authToken:password:accountInfo:accountStatus:handles:",  v4,  0LL,  0LL,  0LL,  0LL,  0LL);
    }

    else
    {
      if (v18)
      {
        int v19 = 138412290;
        id v20 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "No GameCenter IDSDAccount found with username {%@}. Cannot modify.",  (uint8_t *)&v19,  0xCu);
      }
    }
  }
}

- (IDSDAccountController)accountController
{
  return self->_accountController;
}

- (IDSDServiceController)serviceController
{
  return self->_serviceController;
}

- (FTPasswordManager)passwordManager
{
  return self->_passwordManager;
}

- (IDSRegistrationConductor)registrationConductor
{
  return self->_registrationConductor;
}

- (IDSDSignInResponderDeviceSupport)deviceSupport
{
  return self->_deviceSupport;
}

- (IDSDRegistrationControl)registrationControl
{
  return self->_registrationControl;
}

- (IDSRegistrationController)registrationController
{
  return self->_registrationController;
}

- (IDSUserStore)userStore
{
  return self->_userStore;
}

- (IDSServerBag)serverBag
{
  return self->_serverBag;
}

- (void)setServerBag:(id)a3
{
}

- (void).cxx_destruct
{
}

@end