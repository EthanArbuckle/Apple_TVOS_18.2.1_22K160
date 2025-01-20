@interface TVSettingsIMAccountsFacade
- (BOOL)faceTimeAirDropContactsEnabled;
- (BOOL)faceTimeEnabled;
- (BOOL)faceTimeNotificationsEnabled;
- (BOOL)isExpanseSupported;
- (BOOL)isFaceTimeSupported;
- (TVSettingsIMAccountsFacade)init;
- (TVSettingsIMAccountsFacade)initWithUserProfilesFacade:(id)a3;
- (TVSettingsUser)primaryUser;
- (TVSettingsUserProfileListFacade)userProfilesFacade;
- (id)_existingFaceTimeAccount;
- (int64_t)faceTimeSignInStatus;
- (void)_accountRegistrationStatusChanged:(id)a3;
- (void)_offerToRestartWithPresentingViewController:(id)a3;
- (void)_signOutOfFaceTime;
- (void)_updateCapabilities;
- (void)_updateFaceTimeEnabled:(BOOL)a3 presentingViewController:(id)a4;
- (void)_updateFaceTimeStatus;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setFaceTimeAirDropContactsEnabled:(BOOL)a3;
- (void)setFaceTimeAirDropContactsEnabled:(BOOL)a3 presentingViewController:(id)a4;
- (void)setFaceTimeEnabled:(BOOL)a3 presentingViewController:(id)a4;
- (void)setFaceTimeNotificationsEnabled:(BOOL)a3;
- (void)setPrimaryUser:(id)a3;
- (void)setUserProfilesFacade:(id)a3;
@end

@implementation TVSettingsIMAccountsFacade

- (TVSettingsIMAccountsFacade)init
{
  v3 = objc_alloc_init(&OBJC_CLASS___TVSettingsUserProfileListFacade);
  v4 = -[TVSettingsIMAccountsFacade initWithUserProfilesFacade:](self, "initWithUserProfilesFacade:", v3);

  return v4;
}

- (TVSettingsIMAccountsFacade)initWithUserProfilesFacade:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVSettingsIMAccountsFacade;
  v6 = -[TVSettingsIMAccountsFacade init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userProfilesFacade, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfileListFacade primaryUser](v7->_userProfilesFacade, "primaryUser"));
    primaryUser = v7->_primaryUser;
    v7->_primaryUser = (TVSettingsUser *)v8;

    -[TVSettingsIMAccountsFacade _updateCapabilities](v7, "_updateCapabilities");
    -[TVSettingsIMAccountsFacade _updateFaceTimeStatus](v7, "_updateFaceTimeStatus");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v10 addObserver:v7 selector:"_accountRegistrationStatusChanged:" name:IMAccountRegistrationStatusChangedNotification object:0];

    -[TVSettingsUserProfileListFacade addObserver:forKeyPath:options:context:]( v7->_userProfilesFacade,  "addObserver:forKeyPath:options:context:",  v7,  @"primaryUser",  1LL,  off_1001DF628);
  }

  return v7;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  -[TVSettingsUserProfileListFacade removeObserver:forKeyPath:context:]( self->_userProfilesFacade,  "removeObserver:forKeyPath:context:",  self,  @"primaryUser",  off_1001DF628);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsIMAccountsFacade;
  -[TVSettingsIMAccountsFacade dealloc](&v4, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001DF628 == a6)
  {
    id obj = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfileListFacade primaryUser](self->_userProfilesFacade, "primaryUser", a3, a4, a5));
    v7 = (void *)objc_claimAutoreleasedReturnValue([obj identifier]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUser identifier](self->_primaryUser, "identifier"));
    unsigned __int8 v9 = [v7 isEqualToString:v8];

    if ((v9 & 1) == 0)
    {
      -[TVSettingsIMAccountsFacade _signOutOfFaceTime](self, "_signOutOfFaceTime");
      objc_storeStrong((id *)&self->_primaryUser, obj);
      -[TVSettingsIMAccountsFacade _updateCapabilities](self, "_updateCapabilities");
    }
  }

  else
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___TVSettingsIMAccountsFacade;
    -[TVSettingsIMAccountsFacade observeValueForKeyPath:ofObject:change:context:]( &v11,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)setFaceTimeEnabled:(BOOL)a3 presentingViewController:(id)a4
{
}

