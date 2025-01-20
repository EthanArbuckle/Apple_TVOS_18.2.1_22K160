@interface PBEventFilterController
- (BSInvalidatable)stateCaptureHandle;
- (NSString)notificationName;
- (PBEventFilterController)initWithExternalControlSystem:(id)a3 eARCConfigurator:(id)a4;
- (PBEventFilterController)initWithExternalControlSystem:(id)a3 eARCConfigurator:(id)a4 notificationName:(id)a5;
- (PBSEARCConfigurating)eARCConfigurator;
- (PBSExternalControlSystem)externalControlSystem;
- (id)stateDumpBuilder;
- (int64_t)mode;
- (unint64_t)_queue_calculatedOptions;
- (void)_mainQueue_recalculateStateAndNotify;
- (void)_queue_recalculateStateAndNotifyForced:(BOOL)a3;
- (void)_setNeedsUpdate;
- (void)_unsafe_externalControlPolicyDidUpdate:(id)a3;
- (void)dealloc;
- (void)eARCStatusChanged:(int64_t)a3;
- (void)invalidate;
- (void)setMode:(int64_t)a3;
@end

@implementation PBEventFilterController

- (PBEventFilterController)initWithExternalControlSystem:(id)a3 eARCConfigurator:(id)a4 notificationName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v45.receiver = self;
  v45.super_class = (Class)&OBJC_CLASS___PBEventFilterController;
  id v11 = -[PBEventFilterController init](&v45, "init");
  if (!v11) {
    goto LABEL_7;
  }
  id v12 = [v10 copy];
  v13 = (void *)*((void *)v11 + 7);
  *((void *)v11 + 7) = v12;

  uint32_t v14 = notify_register_check((const char *)[*((id *)v11 + 7) UTF8String], (int *)v11 + 3);
  if (!v14)
  {
    *((_DWORD *)v11 + 2) = 0;
    *((void *)v11 + 4) = 0LL;
    objc_storeWeak((id *)v11 + 5, v9);
    objc_storeWeak((id *)v11 + 6, v8);
    dispatch_queue_attr_t v19 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v19);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.PineBoard.EventFilter.Controller", v20);
    v22 = (void *)*((void *)v11 + 2);
    *((void *)v11 + 2) = v21;

    dispatch_source_t v23 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_or, 0LL, 0LL, &_dispatch_main_q);
    v24 = (void *)*((void *)v11 + 3);
    *((void *)v11 + 3) = v23;

    objc_initWeak(&location, v11);
    v25 = (dispatch_source_s *)*((void *)v11 + 3);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10017FF10;
    handler[3] = &unk_1003D0890;
    objc_copyWeak(&v43, &location);
    dispatch_source_set_event_handler(v25, handler);
    id WeakRetained = objc_loadWeakRetained((id *)v11 + 5);
    [WeakRetained addEARCObserver:v11];

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v27 addObserver:v11 selector:"_unsafe_externalControlPolicyDidUpdate:" name:@"PBExternalControlPolicyDidUpdateNotification" object:0];

    v28 = (dispatch_queue_s *)*((void *)v11 + 2);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10017FF3C;
    block[3] = &unk_1003CFF08;
    v29 = v11;
    id v41 = v29;
    dispatch_sync(v28, block);
    dispatch_activate(*((dispatch_object_t *)v11 + 3));
    v30 = (objc_class *)objc_opt_class(v29);
    v31 = NSStringFromClass(v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@(%p)",  v32,  v29));

    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_10017FF58;
    v38[3] = &unk_1003D04B8;
    objc_copyWeak(&v39, &location);
    uint64_t v34 = BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle(&_dispatch_main_q, v33, v38);
    uint64_t v35 = objc_claimAutoreleasedReturnValue(v34);
    v36 = (void *)v29[8];
    v29[8] = v35;

    objc_destroyWeak(&v39);
    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
LABEL_7:
    v18 = (PBEventFilterController *)v11;
    goto LABEL_8;
  }

  int v15 = v14;
  id v16 = sub_1000F6DE4();
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
    sub_1002893A8(v15, v17);
  }

  v18 = 0LL;
LABEL_8:

  return v18;
}

