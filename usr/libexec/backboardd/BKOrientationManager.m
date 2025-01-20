@interface BKOrientationManager
- (BKOrientationManager)init;
- (id)_initWithDeviceOrientationManager:(id)a3;
- (void)dealloc;
- (void)matcher:(id)a3 servicesDidMatch:(id)a4;
- (void)serviceDidDisappear:(id)a3;
@end

@implementation BKOrientationManager

- (BKOrientationManager)init
{
  v3 = objc_alloc_init(&OBJC_CLASS___CMDeviceOrientationManager);
  v4 = -[BKOrientationManager _initWithDeviceOrientationManager:](self, "_initWithDeviceOrientationManager:", v3);

  return v4;
}

- (id)_initWithDeviceOrientationManager:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___BKOrientationManager;
  v6 = -[BKOrientationManager init](&v25, "init");
  if (v6)
  {
    uint64_t v7 = BSDispatchQueueCreateWithFixedPriority("com.apple.backboardd.orientationManager", 0LL, 53LL);
    v8 = (void *)*((void *)v6 + 1);
    *((void *)v6 + 1) = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    v10 = (void *)*((void *)v6 + 14);
    *((void *)v6 + 14) = v9;

    [*((id *)v6 + 14) setUnderlyingQueue:*((void *)v6 + 1)];
    uint64_t Serial = BSDispatchQueueCreateSerial(@"com.apple.backboardd.orientationManager.observerCallout");
    v12 = (void *)*((void *)v6 + 2);
    *((void *)v6 + 2) = Serial;

    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[BSCompoundAssertion assertionWithIdentifier:]( &OBJC_CLASS___BSCompoundAssertion,  "assertionWithIdentifier:",  @"BKOrientationManagerObservers"));
    v14 = (void *)*((void *)v6 + 3);
    *((void *)v6 + 3) = v13;

    *((void *)v6 + 9) = -1LL;
    *((void *)v6 + 10) = -1LL;
    *((void *)v6 + 11) = -1LL;
    *((void *)v6 + 12) = 0LL;
    *(_OWORD *)(v6 + 56) = xmmword_10008C420;
    *((void *)v6 + 5) = 0xBFF0000000000000LL;
    *((_DWORD *)v6 + 12) = -1082130432;
    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v16 = (void *)*((void *)v6 + 4);
    *((void *)v6 + 4) = v15;

    uint64_t v17 = BSDispatchQueueCreateWithQualityOfService("com.apple.backboardd.orientationManagerNotify", 0LL, 25LL, 0LL);
    v18 = (void *)*((void *)v6 + 18);
    *((void *)v6 + 18) = v17;

    sub_1000652FC((uint64_t)v6, 0.0);
    sub_100065454((uint64_t)v6, 0.0);
    objc_storeStrong((id *)v6 + 15, a3);
    sub_100065610(v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](&OBJC_CLASS___BKSDefaults, "localDefaults"));
    v6[104] = [v19 ignoreAccelerometerAndOrientationEvents];

    v20 = objc_alloc(&OBJC_CLASS___BKIOHIDServiceMatcher);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[BKHIDSystemInterface sharedInstance](&OBJC_CLASS___BKHIDSystemInterface, "sharedInstance"));
    v22 = -[BKIOHIDServiceMatcher initWithUsagePage:usage:builtIn:dataProvider:]( v20,  "initWithUsagePage:usage:builtIn:dataProvider:",  65280LL,  3LL,  1LL,  v21);
    v23 = (void *)*((void *)v6 + 17);
    *((void *)v6 + 17) = v22;

    [*((id *)v6 + 17) startObserving:v6 queue:*((void *)v6 + 1)];
  }

  return v6;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  -[BKIOHIDServiceMatcher invalidate](self->_queue_HIDServiceMatcher, "invalidate");
  -[BSCompoundAssertion invalidate](self->_observers, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___BKOrientationManager;
  -[BKOrientationManager dealloc](&v4, "dealloc");
}

- (void)matcher:(id)a3 servicesDidMatch:(id)a4
{
  id v10 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  uint64_t v7 = (BKIOHIDServiceMatcher *)a3;
  dispatch_assert_queue_V2(queue);
  queue_HIDServiceMatcher = self->_queue_HIDServiceMatcher;

  if (queue_HIDServiceMatcher == v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
    objc_storeStrong((id *)&self->_queue_HIDService, v9);
  }
}

- (void)serviceDidDisappear:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  queue_HIDService = self->_queue_HIDService;
  p_queue_HIDService = &self->_queue_HIDService;
  LODWORD(queue) = [v5 isEqual:queue_HIDService];

  if ((_DWORD)queue) {
    objc_storeStrong((id *)p_queue_HIDService, 0LL);
  }
}

- (void).cxx_destruct
{
}

@end