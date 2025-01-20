@interface TVMusicMediaAPI
+ (TVMusicMediaAPI)sharedInstance;
+ (id)mediaApiResultForImport:(id)a3;
- (AMSBag)mediaAPIBag;
- (AMSBag)musicBag;
- (AMSMediaRequestEncoder)requestEncoder;
- (AMSURLSession)urlSession;
- (NSString)mediaAPIHostName;
- (OS_dispatch_queue)requestQueue;
- (TVMusicMediaAPI)init;
- (id)_processOptions:(id)a3 forRequest:(id)a4;
- (unint64_t)_cachePolicyFromString:(id)a3;
- (void)_urlWithPath:(id)a3 completion:(id)a4;
- (void)performRequestWithPath:(id)a3 options:(id)a4 completion:(id)a5;
- (void)performRequestWithURL:(id)a3 options:(id)a4 completion:(id)a5;
- (void)setMediaAPIBag:(id)a3;
- (void)setMediaAPIHostName:(id)a3;
- (void)setMusicBag:(id)a3;
- (void)setRequestEncoder:(id)a3;
- (void)setRequestQueue:(id)a3;
- (void)setUrlSession:(id)a3;
@end

@implementation TVMusicMediaAPI

+ (TVMusicMediaAPI)sharedInstance
{
  if (qword_1002BE9E0 != -1) {
    dispatch_once(&qword_1002BE9E0, &stru_10026C7E0);
  }
  return (TVMusicMediaAPI *)(id)qword_1002BE9D8;
}

- (TVMusicMediaAPI)init
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___TVMusicMediaAPI;
  v2 = -[TVMusicMediaAPI init](&v24, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INTERACTIVE, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.TVMusic.TVMusicMediaAPI.requestQueue", v6);
    requestQueue = v2->_requestQueue;
    v2->_requestQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[AMSBag bagForProfile:profileVersion:]( &OBJC_CLASS___AMSBag,  "bagForProfile:profileVersion:",  @"TVMusic",  @"1"));
    musicBag = v2->_musicBag;
    v2->_musicBag = (AMSBag *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[AMSMediaTask bagSubProfile](&OBJC_CLASS___AMSMediaTask, "bagSubProfile"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[AMSMediaTask bagSubProfileVersion](&OBJC_CLASS___AMSMediaTask, "bagSubProfileVersion"));
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[AMSBag bagForProfile:profileVersion:](&OBJC_CLASS___AMSBag, "bagForProfile:profileVersion:", v11, v12));
    mediaAPIBag = v2->_mediaAPIBag;
    v2->_mediaAPIBag = (AMSBag *)v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration defaultSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "defaultSessionConfiguration"));
    v16 = -[AMSURLSession initWithConfiguration:]( objc_alloc(&OBJC_CLASS___AMSURLSession),  "initWithConfiguration:",  v15);
    urlSession = v2->_urlSession;
    v2->_urlSession = v16;

    id v18 = [[AMSMediaTokenService alloc] initWithClientIdentifier:@"com.apple.TVMusic" bag:v2->_mediaAPIBag];
    [v18 setSession:v2->_urlSession];
    id v19 = [[AMSMediaProtocolHandler alloc] initWithTokenService:v18];
    v20 = (void *)objc_claimAutoreleasedReturnValue([v18 session]);
    [v20 setProtocolHandler:v19];

    v21 = -[AMSMediaRequestEncoder initWithTokenService:bag:]( objc_alloc(&OBJC_CLASS___AMSMediaRequestEncoder),  "initWithTokenService:bag:",  v18,  v2->_mediaAPIBag);
    requestEncoder = v2->_requestEncoder;
    v2->_requestEncoder = v21;
  }

  return v2;
}

- (void)performRequestWithPath:(id)a3 options:(id)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100093764;
  v9[3] = &unk_10026C808;
  v10 = self;
  id v11 = a4;
  id v12 = a5;
  id v7 = v12;
  id v8 = v11;
  -[TVMusicMediaAPI _urlWithPath:completion:](v10, "_urlWithPath:completion:", a3, v9);
}

- (void)performRequestWithURL:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithString:](&OBJC_CLASS___NSURLComponents, "componentsWithString:", v8));
  if (v11)
  {
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVMusicMediaAPI requestQueue](self, "requestQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000939EC;
    block[3] = &unk_10026C880;
    block[4] = self;
    id v20 = v11;
    id v21 = v9;
    id v22 = v8;
    id v23 = v10;
    dispatch_async(v12, block);
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid URL: [%@]",  v8));
    v14 = off_1002B69A0;
    NSErrorUserInfoKey v26 = NSDebugDescriptionErrorKey;
    v27 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v14,  0LL,  v15));
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v16);

    id v17 = sub_1000939AC();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Can't perform request; invalid URL: %@",
        buf,
        0xCu);
    }
  }
}

