@interface TransparencyConfigBag
- (BOOL)configurationExpired;
- (BOOL)configureFromNetworkBagData:(id)a3 error:(id *)a4;
- (BOOL)configureWithDisk:(id *)a3;
- (BOOL)configured;
- (BOOL)overrideReversePushConfig;
- (BOOL)processConfigBagData:(id)a3 error:(id *)a4;
- (BOOL)shouldSetInternalHeader;
- (BOOL)tapToRadarEnabled;
- (BOOL)validateConfigBagCertificates:(id)a3 error:(id *)a4;
- (BOOL)validateConfigBagEntries:(id)a3 error:(id *)a4;
- (BOOL)validateConfigBagSignature:(id)a3 error:(id *)a4;
- (BOOL)validateConfigEntries:(id)a3 error:(id *)a4;
- (BOOL)writeConfigToDisk:(id)a3 error:(id *)a4;
- (NSDictionary)config;
- (NSDictionary)requiredKeys;
- (NSString)swtCFUDetailsURL;
- (NSURL)directory;
- (SWTSettingsProtocol)swtSettings;
- (TransparencyConfigBag)initWithRequiredKeys:(id)a3 settings:(id)a4 directory:(id)a5 configApp:(unint64_t)a6;
- (TransparencyConfigBag)initWithRequiredKeys:(id)a3 settings:(id)a4 directory:(id)a5 configApp:(unint64_t)a6 swtSettings:(id)a7;
- (TransparencySettingsProtocol)settings;
- (double)doubleForKey:(id)a3;
- (double)expirationTime;
- (id)checkBagKeyClass:(id)a3 keys:(id)a4;
- (id)checkMissingBagKeys:(id)a3 keys:(id)a4;
- (id)configBagFileName;
- (id)configBagRequest;
- (id)configBagURL;
- (id)copyConfigurationBag:(id *)a3;
- (id)readConfigFromDisk:(id *)a3;
- (id)stringForKey:(id)a3;
- (id)urlForKey:(id)a3;
- (unint64_t)configApp;
- (unint64_t)currentEnvironment;
- (unint64_t)getConfigBagEnvironment;
- (unint64_t)overrideReversePushPercentage;
- (unint64_t)percentageForKey:(id)a3;
- (unint64_t)uintegerForKey:(id)a3;
- (void)clearState:(id *)a3;
- (void)configureFromNetworkWithFetcher:(id)a3 completionHandler:(id)a4;
- (void)configureWithFetcher:(id)a3 completionHandler:(id)a4;
- (void)getSettings;
- (void)setConfig:(id)a3;
- (void)setConfigApp:(unint64_t)a3;
- (void)setConfigured:(BOOL)a3;
- (void)setCurrentEnvironment:(unint64_t)a3;
- (void)setDirectory:(id)a3;
- (void)setExpirationTime:(double)a3;
- (void)setOverrideReversePushConfig:(BOOL)a3;
- (void)setOverrideReversePushPercentage:(unint64_t)a3;
- (void)setRequiredKeys:(id)a3;
- (void)setSettings:(id)a3;
- (void)setSwtSettings:(id)a3;
@end

@implementation TransparencyConfigBag

- (unint64_t)getConfigBagEnvironment
{
  unint64_t result = -[TransparencyConfigBag configApp](self, "configApp");
  if (result == 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag swtSettings](self, "swtSettings"));
    unint64_t v7 = (unint64_t)[v6 atEnvironment];

    if (v7 > 9) {
      return 1LL;
    }
    else {
      return qword_10024C588[v7];
    }
  }

  else if (result == 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag settings](self, "settings"));
    id v5 = [v4 getEnvironment];

    return (unint64_t)v5;
  }

  return result;
}