- (void)setFaceTimeNotificationsEnabled:(BOOL)a3
{
  self->_faceTimeNotificationsEnabled = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v4 setBool:self->_faceTimeNotificationsEnabled forKey:@"TVSettingsFaceTimeNotificationsEnabledKey"];
}

- (void)_offerToRestartWithPresentingViewController:(id)a3
{
  id v3 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  0LL,  @"Restart for AirDrop changes to take effect?",  1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  @"Restart",  1LL,  &stru_10018F648));
  [v6 addAction:v4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  @"Not Now",  0LL,  &stru_10018F668));
  [v6 addAction:v5];
  [v3 presentViewController:v6 animated:1 completion:0];
}

- (void)setFaceTimeAirDropContactsEnabled:(BOOL)a3 presentingViewController:(id)a4
{
  BOOL v4 = a3;
  self->_faceTimeAirDropContactsEnabled = a3;
  id v6 = a4;
  uint64_t v8 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.sharingd");
  v7 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.Sharing");
  if (v4)
  {
    -[NSUserDefaults setValue:forKey:](v8, "setValue:forKey:", @"Contacts Only", @"DiscoverableMode");
    -[NSUserDefaults setBool:forKey:](v7, "setBool:forKey:", 1LL, @"AlwaysAutoAccept");
  }

  else
  {
    -[NSUserDefaults removeObjectForKey:](v8, "removeObjectForKey:", @"DiscoverableMode");
    -[NSUserDefaults removeObjectForKey:](v7, "removeObjectForKey:", @"AlwaysAutoAccept");
  }

  -[TVSettingsIMAccountsFacade _offerToRestartWithPresentingViewController:]( self,  "_offerToRestartWithPresentingViewController:",  v6);
}

- (void)_updateCapabilities
{
  primaryUser = self->_primaryUser;
  char v4 = MGGetBoolAnswer(@"venice", a2);
  -[TVSettingsIMAccountsFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"isExpanseSupported");
  -[TVSettingsIMAccountsFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"isFaceTimeSupported");
  if (primaryUser) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 0;
  }
  self->_isExpanseSupported = v5;
  self->_isFaceTimeSupported = 0;
  -[TVSettingsIMAccountsFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"isExpanseSupported");
  -[TVSettingsIMAccountsFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"isFaceTimeSupported");
}

- (void)_updateFaceTimeStatus
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsIMAccountsFacade _existingFaceTimeAccount](self, "_existingFaceTimeAccount"));
  self->_faceTimeEnabled = [v3 registrationStatus] == (id)5;

  char v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  self->_faceTimeNotificationsEnabled = [v4 BOOLForKey:@"TVSettingsFaceTimeNotificationsEnabledKey"];

  uint64_t v8 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.sharingd");
  BOOL v5 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.Sharing");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults stringForKey:](v8, "stringForKey:", @"DiscoverableMode"));
  unsigned __int8 v7 = [v6 isEqualToString:@"Contacts Only"];

  self->_faceTimeAirDropContactsEnabled = v7 & -[NSUserDefaults BOOLForKey:]( v5,  "BOOLForKey:",  @"AlwaysAutoAccept");
  self->_faceTimeSignInStatus = !self->_faceTimeEnabled;
  -[TVSettingsIMAccountsFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"faceTimeEnabled");
  -[TVSettingsIMAccountsFacade didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"faceTimeNotificationsEnabled");
  -[TVSettingsIMAccountsFacade didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"faceTimeAirDropContactsEnabled");
  -[TVSettingsIMAccountsFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"faceTimeSignInStatus");
}

