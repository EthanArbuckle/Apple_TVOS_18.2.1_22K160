@interface IDSDSessionDefaultAvailabilityCheck
- (IMNetworkAvailability)availability;
- (int64_t)networkCheckOverrideBehavior;
- (void)availabilityTimerCancel;
- (void)checkLocalConnectivityForSession:(id)a3 withCompletionBlock:(id)a4;
- (void)checkNetworkAvailabilityForSession:(id)a3 completionBlock:(id)a4;
- (void)setAvailability:(id)a3;
@end

@implementation IDSDSessionDefaultAvailabilityCheck

- (int64_t)networkCheckOverrideBehavior
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMUserDefaults fixedInterface](&OBJC_CLASS___IMUserDefaults, "fixedInterface"));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[IMUserDefaults fixedInterfaceDestination]( &OBJC_CLASS___IMUserDefaults,  "fixedInterfaceDestination"));
    int64_t v4 = v3 != 0LL;
  }

  else
  {
    int64_t v4 = 0LL;
  }

  int64_t result = +[IMUserDefaults sessionNetworkAvailabilityCheckOverrideBehavior]( &OBJC_CLASS___IMUserDefaults,  "sessionNetworkAvailabilityCheckOverrideBehavior");
  if (!result) {
    return v4;
  }
  return result;
}

- (void)checkNetworkAvailabilityForSession:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, BOOL))a4;
  uint64_t v8 = OSLogHandleForTransportCategory("IDSDSession");
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
    *(_DWORD *)buf = 138412290;
    double v71 = *(double *)&v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Starting outgoing network availability check for session %@",  buf,  0xCu);
  }

  uint64_t v12 = os_log_shim_legacy_logging_enabled(v11);
  if ((_DWORD)v12)
  {
    if (_IDSShouldLogTransport(v12))
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
      _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Starting outgoing network availability check for session %@");

      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueID", v61));
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Starting outgoing network availability check for session %@");
      }
    }
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100306264;
  block[3] = &unk_1008F6010;
  block[4] = self;
  if (qword_1009C0AC8 != -1) {
    dispatch_once(&qword_1009C0AC8, block);
  }
  if (qword_1009C0AC0)
  {
    uint64_t v13 = OSLogHandleForTransportCategory("IDSDSession");
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
      *(_DWORD *)buf = 138412546;
      double v71 = *(double *)&v15;
      __int16 v72 = 2048;
      uint64_t v73 = qword_1009C0AC0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Overriding network availability check result! { session: %@, overrideBehavior: %ld }",  buf,  0x16u);
    }

    uint64_t v17 = os_log_shim_legacy_logging_enabled(v16);
    if ((_DWORD)v17)
    {
      if (_IDSShouldLogTransport(v17))
      {
        v62 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
        uint64_t v66 = qword_1009C0AC0;
        _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Overriding network availability check result! { session: %@, overrideBehavior: %ld }");

        if (_IDSShouldLog(0LL, @"IDSDSession"))
        {
          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueID", v62, v66));
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Overriding network availability check result! { session: %@, overrideBehavior: %ld }");
        }
      }
    }

    v7[2](v7, qword_1009C0AC0 != 2);
  }

  else if (([v6 isInitiator] & 1) != 0 {
         || ![v6 isWithDefaultPairedDevice])
  }
  {
    else {
      uint64_t v23 = 5LL;
    }
    if ([v6 disallowWifiInterface])
    {
      uint64_t v24 = 0LL;
    }

    else
    {
      uint64_t v25 = OSLogHandleForTransportCategory("IDSDSession");
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Network availability check: including WiFi availability",  buf,  2u);
      }

      uint64_t v28 = os_log_shim_legacy_logging_enabled(v27);
      if ((_DWORD)v28)
      {
        if (_IDSShouldLogTransport(v28))
        {
          _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Network availability check: including WiFi availability");
          if (_IDSShouldLog(0LL, @"IDSDSession")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Network availability check: including WiFi availability");
          }
        }
      }

      if ([v6 clientType] == (id)4)
      {
        uint64_t v29 = OSLogHandleForTransportCategory("IDSDSession");
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Network availability check: allowing WiFi hotspot",  buf,  2u);
        }

        uint64_t v32 = os_log_shim_legacy_logging_enabled(v31);
        if ((_DWORD)v32)
        {
          if (_IDSShouldLogTransport(v32))
          {
            _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Network availability check: allowing WiFi hotspot");
            if (_IDSShouldLog(0LL, @"IDSDSession")) {
              _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Network availability check: allowing WiFi hotspot");
            }
          }
        }

        v23 |= 0x10uLL;
      }

      uint64_t v24 = 1LL;
    }

    if ([v6 enableQuickRelay]
      && ([v6 disallowCellularInterface] & 1) == 0)
    {
      uint64_t v33 = OSLogHandleForTransportCategory("IDSDSession");
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Network availability check: including cellular availability",  buf,  2u);
      }

      uint64_t v36 = os_log_shim_legacy_logging_enabled(v35);
      if ((_DWORD)v36)
      {
        if (_IDSShouldLogTransport(v36))
        {
          _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Network availability check: including cellular availability");
          if (_IDSShouldLog(0LL, @"IDSDSession")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Network availability check: including cellular availability");
          }
        }
      }

      v24 |= 2uLL;
    }

    else if ([v6 isInitiator] {
           && ([v6 clientType] == (id)1
    }
            || [v6 clientType] == (id)5
            || [v6 clientType] == (id)6))
    {
      v23 |= 2uLL;
    }

    unsigned int v37 = [v6 isInitiator];
    if (v37) {
      double v38 = 60.0;
    }
    else {
      double v38 = 30.0;
    }
    double v39 = 15.0;
    if (v37) {
      double v39 = 30.0;
    }
    double v40 = 2.0;
    if (v37) {
      double v40 = 7.0;
    }
    if ((v24 & 2) != 0) {
      double v41 = v40;
    }
    else {
      double v41 = v39;
    }
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
    unsigned int v43 = [v42 isScreenLit];

    if (v43)
    {
      v44 = objc_alloc_init(&OBJC_CLASS___NSDate);
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
      v46 = (void *)objc_claimAutoreleasedReturnValue([v45 dateScreenLightLastChanged]);

      -[NSDate timeIntervalSinceDate:](v44, "timeIntervalSinceDate:", v46);
      double v48 = v47;
      uint64_t v49 = OSLogHandleForTransportCategory("IDSDSession");
      v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v71 = v48;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Time since lights on: %f", buf, 0xCu);
      }

      uint64_t v52 = os_log_shim_legacy_logging_enabled(v51);
      if ((_DWORD)v52)
      {
        if (_IDSShouldLogTransport(v52))
        {
          _IDSLogTransport(@"IDSDSession", @"IDS", @"Time since lights on: %f");
        }
      }

      double v53 = v41 - v48;
      if (v48 >= v41) {
        double v53 = 0.0;
      }
      if (v48 > 0.0) {
        double v41 = v53;
      }
    }

    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472LL;
    v67[2] = sub_100306284;
    v67[3] = &unk_100900AC8;
    v67[4] = self;
    v68 = v7;
    v54 = objc_retainBlock(v67);
    uint64_t v55 = OSLogHandleForTransportCategory("IDSDSession");
    v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218752;
      double v71 = v38;
      __int16 v72 = 2048;
      uint64_t v73 = *(void *)&v41;
      __int16 v74 = 2048;
      uint64_t v75 = v24;
      __int16 v76 = 2048;
      uint64_t v77 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "Starting availability check with network timeout: %fs   wifi timeout: %fs   flags: %lu   options: %lu",  buf,  0x2Au);
    }

    uint64_t v58 = os_log_shim_legacy_logging_enabled(v57);
    if ((_DWORD)v58)
    {
      if (_IDSShouldLogTransport(v58))
      {
        _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Starting availability check with network timeout: %fs   wifi timeout: %fs   flags: %lu   options: %lu");
        if (_IDSShouldLog(0LL, @"IDSDSession")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Starting availability check with network timeout: %fs   wifi timeout: %fs   flags: %lu   options: %lu");
        }
      }
    }

    v59 = -[IMNetworkAvailability initWithFlags:options:timeout:wifiTimeout:completionBlock:]( objc_alloc(&OBJC_CLASS___IMNetworkAvailability),  "initWithFlags:options:timeout:wifiTimeout:completionBlock:",  v24,  v23,  v54,  v38,  v41);
    -[IDSDSessionDefaultAvailabilityCheck setAvailability:](self, "setAvailability:", v59);

    v60 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionDefaultAvailabilityCheck availability](self, "availability"));
    [v60 start];
  }

  else
  {
    uint64_t v18 = OSLogHandleForTransportCategory("IDSDSession");
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
      *(_DWORD *)buf = 138412290;
      double v71 = *(double *)&v20;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Bypassing network availability check for incoming session from default paired device { session: %@ }",  buf,  0xCu);
    }

    uint64_t v22 = os_log_shim_legacy_logging_enabled(v21);
    if ((_DWORD)v22)
    {
      if (_IDSShouldLogTransport(v22))
      {
        v64 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
        _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Bypassing network availability check for incoming session from default paired device { session: %@ }");

        if (_IDSShouldLog(0LL, @"IDSDSession"))
        {
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueID", v64));
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Bypassing network availability check for incoming session from default paired device { session: %@ }");
        }
      }
    }

    v7[2](v7, 1);
  }
}

