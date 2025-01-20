@interface WiFiNOIManager
+ (id)sharedWiFiNOIManagerWithQueue:(id)a3;
- (BOOL)setNetworkOfInterest:(__WiFiNetwork *)a3;
- (WiFiNOIManager)initWithQueue:(id)a3;
- (id)copyHomeNetworkTransitionDate;
- (id)getHomeNetworkNextTransitionDate:(id)a3;
- (void)armHomeNetworkTransitionTimer:(__WiFiDeviceManager *)a3;
- (void)asyncScopeHomeNetworks;
- (void)asyncScopeWorkNetworks;
- (void)asyncTrackNetworksOfInterest:(BOOL)a3;
- (void)attemptHomeNetworkTransition:(id)a3;
- (void)dealloc;
- (void)didStartTrackingNOI:(id)a3;
- (void)didStopTrackingAllNOIs:(id)a3;
- (void)didStopTrackingNOI:(id)a3;
- (void)disarmHomeNetworkTransitionTimer;
@end

@implementation WiFiNOIManager

+ (id)sharedWiFiNOIManagerWithQueue:(id)a3
{
  v5 = (void *)objc_opt_class(&OBJC_CLASS___WiFiNOIManager);
  objc_sync_enter(v5);
  id v6 = (id)qword_100219E58;
  if (!qword_100219E58)
  {
    id v6 = [objc_alloc((Class)a1) initWithQueue:a3];
    qword_100219E58 = (uint64_t)v6;
  }

  objc_sync_exit(v5);
  return v6;
}

- (WiFiNOIManager)initWithQueue:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___WiFiNOIManager;
  v4 = -[WiFiNOIManager init](&v15, "init");
  v5 = v4;
  if (!v4) {
    goto LABEL_24;
  }
  v4->_managerQueue = (OS_dispatch_queue *)a3;
  if (!a3)
  {
    v13 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: nil _managerQueue",  "-[WiFiNOIManager initWithQueue:]");
    }
    goto LABEL_23;
  }

  id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.wifid.wifinoimanagerq", v6);
  v5->_dispatchQueue = (OS_dispatch_queue *)v7;
  if (!v7)
  {
    v13 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: nil _dispatchQueue",  "-[WiFiNOIManager initWithQueue:]");
    }
    goto LABEL_23;
  }

  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v5->_trackedHomeNetworks = v8;
  if (!v8)
  {
    v13 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null _trackedHomeNetworks",  "-[WiFiNOIManager initWithQueue:]");
    }
    goto LABEL_23;
  }

  v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v5->_trackedWorkNetworks = v9;
  if (!v9)
  {
    v13 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null _trackedWorkNetworks",  "-[WiFiNOIManager initWithQueue:]");
    }
    goto LABEL_23;
  }

  v10 = objc_alloc_init(&OBJC_CLASS___NWNetworkOfInterestManager);
  v5->_noiManager = v10;
  if (!v10)
  {
    v13 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null _noiManager",  "-[WiFiNOIManager initWithQueue:]");
    }
    goto LABEL_23;
  }

  -[NWNetworkOfInterestManager setQueue:](v10, "setQueue:", v5->_dispatchQueue);
  -[NWNetworkOfInterestManager setDelegate:](v5->_noiManager, "setDelegate:", v5);
  v5->_isTracking = 0;
  v5->_deviceClass = MGGetSInt32Answer(@"DeviceClassNumber", 0LL);
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v5->_sortedTopHomeNetworks = v11;
  if (!v11)
  {
    v13 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null _sortedTopHomeNetworks",  "-[WiFiNOIManager initWithQueue:]");
    }
    goto LABEL_23;
  }

  v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v5->_sortedTopWorkNetworks = v12;
  if (!v12)
  {
    v13 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null _sortedTopWorkNetworks",  "-[WiFiNOIManager initWithQueue:]");
    }
LABEL_23:
    objc_autoreleasePoolPop(v13);
LABEL_24:

    v5 = 0LL;
  }

  qword_100219E58 = (uint64_t)v5;
  return v5;
}

