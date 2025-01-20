@interface NSPPvDConfigurationFetcher
- (BOOL)configurationValidated:(id)a3 withURL:(id)a4;
- (BOOL)isIdentifier:(id)a3 presentIn:(id)a4;
- (id)formatExpirationDateFrom:(id)a3;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4;
- (void)dealloc;
- (void)didReceiveProxyConfig:(id)a3 from:(id)a4;
- (void)fetchIndividualProxyConfig:(id)a3 completionHander:(id)a4;
@end

@implementation NSPPvDConfigurationFetcher

- (void)dealloc
{
  if (self)
  {
    session = self->_session;
    if (session)
    {
      -[NSURLSession invalidateAndCancel](session, "invalidateAndCancel");
      objc_storeStrong((id *)&self->_session, 0LL);
    }

    objc_storeStrong((id *)&self->_queue, 0LL);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSPPvDConfigurationFetcher;
  -[NSPPvDConfigurationFetcher dealloc](&v4, "dealloc");
}

- (BOOL)isIdentifier:(id)a3 presentIn:(id)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([a4 host]);
  if (v6) {
    unsigned __int8 v7 = [v5 isEqualToString:v6];
  }
  else {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (id)formatExpirationDateFrom:(id)a3
{
  id v3 = a3;
  objc_super v4 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale localeWithLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "localeWithLocaleIdentifier:",  @"en_US_POSIX"));
  -[NSDateFormatter setLocale:](v4, "setLocale:", v5);

  -[NSDateFormatter setDateFormat:](v4, "setDateFormat:", @"yyyy-MM-dd'T'HH:mm:ssZZZZZ");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneForSecondsFromGMT:](&OBJC_CLASS___NSTimeZone, "timeZoneForSecondsFromGMT:", 0LL));
  -[NSDateFormatter setTimeZone:](v4, "setTimeZone:", v6);

  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter dateFromString:](v4, "dateFromString:", v3));
  return v7;
}

- (BOOL)configurationValidated:(id)a3 withURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"expires"]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPvDConfigurationFetcher formatExpirationDateFrom:](self, "formatExpirationDateFrom:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v11 = [v10 compare:v9];

  BOOL v15 = v11 == (id)-1LL;
  if (v11 != (id)-1LL)
  {
    uint64_t v16 = nplog_obj(v12, v13, v14);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v26) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Configuration is expired",  (uint8_t *)&v26,  2u);
    }
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"identifier"]);
  unsigned __int8 v19 = -[NSPPvDConfigurationFetcher isIdentifier:presentIn:](self, "isIdentifier:presentIn:", v18, v7);

  if ((v19 & 1) == 0)
  {
    uint64_t v23 = nplog_obj(v20, v21, v22);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v26 = 138412290;
      v27 = v18;
      _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Matching identifier was not found in response: %@",  (uint8_t *)&v26,  0xCu);
    }

    BOOL v15 = 0;
  }

  return v15;
}

- (void)didReceiveProxyConfig:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_64;
  }
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 objectForKey:@"identifier"]);
  if (!v8) {
    goto LABEL_64;
  }
  v9 = (void *)v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"expires"]);

  if (!v10) {
    goto LABEL_64;
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"identifier"]);
  if (!-[NSPPvDConfigurationFetcher configurationValidated:withURL:](self, "configurationValidated:withURL:", v6, v7)) {
    goto LABEL_63;
  }
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"proxies"]);
  id v13 = [v12 countByEnumeratingWithState:&v79 objects:v85 count:16];
  v77 = v12;
  if (!v13)
  {

    id v37 = 0LL;
LABEL_37:
    uint64_t v38 = nplog_obj(v34, v35, v36);
    v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "Did not find a masque proxy config in the list",  buf,  2u);
    }

    goto LABEL_62;
  }

  id v14 = v13;
  v72 = self;
  id v73 = v7;
  v75 = 0LL;
  char v74 = 0;
  uint64_t v15 = *(void *)v80;
  v78 = v11;
  uint64_t v16 = v12;
  while (2)
  {
    for (i = 0LL; i != v14; i = (char *)i + 1)
    {
      if (*(void *)v80 != v15) {
        objc_enumerationMutation(v16);
      }
      v18 = *(void **)(*((void *)&v79 + 1) + 8LL * (void)i);
      uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v18, v19) & 1) == 0)
      {
        uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v18, v30) & 1) == 0) {
          continue;
        }
        id v22 = v18;
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v22));
        id v20 = v31;
        if (v31)
        {
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v31 host]);
          v32 = (void *)objc_claimAutoreleasedReturnValue([v20 path]);
          unsigned int v33 = [v32 containsString:@"/.well-known/masque/udp"];

          if (v33)
          {
            id v37 = v20;

            id v7 = v73;
            id v11 = v78;
            goto LABEL_40;
          }

          id v11 = v78;
        }

- (void)fetchIndividualProxyConfig:(id)a3 completionHander:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18[0] = 0LL;
  v18[1] = v18;
  v18[2] = 0x3032000000LL;
  v18[3] = sub_10004BA24;
  v18[4] = sub_10004BA34;
  id v19 = 0LL;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLRequest requestWithURL:cachePolicy:timeoutInterval:]( &OBJC_CLASS___NSURLRequest,  "requestWithURL:cachePolicy:timeoutInterval:",  v6,  1LL,  30.0));
  if (self) {
    session = self->_session;
  }
  else {
    session = 0LL;
  }
  v10 = session;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10004BA3C;
  v14[3] = &unk_1000F9E00;
  id v11 = v6;
  id v15 = v11;
  v17 = v18;
  id v12 = v7;
  id v16 = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSURLSession dataTaskWithRequest:completionHandler:]( v10,  "dataTaskWithRequest:completionHandler:",  v8,  v14));

  [v13 resume];
  _Block_object_dispose(v18, 8);
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v20 = a5;
  uint64_t v8 = (void (**)(id, uint64_t, void))a6;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v20 protectionSpace]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 authenticationMethod]);
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    goto LABEL_10;
  }
  p_serverDelegate = &self->_serverDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverDelegate);
  if (!WeakRetained) {
    goto LABEL_10;
  }
  id v14 = WeakRetained;
  id v15 = objc_loadWeakRetained((id *)p_serverDelegate);
  if ((objc_opt_respondsToSelector(v15, "canIgnoreInvalidCertsOnInternalBuild") & 1) == 0)
  {

LABEL_10:
    goto LABEL_11;
  }

  id v16 = objc_loadWeakRetained((id *)p_serverDelegate);
  unsigned int v17 = [v16 canIgnoreInvalidCertsOnInternalBuild];

  if (!v17)
  {
LABEL_11:
    v8[2](v8, 1LL, 0LL);
    goto LABEL_12;
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue([v20 protectionSpace]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLCredential credentialForTrust:]( NSURLCredential,  "credentialForTrust:",  [v18 serverTrust]));
  ((void (**)(id, uint64_t, void *))v8)[2](v8, 0LL, v19);

LABEL_12:
}

- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4
{
  uint64_t v4 = nplog_obj(self, a2, a3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "PvD configuration fetch is waiting for connectivity",  v6,  2u);
  }
}

- (void).cxx_destruct
{
}

@end