@interface CLWPBridge
- (BOOL)startTrackingZone:(id)a3 forStates:(int64_t)a4 transitionHandler:(id)a5;
- (CLWPBridge)initWithQueue:(id)a3;
- (id)stateHandler;
- (id)updateHandler;
- (void)_didTransitionZoneWithData:(id)a3 trueMajor:(id)a4 trueMinor:(id)a5 state:(int64_t)a6;
- (void)dealloc;
- (void)deviceScannerDidUpdateState:(id)a3;
- (void)registerForStateUpdates:(id)a3;
- (void)scanner:(id)a3 didFailToRegisterDevices:(id)a4 withError:(id)a5;
- (void)scanner:(id)a3 foundDevice:(id)a4 withData:(id)a5;
- (void)setStateHandler:(id)a3;
- (void)setUpdateHandler:(id)a3;
- (void)startScanForBeaconTypes:(int64_t)a3 updateHandler:(id)a4;
- (void)stopScan;
- (void)stopTrackingZone:(id)a3;
- (void)stopTrackingZones;
- (void)unregisterForStateUpdates;
- (void)updateState;
- (void)zoneTracker:(id)a3 didFailToRegisterZones:(id)a4 withError:(id)a5;
- (void)zoneTracker:(id)a3 enteredZoneInfo:(id)a4;
- (void)zoneTracker:(id)a3 exitedZone:(id)a4;
- (void)zoneTrackerDidUpdateState:(id)a3;
@end

@implementation CLWPBridge

- (CLWPBridge)initWithQueue:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CLWPBridge;
  v4 = -[CLWPBridge init](&v7, "init");
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___NSRecursiveLock);
    v4->_instanceLock = v5;
    -[NSRecursiveLock setName:](v5, "setName:", @"com.apple.location.wpbridge");
    v4->_state = 0LL;
    v4->_scanner = -[WPDeviceScanner initWithDelegate:queue:]( objc_alloc(&OBJC_CLASS___WPDeviceScanner),  "initWithDelegate:queue:",  v4,  a3);
    v4->_zonesAndHandlers = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v4->_tracker = -[WPZoneTracker initWithDelegate:queue:]( objc_alloc(&OBJC_CLASS___WPZoneTracker),  "initWithDelegate:queue:",  v4,  a3);
  }

  return v4;
}

- (void)dealloc
{
  self->_tracker = 0LL;
  self->_zonesAndHandlers = 0LL;
  -[CLWPBridge setUpdateHandler:](self, "setUpdateHandler:", 0LL);
  -[WPDeviceScanner invalidate](self->_scanner, "invalidate");

  self->_scanner = 0LL;
  -[CLWPBridge setStateHandler:](self, "setStateHandler:", 0LL);
  -[NSRecursiveLock unlock](self->_instanceLock, "unlock");

  self->_instanceLock = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLWPBridge;
  -[CLWPBridge dealloc](&v3, "dealloc");
}

- (void)registerForStateUpdates:(id)a3
{
  if (-[CLWPBridge stateHandler](self, "stateHandler"))
  {
    v5 = -[CLWPBridge stateHandler](self, "stateHandler");
    v5[2](v5, self->_state);
  }

  -[NSRecursiveLock unlock](self->_instanceLock, "unlock");
}

- (void)unregisterForStateUpdates
{
}

- (void)startScanForBeaconTypes:(int64_t)a3 updateHandler:(id)a4
{
  char v5 = a3;
  -[NSRecursiveLock lock](self->_instanceLock, "lock");
  -[CLWPBridge setUpdateHandler:](self, "setUpdateHandler:", a4);
  id v7 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v8 = v7;
  if ((v5 & 1) != 0)
  {
    v9 = @"WPPuckCompany";
  }

  else
  {
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    v9 = @"WPPuckBeaconNoRanging";
  }

  [v7 addObject:v9];
LABEL_6:
  v10 = +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v8,  @"kPuckTypes",  0LL);
  if (qword_101934840 != -1) {
    dispatch_once(&qword_101934840, &stru_10188A9E0);
  }
  v11 = (os_log_s *)qword_101934848;
  if (os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    int v13 = 0;
    __int16 v14 = 2082;
    v15 = "";
    __int16 v16 = 2081;
    v17 = -[NSString UTF8String](-[NSDictionary description](v10, "description"), "UTF8String");
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:@iB: Scanner starting for beacons, matching:%{private, location:escape_only}s}",  buf,  0x1Cu);
  }

  -[WPDeviceScanner unregisterAllDeviceChanges](self->_scanner, "unregisterAllDeviceChanges");
  -[WPDeviceScanner registerForDevicesMatching:options:]( self->_scanner,  "registerForDevicesMatching:options:",  v10,  0LL);
  -[NSRecursiveLock unlock](self->_instanceLock, "unlock");
}

