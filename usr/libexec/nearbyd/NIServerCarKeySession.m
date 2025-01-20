@interface NIServerCarKeySession
+ (JobConfig)_aopJobConfigWithTimeouts;
- (NICarKeyConfiguration)configuration;
- (NIServerCarKeySession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5;
- (NIServerDataResponse)processDCKMessage:(id)a3;
- (NIServerNumberResponse)isRangingLimitExceeded;
- (RequestConstructionDebugParams)_ownerDeviceServiceRequestDebugParams:(SEL)a3;
- (Result<rose::RoseServiceRequest>)_passthroughSessionServiceRequest:(SEL)a3;
- (duration<long)nominalCycleRate;
- (id).cxx_construct;
- (id)_configureForLabTestModeSession;
- (id)_configureForOwnerDevice;
- (id)_configureForPassthroughSession;
- (id)_pauseOwnerSession;
- (id)_pausePassthroughOrLabTestModeSession;
- (id)_processCarKeyEvent:(id)a3;
- (id)_runLabTestModeSession;
- (id)_runOwnerSession;
- (id)_runPassthroughSession;
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
- (void)_relayDCKMessageInternal:(const void *)a3;
- (void)invalidate;
- (void)rangingServiceDidUpdateState:(int)a3 cause:(int)a4;
@end

@implementation NIServerCarKeySession

- (NIServerCarKeySession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v12 = objc_opt_class(v10, v11);
  if (v12 != objc_opt_class(&OBJC_CLASS___NICarKeyConfiguration, v13))
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v36 handleFailureInMethod:a2 object:self file:@"NIServerCarKeySession.mm" lineNumber:332 description:@"NIServerCarKeySession given invalid configuration."];
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v9 serverSessionIdentifier]);

  if (!v14)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v37 handleFailureInMethod:a2, self, @"NIServerCarKeySession.mm", 333, @"Invalid parameter not satisfying: %@", @"resourcesManager.serverSessionIdentifier" object file lineNumber description];
  }

  v15 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "#ses-carkey,initWithResourcesManager. Configuration: %@",  buf,  0xCu);
  }

  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___NIServerCarKeySession;
  v16 = -[NIServerBaseSession initWithResourcesManager:configuration:error:]( &v38,  "initWithResourcesManager:configuration:error:",  v9,  v10,  a5);
  v17 = v16;
  if (v16)
  {
    if (v9)
    {
      [v9 protobufLogger];
    }

    else
    {
      *(void *)buf = 0LL;
      *(void *)&buf[8] = 0LL;
    }

    sub_10000EE54((uint64_t)&v16->_pbLogger, (__int128 *)buf);
    v18 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8])
    {
      v19 = (unint64_t *)(*(void *)&buf[8] + 8LL);
      do
        unint64_t v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }

    uint64_t v21 = objc_claimAutoreleasedReturnValue([v9 clientConnectionQueue]);
    clientQueue = v16->_clientQueue;
    v16->_clientQueue = (OS_dispatch_queue *)v21;

    v23 = (NICarKeyConfiguration *)[v10 copy];
    configuration = v16->_configuration;
    v16->_configuration = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue([v9 serverSessionIdentifier]);
    uint64_t v26 = objc_claimAutoreleasedReturnValue([v25 UUIDString]);
    containerUniqueIdentifier = v16->_containerUniqueIdentifier;
    v16->_containerUniqueIdentifier = (NSString *)v26;

    if (v9)
    {
      [v9 powerBudgetProvider];
    }

    else
    {
      *(void *)buf = 0LL;
      *(void *)&buf[8] = 0LL;
    }

    sub_10000EE54((uint64_t)&v16->_powerBudgetProvider, (__int128 *)buf);
    v28 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8])
    {
      v29 = (unint64_t *)(*(void *)&buf[8] + 8LL);
      do
        unint64_t v30 = __ldaxr(v29);
      while (__stlxr(v30 - 1, v29));
      if (!v30)
      {
        ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
        std::__shared_weak_count::__release_weak(v28);
      }
    }

    v31 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = sub_10014B25C();
      v33 = @"No";
      if (v32) {
        v33 = @"Yes";
      }
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v33;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "#ses-carkey,Power budget reporting to CPMS is supported: %@",  buf,  0xCu);
    }

    v34 = v17;
  }

  return v17;
}

- (id)lastConfiguration
{
  return self->_configuration;
}

- (void)invalidate
{
  v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-carkey,invalidate.", buf, 2u);
  }

  id v4 = -[NIServerCarKeySession disableAllServices](self, "disableAllServices");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NIServerCarKeySession;
  -[NIServerBaseSession invalidate](&v5, "invalidate");
}

- (id)disableAllServices
{
  v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-carkey,disableAllServices.", buf, 2u);
  }

  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___NIServerCarKeySession;
  id v4 = -[NIServerBaseSession disableAllServices](&v22, "disableAllServices");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  ptr = self->_alishaManager.__ptr_;
  if (ptr)
  {
    sub_1002C3DB8(ptr);
    *(void *)buf = 0LL;
    *(void *)&buf[8] = 0LL;
    sub_10000EE54((uint64_t)&self->_alishaManager, (__int128 *)buf);
    v7 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8])
    {
      v8 = (unint64_t *)(*(void *)&buf[8] + 8LL);
      do
        unint64_t v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
  }

  id v10 = self->_standaloneAlishaSession.__ptr_;
  if (v10)
  {
    sub_10026FAA8((uint64_t)v10);
    *(void *)buf = 0LL;
    *(void *)&buf[8] = 0LL;
    sub_10000EE54((uint64_t)&self->_standaloneAlishaSession, (__int128 *)buf);
    uint64_t v11 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8])
    {
      uint64_t v12 = (unint64_t *)(*(void *)&buf[8] + 8LL);
      do
        unint64_t v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }

  v14 = self->_timeoutManager.__ptr_;
  if (v14)
  {
    sub_1001AE9FC((uint64_t)v14);
    sub_10015D394(&self->_timeoutManager.__ptr_);
  }

  sub_10015D394(&self->_certLogger.__ptr_);
  configuration = self->_configuration;
  if (configuration && (id)-[NICarKeyConfiguration configurationType](configuration, "configurationType") == (id)3)
  {
    v16 = sub_100288340();
    sub_100288568((uint64_t)v16, 0);
    v17 = sub_100288340();
    unint64_t v18 = sub_100288570((uint64_t)v17);
    if ((_DWORD)v18)
    {
      v19 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "#ses-carkey,#lab-test Test mode after invalidation: unknown",  buf,  2u);
      }
    }

    else
    {
      if ((v18 & 0xFF0000000000LL) == 0) {
        __assert_rtn( "-[NIServerCarKeySession disableAllServices]",  "NIServerCarKeySession.mm",  390,  "alishaTestModeResult.payload.has_value()");
      }
      unint64_t v20 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = BYTE4(v18);
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "#ses-carkey,#lab-test Test mode after invalidation: %d",  buf,  8u);
      }

      if ((v18 & 0xFF00000000LL) != 0 && os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_10039E804();
      }
    }
  }

  return v5;
}

- (duration<long)nominalCycleRate
{
  return (duration<long long, std::ratio<1, 1000>>)3000LL;
}

- (unint64_t)requiresUWBToRun
{
  return 2LL;
}

- (id)configure
{
  if (!self->_configuration) {
    sub_10039E830();
  }
  v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-carkey,configure", buf, 2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration vehicleIdentifier](self->_configuration, "vehicleIdentifier"));
  BOOL v5 = v4 == 0LL;

  if (v5)
  {
    unint64_t v20 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10039E858(v20, v21, v22, v23, v24, v25, v26, v27);
    }
    NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
    v46 = @"Vehicle identifier nil or invalid.";
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  v28));
  }

  else
  {
    if (!self->_alishaSystem.__ptr_)
    {
      v6 = operator new(0x20uLL);
      v6[1] = 0LL;
      v6[2] = 0LL;
      void *v6 = off_1007B2D10;
      v6[3] = &off_1007B9910;
      *(void *)buf = v6 + 3;
      *(void *)&buf[8] = v6;
      sub_10000EE54((uint64_t)&self->_alishaSystem, (__int128 *)buf);
      v7 = *(std::__shared_weak_count **)&buf[8];
      if (*(void *)&buf[8])
      {
        v8 = (unint64_t *)(*(void *)&buf[8] + 8LL);
        do
          unint64_t v9 = __ldaxr(v8);
        while (__stlxr(v9 - 1, v8));
        if (!v9)
        {
          ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
          std::__shared_weak_count::__release_weak(v7);
        }
      }
    }

    sub_10027395C((uint64_t)buf);
    if (*(_DWORD *)buf)
    {
      id v10 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_10039E8C8(v10, v11, v12, v13, v14, v15, v16, v17);
      }
      NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
      v42 = @"Failed to query device capabilities.";
      unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL));
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  v18));
    }

    else
    {
      if (!v40) {
        __assert_rtn( "-[NIServerCarKeySession configure]",  "NIServerCarKeySession.mm",  431,  "response.payload.has_value()");
      }
      v29 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        if (!v40) {
          sub_100006080();
        }
        sub_1002BC13C((uint64_t *)&buf[8], &__p);
        if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          p_p = &__p;
        }
        else {
          p_p = (std::stringbuf::string_type *)__p.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)v43 = 136315138;
        v44 = p_p;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "#ses-carkey,Alisha Capabilities: %s",  v43,  0xCu);
      }

      sub_100189454((uint64_t)&self->_cachedCapabilities, (uint64_t)&buf[8]);
      if ((id)-[NICarKeyConfiguration configurationType](self->_configuration, "configurationType") == (id)3)
      {
        uint64_t v31 = objc_claimAutoreleasedReturnValue(-[NIServerCarKeySession _configureForLabTestModeSession](self, "_configureForLabTestModeSession"));
      }

      else
      {
        int v32 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
        v33 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:@"PassthroughSession"]);
        unsigned int v34 = [v33 BOOLValue];

        int64_t v35 = -[NICarKeyConfiguration configurationType](self->_configuration, "configurationType");
        if (v35 == 2) {
          int v36 = 1;
        }
        else {
          int v36 = v34;
        }
        if (v36 == 1)
        {
          self->_passthroughParams.isPassthroughSession = 1;
          self->_passthroughParams.anchorSimulation = v35 == 2;
          uint64_t v31 = objc_claimAutoreleasedReturnValue(-[NIServerCarKeySession _configureForPassthroughSession](self, "_configureForPassthroughSession"));
        }

        else
        {
          if ((id)-[NICarKeyConfiguration configurationType](self->_configuration, "configurationType") != (id)1) {
            __assert_rtn( "-[NIServerCarKeySession configure]",  "NIServerCarKeySession.mm",  457,  "_configuration.configurationType == _NICarKeyConfigurationTypeOwner");
          }
          uint64_t v31 = objc_claimAutoreleasedReturnValue(-[NIServerCarKeySession _configureForOwnerDevice](self, "_configureForOwnerDevice"));
        }
      }

      v19 = (void *)v31;
    }

    sub_100189774((uint64_t)&buf[8]);
  }

  return v19;
}

- (id)run
{
  if ((id)-[NICarKeyConfiguration configurationType](self->_configuration, "configurationType") == (id)3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerCarKeySession _runLabTestModeSession](self, "_runLabTestModeSession"));
  }

  else if (self->_passthroughParams.isPassthroughSession)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerCarKeySession _runPassthroughSession](self, "_runPassthroughSession"));
  }

  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerCarKeySession _runOwnerSession](self, "_runOwnerSession"));
  }

  return v3;
}

- (id)pauseWithSource:(int64_t)a3
{
  if (self->_passthroughParams.isPassthroughSession
    || (id)-[NICarKeyConfiguration configurationType](self->_configuration, "configurationType", a3) == (id)3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerCarKeySession _pausePassthroughOrLabTestModeSession]( self,  "_pausePassthroughOrLabTestModeSession",  a3));
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerCarKeySession _pauseOwnerSession](self, "_pauseOwnerSession"));
  }

  return v4;
}

