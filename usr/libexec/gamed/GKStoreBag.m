@interface GKStoreBag
+ (BOOL)shouldIncludeClientInfoAuthHeaderForBagKey:(id)a3;
+ (id)appleIdSession;
+ (id)deviceInfo;
+ (id)protocolVersionForClient:(id)a3;
+ (id)storeBagForEnvironment:(int64_t)a3;
+ (id)storeBagForEnvironment:(int64_t)a3 dataRequestManager:(id)a4;
+ (id)storeBagForURL:(id)a3 dataRequestManager:(id)a4;
+ (id)storeBagURLForEnvironment:(int64_t)a3;
+ (id)storeBagURLTemplateForEnvironment:(int64_t)a3;
+ (void)addAppOriginHeadersToRequest:(id)a3 clientProxy:(id)a4;
+ (void)addAppOriginHeadersToRequest:(id)a3 signatureType:(id)a4 isFirstPartyApple:(id)a5;
+ (void)addAuthHeadersToRequest:(id)a3;
+ (void)addClientInfoAuthHeaderToRequest:(id)a3;
- (BOOL)_isExpired;
- (BOOL)_isFetching;
- (BOOL)_isLastProtocolVersionUsedValid;
- (BOOL)_isValid;
- (BOOL)_isValidAndNotExpired;
- (BOOL)_shouldUseHTTPPipelining;
- (BOOL)isLoadValidForBagKey:(id)a3 date:(id)a4;
- (BOOL)shouldUseHTTPPipelining;
- (GKActivity)activity;
- (GKDataRequestManager)dataRequestManager;
- (GKStoreBag)initWithURL:(id)a3 dataRequestManager:(id)a4;
- (NSDate)expiration;
- (NSDictionary)internalBag;
- (NSError)error;
- (NSNumber)metricsPassthroughPercentage;
- (NSSet)APNSRequired;
- (NSSet)responseSignatureRequired;
- (NSSet)signatureRequired;
- (NSURL)url;
- (double)mescalSetupStartTimeStamp;
- (id)_bagKeyValidationDict;
- (id)_networkSynchonizationQueue;
- (id)_storeBagForData:(id)a3 error:(id *)a4;
- (id)description;
- (id)omnitureQueryParametersForContext:(id)a3;
- (id)requestWithURL:(id)a3 playerID:(id)a4 authToken:(id)a5 pushToken:(id)a6 client:(id)a7 postData:(id)a8 includeUDID:(BOOL)a9 includeAPNS:(BOOL)a10 sapSession:(id)a11;
- (id)requestWithURL:(id)a3 playerID:(id)a4 authToken:(id)a5 pushToken:(id)a6 client:(id)a7 postData:(id)a8 includeUDID:(BOOL)a9 includeAPNS:(BOOL)a10 sapSession:(id)a11 includeAppOriginHeaders:(BOOL)a12;
- (id)requestWithURL:(id)a3 playerID:(id)a4 authToken:(id)a5 pushToken:(id)a6 client:(id)a7 postData:(id)a8 includeUDID:(BOOL)a9 includeAPNS:(BOOL)a10 sapSession:(id)a11 includeAppOriginHeaders:(BOOL)a12 includeClientInfoAuthHeader:(BOOL)a13;
- (id)valueForUndefinedKey:(id)a3;
- (id)verifyEligibilityForBagKey:(id)a3 checkingAllowedRequestKeys:(id)a4 client:(id)a5;
- (int)hashForPlayerID:(id)a3;
- (int64_t)_achievementsThrottleThreshold;
- (int64_t)_gkSessionRateLimiting;
- (int64_t)_scoresThrottleThreshold;
- (int64_t)achievementsThrottleThreshold;
- (int64_t)gkSessionRateLimiting;
- (int64_t)scoresThrottleThreshold;
- (void)_fetchBagWithHandler:(id)a3;
- (void)_fetchFromCacheWithHandler:(id)a3;
- (void)_fetchFromServerWithHandler:(id)a3;
- (void)_loadDataForBagKey:(id)a3 postData:(id)a4 client:(id)a5 credential:(id)a6 completion:(id)a7;
- (void)_metricsThrottleThreshold:(id)a3;
- (void)_sendAsynchronousRequest:(id)a3 responseMustBeSigned:(BOOL)a4 completion:(id)a5;
- (void)_sendOneAsyncTryWithRequest:(id)a3 responseMustBeSigned:(BOOL)a4 session:(id)a5 retryCount:(int)a6 completionHandler:(id)a7;
- (void)_setupAPNSRequired:(id)a3;
- (void)_setupResponseSignatureRequired:(id)a3;
- (void)_setupSignatureRequired:(id)a3;
- (void)_updatePlayerIDHashParameters;
- (void)dealloc;
- (void)getURLForKey:(id)a3 queue:(id)a4 handler:(id)a5;
- (void)getValuesForKeys:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)getValuesWithCompletion:(id)a3;
- (void)invalidateBagKeys:(id)a3;
- (void)performAsync:(id)a3;
- (void)performSync:(id)a3;
- (void)readDataForBagKey:(id)a3 postData:(id)a4 client:(id)a5 credential:(id)a6 completion:(id)a7;
- (void)readDataForURL:(id)a3 postData:(id)a4 client:(id)a5 credential:(id)a6 includeUDID:(BOOL)a7 includeAPNS:(BOOL)a8 completion:(id)a9;
- (void)setAPNSRequired:(id)a3;
- (void)setActivity:(id)a3;
- (void)setDataRequestManager:(id)a3;
- (void)setError:(id)a3;
- (void)setExpiration:(id)a3;
- (void)setInternalBag:(id)a3;
- (void)setMescalSetupStartTimeStamp:(double)a3;
- (void)setMetricsPassthroughPercentage:(id)a3;
- (void)setResponseSignatureRequired:(id)a3;
- (void)setSignatureRequired:(id)a3;
- (void)setUrl:(id)a3;
- (void)signRequest:(id)a3 sapSession:(id)a4 postData:(id)a5;
- (void)updateURLPatternCache;
- (void)verifyEligibilityForBagKey:(id)a3 replyQueue:(id)a4 client:(id)a5 completion:(id)a6;
- (void)writeDataForBagKey:(id)a3 postData:(id)a4 client:(id)a5 credential:(id)a6 completion:(id)a7;
@end

@implementation GKStoreBag