- (PBEventFilterController)initWithExternalControlSystem:(id)a3 eARCConfigurator:(id)a4
{
  uint64_t v6 = PBEventFilterConfigurationNotificationName;
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v6));
  id v10 = -[PBEventFilterController initWithExternalControlSystem:eARCConfigurator:notificationName:]( self,  "initWithExternalControlSystem:eARCConfigurator:notificationName:",  v8,  v7,  v9);

  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBEventFilterController;
  -[PBEventFilterController dealloc](&v3, "dealloc");
}

- (int64_t)mode
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0x10000LL);
  int64_t lock_mode = self->_lock_mode;
  os_unfair_lock_unlock(p_lock);
  return lock_mode;
}

- (void)setMode:(int64_t)a3
{
  if (a3 < 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"mode > PBEventFilterModeInvalid"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028941C(a2, (uint64_t)self, (uint64_t)v8);
    }
    _bs_set_crash_log_message([v8 UTF8String]);
    __break(0);
  }

  else
  {
    os_unfair_lock_lock_with_options(&self->_lock, 0x10000LL);
    int64_t lock_mode = self->_lock_mode;
    if (lock_mode == -1 || lock_mode == a3)
    {
      os_unfair_lock_unlock(&self->_lock);
    }

    else
    {
      self->_int64_t lock_mode = a3;
      os_unfair_lock_unlock(&self->_lock);
      -[PBEventFilterController _setNeedsUpdate](self, "_setNeedsUpdate");
    }
  }

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0x10000LL);
  int lock_token = self->_lock_token;
  v5 = self->_lock_reloadSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lock_eARCConfigurator);
  self->_int64_t lock_mode = -1LL;
  self->_int lock_token = -1;
  lock_queue = self->_lock_queue;
  self->_lock_queue = 0LL;

  lock_reloadSource = self->_lock_reloadSource;
  self->_lock_reloadSource = 0LL;

  objc_storeWeak((id *)&self->_lock_eARCConfigurator, 0LL);
  objc_storeWeak((id *)&self->_lock_externalControlSystem, 0LL);
  os_unfair_lock_unlock(p_lock);
  if (lock_token != -1) {
    notify_cancel(lock_token);
  }
  if (v5)
  {
    dispatch_source_cancel((dispatch_source_t)v5);
  }

  [WeakRetained removeEARCObserver:self];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v9 removeObserver:self];
}

- (void)eARCStatusChanged:(int64_t)a3
{
  id v5 = sub_1000F6DE4();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = sub_100180358(a3);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "eARC status changed {status=%{public}@}",  (uint8_t *)&v9,  0xCu);
  }

  -[PBEventFilterController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (id)stateDumpBuilder
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock_with_options(p_lock, 0x10000LL);
  int64_t lock_mode = self->_lock_mode;
  uint64_t lock_token = self->_lock_token;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lock_eARCConfigurator);
  id v7 = objc_loadWeakRetained((id *)&self->_lock_externalControlSystem);
  os_unfair_lock_unlock(p_lock);
  id v8 = [WeakRetained eARCStatus];
  id v9 = [v7 volumeButtonBehavior];
  id v10 = objc_alloc_init(&OBJC_CLASS___TVSStateDumpBuilder);
  id v11 = sub_10018052C(lock_mode);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = [v10 appendString:v12 withKey:@"mode"];

  id v14 = [v10 appendInteger:lock_token withKey:@"token"];
  id v15 = [v10 appendPointer:WeakRetained withKey:@"eARCConfigurator"];
  id v16 = sub_100180358((uint64_t)v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = [v10 appendString:v17 withKey:@"eARCStatus"];

  id v19 = [v10 appendPointer:v7 withKey:@"externalControlSystem"];
  id v20 = [v10 appendInteger:v9 withKey:@"volumeButtonBehavior"];

  return v10;
}

- (void)_unsafe_externalControlPolicyDidUpdate:(id)a3
{
}

- (void)_setNeedsUpdate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0x10000LL);
  v4 = self->_lock_reloadSource;
  os_unfair_lock_unlock(p_lock);
  if (v4) {
    dispatch_source_merge_data((dispatch_source_t)v4, 1uLL);
  }
}

