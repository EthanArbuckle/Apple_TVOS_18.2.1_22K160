@interface SHHapticsFetcher
- (BOOL)allowsCachedAssets;
- (NSString)bundleIdentifier;
- (SHHapticsEndpointRequester)networkRequester;
- (SHHapticsFetcher)init;
- (SHHapticsFetcher)initWithURLBuilder:(id)a3 networkRequester:(id)a4;
- (SHShazamKitServerURLBuilder)urlBuilder;
- (int64_t)clientType;
- (void)hapticsForMediaItems:(id)a3 completionHandler:(id)a4;
- (void)hasHapticTrackForMediaItem:(id)a3 completionHandler:(id)a4;
- (void)setAllowsCachedAssets:(BOOL)a3;
@end

@implementation SHHapticsFetcher

- (SHHapticsFetcher)init
{
  v3 = objc_alloc_init(&OBJC_CLASS___SHShazamKitServerURLBuilder);
  v4 = -[SHHapticsEndpointRequester initWithClientIdentifier:clientType:]( objc_alloc(&OBJC_CLASS___SHHapticsEndpointRequester),  "initWithClientIdentifier:clientType:",  @"com.apple.shazamd",  1LL);
  v5 = -[SHHapticsFetcher initWithURLBuilder:networkRequester:](self, "initWithURLBuilder:networkRequester:", v3, v4);

  return v5;
}

- (SHHapticsFetcher)initWithURLBuilder:(id)a3 networkRequester:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SHHapticsFetcher;
  v9 = -[SHHapticsFetcher init](&v13, "init");
  v10 = v9;
  if (v9)
  {
    bundleIdentifier = v9->_bundleIdentifier;
    v9->_bundleIdentifier = (NSString *)@"com.apple.shazamd";

    v10->_clientType = 1LL;
    objc_storeStrong((id *)&v10->_urlBuilder, a3);
    objc_storeStrong((id *)&v10->_networkRequester, a4);
    v10->_allowsCachedAssets = 0;
  }

  return v10;
}

- (void)hasHapticTrackForMediaItem:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 properties]);
  id v9 = [v8 count];

  if (v9)
  {
    objc_initWeak(&location, self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHHapticsFetcher urlBuilder](self, "urlBuilder"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHHapticsFetcher bundleIdentifier](self, "bundleIdentifier"));
    int64_t v12 = -[SHHapticsFetcher clientType](self, "clientType");
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10003C96C;
    v14[3] = &unk_10006DE18;
    id v16 = v7;
    id v15 = v6;
    objc_copyWeak(&v17, &location);
    [v10 loadHapticsEndpointForClientIdentifier:v11 clientType:v12 callback:v14];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  else
  {
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue( +[SHCoreError errorWithCode:underlyingError:keyOverrides:]( &OBJC_CLASS___SHCoreError,  "errorWithCode:underlyingError:keyOverrides:",  400LL,  0LL,  &__NSDictionary0__struct));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v13);
  }
}

- (void)hapticsForMediaItems:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    objc_initWeak(&location, self);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHHapticsFetcher urlBuilder](self, "urlBuilder"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHHapticsFetcher bundleIdentifier](self, "bundleIdentifier"));
    int64_t v10 = -[SHHapticsFetcher clientType](self, "clientType");
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10003CC74;
    v11[3] = &unk_10006DE18;
    id v13 = v7;
    id v12 = v6;
    objc_copyWeak(&v14, &location);
    [v8 loadHapticsEndpointForClientIdentifier:v9 clientType:v10 callback:v11];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  else
  {
    (*((void (**)(id, void *, void))v7 + 2))(v7, &__NSArray0__struct, 0LL);
  }
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int64_t)clientType
{
  return self->_clientType;
}

- (SHShazamKitServerURLBuilder)urlBuilder
{
  return self->_urlBuilder;
}

- (SHHapticsEndpointRequester)networkRequester
{
  return self->_networkRequester;
}

- (BOOL)allowsCachedAssets
{
  return self->_allowsCachedAssets;
}

- (void)setAllowsCachedAssets:(BOOL)a3
{
  self->_allowsCachedAssets = a3;
}

- (void).cxx_destruct
{
}

@end