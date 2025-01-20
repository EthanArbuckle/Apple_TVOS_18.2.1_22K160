@interface MSDServerRequestHandler
+ (id)sharedInstance;
- (MSDDemoUnitServer)duServer;
- (MSDDownloadRequestManager)downloadManager;
- (MSDHubServer)hubServer;
- (MSDS3Server)s3Server;
- (MSDServerRequestHandler)init;
- (MSDTargetDevice)device;
- (NSDictionary)dispatchTable;
- (NSString)deviceUDID;
- (NSString)hubHostName;
- (NSString)hubPort;
- (id)getDispatchTable;
- (id)getDownloadFileRequestFromResponse:(id)a3 forFilePath:(id)a4;
- (id)getHmacKey;
- (id)handleRequest:(id)a3 synchronous:(BOOL)a4;
- (id)handleRequestSync:(id)a3;
- (id)updateFileDownloadCredentialFromManifestInfo:(id)a3;
- (void)autoFillCDNRequest:(id)a3;
- (void)autoFillCommandRequest:(id)a3;
- (void)autoFillRequest:(id)a3;
- (void)checkIPAForResponse:(id)a3 withRequest:(id)a4;
- (void)downloadIPAForResponse:(id)a3 withRequest:(id)a4;
- (void)handleAck:(id)a3;
- (void)handleDownloadFile:(id)a3;
- (void)handleDownloadIPA:(id)a3;
- (void)handleEnroll:(id)a3;
- (void)handleFMH:(id)a3;
- (void)handleGetAccountSettings:(id)a3;
- (void)handleIsEnrolled:(id)a3;
- (void)handleKVStore:(id)a3;
- (void)handleManifestDownload:(id)a3;
- (void)handlePing:(id)a3;
- (void)handleReportDone:(id)a3;
- (void)handleReportError:(id)a3;
- (void)handleRequestAsync:(id)a3;
- (void)handleS3Upload:(id)a3;
- (void)handleUnenroll:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDevice:(id)a3;
- (void)setDeviceUDID:(id)a3;
- (void)setDispatchTable:(id)a3;
- (void)setDownloadManager:(id)a3;
- (void)setDuServer:(id)a3;
- (void)setHubHostName:(id)a3;
- (void)setHubPort:(id)a3;
- (void)setHubServer:(id)a3;
- (void)setS3Server:(id)a3;
- (void)setupRequest:(id)a3;
- (void)updateHubHostNameAndPort;
@end

@implementation MSDServerRequestHandler

+ (id)sharedInstance
{
  if (qword_1001254A8 != -1) {
    dispatch_once(&qword_1001254A8, &stru_1000FA268);
  }
  return (id)qword_1001254A0;
}

- (MSDServerRequestHandler)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MSDServerRequestHandler;
  v2 = -[MSDServerRequestHandler init](&v12, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
    -[MSDServerRequestHandler setDevice:](v2, "setDevice:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler device](v2, "device"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 udid]);
    -[MSDServerRequestHandler setDeviceUDID:](v2, "setDeviceUDID:", v5);

    -[MSDServerRequestHandler setHubServer:](v2, "setHubServer:", 0LL);
    -[MSDServerRequestHandler setDownloadManager:](v2, "setDownloadManager:", 0LL);
    v6 = objc_alloc_init(&OBJC_CLASS___MSDDemoUnitServer);
    -[MSDServerRequestHandler setDuServer:](v2, "setDuServer:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler getDispatchTable](v2, "getDispatchTable"));
    -[MSDServerRequestHandler setDispatchTable:](v2, "setDispatchTable:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler device](v2, "device"));
    [v8 addObserver:v2 forKeyPath:@"hubHostName" options:1 context:0];

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler device](v2, "device"));
    [v9 addObserver:v2 forKeyPath:@"hubPort" options:1 context:0];

    -[MSDServerRequestHandler updateHubHostNameAndPort](v2, "updateHubHostNameAndPort");
    v10 = v2;
  }

  return v2;
}

- (void)handleRequestAsync:(id)a3
{
  id v5 = a3;
  -[MSDServerRequestHandler setupRequest:](self, "setupRequest:", v5);
  id v4 = -[MSDServerRequestHandler handleRequest:synchronous:](self, "handleRequest:synchronous:", v5, 0LL);
}

