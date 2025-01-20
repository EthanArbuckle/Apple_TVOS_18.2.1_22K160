@interface SPLocationManager
- (SPLocationManager)initWithQueue:(id)a3;
- (id)locationCategoryChangedHandler;
- (unsigned)_getLocationCategoryFromGEOPOI:(id)a3;
- (unsigned)_getLocationCategoryFromRTLocationOfInterestType:(int64_t)a3;
- (void)_requestPlaceInference;
- (void)_startMonitoringVisits;
- (void)_startPollingForLocationCategory;
- (void)_stopMonitoringVisits;
- (void)_stopPollingForLocationCategory;
- (void)_updateLocationCategory:(unsigned __int8)a3;
- (void)_updateLocationCategoryWithBestPlaceInferenceIdentifier:(id)a3;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didVisit:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)setLocationCategoryChangedHandler:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation SPLocationManager

- (SPLocationManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SPLocationManager;
  v6 = -[SPLocationManager init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);
  }

  return v7;
}

- (void)start
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004C9C;
  block[3] = &unk_10000C2E0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)stop
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004DC4;
  block[3] = &unk_10000C2E0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (unsigned)_getLocationCategoryFromRTLocationOfInterestType:(int64_t)a3
{
  else {
    unsigned __int8 v4 = 0;
  }
  if (dword_100011C00 <= 30 && (dword_100011C00 != -1 || _LogCategory_Initialize(&dword_100011C00, 30LL)))
  {
    if (v4 > 4u) {
      id v5 = @"?";
    }
    else {
      id v5 = *(&off_10000C3B8 + (char)v4);
    }
    LogPrintF( &dword_100011C00,  "-[SPLocationManager _getLocationCategoryFromRTLocationOfInterestType:]",  30LL,  "Retrieved category: %@ from RTLocationOfInterestType: %d",  v5,  a3);
  }

  return v4;
}

- (unsigned)_getLocationCategoryFromGEOPOI:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = (void *)GEOPOICategorySchool;
  id v5 = v3;
  id v6 = v4;
  if (v6 == v5)
  {

    goto LABEL_6;
  }

  v7 = v6;
  if ((v5 == 0LL) == (v6 != 0LL))
  {

    goto LABEL_8;
  }

  unsigned __int8 v8 = [v5 isEqual:v6];

  if ((v8 & 1) != 0)
  {
LABEL_6:
    unsigned int v9 = 3;
    goto LABEL_51;
  }

