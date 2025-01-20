@interface TCCDPlatform
+ (id)allPlatformNames;
+ (id)allTCCEntitlements;
+ (id)currentPlatform;
+ (id)iosFamilyPlatformNames;
+ (id)macOSPlatformNames;
- (BOOL)displayAlert:(id)a3;
- (BOOL)indirectRequestPipelineStalled;
- (BOOL)isChinaSKUDevice;
- (BOOL)isNonAppBundleIdentifierValid:(id)a3;
- (BOOL)removalOfAppBundleIdentifierRequiresPruning:(id)a3;
- (BOOL)sendMessageAsync:(id)a3 toTCCDForTargetUID:(unsigned int)a4 withReplyBlock:(id)a5;
- (NSDictionary)configurationDictionary;
- (NSDictionary)servicesByName;
- (NSString)name;
- (NSUUID)bootUUID;
- (TCCDMainSyncController)mainSyncController;
- (TCCDPlatform)initWithName:(id)a3;
- (TCCDProtectedServiceManager)protectedAppManager;
- (TCCDServer)server;
- (TCCDSyncController)syncController;
- (id)appBundleURLContainingExecutableURL:(id)a3;
- (id)bundleURLContainingExecutableURL:(id)a3;
- (id)homeRelativePathToStateDirectory;
- (id)prefixOfBundleIdentifiersToResetAfterResetOfAppBundleIdentifier:(id)a3;
- (id)sendMessageSync:(id)a3 toTCCDForTargetUID:(unsigned int)a4;
- (id)serviceByName:(id)a3;
- (id)stringForAnalyticsAction:(int64_t)a3;
- (int)indirectRequestsOutstanding;
- (int64_t)promptingPolicyForIdentity:(id)a3 accessingService:(id)a4 withAttributionChain:(id)a5;
- (unint64_t)evaluatePolicyForUsageStringAndPromptingForClient:(id)a3 attributionChain:(id)a4 service:(id)a5 desiredAuth:(unint64_t)a6 resultUsageString:(id *)a7;
- (void)_invalidMethodForPlatform;
- (void)loadConfigurationDictionary;
- (void)sendAnalyticsAsyncWithEventName:(id)a3 fields:(id)a4;
- (void)sendAnalyticsForAction:(int64_t)a3 service:(id)a4 subjectIdentity:(id)a5 indirectObjectIdentity:(id)a6 authValue:(unint64_t)a7 includeV1AuthValue:(BOOL)a8 v1AuthValue:(unint64_t)a9 desiredAuth:(unint64_t)a10 domainReason:(id)a11 promptType:(int64_t)a12;
- (void)sendAnalyticsForEntitlement:(id)a3 withIdentifier:(id)a4 service:(id)a5 function:(id)a6;
- (void)sendAnalyticsForPlugin:(id)a3 service:(id)a4 API:(id)a5;
- (void)sendAnalyticsWithEventName:(id)a3 fields:(id)a4;
- (void)setIndirectRequestsOutstanding:(int)a3;
- (void)setMainSyncController:(id)a3;
- (void)setProtectedAppManager:(id)a3;
- (void)setServer:(id)a3;
- (void)setServicesByName:(id)a3;
- (void)setSyncController:(id)a3;
- (void)updateAnalyticsEvent:(id)a3 fromIdentity:(id)a4 keyPrefix:(id)a5;
@end

@implementation TCCDPlatform

+ (id)allPlatformNames
{
  if (qword_1000783D8 != -1) {
    dispatch_once(&qword_1000783D8, &stru_100065E08);
  }
  return (id)qword_1000783D0;
}

+ (id)iosFamilyPlatformNames
{
  if (qword_1000783E8 != -1) {
    dispatch_once(&qword_1000783E8, &stru_100065E28);
  }
  return (id)qword_1000783E0;
}

+ (id)macOSPlatformNames
{
  if (qword_1000783F8 != -1) {
    dispatch_once(&qword_1000783F8, &stru_100065E48);
  }
  return (id)qword_1000783F0;
}

+ (id)currentPlatform
{
  if (qword_100078408 != -1) {
    dispatch_once(&qword_100078408, &stru_100065E68);
  }
  return (id)qword_100078400;
}

+ (id)allTCCEntitlements
{
  if (qword_100078410 != -1) {
    dispatch_once(&qword_100078410, &stru_100065E88);
  }
  return (id)qword_100078418;
}