+ (void)addAppOriginHeadersToRequest:(id)a3 clientProxy:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[GKClientAppSigningStatus headerValueForSignatureType:]( GKClientAppSigningStatus,  "headerValueForSignatureType:",  [v5 appSignatureType]));
  v7 = objc_alloc(&OBJC_CLASS___NSNumber);
  id v8 = [v5 distributorIsFirstPartyApple];

  v9 = -[NSNumber initWithBool:](v7, "initWithBool:", v8);
  +[GKStoreBag addAppOriginHeadersToRequest:signatureType:isFirstPartyApple:]( &OBJC_CLASS___GKStoreBag,  "addAppOriginHeadersToRequest:signatureType:isFirstPartyApple:",  v6,  v10,  v9);
}

+ (void)addAppOriginHeadersToRequest:(id)a3 signatureType:(id)a4 isFirstPartyApple:(id)a5
{
  id v9 = a3;
  id v7 = a5;
  [v9 setValue:a4 forHTTPHeaderField:@"x-gk-app-sig"];
  if (v7)
  {
    else {
      id v8 = @"false";
    }
    [v9 setValue:v8 forHTTPHeaderField:@"x-gk-app-store"];
  }
}

+ (id)storeBagForEnvironment:(int64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[GKStoreBag storeBagForEnvironment:dataRequestManager:]( &OBJC_CLASS___GKStoreBag,  "storeBagForEnvironment:dataRequestManager:",  a3,  v4));

  return v5;
}

+ (id)storeBagForEnvironment:(int64_t)a3 dataRequestManager:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 storeBagURLForEnvironment:a3]);
  if (v7) {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 storeBagForURL:v7 dataRequestManager:v6]);
  }
  else {
    id v8 = 0LL;
  }

  return v8;
}

+ (id)storeBagURLForEnvironment:(int64_t)a3
{
  v4 = @"jgubuxqd";
  if (a3 == 4)
  {
LABEL_9:
    id v9 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[GKStoreBag storeBagURLTemplateForEnvironment:]( &OBJC_CLASS___GKStoreBag,  "storeBagURLTemplateForEnvironment:",  a3));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByReplacingOccurrencesOfString:@"{ix}" withString:v9]);

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v10));
    goto LABEL_10;
  }

  if (a3 != 7)
  {
LABEL_7:
    goto LABEL_9;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 storeBagURL]);

  if (!v6
    || (uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v6))) == 0)
  {

    goto LABEL_7;
  }

  id v8 = (void *)v7;
LABEL_10:

  return v8;
}

+ (id)storeBagURLTemplateForEnvironment:(int64_t)a3
{
  else {
    return off_100270D90[a3 - 3];
  }
}

- (void)performSync:(id)a3
{
  syncQueue = (dispatch_queue_s *)self->_syncQueue;
  if (dispatch_get_current_queue() == syncQueue) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (dispatch_get_current_queue() != queue)\n[%s (%s:%d)]",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s invoked on the same queue(%s), would deadlock at %@",  "-[GKStoreBag performSync:]",  dispatch_queue_get_label(syncQueue),  +[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols")),  "-[GKStoreBag performSync:]",  -[NSString UTF8String]( -[NSString lastPathComponent]( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKStoreBag+NoARC.m"),  "lastPathComponent"),  "UTF8String"),  112LL));
  }
  dispatch_sync(syncQueue, a3);
}

- (void)performAsync:(id)a3
{
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GKStoreBag;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ : %@",  -[GKStoreBag description](&v3, "description"),  -[GKStoreBag url](self, "url"));
}

+ (id)storeBagForURL:(id)a3 dataRequestManager:(id)a4
{
  if (qword_1002BB6D0 != -1) {
    dispatch_once(&qword_1002BB6D0, &stru_100272870);
  }
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x3052000000LL;
  v12 = sub_1000FB768;
  v13 = sub_1000FB778;
  uint64_t v14 = 0LL;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FB784;
  block[3] = &unk_100272898;
  block[5] = a4;
  block[6] = &v9;
  block[4] = a3;
  dispatch_sync((dispatch_queue_t)qword_1002BB6C0, block);
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (GKStoreBag)initWithURL:(id)a3 dataRequestManager:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___GKStoreBag;
  id v6 = -[GKStoreBag init](&v8, "init");
  if (v6)
  {
    v6->_url = (NSURL *)[a3 copy];
    v6->_syncQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.GameKit.GKStoreBag.sync", 0LL);
    *(int32x2_t *)&v6->_playerIDHashMod = vdup_n_s32(0xF4240u);
    v6->_activity = (GKActivity *) +[GKActivity named:]( &OBJC_CLASS___GKActivity,  "named:",  @"GKStoreBag initWithURL:");
    v6->_dataRequestManager = (GKDataRequestManager *)a4;
  }

  return v6;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_syncQueue);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GKStoreBag;
  -[GKStoreBag dealloc](&v3, "dealloc");
}

- (BOOL)_isExpired
{
  return v2 <= 0.0;
}

- (BOOL)_isValid
{
  return -[NSDictionary count](self->_internalBag, "count") != 0;
}

- (BOOL)_isValidAndNotExpired
{
  NSUInteger v3 = -[NSDictionary count](self->_internalBag, "count");
  if (v3)
  {
    -[NSDate timeIntervalSinceNow](self->_expiration, "timeIntervalSinceNow");
    LOBYTE(v3) = v4 > 0.0;
  }

  return v3;
}

- (BOOL)_isFetching
{
  return self->_fetchGroup != 0LL;
}

- (BOOL)_isLastProtocolVersionUsedValid
{
  id v2 = objc_msgSend((id)objc_opt_class(self, a2), "protocolVersionForClient:", 0);
  NSUInteger v3 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  return objc_msgSend( v2,  "isEqualToString:",  -[NSUserDefaults valueForKey:](v3, "valueForKey:", GKLastProtocolVersionUsedKey));
}

