@interface WiFi3BarsTileCacheObserver
- (TBDataSourceMediator)dataSourceMediator;
- (WiFi3BarsTileCacheObserver)initWithDataSourceMediator:(id)a3;
- (void)_scheduleXPCActivity;
- (void)_submitCacheAvailabilityMetric;
- (void)setDataSourceMediator:(id)a3;
@end

@implementation WiFi3BarsTileCacheObserver

- (WiFi3BarsTileCacheObserver)initWithDataSourceMediator:(id)a3
{
  v4 = (TBDataSourceMediator *)a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___WiFi3BarsTileCacheObserver;
  v5 = -[WiFi3BarsTileCacheObserver init](&v8, sel_init);
  dataSourceMediator = v5->_dataSourceMediator;
  v5->_dataSourceMediator = v4;

  -[WiFi3BarsTileCacheObserver _scheduleXPCActivity](v5, "_scheduleXPCActivity");
  return v5;
}

- (void)_scheduleXPCActivity
{
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1895F86E8], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1895F8670], 1);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1895F86A0], *MEMORY[0x1895F86B8]);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1895F8690], *MEMORY[0x1895F86A8]);
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x1895F86D0], (const char *)*MEMORY[0x1895F86D8]);
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __50__WiFi3BarsTileCacheObserver__scheduleXPCActivity__block_invoke;
  handler[3] = &unk_18A16CD88;
  handler[4] = self;
  xpc_activity_register("com.apple.wifimanager.3BarsCacheObserverActivity", v3, handler);
}

uint64_t __50__WiFi3BarsTileCacheObserver__scheduleXPCActivity__block_invoke( uint64_t a1,  xpc_activity_t activity)
{
  xpc_activity_state_t state = xpc_activity_get_state(activity);
  NSLog(@"%s: state %ld", "-[WiFi3BarsTileCacheObserver _scheduleXPCActivity]_block_invoke", state);
  return [*(id *)(a1 + 32) _submitCacheAvailabilityMetric];
}