- (TCCDPlatform)initWithName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TCCDPlatform;
  v5 = -[TCCDPlatform init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    name = v5->_name;
    v5->_name = v6;
  }

  return v5;
}

- (void)loadConfigurationDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPlatform server](self, "server"));
  unsigned int v4 = [v3 allowsInternalSecurityPolicies];

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPlatform server](self, "server"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stateDirectory]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"tccd-config.plist"]);

    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v7,  0LL,  0LL));
    if (v8)
    {
      id v18 = 0LL;
      objc_super v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v8,  0LL,  0LL,  &v18));
      id v10 = v18;
      configurationDictionary = self->_configurationDictionary;
      self->_configurationDictionary = v9;

      v12 = self->_configurationDictionary;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPlatform server](self, "server"));
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 logHandle]);

      if (v12)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = self->_configurationDictionary;
          *(_DWORD *)buf = 138543618;
          v20 = v7;
          __int16 v21 = 2114;
          v22 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Using config file at %{public}@: contents:\n%{public}@",  buf,  0x16u);
        }
      }

      else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        sub_100035C3C((uint64_t)v7, v10, v14);
      }
    }
  }

  if (!self->_configurationDictionary)
  {
    v16 = objc_opt_new(&OBJC_CLASS___NSDictionary);
    v17 = self->_configurationDictionary;
    self->_configurationDictionary = v16;
  }

- (id)serviceByName:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003432C;
  block[3] = &unk_100064D50;
  block[4] = self;
  uint64_t v4 = qword_100078420;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&qword_100078420, block);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPlatform servicesByName](self, "servicesByName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v5]);

  return v7;
}

- (void)_invalidMethodForPlatform
{
}

- (id)homeRelativePathToStateDirectory
{
  return 0LL;
}

- (NSUUID)bootUUID
{
  bootUUID = self->_bootUUID;
  if (!bootUUID)
  {
    size_t v10 = 37LL;
    if (!sysctlbyname("kern.bootsessionuuid", in, &v10, 0LL, 0LL))
    {
      if (v10 != 37) {
        sub_100035CE0();
      }
      if (!uuid_parse(in, uu))
      {
        uint64_t v4 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", uu);
        id v5 = self->_bootUUID;
        self->_bootUUID = v4;

        v6 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPlatform server](self, "server"));
        v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 logHandle]);

        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)objc_super v9 = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully loaded bootUUID", v9, 2u);
        }
      }
    }

    bootUUID = self->_bootUUID;
  }

  return bootUUID;
}

- (id)sendMessageSync:(id)a3 toTCCDForTargetUID:(unsigned int)a4
{
  return 0LL;
}

- (BOOL)sendMessageAsync:(id)a3 toTCCDForTargetUID:(unsigned int)a4 withReplyBlock:(id)a5
{
  return 0;
}

- (int64_t)promptingPolicyForIdentity:(id)a3 accessingService:(id)a4 withAttributionChain:(id)a5
{
  return 0LL;
}

- (id)bundleURLContainingExecutableURL:(id)a3
{
  v3 = (void *)_CFBundleCopyBundleURLForExecutableURL(a3, a2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 absoluteURL]);

  return v4;
}

- (id)appBundleURLContainingExecutableURL:(id)a3
{
  id v4 = a3;
  v31 = self;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPlatform bundleURLContainingExecutableURL:](self, "bundleURLContainingExecutableURL:", v4));
  v6 = v5;
  if (v5)
  {
    v30 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 pathComponents]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:0]);
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v8));

    if ((unint64_t)[v7 count] >= 2)
    {
      unsigned int v11 = 2;
      uint64_t v12 = 1LL;
      *(void *)&__int128 v10 = 138412546LL;
      __int128 v29 = v10;
      do
      {
        v13 = v9;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v12, v29));
        id v9 = (id)objc_claimAutoreleasedReturnValue([v9 URLByAppendingPathComponent:v14]);

        if (!v9) {
          break;
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue([v9 pathExtension]);
        id v16 = [v15 caseInsensitiveCompare:@"app"];

        if (!v16)
        {
          id v32 = 0LL;
          id v33 = 0LL;
          uint64_t v17 = [v9 getResourceValue:&v33 forKey:NSURLIsApplicationKey error:&v32];
          id v18 = v33;
          id v19 = v32;
          if ((v17 & 1) != 0)
          {
            if ([v18 BOOLValue])
            {
              v26 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPlatform server](v31, "server"));
              v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v26 logHandle]);

              BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);
              id v4 = v30;
              if (v28) {
                sub_100035D08(v30, v9, v27);
              }

              id v9 = v9;
              id v24 = v9;
              goto LABEL_15;
            }
          }

          else
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPlatform server](v31, "server"));
            __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 logHandle]);

            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
              *(_DWORD *)buf = v29;
              v35 = v22;
              __int16 v36 = 2114;
              id v37 = v19;
              _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Failed to get NSURLIsApplicationKey for %@: %{public}@",  buf,  0x16u);
            }
          }
        }

        uint64_t v12 = v11;
      }

      while ((unint64_t)[v7 count] > v11++);
    }

    id v24 = v6;
    id v4 = v30;
