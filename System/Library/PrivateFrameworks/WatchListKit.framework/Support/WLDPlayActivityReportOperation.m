@interface WLDPlayActivityReportOperation
- (NSArray)livePlayEvents;
- (NSArray)playEvents;
- (NSNumber)nextExpectedReportMillis;
- (UWLMessageWireEnvelope)envelope;
- (WLDPlayActivityReportOperation)init;
- (WLDPlayActivityReportOperation)initWithLivePlayEvents:(id)a3;
- (WLDPlayActivityReportOperation)initWithPlayEvents:(id)a3;
- (id)_protoForURLRequest:(id)a3;
- (id)_userAgentHeaderForRequest:(id)a3;
- (void)prepareURLRequest:(id)a3;
- (void)setEnvelope:(id)a3;
- (void)setLivePlayEvents:(id)a3;
- (void)setPlayEvents:(id)a3;
@end

@implementation WLDPlayActivityReportOperation

- (WLDPlayActivityReportOperation)init
{
  return 0LL;
}

- (WLDPlayActivityReportOperation)initWithLivePlayEvents:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___WLDPlayActivityReportOperation;
  v5 = -[WLDPlayActivityReportOperation initWithURLRequest:options:](&v9, "initWithURLRequest:options:", 0LL, 4LL);
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    livePlayEvents = v5->_livePlayEvents;
    v5->_livePlayEvents = v6;
  }

  return v5;
}

- (WLDPlayActivityReportOperation)initWithPlayEvents:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___WLDPlayActivityReportOperation;
  v5 = -[WLDPlayActivityReportOperation initWithURLRequest:options:](&v9, "initWithURLRequest:options:", 0LL, 4LL);
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    playEvents = v5->_playEvents;
    v5->_playEvents = v6;
  }

  return v5;
}

- (void)prepareURLRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = WLKNetworkSignpostLogObject();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (char *)-[WLDPlayActivityReportOperation signpostIdentifier](self, "signpostIdentifier");
  if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v8 = (os_signpost_id_t)v7;
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_INTERVAL_BEGIN,  v8,  "NetworkRequest.Config",  (const char *)&unk_100031029,  buf,  2u);
    }
  }

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[WLKConfigurationManager sharedInstance](&OBJC_CLASS___WLKConfigurationManager, "sharedInstance"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = __52__WLDPlayActivityReportOperation_prepareURLRequest___block_invoke;
  v11[3] = &unk_10003D058;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [v9 fetchConfigurationWithCompletionHandler:v11];
}

void __52__WLDPlayActivityReportOperation_prepareURLRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = WLKNetworkSignpostLogObject();
  os_signpost_id_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  objc_super v9 = (char *)[*(id *)(a1 + 32) signpostIdentifier];
  if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v10 = (os_signpost_id_t)v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_END,  v10,  "NetworkRequest.Config",  (const char *)&unk_100031029,  buf,  2u);
    }
  }

  if (v5)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v5 serverRouteNamed:@"activityPlay"]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 URL]);

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableURLRequest requestWithURL:cachePolicy:timeoutInterval:]( &OBJC_CLASS___NSMutableURLRequest,  "requestWithURL:cachePolicy:timeoutInterval:",  v12,  0LL,  WLKDefaultNetworkRequestTimeout));
      [v13 setHTTPMethod:@"POST"];
      [v13 setValue:@"application/x-protobuf" forHTTPHeaderField:@"Content-Type"];
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[WLKUserEnvironment currentEnvironment](&OBJC_CLASS___WLKUserEnvironment, "currentEnvironment"));
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 platform]);
      [v13 setValue:v15 forHTTPHeaderField:@"pfm"];

      v16 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  WLKCurrentProtocolVersion());
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      [v13 setValue:v17 forHTTPHeaderField:@"ClientVersion"];

      v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _protoForURLRequest:v13]);
      [*(id *)(a1 + 32) setEnvelope:v18];
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 data]);
      [v13 setHTTPBody:v19];

      id v20 = [v13 copy];
    }

    else
    {
      uint64_t v21 = WLKError(100LL, 0LL, @"WLDPlayActivityReportOperation: Error: activityPlay route not found");
      id v20 = 0LL;
      v13 = v6;
      id v6 = (id)objc_claimAutoreleasedReturnValue(v21);
    }
  }

  else
  {
    id v20 = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (NSNumber)nextExpectedReportMillis
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WLDPlayActivityReportOperation httpResponse](self, "httpResponse"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allHeaderFields]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v3,  "wlk_caseInsensitiveValueForKey:",  @"X-Apple-Next-Report-Expected-In-Milliseconds"));

  return (NSNumber *)v4;
}

