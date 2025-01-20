@interface FANetworkService
- (AAURLSession)urlSession;
- (ACAccount)account;
- (FADeviceInfoProtocol)deviceInfo;
- (FAFamilyFetchActivityScheduler)familyRefreshActivityScheduler;
- (FANetworkService)initWithAccount:(id)a3 deviceInfo:(id)a4 urlProvider:(id)a5 urlSession:(id)a6;
- (FANetworkService)initWithAccount:(id)a3 deviceInfo:(id)a4 urlProvider:(id)a5 urlSession:(id)a6 familyRefreshActivityScheduler:(id)a7;
- (FAURLProvider)urlProvider;
- (id)_convertServerResponse:(id)a3 toFormat:(int64_t)a4;
- (id)dataWithRequest:(id)a3;
- (id)ensureAccount;
- (id)ensureDeviceUnlockedSinceBoot;
- (id)plistWithRequest:(id)a3;
- (id)plistWithResponse:(id)a3;
- (id)serverRequest:(id)a3 toFormat:(int64_t)a4;
- (id)serverResponse:(id)a3 toFormat:(int64_t)a4;
- (id)signedRequestWithEndpoint:(id)a3;
- (id)signedRequestWithEndpoint:(id)a3 method:(id)a4 headers:(id)a5 plistBody:(id)a6;
- (id)signedRequestWithURL:(id)a3;
- (id)signedRequestWithURL:(id)a3 method:(id)a4 headers:(id)a5 plistBody:(id)a6;
- (id)signedRequestWithURL:(id)a3 method:(id)a4 headers:(id)a5 plistBody:(id)a6 requestFormat:(int64_t)a7;
- (id)signedRequestWithURL:(id)a3 method:(id)a4 headers:(id)a5 plistBody:(id)a6 requestFormat:(int64_t)a7 responseFormat:(int64_t)a8;
- (id)standardPlistRequestWithEndpoint:(id)a3;
- (id)standardPlistRequestWithEndpoint:(id)a3 method:(id)a4 plistBody:(id)a5;
- (id)standardPlistRequestWithUrl:(id)a3 method:(id)a4 plistBody:(id)a5;
- (id)standardRequestWithEndpoint:(id)a3 method:(id)a4 plistBody:(id)a5 requestFormat:(int64_t)a6 responseFormat:(int64_t)a7;
- (id)standardRequestWithURL:(id)a3 grandSlamSigner:(id)a4 familyGrandSlamSigner:(id)a5 method:(id)a6 body:(id)a7 requestFormat:(int64_t)a8 responseFormat:(int64_t)a9;
- (id)standardRequestWithURL:(id)a3 method:(id)a4 body:(id)a5 requestFormat:(int64_t)a6 responseFormat:(int64_t)a7;
- (void)setAcceptHeaderForRequest:(id)a3 format:(int64_t)a4;
- (void)setContentTypeHeaderForRequest:(id)a3 format:(int64_t)a4;
- (void)setFamilyRefreshActivityScheduler:(id)a3;
@end

@implementation FANetworkService

- (FANetworkService)initWithAccount:(id)a3 deviceInfo:(id)a4 urlProvider:(id)a5 urlSession:(id)a6
{
  return -[FANetworkService initWithAccount:deviceInfo:urlProvider:urlSession:familyRefreshActivityScheduler:]( self,  "initWithAccount:deviceInfo:urlProvider:urlSession:familyRefreshActivityScheduler:",  a3,  a4,  a5,  a6,  0LL);
}

- (FANetworkService)initWithAccount:(id)a3 deviceInfo:(id)a4 urlProvider:(id)a5 urlSession:(id)a6 familyRefreshActivityScheduler:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___FANetworkService;
  v17 = -[FANetworkService init](&v21, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_account, a3);
    objc_storeStrong((id *)&v18->_urlProvider, a5);
    objc_storeStrong((id *)&v18->_urlSession, a6);
    objc_storeStrong((id *)&v18->_deviceInfo, a4);
    objc_storeStrong((id *)&v18->_familyRefreshActivityScheduler, a7);
  }

  return v18;
}

