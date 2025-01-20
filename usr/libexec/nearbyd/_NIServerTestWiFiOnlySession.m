@interface _NIServerTestWiFiOnlySession
- (_NIServerTestWiFiOnlySession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5;
- (_NIWiFiRangingTestConfiguration)configuration;
- (duration<long)nominalCycleRate;
- (id).cxx_construct;
- (id)_addPeers:(id)a3;
- (id)_disableWiFiAndReturnError;
- (id)_removePeers:(id)a3;
- (id)addObject:(id)a3;
- (id)configure;
- (id)disableAllServices;
- (id)lastConfiguration;
- (id)pauseWithSource:(int64_t)a3;
- (id)removeObject:(id)a3;
- (id)run;
- (unint64_t)requiresSpatialInteractionBluetoothResource;
- (void)_handleFailedToAddPeer;
- (void)_handleFailedToRemovePeer;
- (void)_stopWiFiRanging:(id)a3;
- (void)_triggerWiFiRanging:(id)a3;
- (void)bluetoothAdvertisingAddressChanged:(unint64_t)a3;
- (void)device:(id)a3 rediscovered:(id)a4;
- (void)deviceDiscovered:(id)a3;
- (void)deviceLost:(id)a3;
- (void)invalidate;
- (void)peerInactivityPeriodExceeded:(id)a3;
- (void)updatesEngine:(id)a3 didUpdateNearbyObjects:(id)a4;
- (void)wifiRangingRangeError:(const int *)a3;
- (void)wifiRangingRangeResults:(const void *)a3;
- (void)wifiRangingReadiness:(const int *)a3;
@end

@implementation _NIServerTestWiFiOnlySession

- (_NIServerTestWiFiOnlySession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v12 = objc_opt_class(v10, v11);
  if (v12 != objc_opt_class(&OBJC_CLASS____NIWiFiRangingTestConfiguration, v13))
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v37 handleFailureInMethod:a2 object:self file:@"_NIServerTestWiFiOnlySession.mm" lineNumber:43 description:@"_NIWiFiRangingTestConfiguration given invalid configuration."];

    if (a5) {
      goto LABEL_3;
    }
LABEL_30:
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v38 handleFailureInMethod:a2, self, @"_NIServerTestWiFiOnlySession.mm", 44, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];

    goto LABEL_3;
  }

  if (!a5) {
    goto LABEL_30;
  }
LABEL_3:
  v42.receiver = self;
  v42.super_class = (Class)&OBJC_CLASS____NIServerTestWiFiOnlySession;
  v14 = -[NIServerBaseSession initWithResourcesManager:configuration:error:]( &v42,  "initWithResourcesManager:configuration:error:",  v9,  v10,  a5);
  if (!v14) {
    goto LABEL_27;
  }
  uint64_t v15 = objc_claimAutoreleasedReturnValue([v9 clientConnectionQueue]);
  clientQueue = v14->_clientQueue;
  v14->_clientQueue = (OS_dispatch_queue *)v15;

  v17 = (_NIWiFiRangingTestConfiguration *)[v10 copy];
  configuration = v14->_configuration;
  v14->_configuration = v17;

  v19 = objc_alloc(&OBJC_CLASS___NINearbyUpdatesEngine);
  v20 = v14->_configuration;
  v21 = v14->_clientQueue;
  v22 = (void *)objc_claimAutoreleasedReturnValue([v9 analytics]);
  if (v9)
  {
    [v9 protobufLogger];
  }

  else
  {
    uint64_t v40 = 0LL;
    v41 = 0LL;
  }

  v23 = -[NINearbyUpdatesEngine initWithConfiguration:queue:delegate:dataSource:analyticsManager:protobufLogger:error:]( v19,  "initWithConfiguration:queue:delegate:dataSource:analyticsManager:protobufLogger:error:",  v20,  v21,  v14,  v14,  v22,  &v40,  a5);
  updatesEngine = v14->_updatesEngine;
  v14->_updatesEngine = v23;

  v25 = v41;
  if (v41)
  {
    p_shared_owners = (unint64_t *)&v41->__shared_owners_;
    do
      unint64_t v27 = __ldaxr(p_shared_owners);
    while (__stlxr(v27 - 1, p_shared_owners));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }

  if (v9) {
    [v9 protobufLogger];
  }
  else {
    __int128 v39 = 0uLL;
  }
  sub_10000EE54((uint64_t)&v14->_pbLogger, &v39);
  v28 = (std::__shared_weak_count *)*((void *)&v39 + 1);
  if (*((void *)&v39 + 1))
  {
    v29 = (unint64_t *)(*((void *)&v39 + 1) + 8LL);
    do
      unint64_t v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }

  v31 = operator new(0x88uLL);
  v31[1] = 0LL;
  v31[2] = 0LL;
  void *v31 = off_1007B16C0;
  *(void *)&__int128 v39 = sub_10026E70C((_BYTE *)v31 + 24);
  *((void *)&v39 + 1) = v31;
  sub_10000EE54((uint64_t)&v14->_caManager, &v39);
  v32 = (std::__shared_weak_count *)*((void *)&v39 + 1);
  if (*((void *)&v39 + 1))
  {
    v33 = (unint64_t *)(*((void *)&v39 + 1) + 8LL);
    do
      unint64_t v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }

  if (v14->_updatesEngine) {
    v35 = v14;
  }
  else {
LABEL_27:
  }
    v35 = 0LL;

  return v35;
}