- (NIServerDataResponse)processDCKMessage:(id)a3
{
  id v4 = a3;
  BOOL v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)std::stringbuf::string_type __p = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#ses-carkey,processDCKMessage got dckMessage: %@",  buf,  0xCu);
  }

  if (!self->_alishaManager.__ptr_)
  {
    uint64_t v11 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10039E938(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
    v49 = @"State error: No alisha manager when processing DCK message.";
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v49,  &v48,  1LL));
    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  v19));

    goto LABEL_16;
  }

  id v6 = [v4 length];
  if (!v4 || (id v7 = v6) == 0LL)
  {
    unint64_t v20 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10039E9A8(v20, v21, v22, v23, v24, v25, v26, v27);
    }
    NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
    v47 = @"Received nil or empty DCK message.";
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v47,  &v46,  1LL));
    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -19889LL,  v28));

LABEL_16:
    uint64_t v8 = 0LL;
    goto LABEL_38;
  }

  sub_100024264(v37, (size_t)v6);
  [v4 getBytes:v37[0] length:v7];
  sub_1002C4700((uint64_t *)self->_alishaManager.__ptr_, (uint64_t *)v37, (uint64_t)buf);
  if (v45)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  *(void *)&__p[4],  v44 - *(void *)&__p[4]));
    unint64_t v9 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)char v40 = 138412290;
      *(void *)&v40[4] = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "#ses-carkey,DCK processing succeeded and requires sending a response: %@",  v40,  0xCu);
    }

    uint64_t v10 = 0LL;
  }

  else
  {
    if (*(_DWORD *)buf)
    {
      sub_1002BEFAC(*(int *)buf, v40);
      if (v41 >= 0) {
        v29 = v40;
      }
      else {
        v29 = *(_BYTE **)v40;
      }
      unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DCK processing failed. %s",  v29));
      if (v41 < 0) {
        operator delete(*(void **)v40);
      }
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_10039EA18();
      }
      int v31 = *(_DWORD *)buf;
      NSErrorUserInfoKey v38 = NSLocalizedDescriptionKey;
      v39 = v30;
      int v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));
      else {
        uint64_t v33 = -5887LL;
      }
      uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  v33,  v32));
    }

    else
    {
      unsigned int v34 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)char v40 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "#ses-carkey,DCK processing succeeded and does not require sending a response.",  v40,  2u);
      }

      uint64_t v10 = 0LL;
    }

    uint64_t v8 = 0LL;
  }

  if (v45 && *(void *)&__p[4])
  {
    uint64_t v44 = *(void *)&__p[4];
    operator delete(*(void **)&__p[4]);
  }

  if (v37[0])
  {
    v37[1] = v37[0];
    operator delete(v37[0]);
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
    uint64_t v15 = v14;
    *(_DWORD *)buf = 138413058;
    v61 = v15;
    __int16 v62 = 2048;
    unint64_t v63 = a4;
    __int16 v64 = 2048;
    unint64_t v65 = a5;
    __int16 v66 = 2048;
    *(double *)v67 = a6;
    uint64_t v16 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "#ses-carkey,processBluetoothHostTimeSyncWithType got event: %@, btc clock ticks: %llu, event counter: %llu, monoto nic time: %f [s]",  buf,  0x2Au);
  }

  *a7 = 0LL;
  if (self->_alishaManager.__ptr_)
  {
    if (a3 == 12 || a3 == 138)
    {
      if (a3 == 12) {
        int v17 = 12;
      }
      else {
        int v17 = 138;
      }
      uint64_t v18 = sub_100005150();
      BOOL v19 = sub_1003552D4((uint64_t)v18);
      unint64_t v20 = 7500 * a4;
      if (v19) {
        unint64_t v20 = a4;
      }
      *(_DWORD *)buf = v17;
      LODWORD(v61) = 1;
      BYTE4(v61) = 0;
      BYTE2(v63) = 0;
      unint64_t v65 = v20;
      LOBYTE(v66) = 1;
      *(void *)&v67[3] = a5;
      *(double *)&v67[7] = a6;
      LOBYTE(v51[0]) = 0;
      char v57 = 0;
      sub_1002C4D28((uint64_t)self->_alishaManager.__ptr_, (unsigned int *)buf, (uint64_t)v51, &v48);
      if (v48)
      {
        sub_1002BEFAC(v48, __p);
        if (v47 >= 0) {
          uint64_t v21 = __p;
        }
        else {
          uint64_t v21 = (void **)__p[0];
        }
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to process Bluetooth host time sync. %s",  v21));
        if (v47 < 0) {
          operator delete(__p[0]);
        }
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
          sub_10039EA18();
        }
        NSErrorUserInfoKey v58 = NSLocalizedDescriptionKey;
        v59 = v22;
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v59,  &v58,  1LL));
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -19887LL,  v23));
      }

      else
      {
        if (v57)
        {
          v43 = objc_alloc(&OBJC_CLASS___NIBluetoothHostTimeSyncResponse);
          LOWORD(v45) = v56;
          *a7 =  -[NIBluetoothHostTimeSyncResponse initWithDeviceEventCount:uwbDeviceTimeUs:uwbDeviceTimeUncertainty:uwbClockSkewMeasurementAvailable:deviceMaxPpm:success:retryDelay:]( v43,  "initWithDeviceEventCount:uwbDeviceTimeUs:uwbDeviceTimeUncertainty:uwbClockSkewMeasurementAvailable:d eviceMaxPpm:success:retryDelay:",  v51[0],  v51[1],  v52,  v53,  v54,  v55,  v45);
        }

        if (v50) {
          -[NIServerCarKeySession _relayDCKMessageInternal:](self, "_relayDCKMessageInternal:", v49);
        }
        uint64_t v24 = 0LL;
      }

      if (v50 && v49[0])
      {
        v49[1] = v49[0];
        operator delete(v49[0]);
      }
    }

    else
    {
      unsigned int v34 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_10039EAE8(v34, v35, v36, v37, v38, v39, v40, v41);
      }
      NSErrorUserInfoKey v68 = NSLocalizedDescriptionKey;
      v69 = @"Invalid Bluetooth Host Time Sync Event type. See the NIBluetoothHostTimeSyncType enum for valid options.";
      v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v69,  &v68,  1LL));
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -19887LL,  v42));
    }
  }

  else
  {
    uint64_t v25 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10039EA78(v25, v26, v27, v28, v29, v30, v31, v32);
    }
    NSErrorUserInfoKey v70 = NSLocalizedDescriptionKey;
    v71 = @"State error: No alisha manager when processing Bluetooth Host Time Sync Event.";
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v71,  &v70,  1LL));
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  v33));
  }

  return v24;
}

- (NIServerNumberResponse)isRangingLimitExceeded
{
  v2 = sub_100269560();
  int v3 = sub_10026AEA8((dispatch_queue_s **)v2, 5);
  id v4 = &__kCFBooleanFalse;
  if (v3) {
    id v4 = &__kCFBooleanTrue;
  }
  id v5 = v4;
  id v6 = 0LL;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (id)deleteURSKs
{
  ptr = self->_alishaManager.__ptr_;
  if (ptr)
  {
    int v3 = sub_1002C5174((uint64_t)ptr);
    if (!v3)
    {
      id v7 = 0LL;
      return v7;
    }

    sub_1002BEFAC(v3, __p);
    if (v18 >= 0) {
      id v4 = __p;
    }
    else {
      id v4 = (void **)__p[0];
    }
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to delete keys. %s",  v4));
    if (v18 < 0) {
      operator delete(__p[0]);
    }
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10039EA18();
    }
    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    unint64_t v20 = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -19883LL,  v6));
  }

  else
  {
    uint64_t v8 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10039EB58(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    uint64_t v22 = @"State error: No alisha manager when deleting URSKs.";
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  v5));
  }

  return v7;
}

- (id)_setDebugURSK:(id)a3 transactionIdentifier:(unsigned int)a4
{
  id v6 = a3;
  if (os_variant_allows_internal_security_policies([@"com.apple.nearbyd" UTF8String]))
  {
    if (v6 && [v6 length] == (id)32)
    {
      [v6 getBytes:v29 length:32];
      unsigned int v26 = a4;
      __int128 v27 = v29[0];
      __int128 v28 = v29[1];
      int v7 = sub_100273F88((uint64_t)self->_alishaSystem.__ptr_, (uint64_t)&v26);
      if (v7)
      {
        sub_1002BEFAC(v7, __p);
        if (v23 >= 0) {
          uint64_t v8 = __p;
        }
        else {
          uint64_t v8 = (void **)__p[0];
        }
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to set debug key. %s",  v8));
        if (v23 < 0) {
          operator delete(__p[0]);
        }
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
          sub_10039EA18();
        }
        NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
        uint64_t v25 = v9;
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -19886LL,  v10));
      }

      else
      {
        uint64_t v11 = 0LL;
      }
    }

    else
    {
      uint64_t v12 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_10039EBC8(v12, v13, v14, v15, v16, v17, v18, v19);
      }
      NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
      uint64_t v31 = @"Nil or invalid length URSK.";
      unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -19886LL,  v20));
    }
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  0LL));
  }

  return v11;
}

- (id)_setURSKTTL:(unint64_t)a3
{
  if ((os_variant_allows_internal_security_policies([@"com.apple.nearbyd" UTF8String]) & 1) == 0) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  0LL));
  }
  int v5 = sub_10027412C((uint64_t)self->_alishaSystem.__ptr_, a3);
  if (!v5) {
    return 0LL;
  }
  sub_1002BEFAC(v5, __p);
  if (v12 >= 0) {
    id v6 = __p;
  }
  else {
    id v6 = (void **)__p[0];
  }
  int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to set URSK TTL. %s",  v6));
  if (v12 < 0) {
    operator delete(__p[0]);
  }
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
    sub_10039EA18();
  }
  NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
  uint64_t v14 = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -18889LL,  v8));

  return v9;
}

- (id)_processCarKeyEvent:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"CarKeyEventType"]);
    if (v7 && (uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber, v6), (objc_opt_isKindOfClass(v7, v8) & 1) != 0))
    {
      id v9 = [v7 integerValue];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"CarKeyEventReason"]);
      id v11 = [v10 integerValue];

      switch((unint64_t)v9)
      {
        case 1uLL:
          char v12 = (os_log_s *)(id)qword_1008000A0;
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            NSErrorUserInfoKey v13 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration vehicleIdentifier](self->_configuration, "vehicleIdentifier"));
            *(_DWORD *)buf = 67109378;
            int v46 = (int)v11;
            LOWORD(v47) = 2112;
            *(void *)((char *)&v47 + 2) = v13;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "#ses-carkey,_processCarKeyEvent: vehicle unlocked (reason %d) for vehicle identifier: %@",  buf,  0x12u);
          }

          ptr = self->_analyticsManager.__ptr_;
          if (ptr) {
            sub_10017C620((uint64_t)ptr);
          }
          goto LABEL_62;
        case 2uLL:
          uint64_t v19 = (os_log_s *)(id)qword_1008000A0;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration vehicleIdentifier](self->_configuration, "vehicleIdentifier"));
            *(_DWORD *)buf = 67109378;
            int v46 = (int)v11;
            LOWORD(v47) = 2112;
            *(void *)((char *)&v47 + 2) = v20;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "#ses-carkey,_processCarKeyEvent: vehicle locked (reason %d) for vehicle identifier: %@",  buf,  0x12u);
          }

          NSErrorUserInfoKey v21 = self->_analyticsManager.__ptr_;
          if (v21) {
            sub_10017C454((uint64_t)v21);
          }
          goto LABEL_62;
        case 3uLL:
          uint64_t v22 = (os_log_s *)(id)qword_1008000A0;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            char v23 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration vehicleIdentifier](self->_configuration, "vehicleIdentifier"));
            *(_DWORD *)buf = 67109378;
            int v46 = (int)v11;
            LOWORD(v47) = 2112;
            *(void *)((char *)&v47 + 2) = v23;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "#ses-carkey,_processCarKeyEvent: vehicle ready to drive (reason %d) for vehicle identifier: %@",  buf,  0x12u);
          }

          NSErrorUserInfoKey v24 = self->_analyticsManager.__ptr_;
          if (v24) {
            sub_10017C810((uint64_t)v24);
          }
          goto LABEL_62;
        case 4uLL:
          uint64_t v25 = (os_log_s *)(id)qword_1008000A0;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration vehicleIdentifier](self->_configuration, "vehicleIdentifier"));
            *(_DWORD *)buf = 67109378;
            int v46 = (int)v11;
            LOWORD(v47) = 2112;
            *(void *)((char *)&v47 + 2) = v26;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "#ses-carkey,_processCarKeyEvent: ranging intent sent to vehicle (reason %d) for vehicle identifier: %@",  buf,  0x12u);
          }

          __int128 v27 = self->_analyticsManager.__ptr_;
          if (v27)
          {
            if (v11 == (id)2)
            {
              sub_10017C2A4((uint64_t)v27);
            }

            else if (v11 == (id)1)
            {
              sub_10017C0F8((uint64_t)v27);
            }

            else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
            {
              sub_10039ECF0();
            }
          }

          goto LABEL_62;
        case 5uLL:
          __int128 v28 = self->_alishaManager.__ptr_;
          if (v28)
          {
            sub_1002C4590((uint64_t)v28, buf);
            uint64_t v29 = (os_log_s *)(id)qword_1008000A0;
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              NSErrorUserInfoKey v30 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration vehicleIdentifier](self->_configuration, "vehicleIdentifier"));
              sub_1002BEFAC(*(int *)buf, __p);
              if (v40 >= 0) {
                uint64_t v31 = __p;
              }
              else {
                uint64_t v31 = (void **)__p[0];
              }
              *(_DWORD *)uint64_t v41 = 138412546;
              v42 = v30;
              __int16 v43 = 2080;
              uint64_t v44 = v31;
              _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "#ses-carkey,_processCarKeyEvent: vehicle sent ranging terminated sub-event. Vehicle identifier: %@. Stop ranging status: %s",  v41,  0x16u);
              if (v40 < 0) {
                operator delete(__p[0]);
              }
            }

            goto LABEL_50;
          }

          uint64_t v35 = (os_log_s *)(id)qword_1008000A0;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
          {
            uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration vehicleIdentifier](self->_configuration, "vehicleIdentifier"));
            sub_10039ED1C(v36, (uint64_t)buf, v35);
          }

          goto LABEL_55;
        case 6uLL:
          uint64_t v32 = self->_alishaManager.__ptr_;
          if (v32)
          {
            sub_1002C4590((uint64_t)v32, buf);
            uint64_t v29 = (os_log_s *)(id)qword_1008000A0;
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration vehicleIdentifier](self->_configuration, "vehicleIdentifier"));
              sub_1002BEFAC(*(int *)buf, __p);
              if (v40 >= 0) {
                unsigned int v34 = __p;
              }
              else {
                unsigned int v34 = (void **)__p[0];
              }
              *(_DWORD *)uint64_t v41 = 138412546;
              v42 = v33;
              __int16 v43 = 2080;
              uint64_t v44 = v34;
              _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "#ses-carkey,_processCarKeyEvent: vehicle sent ranging suspension sub-event. Vehicle identifier: %@. Stop ranging status: %s",  v41,  0x16u);
              if (v40 < 0) {
                operator delete(__p[0]);
              }
            }