- (void)_fetchFromCacheWithHandler:(id)a3
{
  current_queue = dispatch_get_current_queue();
  syncQueue = (dispatch_queue_s *)self->_syncQueue;
  if (current_queue != syncQueue)
  {
    label = dispatch_queue_get_label(current_queue);
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (_actualCurrentQueue == _syncQueue)\n[%s (%s:%d)]",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s invoked on the wrong queue (got:%s expected:%s) at %@",  "-[GKStoreBag _fetchFromCacheWithHandler:]",  label,  dispatch_queue_get_label(syncQueue),  +[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols")),  "-[GKStoreBag _fetchFromCacheWithHandler:]",  -[NSString UTF8String]( -[NSString lastPathComponent]( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKStoreBag+NoARC.m"),  "lastPathComponent"),  "UTF8String"),  216LL));
  }

  if (-[GKStoreBag _isLastProtocolVersionUsedValid](self, "_isLastProtocolVersionUsedValid"))
  {
    id v8 = -[NSURL cacheKeyRepresentation](-[GKStoreBag url](self, "url"), "cacheKeyRepresentation");
    id v9 = objc_msgSend( objc_msgSend((id)GKInsecureCacheRoot(v8), "stringByAppendingPathComponent:", @"StoreBag"),  "stringByAppendingPathComponent:",  v8);
    id v10 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
    uint64_t v11 = +[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v9);
    -[NSFileManager _gkExpirationIntervalOfFileAtPath:](v10, "_gkExpirationIntervalOfFileAtPath:", v9);
    double v13 = v12;

    uint64_t v18 = 0LL;
    if (v11)
    {
      uint64_t v11 = -[GKStoreBag _storeBagForData:error:](self, "_storeBagForData:error:", v11, &v18);
      uint64_t v14 = +[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", v13);
      -[GKStoreBag _setupAPNSRequired:](self, "_setupAPNSRequired:", v11);
      -[GKStoreBag _setupSignatureRequired:](self, "_setupSignatureRequired:", v11);
      -[GKStoreBag _setupResponseSignatureRequired:](self, "_setupResponseSignatureRequired:", v11);
      uint64_t v15 = v18;
    }

    else
    {
      uint64_t v15 = 0LL;
      uint64_t v14 = 0LL;
    }

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000FBC7C;
    v17[3] = &unk_1002728E8;
    v17[4] = self;
    v17[5] = v11;
    v17[6] = v14;
    v17[7] = v15;
    v17[8] = a3;
    v16 = v17;
  }

  else
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000FBC70;
    v19[3] = &unk_1002728C0;
    v19[4] = a3;
    v16 = v19;
  }

  -[GKStoreBag performAsync:](self, "performAsync:", v16);
}

+ (id)protocolVersionForClient:(id)a3
{
  if (a3) {
    return _[a3 protocolVersion];
  }
  else {
    return (id)GKGetProtocolVersionString( objc_msgSend( +[GKPreferences shared](GKPreferences, "shared", v3, v4),  "useTestProtocols"));
  }
}

- (void)_fetchFromServerWithHandler:(id)a3
{
  current_queue = dispatch_get_current_queue();
  syncQueue = (dispatch_queue_s *)self->_syncQueue;
  if (current_queue != syncQueue)
  {
    label = dispatch_queue_get_label(current_queue);
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (_actualCurrentQueue == _syncQueue)\n[%s (%s:%d)]",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s invoked on the wrong queue (got:%s expected:%s) at %@",  "-[GKStoreBag _fetchFromServerWithHandler:]",  label,  dispatch_queue_get_label(syncQueue),  +[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols")),  "-[GKStoreBag _fetchFromServerWithHandler:]",  -[NSString UTF8String]( -[NSString lastPathComponent]( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKStoreBag+NoARC.m"),  "lastPathComponent"),  "UTF8String"),  269LL));
  }

  id v8 = -[GKStoreBag url](self, "url");
  id v10 = objc_msgSend((id)objc_opt_class(self, v9), "protocolVersionForClient:", 0);
  id v11 = +[NSMutableURLRequest _gkHTTPRequestWithURL:postData:protocolVersion:]( &OBJC_CLASS___NSMutableURLRequest,  "_gkHTTPRequestWithURL:postData:protocolVersion:",  v8,  0LL,  v10);
  [v11 setRequestPriority:2];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000FBEB0;
  v13[3] = &unk_100272938;
  v13[4] = self;
  v13[5] = v10;
  v13[6] = v8;
  v13[7] = a3;
  objc_msgSend( (id)objc_opt_class(NSURLSession, v12),  "_gkSendAsynchronousRequest:completionHandler:",  v11,  v13);
}

- (void)_fetchBagWithHandler:(id)a3
{
  if (!os_log_GKGeneral) {
    GKOSLoggers(self);
  }
  id v5 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "GKStorebag: _fetchBagWithHandler:", buf, 2u);
  }

  current_queue = dispatch_get_current_queue();
  syncQueue = (dispatch_queue_s *)self->_syncQueue;
  if (current_queue != syncQueue)
  {
    label = dispatch_queue_get_label(current_queue);
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (_actualCurrentQueue == _syncQueue)\n[%s (%s:%d)]",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s invoked on the wrong queue (got:%s expected:%s) at %@",  "-[GKStoreBag _fetchBagWithHandler:]",  label,  dispatch_queue_get_label(syncQueue),  +[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols")),  "-[GKStoreBag _fetchBagWithHandler:]",  -[NSString UTF8String]( -[NSString lastPathComponent]( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKStoreBag+NoARC.m"),  "lastPathComponent"),  "UTF8String"),  335LL));
  }

  uint64_t v9 = +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKStoreBag+NoARC.m",  336LL,  "-[GKStoreBag _fetchBagWithHandler:]"));
  id v10 = v9;
  fetchGroup = self->_fetchGroup;
  if (fetchGroup)
  {
    uint64_t v12 = self->_syncQueue;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000FC4B8;
    v18[3] = &unk_100272960;
    v18[4] = self;
    v18[5] = a3;
    -[GKDispatchGroup join:queue:block:](v9, "join:queue:block:", fetchGroup, v12, v18);
  }

  else
  {
    self->_fetchGroup = v9;
    if (-[GKStoreBag _isValid](self, "_isValid"))
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1000FC4D8;
      v17[3] = &unk_100272988;
      v17[4] = self;
      double v13 = v17;
    }

    else
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_1000FC538;
      v16[3] = &unk_1002729D8;
      v16[4] = self;
      v16[5] = v10;
      double v13 = v16;
    }

    -[GKDispatchGroup perform:](v10, "perform:", v13);
    uint64_t v14 = self->_syncQueue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000FC66C;
    v15[3] = &unk_100272A00;
    v15[4] = self;
    v15[5] = a3;
    -[GKDispatchGroup notifyOnQueue:block:](v10, "notifyOnQueue:block:", v14, v15);
  }