- (void)invalidate
{
  if (self->_wifiRangingSession.__ptr_.__value_)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[_NIServerTestWiFiOnlySession _disableWiFiAndReturnError](self, "_disableWiFiAndReturnError"));
    v3 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      v5 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#ses-wifi-test,Invalidate. Error: %@",  (uint8_t *)&v4,  0xCu);
    }
  }

- (id)disableAllServices
{
  p_wifiRangingSession = (uint64_t *)&self->_wifiRangingSession;
  value = self->_wifiRangingSession.__ptr_.__value_;
  if (value)
  {
    sub_100024930((const std::string *)value);
    sub_10029062C(p_wifiRangingSession, 0LL);
    sub_10029062C(p_wifiRangingSession, 0LL);
  }

  return 0LL;
}

- (duration<long)nominalCycleRate
{
  return (duration<long long, std::ratio<1, 1000>>)2000LL;
}

- (id)lastConfiguration
{
  return self->_configuration;
}

- (id)configure
{
  configuration = self->_configuration;
  if (!configuration) {
    sub_1003A4F6C();
  }
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[_NIWiFiRangingTestConfiguration peerDiscoveryToken](configuration, "peerDiscoveryToken"));

  if (!v4)
  {
    NSErrorUserInfoKey v54 = NSLocalizedFailureReasonErrorKey;
    v55 = @"Peer discovery token nil or invalid.";
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v55,  &v54,  1LL));
    uint64_t v38 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  v7));
LABEL_27:
    __int128 v39 = (void *)v38;
    goto LABEL_43;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_NIWiFiRangingTestConfiguration parameters](self->_configuration, "parameters"));

  if (!v5)
  {
    NSErrorUserInfoKey v52 = NSLocalizedFailureReasonErrorKey;
    v53 = @"Missing WiFi ranging parameters.";
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v53,  &v52,  1LL));
    uint64_t v38 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  v7));
    goto LABEL_27;
  }

  v47.receiver = self;
  v47.super_class = (Class)&OBJC_CLASS____NIServerTestWiFiOnlySession;
  v6 = -[NIServerBaseSession resourcesManager](&v47, "resourcesManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = self;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 btResource]);
  [v9 startAdvertising];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 btResource]);
  [v10 startScanning];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 btResource]);
  id v12 = [v11 nonConnectableAdvertisingAddress];
  if (v13)
  {
    v60[0] = v12;
    v14 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", v60, 6LL);
    uint64_t v15 = sub_1000141DC();
    sub_100014270((uint64_t)v15, v14);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v7 serverSessionIdentifier]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 UUIDString]);

  id v18 = v17;
  sub_1000065CC(__p, (char *)[v18 UTF8String]);
  v19 = operator new(0x198uLL);
  v20 = v8;
  v60[0] = off_1007BB0F8;
  v60[1] = v20;
  v61 = v60;
  v21 = v20;
  v58[0] = off_1007BB178;
  v58[1] = v21;
  v59 = v58;
  v22 = v21;
  v56[0] = off_1007BB1F8;
  v56[1] = v22;
  v57 = v56;
  clientQueue = v8->_clientQueue;
  ptr = v8->_pbLogger.__ptr_;
  cntrl = v8->_pbLogger.__cntrl_;
  v51 = (std::__shared_weak_count *)cntrl;
  if (cntrl)
  {
    v25 = (unint64_t *)((char *)cntrl + 8);
    do
      unint64_t v26 = __ldxr(v25);
    while (__stxr(v26 + 1, v25));
  }

  v48 = v8->_caManager.__ptr_;
  unint64_t v27 = v8->_caManager.__cntrl_;
  v49 = (std::__shared_weak_count *)v27;
  if (v27)
  {
    v28 = (unint64_t *)((char *)v27 + 8);
    do
      unint64_t v29 = __ldxr(v28);
    while (__stxr(v29 + 1, v28));
  }

  sub_100024764((uint64_t)v19, (__int128 *)__p, (uint64_t)v60, (uint64_t)v58, (uint64_t)v56, clientQueue, &ptr, &v48);
  unint64_t v30 = v49;
  if (v49)
  {
    p_shared_owners = (unint64_t *)&v49->__shared_owners_;
    do
      unint64_t v32 = __ldaxr(p_shared_owners);
    while (__stlxr(v32 - 1, p_shared_owners));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }

  v33 = v51;
  if (v51)
  {
    unint64_t v34 = (unint64_t *)&v51->__shared_owners_;
    do
      unint64_t v35 = __ldaxr(v34);
    while (__stlxr(v35 - 1, v34));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }

  v36 = v57;
  if (v57 == v56)
  {
    uint64_t v37 = 4LL;
    v36 = v56;
  }

  else
  {
    if (!v57) {
      goto LABEL_30;
    }
    uint64_t v37 = 5LL;
  }

  (*(void (**)(void))(*v36 + 8 * v37))();