- (id)configBagURL
{
  v3 = -[NSURLComponents initWithString:]( objc_alloc(&OBJC_CLASS___NSURLComponents),  "initWithString:",  @"https://init-kt.apple.com/init/getBag");
  unint64_t v4 = -[TransparencyConfigBag currentEnvironment](self, "currentEnvironment");
  if (v4 == 2)
  {
    if (qword_1002EEDA0 != -1) {
      dispatch_once(&qword_1002EEDA0, &stru_1002883C0);
    }
    unint64_t v7 = (os_log_s *)qword_1002EEDA8;
    if (os_log_type_enabled((os_log_t)qword_1002EEDA8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "requesting QA2 configuration bag", v15, 2u);
    }

    v6 = @"init-kt-qa2.ess.apple.com";
    goto LABEL_13;
  }

  if (v4 == 1)
  {
    if (qword_1002EEDA0 != -1) {
      dispatch_once(&qword_1002EEDA0, &stru_1002883A0);
    }
    id v5 = (os_log_s *)qword_1002EEDA8;
    if (os_log_type_enabled((os_log_t)qword_1002EEDA8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "requesting QA1 configuration bag", v15, 2u);
    }

    v6 = @"init-kt-qa1.ess.apple.com";
LABEL_13:
    -[NSURLComponents setHost:](v3, "setHost:", v6);
  }

  v8 = -[NSURLQueryItem initWithName:value:]( objc_alloc(&OBJC_CLASS___NSURLQueryItem),  "initWithName:value:",  @"ix",  @"3");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag settings](self, "settings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 devicePlatform]);

  v11 = -[NSURLQueryItem initWithName:value:]( objc_alloc(&OBJC_CLASS___NSURLQueryItem),  "initWithName:value:",  @"p",  v10);
  v16[0] = v8;
  v16[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 2LL));
  -[NSURLComponents setQueryItems:](v3, "setQueryItems:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents URL](v3, "URL"));
  return v13;
}

- (id)configBagFileName
{
  unint64_t v2 = -[TransparencyConfigBag currentEnvironment](self, "currentEnvironment");
  if (v2 == 2)
  {
    if (qword_1002EEDA0 != -1) {
      dispatch_once(&qword_1002EEDA0, &stru_100288400);
    }
    id v5 = (os_log_s *)qword_1002EEDA8;
    if (os_log_type_enabled((os_log_t)qword_1002EEDA8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "using QA2 configuration bag", v6, 2u);
    }

    return @"KTConfig-qa2.plist";
  }

  else if (v2 == 1)
  {
    if (qword_1002EEDA0 != -1) {
      dispatch_once(&qword_1002EEDA0, &stru_1002883E0);
    }
    v3 = (os_log_s *)qword_1002EEDA8;
    if (os_log_type_enabled((os_log_t)qword_1002EEDA8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "using QA1 configuration bag", buf, 2u);
    }

    return @"KTConfig-qa1.plist";
  }

  else
  {
    return @"KTConfig.plist";
  }

- (id)configBagRequest
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag configBagURL](self, "configBagURL"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag settings](self, "settings"));
  [v4 uiBlockingNetworkTimeout];
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableURLRequest requestWithURL:cachePolicy:timeoutInterval:]( &OBJC_CLASS___NSMutableURLRequest,  "requestWithURL:cachePolicy:timeoutInterval:",  v3,  0LL));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag settings](self, "settings"));
  LODWORD(v4) = [v6 getBool:kTransparencyFlagUseTestConfig];

  if ((_DWORD)v4)
  {
    [v5 setValue:@"true" forHTTPHeaderField:@"X-Apple-Test-Application"];
    if (qword_1002EEDA0 != -1) {
      dispatch_once(&qword_1002EEDA0, &stru_100288420);
    }
    unint64_t v7 = (os_log_s *)qword_1002EEDA8;
    if (os_log_type_enabled((os_log_t)qword_1002EEDA8, OS_LOG_TYPE_DEBUG))
    {
      __int16 v18 = 0;
      v8 = "requesting test configuration bag";
      v9 = (uint8_t *)&v18;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, v8, v9, 2u);
    }
  }

  else if (-[TransparencyConfigBag shouldSetInternalHeader](self, "shouldSetInternalHeader"))
  {
    [v5 setValue:@"true" forHTTPHeaderField:@"x-internal"];
    if (qword_1002EEDA0 != -1) {
      dispatch_once(&qword_1002EEDA0, &stru_100288440);
    }
    unint64_t v7 = (os_log_s *)qword_1002EEDA8;
    if (os_log_type_enabled((os_log_t)qword_1002EEDA8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v8 = "requesting carry configuration bag";
      v9 = buf;
      goto LABEL_11;
    }
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag settings](self, "settings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 transparencyVersionStr]);
  [v5 setValue:v11 forHTTPHeaderField:off_1002E6260];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag settings](self, "settings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 automatedDeviceGroup]);

  if (v13) {
    [v5 setValue:v13 forHTTPHeaderField:off_1002E6258];
  }
  if ((id)-[TransparencyConfigBag configApp](self, "configApp") == (id)2
    && !-[TransparencyConfigBag currentEnvironment](self, "currentEnvironment"))
  {
    [v5 _setPrivacyProxyFailClosed:1];
    if (qword_1002EEDA0 != -1) {
      dispatch_once(&qword_1002EEDA0, &stru_100288460);
    }
    v14 = (os_log_s *)qword_1002EEDA8;
    if (os_log_type_enabled((os_log_t)qword_1002EEDA8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Enforcing privacy proxy", v16, 2u);
    }
  }

  return v5;
}

- (BOOL)shouldSetInternalHeader
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag settings](self, "settings"));
  unsigned int v4 = [v3 allowsInternalSecurityPolicies];

  if (!v4) {
    return 0;
  }
  if ((id)-[TransparencyConfigBag configApp](self, "configApp") != (id)2) {
    return 1;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag swtSettings](self, "swtSettings"));
  BOOL v6 = [v5 atEnvironment] != (id)7;

  return v6;
}