- (void)rangingServiceDidUpdateState:(int)a3 cause:(int)a4
{
  if (a3 == 4)
  {
    ptr = self->_alishaManager.__ptr_;
    if (ptr) {
      sub_1002C51A0((uint64_t)ptr);
    }
  }

- (shared_ptr<rose::objects::AlishaSession>)_buildAlishaSession:(const void *)a3
{
  int v5 = v3;
  uint64_t v6 = self;
  sub_1000065CC(__p, (char *)-[NSString UTF8String](v6->_containerUniqueIdentifier, "UTF8String"));
  int v7 = operator new(0x5D8uLL);
  v7[1] = 0LL;
  v7[2] = 0LL;
  void *v7 = off_1007B2D60;
  uint64_t v8 = v7 + 3;
  id v9 = v6;
  *(void *)buf = off_1007B7040;
  v61 = v9;
  __int16 v62 = buf;
  uint64_t v10 = v9;
  v58[0] = off_1007B70C0;
  v58[1] = v10;
  v59 = v58;
  id v11 = v10;
  v56[0] = off_1007B7140;
  v56[1] = v11;
  char v57 = v56;
  unsigned __int8 v55 = 0LL;
  char v12 = v11;
  v52[0] = off_1007B71C0;
  v52[1] = v12;
  unsigned __int8 v53 = v52;
  NSErrorUserInfoKey v13 = v12;
  v50[0] = off_1007B7240;
  v50[1] = v13;
  v51 = v50;
  uint64_t v14 = v13;
  v48[0] = off_1007B72C0;
  v48[1] = v14;
  v49 = v48;
  ptr = v6->_pbLogger.__ptr_;
  cntrl = v6->_pbLogger.__cntrl_;
  __int128 v47 = (std::__shared_weak_count *)cntrl;
  if (cntrl)
  {
    uint64_t v16 = (unint64_t *)((char *)cntrl + 8);
    do
      unint64_t v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
  }

  sub_100274944( v8,  (__int128 *)__p,  (void *)a3,  (uint64_t)buf,  (uint64_t)v58,  (uint64_t)v56,  (uint64_t)v54,  (uint64_t)v52,  (uint64_t)v50,  (uint64_t)v48,  &ptr);
  uint64_t v18 = v47;
  if (v47)
  {
    p_shared_owners = (unint64_t *)&v47->__shared_owners_;
    do
      unint64_t v20 = __ldaxr(p_shared_owners);
    while (__stlxr(v20 - 1, p_shared_owners));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }

  NSErrorUserInfoKey v21 = v49;
  if (v49 == v48)
  {
    uint64_t v22 = 4LL;
    NSErrorUserInfoKey v21 = v48;
  }

  else
  {
    if (!v49) {
      goto LABEL_14;
    }
    uint64_t v22 = 5LL;
  }

  (*(void (**)(void))(*v21 + 8 * v22))();
LABEL_14:
  char v23 = v51;
  if (v51 == v50)
  {
    uint64_t v24 = 4LL;
    char v23 = v50;
  }

  else
  {
    if (!v51) {
      goto LABEL_19;
    }
    uint64_t v24 = 5LL;
  }

  (*(void (**)(void))(*v23 + 8 * v24))();
LABEL_19:
  uint64_t v25 = v53;
  if (v53 == v52)
  {
    uint64_t v26 = 4LL;
    uint64_t v25 = v52;
  }

  else
  {
    if (!v53) {
      goto LABEL_24;
    }
    uint64_t v26 = 5LL;
  }

  (*(void (**)(void))(*v25 + 8 * v26))();
LABEL_24:
  __int128 v27 = v55;
  if (v55 == v54)
  {
    uint64_t v28 = 4LL;
    __int128 v27 = v54;
  }

  else
  {
    if (!v55) {
      goto LABEL_29;
    }
    uint64_t v28 = 5LL;
  }

  (*(void (**)(void))(*v27 + 8 * v28))();
LABEL_29:
  uint64_t v29 = v57;
  if (v57 == v56)
  {
    uint64_t v30 = 4LL;
    uint64_t v29 = v56;
  }

  else
  {
    if (!v57) {
      goto LABEL_34;
    }
    uint64_t v30 = 5LL;
  }

  (*(void (**)(void))(*v29 + 8 * v30))();
LABEL_34:
  uint64_t v31 = v59;
  if (v59 == v58)
  {
    uint64_t v32 = 4LL;
    uint64_t v31 = v58;
  }

  else
  {
    if (!v59) {
      goto LABEL_39;
    }
    uint64_t v32 = 5LL;
  }

  (*(void (**)(void))(*v31 + 8 * v32))();
LABEL_39:
  uint64_t v33 = v62;
  if (v62 == buf)
  {
    uint64_t v34 = 4LL;
    uint64_t v33 = buf;
  }

  else
  {
    if (!v62) {
      goto LABEL_44;
    }
    uint64_t v34 = 5LL;
  }

  (*(void (**)(void))(*(void *)v33 + 8 * v34))();
LABEL_44:
  *(void *)&__int128 v43 = v7 + 3;
  *((void *)&v43 + 1) = v7;
  sub_100012538((uint64_t)&v43, v7 + 5, (uint64_t)v8);
  uint64_t v35 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "#ses-carkey,Registering for Alisha service.",  buf,  2u);
  }

  int v36 = sub_10026FF14(v43);
  if (v36)
  {
    uint64_t v37 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      sub_100275DD0(v36, buf);
      sub_10039EDA4();
    }

    *int v5 = 0LL;
    v5[1] = 0LL;
    uint64_t v38 = (std::__shared_weak_count *)*((void *)&v43 + 1);
    if (*((void *)&v43 + 1))
    {
      uint64_t v39 = (unint64_t *)(*((void *)&v43 + 1) + 8LL);
      do
        unint64_t v40 = __ldaxr(v39);
      while (__stlxr(v40 - 1, v39));
      if (!v40)
      {
        ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
        std::__shared_weak_count::__release_weak(v38);
      }
    }
  }

  else
  {
    *(_OWORD *)int v5 = v43;
  }

  if (v45 < 0) {
    operator delete(__p[0]);
  }

  result.__cntrl_ = v42;
  result.__ptr_ = v41;
  return result;
}

- (void)_alishaSessionInvalidatedWithReason:(int)a3
{
  int v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_100275E00(a3, v10);
    sub_10039EDF8();
  }

  -[NIServerCarKeySession invalidate](self, "invalidate");
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NIServerCarKeySession;
  id v6 = -[NIServerBaseSession invalidationHandler](&v9, "invalidationHandler");
  int v7 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  0LL));
  ((void (**)(void, void *))v7)[2](v7, v8);
}