LABEL_30:
  uint64_t v40 = v59;
  if (v59 == v58)
  {
    uint64_t v41 = 4LL;
    uint64_t v40 = v58;
  }

  else
  {
    if (!v59) {
      goto LABEL_35;
    }
    uint64_t v41 = 5LL;
  }

  (*(void (**)(void))(*v40 + 8 * v41))();
LABEL_35:
  objc_super v42 = v61;
  if (v61 == v60)
  {
    uint64_t v43 = 4LL;
    objc_super v42 = v60;
    goto LABEL_39;
  }

  if (v61)
  {
    uint64_t v43 = 5LL;
LABEL_39:
    (*(void (**)(void))(*v42 + 8 * v43))();
  }

  sub_10029062C(v22 + 7, (uint64_t)v19);
  if (v46 < 0) {
    operator delete(__p[0]);
  }

  __int128 v39 = 0LL;
LABEL_43:

  return v39;
}

- (id)run
{
  self->_shouldDeliverUpdates = 1;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____NIServerTestWiFiOnlySession;
  v3 = -[NIServerBaseSession resourcesManager](&v11, "resourcesManager");
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lifecycleSupervisor]);
  [v5 runWithConfigurationCalled];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_NIWiFiRangingTestConfiguration peerDiscoveryToken](self->_configuration, "peerDiscoveryToken"));
  id v12 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_NIServerTestWiFiOnlySession _addPeers:](self, "_addPeers:", v7));
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003A4F94();
    }
    -[_NIServerTestWiFiOnlySession _handleFailedToAddPeer](self, "_handleFailedToAddPeer");
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 lifecycleSupervisor]);
    [v9 startedDiscoveringPeersWithTokens:v7];
  }

  return v8;
}

- (id)pauseWithSource:(int64_t)a3
{
  self->_shouldDeliverUpdates = 0;
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[_NIServerTestWiFiOnlySession disableAllServices](self, "disableAllServices", a3));
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____NIServerTestWiFiOnlySession;
  v5 = -[NIServerBaseSession resourcesManager](&v9, "resourcesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 lifecycleSupervisor]);
  [v7 pauseCalled];

  return v4;
}

- (unint64_t)requiresSpatialInteractionBluetoothResource
{
  return 2LL;
}

- (void)bluetoothAdvertisingAddressChanged:(unint64_t)a3
{
  unint64_t v5 = a3;
  v3 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", &v5, 6LL);
  int v4 = sub_1000141DC();
  sub_100014270((uint64_t)v4, v3);
}

- (void)deviceDiscovered:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NINearbyObject objectFromBluetoothDevice:]( &OBJC_CLASS___NINearbyObject,  "objectFromBluetoothDevice:",  v4));
  if (v5)
  {
    if (self->_pbLogger.__ptr_)
    {
      double v6 = sub_100023CC4();
      ptr = self->_pbLogger.__ptr_;
      id v8 = [v4 u64Identifier];
      sub_100230924(v5, (uint64_t)__p);
      sub_100239E68((uint64_t)ptr, (uint64_t)v8, (uint64_t)__p, v6);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }

    -[_NIServerTestWiFiOnlySession _triggerWiFiRanging:](self, "_triggerWiFiRanging:", v4);
  }

  else
  {
    objc_super v9 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_1003A4FF4(v9);
    }
  }
}

- (void)device:(id)a3 rediscovered:(id)a4
{
}