- (id)ensureDeviceUnlockedSinceBoot
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[FANetworkService deviceInfo](self, "deviceInfo"));
  if (v3
    && (v5 = (void *)v3,
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[FANetworkService deviceInfo](self, "deviceInfo")),
        unsigned int v7 = [v6 unlockedSinceBoot],
        v6,
        v5,
        v7))
  {
    v8 = -[AAFPromise initWithValue:](objc_alloc(&OBJC_CLASS___AAFPromise), "initWithValue:", &__kCFBooleanTrue);
  }

  else
  {
    uint64_t v9 = _FALogSystem(v3, v4);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002B0E8(v10, v11, v12, v13, v14, v15, v16, v17);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError fa_familyErrorWithCode:](&OBJC_CLASS___NSError, "fa_familyErrorWithCode:", -1010LL));
    v8 = -[AAFPromise initWithError:](objc_alloc(&OBJC_CLASS___AAFPromise), "initWithError:", v18);
  }

  return v8;
}

- (id)ensureAccount
{
  if (self->_account)
  {
    v2 = -[AAFPromise initWithValue:](objc_alloc(&OBJC_CLASS___AAFPromise), "initWithValue:", self->_account);
  }

  else
  {
    uint64_t v3 = _FALogSystem(self, a2);
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10002B11C(v4, v5, v6, v7, v8, v9, v10, v11);
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError fa_familyErrorWithCode:](&OBJC_CLASS___NSError, "fa_familyErrorWithCode:", -1004LL));
    v2 = -[AAFPromise initWithError:](objc_alloc(&OBJC_CLASS___AAFPromise), "initWithError:", v12);
  }

  return v2;
}

- (id)signedRequestWithEndpoint:(id)a3
{
  return -[FANetworkService signedRequestWithEndpoint:method:headers:plistBody:]( self,  "signedRequestWithEndpoint:method:headers:plistBody:",  a3,  @"GET",  0LL,  0LL);
}

- (id)signedRequestWithEndpoint:(id)a3 method:(id)a4 headers:(id)a5 plistBody:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[FANetworkService urlProvider](self, "urlProvider"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 URLForEndpoint:v13]);

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 then]);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000172EC;
  v24[3] = &unk_1000420D8;
  v24[4] = self;
  id v25 = v10;
  id v26 = v11;
  id v27 = v12;
  uint64_t v17 = (uint64_t (*)(void *, void *))v16[2];
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  uint64_t v21 = v17(v16, v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

  return v22;
}

- (id)signedRequestWithURL:(id)a3
{
  return -[FANetworkService signedRequestWithURL:method:headers:plistBody:]( self,  "signedRequestWithURL:method:headers:plistBody:",  a3,  @"GET",  0LL,  0LL);
}

- (id)signedRequestWithURL:(id)a3 method:(id)a4 headers:(id)a5 plistBody:(id)a6
{
  return -[FANetworkService signedRequestWithURL:method:headers:plistBody:requestFormat:]( self,  "signedRequestWithURL:method:headers:plistBody:requestFormat:",  a3,  a4,  a5,  a6,  1LL);
}

- (id)signedRequestWithURL:(id)a3 method:(id)a4 headers:(id)a5 plistBody:(id)a6 requestFormat:(int64_t)a7
{
  return -[FANetworkService signedRequestWithURL:method:headers:plistBody:requestFormat:responseFormat:]( self,  "signedRequestWithURL:method:headers:plistBody:requestFormat:responseFormat:",  a3,  a4,  a5,  a6,  a7,  1LL);
}

- (void)setAcceptHeaderForRequest:(id)a3 format:(int64_t)a4
{
  id v5 = a3;
  if (a4 == 2)
  {
    uint64_t v6 = @"application/json";
    goto LABEL_5;
  }

  if (a4 == 1)
  {
    uint64_t v6 = @"application/x-plist";
LABEL_5:
    id v7 = v5;
    [v5 setValue:v6 forHTTPHeaderField:@"Accept"];
    id v5 = v7;
  }
}

- (void)setContentTypeHeaderForRequest:(id)a3 format:(int64_t)a4
{
  id v5 = a3;
  if (a4 == 2)
  {
    uint64_t v6 = @"application/json";
    goto LABEL_5;
  }

  if (a4 == 1)
  {
    uint64_t v6 = @"application/x-plist";
LABEL_5:
    id v7 = v5;
    [v5 setValue:v6 forHTTPHeaderField:@"Content-Type"];
    id v5 = v7;
  }
}

