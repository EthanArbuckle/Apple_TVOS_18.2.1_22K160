@interface AKURLBagService
+ (id)sharedBagService;
- (AKBagTrafficClearanceRequest)activeBagFetchRequest;
- (AKURLBagService)init;
- (NSDictionary)cachedBags;
- (NSMutableArray)pendingBagFetchRequests;
- (id)_cachedURLBagForAltDSID:(id)a3;
- (id)urlBagForAltDSID:(id)a3 error:(id *)a4;
- (id)urlBagFromCache:(BOOL)a3 altDSID:(id)a4 error:(id *)a5;
- (void)_fetchBagFromNetworkWithRequest:(id)a3 completion:(id)a4;
- (void)_invokeClearanceRequest:(id)a3 urlBag:(id)a4 error:(id)a5;
- (void)_tq_invokeRequest:(id)a3 completion:(id)a4;
- (void)_tq_processPendingRequests;
- (void)_updateCacheWithBag:(id)a3 forAltDSID:(id)a4;
- (void)_updateURLBagIfNecessaryFromHTTPCache:(BOOL)a3 ignoreMemoryCache:(BOOL)a4 altDSID:(id)a5 urlSwitchData:(id)a6 completion:(id)a7;
- (void)clearCache;
- (void)clearSerializedMemoryCache;
- (void)clearSessionCache;
- (void)fetchURLBagForAltDSID:(id)a3 completion:(id)a4;
- (void)fetchURLBagForAltDSID:(id)a3 fromCache:(BOOL)a4 completion:(id)a5;
- (void)forceURLBagUpdateForAltDSID:(id)a3 urlSwitchData:(id)a4 completion:(id)a5;
- (void)setActiveBagFetchRequest:(id)a3;
- (void)setCachedBags:(id)a3;
- (void)setPendingBagFetchRequests:(id)a3;
@end

@implementation AKURLBagService

+ (id)sharedBagService
{
  if (qword_10020F528 != -1) {
    dispatch_once(&qword_10020F528, &stru_1001C9D98);
  }
  return (id)qword_10020F520;
}

- (AKURLBagService)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___AKURLBagService;
  v2 = -[AKURLBagService init](&v10, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
    lastUpdated = v2->_lastUpdated;
    v2->_lastUpdated = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
    cachedBags = v2->_cachedBags;
    v2->_cachedBags = v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    pendingBagFetchRequests = v2->_pendingBagFetchRequests;
    v2->_pendingBagFetchRequests = (NSMutableArray *)v7;
  }

  return v2;
}

- (void)clearCache
{
}

- (void)clearSessionCache
{
  uint64_t v3 = _AKLogSystem(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Clearing session URL bag caches...", buf, 2u);
  }

  p_bag_cache_lock = &self->_bag_cache_lock;
  os_unfair_lock_lock(p_bag_cache_lock);
  +[AKURLSession removeAllCachedResponses](&OBJC_CLASS___AKURLSession, "removeAllCachedResponses");
  os_unfair_lock_unlock(p_bag_cache_lock);
  uint64_t v7 = _AKLogSystem(v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Cleared session bag caches", v9, 2u);
  }
}

- (void)clearSerializedMemoryCache
{
  uint64_t v3 = _AKLogSystem(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Clearing memory URL bag caches...", buf, 2u);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100087A68;
  v8[3] = &unk_1001C7300;
  v8[4] = self;
  os_unfair_lock_lock(&self->_bag_cache_lock);
  sub_100087A68((uint64_t)v8);
  os_unfair_lock_unlock(&self->_bag_cache_lock);
  uint64_t v6 = _AKLogSystem(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Cleared serialized bag cache", buf, 2u);
  }
}

- (void)fetchURLBagForAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = _AKLogSystem(v7);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10013BBD4();
  }

  -[AKURLBagService _updateURLBagIfNecessaryFromHTTPCache:ignoreMemoryCache:altDSID:urlSwitchData:completion:]( self,  "_updateURLBagIfNecessaryFromHTTPCache:ignoreMemoryCache:altDSID:urlSwitchData:completion:",  0LL,  0LL,  v7,  0LL,  v6);
}

- (void)fetchURLBagForAltDSID:(id)a3 fromCache:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = _AKLogSystem(v9);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10013BBD4();
  }

  -[AKURLBagService _updateURLBagIfNecessaryFromHTTPCache:ignoreMemoryCache:altDSID:urlSwitchData:completion:]( self,  "_updateURLBagIfNecessaryFromHTTPCache:ignoreMemoryCache:altDSID:urlSwitchData:completion:",  v5,  0LL,  v9,  0LL,  v8);
}

