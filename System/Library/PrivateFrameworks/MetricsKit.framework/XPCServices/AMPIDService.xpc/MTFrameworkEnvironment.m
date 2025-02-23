@interface MTFrameworkEnvironment
+ (MTFrameworkEnvironment)sharedEnvironment;
+ (void)initialize;
+ (void)setSharedEnvironment:(id)a3;
+ (void)withEnvironment:(id)a3 execute:(id)a4;
- (BOOL)isInternalBuild;
- (BOOL)useCloudKitSandbox;
- (NSString)localDataPath;
- (id)date;
- (id)hostProcessBundleIdentifier;
- (id)metricsKitBundleIdentifier;
- (id)secretStore;
- (id)valueForEntitlement:(id)a3;
- (void)setLocalDataPath:(id)a3;
@end

@implementation MTFrameworkEnvironment

+ (void)withEnvironment:(id)a3 execute:(id)a4
{
  v6 = (void (**)(void))a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 sharedEnvironment]);
  [a1 setSharedEnvironment:v7];

  v6[2](v6);
  [a1 setSharedEnvironment:v8];
}

+ (MTFrameworkEnvironment)sharedEnvironment
{
  return (MTFrameworkEnvironment *)(id)qword_100028490;
}

+ (void)setSharedEnvironment:(id)a3
{
}

+ (void)initialize
{
  uint64_t v2 = objc_opt_new(&OBJC_CLASS___MTFrameworkEnvironment, a2);
  v3 = (void *)qword_100028490;
  qword_100028490 = v2;

  byte_100028498 = MGGetBoolAnswer(@"InternalBuild");
}

- (void)setLocalDataPath:(id)a3
{
  id v4 = a3;
  if ([v4 hasPrefix:@"file://"])
  {
    id v5 = MTMetricsKitOSLog();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "MetricsKit: Expected a path but got a full url for MTFrameworkEnvironment.setLocalDataPath. Please remove file:// from %@",  (uint8_t *)&v11,  0xCu);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v4));
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 path]);

    id v4 = (id)v8;
  }

  v9 = (NSString *)objc_claimAutoreleasedReturnValue([v4 stringByReplacingOccurrencesOfString:@"//" withString:@"/"]);

  localDataPath = self->_localDataPath;
  self->_localDataPath = v9;
}

- (NSString)localDataPath
{
  localDataPath = self->_localDataPath;
  if (!localDataPath)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100005AFC;
    block[3] = &unk_100020560;
    block[4] = self;
    if (qword_1000284A0 != -1) {
      dispatch_once(&qword_1000284A0, block);
    }
    localDataPath = (NSString *)qword_1000284A8;
  }

  return localDataPath;
}

- (BOOL)isInternalBuild
{
  return byte_100028498;
}

- (id)date
{
  return +[NSDate date](&OBJC_CLASS___NSDate, "date");
}

- (id)valueForEntitlement:(id)a3
{
  v3 = (__CFString *)a3;
  id v4 = SecTaskCreateFromSelf(0LL);
  if (v4)
  {
    id v5 = v4;
    CFErrorRef error = 0LL;
    v6 = (void *)SecTaskCopyValueForEntitlement(v4, v3, &error);
    if (error)
    {
      id v7 = MTMetricsKitOSLog();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v12 = v3;
        __int16 v13 = 2112;
        CFErrorRef v14 = error;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "MetricsKit: Failed to read entitlement %@ error: %@",  buf,  0x16u);
      }

      CFRelease(error);
    }

    CFRelease(v5);
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

- (id)secretStore
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  secretStore = v2->_secretStore;
  if (!secretStore)
  {
    Class v4 = NSClassFromString(@"MTIDCompositeSecretStore");
    Class v5 = NSClassFromString(@"MTIDXPCSecretStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[MTFrameworkEnvironment valueForEntitlement:]( v2,  "valueForEntitlement:",  @"com.apple.security.exception.mach-lookup.global-name"));
    else {
      id v7 = v4;
    }
    uint64_t v8 = (MTIDSecretStore *)objc_alloc_init(v7);
    v9 = v2->_secretStore;
    v2->_secretStore = v8;

    secretStore = v2->_secretStore;
  }

  v10 = secretStore;
  objc_sync_exit(v2);

  return v10;
}

- (BOOL)useCloudKitSandbox
{
  BOOL v3 = -[MTFrameworkEnvironment isInternalBuild](self, "isInternalBuild");
  if (v3)
  {
    Class v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    Class v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForKey:@"MTMetricsKitContainerEnvironment"]);

    if (!v5) {
      Class v5 = (void *)objc_claimAutoreleasedReturnValue( -[MTFrameworkEnvironment valueForEntitlement:]( self,  "valueForEntitlement:",  @"com.apple.developer.icloud-container-environment"));
    }
    unsigned __int8 v6 = [v5 isEqualToString:@"Development"];

    LOBYTE(v3) = v6;
  }

  return v3;
}

- (id)hostProcessBundleIdentifier
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bundleIdentifier]);
  Class v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }

  else
  {
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    id v5 = (id)objc_claimAutoreleasedReturnValue([v6 processName]);
  }

  return v5;
}

- (id)metricsKitBundleIdentifier
{
  uint64_t v2 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  NSClassFromString(@"MTMetricsKit"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  Class v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);

  return v4;
}

- (void).cxx_destruct
{
}

@end