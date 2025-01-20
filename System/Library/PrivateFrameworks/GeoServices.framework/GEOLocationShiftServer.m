@interface GEOLocationShiftServer
+ (id)identifier;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (GEOLocationShiftServer)initWithDaemon:(id)a3;
- (void)fetchCachedFunctionWithRequest:(id)a3;
- (void)flushDiskCacheWithRequest:(id)a3;
- (void)functionVersionWithRequest:(id)a3;
- (void)isEnabledWithRequest:(id)a3;
- (void)isRequiredForCoordinateWithRequest:(id)a3;
- (void)isRequiredForRegionWithRequest:(id)a3;
- (void)listDiskCacheWithRequest:(id)a3;
- (void)pruneDiskCacheWithRequest:(id)a3;
- (void)shiftCoordinateWithRequest:(id)a3;
@end

@implementation GEOLocationShiftServer

+ (id)identifier
{
  return @"locationshift";
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = sub_100011D18(v10);
  BOOL v16 = 0;
  if (v13 <= 1573)
  {
    if (v13 > 1408)
    {
      if (v13 == 1409)
      {
        BOOL v16 = 1;
        if (sub_100012B28(v12, v11, @"locationshift", v10, &off_10005E538, 1LL))
        {
          uint64_t v50 = objc_opt_class(&OBJC_CLASS___GEOLocationShiftingFlushCacheRequest, v48, v49);
          id v51 = sub_100012270(@"locationshift", v10, v11, v50, v12);
          v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
          v20 = v52;
          BOOL v16 = v52 != 0LL;
          if (v52)
          {
            [v52 setSignpostId:a6];
            -[GEOLocationShiftServer flushDiskCacheWithRequest:](self, "flushDiskCacheWithRequest:", v20);
            goto LABEL_35;
          }

          goto LABEL_36;
        }
      }

      else if (v13 == 1417)
      {
        BOOL v16 = 1;
        if (sub_100012B28(v12, v11, @"locationshift", v10, &off_10005E520, 1LL))
        {
          uint64_t v31 = objc_opt_class(&OBJC_CLASS___GEOLocationShiftingPruneCacheRequest, v29, v30);
          id v32 = sub_100012270(@"locationshift", v10, v11, v31, v12);
          v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
          v20 = v33;
          BOOL v16 = v33 != 0LL;
          if (v33)
          {
            [v33 setSignpostId:a6];
            -[GEOLocationShiftServer pruneDiskCacheWithRequest:](self, "pruneDiskCacheWithRequest:", v20);
            goto LABEL_35;
          }

          goto LABEL_36;
        }
      }
    }

    else
    {
      if (v13 == 903)
      {
        uint64_t v42 = objc_opt_class(&OBJC_CLASS___GEOLocationShiftingEnabledRequest, v14, v15);
        id v43 = sub_100012270(@"locationshift", v10, v11, v42, v12);
        v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
        v20 = v44;
        BOOL v16 = v44 != 0LL;
        if (v44)
        {
          [v44 setSignpostId:a6];
          -[GEOLocationShiftServer isEnabledWithRequest:](self, "isEnabledWithRequest:", v20);
          goto LABEL_35;
        }

        goto LABEL_36;
      }

      if (v13 == 1307)
      {
        BOOL v16 = 1;
        if (sub_100012B28(v12, v11, @"locationshift", v10, &off_10005E550, 1LL))
        {
          uint64_t v23 = objc_opt_class(&OBJC_CLASS___GEOLocationShiftingListCacheRequest, v21, v22);
          id v24 = sub_100012270(@"locationshift", v10, v11, v23, v12);
          v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
          v20 = v25;
          BOOL v16 = v25 != 0LL;
          if (v25)
          {
            [v25 setSignpostId:a6];
            -[GEOLocationShiftServer listDiskCacheWithRequest:](self, "listDiskCacheWithRequest:", v20);
            goto LABEL_35;
          }

- (GEOLocationShiftServer)initWithDaemon:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___GEOLocationShiftServer;
  v3 = -[GEOLocationShiftServer initWithDaemon:](&v8, "initWithDaemon:", a3);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___GEOLocationShifter);
    shifter = v3->_shifter;
    v3->_shifter = v4;

    v6 = v3;
  }

  return v3;
}

- (void)shiftCoordinateWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [[GEOLocationShiftingFunctionResponse alloc] initWithRequest:v4];
  shifter = self->_shifter;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 latLng]);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v4 preferredAuditToken]);

  global_queue = (void *)geo_get_global_queue(25LL);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100019C90;
  v11[3] = &unk_100059A80;
  id v12 = v5;
  id v10 = v5;
  -[GEOLocationShifter _fetchShiftFunctionForLatLng:auditToken:callbackQueue:completionHandler:]( shifter,  "_fetchShiftFunctionForLatLng:auditToken:callbackQueue:completionHandler:",  v7,  v8,  global_queue,  v11);
}