- (void)dealloc
{
  dispatchQueue = (dispatch_object_s *)self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }
  trackedHomeNetworks = self->_trackedHomeNetworks;
  if (trackedHomeNetworks)
  {
    -[NSMutableSet removeAllObjects](trackedHomeNetworks, "removeAllObjects");
  }

  trackedWorkNetworks = self->_trackedWorkNetworks;
  if (trackedWorkNetworks)
  {
    -[NSMutableSet removeAllObjects](trackedWorkNetworks, "removeAllObjects");
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___WiFiNOIManager;
  -[WiFiNOIManager dealloc](&v6, "dealloc");
}

- (void)asyncTrackNetworksOfInterest:(BOOL)a3
{
  if ((self->_deviceClass | 2) == 3 && self->_isTracking != a3)
  {
    self->_isTracking = a3;
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10012E668;
    block[3] = &unk_1001E2AF0;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }

- (BOOL)setNetworkOfInterest:(__WiFiNetwork *)a3
{
  if ((self->_deviceClass | 2) != 3) {
    return 0;
  }
  uint64_t v8 = 0LL;
  v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  if (a3)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10012E834;
    block[3] = &unk_1001E5F48;
    void block[5] = &v8;
    block[6] = a3;
    block[4] = self;
    dispatch_sync(dispatchQueue, block);
  }

  else
  {
    objc_super v6 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null network",  "-[WiFiNOIManager setNetworkOfInterest:]");
    }
    objc_autoreleasePoolPop(v6);
  }

  BOOL v4 = *((_BYTE *)v9 + 24) != 0;
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (void)asyncScopeHomeNetworks
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10012EA64;
  block[3] = &unk_1001E2AF0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)asyncScopeWorkNetworks
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10012ED0C;
  block[3] = &unk_1001E2AF0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)attemptHomeNetworkTransition:(id)a3
{
  managerQueue = (dispatch_queue_s *)self->_managerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10012EFB4;
  block[3] = &unk_1001E2AF0;
  block[4] = self;
  dispatch_async(managerQueue, block);
}

- (void)armHomeNetworkTransitionTimer:(__WiFiDeviceManager *)a3
{
  if (self->_deviceClass != 7) {
    return;
  }
  if (!a3)
  {
    uint64_t v10 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s: null manager",  "-[WiFiNOIManager armHomeNetworkTransitionTimer:]");
    }
    goto LABEL_15;
  }

  id v5 = -[WiFiNOIManager copyHomeNetworkTransitionDate](self, "copyHomeNetworkTransitionDate");
  homeTransitionTimer = self->_homeTransitionTimer;
  id v11 = v5;
  if (!homeTransitionTimer)
  {
    self->_deviceManager = a3;
    objc_msgSend( -[WiFiNOIManager getHomeNetworkNextTransitionDate:](self, "getHomeNetworkNextTransitionDate:", v5),  "timeIntervalSinceNow");
    uint64_t v8 = -[NSTimer initWithFireDate:interval:target:selector:userInfo:repeats:]( objc_alloc(&OBJC_CLASS___NSTimer),  "initWithFireDate:interval:target:selector:userInfo:repeats:",  v11,  self,  "attemptHomeNetworkTransition:",  0LL,  1LL,  v7);
    self->_homeTransitionTimer = v8;
    if (v8)
    {
      -[NSRunLoop addTimer:forMode:]( +[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"),  "addTimer:forMode:",  self->_homeTransitionTimer,  NSDefaultRunLoopMode);
      goto LABEL_8;
    }

    uint64_t v10 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: _noiTransitionCheckTimer is NULL",  "-[WiFiNOIManager armHomeNetworkTransitionTimer:]");
    }
LABEL_15:
    objc_autoreleasePoolPop(v10);
    return;
  }

  -[NSTimer setFireDate:](homeTransitionTimer, "setFireDate:", v5);
LABEL_8:
  v9 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:3, "Armed NOI Transition Check Timer. Fire at %@", v11 message];
  }
  objc_autoreleasePoolPop(v9);
}

