@interface PBHIDEventDeliveryManager
+ (id)keyboardFocusPredicate;
+ (id)predicateForPressType:(int64_t)a3;
+ (id)systemPredicate;
+ (id)systemSleepPredicate;
- (BKSHIDEventDeliveryManager)HIDEventDeliveryManager;
- (BSInvalidatable)baseDispatchingAssertion;
- (BSInvalidatable)keyCommandDispatchingAssertion;
- (BSInvalidatable)playPauseDispatchingAssertion;
- (BSInvalidatable)stateCaptureHandle;
- (PBHIDEventDeliveryManager)initWithBKSHIDEventDeliveryManager:(id)a3;
- (id)stateDumpBuilder;
- (int64_t)mode;
- (int64_t)playPausePreferredDeliveryTarget;
- (int64_t)preferredTargetForPressType:(int64_t)a3;
- (os_unfair_lock_s)lock;
- (void)_lock_disableHIDEventDelivery;
- (void)_lock_enableNormalHIDEventDelivery;
- (void)_lock_enableSleepHIDEventDelivery;
- (void)_lock_update;
- (void)_lock_updatePlayPauseHIDEventDelivery;
- (void)dealloc;
- (void)invalidate;
- (void)setMode:(int64_t)a3;
- (void)setPreferredTarget:(int64_t)a3 forPressType:(int64_t)a4;
@end

@implementation PBHIDEventDeliveryManager

- (PBHIDEventDeliveryManager)initWithBKSHIDEventDeliveryManager:(id)a3
{
  id v5 = a3;
  Class v6 = NSClassFromString(@"BKSHIDEventDeliveryManager");
  if (!v5)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100277E04();
    }
LABEL_11:
    _bs_set_crash_log_message([v18 UTF8String]);
    __break(0);
    JUMPOUT(0x100084C4CLL);
  }

  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:BKSHIDEventDeliveryManagerClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100277EB8();
    }
    goto LABEL_11;
  }

  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___PBHIDEventDeliveryManager;
  v7 = -[PBHIDEventDeliveryManager init](&v22, "init");
  v8 = v7;
  if (v7)
  {
    v7->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v7->_lock_HIDEventDeliveryManager, a3);
    v8->_lock_mode = -1LL;
    v8->_lock_playPausePreferredDeliveryTarget = 2LL;
    objc_initWeak(&location, v8);
    v9 = (objc_class *)objc_opt_class(v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@(%p)", v11, v8));

    v13 = &_dispatch_main_q;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100084CD8;
    v19[3] = &unk_1003D3F18;
    objc_copyWeak(&v20, &location);
    uint64_t v14 = BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle(&_dispatch_main_q, v12, v19);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    stateCaptureHandle = v8->_stateCaptureHandle;
    v8->_stateCaptureHandle = (BSInvalidatable *)v15;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)dealloc
{
  if (self->_lock_mode == -1)
  {
    -[BSInvalidatable invalidate](self->_stateCaptureHandle, "invalidate");
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___PBHIDEventDeliveryManager;
    -[PBHIDEventDeliveryManager dealloc](&v4, "dealloc");
  }

  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"instance must be invalidated before being deallocated"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100277F6C();
    }
    _bs_set_crash_log_message([v3 UTF8String]);
    __break(0);
  }

- (int64_t)mode
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t lock_mode = self->_lock_mode;
  os_unfair_lock_unlock(p_lock);
  return lock_mode;
}

- (void)setMode:(int64_t)a3
{
  if (a3 < 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"mode > PBHIDEventDeliveryModeInvalid"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100278014();
    }
    _bs_set_crash_log_message([v5 UTF8String]);
    __break(0);
  }

  else
  {
    os_unfair_lock_lock(&self->_lock);
    if (self->_lock_mode != a3)
    {
      self->_int64_t lock_mode = a3;
      -[PBHIDEventDeliveryManager _lock_update](self, "_lock_update");
    }

    os_unfair_lock_unlock(&self->_lock);
  }

- (int64_t)preferredTargetForPressType:(int64_t)a3
{
  if (a3 == 6)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_lock_mode == -1) {
      int64_t lock_playPausePreferredDeliveryTarget = -1LL;
    }
    else {
      int64_t lock_playPausePreferredDeliveryTarget = self->_lock_playPausePreferredDeliveryTarget;
    }
    os_unfair_lock_unlock(p_lock);
    return lock_playPausePreferredDeliveryTarget;
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Only UIPressTypePlayPause is supported"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002780BC();
    }
    int64_t result = _bs_set_crash_log_message([v7 UTF8String]);
    __break(0);
  }

  return result;
}

