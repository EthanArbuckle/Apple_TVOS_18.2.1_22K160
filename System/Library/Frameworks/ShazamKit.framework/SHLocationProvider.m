@interface SHLocationProvider
+ (BOOL)isClientAuthorizedToRequestLocation:(id)a3 clientType:(int64_t)a4 authorizationStatus:(int)a5;
+ (NSMapTable)activeLocationProviders;
+ (OS_dispatch_queue)locationQueue;
+ (id)anonymizeCoordinatesPayloadForLocation:(id)a3 truncatingToDecimalPlaces:(signed __int16)a4;
+ (id)locationProviderForRequestIdentifier:(id)a3 clientType:(int64_t)a4;
- (CLLocation)location;
- (CLLocationManager)locationManager;
- (NSString)requestIdentifier;
- (NSUUID)taskID;
- (NSUUID)workerID;
- (SHLocationProvider)initWithRequestIdentifier:(id)a3;
- (SHWorkerDelegate)workerDelegate;
- (int64_t)executionScope;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)setWorkerDelegate:(id)a3;
- (void)shutdownWorker;
- (void)startUpdatingLocation;
- (void)stopUpdatingLocation;
@end

@implementation SHLocationProvider

+ (OS_dispatch_queue)locationQueue
{
  if (qword_1000889A0 != -1) {
    dispatch_once(&qword_1000889A0, &stru_10006D770);
  }
  return (OS_dispatch_queue *)(id)qword_100088998;
}

+ (NSMapTable)activeLocationProviders
{
  if (qword_1000889B0 != -1) {
    dispatch_once(&qword_1000889B0, &stru_10006D790);
  }
  return (NSMapTable *)(id)qword_1000889A8;
}

+ (id)locationProviderForRequestIdentifier:(id)a3 clientType:(int64_t)a4
{
  id v5 = a3;
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  v21 = sub_100027980;
  v22 = sub_100027990;
  id v23 = 0LL;
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[SHLocationProvider locationQueue](&OBJC_CLASS___SHLocationProvider, "locationQueue"));
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  v14 = sub_100027998;
  v15 = &unk_10006CC00;
  v17 = &v18;
  id v7 = v5;
  id v16 = v7;
  dispatch_sync(v6, &v12);

  v8 = (void *)v19[5];
  if (v8)
  {
    v9 = v8;
  }

  else
  {
    if (!+[SHLocationProvider isClientAuthorizedToRequestLocation:clientType:authorizationStatus:]( &OBJC_CLASS___SHLocationProvider,  "isClientAuthorizedToRequestLocation:clientType:authorizationStatus:",  @"com.apple.musicrecognition",  a4,  +[CLLocationManager authorizationStatusForBundleIdentifier:]( &OBJC_CLASS___CLLocationManager,  "authorizationStatusForBundleIdentifier:",  @"com.apple.musicrecognition",  v12,  v13,  v14,  v15)))
    {
      v10 = 0LL;
      goto LABEL_6;
    }

    v9 = -[SHLocationProvider initWithRequestIdentifier:]( objc_alloc(&OBJC_CLASS___SHLocationProvider),  "initWithRequestIdentifier:",  v7);
  }

  v10 = v9;
LABEL_6:

  _Block_object_dispose(&v18, 8);
  return v10;
}

- (SHLocationProvider)initWithRequestIdentifier:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SHLocationProvider;
  v6 = -[SHLocationProvider init](&v13, "init");
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_requestIdentifier, a3);
    v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[SHLocationProvider locationQueue](&OBJC_CLASS___SHLocationProvider, "locationQueue"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100027AD4;
    v10[3] = &unk_10006CE28;
    v11 = v7;
    id v12 = v5;
    dispatch_sync(v8, v10);
  }

  return v7;
}

+ (BOOL)isClientAuthorizedToRequestLocation:(id)a3 clientType:(int64_t)a4 authorizationStatus:(int)a5
{
  return a4 == 1 && a5 > 2;
}

- (void)startUpdatingLocation
{
  uint64_t v3 = sh_log_object(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLocationProvider requestIdentifier](self, "requestIdentifier"));
    int v7 = 138412290;
    v8 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "Fetching location for request %@",  (uint8_t *)&v7,  0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHLocationProvider locationManager](self, "locationManager"));
  [v6 startUpdatingLocation];
}

- (void)stopUpdatingLocation
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHLocationProvider locationManager](self, "locationManager"));
  [v3 stopUpdatingLocation];

  uint64_t v5 = sh_log_object(v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHLocationProvider requestIdentifier](self, "requestIdentifier"));
    int v8 = 138412290;
    v9 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "Stopped fetching location for request %@",  (uint8_t *)&v8,  0xCu);
  }
}

- (CLLocation)location
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHLocationProvider locationManager](self, "locationManager"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 location]);

  return (CLLocation *)v3;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = a3;
  uint64_t v6 = sh_log_object(v5);
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHLocationProvider requestIdentifier](self, "requestIdentifier"));
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "locationManager %@ didUpdateLocations for request %@",  (uint8_t *)&v9,  0x16u);
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sh_log_object(v7);
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHLocationProvider requestIdentifier](self, "requestIdentifier"));
    int v11 = 138412802;
    id v12 = v6;
    __int16 v13 = 2112;
    v14 = v10;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "Location manager %@ failed to update for request %@ with error %@",  (uint8_t *)&v11,  0x20u);
  }
}

+ (id)anonymizeCoordinatesPayloadForLocation:(id)a3 truncatingToDecimalPlaces:(signed __int16)a4
{
  uint64_t v4 = a4;
  id v5 = a3;
  id v6 = objc_alloc(&OBJC_CLASS___NSDecimalNumber);
  [v5 coordinate];
  id v7 = -[NSDecimalNumber initWithDouble:](v6, "initWithDouble:");
  uint64_t v8 = objc_alloc(&OBJC_CLASS___NSDecimalNumber);
  [v5 coordinate];
  double v10 = v9;

  int v11 = -[NSDecimalNumber initWithDouble:](v8, "initWithDouble:", v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:]( &OBJC_CLASS___NSDecimalNumberHandler,  "decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:",  0LL,  v4,  0LL,  0LL,  0LL,  0LL));
  v17[0] = @"latitude";
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSDecimalNumber decimalNumberByRoundingAccordingToBehavior:]( v7,  "decimalNumberByRoundingAccordingToBehavior:",  v12));
  v17[1] = @"longitude";
  v18[0] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSDecimalNumber decimalNumberByRoundingAccordingToBehavior:]( v11,  "decimalNumberByRoundingAccordingToBehavior:",  v12));
  v18[1] = v14;
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  2LL));

  return v15;
}

- (int64_t)executionScope
{
  return 0LL;
}

- (NSUUID)workerID
{
  workerID = self->_workerID;
  if (!workerID)
  {
    uint64_t v4 = (NSUUID *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v5 = self->_workerID;
    self->_workerID = v4;

    workerID = self->_workerID;
  }

  return workerID;
}

- (NSUUID)taskID
{
  taskID = self->_taskID;
  if (!taskID)
  {
    uint64_t v4 = (NSUUID *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v5 = self->_taskID;
    self->_taskID = v4;

    taskID = self->_taskID;
  }

  return taskID;
}

- (void)shutdownWorker
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SHLocationProvider workerDelegate](self, "workerDelegate"));
  [v3 finishedWorker:self];
}

- (SHWorkerDelegate)workerDelegate
{
  return (SHWorkerDelegate *)objc_loadWeakRetained((id *)&self->_workerDelegate);
}

- (void)setWorkerDelegate:(id)a3
{
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void).cxx_destruct
{
}

@end