- (id)_configureForOwnerDevice
{
  p_cachedCapabilities = &self->_cachedCapabilities;
  if (!self->_cachedCapabilities.__engaged_)
  {
    v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v103 handleFailureInMethod:a2, self, @"NIServerCarKeySession.mm", 876, @"Invalid parameter not satisfying: %@", @"_cachedCapabilities.has_value()" object file lineNumber description];
  }

  id v4 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ses-carkey,_configureForOwnerDevice", buf, 2u);
  }

  if (self->_passthroughParams.isPassthroughSession) {
    sub_10039EE74();
  }
  if (self->_passthroughParams.anchorSimulation) {
    sub_10039EE4C();
  }
  int v5 = self;
  p_dckCoder = &v5->_dckCoder;
  if (!v5->_dckCoder.__ptr_)
  {
    sub_1002279E8(word_100428900, buf);
    sub_10000EE54((uint64_t)p_dckCoder, (__int128 *)buf);
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
  }

  if (!v5->_configProvider.__ptr_)
  {
    unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](v5->_configuration, "debugOptions"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"BypassBluetoothTimesync"]);
    unsigned __int8 v19 = [v18 BOOLValue];

    LOBYTE(ptr) = v19;
    sub_100227AC4((char *)&ptr, buf);
    sub_10000EE54((uint64_t)&v5->_configProvider, (__int128 *)buf);
    unint64_t v20 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8])
    {
      NSErrorUserInfoKey v21 = (unint64_t *)(*(void *)&buf[8] + 8LL);
      do
        unint64_t v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
  }

  if (!v5->_paramNegotiator.__ptr_)
  {
    if (!p_cachedCapabilities->__engaged_) {
      sub_100006080();
    }
    char v23 = operator new(0xE8uLL);
    uint64_t v24 = v23;
    v23[1] = 0LL;
    v23[2] = 0LL;
    void *v23 = off_1007B3320;
    uint64_t v25 = v23 + 3;
    *(void *)&__int128 v117 = v5->_alishaSystem.__ptr_;
    cntrl = v5->_alishaSystem.__cntrl_;
    *((void *)&v117 + 1) = cntrl;
    if (cntrl)
    {
      __int128 v27 = (unint64_t *)((char *)cntrl + 8);
      do
        unint64_t v28 = __ldxr(v27);
      while (__stxr(v28 + 1, v27));
    }

    ptr = v5->_configProvider.__ptr_;
    uint64_t v29 = v5->_configProvider.__cntrl_;
    v116 = (std::__shared_weak_count *)v29;
    if (v29)
    {
      uint64_t v30 = (unint64_t *)((char *)v29 + 8);
      do
        unint64_t v31 = __ldxr(v30);
      while (__stxr(v31 + 1, v30));
    }

    *(void *)buf = &off_1007B74C0;
    v120 = buf;
    sub_1002B668C(v23 + 3, p_cachedCapabilities, &v117, &ptr, buf);
    uint64_t v32 = v120;
    if (v120 == buf)
    {
      uint64_t v33 = 4LL;
      uint64_t v32 = buf;
    }

    else
    {
      if (!v120) {
        goto LABEL_102;
      }
      uint64_t v33 = 5LL;
    }

    (*(void (**)(void))(*(void *)v32 + 8 * v33))();
LABEL_102:
    v82 = v116;
    if (v116)
    {
      p_shared_owners = (unint64_t *)&v116->__shared_owners_;
      do
        unint64_t v84 = __ldaxr(p_shared_owners);
      while (__stlxr(v84 - 1, p_shared_owners));
      if (!v84)
      {
        ((void (*)(std::__shared_weak_count *))v82->__on_zero_shared)(v82);
        std::__shared_weak_count::__release_weak(v82);
      }
    }

    v85 = (std::__shared_weak_count *)*((void *)&v117 + 1);
    if (*((void *)&v117 + 1))
    {
      v86 = (unint64_t *)(*((void *)&v117 + 1) + 8LL);
      do
        unint64_t v87 = __ldaxr(v86);
      while (__stlxr(v87 - 1, v86));
      if (!v87)
      {
        ((void (*)(std::__shared_weak_count *))v85->__on_zero_shared)(v85);
        std::__shared_weak_count::__release_weak(v85);
      }
    }

    *(void *)&__int128 v114 = v25;
    *((void *)&v114 + 1) = v24;
    sub_10000EE54((uint64_t)&v5->_paramNegotiator, &v114);
    v88 = (std::__shared_weak_count *)*((void *)&v114 + 1);
    if (*((void *)&v114 + 1))
    {
      v89 = (unint64_t *)(*((void *)&v114 + 1) + 8LL);
      do
        unint64_t v90 = __ldaxr(v89);
      while (__stlxr(v90 - 1, v89));
      if (!v90)
      {
        ((void (*)(std::__shared_weak_count *))v88->__on_zero_shared)(v88);
        std::__shared_weak_count::__release_weak(v88);
      }
    }
  }

  int v7 = v5;
  p_analyticsManager = &v7->_analyticsManager;
  if (!v7->_analyticsManager.__ptr_)
  {
    uint64_t v34 = operator new(0xE0uLL);
    v34[1] = 0LL;
    v34[2] = 0LL;
    void *v34 = off_1007B7540;
    *(void *)buf = sub_10017A3C0((uint64_t)(v34 + 3), v7->_clientQueue);
    *(void *)&uint8_t buf[8] = v34;
    sub_10000EE54((uint64_t)p_analyticsManager, (__int128 *)buf);
    uint64_t v35 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8])
    {
      int v36 = (unint64_t *)(*(void *)&buf[8] + 8LL);
      do
        unint64_t v37 = __ldaxr(v36);
      while (__stlxr(v37 - 1, v36));
      if (!v37)
      {
        ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
        std::__shared_weak_count::__release_weak(v35);
      }
    }
  }

  if (!v7->_certLogger.__ptr_)
  {
    id v106 = (id)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration vehicleIdentifier](v7->_configuration, "vehicleIdentifier"));
    sub_100228890(&v106, buf);
    sub_10000EE54((uint64_t)&v7->_certLogger, (__int128 *)buf);
    objc_super v9 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8])
    {
      uint64_t v10 = (unint64_t *)(*(void *)&buf[8] + 8LL);
      do
        unint64_t v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
  }

  if (!v7->_alishaManager.__ptr_)
  {
    sub_100269560();
    sub_10026AE10(5, v7->_containerUniqueIdentifier, v7->_clientQueue, &v105);
    uint64_t v38 = operator new(0x100uLL);
    v38[1] = 0LL;
    v38[2] = 0LL;
    *uint64_t v38 = off_1007B75E0;
    uint64_t v39 = v7;
    *(void *)buf = off_1007B7630;
    *(void *)&uint8_t buf[8] = v39;
    v120 = buf;
    unint64_t v40 = v39;
    *(void *)&__int128 v117 = off_1007B76B0;
    *((void *)&v117 + 1) = v40;
    v118 = &v117;
    ptr = (AlishaConfigProvider *)v7->_alishaSystem.__ptr_;
    uint64_t v41 = v7->_alishaSystem.__cntrl_;
    v116 = (std::__shared_weak_count *)v41;
    if (v41)
    {
      v42 = (unint64_t *)((char *)v41 + 8);
      do
        unint64_t v43 = __ldxr(v42);
      while (__stxr(v43 + 1, v42));
    }

    *(void *)&__int128 v114 = p_dckCoder->__ptr_;
    uint64_t v44 = v5->_dckCoder.__cntrl_;
    *((void *)&v114 + 1) = v44;
    if (v44)
    {
      char v45 = (unint64_t *)((char *)v44 + 8);
      do
        unint64_t v46 = __ldxr(v45);
      while (__stxr(v46 + 1, v45));
    }

    v112 = v5->_paramNegotiator.__ptr_;
    __int128 v47 = v5->_paramNegotiator.__cntrl_;
    v113 = (std::__shared_weak_count *)v47;
    if (v47)
    {
      char v48 = (unint64_t *)((char *)v47 + 8);
      do
        unint64_t v49 = __ldxr(v48);
      while (__stxr(v49 + 1, v48));
    }

    __int128 v111 = v105;
    if (*((void *)&v105 + 1))
    {
      char v50 = (unint64_t *)(*((void *)&v105 + 1) + 8LL);
      do
        unint64_t v51 = __ldxr(v50);
      while (__stxr(v51 + 1, v50));
    }

    v109 = v7->_pbLogger.__ptr_;
    unsigned __int8 v52 = v7->_pbLogger.__cntrl_;
    v110 = (std::__shared_weak_count *)v52;
    if (v52)
    {
      unsigned __int8 v53 = (unint64_t *)((char *)v52 + 8);
      do
        unint64_t v54 = __ldxr(v53);
      while (__stxr(v54 + 1, v53));
    }

    v107 = p_analyticsManager->__ptr_;
    unsigned __int8 v55 = v7->_analyticsManager.__cntrl_;
    v108 = (std::__shared_weak_count *)v55;
    if (v55)
    {
      __int16 v56 = (unint64_t *)((char *)v55 + 8);
      do
        unint64_t v57 = __ldxr(v56);
      while (__stxr(v57 + 1, v56));
    }

    sub_1002C3CC4((uint64_t)(v38 + 3), (uint64_t)buf, (uint64_t)&v117, &ptr, &v114, &v112, &v111, &v109, &v107);
    NSErrorUserInfoKey v58 = v108;
    if (v108)
    {
      v59 = (unint64_t *)&v108->__shared_owners_;
      do
        unint64_t v60 = __ldaxr(v59);
      while (__stlxr(v60 - 1, v59));
      if (!v60)
      {
        ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
        std::__shared_weak_count::__release_weak(v58);
      }
    }

    v61 = v110;
    if (v110)
    {
      __int16 v62 = (unint64_t *)&v110->__shared_owners_;
      do
        unint64_t v63 = __ldaxr(v62);
      while (__stlxr(v63 - 1, v62));
      if (!v63)
      {
        ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
        std::__shared_weak_count::__release_weak(v61);
      }
    }

    __int16 v64 = (std::__shared_weak_count *)*((void *)&v111 + 1);
    if (*((void *)&v111 + 1))
    {
      unint64_t v65 = (unint64_t *)(*((void *)&v111 + 1) + 8LL);
      do
        unint64_t v66 = __ldaxr(v65);
      while (__stlxr(v66 - 1, v65));
      if (!v66)
      {
        ((void (*)(std::__shared_weak_count *))v64->__on_zero_shared)(v64);
        std::__shared_weak_count::__release_weak(v64);
      }
    }

    v67 = v113;
    if (v113)
    {
      NSErrorUserInfoKey v68 = (unint64_t *)&v113->__shared_owners_;
      do
        unint64_t v69 = __ldaxr(v68);
      while (__stlxr(v69 - 1, v68));
      if (!v69)
      {
        ((void (*)(std::__shared_weak_count *))v67->__on_zero_shared)(v67);
        std::__shared_weak_count::__release_weak(v67);
      }
    }

    NSErrorUserInfoKey v70 = (std::__shared_weak_count *)*((void *)&v114 + 1);
    if (*((void *)&v114 + 1))
    {
      v71 = (unint64_t *)(*((void *)&v114 + 1) + 8LL);
      do
        unint64_t v72 = __ldaxr(v71);
      while (__stlxr(v72 - 1, v71));
      if (!v72)
      {
        ((void (*)(std::__shared_weak_count *))v70->__on_zero_shared)(v70);
        std::__shared_weak_count::__release_weak(v70);
      }
    }

    v73 = v116;
    if (v116)
    {
      v74 = (unint64_t *)&v116->__shared_owners_;
      do
        unint64_t v75 = __ldaxr(v74);
      while (__stlxr(v75 - 1, v74));
      if (!v75)
      {
        ((void (*)(std::__shared_weak_count *))v73->__on_zero_shared)(v73);
        std::__shared_weak_count::__release_weak(v73);
      }
    }

    v76 = v118;
    if (v118 == &v117)
    {
      uint64_t v77 = 4LL;
      v76 = &v117;
    }

    else
    {
      if (!v118) {
        goto LABEL_126;
      }
      uint64_t v77 = 5LL;
    }

    (*(void (**)(void))(*(void *)v76 + 8 * v77))();
LABEL_126:
    v94 = v120;
    if (v120 == buf)
    {
      uint64_t v95 = 4LL;
      v94 = buf;
    }

    else
    {
      if (!v120) {
        goto LABEL_131;
      }
      uint64_t v95 = 5LL;
    }

    (*(void (**)(void))(*(void *)v94 + 8 * v95))();
LABEL_131:
    *(void *)&__int128 v104 = v38 + 3;
    *((void *)&v104 + 1) = v38;
    sub_10000EE54((uint64_t)&v7->_alishaManager, &v104);
    v96 = (std::__shared_weak_count *)*((void *)&v104 + 1);
    if (*((void *)&v104 + 1))
    {
      v97 = (unint64_t *)(*((void *)&v104 + 1) + 8LL);
      do
        unint64_t v98 = __ldaxr(v97);
      while (__stlxr(v98 - 1, v97));
      if (!v98)
      {
        ((void (*)(std::__shared_weak_count *))v96->__on_zero_shared)(v96);
        std::__shared_weak_count::__release_weak(v96);
      }
    }

    v99 = (std::__shared_weak_count *)*((void *)&v105 + 1);
    if (*((void *)&v105 + 1))
    {
      v100 = (unint64_t *)(*((void *)&v105 + 1) + 8LL);
      do
        unint64_t v101 = __ldaxr(v100);
      while (__stlxr(v101 - 1, v100));
      if (!v101)
      {
        ((void (*)(std::__shared_weak_count *))v99->__on_zero_shared)(v99);
        std::__shared_weak_count::__release_weak(v99);
      }
    }
  }

  char v12 = v7;
  if (v12->_timeoutManager.__ptr_) {
    goto LABEL_20;
  }
  v78 = operator new(0x78uLL);
  v78[1] = 0LL;
  v78[2] = 0LL;
  void *v78 = off_1007B7730;
  v79 = v12;
  *(void *)buf = off_1007B7780;
  *(void *)&uint8_t buf[8] = v79;
  v120 = buf;
  sub_1001AE894((uint64_t)(v78 + 3), (uint64_t)buf, v12->_clientQueue, v12->_containerUniqueIdentifier);
  v80 = v120;
  if (v120 == buf)
  {
    uint64_t v81 = 4LL;
    v80 = buf;
    goto LABEL_118;
  }

  if (v120)
  {
    uint64_t v81 = 5LL;
LABEL_118:
    (*(void (**)(void))(*(void *)v80 + 8 * v81))();
  }

  *(void *)&__int128 v117 = v78 + 3;
  *((void *)&v117 + 1) = v78;
  sub_100012538((uint64_t)&v117, v78 + 3, (uint64_t)(v78 + 3));
  sub_10000EE54((uint64_t)&v12->_timeoutManager, &v117);
  v91 = (std::__shared_weak_count *)*((void *)&v117 + 1);
  if (*((void *)&v117 + 1))
  {
    v92 = (unint64_t *)(*((void *)&v117 + 1) + 8LL);
    do
      unint64_t v93 = __ldaxr(v92);
    while (__stlxr(v93 - 1, v92));
    if (!v93)
    {
      ((void (*)(std::__shared_weak_count *))v91->__on_zero_shared)(v91);
      std::__shared_weak_count::__release_weak(v91);
    }
  }