- (id)_protoForURLRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[WLDPlayActivityReportOperation encoder](self, "encoder"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 account]);

  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_DSID"));
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v38 stringValue]);
  os_signpost_id_t v8 = objc_alloc_init(&OBJC_CLASS___UWLMessageHeaders);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_storefront"));
  -[UWLMessageHeaders setXAppleStorefront:](v8, "setXAppleStorefront:", v9);

  v35 = self;
  os_signpost_id_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[WLDPlayActivityReportOperation _userAgentHeaderForRequest:](self, "_userAgentHeaderForRequest:", v4));
  -[UWLMessageHeaders setUserAgent:](v8, "setUserAgent:", v10);

  v37 = (void *)v7;
  -[UWLMessageHeaders setXDsid:](v8, "setXDsid:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[WLKUserEnvironment currentEnvironment](&OBJC_CLASS___WLKUserEnvironment, "currentEnvironment"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 platform]);
  -[UWLMessageHeaders setPfm:](v8, "setPfm:", v12);

  -[UWLMessageHeaders setClientVersion:](v8, "setClientVersion:", WLKCurrentProtocolVersion());
  v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v40 = v4;
  v39 = v6;
  v36 = (void *)objc_claimAutoreleasedReturnValue([v4 URL]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_cookiesForURL:"));
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id v15 = [v14 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v50;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v50 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)i);
        id v20 = objc_alloc_init(&OBJC_CLASS___MapEntry);
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v19 name]);
        -[MapEntry setKey:](v20, "setKey:", v21);

        v22 = (void *)objc_claimAutoreleasedReturnValue([v19 value]);
        -[MapEntry setValue:](v20, "setValue:", v22);

        -[NSMutableArray addObject:](v13, "addObject:", v20);
      }

      id v16 = [v14 countByEnumeratingWithState:&v49 objects:v55 count:16];
    }

    while (v16);
  }

  if (-[NSMutableArray count](v13, "count")) {
    -[UWLMessageHeaders setCookies:](v8, "setCookies:", v13);
  }
  v23 = objc_alloc_init(&OBJC_CLASS___UWLMessageWireEnvelope);
  -[UWLMessageWireEnvelope setVersion:](v23, "setVersion:", 1LL);
  -[UWLMessageWireEnvelope setHeaders:](v23, "setHeaders:", v8);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[WLDPlayActivityReportOperation playEvents](v35, "playEvents"));

  if (v24)
  {
    __int128 v47 = 0uLL;
    __int128 v48 = 0uLL;
    __int128 v45 = 0uLL;
    __int128 v46 = 0uLL;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[WLDPlayActivityReportOperation playEvents](v35, "playEvents"));
    id v26 = [v25 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v46;
      do
      {
        for (j = 0LL; j != v27; j = (char *)j + 1)
        {
          if (*(void *)v46 != v28) {
            objc_enumerationMutation(v25);
          }
          -[UWLMessageWireEnvelope addPlayEvents:]( v23,  "addPlayEvents:",  *(void *)(*((void *)&v45 + 1) + 8LL * (void)j));
        }

        id v27 = [v25 countByEnumeratingWithState:&v45 objects:v54 count:16];
      }

      while (v27);
    }
  }

  else
  {
    __int128 v43 = 0uLL;
    __int128 v44 = 0uLL;
    __int128 v41 = 0uLL;
    __int128 v42 = 0uLL;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[WLDPlayActivityReportOperation livePlayEvents](v35, "livePlayEvents"));
    id v30 = [v25 countByEnumeratingWithState:&v41 objects:v53 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v42;
      do
      {
        for (k = 0LL; k != v31; k = (char *)k + 1)
        {
          if (*(void *)v42 != v32) {
            objc_enumerationMutation(v25);
          }
          -[UWLMessageWireEnvelope addLiveActivityEvents:]( v23,  "addLiveActivityEvents:",  *(void *)(*((void *)&v41 + 1) + 8LL * (void)k));
        }

        id v31 = [v25 countByEnumeratingWithState:&v41 objects:v53 count:16];
      }

      while (v31);
    }
  }

  return v23;
}

- (id)_userAgentHeaderForRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[WLDPlayActivityReportOperation encoder](self, "encoder"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 requestByEncodingRequest:v4 parameters:0]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 resultWithError:0]);
  os_signpost_id_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForHTTPHeaderField:AMSHTTPHeaderUserAgent]);

  return v8;
}

- (NSArray)playEvents
{
  return self->_playEvents;
}

- (void)setPlayEvents:(id)a3
{
}

- (NSArray)livePlayEvents
{
  return self->_livePlayEvents;
}

- (void)setLivePlayEvents:(id)a3
{
}

- (UWLMessageWireEnvelope)envelope
{
  return self->_envelope;
}

- (void)setEnvelope:(id)a3
{
}

- (void).cxx_destruct
{
}

@end