- (void)getValuesWithCompletion:(id)a3
{
  if (!os_log_GKGeneral) {
    GKOSLoggers(self);
  }
  id v5 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "GKStorebag: getBagWithHandler", buf, 2u);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000FC770;
  v6[3] = &unk_100272A00;
  v6[4] = self;
  v6[5] = a3;
  -[GKStoreBag performAsync:](self, "performAsync:", v6);
}

- (void)_setupAPNSRequired:(id)a3
{
  uint64_t v4 = (_UNKNOWN **)[a3 objectForKey:@"gk-push-token-required"];
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = &off_1002886E8;
  }
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray, v5);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ ([APNSRequiredArray isKindOfClass:[NSArray class]])\n[%s (%s:%d)]",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"got %@, expected NSArray",  objc_opt_class(v6, v8)),  "-[GKStoreBag _setupAPNSRequired:]",  -[NSString UTF8String]( -[NSString lastPathComponent]( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKStoreBag+NoARC.m"),  "lastPathComponent"),  "UTF8String"),  425LL));
  }
  -[GKStoreBag setAPNSRequired:]( self,  "setAPNSRequired:",  +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));
}

- (void)_setupSignatureRequired:(id)a3
{
  id v4 = [a3 objectForKey:@"gk-sap-signed-requests"];
  -[GKStoreBag setSignatureRequired:](self, "setSignatureRequired:", 0LL);
  if (v4) {
    -[GKStoreBag setSignatureRequired:]( self,  "setSignatureRequired:",  +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v4));
  }
}

- (void)_metricsThrottleThreshold:(id)a3
{
}

- (void)_setupResponseSignatureRequired:(id)a3
{
  id v4 = [a3 objectForKey:@"gk-sap-signed-response-include-patterns"];
  -[GKStoreBag setResponseSignatureRequired:](self, "setResponseSignatureRequired:", 0LL);
  if (v4) {
    -[GKStoreBag setResponseSignatureRequired:]( self,  "setResponseSignatureRequired:",  +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v4));
  }
}

- (void)getURLForKey:(id)a3 queue:(id)a4 handler:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000FCB30;
  v5[3] = &unk_100272AA0;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  v5[7] = a5;
  -[GKActivity childNamed:execute:]( -[GKStoreBag activity](self, "activity"),  "childNamed:execute:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKStoreBag+NoARC.m",  458LL,  "-[GKStoreBag getURLForKey:queue:handler:]"),  v5);
}

- (void)getValuesForKeys:(id)a3 queue:(id)a4 completion:(id)a5
{
  if (!os_log_GKGeneral) {
    GKOSLoggers(self);
  }
  uint64_t v9 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKStoreBag: getValuesForKeys", buf, 2u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000FCD18;
  v10[3] = &unk_100272A78;
  v10[4] = a3;
  v10[5] = a4;
  v10[6] = self;
  v10[7] = a5;
  -[GKStoreBag getValuesWithCompletion:](self, "getValuesWithCompletion:", v10);
}

- (id)valueForUndefinedKey:(id)a3
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  uint64_t v9 = sub_1000FB768;
  id v10 = sub_1000FB778;
  uint64_t v11 = 0LL;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000FCE70;
  v5[3] = &unk_100272898;
  v5[5] = a3;
  v5[6] = &v6;
  v5[4] = self;
  -[GKStoreBag performSync:](self, "performSync:", v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)omnitureQueryParametersForContext:(id)a3
{
  return objc_msgSend( -[NSDictionary objectForKey:](self->_internalBag, "objectForKey:", GKQueryParamsBagKey),  "objectForKey:",  a3);
}

- (BOOL)shouldUseHTTPPipelining
{
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000FCF7C;
  v4[3] = &unk_100272AC8;
  v4[4] = self;
  v4[5] = &v5;
  -[GKStoreBag performSync:](self, "performSync:", v4);
  char v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)_shouldUseHTTPPipelining
{
  id v3 = objc_msgSend(+[GKPreferences shared](GKPreferences, "shared"), "pipeliningSetting");
  if (v3 == (id)2) {
    return 1;
  }
  if (v3) {
    return 0;
  }
  return objc_msgSend( -[NSDictionary objectForKey:]( self->_internalBag,  "objectForKey:",  @"gk-disable-http-pipelining"),  "BOOLValue") ^ 1;
}

