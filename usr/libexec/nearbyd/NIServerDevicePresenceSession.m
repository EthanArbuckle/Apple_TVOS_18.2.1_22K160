@interface NIServerDevicePresenceSession
- (BOOL)airPodsProxCardSampleTooOld:(id)a3;
- (BOOL)isAirPods:(unsigned int)a3;
- (BOOL)isInteresetedInSample:(id)a3;
- (BOOL)isInterestedInSamplesForDevice:(id)a3;
- (BOOL)supportsCameraAssistance;
- (BOOL)supportsDevicePresence;
- (BOOL)supportsSessionObservers;
- (NIDevicePresenceConfiguration)configuration;
- (NIServerDevicePresenceSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5;
- (duration<long)nominalCycleRate;
- (id).cxx_construct;
- (id)_disableAllServicesAndSendHangupSignal:(BOOL)a3;
- (id)configure;
- (id)description;
- (id)disableAllServices;
- (id)discoveryTokenFromIdentifier:(unint64_t)a3;
- (id)getQueueForInputingData;
- (id)lastConfiguration;
- (id)objectFromIdentifier:(unint64_t)a3;
- (id)pauseWithSource:(int64_t)a3;
- (id)run;
- (optional<unsigned)identifierFromDiscoveryToken:(id)a3;
- (void)consumeBluetoothSample:(id)a3;
- (void)invalidate;
- (void)processVisionInput:(id)a3;
- (void)updatesEngine:(id)a3 didUpdateNearbyObjects:(id)a4;
- (void)updatesEngine:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6 regionTransitionSuppressed:(BOOL)a7;
@end

@implementation NIServerDevicePresenceSession

- (id)description
{
  v3 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"NIServerDevicePresenceSession");
  v4 = (void *)*((void *)self + 41);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
    -[NSMutableString appendFormat:](v3, "appendFormat:", @" with Configuration: %@", v5);
  }

  else
  {
    -[NSMutableString appendFormat:](v3, "appendFormat:", @" with Configuration: nil");
  }

  return v3;
}

