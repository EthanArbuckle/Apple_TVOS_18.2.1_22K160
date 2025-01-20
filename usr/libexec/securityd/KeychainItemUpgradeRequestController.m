@interface KeychainItemUpgradeRequestController
- (BOOL)haveRecordedDate;
- (CKKSLockStateTracker)lockStateTracker;
- (CKKSNearFutureScheduler)persistentReferenceUpgrader;
- (KeychainItemUpgradeRequestController)initWithLockStateTracker:(id)a3;
- (OS_dispatch_queue)queue;
- (OctagonStateMachine)stateMachine;
- (id)_onqueueNextStateMachineTransition:(id)a3 flags:(id)a4 pendingFlags:(id)a5;
- (void)setHaveRecordedDate:(BOOL)a3;
- (void)setLockStateTracker:(id)a3;
- (void)setPersistentReferenceUpgrader:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)triggerKeychainItemUpdateRPC:(id)a3;
@end

@implementation KeychainItemUpgradeRequestController

- (KeychainItemUpgradeRequestController)initWithLockStateTracker:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___KeychainItemUpgradeRequestController;
  v6 = -[KeychainItemUpgradeRequestController init](&v24, "init");
  if (v6)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v6);
    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("KeychainItemUpgradeControllerQueue", v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_lockStateTracker, a3);
    v11 = objc_alloc(&OBJC_CLASS___OctagonStateMachine);
    v26[0] = @"nothing_to_do";
    v26[1] = @"wait_for_unlock";
    v27[0] = &off_1002ADED8;
    v27[1] = &off_1002ADEF0;
    v26[2] = @"upgrade_persistent_ref";
    v26[3] = @"wait_for_trigger";
    v27[2] = &off_1002ADF08;
    v27[3] = &off_1002ADF20;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  4LL));
    v25 = @"schedule_pref_upgrade";
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v13));
    v15 = -[OctagonStateMachine initWithName:states:flags:initialState:queue:stateEngine:unexpectedStateErrorDomain:lockStateTracker:reachabilityTracker:]( v11,  "initWithName:states:flags:initialState:queue:stateEngine:unexpectedStateErrorDomain:lockStateTracker:reachabilityTracker:",  @"keychainitemupgrade",  v12,  v14,  @"upgrade_persistent_ref",  v6->_queue,  v6,  @"com.apple.security.keychainitemupgrade.state",  v5,  0LL);
    stateMachine = v6->_stateMachine;
    v6->_stateMachine = v15;

    v17 = objc_alloc(&OBJC_CLASS___CKKSNearFutureScheduler);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10017F0A0;
    v21[3] = &unk_100291A38;
    objc_copyWeak(&v22, &location);
    v18 = -[CKKSNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:]( v17,  "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:",  @"persistent-ref-upgrader",  5000000000LL,  300000000000LL,  0LL,  0LL,  v21,  2.0);
    persistentReferenceUpgrader = v6->_persistentReferenceUpgrader;
    v6->_persistentReferenceUpgrader = v18;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (id)_onqueueNextStateMachineTransition:(id)a3 flags:(id)a4 pendingFlags:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KeychainItemUpgradeRequestController queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  if ([v8 isEqualToString:@"wait_for_unlock"])
  {
    v12 = sub_10001267C("keychainitemupgrade");
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "waiting for unlock before continuing with state machine",  (uint8_t *)&buf,  2u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:entering:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:entering:",  @"wait-for-unlock",  @"nothing_to_do"));
    v15 = (OctagonPendingFlag *)objc_claimAutoreleasedReturnValue(-[KeychainItemUpgradeRequestController lockStateTracker](self, "lockStateTracker"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonPendingFlag unlockDependency](v15, "unlockDependency"));
    [v14 addNullableDependency:v16];

LABEL_5:
    goto LABEL_29;
  }

  if (![v8 isEqualToString:@"upgrade_persistent_ref"])
  {
    if ([v8 isEqualToString:@"wait_for_trigger"])
    {
      v23 = sub_10001267C("keychainitemupgrade");
      objc_super v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "waiting for trigger to occur",  (uint8_t *)&buf,  2u);
      }

      if ([v9 _onqueueContains:@"schedule_pref_upgrade"])
      {
        [v9 _onqueueRemoveFlag:@"schedule_pref_upgrade"];
        v25 = sub_10001267C("keychainitemupgrade");
        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "handling persistent ref flag, attempting to upgrade next batch",  (uint8_t *)&buf,  2u);
        }

        goto LABEL_21;
      }
    }

    else if ([v8 isEqualToString:@"nothing_to_do"])
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue( -[KeychainItemUpgradeRequestController persistentReferenceUpgrader]( self,  "persistentReferenceUpgrader"));
      [v28 cancel];

      v29 = sub_10001267C("keychainitemupgrade");
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "nothing to do", (uint8_t *)&buf, 2u);
      }
    }

    v14 = 0LL;
    goto LABEL_29;
  }

  v17 = sub_10001267C("keychainitemupgrade");
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "upgrading persistent refs",  (uint8_t *)&buf,  2u);
  }

  CFTypeRef cf = 0LL;
  v43[0] = 0LL;
  unsigned __int8 v41 = 0;
  uint64_t v45 = 0LL;
  v46 = &v45;
  uint64_t v47 = 0x2000000000LL;
  char v48 = 0;
  v43[1] = v43;
  v43[2] = 0x2000000000LL;
  uint64_t v44 = 0LL;
  *(void *)&__int128 buf = _NSConcreteStackBlock;
  *((void *)&buf + 1) = 0x40000000LL;
  v50 = sub_100110E60;
  v51 = &unk_10028F320;
  v52 = v43;
  v53 = &v45;
  v54 = &v41;
  p_CFTypeRef cf = &cf;
  sub_100110ECC(1, 1, 0LL, (uint64_t)&v44, (uint64_t)&buf);
  _Block_object_dispose(v43, 8);
  int v19 = *((unsigned __int8 *)v46 + 24);
  _Block_object_dispose(&v45, 8);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[KeychainItemUpgradeRequestController lockStateTracker](self, "lockStateTracker"));
  unsigned int v21 = [v20 isLockedError:cf];

  if (v21)
  {
    v15 = -[OctagonPendingFlag initWithFlag:conditions:]( objc_alloc(&OBJC_CLASS___OctagonPendingFlag),  "initWithFlag:conditions:",  @"schedule_pref_upgrade",  1LL);
    [v10 _onqueueHandlePendingFlagLater:v15];
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:entering:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:entering:",  @"after-upgrade--attempt-wait-for-unlock",  @"wait_for_unlock"));
    CFTypeRef v22 = cf;
    if (cf)
    {
      CFTypeRef cf = 0LL;
      CFRelease(v22);
    }

    goto LABEL_5;
  }

  int v27 = v41;
  if (v41 && !cf)
  {
LABEL_21:
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:entering:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:entering:",  @"upgrade-persistent-refs",  @"upgrade_persistent_ref"));
    goto LABEL_29;
  }

  if (cf) {
    BOOL v32 = 1;
  }
  else {
    BOOL v32 = v19 == 0;
  }
  char v33 = !v32;
  v34 = sub_10001267C("keychainitemupgrade");
  v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
  BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
  if (!v27 || (v33 & 1) != 0)
  {
    if (v36)
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "finished upgrading items!",  (uint8_t *)&buf,  2u);
    }

    v38 = @"nothing-to-do";
    v39 = @"nothing_to_do";
  }

  else
  {
    if (v36)
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = cf;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "hit an error, triggering CKKSNFS: %@",  (uint8_t *)&buf,  0xCu);
    }

    v37 = (void *)objc_claimAutoreleasedReturnValue( -[KeychainItemUpgradeRequestController persistentReferenceUpgrader]( self,  "persistentReferenceUpgrader"));
    [v37 trigger];

    v38 = @"wait-for-trigger";
    v39 = @"wait_for_trigger";
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:entering:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:entering:",  v38,  v39));
  CFTypeRef v40 = cf;
  if (cf)
  {
    CFTypeRef cf = 0LL;
    CFRelease(v40);
  }