- (id)handleRequestSync:(id)a3
{
  id v4 = a3;
  -[MSDServerRequestHandler setupRequest:](self, "setupRequest:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler handleRequest:synchronous:](self, "handleRequest:synchronous:", v4, 1LL));

  return v5;
}

- (id)getHmacKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKeychainManager sharedInstance](&OBJC_CLASS___MSDKeychainManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 getItemForKey:@"com.apple.mobilestoredemo.keychainItemID"]);

  id v4 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v3, 4LL);
  return v4;
}

- (void)autoFillRequest:(id)a3
{
  id v8 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___MSDCommandServerRequest, v4);
  if ((objc_opt_isKindOfClass(v8, v5) & 1) != 0)
  {
    -[MSDServerRequestHandler autoFillCommandRequest:](self, "autoFillCommandRequest:", v8);
  }

  else
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___MSDCDNServerRequest, v6);
    if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0) {
      -[MSDServerRequestHandler autoFillCDNRequest:](self, "autoFillCDNRequest:", v8);
    }
  }
}

- (void)autoFillCommandRequest:(id)a3
{
  id v14 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v14 server]);

  if (!v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubHostName](v4, "hubHostName"));
    [v14 setServer:v6];
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v14 port]);

  if (!v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubPort](v4, "hubPort"));
    [v14 setPort:v8];
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v14 hubVersion]);

  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler device](v4, "device"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 hubProtocolVersion]);
    [v14 setHubVersion:v11];
  }

  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v14 deviceUDID]);

  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler deviceUDID](v4, "deviceUDID"));
    [v14 setDeviceUDID:v13];
  }

  objc_sync_exit(v4);
}

- (void)autoFillCDNRequest:(id)a3
{
  id v7 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v7 downloadCredentials]);

  if (!v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[MSDFileDownloadCredentials sharedInstance]( &OBJC_CLASS___MSDFileDownloadCredentials,  "sharedInstance"));
    [v7 setDownloadCredentials:v6];
  }

  objc_sync_exit(v4);
}

- (void)setupRequest:(id)a3
{
  id v25 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___MSDHubServerRequest, v5);
  if ((objc_opt_isKindOfClass(v25, v6) & 1) != 0
    || (uint64_t v8 = objc_opt_class(&OBJC_CLASS___MSDDownloadFileRequest, v7), (objc_opt_isKindOfClass(v25, v8) & 1) != 0))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubServer](v4, "hubServer"));

    if (!v10)
    {
      v11 = -[MSDHubServer initWithCellularAccess:]( objc_alloc(&OBJC_CLASS___MSDHubServer),  "initWithCellularAccess:",  1LL);
      -[MSDServerRequestHandler setHubServer:](v4, "setHubServer:", v11);

      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubServer](v4, "hubServer"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler getHmacKey](v4, "getHmacKey"));
      [v12 overrideHmacKey:v13];
    }
  }

  uint64_t v14 = objc_opt_class(&OBJC_CLASS___MSDCDNServerRequest, v9);
  if ((objc_opt_isKindOfClass(v25, v14) & 1) != 0
    || (uint64_t v16 = objc_opt_class(&OBJC_CLASS___MSDDownloadManifestRequest, v15), (objc_opt_isKindOfClass(v25, v16) & 1) != 0)
    || (uint64_t v18 = objc_opt_class(&OBJC_CLASS___MSDDownloadIPARequest, v17), (objc_opt_isKindOfClass(v25, v18) & 1) != 0))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler downloadManager](v4, "downloadManager"));

    if (!v20)
    {
      v21 = -[MSDDownloadRequestManager initWithCellularAccess:andFDCUpdateDelegate:]( objc_alloc(&OBJC_CLASS___MSDDownloadRequestManager),  "initWithCellularAccess:andFDCUpdateDelegate:",  1LL,  v4);
      -[MSDServerRequestHandler setDownloadManager:](v4, "setDownloadManager:", v21);
    }
  }

  uint64_t v22 = objc_opt_class(&OBJC_CLASS___MSDS3UploadRequest, v19);
  if ((objc_opt_isKindOfClass(v25, v22) & 1) != 0)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler s3Server](v4, "s3Server"));

    if (!v23)
    {
      v24 = -[MSDS3Server initWithCellularAccess:]( objc_alloc(&OBJC_CLASS___MSDS3Server),  "initWithCellularAccess:",  1LL);
      -[MSDServerRequestHandler setS3Server:](v4, "setS3Server:", v24);
    }
  }

  objc_sync_exit(v4);

  -[MSDServerRequestHandler autoFillRequest:](v4, "autoFillRequest:", v25);
}