- (NIServerDevicePresenceSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v12 = objc_opt_class(v10, v11);
  if (v12 != objc_opt_class(&OBJC_CLASS___NIDevicePresenceConfiguration, v13))
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v38 handleFailureInMethod:a2 object:self file:@"NIServerDevicePresenceSession.mm" lineNumber:89 description:@"NIServerDevicePresenceSession given invalid configuration."];
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v9 serverSessionIdentifier]);

  if (!v14)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v39 handleFailureInMethod:a2, self, @"NIServerDevicePresenceSession.mm", 90, @"Invalid parameter not satisfying: %@", @"resourcesManager.serverSessionIdentifier" object file lineNumber description];
  }

  v43.receiver = self;
  v43.super_class = (Class)&OBJC_CLASS___NIServerDevicePresenceSession;
  id v15 = -[NIServerBaseSession initWithResourcesManager:configuration:error:]( &v43,  "initWithResourcesManager:configuration:error:",  v9,  v10,  a5);
  v16 = v15;
  if (v15)
  {
    id v17 = [v10 copy];
    v18 = (void *)*((void *)v15 + 41);
    *((void *)v15 + 41) = v17;

    if (([*((id *)v15 + 41) monitoringOption] & 2) == 0)
    {
      if (v9) {
        [v9 protobufLogger];
      }
      else {
        __int128 location = 0uLL;
      }
      sub_10000EE54((uint64_t)v15 + 48, &location);
      v20 = (std::__shared_weak_count *)*((void *)&location + 1);
      if (*((void *)&location + 1))
      {
        v21 = (unint64_t *)(*((void *)&location + 1) + 8LL);
        do
          unint64_t v22 = __ldaxr(v21);
        while (__stlxr(v22 - 1, v21));
        if (!v22)
        {
          ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
          std::__shared_weak_count::__release_weak(v20);
        }
      }

      uint64_t v23 = objc_claimAutoreleasedReturnValue([v9 clientConnectionQueue]);
      v24 = (void *)*((void *)v15 + 10);
      *((void *)v15 + 10) = v23;

      v25 = (void *)objc_claimAutoreleasedReturnValue([v9 serverSessionIdentifier]);
      uint64_t v26 = objc_claimAutoreleasedReturnValue([v25 UUIDString]);
      v27 = (void *)*((void *)v15 + 11);
      *((void *)v15 + 11) = v26;

      *((void *)v15 + 37) = 0LL;
      v28 = objc_alloc_init(&OBJC_CLASS___SFDeviceDiscovery);
      v29 = (void *)*((void *)v15 + 12);
      *((void *)v15 + 12) = v28;

      if ([*((id *)v15 + 41) allowedDevices] != (id)2) {
        goto LABEL_23;
      }
      v30 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v15 + 41) innerBoundary]);
      if ([v30 devicePresencePreset] == (id)3)
      {
      }

      else
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v15 + 41) innerBoundary]);
        BOOL v32 = [v31 devicePresencePreset] == (id)2;

        if (!v32)
        {
LABEL_23:
          v34 = operator new(0x188uLL);
          sub_1001E9828((uint64_t)v34);
          uint64_t v35 = *((void *)v15 + 13);
          *((void *)v15 + 13) = v36;
          if (v35) {
            sub_100163C84((uint64_t)v15 + 104, v35);
          }
          sub_10016300C((uint64_t)v15 + 112);
          id v15 = v15;
          goto LABEL_26;
        }
      }

      objc_initWeak((id *)&location, v15);
      v33 = (void *)*((void *)v15 + 12);
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472LL;
      v40[2] = sub_100161604;
      v40[3] = &unk_1007A1CC8;
      objc_copyWeak(&v41, (id *)&location);
      [v33 activateWithCompletion:v40];
      objc_destroyWeak(&v41);
      objc_destroyWeak((id *)&location);
      goto LABEL_23;
    }

    if (a5)
    {
      v44[0] = NSLocalizedFailureReasonErrorKey;
      v44[1] = NSLocalizedRecoverySuggestionErrorKey;
      v45[0] = @"Invalid monitoring option.";
      v45[1] = @"AlwaysOn is not currently supported, remove from configuration.";
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v45,  v44,  2LL));
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  v19));
    }

    id v15 = 0LL;
  }

- (duration<long)nominalCycleRate
{
  return (duration<long long, std::ratio<1, 1000>>)2000LL;
}

- (id)lastConfiguration
{
  return *((id *)self + 41);
}

- (id)getQueueForInputingData
{
  return *((id *)self + 10);
}