- (void)triggerKeychainItemUpdateRPC:(id)a3
{
  v4 = (void (**)(id, void))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[KeychainItemUpgradeRequestController stateMachine](self, "stateMachine"));
  [v5 startOperation];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KeychainItemUpgradeRequestController lockStateTracker](self, "lockStateTracker"));
  if (v6)
  {
    dispatch_queue_attr_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[KeychainItemUpgradeRequestController lockStateTracker](self, "lockStateTracker"));
    [v7 recheck];
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:entering:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:entering:",  @"upgrade-persistent-ref",  @"upgrade_persistent_ref"));
  v15 = @"nothing_to_do";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));

  v11 = objc_alloc(&OBJC_CLASS___OctagonStateTransitionRequest);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[KeychainItemUpgradeRequestController queue](self, "queue"));
  id v13 = -[OctagonStateTransitionRequest init:sourceStates:serialQueue:transitionOp:]( v11,  "init:sourceStates:serialQueue:transitionOp:",  @"request-item-upgrade",  v10,  v12,  v8);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KeychainItemUpgradeRequestController stateMachine](self, "stateMachine"));
  [v14 handleExternalRequest:v13 startTimeout:10000000000];

  v4[2](v4, 0LL);
}

- (OctagonStateMachine)stateMachine
{
  return (OctagonStateMachine *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setStateMachine:(id)a3
{
}

- (CKKSNearFutureScheduler)persistentReferenceUpgrader
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setPersistentReferenceUpgrader:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (CKKSLockStateTracker)lockStateTracker
{
  return (CKKSLockStateTracker *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setLockStateTracker:(id)a3
{
}

- (BOOL)haveRecordedDate
{
  return self->_haveRecordedDate;
}

- (void)setHaveRecordedDate:(BOOL)a3
{
  self->_haveRecordedDate = a3;
}

- (void).cxx_destruct
{
}

@end