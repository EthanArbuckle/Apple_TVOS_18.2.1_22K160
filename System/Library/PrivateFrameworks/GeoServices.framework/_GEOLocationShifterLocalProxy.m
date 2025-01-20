@interface _GEOLocationShifterLocalProxy
- (BOOL)isLocationShiftEnabled;
- (BOOL)isLocationShiftRequiredForCoordinate:(id)a3;
- (BOOL)isLocationShiftRequiredForRegion:(id)a3;
- (NSCache)memoryCache;
- (OS_dispatch_queue)queue;
- (_GEOLocationShifterLocalProxy)init;
- (unsigned)locationShiftFunctionVersion;
- (void)_callCompletionHandler:(id)a3 withRequestedCoordinate:(id)a4 reduceRadius:(double)a5 forResponse:(id)a6 error:(id)a7;
- (void)_doNetworkRequestForLatLng:(id)a3 reduceRadius:(double)a4 traits:(id)a5 auditToken:(id)a6 shouldCache:(BOOL)a7 completionHandler:(id)a8;
- (void)_shiftLatLng:(id)a3 auditToken:(id)a4 usePersistentCache:(BOOL)a5 completionHandler:(id)a6;
- (void)dealloc;
- (void)fetchCachedShiftFunctionResponseForLocation:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)flushDiskCache;
- (void)getAllShiftEntries:(id)a3 queue:(id)a4 handler:(id)a5;
- (void)pruneDiskCache;
- (void)shiftLatLng:(id)a3 auditToken:(id)a4 completionHandler:(id)a5;
@end

@implementation _GEOLocationShifterLocalProxy

- (_GEOLocationShifterLocalProxy)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS____GEOLocationShifterLocalProxy;
  v2 = -[_GEOLocationShifterLocalProxy init](&v16, "init");
  if (v2)
  {
    uint64_t v3 = geo_dispatch_queue_create_with_workloop_qos("com.apple.geo.locsh.lp", 25LL);
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = geo_dispatch_queue_create("com.apple.geod.shiftqueue");
    shiftQueueToAvoidCoreLocDeadLocks = v2->_shiftQueueToAvoidCoreLocDeadLocks;
    v2->_shiftQueueToAvoidCoreLocDeadLocks = (OS_dispatch_queue *)v6;

    v8 = objc_alloc_init(&OBJC_CLASS____GEOLocationShiftRequester);
    requester = v2->_requester;
    v2->_requester = v8;

    objc_initWeak(&location, v2);
    v10 = (dispatch_queue_s *)v2->_queue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10001AA14;
    v13[3] = &unk_100059AF0;
    objc_copyWeak(&v14, &location);
    notify_register_dispatch( "com.apple.Preferences.ResetPrivacyWarningsNotification",  &v2->_resetPrivacyToken,  v10,  v13);
    v11 = v2;
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  notify_cancel(self->_resetPrivacyToken);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____GEOLocationShifterLocalProxy;
  -[_GEOLocationShifterLocalProxy dealloc](&v4, "dealloc");
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSCache)memoryCache
{
  return 0LL;
}

- (BOOL)isLocationShiftEnabled
{
  uint64_t v2 = GEOURLString(15LL, a2);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (unsigned)locationShiftFunctionVersion
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](&OBJC_CLASS___GEOResourceManifestManager, "modernManager"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activeTileGroup]);
  unsigned int v4 = [v3 locationShiftVersion];

  return v4;
}

- (BOOL)isLocationShiftRequiredForCoordinate:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  if (-[_GEOLocationShifterLocalProxy isLocationShiftEnabled](self, "isLocationShiftEnabled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[GEOResourceManifestManager modernManager]( &OBJC_CLASS___GEOResourceManifestManager,  "modernManager"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 activeTileGroup]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 locationShiftEnabledRegions]);

    if ([v7 count])
    {
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      id v8 = v7;
      id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v14;
        while (2)
        {
          for (i = 0LL; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v8);
            }
            if (objc_msgSend( *(id *)(*((void *)&v13 + 1) + 8 * (void)i),  "containsCoordinate:",  var0,  var1,  (void)v13))
            {
              LOBYTE(v9) = 1;
              goto LABEL_13;
            }
          }

          id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }

- (BOOL)isLocationShiftRequiredForRegion:(id)a3
{
  id v4 = a3;
  if (-[_GEOLocationShifterLocalProxy isLocationShiftEnabled](self, "isLocationShiftEnabled"))
  {
    GEOMapRectForMapRegion(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[GEOResourceManifestManager modernManager]( &OBJC_CLASS___GEOResourceManifestManager,  "modernManager"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 activeTileGroup]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 locationShiftEnabledRegions]);

    if ([v7 count])
    {
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      id v8 = v7;
      id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v15;
        while (2)
        {
          for (i = 0LL; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v8);
            }
            double v12 = GEOMapRectForMapRegion(*(void *)(*((void *)&v14 + 1) + 8LL * (void)i));
            if ((GEOMapRectIntersectsRect(v12) & 1) != 0)
            {
              LOBYTE(v9) = 1;
              goto LABEL_13;
            }
          }

          id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }

- (void)shiftLatLng:(id)a3 auditToken:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleId]);
    shiftQueueToAvoidCoreLocDeadLocks = (dispatch_queue_s *)self->_shiftQueueToAvoidCoreLocDeadLocks;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001AF70;
    block[3] = &unk_100059B40;
    id v15 = v11;
    id v16 = v9;
    __int128 v17 = self;
    id v18 = v8;
    id v19 = v10;
    id v13 = v11;
    dispatch_async(shiftQueueToAvoidCoreLocDeadLocks, block);
  }
}

