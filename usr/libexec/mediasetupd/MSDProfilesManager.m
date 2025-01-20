@interface MSDProfilesManager
+ (id)fetchInstalledMediaSetupProfilesManagedDefaults;
- (MSDProfilesManager)init;
- (MSDProfilesManagerDelegate)delegate;
- (void)dealloc;
- (void)profileConnectionDidReceiveProfileListChangedNotification:(id)a3 userInfo:(id)a4;
- (void)setDelegate:(id)a3;
- (void)syncStatusOfInstalledProfiles;
@end

@implementation MSDProfilesManager

- (MSDProfilesManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MSDProfilesManager;
  v2 = -[MSDProfilesManager init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    [v3 registerObserver:v2];
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MSDProfilesManager;
  -[MSDProfilesManager dealloc](&v4, "dealloc");
}

- (void)syncStatusOfInstalledProfiles
{
  id v3 = sub_10003E9DC();
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Fetching Installed Profiles",  (uint8_t *)&v25,  2u);
  }

  id v5 = [(id)objc_opt_class(self) fetchInstalledMediaSetupProfilesManagedDefaults];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v6 count];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  id v9 = [v8 developerProfilesCount];

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  [v10 setDeveloperProfilesCount:v7];

  if (v7)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
    unsigned int v12 = [v11 profilesEverInstalled];

    id v13 = sub_10003E9DC();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (!v12 || v7 >= v9)
    {
      if (v15)
      {
        id v24 = [v6 count];
        int v25 = 134217984;
        id v26 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Found %lu matching profiles installed on device",  (uint8_t *)&v25,  0xCu);
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProfilesManager delegate](self, "delegate"));
      id v23 = [v6 copy];
      [v22 profilesManager:self didAddProfiles:v23];
      goto LABEL_18;
    }

    if (v15)
    {
      LOWORD(v25) = 0;
      v16 = "A profile was removed from the device";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v25, 2u);
      goto LABEL_14;
    }

    goto LABEL_14;
  }

  id v17 = sub_10003E9DC();
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "No Profiles matching com.apple.mediasetup.developer domain",  (uint8_t *)&v25,  2u);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  unsigned int v20 = [v19 profilesEverInstalled];

  if (v20)
  {
    id v21 = sub_10003E9DC();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      v16 = "Profile was installed on device, and we received a state change";
      goto LABEL_13;
    }

+ (id)fetchInstalledMediaSetupProfilesManagedDefaults
{
  v2 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 installedProfilesWithFilterFlags:3]);

  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id obj = v4;
  id v27 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v40;
    uint64_t v5 = kMediaSetupTestingProfileDefaultsIdentifier;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v40 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = v6;
        id v7 = *(void **)(*((void *)&v39 + 1) + 8 * v6);
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        id v29 = (id)objc_claimAutoreleasedReturnValue([v7 payloads]);
        id v8 = [v29 countByEnumeratingWithState:&v35 objects:v44 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v30 = *(void *)v36;
          do
          {
            for (i = 0LL; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v36 != v30) {
                objc_enumerationMutation(v29);
              }
              v11 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
              uint64_t v12 = objc_opt_class(&OBJC_CLASS___MCDefaultsPayload);
              id v13 = v11;
              if ((objc_opt_isKindOfClass(v13, v12) & 1) != 0) {
                v14 = v13;
              }
              else {
                v14 = 0LL;
              }
              id v15 = v14;

              __int128 v33 = 0u;
              __int128 v34 = 0u;
              __int128 v31 = 0u;
              __int128 v32 = 0u;
              v16 = (void *)objc_claimAutoreleasedReturnValue([v15 domains]);
              id v17 = [v16 countByEnumeratingWithState:&v31 objects:v43 count:16];
              if (v17)
              {
                id v18 = v17;
                uint64_t v19 = *(void *)v32;
                do
                {
                  for (j = 0LL; j != v18; j = (char *)j + 1)
                  {
                    if (*(void *)v32 != v19) {
                      objc_enumerationMutation(v16);
                    }
                    id v21 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)j);
                    if ([v21 containsString:v5])
                    {
                      v22 = (void *)objc_claimAutoreleasedReturnValue([v15 defaultsForDomain:v21]);
                      objc_msgSend(v2, "na_safeAddObject:", v22);
                    }
                  }

                  id v18 = [v16 countByEnumeratingWithState:&v31 objects:v43 count:16];
                }

                while (v18);
              }
            }

            id v9 = [v29 countByEnumeratingWithState:&v35 objects:v44 count:16];
          }

          while (v9);
        }

        uint64_t v6 = v28 + 1;
      }

      while ((id)(v28 + 1) != v27);
      id v27 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
    }

    while (v27);
  }

  id v23 = [v2 copy];
  return v23;
}

- (void)profileConnectionDidReceiveProfileListChangedNotification:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10003E9DC();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Profile List changed notification received for profileconnection..%@ with userinfo..%@",  (uint8_t *)&v10,  0x16u);
  }

  -[MSDProfilesManager syncStatusOfInstalledProfiles](self, "syncStatusOfInstalledProfiles");
}

- (MSDProfilesManagerDelegate)delegate
{
  return (MSDProfilesManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end