@interface W5RapportClient
- (BOOL)_configureDiscoveryClient;
- (BOOL)isDiscoveringDevices;
- (OS_dispatch_queue)queue;
- (RPCompanionLinkClient)discoveryClient;
- (RPCompanionLinkClient)localDeviceClient;
- (W5RapportClient)init;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)sendMessageToDevice:(id)a3 request:(id)a4;
- (void)_handleDeviceFound:(id)a3;
- (void)_handleDeviceLost:(id)a3;
- (void)_invalidateRapportClient;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDiscoveringDevices:(BOOL)a3;
- (void)setDiscoveryClient:(id)a3;
- (void)setLocalDeviceClient:(id)a3;
- (void)setQueue:(id)a3;
- (void)startDiscoveringDevices;
- (void)stopDiscoveryingDevices;
@end

@implementation W5RapportClient

- (W5RapportClient)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___W5RapportClient;
  v2 = -[W5RapportClient init](&v11, "init");
  if (v2)
  {
    if (+[W5FeatureAvailability diagnosticsModeEnabled](&OBJC_CLASS___W5FeatureAvailability, "diagnosticsModeEnabled"))
    {
      dispatch_queue_t v3 = dispatch_queue_create("com.apple.wifi.W5RapportClient", 0LL);
      queue = v2->_queue;
      v2->_queue = (OS_dispatch_queue *)v3;

      if (v2->_queue)
      {
        v2->_discoveringDevices = 0;
        return v2;
      }
    }

    else
    {
      uint64_t v6 = sub_10008C90C();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315650;
        v13 = "-[W5RapportClient init]";
        __int16 v14 = 2080;
        v15 = "W5RapportClient.m";
        __int16 v16 = 1024;
        int v17 = 59;
        LODWORD(v10) = 28;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "[wifivelocity] %s (%s:%u) rapport client is not available",  (const char *)&v12,  v10,  LODWORD(v11.receiver));
      }
    }
  }

  uint64_t v8 = sub_10008C90C();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315650;
    v13 = "-[W5RapportClient init]";
    __int16 v14 = 2080;
    v15 = "W5RapportClient.m";
    __int16 v16 = 1024;
    int v17 = 72;
    LODWORD(v10) = 28;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] %s (%s:%u) init error!",  (const char *)&v12,  v10,  LODWORD(v11.receiver));
  }

  return 0LL;
}

- (BOOL)_configureDiscoveryClient
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[W5RapportClient discoveryClient](self, "discoveryClient"));

  if (v3)
  {
    LOBYTE(v4) = 1;
  }

  else
  {
    v5 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
    BOOL v4 = v5 != 0LL;
    if (v5)
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[W5RapportClient queue](self, "queue"));
      -[RPCompanionLinkClient setDispatchQueue:](v5, "setDispatchQueue:", v6);

      -[RPCompanionLinkClient setControlFlags:]( v5,  "setControlFlags:",  (unint64_t)-[RPCompanionLinkClient controlFlags](v5, "controlFlags") | 0x818126);
      -[RPCompanionLinkClient setServiceType:](v5, "setServiceType:", @"com.apple.wifivelocityd.rapportWake");
      objc_initWeak(&location, self);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_100046130;
      v18[3] = &unk_1000D2818;
      objc_copyWeak(&v19, &location);
      -[RPCompanionLinkClient setInvalidationHandler:](v5, "setInvalidationHandler:", v18);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100046228;
      v16[3] = &unk_1000D2868;
      v16[4] = self;
      objc_copyWeak(&v17, &location);
      -[RPCompanionLinkClient setDeviceFoundHandler:](v5, "setDeviceFoundHandler:", v16);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_100046320;
      v14[3] = &unk_1000D2890;
      objc_copyWeak(&v15, &location);
      -[RPCompanionLinkClient setDeviceLostHandler:](v5, "setDeviceLostHandler:", v14);
      -[RPCompanionLinkClient setDeviceChangedHandler:](v5, "setDeviceChangedHandler:", &stru_1000D28D0);
      -[RPCompanionLinkClient setLocalDeviceUpdatedHandler:](v5, "setLocalDeviceUpdatedHandler:", &stru_1000D2910);
      uint64_t v7 = sub_10008C90C();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 136315650;
        v22 = "-[W5RapportClient _configureDiscoveryClient]";
        __int16 v23 = 2080;
        v24 = "W5RapportClient.m";
        __int16 v25 = 1024;
        int v26 = 125;
        LODWORD(v12) = 28;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] %s (%s:%u) companion link client activated successfully",  (const char *)&v21,  v12,  v13);
      }

      -[W5RapportClient setDiscoveryClient:](self, "setDiscoveryClient:", v5);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }

    else
    {
      uint64_t v9 = sub_10008C90C();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 136315650;
        v22 = "-[W5RapportClient _configureDiscoveryClient]";
        __int16 v23 = 2080;
        v24 = "W5RapportClient.m";
        __int16 v25 = 1024;
        int v26 = 85;
        LODWORD(v12) = 28;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "[wifivelocity] %s (%s:%u) failed to init rapport client",  (const char *)&v21,  v12,  v13);
      }
    }
  }

  return v4;
}