- (unint64_t)_queue_calculatedOptions
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0x10000LL);
  int64_t lock_mode = self->_lock_mode;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lock_eARCConfigurator);
  id v6 = objc_loadWeakRetained((id *)&self->_lock_externalControlSystem);
  os_unfair_lock_unlock(p_lock);
  unint64_t v7 = (unint64_t)[WeakRetained eARCStatus];
  id v8 = [v6 volumeButtonBehavior];
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  uint64_t v21 = 0LL;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10018074C;
  v17[3] = &unk_1003DA440;
  v17[4] = &v18;
  id v9 = objc_retainBlock(v17);
  ((void (*)(void *, BOOL, uint64_t))v9[2])(v9, lock_mode == 1, 1LL);
  unint64_t v10 = v7 & 0xFFFFFFFFFFFFFFFELL;
  BOOL v12 = lock_mode == 2 && v10 == 2;
  ((void (*)(void *, BOOL, uint64_t))v9[2])(v9, v12, 2LL);
  BOOL v14 = v10 == 2 && v8 == 0LL;
  ((void (*)(void *, BOOL, uint64_t))v9[2])(v9, v14, 4LL);
  unint64_t v15 = v19[3];

  _Block_object_dispose(&v18, 8);
  return v15;
}

- (void)_mainQueue_recalculateStateAndNotify
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0x10000LL);
  v4 = self->_lock_queue;
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    objc_initWeak(&location, self);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100180828;
    v5[3] = &unk_1003D0890;
    objc_copyWeak(&v6, &location);
    dispatch_async((dispatch_queue_t)v4, v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)_queue_recalculateStateAndNotifyForced:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0x10000LL);
  int lock_token = self->_lock_token;
  os_unfair_lock_unlock(p_lock);
  if (lock_token != -1)
  {
    uint64_t v7 = -[PBEventFilterController _queue_calculatedOptions](self, "_queue_calculatedOptions");
    uint64_t state64 = 0LL;
    uint32_t state = notify_get_state(lock_token, &state64);
    if (state) {
      BOOL v9 = 0;
    }
    else {
      BOOL v9 = v7 == state64;
    }
    if (v9 && !v3)
    {
      id v20 = sub_1000F6DE4();
      unint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218496;
        uint64_t v23 = state64;
        __int16 v24 = 2048;
        uint64_t v25 = v7;
        __int16 v26 = 1024;
        uint32_t v27 = 0;
        id v16 = "Skipping updating options {options=(current: 0x%llX, new: 0x%llX), status=(get: %u)}";
        v17 = v15;
        os_log_type_t v18 = OS_LOG_TYPE_INFO;
        uint32_t v19 = 28;
        goto LABEL_13;
      }
    }

    else
    {
      uint32_t v11 = state;
      uint32_t v12 = notify_set_state(lock_token, v7);
      uint32_t v13 = notify_post(-[NSString UTF8String](self->_notificationName, "UTF8String"));
      id v14 = sub_1000F6DE4();
      unint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134219008;
        uint64_t v23 = state64;
        __int16 v24 = 2048;
        uint64_t v25 = v7;
        __int16 v26 = 1024;
        uint32_t v27 = v11;
        __int16 v28 = 1024;
        uint32_t v29 = v12;
        __int16 v30 = 1024;
        uint32_t v31 = v13;
        id v16 = "Updated options {options=(previous: 0x%llX, new: 0x%llX), status=(get: %u, set: %u, post: %u)}";
        v17 = v15;
        os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
        uint32_t v19 = 40;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v17, v18, v16, buf, v19);
      }
    }
  }

- (PBSEARCConfigurating)eARCConfigurator
{
  return (PBSEARCConfigurating *)objc_loadWeakRetained((id *)&self->_lock_eARCConfigurator);
}

- (PBSExternalControlSystem)externalControlSystem
{
  return (PBSExternalControlSystem *)objc_loadWeakRetained((id *)&self->_lock_externalControlSystem);
}

- (NSString)notificationName
{
  return self->_notificationName;
}

- (BSInvalidatable)stateCaptureHandle
{
  return self->_stateCaptureHandle;
}

- (void).cxx_destruct
{
}

@end