- (id)handleRequest:(id)a3 synchronous:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  uint64_t v8 = 0LL;
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  v28 = sub_100052244;
  v29 = sub_100052254;
  id v30 = 0LL;
  if (v4)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10005225C;
    v22[3] = &unk_1000FA290;
    v24 = &v25;
    uint64_t v8 = dispatch_semaphore_create(0LL);
    v23 = v8;
    [v7 setCompletion:v22];
  }

  uint64_t v9 = (objc_class *)objc_opt_class(v7, v6);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler dispatchTable](self, "dispatchTable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allKeys]);
  unsigned int v14 = [v13 containsObject:v11];

  if (v14)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler dispatchTable](self, "dispatchTable"));
    uint64_t v16 = (NSString *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v11]);
    SEL v17 = NSSelectorFromString(v16);

    ((void (*)(MSDServerRequestHandler *, SEL, id))-[MSDServerRequestHandler methodForSelector:]( self,  "methodForSelector:",  v17))( self,  v17,  v7);
  }

  else
  {
    id v18 = sub_10003A95C();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v32 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Unrecognized request: %{public}@, ignoring...",  buf,  0xCu);
    }
  }

  if (v4) {
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  }
  id v20 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v20;
}

- (void)handleIsEnrolled:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubServer](self, "hubServer"));
  [v5 isEnrolled:v4];
}

- (void)handleEnroll:(id)a3
{
  id v4 = a3;
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  uint64_t v9 = sub_1000523A0;
  v10 = &unk_1000FA2B8;
  v11 = self;
  id v12 = (id)objc_claimAutoreleasedReturnValue([v4 completion]);
  id v5 = v12;
  [v4 setCompletion:&v7];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubServer](self, "hubServer", v7, v8, v9, v10, v11));
  [v6 enroll:v4];
}

- (void)handleUnenroll:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubServer](self, "hubServer"));
  [v5 unenroll:v4];
}

- (void)handleDownloadIPA:(id)a3
{
  id v4 = a3;
  id v5 = [v4 copy];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000528D8;
  v20[3] = &unk_1000FA2E0;
  v20[4] = self;
  id v6 = v4;
  id v21 = v6;
  [v5 setCompletion:v20];
  id v7 = [v6 copy];
  [v7 setSavePath:0];
  unsigned int v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  uint64_t v16 = sub_1000528E8;
  SEL v17 = &unk_1000FA2E0;
  id v18 = self;
  id v19 = v6;
  id v8 = v6;
  [v7 setCompletion:&v14];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler device](self, "device", v14, v15, v16, v17, v18));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 hubProtocolVersion]);
  unsigned int v11 = [v10 isEqualToString:@"2"];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubServer](self, "hubServer"));
  v13 = v12;
  if (v11) {
    [v12 downloadIPAPreCachingHub:v5];
  }
  else {
    [v12 downloadIPACachingHub:v7];
  }
}

- (void)handleManifestDownload:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 completion]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 savePath]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler device](self, "device"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 hubProtocolVersion]);
  unsigned int v9 = [v8 isEqualToString:@"3"];

  if (v9)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100052A20;
    v11[3] = &unk_1000FA308;
    v11[4] = self;
    id v12 = v6;
    id v13 = v5;
    [v4 setCompletion:v11];
    [v4 setSavePath:0];
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubServer](self, "hubServer"));
  [v10 downloadManifest:v4];
}

- (void)handleReportError:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubServer](self, "hubServer"));
  [v5 reportError:v4];
}

- (void)handleReportDone:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubServer](self, "hubServer"));
  [v5 reportDone:v4];
}

- (void)handleFMH:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler duServer](self, "duServer"));
  [v5 findMyHub:v4];
}

- (void)handleGetAccountSettings:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubServer](self, "hubServer"));
  [v5 getAccountSettings:v4];
}

- (void)handleDownloadFile:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubHostName](v5, "hubHostName"));
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubPort](v5, "hubPort"));

    if (v7)
    {
      objc_sync_exit(v5);

      id v8 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler downloadManager](v5, "downloadManager"));
      [v8 downloadFileForRequest:v4];
      id v9 = 0LL;
