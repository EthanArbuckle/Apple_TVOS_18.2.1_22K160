@interface PBSystemActivationManager
+ (id)sharedInstance;
- (PBSystemActivationManager)init;
- (int64_t)activationState;
- (void)_updateActivationState;
- (void)setActivationState:(int64_t)a3;
@end

@implementation PBSystemActivationManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10012FFE4;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100470FE0 != -1) {
    dispatch_once(&qword_100470FE0, block);
  }
  return (id)qword_100470FD8;
}

- (PBSystemActivationManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBSystemActivationManager;
  v2 = -[PBSystemActivationManager init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[PBSystemActivationManager _updateActivationState](v2, "_updateActivationState");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v3,  (CFNotificationCallback)sub_100130084,  kNotificationActivationStateChanged,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  }

  return v3;
}

- (void)_updateActivationState
{
  id v30 = 0LL;
  v3 = (__CFString *)MAEGetActivationStateWithError(&v30, a2);
  id v4 = v30;
  id v5 = sub_100084068();
  objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v4) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v3 == 0LL;
  }
  if (v8)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100284588((uint64_t)v4, v7, v9, v10, v11, v12, v13, v14);
    }
  }

  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v32 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "MobileActivation returned state %{public}@",  buf,  0xCu);
    }

    if (-[__CFString isEqualToString:](v3, "isEqualToString:", kMAActivationStateActivated))
    {
      v16 = self;
      uint64_t v17 = 2LL;
    }

    else if (-[__CFString isEqualToString:](v3, "isEqualToString:", kMAActivationStateFactoryActivated))
    {
      v16 = self;
      uint64_t v17 = 3LL;
    }

    else
    {
      if (!-[__CFString isEqualToString:](v3, "isEqualToString:", kMAActivationStateUnactivated))
      {
        id v18 = sub_100084068();
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_100284520((uint64_t)v3, v19, v20, v21, v22, v23, v24, v25);
        }
      }

      v16 = self;
      uint64_t v17 = 1LL;
    }

    -[PBSystemActivationManager setActivationState:](v16, "setActivationState:", v17);
  }

  id v26 = sub_100084068();
  v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v28 = -[PBSystemActivationManager activationState](self, "activationState");
    else {
      v29 = off_1003D89B0[v28 - 1];
    }
    *(_DWORD *)buf = 138543362;
    v32 = v29;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "PBSystemActivationManager activation state = %{public}@",  buf,  0xCu);
  }
}

- (int64_t)activationState
{
  return self->_activationState;
}

- (void)setActivationState:(int64_t)a3
{
  self->_activationState = a3;
}

@end