- (void)consumeBluetoothSample:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 10));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);

    if (v6)
    {
      if (([*((id *)self + 41) allowedDevices] & 8) != 0
        && +[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild")
        && os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG))
      {
        sub_1003916A0();
      }

      v7 = (void *)objc_claimAutoreleasedReturnValue([*((id *)self + 41) token]);
      BOOL v8 = v7 == 0LL;

      if (v8)
      {
        uint64_t v12 = objc_alloc(&OBJC_CLASS___NIDiscoveryToken);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 dataUsingEncoding:4]);
        id v15 = -[NIDiscoveryToken initWithBytes:](v12, "initWithBytes:", v14);
      }

      else
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);
        unsigned int v10 = [v9 isEqualToString:@"NONE"];

        if (v10)
        {
          uint64_t v11 = (os_log_s *)qword_1008000A0;
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v4;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#ses-devicepresence,No model information while bt finding for sample: %@",  buf,  0xCu);
          }

          goto LABEL_63;
        }

        id v15 = (NIDiscoveryToken *)objc_claimAutoreleasedReturnValue([*((id *)self + 41) token]);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue([*((id *)self + 41) innerBoundary]);
      if ([v16 devicePresencePreset] == (id)3)
      {
        [v4 rssi];
        BOOL v18 = v17 < -61.0;

        if (v18)
        {
          v19 = (os_log_s *)(id)qword_1008000A0;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            [v4 rssi];
            uint64_t v21 = v20;
            unsigned int v22 = [v4 channel];
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
            *(_DWORD *)buf = 134218754;
            *(void *)&buf[4] = v21;
            __int16 v78 = 1024;
            unsigned int v79 = v22;
            __int16 v80 = 2112;
            *(void *)v81 = v23;
            *(_WORD *)&v81[8] = 2048;
            *(void *)&v81[10] = -[NIDiscoveryToken hash](v15, "hash");
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "#ses-devicepresence,Ignoring weak RSSI %f on channel %d for device: %@ (device hash: 0x%lx) because we can not trust weak RSSI due to a BT FW bug",  buf,  0x26u);
          }

          goto LABEL_63;
        }
      }

      else
      {
      }

      v73 = 0LL;
      v74 = 0LL;
      uint64_t v75 = 0LL;
      v24 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
      v25 = (void *)objc_claimAutoreleasedReturnValue([v24 dataUsingEncoding:4]);

      id v26 = [v25 length];
      v27 = 0LL;
      if (v26)
      {
        sub_1000353EC((unint64_t *)&v73, (size_t)v26);
        v27 = v73;
      }

      else if (v74 != v73)
      {
        v74 = v73;
      }

      objc_msgSend(v25, "getBytes:length:", v27, objc_msgSend(v25, "length"));
      std::mutex::lock((std::mutex *)self + 3);
      *(void *)buf = -[NIDiscoveryToken hash](v15, "hash");
      if (!sub_100046FEC((void *)self + 19, (unint64_t *)buf))
      {
        v28 = -[NINearbyObject initWithToken:](objc_alloc(&OBJC_CLASS___NINearbyObject), "initWithToken:", v15);
        v29 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
        -[NINearbyObject setDeviceIdentifier:](v28, "setDeviceIdentifier:", v29);

        v30 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        -[NINearbyObject setName:](v28, "setName:", v30);

        v76 = -[NIDiscoveryToken hash](v15, "hash");
        *(void *)buf = &v76;
        v31 = sub_100163D24((uint64_t)self + 152, (unint64_t *)&v76, (uint64_t)&unk_1004242F8, (void **)buf);
        BOOL v32 = (void *)v31[3];
        v31[3] = v28;
      }

      std::mutex::unlock((std::mutex *)self + 3);
      v33 = (void *)objc_claimAutoreleasedReturnValue([v4 partIdentifier]);
      if ([v33 isEqualToString:&stru_1007C41E0])
      {
        id v34 = -[NIDiscoveryToken hash](v15, "hash");
      }

      else
      {
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v4 partIdentifier]);
        id v34 = [v35 hash];
      }

      if (!v34
        && +[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild")
        && os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG))
      {
        sub_100391640();
      }

      if (!-[NIServerDevicePresenceSession airPodsProxCardSampleTooOld:](self, "airPodsProxCardSampleTooOld:", v4))
      {
        [v4 machContinuousTimeSeconds];
        double v37 = v36;
        [v4 rssi];
        double v39 = v38;
        int v40 = [v4 channel];
        id v41 = objc_claimAutoreleasedReturnValue([v4 model]);
        sub_1000065CC(__p, (char *)[v41 UTF8String]);
        sub_100163B9C( (uint64_t)buf,  v40,  (__int128 *)__p,  (uint64_t)&v73,  -[NIDiscoveryToken hash](v15, "hash"),  (uint64_t)v34,  v37,  v39);
        if (v72 < 0) {
          operator delete(__p[0]);
        }

        [*((id *)self + 8) acceptBluetoothSample:buf coarseEstimation:0 regionCategory:0];
        sub_1001E9880(*((std::string **)self + 13), (const std::string *)buf);
        v42 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  *((dispatch_queue_t *)self + 10));
        objc_super v43 = (void *)objc_claimAutoreleasedReturnValue([*((id *)self + 41) innerBoundary]);
        BOOL v44 = [v43 devicePresencePreset] == (id)3;

        if (v44) {
          double v45 = 120.0;
        }
        else {
          double v45 = 60.0;
        }
        v46 = (void *)objc_claimAutoreleasedReturnValue([*((id *)self + 41) token]);
        BOOL v47 = v46 == 0LL;

        double v48 = 10.0;
        if (v47)
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue([*((id *)self + 41) innerBoundary]);
          if ([v49 devicePresencePreset] == (id)1)
          {
            v50 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);
            unsigned int v51 = -[NIServerDevicePresenceSession isAirPods:](self, "isAirPods:", CBProductIDFromNSString());

            if (v51) {
              double v48 = 5.0;
            }
            else {
              double v48 = v45;
            }
          }

          else
          {

            double v48 = v45;
          }
        }

        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
        [v52 doubleForKey:@"NIDevicePresenceSampleTimeoutOverrideSeconds"];
        if (v53 >= 300.0 || v53 <= 1.0) {
          double v55 = v48;
        }
        else {
          double v55 = v53;
        }
        dispatch_time_t v56 = dispatch_walltime(0LL, (uint64_t)(v55 * 1000000000.0));
        dispatch_source_set_timer(v42, v56, (uint64_t)(v55 * 1000000000.0), 0LL);
        objc_initWeak(&location, self);
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472LL;
        handler[2] = sub_100162284;
        handler[3] = &unk_1007B1A78;
        objc_copyWeak(v69, &location);
        v69[1] = *(id *)&v55;
        v57 = v15;
        v66 = v57;
        v58 = v42;
        v67 = v58;
        v68 = self;
        dispatch_source_set_event_handler(v58, handler);
        v59 = (void *)((char *)self + 256);
        v76 = -[NIDiscoveryToken hash](v57, "hash");
        v60 = sub_100046FEC(v59, (unint64_t *)&v76);
        if (v60) {
          dispatch_source_cancel((dispatch_source_t)v60[3]);
        }
        unint64_t v64 = -[NIDiscoveryToken hash](v57, "hash");
        v76 = (id *)&v64;
        v61 = sub_100164004((uint64_t)v59, &v64, (uint64_t)&unk_1004242F8, &v76);
        v62 = (void *)v61[3];
        v61[3] = v58;
        v63 = v58;

        dispatch_resume(v63);
        objc_destroyWeak(v69);
        objc_destroyWeak(&location);

        if (v83)
        {
          v84 = v83;
          operator delete(v83);
        }

        if (v82 < 0) {
          operator delete(*(void **)&v81[4]);
        }
      }

      if (v73)
      {
        v74 = v73;
        operator delete(v73);
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
    {
      sub_1003915E0();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_100391580();
  }

- (BOOL)isInteresetedInSample:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (unint64_t)[*((id *)self + 41) allowedDevices];
  if (v5 < 6 && ((0x33u >> v5) & 1) != 0) {
    goto LABEL_8;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);
  if ([v6 isEqualToString:&stru_1007C41E0])
  {

LABEL_8:
    LOBYTE(self) = 0;
    goto LABEL_9;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);

  if (!v7) {
    goto LABEL_8;
  }
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);
  uint64_t v9 = CBProductIDFromNSString();

  if ([*((id *)self + 41) allowedDevices] == (id)8)
  {
    LOBYTE(self) = -[NIServerDevicePresenceSession isAirPods:](self, "isAirPods:", v9);
    goto LABEL_9;
  }

  if (([*((id *)self + 41) allowedDevices] & 8) != 0)
  {
    LOBYTE(self) = 1;
    goto LABEL_9;
  }

  LOBYTE(self) = 0;
  if ((int)v9 <= 8193)
  {
  }

  else if ((v9 - 8194) > 0x24 || ((1LL << (v9 - 2)) & 0x1C7BB7FF9BLL) == 0)
  {
LABEL_19:
    LODWORD(self) = sub_10016264C(v9) ^ 1;
  }

