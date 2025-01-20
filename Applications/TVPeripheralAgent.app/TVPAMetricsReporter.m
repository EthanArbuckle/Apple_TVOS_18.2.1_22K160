@interface TVPAMetricsReporter
+ (Class)remoteUsageClass;
+ (id)_daysSinceBatteryRangeEventFieldNameForBatteryRange:(unint64_t)a3;
+ (int64_t)_batteryRangeEventFieldValueForBatteryRange:(unint64_t)a3;
+ (int64_t)_daysSinceFromDate:(id)a3 toDate:(id)a4;
- (id)_remoteUsage;
- (void)_bluetoothRemoteBatteryLevelDidChange:(id)a3;
- (void)_bluetoothRemoteDidConnectNotification:(id)a3;
- (void)_bluetoothRemotePowerSourceLimitedSourceDidChangeNotification:(id)a3;
- (void)_checkForChangedRemote:(id)a3;
- (void)_saveRemoteUsage:(id)a3;
- (void)_sendAnalyticsEvent:(id)a3 payloadBlock:(id)a4;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)reportLowBatteryNotificationWithRemote:(id)a3;
- (void)reportRemote:(id)a3 didDisconnectWithError:(id)a4;
@end

@implementation TVPAMetricsReporter

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___TVPAMetricsReporter;
  -[TVPAMetricsReporter dealloc](&v2, "dealloc");
}

- (void)activate
{
  v14 = self;
  location[1] = (id)a2;
  if (self->_activated)
  {
    location[0] = sub_10000ABA4();
    char v12 = 16;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)location[0];
      os_log_type_t type = v12;
      sub_100009998(v11);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "Metrics reporter has already been activated.",  v11,  2u);
    }

    objc_storeStrong(location, 0LL);
  }

  else if (v14->_invalidated)
  {
    id v10 = sub_10000ABA4();
    char v9 = 16;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      objc_super v2 = (os_log_s *)v10;
      os_log_type_t v3 = v9;
      sub_100009998(v8);
      _os_log_error_impl((void *)&_mh_execute_header, v2, v3, "Metrics reporter has already been invalidated.", v8, 2u);
    }

    objc_storeStrong(&v10, 0LL);
  }

  else
  {
    v14->_activated = 1;
    id v7 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    objc_msgSend( v7,  "addObserver:selector:name:object:",  v14,  "_bluetoothRemoteDidConnectNotification:",  TVSBluetoothRemoteDidConnectNotification);
    [v7 addObserver:v14 selector:"_bluetoothRemoteBatteryLevelDidChange:" name:TVSBluetoothRemotePowerSourceInfoDidChangeNotification object:0];
    [v7 addObserver:v14 selector:"_bluetoothRemotePowerSourceLimitedSourceDidChangeNotification:" name:TVSBluetoothRemotePowerSourceLimitedSourceDidChangeNotification object:0];
    id v6 =  +[TVSBluetoothRemoteUtilities connectedBluetoothRemote]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "connectedBluetoothRemote");
    if (v6) {
      -[TVPAMetricsReporter _checkForChangedRemote:](v14, "_checkForChangedRemote:", v6);
    }
    objc_storeStrong(&v6, 0LL);
    objc_storeStrong(&v7, 0LL);
  }

- (void)reportLowBatteryNotificationWithRemote:(id)a3
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v4 = &_dispatch_main_q;
  dispatch_assert_queue_V2(v4);

  if (v15->_activated)
  {
    os_log_type_t v3 = v15;
    v5 = _NSConcreteStackBlock;
    int v6 = -1073741824;
    int v7 = 0;
    v8 = sub_100026DD8;
    char v9 = &unk_1000390A0;
    id v10 = location[0];
    -[TVPAMetricsReporter _sendAnalyticsEvent:payloadBlock:]( v3,  "_sendAnalyticsEvent:payloadBlock:",  @"com.apple.appletv.remote.lowBatteryNotification",  &v5);
    objc_storeStrong(&v10, 0LL);
    int v11 = 0;
  }

  else
  {
    id v13 = sub_10000ABA4();
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      sub_100017EE4((uint64_t)v16, (uint64_t)"-[TVPAMetricsReporter reportLowBatteryNotificationWithRemote:]");
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v13, v12, "%s: Object is not active", v16, 0xCu);
    }

    objc_storeStrong(&v13, 0LL);
    int v11 = 1;
  }

  objc_storeStrong(location, 0LL);
}

