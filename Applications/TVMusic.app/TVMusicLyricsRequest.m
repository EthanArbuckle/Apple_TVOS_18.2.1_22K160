@interface TVMusicLyricsRequest
+ (BOOL)_hasBundledTTMLLyricsForSong:(id)a3;
+ (BOOL)isExplicitLyricsRestrictedError:(id)a3;
+ (TVMusicLyricsRequest)sharedInstance;
+ (id)_TTMLLyricsFromResourceForSong:(id)a3;
+ (id)_TTMLResourcePathForSong:(id)a3;
+ (void)_debugSaveTTMLForSong:(id)a3;
+ (void)_storeFrontSupportsLyrics:(id)a3;
+ (void)requestTTMLLyricsForSong:(id)a3 completion:(id)a4;
- (BOOL)storeFrontSupportsLyrics;
- (void)_updateFromBag;
- (void)setStoreFrontSupportsLyrics:(BOOL)a3;
- (void)setup;
@end

@implementation TVMusicLyricsRequest

+ (TVMusicLyricsRequest)sharedInstance
{
  if (qword_1002BEBB8 != -1) {
    dispatch_once(&qword_1002BEBB8, &stru_10026DB38);
  }
  return (TVMusicLyricsRequest *)(id)qword_1002BEBB0;
}

- (void)setup
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"_updateFromBag" name:ICURLBagProviderDidUpdateBagNotification object:0];

  -[TVMusicLyricsRequest _updateFromBag](self, "_updateFromBag");
}

- (void)_updateFromBag
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000B8A44;
  v2[3] = &unk_100268F50;
  v2[4] = self;
  +[TVMusicLyricsRequest _storeFrontSupportsLyrics:]( &OBJC_CLASS___TVMusicLyricsRequest,  "_storeFrontSupportsLyrics:",  v2);
}

+ (id)_TTMLResourcePathForSong:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v5 = [v4 BOOLForKey:@"TVMusic.UseBundledLyrics"];

  if (v5
    && (v6 = (void *)objc_claimAutoreleasedReturnValue([v3 identifiers]),
        v7 = (void *)objc_claimAutoreleasedReturnValue([v6 universalStore]),
        id v8 = [v7 adamID],
        v7,
        v6,
        v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"/var/mobile/Media/TTML/%lld.ttml",  v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v11 = [v10 fileExistsAtPath:v9];

    if ((v11 & 1) == 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v8));
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 stringValue]);
      uint64_t v15 = objc_claimAutoreleasedReturnValue([v12 pathForResource:v14 ofType:@"ttml"]);

      v9 = (void *)v15;
    }
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

+ (id)_TTMLLyricsFromResourceForSong:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _TTMLResourcePathForSong:a3]);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfFile:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfFile:encoding:error:",  v3,  4LL,  0LL));
    unsigned int v5 = v4;
    if (v4) {
      id v6 = v4;
    }
  }

  else
  {
    unsigned int v5 = 0LL;
  }

  return v5;
}

+ (BOOL)_hasBundledTTMLLyricsForSong:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _TTMLResourcePathForSong:a3]);
  BOOL v4 = v3 != 0LL;

  return v4;
}

+ (void)requestTTMLLyricsForSong:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvm_songWithTTMLLyrics:", 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiers]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 universalStore]);
  id v11 = [v10 adamID];

  if (!v11)
  {
    id v16 = sub_1000B90D0();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Time-synced lyrics can't be shown because song does not have a universal store ID: %@",  buf,  0xCu);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  off_1002B6D78,  1001LL,  0LL));
    goto LABEL_11;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVMSubscriptionManager sharedInstance](&OBJC_CLASS___TVMSubscriptionManager, "sharedInstance"));
  unsigned __int8 v13 = [v12 hasMusicSubscription];

  if ((v13 & 1) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  off_1002B6D78,  1000LL,  0LL));
    id v18 = sub_1000B90D0();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Time-synced lyrics not permitted because user does not have a valid subscription: %@",  buf,  0xCu);
    }

LABEL_11:
    v7[2](v7, v8, v14);
    goto LABEL_23;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _TTMLLyricsFromResourceForSong:v6]);
  if (v14)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvm_songWithTTMLLyrics:", v14));
    v7[2](v7, v15, 0LL);
  }

  else
  {
    if (qword_1002BEBC0 != -1) {
      dispatch_once(&qword_1002BEBC0, &stru_10026DB58);
    }
    v20 = (void *)qword_1002BEBC8;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v11));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:v21]);

    id v22 = sub_1000B90D0();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
    if (v15)
    {
      if (v24)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
        *(_DWORD *)buf = 138412546;
        id v42 = v25;
        __int16 v43 = 2048;
        id v44 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "Getting TTML data from cache for song %@, id=%llu",  buf,  0x16u);
      }

      id v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvm_songWithLyrics:", v15));
      v7[2](v7, v26, 0LL);
    }

    else
    {
      if (v24)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
        v28 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiers]);
        v29 = (void *)objc_claimAutoreleasedReturnValue([v28 universalStore]);
        *(_DWORD *)buf = 138412546;
        id v42 = v27;
        __int16 v43 = 2048;
        id v44 = [v29 adamID];
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "Requesting lyrics for song %@, id=%llu using MPStoreLyricsRequest",  buf,  0x16u);
      }

      id v26 = objc_alloc_init(&OBJC_CLASS___MPStoreLyricsRequest);
      [v26 setSong:v6];
      v30 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
      -[NSOperationQueue setQualityOfService:](v30, "setQualityOfService:", 25LL);
      -[NSOperationQueue setName:](v30, "setName:", @"com.apple.TVMusicLyricsRequest.LyricsOperationQueue");
      v33 = _NSConcreteStackBlock;
      uint64_t v34 = 3221225472LL;
      v35 = sub_1000B914C;
      v36 = &unk_10026DB80;
      v37 = v30;
      id v40 = a1;
      id v38 = v6;
      v39 = v7;
      v31 = v30;
      id v32 = [v26 newOperationWithResponseHandler:&v33];
      -[NSOperationQueue addOperation:](v31, "addOperation:", v32, v33, v34, v35, v36);
    }
  }

LABEL_23:
}

+ (BOOL)isExplicitLyricsRestrictedError:(id)a3
{
  id v3 = a3;
  if ([v3 code] == (id)-3005)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
    unsigned __int8 v5 = [v4 isEqualToString:MPStoreLyricsRequestErrorDomain];
  }

  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

+ (void)_storeFrontSupportsLyrics:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_alloc(&OBJC_CLASS___ICStoreRequestContext);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity activeAccount](&OBJC_CLASS___ICUserIdentity, "activeAccount"));
  id v6 = -[ICStoreRequestContext initWithIdentity:](v4, "initWithIdentity:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLBagProvider sharedBagProvider](&OBJC_CLASS___ICURLBagProvider, "sharedBagProvider"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000B9468;
  v9[3] = &unk_10026DBA8;
  id v10 = v3;
  id v8 = v3;
  [v7 getBagForRequestContext:v6 withCompletionHandler:v9];
}

+ (void)_debugSaveTTMLForSong:(id)a3
{
  id v3 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
  unsigned __int8 v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B95DC;
  block[3] = &unk_100268CF0;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, block);
}

- (BOOL)storeFrontSupportsLyrics
{
  return self->_storeFrontSupportsLyrics;
}

- (void)setStoreFrontSupportsLyrics:(BOOL)a3
{
  self->_storeFrontSupportsLyrics = a3;
}

@end