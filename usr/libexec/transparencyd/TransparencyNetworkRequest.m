@interface TransparencyNetworkRequest
+ (BOOL)addAccountAuthentication:(id)a3 error:(id *)a4;
+ (void)addDeviceAuthentication:(id)a3 signature:(id)a4 timestamp:(id)a5 certs:(id)a6;
- (BOOL)allowEmptyData;
- (BOOL)authenticated;
- (BOOL)useReversePush;
- (NSData)data;
- (NSDictionary)additionalHeaders;
- (NSURL)url;
- (NSUUID)uuid;
- (TransparencyNetworkRequest)initWithRequest:(id)a3;
- (TransparencyNetworkRequest)initWithURL:(id)a3 data:(id)a4 timeout:(double)a5 httpMethod:(unint64_t)a6 uuid:(id)a7;
- (double)timeout;
- (id)createGETRequestForURL:(id)a3 timeout:(double)a4 additionalHeaders:(id)a5 error:(id *)a6;
- (id)initGETWithURL:(id)a3;
- (id)initPOSTWithURL:(id)a3 data:(id)a4 uuid:(id)a5;
- (id)initPUSHWithURL:(id)a3 data:(id)a4 uuid:(id)a5;
- (unint64_t)httpMethod;
- (void)createRequestForAuthentication:(id)a3 completionHandler:(id)a4;
- (void)createRequestForAuthentication:(id)a3 fetchAuthNow:(BOOL)a4 additionalHeaders:(id)a5 completionHandler:(id)a6;
- (void)createRequestForAuthentication:(id)a3 fetchAuthNow:(BOOL)a4 timeShift:(double)a5 additionalHeaders:(id)a6 completionHandler:(id)a7;
- (void)createRequestForAuthentication:(id)a3 fetchAuthNow:(BOOL)a4 timeShift:(double)a5 completionHandler:(id)a6;
- (void)createRequestForURL:(id)a3 timeout:(double)a4 contents:(id)a5 additionalHeaders:(id)a6 completionHandler:(id)a7;
- (void)createRequestForURL:(id)a3 timeout:(double)a4 contents:(id)a5 authentication:(id)a6 fetchAuthNow:(BOOL)a7 timeShift:(double)a8 additionalHeaders:(id)a9 completionHandler:(id)a10;
- (void)setAdditionalHeaders:(id)a3;
- (void)setAllowEmptyData:(BOOL)a3;
- (void)setAuthenticated:(BOOL)a3;
- (void)setData:(id)a3;
- (void)setHttpMethod:(unint64_t)a3;
- (void)setTimeout:(double)a3;
- (void)setUrl:(id)a3;
- (void)setUseReversePush:(BOOL)a3;
- (void)setUuid:(id)a3;
@end

@implementation TransparencyNetworkRequest

+ (BOOL)addAccountAuthentication:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAccount authToken:](&OBJC_CLASS___TransparencyAccount, "authToken:", a4));
  if (v6)
  {
    [v5 setValue:v6 forHTTPHeaderField:@"Authorization"];
  }

  else
  {
    if (qword_1002EE9B8 != -1) {
      dispatch_once(&qword_1002EE9B8, &stru_100283DA0);
    }
    v7 = (os_log_s *)qword_1002EE9C0;
    if (os_log_type_enabled((os_log_t)qword_1002EE9C0, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "account authentication failed as well", v9, 2u);
    }
  }

  return v6 != 0LL;
}

+ (void)addDeviceAuthentication:(id)a3 signature:(id)a4 timestamp:(id)a5 certs:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v14 = v12;
  id v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      v18 = 0LL;
      do
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        CFDataRef v19 = SecCertificateCopyData(*(SecCertificateRef *)(*((void *)&v23 + 1) + 8LL * (void)v18));
        [v13 appendData:v19];

        v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v16);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue([v13 base64EncodedStringWithOptions:0]);
  [v9 setValue:v20 forHTTPHeaderField:@"X-Apple-Baa-Certs"];
  v21 = (void *)objc_claimAutoreleasedReturnValue([v10 base64EncodedStringWithOptions:0]);
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:%@",  v21,  v11,  (void)v23));

  [v9 setValue:v22 forHTTPHeaderField:@"X-Apple-Baa-Signature"];
}

