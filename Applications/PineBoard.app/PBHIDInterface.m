@interface PBHIDInterface
+ (BOOL)isCECButtonEvent:(__IOHIDEvent *)a3;
+ (BOOL)isMultiButtonMFIGamePadEvent:(__IOHIDEvent *)a3;
+ (BOOL)isRemoteAppEvent:(__IOHIDEvent *)a3;
+ (PBDependencyDescription)dependencyDescription;
+ (id)sharedInstance;
- (BSInvalidatable)stateCaptureHandle;
- (BSInvalidatable)systemGestureManagerObservationToken;
- (NSArray)eventProcessors;
- (NSCountedSet)activeDynamicPressTypes;
- (PBEventFilterController)eventFilterController;
- (PBHIDEventDeliveryManager)HIDEventDeliveryManager;
- (PBHIDEventSystemClient)eventSystemClient;
- (id)_init;
- (id)senderForEvent:(__IOHIDEvent *)a3;
- (id)stateDumpBuilder;
- (int64_t)mode;
- (os_unfair_lock_s)lock;
- (void)_addCount:(int64_t)a3 forPressType:(int64_t)a4;
- (void)addEventProcessor:(id)a3;
- (void)dealloc;
- (void)dispatchEvent:(__IOHIDEvent *)a3;
- (void)eventSystemClient:(id)a3 didReceiveEvent:(__IOHIDEvent *)a4;
- (void)eventSystemClient:(id)a3 didRegisterSender:(id)a4;
- (void)eventSystemClient:(id)a3 didUnregisterSender:(id)a4;
- (void)setMode:(int64_t)a3;
- (void)systemGestureManager:(id)a3 didDisableGestureRecognizerWithAllowedPressTypes:(id)a4;
- (void)systemGestureManager:(id)a3 didEnableGestureRecognizerWithAllowedPressTypes:(id)a4;
@end

@implementation PBHIDInterface

+ (PBDependencyDescription)dependencyDescription
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10009C890;
  v5[3] = &unk_1003CFF78;
  v5[4] = a1;
  v2 = -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v5);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___PBSystemGestureManager);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  -[PBDependencyDescription addDependencies:](v2, "addDependencies:", v3);

  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009C928;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100470868 != -1) {
    dispatch_once(&qword_100470868, block);
  }
  return (id)qword_100470860;
}

- (id)_init
{
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___PBHIDInterface;
  v2 = -[PBHIDInterface init](&v30, "init");
  if (v2)
  {
    v3 = objc_alloc(&OBJC_CLASS___PBHIDEventDeliveryManager);
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[BKSHIDEventDeliveryManager sharedInstance]( &OBJC_CLASS___BKSHIDEventDeliveryManager,  "sharedInstance"));
    v5 = -[PBHIDEventDeliveryManager initWithBKSHIDEventDeliveryManager:](v3, "initWithBKSHIDEventDeliveryManager:", v4);
    HIDEventDeliveryManager = v2->_HIDEventDeliveryManager;
    v2->_HIDEventDeliveryManager = v5;

    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    lock_eventProcessors = v2->_lock_eventProcessors;
    v2->_lock_eventProcessors = (NSArray *)v7;

    v9 = -[PBHIDEventSystemClient initWithDelegate:]( objc_alloc(&OBJC_CLASS___PBHIDEventSystemClient),  "initWithDelegate:",  v2);
    eventSystemClient = v2->_eventSystemClient;
    v2->_eventSystemClient = v9;

    if (v2->_eventSystemClient)
    {
      v11 = -[PBHIDEventAnalyticsProcessor initWithSenderLibrary:]( objc_alloc(&OBJC_CLASS___PBHIDEventAnalyticsProcessor),  "initWithSenderLibrary:",  v2->_eventSystemClient);
      -[PBHIDInterface addEventProcessor:](v2, "addEventProcessor:", v11);
    }

    else
    {
      id v12 = sub_1000F6F4C();
      v11 = (PBHIDEventAnalyticsProcessor *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
        sub_100279C3C((os_log_t)v11);
      }
    }

    v13 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
    activeDynamicPressTypes = v2->_activeDynamicPressTypes;
    v2->_activeDynamicPressTypes = v13;

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_10009CC04;
    v28[3] = &unk_1003D0FA8;
    v15 = v2;
    v29 = v15;
    +[PBDependencyCoordinator registerInstance:dependencyBlock:]( &OBJC_CLASS___PBDependencyCoordinator,  "registerInstance:dependencyBlock:",  v15,  v28);
    objc_initWeak(&location, v15);
    v16 = (objc_class *)objc_opt_class(v15);
    v17 = NSStringFromClass(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@(%p)",  v18,  v15));

    v20 = &_dispatch_main_q;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10009CCE4;
    v25[3] = &unk_1003D3F18;
    objc_copyWeak(&v26, &location);
    uint64_t v21 = BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle(&_dispatch_main_q, v19, v25);
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
    stateCaptureHandle = v15->_stateCaptureHandle;
    v15->_stateCaptureHandle = (BSInvalidatable *)v22;

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBHIDInterface;
  -[PBHIDInterface dealloc](&v3, "dealloc");
}

- (int64_t)mode
{
  int64_t result = -[PBHIDEventDeliveryManager mode](self->_HIDEventDeliveryManager, "mode");
  if (result != 2) {
    return result == 1;
  }
  return result;
}

- (void)setMode:(int64_t)a3
{
  v5 = _os_activity_create( (void *)&_mh_execute_header,  "events/hidInterface/updateMode",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &v13);

  unint64_t v6 = -[PBHIDInterface mode](self, "mode");
  id v7 = sub_10009C954(self);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = sub_10009CF4C(a3);
    id v10 = (id)objc_claimAutoreleasedReturnValue(v9);
    id v11 = sub_10009CF4C(v6);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 138543618;
    id v15 = v10;
    __int16 v16 = 2114;
    v17 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Setting mode to %{public}@ {previousMode=%{public}@}",  buf,  0x16u);
  }

  if (a3 != 2) {
    a3 = a3 == 1;
  }
  -[PBHIDEventDeliveryManager setMode:](self->_HIDEventDeliveryManager, "setMode:", a3);
  -[PBEventFilterController setMode:](self->_eventFilterController, "setMode:", a3);
  os_activity_scope_leave(&v13);
}

