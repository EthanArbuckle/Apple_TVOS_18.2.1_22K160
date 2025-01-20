@interface CLTrackingAvoidanceZoneMonitor
- (BOOL)_updateLocation:(id)a3;
- (BOOL)isInZone;
- (BOOL)locationIsInZoneWithLatitude:(double)a3 longitude:(double)a4 horizontalAccuracy:(double)a5;
- (BOOL)onLocationUpdate:(id)a3;
- (CLLocation)location;
- (CLTrackingAvoidanceZoneMonitor)init;
- (CLTrackingAvoidanceZoneMonitor)initWithTimeZone:(id)a3 zoneBoundary:(CLZoneBoundary_)a4;
- (NSString)timeZone;
- (void)dealloc;
@end

@implementation CLTrackingAvoidanceZoneMonitor

- (CLTrackingAvoidanceZoneMonitor)init
{
  return 0LL;
}

- (CLTrackingAvoidanceZoneMonitor)initWithTimeZone:(id)a3 zoneBoundary:(CLZoneBoundary_)a4
{
  double var3 = a4.var3;
  double var2 = a4.var2;
  double var1 = a4.var1;
  double var0 = a4.var0;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CLTrackingAvoidanceZoneMonitor;
  v9 = -[CLTrackingAvoidanceZoneMonitor init](&v16, "init");
  if (v9)
  {
    sub_1010DDBC0(__p, (char *)[a3 UTF8String]);
    v10 = operator new(0x58uLL);
    sub_100FAE368(v10, __p, var0, var1, var2, var3);
    v9->wrappedAvengerZoneMonitor = v10;
    v11 = (NSString *)[a3 copy];
    v9->_timeZone = v11;
    v9->_isInZone = 0;
    if (v9->wrappedAvengerZoneMonitor) {
      BOOL v12 = v11 == 0LL;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12)
    {

      v9 = 0LL;
    }

    if (v15 < 0) {
      operator delete(__p[0]);
    }
  }

  return v9;
}

- (BOOL)_updateLocation:(id)a3
{
  if (!a3) {
    return 0;
  }
  location = self->_location;
  if (location)
  {
    if (location == a3
      || (id)-[NSDate compare:]( -[CLLocation timestamp](location, "timestamp"),  "compare:",  [a3 timestamp]) == (id)1)
    {
      return 0;
    }
  }

  self->_location = (CLLocation *)a3;
  return 1;
}

- (BOOL)onLocationUpdate:(id)a3
{
  BOOL v5 = -[CLTrackingAvoidanceZoneMonitor _updateLocation:](self, "_updateLocation:");
  if (v5)
  {
    wrappedAvengerZoneMonitor = self->wrappedAvengerZoneMonitor;
    [a3 coordinate];
    *(void *)buf = v7;
    *(void *)v22 = v8;
    [a3 coordinate];
    v19[1] = v9;
    uint64_t v20 = v10;
    [a3 horizontalAccuracy];
    v19[0] = v11;
    char v18 = 1;
    int v12 = sub_100FAE7F8((uint64_t)wrappedAvengerZoneMonitor, (double *)buf, (double *)&v20, v19, &v18);
    if (self->_isInZone == v12)
    {
      LOBYTE(v5) = 0;
    }

    else
    {
      BOOL v13 = v12;
      if (qword_101934900 != -1) {
        dispatch_once(&qword_101934900, &stru_101890688);
      }
      v14 = (os_log_s *)qword_101934908;
      if (os_log_type_enabled((os_log_t)qword_101934908, OS_LOG_TYPE_DEBUG))
      {
        char v15 = -[NSString UTF8String](self->_timeZone, "UTF8String");
        BOOL isInZone = self->_isInZone;
        *(_DWORD *)buf = 68289794;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)v22 = 2082;
        *(void *)&v22[2] = "";
        __int16 v23 = 2082;
        v24 = v15;
        __int16 v25 = 1026;
        BOOL v26 = isInZone;
        __int16 v27 = 1026;
        BOOL v28 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#ZoneMonitor changed classfication, timeZone:%{public, location:escape_only}s,  oldIsInZone:%{public}hhd, newIsInZone:%{public}hhd}",  buf,  0x28u);
      }

      self->_BOOL isInZone = v13;
      LOBYTE(v5) = 1;
    }
  }

  return v5;
}

- (BOOL)locationIsInZoneWithLatitude:(double)a3 longitude:(double)a4 horizontalAccuracy:(double)a5
{
  double v10 = a3;
  double v8 = a5;
  double v9 = a4;
  wrappedAvengerZoneMonitor = self->wrappedAvengerZoneMonitor;
  char v7 = 1;
  return sub_100FAE7F8((uint64_t)wrappedAvengerZoneMonitor, &v10, &v9, &v8, &v7);
}

- (void)dealloc
{
  self->_timeZone = 0LL;
  self->_location = 0LL;
  wrappedAvengerZoneMonitor = self->wrappedAvengerZoneMonitor;
  if (wrappedAvengerZoneMonitor) {
    (*(void (**)(void *))(*(void *)wrappedAvengerZoneMonitor + 8LL))(wrappedAvengerZoneMonitor);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CLTrackingAvoidanceZoneMonitor;
  -[CLTrackingAvoidanceZoneMonitor dealloc](&v4, "dealloc");
}

- (CLLocation)location
{
  return self->_location;
}

- (NSString)timeZone
{
  return self->_timeZone;
}

- (BOOL)isInZone
{
  return self->_isInZone;
}

@end