@interface WiFi3BarsTileFetcher
- (NSXPCConnection)connectionToService;
- (TBDataSourceMediator)dataSourceMediator;
- (WiFi3BarsTileCacheObserver)tileCacheObserver;
- (WiFi3BarsTileFetcher)initWithDataSourceMediator:(id)a3;
- (unint64_t)lastFetchedKey;
- (void)_handleLocationManagerVisitCallbackWithVisit:(id)a3;
- (void)dealloc;
- (void)setDataSourceMediator:(id)a3;
- (void)setLastFetchedKey:(unint64_t)a3;
- (void)setTileCacheObserver:(id)a3;
@end

@implementation WiFi3BarsTileFetcher

- (WiFi3BarsTileFetcher)initWithDataSourceMediator:(id)a3
{
  v4 = (TBDataSourceMediator *)a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___WiFi3BarsTileFetcher;
  v5 = -[WiFi3BarsTileFetcher init](&v13, sel_init);
  dataSourceMediator = v5->_dataSourceMediator;
  v5->_dataSourceMediator = v4;
  v7 = v4;
  v8 = +[WiFiLocationManager sharedWiFiLocationManager](&OBJC_CLASS___WiFiLocationManager, "sharedWiFiLocationManager");
  [v8 setShouldMonitorVisits:1];
  v9 = +[WiFiLocationManager sharedWiFiLocationManager](&OBJC_CLASS___WiFiLocationManager, "sharedWiFiLocationManager");
  [v9 registerVisitCallbackFunctionPtr:__WiFiManagerLocationManagerVisitCallback withContext:v5];

  v10 = -[WiFi3BarsTileCacheObserver initWithDataSourceMediator:]( objc_alloc(&OBJC_CLASS___WiFi3BarsTileCacheObserver),  "initWithDataSourceMediator:",  v7);
  tileCacheObserver = v5->_tileCacheObserver;
  v5->_tileCacheObserver = v10;

  return v5;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___WiFi3BarsTileFetcher;
  -[WiFi3BarsTileFetcher dealloc](&v4, sel_dealloc);
}

- (void)_handleLocationManagerVisitCallbackWithVisit:(id)a3
{
  id v21 = a3;
  objc_super v4 = (void *)MEMORY[0x1895BA820]();
  [v21 departureDate];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603F50] distantFuture];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    [v21 horizontalAccuracy];
    if (v7 <= 2000.0)
    {
      v9 = objc_alloc(&OBJC_CLASS___TBGloriaTile);
      [v21 coordinate];
      double v11 = v10;
      [v21 coordinate];
      objc_super v13 = -[TBGloriaTile initWithLat:lng:zoom:]( v9,  "initWithLat:lng:zoom:",  +[TBGloriaTile defaultZoomLevel](&OBJC_CLASS___TBGloriaTile, "defaultZoomLevel"),  v11,  v12);
      if (-[TBGloriaTile key](v13, "key"))
      {
        uint64_t v14 = -[TBGloriaTile key](v13, "key");
        NSLog( @"%s: Fetching networks, key: %llu zoom: %hhu",  "-[WiFi3BarsTileFetcher _handleLocationManagerVisitCallbackWithVisit:]",  v14,  +[TBGloriaTile defaultZoomLevel](&OBJC_CLASS___TBGloriaTile, "defaultZoomLevel"));
        NSLog( @"%s: last fetched tile %llu - current tile %llu - checking for cache",  "-[WiFi3BarsTileFetcher _handleLocationManagerVisitCallbackWithVisit:]",  self->_lastFetchedKey,  v14);
        [MEMORY[0x189603F50] date];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 dateByAddingDays:-7];
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = (NSXPCConnection *)[objc_alloc(MEMORY[0x189607B30]) initWithServiceName:@"com.apple.wifi.ThreeBarsXPCService"];
        connectionToService = self->_connectionToService;
        self->_connectionToService = v17;

        if (self->_connectionToService)
        {
          [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C72DCA8];
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSXPCConnection setRemoteObjectInterface:](self->_connectionToService, "setRemoteObjectInterface:", v19);

          -[NSXPCConnection resume](self->_connectionToService, "resume");
          v20 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( self->_connectionToService,  "synchronousRemoteObjectProxyWithErrorHandler:",  &__block_literal_global_1);
          if (v20) {
            objc_msgSend(v20, "fetchTileFromVisitedCallback:cacheAge:", -[TBGloriaTile key](v13, "key"), v16);
          }
          else {
            NSLog( @"%s: proxy is null",  "-[WiFi3BarsTileFetcher _handleLocationManagerVisitCallbackWithVisit:]");
          }
        }

        else
        {
          NSLog( @"%s: _connectionToService is null",  "-[WiFi3BarsTileFetcher _handleLocationManagerVisitCallbackWithVisit:]");
        }
      }

      else
      {
        NSLog( @"%s: Invalid tileKey, zoom: %hhu",  "-[WiFi3BarsTileFetcher _handleLocationManagerVisitCallbackWithVisit:]",  +[TBGloriaTile defaultZoomLevel](&OBJC_CLASS___TBGloriaTile, "defaultZoomLevel"));
      }
    }

    else
    {
      [v21 horizontalAccuracy];
      NSLog( @"%s: visit accuracy is too low %f",  "-[WiFi3BarsTileFetcher _handleLocationManagerVisitCallbackWithVisit:]",  v8);
    }
  }

  else
  {
    NSLog( @"%s: visit is a departure, not using for fetching",  "-[WiFi3BarsTileFetcher _handleLocationManagerVisitCallbackWithVisit:]");
  }

  objc_autoreleasePoolPop(v4);
}

void __69__WiFi3BarsTileFetcher__handleLocationManagerVisitCallbackWithVisit___block_invoke( uint64_t a1,  uint64_t a2)
{
}

- (TBDataSourceMediator)dataSourceMediator
{
  return self->_dataSourceMediator;
}

- (void)setDataSourceMediator:(id)a3
{
}

- (unint64_t)lastFetchedKey
{
  return self->_lastFetchedKey;
}

- (void)setLastFetchedKey:(unint64_t)a3
{
  self->_lastFetchedKey = a3;
}

- (WiFi3BarsTileCacheObserver)tileCacheObserver
{
  return self->_tileCacheObserver;
}

- (void)setTileCacheObserver:(id)a3
{
}

- (NSXPCConnection)connectionToService
{
  return self->_connectionToService;
}

- (void).cxx_destruct
{
}

@end