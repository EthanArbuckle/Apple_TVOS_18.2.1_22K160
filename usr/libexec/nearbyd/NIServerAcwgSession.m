@interface NIServerAcwgSession
- (BOOL)_validateLockAttributes;
- (JobConfig)_aopJobConfigWithTimeouts;
- (NIAcwgConfiguration)configuration;
- (NIServerAcwgSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5;
- (NIServerNumberResponse)isRangingLimitExceeded;
- (RequestConstructionDebugParams)_ownerDeviceServiceRequestDebugParams:(SEL)a3;
- (duration<long)nominalCycleRate;
- (id).cxx_construct;
- (id)_configureForOwnerDevice;
- (id)_setDebugURSK:(id)a3 transactionIdentifier:(unsigned int)a4;
- (id)_setURSKTTL:(unint64_t)a3;
- (id)configure;
- (id)deleteURSKs;
- (id)disableAllServices;
- (id)lastConfiguration;
- (id)pauseWithSource:(int64_t)a3;
- (id)processBluetoothHostTimeSyncWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4 eventCounter:(unint64_t)a5 monotonicTimeSec:(double)a6 response:(id *)a7;
- (id)run;
- (shared_ptr<rose::objects::AlishaSession>)_buildAlishaSession:(const void *)a3;
- (unint64_t)requiresUWBToRun;
- (void)_alishaSessionInvalidatedWithReason:(int)a3;
- (void)_alishaStateChangedFromState:(unsigned __int8)a3 toNewState:(unsigned __int8)a4;
- (void)_handleHealthChanged:(int)a3;
- (void)_handleInitiatorRangingBlockUpdate:(InitiatorRangingBlockSummary *)a3;
- (void)_handleSessionStats:(SessionStats *)a3;
- (void)_handleTimeoutEvent:(int)a3 time:(double)a4;
- (void)_sendAnalyticsOnRangingComplete:(int64_t)a3 suspendReason:(int64_t)a4;
- (void)dealloc;
- (void)didReceiveAopSensorFusionUpdate:(int)a3 withBtConnHandle:(unsigned __int16)a4;
- (void)invalidate;
- (void)prefetchAcwgUrsk:(unsigned int)a3;
- (void)processAcwgM1Msg:(id)a3 withSessionTriggerReason:(int64_t)a4;
- (void)processAcwgM3Msg:(id)a3;
- (void)processAcwgRangingSessionResumeRequestMsg:(unsigned int)a3 withResumeTriggerReason:(int64_t)a4;
- (void)processUpdatedLockState:(unsigned __int16)a3;
- (void)rangingServiceDidUpdateState:(int)a3 cause:(int)a4;
- (void)suspendAcwgRanging:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4;
@end

@implementation NIServerAcwgSession

- (NIServerAcwgSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_100394550(v11, v12, v13, v14, v15, v16, v17, v18);
  }
  uint64_t v19 = objc_opt_class(v10, v12);
  if (v19 != objc_opt_class(&OBJC_CLASS___NIAcwgConfiguration, v20))
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v34 handleFailureInMethod:a2 object:self file:@"NIServerAcwgSession.mm" lineNumber:331 description:@"NIServerAcwgSession given invalid configuration."];
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue([v9 serverSessionIdentifier]);
  BOOL v22 = v21 == 0LL;

  if (v22)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v35 handleFailureInMethod:a2, self, @"NIServerAcwgSession.mm", 332, @"Invalid parameter not satisfying: %@", @"resourcesManager.serverSessionIdentifier" object file lineNumber description];
  }

  v23 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "#ses-acwg,initWithResourcesManager. Configuration: %@",  buf,  0xCu);
  }

  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___NIServerAcwgSession;
  id v24 = -[NIServerBaseSession initWithResourcesManager:configuration:error:]( &v36,  "initWithResourcesManager:configuration:error:",  v9,  v10,  a5);
  if (v24)
  {
    uint64_t v25 = objc_claimAutoreleasedReturnValue([v9 clientConnectionQueue]);
    v26 = (void *)*((void *)v24 + 6);
    *((void *)v24 + 6) = v25;

    id v27 = [v10 copy];
    v28 = (void *)*((void *)v24 + 42);
    *((void *)v24 + 42) = v27;

    v29 = (void *)objc_claimAutoreleasedReturnValue([v9 serverSessionIdentifier]);
    uint64_t v30 = objc_claimAutoreleasedReturnValue([v29 UUIDString]);
    v31 = (void *)*((void *)v24 + 7);
    *((void *)v24 + 7) = v30;

    dispatch_queue_set_specific( *((dispatch_queue_t *)v24 + 6),  "com.apple.nearbyd.acwg-session.queue-context-key",  *((void **)v24 + 7),  0LL);
    id v32 = v24;
  }

  return (NIServerAcwgSession *)v24;
}

- (id)lastConfiguration
{
  v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_1003945C0(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  return self->_configuration;
}

- (void)invalidate
{
  v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_100394630(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  *(void *)buf = 105LL;
  sub_1001897BC(&self->_suspendReasonStack.c.__map_.__first_, buf);
  v11 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ses-acwg,invalidate.", buf, 2u);
  }

  id v12 = -[NIServerAcwgSession disableAllServices](self, "disableAllServices");
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NIServerAcwgSession;
  -[NIServerBaseSession invalidate](&v13, "invalidate");
}

- (id)disableAllServices
{
  v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_1003946A0(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  v11 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#ses-acwg,disableAllServices.",  (uint8_t *)&buf,  2u);
  }

  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___NIServerAcwgSession;
  id v12 = -[NIServerBaseSession disableAllServices](&v30, "disableAllServices");
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  ptr = self->_acwgManager.__ptr_;
  if (ptr)
  {
    sub_1002C2070(ptr);
    __int128 buf = 0uLL;
    sub_10000EE54((uint64_t)&self->_acwgManager, &buf);
    uint64_t v15 = (std::__shared_weak_count *)*((void *)&buf + 1);
    if (*((void *)&buf + 1))
    {
      uint64_t v16 = (unint64_t *)(*((void *)&buf + 1) + 8LL);
      do
        unint64_t v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
  }

  if (self->_uwbSystemListener.__ptr_)
  {
    uint64_t v18 = sub_100288340();
    cntrl = self->_uwbSystemListener.__cntrl_;
    id v27 = self->_uwbSystemListener.__ptr_;
    v28 = cntrl;
    if (cntrl)
    {
      uint64_t v20 = (unint64_t *)((char *)cntrl + 8);
      do
        unint64_t v21 = __ldxr(v20);
      while (__stxr(v21 + 1, v20));
    }

    sub_10028CB38((uint64_t)v18, (unint64_t *)&v27);
    BOOL v22 = (std::__shared_weak_count *)v28;
    if (v28)
    {
      v23 = (unint64_t *)((char *)v28 + 8);
      do
        unint64_t v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }

    sub_10015D394(&self->_uwbSystemListener.__ptr_);
  }

  uint64_t v25 = sub_100288340();
  sub_100288588((uint64_t)v25, 2, self->_lockBtConnHandle);
  return v13;
}

- (void)dealloc
{
  p_uwbSystemListener = &self->_uwbSystemListener;
  if (self->_uwbSystemListener.__ptr_)
  {
    uint64_t v4 = sub_100288340();
    cntrl = p_uwbSystemListener->__cntrl_;
    ptr = p_uwbSystemListener->__ptr_;
    objc_super v13 = (std::__shared_weak_count *)cntrl;
    if (cntrl)
    {
      uint64_t v6 = (unint64_t *)((char *)cntrl + 8);
      do
        unint64_t v7 = __ldxr(v6);
      while (__stxr(v7 + 1, v6));
    }

    sub_10028CB38((uint64_t)v4, (unint64_t *)&ptr);
    uint64_t v8 = v13;
    if (v13)
    {
      p_shared_owners = (unint64_t *)&v13->__shared_owners_;
      do
        unint64_t v10 = __ldaxr(p_shared_owners);
      while (__stlxr(v10 - 1, p_shared_owners));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }

    sub_10015D394(p_uwbSystemListener);
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NIServerAcwgSession;
  -[NIServerAcwgSession dealloc](&v11, "dealloc");
}

- (duration<long)nominalCycleRate
{
  v2 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_100394710(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  return (duration<long long, std::ratio<1, 1000>>)3000LL;
}

- (unint64_t)requiresUWBToRun
{
  v2 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_100394780(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  return 2LL;
}

- (BOOL)_validateLockAttributes
{
  uint64_t v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_100394848(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[NIAcwgConfiguration lockIdentifier](self->_configuration, "lockIdentifier"));
  BOOL v12 = v11 == 0LL;

  if (v12)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003947F0();
    }
    return 0;
  }

  else
  {
    objc_super v13 = objc_alloc(&OBJC_CLASS___NSUUID);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[NIAcwgConfiguration lockIdentifier](self->_configuration, "lockIdentifier"));
    uint64_t v15 = -[NSUUID initWithUUIDString:](v13, "initWithUUIDString:", v14);

    BOOL v16 = v15 != 0LL;
    if (v15)
    {
      unsigned int v17 = -[NIAcwgConfiguration lockBtConnHandle](self->_configuration, "lockBtConnHandle");
      self->_int lockBtConnHandle = v17;
      if (v17 == 0xFFFF)
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[NIAcwgConfiguration lockIdentifier](self->_configuration, "lockIdentifier"));
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 substringToIndex:2]);

        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", v19));
        [v20 scanHexInt:buf];

        self->_int lockBtConnHandle = *(_WORD *)buf;
        unint64_t v21 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v25 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "#ses-acwg,lockBtConnHandle not valid... extracting it from lockIdentifier",  v25,  2u);
        }
      }

      BOOL v22 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        int lockBtConnHandle = self->_lockBtConnHandle;
        *(_DWORD *)__int128 buf = 67109120;
        int v27 = lockBtConnHandle;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "#ses-acwg,int lockBtConnHandle = 0x%04x",  buf,  8u);
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
    {
      sub_10039481C();
    }
  }

  return v16;
}