LABEL_8:

      goto LABEL_9;
    }
  }

  id v10 = sub_10003A95C();
  unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 getName]);
    sub_100099840(v12, buf, v11);
  }

  id v15 = 0LL;
  sub_100087610(&v15, 3727744769LL, (uint64_t)@"Input is invalid");
  id v9 = v15;
  objc_sync_exit(v5);

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 completion]);
  if (v13)
  {
    id v8 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v4 completion]);
    unsigned int v14 = -[MSDServerResponse initWithError:](objc_alloc(&OBJC_CLASS___MSDServerResponse), "initWithError:", v9);
    ((void (**)(void, MSDServerResponse *))v8)[2](v8, v14);

    goto LABEL_8;
  }

- (void)handlePing:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubServer](self, "hubServer"));
  [v5 ping:v4];
}

- (void)handleAck:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubServer](self, "hubServer"));
  [v5 ack:v4];
}

- (void)handleS3Upload:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler s3Server](self, "s3Server"));
  [v5 uploadMobileStoreDemoLogs:v4];
}

- (void)handleKVStore:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubServer](self, "hubServer"));
  [v5 handleKVStore:v4];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (([v9 isEqualToString:@"hubHostName"] & 1) != 0
    || [v9 isEqualToString:@"hubPort"])
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler device](self, "device"));

    if (v12 == v10)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:NSKeyValueChangeKindKey]);
      unsigned int v14 = [v13 intValue];

      if (v14 == 1)
      {
        id v15 = sub_10003A95C();
        uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 138543618;
          id v20 = (id)objc_opt_class(self, v17);
          __int16 v21 = 2114;
          id v22 = v9;
          id v18 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Observed %{public}@ change!",  (uint8_t *)&v19,  0x16u);
        }

        -[MSDServerRequestHandler updateHubHostNameAndPort](self, "updateHubHostNameAndPort");
      }
    }
  }
}

- (id)updateFileDownloadCredentialFromManifestInfo:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Updating file download credential...", buf, 2u);
  }

  dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
  *(void *)buf = 0LL;
  id v20 = buf;
  uint64_t v21 = 0x3032000000LL;
  id v22 = sub_100052244;
  v23 = sub_100052254;
  id v24 = 0LL;
  id v8 = objc_alloc_init(&OBJC_CLASS___MSDFileDownloadCredentialRequest);
  -[MSDServerRequestHandler autoFillCommandRequest:](self, "autoFillCommandRequest:", v8);
  -[MSDFileDownloadCredentialRequest setManifestInfo:](v8, "setManifestInfo:", v4);
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  id v15 = sub_100053234;
  uint64_t v16 = &unk_1000FA290;
  id v18 = buf;
  id v9 = v7;
  uint64_t v17 = v9;
  -[MSDServerRequest setCompletion:](v8, "setCompletion:", &v13);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubServer](self, "hubServer", v13, v14, v15, v16));
  [v10 getFileDownloadCredential:v8];

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  id v11 = *((id *)v20 + 5);

  _Block_object_dispose(buf, 8);
  return v11;
}

- (void)downloadIPAForResponse:(id)a3 withRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100053580;
  v19[3] = &unk_1000FA330;
  id v8 = v6;
  id v20 = v8;
  uint64_t v21 = self;
  id v9 = v7;
  id v22 = v9;
  id v10 = objc_retainBlock(v19);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 error]);

  if (v11)
  {
    uint64_t v14 = 0LL;
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 savePath]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 fileName]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByAppendingPathComponent:v13]);

    id v15 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[MSDServerRequestHandler getDownloadFileRequestFromResponse:forFilePath:]( self,  "getDownloadFileRequestFromResponse:forFilePath:",  v8,  v14));
    if (v15)
    {
      uint64_t v16 = v15;
      [v15 setCompletion:v10];
      -[MSDServerRequestHandler handleDownloadFile:](self, "handleDownloadFile:", v16);
      goto LABEL_4;
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:",  3727744512LL,  @"Unexpected server response."));
    [v8 setError:v17];
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 completion]);

  if (!v18) {
    goto LABEL_5;
  }
  uint64_t v16 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v9 completion]);
  ((void (**)(void, id))v16)[2](v16, v8);
