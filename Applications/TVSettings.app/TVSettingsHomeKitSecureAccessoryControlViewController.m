@interface TVSettingsHomeKitSecureAccessoryControlViewController
- (TVSettingsHomeKitSecureAccessoryControlViewController)init;
- (TVSettingsUserProfileListFacade)userProfilesFacade;
- (id)loadSettingGroups;
- (id)title;
- (void)_selectedAllowedRemotes:(int64_t)a3;
- (void)_selectedItem:(id)a3;
- (void)setUserProfilesFacade:(id)a3;
@end

@implementation TVSettingsHomeKitSecureAccessoryControlViewController

- (TVSettingsHomeKitSecureAccessoryControlViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsHomeKitSecureAccessoryControlViewController;
  v2 = -[TVSettingsHomeKitSecureAccessoryControlViewController init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___TVSettingsUserProfileListFacade);
    userProfilesFacade = v2->_userProfilesFacade;
    v2->_userProfilesFacade = v3;
  }

  return v2;
}

- (id)title
{
  return (id)TSKLocString(@"HomeKitUnlockSecureAccessoriesTitle");
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsHomeKitFacade sharedInstance](&OBJC_CLASS___TVSettingsHomeKitFacade, "sharedInstance"));
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10008FEC8;
  v8[3] = &unk_1001911B0;
  id v4 = v3;
  id v9 = v4;
  objc_copyWeak(&v10, &location);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v4,  @"allowedRemoteTypes",  v8));
  v12 = v5;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

- (void)_selectedItem:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsHomeKitFacade sharedInstance](&OBJC_CLASS___TVSettingsHomeKitFacade, "sharedInstance"));
  id v6 = [v5 secureAccessoryAllowedRemotes];

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 representedObject]);
  id v8 = [v7 integerValue];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    id v18 = v6;
    __int16 v19 = 2048;
    id v20 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Changing allowed remotes value from %ld to %ld",  buf,  0x16u);
  }

  if ((uint64_t)v8 <= (uint64_t)v6)
  {
    -[TVSettingsHomeKitSecureAccessoryControlViewController _selectedAllowedRemotes:]( self,  "_selectedAllowedRemotes:",  v8);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Request to reduce security of allowed remotes, prompting for iCloud password",  buf,  2u);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfileListFacade primaryUser](self->_userProfilesFacade, "primaryUser"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 iCloudUsername]);
    BOOL v11 = v10 == 0LL;

    if (v11)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000F9AC4(v9);
      }
    }

    else
    {
      id v12 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationTVContext);
      [v12 setServiceType:5];
      [v12 setShouldAllowAppleIDCreation:0];
      v13 = (void *)objc_claimAutoreleasedReturnValue([v9 iCloudUsername]);
      [v12 setUsername:v13];

      [v12 setIsUsernameEditable:0];
      [v12 setPresentingViewController:self];
      [v12 setAuthenticationType:2];
      [v12 setIsEphemeral:1];
      objc_initWeak((id *)buf, self);
      v14 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationController);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_100090354;
      v15[3] = &unk_1001926C0;
      objc_copyWeak(v16, (id *)buf);
      v16[1] = v8;
      -[AKAppleIDAuthenticationController authenticateWithContext:completion:]( v14,  "authenticateWithContext:completion:",  v12,  v15);

      objc_destroyWeak(v16);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)_selectedAllowedRemotes:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsHomeKitFacade sharedInstance](&OBJC_CLASS___TVSettingsHomeKitFacade, "sharedInstance"));
  [v5 setSecureAccessoryAllowedRemotes:a3];

  -[TVSettingsHomeKitSecureAccessoryControlViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
}

- (TVSettingsUserProfileListFacade)userProfilesFacade
{
  return self->_userProfilesFacade;
}

- (void)setUserProfilesFacade:(id)a3
{
}

- (void).cxx_destruct
{
}

@end