- (void)stopScan
{
  if (qword_101934840 != -1) {
    dispatch_once(&qword_101934840, &stru_10188A9E0);
  }
  objc_super v3 = (os_log_s *)qword_101934848;
  if (os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:@iB: Scanner stopping}",  (uint8_t *)v4,  0x12u);
  }

  -[CLWPBridge setUpdateHandler:](self, "setUpdateHandler:", 0LL);
  -[WPDeviceScanner unregisterAllDeviceChanges](self->_scanner, "unregisterAllDeviceChanges");
  -[NSRecursiveLock unlock](self->_instanceLock, "unlock");
}

- (void)deviceScannerDidUpdateState:(id)a3
{
}

- (void)scanner:(id)a3 foundDevice:(id)a4 withData:(id)a5
{
  id v7 = objc_msgSend(-[CLWPBridge updateHandler](self, "updateHandler"), "copy");
  if (v7)
  {
    id v8 = (void (**)(void, void, void))v7;
    uint64_t v16 = 0LL;
    v17 = &v16;
    uint64_t v18 = 0x2020000000LL;
    uint64_t v19 = 0LL;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100ECE1C0;
    v15[3] = &unk_10186E868;
    v15[4] = &v16;
    objc_msgSend(objc_msgSend(a5, "objectForKey:", @"kPuckTypes"), "enumerateObjectsUsingBlock:", v15);
    id v9 = [a5 objectForKey:@"kPuckID"];
    v10 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  v9,  @"beaconID",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v17[3]),  @"typeMask",  [a5 objectForKey:@"kPuckRSSI"],  @"rssi",  objc_msgSend(a5, "objectForKey:", @"kPuckTx"),  @"tx",  +[NSDate date](NSDate, "date"),  @"discovered",  objc_msgSend(a5, "objectForKey:", @"kPuckAdvertisingChannel"),  @"channel",  0);
    if ((v17[3] & 3) != 0)
    {
      id v11 = [a5 objectForKey:@"kPuckCompanyUUID"];
      if (v11) {
        -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v11, @"proximityUUID");
      }
      id v12 = [a5 objectForKey:@"kPuckCompanyMajor"];
      if (v12) {
        -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v12, @"major");
      }
      id v13 = [a5 objectForKey:@"kPuckCompanyMinor"];
      if (v13) {
        -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v13, @"minor");
      }
    }

    id v14 = [a5 objectForKey:@"kPuckConfig"];
    if (v14) {
      -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v14, @"config");
    }
    _Block_object_dispose(&v16, 8);
    -[NSRecursiveLock unlock](self->_instanceLock, "unlock");
    ((void (**)(void, NSMutableDictionary *, void))v8)[2](v8, v10, 0LL);
  }

  else
  {
    -[NSRecursiveLock unlock](self->_instanceLock, "unlock");
  }

