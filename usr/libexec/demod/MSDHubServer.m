@interface MSDHubServer
- (MSDHubServer)initWithCellularAccess:(BOOL)a3;
- (NSString)hmacKey;
- (id)taskInfoFromCommandRequest:(id)a3;
- (void)ack:(id)a3;
- (void)closeConnection;
- (void)downloadIPACachingHub:(id)a3;
- (void)downloadIPAPreCachingHub:(id)a3;
- (void)downloadManifest:(id)a3;
- (void)enroll:(id)a3;
- (void)getAccountSettings:(id)a3;
- (void)getFileDownloadCredential:(id)a3;
- (void)handleKVStore:(id)a3;
- (void)isEnrolled:(id)a3;
- (void)ping:(id)a3;
- (void)reportDone:(id)a3;
- (void)reportError:(id)a3;
- (void)setHmacKey:(id)a3;
- (void)unenroll:(id)a3;
@end

@implementation MSDHubServer

- (MSDHubServer)initWithCellularAccess:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MSDHubServer;
  v4 = -[MSDHubServer init](&v8, "init");
  if (v4)
  {
    v5 = -[MSDSession initWithCellularAccess:](objc_alloc(&OBJC_CLASS___MSDHubSession), "initWithCellularAccess:", v3);
    -[MSDServer setSession:](v4, "setSession:", v5);

    -[MSDHubServer setHmacKey:]( v4,  "setHmacKey:",  @"hLw5ZITZVjvdLVwAaitNnOsFhl3rDVAtRmKXQuYfxGSJ0n65eotJ569TOz97xmD3s6");
    v6 = v4;
  }

  return v4;
}

- (void)closeConnection
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MSDServer session](self, "session"));
  [v2 invalidate];
}

- (void)enroll:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    objc_super v8 = "-[MSDHubServer enroll:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s is called", (uint8_t *)&v7, 0xCu);
  }

  -[MSDHubServer setHmacKey:]( self,  "setHmacKey:",  @"hLw5ZITZVjvdLVwAaitNnOsFhl3rDVAtRmKXQuYfxGSJ0n65eotJ569TOz97xmD3s6");
  -[MSDServer sendRequest:toEndpoint:postData:maxRetry:]( self,  "sendRequest:toEndpoint:postData:maxRetry:",  v4,  @"/Register",  1LL,  2LL);
}

- (void)isEnrolled:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    objc_super v8 = "-[MSDHubServer isEnrolled:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s is called", (uint8_t *)&v7, 0xCu);
  }

  -[MSDServer sendRequest:toEndpoint:postData:maxRetry:]( self,  "sendRequest:toEndpoint:postData:maxRetry:",  v4,  @"/AuthCheck",  0LL,  2LL);
}

- (void)unenroll:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    objc_super v8 = "-[MSDHubServer unenroll:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s is called", (uint8_t *)&v7, 0xCu);
  }

  -[MSDServer sendRequest:toEndpoint:postData:maxRetry:]( self,  "sendRequest:toEndpoint:postData:maxRetry:",  v4,  @"/Unregister",  1LL,  2LL);
}

- (void)downloadManifest:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    objc_super v8 = "-[MSDHubServer downloadManifest:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s is called", (uint8_t *)&v7, 0xCu);
  }

  -[MSDServer sendQueryForRequest:toPath:maxRetry:]( self,  "sendQueryForRequest:toPath:maxRetry:",  v4,  @"/GetManifest",  2LL);
}

- (void)downloadIPACachingHub:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    objc_super v8 = "-[MSDHubServer downloadIPACachingHub:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s is called", (uint8_t *)&v7, 0xCu);
  }

  -[MSDServer sendQueryForRequest:toPath:maxRetry:]( self,  "sendQueryForRequest:toPath:maxRetry:",  v4,  @"/GetIPA",  2LL);
}

- (void)downloadIPAPreCachingHub:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    objc_super v8 = "-[MSDHubServer downloadIPAPreCachingHub:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s is called", (uint8_t *)&v7, 0xCu);
  }

  -[MSDServer sendRequest:toEndpoint:postData:maxRetry:]( self,  "sendRequest:toEndpoint:postData:maxRetry:",  v4,  @"/DownloadIPA",  1LL,  3LL);
}

- (void)getFileDownloadCredential:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    objc_super v8 = "-[MSDHubServer getFileDownloadCredential:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s is called", (uint8_t *)&v7, 0xCu);
  }

  -[MSDServer sendQueryForRequest:toPath:maxRetry:]( self,  "sendQueryForRequest:toPath:maxRetry:",  v4,  @"/GetFileDownloadCredentials",  3LL);
}

- (void)getAccountSettings:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    objc_super v8 = "-[MSDHubServer getAccountSettings:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s is called", (uint8_t *)&v7, 0xCu);
  }

  -[MSDServer sendRequest:toEndpoint:postData:maxRetry:]( self,  "sendRequest:toEndpoint:postData:maxRetry:",  v4,  @"/GetAccountSettings",  1LL,  2LL);
}

- (void)reportError:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    objc_super v8 = "-[MSDHubServer reportError:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s is called", (uint8_t *)&v7, 0xCu);
  }

  -[MSDServer sendRequest:toEndpoint:postData:maxRetry:]( self,  "sendRequest:toEndpoint:postData:maxRetry:",  v4,  @"/Error",  1LL,  3LL);
}

- (void)reportDone:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    objc_super v8 = "-[MSDHubServer reportDone:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s is called", (uint8_t *)&v7, 0xCu);
  }

  -[MSDServer sendRequest:toEndpoint:postData:maxRetry:]( self,  "sendRequest:toEndpoint:postData:maxRetry:",  v4,  @"/Done",  1LL,  3LL);
}

- (void)ping:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    objc_super v8 = "-[MSDHubServer ping:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s is called", (uint8_t *)&v7, 0xCu);
  }

  -[MSDServer sendRequest:toEndpoint:postData:maxRetry:]( self,  "sendRequest:toEndpoint:postData:maxRetry:",  v4,  @"/Ping",  1LL,  2LL);
}

- (void)ack:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    objc_super v8 = "-[MSDHubServer ack:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s is called", (uint8_t *)&v7, 0xCu);
  }

  -[MSDServer sendRequest:toEndpoint:postData:maxRetry:]( self,  "sendRequest:toEndpoint:postData:maxRetry:",  v4,  @"/Ack",  1LL,  2LL);
}

- (void)handleKVStore:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    v9 = "-[MSDHubServer handleKVStore:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s is called", (uint8_t *)&v8, 0xCu);
  }

  int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 getEndpoint]);
  -[MSDServer sendRequest:toEndpoint:postData:maxRetry:]( self,  "sendRequest:toEndpoint:postData:maxRetry:",  v4,  v7,  [v4 isPost],  2);
}

- (id)taskInfoFromCommandRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___MSDHubSessionTaskInfo);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 server]);
  -[MSDHubSessionTaskInfo setServer:](v5, "setServer:", v6);

  int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 port]);
  -[MSDHubSessionTaskInfo setPort:](v5, "setPort:", v7);

  int v8 = (void *)objc_claimAutoreleasedReturnValue([v4 savePath]);
  -[MSDSessionTaskInfo setSavePath:](v5, "setSavePath:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHubServer hmacKey](self, "hmacKey"));
  -[MSDHubSessionTaskInfo setHmacKey:](v5, "setHmacKey:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceUDID]);
  -[MSDHubSessionTaskInfo setDeviceUDID:](v5, "setDeviceUDID:", v10);

  return v5;
}

- (NSString)hmacKey
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setHmacKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end