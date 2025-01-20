@interface PBKeyboardPreferenceObserver
- (NSUserDefaults)uikitDefaults;
- (PBKeyboardPreferenceObserver)init;
- (PBKeyboardPreferenceObserver)initWithTouchPadAvailabilityNotificationName:(id)a3 keyboardStyleProvider:(id)a4;
- (PBKeyboardPreferenceObserverDelegate)delegate;
- (id)keyboardStyleProvider;
- (int)touchPadAvailabilityNotificationToken;
- (int64_t)_resolvedKeyboardStyle;
- (int64_t)resolvedKeyboardStyle;
- (void)_handlePreferredKeyboardUpdate;
- (void)_handleTouchPadAvailabilityUpdate;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDelegate:(id)a3;
@end

@implementation PBKeyboardPreferenceObserver

- (PBKeyboardPreferenceObserver)initWithTouchPadAvailabilityNotificationName:(id)a3 keyboardStyleProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"touchPadAvailabilityNotificationName != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002825A0(a2);
    }
LABEL_15:
    _bs_set_crash_log_message([v21 UTF8String]);
    __break(0);
    JUMPOUT(0x100112B10LL);
  }

  v9 = v8;
  if (!v8)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"keyboardStyleProvider != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100282660(a2);
    }
    goto LABEL_15;
  }

  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___PBKeyboardPreferenceObserver;
  v10 = -[PBKeyboardPreferenceObserver init](&v25, "init");
  if (v10)
  {
    id v11 = [v9 copy];
    id keyboardStyleProvider = v10->_keyboardStyleProvider;
    v10->_id keyboardStyleProvider = v11;

    v13 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.UIKit");
    uikitDefaults = v10->_uikitDefaults;
    v10->_uikitDefaults = v13;

    -[NSUserDefaults addObserver:forKeyPath:options:context:]( v10->_uikitDefaults,  "addObserver:forKeyPath:options:context:",  v10,  @"UserPreferredKeyboardStyle",  0LL,  &off_1003D7F40);
    objc_initWeak(&location, v10);
    v15 = (const char *)[v7 UTF8String];
    v16 = &_dispatch_main_q;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100112BA4;
    handler[3] = &unk_1003D2CA8;
    objc_copyWeak(&v23, &location);
    uint32_t v17 = notify_register_dispatch(v15, &v10->_touchPadAvailabilityNotificationToken, &_dispatch_main_q, handler);

    if (v17)
    {
      id v18 = sub_1000F70B4();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100282720(v17, v19);
      }

      v10->_touchPadAvailabilityNotificationToken = -1;
    }

    v10->_resolvedKeyboardStyle = -[PBKeyboardPreferenceObserver _resolvedKeyboardStyle](v10, "_resolvedKeyboardStyle");
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (PBKeyboardPreferenceObserver)init
{
  return -[PBKeyboardPreferenceObserver initWithTouchPadAvailabilityNotificationName:keyboardStyleProvider:]( self,  "initWithTouchPadAvailabilityNotificationName:keyboardStyleProvider:",  kBKSHIDServicesTouchPadAvailabilityNotification,  &stru_1003D7F20);
}

- (void)dealloc
{
  int touchPadAvailabilityNotificationToken = self->_touchPadAvailabilityNotificationToken;
  if (touchPadAvailabilityNotificationToken != -1) {
    notify_cancel(touchPadAvailabilityNotificationToken);
  }
  -[NSUserDefaults removeObserver:forKeyPath:context:]( self->_uikitDefaults,  "removeObserver:forKeyPath:context:",  self,  @"UserPreferredKeyboardStyle",  &off_1003D7F40);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBKeyboardPreferenceObserver;
  -[PBKeyboardPreferenceObserver dealloc](&v4, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &off_1003D7F40)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100112CEC;
    block[3] = &unk_1003CFF08;
    block[4] = self;
    dispatch_async(&_dispatch_main_q, block);
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___PBKeyboardPreferenceObserver;
    -[PBKeyboardPreferenceObserver observeValueForKeyPath:ofObject:change:context:]( &v6,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (int64_t)_resolvedKeyboardStyle
{
  return (*((uint64_t (**)(void))self->_keyboardStyleProvider + 2))();
}

- (void)_handlePreferredKeyboardUpdate
{
  unint64_t resolvedKeyboardStyle = self->_resolvedKeyboardStyle;
  int64_t v4 = -[PBKeyboardPreferenceObserver _resolvedKeyboardStyle](self, "_resolvedKeyboardStyle");
  if (v4 == resolvedKeyboardStyle)
  {
    id v5 = sub_1000F70B4();
    WeakRetained = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEBUG)) {
      sub_100282794(resolvedKeyboardStyle, WeakRetained);
    }
  }

  else
  {
    unint64_t v7 = v4;
    self->_unint64_t resolvedKeyboardStyle = v4;
    WeakRetained = (os_log_s *)objc_loadWeakRetained((id *)&self->_delegate);
    id v8 = sub_1000F70B4();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    v10 = v9;
    if (WeakRetained)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_100282828(resolvedKeyboardStyle, v7, v10);
      }

      -[os_log_s keyboardPreferenceObserver:didUpdateFromKeyboardStyle:toKeyboardStyle:]( WeakRetained,  "keyboardPreferenceObserver:didUpdateFromKeyboardStyle:toKeyboardStyle:",  self,  resolvedKeyboardStyle,  v7);
    }

    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        if (resolvedKeyboardStyle > 2) {
          id v11 = @"Unknown";
        }
        else {
          id v11 = *(&off_1003D7F48 + resolvedKeyboardStyle);
        }
        if (v7 > 2) {
          v12 = @"Unknown";
        }
        else {
          v12 = *(&off_1003D7F48 + v7);
        }
        int v13 = 138543618;
        v14 = v11;
        __int16 v15 = 2114;
        v16 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Keyboard style did change from '%{public}@' to '%{public}@' {delegate=nil}",  (uint8_t *)&v13,  0x16u);
      }
    }
  }
}

- (void)_handleTouchPadAvailabilityUpdate
{
  int64_t v3 = -[PBKeyboardPreferenceObserver _resolvedKeyboardStyle](self, "_resolvedKeyboardStyle");
  if (v3 != self->_resolvedKeyboardStyle)
  {
    unint64_t v4 = v3;
    self->_unint64_t resolvedKeyboardStyle = v3;
    id v5 = sub_1000F70B4();
    objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (v4 > 2) {
        unint64_t v7 = @"Unknown";
      }
      else {
        unint64_t v7 = *(&off_1003D7F48 + v4);
      }
      int v8 = 138543362;
      v9 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Keyboard change due to TouchPad availability, updated to '%{public}@'",  (uint8_t *)&v8,  0xCu);
    }
  }

- (PBKeyboardPreferenceObserverDelegate)delegate
{
  return (PBKeyboardPreferenceObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (id)keyboardStyleProvider
{
  return self->_keyboardStyleProvider;
}

- (NSUserDefaults)uikitDefaults
{
  return self->_uikitDefaults;
}

- (int64_t)resolvedKeyboardStyle
{
  return self->_resolvedKeyboardStyle;
}

- (int)touchPadAvailabilityNotificationToken
{
  return self->_touchPadAvailabilityNotificationToken;
}

- (void).cxx_destruct
{
}

@end