- (void)_shiftLatLng:(id)a3 auditToken:(id)a4 usePersistentCache:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](&OBJC_CLASS___GEOMapService, "sharedService"));
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 defaultTraits]);

  double Double = GEOConfigGetDouble( GeoServicesConfig_LocationShiftFunctionRadius[0],  GeoServicesConfig_LocationShiftFunctionRadius[1]);
  double v16 = Double;
  if (v7)
  {
    -[_GEOLocationShifterLocalProxy pruneDiskCache](self, "pruneDiskCache");
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[_GEOLocationShifterLocalProxy persistentCache](self, "persistentCache"));
    [v10 coordinate];
    double v19 = v18;
    double v21 = v20;
    queue = self->_queue;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10001B484;
    v23[3] = &unk_100059B68;
    v23[4] = self;
    id v27 = v12;
    id v24 = v10;
    double v28 = v16;
    id v25 = v14;
    id v26 = v11;
    char v29 = 1;
    objc_msgSend(v17, "findShiftResponseForCoordinate:reduceRadius:queue:completion:", queue, v23, v19, v21, v16);
  }

  else
  {
    -[_GEOLocationShifterLocalProxy _doNetworkRequestForLatLng:reduceRadius:traits:auditToken:shouldCache:completionHandler:]( self,  "_doNetworkRequestForLatLng:reduceRadius:traits:auditToken:shouldCache:completionHandler:",  v10,  v14,  v11,  0LL,  v12,  Double);
  }
}

- (void)_doNetworkRequestForLatLng:(id)a3 reduceRadius:(double)a4 traits:(id)a5 auditToken:(id)a6 shouldCache:(BOOL)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a8;
  id v17 = a5;
  id v18 = objc_alloc_init(&OBJC_CLASS___GEOPolyLocationShiftRequest);
  uint64_t Log = GEOGreenTeaGetLog([v18 setLocation:v14]);
  double v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);

  requester = self->_requester;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10001B61C;
  v24[3] = &unk_100059B90;
  BOOL v29 = a7;
  id v25 = v14;
  id v26 = self;
  id v27 = v16;
  double v28 = a4;
  id v22 = v16;
  id v23 = v14;
  -[_GEOLocationShiftRequester startWithRequest:traits:auditToken:completionHandler:]( requester,  "startWithRequest:traits:auditToken:completionHandler:",  v18,  v17,  v15,  v24);
}

- (void)_callCompletionHandler:(id)a3 withRequestedCoordinate:(id)a4 reduceRadius:(double)a5 forResponse:(id)a6 error:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if (a5 > 0.0)
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v13 contractFunctionTo:a4 withRadius:a5]);

    id v13 = (id)v15;
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001B830;
  block[3] = &unk_100059BB8;
  id v22 = v14;
  id v23 = v12;
  id v21 = v13;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  dispatch_async(queue, block);
}

- (void)pruneDiskCache
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[_GEOLocationShifterLocalProxy persistentCache](self, "persistentCache"));
  [v2 pruneShiftEntries];
}

- (void)flushDiskCache
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[_GEOLocationShifterLocalProxy persistentCache](self, "persistentCache"));
  [v2 removeAllShiftEntriesSync];
}

- (void)getAllShiftEntries:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[_GEOLocationShifterLocalProxy persistentCache](self, "persistentCache"));
  [v11 getAllShiftEntries:v10 queue:v9 handler:v8];
}

- (void)fetchCachedShiftFunctionResponseForLocation:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  uint64_t v9 = GeoServicesConfig_LocationShiftFunctionRadius[0];
  uint64_t v10 = GeoServicesConfig_LocationShiftFunctionRadius[1];
  id v11 = a4;
  id v12 = a3;
  double Double = GEOConfigGetDouble(v9, v10);
  -[_GEOLocationShifterLocalProxy pruneDiskCache](self, "pruneDiskCache");
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[_GEOLocationShifterLocalProxy persistentCache](self, "persistentCache"));
  [v12 coordinate];
  double v16 = v15;
  double v18 = v17;

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10001BA2C;
  v20[3] = &unk_100059BE0;
  v20[4] = self;
  id v21 = v8;
  id v19 = v8;
  objc_msgSend(v14, "findShiftResponseForCoordinate:reduceRadius:queue:completion:", v11, v20, v16, v18, Double);
}

- (void).cxx_destruct
{
}

@end