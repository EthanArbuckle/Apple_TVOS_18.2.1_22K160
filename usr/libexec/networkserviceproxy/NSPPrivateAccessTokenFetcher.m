@interface NSPPrivateAccessTokenFetcher
+ (BOOL)checkOriginAllowedAsThirdParty:(id)a3;
+ (void)fetchAuxiliaryAuthenticationDataFromCacheForType:(unint64_t)a3 label:(id)a4 cacheKey:(id)a5 completionHandler:(id)a6;
+ (void)saveAuxiliaryAuthenticationDataToCache:(id)a3 type:(unint64_t)a4 forLabel:(id)a5 cacheKey:(id)a6;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)systemClient;
- (NSDictionary)customAttesterHeaders;
- (NSPPrivateAccessTokenFetcher)initWithChallenge:(id)a3 tokenKey:(id)a4 originNameKey:(id)a5;
- (NSString)auxiliaryAuthenticationCacheKey;
- (NSString)bundleID;
- (NSString)selectedOrigin;
- (NSURL)customAttester;
- (id)initForKnownIssuerWithChallenge:(id)a3;
- (id)initForKnownIssuerWithLongLivedTokenChallenge:(id)a3 oneTimeTokenChallenge:(id)a4;
- (void)addSecondaryChallenge:(id)a3 tokenKey:(id)a4 originNameKey:(id)a5;
- (void)fetchLinkedTokenPairWithQueue:(id)a3 completionHandler:(id)a4;
- (void)fetchTokenPairWithQueue:(id)a3 completionHandler:(id)a4;
- (void)fetchTokenWithQueue:(id)a3 completionHandler:(id)a4;
- (void)generateTokenRequestWithQueue:(id)a3 completionHandler:(id)a4;
- (void)handleTokenResponse:(id)a3 withQueue:(id)a4 completionHandler:(id)a5;
- (void)saveTokenToCache:(id)a3;
- (void)setAuditToken:(id *)a3;
- (void)setAuxiliaryAuthenticationCacheKey:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCustomAttester:(id)a3 headers:(id)a4;
- (void)setSelectedOrigin:(id)a3;
- (void)setSystemClient:(BOOL)a3;
@end

@implementation NSPPrivateAccessTokenFetcher

- (NSPPrivateAccessTokenFetcher)initWithChallenge:(id)a3 tokenKey:(id)a4 originNameKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v13 = v10;
  if (!v8)
  {
    uint64_t v21 = nplog_obj(v10, v11, v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    if (!os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_FAULT))
    {
LABEL_9:

LABEL_12:
      v17 = 0LL;
      goto LABEL_5;
    }

    *(_DWORD *)buf = 136315138;
    v28 = "-[NSPPrivateAccessTokenFetcher initWithChallenge:tokenKey:originNameKey:]";
    v23 = "%s called with null challenge";
LABEL_14:
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)v22, OS_LOG_TYPE_FAULT, v23, buf, 0xCu);
    goto LABEL_9;
  }

  if (!v9)
  {
    uint64_t v24 = nplog_obj(v10, v11, v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v24);
    if (!os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_FAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136315138;
    v28 = "-[NSPPrivateAccessTokenFetcher initWithChallenge:tokenKey:originNameKey:]";
    v23 = "%s called with null tokenKey";
    goto LABEL_14;
  }

  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___NSPPrivateAccessTokenFetcher;
  v14 = -[NSPPrivateAccessTokenFetcher init](&v26, "init");
  if (!v14)
  {
    uint64_t v25 = nplog_obj(0LL, v15, v16);
    self = (NSPPrivateAccessTokenFetcher *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled((os_log_t)self, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)self, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }

    goto LABEL_12;
  }

  v17 = v14;
  objc_setProperty_atomic(v14, v15, v8, 56LL);
  objc_setProperty_atomic(v17, v18, v9, 72LL);
  objc_setProperty_atomic(v17, v19, v13, 80LL);
LABEL_5:

  return v17;
}