- (id)_configureForPassthroughSession
{
  if ((os_variant_allows_internal_security_policies([@"com.apple.nearbyd" UTF8String]) & 1) == 0) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  0LL));
  }
  id v4 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    BOOL anchorSimulation = self->_passthroughParams.anchorSimulation;
    *(_DWORD *)buf = 67109120;
    BOOL v92 = anchorSimulation;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "#ses-carkey,_configureForPassthroughSession. Anchor: %d",  buf,  8u);
  }

  if (!self->_configuration)
  {
    v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v82 handleFailureInMethod:a2, self, @"NIServerCarKeySession.mm", 968, @"Invalid parameter not satisfying: %@", @"_configuration" object file lineNumber description];
  }

  if (!self->_cachedCapabilities.__engaged_)
  {
    v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v83 handleFailureInMethod:a2, self, @"NIServerCarKeySession.mm", 969, @"Invalid parameter not satisfying: %@", @"_cachedCapabilities.has_value()" object file lineNumber description];
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
  BOOL v7 = v6 == 0LL;

  if (v7)
  {
    NSErrorUserInfoKey v101 = NSLocalizedDescriptionKey;
    v102 = @"Passthrough configuration must have debugOptions.";
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v102,  &v101,  1LL));
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  v24));

    return v25;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"BypassBluetoothTimesync"]);
  self->_passthroughParams.bypassBluetoothTimesync = [v9 BOOLValue];

  if (self->_passthroughParams.anchorSimulation)
  {
    if (self->_passthroughParams.bypassBluetoothTimesync) {
      goto LABEL_23;
    }
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"DckTimeSyncBtEventLocalClock"]);

    if (v11 && (uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber, v12), (objc_opt_isKindOfClass(v11, v13) & 1) != 0))
    {
      unint64_t v14 = (unint64_t)[v11 unsignedLongLongValue];
      uint64_t v15 = sub_100005150();
      BOOL v16 = sub_1003552D4((uint64_t)v15);
      BOOL engaged = self->_passthroughParams.dckTimeSyncBtEvent.__engaged_;
      unint64_t v18 = 7500 * v14;
      if (v16) {
        unint64_t v18 = v14;
      }
      *(void *)&self->_passthroughParams.dckTimeSyncBtEvent.var0.__null_state_ = 0x10000008ALL;
      self->_passthroughParams.dckTimeSyncBtEvent.var0.__val_.bluetoothTicks.var0.__null_state_ = 0;
      self->_passthroughParams.dckTimeSyncBtEvent.var0.__val_.bluetoothTicks.__engaged_ = 0;
      self->_passthroughParams.dckTimeSyncBtEvent.var0.__val_.gtbTicks.var0.__val_.__rep_ = v18;
      self->_passthroughParams.dckTimeSyncBtEvent.var0.__val_.gtbTicks.__engaged_ = 1;
      self->_passthroughParams.dckTimeSyncBtEvent.var0.__val_.eventCounter = 0LL;
      self->_passthroughParams.dckTimeSyncBtEvent.var0.__val_.monotonicTimeSec = 0.0;
      if (!engaged) {
        self->_passthroughParams.dckTimeSyncBtEvent.__engaged_ = 1;
      }
      unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue( -[NICarKeyConfiguration debugOptions]( self->_configuration,  "debugOptions",  COERCE_DOUBLE(0x10000008ALL)));
      unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"DckTimeSyncUwbDeviceTime"]);

      if (v20)
      {
        uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSNumber, v21);
        if ((objc_opt_isKindOfClass(v20, v22) & 1) != 0)
        {
          self->_passthroughParams.dckTimeSyncUwbDeviceTimeUsec.var0.__val_ = (unint64_t)[v20 unsignedLongLongValue];
          self->_passthroughParams.dckTimeSyncUwbDeviceTimeUsec.__engaged_ = 1;

          goto LABEL_23;
        }
      }

      unint64_t v72 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_10039EFEC(v72, v73, v74, v75, v76, v77, v78, v79);
      }
      NSErrorUserInfoKey v95 = NSLocalizedDescriptionKey;
      v96 = @"Anchor simulation must provide DckTimeSyncUwbDeviceTime in debug options.";
      v80 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v96,  &v95,  1LL));
      uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  v80));

      return v81;
    }

    else
    {
      v42 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_10039EF7C(v42, v43, v44, v45, v46, v47, v48, v49);
      }
      NSErrorUserInfoKey v97 = NSLocalizedDescriptionKey;
      unint64_t v98 = @"Anchor simulation must provide DckTimeSyncBtEventLocalClock in debug options.";
      char v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v98,  &v97,  1LL));
      unint64_t v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  v50));

      return v51;
    }
  }

  else
  {
    if (self->_passthroughParams.bypassBluetoothTimesync)
    {
LABEL_23:
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
      -[NIServerCarKeySession _passthroughSessionServiceRequest:](self, "_passthroughSessionServiceRequest:", v26);

      int v27 = v94;
      if (v94) {
        int v28 = 0;
      }
      else {
        int v28 = -1004;
      }
      if (*(_DWORD *)buf) {
        int v29 = *(_DWORD *)buf;
      }
      else {
        int v29 = v28;
      }
      if (v29)
      {
        sub_1002BEFAC(v29, __p);
        if (v86 >= 0) {
          uint64_t v30 = __p;
        }
        else {
          uint64_t v30 = (void **)__p[0];
        }
        unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to create alisha service request. %s",  v30));
        if (v86 < 0) {
          operator delete(__p[0]);
        }
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
          sub_10039EA18();
        }
        NSErrorUserInfoKey v89 = NSLocalizedDescriptionKey;
        unint64_t v90 = v31;
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v90,  &v89,  1LL));
        else {
          uint64_t v33 = -5887LL;
        }
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  v33,  v32));

        return v34;
      }

      else
      {
        ptr = self->_standaloneAlishaSession.__ptr_;
        if (ptr)
        {
          sub_10026FAA8((uint64_t)ptr);
          sub_10015D394(&self->_standaloneAlishaSession.__ptr_);
          int v27 = v94;
        }

        if (!v27) {
          sub_100006080();
        }
        -[NIServerCarKeySession _buildAlishaSession:](self, "_buildAlishaSession:", &v93);
        sub_10000EE54((uint64_t)&self->_standaloneAlishaSession, (__int128 *)__p);
        int v36 = (std::__shared_weak_count *)__p[1];
        if (__p[1])
        {
          unint64_t v37 = (unint64_t *)((char *)__p[1] + 8);
          do
            unint64_t v38 = __ldaxr(v37);
          while (__stlxr(v38 - 1, v37));
          if (!v38)
          {
            ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
            std::__shared_weak_count::__release_weak(v36);
          }
        }

        if (self->_standaloneAlishaSession.__ptr_)
        {
          if (!self->_certLogger.__ptr_)
          {
            id v84 = (id)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration vehicleIdentifier](self->_configuration, "vehicleIdentifier"));
            sub_100228890(&v84, __p);
            sub_10000EE54((uint64_t)&self->_certLogger, (__int128 *)__p);
            uint64_t v39 = (std::__shared_weak_count *)__p[1];
            if (__p[1])
            {
              unint64_t v40 = (unint64_t *)((char *)__p[1] + 8);
              do
                unint64_t v41 = __ldaxr(v40);
              while (__stlxr(v41 - 1, v40));
              if (!v41)
              {
                ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
                std::__shared_weak_count::__release_weak(v39);
              }
            }
          }

          return 0LL;
        }

        else
        {
          __int16 v62 = (os_log_s *)qword_1008000A0;
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
            sub_10039EF0C(v62, v63, v64, v65, v66, v67, v68, v69);
          }
          NSErrorUserInfoKey v87 = NSLocalizedDescriptionKey;
          v88 = @"Failed to create alisha standalone session.";
          NSErrorUserInfoKey v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v88,  &v87,  1LL));
          v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  v70));

          return v71;
        }
      }
    }

    unsigned __int8 v52 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10039EE9C(v52, v53, v54, v55, v56, v57, v58, v59);
    }
    NSErrorUserInfoKey v99 = NSLocalizedDescriptionKey;
    v100 = @"Passthrough session in mobile role must bypass BT timesync.";
    unint64_t v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v100,  &v99,  1LL));
    v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  v60));

    return v61;
  }