- (int64_t)gkSessionRateLimiting
{
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000FD0A8;
  v4[3] = &unk_100272AC8;
  v4[4] = self;
  v4[5] = &v5;
  -[GKStoreBag performSync:](self, "performSync:", v4);
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (int64_t)_gkSessionRateLimiting
{
  int64_t result = (int64_t)objc_msgSend( -[NSDictionary valueForKey:](self->_internalBag, "valueForKey:", GKSessionRateLimiting),  "integerValue");
  if (!result) {
    return 5LL;
  }
  return result;
}

- (int64_t)achievementsThrottleThreshold
{
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000FD1A8;
  v4[3] = &unk_100272AC8;
  v4[4] = self;
  v4[5] = &v5;
  -[GKStoreBag performSync:](self, "performSync:", v4);
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (int64_t)_achievementsThrottleThreshold
{
  int64_t result = (int64_t)objc_msgSend( -[NSDictionary valueForKey:]( self->_internalBag,  "valueForKey:",  GKAchievementsThrottleThreshold),  "integerValue");
  if (!result) {
    return 5LL;
  }
  return result;
}

- (int64_t)scoresThrottleThreshold
{
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000FD2A8;
  v4[3] = &unk_100272AC8;
  v4[4] = self;
  v4[5] = &v5;
  -[GKStoreBag performSync:](self, "performSync:", v4);
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (int64_t)_scoresThrottleThreshold
{
  int64_t result = (int64_t)objc_msgSend( -[NSDictionary valueForKey:](self->_internalBag, "valueForKey:", GKScoresThrottleThreshold),  "integerValue");
  if (!result) {
    return 5LL;
  }
  return result;
}

- (id)_storeBagForData:(id)a3 error:(id *)a4
{
  uint64_t v31 = 100LL;
  uint64_t isKindOfClass = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  a3,  0LL,  &v31,  a4);
  if (!isKindOfClass
    || (char v8 = (void *)isKindOfClass,
        uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary, v7),
        uint64_t isKindOfClass = objc_opt_isKindOfClass(v8, v9),
        (isKindOfClass & 1) == 0))
  {
    if (!os_log_GKGeneral) {
      GKOSLoggers(isKindOfClass);
    }
    v16 = (os_log_s *)os_log_GKDaemon;
    if (!os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
    uint64_t v18 = objc_opt_class(self, v17);
    id v19 = *a4;
    *(_DWORD *)buf = 138412546;
    uint64_t v33 = v18;
    __int16 v34 = 2112;
    id v35 = v19;
    v20 = "GKStoreBag: %@: bad responseDict: %@";
    v21 = v16;
    uint32_t v22 = 22;
    goto LABEL_12;
  }

  id v10 = [v8 objectForKey:@"bag"];
  if (!v10)
  {
    if (!os_log_GKGeneral) {
      GKOSLoggers(0LL);
    }
    v28 = (os_log_s *)os_log_GKDaemon;
    if (!os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
    uint64_t v30 = objc_opt_class(self, v29);
    *(_DWORD *)buf = 138412290;
    uint64_t v33 = v30;
    v20 = "GKStoreBag: %@: bad bagData";
    v21 = v28;
    uint32_t v22 = 12;
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, v20, buf, v22);
LABEL_13:
    double v13 = 0LL;
    goto LABEL_14;
  }

  uint64_t v11 = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v10,  0LL,  &v31,  a4);
  double v13 = (void *)v11;
  if (v11)
  {
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary, v12);
    uint64_t v11 = objc_opt_isKindOfClass(v13, v14);
    if ((v11 & 1) != 0)
    {
      id v15 = 0LL;
      if (!a4) {
        return v13;
      }
      goto LABEL_15;
    }
  }

  if (!os_log_GKGeneral) {
    GKOSLoggers(v11);
  }
  v24 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    uint64_t v26 = objc_opt_class(self, v25);
    id v27 = *a4;
    *(_DWORD *)buf = 138412546;
    uint64_t v33 = v26;
    __int16 v34 = 2112;
    id v35 = v27;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "GKStoreBag: %@: Could not unserialize the URL bag: %@",  buf,  0x16u);
  }

- (void)updateURLPatternCache
{
  id v3 = -[GKDataRequestManager storeBag](-[GKStoreBag dataRequestManager](self, "dataRequestManager"), "storeBag");
  if (v3 != self)
  {
    if (!os_log_GKGeneral) {
      GKOSLoggers(v3);
    }
    id v4 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      uint64_t v5 = "Received update for bag that isn't current. Ignoring. See <rdar://problem/12960277>.";
      uint64_t v6 = v4;
      uint32_t v7 = 2;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v5, buf, v7);
      return;
    }

    return;
  }

  char v8 = -[GKStoreBag internalBag](self, "internalBag");
  id v9 = -[NSDictionary objectForKeyedSubscript:]( v8,  "objectForKeyedSubscript:",  @"gk-launch-gamecenter-host-patterns");
  id v10 = -[NSDictionary objectForKeyedSubscript:]( v8,  "objectForKeyedSubscript:",  @"gk-launch-gamecenter-path-patterns");
  if (!v9) {
    return;
  }
  uint64_t v11 = v10;
  if (!v10) {
    return;
  }
  uint64_t v12 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  double v13 = -[NSUserDefaults URLForKey:](v12, "URLForKey:", @"GKURLPatternCacheBagURLUserDefaultsKey");
  objc_msgSend( -[NSUserDefaults objectForKey:](v12, "objectForKey:", @"GKURLPatternCacheExpirationDateUserDefaultsKey"),  "timeIntervalSinceDate:",  -[GKStoreBag expiration](self, "expiration"));
  double v15 = v14;
  if (-[NSURL isEqual:](-[GKStoreBag url](self, "url"), "isEqual:", v13))
  {
    if (v15 >= 0.0) {
      return;
    }
  }

  -[NSUserDefaults setURL:forKey:]( v12,  "setURL:forKey:",  -[GKStoreBag url](self, "url"),  @"GKURLPatternCacheBagURLUserDefaultsKey");
  id v16 = -[NSUserDefaults setObject:forKey:]( v12,  "setObject:forKey:",  -[GKStoreBag expiration](self, "expiration"),  @"GKURLPatternCacheExpirationDateUserDefaultsKey");
  if (!os_log_GKGeneral) {
    GKOSLoggers(v16);
  }
  uint64_t v17 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Updating URL pattern cache", buf, 2u);
  }

  v28[1] = @"gk-launch-gamecenter-path-patterns";
  v29[0] = v9;
  v28[0] = @"gk-launch-gamecenter-host-patterns";
  v29[1] = [v11 arrayByAddingObject:@"^/(me|players|friends|games|requests|challenges|htmlResources)($|/.*)"];
  uint64_t v18 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  2LL);
  id v19 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"Library/Caches/com.apple.gamed/url-resolution.plist"];
  uint64_t v25 = 0LL;
  BOOL v20 = -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  [v19 stringByDeletingLastPathComponent],  1,  0,  &v25);
  if (!v20)
  {
    if (!os_log_GKGeneral) {
      GKOSLoggers(v20);
    }
    v24 = (os_log_s *)os_log_GKDaemon;
    if (!os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v27 = v25;
    uint64_t v5 = "Failed to create folder for url pattern cache: %@";
LABEL_31:
    uint64_t v6 = v24;
    uint32_t v7 = 12;
    goto LABEL_6;
  }

  v21 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v18,  200LL,  0LL,  &v25);
  if (!v21)
  {
    if (!os_log_GKGeneral) {
      GKOSLoggers(0LL);
    }
    v24 = (os_log_s *)os_log_GKDaemon;
    if (!os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v27 = v25;
    uint64_t v5 = "Failed to decode data for url pattern cache: %@";
    goto LABEL_31;
  }

  BOOL v22 = -[NSData writeToFile:options:error:](v21, "writeToFile:options:error:", v19, 0LL, &v25);
  if (v22)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification( DarwinNotifyCenter,  @"com.apple.gamed.changed-url-resolution",  0LL,  0LL,  1u);
    return;
  }

  if (!os_log_GKGeneral) {
    GKOSLoggers(v22);
  }
  v24 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v27 = v25;
    uint64_t v5 = "Failed to write url pattern cache: %@";
    goto LABEL_31;
  }

