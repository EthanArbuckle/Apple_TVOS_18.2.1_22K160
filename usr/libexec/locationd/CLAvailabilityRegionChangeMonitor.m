@interface CLAvailabilityRegionChangeMonitor
- (CLAvailabilityRegionChangeMonitor)initWithSilo:(id)a3 andMonitorRegion:(id)a4 andOnRegionChangedCallback:(id)a5;
- (CLDispatchSilo)silo;
- (NSString)lastCountryCode;
- (id)regionChangeCallback;
- (int)countryCodeNotificationToken;
- (void)dealloc;
- (void)onGeoCountryCodeChangeNotification:(int)a3 andMonitorRegion:(id)a4;
- (void)setCountryCodeNotificationToken:(int)a3;
- (void)setLastCountryCode:(id)a3;
- (void)setRegionChangeCallback:(id)a3;
- (void)setSilo:(id)a3;
- (void)stopMonitoring;
@end

@implementation CLAvailabilityRegionChangeMonitor

- (CLAvailabilityRegionChangeMonitor)initWithSilo:(id)a3 andMonitorRegion:(id)a4 andOnRegionChangedCallback:(id)a5
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___CLAvailabilityRegionChangeMonitor;
  v8 = -[CLAvailabilityRegionChangeMonitor init](&v20, "init");
  if (v8)
  {
    v8->_silo = (CLDispatchSilo *)a3;
    v8->_int countryCodeNotificationToken = -1;
    v8->_regionChangeCallback = [a5 copy];
    v8->_lastCountryCode = (NSString *)objc_msgSend( +[GEOCountryConfiguration sharedConfiguration]( GEOCountryConfiguration,  "sharedConfiguration"),  "countryCode");
    v9 = (const char *)GEOCountryConfigurationCountryCodeChangedDarwinNotification;
    v10 = (dispatch_queue_s *)-[CLDispatchSilo queue](v8->_silo, "queue");
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1007ECE30;
    handler[3] = &unk_101856CD0;
    handler[4] = v8;
    handler[5] = a4;
    notify_register_dispatch(v9, &v8->_countryCodeNotificationToken, v10, handler);
  }

  if (qword_101934830 != -1) {
    dispatch_once(&qword_101934830, &stru_101856CF0);
  }
  v11 = (os_log_s *)qword_101934838;
  if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEFAULT))
  {
    lastCountryCode = v8->_lastCountryCode;
    int countryCodeNotificationToken = v8->_countryCodeNotificationToken;
    *(_DWORD *)buf = 138478083;
    v26 = lastCountryCode;
    __int16 v27 = 1026;
    int v28 = countryCodeNotificationToken;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#availabilityregionmonitor, monitor initialize, country code, %{private}@, token, %{public}d",  buf,  0x12u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934830 != -1) {
      dispatch_once(&qword_101934830, &stru_101856CF0);
    }
    v15 = v8->_lastCountryCode;
    int v16 = v8->_countryCodeNotificationToken;
    int v21 = 138478083;
    v22 = v15;
    __int16 v23 = 1026;
    int v24 = v16;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934838,  0LL,  "#availabilityregionmonitor, monitor initialize, country code, %{private}@, token, %{public}d",  &v21,  18);
    v18 = (uint8_t *)v17;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLAvailabilityRegionChangeMonitor initWithSilo:andMonitorRegion:andOnRegionChangedCallback:]",  "%s\n",  v17);
    if (v18 != buf) {
      free(v18);
    }
  }

  return v8;
}

- (void)dealloc
{
  self->_silo = 0LL;
  self->_regionChangeCallback = 0LL;

  self->_lastCountryCode = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLAvailabilityRegionChangeMonitor;
  -[CLAvailabilityRegionChangeMonitor dealloc](&v3, "dealloc");
}

- (void)onGeoCountryCodeChangeNotification:(int)a3 andMonitorRegion:(id)a4
{
  id v7 = objc_msgSend( +[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"),  "countryCode");
  if (!a4) {
    goto LABEL_14;
  }
  if (-[NSString isEqualToString:]( -[CLAvailabilityRegionChangeMonitor lastCountryCode](self, "lastCountryCode"),  "isEqualToString:",  a4))
  {
    unsigned int v8 = 0;
  }

  else
  {
    unsigned int v8 = [v7 isEqualToString:a4];
  }

  if (-[NSString isEqualToString:]( -[CLAvailabilityRegionChangeMonitor lastCountryCode](self, "lastCountryCode"),  "isEqualToString:",  a4))
  {
    unsigned int v9 = [v7 isEqualToString:a4] ^ 1;
  }

  else
  {
    unsigned int v9 = 0;
  }

  if (qword_101934830 != -1) {
    dispatch_once(&qword_101934830, &stru_101856CF0);
  }
  v10 = (os_log_s *)qword_101934838;
  if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478851;
    v25 = -[CLAvailabilityRegionChangeMonitor lastCountryCode](self, "lastCountryCode");
    __int16 v26 = 2113;
    id v27 = v7;
    __int16 v28 = 1026;
    int v29 = a3;
    __int16 v30 = 1025;
    unsigned int v31 = v8;
    __int16 v32 = 1025;
    unsigned int v33 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "#availabilityregionmonitor, last, %{private}@, new, %{private}@, token, %{public}d, entered, %{private}d, exited, %{private}d",  buf,  0x28u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934830 != -1) {
      dispatch_once(&qword_101934830, &stru_101856CF0);
    }
    uint64_t v11 = qword_101934838;
    int v14 = 138478851;
    v15 = -[CLAvailabilityRegionChangeMonitor lastCountryCode](self, "lastCountryCode");
    __int16 v16 = 2113;
    id v17 = v7;
    __int16 v18 = 1026;
    int v19 = a3;
    __int16 v20 = 1025;
    unsigned int v21 = v8;
    __int16 v22 = 1025;
    unsigned int v23 = v9;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v11,  0LL,  "#availabilityregionmonitor, last, %{private}@, new, %{private}@, token, %{public}d, entered, %{private}d, exited, %{private}d",  &v14,  40);
    v13 = (uint8_t *)v12;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLAvailabilityRegionChangeMonitor onGeoCountryCodeChangeNotification:andMonitorRegion:]",  "%s\n",  v12);
    if (v13 != buf) {
      free(v13);
    }
  }

  if ((v8 | v9) == 1) {
LABEL_14:
  }
    (*((void (**)(void))-[CLAvailabilityRegionChangeMonitor regionChangeCallback](self, "regionChangeCallback") + 2))();
  -[CLAvailabilityRegionChangeMonitor setLastCountryCode:](self, "setLastCountryCode:", v7);
}

- (void)stopMonitoring
{
  int countryCodeNotificationToken = self->_countryCodeNotificationToken;
  if (countryCodeNotificationToken != -1) {
    notify_cancel(countryCodeNotificationToken);
  }
}

- (CLDispatchSilo)silo
{
  return self->_silo;
}

- (void)setSilo:(id)a3
{
}

- (id)regionChangeCallback
{
  return self->_regionChangeCallback;
}

- (void)setRegionChangeCallback:(id)a3
{
}

- (int)countryCodeNotificationToken
{
  return self->_countryCodeNotificationToken;
}

- (void)setCountryCodeNotificationToken:(int)a3
{
  self->_int countryCodeNotificationToken = a3;
}

- (NSString)lastCountryCode
{
  return self->_lastCountryCode;
}

- (void)setLastCountryCode:(id)a3
{
}

@end