- (id)_configureForLabTestModeSession
{
  id v4 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ses-carkey,#lab-test _configure", buf, 2u);
  }

  configuration = self->_configuration;
  if (!configuration)
  {
    NSErrorUserInfoKey v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v101 handleFailureInMethod:a2, self, @"NIServerCarKeySession.mm", 1055, @"Invalid parameter not satisfying: %@", @"_configuration" object file lineNumber description];

    configuration = self->_configuration;
  }

  if ((id)-[NICarKeyConfiguration configurationType](configuration, "configurationType") != (id)3)
  {
    v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v102 handleFailureInMethod:a2, self, @"NIServerCarKeySession.mm", 1056, @"Invalid parameter not satisfying: %@", @"_configuration.configurationType == _NICarKeyConfigurationTypeLabTestMode" object file lineNumber description];
  }

  if (!self->_alishaSystem.__ptr_)
  {
    v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v103 handleFailureInMethod:a2, self, @"NIServerCarKeySession.mm", 1057, @"Invalid parameter not satisfying: %@", @"_alishaSystem" object file lineNumber description];
  }

  v141.receiver = self;
  v141.super_class = (Class)&OBJC_CLASS___NIServerCarKeySession;
  id v6 = -[NIServerBaseSession resourcesManager](&v141, "resourcesManager");
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if ([v7 entitlementGranted:7])
  {
    uint64_t v8 = sub_100288340();
    unint64_t v9 = sub_100288570((uint64_t)v8);
    if ((_DWORD)v9)
    {
      uint64_t v10 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_10039F27C(v10, v11, v12, v13, v14, v15, v16, v17);
      }
      NSErrorUserInfoKey v154 = NSLocalizedDescriptionKey;
      v155 = @"Current test mode undetermined.";
      unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v155,  &v154,  1LL));
      unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  v18));

      goto LABEL_17;
    }

    if ((v9 & 0xFF0000000000LL) == 0) {
      __assert_rtn( "-[NIServerCarKeySession _configureForLabTestModeSession]",  "NIServerCarKeySession.mm",  1077,  "alishaTestModeResult.payload.has_value()");
    }
    uint64_t v30 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v145 = BYTE4(v9);
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "#ses-carkey,#lab-test current test mode: %d",  buf,  8u);
    }

    if ((v9 & 0xFF00000000LL) != 0) {
      goto LABEL_22;
    }
    if (sub_100273BFC())
    {
      uint64_t v55 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_10039F20C(v55, v56, v57, v58, v59, v60, v61, v62);
      }
      NSErrorUserInfoKey v152 = NSLocalizedDescriptionKey;
      v153 = @"Failed to delete keys.";
      uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v153,  &v152,  1LL));
      unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  v63));
    }

    else
    {
      uint64_t v66 = sub_100288340();
      if (sub_100288568((uint64_t)v66, 1))
      {
        uint64_t v67 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
          sub_10039F19C(v67, v68, v69, v70, v71, v72, v73, v74);
        }
        NSErrorUserInfoKey v150 = NSLocalizedDescriptionKey;
        v151 = @"Failed to set test mode.";
        uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v151,  &v150,  1LL));
        unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  v75));
      }

      else
      {
        unint64_t v90 = sub_100288340();
        unint64_t v91 = sub_100288570((uint64_t)v90);
        if (!(_DWORD)v91 && (v91 & 0xFF0000000000LL) != 0 && (v91 & 0xFF00000000LL) != 0)
        {
LABEL_22:
          unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
          unsigned __int16 v115 = (unsigned __int16)sub_100223D74(v31, @"AlishaProtocolVersion", (id)0x100);

          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
          unsigned __int16 v114 = (unsigned __int16)sub_100223D74(v32, @"UWBConfigId", (id)1);

          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
          unsigned __int8 v113 = sub_100223D74(v33, @"PulseShapeCombo", 0LL);

          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
          unsigned __int8 v112 = sub_100223D74(v34, @"HopConfigBitmask", (id)0x80);

          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
          unsigned int v111 = sub_100223D74(v35, @"AnchorHopKey", 0LL);

          int v36 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
          unsigned __int8 v110 = sub_100223D74(v36, @"RFChannel", (id)1);

          unint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
          id v38 = sub_100223D74(v37, @"SyncCodeIndex", (id)9);

          uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
          unsigned __int8 v109 = sub_100223D74(v39, @"SessionRANMultiplier", (id)1);

          unint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
          unsigned __int8 v108 = sub_100223D74(v40, @"ChapsPerSlot", (id)6);

          unint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
          unsigned __int8 v107 = sub_100223D74(v41, @"SlotsPerRound", (id)0xC);

          v42 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
          unsigned __int8 v106 = sub_100223D74(v42, @"NumResponderNodes", (id)6);

          char v43 = (_BYTE)v38 - 9;
          if (((_BYTE)v38 - 9) >= 4u)
          {
            uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid sync code index %d",  v38));
            if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
              sub_10039F13C();
            }
            NSErrorUserInfoKey v146 = NSLocalizedDescriptionKey;
            v147 = v64;
            uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v147,  &v146,  1LL));
            unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  v65));
          }

          else
          {
            uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
            BOOL v105 = sub_100223D74(v44, @"DisableUWBEncryption", 0LL) != 0LL;

            uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
            BOOL v104 = sub_100223D74(v45, @"DisableSecureToF", 0LL) != 0LL;

            uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
            BOOL v47 = sub_100223D74(v46, @"ForceAntennaSelection", 0LL) != 0LL;

            if (v47)
            {
              uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
              unsigned __int8 v49 = sub_100223D74(v48, @"TxAntennaMask", 0LL);

              char v50 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
              unsigned __int8 v51 = sub_100223D74(v50, @"RxAntennaMask", 0LL);

              unsigned __int8 v52 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
              unsigned __int8 v53 = sub_100223D74(v52, @"RxSyncSearchAntennaMask", 0LL);

              __int16 v54 = 1;
            }

            else
            {
              unsigned __int8 v53 = 0;
              __int16 v54 = 0;
              unsigned __int8 v51 = 0;
              unsigned __int8 v49 = 0;
            }

            v130[0] = 0x1000000;
            v130[1] = 305419896;
            char v131 = 1;
            unsigned int v132 = v111;
            char v133 = 1;
            BOOL v134 = v47;
            __int16 v135 = v49 | ((v54 & 1) << 8);
            __int16 v136 = v51 | ((v54 & 1) << 8);
            __int16 v137 = v53 | (unsigned __int16)(v54 << 8);
            BOOL v138 = v105;
            BOOL v139 = v104;
            int v140 = 5;
            int v118 = -2023406815;
            unsigned __int8 v119 = v110;
            char v120 = v43;
            unsigned __int16 v121 = v115;
            unsigned __int16 v122 = v114;
            unsigned __int8 v123 = v109;
            unsigned __int8 v124 = v108;
            unsigned __int8 v125 = v107;
            unsigned __int8 v126 = v106;
            unsigned __int8 v127 = v112;
            unsigned __int8 v128 = v113;
            int v129 = 0;
            +[NIServerCarKeySession _aopJobConfigWithTimeouts]( &OBJC_CLASS___NIServerCarKeySession,  "_aopJobConfigWithTimeouts");
            *(void *)&double v76 = sub_1001413F4(&v118, 102, (uint64_t)v117, (unsigned __int8 *)v130, (uint64_t)buf).n128_u64[0];
            ptr = self->_standaloneAlishaSession.__ptr_;
            if (ptr)
            {
              sub_10026FAA8((uint64_t)ptr);
              sub_10015D394(&self->_standaloneAlishaSession.__ptr_);
            }

            -[NIServerCarKeySession _buildAlishaSession:](self, "_buildAlishaSession:", buf, v76);
            sub_10000EE54((uint64_t)&self->_standaloneAlishaSession, v117);
            uint64_t v78 = (std::__shared_weak_count *)*((void *)&v117[0] + 1);
            if (*((void *)&v117[0] + 1))
            {
              uint64_t v79 = (unint64_t *)(*((void *)&v117[0] + 1) + 8LL);
              do
                unint64_t v80 = __ldaxr(v79);
              while (__stlxr(v80 - 1, v79));
              if (!v80)
              {
                ((void (*)(std::__shared_weak_count *))v78->__on_zero_shared)(v78);
                std::__shared_weak_count::__release_weak(v78);
              }
            }

            if (self->_standaloneAlishaSession.__ptr_)
            {
              if (!self->_certLogger.__ptr_)
              {
                id v116 = (id)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration vehicleIdentifier](self->_configuration, "vehicleIdentifier"));
                sub_100228890(&v116, v117);
                sub_10000EE54((uint64_t)&self->_certLogger, v117);
                sub_100012390((uint64_t)v117);
              }

              unsigned __int8 v19 = 0LL;
            }

            else
            {
              uint64_t v81 = (os_log_s *)qword_1008000A0;
              if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
                sub_10039F0CC(v81, v82, v83, v84, v85, v86, v87, v88);
              }
              NSErrorUserInfoKey v142 = NSLocalizedDescriptionKey;
              v143 = @"Failed to create standalone session.";
              NSErrorUserInfoKey v89 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v143,  &v142,  1LL));
              unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  v89));
            }
          }

          goto LABEL_17;
        }

        BOOL v92 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
          sub_10039F05C(v92, v93, v94, v95, v96, v97, v98, v99);
        }
        NSErrorUserInfoKey v148 = NSLocalizedDescriptionKey;
        v149 = @"Failed to enable test mode.";
        v100 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v149,  &v148,  1LL));
        unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  v100));
      }
    }
  }

  else
  {
    unint64_t v20 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10039F2EC(v20, v21, v22, v23, v24, v25, v26, v27);
    }
    NSErrorUserInfoKey v156 = NSLocalizedDescriptionKey;
    v157 = @"Not authorized.";
    int v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v157,  &v156,  1LL));
    unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  v28));
  }

- (id)_runLabTestModeSession
{
  id v4 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ses-carkey,#lab-test _run", buf, 2u);
  }

  configuration = self->_configuration;
  if (!configuration)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v12 handleFailureInMethod:a2, self, @"NIServerCarKeySession.mm", 1197, @"Invalid parameter not satisfying: %@", @"_configuration" object file lineNumber description];

    configuration = self->_configuration;
  }

  if ((id)-[NICarKeyConfiguration configurationType](configuration, "configurationType") != (id)3)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v13 handleFailureInMethod:a2, self, @"NIServerCarKeySession.mm", 1198, @"Invalid parameter not satisfying: %@", @"_configuration.configurationType == _NICarKeyConfigurationTypeLabTestMode" object file lineNumber description];
  }

  ptr = self->_standaloneAlishaSession.__ptr_;
  if (!ptr)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v14 handleFailureInMethod:a2, self, @"NIServerCarKeySession.mm", 1199, @"Invalid parameter not satisfying: %@", @"_standaloneAlishaSession" object file lineNumber description];

    ptr = self->_standaloneAlishaSession.__ptr_;
  }

  sub_100274998((uint64_t)ptr, llround(3000000.0), (uint64_t)buf);
  if (*(_DWORD *)buf)
  {
    sub_1002BEFAC(*(int *)buf, __p);
    if (v16 >= 0) {
      BOOL v7 = __p;
    }
    else {
      BOOL v7 = (void **)__p[0];
    }
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to run standalone session. Error: %s",  v7));
    if (v16 < 0) {
      operator delete(__p[0]);
    }
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10039F13C();
    }
    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    unsigned __int8 v19 = v8;
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  v9));
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  return v10;
}

- (id)_runOwnerSession
{
  int v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-carkey,run owner session", buf, 2u);
  }

  ptr = self->_alishaManager.__ptr_;
  if (!ptr) {
    sub_10039F35C();
  }
  int v5 = sub_1002C3F74(ptr);
  if (v5)
  {
    sub_1002BEFAC(v5, buf);
    if (v12 >= 0) {
      id v6 = buf;
    }
    else {
      id v6 = *(uint8_t **)buf;
    }
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to run NI CarKey owner session. Error: %s",  v6));
    if (v12 < 0) {
      operator delete(*(void **)buf);
    }
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10039F384();
    }
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    uint64_t v14 = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  v8));
  }

  else
  {
    unint64_t v9 = 0LL;
  }

  return v9;
}

- (id)_runPassthroughSession
{
  if ((os_variant_allows_internal_security_policies([@"com.apple.nearbyd" UTF8String]) & 1) == 0) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  0LL));
  }
  int v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-carkey,_runPassthroughSession", buf, 2u);
  }

  if (!self->_standaloneAlishaSession.__ptr_) {
    sub_10039F3E4();
  }
  if (!self->_passthroughParams.passthroughUwbSessionId.__engaged_) {
    sub_10039F40C();
  }
  sub_1002734A4(self->_passthroughParams.passthroughUwbSessionId.var0.__val_, (uint64_t)v34);
  if (v34[0])
  {
    sub_1002BEFAC(v34[0], buf);
    if (v40 >= 0) {
      id v4 = buf;
    }
    else {
      id v4 = *(_BYTE **)buf;
    }
    int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to get key for passthrough session. Error: %s",  v4));
    if (SHIBYTE(v40) < 0) {
      operator delete(*(void **)buf);
    }
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10039EA18();
    }
    NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
    uint64_t v45 = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v45,  &v44,  1LL));
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  v6));

    return v7;
  }

  unint64_t v9 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "#ses-carkey,GetKey operation succeeded. Proceeding.",  buf,  2u);
  }

  if (self->_passthroughParams.bypassBluetoothTimesync)
  {
    uint64_t v10 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ses-carkey,DCK time sync bypass", buf, 2u);
    }

    sub_100274998( (uint64_t)self->_standaloneAlishaSession.__ptr_,  llround(dbl_1004295C0[!self->_passthroughParams.anchorSimulation]),  (uint64_t)buf);
    int v11 = *(_DWORD *)buf;
    if (*(_DWORD *)buf)
    {
LABEL_22:
      sub_1002BEFAC(v11, buf);
      if (v40 >= 0) {
        char v12 = buf;
      }
      else {
        char v12 = *(_BYTE **)buf;
      }
      NSErrorUserInfoKey v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to start Alisha standalone ranging session. Error: %s",  v12));
      if (SHIBYTE(v40) < 0) {
        operator delete(*(void **)buf);
      }
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_10039F51C();
      }
      NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
      int v36 = v13;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  v14));

      return v15;
    }

    goto LABEL_46;
  }

  if (!self->_passthroughParams.dckTimeSyncBtEvent.__engaged_) {
    sub_10039F434();
  }
  if (!self->_passthroughParams.dckTimeSyncUwbDeviceTimeUsec.__engaged_) {
    sub_10039F45C();
  }
  if (!self->_passthroughParams.passthroughUwbTime0.__engaged_) {
    sub_10039F484();
  }
  unint64_t v16 = sub_100224968( (uint64_t)&self->_passthroughParams.dckTimeSyncBtEvent,  self->_passthroughParams.passthroughUwbTime0.__engaged_);
  if (!self->_passthroughParams.dckTimeSyncUwbDeviceTimeUsec.__engaged_) {
    sub_100006080();
  }
  if (!self->_passthroughParams.passthroughUwbTime0.__engaged_) {
    sub_100006080();
  }
  unint64_t val = self->_passthroughParams.dckTimeSyncUwbDeviceTimeUsec.var0.__val_;
  unint64_t v18 = self->_passthroughParams.passthroughUwbTime0.var0.__val_;
  if (v18 >= val)
  {
    unint64_t v29 = v16;
    uint64_t v30 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(void *)&uint8_t buf[4] = v29;
      __int16 v38 = 2048;
      unint64_t v39 = val;
      __int16 v40 = 2048;
      unint64_t v41 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "#ses-carkey,DCK time sync BT event = %lluus, DCK time sync UWB device time = %lluus, UWB Time 0 = %lluus",  buf,  0x20u);
    }

    uint64_t v31 = v18 - val + v29;
    if (self->_passthroughParams.anchorSimulation)
    {
      uint64_t v32 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = 20000LL;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "#ses-carkey,Anchor simulation start time leeway of %lluus",  buf,  0xCu);
      }

      v31 -= 20000LL;
    }

    int v11 = sub_100275568((uint64_t)self->_standaloneAlishaSession.__ptr_, v31);
    if (v11) {
      goto LABEL_22;
    }
