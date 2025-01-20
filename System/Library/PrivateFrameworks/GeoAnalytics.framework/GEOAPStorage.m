@interface GEOAPStorage
- (GEOAPStorage)init;
- (id)_copyAndEmptyBatchQueue;
- (void)_clearUploadTimer;
- (void)_fastTrackElement:(id)a3 withBatchID:(unint64_t)a4 completionQueue:(id)a5 completionBlock:(id)a6;
- (void)_flushBatchQueueToDB;
- (void)_flushRemainderToDB;
- (void)_initiateCollationAndUpload;
- (void)_setUploadTimer;
- (void)_spoolElementsToDBFromQueue:(id)a3;
- (void)_storeQueueElem:(id)a3 completionQueue:(id)a4 completionBlock:(id)a5;
@end

@implementation GEOAPStorage

- (GEOAPStorage)init
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___GEOAPStorage;
  id v2 = -[GEOAPStorage init](&v21, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](&OBJC_CLASS___GEOPlatform, "sharedPlatform"));
    *((_BYTE *)v2 + 57) = [v3 isInternalInstall];

    *((_BYTE *)v2 + 56) = 0;
    *((void *)v2 + 2) = GEOConfigGetUInteger( GeoAnalyticsConfig_AnalyticsPipelineStorageBatchCount[0],  GeoAnalyticsConfig_AnalyticsPipelineStorageBatchCount[1]);
    *((void *)v2 + 3) = GEOConfigGetUInteger( GeoAnalyticsConfig_AnalyticsPipelineStorageBatchTimeInSeconds[0],  GeoAnalyticsConfig_AnalyticsPipelineStorageBatchTimeInSeconds[1]);
    v4 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  *((void *)v2 + 2));
    v5 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v4;

    uint64_t v6 = geo_isolater_create("com.apple.geo.analytics.batchqueue");
    v7 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v6;

    uint64_t v8 = geo_dispatch_queue_create_with_qos("com.apple.geo.analytics.storage", 21LL);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v9;

    if (*((_BYTE *)v2 + 57))
    {
      uint64_t v11 = geo_isolater_create("com.apple.geo.analytics.evalobserver");
      v12 = (void *)*((void *)v2 + 9);
      *((void *)v2 + 9) = v11;

      v13 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      v14 = (void *)*((void *)v2 + 8);
      *((void *)v2 + 8) = v13;
    }

    dispatch_source_t v15 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  *((dispatch_queue_t *)v2 + 6));
    v16 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v15;

    dispatch_source_set_timer(*((dispatch_source_t *)v2 + 5), 0xFFFFFFFFFFFFFFFFLL, 0LL, 0LL);
    v17 = (dispatch_source_s *)*((void *)v2 + 5);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100016B04;
    handler[3] = &unk_1000288C0;
    id v20 = v2;
    dispatch_source_set_event_handler(v17, handler);
    dispatch_activate(*((dispatch_object_t *)v2 + 5));
  }

  return (GEOAPStorage *)v2;
}

- (void)_flushRemainderToDB
{
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  v12 = sub_100016FA0;
  v13 = sub_100016FB0;
  id v14 = 0LL;
  batchQueueLock = self->_batchQueueLock;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100016FB8;
  v8[3] = &unk_100029558;
  v8[4] = self;
  v8[5] = &v9;
  geo_isolate_sync(batchQueueLock, v8);
  if (v10[5])
  {
    id v4 = sub_100016B84();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = [(id)v10[5] count];
      *(_DWORD *)buf = 134217984;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "will persist %lu analytics", buf, 0xCu);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPPersistence sharedInstance](&OBJC_CLASS___GEOAPPersistence, "sharedInstance"));
    [v7 storeLogMsgElems:v10[5]];
  }

  _Block_object_dispose(&v9, 8);
}

