@interface NPWaldoLocationManager
- (BOOL)exceededLocationTTL;
- (BOOL)shouldCheckLocation;
- (BOOL)sortEdgesByDistanceWithNewLocation:(id)a3 checkOnly:(BOOL)a4;
- (CLLocation)latestGeohashLocation;
- (CLLocation)latestLocation;
- (NPWaldo)waldoInfo;
- (NPWaldoLocationManager)initWithWaldo:(id)a3;
- (double)dislocation;
- (id)copyCurrentGeohash;
- (id)copyCurrentGeohashFromServer;
- (id)locationCompletionHandler;
- (void)handleNewLocation:(id)a3;
- (void)setCurrentGeohash:(id)a3;
- (void)setCurrentLatitude:(double)a3 longitude:(double)a4 timestamp:(id)a5;
- (void)setLatestGeohashLocation:(id)a3;
- (void)setLatestLocation:(id)a3;
- (void)setLocationCompletionHandler:(id)a3;
- (void)setWaldoInfo:(id)a3;
- (void)sortEdgesByDistanceWithCompletionHandler:(id)a3;
@end

@implementation NPWaldoLocationManager

- (NPWaldoLocationManager)initWithWaldo:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NPWaldoLocationManager;
  v5 = -[NPWaldoLocationManager init](&v8, "init");
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_waldoInfo, v4);
  }

  return v6;
}

- (BOOL)shouldCheckLocation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 locationExpiration]);

    if (v5)
    {
      uint64_t v9 = nplog_obj(v6, v7, v8);
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v60) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Location expiration set, should check location",  (uint8_t *)&v60,  2u);
      }

      goto LABEL_24;
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 useGeohashFromServer]);

    if (!v13
      || (v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager latestGeohashLocation](self, "latestGeohashLocation"))) == 0LL)
    {
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager latestLocation](self, "latestLocation"));
      if (!v10) {
        goto LABEL_13;
      }
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s timestamp](v10, "timestamp"));
    [v14 timeIntervalSinceNow];
    double v16 = fabs(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 locationCheckInterval]);
    [v18 doubleValue];
    double v20 = v19;

    if (v16 > v20) {
      goto LABEL_13;
    }
    BOOL v21 = -[NPWaldoLocationManager sortEdgesByDistanceWithNewLocation:checkOnly:]( self,  "sortEdgesByDistanceWithNewLocation:checkOnly:",  v10,  1LL);
    if (v21)
    {
      uint64_t v24 = nplog_obj(v21, v22, v23);
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v60) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Current location might have moved substantially, should check location",  (uint8_t *)&v60,  2u);
      }
    }

    else
    {
LABEL_13:
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
      uint64_t v27 = objc_claimAutoreleasedReturnValue([v26 locationCheckTimestamp]);
      if (v27)
      {
        v28 = (void *)v27;
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
        v30 = (void *)objc_claimAutoreleasedReturnValue([v29 locationCheckTimestamp]);
        [v30 timeIntervalSinceNow];
        double v32 = fabs(v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
        v34 = (void *)objc_claimAutoreleasedReturnValue([v33 locationCheckInterval]);
        [v34 doubleValue];
        double v36 = v35;

        if (v32 <= v36)
        {
          uint64_t v40 = nplog_obj(v37, v38, v39);
          v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          {
            v57 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
            v58 = (void *)objc_claimAutoreleasedReturnValue([v57 locationCheckTimestamp]);
            [v58 timeIntervalSinceNow];
            int v60 = 134217984;
            double v61 = fabs(v59);
            _os_log_debug_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEBUG,  "Last location check was %f seconds ago, do not check location",  (uint8_t *)&v60,  0xCu);
          }

          BOOL v11 = 0;
          goto LABEL_25;
        }
      }

      else
      {
      }

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
      v43 = (void *)objc_claimAutoreleasedReturnValue([v42 locationCheckTimestamp]);

      if (!v43) {
        goto LABEL_23;
      }
      uint64_t v47 = nplog_obj(v44, v45, v46);
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
        v49 = (void *)objc_claimAutoreleasedReturnValue([v48 locationCheckTimestamp]);
        [v49 timeIntervalSinceNow];
        double v51 = fabs(v50);
        v52 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
        v53 = (void *)objc_claimAutoreleasedReturnValue([v52 locationCheckInterval]);
        int v60 = 134218242;
        double v61 = v51;
        __int16 v62 = 2112;
        v63 = v53;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Last location check was %f seconds ago (interval is %@), should check location",  (uint8_t *)&v60,  0x16u);
      }
    }

LABEL_23:
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
    [v55 setLocationCheckTimestamp:v54];

LABEL_24:
    BOOL v11 = 1;
LABEL_25:

    return v11;
  }

  return 0;
}

- (void)handleNewLocation:(id)a3
{
  if (!-[NPWaldoLocationManager sortEdgesByDistanceWithNewLocation:checkOnly:]( self,  "sortEdgesByDistanceWithNewLocation:checkOnly:",  a3,  1LL))
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
    [v4 setLocationExpiration:0];
  }

