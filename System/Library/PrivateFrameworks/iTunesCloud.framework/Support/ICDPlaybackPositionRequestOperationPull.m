@interface ICDPlaybackPositionRequestOperationPull
- (ICDPlaybackPositionRequestOperationPull)initWithRequestContext:(id)a3 completionHandler:(id)a4;
- (id)_baseRequestWithURL:(id)a3;
- (id)_requestItemVersion;
- (void)_finishWithError:(id)a3;
- (void)_finishWithResponse:(id)a3 error:(id)a4;
- (void)execute;
@end

@implementation ICDPlaybackPositionRequestOperationPull

- (ICDPlaybackPositionRequestOperationPull)initWithRequestContext:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ICDPlaybackPositionRequestOperationPull;
  v9 = -[ICDPlaybackPositionRequestOperationPull init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_urlBagKey, ICURLBagKeyKVSRequestURLGet);
    id v11 = objc_retainBlock(v8);
    id completionHandler = v10->_completionHandler;
    v10->_id completionHandler = v11;
  }

  return v10;
}

- (void)execute
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICDPlaybackPositionRequestContext storeRequestContext](self->_context, "storeRequestContext"));
  if (!v3)
  {
    id v7 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      id v8 = "%{public}@ context.requestContext=nil";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v8, buf, 0xCu);
    }

- (id)_requestItemVersion
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICDPlaybackPositionRequestContext library](self->_context, "library"));
  uint64_t v4 = ML3TrackPropertyStoreBookmarkMetadataIdentifier;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDPlaybackPositionRequestContext entity](self->_context, "entity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 playbackPositionKey]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToValue:",  v4,  v6));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ML3Track anyInLibrary:predicate:](&OBJC_CLASS___ML3Track, "anyInLibrary:predicate:", v3, v7));

  v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 valueForProperty:ML3TrackPropertyStoreBookmarkMetadataEntityRevision]);
  v10 = v9;
  if (!v9) {
    v9 = @"0";
  }
  id v11 = v9;

  return v11;
}

- (id)_baseRequestWithURL:(id)a3
{
  id v4 = a3;
  v5 = -[NSMutableURLRequest initWithURL:](objc_alloc(&OBJC_CLASS___NSMutableURLRequest), "initWithURL:", v4);

  -[NSMutableURLRequest setHTTPMethod:](v5, "setHTTPMethod:", @"POST");
  -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v5,  "setValue:forHTTPHeaderField:",  ICHTTPHeaderContentTypeXApplePlist,  ICHTTPHeaderKeyContentType);
  v22[0] = @"domain";
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDPlaybackPositionRequestContext entity](self->_context, "entity"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 playbackPositionDomain]);
  v23[0] = v7;
  v22[1] = @"since-version";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICDPlaybackPositionRequestOperationPull _requestItemVersion](self, "_requestItemVersion"));
  v23[1] = v8;
  v22[2] = @"key";
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICDPlaybackPositionRequestContext entity](self->_context, "entity"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 playbackPositionKey]);
  v23[2] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  3LL));
  id v12 = [v11 mutableCopy];

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v13 deviceGUID]);

  if (v14) {
    [v12 setObject:v14 forKey:@"guid"];
  }
  v15 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138543618;
    v19 = self;
    __int16 v20 = 2114;
    id v21 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@ creating request with body: %{public}@",  (uint8_t *)&v18,  0x16u);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v12,  -[ICDPlaybackPositionRequestOperationBase bodyContentFormat](self, "bodyContentFormat"),  0LL,  0LL));
  if (v16) {
    -[NSMutableURLRequest setHTTPBody:](v5, "setHTTPBody:", v16);
  }

  return v5;
}

- (void)_finishWithResponse:(id)a3 error:(id)a4
{
  id v6 = a4;
  if (!v6)
  {
    id v7 = a3;
    id v8 = objc_alloc(&OBJC_CLASS___ICDPlaybackPositionResponseDataPull);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 parsedBodyDictionary]);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICDPlaybackPositionRequestContext entity](self->_context, "entity"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 playbackPositionDomain]);
    id v12 = -[ICDPlaybackPositionResponseDataPull initWithResponseDictionary:forDomain:]( v8,  "initWithResponseDictionary:forDomain:",  v9,  v11);

    v13 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543618;
      v17 = self;
      __int16 v18 = 2114;
      v19 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@ finished with reponseData: %{public}@",  (uint8_t *)&v16,  0x16u);
    }

    objc_super v14 = (ICPlaybackPositionEntity *)objc_claimAutoreleasedReturnValue(-[ICDPlaybackPositionResponseDataPull cloudEntity](v12, "cloudEntity"));
    resultEntity = self->_resultEntity;
    self->_resultEntity = v14;
  }

  -[ICDPlaybackPositionRequestOperationPull _finishWithError:](self, "_finishWithError:", v6);
}

- (void)_finishWithError:(id)a3
{
  id v4 = a3;
  id completionHandler = (void (**)(id, BOOL, id, ICPlaybackPositionEntity *))self->_completionHandler;
  id v6 = v4;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, v4 == 0LL, v4, self->_resultEntity);
    id v4 = v6;
  }

  -[ICDPlaybackPositionRequestOperationPull finishWithError:](self, "finishWithError:", v4);
}

- (void).cxx_destruct
{
}

@end