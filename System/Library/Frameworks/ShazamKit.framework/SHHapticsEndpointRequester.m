@interface SHHapticsEndpointRequester
- (BOOL)allowsCachedAssets;
- (SHHapticsEndpointRequester)initWithClientIdentifier:(id)a3 clientType:(int64_t)a4;
- (SHHapticsEndpointRequester)initWithNetworkRequester:(id)a3;
- (SHNetworkRecognitionRequester)endpointRequester;
- (id)cachedHapticsResponseForSongItem:(id)a3 representingMediaItem:(id)a4;
- (id)hapticSongItemFromResponse:(id)a3 songDuration:(double)a4 error:(id *)a5;
- (id)hapticsDownloadRequestFromDownloadURL:(id)a3;
- (id)updateMediaItem:(id)a3 withSongItem:(id)a4;
- (void)invalidate;
- (void)performHapticsTrackAvailabilityRequest:(id)a3 completionHandler:(id)a4;
- (void)performRequests:(id)a3 completionHandler:(id)a4;
- (void)setAllowsCachedAssets:(BOOL)a3;
@end

@implementation SHHapticsEndpointRequester

- (SHHapticsEndpointRequester)initWithClientIdentifier:(id)a3 clientType:(int64_t)a4
{
  id v6 = a3;
  v7 = -[SHAMSEndpointRequester initWithClientIdentifier:clientType:]( objc_alloc(&OBJC_CLASS___SHAMSEndpointRequester),  "initWithClientIdentifier:clientType:",  v6,  a4);

  v8 = -[SHHapticsEndpointRequester initWithNetworkRequester:](self, "initWithNetworkRequester:", v7);
  return v8;
}

- (SHHapticsEndpointRequester)initWithNetworkRequester:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SHHapticsEndpointRequester;
  id v6 = -[SHHapticsEndpointRequester init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpointRequester, a3);
    v7->_allowsCachedAssets = 0;
  }

  return v7;
}

- (void)performHapticsTrackAvailabilityRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 urlRequest]);
  BOOL v9 = v8 == 0LL;

  uint64_t v11 = sh_log_object(v10);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaItem]);
      v21 = (void *)objc_claimAutoreleasedReturnValue([v20 properties]);
      *(_DWORD *)buf = 138412290;
      v32 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Cannot check if a haptic track is available. Media item: %@ does not have required Apple Music ID or ISRC",  buf,  0xCu);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaItem]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 properties]);
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to check if a haptic track is available for media item %@. Check that AdamID or ISRC is valid.",  v23));

    NSErrorUserInfoKey v35 = NSDebugDescriptionErrorKey;
    v36 = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[SHError errorWithCode:underlyingError:keyOverrides:]( &OBJC_CLASS___SHError,  "errorWithCode:underlyingError:keyOverrides:",  600LL,  0LL,  v25));

    v7[2](v7, 0LL, v26);
  }

  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaItem]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 appleMusicID]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaItem]);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 isrc]);
      *(_DWORD *)buf = 138412546;
      v32 = v15;
      __int16 v33 = 2112;
      v34 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Fetching haptic song attributes to check for haptics availability. AdamID:%@ <-> ISRC: %@",  buf,  0x16u);
    }

    objc_initWeak((id *)buf, self);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SHHapticsEndpointRequester endpointRequester](self, "endpointRequester"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v6 urlRequest]);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100008E08;
    v27[3] = &unk_10006CDD8;
    objc_copyWeak(&v30, (id *)buf);
    id v28 = v6;
    v29 = v7;
    [v18 performRequest:v19 withReply:v27];

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
  }
}

