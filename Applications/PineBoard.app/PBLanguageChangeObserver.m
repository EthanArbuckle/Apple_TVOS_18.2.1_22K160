@interface PBLanguageChangeObserver
- (BOOL)shouldMessageDelegate;
- (BSAtomicSignal)invalidationSignal;
- (PBLanguageChangeObserver)init;
- (PBLanguageChangeObserver)initWithLockdownLanguageChangedNotification:(id)a3 lockdownLocaleChangedNotification:(id)a4 buddyLanguageChangeReadyNotification:(id)a5 regionWillChangeNotification:(id)a6 notificationCenter:(__CFNotificationCenter *)a7;
- (PBLanguageChangeObserverDelegate)delegate;
- (__CFNotificationCenter)notificationCenterRef;
- (void)dealloc;
- (void)invalidate;
- (void)languageDidChangeWithSource:(int64_t)a3;
- (void)localeDidChange;
- (void)regionWillChange;
- (void)setDelegate:(id)a3;
- (void)setShouldMessageDelegate:(BOOL)a3;
@end

@implementation PBLanguageChangeObserver

- (PBLanguageChangeObserver)initWithLockdownLanguageChangedNotification:(id)a3 lockdownLocaleChangedNotification:(id)a4 buddyLanguageChangeReadyNotification:(id)a5 regionWillChangeNotification:(id)a6 notificationCenter:(__CFNotificationCenter *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = (__CFString *)a6;
  v16 = (__CFString *)v12;
  Class v17 = NSClassFromString(@"NSString");
  if (!v16)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027A9D0();
    }
LABEL_31:
    _bs_set_crash_log_message([v27 UTF8String]);
    __break(0);
    JUMPOUT(0x1000B36D4LL);
  }

  if ((objc_opt_isKindOfClass(v16, v17) & 1) == 0)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSStringClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027A9D0();
    }
    _bs_set_crash_log_message([v28 UTF8String]);
    __break(0);
    JUMPOUT(0x1000B3738LL);
  }

  v18 = (__CFString *)v13;
  Class v19 = NSClassFromString(@"NSString");
  if (!v18)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027AA80();
    }
    _bs_set_crash_log_message([v29 UTF8String]);
    __break(0);
    JUMPOUT(0x1000B379CLL);
  }

  if ((objc_opt_isKindOfClass(v18, v19) & 1) == 0)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSStringClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027AA80();
    }
    _bs_set_crash_log_message([v30 UTF8String]);
    __break(0);
    JUMPOUT(0x1000B3800LL);
  }

  v20 = (__CFString *)v14;
  Class v21 = NSClassFromString(@"NSString");
  if (!v20)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027AB30();
    }
    _bs_set_crash_log_message([v31 UTF8String]);
    __break(0);
    JUMPOUT(0x1000B3864LL);
  }

  if ((objc_opt_isKindOfClass(v20, v21) & 1) == 0)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSStringClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027AB30();
    }
    _bs_set_crash_log_message([v32 UTF8String]);
    __break(0);
    JUMPOUT(0x1000B38C8LL);
  }

  if (!a7)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"notificationCenter != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027ABE0();
    }
    goto LABEL_31;
  }

  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___PBLanguageChangeObserver;
  v22 = -[PBLanguageChangeObserver init](&v33, "init");
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_log, &_os_log_default);
    v23->_shouldMessageDelegate = 1;
    v24 = objc_alloc_init(&OBJC_CLASS___BSAtomicSignal);
    invalidationSignal = v23->_invalidationSignal;
    v23->_invalidationSignal = v24;

    v23->_notificationCenterRef = (__CFNotificationCenter *)CFRetain(a7);
    CFNotificationCenterAddObserver( a7,  v23,  (CFNotificationCallback)sub_1000B3930,  v16,  0LL,  CFNotificationSuspensionBehaviorCoalesce);
    CFNotificationCenterAddObserver( a7,  v23,  (CFNotificationCallback)sub_1000B39B0,  v20,  0LL,  CFNotificationSuspensionBehaviorCoalesce);
    CFNotificationCenterAddObserver( a7,  v23,  (CFNotificationCallback)sub_1000B3A1C,  v18,  0LL,  CFNotificationSuspensionBehaviorCoalesce);
    CFNotificationCenterAddObserver( a7,  v23,  (CFNotificationCallback)sub_1000B3A88,  v15,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  }

  return v23;
}

- (PBLanguageChangeObserver)init
{
  return -[PBLanguageChangeObserver initWithLockdownLanguageChangedNotification:lockdownLocaleChangedNotification:buddyLanguageChangeReadyNotification:regionWillChangeNotification:notificationCenter:]( self,  "initWithLockdownLanguageChangedNotification:lockdownLocaleChangedNotification:buddyLanguageChangeReadyNotific ation:regionWillChangeNotification:notificationCenter:",  @"com.apple.language.changed",  @"AppleDatePreferencesChangedNotification",  @"com.apple.purplebuddy.LanguageResetReady",  TVSSystemRegionWillChangeNotification,  CFNotificationCenterGetDarwinNotifyCenter());
}

- (void)dealloc
{
  if ((-[BSAtomicSignal hasBeenSignalled](self->_invalidationSignal, "hasBeenSignalled") & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_invalidationSignal hasBeenSignalled]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027AD30();
    }
LABEL_9:
    _bs_set_crash_log_message([v3 UTF8String]);
    __break(0);
    JUMPOUT(0x1000B3C08LL);
  }

  if (self->_notificationCenterRef)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_notificationCenterRef == NULL"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027AC88();
    }
    goto LABEL_9;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBLanguageChangeObserver;
  -[PBLanguageChangeObserver dealloc](&v4, "dealloc");
}

- (void)invalidate
{
  if (-[BSAtomicSignal signal](self->_invalidationSignal, "signal"))
  {
    CFNotificationCenterRemoveEveryObserver(self->_notificationCenterRef, self);
    CFRelease(self->_notificationCenterRef);
    self->_notificationCenterRef = 0LL;
  }

- (void)languageDidChangeWithSource:(int64_t)a3
{
  if (self->_shouldMessageDelegate)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBLanguageChangeObserver delegate](self, "delegate"));
    char v6 = objc_opt_respondsToSelector(v5, "observer:didObserveLanguageChange:localeChange:source:");

    if ((v6 & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBLanguageChangeObserver delegate](self, "delegate"));
      [v7 observer:self didObserveLanguageChange:1 localeChange:0 source:a3];
    }
  }

- (void)localeDidChange
{
  if (self->_shouldMessageDelegate)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBLanguageChangeObserver delegate](self, "delegate"));
    char v4 = objc_opt_respondsToSelector(v3, "observer:didObserveLanguageChange:localeChange:source:");

    if ((v4 & 1) != 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBLanguageChangeObserver delegate](self, "delegate"));
      [v5 observer:self didObserveLanguageChange:0 localeChange:1 source:0];
    }
  }

- (void)regionWillChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "observerDidObserveRegionWillChange:") & 1) != 0) {
    [WeakRetained observerDidObserveRegionWillChange:self];
  }
}

- (PBLanguageChangeObserverDelegate)delegate
{
  return (PBLanguageChangeObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldMessageDelegate
{
  return self->_shouldMessageDelegate;
}

- (void)setShouldMessageDelegate:(BOOL)a3
{
  self->_shouldMessageDelegate = a3;
}

- (BSAtomicSignal)invalidationSignal
{
  return self->_invalidationSignal;
}

- (__CFNotificationCenter)notificationCenterRef
{
  return self->_notificationCenterRef;
}

- (void).cxx_destruct
{
}

@end