- (void)_updateFaceTimeEnabled:(BOOL)a3 presentingViewController:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (!v4)
  {
LABEL_7:
    -[TVSettingsIMAccountsFacade _signOutOfFaceTime](self, "_signOutOfFaceTime");
    goto LABEL_8;
  }

  -[TVSettingsIMAccountsFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"faceTimeSignInStatus");
  self->_faceTimeSignInStatus = 2LL;
  -[TVSettingsIMAccountsFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"faceTimeSignInStatus");
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUser iCloudUsername](self->_primaryUser, "iCloudUsername"));

  if (!v7)
  {
    id v11 = sub_100026C38();
    objc_super v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000F6EF8((id *)&self->_primaryUser, v12);
    }

    goto LABEL_7;
  }

  id v8 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationTVContext);
  [v8 setServiceType:5];
  [v8 setShouldAllowAppleIDCreation:0];
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUser iCloudUsername](self->_primaryUser, "iCloudUsername"));
  [v8 setUsername:v9];

  [v8 setIsUsernameEditable:0];
  [v8 setPresentingViewController:v6];
  [v8 setAuthenticationType:2];
  [v8 setIsEphemeral:1];
  objc_initWeak(&location, self);
  v10 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationController);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100026C78;
  v13[3] = &unk_10018F690;
  objc_copyWeak(&v14, &location);
  -[AKAppleIDAuthenticationController authenticateWithContext:completion:]( v10,  "authenticateWithContext:completion:",  v8,  v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

LABEL_8:
}

- (void)_signOutOfFaceTime
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMAccountController sharedInstance](&OBJC_CLASS___IMAccountController, "sharedInstance"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvs_faceTimeAccounts"));

  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v10 = sub_100026C38();
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v19 = v9;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Removing FaceTime account: %@", buf, 0xCu);
        }

        objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(+[IMAccountController sharedInstance](&OBJC_CLASS___IMAccountController, "sharedInstance"));
        [v12 deleteAccount:v9];
      }

      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }

    while (v6);
  }

  -[TVSettingsIMAccountsFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"faceTimeEnabled");
  -[TVSettingsIMAccountsFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"faceTimeSignInStatus");
  self->_faceTimeEnabled = 0;
  self->_faceTimeSignInStatus = 1LL;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v13 setBool:0 forKey:@"TVSettingsFaceTimeEnabledKey"];

  -[TVSettingsIMAccountsFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"faceTimeEnabled");
  -[TVSettingsIMAccountsFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"faceTimeSignInStatus");
}

- (id)_existingFaceTimeAccount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUser iCloudUsername](self->_primaryUser, "iCloudUsername"));
  if (v2)
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMAccountController sharedInstance](&OBJC_CLASS___IMAccountController, "sharedInstance", 0LL));
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvs_faceTimeAccounts"));

    id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v15;
      while (2)
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
          uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 login]);
          if (v9)
          {
            id v10 = (void *)v9;
            id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 login]);
            id v12 = [v11 rangeOfString:v2];

            if (v12 != (id)0x7FFFFFFFFFFFFFFFLL)
            {
              id v5 = v8;
              goto LABEL_14;
            }
          }
        }

        id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