- (void)setPreferredTarget:(int64_t)a3 forPressType:(int64_t)a4
{
  if (a3 < 0)
  {
    Class v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  a4,  @"preferredTarget > PBHIDEventDeliveryTargetInvalid"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100278164();
    }
LABEL_12:
    _bs_set_crash_log_message([v6 UTF8String]);
    __break(0);
    JUMPOUT(0x100085074LL);
  }

  if (a4 != 6)
  {
    Class v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Only UIPressTypePlayPause is supported"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027820C();
    }
    goto LABEL_12;
  }

  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_mode != -1 && self->_lock_playPausePreferredDeliveryTarget != a3)
  {
    self->_int64_t lock_playPausePreferredDeliveryTarget = a3;
    -[PBHIDEventDeliveryManager _lock_updatePlayPauseHIDEventDelivery](self, "_lock_updatePlayPauseHIDEventDelivery");
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_int64_t lock_mode = -1LL;
  -[PBHIDEventDeliveryManager _lock_update](self, "_lock_update");
  lock_HIDEventDeliveryManager = self->_lock_HIDEventDeliveryManager;
  self->_lock_HIDEventDeliveryManager = 0LL;

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_update
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[BKSHIDEventDeliveryManager transactionAssertionWithReason:]( self->_lock_HIDEventDeliveryManager,  "transactionAssertionWithReason:",  @"PineBoard-HIDEventDeliveryUpdate"));
  int64_t lock_mode = self->_lock_mode;
  if (lock_mode == 2)
  {
    -[PBHIDEventDeliveryManager _lock_enableSleepHIDEventDelivery](self, "_lock_enableSleepHIDEventDelivery");
  }

  else if (lock_mode == 1)
  {
    -[PBHIDEventDeliveryManager _lock_enableNormalHIDEventDelivery](self, "_lock_enableNormalHIDEventDelivery");
  }

  else
  {
    -[PBHIDEventDeliveryManager _lock_disableHIDEventDelivery](self, "_lock_disableHIDEventDelivery");
  }

  -[PBHIDEventDeliveryManager _lock_updatePlayPauseHIDEventDelivery](self, "_lock_updatePlayPauseHIDEventDelivery");
  [v3 invalidate];
}

- (void)_lock_enableNormalHIDEventDelivery
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[BKSHIDEventDeliveryManager transactionAssertionWithReason:]( self->_lock_HIDEventDeliveryManager,  "transactionAssertionWithReason:",  @"PineBoard-EnableNormalHIDEventDelivery"));
  id v4 = [(id)objc_opt_class(self) systemPredicate];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  Class v6 = (void *)objc_claimAutoreleasedReturnValue( +[BKSHIDEventDispatchingTarget systemTarget]( &OBJC_CLASS___BKSHIDEventDispatchingTarget,  "systemTarget"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[BKSHIDEventDiscreteDispatchingRule ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:]( &OBJC_CLASS___BKSHIDEventDiscreteDispatchingRule,  "ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:",  v5,  v6));

  id v8 = [(id)objc_opt_class(self) keyboardFocusPredicate];
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[BKSHIDEventDispatchingTarget keyboardFocusTarget]( &OBJC_CLASS___BKSHIDEventDispatchingTarget,  "keyboardFocusTarget"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[BKSHIDEventDiscreteDispatchingRule ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:]( &OBJC_CLASS___BKSHIDEventDiscreteDispatchingRule,  "ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:",  v9,  v10));

  -[BSInvalidatable invalidate](self->_lock_baseDispatchingAssertion, "invalidate");
  lock_HIDEventDeliveryManager = self->_lock_HIDEventDeliveryManager;
  v23[0] = v7;
  v23[1] = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 2LL));
  uint64_t v14 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue( -[BKSHIDEventDeliveryManager dispatchDiscreteEventsForReason:withRules:]( lock_HIDEventDeliveryManager,  "dispatchDiscreteEventsForReason:withRules:",  @"PineBoard-Default",  v13));
  lock_baseDispatchingAssertion = self->_lock_baseDispatchingAssertion;
  self->_lock_baseDispatchingAssertion = v14;

  id v16 = objc_alloc_init(&OBJC_CLASS___BKSMutableHIDEventKeyCommandsDispatchingPredicate);
  [v16 setDisplays:0];
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[BKSHIDEventDispatchingTarget systemTarget]( &OBJC_CLASS___BKSHIDEventDispatchingTarget,  "systemTarget"));
  v24[0] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[BKSHIDEventDispatchingTarget keyboardFocusTarget]( &OBJC_CLASS___BKSHIDEventDispatchingTarget,  "keyboardFocusTarget"));
  v24[1] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 2LL));

  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[BKSHIDEventKeyCommandsDispatchingRule ruleForDispatchingKeyCommandsMatchingPredicate:toTargets:]( &OBJC_CLASS___BKSHIDEventKeyCommandsDispatchingRule,  "ruleForDispatchingKeyCommandsMatchingPredicate:toTargets:",  v16,  v19));
  -[BSInvalidatable invalidate](self->_lock_keyCommandDispatchingAssertion, "invalidate");
  v21 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue( -[BKSHIDEventDeliveryManager dispatchKeyCommandsForReason:withRule:]( self->_lock_HIDEventDeliveryManager,  "dispatchKeyCommandsForReason:withRule:",  @"PB-KeyCommands",  v20));
  lock_keyCommandDispatchingAssertion = self->_lock_keyCommandDispatchingAssertion;
  self->_lock_keyCommandDispatchingAssertion = v21;

  [v3 invalidate];
}

