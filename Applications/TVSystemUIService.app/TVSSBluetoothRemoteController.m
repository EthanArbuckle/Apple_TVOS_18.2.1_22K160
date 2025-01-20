@interface TVSSBluetoothRemoteController
- (TVSBluetoothRemoteInfo)currentRemoteInfo;
- (TVSSBluetoothDevice)currentRemote;
- (TVSSBluetoothRemoteController)init;
- (TVSSBluetoothRemoteController)initWithBluetoothRemoteManager:(id)a3;
- (id)description;
- (void)_updateCurrentRemote;
- (void)addObserver:(id)a3;
- (void)bluetoothRemoteManagerDidUpdate:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation TVSSBluetoothRemoteController

- (TVSSBluetoothRemoteController)init
{
  v6 = self;
  v4 = +[TVSSBluetoothRemoteManager sharedInstance](&OBJC_CLASS___TVSSBluetoothRemoteManager, "sharedInstance");
  v6 = 0LL;
  v6 = -[TVSSBluetoothRemoteController initWithBluetoothRemoteManager:](self, "initWithBluetoothRemoteManager:");
  v5 = v6;

  objc_storeStrong((id *)&v6, 0LL);
  return v5;
}

- (TVSSBluetoothRemoteController)initWithBluetoothRemoteManager:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v10;
  v10 = 0LL;
  v8.receiver = v3;
  v8.super_class = (Class)&OBJC_CLASS___TVSSBluetoothRemoteController;
  v10 = -[TVSSBluetoothRemoteController init](&v8, "init");
  objc_storeStrong((id *)&v10, v10);
  if (v10)
  {
    objc_storeStrong((id *)&v10->_manager, location[0]);
    -[TVSSBluetoothRemoteManaging setDelegate:](v10->_manager, "setDelegate:", v10);
    v4 = objc_alloc_init(&OBJC_CLASS___TVSObserverSet);
    observers = v10->_observers;
    v10->_observers = v4;

    -[TVSSBluetoothRemoteController _updateCurrentRemote](v10, "_updateCurrentRemote");
  }

  v7 = v10;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v10, 0LL);
  return v7;
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
      v3 = (objc_class *)objc_opt_class(v17);
      objc_super v8 = NSStringFromClass(v3);
      v10 = v8;
      sub_10000583C( (uint64_t)v18,  (uint64_t)v5,  (uint64_t)v10,  (uint64_t)v17,  (uint64_t)@"TVSSBluetoothRemoteController.m",  159,  (uint64_t)v14);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v18,  0x3Au);

      objc_storeStrong((id *)&v10, 0LL);
      objc_storeStrong((id *)&v11, 0LL);
    }

    objc_storeStrong(&v13, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v14, "UTF8String"));
    __break(0);
    JUMPOUT(0x1000BC1D8LL);
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
      v3 = (objc_class *)objc_opt_class(v16);
      v7 = NSStringFromClass(v3);
      v9 = v7;
      sub_10000583C( (uint64_t)v17,  (uint64_t)v4,  (uint64_t)v9,  (uint64_t)v16,  (uint64_t)@"TVSSBluetoothRemoteController.m",  166,  (uint64_t)v13);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v17,  0x3Au);

      objc_storeStrong((id *)&v9, 0LL);
      objc_storeStrong((id *)&v10, 0LL);
    }

    objc_storeStrong(&v12, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v13, "UTF8String"));
    __break(0);
    JUMPOUT(0x1000BC438LL);
  }

  -[TVSObserverSet removeObserver:](v16->_observers, "removeObserver:", location);
  objc_storeStrong(&location, 0LL);
}

- (TVSBluetoothRemoteInfo)currentRemoteInfo
{
  return (TVSBluetoothRemoteInfo *)-[TVSSBluetoothRemoteManaging connectedBluetoothRemote]( self->_manager,  "connectedBluetoothRemote",  a2,  self);
}

- (void)bluetoothRemoteManagerDidUpdate:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)BluetoothRemoteControllerLog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100014A50((uint64_t)v6, (uint64_t)"-[TVSSBluetoothRemoteController bluetoothRemoteManagerDidUpdate:]");
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s: Will update remote.", v6, 0xCu);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  -[TVSSBluetoothRemoteController _updateCurrentRemote](v5, "_updateCurrentRemote");
  objc_storeStrong(location, 0LL);
}

- (id)description
{
  v6 = self;
  v5[1] = (id)a2;
  v5[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  id v2 = [v5[0] appendObject:v6->_currentRemote withName:@"currentRemote"];
  id v4 = [v5[0] build];
  objc_storeStrong(v5, 0LL);
  return v4;
}

- (void)_updateCurrentRemote
{
  v19 = self;
  v18[1] = (id)a2;
  v18[0] = 0LL;
  id v17 = -[TVSSBluetoothRemoteManaging connectedBluetoothRemote](self->_manager, "connectedBluetoothRemote");
  if (v17)
  {
    uint64_t v16 = 1LL;
    v5 = objc_alloc(&OBJC_CLASS___TVSSBluetoothDevice);
    id v6 = [v17 identifier];
    id v2 = -[TVSSBluetoothDevice initWithIdentifier:name:type:connectionState:batteryLevel:flags:]( v5,  "initWithIdentifier:name:type:connectionState:batteryLevel:flags:",  v6,  0,  1,  2,  [v17 batteryLevel],  v16);
    id v3 = v18[0];
    v18[0] = v2;
  }

  if ((BSEqualObjects(v19->_currentRemote, v18[0]) & 1) == 0)
  {
    objc_storeStrong((id *)&v19->_currentRemote, v18[0]);
    id location = BluetoothRemoteControllerLog();
    os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      sub_100016200( (uint64_t)v20,  (uint64_t)"-[TVSSBluetoothRemoteController _updateCurrentRemote]",  (uint64_t)v19->_currentRemote);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)location,  v14,  "%s: Updated current remote. Will notify observers. currentRemote=%{public}@",  v20,  0x16u);
    }

    objc_storeStrong(&location, 0LL);
    observers = v19->_observers;
    v7 = _NSConcreteStackBlock;
    int v8 = -1073741824;
    int v9 = 0;
    v10 = sub_1000BC954;
    char v11 = &unk_1001B9E40;
    id v12 = v19;
    id v13 = v18[0];
    -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", &v7);
    objc_storeStrong(&v13, 0LL);
    objc_storeStrong((id *)&v12, 0LL);
  }

  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(v18, 0LL);
}

- (TVSSBluetoothDevice)currentRemote
{
  return self->_currentRemote;
}

- (void).cxx_destruct
{
}

@end