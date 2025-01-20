@interface MSDConfigurationProfile
- (MSDConfigurationProfile)initWithDefaultProfile;
- (MSDConfigurationProfile)initWithDemoModeProfile;
- (MSDConfigurationProfile)initWithFile:(id)a3 andIdentifier:(id)a4;
- (NSString)profileIdentifier;
- (NSString)profilePath;
- (id)getProfileData;
- (id)getSupervisedRestrictions;
- (void)setProfileIdentifier:(id)a3;
- (void)setProfilePath:(id)a3;
@end

@implementation MSDConfigurationProfile

- (MSDConfigurationProfile)initWithFile:(id)a3 andIdentifier:(id)a4
{
  id v6 = a3;
  v7 = (__CFString *)a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MSDConfigurationProfile;
  v8 = -[MSDConfigurationProfile init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[MSDConfigurationProfile setProfilePath:](v8, "setProfilePath:", v6);
    if (-[__CFString isEqualToString:]( v7,  "isEqualToString:",  @"com.apple.mobilestoredemo.demoBundleProfile"))
    {

      v7 = @"com.apple.mobilestoredemo.demoProfile.standardPreferences";
    }

    -[MSDConfigurationProfile setProfileIdentifier:](v9, "setProfileIdentifier:", v7);
  }

  return v9;
}

- (MSDConfigurationProfile)initWithDefaultProfile
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MSDConfigurationProfile;
  v2 = -[MSDConfigurationProfile init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[MSDConfigurationProfile setProfilePath:](v2, "setProfilePath:", 0LL);
    -[MSDConfigurationProfile setProfileIdentifier:]( v3,  "setProfileIdentifier:",  @"com.apple.mobilestoredemo.defaultProfile");
  }

  return v3;
}

- (MSDConfigurationProfile)initWithDemoModeProfile
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MSDConfigurationProfile;
  v2 = -[MSDConfigurationProfile init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[MSDConfigurationProfile setProfilePath:](v2, "setProfilePath:", 0LL);
    -[MSDConfigurationProfile setProfileIdentifier:]( v3,  "setProfileIdentifier:",  @"com.apple.mobilestoredemo.demoMode");
  }

  return v3;
}

- (id)getProfileData
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDConfigurationProfile profileIdentifier](self, "profileIdentifier"));
  unsigned int v4 = [v3 isEqualToString:@"com.apple.mobilestoredemo.defaultProfile"];

  if (v4)
  {
    uint64_t v5 = dword_100123A98;
    id v6 = aXmlVersion10En;
    return (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v6,  v5));
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDConfigurationProfile profileIdentifier](self, "profileIdentifier"));
  unsigned int v8 = [v7 isEqualToString:@"com.apple.mobilestoredemo.demoMode"];

  if (v8)
  {
    uint64_t v5 = dword_1001240F4;
    id v6 = aXmlVersion10En_0;
    return (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v6,  v5));
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDConfigurationProfile profileIdentifier](self, "profileIdentifier"));
  if ([v10 isEqualToString:@"com.apple.mobilestoredemo.demoProfile.standardPreferences"])
  {

LABEL_9:
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDConfigurationProfile profilePath](self, "profilePath"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v13));

    return v14;
  }

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDConfigurationProfile profileIdentifier](self, "profileIdentifier"));
  unsigned int v12 = [v11 isEqualToString:@"com.apple.mobilestoredemo.mdmProfile.dockLayout"];

  if (v12) {
    goto LABEL_9;
  }
  id v15 = sub_10003A95C();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDConfigurationProfile profileIdentifier](self, "profileIdentifier"));
    int v18 = 138543362;
    v19 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "getProfileData called for unknown profile type: %{public}@",  (uint8_t *)&v18,  0xCu);
  }

  return 0LL;
}

- (id)getSupervisedRestrictions
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDConfigurationProfile profileIdentifier](self, "profileIdentifier"));
  unsigned int v5 = [v4 isEqualToString:@"com.apple.mobilestoredemo.demoProfile.supervisedRestrictions"];

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDConfigurationProfile profilePath](self, "profilePath"));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v6));
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"PayloadContent"]);

    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id obj = v8;
    id v24 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v24)
    {
      uint64_t v23 = *(void *)v31;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v31 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v25 = v9;
          v10 = *(void **)(*((void *)&v30 + 1) + 8 * v9);
          __int128 v26 = 0u;
          __int128 v27 = 0u;
          __int128 v28 = 0u;
          __int128 v29 = 0u;
          id v11 = v10;
          id v12 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v27;
            do
            {
              for (i = 0LL; i != v13; i = (char *)i + 1)
              {
                if (*(void *)v27 != v14) {
                  objc_enumerationMutation(v11);
                }
                v16 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
                if (([v16 containsString:@"Payload"] & 1) == 0)
                {
                  v17 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v16]);
                  uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSNumber, v18);
                  if ((objc_opt_isKindOfClass(v17, v19) & 1) != 0)
                  {
                    CFTypeID v20 = CFGetTypeID(v17);
                    if (v20 == CFBooleanGetTypeID()) {
                      -[NSMutableDictionary MCSetBoolRestriction:value:]( v3,  "MCSetBoolRestriction:value:",  v16,  [v17 BOOLValue]);
                    }
                  }
                }
              }

              id v13 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }

            while (v13);
          }

          uint64_t v9 = v25 + 1;
        }

        while ((id)(v25 + 1) != v24);
        id v24 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      }

      while (v24);
    }
  }

  return v3;
}

- (NSString)profileIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setProfileIdentifier:(id)a3
{
}

- (NSString)profilePath
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setProfilePath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end