- (void)_lock_enableSleepHIDEventDelivery
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[BKSHIDEventDeliveryManager transactionAssertionWithReason:]( self->_lock_HIDEventDeliveryManager,  "transactionAssertionWithReason:",  @"PineBoard-EnableSleepHIDEventDelivery"));
  id v4 = [(id)objc_opt_class(self) systemSleepPredicate];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  Class v6 = (void *)objc_claimAutoreleasedReturnValue( +[BKSHIDEventDispatchingTarget systemTarget]( &OBJC_CLASS___BKSHIDEventDispatchingTarget,  "systemTarget"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[BKSHIDEventDiscreteDispatchingRule ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:]( &OBJC_CLASS___BKSHIDEventDiscreteDispatchingRule,  "ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:",  v5,  v6));

  -[BSInvalidatable invalidate](self->_lock_baseDispatchingAssertion, "invalidate");
  lock_HIDEventDeliveryManager = self->_lock_HIDEventDeliveryManager;
  v13 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  v10 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue( -[BKSHIDEventDeliveryManager dispatchDiscreteEventsForReason:withRules:]( lock_HIDEventDeliveryManager,  "dispatchDiscreteEventsForReason:withRules:",  @"PineBoard-Sleep",  v9));
  lock_baseDispatchingAssertion = self->_lock_baseDispatchingAssertion;
  self->_lock_baseDispatchingAssertion = v10;

  -[BSInvalidatable invalidate](self->_lock_keyCommandDispatchingAssertion, "invalidate");
  lock_keyCommandDispatchingAssertion = self->_lock_keyCommandDispatchingAssertion;
  self->_lock_keyCommandDispatchingAssertion = 0LL;

  [v3 invalidate];
}

- (void)_lock_disableHIDEventDelivery
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[BKSHIDEventDeliveryManager transactionAssertionWithReason:]( self->_lock_HIDEventDeliveryManager,  "transactionAssertionWithReason:",  @"PineBoard-DisableHIDEventDelivery"));
  -[BSInvalidatable invalidate](self->_lock_baseDispatchingAssertion, "invalidate");
  lock_baseDispatchingAssertion = self->_lock_baseDispatchingAssertion;
  self->_lock_baseDispatchingAssertion = 0LL;

  -[BSInvalidatable invalidate](self->_lock_keyCommandDispatchingAssertion, "invalidate");
  lock_keyCommandDispatchingAssertion = self->_lock_keyCommandDispatchingAssertion;
  self->_lock_keyCommandDispatchingAssertion = 0LL;

  [v3 invalidate];
}

- (void)_lock_updatePlayPauseHIDEventDelivery
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[BKSHIDEventDeliveryManager transactionAssertionWithReason:]( self->_lock_HIDEventDeliveryManager,  "transactionAssertionWithReason:",  @"PineBoard-PlayPauseHIDEventDelivery"));
  if (self->_lock_mode == 1) {
    int64_t lock_playPausePreferredDeliveryTarget = self->_lock_playPausePreferredDeliveryTarget;
  }
  else {
    int64_t lock_playPausePreferredDeliveryTarget = 0LL;
  }
  id v5 = sub_100084A40(self);
  Class v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = sub_100085754(lock_playPausePreferredDeliveryTarget);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    *(_DWORD *)buf = 138543362;
    id v20 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Updating dispatching target for PlayPause {target=%{public}@}",  buf,  0xCu);
  }

  if (lock_playPausePreferredDeliveryTarget == 2)
  {
    id v9 = [(id)objc_opt_class(self) predicateForPressType:6];
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[BKSHIDEventDispatchingTarget keyboardFocusTarget]( &OBJC_CLASS___BKSHIDEventDispatchingTarget,  "keyboardFocusTarget"));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[BKSHIDEventDiscreteDispatchingRule ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:]( &OBJC_CLASS___BKSHIDEventDiscreteDispatchingRule,  "ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:",  v10,  v11));
  }

  else
  {
    v12 = 0LL;
  }

  -[BSInvalidatable invalidate](self->_lock_playPauseDispatchingAssertion, "invalidate");
  lock_playPauseDispatchingAssertion = self->_lock_playPauseDispatchingAssertion;
  self->_lock_playPauseDispatchingAssertion = 0LL;

  if (v12)
  {
    lock_HIDEventDeliveryManager = self->_lock_HIDEventDeliveryManager;
    v18 = v12;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
    id v16 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue( -[BKSHIDEventDeliveryManager dispatchDiscreteEventsForReason:withRules:]( lock_HIDEventDeliveryManager,  "dispatchDiscreteEventsForReason:withRules:",  @"PineBoard-PlayPause",  v15));
    v17 = self->_lock_playPauseDispatchingAssertion;
    self->_lock_playPauseDispatchingAssertion = v16;
  }

  [v3 invalidate];
}