- (void)createRequestForURL:(id)a3 timeout:(double)a4 contents:(id)a5 authentication:(id)a6 fetchAuthNow:(BOOL)a7 timeShift:(double)a8 additionalHeaders:(id)a9 completionHandler:(id)a10
{
  BOOL v42 = a7;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  id v20 = a10;
  id v21 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](&OBJC_CLASS___NSMutableURLRequest, "requestWithURL:", a3));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyNetworkRequest uuid](self, "uuid"));
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 UUIDString]);
  [v21 setValue:v23 forHTTPHeaderField:off_1002E6240];

  unint64_t v24 = ProtocolVersion_EnumDescriptor();
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  uint64_t v26 = objc_claimAutoreleasedReturnValue([v25 textFormatNameForValue:kTransparencyProtocolVersion]);

  v43 = (void *)v26;
  [v21 setValue:v26 forHTTPHeaderField:off_1002E6250];
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencySettings transparencyVersionStr]( &OBJC_CLASS___TransparencySettings,  "transparencyVersionStr"));
  [v21 setValue:v27 forHTTPHeaderField:off_1002E6260];

  [v21 setHTTPBody:v17];
  unint64_t v28 = -[TransparencyNetworkRequest httpMethod](self, "httpMethod");
  if (v28 == 1)
  {
    v29 = @"POST";
  }

  else
  {
    if (v28 != 2) {
      goto LABEL_6;
    }
    v29 = @"PUSH";
  }

  [v21 setHTTPMethod:v29];
LABEL_6:
  v44 = (void (**)(void, void, void))v20;
  v30 = v18;
  v31 = v17;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id v32 = v19;
  id v33 = [v32 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v50;
    do
    {
      for (i = 0LL; i != v34; i = (char *)i + 1)
      {
        if (*(void *)v50 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = *(void *)(*((void *)&v49 + 1) + 8LL * (void)i);
        v38 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:v37]);
        [v21 setValue:v38 forHTTPHeaderField:v37];
      }

      id v34 = [v32 countByEnumeratingWithState:&v49 objects:v53 count:16];
    }

    while (v34);
  }

  v39 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencySettings automatedDeviceGroup]( &OBJC_CLASS___TransparencySettings,  "automatedDeviceGroup"));
  if (v39) {
    [v21 setValue:v39 forHTTPHeaderField:off_1002E6258];
  }
  if (a4 != 0.0) {
    [v21 setTimeoutInterval:a4];
  }
  if (-[TransparencyNetworkRequest authenticated](self, "authenticated"))
  {
    if ([v30 isSupported])
    {
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472LL;
      v46[2] = sub_100149CE0;
      v46[3] = &unk_100283DE8;
      v48 = v44;
      id v21 = v21;
      id v47 = v21;
      [v30 signDataWithTimestamp:v31 fetchNow:v42 timeShift:v46 completionHandler:a8];
    }

    else
    {
      id v45 = 0LL;
      unsigned __int8 v40 = +[TransparencyNetworkRequest addAccountAuthentication:error:]( &OBJC_CLASS___TransparencyNetworkRequest,  "addAccountAuthentication:error:",  v21,  &v45);
      id v41 = v45;
      if ((v40 & 1) == 0)
      {

        id v21 = 0LL;
      }

      ((void (**)(void, id, id))v44)[2](v44, v21, v41);
    }
  }

  else
  {
    ((void (**)(void, id, void))v44)[2](v44, v21, 0LL);
  }
}

- (id)createGETRequestForURL:(id)a3 timeout:(double)a4 additionalHeaders:(id)a5 error:(id *)a6
{
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](&OBJC_CLASS___NSMutableURLRequest, "requestWithURL:", a3));
  [v9 setHTTPMethod:@"GET"];
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)i);
        id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v15, (void)v19));
        [v9 setValue:v16 forHTTPHeaderField:v15];
      }

      id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v12);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencySettings automatedDeviceGroup]( &OBJC_CLASS___TransparencySettings,  "automatedDeviceGroup"));
  if (v17) {
    [v9 setValue:v17 forHTTPHeaderField:off_1002E6258];
  }
  if (a4 != 0.0) {
    [v9 setTimeoutInterval:a4];
  }

  return v9;
}

- (void)createRequestForAuthentication:(id)a3 fetchAuthNow:(BOOL)a4 timeShift:(double)a5 additionalHeaders:(id)a6 completionHandler:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a6;
  id v14 = (void (**)(id, void *, id))a7;
  unint64_t v15 = -[TransparencyNetworkRequest httpMethod](self, "httpMethod");
  if (v15 - 1 < 2)
  {
    id v16 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyNetworkRequest url](self, "url"));
    +[TransparencySettings defaultNetworkTimeout](&OBJC_CLASS___TransparencySettings, "defaultNetworkTimeout");
    double v18 = v17;
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyNetworkRequest data](self, "data"));
    -[TransparencyNetworkRequest createRequestForURL:timeout:contents:authentication:fetchAuthNow:timeShift:additionalHeaders:completionHandler:]( self,  "createRequestForURL:timeout:contents:authentication:fetchAuthNow:timeShift:additionalHeaders:completionHandler:",  v16,  v19,  v12,  v10,  v13,  v14,  v18,  a5);