- (void)_invalidateRapportClient
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[W5RapportClient discoveryClient](self, "discoveryClient"));
  [v3 invalidate];

  -[W5RapportClient setDiscoveryClient:](self, "setDiscoveryClient:", 0LL);
}

- (void)_handleDeviceFound:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_10008C90C();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    else {
      uint64_t v7 = @"NO";
    }
    else {
      uint64_t v8 = @"NO";
    }
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceTypes]);
    else {
      v10 = @"NO";
    }
    if (v4)
    {
      [v4 operatingSystemVersion];
      uint64_t v11 = v23;
      [v4 operatingSystemVersion];
      uint64_t v12 = v21;
      [v4 operatingSystemVersion];
      uint64_t v13 = v19;
    }

    else
    {
      uint64_t v13 = 0LL;
      uint64_t v12 = 0LL;
      uint64_t v11 = 0LL;
      uint64_t v23 = 0LL;
      uint64_t v24 = 0LL;
      uint64_t v25 = 0LL;
      uint64_t v21 = 0LL;
      uint64_t v22 = 0LL;
      uint64_t v19 = 0LL;
      uint64_t v20 = 0LL;
      uint64_t v17 = 0LL;
      uint64_t v18 = 0LL;
    }

    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%ld.%ld.%ld",  v11,  v12,  v13,  v17,  v18,  v19,  v20,  v21,  v22,  v23,  v24,  v25));
    v27 = "-[W5RapportClient _handleDeviceFound:]";
    __int16 v28 = 2080;
    int v26 = 136316930;
    v29 = "W5RapportClient.m";
    __int16 v30 = 1024;
    int v31 = 145;
    __int16 v32 = 2114;
    id v33 = v4;
    __int16 v34 = 2112;
    v35 = v7;
    __int16 v36 = 2112;
    v37 = v8;
    __int16 v38 = 2112;
    v39 = v10;
    __int16 v40 = 2112;
    v41 = v14;
    LODWORD(v16) = 78;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "[wifivelocity] %s (%s:%u) rapport device found='%{public}@', BLE: %@, Infra: %@, hasVelocityServiceType: %@, osVersion: %@",  &v26,  v16);
  }

  deviceFoundHandler = (void (**)(id, id))self->_deviceFoundHandler;
  if (deviceFoundHandler) {
    deviceFoundHandler[2](deviceFoundHandler, v4);
  }
}

- (void)_handleDeviceLost:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_10008C90C();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315906;
    v10 = "-[W5RapportClient _handleDeviceLost:]";
    __int16 v11 = 2080;
    uint64_t v12 = "W5RapportClient.m";
    __int16 v13 = 1024;
    int v14 = 154;
    __int16 v15 = 2114;
    id v16 = v4;
    int v8 = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "[wifivelocity] %s (%s:%u) rapport device lost='%{public}@'",  &v9,  v8);
  }

  deviceFoundHandler = (void (**)(id, id))self->_deviceFoundHandler;
  if (deviceFoundHandler) {
    deviceFoundHandler[2](deviceFoundHandler, v4);
  }
}