- (void)addEventProcessor:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  unint64_t v6 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObject:](self->_lock_eventProcessors, "arrayByAddingObject:", v5));

  lock_eventProcessors = self->_lock_eventProcessors;
  self->_lock_eventProcessors = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)dispatchEvent:(__IOHIDEvent *)a3
{
}

- (id)senderForEvent:(__IOHIDEvent *)a3
{
  return (id)objc_claimAutoreleasedReturnValue( -[PBHIDEventSystemClient senderForEvent:]( self->_eventSystemClient,  "senderForEvent:",  a3));
}

- (void)eventSystemClient:(id)a3 didRegisterSender:(id)a4
{
  id v5 = a4;
  id v6 = sub_10009C954(self);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Registered sender {sender=%{public}@}",  (uint8_t *)&v8,  0xCu);
  }
}

- (void)eventSystemClient:(id)a3 didUnregisterSender:(id)a4
{
  id v5 = a4;
  id v6 = sub_10009C954(self);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Unregistered sender {sender=%{public}@}",  (uint8_t *)&v8,  0xCu);
  }
}

- (void)eventSystemClient:(id)a3 didReceiveEvent:(__IOHIDEvent *)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v7 = self->_lock_eventProcessors;
  os_unfair_lock_unlock(p_lock);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  int v8 = v7;
  id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v12), "processEvent:", a4, (void)v13);
        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v10);
  }
}

- (void)systemGestureManager:(id)a3 didEnableGestureRecognizerWithAllowedPressTypes:(id)a4
{
  id v5 = a4;
  if ([v5 containsObject:&off_1003FDA10])
  {
    id v6 = -[NSCountedSet initWithArray:](objc_alloc(&OBJC_CLASS___NSCountedSet), "initWithArray:", v5);
    -[PBHIDInterface _addCount:forPressType:]( self,  "_addCount:forPressType:",  -[NSCountedSet countForObject:](v6, "countForObject:", &off_1003FDA10),  6LL);
  }
}

- (void)systemGestureManager:(id)a3 didDisableGestureRecognizerWithAllowedPressTypes:(id)a4
{
  id v5 = a4;
  if ([v5 containsObject:&off_1003FDA10])
  {
    id v6 = -[NSCountedSet initWithArray:](objc_alloc(&OBJC_CLASS___NSCountedSet), "initWithArray:", v5);
    -[PBHIDInterface _addCount:forPressType:]( self,  "_addCount:forPressType:",  -(uint64_t)-[NSCountedSet countForObject:](v6, "countForObject:", &off_1003FDA10),  6LL);
  }
}