LABEL_5:
    goto LABEL_6;
  }

  if (!v15)
  {
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyNetworkRequest url](self, "url"));
    +[TransparencySettings defaultNetworkTimeout](&OBJC_CLASS___TransparencySettings, "defaultNetworkTimeout");
    id v22 = 0LL;
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( -[TransparencyNetworkRequest createGETRequestForURL:timeout:additionalHeaders:error:]( self,  "createGETRequestForURL:timeout:additionalHeaders:error:",  v20,  v13,  &v22));
    id v16 = v22;

    v14[2](v14, v21, v16);
    goto LABEL_5;
  }

- (void)createRequestForAuthentication:(id)a3 fetchAuthNow:(BOOL)a4 additionalHeaders:(id)a5 completionHandler:(id)a6
{
}

- (void)createRequestForAuthentication:(id)a3 fetchAuthNow:(BOOL)a4 timeShift:(double)a5 completionHandler:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a3;
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyNetworkRequest additionalHeaders](self, "additionalHeaders"));
  -[TransparencyNetworkRequest createRequestForAuthentication:fetchAuthNow:timeShift:additionalHeaders:completionHandler:]( self,  "createRequestForAuthentication:fetchAuthNow:timeShift:additionalHeaders:completionHandler:",  v11,  v7,  v12,  v10,  a5);
}

- (void)createRequestForAuthentication:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyNetworkRequest additionalHeaders](self, "additionalHeaders"));
  -[TransparencyNetworkRequest createRequestForAuthentication:fetchAuthNow:timeShift:additionalHeaders:completionHandler:]( self,  "createRequestForAuthentication:fetchAuthNow:timeShift:additionalHeaders:completionHandler:",  v7,  0LL,  v8,  v6,  0.0);
}

- (id)initGETWithURL:(id)a3
{
  id v4 = a3;
  +[TransparencySettings defaultNetworkTimeout](&OBJC_CLASS___TransparencySettings, "defaultNetworkTimeout");
  id v5 = -[TransparencyNetworkRequest initWithURL:data:timeout:httpMethod:uuid:]( self,  "initWithURL:data:timeout:httpMethod:uuid:",  v4,  0LL,  0LL,  0LL);

  return v5;
}

- (id)initPOSTWithURL:(id)a3 data:(id)a4 uuid:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  +[TransparencySettings defaultNetworkTimeout](&OBJC_CLASS___TransparencySettings, "defaultNetworkTimeout");
  id v11 = -[TransparencyNetworkRequest initWithURL:data:timeout:httpMethod:uuid:]( self,  "initWithURL:data:timeout:httpMethod:uuid:",  v10,  v9,  1LL,  v8);

  return v11;
}

- (id)initPUSHWithURL:(id)a3 data:(id)a4 uuid:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  +[TransparencySettings defaultNetworkTimeout](&OBJC_CLASS___TransparencySettings, "defaultNetworkTimeout");
  id v11 = -[TransparencyNetworkRequest initWithURL:data:timeout:httpMethod:uuid:]( self,  "initWithURL:data:timeout:httpMethod:uuid:",  v10,  v9,  2LL,  v8);

  return v11;
}

- (TransparencyNetworkRequest)initWithURL:(id)a3 data:(id)a4 timeout:(double)a5 httpMethod:(unint64_t)a6 uuid:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (v12 && (v13 || !a6))
  {
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___TransparencyNetworkRequest;
    id v16 = -[TransparencyNetworkRequest init](&v19, "init");
    double v17 = v16;
    if (v16)
    {
      -[TransparencyNetworkRequest setUrl:](v16, "setUrl:", v12);
      -[TransparencyNetworkRequest setData:](v17, "setData:", v13);
      -[TransparencyNetworkRequest setTimeout:](v17, "setTimeout:", a5);
      -[TransparencyNetworkRequest setAuthenticated:](v17, "setAuthenticated:", 0LL);
      -[TransparencyNetworkRequest setHttpMethod:](v17, "setHttpMethod:", a6);
      -[TransparencyNetworkRequest setUuid:](v17, "setUuid:", v14);
    }

    self = v17;
    unint64_t v15 = self;
  }

  else
  {
    unint64_t v15 = 0LL;
  }

  return v15;
}