- (void)availabilityTimerCancel
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionDefaultAvailabilityCheck availability](self, "availability"));
  [v3 cancel];

  -[IDSDSessionDefaultAvailabilityCheck setAvailability:](self, "setAvailability:", 0LL);
}

- (void)checkLocalConnectivityForSession:(id)a3 withCompletionBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 isScreenSharingSession] & 1) == 0
    && ![v5 isWithDefaultPairedDevice])
  {
    if (![v5 enableQuickRelay])
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunController sharedInstance](&OBJC_CLASS___IDSUTunController, "sharedInstance"));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueID]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 participantID]);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_1003064E4;
      v14[3] = &unk_100900B18;
      id v15 = v5;
      id v16 = v6;
      [v11 createConnectionDataForDevice:v12 localPartyID:v13 dataReadyHandler:v14];

      goto LABEL_4;
    }

    uint64_t v7 = OSLogHandleForTransportCategory("IDSDSession");
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "QuickRelay is enabled, skip connection check.",  buf,  2u);
    }

    uint64_t v10 = os_log_shim_legacy_logging_enabled(v9);
    if ((_DWORD)v10)
    {
      if (_IDSShouldLogTransport(v10))
      {
        _IDSLogTransport(@"IDSDSession", @"IDS", @"QuickRelay is enabled, skip connection check.");
        if (_IDSShouldLog(0LL, @"IDSDSession")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"QuickRelay is enabled, skip connection check.");
        }
      }
    }
  }

  (*((void (**)(id, uint64_t, void))v6 + 2))(v6, 1LL, 0LL);
LABEL_4:
}

- (IMNetworkAvailability)availability
{
  return self->_availability;
}

- (void)setAvailability:(id)a3
{
}

- (void).cxx_destruct
{
}

@end