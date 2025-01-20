@interface MSDCommandServerRequest
- (BOOL)isValid;
- (NSArray)getQueryItems;
- (NSData)getPostData;
- (NSString)deviceUDID;
- (NSString)hubVersion;
- (NSString)port;
- (NSString)server;
- (id)copyWithZone:(_NSZone *)a3;
- (id)getDataDictFromPayload:(id)a3 error:(id *)a4;
- (void)setDeviceUDID:(id)a3;
- (void)setHubVersion:(id)a3;
- (void)setPort:(id)a3;
- (void)setServer:(id)a3;
@end

@implementation MSDCommandServerRequest

- (BOOL)isValid
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MSDCommandServerRequest;
  if (!-[MSDServerRequest isValid](&v9, "isValid")) {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCommandServerRequest server](self, "server"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCommandServerRequest port](self, "port"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCommandServerRequest deviceUDID](self, "deviceUDID"));
      if (v5)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCommandServerRequest hubVersion](self, "hubVersion"));
        BOOL v7 = v6 != 0LL;
      }

      else
      {
        BOOL v7 = 0;
      }
    }

    else
    {
      BOOL v7 = 0;
    }
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSArray)getQueryItems
{
  return 0LL;
}

- (NSData)getPostData
{
  return 0LL;
}

- (id)getDataDictFromPayload:(id)a3 error:(id *)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:@"data"]);
  id v7 = sub_10003A95C();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequest getName](self, "getName"));
    int v19 = 138543618;
    v20 = v9;
    __int16 v21 = 2114;
    v22 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@: data from server: %{public}@",  (uint8_t *)&v19,  0x16u);
  }

  if (!v6 || ![v6 length])
  {
    id v12 = sub_10003A95C();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100096544(self);
    }

    v14 = @"Request rejected by server.";
    v15 = a4;
    uint64_t v16 = 3727740934LL;
    goto LABEL_13;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryFromJsonData:](&OBJC_CLASS___NSDictionary, "dictionaryFromJsonData:", v6));
  if (!v10)
  {
    id v17 = sub_10003A95C();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000965C0(self);
    }

    uint64_t v16 = 3727744512LL;
    v14 = @"Unexpected server response.";
    v15 = a4;
LABEL_13:
    sub_100087610(v15, v16, (uint64_t)v14);
    v10 = 0LL;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSDCommandServerRequest;
  id v4 = -[MSDServerRequest copyWithZone:](&v6, "copyWithZone:", a3);
  [v4 setServer:self->_server];
  [v4 setPort:self->_port];
  [v4 setHubVersion:self->_hubVersion];
  [v4 setDeviceUDID:self->_deviceUDID];
  return v4;
}

- (NSString)server
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setServer:(id)a3
{
}

- (NSString)port
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setPort:(id)a3
{
}

- (NSString)hubVersion
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setHubVersion:(id)a3
{
}

- (NSString)deviceUDID
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setDeviceUDID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end