- (id)configure
{
  v62 = self;
  v2 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_1003949C0(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)v62->_clientQueue);
  if (!v62->_configuration) {
    sub_1003948B8();
  }
  uint64_t v10 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ses-acwg,configure", buf, 2u);
  }

  if (-[NIServerAcwgSession _validateLockAttributes](v62, "_validateLockAttributes"))
  {
    objc_super v11 = v62;
    p_alishaSystem = &v62->_alishaSystem;
    if (!v62->_alishaSystem.__ptr_)
    {
      objc_super v13 = operator new(0x20uLL);
      v13[1] = 0LL;
      v13[2] = 0LL;
      *objc_super v13 = off_1007B2D10;
      v13[3] = &off_1007B9910;
      *(void *)__int128 buf = v13 + 3;
      *(void *)&buf[8] = v13;
      sub_10000EE54((uint64_t)p_alishaSystem, (__int128 *)buf);
      uint64_t v14 = *(std::__shared_weak_count **)&buf[8];
      if (*(void *)&buf[8])
      {
        uint64_t v15 = (unint64_t *)(*(void *)&buf[8] + 8LL);
        do
          unint64_t v16 = __ldaxr(v15);
        while (__stlxr(v16 - 1, v15));
        if (!v16)
        {
          ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
          std::__shared_weak_count::__release_weak(v14);
        }
      }

      objc_super v11 = v62;
    }

    if (!v11->_uwbSystemListener.__ptr_)
    {
      sub_100189B94(&v62, buf);
      sub_10000EE54((uint64_t)&v62->_uwbSystemListener, (__int128 *)buf);
      unsigned int v17 = *(std::__shared_weak_count **)&buf[8];
      if (*(void *)&buf[8])
      {
        uint64_t v18 = (unint64_t *)(*(void *)&buf[8] + 8LL);
        do
          unint64_t v19 = __ldaxr(v18);
        while (__stlxr(v19 - 1, v18));
        if (!v19)
        {
          ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
          std::__shared_weak_count::__release_weak(v17);
        }
      }

      uint64_t v20 = sub_100288340();
      ptr = v62->_uwbSystemListener.__ptr_;
      cntrl = v62->_uwbSystemListener.__cntrl_;
      v61 = (std::__shared_weak_count *)cntrl;
      if (cntrl)
      {
        BOOL v22 = (unint64_t *)((char *)cntrl + 8);
        do
          unint64_t v23 = __ldxr(v22);
        while (__stxr(v23 + 1, v22));
      }

      sub_10028CA60((uint64_t)v20, (unint64_t *)&ptr);
      unint64_t v24 = v61;
      if (v61)
      {
        p_shared_owners = (unint64_t *)&v61->__shared_owners_;
        do
          unint64_t v26 = __ldaxr(p_shared_owners);
        while (__stlxr(v26 - 1, p_shared_owners));
        if (!v26)
        {
          ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
          std::__shared_weak_count::__release_weak(v24);
        }
      }

      int v27 = sub_100288340();
      v58 = v62->_uwbSystemListener.__ptr_;
      v28 = (std::__shared_weak_count *)v62->_uwbSystemListener.__cntrl_;
      v59 = v28;
      if (v28)
      {
        p_shared_weak_owners = (unint64_t *)&v28->__shared_weak_owners_;
        do
          unint64_t v30 = __ldxr(p_shared_weak_owners);
        while (__stxr(v30 + 1, p_shared_weak_owners));
      }

      sub_1002889DC((uint64_t)v27, (uint64_t *)&v58);
      if (v59) {
        std::__shared_weak_count::__release_weak(v59);
      }
    }

    sub_10027395C((uint64_t)buf);
    if (*(_DWORD *)buf)
    {
      v31 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_1003948E0(v31, v32, v33, v34, v35, v36, v37, v38);
      }
      NSErrorUserInfoKey v63 = NSLocalizedDescriptionKey;
      v64 = @"Failed to query device capabilities.";
      v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v64,  &v63,  1LL));
      v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  v39));

      goto LABEL_50;
    }

    if (v57)
    {
      v50 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        if (!v57) {
          sub_100006080();
        }
        sub_1002BC13C((uint64_t *)&buf[8], &__p);
        if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          p_p = &__p;
        }
        else {
          p_p = (std::stringbuf::string_type *)__p.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)v65 = 136315138;
        v66 = p_p;
        _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "#ses-acwg,Acwg Capabilities: %s",  v65,  0xCu);
      }

      sub_100189454((uint64_t)&v62->_cachedCapabilities, (uint64_t)&buf[8]);
      if ((id)-[NIAcwgConfiguration configurationType](v62->_configuration, "configurationType") == (id)1)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerAcwgSession _configureForOwnerDevice](v62, "_configureForOwnerDevice"));
LABEL_50:
        sub_100189774((uint64_t)&buf[8]);
        return v40;
      }

      v53 = "_configuration.configurationType == _NIAcwgConfigurationTypeOwner";
      int v54 = 497;
    }

    else
    {
      v53 = "response.payload.has_value()";
      int v54 = 485;
    }

    __assert_rtn("-[NIServerAcwgSession configure]", "NIServerAcwgSession.mm", v54, v53);
  }

  v41 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
    sub_100394950(v41, v42, v43, v44, v45, v46, v47, v48);
  }
  NSErrorUserInfoKey v67 = NSLocalizedDescriptionKey;
  v68 = @"Lock identifier nil or invalid.";
  v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v68,  &v67,  1LL));
  v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  v49));

  return v40;
}

- (id)run
{
  uint64_t v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_100394ABC(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  objc_super v11 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ses-acwg,run owner session", buf, 2u);
  }

  ptr = self->_acwgManager.__ptr_;
  if (!ptr)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_100394A30();
    }
    uint64_t v20 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIS"
                           "erverAcwgSession.mm";
      __int16 v24 = 1024;
      int v25 = 506;
      __int16 v26 = 2080;
      int v27 = "-[NIServerAcwgSession run]";
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "#ses-acwg,%s:%d: assertion failure in %s",  buf,  0x1Cu);
    }

    abort();
  }

  int v13 = sub_1002C226C(ptr);
  if (v13)
  {
    sub_1002BEFAC(v13, buf);
    if (SBYTE3(v27) >= 0) {
      uint64_t v14 = buf;
    }
    else {
      uint64_t v14 = *(_BYTE **)buf;
    }
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to run NI Acwg owner session (%s)",  v14));
    if (SBYTE3(v27) < 0) {
      operator delete(*(void **)buf);
    }
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_100394A5C();
    }
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    BOOL v22 = v15;
    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  v16));
  }

  else
  {
    uint64_t v18 = sub_100288340();
    sub_100288588((uint64_t)v18, 1, self->_lockBtConnHandle);
    unsigned int v17 = 0LL;
  }

  return v17;
}

- (id)pauseWithSource:(int64_t)a3
{
  uint64_t v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_100394B84(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  int v13 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = sub_1002523A8(a3);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(_DWORD *)__int128 buf = 138412290;
    *(void *)&uint8_t buf[4] = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#ses-acwg,pause owner session: %@", buf, 0xCu);
  }

  if (!self->_acwgManager.__ptr_)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_100394B2C();
    }
    return 0LL;
  }

  switch(a3)
  {
    case 1LL:
      uint64_t v17 = 107LL;
      goto LABEL_18;
    case 2LL:
      uint64_t v17 = 104LL;
LABEL_18:
      uint64_t v27 = v17;
      break;
    case 0LL:
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
        sub_100394B58();
      }
      unint64_t v16 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 136315650;
        *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/N"
                             "IServerAcwgSession.mm";
        __int16 v31 = 1024;
        int v32 = 541;
        __int16 v33 = 2080;
        uint64_t v34 = "-[NIServerAcwgSession pauseWithSource:]";
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "#ses-acwg,%s:%d: assertion failure in %s",  buf,  0x1Cu);
      }

      abort();
  }

  sub_1001897BC(&self->_suspendReasonStack.c.__map_.__first_, &v27);
  int v18 = sub_1002C282C((uint64_t)self->_acwgManager.__ptr_);
  int v19 = v18;
  if (!v18) {
    return 0LL;
  }
  sub_1002C2FE4(v18, buf);
  if (SBYTE3(v34) >= 0) {
    uint64_t v20 = buf;
  }
  else {
    uint64_t v20 = *(_BYTE **)buf;
  }
  NSErrorUserInfoKey v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to stop ranging when pausing NI ACWG session (%s)",  v20,  v27));
  if (SBYTE3(v34) < 0) {
    operator delete(*(void **)buf);
  }
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
    sub_100394A5C();
  }
  NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
  v29 = v21;
  BOOL v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));
  uint64_t v23 = (v19 + 103);
  else {
    uint64_t v24 = v23 - 19703;
  }
  int v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  v24,  v22));

  return v25;
}