+ (id)mediaApiResultForImport:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvs_arrayForKey:", @"data"));
  if (!v4)
  {
    id v43 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v43, 1LL));
  }

  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v36 objects:v42 count:16];
  id v7 = v5;
  id v8 = v3;
  if (v6)
  {
    id v9 = v6;
    uint64_t v10 = *(void *)v37;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v5);
        }
        id v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v36 + 1) + 8 * (void)i),  "tvs_stringForKey:",  @"type"));
        unsigned __int8 v13 = [v12 isEqualToString:@"playlists"];

        if ((v13 & 1) != 0)
        {
          id v30 = v5;

          v31 = v3;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvm_mutableDeepCopy"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "tvs_arrayForKey:", @"data"));
          if (!v15)
          {
            v41 = v14;
            v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v41,  1LL));
          }

          v29 = v14;
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          __int128 v32 = 0u;
          __int128 v33 = 0u;
          id v7 = v15;
          id v16 = [v7 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v16)
          {
            id v18 = v16;
            uint64_t v19 = *(void *)v33;
            do
            {
              for (j = 0LL; j != v18; j = (char *)j + 1)
              {
                if (*(void *)v33 != v19) {
                  objc_enumerationMutation(v7);
                }
                id v21 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)j);
                uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary, v17);
                if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0) {
                  id v23 = v21;
                }
                else {
                  id v23 = 0LL;
                }
                id v24 = v23;
                id v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "tvs_stringForKey:", @"type"));
                unsigned int v26 = [v25 isEqualToString:@"playlists"];

                if (v26)
                {
                  v27 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:@"relationships"]);
                  [v27 setObject:0 forKeyedSubscript:@"tracks"];
                }
              }

              id v18 = [v7 countByEnumeratingWithState:&v32 objects:v40 count:16];
            }

            while (v18);
          }

          id v3 = v31;
          id v8 = v29;
          id v5 = v30;
          goto LABEL_27;
        }
      }

      id v9 = [v5 countByEnumeratingWithState:&v36 objects:v42 count:16];
      if (v9) {
        continue;
      }
      break;
    }

    id v7 = v5;
    id v8 = v3;
  }

- (void)_urlWithPath:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMediaAPI mediaAPIHostName](self, "mediaAPIHostName"));

  if (v8)
  {
    unsigned int v9 = [v6 hasPrefix:@"/"];
    uint64_t v10 = @"https://%@/%@";
    if (v9) {
      uint64_t v10 = @"https://%@%@";
    }
    id v11 = v10;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMediaAPI mediaAPIHostName](self, "mediaAPIHostName"));
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v11, v12, v6));

    v7[2](v7, v13);
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMediaAPI musicBag](self, "musicBag"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 stringForKey:@"musicSubscription/ampMusicAPIHost"]);

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100094408;
    v16[3] = &unk_10026C8A8;
    v16[4] = self;
    id v17 = v6;
    id v18 = v7;
    [v15 valueWithCompletion:v16];
  }
}

- (id)_processOptions:(id)a3 forRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"method"]);
  unsigned int v9 = v8;
  if (v8 && [v8 length]) {
    [v7 setHTTPMethod:v9];
  }
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"cachePolicy"]);
  if (v10)
  {
    unint64_t v11 = -[TVMusicMediaAPI _cachePolicyFromString:](self, "_cachePolicyFromString:", v10);
    if (!v11)
    {
      unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid cache policy string %@. Valid values are: %@, %@, %@, %@, %@",  v10,  @"ReloadIgnoringLocalCacheData",  @"ReloadIgnoringLocalAndRemoteCacheData",  @"ReturnCacheDataElseLoad",  @"ReturnCacheDataDontLoad",  @"ReloadRevalidatingCacheData"));
      NSErrorUserInfoKey v16 = NSDebugDescriptionErrorKey;
      id v17 = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  off_1002B69A0,  1LL,  v14));

      goto LABEL_9;
    }

    [v7 setCachePolicy:v11];
  }

  id v12 = 0LL;
LABEL_9:

  return v12;
}

- (unint64_t)_cachePolicyFromString:(id)a3
{
  v8[0] = @"ReloadIgnoringLocalCacheData";
  v8[1] = @"ReloadIgnoringLocalAndRemoteCacheData";
  v9[0] = &off_100281A00;
  v9[1] = &off_100281A18;
  v8[2] = @"ReturnCacheDataElseLoad";
  v8[3] = @"ReturnCacheDataDontLoad";
  v9[2] = &off_100281A30;
  v9[3] = &off_100281A48;
  v8[4] = @"ReloadRevalidatingCacheData";
  void v9[4] = &off_100281A60;
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  5LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v3]);

  if (v5) {
    id v6 = [v5 unsignedIntegerValue];
  }
  else {
    id v6 = 0LL;
  }

  return (unint64_t)v6;
}

- (AMSBag)musicBag
{
  return self->_musicBag;
}

- (void)setMusicBag:(id)a3
{
}

- (AMSURLSession)urlSession
{
  return self->_urlSession;
}

- (void)setUrlSession:(id)a3
{
}

- (AMSMediaRequestEncoder)requestEncoder
{
  return self->_requestEncoder;
}

- (void)setRequestEncoder:(id)a3
{
}

- (OS_dispatch_queue)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
}

- (AMSBag)mediaAPIBag
{
  return self->_mediaAPIBag;
}

- (void)setMediaAPIBag:(id)a3
{
}

- (NSString)mediaAPIHostName
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setMediaAPIHostName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end