- (void)disarmHomeNetworkTransitionTimer
{
  if (self->_deviceClass == 7)
  {
    p_homeTransitionTimer = &self->_homeTransitionTimer;
    homeTransitionTimer = self->_homeTransitionTimer;
    if (homeTransitionTimer && -[NSTimer isValid](homeTransitionTimer, "isValid"))
    {
      -[NSTimer invalidate](*p_homeTransitionTimer, "invalidate");

      *p_homeTransitionTimer = 0LL;
      p_homeTransitionTimer[1] = 0LL;
    }

    BOOL v4 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3 message:"Disarm NOI Transition Check Timer"];
    }
    objc_autoreleasePoolPop(v4);
  }

- (id)copyHomeNetworkTransitionDate
{
  v3 = +[NSDate date](&OBJC_CLASS___NSDate, "date");
  BOOL v4 = +[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar");
  id v5 = -[NSCalendar components:fromDate:](v4, "components:fromDate:", 25100LL, v3);
  if (!v5)
  {
    id v11 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s: null dateComponents",  "-[WiFiNOIManager copyHomeNetworkTransitionDate]");
    }
    goto LABEL_11;
  }

  objc_super v6 = v5;
  -[NSDateComponents setHour:](v5, "setHour:", 5LL);
  -[NSDateComponents setMinute:](v6, "setMinute:", 0LL);
  -[NSDateComponents setSecond:](v6, "setSecond:", 0LL);
  double v7 = -[NSCalendar dateFromComponents:](v4, "dateFromComponents:", v6);
  if (!v7)
  {
    id v11 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s: null fireDate",  "-[WiFiNOIManager copyHomeNetworkTransitionDate]");
    }
LABEL_11:
    objc_autoreleasePoolPop(v11);
    return 0LL;
  }

  uint64_t v8 = v7;
  if ((id)-[NSDate compare:](v7, "compare:", v3) != (id)1) {
    uint64_t v8 = -[WiFiNOIManager getHomeNetworkNextTransitionDate:](self, "getHomeNetworkNextTransitionDate:", v8);
  }
  v9 = v8;
  return v8;
}

- (id)getHomeNetworkNextTransitionDate:(id)a3
{
  BOOL v4 = objc_autoreleasePoolPush();
  id v5 = +[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar");
  objc_super v6 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
  -[NSDateComponents setDay:](v6, "setDay:", 1LL);
  double v7 = -[NSCalendar dateByAddingComponents:toDate:options:](v5, "dateByAddingComponents:toDate:options:", v6, a3, 0LL);

  objc_autoreleasePoolPop(v4);
  return v7;
}

- (void)didStartTrackingNOI:(id)a3
{
  if ([a3 atHomeScopedNOI])
  {
    -[NSMutableSet addObject:](self->_trackedHomeNetworks, "addObject:", a3);
    -[WiFiNOIManager asyncScopeHomeNetworks](self, "asyncScopeHomeNetworks");
  }

  if ([a3 atWorkScopedNOI])
  {
    -[NSMutableSet addObject:](self->_trackedWorkNetworks, "addObject:", a3);
    -[WiFiNOIManager asyncScopeWorkNetworks](self, "asyncScopeWorkNetworks");
  }

- (void)didStopTrackingNOI:(id)a3
{
}

- (void)didStopTrackingAllNOIs:(id)a3
{
  id v5 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:3, "didStopTrackingAllNOIs type %@", a3 message];
  }
  objc_autoreleasePoolPop(v5);
  if (self->_isTracking)
  {
    self->_isTracking = 0;
    trackedHomeNetworks = self->_trackedHomeNetworks;
    if (trackedHomeNetworks)
    {
      -[NSMutableSet removeAllObjects](trackedHomeNetworks, "removeAllObjects");

      -[NSMutableArray removeAllObjects](self->_sortedTopHomeNetworks, "removeAllObjects");
    }

    trackedWorkNetworks = self->_trackedWorkNetworks;
    if (trackedWorkNetworks)
    {
      -[NSMutableSet removeAllObjects](trackedWorkNetworks, "removeAllObjects");

      -[NSMutableArray removeAllObjects](self->_sortedTopWorkNetworks, "removeAllObjects");
    }

    self->_trackedHomeNetworks = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    self->_trackedWorkNetworks = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    -[WiFiNOIManager asyncTrackNetworksOfInterest:](self, "asyncTrackNetworksOfInterest:", 1LL);
  }

@end