- (TransparencyNetworkRequest)initWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 URL]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 HTTPBody]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 HTTPMethod]);
  unsigned int v8 = [v7 isEqualToString:@"GET"];

  if (v8)
  {
    self = (TransparencyNetworkRequest *)-[TransparencyNetworkRequest initGETWithURL:](self, "initGETWithURL:", v5);
LABEL_15:
    double v17 = (void *)objc_claimAutoreleasedReturnValue([v4 allHTTPHeaderFields]);
    -[TransparencyNetworkRequest setAdditionalHeaders:](self, "setAdditionalHeaders:", v17);

    unint64_t v15 = self;
    goto LABEL_16;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 HTTPMethod]);
  unsigned int v10 = [v9 isEqualToString:@"POST"];

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForHTTPHeaderField:off_1002E6240]);
    if (v11) {
      id v12 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v11);
    }
    else {
      id v12 = 0LL;
    }
    id v16 = -[TransparencyNetworkRequest initPOSTWithURL:data:uuid:](self, "initPOSTWithURL:data:uuid:", v5, v6, v12);
LABEL_14:
    self = (TransparencyNetworkRequest *)v16;

    goto LABEL_15;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 HTTPMethod]);
  unsigned int v14 = [v13 isEqualToString:@"PUSH"];

  if (v14)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForHTTPHeaderField:off_1002E6240]);
    if (v11) {
      id v12 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v11);
    }
    else {
      id v12 = 0LL;
    }
    id v16 = -[TransparencyNetworkRequest initPUSHWithURL:data:uuid:](self, "initPUSHWithURL:data:uuid:", v5, v6, v12);
    goto LABEL_14;
  }

  unint64_t v15 = 0LL;
LABEL_16:

  return v15;
}

- (void)createRequestForURL:(id)a3 timeout:(double)a4 contents:(id)a5 additionalHeaders:(id)a6 completionHandler:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  unsigned int v14 = (void (**)(id, void *, void))a7;
  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](&OBJC_CLASS___NSMutableURLRequest, "requestWithURL:", a3));
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyNetworkRequest uuid](self, "uuid"));
  double v17 = (void *)objc_claimAutoreleasedReturnValue([v16 UUIDString]);
  [v15 setValue:v17 forHTTPHeaderField:off_1002E6240];

  unint64_t v18 = ProtocolVersion_EnumDescriptor();
  objc_super v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 textFormatNameForValue:kTransparencyProtocolVersion]);

  [v15 setValue:v20 forHTTPHeaderField:off_1002E6250];
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencySettings transparencyVersionStr]( &OBJC_CLASS___TransparencySettings,  "transparencyVersionStr"));
  [v15 setValue:v21 forHTTPHeaderField:off_1002E6260];

  [v15 setHTTPBody:v12];
  unint64_t v22 = -[TransparencyNetworkRequest httpMethod](self, "httpMethod");
  if (v22 == 1)
  {
    __int128 v23 = @"POST";
  }

  else
  {
    if (v22 != 2) {
      goto LABEL_6;
    }
    __int128 v23 = @"PUSH";
  }

  [v15 setHTTPMethod:v23];
LABEL_6:
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v24 = v13;
  id v25 = [v24 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v33;
    do
    {
      for (i = 0LL; i != v26; i = (char *)i + 1)
      {
        if (*(void *)v33 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)i);
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", v29, (void)v32));
        [v15 setValue:v30 forHTTPHeaderField:v29];
      }

      id v26 = [v24 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }

    while (v26);
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencySettings automatedDeviceGroup]( &OBJC_CLASS___TransparencySettings,  "automatedDeviceGroup"));
  if (v31) {
    [v15 setValue:v31 forHTTPHeaderField:off_1002E6258];
  }
  if (a4 != 0.0) {
    [v15 setTimeoutInterval:a4];
  }
  v14[2](v14, v15, 0LL);
}

- (BOOL)authenticated
{
  return self->_authenticated;
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_authenticated = a3;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setUrl:(id)a3
{
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setData:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (unint64_t)httpMethod
{
  return self->_httpMethod;
}

- (void)setHttpMethod:(unint64_t)a3
{
  self->_httpMethod = a3;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setUuid:(id)a3
{
}

- (NSDictionary)additionalHeaders
{
  return (NSDictionary *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setAdditionalHeaders:(id)a3
{
}

- (BOOL)allowEmptyData
{
  return self->_allowEmptyData;
}

- (void)setAllowEmptyData:(BOOL)a3
{
  self->_allowEmptyData = a3;
}

- (BOOL)useReversePush
{
  return self->_useReversePush;
}

- (void)setUseReversePush:(BOOL)a3
{
  self->_useReversePush = a3;
}

- (void).cxx_destruct
{
}

@end