- (id)signedRequestWithURL:(id)a3 method:(id)a4 headers:(id)a5 plistBody:(id)a6 requestFormat:(int64_t)a7 responseFormat:(int64_t)a8
{
  id v14 = a4;
  id v15 = a6;
  id v16 = a5;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](&OBJC_CLASS___NSMutableURLRequest, "requestWithURL:", a3));
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[FANetworkService account](self, "account"));

  if (v18)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[FANetworkService account](self, "account"));
    objc_msgSend(v17, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", v19, 0);

    objc_msgSend(v17, "ak_addAnisetteHeaders");
  }

  objc_msgSend(v17, "ak_addClientInfoHeader");
  -[FANetworkService setContentTypeHeaderForRequest:format:](self, "setContentTypeHeaderForRequest:format:", v17, a7);
  -[FANetworkService setAcceptHeaderForRequest:format:](self, "setAcceptHeaderForRequest:format:", v17, a8);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100017644;
  v30[3] = &unk_100042100;
  id v20 = v17;
  id v31 = v20;
  [v16 enumerateKeysAndObjectsUsingBlock:v30];

  if (v14) {
    [v20 setHTTPMethod:v14];
  }
  if (!v15) {
    goto LABEL_14;
  }
  if (a7 == 2)
  {
    v29 = 0LL;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v15,  0LL,  &v29));
    v22 = v29;
  }

  else
  {
    v28 = 0LL;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v15,  100LL,  0LL,  &v28));
    v22 = v28;
  }

  id v23 = v22;
  if (!v23)
  {
    [v20 setHTTPBody:v21];

LABEL_14:
    id v26 = objc_alloc(&OBJC_CLASS___AAFPromise);
    id v24 = [v20 copy];
    id v25 = -[AAFPromise initWithValue:](v26, "initWithValue:", v24);
    goto LABEL_15;
  }

  id v24 = v23;
  id v25 = -[AAFPromise initWithError:](objc_alloc(&OBJC_CLASS___AAFPromise), "initWithError:", v23);

LABEL_15:
  return v25;
}

- (id)dataWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___AAFPromise);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000176EC;
  v9[3] = &unk_100041048;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = -[AAFPromise initWithBlock:](v5, "initWithBlock:", v9);

  return v7;
}

- (id)plistWithRequest:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[FANetworkService dataWithRequest:](self, "dataWithRequest:", a3));
  id v5 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v4 then]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000178FC;
  v9[3] = &unk_100042150;
  v9[4] = self;
  uint64_t v6 = ((uint64_t (**)(void, void *))v5)[2](v5, v9);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)plistWithResponse:(id)a3
{
  return -[FANetworkService _convertServerResponse:toFormat:](self, "_convertServerResponse:toFormat:", a3, 1LL);
}

- (id)serverRequest:(id)a3 toFormat:(int64_t)a4
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[FANetworkService dataWithRequest:](self, "dataWithRequest:", a3));
  id v7 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v6 then]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100017AC8;
  v11[3] = &unk_100042178;
  v11[4] = self;
  v11[5] = a4;
  uint64_t v8 = ((uint64_t (**)(void, void *))v7)[2](v7, v11);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (id)serverResponse:(id)a3 toFormat:(int64_t)a4
{
  return -[FANetworkService _convertServerResponse:toFormat:](self, "_convertServerResponse:toFormat:", a3, 1LL);
}