LABEL_4:

LABEL_5:
}

- (void)checkIPAForResponse:(id)a3 withRequest:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);

  if (!v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v9 = sub_10003A95C();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 appID]);
      int v22 = 138543362;
      v23 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Checking IPA File for %{public}@",  (uint8_t *)&v22,  0xCu);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 savePath]);
    unsigned __int8 v13 = [v8 fileExistsAtPath:v12];

    if ((v13 & 1) != 0)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 savePath]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 attributesOfItemAtPath:v14 error:0]);

      if ([v15 fileSize])
      {
LABEL_6:

        goto LABEL_7;
      }

      id v20 = sub_10003A95C();
      int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1000998FC(v6);
      }
    }

    else
    {
      id v18 = sub_10003A95C();
      int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100099978(v6);
      }
      id v15 = 0LL;
    }

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:",  3727744512LL,  @"Unexpected server response."));
    [v5 setError:v21];

    goto LABEL_6;
  }

- (id)getDownloadFileRequestFromResponse:(id)a3 forFilePath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 fileName]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 originServer]);
  unsigned __int8 v9 = [v5 conformsToProtocol:&OBJC_PROTOCOL___MSDDownloadFileDetailsProtocol];
  id v10 = sub_10003A95C();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = v11;
  if ((v9 & 1) != 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543618;
      int v19 = v7;
      __int16 v20 = 2114;
      uint64_t v21 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Details to download file are: FileName = %{public}@, OriginServer = %{public}@",  (uint8_t *)&v18,  0x16u);
    }

    unsigned __int8 v13 = objc_alloc_init(&OBJC_CLASS___MSDDownloadFileRequest);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[MSDFileDownloadCredentials sharedInstance]( &OBJC_CLASS___MSDFileDownloadCredentials,  "sharedInstance"));
    -[MSDCDNServerRequest setDownloadCredentials:](v13, "setDownloadCredentials:", v14);

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadFileRequest fileInfo](v13, "fileInfo"));
    [v15 setFile:v7];

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadFileRequest fileInfo](v13, "fileInfo"));
    [v16 setFileHash:v7];

    -[MSDServerRequest setSavePath:](v13, "setSavePath:", v6);
    -[MSDCDNServerRequest setOriginServer:](v13, "setOriginServer:", v8);
  }

  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000999F4(v5);
    }

    unsigned __int8 v13 = 0LL;
  }

  return v13;
}

- (id)getDispatchTable
{
  return &off_100106650;
}

- (void)updateHubHostNameAndPort
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler device](v2, "device"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 hubHostName]);
  -[MSDServerRequestHandler setHubHostName:](v2, "setHubHostName:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler device](v2, "device"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 hubPort]);
  -[MSDServerRequestHandler setHubPort:](v2, "setHubPort:", v6);

  id v7 = sub_10003A95C();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubHostName](v2, "hubHostName"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequestHandler hubPort](v2, "hubPort"));
    int v11 = 136315650;
    id v12 = "-[MSDServerRequestHandler updateHubHostNameAndPort]";
    __int16 v13 = 2114;
    uint64_t v14 = v9;
    __int16 v15 = 2114;
    uint64_t v16 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s - updated hub host name: %{public}@ port: %{public}@",  (uint8_t *)&v11,  0x20u);
  }

  objc_sync_exit(v2);
}

- (NSString)hubHostName
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setHubHostName:(id)a3
{
}

- (NSString)hubPort
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setHubPort:(id)a3
{
}

- (NSString)deviceUDID
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setDeviceUDID:(id)a3
{
}

- (MSDTargetDevice)device
{
  return (MSDTargetDevice *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setDevice:(id)a3
{
}

- (MSDHubServer)hubServer
{
  return (MSDHubServer *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setHubServer:(id)a3
{
}

- (MSDDemoUnitServer)duServer
{
  return (MSDDemoUnitServer *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setDuServer:(id)a3
{
}

- (MSDS3Server)s3Server
{
  return (MSDS3Server *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setS3Server:(id)a3
{
}

- (MSDDownloadRequestManager)downloadManager
{
  return (MSDDownloadRequestManager *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setDownloadManager:(id)a3
{
}

- (NSDictionary)dispatchTable
{
  return (NSDictionary *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setDispatchTable:(id)a3
{
}

- (void).cxx_destruct
{
}

@end