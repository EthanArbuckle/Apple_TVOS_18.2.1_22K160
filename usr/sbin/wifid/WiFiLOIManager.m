@interface WiFiLOIManager
+ (id)sharedWiFiLOIManager;
- (BOOL)deviceIsAssociated;
- (BOOL)ingestLocationUpdateWithLat:(double)a3 andLon:(double)a4 andAccuracy:(double)a5;
- (OS_dispatch_queue)dispatchQueue;
- (WiFiLOIManager)init;
- (double)accuracyOfBestReading;
- (double)bestLatitudeReading;
- (double)bestLongitudeReading;
- (int)query:(id)a3 andMaximumDistanceInMeters:(double)a4;
- (int)queryLOITypeAtLastLocation;
- (int)queryLOITypeAtLatestLocation;
- (int)queryLOITypeAtLocationAndMaxDistance:(id)a3 andMaximumDistanceInMeters:(double)a4;
- (void)asyncQueryLOITypeAtLatestLocationWithCompletion:(id)a3;
- (void)dealloc;
- (void)setAccuracyOfBestReading:(double)a3;
- (void)setBestLatitudeReading:(double)a3;
- (void)setBestLongitudeReading:(double)a3;
- (void)setDeviceIsAssociated:(BOOL)a3;
- (void)setDispatchQueue:(id)a3;
@end

@implementation WiFiLOIManager

+ (id)sharedWiFiLOIManager
{
  if (!objc_opt_class(&OBJC_CLASS___CLLocation, a2)) {
    return 0LL;
  }
  v4 = (void *)objc_opt_class(&OBJC_CLASS___WiFiLOIManager, v3);
  objc_sync_enter(v4);
  id v5 = (id)qword_1002197D8;
  if (!qword_1002197D8)
  {
    id v5 = objc_alloc_init((Class)a1);
    qword_1002197D8 = (uint64_t)v5;
  }

  objc_sync_exit(v4);
  return v5;
}

- (WiFiLOIManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___WiFiLOIManager;
  v2 = -[WiFiLOIManager init](&v7, "init");
  if (!v2)
  {
LABEL_7:

    v2 = 0LL;
    goto LABEL_8;
  }

  uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.wifid.wifiloimanagerq", v3);
  v2->_dispatchQueue = (OS_dispatch_queue *)v4;
  if (!v4)
  {
    id v5 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend((id)qword_100219F60, "WFLog:message:", 3, "%s: null _dispatchQueue", "-[WiFiLOIManager init]");
    }
    objc_autoreleasePoolPop(v5);
    goto LABEL_7;
  }

  -[NSNotificationCenter addObserver:selector:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "addObserver:selector:name:object:",  v2,  "_locationUpdateNotificationHandler:",  @"com.apple.wifid.locationUpdateNotification",  0LL);
LABEL_8:
  qword_1002197D8 = (uint64_t)v2;
  return v2;
}

- (void)dealloc
{
  dispatchQueue = (dispatch_object_s *)self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___WiFiLOIManager;
  -[WiFiLOIManager dealloc](&v4, "dealloc");
}

- (int)queryLOITypeAtLatestLocation
{
  uint64_t v3 = objc_autoreleasePoolPush();
  id v4 = objc_msgSend( objc_msgSend( +[WiFiLocationManager sharedWiFiLocationManager]( WiFiLocationManager,  "sharedWiFiLocationManager"),  "latestLocation"),  "copy");
  if (v4)
  {
    id v5 = v4;
    if (+[WiFiLocationManager isLocationValid:uptoSeconds:isHighAccuracy:]( &OBJC_CLASS___WiFiLocationManager,  "isLocationValid:uptoSeconds:isHighAccuracy:",  v4,  0LL,  300.0))
    {
      int v6 = -[WiFiLOIManager query:andMaximumDistanceInMeters:](self, "query:andMaximumDistanceInMeters:", v5, 200.0);
    }

    else
    {
      v9 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"message: %s Current location is stale" message:@"-[WiFiLOIManager queryLOITypeAtLatestLocation]"];
      }
      objc_autoreleasePoolPop(v9);
      int v6 = 0;
    }

    CFRelease(v5);
  }

  else
  {
    v8 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"Location unavailable for LOI query"];
    }
    objc_autoreleasePoolPop(v8);
    int v6 = 0;
  }

  objc_autoreleasePoolPop(v3);
  return v6;
}

- (int)queryLOITypeAtLastLocation
{
  return 0;
}

- (int)queryLOITypeAtLocationAndMaxDistance:(id)a3 andMaximumDistanceInMeters:(double)a4
{
  objc_super v7 = objc_autoreleasePoolPush();
  if (a3)
  {
    int v8 = -[WiFiLOIManager query:andMaximumDistanceInMeters:](self, "query:andMaximumDistanceInMeters:", a3, a4);
  }

  else
  {
    v10 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s Location NULL" message:@"-[WiFiLOIManager queryLOITypeAtLocationAndMaxDistance:andMaximumDistanceInMeters:]"];
    }
    objc_autoreleasePoolPop(v10);
    int v8 = 0;
  }

  objc_autoreleasePoolPop(v7);
  return v8;
}