LABEL_15:
  }

  else
  {
    id v24 = 0LL;
  }

  return v24;
}

- (id)stringForAnalyticsAction:(int64_t)a3
{
  else {
    return *(&off_100065F48 + a3);
  }
}

- (void)updateAnalyticsEvent:(id)a3 fromIdentity:(id)a4 keyPrefix:(id)a5
{
  id v19 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v7, "client_type")));
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingString:@"_ID_type"]);
  [v19 setObject:v9 forKeyedSubscript:v10];

  if (!objc_msgSend(v7, "client_type"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v7 bundle]);

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v7 bundle]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 bundleIdentifier]);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingString:@"_ID"]);
      [v19 setObject:v16 forKeyedSubscript:v17];

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 bundle]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleVersion]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingString:@"_bundle_version"]);
      [v19 setObject:v13 forKeyedSubscript:v18];

      goto LABEL_7;
    }
  }

  if (objc_msgSend(v7, "client_type") == 1)
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);

    if (v11)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingString:@"_ID"]);
      [v19 setObject:v12 forKeyedSubscript:v13];
LABEL_7:
    }
  }
}

- (void)sendAnalyticsForPlugin:(id)a3 service:(id)a4 API:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (&_AnalyticsSendEventLazy)
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPlatform server](self, "server"));
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 logHandle]);

    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
      *(_DWORD *)buf = 138544130;
      v22 = @"com.apple.TCC.management_action";
      __int16 v23 = 2114;
      id v24 = v8;
      __int16 v25 = 2114;
      id v26 = v10;
      __int16 v27 = 2114;
      BOOL v28 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Sending %{public}@ Analytics Event for plugin=%{public}@, API=%{public}@, service=%{public}@",  buf,  0x2Au);
    }

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100034DA8;
    v17[3] = &unk_100065EB0;
    v14 = &v18;
    id v18 = v9;
    id v19 = v10;
    id v20 = v8;
    AnalyticsSendEventLazy(@"com.apple.TCC.management_action", v17);
  }

  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100034E30;
    v15[3] = &unk_100064D50;
    v14 = (id *)&v16;
    id v16 = @"com.apple.TCC.management_action";
    if (qword_100078428 != -1) {
      dispatch_once(&qword_100078428, v15);
    }
  }
}

- (void)sendAnalyticsForEntitlement:(id)a3 withIdentifier:(id)a4 service:(id)a5 function:(id)a6
{
  id v15 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v10, @"function_name");

  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v12, @"entitlement");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v11, @"subject_ID");

  if (v15)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v15 name]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v14, @"service");
  }

  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  &stru_100066238,  @"service");
  }

  -[TCCDPlatform sendAnalyticsAsyncWithEventName:fields:]( self,  "sendAnalyticsAsyncWithEventName:fields:",  @"com.apple.TCC.entitlement_usage",  v13);
}

