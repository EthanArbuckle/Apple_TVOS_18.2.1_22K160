@interface PBAVSystemControllerCache
+ (id)sharedInstance;
- (BOOL)isAirplayDisplayActive;
- (BOOL)isCacheInitialized;
- (NSDictionary)notificationNameToHandlerMap;
- (OS_dispatch_queue)cacheDataAccessSerialQueue;
- (OS_dispatch_queue)dataProviderSerialQueue;
- (PBAVSystemControllerCache)initWithDataProviderInitializer:(id)a3;
- (PBAVSystemControllerDataProviding)dataProvider;
- (id)dataProviderInitializer;
- (void)_callUpdateHandlerForNotificationName:(id)a3 notification:(id)a4;
- (void)_handleSystemControllerMetadataDidChangeNotification:(id)a3;
- (void)_handleSystemControllerServerConnectionDied:(id)a3;
- (void)_initializeCache;
- (void)_rebuildCache;
- (void)_updateAirplayDisplayActiveFromNotification:(id)a3;
- (void)dealloc;
- (void)setCacheInitialized:(BOOL)a3;
- (void)setDataProvider:(id)a3;
@end

@implementation PBAVSystemControllerCache

- (PBAVSystemControllerCache)initWithDataProviderInitializer:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___PBAVSystemControllerCache;
  v5 = -[PBAVSystemControllerCache init](&v18, "init");
  if (v5)
  {
    id v6 = [v4 copy];
    id dataProviderInitializer = v5->_dataProviderInitializer;
    v5->_id dataProviderInitializer = v6;

    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_UTILITY, 0);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.PineBoard.PBAVSystemControllerCache.CacheDataAccessQueue", v9);
    cacheDataAccessSerialQueue = v5->_cacheDataAccessSerialQueue;
    v5->_cacheDataAccessSerialQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.PineBoard.PBAVSystemControllerCache.DataProviderQueue", v9);
    dataProviderSerialQueue = v5->_dataProviderSerialQueue;
    v5->_dataProviderSerialQueue = (OS_dispatch_queue *)v12;

    uint64_t v19 = AVSystemController_ExternalScreenDidChangeNotification;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSValue valueWithPointer:]( &OBJC_CLASS___NSValue,  "valueWithPointer:",  "_updateAirplayDisplayActiveFromNotification:"));
    v20 = v14;
    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
    notificationNameToHandlerMap = v5->_notificationNameToHandlerMap;
    v5->_notificationNameToHandlerMap = (NSDictionary *)v15;

    -[PBAVSystemControllerCache _initializeCache](v5, "_initializeCache");
  }

  return v5;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBAVSystemControllerCache;
  -[PBAVSystemControllerCache dealloc](&v4, "dealloc");
}

+ (id)sharedInstance
{
  if (qword_100471088 != -1) {
    dispatch_once(&qword_100471088, &stru_1003D9640);
  }
  return (id)qword_100471080;
}

- (BOOL)isAirplayDisplayActive
{
  v2 = self;
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBAVSystemControllerCache cacheDataAccessSerialQueue](self, "cacheDataAccessSerialQueue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100154EC0;
  v5[3] = &unk_1003D0210;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)_handleSystemControllerServerConnectionDied:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  v9 = sub_100154FBC;
  dispatch_queue_t v10 = &unk_1003D0890;
  objc_copyWeak(&v11, &location);
  dispatch_block_t v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, &v7);
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( -[PBAVSystemControllerCache dataProviderSerialQueue]( self,  "dataProviderSerialQueue",  v7,  v8,  v9,  v10));
  dispatch_async(v6, v5);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_handleSystemControllerMetadataDidChangeNotification:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  dispatch_block_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBAVSystemControllerCache dataProviderSerialQueue](self, "dataProviderSerialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100155158;
  block[3] = &unk_1003D0418;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_initializeCache
{
  id v3 = sub_100155038();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Initializing PBAVSystemControllerCache",  (uint8_t *)buf,  2u);
  }

  objc_initWeak(buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001553D0;
  block[3] = &unk_1003D0890;
  objc_copyWeak(&v8, buf);
  dispatch_block_t v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBAVSystemControllerCache dataProviderSerialQueue](self, "dataProviderSerialQueue"));
  dispatch_async(v6, v5);

  objc_destroyWeak(&v8);
  objc_destroyWeak(buf);
}

- (void)_rebuildCache
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBAVSystemControllerCache dataProviderSerialQueue](self, "dataProviderSerialQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[PBAVSystemControllerCache dataProviderInitializer](self, "dataProviderInitializer"));
  uint64_t v5 = v4[2]();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  -[PBAVSystemControllerCache setDataProvider:](self, "setDataProvider:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBAVSystemControllerCache notificationNameToHandlerMap](self, "notificationNameToHandlerMap"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      v13 = 0LL;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[PBAVSystemControllerCache _callUpdateHandlerForNotificationName:notification:]( self,  "_callUpdateHandlerForNotificationName:notification:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v13),  0LL,  (void)v14);
        v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v11);
  }
}

- (void)_updateAirplayDisplayActiveFromNotification:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBAVSystemControllerCache dataProviderSerialQueue](self, "dataProviderSerialQueue", a3));
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBAVSystemControllerCache dataProvider](self, "dataProvider"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 attributeForKey:AVSystemController_CurrentExternalScreenAttribute]);
  unsigned __int8 v7 = [v6 isEqualToString:AVSystemController_ExternalScreenType_AirPlay];

  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001557C4;
  v8[3] = &unk_1003D96D0;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  unsigned __int8 v10 = v7;
  dispatch_async(&_dispatch_main_q, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_callUpdateHandlerForNotificationName:(id)a3 notification:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBAVSystemControllerCache notificationNameToHandlerMap](self, "notificationNameToHandlerMap"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v7]);

  if (v9)
  {
    id v10 = [v9 pointerValue];
    ((void (*)(PBAVSystemControllerCache *, id, id))-[PBAVSystemControllerCache methodForSelector:]( self,  "methodForSelector:",  v10))( self,  v10,  v6);
  }
}

- (id)dataProviderInitializer
{
  return self->_dataProviderInitializer;
}

- (PBAVSystemControllerDataProviding)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
}

- (OS_dispatch_queue)dataProviderSerialQueue
{
  return self->_dataProviderSerialQueue;
}

- (OS_dispatch_queue)cacheDataAccessSerialQueue
{
  return self->_cacheDataAccessSerialQueue;
}

- (NSDictionary)notificationNameToHandlerMap
{
  return self->_notificationNameToHandlerMap;
}

- (BOOL)isCacheInitialized
{
  return self->_cacheInitialized;
}

- (void)setCacheInitialized:(BOOL)a3
{
  self->_cacheInitialized = a3;
}

- (void).cxx_destruct
{
}

@end