- (BOOL)isInterestedInSamplesForDevice:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (unint64_t)[*((id *)self + 41) allowedDevices];
  if (v5 < 6 && ((0x33u >> v5) & 1) != 0) {
    goto LABEL_12;
  }
  if (![v4 rssi])
  {
    v14 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 idsDeviceID]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);
      int v24 = 138412546;
      v25 = v15;
      __int16 v26 = 2112;
      v27 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "#ses-devicepresence,Dropping BT RSSI sample for device: %@ which is of model: %@ because reported RSSI is UNKNOWN",  (uint8_t *)&v24,  0x16u);
    }

    goto LABEL_11;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue([*((id *)self + 41) token]);

  v7 = (void *)*((void *)self + 41);
  if (v6)
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 token]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectInRawTokenOPACKDictForKey:&off_1007D2388]);

    id v10 = [v9 length];
    if (v10 != (id)6)
    {
      if (v10 != (id)7)
      {
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
          sub_100391700();
        }
        unsigned __int8 v13 = 0;
        goto LABEL_20;
      }

      uint64_t v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subdataWithRange:", 1, (char *)objc_msgSend( v9,  "length") - 1));

      uint64_t v9 = (void *)v11;
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 btAddressData]);
    unsigned __int8 v13 = [v9 isEqualToData:v12];