- (void)getSettings
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencySettings getOverride:]( &OBJC_CLASS___TransparencySettings,  "getOverride:",  kTransparencyOverrideReversePushPercentage));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    id v6 = [v3 unsignedIntegerValue];
    if ((unint64_t)v6 <= 0x64)
    {
      id v7 = v6;
      if (qword_1002EEDA0 != -1) {
        dispatch_once(&qword_1002EEDA0, &stru_100288480);
      }
      v8 = (os_log_s *)qword_1002EEDA8;
      if (os_log_type_enabled((os_log_t)qword_1002EEDA8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 134217984;
        id v10 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Overriding bag reverse push percentage with %lu",  (uint8_t *)&v9,  0xCu);
      }

      -[TransparencyConfigBag setOverrideReversePushConfig:](self, "setOverrideReversePushConfig:", 1LL);
      -[TransparencyConfigBag setOverrideReversePushPercentage:](self, "setOverrideReversePushPercentage:", v7);
    }
  }
}

- (TransparencyConfigBag)initWithRequiredKeys:(id)a3 settings:(id)a4 directory:(id)a5 configApp:(unint64_t)a6 swtSettings:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___TransparencyConfigBag;
  v16 = -[TransparencyConfigBag init](&v22, "init");
  v17 = v16;
  if (!v16) {
    goto LABEL_6;
  }
  -[TransparencyConfigBag getSettings](v16, "getSettings");
  -[TransparencyConfigBag setSettings:](v17, "setSettings:", v13);
  -[TransparencyConfigBag setConfigApp:](v17, "setConfigApp:", a6);
  if (a6 != 2 || v15)
  {
    -[TransparencyConfigBag setSwtSettings:](v17, "setSwtSettings:", v15);
    -[TransparencyConfigBag setCurrentEnvironment:]( v17,  "setCurrentEnvironment:",  -[TransparencyConfigBag getConfigBagEnvironment](v17, "getConfigBagEnvironment"));
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v12));
    objc_msgSend( v19,  "setObject:forKeyedSubscript:",  objc_opt_class(NSNumber, v20),  @"bag-expiry-timestamp");
    -[TransparencyConfigBag setRequiredKeys:](v17, "setRequiredKeys:", v19);
    -[TransparencyConfigBag setDirectory:](v17, "setDirectory:", v14);

LABEL_6:
    __int16 v18 = v17;
    goto LABEL_7;
  }

  __int16 v18 = 0LL;
LABEL_7:

  return v18;
}

- (TransparencyConfigBag)initWithRequiredKeys:(id)a3 settings:(id)a4 directory:(id)a5 configApp:(unint64_t)a6
{
  return -[TransparencyConfigBag initWithRequiredKeys:settings:directory:configApp:swtSettings:]( self,  "initWithRequiredKeys:settings:directory:configApp:swtSettings:",  a3,  a4,  a5,  a6,  0LL);
}

- (unint64_t)percentageForKey:(id)a3
{
  unint64_t result = -[TransparencyConfigBag uintegerForKey:](self, "uintegerForKey:", a3);
  if (result >= 0x64) {
    return 100LL;
  }
  return result;
}

- (unint64_t)uintegerForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag config](self, "config"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0
    || ((unint64_t)[v6 integerValue] & 0x8000000000000000) != 0)
  {
    id v9 = 0LL;
  }

  else
  {
    id v9 = [v6 unsignedIntegerValue];
  }

  return (unint64_t)v9;
}

- (id)stringForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag config](self, "config"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0) {
    id v9 = v6;
  }
  else {
    id v9 = 0LL;
  }

  return v9;
}

- (id)urlForKey:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag stringForKey:](self, "stringForKey:", a3));
  if (v3) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v3));
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

- (double)doubleForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag config](self, "config"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber, v7);
  double v9 = 0.0;
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    [v6 doubleValue];
    double v9 = v10;
  }

  return v9;
}