- (void)performRequests:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v33 = a4;
  group = dispatch_group_create();
  v32 = v5;
  if (group)
  {
    queue = dispatch_queue_create("com.apple.ShazamKit.HapticEndpointRequester", 0LL);
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v5 count]));
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    id obj = v5;
    id v38 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
    if (v38)
    {
      uint64_t v35 = *(void *)v54;
      do
      {
        for (i = 0LL; i != v38; i = (char *)i + 1)
        {
          if (*(void *)v54 != v35) {
            objc_enumerationMutation(obj);
          }
          v7 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)i);
          v8 = objc_autoreleasePoolPush();
          BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v7 urlRequest]);
          BOOL v10 = v9 == 0LL;

          uint64_t v12 = sh_log_object(v11);
          v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
          v14 = v13;
          if (v10)
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaItem]);
              v22 = (void *)objc_claimAutoreleasedReturnValue([v21 properties]);
              *(_DWORD *)buf = 138412290;
              v58 = v22;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Haptics fetch request for media item: %@ does not have required Apple Music ID or ISRC",  buf,  0xCu);
            }

            v23 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaItem]);
            v24 = (void *)objc_claimAutoreleasedReturnValue([v23 properties]);
            v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to fetch haptics for media item %@. Check AdamID or ISRC is valid.",  v24));

            NSErrorUserInfoKey v61 = NSDebugDescriptionErrorKey;
            v62 = v25;
            v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v62,  &v61,  1LL));
            v27 = (void *)objc_claimAutoreleasedReturnValue( +[SHError errorWithCode:underlyingError:keyOverrides:]( &OBJC_CLASS___SHError,  "errorWithCode:underlyingError:keyOverrides:",  600LL,  0LL,  v26));

            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_100009608;
            block[3] = &unk_10006CE00;
            id v50 = v36;
            v51 = v7;
            id v52 = v27;
            id v28 = v27;
            dispatch_sync(queue, block);
          }

          else
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaItem]);
              v16 = (void *)objc_claimAutoreleasedReturnValue([v15 appleMusicID]);
              v17 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaItem]);
              v18 = (void *)objc_claimAutoreleasedReturnValue([v17 isrc]);
              *(_DWORD *)buf = 138412546;
              v58 = v16;
              __int16 v59 = 2112;
              v60 = v18;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "Fetching haptic song attributes. AdamID:%@ <-> ISRC: %@",  buf,  0x16u);
            }

            dispatch_group_enter(group);
            objc_initWeak((id *)buf, self);
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[SHHapticsEndpointRequester endpointRequester](self, "endpointRequester"));
            v20 = (void *)objc_claimAutoreleasedReturnValue([v7 urlRequest]);
            v44[0] = _NSConcreteStackBlock;
            v44[1] = 3221225472LL;
            v44[2] = sub_1000096A4;
            v44[3] = &unk_10006CEC8;
            objc_copyWeak(&v48, (id *)buf);
            v44[4] = v7;
            v45 = queue;
            id v46 = v36;
            v47 = group;
            [v19 performRequest:v20 withReply:v44];

            objc_destroyWeak(&v48);
            objc_destroyWeak((id *)buf);
          }

          objc_autoreleasePoolPop(v8);
        }

        id v38 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
      }

      while (v38);
    }

    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_100009E20;
    v41[3] = &unk_10006CEF0;
    id v42 = v36;
    id v43 = v33;
    id v29 = v36;
    dispatch_group_notify(group, queue, v41);
  }

  else
  {
    uint64_t v30 = sh_log_object(0LL);
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "Failed to create dispatch group for haptic fetch requests",  buf,  2u);
    }

    NSErrorUserInfoKey v64 = NSDebugDescriptionErrorKey;
    v65 = @"Failed to start paginated network request";
    queue = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v65,  &v64,  1LL));
    id v29 = (id)objc_claimAutoreleasedReturnValue( +[SHError errorWithCode:underlyingError:keyOverrides:]( &OBJC_CLASS___SHError,  "errorWithCode:underlyingError:keyOverrides:",  500LL,  0LL,  queue));
    (*((void (**)(id, void, id))v33 + 2))(v33, 0LL, v29);
  }
}

- (id)hapticSongItemFromResponse:(id)a3 songDuration:(double)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 data]);

  if (v8)
  {
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v7 data]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[SHServerGetResponseParser hapticSongItemFromServerData:songDuration:error:]( &OBJC_CLASS___SHServerGetResponseParser,  "hapticSongItemFromServerData:songDuration:error:",  v10,  a5,  a4));
  }

  else
  {
    uint64_t v12 = sh_log_object(v9);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v7 error]);
      int v19 = 138412290;
      v20 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "No network response for haptics song attributes fetch. Error %@",  (uint8_t *)&v19,  0xCu);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue([v7 error]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 underlyingErrors]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 firstObject]);
    +[SHError annotateClientError:code:underlyingError:]( &OBJC_CLASS___SHError,  "annotateClientError:code:underlyingError:",  a5,  600LL,  v17);

    uint64_t v11 = 0LL;
  }

  return v11;
}

- (id)updateMediaItem:(id)a3 withSongItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 appleMusicID]);
  if (v7)
  {
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 appleMusicID]);

    if (v9)
    {
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v5 properties]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v10));

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 appleMusicID]);
      [v11 setObject:v12 forKeyedSubscript:SHMediaItemAppleMusicID];

      id v13 = [v11 copy];
      id v8 = (id)objc_claimAutoreleasedReturnValue(+[SHMediaItem mediaItemWithProperties:](&OBJC_CLASS___SHMediaItem, "mediaItemWithProperties:", v13));

      goto LABEL_6;
    }
  }

  id v8 = v5;
LABEL_6:

  return v8;
}

- (id)hapticsDownloadRequestFromDownloadURL:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](&OBJC_CLASS___NSMutableURLRequest, "requestWithURL:", a3));
  [v3 setHTTPMethod:@"GET"];
  [v3 setValue:@"x-apple-archive" forHTTPHeaderField:@"Accept-Encoding"];
  id v4 = [v3 copy];

  return v4;
}

- (id)cachedHapticsResponseForSongItem:(id)a3 representingMediaItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 appleMusicID]);
  if (v8 || (id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 appleMusicID])) != 0)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[SHNetworkDownloadUtilities cachedFileURLWithFilename:type:]( &OBJC_CLASS___SHNetworkDownloadUtilities,  "cachedFileURLWithFilename:type:",  v8,  UTTypeAppleArchive));
    if (v9)
    {
      BOOL v10 = -[SHNetworkDownloadResponse initWithDownloadedFileLocation:urlResponse:error:]( objc_alloc(&OBJC_CLASS___SHNetworkDownloadResponse),  "initWithDownloadedFileLocation:urlResponse:error:",  v9,  0LL,  0LL);
      uint64_t v11 = objc_alloc(&OBJC_CLASS___SHHapticsEndpointResponse);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[SHHapticsEndpointRequester updateMediaItem:withSongItem:]( self,  "updateMediaItem:withSongItem:",  v7,  v6));
      id v13 = -[SHHapticsEndpointResponse initWithRequestMediaItem:networkDownloadResponse:]( v11,  "initWithRequestMediaItem:networkDownloadResponse:",  v12,  v10);
    }

    else
    {
      id v13 = 0LL;
    }
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

- (void)invalidate
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SHHapticsEndpointRequester endpointRequester](self, "endpointRequester"));
  [v2 invalidate];
}

- (SHNetworkRecognitionRequester)endpointRequester
{
  return self->_endpointRequester;
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