- (id)_convertServerResponse:(id)a3 toFormat:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 body]);

  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 body]);
    if (a4 == 2)
    {
      id v26 = 0LL;
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v8,  0LL,  &v26));
      id v10 = v26;
    }

    else
    {
      id v25 = 0LL;
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v8,  0LL,  0LL,  &v25));
      id v10 = v25;
    }

    id v12 = v10;

    if (v12)
    {
      id v13 = objc_alloc(&OBJC_CLASS___NSString);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 body]);
      id v15 = -[NSString initWithData:encoding:](v13, "initWithData:encoding:", v14, 4LL);

      uint64_t v18 = _FALogSystem(v16, v17);
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = (void *)objc_opt_class(self);
        id v21 = v20;
        v22 = (void *)objc_claimAutoreleasedReturnValue([v6 HTTPResponse]);
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 allHeaderFields]);
        *(_DWORD *)buf = 138413058;
        v28 = v20;
        __int16 v29 = 2112;
        id v30 = v12;
        __int16 v31 = 2112;
        v32 = v15;
        __int16 v33 = 2112;
        v34 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%@: Failed to parse server response with error %@ - %@ - %@",  buf,  0x2Au);
      }

      id v11 = -[AAFPromise initWithError:](objc_alloc(&OBJC_CLASS___AAFPromise), "initWithError:", v12);
    }

    else
    {
      id v11 = -[AAFPromise initWithValue:](objc_alloc(&OBJC_CLASS___AAFPromise), "initWithValue:", v9);
    }
  }

  else
  {
    id v11 = -[AAFPromise initWithValue:](objc_alloc(&OBJC_CLASS___AAFPromise), "initWithValue:", &__NSDictionary0__struct);
  }

  return v11;
}

- (id)standardPlistRequestWithEndpoint:(id)a3
{
  return -[FANetworkService standardPlistRequestWithEndpoint:method:plistBody:]( self,  "standardPlistRequestWithEndpoint:method:plistBody:",  a3,  @"GET",  0LL);
}

- (id)standardPlistRequestWithEndpoint:(id)a3 method:(id)a4 plistBody:(id)a5
{
  return -[FANetworkService standardRequestWithEndpoint:method:plistBody:requestFormat:responseFormat:]( self,  "standardRequestWithEndpoint:method:plistBody:requestFormat:responseFormat:",  a3,  a4,  a5,  1LL,  1LL);
}

- (id)standardRequestWithEndpoint:(id)a3 method:(id)a4 plistBody:(id)a5 requestFormat:(int64_t)a6 responseFormat:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[FANetworkService ensureDeviceUnlockedSinceBoot](self, "ensureDeviceUnlockedSinceBoot"));
  id v15 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v36 then]);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_1000180CC;
  v45[3] = &unk_100040EA0;
  v45[4] = self;
  uint64_t v16 = ((uint64_t (**)(void, void *))v15)[2](v15, v45);
  v35 = (void *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v35 then]);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_1000180D4;
  v43[3] = &unk_1000421A0;
  v43[4] = self;
  id v44 = v12;
  uint64_t v18 = (uint64_t (*)(void *, void *))v17[2];
  id v34 = v12;
  uint64_t v19 = v18(v17, v43);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 then]);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_100018118;
  v38[3] = &unk_1000421C8;
  v38[4] = self;
  id v39 = v13;
  id v40 = v14;
  int64_t v41 = a6;
  int64_t v42 = a7;
  v22 = (uint64_t (*)(void *, void *))v21[2];
  id v33 = v14;
  id v32 = v13;
  uint64_t v23 = v22(v21, v38);
  id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  id v25 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v24 then]);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_100018138;
  v37[3] = &unk_1000421F0;
  v37[4] = self;
  v37[5] = a7;
  uint64_t v26 = ((uint64_t (**)(void, void *))v25)[2](v25, v37);
  id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v28 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v27 then]);
  uint64_t v29 = ((uint64_t (**)(void, Block_layout *))v28)[2](v28, &stru_100042210);
  id v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

  return v30;
}

- (id)standardRequestWithURL:(id)a3 method:(id)a4 body:(id)a5 requestFormat:(int64_t)a6 responseFormat:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v32 = (void *)objc_claimAutoreleasedReturnValue(-[FANetworkService ensureDeviceUnlockedSinceBoot](self, "ensureDeviceUnlockedSinceBoot"));
  id v15 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v32 then]);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_100018340;
  v40[3] = &unk_100040EA0;
  v40[4] = self;
  uint64_t v16 = ((uint64_t (**)(void, void *))v15)[2](v15, v40);
  __int16 v31 = (void *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v31 then]);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_100018348;
  v34[3] = &unk_100042238;
  v34[4] = self;
  id v35 = v12;
  id v36 = v13;
  id v37 = v14;
  int64_t v38 = a6;
  int64_t v39 = a7;
  uint64_t v18 = (uint64_t (*)(void *, void *))v17[2];
  id v30 = v14;
  id v19 = v13;
  id v20 = v12;
  uint64_t v21 = v18(v17, v34);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  uint64_t v23 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v22 then]);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100018364;
  v33[3] = &unk_1000421F0;
  v33[4] = self;
  v33[5] = a7;
  uint64_t v24 = ((uint64_t (**)(void, void *))v23)[2](v23, v33);
  id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  uint64_t v26 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v25 then]);
  uint64_t v27 = ((uint64_t (**)(void, Block_layout *))v26)[2](v26, &stru_100042258);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

  return v28;
}