- (id)initForKnownIssuerWithChallenge:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    uint64_t v12 = nplog_obj(0LL, v4, v5);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[NSPPrivateAccessTokenFetcher initForKnownIssuerWithChallenge:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_FAULT,  "%s called with null challenge",  buf,  0xCu);
    }

    goto LABEL_10;
  }

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NSPPrivateAccessTokenFetcher;
  v7 = -[NSPPrivateAccessTokenFetcher init](&v15, "init");
  if (!v7)
  {
    uint64_t v14 = nplog_obj(0LL, v8, v9);
    self = (NSPPrivateAccessTokenFetcher *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled((os_log_t)self, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)self, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }

- (id)initForKnownIssuerWithLongLivedTokenChallenge:(id)a3 oneTimeTokenChallenge:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v10 = v7;
  if (!v6)
  {
    uint64_t v17 = nplog_obj(v7, v8, v9);
    SEL v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if (!os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_FAULT))
    {
LABEL_9:

LABEL_12:
      uint64_t v14 = 0LL;
      goto LABEL_5;
    }

    *(_DWORD *)buf = 136315138;
    uint64_t v24 = "-[NSPPrivateAccessTokenFetcher initForKnownIssuerWithLongLivedTokenChallenge:oneTimeTokenChallenge:]";
    SEL v19 = "%s called with null longLivedTokenChallenge";
LABEL_14:
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_FAULT, v19, buf, 0xCu);
    goto LABEL_9;
  }

  if (!v7)
  {
    uint64_t v20 = nplog_obj(0LL, v8, v9);
    SEL v18 = (void *)objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_FAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v24 = "-[NSPPrivateAccessTokenFetcher initForKnownIssuerWithLongLivedTokenChallenge:oneTimeTokenChallenge:]";
    SEL v19 = "%s called with null oneTimeTokenChallenge";
    goto LABEL_14;
  }

  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___NSPPrivateAccessTokenFetcher;
  uint64_t v11 = -[NSPPrivateAccessTokenFetcher init](&v22, "init");
  if (!v11)
  {
    uint64_t v21 = nplog_obj(0LL, v12, v13);
    self = (NSPPrivateAccessTokenFetcher *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled((os_log_t)self, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)self, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }

    goto LABEL_12;
  }

  uint64_t v14 = v11;
  objc_setProperty_atomic(v11, v12, v6, 56LL);
  objc_setProperty_atomic(v14, v15, v10, 64LL);
LABEL_5:

  return v14;
}

- (void)addSecondaryChallenge:(id)a3 tokenKey:(id)a4 originNameKey:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v17 = -[NSPPrivateAccessTokenFetcher initWithChallenge:tokenKey:originNameKey:]( objc_alloc(&OBJC_CLASS___NSPPrivateAccessTokenFetcher),  "initWithChallenge:tokenKey:originNameKey:",  v10,  v9,  v8);

  uint64_t v12 = v17;
  if (v17)
  {
    if (self)
    {
      if (!objc_getProperty(self, v11, 88LL, 1))
      {
        uint64_t v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        objc_setProperty_atomic(self, v15, v14, 88LL);
      }

      id Property = objc_getProperty(self, v13, 88LL, 1);
    }

    else
    {

      id Property = 0LL;
    }

    [Property addObject:v17];
    uint64_t v12 = v17;
  }
}