- (id)checkMissingBagKeys:(id)a3 keys:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v13, (void)v16));

        if (!v14) {
          -[NSMutableArray addObject:](v7, "addObject:", v13);
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v10);
  }

  return v7;
}

- (id)checkBagKeyClass:(id)a3 keys:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v13, (void)v17));
        char isKindOfClass = objc_opt_isKindOfClass(v14, [v8 objectForKeyedSubscript:v13]);

        if ((isKindOfClass & 1) == 0) {
          -[NSMutableArray addObject:](v7, "addObject:", v13);
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v10);
  }

  return v7;
}

- (BOOL)validateConfigEntries:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag requiredKeys](self, "requiredKeys"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag checkMissingBagKeys:keys:](self, "checkMissingBagKeys:keys:", v6, v7));

  if ([v8 count])
  {
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -114LL,  @"Missing required field in config bag data"));
    }
    if (qword_1002EEDA0 != -1) {
      dispatch_once(&qword_1002EEDA0, &stru_1002884A0);
    }
    id v9 = (void *)qword_1002EEDA8;
    if (os_log_type_enabled((os_log_t)qword_1002EEDA8, OS_LOG_TYPE_ERROR))
    {
      id v10 = v9;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 componentsJoinedByString:@","]);
      int v20 = 138412290;
      v21 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Missing required field in config bag data: %@",  (uint8_t *)&v20,  0xCu);
    }

    BOOL v12 = 0;
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag requiredKeys](self, "requiredKeys"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag checkBagKeyClass:keys:](self, "checkBagKeyClass:keys:", v6, v13));

    id v15 = [v14 count];
    BOOL v12 = v15 == 0LL;
    if (v15)
    {
      if (a4) {
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -115LL,  @"Required field has unexpected class"));
      }
      if (qword_1002EEDA0 != -1) {
        dispatch_once(&qword_1002EEDA0, &stru_1002884C0);
      }
      __int128 v16 = (void *)qword_1002EEDA8;
      if (os_log_type_enabled((os_log_t)qword_1002EEDA8, OS_LOG_TYPE_ERROR))
      {
        __int128 v17 = v16;
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v14 componentsJoinedByString:@","]);
        int v20 = 138412290;
        v21 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Required field has unexpected class: %@",  (uint8_t *)&v20,  0xCu);
      }
    }
  }

  return v12;
}

- (BOOL)processConfigBagData:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  a3,  0LL,  0LL,  a4));
  if (v6 && -[TransparencyConfigBag validateConfigEntries:error:](self, "validateConfigEntries:error:", v6, a4))
  {
    BOOL v7 = 1;
    -[TransparencyConfigBag setConfigured:](self, "setConfigured:", 1LL);
    -[TransparencyConfigBag setCurrentEnvironment:]( self,  "setCurrentEnvironment:",  -[TransparencyConfigBag getConfigBagEnvironment](self, "getConfigBagEnvironment"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"bag-expiry-timestamp"]);
    -[TransparencyConfigBag setExpirationTime:]( self,  "setExpirationTime:",  (double)(uint64_t)[v8 longLongValue]);

    -[TransparencyConfigBag setConfig:](self, "setConfig:", v6);
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)validateConfigBagCertificates:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag settings](self, "settings"));
  if ([v7 allowsInternalSecurityPolicies])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag settings](self, "settings"));
    unsigned __int8 v9 = [v8 getBool:kTransparencyFlagDisableVerifyBagCertificate];

    if ((v9 & 1) != 0)
    {
      BOOL v10 = 1;
      goto LABEL_30;
    }
  }

  else
  {
  }

  if ([v6 count])
  {
    unint64_t v11 = -[TransparencyConfigBag currentEnvironment](self, "currentEnvironment");
    BOOL v12 = @"init-kt.apple.com";
    if (v11 == 2) {
      BOOL v12 = @"init-kt-qa2.ess.apple.com";
    }
    if (v11 == 1) {
      uint64_t v13 = @"init-kt-qa1.ess.apple.com";
    }
    else {
      uint64_t v13 = v12;
    }
    AppleIDSService = (const void *)SecPolicyCreateAppleIDSService(v13);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:0]);
    v23 = v15;
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
    BOOL v10 = +[TransparencyCertificateHelper verifyCertificates:intermediates:policy:error:]( &OBJC_CLASS___TransparencyCertificateHelper,  "verifyCertificates:intermediates:policy:error:",  v16,  v6,  AppleIDSService,  a4);

    if (!v10)
    {
      if (a4) {
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  @"TransparencyErrorVerify",  -28LL,  *a4,  @"bag certificates failed trust evaluation"));
      }
      if (qword_1002EEDA0 != -1) {
        dispatch_once(&qword_1002EEDA0, &stru_100288500);
      }
      __int128 v17 = (os_log_s *)qword_1002EEDA8;
      if (os_log_type_enabled((os_log_t)qword_1002EEDA8, OS_LOG_TYPE_ERROR))
      {
        if (a4) {
          id v18 = *a4;
        }
        else {
          id v18 = 0LL;
        }
        int v21 = 138412290;
        id v22 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "bag certificates failed trust evaluation: %@",  (uint8_t *)&v21,  0xCu);
      }
    }

    if (AppleIDSService) {
      CFRelease(AppleIDSService);
    }
  }

  else
  {
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -113LL,  @"Config bag missing certificates"));
    }
    if (qword_1002EEDA0 != -1) {
      dispatch_once(&qword_1002EEDA0, &stru_1002884E0);
    }
    __int128 v19 = (os_log_s *)qword_1002EEDA8;
    if (os_log_type_enabled((os_log_t)qword_1002EEDA8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v21) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Config bag missing certificates",  (uint8_t *)&v21,  2u);
    }

    BOOL v10 = 0;
  }