- (id)urlBagForAltDSID:(id)a3 error:(id *)a4
{
  return -[AKURLBagService urlBagFromCache:altDSID:error:](self, "urlBagFromCache:altDSID:error:", 0LL, a3, a4);
}

- (id)urlBagFromCache:(BOOL)a3 altDSID:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  uint64_t v30 = 0LL;
  v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  v33 = sub_100087E14;
  v34 = sub_100087E24;
  id v35 = 0LL;
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  v27 = sub_100087E14;
  v28 = sub_100087E24;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLBagService _cachedURLBagForAltDSID:](self, "_cachedURLBagForAltDSID:", v8));
  id v29 = v9;
  uint64_t v10 = (void *)v25[5];
  if (v10)
  {
    id v11 = v10;
  }

  else
  {
    uint64_t v12 = _AKLogSystem(v9);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Starting to fetch URL bag cache using DEPRECATED SYNCHRONOUS SPI! Hangs ahead!",  buf,  2u);
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100087E2C;
    v19[3] = &unk_1001C6D20;
    v21 = &v24;
    v22 = &v30;
    v14 = dispatch_semaphore_create(0LL);
    v20 = v14;
    -[AKURLBagService _updateURLBagIfNecessaryFromHTTPCache:ignoreMemoryCache:altDSID:urlSwitchData:completion:]( self,  "_updateURLBagIfNecessaryFromHTTPCache:ignoreMemoryCache:altDSID:urlSwitchData:completion:",  v6,  0LL,  v8,  0LL,  v19);
    uint64_t v15 = dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v16 = _AKLogSystem(v15);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Finished fetch URL bag cache using DEPRECATED SYNCHRONOUS SPI! Phew... we didn't hang, this time!",  buf,  2u);
    }

    if (a5) {
      *a5 = (id) v31[5];
    }
    id v11 = (id)v25[5];
  }

  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v11;
}

- (void)_tq_invokeRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_trafficQueue);
  uint64_t v9 = _AKLogSystem(v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10013BC00();
  }

  -[AKURLBagService setActiveBagFetchRequest:](self, "setActiveBagFetchRequest:", v6);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 context]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 altDSID]);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLBagService _cachedURLBagForAltDSID:](self, "_cachedURLBagForAltDSID:", v12));

  if (v13)
  {
    -[AKURLBagService setActiveBagFetchRequest:](self, "setActiveBagFetchRequest:", 0LL);
    v7[2](v7, v13, 0LL);
  }

  else
  {
    -[AKURLBagService _fetchBagFromNetworkWithRequest:completion:]( self,  "_fetchBagFromNetworkWithRequest:completion:",  v6,  v7);
  }
}

- (void)_fetchBagFromNetworkWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSystem(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Fetching URL bag from Network... %@", buf, 0xCu);
  }

  uint64_t v10 = objc_alloc(&OBJC_CLASS___AKURLBagRequestProvider);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 context]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 altDSID]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v6 urlSwitchData]);
  v14 = -[AKURLBagRequestProvider initWithAltDSID:urlSwitchData:](v10, "initWithAltDSID:urlSwitchData:", v12, v13);

  id v15 = -[AKURLBagRequestProvider newBagURLRequest](v14, "newBagURLRequest");
  if ([v6 fromURLCache]) {
    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[AKURLSession sharedCacheReliantAnisetteFreeSession]( &OBJC_CLASS___AKURLSession,  "sharedCacheReliantAnisetteFreeSession"));
  }
  else {
    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[AKURLSession sharedCacheEnabledAnisetteFreeSession]( &OBJC_CLASS___AKURLSession,  "sharedCacheEnabledAnisetteFreeSession"));
  }
  v17 = (void *)v16;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100088190;
  v21[3] = &unk_1001C9DC0;
  v23 = self;
  id v24 = v7;
  id v22 = v6;
  id v18 = v6;
  id v19 = v7;
  id v20 = [v17 beginDataTaskWithRequest:v15 completionHandler:v21];
}