- (void)processAcwgM1Msg:(id)a3 withSessionTriggerReason:(int64_t)a4
{
  id v6 = a3;
  uint64_t v40 = a4;
  uint64_t v7 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_100394C4C(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  uint64_t v15 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v16 = NIAcwgSessionTriggerReasonToString(v40);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    *(_DWORD *)__int128 buf = 138412546;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "#ses-acwg,processAcwgM1Msg:%@ triggerReason:%@",  buf,  0x16u);
  }

  if (!self->_acwgManager.__ptr_)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_100394BF4();
    }
    __int16 v33 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIS"
                           "erverAcwgSession.mm";
      *(_WORD *)&_BYTE buf[12] = 1024;
      *(_DWORD *)&buf[14] = 571;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[NIServerAcwgSession processAcwgM1Msg:withSessionTriggerReason:]";
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_INFO,  "#ses-acwg,%s:%d: assertion failure in %s",  buf,  0x1Cu);
    }

    abort();
  }

  p_sessionReasonStack = &self->_sessionReasonStack;
  sub_100189C40(&self->_sessionReasonStack.c.__map_.__first_, &v40);
  ptr = self->_acwgManager.__ptr_;
  if (v6)
  {
    [v6 toStruct];
  }

  else
  {
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    memset(buf, 0, sizeof(buf));
  }

  sub_1002C29E4((uint64_t)ptr, (uint64_t)buf, (uint64_t)&v36);
  if (*(void *)&buf[24])
  {
    *(void *)&__int128 v44 = *(void *)&buf[24];
    operator delete(*(void **)&buf[24]);
  }

  if (*(void *)buf)
  {
    *(void *)&buf[8] = *(void *)buf;
    operator delete(*(void **)buf);
  }

  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___NIServerAcwgSession;
  uint64_t v20 = -[NIServerBaseSession resourcesManager](&v35, "resourcesManager");
  NSErrorUserInfoKey v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  int v22 = v36;
  if (v36 || !v39)
  {
    sub_1002C2FE4(v36, buf);
    if ((buf[23] & 0x80u) == 0) {
      __int16 v26 = buf;
    }
    else {
      __int16 v26 = *(uint8_t **)buf;
    }
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"process M1 msg failed (%s)",  v26));
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_100394A5C();
    }
    NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
    uint64_t v42 = v23;
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL));
    uint64_t v28 = (v22 + 103);
    else {
      uint64_t v29 = v28 - 19703;
    }
    unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  v29,  v27));

    __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v21 remote]);
    [v31 didProcessAcwgM1MsgWithResponse:0 error:v30];

    unint64_t value = p_sessionReasonStack->c.__size_.__value_;
    if (!value)
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
        sub_100394C20();
      }
      uint64_t v34 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 136315650;
        *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/N"
                             "IServerAcwgSession.mm";
        *(_WORD *)&_BYTE buf[12] = 1024;
        *(_DWORD *)&buf[14] = 598;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = "-[NIServerAcwgSession processAcwgM1Msg:withSessionTriggerReason:]";
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  "#ses-acwg,%s:%d: assertion failure in %s",  buf,  0x1Cu);
      }

      abort();
    }

    p_sessionReasonStack->c.__size_.__value_ = value - 1;
    sub_100189FD8(p_sessionReasonStack, 1);
  }

  else
  {
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NIAcwgM2Msg fromStruct:](&OBJC_CLASS___NIAcwgM2Msg, "fromStruct:", v37, v38));
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v21 remote]);
    [v24 didProcessAcwgM1MsgWithResponse:v23 error:0];

    int v25 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      *(void *)&uint8_t buf[4] = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "#ses-acwg,ACWG M1 processing succeeded and generated M2: %@",  buf,  0xCu);
    }
  }
}

- (void)processAcwgM3Msg:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_100394CE8(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v13 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    *(void *)unsigned int v38 = v4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#ses-acwg,processAcwgM3Msg:%@", buf, 0xCu);
  }

  if (!self->_acwgManager.__ptr_)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_100394CBC();
    }
    uint64_t v29 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315650;
      *(void *)unsigned int v38 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerAcwgSession.mm";
      *(_WORD *)&v38[8] = 1024;
      *(_DWORD *)&v38[10] = 609;
      *(_WORD *)&v38[14] = 2080;
      *(void *)&v38[16] = "-[NIServerAcwgSession processAcwgM3Msg:]";
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "#ses-acwg,%s:%d: assertion failure in %s",  buf,  0x1Cu);
    }

    abort();
  }

  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___NIServerAcwgSession;
  uint64_t v14 = -[NIServerBaseSession resourcesManager](&v32, "resourcesManager");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  ptr = self->_acwgManager.__ptr_;
  *(void *)objc_super v35 = [v4 toStruct];
  *(_DWORD *)&v35[8] = v17;
  sub_1002C2BCC((uint64_t)ptr, (uint64_t)v35, (uint64_t)buf);
  int v18 = *(_DWORD *)buf;
  if (*(_DWORD *)buf || !v39)
  {
    sub_1002C2FE4(*(int *)buf, v35);
    if (v36 >= 0) {
      int v22 = v35;
    }
    else {
      int v22 = *(_BYTE **)v35;
    }
    int v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"process M3 failed (%s)",  v22));
    if (v36 < 0) {
      operator delete(*(void **)v35);
    }
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_100394A5C();
    }
    NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
    uint64_t v34 = v19;
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
    uint64_t v24 = (v18 + 103);
    else {
      uint64_t v25 = v24 - 19703;
    }
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  v25,  v23));

    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v15 remote]);
    [v27 didProcessAcwgM3MsgWithResponse:0 error:v26];

    unint64_t value = self->_sessionReasonStack.c.__size_.__value_;
    if (value)
    {
      self->_sessionReasonStack.c.__size_.__value_ = value - 1;
      sub_100189FD8(&self->_sessionReasonStack.c.__map_.__first_, 1);
    }
  }

  else
  {
    __int128 v30 = *(_OWORD *)&v38[4];
    uint64_t v31 = *(void *)&v38[20];
    int v19 = (void *)objc_claimAutoreleasedReturnValue(+[NIAcwgM4Msg fromStruct:](&OBJC_CLASS___NIAcwgM4Msg, "fromStruct:", &v30));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v15 remote]);
    [v20 didProcessAcwgM3MsgWithResponse:v19 error:0];

    NSErrorUserInfoKey v21 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)objc_super v35 = 138412290;
      *(void *)&v35[4] = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "#ses-acwg,ACWG M3 processing succeeded and generated M4: %@",  v35,  0xCu);
    }
  }
}

- (void)suspendAcwgRanging:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4
{
  uint64_t v31 = a4;
  uint64_t v6 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_100394DB0(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  uint64_t v14 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = NIAcwgSuspendTriggerReasonToString(v31);
    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    *(_DWORD *)__int128 buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = a3;
    *(_WORD *)&buf[8] = 2112;
    *(void *)&buf[10] = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "#ses-acwg,suspendAcwgRanging:%u triggerReason:%@",  buf,  0x12u);
  }

  if (!self->_acwgManager.__ptr_)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_100394D58();
    }
    uint64_t v29 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIS"
                           "erverAcwgSession.mm";
      *(_WORD *)&_BYTE buf[12] = 1024;
      *(_DWORD *)&buf[14] = 648;
      __int16 v35 = 2080;
      char v36 = "-[NIServerAcwgSession suspendAcwgRanging:withSuspendTriggerReason:]";
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "#ses-acwg,%s:%d: assertion failure in %s",  buf,  0x1Cu);
    }

    abort();
  }

  sub_1001897BC(&self->_suspendReasonStack.c.__map_.__first_, &v31);
  if ((unint64_t)(v31 - 100) <= 7)
  {
    if (((1LL << (v31 - 100)) & 0x8F) == 0)
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
        sub_100394D84();
      }
      int v17 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 136315650;
        *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/N"
                             "IServerAcwgSession.mm";
        *(_WORD *)&_BYTE buf[12] = 1024;
        *(_DWORD *)&buf[14] = 657;
        __int16 v35 = 2080;
        char v36 = "-[NIServerAcwgSession suspendAcwgRanging:withSuspendTriggerReason:]";
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "#ses-acwg,%s:%d: assertion failure in %s",  buf,  0x1Cu);
      }

      abort();
    }

    goto LABEL_14;
  }

  if ((unint64_t)(v31 - 200) < 2)
  {
LABEL_14:
    int v18 = sub_1002C282C((uint64_t)self->_acwgManager.__ptr_);
    goto LABEL_15;
  }

  int v18 = -100;
LABEL_15:
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___NIServerAcwgSession;
  int v19 = -[NIServerBaseSession resourcesManager](&v30, "resourcesManager");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  if (v18)
  {
    sub_1002C2FE4(v18, buf);
    if (SBYTE3(v36) >= 0) {
      NSErrorUserInfoKey v21 = buf;
    }
    else {
      NSErrorUserInfoKey v21 = *(_BYTE **)buf;
    }
    int v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Supending ACWG Ranging failed (%s)",  v21));
    if (SBYTE3(v36) < 0) {
      operator delete(*(void **)buf);
    }
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_100394A5C();
    }
    NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
    NSErrorUserInfoKey v33 = v22;
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL));
    uint64_t v24 = (v18 + 103);
    else {
      uint64_t v25 = v24 - 19703;
    }
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  v25,  v23));

    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v20 remote]);
    [v27 uwbSessionDidFailWithError:v26];
  }

  else
  {
    uint64_t v28 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "#ses-acwg,ACWG suspend processing succeeded",  buf,  2u);
    }
  }
}

