@interface TBXPCService
- (TBXPCService)init;
- (void)cancelMaintenanceTask;
- (void)fetch3BarsNetworksForLocation:(id)a3;
- (void)fetchTileFromVisitedCallback:(unint64_t)a3 cacheAge:(id)a4;
- (void)forceFetch3BarsNetworkMatchingBSSID:(id)a3 completionHandler:(id)a4;
- (void)maintenanceTask:(unint64_t)a3 location:(id)a4 predictedForDuration:(double)a5 maxPredictedLocations:(unint64_t)a6 completionHandler:(id)a7;
- (void)prune3BarsNetworks:(unint64_t)a3;
@end

@implementation TBXPCService

- (TBXPCService)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TBXPCService;
  v3 = -[TBXPCService init](&v7, "init");
  dispatch_queue_t v4 = dispatch_queue_create(0LL, 0LL);
  processingQueue = v3->_processingQueue;
  v3->_processingQueue = (OS_dispatch_queue *)v4;

  return v3;
}

- (void)maintenanceTask:(unint64_t)a3 location:(id)a4 predictedForDuration:(double)a5 maxPredictedLocations:(unint64_t)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a7;
  NSLog( @"%s: sizeLimit = %ld, duration = %f, maxLocations = %lu",  "-[TBXPCService maintenanceTask:location:predictedForDuration:maxPredictedLocations:completionHandler:]",  a3,  *(void *)&a5,  a6);
  self->_isCancelled = 0;
  processingQueue = self->_processingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000252C;
  block[3] = &unk_100004158;
  id v19 = v13;
  unint64_t v20 = a3;
  block[4] = self;
  id v18 = v12;
  double v21 = a5;
  unint64_t v22 = a6;
  id v15 = v12;
  id v16 = v13;
  dispatch_async((dispatch_queue_t)processingQueue, block);
}

- (void)cancelMaintenanceTask
{
  NSLog(@"%s: _isCancelled = %d", a2, "-[TBXPCService cancelMaintenanceTask]", self->_isCancelled);
  self->_isCancelled = 1;
}

- (void)fetchTileFromVisitedCallback:(unint64_t)a3 cacheAge:(id)a4
{
  id v5 = a4;
  NSLog( @"%s: tileKey = %llu, cacheAge = %@",  "-[TBXPCService fetchTileFromVisitedCallback:cacheAge:]",  a3,  v5);
  id v6 = [[WiFi3BarsSource alloc] initWithChangeHandler:0 localStoreType:1];
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[TBTileItemDescriptor tileItemDescriptorWithKey:]( &OBJC_CLASS___TBTileItemDescriptor,  "tileItemDescriptorWithKey:",  v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v8, 0LL));
  id v10 = [[TBTileFetchRequestDescriptor alloc] initWithTileItems:v9 maxCacheAge:v5];

  id v11 = [[TBTileFetchRequest alloc] initWithDescriptor:v10 sourcePolicy:3 cacheable:1];
  v16[0] = @"trigger";
  v16[1] = @"tileKey";
  v17[0] = &off_100004450;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  v17[1] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  2LL));
  [v11 setUserInfo:v13];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100002888;
  v15[3] = &unk_100004178;
  v15[4] = a3;
  [v11 setResultsHandler:v15];
  v14 = (void *)objc_claimAutoreleasedReturnValue([v6 sourceMediator]);
  [v14 executeFetchRequest:v11];
}

- (void)fetch3BarsNetworksForLocation:(id)a3
{
  id v4 = a3;
  NSLog(@"%s:", "-[TBXPCService fetch3BarsNetworksForLocation:]");
  processingQueue = self->_processingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000029E8;
  block[3] = &unk_1000041A0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)processingQueue, block);
}

- (void)prune3BarsNetworks:(unint64_t)a3
{
  processingQueue = self->_processingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100002AC8;
  block[3] = &unk_1000041C0;
  void block[4] = a3;
  dispatch_async((dispatch_queue_t)processingQueue, block);
}

- (void)forceFetch3BarsNetworkMatchingBSSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  NSLog(@"%s:", "-[TBXPCService forceFetch3BarsNetworkMatchingBSSID:completionHandler:]");
  processingQueue = self->_processingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100002BD8;
  block[3] = &unk_1000041E8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)processingQueue, block);
}

- (void).cxx_destruct
{
}

@end