- (void)_submitCacheAvailabilityMetric
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  +[WiFiLocationManager sharedWiFiLocationManager](&OBJC_CLASS___WiFiLocationManager, "sharedWiFiLocationManager");
  xpc_object_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 latestLocation];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (+[WiFiLocationManager isLocationValid:uptoSeconds:requiredAccuracy:]( &OBJC_CLASS___WiFiLocationManager,  "isLocationValid:uptoSeconds:requiredAccuracy:",  v4,  900.0,  2000.0))
    {
      v5 = objc_alloc(&OBJC_CLASS___TBGloriaTile);
      [v4 coordinate];
      double v7 = v6;
      [v4 coordinate];
      v9 = -[TBGloriaTile initWithLat:lng:zoom:]( v5,  "initWithLat:lng:zoom:",  +[TBGloriaTile defaultZoomLevel](&OBJC_CLASS___TBGloriaTile, "defaultZoomLevel"),  v7,  v8);
      if (-[TBGloriaTile key](v9, "key"))
      {
        uint64_t v10 = -[TBGloriaTile key](v9, "key");
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
        {
          [MEMORY[0x189607968] numberWithUnsignedLongLong:v10];
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v28 = "-[WiFi3BarsTileCacheObserver _submitCacheAvailabilityMetric]";
          __int16 v29 = 2112;
          v30 = v11;
          __int16 v31 = 1024;
          int v32 = +[TBGloriaTile defaultZoomLevel](&OBJC_CLASS___TBGloriaTile, "defaultZoomLevel");
          _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "%s: Fetching tile key at key: %@ zoom: %hhu",  buf,  0x1Cu);
        }

        [MEMORY[0x189603F50] date];
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 dateByAddingDays:-7];
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        [MEMORY[0x189607968] numberWithUnsignedLongLong:v10];
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = +[TBTileItemDescriptor tileItemDescriptorWithKey:]( &OBJC_CLASS___TBTileItemDescriptor,  "tileItemDescriptorWithKey:",  v13);
        objc_msgSend(MEMORY[0x189604010], "setWithObjects:", v14, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[TBTileFetchRequestDescriptor initWithTileItems:maxCacheAge:]( objc_alloc(&OBJC_CLASS___TBTileFetchRequestDescriptor),  "initWithTileItems:maxCacheAge:",  v15,  v23);
        v17 = -[TBTileFetchRequest initWithDescriptor:sourcePolicy:cacheable:]( objc_alloc(&OBJC_CLASS___TBTileFetchRequest),  "initWithDescriptor:sourcePolicy:cacheable:",  v16,  1LL,  0LL);
        v25[0] = @"trigger";
        v25[1] = @"tileKey";
        v26[0] = &unk_18A1B3750;
        [MEMORY[0x189607968] numberWithUnsignedLongLong:v10];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v26[1] = v18;
        [MEMORY[0x189603F68] dictionaryWithObjects:v26 forKeys:v25 count:2];
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[TBTileFetchRequest setUserInfo:](v17, "setUserInfo:", v19);

        v24[0] = MEMORY[0x1895F87A8];
        v24[1] = 3221225472LL;
        v24[2] = __60__WiFi3BarsTileCacheObserver__submitCacheAvailabilityMetric__block_invoke;
        v24[3] = &__block_descriptor_40_e39_v28__0___TBFetchResponse__8___v___16B24l;
        v24[4] = v10;
        -[TBTileFetchRequest setResultsHandler:](v17, "setResultsHandler:", v24);
        v20 = -[WiFi3BarsTileCacheObserver dataSourceMediator](self, "dataSourceMediator");
        [v20 executeFetchRequest:v17];
      }

      else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v28 = "-[WiFi3BarsTileCacheObserver _submitCacheAvailabilityMetric]";
        __int16 v29 = 1024;
        LODWORD(v30) = +[TBGloriaTile defaultZoomLevel](&OBJC_CLASS___TBGloriaTile, "defaultZoomLevel");
        _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "%s: Invalid tileKey at zoom: %hhu",  buf,  0x12u);
      }
    }

    else
    {
      v22 = +[TBCacheAnalyticsEvent cacheAvailabilityEventWithStatus:]( &OBJC_CLASS___TBCacheAnalyticsEvent,  "cacheAvailabilityEventWithStatus:",  3LL);
      +[TBAnalytics captureEvent:](&OBJC_CLASS___TBAnalytics, "captureEvent:", v22);
    }
  }

  else
  {
    v21 = +[TBCacheAnalyticsEvent cacheAvailabilityEventWithStatus:]( &OBJC_CLASS___TBCacheAnalyticsEvent,  "cacheAvailabilityEventWithStatus:",  2LL);
    +[TBAnalytics captureEvent:](&OBJC_CLASS___TBAnalytics, "captureEvent:", v21);

    NSLog(@"%s: no location available", "-[WiFi3BarsTileCacheObserver _submitCacheAvailabilityMetric]");
  }
}

void __60__WiFi3BarsTileCacheObserver__submitCacheAvailabilityMetric__block_invoke( uint64_t a1,  void *a2,  void *a3,  int a4)
{
  id v14 = a2;
  id v7 = a3;
  double v8 = v7;
  if (v7) {
    (*((void (**)(id))v7 + 2))(v7);
  }
  if (a4)
  {
    [v14 error];
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v10 = *(void *)(a1 + 32);
    if (v9)
    {
      [v14 error];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog( @"%s: fetch for %llu failed, error %@, tile is not available",  "-[WiFi3BarsTileCacheObserver _submitCacheAvailabilityMetric]_block_invoke",  v10,  v11);

      uint64_t v12 = 0LL;
    }

    else
    {
      NSLog( @"%s: fetch for %llu completed, tile is available",  "-[WiFi3BarsTileCacheObserver _submitCacheAvailabilityMetric]_block_invoke",  v10);
      uint64_t v12 = 1LL;
    }
    v13 = +[TBCacheAnalyticsEvent cacheAvailabilityEventWithStatus:]( &OBJC_CLASS___TBCacheAnalyticsEvent,  "cacheAvailabilityEventWithStatus:",  v12);
    +[TBAnalytics captureEvent:](&OBJC_CLASS___TBAnalytics, "captureEvent:", v13);
  }
}

- (TBDataSourceMediator)dataSourceMediator
{
  return self->_dataSourceMediator;
}

- (void)setDataSourceMediator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end