- (BOOL)validateConfigBagSignature:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag settings](self, "settings"));
  if ([v7 allowsInternalSecurityPolicies])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag settings](self, "settings"));
    unsigned __int8 v9 = [v8 getBool:kTransparencyFlagDisableVerifyBagSignature];

    if ((v9 & 1) != 0)
    {
      BOOL v10 = 1;
      goto LABEL_38;
    }
  }

  else
  {
  }

  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"bag"]);
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"signature"]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"certs"]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:0]);
  id v15 = +[TransparencyCertificateHelper certificateFromData:error:]( &OBJC_CLASS___TransparencyCertificateHelper,  "certificateFromData:error:",  v14,  a4);

  if (v15)
  {
    __int128 v16 = (void *)SecCertificateCopySubjectPublicKeyInfoSHA256Digest(v15);
    if (v16)
    {
      id v17 = +[TransparencyCertificateHelper copyTrustedKeysFromDataArray:error:]( &OBJC_CLASS___TransparencyCertificateHelper,  "copyTrustedKeysFromDataArray:error:",  v13,  a4);
      if (v17)
      {
        BOOL v10 = +[TransparencySignatureVerifier verifyMessage:signature:spkiHash:trustedKeys:algorithm:error:]( &OBJC_CLASS___TransparencySignatureVerifier,  "verifyMessage:signature:spkiHash:trustedKeys:algorithm:error:",  v11,  v12,  v16,  v17,  kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA256,  a4);
        if (!v10)
        {
          if (qword_1002EEDA0 != -1) {
            dispatch_once(&qword_1002EEDA0, &stru_100288580);
          }
          id v18 = (os_log_s *)qword_1002EEDA8;
          if (os_log_type_enabled((os_log_t)qword_1002EEDA8, OS_LOG_TYPE_ERROR))
          {
            if (a4) {
              id v19 = *a4;
            }
            else {
              id v19 = 0LL;
            }
            int v24 = 138412290;
            id v25 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Config bag signature verification failed: %@",  (uint8_t *)&v24,  0xCu);
          }
        }
      }

      else
      {
        if (a4) {
          *a4 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -7LL,  @"Failed to decode certs in bag"));
        }
        if (qword_1002EEDA0 != -1) {
          dispatch_once(&qword_1002EEDA0, &stru_100288560);
        }
        id v22 = (os_log_s *)qword_1002EEDA8;
        if (os_log_type_enabled((os_log_t)qword_1002EEDA8, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v24) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Failed to decode certs in bag",  (uint8_t *)&v24,  2u);
        }

        BOOL v10 = 0;
      }

      CFRelease(v15);
    }

    else
    {
      if (a4) {
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -30LL,  @"Failed to get SPKI hash from cert"));
      }
      if (qword_1002EEDA0 != -1) {
        dispatch_once(&qword_1002EEDA0, &stru_100288540);
      }
      int v21 = (os_log_s *)qword_1002EEDA8;
      if (os_log_type_enabled((os_log_t)qword_1002EEDA8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v24) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Failed to get SPKI hash from cert",  (uint8_t *)&v24,  2u);
      }

      CFRelease(v15);
      BOOL v10 = 0;
    }
  }

  else
  {
    if (qword_1002EEDA0 != -1) {
      dispatch_once(&qword_1002EEDA0, &stru_100288520);
    }
    int v20 = (os_log_s *)qword_1002EEDA8;
    if (os_log_type_enabled((os_log_t)qword_1002EEDA8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v24) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "failed to decode config bag leaf cert",  (uint8_t *)&v24,  2u);
    }

    BOOL v10 = 0;
  }