- (void)processAcwgRangingSessionResumeRequestMsg:(unsigned int)a3 withResumeTriggerReason:(int64_t)a4
{
  uint64_t v7 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_100394E78(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  uint64_t v15 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v16 = NIAcwgSessionTriggerReasonToString(a4);
    int v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    *(_DWORD *)__int128 buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = a3;
    *(_WORD *)&buf[8] = 2112;
    *(void *)&buf[10] = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "#ses-acwg,processAcwgRangingSessionResumeRequestMsg:%u triggerReason:%@",  buf,  0x12u);
  }

  if (!self->_acwgManager.__ptr_)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_100394E20();
    }
    NSErrorUserInfoKey v32 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIS"
                           "erverAcwgSession.mm";
      *(_WORD *)&_BYTE buf[12] = 1024;
      *(_DWORD *)&buf[14] = 706;
      *(_WORD *)&_BYTE buf[18] = 2080;
      *(void *)&buf[20] = "-[NIServerAcwgSession processAcwgRangingSessionResumeRequestMsg:withResumeTriggerReason:]";
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_INFO,  "#ses-acwg,%s:%d: assertion failure in %s",  buf,  0x1Cu);
    }

    abort();
  }

  p_sessionReasonStack = &self->_sessionReasonStack;
  *(void *)__int128 buf = a4;
  sub_100189C40(&self->_sessionReasonStack.c.__map_.__first_, buf);
  sub_1002C2CA8((uint64_t)self->_acwgManager.__ptr_, a3, (uint64_t)buf);
  int v19 = *(_DWORD *)buf;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___NIServerAcwgSession;
  uint64_t v20 = -[NIServerBaseSession resourcesManager](&v34, "resourcesManager");
  NSErrorUserInfoKey v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  if (v19 || !buf[24])
  {
    sub_1002C2FE4(v19, v35);
    if (SBYTE3(v39) >= 0) {
      uint64_t v25 = v35;
    }
    else {
      uint64_t v25 = *(_BYTE **)v35;
    }
    int v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ACWG Resume failed (%s)",  v25));
    if (SBYTE3(v39) < 0) {
      operator delete(*(void **)v35);
    }
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_100394A5C();
    }
    NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
    NSErrorUserInfoKey v41 = v22;
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL));
    uint64_t v27 = (v19 + 103);
    else {
      uint64_t v28 = v27 - 19703;
    }
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  v28,  v26));

    objc_super v30 = (void *)objc_claimAutoreleasedReturnValue([v21 remote]);
    [v30 didProcessAcwgRangingSessionResumeRequestMsgWithResponse:0 error:v29];

    unint64_t value = p_sessionReasonStack->c.__size_.__value_;
    if (!value)
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
        sub_100394E4C();
      }
      NSErrorUserInfoKey v33 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int16 v35 = 136315650;
        *(void *)&v35[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/N"
                             "IServerAcwgSession.mm";
        __int16 v36 = 1024;
        int v37 = 734;
        __int16 v38 = 2080;
        char v39 = "-[NIServerAcwgSession processAcwgRangingSessionResumeRequestMsg:withResumeTriggerReason:]";
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_INFO,  "#ses-acwg,%s:%d: assertion failure in %s",  v35,  0x1Cu);
      }

      abort();
    }

    p_sessionReasonStack->c.__size_.__value_ = value - 1;
    sub_100189FD8(p_sessionReasonStack, 1);
  }

  else
  {
    int v22 = (void *)objc_claimAutoreleasedReturnValue( +[NIAcwgRangingSessionResumeResponseMsg fromStruct:]( &OBJC_CLASS___NIAcwgRangingSessionResumeResponseMsg,  "fromStruct:",  *(void *)&buf[8],  *(void *)&buf[16]));
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v21 remote]);
    [v23 didProcessAcwgRangingSessionResumeRequestMsgWithResponse:v22 error:0];

    uint64_t v24 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v35 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "#ses-acwg,ACWG resume processing succeeded",  v35,  2u);
    }
  }
}

- (void)prefetchAcwgUrsk:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_100394F14(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v13 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v3;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#ses-acwg,prefetchAcwgUrsk:%u", buf, 8u);
  }

  ptr = self->_acwgManager.__ptr_;
  if (!ptr)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_100394EE8();
    }
    uint64_t v28 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIS"
                           "erverAcwgSession.mm";
      __int16 v34 = 1024;
      int v35 = 745;
      __int16 v36 = 2080;
      int v37 = "-[NIServerAcwgSession prefetchAcwgUrsk:]";
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "#ses-acwg,%s:%d: assertion failure in %s",  buf,  0x1Cu);
    }

    abort();
  }

  int v15 = sub_1002C2E3C((uint64_t)ptr, v3, &v30);
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___NIServerAcwgSession;
  unint64_t v16 = -[NIServerBaseSession resourcesManager](&v29, "resourcesManager");
  int v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  int v18 = v17;
  if (v15)
  {
    sub_1002BEFAC(v30, buf);
    if (SBYTE3(v37) >= 0) {
      int v19 = buf;
    }
    else {
      int v19 = *(_BYTE **)buf;
    }
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"prefetchAcwgUrsk failed (%s)",  v19));
    if (SBYTE3(v37) < 0) {
      operator delete(*(void **)buf);
    }
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_100394A5C();
    }
    NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
    NSErrorUserInfoKey v32 = v20;
    NSErrorUserInfoKey v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
    uint64_t v22 = (v15 + 103);
    else {
      uint64_t v23 = v22 - 19703;
    }
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  v23,  v21));

    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v18 remote]);
    [v25 didPrefetchAcwgUrsk:v3 error:v24];
  }

  else
  {
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v17 remote]);
    [v26 didPrefetchAcwgUrsk:v3 error:0];

    uint64_t v27 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "#ses-acwg,ACWG URSK Prefetch succeeded",  buf,  2u);
    }
  }
}

- (void)processUpdatedLockState:(unsigned __int16)a3
{
  unsigned int v3 = a3;
  v22[0] = &off_1007D2448;
  v22[1] = &off_1007D2460;
  v23[0] = @"Secured";
  v23[1] = @"Unsecured";
  v22[2] = &off_1007D2478;
  v23[2] = @"Jammed";
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  3LL));
  v20[0] = &off_1007D2448;
  v20[1] = &off_1007D2460;
  v21[0] = @"Unspecified";
  v21[1] = @"Manual";
  v20[2] = &off_1007D2478;
  v20[3] = &off_1007D2490;
  v21[2] = @"Auto";
  v21[3] = @"Schedule";
  v20[4] = &off_1007D24A8;
  v21[4] = @"This User Device";
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  5LL));
  uint64_t v6 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 67109120;
    LODWORD(v17) = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "#ses-acwg,processUpdatedLockState:0x%04x",  (uint8_t *)&v16,  8u);
  }

  uint64_t v7 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v3));
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v8]);
    uint64_t v10 = (void *)v9;
    if (v9) {
      uint64_t v11 = (const __CFString *)v9;
    }
    else {
      uint64_t v11 = @"<Error: Unknown Value>";
    }
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v3 >> 8));
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v12]);
    uint64_t v14 = (void *)v13;
    if (v13) {
      int v15 = (const __CFString *)v13;
    }
    else {
      int v15 = @"<Error: Unknown Value>";
    }
    int v16 = 138412546;
    int v17 = v11;
    __int16 v18 = 2112;
    int v19 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#ses-acwg,Lock State Update: new_state = %@, operation_source = %@",  (uint8_t *)&v16,  0x16u);
  }
}

- (id)processBluetoothHostTimeSyncWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4 eventCounter:(unint64_t)a5 monotonicTimeSec:(double)a6 response:(id *)a7
{
  uint64_t v13 = (void *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = @"Unknown";
    if (a3 == 138) {
      uint64_t v14 = @"ConnCompltEventCount0";
    }
    if (a3 == 12) {
      uint64_t v14 = @"LESetPHY";
    }
    int v15 = v14;
    *(_DWORD *)__int128 buf = 138413058;
    v56 = (const char *)v15;
    __int16 v57 = 2048;
    *(void *)v58 = a4;
    *(_WORD *)&v58[8] = 2048;
    *(void *)&v58[10] = a5;
    __int16 v59 = 2048;
    *(double *)v60 = a6;
    int v16 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "#ses-acwg,processBluetoothHostTimeSyncWithType got event: %@, btc clock ticks: %llu, event counter: %llu, monotonic time: %f [s]",  buf,  0x2Au);
  }

  *a7 = 0LL;
  if (!self->_acwgManager.__ptr_)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_100394F84();
    }
    __int16 v36 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315650;
      v56 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerAcwgSession.mm";
      __int16 v57 = 1024;
      *(_DWORD *)v58 = 813;
      *(_WORD *)&v58[4] = 2080;
      *(void *)&v58[6] = "-[NIServerAcwgSession processBluetoothHostTimeSyncWithType:btcClockTicks:eventCounter:monoton"
                           "icTimeSec:response:]";
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_INFO,  "#ses-acwg,%s:%d: assertion failure in %s",  buf,  0x1Cu);
    }

    abort();
  }

  if (a3 == 12 || a3 == 138)
  {
    if (a3 == 12) {
      int v17 = 12;
    }
    else {
      int v17 = 138;
    }
    __int16 v18 = sub_100005150();
    BOOL v19 = sub_1003552D4((uint64_t)v18);
    unint64_t v20 = 7500 * a4;
    if (v19) {
      unint64_t v20 = a4;
    }
    *(_DWORD *)__int128 buf = v17;
    LODWORD(v56) = 1;
    BYTE4(v56) = 0;
    v58[2] = 0;
    *(void *)&v58[10] = v20;
    LOBYTE(v59) = 1;
    *(void *)&v60[3] = a5;
    *(double *)&v60[7] = a6;
    sub_1002C2D60((uint64_t)self->_acwgManager.__ptr_, (unsigned int *)buf, (uint64_t)&v39);
    if (v39)
    {
      sub_1002BEFAC(v39, __p);
      if (SBYTE3(v52) >= 0) {
        NSErrorUserInfoKey v21 = __p;
      }
      else {
        NSErrorUserInfoKey v21 = *(_BYTE **)__p;
      }
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to process Bluetooth host time sync. %s",  v21));
      if (SBYTE3(v52) < 0) {
        operator delete(*(void **)__p);
      }
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_100394A5C();
      }
      NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
      int v54 = v22;
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v54,  &v53,  1LL));
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -19887LL,  v23));
    }

    else
    {
      if (!v47)
      {
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
          sub_100395020();
        }
        int v37 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)std::stringbuf::string_type __p = 136315650;
          *(void *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session"
                               "/NIServerAcwgSession.mm";
          __int16 v49 = 1024;
          int v50 = 847;
          __int16 v51 = 2080;
          v52 = "-[NIServerAcwgSession processBluetoothHostTimeSyncWithType:btcClockTicks:eventCounter:monotonicTimeSec:response:]";
          _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_INFO,  "#ses-acwg,%s:%d: assertion failure in %s",  __p,  0x1Cu);
        }

        abort();
      }

      __int16 v34 = objc_alloc(&OBJC_CLASS___NIBluetoothHostTimeSyncResponse);
      LOWORD(v38) = v46;
      uint64_t v24 = 0LL;
      *a7 =  -[NIBluetoothHostTimeSyncResponse initWithDeviceEventCount:uwbDeviceTimeUs:uwbDeviceTimeUncertainty:uwbClockSkewMeasurementAvailable:deviceMaxPpm:success:retryDelay:]( v34,  "initWithDeviceEventCount:uwbDeviceTimeUs:uwbDeviceTimeUncertainty:uwbClockSkewMeasurementAvailable:devic eMaxPpm:success:retryDelay:",  v40,  v41,  v42,  v43,  v44,  v45,  v38);
    }
  }

  else
  {
    uint64_t v25 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_100394FB0(v25, v26, v27, v28, v29, v30, v31, v32);
    }
    NSErrorUserInfoKey v61 = NSLocalizedDescriptionKey;
    v62 = @"Invalid Bluetooth Host Time Sync Event type. See the NIBluetoothHostTimeSyncType enum for valid options.";
    NSErrorUserInfoKey v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v62,  &v61,  1LL));
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -19887LL,  v33));
  }

  return v24;
}