- (void)deviceLost:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      id v6 = [v4 u64Identifier];
    }
    else {
      id v6 = 0LL;
    }
    int v9 = 134217984;
    id v10 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#ses-wifi-test,device 0x%llx lost. stopping wifi ranging",  (uint8_t *)&v9,  0xCu);
  }

  value = self->_wifiRangingSession.__ptr_.__value_;
  if (value)
  {
    sub_100024A6C((uint64_t)value);
  }

  else
  {
    id v8 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#ses-wifi-test,no wifi ranging session to stop",  (uint8_t *)&v9,  2u);
    }
  }
}

- (id)addObject:(id)a3
{
  id v3 = a3;
  id v4 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "#ses-wifi-test,addObject noop: %@",  (uint8_t *)&v6,  0xCu);
  }

  return 0LL;
}

- (id)removeObject:(id)a3
{
  id v3 = a3;
  id v4 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "#ses-wifi-test,remove noop: %@",  (uint8_t *)&v6,  0xCu);
  }

  return 0LL;
}

- (void)_triggerWiFiRanging:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 u64Identifier];
    id v7 = (os_log_s *)qword_1008000A0;
    if (self->_wifiRangingSession.__ptr_.__value_)
    {
      uint64_t v8 = (uint64_t)v6;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        configuration = self->_configuration;
        *(_DWORD *)buf = 134218242;
        uint64_t v44 = v8;
        __int16 v45 = 2112;
        v46[0] = configuration;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#ses-wifi-test,_triggerWiFiRanging. Identifier: 0x%llx, WiFi ranging config: %@",  buf,  0x16u);
      }

      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[_NIWiFiRangingTestConfiguration parameters](self->_configuration, "parameters"));
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"RangingRole"]);

      if (v11 && (uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString, v12), (objc_opt_isKindOfClass(v11, v13) & 1) != 0))
      {
        if (([v11 isEqualToString:@"Initiator"] & 1) == 0)
        {
          if ([v11 isEqualToString:@"Responder"])
          {
            int v14 = 2;
LABEL_15:
            sub_100024390((uint64_t)buf, v8, v14);
            sub_100024E24((uint64_t)self->_wifiRangingSession.__ptr_.__value_, (uint64_t)buf);

            goto LABEL_19;
          }

          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
            sub_1003A5138();
          }
        }
      }

      else
      {
        v23 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
          sub_1003A50D0((uint64_t)&self->_configuration, v23, v24, v25, v26, v27, v28, v29);
        }
      }

      int v14 = 1;
      goto LABEL_15;
    }

    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003A5060(v7, v30, v31, v32, v33, v34, v35, v36);
    }
    v42.receiver = self;
    v42.super_class = (Class)&OBJC_CLASS____NIServerTestWiFiOnlySession;
    uint64_t v37 = -[NIServerBaseSession resourcesManager](&v42, "resourcesManager");
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v38 remote]);
    NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
    v48 = @"Failed to start WiFi service. session is nil";
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v48,  &v47,  1LL));
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  v40));
    [v39 uwbSessionDidFailWithError:v41];
  }

  else
  {
    uint64_t v15 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003A5030(v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }

- (void)_stopWiFiRanging:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 u64Identifier];
    id v7 = (os_log_s *)qword_1008000A0;
    if (self->_wifiRangingSession.__ptr_.__value_)
    {
      id v8 = v6;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        configuration = self->_configuration;
        *(_DWORD *)buf = 134218242;
        id v32 = v8;
        __int16 v33 = 2112;
        uint64_t v34 = configuration;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#ses-wifi-test,_stopWiFiRanging. Identifier: 0x%llx, WiFi ranging config: %@",  buf,  0x16u);
      }

      sub_100024A6C((uint64_t)self->_wifiRangingSession.__ptr_.__value_);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_1003A51C8(v7, v18, v19, v20, v21, v22, v23, v24);
      }
      v30.receiver = self;
      v30.super_class = (Class)&OBJC_CLASS____NIServerTestWiFiOnlySession;
      uint64_t v25 = -[NIServerBaseSession resourcesManager](&v30, "resourcesManager");
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 remote]);
      NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
      uint64_t v36 = @"Failed to stop WiFi service. session is nil";
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  v28));
      [v27 uwbSessionDidFailWithError:v29];
    }
  }

  else
  {
    id v10 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003A5198(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

- (id)_addPeers:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS____NIServerTestWiFiOnlySession;
  unint64_t v5 = -[NIServerBaseSession resourcesManager](&v20, "resourcesManager");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
LABEL_3:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v17 != v9) {
        objc_enumerationMutation(v7);
      }
      uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "btResource", (void)v16));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 rawToken]);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 addPeerDiscoveryToken:v13]);

      if (v14) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }

  else
  {
LABEL_9:
    uint64_t v14 = 0LL;
  }

  return v14;
}

