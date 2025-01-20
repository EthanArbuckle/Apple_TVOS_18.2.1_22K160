@interface TVSSDoNotDisturbController
- (BOOL)contentIsSelected;
- (BOOL)isEnabled;
- (NSString)contentTitle;
- (NSString)description;
- (NSUserDefaults)_userDefaults;
- (TVSSDoNotDisturbController)init;
- (TVSSDoNotDisturbController)initWithUserDefaults:(id)a3;
- (UIImage)contentImage;
- (void)_updateStateWithReason:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeObserver:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation TVSSDoNotDisturbController

- (NSString)contentTitle
{
  v3 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  v4 =  -[NSBundle localizedStringForKey:value:table:]( v3,  "localizedStringForKey:value:table:",  @"TVSSDoNotDisturbTitle",  &stru_1001BDAC8,  0LL);

  return v4;
}

- (UIImage)contentImage
{
  return (UIImage *)+[UIImage systemImageNamed:]( &OBJC_CLASS___UIImage,  "systemImageNamed:",  @"moon.circle.fill",  a2,  self);
}

- (BOOL)contentIsSelected
{
  return -[TVSSDoNotDisturbController isEnabled](self, "isEnabled", a2, self);
}

- (TVSSDoNotDisturbController)init
{
  v6 = self;
  v4 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  v6 = 0LL;
  v6 = -[TVSSDoNotDisturbController initWithUserDefaults:](self, "initWithUserDefaults:");
  v5 = v6;

  objc_storeStrong((id *)&v6, 0LL);
  return v5;
}

- (TVSSDoNotDisturbController)initWithUserDefaults:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v10;
  v10 = 0LL;
  v8.receiver = v3;
  v8.super_class = (Class)&OBJC_CLASS___TVSSDoNotDisturbController;
  v10 = -[TVSSDoNotDisturbController init](&v8, "init");
  objc_storeStrong((id *)&v10, v10);
  if (v10)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___TVSObserverSet);
    observers = v10->_observers;
    v10->_observers = v4;

    objc_storeStrong((id *)&v10->_userDefaults, location[0]);
    -[NSUserDefaults addObserver:forKeyPath:options:context:]( v10->_userDefaults,  "addObserver:forKeyPath:options:context:",  v10,  @"DoNotDisturbEnabled",  1LL,  off_100220A20);
    -[TVSSDoNotDisturbController _updateStateWithReason:](v10, "_updateStateWithReason:", @"Initial update");
  }

  v7 = v10;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v10, 0LL);
  return v7;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[NSUserDefaults removeObserver:forKeyPath:context:]( self->_userDefaults,  "removeObserver:forKeyPath:context:",  self,  @"DoNotDisturbEnabled",  off_100220A20);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSDoNotDisturbController;
  -[TVSSDoNotDisturbController dealloc](&v2, "dealloc");
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", a3, @"DoNotDisturbEnabled");
    -[TVSSDoNotDisturbController _updateStateWithReason:]( self,  "_updateStateWithReason:",  @"Value manually changed");
  }

- (void)addObserver:(id)a3
{
  v17 = self;
  SEL v16 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  if (!location)
  {
    v14 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"observer");
    id v13 = &_os_log_default;
    char v12 = 16;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v13;
      os_log_type_t type = v12;
      v9 = NSStringFromSelector(v16);
      v5 = v9;
      v11 = v5;
      SEL v3 = (objc_class *)objc_opt_class(v17);
      objc_super v8 = NSStringFromClass(v3);
      v10 = v8;
      sub_10000583C( (uint64_t)v18,  (uint64_t)v5,  (uint64_t)v10,  (uint64_t)v17,  (uint64_t)@"TVSSDoNotDisturbController.m",  68,  (uint64_t)v14);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v18,  0x3Au);

      objc_storeStrong((id *)&v10, 0LL);
      objc_storeStrong((id *)&v11, 0LL);
    }

    objc_storeStrong(&v13, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v14, "UTF8String"));
    __break(0);
    JUMPOUT(0x1000EE26CLL);
  }

  id v4 = -[TVSObserverSet addObserver:](v17->_observers, "addObserver:", location);
  objc_storeStrong(&location, 0LL);
}