- (NIServerNumberResponse)isRangingLimitExceeded
{
  v2 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_10039504C(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  uint64_t v10 = sub_100269560();
  int v11 = sub_10026AEA8((dispatch_queue_s **)v10, 8);
  uint64_t v12 = &__kCFBooleanFalse;
  if (v11) {
    uint64_t v12 = &__kCFBooleanTrue;
  }
  id v13 = v12;
  uint64_t v14 = 0LL;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (id)deleteURSKs
{
  uint64_t v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_1003950E8(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  ptr = self->_acwgManager.__ptr_;
  if (!ptr)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003950BC();
    }
    return 0LL;
  }

  int v12 = sub_1002C2DDC((uint64_t)ptr);
  if (!v12) {
    return 0LL;
  }
  sub_1002BEFAC(v12, __p);
  if (v19 >= 0) {
    id v13 = __p;
  }
  else {
    id v13 = (void **)__p[0];
  }
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to delete keys (%s)",  v13));
  if (v19 < 0) {
    operator delete(__p[0]);
  }
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
    sub_100394A5C();
  }
  NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
  NSErrorUserInfoKey v21 = v14;
  int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
  int v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -19883LL,  v15));

  return v16;
}

- (id)_setDebugURSK:(id)a3 transactionIdentifier:(unsigned int)a4
{
  id v6 = a3;
  uint64_t v7 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_1003951C8(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  if (os_variant_allows_internal_security_policies([@"com.apple.nearbyd" UTF8String]))
  {
    if (v6 && [v6 length] == (id)32)
    {
      [v6 getBytes:v37 length:32];
      unsigned int v34 = a4;
      __int128 v35 = v37[0];
      __int128 v36 = v37[1];
      int v15 = sub_100273F88((uint64_t)self->_alishaSystem.__ptr_, (uint64_t)&v34);
      if (v15)
      {
        sub_1002BEFAC(v15, __p);
        if (v31 >= 0) {
          int v16 = __p;
        }
        else {
          int v16 = (void **)__p[0];
        }
        int v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to set debug key (%s)",  v16));
        if (v31 < 0) {
          operator delete(__p[0]);
        }
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
          sub_100394A5C();
        }
        NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
        NSErrorUserInfoKey v33 = v17;
        __int16 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL));
        char v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -19886LL,  v18));
      }

      else
      {
        char v19 = 0LL;
      }
    }

    else
    {
      NSErrorUserInfoKey v20 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_100395158(v20, v21, v22, v23, v24, v25, v26, v27);
      }
      NSErrorUserInfoKey v38 = NSLocalizedDescriptionKey;
      int v39 = @"Nil or invalid length URSK.";
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));
      char v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -19886LL,  v28));
    }
  }

  else
  {
    char v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  0LL));
  }

  return v19;
}

- (id)_setURSKTTL:(unint64_t)a3
{
  uint64_t v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_100395238(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if ((os_variant_allows_internal_security_policies([@"com.apple.nearbyd" UTF8String]) & 1) == 0) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  0LL));
  }
  int v13 = sub_10027412C((uint64_t)self->_alishaSystem.__ptr_, a3);
  if (!v13) {
    return 0LL;
  }
  sub_1002BEFAC(v13, __p);
  if (v20 >= 0) {
    uint64_t v14 = __p;
  }
  else {
    uint64_t v14 = (void **)__p[0];
  }
  int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to set URSK TTL (%s)",  v14));
  if (v20 < 0) {
    operator delete(__p[0]);
  }
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
    sub_100394A5C();
  }
  NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
  uint64_t v22 = v15;
  int v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
  int v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -18889LL,  v16));

  return v17;
}

- (shared_ptr<rose::objects::AlishaSession>)_buildAlishaSession:(const void *)a3
{
  uint64_t v6 = v3;
  uint64_t v7 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_100395338(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  int v15 = self;
  sub_1000065CC(__p, (char *)-[NSString UTF8String](v15->_containerUniqueIdentifier, "UTF8String"));
  int v16 = operator new(0x5D8uLL);
  v16[1] = 0LL;
  v16[2] = 0LL;
  *int v16 = off_1007B2D60;
  int v17 = v15;
  *(void *)__int128 buf = off_1007B2DB0;
  v66 = v17;
  NSErrorUserInfoKey v67 = buf;
  __int16 v18 = v17;
  v63[0] = off_1007B2E68;
  v63[1] = v18;
  v64 = v63;
  char v19 = v18;
  v61[0] = off_1007B2F20;
  v61[1] = v19;
  v62 = v61;
  v60 = 0LL;
  char v20 = v19;
  v57[0] = off_1007B2FE8;
  v57[1] = v20;
  v58 = v57;
  NSErrorUserInfoKey v21 = v20;
  v55[0] = off_1007B30B0;
  v55[1] = v21;
  v56 = v55;
  uint64_t v22 = v21;
  v53[0] = off_1007B3140;
  v53[1] = v22;
  int v54 = v53;
  uint64_t v51 = 0LL;
  v52 = 0LL;
  sub_100274944( v16 + 3,  (__int128 *)__p,  (void *)a3,  (uint64_t)buf,  (uint64_t)v63,  (uint64_t)v61,  (uint64_t)v59,  (uint64_t)v57,  (uint64_t)v55,  (uint64_t)v53,  &v51);
  uint64_t v23 = v52;
  if (v52)
  {
    p_shared_owners = (unint64_t *)&v52->__shared_owners_;
    do
      unint64_t v25 = __ldaxr(p_shared_owners);
    while (__stlxr(v25 - 1, p_shared_owners));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }

  uint64_t v26 = v54;
  if (v54 == v53)
  {
    uint64_t v27 = 4LL;
    uint64_t v26 = v53;
  }

  else
  {
    if (!v54) {
      goto LABEL_13;
    }
    uint64_t v27 = 5LL;
  }

  (*(void (**)(void))(*v26 + 8 * v27))();
LABEL_13:
  uint64_t v28 = v56;
  if (v56 == v55)
  {
    uint64_t v29 = 4LL;
    uint64_t v28 = v55;
  }

  else
  {
    if (!v56) {
      goto LABEL_18;
    }
    uint64_t v29 = 5LL;
  }

  (*(void (**)(void))(*v28 + 8 * v29))();
LABEL_18:
  uint64_t v30 = v58;
  if (v58 == v57)
  {
    uint64_t v31 = 4LL;
    uint64_t v30 = v57;
  }

  else
  {
    if (!v58) {
      goto LABEL_23;
    }
    uint64_t v31 = 5LL;
  }

  (*(void (**)(void))(*v30 + 8 * v31))();
LABEL_23:
  NSErrorUserInfoKey v32 = v60;
  if (v60 == v59)
  {
    uint64_t v33 = 4LL;
    NSErrorUserInfoKey v32 = v59;
  }

  else
  {
    if (!v60) {
      goto LABEL_28;
    }
    uint64_t v33 = 5LL;
  }

  (*(void (**)(void))(*v32 + 8 * v33))();
LABEL_28:
  unsigned int v34 = v62;
  if (v62 == v61)
  {
    uint64_t v35 = 4LL;
    unsigned int v34 = v61;
  }

  else
  {
    if (!v62) {
      goto LABEL_33;
    }
    uint64_t v35 = 5LL;
  }

  (*(void (**)(void))(*v34 + 8 * v35))();
LABEL_33:
  __int128 v36 = v64;
  if (v64 == v63)
  {
    uint64_t v37 = 4LL;
    __int128 v36 = v63;
  }

  else
  {
    if (!v64) {
      goto LABEL_38;
    }
    uint64_t v37 = 5LL;
  }

  (*(void (**)(void))(*v36 + 8 * v37))();
LABEL_38:
  NSErrorUserInfoKey v38 = v67;
  if (v67 == buf)
  {
    uint64_t v39 = 4LL;
    NSErrorUserInfoKey v38 = buf;
  }

  else
  {
    if (!v67) {
      goto LABEL_43;
    }
    uint64_t v39 = 5LL;
  }

  (*(void (**)(void))(*(void *)v38 + 8 * v39))();
LABEL_43:
  *(void *)&__int128 v48 = v16 + 3;
  *((void *)&v48 + 1) = v16;
  sub_100012538((uint64_t)&v48, v16 + 5, (uint64_t)(v16 + 3));
  uint64_t v40 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "#ses-acwg,Registering for Acwg service.",  buf,  2u);
  }

  int v41 = sub_10026FF14(v48);
  if (v41)
  {
    unsigned __int8 v42 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      sub_100275DD0(v41, buf);
      sub_1003952A8((uint64_t)buf);
    }

    *uint64_t v6 = 0LL;
    v6[1] = 0LL;
    unsigned __int8 v43 = (std::__shared_weak_count *)*((void *)&v48 + 1);
    if (*((void *)&v48 + 1))
    {
      unsigned __int16 v44 = (unint64_t *)(*((void *)&v48 + 1) + 8LL);
      do
        unint64_t v45 = __ldaxr(v44);
      while (__stlxr(v45 - 1, v44));
      if (!v45)
      {
        ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
        std::__shared_weak_count::__release_weak(v43);
      }
    }
  }

  else
  {
    *(_OWORD *)uint64_t v6 = v48;
  }

  if (v50 < 0) {
    operator delete(__p[0]);
  }

  result.__cntrl_ = v47;
  result.__ptr_ = v46;
  return result;
}