- (void)sendAnalyticsForAction:(int64_t)a3 service:(id)a4 subjectIdentity:(id)a5 indirectObjectIdentity:(id)a6 authValue:(unint64_t)a7 includeV1AuthValue:(BOOL)a8 v1AuthValue:(unint64_t)a9 desiredAuth:(unint64_t)a10 domainReason:(id)a11 promptType:(int64_t)a12
{
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a11;
  if (&_AnalyticsSendEventLazy)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPlatform server](self, "server"));
    __int16 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 logHandle]);

    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v40 = @"com.apple.TCC.authorization_action";
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "Analytics Event preparing: %{public}@",  buf,  0xCu);
    }

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1000351F0;
    v27[3] = &unk_100065ED8;
    v27[4] = self;
    int64_t v33 = a3;
    BOOL v28 = (__CFString *)v18;
    BOOL v38 = a8;
    unint64_t v34 = a7;
    int64_t v35 = a12;
    unint64_t v36 = a9;
    id v29 = v19;
    id v30 = v20;
    unint64_t v37 = a10;
    id v31 = v21;
    id v32 = @"com.apple.TCC.authorization_action";
    AnalyticsSendEventLazy(@"com.apple.TCC.authorization_action", v27);

    id v24 = v28;
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000354D8;
    block[3] = &unk_100064D50;
    id v26 = @"com.apple.TCC.authorization_action";
    if (qword_100078430 != -1) {
      dispatch_once(&qword_100078430, block);
    }
    id v24 = (__CFString *)v26;
  }
}

- (void)sendAnalyticsWithEventName:(id)a3 fields:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (&_AnalyticsSendEventLazy)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPlatform server](self, "server"));
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 logHandle]);

    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Analytics Event preparing: %{public}@",  buf,  0xCu);
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000356D0;
    v13[3] = &unk_100065F00;
    v13[4] = self;
    id v14 = v6;
    id v15 = v7;
    AnalyticsSendEventLazy(v14, v13);

    id v10 = v14;
  }

  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000357A4;
    v11[3] = &unk_100064D50;
    id v12 = v6;
    if (qword_100078438 != -1) {
      dispatch_once(&qword_100078438, v11);
    }
    id v10 = v12;
  }
}

- (void)sendAnalyticsAsyncWithEventName:(id)a3 fields:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (&_AnalyticsSendEventLazy)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPlatform server](self, "server"));
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 logHandle]);

    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Analytics Event sync preparing: %{public}@",  buf,  0xCu);
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10003599C;
    v13[3] = &unk_100065F00;
    v13[4] = self;
    id v14 = v6;
    id v15 = v7;
    AnalyticsSendEventLazy(v14, v13);

    id v10 = v14;
  }

  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100035A70;
    v11[3] = &unk_100064D50;
    id v12 = v6;
    if (qword_100078440 != -1) {
      dispatch_once(&qword_100078440, v11);
    }
    id v10 = v12;
  }
}

- (unint64_t)evaluatePolicyForUsageStringAndPromptingForClient:(id)a3 attributionChain:(id)a4 service:(id)a5 desiredAuth:(unint64_t)a6 resultUsageString:(id *)a7
{
  *a7 = 0LL;
  return 0LL;
}

- (BOOL)isNonAppBundleIdentifierValid:(id)a3
{
  return 0;
}

- (BOOL)removalOfAppBundleIdentifierRequiresPruning:(id)a3
{
  return 0;
}

- (id)prefixOfBundleIdentifiersToResetAfterResetOfAppBundleIdentifier:(id)a3
{
  return 0LL;
}

- (BOOL)displayAlert:(id)a3
{
  return 0;
}

- (BOOL)indirectRequestPipelineStalled
{
  return self->_indirectRequestsOutstanding > 20;
}

- (NSDictionary)configurationDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (TCCDServer)server
{
  return (TCCDServer *)objc_loadWeakRetained((id *)&self->_server);
}

- (void)setServer:(id)a3
{
}

- (TCCDSyncController)syncController
{
  return (TCCDSyncController *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setSyncController:(id)a3
{
}

- (TCCDMainSyncController)mainSyncController
{
  return (TCCDMainSyncController *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setMainSyncController:(id)a3
{
}

- (TCCDProtectedServiceManager)protectedAppManager
{
  return (TCCDProtectedServiceManager *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setProtectedAppManager:(id)a3
{
}

- (NSDictionary)servicesByName
{
  return (NSDictionary *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setServicesByName:(id)a3
{
}

- (BOOL)isChinaSKUDevice
{
  return self->_isChinaSKUDevice;
}

- (int)indirectRequestsOutstanding
{
  return self->_indirectRequestsOutstanding;
}

- (void)setIndirectRequestsOutstanding:(int)a3
{
  self->_indirectRequestsOutstanding = a3;
}

- (void).cxx_destruct
{
}

  ;
}

@end