- (id)stateDumpBuilder
{
  id v3 = objc_alloc_init(&OBJC_CLASS___TVSStateDumpBuilder);
  id v4 = [v3 appendPointer:self->_HIDEventDeliveryManager withKey:@"HIDEventDeliveryManager"];
  id v5 = [v3 appendPointer:self->_eventFilterController withKey:@"eventFilterController"];
  id v6 = [v3 appendObject:self->_eventSystemClient withKey:@"eventSystemClient"];
  id v7 = [v3 appendObject:self->_activeDynamicPressTypes withKey:@"activeDynamicPressTypes"];
  activeDynamicPressTypes = self->_activeDynamicPressTypes;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10009D4A4;
  v11[3] = &unk_1003D48D0;
  v11[4] = self;
  id v9 =  [v3 appendCollection:activeDynamicPressTypes withKey:@"activeDynamicPressTypes" skipIfEmpty:0 objectTransformer:v11];
  return v3;
}

- (void)_addCount:(int64_t)a3 forPressType:(int64_t)a4
{
  int v8 = self;
  id v9 = self->_activeDynamicPressTypes;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  if (a3 < 0)
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_10009D7B4;
    v33[3] = &unk_1003CFEB8;
    id v5 = (id *)&v34;
    v34 = v9;
    v28 = &v35;
    id v35 = v10;
    uint64_t v11 = objc_retainBlock(v33);
  }

  else
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_10009D7D0;
    v30[3] = &unk_1003CFEB8;
    id v4 = (id *)&v31;
    v31 = v9;
    v29 = &v32;
    id v32 = v10;
    uint64_t v11 = objc_retainBlock(v30);
    if (!a3) {
      goto LABEL_9;
    }
  }

  if (a3 >= 0) {
    int64_t v12 = a3;
  }
  else {
    int64_t v12 = -a3;
  }
  do
  {
    ((void (*)(void *))v11[2])(v11);
    --v12;
  }

  while (v12);
LABEL_9:
  if (-[NSCountedSet countForObject:](v9, "countForObject:", v10)) {
    uint64_t v13 = 1LL;
  }
  else {
    uint64_t v13 = 2LL;
  }
  id v14 = sub_10009C954(v8);
  __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    __int128 v16 = sub_100085754(v13);
    v27 = v5;
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v18 = sub_100166350(a4);
    id v26 = v8;
    v19 = v4;
    v20 = v10;
    uint64_t v21 = v9;
    int64_t v22 = a4;
    v23 = (void *)objc_claimAutoreleasedReturnValue(v18);
    *(_DWORD *)buf = 138543618;
    v37 = v17;
    __int16 v38 = 2114;
    v39 = v23;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Updating preferred target for press type {preferredTarget=%{public}@, pressType=%{public}@}",  buf,  0x16u);

    a4 = v22;
    id v9 = v21;
    id v10 = v20;
    id v4 = v19;
    int v8 = v26;

    id v5 = v27;
  }

  -[PBHIDEventDeliveryManager setPreferredTarget:forPressType:]( v8->_HIDEventDeliveryManager,  "setPreferredTarget:forPressType:",  v13,  a4);
  v24 = v28;
  if (a3 < 0)
  {
    v25 = v5;
  }

  else
  {
    v24 = v29;
    v25 = v4;
  }
}

- (NSArray)eventProcessors
{
  return self->_lock_eventProcessors;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (BSInvalidatable)stateCaptureHandle
{
  return self->_stateCaptureHandle;
}

- (PBEventFilterController)eventFilterController
{
  return self->_eventFilterController;
}

- (PBHIDEventDeliveryManager)HIDEventDeliveryManager
{
  return self->_HIDEventDeliveryManager;
}

- (PBHIDEventSystemClient)eventSystemClient
{
  return self->_eventSystemClient;
}

- (BSInvalidatable)systemGestureManagerObservationToken
{
  return self->_systemGestureManagerObservationToken;
}

- (NSCountedSet)activeDynamicPressTypes
{
  return self->_activeDynamicPressTypes;
}

- (void).cxx_destruct
{
}

+ (BOOL)isCECButtonEvent:(__IOHIDEvent *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedInstance]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 senderForEvent:a3]);
  BOOL v6 = [v5 category] == (id)4;

  return v6;
}

+ (BOOL)isRemoteAppEvent:(__IOHIDEvent *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedInstance]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 senderForEvent:a3]);
  BOOL v6 = [v5 category] == (id)6;

  return v6;
}

+ (BOOL)isMultiButtonMFIGamePadEvent:(__IOHIDEvent *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedInstance]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 senderForEvent:a3]);
  unsigned __int8 v6 = [v5 isMultiButtonMFIGamePad];

  return v6;
}

@end