- (void)_alishaSessionInvalidatedWithReason:(int)a3
{
  uint64_t v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_100395404(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v13 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    sub_100275E00(a3, v18);
    sub_1003953A8((uint64_t)v18);
  }

  -[NIServerAcwgSession invalidate](self, "invalidate");
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NIServerAcwgSession;
  id v14 = -[NIServerBaseSession invalidationHandler](&v17, "invalidationHandler");
  int v15 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(v14);
  int v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  0LL));
  ((void (**)(void, void *))v15)[2](v15, v16);
}

- (id)_configureForOwnerDevice
{
  uint64_t v4 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_100395508(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  uint64_t v12 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#ses-acwg,_configureForOwnerDevice", buf, 2u);
  }

  p_cachedCapabilities = &self->_cachedCapabilities;
  if (!self->_cachedCapabilities.__engaged_)
  {
    v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v75 handleFailureInMethod:a2, self, @"NIServerAcwgSession.mm", 1054, @"Invalid parameter not satisfying: %@", @"_cachedCapabilities.has_value()" object file lineNumber description];
  }

  id v14 = self;
  int v15 = v14;
  p_configProvider = &v14->_configProvider;
  if (!v14->_configProvider.__ptr_)
  {
    char v19 = (void *)objc_claimAutoreleasedReturnValue(-[NIAcwgConfiguration debugOptions](v14->_configuration, "debugOptions"));
    char v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"BypassBluetoothTimesync"]);
    unsigned __int8 v21 = [v20 BOOLValue];

    LOBYTE(v80) = v21;
    sub_10018B1E0((char *)&v80, buf);
    sub_10000EE54((uint64_t)p_configProvider, (__int128 *)buf);
    uint64_t v22 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8])
    {
      uint64_t v23 = (unint64_t *)(*(void *)&buf[8] + 8LL);
      do
        unint64_t v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
  }

  if (!v15->_paramNegotiator.__ptr_)
  {
    if (!p_cachedCapabilities->__engaged_) {
      sub_100006080();
    }
    unint64_t v25 = operator new(0xE8uLL);
    uint64_t v26 = v25;
    v25[1] = 0LL;
    v25[2] = 0LL;
    *unint64_t v25 = off_1007B3320;
    uint64_t v27 = v25 + 3;
    ptr = (uint64_t (**)())v15->_alishaSystem.__ptr_;
    cntrl = (unint64_t *)v15->_alishaSystem.__cntrl_;
    v83 = (std::__shared_weak_count *)cntrl;
    if (cntrl)
    {
      uint64_t v29 = cntrl + 1;
      do
        unint64_t v30 = __ldxr(v29);
      while (__stxr(v30 + 1, v29));
    }

    v80 = p_configProvider->__ptr_;
    uint64_t v31 = p_configProvider->__cntrl_;
    v81 = (std::__shared_weak_count *)v31;
    if (v31)
    {
      NSErrorUserInfoKey v32 = (unint64_t *)((char *)v31 + 8);
      do
        unint64_t v33 = __ldxr(v32);
      while (__stxr(v33 + 1, v32));
    }

    *(void *)__int128 buf = &off_1007B3370;
    v86 = buf;
    sub_1002B668C(v25 + 3, p_cachedCapabilities, &ptr, &v80, buf);
    unsigned int v34 = v86;
    if (v86 == buf)
    {
      uint64_t v35 = 4LL;
      unsigned int v34 = buf;
    }

    else
    {
      if (!v86) {
        goto LABEL_55;
      }
      uint64_t v35 = 5LL;
    }

    (*(void (**)(void))(*(void *)v34 + 8 * v35))();
LABEL_55:
    v58 = v81;
    if (v81)
    {
      p_shared_owners = (unint64_t *)&v81->__shared_owners_;
      do
        unint64_t v60 = __ldaxr(p_shared_owners);
      while (__stlxr(v60 - 1, p_shared_owners));
      if (!v60)
      {
        ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
        std::__shared_weak_count::__release_weak(v58);
      }
    }

    NSErrorUserInfoKey v61 = v83;
    if (v83)
    {
      v62 = (unint64_t *)&v83->__shared_owners_;
      do
        unint64_t v63 = __ldaxr(v62);
      while (__stlxr(v63 - 1, v62));
      if (!v63)
      {
        ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
        std::__shared_weak_count::__release_weak(v61);
      }
    }

    *(void *)&__int128 v79 = v27;
    *((void *)&v79 + 1) = v26;
    sub_10000EE54((uint64_t)&v15->_paramNegotiator, &v79);
    v64 = (std::__shared_weak_count *)*((void *)&v79 + 1);
    if (*((void *)&v79 + 1))
    {
      v65 = (unint64_t *)(*((void *)&v79 + 1) + 8LL);
      do
        unint64_t v66 = __ldaxr(v65);
      while (__stlxr(v66 - 1, v65));
      if (!v66)
      {
        ((void (*)(std::__shared_weak_count *))v64->__on_zero_shared)(v64);
        std::__shared_weak_count::__release_weak(v64);
      }
    }
  }

  objc_super v17 = v15;
  if (v17->_acwgManager.__ptr_) {
    goto LABEL_10;
  }
  sub_100269560();
  sub_10026AE10(8, v17->_containerUniqueIdentifier, v17->_clientQueue, &v77);
  __int128 v36 = operator new(0xD0uLL);
  v36[1] = 0LL;
  v36[2] = 0LL;
  *__int128 v36 = off_1007B3400;
  uint64_t v37 = v17;
  *(void *)__int128 buf = off_1007B3450;
  *(void *)&uint8_t buf[8] = v37;
  v86 = buf;
  NSErrorUserInfoKey v38 = v37;
  ptr = off_1007B34E0;
  v83 = v38;
  p_ptr = &ptr;
  v80 = (AcwgConfigProvider *)v17->_alishaSystem.__ptr_;
  uint64_t v39 = (std::__shared_weak_count *)v17->_alishaSystem.__cntrl_;
  v81 = v39;
  if (v39)
  {
    uint64_t v40 = (unint64_t *)&v39->__shared_owners_;
    do
      unint64_t v41 = __ldxr(v40);
    while (__stxr(v41 + 1, v40));
  }

  *(void *)&__int128 v79 = v15->_paramNegotiator.__ptr_;
  unsigned __int8 v42 = v15->_paramNegotiator.__cntrl_;
  *((void *)&v79 + 1) = v42;
  if (v42)
  {
    unsigned __int8 v43 = (unint64_t *)((char *)v42 + 8);
    do
      unint64_t v44 = __ldxr(v43);
    while (__stxr(v44 + 1, v43));
  }

  __int128 v78 = v77;
  if (*((void *)&v77 + 1))
  {
    unint64_t v45 = (unint64_t *)(*((void *)&v77 + 1) + 8LL);
    do
      unint64_t v46 = __ldxr(v45);
    while (__stxr(v46 + 1, v45));
  }

  sub_1002C1F70(v36 + 3, buf, &ptr, &v80, &v79, &v78);
  char v47 = (std::__shared_weak_count *)*((void *)&v78 + 1);
  if (*((void *)&v78 + 1))
  {
    __int128 v48 = (unint64_t *)(*((void *)&v78 + 1) + 8LL);
    do
      unint64_t v49 = __ldaxr(v48);
    while (__stlxr(v49 - 1, v48));
    if (!v49)
    {
      ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
      std::__shared_weak_count::__release_weak(v47);
    }
  }

  char v50 = (std::__shared_weak_count *)*((void *)&v79 + 1);
  if (*((void *)&v79 + 1))
  {
    uint64_t v51 = (unint64_t *)(*((void *)&v79 + 1) + 8LL);
    do
      unint64_t v52 = __ldaxr(v51);
    while (__stlxr(v52 - 1, v51));
    if (!v52)
    {
      ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
      std::__shared_weak_count::__release_weak(v50);
    }
  }

  NSErrorUserInfoKey v53 = v81;
  if (v81)
  {
    int v54 = (unint64_t *)&v81->__shared_owners_;
    do
      unint64_t v55 = __ldaxr(v54);
    while (__stlxr(v55 - 1, v54));
    if (!v55)
    {
      ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
      std::__shared_weak_count::__release_weak(v53);
    }
  }

  v56 = p_ptr;
  if (p_ptr == &ptr)
  {
    uint64_t v57 = 4LL;
    v56 = &ptr;
  }

  else
  {
    if (!p_ptr) {
      goto LABEL_72;
    }
    uint64_t v57 = 5LL;
  }

  (*v56)[v57]();
LABEL_72:
  NSErrorUserInfoKey v67 = v86;
  if (v86 == buf)
  {
    uint64_t v68 = 4LL;
    NSErrorUserInfoKey v67 = buf;
  }

  else
  {
    if (!v86) {
      goto LABEL_77;
    }
    uint64_t v68 = 5LL;
  }

  (*(void (**)(void))(*(void *)v67 + 8 * v68))();