- (void)setCustomAttester:(id)a3 headers:(id)a4
{
  if (self)
  {
    id newValue = a4;
    objc_setProperty_atomic(self, v6, a3, 40LL);
    objc_setProperty_atomic(self, v7, newValue, 48LL);
  }

- (void)fetchTokenWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v10 = v7;
  if (!v6)
  {
    uint64_t v14 = nplog_obj(v7, v8, v9);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v21 = "-[NSPPrivateAccessTokenFetcher fetchTokenWithQueue:completionHandler:]";
    SEL v15 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, v15, buf, 0xCu);
    goto LABEL_4;
  }

  if (!v7)
  {
    uint64_t v16 = nplog_obj(0LL, v8, v9);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v21 = "-[NSPPrivateAccessTokenFetcher fetchTokenWithQueue:completionHandler:]";
    SEL v15 = "%s called with null completionHandler";
    goto LABEL_9;
  }

  uint64_t ServerConnection = getServerConnection();
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(ServerConnection);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000AEFFC;
  v17[3] = &unk_1000FAFE0;
  SEL v18 = (os_log_s *)v6;
  id v19 = v10;
  [v12 fetchPrivateAccessTokenWithFetcher:self completionHandler:v17];

  uint64_t v13 = v18;
LABEL_4:
}

- (void)fetchTokenPairWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v10 = v7;
  if (!v6)
  {
    uint64_t v14 = nplog_obj(v7, v8, v9);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v21 = "-[NSPPrivateAccessTokenFetcher fetchTokenPairWithQueue:completionHandler:]";
    SEL v15 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, v15, buf, 0xCu);
    goto LABEL_4;
  }

  if (!v7)
  {
    uint64_t v16 = nplog_obj(0LL, v8, v9);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v21 = "-[NSPPrivateAccessTokenFetcher fetchTokenPairWithQueue:completionHandler:]";
    SEL v15 = "%s called with null completionHandler";
    goto LABEL_9;
  }

  uint64_t ServerConnection = getServerConnection();
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(ServerConnection);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000AF2D0;
  v17[3] = &unk_1000FB030;
  SEL v18 = (os_log_s *)v6;
  id v19 = v10;
  [v12 fetchPrivateAccessTokenPairWithFetcher:self completionHandler:v17];

  uint64_t v13 = v18;
LABEL_4:
}

- (void)fetchLinkedTokenPairWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v10 = v7;
  if (!v6)
  {
    uint64_t v14 = nplog_obj(v7, v8, v9);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v21 = "-[NSPPrivateAccessTokenFetcher fetchLinkedTokenPairWithQueue:completionHandler:]";
    SEL v15 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, v15, buf, 0xCu);
    goto LABEL_4;
  }

  if (!v7)
  {
    uint64_t v16 = nplog_obj(0LL, v8, v9);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v21 = "-[NSPPrivateAccessTokenFetcher fetchLinkedTokenPairWithQueue:completionHandler:]";
    SEL v15 = "%s called with null completionHandler";
    goto LABEL_9;
  }

  uint64_t ServerConnection = getServerConnection();
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(ServerConnection);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000AF5CC;
  v17[3] = &unk_1000FB030;
  SEL v18 = (os_log_s *)v6;
  id v19 = v10;
  [v12 fetchPrivateAccessTokenPairWithFetcher:self completionHandler:v17];

  uint64_t v13 = v18;
LABEL_4:
}

+ (BOOL)checkOriginAllowedAsThirdParty:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    uint64_t ServerConnection = getServerConnection();
    id v7 = (void *)objc_claimAutoreleasedReturnValue(ServerConnection);
    unsigned __int8 v8 = [v7 checkOriginAllowedAsThirdParty:v5];
  }

  else
  {
    uint64_t v10 = nplog_obj(0LL, v3, v4);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      int v12 = 136315138;
      uint64_t v13 = "+[NSPPrivateAccessTokenFetcher checkOriginAllowedAsThirdParty:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_FAULT,  "%s called with null origin",  (uint8_t *)&v12,  0xCu);
    }

    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void)generateTokenRequestWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = (dispatch_queue_s *)a3;
  id v8 = a4;
  if (self)
  {
    id Property = objc_getProperty(self, v7, 96LL, 1);
    if (Property)
    {
      uint64_t v12 = nplog_obj(Property, v10, v11);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Cannot fetch multiple local tokens with a single token fetcher",  buf,  2u);
      }

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000B09E4;
      block[3] = &unk_1000FAE58;
      uint64_t v24 = (dispatch_queue_s *)v8;
      dispatch_async(v6, block);
      uint64_t v14 = v24;
      goto LABEL_6;
    }

    if (objc_getProperty(self, v10, 72LL, 1))
    {
      id v16 = objc_getProperty(self, v15, 72LL, 1);
      sub_1000B0108(self, v16, v6, v8);
      goto LABEL_9;
    }
  }

  uint64_t ServerConnection = getServerConnection();
  SEL v18 = (void *)objc_claimAutoreleasedReturnValue(ServerConnection);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000B0ABC;
  v19[3] = &unk_1000FB0A8;
  uint64_t v20 = v6;
  uint64_t v21 = self;
  id v22 = v8;
  [v18 fetchKnownPrivateAccessTokenKeyWithFetcher:self completionHandler:v19];

  uint64_t v14 = v20;
