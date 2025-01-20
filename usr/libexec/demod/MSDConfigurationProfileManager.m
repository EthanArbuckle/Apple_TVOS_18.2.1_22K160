@interface MSDConfigurationProfileManager
+ (id)sharedInstance;
- (BOOL)installConfigurationProfile:(id)a3;
- (BOOL)installConfigurationProfileWithData:(id)a3;
- (BOOL)installDefaultConfigurationProfile;
- (BOOL)installDemoModeConfigurationProfile;
- (BOOL)installRestrictionsConfigurationProfile:(id)a3;
- (BOOL)isConfigurationProfileInstalled:(id)a3;
- (BOOL)uninstallConfigurationProfile:(id)a3;
- (BOOL)uninstallConfigurationProfileIfNeeded:(id)a3;
- (BOOL)uninstallRestrictionsConfigurationProfile;
- (MSDConfigurationProfileManager)init;
- (NSMutableArray)configurationProfilesSupported;
- (void)setConfigurationProfilesSupported:(id)a3;
- (void)uninstallAllDemoBundleConfigurationProfiles;
@end

@implementation MSDConfigurationProfileManager

+ (id)sharedInstance
{
  if (qword_100125218 != -1) {
    dispatch_once(&qword_100125218, &stru_1000F9290);
  }
  return (id)qword_100125210;
}

- (MSDConfigurationProfileManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MSDConfigurationProfileManager;
  v2 = -[MSDConfigurationProfileManager init](&v7, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[MSDConfigurationProfileManager setConfigurationProfilesSupported:](v2, "setConfigurationProfilesSupported:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue( -[MSDConfigurationProfileManager configurationProfilesSupported]( v2,  "configurationProfilesSupported"));
    [v4 addObject:@"com.apple.mobilestoredemo.demoProfile.standardPreferences"];

    v5 = (void *)objc_claimAutoreleasedReturnValue( -[MSDConfigurationProfileManager configurationProfilesSupported]( v2,  "configurationProfilesSupported"));
    [v5 addObject:@"com.apple.mobilestoredemo.demoProfile.supervisedRestrictions"];
  }

  return v2;
}

- (BOOL)installDefaultConfigurationProfile
{
  v3 = -[MSDConfigurationProfile initWithDefaultProfile]( objc_alloc(&OBJC_CLASS___MSDConfigurationProfile),  "initWithDefaultProfile");
  LOBYTE(self) = -[MSDConfigurationProfileManager installConfigurationProfile:]( self,  "installConfigurationProfile:",  v3);

  return (char)self;
}

- (BOOL)installDemoModeConfigurationProfile
{
  v3 = -[MSDConfigurationProfile initWithDemoModeProfile]( objc_alloc(&OBJC_CLASS___MSDConfigurationProfile),  "initWithDemoModeProfile");
  LOBYTE(self) = -[MSDConfigurationProfileManager installConfigurationProfile:]( self,  "installConfigurationProfile:",  v3);

  return (char)self;
}

- (BOOL)installConfigurationProfile:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 profileIdentifier]);
  if (([v5 isEqualToString:@"com.apple.mobilestoredemo.demoProfile.standardPreferences"] & 1) != 0 || objc_msgSend(v5, "isEqualToString:", @"com.apple.mobilestoredemo.defaultProfile"))
  {
    id v6 = sub_10003A95C();
    objc_super v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543362;
      v19 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Installing configuration profile: %{public}@",  (uint8_t *)&v18,  0xCu);
    }

    if (-[MSDConfigurationProfileManager uninstallConfigurationProfileIfNeeded:]( self,  "uninstallConfigurationProfileIfNeeded:",  v5))
    {
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 getProfileData]);
      if (v8)
      {
        if (-[MSDConfigurationProfileManager installConfigurationProfileWithData:]( self,  "installConfigurationProfileWithData:",  v8))
        {
          BOOL v9 = 1;
          goto LABEL_9;
        }

        id v17 = sub_10003A95C();
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_100090148();
        }
      }

      else
      {
        id v15 = sub_10003A95C();
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_10009011C();
        }
      }
    }

    else
    {
      id v14 = sub_10003A95C();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100090174();
      }
    }

