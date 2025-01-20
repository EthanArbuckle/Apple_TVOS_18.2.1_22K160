@interface NIServerSystemConfiguratorSession
- (BOOL)updateConfiguration:(id)a3;
- (NIServerSystemConfiguratorSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5;
- (duration<long)nominalCycleRate;
- (id)_processSystemEvent:(id)a3;
- (id)configure;
- (id)lastConfiguration;
- (id)pauseWithSource:(int64_t)a3;
- (id)run;
- (void)dealloc;
- (void)didUpdateResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationType:(Class)a4;
- (void)didUpdateSystemState:(id)a3;
- (void)invalidate;
@end

@implementation NIServerSystemConfiguratorSession

- (NIServerSystemConfiguratorSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v12 = objc_opt_class(v10, v11);
  if (v12 != objc_opt_class(&OBJC_CLASS___NISystemConfiguration, v13))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v25 handleFailureInMethod:a2 object:self file:@"NIServerSystemConfiguratorSession.mm" lineNumber:33 description:@"Invalid configuration type."];
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v9 serverSessionIdentifier]);

  if (!v14)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v26 handleFailureInMethod:a2, self, @"NIServerSystemConfiguratorSession.mm", 34, @"Invalid parameter not satisfying: %@", @"resourcesManager.serverSessionIdentifier" object file lineNumber description];
  }

  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___NIServerSystemConfiguratorSession;
  v15 = -[NIServerBaseSession initWithResourcesManager:configuration:error:]( &v27,  "initWithResourcesManager:configuration:error:",  v9,  v10,  a5);
  if (v15)
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v9 clientConnectionQueue]);
    clientQueue = v15->_clientQueue;
    v15->_clientQueue = (OS_dispatch_queue *)v16;

    v18 = (NISystemConfiguration *)[v10 copy];
    configuration = v15->_configuration;
    v15->_configuration = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 UUIDString]);
    uint64_t v22 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"ses-system-%@", v21));
    configuratorClientIdentifier = v15->_configuratorClientIdentifier;
    v15->_configuratorClientIdentifier = (NSString *)v22;
  }

  return v15;
}

- (id)configure
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NIServerSystemConfiguratorSession;
  v2 = -[NIServerBaseSession resourcesManager](&v8, "resourcesManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if ([v3 entitlementGranted:0])
  {
    v4 = 0LL;
  }

  else
  {
    v5 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_100395B60(v5);
    }
    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    id v10 = @"Not authorized.";
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  v6));
  }

  return v4;
}

- (id)run
{
  v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    configuration = self->_configuration;
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = configuration;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#ses-system,Run with configuration: %@",  buf,  0xCu);
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NIServerSystemConfiguratorSession;
  v5 = -[NIServerBaseSession resourcesManager](&v11, "resourcesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 lifecycleSupervisor]);
  [v7 setTimeoutOnPeerInactivity:0];

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerSystemConfigurator sharedInstance]( &OBJC_CLASS___NIServerSystemConfigurator,  "sharedInstance"));
  [v8 addClient:self identifier:self->_configuratorClientIdentifier];

  NSErrorUserInfoKey v9 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerSystemConfigurator sharedInstance]( &OBJC_CLASS___NIServerSystemConfigurator,  "sharedInstance"));
  objc_msgSend( v9,  "clientWithIdentifier:requestedPrewarmUWB:prewarmSecureElementChannel:",  self->_configuratorClientIdentifier,  -[NISystemConfiguration prewarmUWB](self->_configuration, "prewarmUWB"),  -[NISystemConfiguration prewarmSecureElementChannel](self->_configuration, "prewarmSecureElementChannel"));

  return 0LL;
}

- (id)pauseWithSource:(int64_t)a3
{
  v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-system,Pause (no-op)", v5, 2u);
  }

  return 0LL;
}

- (BOOL)updateConfiguration:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    configuration = self->_configuration;
    int v10 = 138412546;
    id v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = configuration;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#ses-system,Update to configuration: %@. Previous: %@",  (uint8_t *)&v10,  0x16u);
  }

  v7 = (NISystemConfiguration *)[v4 copy];
  objc_super v8 = self->_configuration;
  self->_configuration = v7;

  return 1;
}

- (id)_processSystemEvent:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (!v4) {
    __assert_rtn( "-[NIServerSystemConfiguratorSession _processSystemEvent:]",  "NIServerSystemConfiguratorSession.mm",  91,  "event");
  }
  v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    id v22 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#ses-system,Process system event: %@",  (uint8_t *)&v21,  0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SystemEventDictKey_EventType"]);
  id v7 = [v6 integerValue];

  else {
    id v8 = v7;
  }
  if (v8 == (id)1)
  {
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SystemEventDictKey_PassiveAccessIntentOptions"]);
    if (v12)
    {
      uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSNumber, v15);
      char isKindOfClass = objc_opt_isKindOfClass(v12, v16);
    }

    else
    {
      char isKindOfClass = 0;
    }

    id v18 = [v12 unsignedIntegerValue];
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_18;
    }
    id v19 = v18;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerSystemConfigurator sharedInstance]( &OBJC_CLASS___NIServerSystemConfigurator,  "sharedInstance"));
    [v14 clientWithIdentifier:self->_configuratorClientIdentifier notifiedPassiveAccessIntent:v19];
    goto LABEL_17;
  }

  if (v8 == (id)2)
  {
    NSErrorUserInfoKey v9 = (NSString *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SystemEventDictKey_ConfigurationType"]);
    Class v10 = NSClassFromString(v9);

    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue( [v4 objectForKeyedSubscript:@"SystemEventDictKey_ResourceUsageLimitExceededValue"]);
    if (!v12) {
      goto LABEL_18;
    }
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerSystemConfigurator sharedInstance]( &OBJC_CLASS___NIServerSystemConfigurator,  "sharedInstance"));
    objc_msgSend( v14,  "clientWithIdentifier:notifiedResourceUsageLimitExceeded:forSessionConfigurationType:",  self->_configuratorClientIdentifier,  objc_msgSend(v12, "BOOLValue"),  v10);
LABEL_17:

LABEL_18:
  }

  return 0LL;
}

- (void)invalidate
{
  v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-system,Invalidate", buf, 2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerSystemConfigurator sharedInstance]( &OBJC_CLASS___NIServerSystemConfigurator,  "sharedInstance"));
  [v4 removeClientWithIdentifier:self->_configuratorClientIdentifier];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NIServerSystemConfiguratorSession;
  -[NIServerBaseSession invalidate](&v5, "invalidate");
}

- (void)dealloc
{
  v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-system,Dealloc", buf, 2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerSystemConfigurator sharedInstance]( &OBJC_CLASS___NIServerSystemConfigurator,  "sharedInstance"));
  [v4 removeClientWithIdentifier:self->_configuratorClientIdentifier];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NIServerSystemConfiguratorSession;
  -[NIServerSystemConfiguratorSession dealloc](&v5, "dealloc");
}

- (id)lastConfiguration
{
  return self->_configuration;
}

- (duration<long)nominalCycleRate
{
  return (duration<long long, std::ratio<1, 1000>>)100LL;
}

- (void)didUpdateSystemState:(id)a3
{
  id v4 = a3;
  clientQueue = (dispatch_queue_s *)self->_clientQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100193AA0;
  v7[3] = &unk_1007A2248;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clientQueue, v7);
}

- (void)didUpdateResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationType:(Class)a4
{
  clientQueue = (dispatch_queue_s *)self->_clientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100193B90;
  block[3] = &unk_1007B37F0;
  BOOL v6 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async(clientQueue, block);
}

- (void).cxx_destruct
{
}

@end