LABEL_38:
  return v10;
}

- (BOOL)validateConfigBagEntries:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"bag"]);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSData, v8);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
  {
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"certs"]);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSArray, v11);
    if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0 && [v10 count])
    {
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      v38 = v10;
      id v13 = v10;
      id v14 = [v13 countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v14)
      {
        id v16 = v14;
        uint64_t v17 = *(void *)v40;
        while (2)
        {
          for (i = 0LL; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v40 != v17) {
              objc_enumerationMutation(v13);
            }
            id v19 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
            uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSData, v15);
            if ((objc_opt_isKindOfClass(v19, v20) & 1) == 0)
            {
              if (a4) {
                *a4 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -114LL,  @"cert wrong type"));
              }
              BOOL v10 = v38;
              if (qword_1002EEDA0 != -1) {
                dispatch_once(&qword_1002EEDA0, &stru_1002885E0);
              }
              v31 = (void *)qword_1002EEDA8;
              if (os_log_type_enabled((os_log_t)qword_1002EEDA8, OS_LOG_TYPE_ERROR))
              {
                v32 = v31;
                ClassName = object_getClassName(v19);
                *(_DWORD *)buf = 136315138;
                v45 = ClassName;
                _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "cert wrong type): %s", buf, 0xCu);
              }

              goto LABEL_35;
            }
          }

          id v16 = [v13 countByEnumeratingWithState:&v39 objects:v43 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }

      int v21 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"signature"]);
      uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSData, v22);
      if ((objc_opt_isKindOfClass(v21, v23) & 1) != 0)
      {
        int v24 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"certs"]);
        unsigned int v25 = -[TransparencyConfigBag validateConfigBagCertificates:error:]( self,  "validateConfigBagCertificates:error:",  v24,  a4);

        if (v25) {
          BOOL v26 = -[TransparencyConfigBag validateConfigBagSignature:error:]( self,  "validateConfigBagSignature:error:",  v6,  a4);
        }
        else {
          BOOL v26 = 0;
        }
        BOOL v10 = v38;
      }

      else
      {
        if (a4) {
          *a4 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -114LL,  @"sigature missing required field or type"));
        }
        if (qword_1002EEDA0 != -1) {
          dispatch_once(&qword_1002EEDA0, &stru_100288600);
        }
        BOOL v10 = v38;
        v35 = (void *)qword_1002EEDA8;
        if (os_log_type_enabled((os_log_t)qword_1002EEDA8, OS_LOG_TYPE_ERROR))
        {
          v36 = v35;
          v37 = object_getClassName(v21);
          *(_DWORD *)buf = 136315138;
          v45 = v37;
          _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "sigature bag missing (or wrong type): %s",  buf,  0xCu);
        }

        BOOL v26 = 0;
      }
    }

    else
    {
      if (a4) {
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -114LL,  @"certs missing required field or type"));
      }
      if (qword_1002EEDA0 != -1) {
        dispatch_once(&qword_1002EEDA0, &stru_1002885C0);
      }
      v29 = (void *)qword_1002EEDA8;
      if (os_log_type_enabled((os_log_t)qword_1002EEDA8, OS_LOG_TYPE_ERROR))
      {
        v30 = v29;
        *(_DWORD *)buf = 136315138;
        v45 = object_getClassName(v10);
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "certs bag missing (or wrong type): %s",  buf,  0xCu);
      }

