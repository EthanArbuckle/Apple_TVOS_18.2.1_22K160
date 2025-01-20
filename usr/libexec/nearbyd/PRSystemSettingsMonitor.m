@interface PRSystemSettingsMonitor
- (BOOL)monitoring;
- (BOOL)startMonitoring;
- (NSNumber)airplaneModeStatusInternal;
- (PRSystemSettingsMonitor)initWithQueue:(id)a3;
- (__SCPreferences)radioPrefs;
- (id)airplaneModeChangedHandler;
- (unint64_t)airplaneModeStatus;
- (void)airplaneModeStatusChanged;
- (void)dealloc;
- (void)fetchAndUpdateAirplaneModeStatus;
- (void)initRadioSCPreferencesRef;
- (void)setAirplaneModeChangedHandler:(id)a3;
- (void)setAirplaneModeStatusInternal:(id)a3;
- (void)setMonitoring:(BOOL)a3;
- (void)setRadioPrefs:(__SCPreferences *)a3;
@end

@implementation PRSystemSettingsMonitor

- (PRSystemSettingsMonitor)initWithQueue:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PRSystemSettingsMonitor;
  v6 = -[PRSystemSettingsMonitor init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    airplaneModeStatusInternal = v7->_airplaneModeStatusInternal;
    v7->_airplaneModeStatusInternal = 0LL;

    v7->_radioPrefs = 0LL;
    v7->_monitoring = 0;
  }

  return v7;
}

- (void)dealloc
{
  radioPrefs = self->_radioPrefs;
  if (radioPrefs) {
    CFRelease(radioPrefs);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PRSystemSettingsMonitor;
  -[PRSystemSettingsMonitor dealloc](&v4, "dealloc");
}

- (void)initRadioSCPreferencesRef
{
  if (!self->_radioPrefs)
  {
    v3 = SCPreferencesCreate( kCFAllocatorDefault,  @"com.apple.WirelessRadioManager:registerForAirplaneModeNotifications",  @"com.apple.radios.plist");
    self->_radioPrefs = v3;
    if (!v3 && os_log_type_enabled((os_log_t)qword_1007FC188, OS_LOG_TYPE_ERROR)) {
      sub_1003A2840();
    }
  }

- (BOOL)startMonitoring
{
  if (self->_monitoring) {
    return 1;
  }
  radioPrefs = self->_radioPrefs;
  if (!radioPrefs)
  {
    -[PRSystemSettingsMonitor initRadioSCPreferencesRef](self, "initRadioSCPreferencesRef");
    radioPrefs = self->_radioPrefs;
  }

  context.version = 0LL;
  context.info = self;
  memset(&context.retain, 0, 24);
  int v5 = SCPreferencesSetCallback(radioPrefs, (SCPreferencesCallBack)sub_100265180, &context);
  BOOL v2 = v5 != 0;
  if (v5)
  {
    -[PRSystemSettingsMonitor setAirplaneModeStatusInternal:](self, "setAirplaneModeStatusInternal:", 0LL);
    -[PRSystemSettingsMonitor fetchAndUpdateAirplaneModeStatus](self, "fetchAndUpdateAirplaneModeStatus");
    int v6 = SCPreferencesSetDispatchQueue(self->_radioPrefs, (dispatch_queue_t)self->_queue);
    v7 = (os_log_s *)qword_1007FC188;
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)qword_1007FC188, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "regulatory,ap,Airplane Mode notifications are successfully scheduled.",  buf,  2u);
      }

      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100265188;
      block[3] = &unk_1007A3000;
      block[4] = self;
      dispatch_async(queue, block);
    }

    else if (os_log_type_enabled((os_log_t)qword_1007FC188, OS_LOG_TYPE_ERROR))
    {
      sub_1003A286C();
    }

    self->_monitoring = 1;
  }

  else if (os_log_type_enabled((os_log_t)qword_1007FC188, OS_LOG_TYPE_ERROR))
  {
    sub_1003A2898();
  }

  return v2;
}

- (void)airplaneModeStatusChanged
{
  v3 = (os_log_s *)qword_1007FC188;
  if (os_log_type_enabled((os_log_t)qword_1007FC188, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "regulatory,ap,Airplane Mode changed notification.",  (uint8_t *)&v11,  2u);
  }

  -[PRSystemSettingsMonitor fetchAndUpdateAirplaneModeStatus](self, "fetchAndUpdateAirplaneModeStatus");
  objc_super v4 = self;
  objc_sync_enter(v4);
  id v5 = -[PRSystemSettingsMonitor airplaneModeStatus](v4, "airplaneModeStatus");
  int v6 = (void *)qword_1007FC188;
  if (os_log_type_enabled((os_log_t)qword_1007FC188, OS_LOG_TYPE_DEFAULT))
  {
    v7 = @"PRAirplaneModeOff";
    if (v5 == (id)1) {
      v7 = @"PRAirplaneModeOn";
    }
    if (!v5) {
      v7 = @"PRAirplaneModeStatusUnknown";
    }
    v8 = v7;
    int v11 = 138412290;
    v12 = v8;
    v9 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "regulatory,ap,Airplane Mode changed: %@",  (uint8_t *)&v11,  0xCu);
  }

  airplaneModeChangedHandler = (void (**)(id, id))v4->_airplaneModeChangedHandler;
  if (airplaneModeChangedHandler) {
    airplaneModeChangedHandler[2](airplaneModeChangedHandler, v5);
  }
  objc_sync_exit(v4);
}

- (void)fetchAndUpdateAirplaneModeStatus
{
  radioPrefs = self->_radioPrefs;
  if (radioPrefs)
  {
    SCPreferencesLock(radioPrefs, 1u);
    -[PRSystemSettingsMonitor setAirplaneModeStatusInternal:]( self,  "setAirplaneModeStatusInternal:",  SCPreferencesGetValue(self->_radioPrefs, @"AirplaneMode"));
    SCPreferencesUnlock(self->_radioPrefs);
  }

  else if (os_log_type_enabled((os_log_t)qword_1007FC188, OS_LOG_TYPE_ERROR))
  {
    sub_1003A28C4();
  }

- (unint64_t)airplaneModeStatus
{
  if (!self->_radioPrefs)
  {
    -[PRSystemSettingsMonitor initRadioSCPreferencesRef](self, "initRadioSCPreferencesRef");
    -[PRSystemSettingsMonitor fetchAndUpdateAirplaneModeStatus](self, "fetchAndUpdateAirplaneModeStatus");
  }

  unint64_t result = (unint64_t)self->_airplaneModeStatusInternal;
  if (result)
  {
    else {
      return 2LL;
    }
  }

  return result;
}

- (id)airplaneModeChangedHandler
{
  return objc_getProperty(self, a2, 24LL, 1);
}

- (void)setAirplaneModeChangedHandler:(id)a3
{
}

- (__SCPreferences)radioPrefs
{
  return self->_radioPrefs;
}

- (void)setRadioPrefs:(__SCPreferences *)a3
{
  self->_radioPrefs = a3;
}

- (NSNumber)airplaneModeStatusInternal
{
  return (NSNumber *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setAirplaneModeStatusInternal:(id)a3
{
}

- (BOOL)monitoring
{
  return self->_monitoring;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (void).cxx_destruct
{
}

@end