- (id)standardRequestWithURL:(id)a3 grandSlamSigner:(id)a4 familyGrandSlamSigner:(id)a5 method:(id)a6 body:(id)a7 requestFormat:(int64_t)a8 responseFormat:(int64_t)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v40 = (void *)objc_claimAutoreleasedReturnValue(-[FANetworkService ensureDeviceUnlockedSinceBoot](self, "ensureDeviceUnlockedSinceBoot"));
  id v34 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v40 then]);
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_1000185C4;
  v52[3] = &unk_100040EA0;
  v52[4] = self;
  uint64_t v19 = ((uint64_t (**)(void, void *))v34)[2](v34, v52);
  int64_t v39 = (void *)objc_claimAutoreleasedReturnValue(v19);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v39 then]);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_1000185CC;
  v46[3] = &unk_100042238;
  v46[4] = self;
  id v47 = v14;
  id v48 = v17;
  id v49 = v18;
  int64_t v50 = a8;
  int64_t v51 = a9;
  uint64_t v21 = (uint64_t (*)(void *, void *))v20[2];
  id v38 = v18;
  id v36 = v17;
  id v35 = v14;
  uint64_t v22 = v21(v20, v46);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 then]);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_1000185E8;
  v41[3] = &unk_100042280;
  id v42 = v16;
  id v43 = v15;
  id v44 = self;
  int64_t v45 = a9;
  id v25 = (uint64_t (*)(void *, void *))v24[2];
  id v26 = v15;
  id v27 = v16;
  uint64_t v28 = v25(v24, v41);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  id v30 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v29 then]);
  uint64_t v31 = ((uint64_t (**)(void, Block_layout *))v30)[2](v30, &stru_1000422A0);
  id v32 = (void *)objc_claimAutoreleasedReturnValue(v31);

  return v32;
}

- (id)standardPlistRequestWithUrl:(id)a3 method:(id)a4 plistBody:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[FANetworkService ensureDeviceUnlockedSinceBoot](self, "ensureDeviceUnlockedSinceBoot"));
  id v11 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v28 then]);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_10001882C;
  v34[3] = &unk_100040EA0;
  v34[4] = self;
  uint64_t v12 = ((uint64_t (**)(void, void *))v11)[2](v11, v34);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 then]);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100018834;
  v30[3] = &unk_1000422C8;
  void v30[4] = self;
  id v31 = v8;
  id v32 = v9;
  id v33 = v10;
  id v15 = (uint64_t (*)(void *, void *))v14[2];
  id v27 = v10;
  id v16 = v9;
  id v17 = v8;
  uint64_t v18 = v15(v14, v30);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  id v20 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v19 then]);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100018848;
  v29[3] = &unk_1000422F0;
  v29[4] = self;
  uint64_t v21 = ((uint64_t (**)(void, void *))v20)[2](v20, v29);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  uint64_t v23 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v22 then]);
  uint64_t v24 = ((uint64_t (**)(void, Block_layout *))v23)[2](v23, &stru_100042310);
  id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

  return v25;
}

- (ACAccount)account
{
  return self->_account;
}

- (FAURLProvider)urlProvider
{
  return self->_urlProvider;
}

- (AAURLSession)urlSession
{
  return self->_urlSession;
}

- (FADeviceInfoProtocol)deviceInfo
{
  return self->_deviceInfo;
}

- (FAFamilyFetchActivityScheduler)familyRefreshActivityScheduler
{
  return self->_familyRefreshActivityScheduler;
}

- (void)setFamilyRefreshActivityScheduler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end