- (BOOL)configureFromNetworkBagData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v6,  0LL,  0LL,  a4));
  uint64_t v8 = self;
  objc_sync_enter(v8);
  if (v7 && -[TransparencyConfigBag validateConfigBagEntries:error:](v8, "validateConfigBagEntries:error:", v7, a4))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"bag"]);
    unsigned int v10 = -[TransparencyConfigBag processConfigBagData:error:](v8, "processConfigBagData:error:", v9, a4);

    if (v10)
    {
      id v15 = 0LL;
      unsigned __int8 v11 = -[TransparencyConfigBag writeConfigToDisk:error:](v8, "writeConfigToDisk:error:", v7, &v15);
      id v12 = v15;
      if ((v11 & 1) == 0)
      {
        if (qword_1002EEDA0 != -1) {
          dispatch_once(&qword_1002EEDA0, &stru_100288620);
        }
        id v13 = (os_log_s *)qword_1002EEDA8;
        if (os_log_type_enabled((os_log_t)qword_1002EEDA8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v17 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to write config bag to disk: %@",  buf,  0xCu);
        }
      }
    }

    objc_sync_exit(v8);
  }

  else
  {
    objc_sync_exit(v8);

    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)configurationExpired
{
  double v4 = v3;
  -[TransparencyConfigBag expirationTime](self, "expirationTime");
  double v6 = v5;
  if (v4 > v5)
  {
    if (qword_1002EEDA0 != -1) {
      dispatch_once(&qword_1002EEDA0, &stru_100288640);
    }
    BOOL v7 = (void *)qword_1002EEDA8;
    if (os_log_type_enabled((os_log_t)qword_1002EEDA8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v7;
      -[TransparencyConfigBag expirationTime](self, "expirationTime");
      int v11 = 134217984;
      uint64_t v12 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Configuration bag expired at %f",  (uint8_t *)&v11,  0xCu);
    }

    -[TransparencyConfigBag setConfigured:](self, "setConfigured:", 0LL);
  }

  return v4 > v6;
}

- (id)readConfigFromDisk:(id *)a3
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag configBagFileName](self, "configBagFileName"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag directory](self, "directory"));
  id v12 = 0LL;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyFileSupport readDictionaryFromFile:inDirectory:error:]( &OBJC_CLASS___TransparencyFileSupport,  "readDictionaryFromFile:inDirectory:error:",  v5,  v6,  &v12));
  id v8 = v12;

  if (v7) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = a3 == 0LL;
  }
  if (!v9 && v8 != 0LL) {
    *a3 = v8;
  }

  return v7;
}

- (BOOL)writeConfigToDisk:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag configBagFileName](self, "configBagFileName"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag directory](self, "directory"));
  LOBYTE(a4) = +[TransparencyFileSupport writeDictionaryToFile:fileName:inDirectory:error:]( &OBJC_CLASS___TransparencyFileSupport,  "writeDictionaryToFile:fileName:inDirectory:error:",  v6,  v7,  v8,  a4);

  return (char)a4;
}

- (BOOL)configureWithDisk:(id *)a3
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag readConfigFromDisk:](self, "readConfigFromDisk:"));
  if (v5 && -[TransparencyConfigBag validateConfigBagEntries:error:](self, "validateConfigBagEntries:error:", v5, a3))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"bag"]);
    BOOL v7 = -[TransparencyConfigBag processConfigBagData:error:](self, "processConfigBagData:error:", v6, a3);
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)configureFromNetworkWithFetcher:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag configBagRequest](self, "configBagRequest"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001AD440;
  v10[3] = &unk_10027BE18;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v7 fetchConfigBag:v8 completionHandler:v10];
}