- (void)scanner:(id)a3 didFailToRegisterDevices:(id)a4 withError:(id)a5
{
  id v7 = (void (**)(id, void, id))objc_msgSend(-[CLWPBridge updateHandler](self, "updateHandler"), "copy");
  -[NSRecursiveLock unlock](self->_instanceLock, "unlock");
  if (v7)
  {
    v7[2](v7, 0LL, a5);
  }

- (BOOL)startTrackingZone:(id)a3 forStates:(int64_t)a4 transitionHandler:(id)a5
{
  if (a4)
  {
    char v6 = a4;
    -[NSRecursiveLock lock](self->_instanceLock, "lock");
    if (a5)
    {
      id v9 = _Block_copy(a5);
      -[NSMutableDictionary setObject:forKey:](self->_zonesAndHandlers, "setObject:forKey:", v9, a3);
      _Block_release(v9);
    }

    id v10 = [a3 advertisementData];
    if (v10)
    {
      id v11 = +[NSMutableDictionary dictionaryWithObject:forKey:]( NSMutableDictionary,  "dictionaryWithObject:forKey:",  +[NSArray arrayWithObject:]( NSArray,  "arrayWithObject:",  [a3 advertisementData]),  @"ZTZonesArray");
      id v12 = v11;
      if ((v6 & 1) != 0) {
        id v13 = &__kCFBooleanTrue;
      }
      else {
        id v13 = &__kCFBooleanFalse;
      }
      -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v13, @"ZTZoneEntry");
      if ((v6 & 2) != 0) {
        id v14 = &__kCFBooleanTrue;
      }
      else {
        id v14 = &__kCFBooleanFalse;
      }
      -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v14, @"ZTZoneExit");
      if (qword_101934840 != -1) {
        dispatch_once(&qword_101934840, &stru_10188A9E0);
      }
      v15 = (os_log_s *)qword_101934848;
      if (os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_DEFAULT))
      {
        v17[0] = 68289283;
        v17[1] = 0;
        __int16 v18 = 2082;
        uint64_t v19 = "";
        __int16 v20 = 2081;
        id v21 = objc_msgSend(-[NSMutableDictionary description](v12, "description"), "UTF8String");
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:@iB: Tracker registering zone, zone:%{private, location:escape_only}s}",  (uint8_t *)v17,  0x1Cu);
      }

      -[WPZoneTracker registerForZoneChangesMatching:](self->_tracker, "registerForZoneChangesMatching:", v12);
      -[NSRecursiveLock unlock](self->_instanceLock, "unlock");
      LOBYTE(v10) = 1;
    }
  }

  else
  {
    LOBYTE(v10) = 0;
  }

  return (char)v10;
}

- (void)stopTrackingZone:(id)a3
{
  __int16 v5 = +[NSDictionary dictionaryWithObjectsAndKeys:]( NSDictionary,  "dictionaryWithObjectsAndKeys:",  +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", [a3 advertisementData]),  @"ZTZonesArray",  0);
  if (qword_101934840 != -1) {
    dispatch_once(&qword_101934840, &stru_10188A9E0);
  }
  char v6 = (os_log_s *)qword_101934848;
  if (os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    int v8 = 0;
    __int16 v9 = 2082;
    id v10 = "";
    __int16 v11 = 2081;
    id v12 = -[NSString UTF8String](-[NSDictionary description](v5, "description"), "UTF8String");
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:@iB: Tracker unregistering zone, zone:%{private, location:escape_only}s}",  buf,  0x1Cu);
  }

  -[WPZoneTracker unregisterForZoneChanges:](self->_tracker, "unregisterForZoneChanges:", v5);
  -[NSMutableDictionary removeObjectForKey:](self->_zonesAndHandlers, "removeObjectForKey:", a3);
  -[NSRecursiveLock unlock](self->_instanceLock, "unlock");
}

- (void)stopTrackingZones
{
}

- (void)_didTransitionZoneWithData:(id)a3 trueMajor:(id)a4 trueMinor:(id)a5 state:(int64_t)a6
{
  id v11 = -[NSMutableDictionary copy](self->_zonesAndHandlers, "copy");
  -[NSRecursiveLock unlock](self->_instanceLock, "unlock");
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100ECE6CC;
  v12[3] = &unk_10188A970;
  v12[4] = a3;
  v12[5] = a4;
  v12[6] = a5;
  v12[7] = a6;
  [v11 enumerateKeysAndObjectsUsingBlock:v12];
}

- (void)zoneTrackerDidUpdateState:(id)a3
{
}

- (void)zoneTracker:(id)a3 enteredZoneInfo:(id)a4
{
  id v6 = [a4 objectForKeyedSubscript:WPZoneTrackerKeyZone];
  id v7 = +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", WPZoneTrackerKeyMajor), "integerValue"));
  int v8 = +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", WPZoneTrackerKeyMinor), "integerValue"));
  if (qword_101934840 != -1) {
    dispatch_once(&qword_101934840, &stru_10188A9E0);
  }
  __int16 v9 = (os_log_s *)qword_101934848;
  if (os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_INFO))
  {
    v10[0] = 68289283;
    v10[1] = 0;
    __int16 v11 = 2082;
    id v12 = "";
    __int16 v13 = 2081;
    id v14 = objc_msgSend(objc_msgSend(v6, "description"), "UTF8String");
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:iB: Tracker entered zone, zone:%{private, location:escape_only}s}",  (uint8_t *)v10,  0x1Cu);
  }

  -[CLWPBridge _didTransitionZoneWithData:trueMajor:trueMinor:state:]( self,  "_didTransitionZoneWithData:trueMajor:trueMinor:state:",  v6,  v7,  v8,  1LL);
}