- (void)uninstallAllDemoBundleConfigurationProfiles
{
  id v3 = sub_10003A95C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Uninstalling all existing configuration profiles.",  buf,  2u);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[MSDConfigurationProfileManager configurationProfilesSupported]( self,  "configurationProfilesSupported"));
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v17;
    *(void *)&__int128 v7 = 138543362LL;
    __int128 v15 = v7;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        unsigned int v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if (!objc_msgSend( v11,  "isEqualToString:",  @"com.apple.mobilestoredemo.demoProfile.standardPreferences",  v15))
        {
          if ([v11 isEqualToString:@"com.apple.mobilestoredemo.demoProfile.supervisedRestrictions"])
          {
            if (-[MSDConfigurationProfileManager uninstallRestrictionsConfigurationProfile]( self,  "uninstallRestrictionsConfigurationProfile"))
            {
              continue;
            }

- (BOOL)uninstallConfigurationProfileIfNeeded:(id)a3
{
  id v4 = a3;
  if (-[MSDConfigurationProfileManager isConfigurationProfileInstalled:](self, "isConfigurationProfileInstalled:", v4))
  {
    id v5 = sub_10003A95C();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Uninstalling existing configuration profile.",  v9,  2u);
    }

    BOOL v7 = -[MSDConfigurationProfileManager uninstallConfigurationProfile:](self, "uninstallConfigurationProfile:", v4);
  }

  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)installConfigurationProfileWithData:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  id v12 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 installProfileData:v3 outError:&v12]);

  id v6 = v12;
  id v7 = sub_10003A95C();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Successfully installed configuration profile.",  v11,  2u);
    }
  }

  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    sub_1000901A0();
  }

  return v5 != 0LL;
}

- (BOOL)uninstallConfigurationProfile:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  [v5 removeProfileWithIdentifier:v4];

  unsigned int v6 = -[MSDConfigurationProfileManager isConfigurationProfileInstalled:](self, "isConfigurationProfileInstalled:", v4);
  if (v6)
  {
    id v8 = sub_10003A95C();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100090200();
    }
  }

  return v6 ^ 1;
}

- (BOOL)isConfigurationProfileInstalled:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000059C8;
  v8[3] = &unk_1000F92B8;
  v10 = &v11;
  unsigned int v6 = v4;
  uint64_t v9 = v6;
  [v5 isProfileInstalledWithIdentifier:v3 completion:v8];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v5) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v5;
}

- (BOOL)installRestrictionsConfigurationProfile:(id)a3
{
  BOOL v3 = 1;
  char v11 = 1;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  id v10 = 0LL;
  [v5 applyRestrictionDictionary:v4 clientType:@"com.apple.mobilestoredemod" clientUUID:@"com.apple.mobilestoredemod" localizedClientDescription:0 localizedWarningMessage:0 outRestrictionCh anged:&v11 outEffectiveSettingsChanged:0 outError:&v10];

  id v6 = v10;
  if (!v11)
  {
    id v7 = sub_10003A95C();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10009028C();
    }

    BOOL v3 = v11 != 0;
  }

  return v3;
}

- (BOOL)uninstallRestrictionsConfigurationProfile
{
  BOOL v2 = 1;
  char v9 = 1;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  id v8 = 0LL;
  [v3 applyRestrictionDictionary:0 clientType:@"com.apple.mobilestoredemod" clientUUID:@"com.apple.mobilestoredemod" localizedClientDescription:0 localizedWarningMessage:0 outRestrictionCh anged:&v9 outEffectiveSettingsChanged:0 outError:&v8];
  id v4 = v8;
  if (!v9)
  {
    id v5 = sub_10003A95C();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000902EC();
    }

    BOOL v2 = v9 != 0;
  }

  return v2;
}

- (NSMutableArray)configurationProfilesSupported
{
  return self->_configurationProfilesSupported;
}

- (void)setConfigurationProfilesSupported:(id)a3
{
}

- (void).cxx_destruct
{
}

@end