- (void)reportRemote:(id)a3 didDisconnectWithError:(id)a4
{
  v28 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v26 = 0LL;
  objc_storeStrong(&v26, a4);
  v8 = &_dispatch_main_q;
  dispatch_assert_queue_V2(v8);

  if (v28->_activated)
  {
    if ([location[0] type] == (id)1)
    {
      id v20 = [location[0] serialNumber];
      if (v20)
      {
        uint64_t v17 = (uint64_t)+[TVSBluetoothRemoteUtilities batteryLevelForRemoteName:]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "batteryLevelForRemoteName:",  v20);
        id v5 = [v26 domain];
        BOOL v6 = 0;
        if ([v5 isEqualToString:CBErrorDomain])
        {
          BOOL v6 = 0;
          if ([v26 code] == (id)6)
          {
            BOOL v6 = 0;
            if (v17 >= 0) {
              BOOL v6 = v17 <= 3;
            }
          }
        }

        if (v6)
        {
          os_log_t oslog = (os_log_t)sub_10000ABA4();
          os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            sub_10002742C( (uint64_t)v29,  (uint64_t)"-[TVPAMetricsReporter reportRemote:didDisconnectWithError:]",  (uint64_t)v20);
            _os_log_impl( (void *)&_mh_execute_header,  oslog,  v15,  "%s: Remote %{public}@ disconnected with a very low battery level. Will record battery exhaustion",  v29,  0x16u);
          }

          objc_storeStrong((id *)&oslog, 0LL);
          v4 = v28;
          char v9 = _NSConcreteStackBlock;
          int v10 = -1073741824;
          int v11 = 0;
          os_log_type_t v12 = sub_100027480;
          id v13 = &unk_1000390C8;
          v14[1] = (id)v17;
          v14[0] = location[0];
          -[TVPAMetricsReporter _sendAnalyticsEvent:payloadBlock:]( v4,  "_sendAnalyticsEvent:payloadBlock:",  @"com.apple.appletv.remote.batteryExhausted",  &v9);
          objc_storeStrong(v14, 0LL);
        }

        int v23 = 0;
      }

      else
      {
        id v19 = sub_10000ABA4();
        os_log_type_t v18 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
        {
          sub_1000273D8( (uint64_t)v30,  (uint64_t)"-[TVPAMetricsReporter reportRemote:didDisconnectWithError:]",  (uint64_t)location[0]);
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v19,  v18,  "%s: No serial number found for remote. remote=%@",  v30,  0x16u);
        }

        objc_storeStrong(&v19, 0LL);
        int v23 = 1;
      }

      objc_storeStrong(&v20, 0LL);
    }

    else
    {
      id v22 = sub_10000ABA4();
      os_log_type_t v21 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
      {
        sub_1000273D8( (uint64_t)v31,  (uint64_t)"-[TVPAMetricsReporter reportRemote:didDisconnectWithError:]",  (uint64_t)location[0]);
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v22,  v21,  "%s: Non remote passed. device=%@",  v31,  0x16u);
      }

      objc_storeStrong(&v22, 0LL);
      int v23 = 1;
    }
  }

  else
  {
    id v25 = sub_10000ABA4();
    os_log_type_t v24 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
    {
      sub_100017EE4((uint64_t)v32, (uint64_t)"-[TVPAMetricsReporter reportRemote:didDisconnectWithError:]");
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v25, v24, "%s: Object is not active", v32, 0xCu);
    }

    objc_storeStrong(&v25, 0LL);
    int v23 = 1;
  }

  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)invalidate
{
  objc_super v2 = &_dispatch_main_q;
  dispatch_assert_queue_V2(v2);

  self->_activated = 0;
  self->_invalidated = 1;
  os_log_type_t v3 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:](v3, "removeObserver:", self);
}

+ (Class)remoteUsageClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___TVPABluetoothRemoteUsage);
}