- (void)asyncQueryLOITypeAtLatestLocationWithCompletion:(id)a3
{
  id v5 = objc_autoreleasePoolPush();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100007E8C;
  v6[3] = &unk_1001E2698;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async((dispatch_queue_t)-[WiFiLOIManager dispatchQueue](self, "dispatchQueue"), v6);
  objc_autoreleasePoolPop(v5);
}

- (int)query:(id)a3 andMaximumDistanceInMeters:(double)a4
{
  uint64_t v35 = 0LL;
  v36 = &v35;
  uint64_t v37 = 0x2020000000LL;
  char v38 = 0;
  uint64_t v31 = 0LL;
  v32 = &v31;
  uint64_t v33 = 0x2020000000LL;
  char v34 = 0;
  uint64_t v27 = 0LL;
  v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  char v30 = 0;
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  char v26 = 0;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 0;
  int v6 = objc_autoreleasePoolPush();
  if (a3)
  {
    objc_super v7 = dispatch_semaphore_create(0LL);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100008228;
    v18[3] = &unk_1001E26C0;
    v18[6] = &v31;
    v18[7] = &v23;
    v18[4] = v7;
    v18[5] = &v35;
    [+[RTRoutineManager defaultManager](RTRoutineManager, "defaultManager") fetchLocationsOfInterestWithinDistance:a3 ofLocation:v18 withHandler:a4];
    dispatch_time_t v8 = dispatch_time(0LL, 6000000000LL);
    if (dispatch_semaphore_wait(v7, v8))
    {
      *((_BYTE *)v24 + 24) = 1;
      v9 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"%s gave up waiting for a CoreRoutine. Bailing to avoid a hang" message:3];
      }
      objc_autoreleasePoolPop(v9);
    }

    dispatch_release(v7);
    v10 = dispatch_semaphore_create(0LL);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100008368;
    v17[3] = &unk_1001E26E8;
    v17[5] = &v27;
    v17[6] = &v19;
    v17[4] = v10;
    [+[RTRoutineManager defaultManager] fetchLocationsOfInterestVisitedSinceDate:[NSDate dateWithTimeIntervalSince1970:0.0] withHandler:v17];
    dispatch_time_t v11 = dispatch_time(0LL, 6000000000LL);
    if (dispatch_semaphore_wait(v10, v11))
    {
      *((_BYTE *)v20 + 24) = 1;
      v12 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"%s gave up waiting for a CoreRoutine. Bailing to avoid a hang" message:3];
      }
      objc_autoreleasePoolPop(v12);
    }

    dispatch_release(v10);
  }

  else if (qword_100219F60)
  {
    [qword_100219F60 WFLog:@"message: %s location required to query CR LOIs with" message:@"-[WiFiLOIManager query:andMaximumDistanceInMeters:]"];
  }

  objc_autoreleasePoolPop(v6);
  if (*((_BYTE *)v28 + 24))
  {
    if (*((_BYTE *)v32 + 24)) {
      int v13 = 3;
    }
    else {
      int v13 = 1;
    }
    if (*((_BYTE *)v32 + 24)) {
      int v14 = 4;
    }
    else {
      int v14 = 2;
    }
    if (*((_BYTE *)v36 + 24)) {
      int v15 = v14;
    }
    else {
      int v15 = v13;
    }
  }

  else
  {
    int v15 = 0;
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  return v15;
}

- (BOOL)ingestLocationUpdateWithLat:(double)a3 andLon:(double)a4 andAccuracy:(double)a5
{
  v14[0] = 0LL;
  v14[1] = v14;
  v14[2] = 0x3052000000LL;
  v14[3] = sub_1000085D8;
  v14[4] = sub_1000085E8;
  v14[5] = self;
  if (-[WiFiLOIManager deviceIsAssociated](self, "deviceIsAssociated")
    && ((-[WiFiLOIManager bestLatitudeReading](self, "bestLatitudeReading"), v9 == 0.0)
     || (-[WiFiLOIManager bestLongitudeReading](self, "bestLongitudeReading"), v10 == 0.0)))
  {
    BOOL v11 = 0;
    if (a5 < 100.1 && a4 != 0.0 && a5 != 0.0)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_1000085F4;
      v13[3] = &unk_1001E2710;
      v13[4] = v14;
      *(double *)&v13[5] = a5;
      *(double *)&v13[6] = a3;
      *(double *)&v13[7] = a4;
      dispatch_async((dispatch_queue_t)-[WiFiLOIManager dispatchQueue](self, "dispatchQueue"), v13);
      BOOL v11 = 1;
    }
  }

  else
  {
    BOOL v11 = 0;
  }

  _Block_object_dispose(v14, 8);
  return v11;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (double)bestLatitudeReading
{
  return self->_bestLatitudeReading;
}

- (void)setBestLatitudeReading:(double)a3
{
  self->_bestLatitudeReading = a3;
}

- (double)bestLongitudeReading
{
  return self->_bestLongitudeReading;
}

- (void)setBestLongitudeReading:(double)a3
{
  self->_bestLongitudeReading = a3;
}

- (double)accuracyOfBestReading
{
  return self->_accuracyOfBestReading;
}

- (void)setAccuracyOfBestReading:(double)a3
{
  self->_accuracyOfBestReading = a3;
}

- (BOOL)deviceIsAssociated
{
  return self->_deviceIsAssociated;
}

- (void)setDeviceIsAssociated:(BOOL)a3
{
  self->_deviceIsAssociated = a3;
}

@end