- (void)_accountRegistrationStatusChanged:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsIMAccountsFacade _existingFaceTimeAccount](self, "_existingFaceTimeAccount"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
  unsigned int v8 = [v5 isEqualToString:v7];

  if (v8)
  {
    switch((unint64_t)[v4 registrationStatus])
    {
      case 0xFFFFFFFFFFFFFFFFLL:
        id v9 = sub_100026C38();
        id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v28 = 136315138;
          v29 = "-[TVSettingsIMAccountsFacade _accountRegistrationStatusChanged:]";
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s FaceTime registration failed",  (uint8_t *)&v28,  0xCu);
        }

        -[TVSettingsIMAccountsFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"faceTimeEnabled");
        -[TVSettingsIMAccountsFacade willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"faceTimeSignInStatus");
        self->_faceTimeEnabled = 0;
        self->_faceTimeSignInStatus = 1LL;
        id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
        id v12 = v11;
        uint64_t v13 = 0LL;
        goto LABEL_16;
      case 1uLL:
        id v14 = sub_100026C38();
        __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          int v28 = 136315138;
          v29 = "-[TVSettingsIMAccountsFacade _accountRegistrationStatusChanged:]";
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s FaceTime account unregistered",  (uint8_t *)&v28,  0xCu);
        }

        -[TVSettingsIMAccountsFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"faceTimeEnabled");
        self->_faceTimeEnabled = 0;
        __int128 v16 = self;
        __int128 v17 = @"faceTimeEnabled";
        goto LABEL_17;
      case 3uLL:
        v18 = (void *)objc_claimAutoreleasedReturnValue([v4 aliasesToRegister]);
        if ([v18 count] || (objc_msgSend(v4, "canSendMessages") & 1) != 0)
        {
          id v19 = [v4 profileValidationStatus];
          if (v19 == (id)3)
          {
            [v4 addAliases:v18];
            [v4 validateAliases:v18];
            [v4 registerAccount];
            goto LABEL_24;
          }

          id v22 = v19;
          id v23 = sub_100026C38();
          v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            int v28 = 136315394;
            v29 = "-[TVSettingsIMAccountsFacade _accountRegistrationStatusChanged:]";
            __int16 v30 = 2048;
            id v31 = v22;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "%s Profile is not validated. Current status: %ld",  (uint8_t *)&v28,  0x16u);
          }
        }

        else
        {
          id v25 = sub_100026C38();
          v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            int v28 = 136315138;
            v29 = "-[TVSettingsIMAccountsFacade _accountRegistrationStatusChanged:]";
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "%s Account was authenticated but there are no aliases to register or messages cannot be sent.",  (uint8_t *)&v28,  0xCu);
          }

          v27 = (void *)objc_claimAutoreleasedReturnValue(+[IMAccountController sharedInstance](&OBJC_CLASS___IMAccountController, "sharedInstance"));
          [v27 deactivateAccount:v4];

          v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMAccountController sharedInstance](&OBJC_CLASS___IMAccountController, "sharedInstance"));
          -[os_log_s deleteAccount:](v24, "deleteAccount:", v4);
        }

LABEL_24:
        break;
      case 5uLL:
        id v20 = sub_100026C38();
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          int v28 = 136315138;
          v29 = "-[TVSettingsIMAccountsFacade _accountRegistrationStatusChanged:]";
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%s FaceTime registration succeeded",  (uint8_t *)&v28,  0xCu);
        }

        -[TVSettingsIMAccountsFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"faceTimeEnabled");
        -[TVSettingsIMAccountsFacade willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"faceTimeSignInStatus");
        self->_faceTimeEnabled = 1;
        self->_faceTimeSignInStatus = 0LL;
        id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
        id v12 = v11;
        uint64_t v13 = 1LL;
LABEL_16:
        [v11 setBool:v13 forKey:@"TVSettingsFaceTimeEnabledKey"];

        -[TVSettingsIMAccountsFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"faceTimeEnabled");
        __int128 v16 = self;
        __int128 v17 = @"faceTimeSignInStatus";
LABEL_17:
        -[TVSettingsIMAccountsFacade didChangeValueForKey:](v16, "didChangeValueForKey:", v17);
        break;
      default:
        break;
    }
  }
}

- (BOOL)isExpanseSupported
{
  return self->_isExpanseSupported;
}

- (BOOL)isFaceTimeSupported
{
  return self->_isFaceTimeSupported;
}

- (BOOL)faceTimeEnabled
{
  return self->_faceTimeEnabled;
}

- (BOOL)faceTimeNotificationsEnabled
{
  return self->_faceTimeNotificationsEnabled;
}

- (BOOL)faceTimeAirDropContactsEnabled
{
  return self->_faceTimeAirDropContactsEnabled;
}

- (void)setFaceTimeAirDropContactsEnabled:(BOOL)a3
{
  self->_faceTimeAirDropContactsEnabled = a3;
}

- (int64_t)faceTimeSignInStatus
{
  return self->_faceTimeSignInStatus;
}

- (TVSettingsUserProfileListFacade)userProfilesFacade
{
  return self->_userProfilesFacade;
}

- (void)setUserProfilesFacade:(id)a3
{
}

- (TVSettingsUser)primaryUser
{
  return self->_primaryUser;
}

- (void)setPrimaryUser:(id)a3
{
}

- (void).cxx_destruct
{
}

@end