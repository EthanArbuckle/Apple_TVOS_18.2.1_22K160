@interface SHMediaItemFetcher
+ (id)urlRequestsForBaseURL:(id)a3 shazamIDs:(id)a4 batchSize:(int64_t)a5;
- (NSString)bundleIdentifier;
- (SHMediaItemFetcher)initWithBundleIdentifier:(id)a3 clientType:(int64_t)a4;
- (SHMediaItemFetcher)initWithBundleIdentifier:(id)a3 clientType:(int64_t)a4 URLBuilder:(id)a5 contextBuilder:(id)a6 networkRequester:(id)a7;
- (SHNetworkPaginatedRequester)networkRequester;
- (SHServerResponseContextBuilder)contextBuilder;
- (SHShazamKitServerURLBuilder)URLBuilder;
- (int64_t)clientType;
- (void)commonInitWithBundleIdentifier:(id)a3 clientType:(int64_t)a4 URLBuilder:(id)a5 contextBuilder:(id)a6 networkRequester:(id)a7;
- (void)mediaItemsForShazamIDs:(id)a3 completionHandler:(id)a4;
@end

@implementation SHMediaItemFetcher

- (SHMediaItemFetcher)initWithBundleIdentifier:(id)a3 clientType:(int64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SHMediaItemFetcher;
  v7 = -[SHMediaItemFetcher init](&v12, "init");
  if (v7)
  {
    v8 = objc_alloc_init(&OBJC_CLASS___SHShazamKitServerURLBuilder);
    v9 = objc_alloc_init(&OBJC_CLASS___SHServerResponseContextBuilder);
    v10 = -[SHAMSPaginatedEndpointRequester initWithClientIdentifier:clientType:]( objc_alloc(&OBJC_CLASS___SHAMSPaginatedEndpointRequester),  "initWithClientIdentifier:clientType:",  v6,  a4);
    -[SHMediaItemFetcher commonInitWithBundleIdentifier:clientType:URLBuilder:contextBuilder:networkRequester:]( v7,  "commonInitWithBundleIdentifier:clientType:URLBuilder:contextBuilder:networkRequester:",  v6,  a4,  v8,  v9,  v10);
  }

  return v7;
}

- (SHMediaItemFetcher)initWithBundleIdentifier:(id)a3 clientType:(int64_t)a4 URLBuilder:(id)a5 contextBuilder:(id)a6 networkRequester:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___SHMediaItemFetcher;
  v16 = -[SHMediaItemFetcher init](&v19, "init");
  v17 = v16;
  if (v16) {
    -[SHMediaItemFetcher commonInitWithBundleIdentifier:clientType:URLBuilder:contextBuilder:networkRequester:]( v16,  "commonInitWithBundleIdentifier:clientType:URLBuilder:contextBuilder:networkRequester:",  v12,  a4,  v13,  v14,  v15);
  }

  return v17;
}

- (void)commonInitWithBundleIdentifier:(id)a3 clientType:(int64_t)a4 URLBuilder:(id)a5 contextBuilder:(id)a6 networkRequester:(id)a7
{
  id v12 = (NSString *)a3;
  id v13 = (SHShazamKitServerURLBuilder *)a5;
  id v14 = (SHServerResponseContextBuilder *)a6;
  id v15 = (SHNetworkPaginatedRequester *)a7;
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v12;
  v22 = v12;

  URLBuilder = self->_URLBuilder;
  self->_clientType = a4;
  self->_URLBuilder = v13;
  v18 = v13;

  contextBuilder = self->_contextBuilder;
  self->_contextBuilder = v14;
  v20 = v14;

  networkRequester = self->_networkRequester;
  self->_networkRequester = v15;
}

- (void)mediaItemsForShazamIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaItemFetcher bundleIdentifier](self, "bundleIdentifier"));

    if (v8)
    {
      objc_initWeak(&location, self);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaItemFetcher URLBuilder](self, "URLBuilder"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaItemFetcher bundleIdentifier](self, "bundleIdentifier"));
      int64_t v12 = -[SHMediaItemFetcher clientType](self, "clientType");
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_10000FDC8;
      v17[3] = &unk_10006D108;
      id v19 = v7;
      v17[4] = self;
      objc_copyWeak(&v20, &location);
      id v18 = v6;
      [v10 loadLookupEndpointForClientIdentifier:v11 clientType:v12 callback:v17];

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }

    else
    {
      uint64_t v13 = sh_log_object(v9);
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(location) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "Failed fetching media item, bundle identifier missing",  (uint8_t *)&location,  2u);
      }

      NSErrorUserInfoKey v22 = NSDebugDescriptionErrorKey;
      v23 = @"Failed to fetch media item due to missing bundle identifier";
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[SHError errorWithCode:underlyingError:keyOverrides:]( &OBJC_CLASS___SHError,  "errorWithCode:underlyingError:keyOverrides:",  500LL,  0LL,  v15));
      (*((void (**)(id, void *, void *))v7 + 2))(v7, &__NSArray0__struct, v16);
    }
  }

  else
  {
    (*((void (**)(id, void *, void))v7 + 2))(v7, &__NSArray0__struct, 0LL);
  }
}

+ (id)urlRequestsForBaseURL:(id)a3 shazamIDs:(id)a4 batchSize:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if ([v8 count])
  {
    unint64_t v10 = 0LL;
    do
    {
      v11 = (char *)[v8 count];
      else {
        int64_t v12 = (int64_t)&v11[-v10];
      }
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subarrayWithRange:", v10, v12));
      id v14 = -[NSURLComponents initWithURL:resolvingAgainstBaseURL:]( objc_alloc(&OBJC_CLASS___NSURLComponents),  "initWithURL:resolvingAgainstBaseURL:",  v7,  0LL);
      id v15 = objc_alloc(&OBJC_CLASS___NSURLQueryItem);
      v16 = objc_alloc(&OBJC_CLASS___NSString);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v13 componentsJoinedByString:@","]);
      id v18 = -[NSString initWithFormat:](v16, "initWithFormat:", @"%@", v17);
      id v19 = -[NSURLQueryItem initWithName:value:](v15, "initWithName:value:", @"ids", v18);

      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents queryItems](v14, "queryItems"));
      v21 = v20;
      if (!v20) {
        id v20 = &__NSArray0__struct;
      }
      NSErrorUserInfoKey v22 = (void *)objc_claimAutoreleasedReturnValue([v20 arrayByAddingObject:v19]);
      -[NSURLComponents setQueryItems:](v14, "setQueryItems:", v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents URL](v14, "URL"));
      if (v23)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents URL](v14, "URL"));
        v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableURLRequest requestWithURL:]( &OBJC_CLASS___NSMutableURLRequest,  "requestWithURL:",  v24));

        [v25 addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        id v26 = [v25 copy];
        [v9 addObject:v26];
      }

      unint64_t v10 = (int)v10 + (int)a5;
    }

    while (v10 < (unint64_t)[v8 count]);
  }

  id v27 = [v9 copy];

  return v27;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int64_t)clientType
{
  return self->_clientType;
}

- (SHShazamKitServerURLBuilder)URLBuilder
{
  return self->_URLBuilder;
}

- (SHServerResponseContextBuilder)contextBuilder
{
  return self->_contextBuilder;
}

- (SHNetworkPaginatedRequester)networkRequester
{
  return self->_networkRequester;
}

- (void).cxx_destruct
{
}

@end