LABEL_6:

LABEL_9:
}

- (void)handleTokenResponse:(id)a3 withQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (dispatch_queue_s *)a4;
  id v10 = a5;
  uint64_t v13 = v10;
  if (v8
    && self
    && (id v10 = objc_getProperty(self, v11, 96LL, 1)) != 0LL
    && (uint64_t v14 = v10, Property = objc_getProperty(self, v11, 104LL, 1), v14, Property))
  {
    id v16 = objc_getProperty(self, v11, 104LL, 1);
    id v18 = objc_getProperty(self, v17, 112LL, 1);
    id v20 = objc_getProperty(self, v19, 96LL, 1);
    id v22 = objc_getProperty(self, v21, 120LL, 1);
    v23 = objc_alloc(&OBJC_CLASS___NSPPrivateAccessTokenChallenge);
    uint64_t v25 = -[NSPPrivateAccessTokenChallenge initWithData:](v23, "initWithData:", objc_getProperty(self, v24, 56LL, 1));
    objc_super v26 = sub_1000AC388((uint64_t)v16, v8);
    uint64_t v27 = objc_claimAutoreleasedReturnValue(v26);

    id v65 = 0LL;
    v56 = (void *)v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue([v20 activateTokenWithServerResponse:v27 error:&v65]);

    id v29 = v65;
    v32 = v29;
    if (v28)
    {
      id v54 = v29;
      v33 = objc_alloc(&OBJC_CLASS___NSPPrivateAccessTokenResponse);
      id v55 = v22;
      v34 = (void *)objc_claimAutoreleasedReturnValue([v22 key]);
      v35 = (void *)objc_claimAutoreleasedReturnValue([v28 signature]);
      v36 = sub_1000AB5D4(v33, v25, v18, v34, v35);

      uint64_t v40 = nplog_obj(v37, v38, v39);
      v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      v42 = v41;
      if (v36)
      {
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Generated token from response", buf, 2u);
        }

        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1000B1220;
        block[3] = &unk_1000FB080;
        id v58 = objc_getProperty(v36, v43, 8LL, 1);
        id v59 = v13;
        id v44 = v58;
        dispatch_async(v9, block);
        objc_setProperty_atomic(self, v45, 0LL, 96LL);
        objc_setProperty_atomic(self, v46, 0LL, 104LL);
        objc_setProperty_atomic(self, v47, 0LL, 112LL);
        objc_setProperty_atomic(self, v48, 0LL, 120LL);
      }

      else
      {
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_ERROR,  "Failed to create token structure, cannot handle token response",  buf,  2u);
        }

        v60[0] = _NSConcreteStackBlock;
        v60[1] = 3221225472LL;
        v60[2] = sub_1000B1148;
        v60[3] = &unk_1000FAE58;
        id v61 = v13;
        dispatch_async(v9, v60);
        id v44 = v61;
      }

      id v22 = v55;

      v53 = v54;
    }

    else
    {
      uint64_t v51 = nplog_obj(v29, v30, v31);
      v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_ERROR,  "Failted to activate waiting token, cannot handle token response",  buf,  2u);
      }

      v62[0] = _NSConcreteStackBlock;
      v62[1] = 3221225472LL;
      v62[2] = sub_1000B1134;
      v62[3] = &unk_1000FB080;
      v64 = v13;
      id v63 = v32;
      dispatch_async(v9, v62);

      v36 = v64;
      v53 = v32;
    }
  }

  else
  {
    uint64_t v49 = nplog_obj(v10, v11, v12);
    v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_ERROR,  "Invalid state, cannot handle token response",  buf,  2u);
    }

    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472LL;
    v66[2] = sub_1000B105C;
    v66[3] = &unk_1000FAE58;
    id v67 = v13;
    dispatch_async(v9, v66);
    id v18 = v67;
  }
}

