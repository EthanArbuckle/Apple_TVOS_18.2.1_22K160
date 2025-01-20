@interface KTLogNetworkRequest
- (NSString)application;
- (id)createGETRequestForURL:(id)a3 timeout:(double)a4 error:(id *)a5;
- (id)initGETWithURL:(id)a3 application:(id)a4;
- (id)initPOSTWithURL:(id)a3 data:(id)a4 uuid:(id)a5 application:(id)a6;
- (id)initPUSHWithURL:(id)a3 data:(id)a4 uuid:(id)a5 application:(id)a6;
- (void)createRequestForAuthentication:(id)a3 completionHandler:(id)a4;
- (void)createRequestForAuthentication:(id)a3 fetchAuthNow:(BOOL)a4 completionHandler:(id)a5;
- (void)setApplication:(id)a3;
@end

@implementation KTLogNetworkRequest

- (id)initGETWithURL:(id)a3 application:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___KTLogNetworkRequest;
  id v7 = -[TransparencyNetworkRequest initGETWithURL:](&v10, "initGETWithURL:", a3);
  v8 = v7;
  if (v7) {
    [v7 setApplication:v6];
  }

  return v8;
}

- (id)initPOSTWithURL:(id)a3 data:(id)a4 uuid:(id)a5 application:(id)a6
{
  id v10 = a6;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___KTLogNetworkRequest;
  id v11 = -[TransparencyNetworkRequest initPOSTWithURL:data:uuid:](&v14, "initPOSTWithURL:data:uuid:", a3, a4, a5);
  v12 = v11;
  if (v11)
  {
    [v11 setApplication:v10];
    [v12 setAuthenticated:1];
  }

  return v12;
}

- (id)initPUSHWithURL:(id)a3 data:(id)a4 uuid:(id)a5 application:(id)a6
{
  id v10 = a6;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___KTLogNetworkRequest;
  id v11 = -[TransparencyNetworkRequest initPUSHWithURL:data:uuid:](&v14, "initPUSHWithURL:data:uuid:", a3, a4, a5);
  v12 = v11;
  if (v11)
  {
    [v11 setApplication:v10];
    [v12 setAuthenticated:1];
  }

  return v12;
}

- (id)createGETRequestForURL:(id)a3 timeout:(double)a4 error:(id *)a5
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](&OBJC_CLASS___NSMutableURLRequest, "requestWithURL:", a3, a5));
  unint64_t v8 = ProtocolVersion_EnumDescriptor();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 textFormatNameForValue:kTransparencyProtocolVersion]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogNetworkRequest application](self, "application"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyApplication applicationValueForIdentifier:]( &OBJC_CLASS___TransparencyApplication,  "applicationValueForIdentifier:",  v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 stringValue]);

  v31[0] = @"Accept";
  v31[1] = off_1002E6248;
  v32[0] = @"application/protobuf";
  v32[1] = v13;
  v31[2] = off_1002E6250;
  v32[2] = v10;
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  3LL));
  id v15 = [v14 mutableCopy];

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencySettings automatedDeviceGroup]( &OBJC_CLASS___TransparencySettings,  "automatedDeviceGroup"));
  [v15 setObject:v16 forKeyedSubscript:off_1002E6258];

  v17 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencySettings transparencyVersionStr]( &OBJC_CLASS___TransparencySettings,  "transparencyVersionStr"));
  [v15 setObject:v17 forKeyedSubscript:off_1002E6260];

  -[TransparencyNetworkRequest setAdditionalHeaders:](self, "setAdditionalHeaders:", v15);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyNetworkRequest additionalHeaders](self, "additionalHeaders", 0LL));
  id v19 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)i);
        v24 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v23]);
        [v7 setValue:v24 forHTTPHeaderField:v23];
      }

      id v20 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v20);
  }

  [v7 setHTTPMethod:@"GET"];
  if (a4 != 0.0) {
    [v7 setTimeoutInterval:a4];
  }

  return v7;
}

- (void)createRequestForAuthentication:(id)a3 fetchAuthNow:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = (void (**)(id, void *, id))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyNetworkRequest additionalHeaders](self, "additionalHeaders"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyNetworkRequest additionalHeaders](self, "additionalHeaders"));
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v12));

    id v10 = (void *)v13;
  }

  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogNetworkRequest application](self, "application"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyApplication applicationValueForIdentifier:]( &OBJC_CLASS___TransparencyApplication,  "applicationValueForIdentifier:",  v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 stringValue]);

  [v10 setObject:v16 forKeyedSubscript:off_1002E6248];
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencySettings automatedDeviceGroup]( &OBJC_CLASS___TransparencySettings,  "automatedDeviceGroup"));
  [v10 setObject:v17 forKeyedSubscript:off_1002E6258];

  v18 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencySettings transparencyVersionStr]( &OBJC_CLASS___TransparencySettings,  "transparencyVersionStr"));
  [v10 setObject:v18 forKeyedSubscript:off_1002E6260];

  unint64_t v19 = -[TransparencyNetworkRequest httpMethod](self, "httpMethod");
  if (v19 - 1 >= 2)
  {
    if (!v19)
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyNetworkRequest url](self, "url"));
      +[TransparencySettings defaultNetworkTimeout](&OBJC_CLASS___TransparencySettings, "defaultNetworkTimeout");
      id v24 = 0LL;
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[KTLogNetworkRequest createGETRequestForURL:timeout:error:]( self,  "createGETRequestForURL:timeout:error:",  v20,  &v24));
      id v22 = v24;

      v9[2](v9, v21, v22);
    }
  }

  else
  {
    v23.receiver = self;
    v23.super_class = (Class)&OBJC_CLASS___KTLogNetworkRequest;
    -[TransparencyNetworkRequest createRequestForAuthentication:fetchAuthNow:additionalHeaders:completionHandler:]( &v23,  "createRequestForAuthentication:fetchAuthNow:additionalHeaders:completionHandler:",  v8,  v6,  v10,  v9);
  }
}

- (void)createRequestForAuthentication:(id)a3 completionHandler:(id)a4
{
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setApplication:(id)a3
{
}

- (void).cxx_destruct
{
}

@end