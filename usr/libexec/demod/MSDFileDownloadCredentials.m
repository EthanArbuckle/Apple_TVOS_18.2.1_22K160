@interface MSDFileDownloadCredentials
+ (MSDFileDownloadCredentials)sharedInstance;
- (BOOL)isCachingHubAvailable;
- (BOOL)isExpired:(id)a3;
- (BOOL)isValidForOriginServer:(id)a3;
- (BOOL)loadFromFile;
- (BOOL)saveInfoToFile:(id)a3;
- (BOOL)updateWithResponseFromGetFileDownloadCredentials:(id)a3;
- (BOOL)updateWithResponseFromGetManifestInfo:(id)a3;
- (NSDictionary)credentials;
- (NSDictionary)manifestInfo;
- (NSString)currentOriginServer;
- (id)localCredentialForOriginServer:(id)a3;
- (id)remoteCredentialForOriginServer:(id)a3;
- (void)setCredentials:(id)a3;
- (void)setCurrentOriginServer:(id)a3;
- (void)setManifestInfo:(id)a3;
@end

@implementation MSDFileDownloadCredentials

+ (MSDFileDownloadCredentials)sharedInstance
{
  if (qword_1001254C8 != -1) {
    dispatch_once(&qword_1001254C8, &stru_1000FA438);
  }
  return (MSDFileDownloadCredentials *)(id)qword_1001254C0;
}

- (BOOL)updateWithResponseFromGetManifestInfo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"FileDownloadCredentials"]);
    -[MSDFileDownloadCredentials setCredentials:](self, "setCredentials:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileDownloadCredentials credentials](self, "credentials"));
    if (!v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
      -[MSDFileDownloadCredentials setCredentials:](self, "setCredentials:", v8);
    }

    id v9 = [v5 mutableCopy];
    [v9 removeObjectForKey:@"FileDownloadCredentials"];
    id v10 = [v9 mutableCopy];
    -[MSDFileDownloadCredentials setManifestInfo:](self, "setManifestInfo:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileDownloadCredentials credentials](self, "credentials"));
    [v9 setObject:v11 forKey:@"FileDownloadCredentials"];

    BOOL v12 = -[MSDFileDownloadCredentials saveInfoToFile:](self, "saveInfoToFile:", v9);
  }

  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)updateWithResponseFromGetFileDownloadCredentials:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileDownloadCredentials manifestInfo](self, "manifestInfo"));
  id v6 = [v5 mutableCopy];

  -[MSDFileDownloadCredentials setCredentials:](self, "setCredentials:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileDownloadCredentials credentials](self, "credentials"));

  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
    -[MSDFileDownloadCredentials setCredentials:](self, "setCredentials:", v8);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileDownloadCredentials credentials](self, "credentials"));
  [v6 setObject:v9 forKey:@"FileDownloadCredentials"];

  BOOL v10 = -[MSDFileDownloadCredentials saveInfoToFile:](self, "saveInfoToFile:", v6);
  return v10;
}

- (NSDictionary)manifestInfo
{
  manifestInfo = self->_manifestInfo;
  if (!manifestInfo)
  {
    if (!-[MSDFileDownloadCredentials loadFromFile](self, "loadFromFile"))
    {
      id v4 = 0LL;
      return v4;
    }

    manifestInfo = self->_manifestInfo;
  }

  id v4 = manifestInfo;
  return v4;
}

- (id)localCredentialForOriginServer:(id)a3
{
  id v4 = (__CFString *)a3;
  if (v4) {
    v5 = v4;
  }
  else {
    v5 = @"default";
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileDownloadCredentials credentials](self, "credentials"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"local"]);

  if (v7) {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v5]);
  }
  else {
    v8 = 0LL;
  }

  return v8;
}

- (id)remoteCredentialForOriginServer:(id)a3
{
  id v4 = (__CFString *)a3;
  if (v4) {
    v5 = v4;
  }
  else {
    v5 = @"default";
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileDownloadCredentials credentials](self, "credentials"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"remote"]);

  if (v7) {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v5]);
  }
  else {
    v8 = 0LL;
  }

  return v8;
}

- (BOOL)isValidForOriginServer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[MSDFileDownloadCredentials localCredentialForOriginServer:](self, "localCredentialForOriginServer:", v4));
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[MSDFileDownloadCredentials remoteCredentialForOriginServer:](self, "remoteCredentialForOriginServer:", v4));

  if (v5 | v6 && !-[MSDFileDownloadCredentials isExpired:](self, "isExpired:", v5)) {
    unsigned int v7 = !-[MSDFileDownloadCredentials isExpired:](self, "isExpired:", v6);
  }
  else {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)isCachingHubAvailable
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileDownloadCredentials credentials](self, "credentials"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"local"]);
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (BOOL)isExpired:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v4 timeIntervalSince1970];
  double v6 = v5;

  if (v3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"Expires"]);
    if (v8 && (uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber, v7), (objc_opt_isKindOfClass(v8, v9) & 1) != 0))
    {
      BOOL v10 = (uint64_t)[v8 longLongValue] < (uint64_t)v6 + 30;
    }

    else
    {
      id v12 = sub_10003A95C();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No expire epoch found.", v14, 2u);
      }

      BOOL v10 = 1;
    }
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)loadFromFile
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 manifestAndFileDownloadInfoPath]);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v4));

  id v12 = 0LL;
  double v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v5,  &v12));
  id v7 = v12;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v6));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"FileDownloadCredentials"]);
    -[MSDFileDownloadCredentials setCredentials:](self, "setCredentials:", v9);

    [v8 removeObjectForKey:@"FileDownloadCredentials"];
    -[MSDFileDownloadCredentials setManifestInfo:](self, "setManifestInfo:", v8);
  }

  else
  {
    id v11 = sub_10003A95C();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
      sub_10009A950(v5, v7);
    }
  }

  return v6 != 0LL;
}

- (BOOL)saveInfoToFile:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 manifestAndFileDownloadInfoPath]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByDeletingLastPathComponent]);
  if ([v4 fileExistsAtPath:v7])
  {
    id v8 = 0LL;
  }

  else
  {
    id v19 = 0LL;
    unsigned __int8 v9 = [v4 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v19];
    id v8 = v19;
    if ((v9 & 1) == 0)
    {
      id v17 = sub_10003A95C();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10009AA90((uint64_t)v7, v8);
      }
      id v11 = 0LL;
      goto LABEL_12;
    }
  }

  BOOL v10 = v8;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v6));
  id v18 = v8;
  unsigned __int8 v12 = [v3 writeToURL:v11 error:&v18];
  id v8 = v18;

  if ((v12 & 1) == 0)
  {
    id v15 = sub_10003A95C();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10009A9F0(v11, v8);
    }
LABEL_12:

    BOOL v13 = 0;
    goto LABEL_6;
  }

  BOOL v13 = 1;
LABEL_6:

  return v13;
}

- (void)setManifestInfo:(id)a3
{
}

- (NSDictionary)credentials
{
  return (NSDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setCredentials:(id)a3
{
}

- (NSString)currentOriginServer
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setCurrentOriginServer:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end