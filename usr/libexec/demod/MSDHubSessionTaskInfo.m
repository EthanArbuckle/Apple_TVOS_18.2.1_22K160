@interface MSDHubSessionTaskInfo
- (BOOL)addAuthHeader;
- (BOOL)isValid;
- (NSString)deviceUDID;
- (NSString)endpoint;
- (NSString)hmacKey;
- (NSString)port;
- (NSString)server;
- (id)getRequestForTimeout:(double)a3;
- (void)setDeviceUDID:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setHmacKey:(id)a3;
- (void)setPort:(id)a3;
- (void)setServer:(id)a3;
@end

@implementation MSDHubSessionTaskInfo

- (BOOL)isValid
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MSDHubSessionTaskInfo;
  if (!-[MSDSessionTaskInfo isValid](&v7, "isValid")) {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHubSessionTaskInfo hmacKey](self, "hmacKey"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHubSessionTaskInfo deviceUDID](self, "deviceUDID"));
    BOOL v5 = v4 != 0LL;
  }

  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)getRequestForTimeout:(double)a3
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHubSessionTaskInfo deviceUDID](self, "deviceUDID"));

  if (!v5)
  {
    id v21 = sub_10003A95C();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100096730();
    }

    v10 = 0LL;
    goto LABEL_15;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHubSessionTaskInfo server](self, "server"));
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHubSessionTaskInfo port](self, "port"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHubSessionTaskInfo endpoint](self, "endpoint"));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"https://%@:%@%@",  v6,  v7,  v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v9));

  v11 = -[NSMutableURLRequest initWithURL:cachePolicy:timeoutInterval:]( objc_alloc(&OBJC_CLASS___NSMutableURLRequest),  "initWithURL:cachePolicy:timeoutInterval:",  v10,  1LL,  a3);
  -[MSDSessionTaskInfo setRequest:](self, "setRequest:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo postData](self, "postData"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo request](self, "request"));
  v14 = v13;
  if (v12)
  {
    [v13 setHTTPMethod:@"POST"];

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo request](self, "request"));
    [v14 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  }

  else
  {
    [v13 setHTTPMethod:@"GET"];
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo request](self, "request"));
  [v15 setValue:@"13" forHTTPHeaderField:@"X-Protocol-Version"];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHubSessionTaskInfo deviceUDID](self, "deviceUDID"));
  if (!v16)
  {
    id v23 = sub_10003A95C();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100096730();
    }

    goto LABEL_15;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo request](self, "request"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHubSessionTaskInfo deviceUDID](self, "deviceUDID"));
  [v17 setValue:v18 forHTTPHeaderField:@"X-Apple-OTA-UDID"];

  if (!-[MSDHubSessionTaskInfo addAuthHeader](self, "addAuthHeader"))
  {
LABEL_15:
    v19 = 0LL;
    goto LABEL_8;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo request](self, "request"));
LABEL_8:

  return v19;
}

- (BOOL)addAuthHeader
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHubSessionTaskInfo hmacKey](self, "hmacKey"));

  if (!v3)
  {
    id v14 = sub_10003A95C();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10009675C();
    }
    goto LABEL_10;
  }

  v4 = objc_alloc(&OBJC_CLASS___AluminiumAuthenticator);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHubSessionTaskInfo hmacKey](self, "hmacKey"));
  v6 = -[AluminiumAuthenticator initWithASCIIEncodedKey:](v4, "initWithASCIIEncodedKey:", v5);

  if (!v6)
  {
    id v16 = sub_10003A95C();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100096788();
    }
LABEL_10:
    v6 = 0LL;
    id v11 = 0LL;
    objc_super v7 = 0LL;
LABEL_13:

    BOOL v12 = 0;
    goto LABEL_5;
  }

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"X-Apple-OTA-UDID",  @"X-Apple-HMAC-Sent-Timestamp",  @"Host",  0LL));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo request](self, "request"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo postData](self, "postData"));
  id v18 = 0LL;
  unsigned __int8 v10 = -[AluminiumAuthenticator addAuthenticationHeadersToRequest:includedHeaders:body:algorithm:error:]( v6,  "addAuthenticationHeadersToRequest:includedHeaders:body:algorithm:error:",  v8,  v7,  v9,  0LL,  &v18);
  id v11 = v18;

  if ((v10 & 1) == 0)
  {
    id v17 = sub_10003A95C();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000967B4(v11, v15);
    }
    goto LABEL_13;
  }

  BOOL v12 = 1;
LABEL_5:

  return v12;
}

- (NSString)server
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setServer:(id)a3
{
}

- (NSString)port
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setPort:(id)a3
{
}

- (NSString)endpoint
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setEndpoint:(id)a3
{
}

- (NSString)hmacKey
{
  return (NSString *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setHmacKey:(id)a3
{
}

- (NSString)deviceUDID
{
  return (NSString *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setDeviceUDID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end