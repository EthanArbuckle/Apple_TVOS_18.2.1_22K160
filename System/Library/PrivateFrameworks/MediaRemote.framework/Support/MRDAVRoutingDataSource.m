@interface MRDAVRoutingDataSource
+ (MRDAVRoutingDataSource)allocWithZone:(_NSZone *)a3;
- (BOOL)resetPickedRouteForSource:(unsigned int)a3;
- (BOOL)resetPickedSystemRouteForSource:(unsigned int)a3;
- (BOOL)setPickedRoute:(id)a3 withPassword:(id)a4;
- (BOOL)setPickedRoute:(id)a3 withPassword:(id)a4 forSource:(unsigned int)a5;
- (BOOL)setPickedSystemRoute:(id)a3 withPassword:(id)a4 forSource:(unsigned int)a5;
- (BOOL)unpickAirPlayRoutes;
- (MRDAVRoute)pickedRoute;
- (MRDAVRoutingDataSource)init;
- (NSArray)pickedRoutes;
- (id)authorizationRequestCallbackForRouteID:(id)a3;
- (id)pickableRoutesForCategory:(id)a3;
- (id)pickableRoutesForCategory:(id)a3 source:(unsigned int)a4;
- (id)pickedRouteForCategory:(id)a3;
- (id)pickedRouteForCategory:(id)a3 source:(unsigned int)a4;
- (id)pickedRoutesForCategory:(id)a3 source:(unsigned int)a4;
- (unsigned)discoveryMode;
- (unsigned)externalScreenType;
- (void)addAuthorizationCallbackForRouteID:(id)a3 requestCallback:(id)a4;
- (void)removeAuthorizationCallbackForRouteID:(id)a3;
- (void)setDiscoveryMode:(unsigned int)a3;
@end

@implementation MRDAVRoutingDataSource

+ (MRDAVRoutingDataSource)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class(&OBJC_CLASS___MRDAVRoutingDataSource) == a1) {
    return (MRDAVRoutingDataSource *)+[MRDAVRoutingDataSource allocWithZone:]( &OBJC_CLASS___MRDMediaServerAVRoutingDataSource,  "allocWithZone:",  a3);
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MRDAVRoutingDataSource;
  return (MRDAVRoutingDataSource *)objc_msgSendSuper2(&v6, "allocWithZone:", a3);
}

- (MRDAVRoutingDataSource)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MRDAVRoutingDataSource;
  v2 = -[MRDAVRoutingDataSource init](&v8, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.MRDAVRoutingDataSource.serialQueue", v4);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;
  }

  return v2;
}

- (NSArray)pickedRoutes
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(-[MRDAVRoutingDataSource pickedRoute](self, "pickedRoute"));
  dispatch_queue_attr_t v3 = (void *)v2;
  if (v2)
  {
    uint64_t v6 = v2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  }

  else
  {
    v4 = 0LL;
  }

  return (NSArray *)v4;
}

- (id)pickableRoutesForCategory:(id)a3
{
  return 0LL;
}

- (id)pickableRoutesForCategory:(id)a3 source:(unsigned int)a4
{
  return 0LL;
}

- (id)pickedRouteForCategory:(id)a3
{
  return 0LL;
}

- (id)pickedRoutesForCategory:(id)a3 source:(unsigned int)a4
{
  uint64_t v4 = objc_claimAutoreleasedReturnValue( -[MRDAVRoutingDataSource pickedRouteForCategory:source:]( self,  "pickedRouteForCategory:source:",  a3,  *(void *)&a4));
  dispatch_queue_t v5 = (void *)v4;
  if (v4)
  {
    uint64_t v8 = v4;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6;
}

- (id)pickedRouteForCategory:(id)a3 source:(unsigned int)a4
{
  return 0LL;
}

- (BOOL)setPickedRoute:(id)a3 withPassword:(id)a4
{
  return 0;
}

- (BOOL)setPickedRoute:(id)a3 withPassword:(id)a4 forSource:(unsigned int)a5
{
  return 0;
}

- (BOOL)setPickedSystemRoute:(id)a3 withPassword:(id)a4 forSource:(unsigned int)a5
{
  return 0;
}

- (BOOL)resetPickedRouteForSource:(unsigned int)a3
{
  return 0;
}

- (BOOL)resetPickedSystemRouteForSource:(unsigned int)a3
{
  return 0;
}

- (BOOL)unpickAirPlayRoutes
{
  return 0;
}

- (void)addAuthorizationCallbackForRouteID:(id)a3 requestCallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002226C;
  block[3] = &unk_10039A550;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(serialQueue, block);
}

- (void)removeAuthorizationCallbackForRouteID:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100022398;
  block[3] = &unk_100398E60;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
}

- (id)authorizationRequestCallbackForRouteID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = sub_10002247C;
  v16 = sub_1000224A4;
  id v17 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000224AC;
  block[3] = &unk_100399CB8;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  id v7 = objc_retainBlock((id)v13[5]);

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (unsigned)discoveryMode
{
  return self->_discoveryMode;
}

- (void)setDiscoveryMode:(unsigned int)a3
{
  self->_discoveryMode = a3;
}

- (MRDAVRoute)pickedRoute
{
  return self->_pickedRoute;
}

- (unsigned)externalScreenType
{
  return self->_externalScreenType;
}

- (void).cxx_destruct
{
}

@end