- (void)_updatePlayerIDHashParameters
{
  id v3 = -[GKStoreBag internalBag](self, "internalBag");
  id v4 = -[NSDictionary objectForKey:](v3, "objectForKey:", GKPlayerIDHashModKey);
  id v5 = -[NSDictionary objectForKey:](v3, "objectForKey:", GKPlayerIDHashAddKey);
  if (v4) {
    BOOL v6 = v5 == 0LL;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    uint32_t v7 = v5;
    while (!GKAtomicCompareAndSwap32Barrier( self->_playerIDHashMod,  [v4 integerValue],  &self->_playerIDHashMod))
      ;
    p_playerIDHashAdd = &self->_playerIDHashAdd;
    while (!GKAtomicCompareAndSwap32Barrier( *p_playerIDHashAdd,  [v7 integerValue],  p_playerIDHashAdd))
      ;
  }

- (int)hashForPlayerID:(id)a3
{
  uint64_t v4 = (uint64_t)[a3 hash];
  if (v4 >= 0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = -v4;
  }
  return self->_playerIDHashAdd + v5 % self->_playerIDHashMod;
}

- (void)signRequest:(id)a3 sapSession:(id)a4 postData:(id)a5
{
  if (a4)
  {
    if (a5)
    {
      id v9 = objc_msgSend(objc_msgSend(a3, "HTTPBody"), "_gkZippedData");
      if (v9)
      {
        id v10 = v9;
        if (CC_SHA1([v9 bytes], (CC_LONG)objc_msgSend(v9, "length"), md))
        {
          uint64_t v11 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", md, 20LL);
        }

        else
        {
          if (!os_log_GKGeneral) {
            GKOSLoggers(0LL);
          }
          uint64_t v12 = (os_log_s *)os_log_GKDaemon;
          if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)id v16 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "GKStoreBag:ISSHA1DataForBytes failed",  v16,  2u);
          }

          uint64_t v11 = 0LL;
        }

        [a3 setHTTPBody:v10];
        objc_msgSend(a3, "setSAPSignature:", objc_msgSend(a4, "signatureForData:error:", v11, v16));
        objc_msgSend(a3, "setSAPversion:", objc_msgSend(a4, "SAPVersion"));
        id v13 = [a3 setValue:@"gzip" forHTTPHeaderField:@"content-encoding"];
        if (!os_log_GKGeneral) {
          GKOSLoggers(v13);
        }
        double v14 = (os_log_s *)os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          id v15 = [a3 loggableHeaders];
          *(_DWORD *)md = 138412546;
          id v18 = a3;
          __int16 v19 = 2112;
          id v20 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "MESCAL:signed body of request:%@ %@",  md,  0x16u);
        }
      }
    }
  }

- (id)requestWithURL:(id)a3 playerID:(id)a4 authToken:(id)a5 pushToken:(id)a6 client:(id)a7 postData:(id)a8 includeUDID:(BOOL)a9 includeAPNS:(BOOL)a10 sapSession:(id)a11
{
  LOBYTE(v13) = 0;
  LOWORD(v12) = __PAIR16__(a10, a9);
  return -[GKStoreBag requestWithURL:playerID:authToken:pushToken:client:postData:includeUDID:includeAPNS:sapSession:includeAppOriginHeaders:]( self,  "requestWithURL:playerID:authToken:pushToken:client:postData:includeUDID:includeAPNS:sapSession:includeAppOriginHeaders:",  a3,  a4,  a5,  a6,  a7,  a8,  v12,  a11,  v13);
}

- (id)requestWithURL:(id)a3 playerID:(id)a4 authToken:(id)a5 pushToken:(id)a6 client:(id)a7 postData:(id)a8 includeUDID:(BOOL)a9 includeAPNS:(BOOL)a10 sapSession:(id)a11 includeAppOriginHeaders:(BOOL)a12
{
  LOWORD(v14) = a12;
  LOWORD(v13) = __PAIR16__(a10, a9);
  return -[GKStoreBag requestWithURL:playerID:authToken:pushToken:client:postData:includeUDID:includeAPNS:sapSession:includeAppOriginHeaders:includeClientInfoAuthHeader:]( self,  "requestWithURL:playerID:authToken:pushToken:client:postData:includeUDID:includeAPNS:sapSession:includeAppOrig inHeaders:includeClientInfoAuthHeader:",  a3,  a4,  a5,  a6,  a7,  a8,  v13,  a11,  v14);
}

- (id)requestWithURL:(id)a3 playerID:(id)a4 authToken:(id)a5 pushToken:(id)a6 client:(id)a7 postData:(id)a8 includeUDID:(BOOL)a9 includeAPNS:(BOOL)a10 sapSession:(id)a11 includeAppOriginHeaders:(BOOL)a12 includeClientInfoAuthHeader:(BOOL)a13
{
  id v19 = +[NSMutableURLRequest _gkHTTPRequestWithURL:postData:protocolVersion:]( NSMutableURLRequest,  "_gkHTTPRequestWithURL:postData:protocolVersion:",  a3,  a8,  objc_msgSend((id)objc_opt_class(self, a2), "protocolVersionForClient:", a7));
  objc_msgSend(v19, "setPlayerID:hash:authToken:", a4, -[GKStoreBag hashForPlayerID:](self, "hashForPlayerID:", a4), a5);
  if (a10) {
    [v19 setPushToken:a6];
  }
  objc_msgSend(v19, "setGameDescriptor:", objc_msgSend(a7, "gameDescriptor"));
  objc_msgSend(v19, "setLocale:", objc_msgSend(a7, "locale"));
  if (a9) {
    [v19 setDeviceUniqueID];
  }
  if (a12) {
    +[GKStoreBag addAppOriginHeadersToRequest:clientProxy:]( &OBJC_CLASS___GKStoreBag,  "addAppOriginHeadersToRequest:clientProxy:",  v19,  a7);
  }
  if (a13) {
    objc_msgSend((id)objc_opt_class(self, v20), "addClientInfoAuthHeaderToRequest:", v19);
  }
  -[GKStoreBag signRequest:sapSession:postData:](self, "signRequest:sapSession:postData:", v19, a11, a8);
  return v19;
}

+ (id)appleIdSession
{
  if (qword_1002BB6E0 != -1) {
    dispatch_once(&qword_1002BB6E0, &stru_100272AE8);
  }
  return (id)qword_1002BB6D8;
}