LABEL_46:
    uint64_t v33 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "#ses-carkey,Range enable succeeded.",  buf,  2u);
    }

    return 0LL;
  }

  unsigned __int8 v19 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
    sub_10039F4AC(v19, v20, v21, v22, v23, v24, v25, v26);
  }
  NSErrorUserInfoKey v42 = NSLocalizedDescriptionKey;
  char v43 = @"UWB Time 0 must be greater than UWB Device Time from the DCK time sync event.";
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v43,  &v42,  1LL));
  int v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  v27));

  return v28;
}

- (id)_pausePassthroughOrLabTestModeSession
{
  int v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#ses-carkey,_pausePassthroughOrLabTestModeSession",  buf,  2u);
  }

  ptr = self->_standaloneAlishaSession.__ptr_;
  if (!ptr) {
    sub_10039F5CC();
  }
  sub_100275118((uint64_t)ptr, (uint64_t)buf);
  if (*(_DWORD *)buf)
  {
    sub_1002BEFAC(*(int *)buf, __p);
    if (v11 >= 0) {
      int v5 = __p;
    }
    else {
      int v5 = (void **)__p[0];
    }
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to stop Alisha standalone ranging session. Error: %s",  v5));
    if (v11 < 0) {
      operator delete(__p[0]);
    }
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10039EA18();
    }
    NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
    uint64_t v17 = v6;
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  v7));
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  if (v15 && v13)
  {
    uint64_t v14 = v13;
    operator delete(v13);
  }

  return v8;
}

- (id)_pauseOwnerSession
{
  int v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-carkey,pause owner session", buf, 2u);
  }

  ptr = self->_alishaManager.__ptr_;
  if (ptr)
  {
    sub_1002C4590((uint64_t)ptr, buf);
    if (*(_DWORD *)buf)
    {
      sub_1002BEFAC(*(int *)buf, __p);
      if (v12 >= 0) {
        int v5 = __p;
      }
      else {
        int v5 = (void **)__p[0];
      }
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to stop ranging when pausing NI CarKey owner session. Error: %s",  v5));
      if (v12 < 0) {
        operator delete(__p[0]);
      }
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_10039F384();
      }
      NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
      uint64_t v17 = v6;
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  v7));
    }

    else
    {
      if (v15) {
        -[NIServerCarKeySession _relayDCKMessageInternal:](self, "_relayDCKMessageInternal:", v14);
      }
      uint64_t v8 = 0LL;
    }

    if (v15)
    {
      if (v14[0])
      {
        v14[1] = v14[0];
        operator delete(v14[0]);
      }
    }

    return v8;
  }

  else
  {
    unint64_t v9 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "#ses-carkey,Pause but no Alisha manager. Returning.",  buf,  2u);
    }

    return 0LL;
  }

+ (JobConfig)_aopJobConfigWithTimeouts
{
  *(void *)&retstr->peerDiscoveryTimeoutSeconds = -1LL;
  retstr->timeoutRefirePeriodSeconds = -1;
  retstr->maxTimeoutRefires = 0;
  *(void *)(&retstr->maxTimeoutRefires + 1) = 0xFFFFFFFFLL;
  *(_WORD *)((char *)&retstr->subratingConfigs[0].var0.var0 + 3) = 0;
  retstr->optionsBitmap = 1;
  unsigned __int16 v4 = (unsigned __int16)sub_100224F0C(@"AlishaTimeoutAOverrideSeconds", (id)0x3C);
  unsigned __int16 v5 = (unsigned __int16)sub_100224F0C(@"AlishaTimeoutBOverrideSeconds", (id)0x96);
  unsigned __int16 v6 = (unsigned __int16)sub_100224F0C(@"AlishaTimeoutRefirePeriodOverrideSeconds", (id)0x96);
  shared_ptr<rose::objects::AlishaSession> result = (JobConfig *)sub_100224F0C(@"AlishaMaxTimeoutRefiresOverride", (id)2);
  retstr->peerDiscoveryTimeoutSeconds = v4;
  retstr->peerReacquisitionTimeoutSeconds = v4;
  retstr->trackingTimeoutSeconds = -1;
  retstr->jobTimeoutSeconds = v5;
  retstr->timeoutRefirePeriodSeconds = v6;
  retstr->maxTimeoutRefires = result;
  *(_WORD *)(&retstr->maxTimeoutRefires + 1) = -1;
  return result;
}

- (RequestConstructionDebugParams)_ownerDeviceServiceRequestDebugParams:(SEL)a3
{
  id v6 = a4;
  BOOL v7 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412290;
    id v23 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#ses-carkey,Debug params for owner device service request. Debug options: %@",  (uint8_t *)&v22,  0xCu);
  }

  if (self->_passthroughParams.isPassthroughSession)
  {
    uint64_t v20 = "!_passthroughParams.isPassthroughSession";
    int v21 = 1392;
    goto LABEL_12;
  }

  if (self->_passthroughParams.anchorSimulation)
  {
    uint64_t v20 = "!_passthroughParams.anchorSimulation";
    int v21 = 1393;
LABEL_12:
    __assert_rtn( "-[NIServerCarKeySession _ownerDeviceServiceRequestDebugParams:]",  "NIServerCarKeySession.mm",  v21,  v20);
  }

  retstr->var3.__engaged_ = 0;
  retstr->var4.var0.__null_state_ = 0;
  retstr->var4.__engaged_ = 0;
  retstr->var11 = 0;
  *(void *)&retstr->var5 = 0LL;
  retstr->var10 = 0;
  *(_DWORD *)&retstr->var0 = 0;
  retstr->var3.var0.__null_state_ = 0;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"DebugSTSIndex0"]);
  if (!v8
    || (unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"AnchorHopKey"]),
        BOOL v10 = v9 == 0LL,
        v9,
        v8,
        v10))
  {
    retstr->var2 = 0;
  }

  else
  {
    char v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"DebugSTSIndex0"]);
    unsigned int v12 = [v11 unsignedIntegerValue];

    NSErrorUserInfoKey v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"AnchorHopKey"]);
    unsigned int v14 = [v13 unsignedIntegerValue];

    retstr->var2 = 1;
    retstr->var3.__engaged_ = 1;
    retstr->var3.var0.__val_ = v12;
    retstr->var4.__engaged_ = 1;
    retstr->var4.var0.__val_ = v14;
  }

  char v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"DisableUWBEncryption"]);
  unsigned __int8 v16 = [v15 BOOLValue];

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"DisableSecureToF"]);
  unsigned __int8 v18 = [v17 BOOLValue];

  retstr->var9 = v16;
  retstr->var10 = v18;
  retstr->var11 = 5;

  return result;
}

- (void)_relayDCKMessageInternal:(const void *)a3
{
  unsigned __int16 v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  *(void *)a3,  *((void *)a3 + 1) - *(void *)a3));
  unsigned __int16 v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    char v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#ses-carkey,Relaying DCK message: %@",  buf,  0xCu);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NIServerCarKeySession;
  id v6 = -[NIServerBaseSession resourcesManager](&v9, "resourcesManager");
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 remote]);
  [v8 relayDCKMessage:v4];
}

- (Result<rose::RoseServiceRequest>)_passthroughSessionServiceRequest:(SEL)a3
{
  id v6 = a4;
  if (os_variant_allows_internal_security_policies([@"com.apple.nearbyd" UTF8String]))
  {
    BOOL v7 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      BOOL anchorSimulation = self->_passthroughParams.anchorSimulation;
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = anchorSimulation;
      *(_WORD *)&uint8_t buf[8] = 2112;
      *(void *)&buf[10] = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#ses-carkey,Passthrough session service request. Anchor: %d. Debug options: %@",  buf,  0x12u);
    }

    p_passthroughParams = &self->_passthroughParams;
    if (!self->_passthroughParams.isPassthroughSession) {
      __assert_rtn( "-[NIServerCarKeySession _passthroughSessionServiceRequest:]",  "NIServerCarKeySession.mm",  1438,  "_passthroughParams.isPassthroughSession");
    }
    __int128 v131 = 0u;
    __int128 v132 = 0u;
    __int128 v129 = 0u;
    __int128 v130 = 0u;
    id v9 = [&off_1007D2220 countByEnumeratingWithState:&v129 objects:v136 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v130;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v130 != v10) {
            objc_enumerationMutation(&off_1007D2220);
          }
          uint64_t v12 = *(void *)(*((void *)&v129 + 1) + 8LL * (void)i);
          unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v12]);
          if (!v14 || (uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSNumber, v13), (objc_opt_isKindOfClass(v14, v15) & 1) == 0))
          {
            uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Missing mandatory passthrough session key or not an NSNumber: {%@: %@}",  v12,  v14));
            if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
              sub_10039EA18();
            }
            retstr->var0 = -1014;
            retstr->var1.var0.__null_state_ = 0;
            retstr->var1.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;

            goto LABEL_34;
          }
        }

        id v9 = [&off_1007D2220 countByEnumeratingWithState:&v129 objects:v136 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    if (p_passthroughParams->anchorSimulation)
    {
      __int128 v127 = 0u;
      __int128 v128 = 0u;
      __int128 v125 = 0u;
      __int128 v126 = 0u;
      id v16 = [&off_1007D2238 countByEnumeratingWithState:&v125 objects:v135 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v126;
        while (2)
        {
          for (j = 0LL; j != v16; j = (char *)j + 1)
          {
            if (*(void *)v126 != v17) {
              objc_enumerationMutation(&off_1007D2238);
            }
            uint64_t v19 = *(void *)(*((void *)&v125 + 1) + 8LL * (void)j);
            int v21 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v19]);
            if (!v21
              || (uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSNumber, v20), (objc_opt_isKindOfClass(v21, v22) & 1) == 0))
            {
              char v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Missing mandatory anchor simulation key or not an NSNumber: {%@: %@}",  v19,  v21));
              if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
                sub_10039EA18();
              }
              retstr->var0 = -1015;
              retstr->var1.var0.__null_state_ = 0;
              retstr->var1.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;

              goto LABEL_34;
            }
          }

          id v16 = [&off_1007D2238 countByEnumeratingWithState:&v125 objects:v135 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
    }

    id v23 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"UWBSessionId"]);
    unsigned int v92 = [v23 unsignedIntegerValue];

    p_passthroughParams->passthroughUwbSessionId.var0.__val_ = v92;
    p_passthroughParams->passthroughUwbSessionId.__engaged_ = 1;
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"RFChannel"]);
    unsigned __int8 v91 = [v24 unsignedIntegerValue];

    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"SyncCodeIndex"]);
    id v26 = [v25 unsignedIntegerValue];

    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"AlishaProtocolVersion"]);
    unsigned __int16 v90 = (unsigned __int16)[v27 unsignedIntegerValue];

    int v28 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"UWBConfigId"]);
    unsigned __int16 v89 = (unsigned __int16)[v28 unsignedIntegerValue];

    unint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"SessionRANMultiplier"]);
    unsigned __int8 v88 = [v29 unsignedIntegerValue];

    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"ChapsPerSlot"]);
    unsigned __int8 v87 = [v30 unsignedIntegerValue];

    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"SlotsPerRound"]);
    unsigned __int8 v86 = [v31 unsignedIntegerValue];

    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"NumResponderNodes"]);
    unsigned __int8 v85 = [v32 unsignedIntegerValue];

    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"HopConfigBitmask"]);
    unsigned __int8 v84 = [v33 unsignedIntegerValue];

    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"PulseShapeCombo"]);
    unsigned __int8 v83 = [v34 unsignedIntegerValue];

    if (((_BYTE)v26 - 9) >= 4u)
    {
      unsigned __int8 v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid Sync Code Index: %lu",  v26));
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_10039EA18();
      }
      retstr->var0 = -1016;
      retstr->var1.var0.__null_state_ = 0;
      retstr->var1.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;
    }

    else
    {
      char v75 = (_BYTE)v26 - 9;
      NSErrorUserInfoKey v35 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"ACWGMacMode"]);

      int v36 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"ACWGMacMode"]);
      unsigned int v37 = [v36 unsignedIntValue];

      __int16 v38 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"ACWGMacMode"]);
      unsigned __int8 v74 = [v38 unsignedIntValue];

      unint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"ACWGFinalData2Bitmask"]);
      unsigned __int8 v40 = [v39 unsignedIntValue];
      BOOL v73 = (v37 & 0xFFFFFFC0) == 64;
      BOOL v82 = v35 != 0LL;

      if (v35) {
        int v41 = ((v40 & 3) << 16) | 0x1000000;
      }
      else {
        int v41 = 0;
      }
      NSErrorUserInfoKey v42 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"DebugSTSIndex0"]);
      int v72 = v41;
      unsigned int v81 = [v42 unsignedIntegerValue];

      char v43 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"AnchorHopKey"]);
      unsigned int v80 = [v43 unsignedIntegerValue];

      NSErrorUserInfoKey v44 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"DisableUWBEncryption"]);
      unsigned __int8 v79 = [v44 BOOLValue];

      uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"DisableSecureToF"]);
      unsigned __int8 v78 = [v45 BOOLValue];

      if (p_passthroughParams->anchorSimulation)
      {
        uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"AnchorResponderIndex"]);
        unsigned __int8 v77 = [v46 unsignedIntegerValue];

        __int16 v47 = 1;
      }

      else
      {
        unsigned __int8 v77 = 0;
        __int16 v47 = 0;
      }

      unsigned __int8 v52 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"ForceAntennaSelection"]);
      __int16 v76 = v47;
      unsigned int v53 = [v52 BOOLValue];

      if (v53)
      {
        __int128 v124 = 0u;
        __int128 v122 = 0u;
        __int128 v123 = 0u;
        __int128 v121 = 0u;
        id v54 = [&off_1007D2250 countByEnumeratingWithState:&v121 objects:v134 count:16];
        if (v54)
        {
          uint64_t v55 = *(void *)v122;
          while (2)
          {
            for (k = 0LL; k != v54; k = (char *)k + 1)
            {
              if (*(void *)v122 != v55) {
                objc_enumerationMutation(&off_1007D2250);
              }
              uint64_t v57 = *(void *)(*((void *)&v121 + 1) + 8LL * (void)k);
              uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v57]);
              if (!v59
                || (uint64_t v60 = objc_opt_class(&OBJC_CLASS___NSNumber, v58), (objc_opt_isKindOfClass(v59, v60) & 1) == 0))
              {
                uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Missing mandatory antenna mask key or not an NSNumber: {%@: %@}",  v57,  v59));
                if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
                  sub_10039EA18();
                }
                retstr->var0 = -1015;
                retstr->var1.var0.__null_state_ = 0;
                retstr->var1.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;

                goto LABEL_34;
              }
            }

            id v54 = [&off_1007D2250 countByEnumeratingWithState:&v121 objects:v134 count:16];
            if (v54) {
              continue;
            }
            break;
          }
        }

        uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"TxAntennaMask"]);
        unsigned __int8 v62 = [v61 unsignedIntValue];

        uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"RxAntennaMask"]);
        unsigned __int8 v64 = [v63 unsignedIntValue];

        uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"RxSyncSearchAntennaMask"]);
        unsigned __int8 v66 = [v65 unsignedIntValue];

        __int16 v67 = 1;
      }

      else
      {
        __int16 v67 = 0;
        unsigned __int8 v66 = 0;
        unsigned __int8 v64 = 0;
        unsigned __int8 v62 = 0;
      }

      BOOL v107 = p_passthroughParams->anchorSimulation;
      __int16 v108 = v77 | (unsigned __int16)(v76 << 8);
      char v109 = 1;
      unsigned int v110 = v81;
      char v111 = 1;
      unsigned int v112 = v80;
      char v113 = 1;
      char v114 = v53;
      __int16 v115 = v62 | ((v67 & 1) << 8);
      __int16 v116 = v64 | ((v67 & 1) << 8);
      __int16 v117 = v66 | (unsigned __int16)(v67 << 8);
      unsigned __int8 v118 = v79;
      unsigned __int8 v119 = v78;
      int v120 = 5;
      if (!p_passthroughParams->bypassBluetoothTimesync)
      {
        uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"UWBTime0"]);
        if (!v68) {
          __assert_rtn( "-[NIServerCarKeySession _passthroughSessionServiceRequest:]",  "NIServerCarKeySession.mm",  1574,  "debugOptions[@UWBTime0] != nil");
        }

        uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"UWBTime0"]);
        id v70 = [v69 unsignedLongLongValue];

        p_passthroughParams->passthroughUwbTime0.var0.__val_ = (unint64_t)v70;
        p_passthroughParams->passthroughUwbTime0.__engaged_ = 1;
      }

      unsigned int v95 = v92;
      unsigned __int8 v96 = v91;
      char v97 = v75;
      unsigned __int16 v98 = v90;
      unsigned __int16 v99 = v89;
      unsigned __int8 v100 = v88;
      unsigned __int8 v101 = v87;
      unsigned __int8 v102 = v86;
      unsigned __int8 v103 = v85;
      unsigned __int8 v104 = v84;
      unsigned __int8 v105 = v83;
      unsigned int v106 = (v82 && v73) & 0xFFFFC0FF | ((v74 & 0x3F) << 8) | v72;
      +[NIServerCarKeySession _aopJobConfigWithTimeouts]( &OBJC_CLASS___NIServerCarKeySession,  "_aopJobConfigWithTimeouts");
      sub_1001413F4((int *)&v95, 102, (uint64_t)v94, (unsigned __int8 *)&v107, (uint64_t)buf);
      memcpy(&retstr->var1, buf, 0x1F8uLL);
      retstr->var0 = 0;
      retstr->var1.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 1;
    }
  }

  else
  {
    retstr->var0 = -1000;
    retstr->var1.var0.__null_state_ = 0;
    retstr->var1.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;
  }

