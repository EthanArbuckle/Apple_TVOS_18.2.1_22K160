@interface _FindableDeviceAlgorithmsContainer
+ (id)configurationForContainerObjects;
- (NINearbyUpdatesEngine)updatesEngine;
- (NIServerAnalyticsManager)analyticsManager;
- (_FindableDeviceAlgorithmsContainer)initWithToken:(id)a3 queue:(id)a4 delegate:(id)a5;
- (basic_string<char,)uniqueIdentifierForEngine:(std::allocator<char>> *__return_ptr)retstr;
- (id)discoveryTokenFromIdentifier:(unint64_t)a3;
- (id)objectFromIdentifier:(unint64_t)a3;
- (optional<unsigned)identifierFromDiscoveryToken:(id)a3;
- (unint64_t)currentSolutionMacAddress;
- (void)invalidate;
- (void)setCurrentSolutionMacAddress:(unint64_t)a3;
@end

@implementation _FindableDeviceAlgorithmsContainer

- (_FindableDeviceAlgorithmsContainer)initWithToken:(id)a3 queue:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS____FindableDeviceAlgorithmsContainer;
  v12 = -[_FindableDeviceAlgorithmsContainer init](&v36, "init");
  if (v12)
  {
    v13 = objc_opt_new(&OBJC_CLASS___NSUUID);
    containerIdentifier = v12->_containerIdentifier;
    v12->_containerIdentifier = v13;

    objc_storeStrong((id *)&v12->_token, a3);
    v15 = -[NIServerAnalyticsManager initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS___NIServerAnalyticsManager),  "initWithBundleIdentifier:",  @"nearbyd");
    analyticsManager = v12->_analyticsManager;
    v12->_analyticsManager = v15;

    v12->_currentSolutionMacAddress = 0LL;
    v17 = objc_alloc(&OBJC_CLASS___NINearbyUpdatesEngine);
    id v19 = objc_msgSend((id)objc_opt_class(v12, v18), "configurationForContainerObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = v12->_analyticsManager;
    v22 = sub_100288340();
    v23 = (std::__shared_weak_count *)v22[21];
    uint64_t v34 = v22[20];
    v35 = v23;
    if (v23)
    {
      p_shared_owners = (unint64_t *)&v23->__shared_owners_;
      do
        unint64_t v25 = __ldxr(p_shared_owners);
      while (__stxr(v25 + 1, p_shared_owners));
    }

    id v33 = 0LL;
    v26 = -[NINearbyUpdatesEngine initWithConfiguration:queue:delegate:dataSource:analyticsManager:protobufLogger:error:]( v17,  "initWithConfiguration:queue:delegate:dataSource:analyticsManager:protobufLogger:error:",  v20,  v10,  v11,  v12,  v21,  &v34,  &v33);
    id v27 = v33;
    updatesEngine = v12->_updatesEngine;
    v12->_updatesEngine = v26;

    v29 = v35;
    if (v35)
    {
      v30 = (unint64_t *)&v35->__shared_owners_;
      do
        unint64_t v31 = __ldaxr(v30);
      while (__stlxr(v31 - 1, v30));
      if (!v31)
      {
        ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
        std::__shared_weak_count::__release_weak(v29);
      }
    }

    if (v27 && os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_100395F64();
    }
  }

  return v12;
}

- (void)invalidate
{
}

+ (id)configurationForContainerObjects
{
  if (qword_1007F91E8 != -1) {
    dispatch_once(&qword_1007F91E8, &stru_1007B3F20);
  }
  return (id)qword_1007F91E0;
}

- (id)discoveryTokenFromIdentifier:(unint64_t)a3
{
  return self->_token;
}

- (optional<unsigned)identifierFromDiscoveryToken:(id)a3
{
  unint64_t currentSolutionMacAddress = self->_currentSolutionMacAddress;
  BOOL v4 = 1LL;
  result.__engaged_ = v4;
  result.var0 = ($BEC950A715106DE229A2E4BA1089E24D)currentSolutionMacAddress;
  return result;
}

- (id)objectFromIdentifier:(unint64_t)a3
{
  return -[NINearbyObject initWithToken:](objc_alloc(&OBJC_CLASS___NINearbyObject), "initWithToken:", self->_token);
}

- (basic_string<char,)uniqueIdentifierForEngine:(std::allocator<char>> *__return_ptr)retstr
{
  id v4 = objc_claimAutoreleasedReturnValue([*(id *)(v1 + 16) UUIDString]);
  sub_1000065CC(retstr, (char *)[v4 UTF8String]);

  return result;
}

- (NINearbyUpdatesEngine)updatesEngine
{
  return (NINearbyUpdatesEngine *)objc_getProperty(self, a2, 24LL, 1);
}

- (NIServerAnalyticsManager)analyticsManager
{
  return (NIServerAnalyticsManager *)objc_getProperty(self, a2, 32LL, 1);
}

- (unint64_t)currentSolutionMacAddress
{
  return self->_currentSolutionMacAddress;
}

- (void)setCurrentSolutionMacAddress:(unint64_t)a3
{
  self->_unint64_t currentSolutionMacAddress = a3;
}

- (void).cxx_destruct
{
}

@end