LABEL_77:
  *(void *)&__int128 v76 = v36 + 3;
  *((void *)&v76 + 1) = v36;
  sub_10000EE54((uint64_t)&v17->_acwgManager, &v76);
  v69 = (std::__shared_weak_count *)*((void *)&v76 + 1);
  if (*((void *)&v76 + 1))
  {
    v70 = (unint64_t *)(*((void *)&v76 + 1) + 8LL);
    do
      unint64_t v71 = __ldaxr(v70);
    while (__stlxr(v71 - 1, v70));
    if (!v71)
    {
      ((void (*)(std::__shared_weak_count *))v69->__on_zero_shared)(v69);
      std::__shared_weak_count::__release_weak(v69);
    }
  }

  v72 = (std::__shared_weak_count *)*((void *)&v77 + 1);
  if (*((void *)&v77 + 1))
  {
    v73 = (unint64_t *)(*((void *)&v77 + 1) + 8LL);
    do
      unint64_t v74 = __ldaxr(v73);
    while (__stlxr(v74 - 1, v73));
    if (!v74)
    {
      ((void (*)(std::__shared_weak_count *))v72->__on_zero_shared)(v72);
      std::__shared_weak_count::__release_weak(v72);
    }
  }

- (JobConfig)_aopJobConfigWithTimeouts
{
  uint64_t v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_100395578(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  *(void *)&retstr->peerDiscoveryTimeoutSeconds = -1LL;
  retstr->timeoutRefirePeriodSeconds = -1;
  retstr->maxTimeoutRefires = 0;
  *(void *)(&retstr->maxTimeoutRefires + 1) = 0xFFFFFFFFLL;
  *(_WORD *)((char *)&retstr->subratingConfigs[0].var0.var0 + 3) = 0;
  retstr->optionsBitmap = 1;
  unsigned __int16 v13 = (unsigned __int16)sub_1002B53D8(@"AcwgTimeoutAOverrideSeconds", (id)0x3C);
  unsigned __int16 v14 = (unsigned __int16)sub_1002B53D8(@"AcwgTimeoutBOverrideSeconds", (id)0x3C);
  unsigned __int16 v15 = (unsigned __int16)sub_1002B53D8(@"AcwgTimeoutRefirePeriodOverrideSeconds", (id)0xF);
  shared_ptr<rose::objects::AlishaSession> result = (JobConfig *)sub_1002B53D8(@"AcwgMaxTimeoutRefiresOverride", (id)2);
  retstr->peerDiscoveryTimeoutSeconds = v13;
  retstr->peerReacquisitionTimeoutSeconds = v13;
  retstr->trackingTimeoutSeconds = -1;
  retstr->jobTimeoutSeconds = v14;
  retstr->timeoutRefirePeriodSeconds = v15;
  retstr->maxTimeoutRefires = result;
  *(_WORD *)(&retstr->maxTimeoutRefires + 1) = -1;
  *(unsigned __int16 *)((char *)&retstr->eventWatchdogTimeoutMilliseconds + 1) = self->_lockBtConnHandle;
  return result;
}

- (RequestConstructionDebugParams)_ownerDeviceServiceRequestDebugParams:(SEL)a3
{
  id v5 = a4;
  uint64_t v6 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_1003955E8(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  retstr->var3.__engaged_ = 0;
  retstr->var4.var0.__null_state_ = 0;
  retstr->var4.__engaged_ = 0;
  retstr->var11 = 0;
  *(_DWORD *)&retstr->var0 = 0;
  retstr->var3.var0.__null_state_ = 0;
  *(void *)&retstr->var5 = 0LL;
  retstr->var10 = 0;
  unsigned __int16 v14 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 138412290;
    id v28 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "#ses-acwg,Debug params for owner device service request. Debug options: %@",  (uint8_t *)&v27,  0xCu);
  }

  retstr->var0 = 0;
  unsigned __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"DebugSTSIndex0"]);
  if (!v15
    || (int v16 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"AnchorHopKey"]),
        BOOL v17 = v16 == 0LL,
        v16,
        v15,
        v17))
  {
    retstr->var2 = 0;
  }

  else
  {
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"DebugSTSIndex0"]);
    unsigned int v19 = [v18 unsignedIntegerValue];

    char v20 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"AnchorHopKey"]);
    unsigned int v21 = [v20 unsignedIntegerValue];

    retstr->var2 = 1;
    retstr->var3.__engaged_ = 1;
    retstr->var3.var0.__val_ = v19;
    retstr->var4.__engaged_ = 1;
    retstr->var4.var0.__val_ = v21;
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"DisableUWBEncryption"]);
  unsigned __int8 v23 = [v22 BOOLValue];

  unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"DisableSecureToF"]);
  unsigned __int8 v25 = [v24 BOOLValue];

  retstr->var9 = v23;
  retstr->var10 = v25;
  retstr->var11 = 8;

  return result;
}

- (void)_sendAnalyticsOnRangingComplete:(int64_t)a3 suspendReason:(int64_t)a4
{
  sessionSuspendTimestamp = self->_sessionSuspendTimestamp;
  if (!sessionSuspendTimestamp)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_100395658();
    }
    unsigned int v19 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315650;
      *(void *)uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerAcwgSession.mm";
      *(_WORD *)&v22[8] = 1024;
      *(_DWORD *)&v22[10] = 1214;
      __int16 v23 = 2080;
      unint64_t v24 = "-[NIServerAcwgSession _sendAnalyticsOnRangingComplete:suspendReason:]";
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "#ses-acwg,%s:%d: assertion failure in %s",  buf,  0x1Cu);
    }

    abort();
  }

  if (self->_sessionStartTimestamp)
  {
    -[NSDate timeIntervalSinceDate:](sessionSuspendTimestamp, "timeIntervalSinceDate:");
    uint64_t v9 = v8;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  uint64_t v10 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int lockBtConnHandle = self->_lockBtConnHandle;
    containerUniqueIdentifier = self->_containerUniqueIdentifier;
    uint64_t v13 = NIAcwgSessionTriggerReasonToString(a3);
    unsigned __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    unsigned __int16 v15 = NIAcwgSuspendTriggerReasonToString(a4);
    int v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    *(_DWORD *)__int128 buf = 67110146;
    *(_DWORD *)uint64_t v22 = lockBtConnHandle;
    *(_WORD *)&v22[4] = 2112;
    *(void *)&v22[6] = containerUniqueIdentifier;
    __int16 v23 = 2048;
    unint64_t v24 = v9;
    __int16 v25 = 2112;
    uint64_t v26 = v14;
    __int16 v27 = 2112;
    id v28 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "#ses-acwg,ranging complete [0x%04x, %@] = %.1f secs [%@, %@]",  buf,  0x30u);
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100188038;
  v20[3] = &unk_1007A2518;
  v20[4] = v9;
  void v20[5] = a3;
  v20[6] = a4;
  AnalyticsSendEventLazy(@"com.apple.lyon.RangingComplete", v20);
  sessionStartTimestamp = self->_sessionStartTimestamp;
  self->_sessionStartTimestamp = 0LL;

  __int16 v18 = self->_sessionSuspendTimestamp;
  self->_sessionSuspendTimestamp = 0LL;
}

- (void)_alishaStateChangedFromState:(unsigned __int8)a3 toNewState:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  unsigned int v5 = a3;
  uint64_t v7 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_1003956B0(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  unsigned __int16 v15 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    sub_1002BF78C(v5, v37);
    int v16 = v38;
    BOOL v17 = (void **)v37[0];
    sub_1002BF78C(v4, __p);
    __int16 v18 = v37;
    if (v16 < 0) {
      __int16 v18 = v17;
    }
    if (v36 >= 0) {
      unsigned int v19 = __p;
    }
    else {
      unsigned int v19 = (void **)__p[0];
    }
    containerUniqueIdentifier = self->_containerUniqueIdentifier;
    *(_DWORD *)__int128 buf = 136315650;
    uint64_t v40 = (const char *)v18;
    __int16 v41 = 2080;
    *(void *)unsigned __int8 v42 = v19;
    *(_WORD *)&v42[8] = 2112;
    *(void *)&v42[10] = containerUniqueIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "#ses-acwg,State changed from %s to %s, session container ID: %@",  buf,  0x20u);
    if (v36 < 0) {
      operator delete(__p[0]);
    }
    if (v38 < 0) {
      operator delete(v37[0]);
    }
  }

  int v21 = sub_1002C1B68(v5);
  if (((v21 ^ 1 | sub_1002C1B68(v4)) & 1) == 0)
  {
    unint64_t value = self->_suspendReasonStack.c.__size_.__value_;
    if (value)
    {
      unint64_t v23 = value - 1;
      int64_t v24 = (*(int64_t **)((char *)self->_suspendReasonStack.c.__map_.__begin_
                                + (((self->_suspendReasonStack.c.__start_ + v23) >> 6) & 0x3FFFFFFFFFFFFF8LL)))[(self->_suspendReasonStack.c.__start_ + v23) & 0x1FF];
      self->_suspendReasonStack.c.__size_.__value_ = v23;
      sub_100189FD8(&self->_suspendReasonStack.c.__map_.__first_, 1);
    }

    else
    {
      int64_t v24 = 106LL;
    }

    unint64_t v25 = self->_sessionReasonStack.c.__size_.__value_;
    if (!v25)
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
        sub_100395684();
      }
      unint64_t v33 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 136315650;
        uint64_t v40 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerAcwgSession.mm";
        __int16 v41 = 1024;
        *(_DWORD *)unsigned __int8 v42 = 1267;
        *(_WORD *)&v42[4] = 2080;
        *(void *)&v42[6] = "-[NIServerAcwgSession _alishaStateChangedFromState:toNewState:]";
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_INFO,  "#ses-acwg,%s:%d: assertion failure in %s",  buf,  0x1Cu);
      }

      abort();
    }

    unint64_t v26 = v25 - 1;
    int64_t v27 = (*(int64_t **)((char *)self->_sessionReasonStack.c.__map_.__begin_
                              + (((self->_sessionReasonStack.c.__start_ + v26) >> 6) & 0x3FFFFFFFFFFFFF8LL)))[(self->_sessionReasonStack.c.__start_ + v26) & 0x1FF];
    self->_sessionReasonStack.c.__size_.__value_ = v26;
    sub_100189FD8(&self->_sessionReasonStack.c.__map_.__first_, 1);
    id v28 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    sessionSuspendTimestamp = self->_sessionSuspendTimestamp;
    self->_sessionSuspendTimestamp = v28;

    -[NIServerAcwgSession _sendAnalyticsOnRangingComplete:suspendReason:]( self,  "_sendAnalyticsOnRangingComplete:suspendReason:",  v27,  v24);
    v34.receiver = self;
    v34.super_class = (Class)&OBJC_CLASS___NIServerAcwgSession;
    unint64_t v30 = -[NIServerBaseSession resourcesManager](&v34, "resourcesManager");
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    NSErrorUserInfoKey v32 = (void *)objc_claimAutoreleasedReturnValue([v31 remote]);
    [v32 didSuspendAcwgRanging:v24];
  }