- (void)configureWithFetcher:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = -[TransparencyConfigBag getConfigBagEnvironment](self, "getConfigBagEnvironment");
  if (-[TransparencyConfigBag configured](self, "configured")
    && (void *)-[TransparencyConfigBag currentEnvironment](self, "currentEnvironment") == v8
    && (v6 || !-[TransparencyConfigBag configurationExpired](self, "configurationExpired")))
  {
    if (-[TransparencyConfigBag configurationExpired](self, "configurationExpired"))
    {
      if (qword_1002EEDA0 != -1) {
        dispatch_once(&qword_1002EEDA0, &stru_100288660);
      }
      id v14 = (os_log_s *)qword_1002EEDA8;
      if (os_log_type_enabled((os_log_t)qword_1002EEDA8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Configuration already loaded, but need to kick off config bag fetch because configuration expired",  buf,  2u);
      }

      [v6 triggerConfigBagFetch:0.0];
    }

    v7[2](v7, 0LL);
  }

  else
  {
    id v9 = self;
    objc_sync_enter(v9);
    id v16 = 0LL;
    unsigned int v10 = -[TransparencyConfigBag configureWithDisk:](v9, "configureWithDisk:", &v16);
    id v11 = v16;
    if (!v10) {
      goto LABEL_13;
    }
    if (-[TransparencyConfigBag configurationExpired](v9, "configurationExpired"))
    {
      if (qword_1002EEDA0 != -1) {
        dispatch_once(&qword_1002EEDA0, &stru_100288680);
      }
      id v12 = (os_log_s *)qword_1002EEDA8;
      if (os_log_type_enabled((os_log_t)qword_1002EEDA8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Configuration loaded from disk, but need to kick off config bag fetch because configuration expired",  buf,  2u);
      }

      [v6 triggerConfigBagFetch:0.0];
    }

    if (!v11)
    {
      if (qword_1002EEDA0 != -1) {
        dispatch_once(&qword_1002EEDA0, &stru_1002886A0);
      }
      id v15 = (os_log_s *)qword_1002EEDA8;
      if (os_log_type_enabled((os_log_t)qword_1002EEDA8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Loaded configuration bag from disk",  buf,  2u);
      }

      v7[2](v7, 0LL);
      objc_sync_exit(v9);
    }

    else
    {
LABEL_13:

      objc_sync_exit(v9);
      if (qword_1002EEDA0 != -1) {
        dispatch_once(&qword_1002EEDA0, &stru_1002886C0);
      }
      id v13 = (os_log_s *)qword_1002EEDA8;
      if (os_log_type_enabled((os_log_t)qword_1002EEDA8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Updating configuration from network",  buf,  2u);
      }

      -[TransparencyConfigBag configureFromNetworkWithFetcher:completionHandler:]( v9,  "configureFromNetworkWithFetcher:completionHandler:",  v6,  v7);
    }
  }
}

- (id)copyConfigurationBag:(id *)a3
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag readConfigFromDisk:](self, "readConfigFromDisk:"));
  if (v5 && -[TransparencyConfigBag validateConfigBagEntries:error:](self, "validateConfigBagEntries:error:", v5, a3)) {
    id v6 = v5;
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (void)clearState:(id *)a3
{
  double v4 = self;
  objc_sync_enter(v4);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag configBagFileName](v4, "configBagFileName"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag directory](v4, "directory"));
  unsigned __int8 v7 = +[TransparencyFileSupport deleteFile:inDirectory:error:]( &OBJC_CLASS___TransparencyFileSupport,  "deleteFile:inDirectory:error:",  v5,  v6,  a3);

  if ((v7 & 1) != 0)
  {
    -[TransparencyConfigBag setConfigured:](v4, "setConfigured:", 0LL);
    -[TransparencyConfigBag setExpirationTime:](v4, "setExpirationTime:", 0.0);
    -[TransparencyConfigBag setConfig:](v4, "setConfig:", 0LL);
  }

  else
  {
    if (qword_1002EEDA0 != -1) {
      dispatch_once(&qword_1002EEDA0, &stru_1002886E0);
    }
    id v8 = (os_log_s *)qword_1002EEDA8;
    if (os_log_type_enabled((os_log_t)qword_1002EEDA8, OS_LOG_TYPE_ERROR))
    {
      if (a3) {
        id v9 = *a3;
      }
      else {
        id v9 = 0LL;
      }
      int v10 = 138412290;
      id v11 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Failed to delete KTLogClient configuration state: %@",  (uint8_t *)&v10,  0xCu);
    }
  }

  objc_sync_exit(v4);
}

- (BOOL)tapToRadarEnabled
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag config](self, "config"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"ttr-enabled"]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    unsigned __int8 v6 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

- (NSString)swtCFUDetailsURL
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag config](self, "config"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"swt-cfu-url"]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    id v6 = v3;
  }
  else {
    id v6 = 0LL;
  }

  return (NSString *)v6;
}

- (BOOL)configured
{
  return self->_configured;
}

- (void)setConfigured:(BOOL)a3
{
  self->_configured = a3;
}

- (unint64_t)currentEnvironment
{
  return self->_currentEnvironment;
}

- (void)setCurrentEnvironment:(unint64_t)a3
{
  self->_currentEnvironment = a3;
}

- (unint64_t)overrideReversePushPercentage
{
  return self->_overrideReversePushPercentage;
}

- (void)setOverrideReversePushPercentage:(unint64_t)a3
{
  self->_overrideReversePushPercentage = a3;
}

- (BOOL)overrideReversePushConfig
{
  return self->_overrideReversePushConfig;
}

- (void)setOverrideReversePushConfig:(BOOL)a3
{
  self->_overrideReversePushConfig = a3;
}

- (NSURL)directory
{
  return (NSURL *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setDirectory:(id)a3
{
}

- (double)expirationTime
{
  return self->_expirationTime;
}

- (void)setExpirationTime:(double)a3
{
  self->_expirationTime = a3;
}

- (NSDictionary)config
{
  return (NSDictionary *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setConfig:(id)a3
{
}

- (TransparencySettingsProtocol)settings
{
  return (TransparencySettingsProtocol *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setSettings:(id)a3
{
}

- (SWTSettingsProtocol)swtSettings
{
  return (SWTSettingsProtocol *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setSwtSettings:(id)a3
{
}

- (NSDictionary)requiredKeys
{
  return (NSDictionary *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setRequiredKeys:(id)a3
{
}

- (unint64_t)configApp
{
  return self->_configApp;
}

- (void)setConfigApp:(unint64_t)a3
{
  self->_configApp = a3;
}

- (void).cxx_destruct
{
}

@end