LABEL_20:
    goto LABEL_29;
  }

  if (([v7 allowedDevices] & 8) == 0)
  {
    double v17 = (void *)objc_claimAutoreleasedReturnValue([v4 idsDeviceID]);

    if (!v17) {
      goto LABEL_12;
    }
    BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);

    if (v18)
    {
      BOOL v19 = ((unint64_t)[v4 deviceFlags] & 0x380) == 0;
LABEL_26:
      unsigned __int8 v13 = !v19;
      goto LABEL_29;
    }

    v14 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v4 idsDeviceID]);
      int v24 = 138412290;
      v25 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "#ses-devicepresence,Dropping BT RSSI sample for device: %@ which does not have model info",  (uint8_t *)&v24,  0xCu);
    }

- (BOOL)supportsCameraAssistance
{
  return +[NIPlatformInfo supportsARKit](&OBJC_CLASS___NIPlatformInfo, "supportsARKit");
}

- (BOOL)supportsDevicePresence
{
  return 1;
}

- (BOOL)supportsSessionObservers
{
  return 1;
}

- (id)configure
{
  if (!*((void *)self + 41)) {
    sub_100391760();
  }
  v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *((void *)self + 41);
    *(_DWORD *)buf = 138412290;
    uint64_t v26 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#ses-devicepresence,Configure. Configuration given: %@",  buf,  0xCu);
  }

  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___NIServerDevicePresenceSession;
  unint64_t v5 = -[NIServerBaseSession resourcesManager](&v24, "resourcesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (*((void *)self + 8)) {
    goto LABEL_15;
  }
  v7 = objc_alloc(&OBJC_CLASS___NINearbyUpdatesEngine);
  uint64_t v8 = *((void *)self + 41);
  uint64_t v9 = *((void *)self + 10);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 analytics]);
  uint64_t v11 = (std::__shared_weak_count *)*((void *)self + 7);
  uint64_t v22 = *((void *)self + 6);
  uint64_t v23 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      unint64_t v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }

  id v21 = 0LL;
  v14 = -[NINearbyUpdatesEngine initWithConfiguration:queue:delegate:dataSource:analyticsManager:protobufLogger:error:]( v7,  "initWithConfiguration:queue:delegate:dataSource:analyticsManager:protobufLogger:error:",  v8,  v9,  self,  self,  v10,  &v22,  &v21);
  id v15 = v21;
  v16 = (void *)*((void *)self + 8);
  *((void *)self + 8) = v14;

  double v17 = v23;
  if (v23)
  {
    BOOL v18 = (unint64_t *)&v23->__shared_owners_;
    do
      unint64_t v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }

  if (*((void *)self + 8))
  {

LABEL_15:
    id v15 = 0LL;
  }

  return v15;
}