- (void)_flushBatchQueueToDB
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  uint64_t v8 = sub_100016FA0;
  uint64_t v9 = sub_100016FB0;
  id v10 = 0LL;
  batchQueueLock = self->_batchQueueLock;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000170B4;
  v4[3] = &unk_100029558;
  v4[4] = self;
  v4[5] = &v5;
  geo_isolate_sync(batchQueueLock, v4);
  -[GEOAPStorage _spoolElementsToDBFromQueue:](self, "_spoolElementsToDBFromQueue:", v6[5]);
  _Block_object_dispose(&v5, 8);
}

- (void)_storeQueueElem:(id)a3 completionQueue:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (dispatch_queue_s *)a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPPersistence sharedInstance](&OBJC_CLASS___GEOAPPersistence, "sharedInstance"));
  unsigned int v12 = [v11 evalModeEnabled];

  if (v12)
  {
    id v22 = v8;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
    -[GEOAPStorage _spoolElementsToDBFromQueue:](self, "_spoolElementsToDBFromQueue:", v13);
  }

  else
  {
    batchQueueLock = self->_batchQueueLock;
    id v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472LL;
    v18 = sub_100019650;
    v19 = &unk_100029210;
    id v20 = self;
    id v21 = v8;
    geo_isolate_sync(batchQueueLock, &v16);
  }

  -[GEOAPStorage _setUploadTimer](self, "_setUploadTimer", v16, v17, v18, v19, v20);
  if (v10)
  {
    if (!v9)
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
      uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    }

    dispatch_async(v9, v10);
  }
}

- (void)_setUploadTimer
{
  dispatch_time_t v3 = dispatch_time(0LL, 1000000000 * self->_batchQueueFlushTime);
  dispatch_source_set_timer((dispatch_source_t)self->_uploadTimer, v3, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

- (void)_clearUploadTimer
{
}

- (id)_copyAndEmptyBatchQueue
{
  id v3 = -[NSMutableArray copy](self->_batchQueue, "copy");
  -[NSMutableArray removeAllObjects](self->_batchQueue, "removeAllObjects");
  return v3;
}

- (void)_fastTrackElement:(id)a3 withBatchID:(unint64_t)a4 completionQueue:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  uint64_t v11 = (dispatch_queue_s *)a5;
  id v12 = a6;
  storageQueue = self->_storageQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100019874;
  v16[3] = &unk_100028BE8;
  unint64_t v18 = a4;
  id v14 = v10;
  id v17 = v14;
  dispatch_async((dispatch_queue_t)storageQueue, v16);
  if (v12)
  {
    if (!v11)
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
      uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    }

    dispatch_async(v11, v12);
  }
}

- (void)_spoolElementsToDBFromQueue:(id)a3
{
  id v4 = a3;
  storageQueue = self->_storageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100019A08;
  block[3] = &unk_1000288C0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)storageQueue, block);
}

- (void)_initiateCollationAndUpload
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPPersistence sharedInstance](&OBJC_CLASS___GEOAPPersistence, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 selectBatchIdsForBatchUpload]);

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v16 + 1) + 8 * (void)v8) unsignedLongLongValue];
        if (GEOMightHaveCorrespondingReqRespMetadata())
        {
          id v10 = (void *)objc_claimAutoreleasedReturnValue( +[GEOAnalyticsDataService sharedService]( &OBJC_CLASS___GEOAnalyticsDataService,  "sharedService"));
          id v11 = [v10 requestResponseMetadataFileDescriptorForBatchID:v9];

          if ((v11 & 0x80000000) == 0)
          {
            id v12 = [[GEORequestResponseMetadataFile alloc] initForReadWithFileDescriptor:v11];
            v15[0] = _NSConcreteStackBlock;
            v15[1] = 3221225472LL;
            v15[2] = sub_100019CA4;
            v15[3] = &unk_1000295A0;
            v15[4] = v9;
            objc_msgSend(v12, "unsafe_readReqRespMetadataWithVisitorBlock:", v15);
          }
        }

        id v13 = sub_10000CD98();
        id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        sub_10000DD58((uint64_t)v14, (uint64_t)v9);

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v6);
  }
}

- (void).cxx_destruct
{
}

@end