- (id)stateDumpBuilder
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  int64_t lock_mode = self->_lock_mode;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  self->_lock_baseDispatchingAssertion));
  int64_t lock_playPausePreferredDeliveryTarget = self->_lock_playPausePreferredDeliveryTarget;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  self->_lock_playPauseDispatchingAssertion));
  os_unfair_lock_unlock(p_lock);
  id v8 = objc_alloc_init(&OBJC_CLASS___TVSStateDumpBuilder);
  id v9 = sub_1000858FC(lock_mode);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = [v8 appendString:v10 withKey:@"mode"];

  id v12 = [v8 appendString:v5 withKey:@"baseDispatchingAssertion"];
  v13 = sub_100085754(lock_playPausePreferredDeliveryTarget);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = [v8 appendString:v14 withKey:@"playPausePreferredDeliveryTarget"];

  id v16 = [v8 appendString:v7 withKey:@"playPauseDispatchingAssertion"];
  return v8;
}

- (BKSHIDEventDeliveryManager)HIDEventDeliveryManager
{
  return self->_lock_HIDEventDeliveryManager;
}

- (int64_t)playPausePreferredDeliveryTarget
{
  return self->_lock_playPausePreferredDeliveryTarget;
}

- (BSInvalidatable)playPauseDispatchingAssertion
{
  return self->_lock_playPauseDispatchingAssertion;
}

- (BSInvalidatable)baseDispatchingAssertion
{
  return self->_lock_baseDispatchingAssertion;
}

- (BSInvalidatable)keyCommandDispatchingAssertion
{
  return self->_lock_keyCommandDispatchingAssertion;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (BSInvalidatable)stateCaptureHandle
{
  return self->_stateCaptureHandle;
}

- (void).cxx_destruct
{
}

+ (id)systemPredicate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[BKSMutableHIDEventDiscreteDispatchingPredicate defaultSystemPredicate]( &OBJC_CLASS___BKSMutableHIDEventDiscreteDispatchingPredicate,  "defaultSystemPredicate"));
  [v2 setSenderDescriptors:0];
  id v3 = v2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 descriptors]);
  id v5 = [v4 mutableCopy];

  sub_1000905D0(v6, v5);
  [v3 setDescriptors:v5];

  id v7 = [v3 copy];
  return v7;
}

+ (id)systemSleepPredicate
{
  id v2 = objc_alloc_init(&OBJC_CLASS___BKSMutableHIDEventDiscreteDispatchingPredicate);
  [v2 setSenderDescriptors:0];
  id v3 = v2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 descriptors]);
  id v5 = [v4 mutableCopy];

  sub_10009070C(v6, v5);
  [v3 setDescriptors:v5];

  id v7 = [v3 copy];
  return v7;
}

+ (id)keyboardFocusPredicate
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[BKSMutableHIDEventDiscreteDispatchingPredicate defaultFocusPredicate]( &OBJC_CLASS___BKSMutableHIDEventDiscreteDispatchingPredicate,  "defaultFocusPredicate"));
  [v2 setSenderDescriptors:0];
  id v3 = v2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 descriptors]);
  id v5 = [v4 mutableCopy];

  sub_100090820(v6, v5);
  [v3 setDescriptors:v5];

  id v7 = [v3 copy];
  return v7;
}

+ (id)predicateForPressType:(int64_t)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___BKSMutableHIDEventDiscreteDispatchingPredicate);
  [v4 setSenderDescriptors:0];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100090974;
  v10[3] = &unk_1003D4338;
  v10[4] = a3;
  id v5 = v4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 descriptors]);
  id v7 = [v6 mutableCopy];

  sub_100090974((uint64_t)v10, v7);
  [v5 setDescriptors:v7];

  id v8 = [v5 copy];
  return v8;
}

@end