- (void)startDiscoveringDevices
{
  if (self->_discoveringDevices)
  {
    uint64_t v2 = sub_10008C90C();
    dispatch_queue_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id location = 136315650;
      *(void *)&location[4] = "-[W5RapportClient startDiscoveringDevices]";
      __int16 v14 = 2080;
      __int16 v15 = "W5RapportClient.m";
      __int16 v16 = 1024;
      int v17 = 164;
      LODWORD(v9) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v3,  0LL,  "[wifivelocity] %s (%s:%u) discovery is already active",  location,  v9,  v10);
    }

- (void)stopDiscoveryingDevices
{
  BOOL discoveringDevices = self->_discoveringDevices;
  uint64_t v4 = sub_10008C90C();
  unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (discoveringDevices)
  {
    if (v6)
    {
      int v7 = 136315650;
      int v8 = "-[W5RapportClient stopDiscoveryingDevices]";
      __int16 v9 = 2080;
      int v10 = "W5RapportClient.m";
      __int16 v11 = 1024;
      int v12 = 189;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v5,  0LL,  "[wifivelocity] %s (%s:%u) stoping device discovery",  (const char *)&v7,  28);
    }

    -[W5RapportClient _invalidateRapportClient](self, "_invalidateRapportClient");
    self->_BOOL discoveringDevices = 0;
  }

  else
  {
    if (v6)
    {
      int v7 = 136315650;
      int v8 = "-[W5RapportClient stopDiscoveryingDevices]";
      __int16 v9 = 2080;
      int v10 = "W5RapportClient.m";
      __int16 v11 = 1024;
      int v12 = 193;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v5,  0LL,  "[wifivelocity] %s (%s:%u) discovery is not active",  (const char *)&v7,  28);
    }
  }

- (id)sendMessageToDevice:(id)a3 request:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
  -[RPCompanionLinkClient setDestinationDevice:](v7, "setDestinationDevice:", v5);
  uint64_t v8 = sub_10008C90C();
  __int16 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id location = 136316162;
    *(void *)&location[4] = "-[W5RapportClient sendMessageToDevice:request:]";
    __int16 v25 = 2080;
    int v26 = "W5RapportClient.m";
    __int16 v27 = 1024;
    int v28 = 204;
    __int16 v29 = 2112;
    id v30 = v6;
    __int16 v31 = 2112;
    id v32 = v5;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] %s (%s:%u) [Rapport] Request: %@, Destination: %@",  location,  48);
  }

  int v10 = (void *)objc_claimAutoreleasedReturnValue([v5 model]);
  if ([v10 containsString:@"Mac"])
  {
  }

  else
  {
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v6 peer]);
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 model]);
    unsigned __int8 v13 = [v12 containsString:@"Mac"];

    if ((v13 & 1) == 0) {
      -[RPCompanionLinkClient setServiceType:](v7, "setServiceType:", @"com.apple.wifivelocityd.rapportWake");
    }
  }

  BOOL v14 = ((unint64_t)[v6 controlFlags] & 1) == 0;
  unint64_t v15 = (unint64_t)-[RPCompanionLinkClient controlFlags](v7, "controlFlags");
  uint64_t v16 = 6291712LL;
  if (v14) {
    uint64_t v16 = 4227334LL;
  }
  -[RPCompanionLinkClient setControlFlags:](v7, "setControlFlags:", v16 | v15);
  -[RPCompanionLinkClient setInvalidationHandler:](v7, "setInvalidationHandler:", &stru_1000D2958);
  objc_initWeak((id *)location, v7);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000470F4;
  v20[3] = &unk_1000D29A8;
  objc_copyWeak(&v23, (id *)location);
  id v17 = v6;
  id v21 = v17;
  id v18 = v5;
  id v22 = v18;
  -[RPCompanionLinkClient activateWithCompletion:](v7, "activateWithCompletion:", v20);

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)location);

  return 0LL;
}

- (BOOL)isDiscoveringDevices
{
  return self->_discoveringDevices;
}

- (void)setDiscoveringDevices:(BOOL)a3
{
  self->_BOOL discoveringDevices = a3;
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
}

- (RPCompanionLinkClient)localDeviceClient
{
  return self->_localDeviceClient;
}

- (void)setLocalDeviceClient:(id)a3
{
}

- (RPCompanionLinkClient)discoveryClient
{
  return self->_discoveryClient;
}

- (void)setDiscoveryClient:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end