- (void)_requestPlaceInference
{
  if ((objc_opt_respondsToSelector(self->_locationManager, "_fetchPlaceInferencesWithFidelityPolicy:handler:") & 1) != 0)
  {
    if (dword_100011C00 <= 30
      && (dword_100011C00 != -1 || _LogCategory_Initialize(&dword_100011C00, 30LL)))
    {
      LogPrintF( &dword_100011C00,  "-[SPLocationManager _requestPlaceInference]",  30LL,  "Fetching PlaceInferences from LocationManager");
    }

    locationManager = self->_locationManager;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_1000053D8;
    v4[3] = &unk_10000C320;
    v4[4] = self;
    -[CLLocationManager _fetchPlaceInferencesWithFidelityPolicy:handler:]( locationManager,  "_fetchPlaceInferencesWithFidelityPolicy:handler:",  0LL,  v4);
  }

  else if (dword_100011C00 <= 90 {
         && (dword_100011C00 != -1 || _LogCategory_Initialize(&dword_100011C00, 90LL)))
  }
  {
    LogPrintF( &dword_100011C00,  "-[SPLocationManager _requestPlaceInference]",  90LL,  "Invalid selector _fetchPlaceInferencesWithFidelityPolicy");
  }

- (void)_startMonitoringVisits
{
  if (!self->_monitoringVisits)
  {
    if (dword_100011C00 <= 30
      && (dword_100011C00 != -1 || _LogCategory_Initialize(&dword_100011C00, 30LL)))
    {
      LogPrintF(&dword_100011C00, "-[SPLocationManager _startMonitoringVisits]", 30LL, "Starting VisitMonitoring");
    }

    self->_monitoringVisits = 1;
    -[CLLocationManager startMonitoringVisits](self->_locationManager, "startMonitoringVisits");
  }

- (void)_startPollingForLocationCategory
{
  if (!self->_pollingLocation)
  {
    if (dword_100011C00 <= 30
      && (dword_100011C00 != -1 || _LogCategory_Initialize(&dword_100011C00, 30LL)))
    {
      LogPrintF( &dword_100011C00,  "-[SPLocationManager _startPollingForLocationCategory]",  30LL,  "Start polling location category");
    }

    self->_pollingLocation = 1;
    if (!self->_locationQueryExitTimer)
    {
      id v3 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
      dispatch_time_t v4 = dispatch_time(0LL, 1200000000000LL);
      dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0LL);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_100005734;
      handler[3] = &unk_10000C2E0;
      handler[4] = self;
      dispatch_source_set_event_handler(v3, handler);
      locationQueryExitTimer = self->_locationQueryExitTimer;
      self->_locationQueryExitTimer = (OS_dispatch_source *)v3;
      id v6 = v3;

      dispatch_resume(v6);
    }

    if (!self->_locationQueryTimer)
    {
      v7 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
      dispatch_time_t v8 = dispatch_time(0LL, 0LL);
      dispatch_source_set_timer(v7, v8, 0x1BF08EB000uLL, 0LL);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_1000057C8;
      v11[3] = &unk_10000C2E0;
      v11[4] = self;
      dispatch_source_set_event_handler(v7, v11);
      locationQueryTimer = self->_locationQueryTimer;
      self->_locationQueryTimer = (OS_dispatch_source *)v7;
      v10 = v7;

      dispatch_resume((dispatch_object_t)self->_locationQueryTimer);
    }
  }

- (void)_stopMonitoringVisits
{
  if (self->_monitoringVisits)
  {
    if (dword_100011C00 <= 30
      && (dword_100011C00 != -1 || _LogCategory_Initialize(&dword_100011C00, 30LL)))
    {
      LogPrintF(&dword_100011C00, "-[SPLocationManager _stopMonitoringVisits]", 30LL, "Stopping VisitMonitoring");
    }

    -[CLLocationManager stopMonitoringVisits](self->_locationManager, "stopMonitoringVisits");
    self->_monitoringVisits = 0;
  }

- (void)_stopPollingForLocationCategory
{
  if (self->_pollingLocation)
  {
    if (dword_100011C00 <= 30
      && (dword_100011C00 != -1 || _LogCategory_Initialize(&dword_100011C00, 30LL)))
    {
      LogPrintF( &dword_100011C00,  "-[SPLocationManager _stopPollingForLocationCategory]",  30LL,  "Stop polling location category");
    }

    locationQueryExitTimer = self->_locationQueryExitTimer;
    if (locationQueryExitTimer)
    {
      dispatch_time_t v4 = locationQueryExitTimer;
      dispatch_source_cancel(v4);
      id v5 = self->_locationQueryExitTimer;
      self->_locationQueryExitTimer = 0LL;
    }

    locationQueryTimer = self->_locationQueryTimer;
    if (locationQueryTimer)
    {
      v7 = locationQueryTimer;
      dispatch_source_cancel(v7);
      dispatch_time_t v8 = self->_locationQueryTimer;
      self->_locationQueryTimer = 0LL;
    }

    self->_pollingLocation = 0;
  }

- (void)_updateLocationCategory:(unsigned __int8)a3
{
  if (self->_currentLocationCategory != a3)
  {
    self->_currentLocationCategory = a3;
    locationCategoryChangedHandler = (void (**)(id, void))self->_locationCategoryChangedHandler;
    if (locationCategoryChangedHandler) {
      locationCategoryChangedHandler[2](locationCategoryChangedHandler, a3);
    }
  }

- (void)_updateLocationCategoryWithBestPlaceInferenceIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (dword_100011C00 <= 30
      && (dword_100011C00 != -1 || _LogCategory_Initialize(&dword_100011C00, 30LL)))
    {
      LogPrintF( &dword_100011C00,  "-[SPLocationManager _updateLocationCategoryWithBestPlaceInferenceIdentifier:]",  30LL,  "Fetching PlaceInferences from RTRoutineManager with UUID: %@",  v4);
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[RTRoutineManager defaultManager](&OBJC_CLASS___RTRoutineManager, "defaultManager"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100005CAC;
    v6[3] = &unk_10000C398;
    v6[4] = self;
    [v5 fetchLocationOfInterestWithIdentifier:v4 withHandler:v6];
  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  unsigned int v4 = [a3 authorizationStatus];
  if (dword_100011C00 <= 30 && (dword_100011C00 != -1 || _LogCategory_Initialize(&dword_100011C00, 30LL))) {
    LogPrintF( &dword_100011C00,  "-[SPLocationManager locationManagerDidChangeAuthorization:]",  30LL,  "locationManager did change authorization status %d",  v4);
  }
  if (v4 >= 3)
  {
    if (v4 - 3 <= 1) {
      -[SPLocationManager _startMonitoringVisits](self, "_startMonitoringVisits");
    }
  }

  else
  {
    -[SPLocationManager _stopMonitoringVisits](self, "_stopMonitoringVisits");
  }

  self->_authorizationStatus = v4;
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v7 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
  if ([v5 isEqualToString:kCLErrorDomain])
  {
    id v6 = [v7 code];

    if (!v6)
    {
      -[SPLocationManager _stopPollingForLocationCategory](self, "_stopPollingForLocationCategory");
      goto LABEL_9;
    }
  }

  else
  {
  }

  if (dword_100011C00 <= 90 && (dword_100011C00 != -1 || _LogCategory_Initialize(&dword_100011C00, 90LL))) {
    LogPrintF( &dword_100011C00,  "-[SPLocationManager locationManager:didFailWithError:]",  90LL,  "locationManager didFailWithError %@",  v7);
  }
LABEL_9:
}

- (void)locationManager:(id)a3 didVisit:(id)a4
{
  id v10 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v10 _placeInference]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 _loiIdentifier]);

  if (v6)
  {
    if (dword_100011C00 <= 30
      && (dword_100011C00 != -1 || _LogCategory_Initialize(&dword_100011C00, 30LL)))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v10 arrivalDate]);
      LogPrintF( &dword_100011C00,  "-[SPLocationManager locationManager:didVisit:]",  30LL,  "locationManager received visit entry with arrival date %@",  v7);
    }

    dispatch_time_t v8 = (void *)objc_claimAutoreleasedReturnValue([v10 _placeInference]);
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 _loiIdentifier]);
    -[SPLocationManager _updateLocationCategoryWithBestPlaceInferenceIdentifier:]( self,  "_updateLocationCategoryWithBestPlaceInferenceIdentifier:",  v9);
  }

  else
  {
    if (dword_100011C00 <= 30
      && (dword_100011C00 != -1 || _LogCategory_Initialize(&dword_100011C00, 30LL)))
    {
      LogPrintF( &dword_100011C00,  "-[SPLocationManager locationManager:didVisit:]",  30LL,  "locationManager received novel visit entry, start polling");
    }

    -[SPLocationManager _startPollingForLocationCategory](self, "_startPollingForLocationCategory");
  }
}

- (id)locationCategoryChangedHandler
{
  return self->_locationCategoryChangedHandler;
}

- (void)setLocationCategoryChangedHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end