- (void)_updateURLBagIfNecessaryFromHTTPCache:(BOOL)a3 ignoreMemoryCache:(BOOL)a4 altDSID:(id)a5 urlSwitchData:(id)a6 completion:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = _AKSignpostLogSystem(v14);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  os_signpost_id_t v17 = _AKSignpostCreate();
  uint64_t v19 = v18;

  uint64_t v21 = _AKSignpostLogSystem(v20);
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  v23 = v22;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v23,  OS_SIGNPOST_INTERVAL_BEGIN,  v17,  "FetchURLBag",  " enableTelemetry=YES ",  buf,  2u);
  }

  uint64_t v25 = _AKSignpostLogSystem(v24);
  id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v45 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: FetchURLBag  enableTelemetry=YES ",  buf,  0xCu);
  }

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_1000887A4;
  v40[3] = &unk_1001C8A18;
  os_signpost_id_t v42 = v17;
  uint64_t v43 = v19;
  id v41 = v14;
  id v27 = v14;
  v28 = objc_retainBlock(v40);
  trafficQueue = (dispatch_queue_s *)self->_trafficQueue;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100088918;
  v33[3] = &unk_1001C7230;
  BOOL v38 = a3;
  BOOL v39 = a4;
  id v34 = v12;
  id v35 = v13;
  v36 = self;
  id v37 = v28;
  uint64_t v30 = v28;
  id v31 = v13;
  id v32 = v12;
  dispatch_async(trafficQueue, v33);
}

- (void)_invokeClearanceRequest:(id)a3 urlBag:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  clearanceQueue = (dispatch_queue_s *)self->_clearanceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100088C5C;
  block[3] = &unk_1001C6510;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(clearanceQueue, block);
}

- (void)_tq_processPendingRequests
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLBagService pendingBagFetchRequests](self, "pendingBagFetchRequests"));
  id v4 = [v3 count];

  uint64_t v6 = _AKLogSystem(v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v8) {
      sub_10013BDD8(self, v7);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLBagService pendingBagFetchRequests](self, "pendingBagFetchRequests"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLBagService pendingBagFetchRequests](self, "pendingBagFetchRequests"));
    [v11 removeObjectAtIndex:0];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100088E50;
    v12[3] = &unk_1001C9DE8;
    v12[4] = self;
    id v13 = v10;
    id v7 = v10;
    -[AKURLBagService _tq_invokeRequest:completion:](self, "_tq_invokeRequest:completion:", v7, v12);
  }

  else if (v8)
  {
    sub_10013BDAC();
  }
}

- (void)forceURLBagUpdateForAltDSID:(id)a3 urlSwitchData:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = _AKLogSystem(v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Force URL bag fetch requested!!! Hold on to your hats!",  buf,  2u);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100088FD0;
  v14[3] = &unk_1001C7B60;
  id v15 = v8;
  id v13 = v8;
  -[AKURLBagService _updateURLBagIfNecessaryFromHTTPCache:ignoreMemoryCache:altDSID:urlSwitchData:completion:]( self,  "_updateURLBagIfNecessaryFromHTTPCache:ignoreMemoryCache:altDSID:urlSwitchData:completion:",  0LL,  1LL,  v10,  v9,  v14);
}

- (id)_cachedURLBagForAltDSID:(id)a3
{
  p_bag_cache_lock = &self->_bag_cache_lock;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100089090;
  v9[3] = &unk_1001C9E10;
  id v10 = a3;
  uint64_t v11 = self;
  id v5 = v10;
  os_unfair_lock_lock(p_bag_cache_lock);
  id v6 = sub_100089090((uint64_t)v9);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  os_unfair_lock_unlock(p_bag_cache_lock);

  return v7;
}

- (void)_updateCacheWithBag:(id)a3 forAltDSID:(id)a4
{
  id v6 = a3;
  id v7 = (__CFString *)a4;
  id v9 = v7;
  if (!-[__CFString length](v7, "length"))
  {

    id v9 = @"AKSharedBag";
  }

  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary, v8);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v6, v10);
  if ((isKindOfClass & 1) != 0)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000892B8;
    v14[3] = &unk_1001C6510;
    void v14[4] = self;
    id v15 = v9;
    id v16 = v6;
    os_unfair_lock_lock(&self->_bag_cache_lock);
    sub_1000892B8(v14);
    os_unfair_lock_unlock(&self->_bag_cache_lock);
  }

  else
  {
    uint64_t v12 = _AKLogSystem(isKindOfClass);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10013BF88();
    }
  }
}

- (NSMutableArray)pendingBagFetchRequests
{
  return self->_pendingBagFetchRequests;
}

- (void)setPendingBagFetchRequests:(id)a3
{
}

- (AKBagTrafficClearanceRequest)activeBagFetchRequest
{
  return self->_activeBagFetchRequest;
}

- (void)setActiveBagFetchRequest:(id)a3
{
}

- (NSDictionary)cachedBags
{
  return self->_cachedBags;
}

- (void)setCachedBags:(id)a3
{
}

- (void).cxx_destruct
{
}

@end