+ (id)deviceInfo
{
  if (qword_1002BB6F0 != -1) {
    dispatch_once(&qword_1002BB6F0, &stru_100272B08);
  }
  return (id)qword_1002BB6E8;
}

+ (BOOL)shouldIncludeClientInfoAuthHeaderForBagKey:(id)a3
{
  unsigned int v4 = objc_msgSend( +[GKPreferences shared](GKPreferences, "shared"),  "requestHeadersPrivacyEnabled");
  if (v4) {
    LOBYTE(v4) = [a3 isEqualToString:@"gk-authenticate-user"];
  }
  return v4;
}

+ (void)addClientInfoAuthHeaderToRequest:(id)a3
{
}

+ (void)addAuthHeadersToRequest:(id)a3
{
  id v5 = objc_msgSend((id)objc_opt_class(a1, a2), "appleIdSession");
  if ((objc_msgSend( +[GKPreferences shared](GKPreferences, "shared"),  "requestHeadersPrivacyEnabled") & 1) == 0) {
    objc_msgSend((id)objc_opt_class(a1, v6), "addClientInfoAuthHeaderToRequest:", a3);
  }
  id v7 = [v5 appleIDHeadersForRequest:a3];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000FE03C;
  v8[3] = &unk_100272B30;
  unsigned __int8 v9 = objc_msgSend( +[GKPreferences shared](GKPreferences, "shared"),  "requestHeadersPrivacyEnabled");
  v8[4] = a3;
  [v7 enumerateKeysAndObjectsUsingBlock:v8];
}

- (void)_sendAsynchronousRequest:(id)a3 responseMustBeSigned:(BOOL)a4 completion:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000FE160;
  v5[3] = &unk_100272B80;
  v5[4] = self;
  v5[5] = a3;
  BOOL v6 = a4;
  v5[6] = a5;
  -[GKActivity childNamed:execute:]( -[GKStoreBag activity](self, "activity"),  "childNamed:execute:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKStoreBag+NoARC.m",  959LL,  "-[GKStoreBag _sendAsynchronousRequest:responseMustBeSigned:completion:]"),  v5);
}

- (void)_sendOneAsyncTryWithRequest:(id)a3 responseMustBeSigned:(BOOL)a4 session:(id)a5 retryCount:(int)a6 completionHandler:(id)a7
{
  if (a3)
  {
    uint64_t v13 = (void *)objc_opt_class(&OBJC_CLASS___NSURLSession, a2);
    uint64_t v14 = (os_log_s *)os_log_GKHTTP;
    BOOL v15 = os_log_type_enabled(os_log_GKHTTP, OS_LOG_TYPE_INFO);
    if (v15)
    {
      if (!os_log_GKGeneral)
      {
        GKOSLoggers(v15);
        uint64_t v14 = (os_log_s *)os_log_GKHTTP;
      }

      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "timestamp at which REQUEST %@ was sent",  buf,  0xCu);
      }
    }

    +[GKStoreBag addAuthHeadersToRequest:](&OBJC_CLASS___GKStoreBag, "addAuthHeadersToRequest:", a3);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000FE414;
    v16[3] = &unk_100272BA8;
    v16[4] = a5;
    v16[5] = a3;
    int v17 = a6;
    BOOL v18 = a4;
    void v16[6] = self;
    v16[7] = a7;
    [v13 _gkSendAsynchronousRequest:a3 completionHandler:v16];
  }

  else if (a7)
  {
    (*((void (**)(id, void, id, double))a7 + 2))( a7,  0LL,  +[NSError userErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "userErrorForCode:userInfo:",  17LL,  0LL,  a5,  *(void *)&a6),  0.0);
  }

- (id)_bagKeyValidationDict
{
  if (qword_1002BB700 != -1) {
    dispatch_once(&qword_1002BB700, &stru_100272BC8);
  }
  return (id)qword_1002BB6F8;
}

- (void)invalidateBagKeys:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000FEE4C;
  v4[3] = &unk_100272BF0;
  v4[4] = a3;
  v4[5] = +[NSDate date](&OBJC_CLASS___NSDate, "date");
  objc_msgSend(-[GKStoreBag _bagKeyValidationDict](self, "_bagKeyValidationDict"), "writeToDictionary:", v4);
}

- (BOOL)isLoadValidForBagKey:(id)a3 date:(id)a4
{
  id v5 = objc_msgSend(-[GKStoreBag _bagKeyValidationDict](self, "_bagKeyValidationDict"), "objectForKey:", a3);
  if (!v5) {
    return 1;
  }
  [a4 timeIntervalSinceDate:v5];
  return v6 > 0.0;
}

- (id)_networkSynchonizationQueue
{
  if (qword_1002BB710 != -1) {
    dispatch_once(&qword_1002BB710, &stru_100272C10);
  }
  return (id)qword_1002BB708;
}