- (void)removeObserver:(id)a3
{
  SEL v16 = self;
  SEL v15 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  if (!location)
  {
    id v13 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"observer");
    id v12 = &_os_log_default;
    char v11 = 16;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v12;
      os_log_type_t type = v11;
      objc_super v8 = NSStringFromSelector(v15);
      id v4 = v8;
      v10 = v4;
      SEL v3 = (objc_class *)objc_opt_class(v16);
      v7 = NSStringFromClass(v3);
      v9 = v7;
      sub_10000583C( (uint64_t)v17,  (uint64_t)v4,  (uint64_t)v9,  (uint64_t)v16,  (uint64_t)@"TVSSDoNotDisturbController.m",  75,  (uint64_t)v13);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v17,  0x3Au);

      objc_storeStrong((id *)&v9, 0LL);
      objc_storeStrong((id *)&v10, 0LL);
    }

    objc_storeStrong(&v12, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v13, "UTF8String"));
    __break(0);
    JUMPOUT(0x1000EE4CCLL);
  }

  -[TVSObserverSet removeObserver:](v16->_observers, "removeObserver:", location);
  objc_storeStrong(&location, 0LL);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v27 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v25 = 0LL;
  objc_storeStrong(&v25, a4);
  id v24 = 0LL;
  objc_storeStrong(&v24, a5);
  v23 = a6;
  if (!+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    id v22 = DoNotDisturbControllerLog();
    char v21 = 17;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_FAULT))
    {
      log = (os_log_s *)v22;
      os_log_type_t type = v21;
      v6 = (objc_class *)objc_opt_class(v25);
      v9 = NSStringFromClass(v6);
      v20 = v9;
      sub_10002F860((uint64_t)v28, (uint64_t)v20, (uint64_t)location[0]);
      _os_log_fault_impl( (void *)&_mh_execute_header,  log,  type,  "DND KVO called outside of the main thread. ObservedObject: %{public}@, Keypath: %{public}@",  v28,  0x16u);

      objc_storeStrong((id *)&v20, 0LL);
    }

    objc_storeStrong(&v22, 0LL);
  }

  if (v23 == off_100220A20)
  {
    v14 = _NSConcreteStackBlock;
    int v15 = -1073741824;
    int v16 = 0;
    v17 = sub_1000EE7AC;
    v18 = &unk_1001B5A60;
    v19 = v27;
    BSDispatchMain(&v14);
    objc_storeStrong((id *)&v19, 0LL);
  }

  else
  {
    v13.receiver = v27;
    v13.super_class = (Class)&OBJC_CLASS___TVSSDoNotDisturbController;
    -[TVSSDoNotDisturbController observeValueForKeyPath:ofObject:change:context:]( &v13,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v25,  v24,  v23);
  }

  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(&v25, 0LL);
  objc_storeStrong(location, 0LL);
}

- (NSString)description
{
  v6 = self;
  v5[1] = (id)a2;
  v5[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  id v2 = [v5[0] appendBool:v6->_enabled withName:@"enabled"];
  id v4 = [v5[0] build];
  objc_storeStrong(v5, 0LL);
  return (NSString *)v4;
}

- (NSUserDefaults)_userDefaults
{
  return self->_userDefaults;
}

- (void)_updateStateWithReason:(id)a3
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v15 = DoNotDisturbControllerLog();
  os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
  {
    sub_10003CBFC( (uint64_t)v20,  (uint64_t)"-[TVSSDoNotDisturbController _updateStateWithReason:]",  (uint64_t)location[0],  v17->_enabled);
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v15,  v14,  "%s: Starting to updating state with reason '%{public}@'. enabled=%{BOOL}d",  v20,  0x1Cu);
  }

  objc_storeStrong(&v15, 0LL);
  char v13 = -[NSUserDefaults BOOLForKey:](v17->_userDefaults, "BOOLForKey:", @"DoNotDisturbEnabled");
  if (v17->_enabled == v13)
  {
    os_log_t oslog = (os_log_t)DoNotDisturbControllerLog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_100074CCC((uint64_t)v18, (uint64_t)"-[TVSSDoNotDisturbController _updateStateWithReason:]", v17->_enabled);
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "%s: Enabled state has not been changed. active=%{BOOL}d",  v18,  0x12u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

  else
  {
    v17->_enabled = v13 & 1;
    id v12 = DoNotDisturbControllerLog();
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      sub_100074CCC((uint64_t)v19, (uint64_t)"-[TVSSDoNotDisturbController _updateStateWithReason:]", v17->_enabled);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  v11,  "%s: Updated enabled state. Will notify observers. enabled=%{BOOL}d",  v19,  0x12u);
    }

    objc_storeStrong(&v12, 0LL);
    observers = v17->_observers;
    v5 = _NSConcreteStackBlock;
    int v6 = -1073741824;
    int v7 = 0;
    objc_super v8 = sub_1000EEBA4;
    v9 = &unk_1001BA960;
    v10 = v17;
    -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", &v5);
    objc_storeStrong((id *)&v10, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
}

@end