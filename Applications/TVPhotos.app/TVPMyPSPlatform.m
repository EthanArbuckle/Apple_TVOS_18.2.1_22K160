@interface TVPMyPSPlatform
- (BOOL)policyMayDownload;
- (BOOL)policyMaySendDelete;
- (BOOL)policyMayUpload;
- (BOOL)shouldEnableNewFeatures;
- (BOOL)shouldLogAtLevel:(int)a3;
- (Class)deletePluginClass;
- (Class)publisherPluginClass;
- (Class)subscriberPluginClass;
- (id)OSString;
- (id)UDID;
- (id)appBundleInfoString;
- (id)authTokenForPersonID:(id)a3;
- (id)baseURLForPersonID:(id)a3;
- (id)contentURLForPersonID:(id)a3;
- (id)fullNameFromFirstName:(id)a3 lastName:(id)a4;
- (id)hardwareString;
- (id)pathMediaStreamDir;
- (id)pushTokenForPersonID:(id)a3;
- (id)socketOptions;
- (id)theDaemon;
@end

@implementation TVPMyPSPlatform

- (BOOL)shouldLogAtLevel:(int)a3
{
  return 1;
}

- (id)fullNameFromFirstName:(id)a3 lastName:(id)a4
{
  return 0LL;
}

- (id)pathMediaStreamDir
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v3 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:@"MyPS"]);
  return v9;
}

- (Class)publisherPluginClass
{
  return 0LL;
}

- (Class)subscriberPluginClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___TVPMyPSAccessObject, a2);
}

- (Class)deletePluginClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___TVPMyPSAccessObject, a2);
}

- (id)UDID
{
  if (qword_1001032A8 != -1) {
    dispatch_once(&qword_1001032A8, &stru_1000CB348);
  }
  return (id)qword_1001032B0;
}

- (id)hardwareString
{
  return &stru_1000CC6C8;
}

- (id)OSString
{
  if (qword_1001032C0 != -1) {
    dispatch_once(&qword_1001032C0, &stru_1000CB368);
  }
  return (id)qword_1001032B8;
}

- (id)appBundleInfoString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bundleIdentifier]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForInfoDictionaryKey:@"CFBundleVersion"]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/%@", v3, v4));

  return v5;
}

- (BOOL)policyMayUpload
{
  return 0;
}

- (BOOL)policyMayDownload
{
  return 1;
}

- (BOOL)policyMaySendDelete
{
  return 1;
}

- (id)socketOptions
{
  return 0LL;
}

- (id)pushTokenForPersonID:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___TVSiCloudAccountManager);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSiCloudAccountManager activeAccount](v4, "activeAccount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_personID"));
  unsigned int v7 = [v6 isEqualToString:v3];

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 propertiesForDataclass:kAccountDataclassMediaStream]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"apsEnv"]);
    unsigned __int8 v10 = [v9 isEqualToString:@"production"];
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVCKPushNotificationServer sharedInstance]( &OBJC_CLASS___TVCKPushNotificationServer,  "sharedInstance"));
    v12 = v11;
    if ((v10 & 1) != 0) {
      uint64_t v13 = objc_claimAutoreleasedReturnValue([v11 publicToken]);
    }
    else {
      uint64_t v13 = objc_claimAutoreleasedReturnValue([v11 devToken]);
    }
    v14 = (void *)v13;
  }

  else
  {
    v14 = 0LL;
  }

  return v14;
}

- (id)contentURLForPersonID:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___TVSiCloudAccountManager);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSiCloudAccountManager activeAccount](v4, "activeAccount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_personID"));
  unsigned int v7 = [v6 isEqualToString:v3];

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 propertiesForDataclass:kAccountDataclassContent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"url"]);

    if (v9
      && (unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v9))) != 0LL)
    {
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue([v10 URLByAppendingPathComponent:v3]);
    }

    else
    {
      v12 = 0LL;
    }
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

- (BOOL)shouldEnableNewFeatures
{
  return 1;
}

- (id)baseURLForPersonID:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___TVSiCloudAccountManager);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSiCloudAccountManager activeAccount](v4, "activeAccount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_personID"));
  unsigned int v7 = [v6 isEqualToString:v3];

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 propertiesForDataclass:kAccountDataclassMediaStream]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"url"]);
    if (v9) {
      unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v9));
    }
    else {
      unsigned __int8 v10 = 0LL;
    }
  }

  else
  {
    unsigned __int8 v10 = 0LL;
  }

  return v10;
}

- (id)authTokenForPersonID:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___TVSiCloudAccountManager);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSiCloudAccountManager activeAccount](v4, "activeAccount"));
  v6 = v5;
  if (v5
    && (unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_personID")),
        unsigned int v8 = [v7 isEqualToString:v3],
        v7,
        v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aa_authToken"));
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

- (id)theDaemon
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100040820;
  block[3] = &unk_1000C9528;
  block[4] = self;
  if (qword_1001032D0 != -1) {
    dispatch_once(&qword_1001032D0, block);
  }
  return (id)qword_1001032C8;
}

@end