- (void)saveTokenToCache:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    uint64_t ServerConnection = getServerConnection();
    id v8 = (void *)objc_claimAutoreleasedReturnValue(ServerConnection);
    [v8 addToken:v6 toCacheForFetcher:self];
  }

  else
  {
    uint64_t v9 = nplog_obj(0LL, v4, v5);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      int v11 = 136315138;
      uint64_t v12 = "-[NSPPrivateAccessTokenFetcher saveTokenToCache:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_FAULT,  "%s called with null token",  (uint8_t *)&v11,  0xCu);
    }
  }
}

+ (void)saveAuxiliaryAuthenticationDataToCache:(id)a3 type:(unint64_t)a4 forLabel:(id)a5 cacheKey:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = v11;
  if (!v9)
  {
    uint64_t v17 = nplog_obj(v11, v12, v13);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      int v22 = 136315138;
      v23 = "+[NSPPrivateAccessTokenFetcher saveAuxiliaryAuthenticationDataToCache:type:forLabel:cacheKey:]";
      SEL v19 = "%s called with null auxiliaryData";
      goto LABEL_13;
    }

+ (void)fetchAuxiliaryAuthenticationDataFromCacheForType:(unint64_t)a3 label:(id)a4 cacheKey:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = v11;
  if (!v9)
  {
    uint64_t v17 = nplog_obj(v11, v12, v13);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if (!os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_FAULT))
    {
LABEL_8:

      goto LABEL_4;
    }

    int v21 = 136315138;
    int v22 = "+[NSPPrivateAccessTokenFetcher fetchAuxiliaryAuthenticationDataFromCacheForType:label:cacheKey:completionHandler:]";
    SEL v19 = "%s called with null label";
LABEL_10:
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_FAULT, v19, (uint8_t *)&v21, 0xCu);
    goto LABEL_8;
  }

  if (!v10)
  {
    uint64_t v20 = nplog_obj(v11, v12, v13);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_FAULT)) {
      goto LABEL_8;
    }
    int v21 = 136315138;
    int v22 = "+[NSPPrivateAccessTokenFetcher fetchAuxiliaryAuthenticationDataFromCacheForType:label:cacheKey:completionHandler:]";
    SEL v19 = "%s called with null cacheKey";
    goto LABEL_10;
  }

  uint64_t ServerConnection = getServerConnection();
  id v16 = (void *)objc_claimAutoreleasedReturnValue(ServerConnection);
  [v16 fetchAuxiliaryAuthenticationDataFromCacheForType:a3 label:v9 cacheKey:v10 completionHandler:v14];

LABEL_4:
}

- (BOOL)systemClient
{
  return self->_systemClient;
}

- (void)setSystemClient:(BOOL)a3
{
  self->_systemClient = a3;
}

- (NSString)selectedOrigin
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setSelectedOrigin:(id)a3
{
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  return result;
}

- (void)setAuditToken:(id *)a3
{
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setBundleID:(id)a3
{
}

- (NSString)auxiliaryAuthenticationCacheKey
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setAuxiliaryAuthenticationCacheKey:(id)a3
{
}

- (NSURL)customAttester
{
  return (NSURL *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSDictionary)customAttesterHeaders
{
  return (NSDictionary *)objc_getProperty(self, a2, 48LL, 1);
}

- (void).cxx_destruct
{
}

@end