- (id)_removePeers:(id)a3
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS____NIServerTestWiFiOnlySession;
  id v17 = a3;
  id v3 = -[NIServerBaseSession resourcesManager](&v22, "resourcesManager");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = v17;
  id v6 = 0LL;
  id v7 = [v5 countByEnumeratingWithState:&v18 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)v9);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 btResource]);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 rawToken]);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 removePeerDiscoveryToken:v12]);

        if (v13)
        {
          id v14 = v13;

          uint64_t v15 = (os_log_s *)qword_1008000A0;
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v24 = v14;
            _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "#ses-wifi-test,#warning, failed to remove peer with error: %@",  buf,  0xCu);
          }

          id v6 = v14;
        }

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v25 count:16];
    }

    while (v7);
  }

  return v6;
}

- (void)_handleFailedToAddPeer
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____NIServerTestWiFiOnlySession;
  id v3 = -[NIServerBaseSession resourcesManager](&v6, "resourcesManager");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lifecycleSupervisor]);
  [v5 failedToAddPeer];

  -[_NIServerTestWiFiOnlySession invalidate](self, "invalidate");
}

- (void)_handleFailedToRemovePeer
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____NIServerTestWiFiOnlySession;
  id v3 = -[NIServerBaseSession resourcesManager](&v6, "resourcesManager");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lifecycleSupervisor]);
  [v5 failedToRemovePeer];

  -[_NIServerTestWiFiOnlySession invalidate](self, "invalidate");
}

- (id)_disableWiFiAndReturnError
{
  p_wifiRangingSession = (uint64_t *)&self->_wifiRangingSession;
  value = self->_wifiRangingSession.__ptr_.__value_;
  if (value) {
    sub_100024930((const std::string *)value);
  }
  sub_10029062C(p_wifiRangingSession, 0LL);
  sub_10029062C(p_wifiRangingSession, 0LL);
  return 0LL;
}

- (void)wifiRangingRangeResults:(const void *)a3
{
}

- (void)wifiRangingRangeError:(const int *)a3
{
  if (v14 >= 0) {
    id v4 = __p;
  }
  else {
    id v4 = (void **)__p[0];
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4));
  objc_super v6 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
    sub_1003A5238(&v14, __p, v6);
  }
  NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
  __int128 v16 = v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  v7));

  clientQueue = (dispatch_queue_s *)self->_clientQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100291FFC;
  v11[3] = &unk_1007A2248;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(clientQueue, v11);

  if (v14 < 0) {
    operator delete(__p[0]);
  }
}

- (void)wifiRangingReadiness:(const int *)a3
{
  id v4 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    sub_100025844(*a3, __p);
    if (v7 >= 0) {
      id v5 = __p;
    }
    else {
      id v5 = (void **)__p[0];
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ses-wifi-test,Readiness update: %s", buf, 0xCu);
    if (v7 < 0) {
      operator delete(__p[0]);
    }
  }
}

- (void)peerInactivityPeriodExceeded:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS____NIServerTestWiFiOnlySession;
  id v5 = -[NIServerBaseSession resourcesManager](&v12, "resourcesManager");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  char v7 = (void *)objc_claimAutoreleasedReturnValue([v6 btResource]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceCache]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 rawToken]);
  unsigned __int8 v10 = [v8 uncacheDeviceByTokenData:v9];

  if ((v10 & 1) == 0 && os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
    sub_1003A531C();
  }
  if (self->_wifiRangingSession.__ptr_.__value_)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[_NIServerTestWiFiOnlySession pauseWithSource:](self, "pauseWithSource:", 2LL));
    if (v11 && os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003A52BC();
    }
  }
}

- (void)updatesEngine:(id)a3 didUpdateNearbyObjects:(id)a4
{
  id v5 = a4;
  objc_super v6 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "#ses-wifi-test,didUpdateNearbyObjects enter",  buf,  2u);
  }

  clientQueue = (dispatch_queue_s *)self->_clientQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1002923DC;
  v9[3] = &unk_1007A2248;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(clientQueue, v9);
}

- (_NIWiFiRangingTestConfiguration)configuration
{
  return (_NIWiFiRangingTestConfiguration *)objc_getProperty(self, a2, 112LL, 1);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0LL;
  *((void *)self + 10) = 0LL;
  *((void *)self + 11) = 0LL;
  *((void *)self + 12) = 0LL;
  *((void *)self + 13) = 0LL;
  return self;
}

@end