- (void)verifyEligibilityForBagKey:(id)a3 replyQueue:(id)a4 client:(id)a5 completion:(id)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000FF0CC;
  v11[3] = &unk_100272C38;
  objc_copyWeak(&v12, &location);
  v11[4] = a3;
  v11[5] = a5;
  v11[6] = a4;
  v11[7] = a6;
  -[GKStoreBag getValuesWithCompletion:](self, "getValuesWithCompletion:", v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (id)verifyEligibilityForBagKey:(id)a3 checkingAllowedRequestKeys:(id)a4 client:(id)a5
{
  char v8 = objc_alloc_init(&OBJC_CLASS___GKPlayerInternalProvider);
  id v9 = objc_msgSend(-[GKPlayerInternalProvider localPlayer](v8, "localPlayer"), "hasAcknowledgedLatestGDPR");

  id v10 = objc_alloc(&OBJC_CLASS___GKNetworkRequestEligibilityChecker);
  else {
    id v11 = [a5 isAppUnlistedAndDisallowed];
  }
  id v12 = -[GKNetworkRequestEligibilityChecker initWithHasAcknowledgedLatestGDPR:alwaysAllowedBagKeysObject:isAppUnlistedAndDisallowed:]( v10,  "initWithHasAcknowledgedLatestGDPR:alwaysAllowedBagKeysObject:isAppUnlistedAndDisallowed:",  v9,  a4,  v11);
  id v13 = -[GKNetworkRequestEligibilityChecker verifyEligibilityWithBagKey:](v12, "verifyEligibilityWithBagKey:", a3);

  return v13;
}

- (void)_loadDataForBagKey:(id)a3 postData:(id)a4 client:(id)a5 credential:(id)a6 completion:(id)a7
{
  id v13 = a5;
  if (!a5)
  {
    if (!os_log_GKGeneral) {
      GKOSLoggers(self);
    }
    uint64_t v14 = (os_log_s *)os_log_GKTrace;
    if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "_loadDataForBagKey: nil client provided, will instantiate one",  buf,  2u);
    }

    id v13 = +[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient");
  }

  *(void *)buf = 0LL;
  BOOL v22 = buf;
  uint64_t v23 = 0x3052000000LL;
  v24 = sub_1000FB768;
  uint64_t v25 = sub_1000FB778;
  uint64_t v26 = 0LL;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x3052000000LL;
  v20[3] = sub_1000FB768;
  v20[4] = sub_1000FB778;
  v20[5] = 0LL;
  v19[0] = 0LL;
  v19[1] = v19;
  v19[2] = 0x2020000000LL;
  v19[3] = 0LL;
  dispatch_group_t v15 = dispatch_group_create();
  id v16 = +[NSDate date](&OBJC_CLASS___NSDate, "date");
  if (!a4)
  {
    else {
      a4 = -[NSDictionary _gkPlistXMLDataForClient:player:]( +[NSDictionary dictionaryWithObjectsAndKeys:]( NSDictionary,  "dictionaryWithObjectsAndKeys:",  v16,  @"gk-post-data",  0),  "_gkPlistXMLDataForClient:player:",  v13,  [a6 playerInternal]);
    }
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000FF4E4;
  v17[3] = &unk_100272D48;
  v17[4] = self;
  void v17[5] = v15;
  v17[6] = a3;
  v17[7] = v13;
  v17[8] = a6;
  void v17[9] = a4;
  v17[12] = v20;
  v17[13] = buf;
  v17[14] = v19;
  v17[10] = v16;
  v17[11] = a7;
  BOOL v18 = a5 == 0LL;
  -[GKActivity childNamed:execute:]( -[GKStoreBag activity](self, "activity"),  "childNamed:execute:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKStoreBag+NoARC.m",  1220LL,  "-[GKStoreBag _loadDataForBagKey:postData:client:credential:completion:]"),  v17);
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(buf, 8);
}

- (void)writeDataForBagKey:(id)a3 postData:(id)a4 client:(id)a5 credential:(id)a6 completion:(id)a7
{
  if (!os_log_GKGeneral) {
    GKOSLoggers(self);
  }
  id v13 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "GKStoreBag: writeDataForBagKey", buf, 2u);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000FFECC;
  v14[3] = &unk_100272D98;
  v14[4] = self;
  v14[5] = a3;
  v14[6] = a4;
  v14[7] = a5;
  v14[8] = a6;
  v14[9] = a7;
  dispatch_barrier_async( (dispatch_queue_t)-[GKStoreBag _networkSynchonizationQueue](self, "_networkSynchonizationQueue"),  v14);
}

- (void)readDataForBagKey:(id)a3 postData:(id)a4 client:(id)a5 credential:(id)a6 completion:(id)a7
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100100010;
  v7[3] = &unk_100272D98;
  v7[4] = self;
  v7[5] = a3;
  v7[6] = a4;
  v7[7] = a5;
  v7[8] = a6;
  v7[9] = a7;
  -[GKActivity childNamed:execute:]( -[GKStoreBag activity](self, "activity"),  "childNamed:execute:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKStoreBag+NoARC.m",  1369LL,  "-[GKStoreBag readDataForBagKey:postData:client:credential:completion:]"),  v7);
}

- (void)readDataForURL:(id)a3 postData:(id)a4 client:(id)a5 credential:(id)a6 includeUDID:(BOOL)a7 includeAPNS:(BOOL)a8 completion:(id)a9
{
  id v10 = a5;
  if (!a5) {
    id v10 = +[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient");
  }
  v24[0] = 0LL;
  v24[1] = v24;
  v24[2] = 0x3052000000LL;
  v24[3] = sub_1000FB768;
  v24[4] = sub_1000FB778;
  v24[5] = 0LL;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x3052000000LL;
  v23[3] = sub_1000FB768;
  v23[4] = sub_1000FB778;
  v23[5] = 0LL;
  v22[0] = 0LL;
  v22[1] = v22;
  v22[2] = 0x2020000000LL;
  v22[3] = 0LL;
  uint64_t v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100100270;
  block[3] = &unk_100272DE8;
  block[4] = self;
  block[5] = a3;
  block[6] = a6;
  void block[7] = v10;
  BOOL v20 = a7;
  BOOL v21 = a8;
  block[8] = a4;
  block[9] = v14;
  block[10] = v24;
  block[11] = v22;
  block[12] = v23;
  dispatch_async( (dispatch_queue_t)-[GKStoreBag _networkSynchonizationQueue](self, "_networkSynchonizationQueue"),  block);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10010044C;
  v18[3] = &unk_100272E10;
  v18[4] = a9;
  v18[5] = v24;
  void v18[6] = v22;
  v18[7] = v23;
  dispatch_group_notify(v14, global_queue, v18);
  dispatch_release(v14);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v24, 8);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSSet)APNSRequired
{
  return (NSSet *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setAPNSRequired:(id)a3
{
}

- (NSSet)signatureRequired
{
  return (NSSet *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setSignatureRequired:(id)a3
{
}

- (NSSet)responseSignatureRequired
{
  return (NSSet *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setResponseSignatureRequired:(id)a3
{
}

- (NSNumber)metricsPassthroughPercentage
{
  return self->_metricsPassthroughPercentage;
}

- (void)setMetricsPassthroughPercentage:(id)a3
{
}

- (NSDictionary)internalBag
{
  return self->_internalBag;
}

- (void)setInternalBag:(id)a3
{
}

- (NSDate)expiration
{
  return self->_expiration;
}

- (void)setExpiration:(id)a3
{
}

- (double)mescalSetupStartTimeStamp
{
  return self->_mescalSetupStartTimeStamp;
}

- (void)setMescalSetupStartTimeStamp:(double)a3
{
  self->_mescalSetupStartTimeStamp = a3;
}

- (GKActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (GKDataRequestManager)dataRequestManager
{
  return self->_dataRequestManager;
}

- (void)setDataRequestManager:(id)a3
{
}

@end