- (void)_alishaStateChangedFromState:(unsigned __int8)a3 toNewState:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  unsigned int v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  BOOL v7 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    sub_1002BF78C(v5, v21);
    int v8 = v22;
    id v9 = (void **)v21[0];
    sub_1002BF78C(v4, __p);
    uint64_t v10 = v21;
    if (v8 < 0) {
      uint64_t v10 = v9;
    }
    if (v20 >= 0) {
      char v11 = __p;
    }
    else {
      char v11 = (void **)__p[0];
    }
    containerUniqueIdentifier = self->_containerUniqueIdentifier;
    *(_DWORD *)buf = 136315650;
    uint64_t v24 = v10;
    __int16 v25 = 2080;
    id v26 = v11;
    __int16 v27 = 2112;
    int v28 = containerUniqueIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#ses-carkey,State changed from %s to %s, session container ID: %@",  buf,  0x20u);
    if (v20 < 0) {
      operator delete(__p[0]);
    }
    if (v22 < 0) {
      operator delete(v21[0]);
    }
  }

  ptr = self->_timeoutManager.__ptr_;
  if (ptr) {
    sub_1001AEB30((uint64_t)ptr, v5, v4);
  }
  int v14 = sub_1002C1B68(v5);
  if (((v14 ^ 1 | sub_1002C1B68(v4)) & 1) == 0)
  {
    v18.receiver = self;
    v18.super_class = (Class)&OBJC_CLASS___NIServerCarKeySession;
    uint64_t v15 = -[NIServerBaseSession resourcesManager](&v18, "resourcesManager");
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 remote]);
    [v17 didUpdateHealthStatus:4];
  }

- (void)_handleInitiatorRangingBlockUpdate:(InitiatorRangingBlockSummary *)a3
{
  ptr = self->_certLogger.__ptr_;
  if (ptr) {
    sub_10021D648((uint64_t)ptr, &a3->var0);
  }
}

- (void)_handleSessionStats:(SessionStats *)a3
{
  if (a3->var1)
  {
    ptr = self->_analyticsManager.__ptr_;
    if (ptr) {
      sub_10017CDB8((uint64_t)ptr, (uint64_t)a3);
    }
  }

- (void)_handleHealthChanged:(int)a3
{
  unsigned int v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000065CC(__p, (&off_1007B78D0)[a3]);
    if (v14 >= 0) {
      id v6 = __p;
    }
    else {
      id v6 = (void **)__p[0];
    }
    containerUniqueIdentifier = self->_containerUniqueIdentifier;
    *(_DWORD *)buf = 136315394;
    id v16 = v6;
    __int16 v17 = 2112;
    objc_super v18 = containerUniqueIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#ses-carkey,Health changed to %s, session container ID: %@",  buf,  0x16u);
    if (v14 < 0) {
      operator delete(__p[0]);
    }
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NIServerCarKeySession;
  int v8 = -[NIServerBaseSession resourcesManager](&v12, "resourcesManager");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = v9;
  switch(a3)
  {
    case 2:
      char v11 = (void *)objc_claimAutoreleasedReturnValue([v9 remote]);
      [v11 didUpdateHealthStatus:3];
      goto LABEL_13;
    case 1:
      char v11 = (void *)objc_claimAutoreleasedReturnValue([v9 remote]);
      [v11 didUpdateHealthStatus:2];
      goto LABEL_13;
    case 0:
      char v11 = (void *)objc_claimAutoreleasedReturnValue([v9 remote]);
      [v11 didUpdateHealthStatus:1];
LABEL_13:

      break;
  }
}

- (void)_handleTimeoutEvent:(int)a3 time:(double)a4
{
  BOOL v7 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000065CC(__p, (&off_1007B78E8)[a3]);
    int v8 = v21 >= 0 ? __p : (void **)__p[0];
    containerUniqueIdentifier = self->_containerUniqueIdentifier;
    *(_DWORD *)buf = 136315650;
    *(void *)__int16 v25 = v8;
    *(_WORD *)&v25[8] = 2048;
    *(double *)&v25[10] = a4;
    *(_WORD *)&v25[18] = 2112;
    id v26 = containerUniqueIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#ses-carkey,Received timeout event %s at %f sec, session container ID: %@",  buf,  0x20u);
    if (v21 < 0) {
      operator delete(__p[0]);
    }
  }

  ptr = self->_alishaManager.__ptr_;
  if (ptr)
  {
    sub_1002C4E44((uint64_t)ptr, a3, buf);
    int v11 = *(_DWORD *)buf;
    if (*(_DWORD *)buf)
    {
      NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
      id v23 = @"processing timeout events failed";
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
      else {
        uint64_t v13 = -5887LL;
      }
      char v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  v13,  v12));

      v19.receiver = self;
      v19.super_class = (Class)&OBJC_CLASS___NIServerCarKeySession;
      uint64_t v15 = -[NIServerBaseSession resourcesManager](&v19, "resourcesManager");
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 remote]);
      [v17 uwbSessionDidInvalidateWithError:v14];
    }

    else if (v27)
    {
      -[NIServerCarKeySession _relayDCKMessageInternal:](self, "_relayDCKMessageInternal:", &v25[4]);
    }

    if (v27)
    {
      if (*(void *)&v25[4])
      {
        *(void *)&v25[12] = *(void *)&v25[4];
        operator delete(*(void **)&v25[4]);
      }
    }
  }

  else
  {
    objc_super v18 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "#ses-carkey,No Alisha manager. Ignoring timeout event",  buf,  2u);
    }
  }

- (NICarKeyConfiguration)configuration
{
  return (NICarKeyConfiguration *)objc_getProperty(self, a2, 424LL, 1);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0LL;
  *((void *)self + 7) = 0LL;
  *((void *)self + 10) = 0LL;
  *((void *)self + 11) = 0LL;
  *((void *)self + 12) = 0LL;
  *((void *)self + 13) = 0LL;
  *((void *)self + 14) = 0LL;
  *((void *)self + 15) = 0LL;
  *((void *)self + 16) = 0LL;
  *((void *)self + 17) = 0LL;
  *((void *)self + 18) = 0LL;
  *((void *)self + 19) = 0LL;
  *((void *)self + 20) = 0LL;
  *((void *)self + 21) = 0LL;
  *((void *)self + 22) = 0LL;
  *((void *)self + 23) = 0LL;
  *((_BYTE *)self + 192) = 0;
  *((_BYTE *)self + 256) = 0;
  *((void *)self + 33) = 0LL;
  *((void *)self + 34) = 0LL;
  *((_WORD *)self + 140) = 0;
  *((_BYTE *)self + 282) = 0;
  *((_BYTE *)self + 288) = 0;
  *((_BYTE *)self + 344) = 0;
  *((_BYTE *)self + 352) = 0;
  *((_BYTE *)self + 360) = 0;
  *((_BYTE *)self + 368) = 0;
  *((_BYTE *)self + 372) = 0;
  *((_BYTE *)self + 376) = 0;
  *((_BYTE *)self + 384) = 0;
  *((void *)self + 49) = 0LL;
  *((void *)self + 50) = 0LL;
  *((void *)self + 51) = 0LL;
  *((void *)self + 52) = 0LL;
  return self;
}

@end