- (void)_handleInitiatorRangingBlockUpdate:(InitiatorRangingBlockSummary *)a3
{
  unsigned int v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_100395720(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (!a3->var5 && a3->var8 == 1)
  {
    unint64_t value = self->_sessionReasonStack.c.__size_.__value_;
    if (!value)
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
        sub_100395684();
      }
      char v20 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 136315650;
        unint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerAcwgSession.mm";
        __int16 v24 = 1024;
        int v25 = 1288;
        __int16 v26 = 2080;
        int64_t v27 = "-[NIServerAcwgSession _handleInitiatorRangingBlockUpdate:]";
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "#ses-acwg,%s:%d: assertion failure in %s",  buf,  0x1Cu);
      }

      abort();
    }

    int64_t v14 = (*(int64_t **)((char *)self->_sessionReasonStack.c.__map_.__begin_
                              + (((value + self->_sessionReasonStack.c.__start_ - 1) >> 6) & 0x3FFFFFFFFFFFFF8LL)))[(value + self->_sessionReasonStack.c.__start_ - 1) & 0x1FF];
    unsigned __int16 v15 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    sessionStartTimestamp = self->_sessionStartTimestamp;
    self->_sessionStartTimestamp = v15;

    v21.receiver = self;
    v21.super_class = (Class)&OBJC_CLASS___NIServerAcwgSession;
    BOOL v17 = -[NIServerBaseSession resourcesManager](&v21, "resourcesManager");
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 remote]);
    [v19 didStartAcwgRanging:v14];
  }

- (void)_handleSessionStats:(SessionStats *)a3
{
  unsigned int v4 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_100395790(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
}

- (void)_handleHealthChanged:(int)a3
{
  uint64_t v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_100395800(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  uint64_t v13 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000065CC(__p, off_1007B3640[a3]);
    if (v17 >= 0) {
      int64_t v14 = __p;
    }
    else {
      int64_t v14 = (void **)__p[0];
    }
    containerUniqueIdentifier = self->_containerUniqueIdentifier;
    *(_DWORD *)__int128 buf = 136315394;
    unsigned int v19 = v14;
    __int16 v20 = 2112;
    objc_super v21 = containerUniqueIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "#ses-acwg,Health changed to %s, session container ID: %@",  buf,  0x16u);
    if (v17 < 0) {
      operator delete(__p[0]);
    }
  }
}

- (void)_handleTimeoutEvent:(int)a3 time:(double)a4
{
  uint64_t v7 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_1003958E8(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  sub_1000065CC(__p, off_1007B3658[a3]);
  unsigned __int16 v15 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = __p;
    if (v35 < 0) {
      int v16 = (void **)__p[0];
    }
    containerUniqueIdentifier = self->_containerUniqueIdentifier;
    *(_DWORD *)__int128 buf = 136315650;
    *(void *)&uint8_t buf[4] = v16;
    __int16 v39 = 2048;
    *(double *)uint64_t v40 = a4;
    *(_WORD *)&v40[8] = 2112;
    *(void *)&v40[10] = containerUniqueIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "#ses-acwg,Received timeout event %s at %f sec, session container ID: %@",  buf,  0x20u);
  }

  if (self->_acwgManager.__ptr_)
  {
    v33.receiver = self;
    v33.super_class = (Class)&OBJC_CLASS___NIServerAcwgSession;
    __int16 v18 = -[NIServerBaseSession resourcesManager](&v33, "resourcesManager");
    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    __int16 v20 = v19;
    uint64_t v32 = 103LL;
    if ((a3 - 2) >= 2)
    {
      if (a3 != 4)
      {
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
          sub_100395870();
        }
        uint64_t v31 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int128 buf = 136315650;
          *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session"
                               "/NIServerAcwgSession.mm";
          __int16 v39 = 1024;
          *(_DWORD *)uint64_t v40 = 1360;
          *(_WORD *)&v40[4] = 2080;
          *(void *)&v40[6] = "-[NIServerAcwgSession _handleTimeoutEvent:time:]";
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "#ses-acwg,%s:%d: assertion failure in %s",  buf,  0x1Cu);
        }

        abort();
      }

      sub_1001897BC(&self->_suspendReasonStack.c.__map_.__first_, &v32);
      int v23 = sub_1002C282C((uint64_t)self->_acwgManager.__ptr_);
      int v24 = v23;
      if (!v23) {
        goto LABEL_26;
      }
      sub_1002C2FE4(v23, buf);
      if (v40[9] >= 0) {
        int v25 = buf;
      }
      else {
        int v25 = *(_BYTE **)buf;
      }
      objc_super v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Supending ACWG Ranging on timeout failed (%s)",  v25));
      if ((v40[9] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_100394A5C();
      }
      NSErrorUserInfoKey v36 = NSLocalizedDescriptionKey;
      uint64_t v37 = v21;
      __int16 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
      uint64_t v27 = (v24 + 103);
      else {
        uint64_t v28 = v27 - 19703;
      }
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  v28,  v26));

      unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v20 remote]);
      [v30 uwbSessionDidFailWithError:v29];
    }

    else
    {
      objc_super v21 = (void *)objc_claimAutoreleasedReturnValue([v19 remote]);
      [v21 requestAcwgRangingSessionSuspend:sub_1002C2DC4((uint64_t)self->_acwgManager.__ptr_) withSuspendTriggerReason:103];
    }

LABEL_26:
    goto LABEL_27;
  }

  uint64_t v22 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "#ses-acwg,No Acwg manager. Ignoring timeout event",  buf,  2u);
  }

- (void)didReceiveAopSensorFusionUpdate:(int)a3 withBtConnHandle:(unsigned __int16)a4
{
  uint64_t v7 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_100395958(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  objc_initWeak(&location, self);
  clientQueue = (dispatch_queue_s *)self->_clientQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100188DC0;
  v16[3] = &unk_1007B2CE0;
  objc_copyWeak(&v17, &location);
  unsigned __int16 v19 = a4;
  int v18 = a3;
  v16[4] = self;
  dispatch_async(clientQueue, v16);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)rangingServiceDidUpdateState:(int)a3 cause:(int)a4
{
  uint64_t v7 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_1003959F4(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  specific = (NSString *)dispatch_get_specific("com.apple.nearbyd.acwg-session.queue-context-key");
  containerUniqueIdentifier = self->_containerUniqueIdentifier;
  id v17 = (os_log_s *)(id)qword_1008000A0;
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (specific == containerUniqueIdentifier)
  {
    if (v18)
    {
      sub_1000065CC(v30, off_1007B3688[a3]);
      int v23 = v31;
      int v24 = (void **)v30[0];
      sub_1000065CC(__p, off_1007B36B0[a4]);
      int v25 = v30;
      if (v23 < 0) {
        int v25 = v24;
      }
      if (v29 >= 0) {
        __int16 v26 = __p;
      }
      else {
        __int16 v26 = (void **)__p[0];
      }
      *(_DWORD *)__int128 buf = 136315394;
      objc_super v33 = v25;
      __int16 v34 = 2080;
      char v35 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "#ses-acwg,rangingServiceDidUpdateState:%s cause:%s -> ACCEPTING Container message",  buf,  0x16u);
      if (v29 < 0) {
        operator delete(__p[0]);
      }
      if (v31 < 0) {
        operator delete(v30[0]);
      }
    }

    if (a3 == 4)
    {
      ptr = self->_acwgManager.__ptr_;
      if (ptr) {
        sub_1002C2EDC((uint64_t)ptr);
      }
    }
  }

  else
  {
    if (v18)
    {
      sub_1000065CC(v30, off_1007B3688[a3]);
      int v19 = v31;
      __int16 v20 = (void **)v30[0];
      sub_1000065CC(__p, off_1007B36B0[a4]);
      objc_super v21 = v30;
      if (v19 < 0) {
        objc_super v21 = v20;
      }
      if (v29 >= 0) {
        uint64_t v22 = __p;
      }
      else {
        uint64_t v22 = (void **)__p[0];
      }
      *(_DWORD *)__int128 buf = 136315394;
      objc_super v33 = v21;
      __int16 v34 = 2080;
      char v35 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "#ses-acwg,rangingServiceDidUpdateState:%s cause:%s -> REJECTING RangingManager message",  buf,  0x16u);
      if (v29 < 0) {
        operator delete(__p[0]);
      }
      if (v31 < 0) {
        operator delete(v30[0]);
      }
    }
  }

- (NIAcwgConfiguration)configuration
{
  return (NIAcwgConfiguration *)objc_getProperty(self, a2, 336LL, 1);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 9) = 0LL;
  *((void *)self + 10) = 0LL;
  *((void *)self + 11) = 0LL;
  *((void *)self + 12) = 0LL;
  *((void *)self + 13) = 0LL;
  *((void *)self + 14) = 0LL;
  *((void *)self + 15) = 0LL;
  *((void *)self + 16) = 0LL;
  *((void *)self + 17) = 0LL;
  *((void *)self + 18) = 0LL;
  *((_BYTE *)self + 152) = 0;
  *((_BYTE *)self + 216) = 0;
  *((_OWORD *)self + 14) = 0u;
  *((_OWORD *)self + 15) = 0u;
  *((_OWORD *)self + 16) = 0u;
  *((_OWORD *)self + 18) = 0u;
  *((_OWORD *)self + 19) = 0u;
  *((_OWORD *)self + 17) = 0u;
  return self;
}

@end