- (void)_sendAnalyticsEvent:(id)a3 payloadBlock:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  id v5 = &_dispatch_main_q;
  dispatch_assert_queue_V2(v5);

  AnalyticsSendEventLazy(location[0], v6);
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)_remoteUsage
{
  os_log_type_t v3 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  v4 = -[NSUserDefaults tvpa_remoteUsage](v3, "tvpa_remoteUsage");

  return v4;
}

- (void)_saveRemoteUsage:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  os_log_type_t v3 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  -[NSUserDefaults tvpa_setRemoteUsage:](v3, "tvpa_setRemoteUsage:", location[0]);

  objc_storeStrong(location, 0LL);
}

- (void)_bluetoothRemoteDidConnectNotification:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  os_log_type_t v3 = &_dispatch_main_q;
  dispatch_assert_queue_V2(v3);

  id v4 = [location[0] userInfo];
  id v6 = [v4 objectForKey:TVSBluetoothRemoteUserInfoRemoteObject];

  if (v6)
  {
    -[TVPAMetricsReporter _checkForChangedRemote:](v8, "_checkForChangedRemote:", v6);
  }

  else
  {
    os_log_t oslog = (os_log_t)sub_10000ABA4();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_100017EE4((uint64_t)v9, (uint64_t)"-[TVPAMetricsReporter _bluetoothRemoteDidConnectNotification:]");
      _os_log_error_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_ERROR,  "%s: Handling TVSBluetoothRemoteDidConnectNotification but no remote object was found in the userInfo",  v9,  0xCu);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_bluetoothRemotePowerSourceLimitedSourceDidChangeNotification:(id)a3
{
  os_log_type_t v24 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  int v7 = &_dispatch_main_q;
  dispatch_assert_queue_V2(v7);

  id v8 = [location[0] userInfo];
  id v22 = [v8 objectForKey:TVSBluetoothRemoteUserInfoRemoteObject];

  if (v22)
  {
    id v18 = -[TVPAMetricsReporter _remoteUsage](v24, "_remoteUsage");
    id v5 = [v18 remoteIdentifier];
    id v4 = [v22 identifier];
    unsigned __int8 v6 = objc_msgSend(v5, "isEqualToString:");

    if ((v6 & 1) != 0)
    {
      os_log_type_t v3 = v24;
      int v10 = _NSConcreteStackBlock;
      int v11 = -1073741824;
      int v12 = 0;
      id v13 = sub_100027D98;
      v14 = &unk_1000390A0;
      id v15 = v22;
      -[TVPAMetricsReporter _sendAnalyticsEvent:payloadBlock:]( v3,  "_sendAnalyticsEvent:payloadBlock:",  @"com.apple.appletv.remote.charging",  &v10);
      os_log_t oslog = (os_log_t)sub_10000ABA4();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        sub_100017EE4( (uint64_t)v25,  (uint64_t)"-[TVPAMetricsReporter _bluetoothRemotePowerSourceLimitedSourceDidChangeNotification:]");
        _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "%s: Clearing battery snapshots due to battery charging started.",  v25,  0xCu);
      }

      objc_storeStrong((id *)&oslog, 0LL);
      [v18 clearBatterySnapshots];
      -[TVPAMetricsReporter _saveRemoteUsage:](v24, "_saveRemoteUsage:", v18);
      objc_storeStrong(&v15, 0LL);
      int v19 = 0;
    }

    else
    {
      id v17 = sub_10000ABA4();
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
      {
        sub_100017EE4( (uint64_t)v26,  (uint64_t)"-[TVPAMetricsReporter _bluetoothRemotePowerSourceLimitedSourceDidChangeNotification:]");
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  v16,  "%s: The remote has changed. Ignoring the power change notification.",  v26,  0xCu);
      }

      objc_storeStrong(&v17, 0LL);
      int v19 = 1;
    }

    objc_storeStrong(&v18, 0LL);
    if (!v19) {
LABEL_14:
    }
      int v19 = 0;
  }

  else
  {
    id v21 = sub_10000ABA4();
    os_log_type_t v20 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
    {
      sub_100017EE4( (uint64_t)v27,  (uint64_t)"-[TVPAMetricsReporter _bluetoothRemotePowerSourceLimitedSourceDidChangeNotification:]");
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v21,  v20,  "%s: Handling TVSBluetoothRemotePowerSourceLimitedSourceDidChangeNotification but no remote object was found in the userInfo",  v27,  0xCu);
    }

    objc_storeStrong(&v21, 0LL);
    int v19 = 1;
  }

  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_bluetoothRemoteBatteryLevelDidChange:(id)a3
{
  v41 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = &_dispatch_main_q;
  dispatch_assert_queue_V2(v8);

  id v9 = [location[0] userInfo];
  id v39 = [v9 objectForKey:TVSBluetoothRemoteUserInfoRemoteObject];

  if (v39)
  {
    if ([v39 isCharging])
    {
      id v35 = sub_10000ABA4();
      os_log_type_t v34 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_DEFAULT))
      {
        sub_100017EE4((uint64_t)v45, (uint64_t)"-[TVPAMetricsReporter _bluetoothRemoteBatteryLevelDidChange:]");
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v35,  v34,  "%s: Remote is charging. No need to collect battery drain information",  v45,  0xCu);
      }

      objc_storeStrong(&v35, 0LL);
      int v36 = 1;
    }

    else
    {
      id v33 = -[TVPAMetricsReporter _remoteUsage](v41, "_remoteUsage");
      if (v33)
      {
        id v6 = [v33 remoteIdentifier];
        id v5 = [v39 identifier];
        unsigned __int8 v7 = objc_msgSend(v6, "isEqualToString:");

        if ((v7 & 1) != 0)
        {
          uint64_t v28 = (uint64_t)[v39 batteryLevel];
          if ((unint64_t)v28 <= 0x64)
          {
            if (v28 <= 20)
            {
              id v4 = v41;
              os_log_type_t v20 = _NSConcreteStackBlock;
              int v21 = -1073741824;
              int v22 = 0;
              int v23 = sub_1000285D0;
              os_log_type_t v24 = &unk_1000390C8;
              v25[1] = (id)v28;
              v25[0] = v39;
              -[TVPAMetricsReporter _sendAnalyticsEvent:payloadBlock:]( v4,  "_sendAnalyticsEvent:payloadBlock:",  @"com.apple.appletv.remote.lowBattery",  &v20);
              objc_storeStrong(v25, 0LL);
            }

            char v19 = [v33 recordBatteryLevel:v28] & 1;
            id v18 = [v33 batterySnapshots];
            if ((v19 & 1) != 0)
            {
              -[TVPAMetricsReporter _saveRemoteUsage:](v41, "_saveRemoteUsage:", v33);
              if ((unint64_t)[v18 count] > 1)
              {
                os_log_type_t v3 = v41;
                int v10 = _NSConcreteStackBlock;
                int v11 = -1073741824;
                int v12 = 0;
                id v13 = sub_100028700;
                v14 = &unk_100039118;
                id v15 = v18;
                os_log_type_t v16 = v41;
                id v17 = v33;
                -[TVPAMetricsReporter _sendAnalyticsEvent:payloadBlock:]( v3,  "_sendAnalyticsEvent:payloadBlock:",  @"com.apple.appletv.remote.batteryDrain",  &v10);
                objc_storeStrong(&v17, 0LL);
                objc_storeStrong((id *)&v16, 0LL);
                objc_storeStrong(&v15, 0LL);
              }
            }

            objc_storeStrong(&v18, 0LL);
            int v36 = 0;
          }

          else
          {
            id v27 = sub_10000ABA4();
            os_log_type_t v26 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
            {
              sub_100028580((uint64_t)v42, (uint64_t)"-[TVPAMetricsReporter _bluetoothRemoteBatteryLevelDidChange:]", v28);
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v27,  v26,  "%s: Battery level is invalid. Will ignore. batteryLevel=%lu",  v42,  0x16u);
            }

            objc_storeStrong(&v27, 0LL);
            int v36 = 1;
          }
        }

        else
        {
          id v30 = sub_10000ABA4();
          os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEFAULT))
          {
            sub_100017EE4((uint64_t)v43, (uint64_t)"-[TVPAMetricsReporter _bluetoothRemoteBatteryLevelDidChange:]");
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v30,  v29,  "%s: The remote has changed. Ignoring the battery change notification.",  v43,  0xCu);
          }

          objc_storeStrong(&v30, 0LL);
          int v36 = 1;
        }
      }

      else
      {
        id v32 = sub_10000ABA4();
        os_log_type_t v31 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_DEFAULT))
        {
          sub_100017EE4((uint64_t)v44, (uint64_t)"-[TVPAMetricsReporter _bluetoothRemoteBatteryLevelDidChange:]");
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v32,  v31,  "%s: No remote usage found. Should of been created when the remote first connected",  v44,  0xCu);
        }

        objc_storeStrong(&v32, 0LL);
        int v36 = 1;
      }

      objc_storeStrong(&v33, 0LL);
    }
  }

  else
  {
    id v38 = sub_10000ABA4();
    os_log_type_t v37 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_ERROR))
    {
      sub_100017EE4((uint64_t)v46, (uint64_t)"-[TVPAMetricsReporter _bluetoothRemoteBatteryLevelDidChange:]");
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v38,  v37,  "%s: Handling TVSBluetoothRemotePowerSourceInfoDidChangeNotification but no remote object was found in the userInfo",  v46,  0xCu);
    }

    objc_storeStrong(&v38, 0LL);
    int v36 = 1;
  }

  objc_storeStrong(&v39, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_checkForChangedRemote:(id)a3
{
  int v23 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  char v21 = 0;
  id v20 = -[TVPAMetricsReporter _remoteUsage](v23, "_remoteUsage");
  if (v20)
  {
    id v8 = [v20 remoteIdentifier];
    id v7 = [location[0] identifier];
    unsigned __int8 v9 = objc_msgSend(v8, "isEqualToString:");

    if ((v9 & 1) == 0)
    {
      char v21 = 1;
      id v6 = [v20 batterySnapshots];
      id v19 = [v6 firstObject];

      if (v19) {
        uint64_t v5 = (uint64_t)[v19 batteryLevel];
      }
      else {
        uint64_t v5 = -1LL;
      }
      id v18 = (void *)v5;
      id v4 = v23;
      int v11 = _NSConcreteStackBlock;
      int v12 = -1073741824;
      int v13 = 0;
      v14 = sub_100028FA0;
      id v15 = &unk_100039140;
      id v16 = v20;
      v17[1] = v18;
      v17[0] = location[0];
      -[TVPAMetricsReporter _sendAnalyticsEvent:payloadBlock:]( v4,  "_sendAnalyticsEvent:payloadBlock:",  @"com.apple.appletv.remote.changed",  &v11);
      objc_storeStrong(v17, 0LL);
      objc_storeStrong(&v16, 0LL);
      objc_storeStrong(&v19, 0LL);
    }
  }

  else
  {
    char v21 = 1;
  }

  if ((v21 & 1) != 0)
  {
    id v3 = objc_alloc((Class)[(id)objc_opt_class(v23) remoteUsageClass]);
    id v10 = [v3 initWithBluetoothRemoteInfo:location[0]];
    -[TVPAMetricsReporter _saveRemoteUsage:](v23, "_saveRemoteUsage:", v10);
    objc_storeStrong(&v10, 0LL);
  }

  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(location, 0LL);
}

+ (int64_t)_daysSinceFromDate:(id)a3 toDate:(id)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v9 = 0LL;
  objc_storeStrong(&v9, a4);
  id v8 = +[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar");
  id v7 = [v8 components:16 fromDate:location[0] toDate:v9 options:0];
  else {
    int64_t v5 = (int64_t)[v7 day];
  }
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
  return v5;
}

+ (int64_t)_batteryRangeEventFieldValueForBatteryRange:(unint64_t)a3
{
  if (a3 + 1 <= 0x14) {
    __asm { BR              X8 }
  }

  return -1LL;
}

+ (id)_daysSinceBatteryRangeEventFieldNameForBatteryRange:(unint64_t)a3
{
  v5[3] = a1;
  v5[2] = (id)a2;
  v5[1] = (id)a3;
  v5[0] = 0LL;
  if (a3 + 1 <= 0x14) {
    __asm { BR              X8 }
  }

  id v4 = v5[0];
  objc_storeStrong(v5, 0LL);
  return v4;
}

@end