- (void)setCurrentLatitude:(double)a3 longitude:(double)a4 timestamp:(id)a5
{
  id v8 = a5;
  uint64_t v9 = objc_alloc(&OBJC_CLASS___CLLocation);
  CLLocationCoordinate2D v10 = CLLocationCoordinate2DMake(a3, a4);
  BOOL v11 = -[CLLocation initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:]( v9,  "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:",  v8,  v10.latitude,  v10.longitude,  0.0,  0.0,  -1.0);

  -[NPWaldoLocationManager setLatestLocation:](self, "setLatestLocation:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
  uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 useGeohashFromServer]);
  if (!v13)
  {

    goto LABEL_5;
  }

  v14 = (void *)v13;
  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager latestGeohashLocation](self, "latestGeohashLocation"));

  if (!v15)
  {
LABEL_5:
    id v16 = (id)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager latestLocation](self, "latestLocation"));
    -[NPWaldoLocationManager handleNewLocation:](self, "handleNewLocation:", v16);
  }

- (void)setCurrentGeohash:(id)a3
{
  if (a3)
  {
    double v10 = 0.0;
    double v11 = 0.0;
    if (geohashToLatitudeLongitude(a3, &v11, &v10))
    {
      id v4 = objc_alloc(&OBJC_CLASS___CLLocation);
      v5 = -[CLLocation initWithLatitude:longitude:](v4, "initWithLatitude:longitude:", v11, v10);
      -[NPWaldoLocationManager setLatestGeohashLocation:](self, "setLatestGeohashLocation:", v5);
    }

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 useGeohashFromServer]);
    if (v7)
    {
      id v8 = (void *)v7;
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager latestGeohashLocation](self, "latestGeohashLocation"));

      if (!v9) {
        return;
      }
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager latestGeohashLocation](self, "latestGeohashLocation"));
      -[NPWaldoLocationManager handleNewLocation:](self, "handleNewLocation:", v6);
    }
  }

- (BOOL)sortEdgesByDistanceWithNewLocation:(id)a3 checkOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));

  if (!v7)
  {
    uint64_t v30 = nplog_obj(v8, v9, v10);
    double v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Failed to sort edges with location, no waldoInfo",  buf,  2u);
    }

    goto LABEL_37;
  }

  double v11 = (CLLocation *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[CLLocation cachedLocation](v11, "cachedLocation"));
  if (!v12)
  {
    double v19 = self;
    double v28 = 0.0;
    char v29 = 1;
    goto LABEL_8;
  }

  uint64_t v13 = (void *)v12;
  BOOL v124 = v4;
  v14 = objc_alloc(&OBJC_CLASS___CLLocation);
  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 cachedLocation]);
  [v16 latitude];
  double v18 = v17;
  double v19 = self;
  double v20 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
  BOOL v21 = (void *)objc_claimAutoreleasedReturnValue([v20 cachedLocation]);
  [v21 longtitude];
  uint64_t v23 = -[CLLocation initWithLatitude:longitude:](v14, "initWithLatitude:longitude:", v18, v22);

  if (v23)
  {
    -[CLLocation distanceFromLocation:](v23, "distanceFromLocation:", v6);
    double v28 = v27;
    char v29 = 0;
    double v11 = v23;
    BOOL v4 = v124;
LABEL_8:

    goto LABEL_10;
  }

  double v28 = 0.0;
  char v29 = 1;
  BOOL v4 = v124;
LABEL_10:
  uint64_t v32 = nplog_obj(v24, v25, v26);
  v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    double v132 = v28;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEBUG,  "Moved %f meters since last location",  buf,  0xCu);
  }

  if ((v29 & 1) == 0)
  {
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](v19, "waldoInfo"));
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v37 locationToleranceDistance]);
    [v38 doubleValue];
    double v40 = v39;

    if (v28 <= v40)
    {
      v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      v90 = v19;
      v91 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](v19, "waldoInfo"));
      v92 = (void *)objc_claimAutoreleasedReturnValue([v91 cachedLocation]);
      [v92 setTimestamp:v89];

      uint64_t v96 = nplog_obj(v93, v94, v95);
      double v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v96);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        v121 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](v90, "waldoInfo"));
        v122 = (void *)objc_claimAutoreleasedReturnValue([v121 locationToleranceDistance]);
        *(_DWORD *)buf = 134218242;
        double v132 = v28;
        __int16 v133 = 2112;
        v134 = v122;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEBUG,  "Location change (%f meters) is within tolerance (%@ meters), no need to re-sort edges",  buf,  0x16u);
      }

