@interface NIServerSpatialBrowsingSession
- (NIServerSpatialBrowsingSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5;
- (NISpatialBrowsingConfiguration)configuration;
- (duration<long)nominalCycleRate;
- (id).cxx_construct;
- (id)configure;
- (id)lastConfiguration;
- (id)pauseWithSource:(int64_t)a3;
- (id)run;
- (unint64_t)requiresUWBToRun;
- (void)invalidate;
@end

@implementation NIServerSpatialBrowsingSession

- (NIServerSpatialBrowsingSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v12 = objc_opt_class(v10, v11);
  if (v12 != objc_opt_class(&OBJC_CLASS___NISpatialBrowsingConfiguration, v13))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v29 handleFailureInMethod:a2 object:self file:@"NIServerSpatialBrowsingSession.mm" lineNumber:33 description:@"NIServerSpatialBrowsingSession given invalid configuration."];
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v9 serverSessionIdentifier]);

  if (!v14)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v30 handleFailureInMethod:a2, self, @"NIServerSpatialBrowsingSession.mm", 34, @"Invalid parameter not satisfying: %@", @"resourcesManager.serverSessionIdentifier" object file lineNumber description];
  }

  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___NIServerSpatialBrowsingSession;
  v15 = -[NIServerBaseSession initWithResourcesManager:configuration:error:]( &v32,  "initWithResourcesManager:configuration:error:",  v9,  v10,  a5);
  v16 = v15;
  if (v15)
  {
    v17 = (NISpatialBrowsingConfiguration *)[v10 copy];
    configuration = v15->_configuration;
    v15->_configuration = v17;

    if (v9) {
      [v9 protobufLogger];
    }
    else {
      __int128 v31 = 0uLL;
    }
    sub_10000EE54((uint64_t)&v15->_pbLogger, &v31);
    v19 = (std::__shared_weak_count *)*((void *)&v31 + 1);
    if (*((void *)&v31 + 1))
    {
      v20 = (unint64_t *)(*((void *)&v31 + 1) + 8LL);
      do
        unint64_t v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }

    uint64_t v22 = objc_claimAutoreleasedReturnValue([v9 clientConnectionQueue]);
    clientQueue = v16->_clientQueue;
    v16->_clientQueue = (OS_dispatch_queue *)v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue([v9 serverSessionIdentifier]);
    uint64_t v25 = objc_claimAutoreleasedReturnValue([v24 UUIDString]);
    containerUniqueIdentifier = v16->_containerUniqueIdentifier;
    v16->_containerUniqueIdentifier = (NSString *)v25;

    v27 = v16;
  }

  return v16;
}

- (duration<long)nominalCycleRate
{
  return (duration<long long, std::ratio<1, 1000>>)2000LL;
}

- (id)lastConfiguration
{
  return self->_configuration;
}

- (unint64_t)requiresUWBToRun
{
  return 2LL;
}

- (id)configure
{
  if (!self->_configuration) {
    sub_1003A3F3C();
  }
  v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    configuration = self->_configuration;
    int v6 = 138412290;
    v7 = configuration;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#ses-sptbrows,Configure. Configuration given: %@",  (uint8_t *)&v6,  0xCu);
  }

  return 0LL;
}

- (id)run
{
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___NIServerSpatialBrowsingSession;
  v3 = -[NIServerBaseSession resourcesManager](&v26, "resourcesManager");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v22 recentlyObservedObjectsCache]);
  if (v4)
  {
    -[NISpatialBrowsingConfiguration maxNearbyObjectAge](self->_configuration, "maxNearbyObjectAge");
    uint64_t v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getMostRecentObjectsWithMaxAge:"));
    for (unint64_t i = 0; (unint64_t)[v7 count] > i; ++i)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", (i + 1)));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:i]);
      [v10 overrideSpatialScore:v9];

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:i]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 bluetoothAdvertisingAddress]);
      id v13 = sub_1001CDD1C(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:i]);
        [v15 setDeviceIdentifier:v14];
      }
    }

    v16 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v28 = v6;
      __int16 v29 = 2112;
      v30 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "#ses-sptbrows,Returning most recent objects (max age: %0.2f sec): %@",  buf,  0x16u);
    }

    clientQueue = (dispatch_queue_s *)self->_clientQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002793A4;
    block[3] = &unk_1007A2248;
    id v24 = v22;
    id v25 = v7;
    id v18 = v7;
    dispatch_async(clientQueue, block);

    v19 = 0LL;
  }

  else
  {
    v20 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003A3F64(v20);
    }
    NSErrorUserInfoKey v31 = NSLocalizedFailureReasonErrorKey;
    objc_super v32 = @"Internal observation not enabled.";
    id v18 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  v18));
  }

  return v19;
}

- (id)pauseWithSource:(int64_t)a3
{
  return 0LL;
}

- (void)invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NIServerSpatialBrowsingSession;
  -[NIServerBaseSession invalidate](&v3, "invalidate");
}

- (NISpatialBrowsingConfiguration)configuration
{
  return (NISpatialBrowsingConfiguration *)objc_getProperty(self, a2, 80LL, 1);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0LL;
  *((void *)self + 7) = 0LL;
  return self;
}

@end