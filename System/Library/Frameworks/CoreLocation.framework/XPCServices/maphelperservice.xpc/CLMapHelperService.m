@interface CLMapHelperService
- (CLMapHelperService)init;
- (void)clearMemoryAndExitCleanly;
- (void)fetchGEOBuildingDataAroundCoordinate:(CLLocationCoordinate2D)a3 inRadius:(double)a4 tileSetStyle:(int)a5 allowNetwork:(BOOL)a6 clearTiles:(BOOL)a7 withReply:(id)a8;
- (void)fetchGEORoadDataAroundCoordinate:(CLLocationCoordinate2D)a3 inRadius:(double)a4 allowNetwork:(BOOL)a5 isPedestrianOrCycling:(BOOL)a6 clearTiles:(BOOL)a7 withReply:(id)a8;
- (void)releaseOSTransaction;
- (void)setEntitlementsForBuilding:(BOOL)a3;
- (void)setEntitlementsForRoad:(BOOL)a3;
- (void)takeOSTransaction;
@end

@implementation CLMapHelperService

- (CLMapHelperService)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CLMapHelperService;
  v2 = -[CLMapHelperService init](&v11, "init");
  if (v2)
  {
    id v3 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"_CLMapHelperService, %p", v2));
    v4 = (const char *)[v3 UTF8String];
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create(v4, v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    *(_WORD *)&v2->fHasEntitlementForRoadData = 0;
    fTransaction = v2->fTransaction;
    v2->fTransaction = 0LL;
  }

  return v2;
}

- (void)clearMemoryAndExitCleanly
{
}

- (void)fetchGEORoadDataAroundCoordinate:(CLLocationCoordinate2D)a3 inRadius:(double)a4 allowNetwork:(BOOL)a5 isPedestrianOrCycling:(BOOL)a6 clearTiles:(BOOL)a7 withReply:(id)a8
{
  v8 = (void (**)(id, void))a8;
  NSLog(@"CLTSP,CLMM,MaphelperService,fetchRoad function call not supported on this platform");
  v8[2](v8, 0LL);
}

- (void)fetchGEOBuildingDataAroundCoordinate:(CLLocationCoordinate2D)a3 inRadius:(double)a4 tileSetStyle:(int)a5 allowNetwork:(BOOL)a6 clearTiles:(BOOL)a7 withReply:(id)a8
{
  v8 = (void (**)(id, void))a8;
  NSLog(@"CLTSP,CLMM,MaphelperService,fetchBuilding function call not supported on this platform");
  v8[2](v8, 0LL);
}

- (void)setEntitlementsForRoad:(BOOL)a3
{
  self->fHasEntitlementForRoadData = a3;
}

- (void)setEntitlementsForBuilding:(BOOL)a3
{
  self->fHasEntitlementForBuildingData = a3;
}

- (void)takeOSTransaction
{
  if (!self->fTransaction)
  {
    NSLog(@"CLTSP,CLMM,MaphelperService,Taking OS Transaction", a2);
    id v3 = (OS_os_transaction *)os_transaction_create("maphelperservice");
    fTransaction = self->fTransaction;
    self->fTransaction = v3;
  }

- (void)releaseOSTransaction
{
  if (self->fTransaction)
  {
    NSLog(@"CLTSP,CLMM,MaphelperService,Releasing OS Transaction", a2);
    fTransaction = self->fTransaction;
    self->fTransaction = 0LL;
  }

- (void).cxx_destruct
{
}

@end