- (BOOL)exceededLocationTTL
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 cachedLocation]);

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 locationExpiration]);

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
    uint64_t v8 = v7;
    if (v6)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 currentNetworkLastUsed]);

      uint64_t v13 = nplog_obj(v10, v11, v12);
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        double v59 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
        int v60 = (void *)objc_claimAutoreleasedReturnValue([v59 locationExpiration]);
        int v68 = 138412546;
        double v69 = *(double *)&v9;
        __int16 v70 = 2112;
        v71 = v60;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "Network last used %@, location expiration %@",  (uint8_t *)&v68,  0x16u);
      }

      if (v9)
      {
        double v15 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 locationExpiration]);
        id v17 = [v9 compare:v16];

        if (v17 == (id)1)
        {
          uint64_t v21 = nplog_obj(v18, v19, v20);
          double v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v68) = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Location expiration date passed, invalidate cached location",  (uint8_t *)&v68,  2u);
          }

          BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
          [v4 setCachedLocation:0];

          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
          [v23 setLocationExpiration:0];

          LOBYTE(v4) = 1;
          goto LABEL_20;
        }
      }

- (void)sortEdgesByDistanceWithCompletionHandler:(id)a3
{
  BOOL v4 = (void (**)(id, void))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));

  if (!v5)
  {
    uint64_t v28 = nplog_obj(v6, v7, v8);
    double v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v32) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Failed to sort edges with completionHandler, no waldoInfo",  (uint8_t *)&v32,  2u);
    }

    v4[2](v4, 0LL);
    goto LABEL_19;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 useGeohashFromServer]);

  if (!v10
    || (uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager latestGeohashLocation](self, "latestGeohashLocation"))) == 0LL)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager latestLocation](self, "latestLocation"));
    if (!v11)
    {
      uint64_t v30 = nplog_obj(0LL, v12, v13);
      double v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v32) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Not allowed to get current location",  (uint8_t *)&v32,  2u);
      }

      ((void (**)(id, BOOL))v4)[2]( v4,  -[NPWaldoLocationManager exceededLocationTTL](self, "exceededLocationTTL"));
LABEL_19:
      uint64_t v11 = 0LL;
      goto LABEL_20;
    }
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v11 timestamp]);
  [v14 timeIntervalSinceNow];
  double v16 = fabs(v15);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager waldoInfo](self, "waldoInfo"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 locationCheckInterval]);
  [v18 doubleValue];
  double v20 = v19;

  uint64_t v24 = nplog_obj(v21, v22, v23);
  uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  uint64_t v26 = v25;
  if (v16 > v20)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v32) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Current location is too old",  (uint8_t *)&v32,  2u);
    }

    BOOL v27 = -[NPWaldoLocationManager exceededLocationTTL](self, "exceededLocationTTL");
LABEL_15:
    v4[2](v4, v27);
    goto LABEL_20;
  }

  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    int v32 = 138412290;
    double v33 = v11;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "Valid current location %@",  (uint8_t *)&v32,  0xCu);
  }

  BOOL v27 = -[NPWaldoLocationManager sortEdgesByDistanceWithNewLocation:checkOnly:]( self,  "sortEdgesByDistanceWithNewLocation:checkOnly:",  v11,  0LL);
  if (v4) {
    goto LABEL_15;
  }
LABEL_20:
}

- (id)copyCurrentGeohash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager latestLocation](self, "latestLocation"));
  v3 = v2;
  if (v2)
  {
    [v2 coordinate];
    double v5 = v4;
    [v3 coordinate];
    uint64_t v6 = latitudeLongitudeToGeohash(3LL, v5);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  return v7;
}

- (id)copyCurrentGeohashFromServer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager latestGeohashLocation](self, "latestGeohashLocation"));

  if (!v3) {
    return 0LL;
  }
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager latestGeohashLocation](self, "latestGeohashLocation"));
  [v4 coordinate];
  double v6 = v5;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager latestGeohashLocation](self, "latestGeohashLocation"));
  [v7 coordinate];
  uint64_t v8 = latitudeLongitudeToGeohash(3LL, v6);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (double)dislocation
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager latestLocation](self, "latestLocation"));
  if (!v3) {
    return -1.0;
  }
  double v4 = (void *)v3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager latestGeohashLocation](self, "latestGeohashLocation"));

  if (!v5) {
    return -1.0;
  }
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager latestLocation](self, "latestLocation"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NPWaldoLocationManager latestGeohashLocation](self, "latestGeohashLocation"));
  [v6 distanceFromLocation:v7];
  double v9 = v8;

  return v9;
}

- (NPWaldo)waldoInfo
{
  return (NPWaldo *)objc_loadWeakRetained((id *)&self->_waldoInfo);
}

- (void)setWaldoInfo:(id)a3
{
}

- (CLLocation)latestLocation
{
  return (CLLocation *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setLatestLocation:(id)a3
{
}

- (CLLocation)latestGeohashLocation
{
  return (CLLocation *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setLatestGeohashLocation:(id)a3
{
}

- (id)locationCompletionHandler
{
  return objc_getProperty(self, a2, 32LL, 1);
}

- (void)setLocationCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end