- (id)run
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NIServerDevicePresenceSession;
  v3 = -[NIServerBaseSession resourcesManager](&v16, "resourcesManager");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (char *)[*((id *)self + 41) allowedDevices];
  if ((unint64_t)(v5 - 6) < 0xA || (unint64_t)(v5 - 2) < 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([*((id *)self + 41) token]);

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v4 devicePresenceResource]);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 internalObserver]);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*((id *)self + 41) token]);
      [v8 startHighPriorityScanningForToken:v9 forConsumer:self];
    }

    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v4 devicePresenceResource]);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 internalObserver]);
      [v8 startLeechingForConsumer:self];
    }
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 lifecycleSupervisor]);
  [v10 runWithConfigurationCalled];

  uint64_t v11 = (std::string *)*((void *)self + 13);
  double v12 = sub_100023CC4();
  id v13 = objc_claimAutoreleasedReturnValue([v4 clientProcessNameBestGuess]);
  sub_1000065CC(&__p, (char *)[v13 UTF8String]);
  sub_1001E9874(v11, &__p, v12);

  *((_BYTE *)self + 72) = 1;
  return 0LL;
}

- (id)pauseWithSource:(int64_t)a3
{
  *((_BYTE *)self + 72) = 0;
  sub_10016300C((uint64_t)self + 112);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerDevicePresenceSession _disableAllServicesAndSendHangupSignal:]( self,  "_disableAllServicesAndSendHangupSignal:",  0LL));
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NIServerDevicePresenceSession;
  unint64_t v5 = -[NIServerBaseSession resourcesManager](&v17, "resourcesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 lifecycleSupervisor]);
  [v7 pauseCalled];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 devicePresenceResource]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 internalObserver]);
  [v9 stopLeechingForConsumer:self];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([*((id *)self + 41) token]);
  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 devicePresenceResource]);
    double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 internalObserver]);
    [v12 stopHighPriorityScanning];
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([*((id *)self + 41) token]);

  if (v13)
  {
    uint64_t v14 = *((void *)self + 13);
    double v15 = sub_100023CC4();
    sub_1001E9A38(v14, v15);
  }

  return v4;
}

- (id)disableAllServices
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NIServerDevicePresenceSession;
  v3 = -[NIServerBaseSession resourcesManager](&v8, "resourcesManager");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 devicePresenceResource]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 internalObserver]);
  [v6 stopLeechingForConsumer:self];

  return (id)objc_claimAutoreleasedReturnValue( -[NIServerDevicePresenceSession _disableAllServicesAndSendHangupSignal:]( self,  "_disableAllServicesAndSendHangupSignal:",  1LL));
}

- (void)invalidate
{
  *((_BYTE *)self + 72) = 0;
  sub_10016300C((uint64_t)self + 112);
  [*((id *)self + 12) invalidate];
  id v3 = -[NIServerDevicePresenceSession disableAllServices](self, "disableAllServices");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*((id *)self + 41) token]);

  if (v4)
  {
    uint64_t v5 = *((void *)self + 13);
    double v6 = sub_100023CC4();
    sub_1001E9A38(v5, v6);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NIServerDevicePresenceSession;
  -[NIServerBaseSession invalidate](&v7, "invalidate");
}

- (id)_disableAllServicesAndSendHangupSignal:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NIServerDevicePresenceSession;
  id v4 = -[NIServerBaseSession disableAllServices](&v8, "disableAllServices", a3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_10016300C((uint64_t)self + 112);
  [*((id *)self + 8) invalidate];
  double v6 = (void *)*((void *)self + 8);
  *((void *)self + 8) = 0LL;

  return v5;
}

- (id)discoveryTokenFromIdentifier:(unint64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerDevicePresenceSession objectFromIdentifier:](self, "objectFromIdentifier:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 discoveryToken]);

  return v4;
}

- (optional<unsigned)identifierFromDiscoveryToken:(id)a3
{
  id v3 = [a3 hash];
  BOOL v4 = 1LL;
  result.__engaged_ = v4;
  result.var0 = ($BEC950A715106DE229A2E4BA1089E24D)v3;
  return result;
}

- (id)objectFromIdentifier:(unint64_t)a3
{
  unint64_t v15 = a3;
  BOOL v4 = (std::mutex *)((char *)self + 192);
  std::mutex::lock((std::mutex *)self + 3);
  uint64_t v5 = sub_100046FEC((void *)self + 19, &v15);
  if (v5)
  {
    id v6 = (id)v5[3];
  }

  else
  {
    objc_super v7 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_100391788((uint64_t)&v15, v7, v8, v9, v10, v11, v12, v13);
    }
    id v6 = 0LL;
  }

  std::mutex::unlock(v4);
  return v6;
}