- (void)fetchCachedFunctionWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [[GEOLocationShiftingCachedResponseFetchResponse alloc] initWithRequest:v4];
  shifter = self->_shifter;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 latLng]);

  uint64_t v8 = qos_class_self();
  global_queue = (void *)geo_get_global_queue(v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100019DC0;
  v11[3] = &unk_100059A80;
  id v12 = v5;
  id v10 = v5;
  -[GEOLocationShifter _fetchCachedShiftFunctionResponseForLocation:callbackQueue:completionHandler:]( shifter,  "_fetchCachedShiftFunctionResponseForLocation:callbackQueue:completionHandler:",  v7,  global_queue,  v11);
}

- (void)isEnabledWithRequest:(id)a3
{
  id v4 = a3;
  id v6 = [[GEOLocationShiftingEnabledResponse alloc] initWithRequest:v4];

  objc_msgSend(v6, "setEnabled:", objc_msgSend((id)objc_opt_class(self->_shifter, v5), "isLocationShiftEnabled"));
  [v6 send];
}

- (void)isRequiredForCoordinateWithRequest:(id)a3
{
  id v4 = a3;
  id v11 = [[GEOLocationShiftingIsRequiredResponse alloc] initWithRequest:v4];
  id v6 = (void *)objc_opt_class(self->_shifter, v5);
  [v4 coordinate];
  double v8 = v7;
  double v10 = v9;

  objc_msgSend(v11, "setRequired:", objc_msgSend(v6, "isLocationShiftRequiredForCoordinate:", v8, v10));
  [v11 send];
}

- (void)isRequiredForRegionWithRequest:(id)a3
{
  id v4 = a3;
  id v8 = [[GEOLocationShiftingIsRequiredResponse alloc] initWithRequest:v4];
  id v6 = (void *)objc_opt_class(self->_shifter, v5);
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v4 region]);

  objc_msgSend(v8, "setRequired:", objc_msgSend(v6, "isLocationShiftRequiredForRegion:", v7));
  [v8 send];
}

- (void)functionVersionWithRequest:(id)a3
{
  id v4 = a3;
  id v6 = [[GEOLocationShiftingVersionResponse alloc] initWithRequest:v4];

  objc_msgSend(v6, "setVersion:", objc_msgSend((id)objc_opt_class(self->_shifter, v5), "locationShiftFunctionVersion"));
  [v6 send];
}

- (void)pruneDiskCacheWithRequest:(id)a3
{
}

- (void)flushDiskCacheWithRequest:(id)a3
{
  v3 = (void *)objc_opt_class(self->_shifter, a2, a3);
  [v3 flushDiskCache];
}

- (void)listDiskCacheWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [[GEOLocationShiftingListCacheResponse alloc] initWithRequest:v4];

  uint64_t v6 = qos_class_self();
  global_queue = (dispatch_queue_s *)geo_get_global_queue(v6);
  id v8 = dispatch_group_create();
  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  shifter = self->_shifter;
  uint64_t v11 = qos_class_self();
  id v12 = (void *)geo_get_global_queue(v11);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10001A200;
  v19[3] = &unk_100059AA8;
  id v13 = v9;
  id v20 = v13;
  -[GEOLocationShifter getAllShiftEntries:queue:handler:](shifter, "getAllShiftEntries:queue:handler:", v8, v12, v19);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001A29C;
  block[3] = &unk_100059520;
  id v17 = v5;
  id v18 = v13;
  id v14 = v13;
  id v15 = v5;
  dispatch_group_notify(v8, global_queue, block);
}

- (void).cxx_destruct
{
}

@end