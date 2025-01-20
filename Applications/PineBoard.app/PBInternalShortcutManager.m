@interface PBInternalShortcutManager
+ (PBDependencyDescription)dependencyDescription;
+ (id)sharedInstance;
- (BOOL)isEnabled;
- (NSMutableDictionary)handlers;
- (PBInternalShortcutManager)init;
- (PBSystemGestureHandle)executeShortcutGesture;
- (int64_t)currentOption;
- (void)_updateSystemGestureWithManager:(id)a3;
- (void)dealloc;
- (void)executeShortcut;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)registerWithOption:(int64_t)a3 handler:(id)a4;
- (void)setHandlers:(id)a3;
@end

@implementation PBInternalShortcutManager

+ (PBDependencyDescription)dependencyDescription
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000A7520;
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
  block[2] = sub_1000A75B8;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_1004708F8 != -1) {
    dispatch_once(&qword_1004708F8, block);
  }
  return (id)qword_1004708F0;
}

- (PBInternalShortcutManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBInternalShortcutManager;
  v2 = -[PBInternalShortcutManager init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000A76BC;
    v7[3] = &unk_1003D0FA8;
    v4 = v2;
    v8 = v4;
    +[PBDependencyCoordinator registerInstance:dependencyBlock:]( &OBJC_CLASS___PBDependencyCoordinator,  "registerInstance:dependencyBlock:",  v4,  v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v5 addObserver:v4 forKeyPath:@"InternalShortcutOption" options:0 context:&off_1003D4BC8];
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v3 removeObserver:self forKeyPath:@"InternalShortcutOption"];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBInternalShortcutManager;
  -[PBInternalShortcutManager dealloc](&v4, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &off_1003D4BC8)
  {
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A784C;
    block[3] = &unk_1003D0890;
    objc_copyWeak(&v8, &location);
    dispatch_async(&_dispatch_main_q, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___PBInternalShortcutManager;
    -[PBInternalShortcutManager observeValueForKeyPath:ofObject:change:context:]( &v6,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (BOOL)isEnabled
{
  return -[PBInternalShortcutManager currentOption](self, "currentOption") > 0;
}

- (int64_t)currentOption
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v3 = [v2 integerForKey:@"InternalShortcutOption"];

  else {
    return 0LL;
  }
}

- (void)registerWithOption:(int64_t)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = sub_1000F703C();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134217984;
    int64_t v15 = -[PBInternalShortcutManager currentOption](self, "currentOption");
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Registering handler for option %ld",  (uint8_t *)&v14,  0xCu);
  }

  if (!self->_handlers)
  {
    objc_super v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    handlers = self->_handlers;
    self->_handlers = v9;
  }

  id v11 = [v6 copy];
  v12 = self->_handlers;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11, v13);
}

- (void)executeShortcut
{
  if (+[TVSDevice runningAnInternalBuild](&OBJC_CLASS___TVSDevice, "runningAnInternalBuild")
    && -[PBInternalShortcutManager isEnabled](self, "isEnabled"))
  {
    id v3 = sub_1000F703C();
    objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      int64_t v11 = -[PBInternalShortcutManager currentOption](self, "currentOption");
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Toggling internal option %ld",  (uint8_t *)&v10,  0xCu);
    }

    int64_t v5 = -[PBInternalShortcutManager currentOption](self, "currentOption");
    handlers = self->_handlers;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v5));
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](handlers, "objectForKeyedSubscript:", v7));

    if (v8) {
      (*((void (**)(os_log_s *))v8 + 2))(v8);
    }
  }

  else
  {
    id v9 = sub_1000F703C();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10027A230(v8);
    }
  }
}

- (void)_updateSystemGestureWithManager:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[PBInternalShortcutManager isEnabled](self, "isEnabled");
  executeShortcutGesture = self->_executeShortcutGesture;
  if (v5)
  {
    if (!executeShortcutGesture)
    {
      objc_initWeak(&location, self);
      int v10 = _NSConcreteStackBlock;
      uint64_t v11 = 3221225472LL;
      v12 = sub_1000A7C68;
      v13 = &unk_1003D1020;
      objc_copyWeak(&v14, &location);
      id v7 = (PBSystemGestureHandle *)[v4 newHandleForSystemGesture:20 actionHandler:&v10];
      id v8 = self->_executeShortcutGesture;
      self->_executeShortcutGesture = v7;

      -[PBSystemGestureHandle acquire](self->_executeShortcutGesture, "acquire", v10, v11, v12, v13);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }

  else
  {
    -[PBSystemGestureHandle invalidate](executeShortcutGesture, "invalidate");
    id v9 = self->_executeShortcutGesture;
    self->_executeShortcutGesture = 0LL;
  }
}

- (NSMutableDictionary)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
}

- (PBSystemGestureHandle)executeShortcutGesture
{
  return self->_executeShortcutGesture;
}

- (void).cxx_destruct
{
}

@end