- (void)processVisionInput:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 10));
  [*((id *)self + 8) acceptVisionInput:v4];
}

- (void)updatesEngine:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6 regionTransitionSuppressed:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  unint64_t v14 = (unint64_t)a5;
  unint64_t v15 = (unint64_t)a6;
  objc_super v16 = (void *)v15;
  if (*((id *)self + 8) != v12) {
    __assert_rtn( "-[NIServerDevicePresenceSession updatesEngine:object:didUpdateRegion:previousRegion:regionTransitionSuppressed:]",  "NIServerDevicePresenceSession.mm",  750,  "engine == _updatesEngine");
  }
  if (v14 | v15 && !a7)
  {
    objc_super v17 = (dispatch_queue_s *)*((void *)self + 10);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100163520;
    v18[3] = &unk_1007B1AA0;
    v18[4] = self;
    id v19 = (id)v14;
    id v20 = v16;
    id v21 = v13;
    dispatch_async(v17, v18);
  }
}

- (void)updatesEngine:(id)a3 didUpdateNearbyObjects:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*((id *)self + 41) token]);

  if (v6)
  {
    objc_super v7 = (dispatch_queue_s *)*((void *)self + 10);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100163718;
    v8[3] = &unk_1007A2248;
    v8[4] = self;
    id v9 = v5;
    dispatch_async(v7, v8);
  }
}

- (BOOL)airPodsProxCardSampleTooOld:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*((id *)self + 41) innerBoundary]);
  if ([v5 devicePresencePreset] == (id)1)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);
    BOOL v7 = -[NIServerDevicePresenceSession isAirPods:](self, "isAirPods:", CBProductIDFromNSString());

    if (v7)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      [v8 doubleForKey:@"NIDevicePresenceMaxSampleAgeOverrideSeconds"];
      if (v9 >= 600.0 || v9 <= 1.0) {
        double v11 = 5.0;
      }
      else {
        double v11 = v9;
      }
      double v12 = sub_100023CC4();
      [v4 machContinuousTimeSeconds];
      double v14 = v13;
      LOBYTE(v7) = v13 < v12 - v11;
      if (v13 < v12 - v11)
      {
        unint64_t v15 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
        {
          int v17 = 134218240;
          double v18 = v14;
          __int16 v19 = 2048;
          double v20 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "#ses-devicepresence,Ignoring sample with a timestamp of %f, which is more than %f seconds old.",  (uint8_t *)&v17,  0x16u);
        }
      }
    }
  }

  else
  {

    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)isAirPods:(unsigned int)a3
{
  return (a3 - 8194 < 0x23) & (0x452863001uLL >> (a3 - 2));
}

- (NIDevicePresenceConfiguration)configuration
{
  return (NIDevicePresenceConfiguration *)objc_getProperty(self, a2, 328LL, 1);
}

- (void).cxx_destruct
{
  uint64_t v3 = *((void *)self + 13);
  *((void *)self + 13) = 0LL;
  if (v3) {
    sub_100163C84((uint64_t)self + 104, v3);
  }
  objc_storeStrong((id *)self + 12, 0LL);
  objc_storeStrong((id *)self + 11, 0LL);
  objc_storeStrong((id *)self + 10, 0LL);
  objc_storeStrong((id *)self + 8, 0LL);
  sub_100012390((uint64_t)self + 48);
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0LL;
  *((void *)self + 7) = 0LL;
  *((void *)self + 13) = 0LL;
  *((_BYTE *)self + 112) = 0;
  *((_BYTE *)self + 144) = 0;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *((_DWORD *)self + 46) = 1065353216;
  *((void *)self + 24) = 850045863LL;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 232) = 0u;
  *((void *)self + 31) = 0LL;
  *((_OWORD *)self + 16) = 0u;
  *((_OWORD *)self + 17) = 0u;
  *((_DWORD *)self + 72) = 1065353216;
  *((_BYTE *)self + 312) = 0;
  *((_BYTE *)self + 320) = 0;
  return self;
}

@end