- (void)zoneTracker:(id)a3 exitedZone:(id)a4
{
  if (qword_101934840 != -1) {
    dispatch_once(&qword_101934840, &stru_10188A9E0);
  }
  id v6 = (os_log_s *)qword_101934848;
  if (os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_INFO))
  {
    v7[0] = 68289283;
    v7[1] = 0;
    __int16 v8 = 2082;
    __int16 v9 = "";
    __int16 v10 = 2081;
    id v11 = objc_msgSend(objc_msgSend(a4, "description"), "UTF8String");
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:iB: Tracker exited zone, zone:%{private, location:escape_only}s}",  (uint8_t *)v7,  0x1Cu);
  }

  -[CLWPBridge _didTransitionZoneWithData:trueMajor:trueMinor:state:]( self,  "_didTransitionZoneWithData:trueMajor:trueMinor:state:",  a4,  0LL,  0LL,  2LL);
}

- (void)zoneTracker:(id)a3 didFailToRegisterZones:(id)a4 withError:(id)a5
{
  id v8 = -[NSMutableDictionary copy](self->_zonesAndHandlers, "copy");
  -[NSRecursiveLock unlock](self->_instanceLock, "unlock");
  if (qword_101934840 != -1) {
    dispatch_once(&qword_101934840, &stru_10188A9E0);
  }
  __int16 v9 = (os_log_s *)qword_101934848;
  if (os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136380931;
    id v19 = objc_msgSend(objc_msgSend(a4, "description"), "UTF8String");
    __int16 v20 = 2081;
    id v21 = objc_msgSend(objc_msgSend(a5, "description"), "UTF8String");
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "#Warning Tracker failed to register zones,%{private}s with error,%{private}s",  buf,  0x16u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934840 != -1) {
      dispatch_once(&qword_101934840, &stru_10188A9E0);
    }
    uint64_t v10 = qword_101934848;
    int v14 = 136380931;
    id v15 = objc_msgSend(objc_msgSend(a4, "description"), "UTF8String");
    __int16 v16 = 2081;
    id v17 = objc_msgSend(objc_msgSend(a5, "description"), "UTF8String");
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v10,  0LL,  "#Warning Tracker failed to register zones,%{private}s with error,%{private}s",  &v14,  22);
    id v12 = (uint8_t *)v11;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWPBridge zoneTracker:didFailToRegisterZones:withError:]", "%s\n", v11);
    if (v12 != buf) {
      free(v12);
    }
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100ECED38;
  v13[3] = &unk_10188A9C0;
  v13[4] = v8;
  v13[5] = a5;
  objc_msgSend(objc_msgSend(a4, "objectForKey:", @"ZTZonesArray"), "enumerateObjectsUsingBlock:", v13);
  sub_10091D010(@"not-associated-with-client", 2);
}

- (void)updateState
{
  if ((-[WPDeviceScanner state](self->_scanner, "state") == (id)3
     || -[WPDeviceScanner state](self->_scanner, "state") == (id)2)
    && (-[WPZoneTracker state](self->_tracker, "state") == (id)3
     || -[WPZoneTracker state](self->_tracker, "state") == (id)2))
  {
    if (-[WPDeviceScanner state](self->_scanner, "state") == (id)2)
    {
      int64_t v3 = 2LL;
    }

    else if (-[WPZoneTracker state](self->_tracker, "state") == (id)2)
    {
      int64_t v3 = 2LL;
    }

    else
    {
      int64_t v3 = 1LL;
    }
  }

  else
  {
    int64_t v3 = 0LL;
  }

  if (v3 == self->_state)
  {
    -[NSRecursiveLock unlock](self->_instanceLock, "unlock");
  }

  else
  {
    self->_state = v3;
    v4 = (void (**)(id, int64_t))objc_msgSend( -[CLWPBridge stateHandler](self, "stateHandler"),  "copy");
    -[NSRecursiveLock unlock](self->_instanceLock, "unlock");
    if (v4)
    {
      v4[2](v4, v3);
    }
  }

- (id)stateHandler
{
  return self->_stateHandler;
}

- (void)setStateHandler:(id)a3
{
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
}

@end