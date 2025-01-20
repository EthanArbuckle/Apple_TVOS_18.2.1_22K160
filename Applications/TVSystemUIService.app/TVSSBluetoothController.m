@interface TVSSBluetoothController
+ (id)_deviceLookupDictionaryFromDevices:(id)a3;
+ (id)_deviceSortDescriptors;
+ (id)_sortedDevices:(id)a3;
- (BOOL)contentIsSelected;
- (NSArray)connectedPairedDevices;
- (NSArray)pairableDevices;
- (NSArray)pairedDevices;
- (NSString)contentTitle;
- (TVPSBluetoothDeviceManaging)bluetoothManager;
- (TVSSBluetoothController)initWithConfiguration:(id)a3;
- (TVSSBluetoothController)initWithConfiguration:(id)a3 bluetoothManagerProvider:(id)a4;
- (TVSSBluetoothControllerConfiguration)configuration;
- (UIImage)contentImage;
- (id)deviceForIdentifier:(id)a3;
- (void)_updateDiscoveringPairableDevices;
- (void)_updatePairableDevicesAndNotify:(BOOL)a3;
- (void)_updatePairedDevices;
- (void)addPairableDevicesObserver:(id)a3;
- (void)addPairedDevicesObserver:(id)a3;
- (void)bluetoothDeviceManager:(id)a3 didUpdatePairableDevices:(id)a4;
- (void)bluetoothDeviceManager:(id)a3 didUpdatePairedDevices:(id)a4;
- (void)connectDeviceWithIdentifier:(id)a3 withCompletion:(id)a4;
- (void)dealloc;
- (void)disconnectDeviceWithIdentifier:(id)a3 withCompletion:(id)a4;
- (void)removePairableDevicesObserver:(id)a3;
- (void)removePairedDevicesObserver:(id)a3;
- (void)unpairDeviceWithIdentifier:(id)a3 withCompletion:(id)a4;
@end

@implementation TVSSBluetoothController

- (NSString)contentTitle
{
  v3 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  v4 =  -[NSBundle localizedStringForKey:value:table:]( v3,  "localizedStringForKey:value:table:",  @"TVSSGameControllersTitle",  &stru_1001BDAC8,  0LL);

  return v4;
}

- (UIImage)contentImage
{
  return (UIImage *)+[UIImage systemImageNamed:]( &OBJC_CLASS___UIImage,  "systemImageNamed:",  @"gamecontroller.fill",  a2,  self);
}

- (BOOL)contentIsSelected
{
  v3 = -[TVSSBluetoothController connectedPairedDevices](self, "connectedPairedDevices");
  BOOL v4 = -[NSArray count](v3, "count") != 0;

  return v4;
}

- (TVSSBluetoothController)initWithConfiguration:(id)a3 bluetoothManagerProvider:(id)a4
{
  v54 = self;
  SEL v53 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v51 = 0LL;
  objc_storeStrong(&v51, a4);
  id v50 = location;
  id v49 = 0LL;
  Class v48 = NSClassFromString(@"TVSSBluetoothControllerConfiguration");
  if (!v50)
  {
    id v47 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil");
    os_log_t oslog = &_os_log_default;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v28 = type;
      v30 = NSStringFromSelector(v53);
      v26 = v30;
      v44 = v26;
      BOOL v4 = (objc_class *)objc_opt_class(v54);
      v29 = NSStringFromClass(v4);
      v43 = v29;
      sub_10000583C( (uint64_t)v57,  (uint64_t)v26,  (uint64_t)v43,  (uint64_t)v54,  (uint64_t)@"TVSSBluetoothController.m",  125,  (uint64_t)v47);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  v28,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v57,  0x3Au);

      objc_storeStrong((id *)&v43, 0LL);
      objc_storeStrong((id *)&v44, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    _bs_set_crash_log_message([v47 UTF8String]);
    __break(0);
    JUMPOUT(0x1000F4458LL);
  }

  if (((objc_opt_isKindOfClass(v50, v48) ^ 1) & 1) != 0)
  {
    id v42 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:TVSSBluetoothControllerConfigurationClass]");
    os_log_t v41 = &_os_log_default;
    os_log_type_t v40 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v22 = v41;
      os_log_type_t v23 = v40;
      v25 = NSStringFromSelector(v53);
      v21 = v25;
      v39 = v21;
      v5 = (objc_class *)objc_opt_class(v54);
      v24 = NSStringFromClass(v5);
      v38 = v24;
      sub_10000583C( (uint64_t)v56,  (uint64_t)v21,  (uint64_t)v38,  (uint64_t)v54,  (uint64_t)@"TVSSBluetoothController.m",  125,  (uint64_t)v42);
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  v23,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v56,  0x3Au);

      objc_storeStrong((id *)&v38, 0LL);
      objc_storeStrong((id *)&v39, 0LL);
    }

    objc_storeStrong((id *)&v41, 0LL);
    _bs_set_crash_log_message([v42 UTF8String]);
    __break(0);
    JUMPOUT(0x1000F4610LL);
  }

  objc_storeStrong(&v49, 0LL);
  objc_storeStrong(&v50, 0LL);
  if (!v51)
  {
    id v37 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"bluetoothManagerProvider");
    os_log_t v36 = &_os_log_default;
    os_log_type_t v35 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v17 = v36;
      os_log_type_t v18 = v35;
      v20 = NSStringFromSelector(v53);
      v16 = v20;
      v34 = v16;
      v6 = (objc_class *)objc_opt_class(v54);
      v19 = NSStringFromClass(v6);
      v33 = v19;
      sub_10000583C( (uint64_t)v55,  (uint64_t)v16,  (uint64_t)v33,  (uint64_t)v54,  (uint64_t)@"TVSSBluetoothController.m",  126,  (uint64_t)v37);
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  v18,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v55,  0x3Au);

      objc_storeStrong((id *)&v33, 0LL);
      objc_storeStrong((id *)&v34, 0LL);
    }

    objc_storeStrong((id *)&v36, 0LL);
    _bs_set_crash_log_message([v37 UTF8String]);
    __break(0);
    JUMPOUT(0x1000F47E8LL);
  }

  v7 = v54;
  v54 = 0LL;
  v32.receiver = v7;
  v32.super_class = (Class)&OBJC_CLASS___TVSSBluetoothController;
  v54 = -[TVSSBluetoothController init](&v32, "init");
  objc_storeStrong((id *)&v54, v54);
  if (v54)
  {
    objc_storeStrong((id *)&v54->_configuration, location);
    v8 = (TVPSBluetoothDeviceManaging *)objc_retainAutoreleasedReturnValue((id)(*((uint64_t (**)(id, TVSSBluetoothControllerConfiguration *))v51
                                                                                + 2))( v51,  v54->_configuration));
    bluetoothManager = v54->_bluetoothManager;
    v54->_bluetoothManager = v8;

    -[TVPSBluetoothDeviceManaging addPairedDevicesObserver:](v54->_bluetoothManager, "addPairedDevicesObserver:", v54);
    objc_storeStrong((id *)&v54->_pairedDevices, &__NSArray0__struct);
    objc_storeStrong((id *)&v54->_pairedDeviceByIdentifier, &__NSDictionary0__struct);
    v10 = objc_alloc_init(&OBJC_CLASS___TVSObserverSet);
    pairedDeviceObservers = v54->_pairedDeviceObservers;
    v54->_pairedDeviceObservers = v10;

    -[TVSSBluetoothController _updatePairedDevices](v54, "_updatePairedDevices");
    objc_storeStrong((id *)&v54->_pairableDevices, &__NSArray0__struct);
    objc_storeStrong((id *)&v54->_pairableDeviceByIdentifier, &__NSDictionary0__struct);
    v12 = objc_alloc_init(&OBJC_CLASS___TVSObserverSet);
    pairableDeviceObservers = v54->_pairableDeviceObservers;
    v54->_pairableDeviceObservers = v12;
  }

  v15 = v54;
  objc_storeStrong(&v51, 0LL);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v54, 0LL);
  return v15;
}

- (TVSSBluetoothController)initWithConfiguration:(id)a3
{
  v15 = self;
  SEL v14 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  v5 = v15;
  id v4 = location;
  v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  v10 = sub_1000F4AD0;
  v11 = &unk_1001BAB10;
  v12[1] = (id)v14;
  v12[0] = v15;
  v15 = 0LL;
  v15 = -[TVSSBluetoothController initWithConfiguration:bluetoothManagerProvider:]( v5,  "initWithConfiguration:bluetoothManagerProvider:",  v4);
  v6 = v15;
  objc_storeStrong(v12, 0LL);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v15, 0LL);
  return v6;
}

- (void)dealloc
{
  id v4 = self;
  SEL v3 = a2;
  -[TVPSBluetoothDeviceManaging removePairedDevicesObserver:]( self->_bluetoothManager,  "removePairedDevicesObserver:",  self);
  -[TVPSBluetoothDeviceManaging removePairableDevicesObserver:]( v4->_bluetoothManager,  "removePairableDevicesObserver:",  v4);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSBluetoothController;
  -[TVSSBluetoothController dealloc](&v2, "dealloc");
}

- (NSArray)connectedPairedDevices
{
  return (NSArray *)-[NSArray bs_filter:](self->_pairedDevices, "bs_filter:", &stru_1001BAB50, a2, self);
}

- (void)addPairedDevicesObserver:(id)a3
{
  v17 = self;
  SEL v16 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  if (!location)
  {
    SEL v14 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"observer");
    id v13 = &_os_log_default;
    char v12 = 16;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v13;
      os_log_type_t type = v12;
      int v9 = NSStringFromSelector(v16);
      v5 = v9;
      v11 = v5;
      SEL v3 = (objc_class *)objc_opt_class(v17);
      int v8 = NSStringFromClass(v3);
      v10 = v8;
      sub_10000583C( (uint64_t)v18,  (uint64_t)v5,  (uint64_t)v10,  (uint64_t)v17,  (uint64_t)@"TVSSBluetoothController.m",  180,  (uint64_t)v14);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v18,  0x3Au);

      objc_storeStrong((id *)&v10, 0LL);
      objc_storeStrong((id *)&v11, 0LL);
    }

    objc_storeStrong(&v13, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v14, "UTF8String"));
    __break(0);
    JUMPOUT(0x1000F50B0LL);
  }

  id v4 = -[TVSObserverSet addObserver:](v17->_pairedDeviceObservers, "addObserver:", location);
  objc_storeStrong(&location, 0LL);
}

- (void)removePairedDevicesObserver:(id)a3
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
      int v8 = NSStringFromSelector(v15);
      id v4 = v8;
      v10 = v4;
      SEL v3 = (objc_class *)objc_opt_class(v16);
      v7 = NSStringFromClass(v3);
      int v9 = v7;
      sub_10000583C( (uint64_t)v17,  (uint64_t)v4,  (uint64_t)v9,  (uint64_t)v16,  (uint64_t)@"TVSSBluetoothController.m",  187,  (uint64_t)v13);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v17,  0x3Au);

      objc_storeStrong((id *)&v9, 0LL);
      objc_storeStrong((id *)&v10, 0LL);
    }

    objc_storeStrong(&v12, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v13, "UTF8String"));
    __break(0);
    JUMPOUT(0x1000F5310LL);
  }

  -[TVSObserverSet removeObserver:](v16->_pairedDeviceObservers, "removeObserver:", location);
  objc_storeStrong(&location, 0LL);
}

- (void)addPairableDevicesObserver:(id)a3
{
  v17 = self;
  SEL v16 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  if (!location)
  {
    SEL v14 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"observer");
    id v13 = &_os_log_default;
    char v12 = 16;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v13;
      os_log_type_t type = v12;
      int v9 = NSStringFromSelector(v16);
      v5 = v9;
      char v11 = v5;
      SEL v3 = (objc_class *)objc_opt_class(v17);
      int v8 = NSStringFromClass(v3);
      v10 = v8;
      sub_10000583C( (uint64_t)v18,  (uint64_t)v5,  (uint64_t)v10,  (uint64_t)v17,  (uint64_t)@"TVSSBluetoothController.m",  194,  (uint64_t)v14);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v18,  0x3Au);

      objc_storeStrong((id *)&v10, 0LL);
      objc_storeStrong((id *)&v11, 0LL);
    }

    objc_storeStrong(&v13, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v14, "UTF8String"));
    __break(0);
    JUMPOUT(0x1000F5568LL);
  }

  id v4 = -[TVSObserverSet addObserver:](v17->_pairableDeviceObservers, "addObserver:", location);
  -[TVSSBluetoothController _updateDiscoveringPairableDevices](v17, "_updateDiscoveringPairableDevices");
  objc_storeStrong(&location, 0LL);
}

- (void)removePairableDevicesObserver:(id)a3
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
      int v8 = NSStringFromSelector(v15);
      id v4 = v8;
      v10 = v4;
      SEL v3 = (objc_class *)objc_opt_class(v16);
      v7 = NSStringFromClass(v3);
      int v9 = v7;
      sub_10000583C( (uint64_t)v17,  (uint64_t)v4,  (uint64_t)v9,  (uint64_t)v16,  (uint64_t)@"TVSSBluetoothController.m",  202,  (uint64_t)v13);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v17,  0x3Au);

      objc_storeStrong((id *)&v9, 0LL);
      objc_storeStrong((id *)&v10, 0LL);
    }

    objc_storeStrong(&v12, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v13, "UTF8String"));
    __break(0);
    JUMPOUT(0x1000F57D4LL);
  }

  -[TVSObserverSet removeObserver:](v16->_pairableDeviceObservers, "removeObserver:", location);
  -[TVSSBluetoothController _updateDiscoveringPairableDevices](v16, "_updateDiscoveringPairableDevices");
  objc_storeStrong(&location, 0LL);
}

- (id)deviceForIdentifier:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = -[NSDictionary objectForKey:](v7->_pairedDeviceByIdentifier, "objectForKey:", location[0]);
  if (!v5)
  {
    id v5 = -[NSDictionary objectForKey:](v7->_pairableDeviceByIdentifier, "objectForKey:", location[0]);
  }

  id v4 = v5;
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (void)connectDeviceWithIdentifier:(id)a3 withCompletion:(id)a4
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = 0LL;
  objc_storeStrong(&v8, a4);
  id v7 =  -[TVPSBluetoothDeviceManaging deviceForUniqueIdentifier:]( v10->_bluetoothManager,  "deviceForUniqueIdentifier:",  location[0]);
  if (v7)
  {
    -[TVPSBluetoothDeviceManaging connectDevice:withCompletionHandler:]( v10->_bluetoothManager,  "connectDevice:withCompletionHandler:",  v7,  v8);
  }

  else if (v8)
  {
    id v4 = (void (**)(void))v8;
    id v5 =  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.TVSSBluetoothControllerErrorDomain",  0LL,  0LL);
    v4[2]();
  }

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)disconnectDeviceWithIdentifier:(id)a3 withCompletion:(id)a4
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = 0LL;
  objc_storeStrong(&v8, a4);
  id v7 =  -[TVPSBluetoothDeviceManaging deviceForUniqueIdentifier:]( v10->_bluetoothManager,  "deviceForUniqueIdentifier:",  location[0]);
  if (v7)
  {
    -[TVPSBluetoothDeviceManaging disconnectDevice:withCompletionHandler:]( v10->_bluetoothManager,  "disconnectDevice:withCompletionHandler:",  v7,  v8);
  }

  else if (v8)
  {
    id v4 = (void (**)(void))v8;
    id v5 =  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.TVSSBluetoothControllerErrorDomain",  0LL,  0LL);
    v4[2]();
  }

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)unpairDeviceWithIdentifier:(id)a3 withCompletion:(id)a4
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = 0LL;
  objc_storeStrong(&v8, a4);
  id v7 =  -[TVPSBluetoothDeviceManaging deviceForUniqueIdentifier:]( v10->_bluetoothManager,  "deviceForUniqueIdentifier:",  location[0]);
  if (v7)
  {
    -[TVPSBluetoothDeviceManaging unpairDevice:withCompletionHandler:]( v10->_bluetoothManager,  "unpairDevice:withCompletionHandler:",  v7,  v8);
  }

  else if (v8)
  {
    id v4 = (void (**)(void))v8;
    id v5 =  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.TVSSBluetoothControllerErrorDomain",  0LL,  0LL);
    v4[2]();
  }

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)bluetoothDeviceManager:(id)a3 didUpdatePairableDevices:(id)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)bluetoothDeviceManager:(id)a3 didUpdatePairedDevices:(id)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_updateDiscoveringPairableDevices
{
  SEL v15 = self;
  SEL v14 = a2;
  uint64_t v9 = 0LL;
  v10 = &v9;
  int v11 = 0x20000000;
  int v12 = 32;
  char v13 = 0;
  pairableDeviceObservers = self->_pairableDeviceObservers;
  SEL v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  v6 = sub_1000F5F88;
  id v7 = &unk_1001BAB78;
  id v8 = &v9;
  -[TVSObserverSet enumerateObserversUsingBlock:](pairableDeviceObservers, "enumerateObserversUsingBlock:", &v3);
  if ((v10[3] & 1) != v15->_isDiscoveringPairableDevices)
  {
    if ((v10[3] & 1) != 0)
    {
      -[TVPSBluetoothDeviceManaging addPairableDevicesObserver:]( v15->_bluetoothManager,  "addPairableDevicesObserver:",  v15);
      v15->_isDiscoveringPairableDevices = 1;
    }

    else
    {
      -[TVPSBluetoothDeviceManaging removePairableDevicesObserver:]( v15->_bluetoothManager,  "removePairableDevicesObserver:",  v15);
      v15->_isDiscoveringPairableDevices = 0;
    }

    -[TVSSBluetoothController _updatePairableDevicesAndNotify:](v15, "_updatePairableDevicesAndNotify:", 0LL);
  }

  _Block_object_dispose(&v9, 8);
}

- (void)_updatePairedDevices
{
  SEL v16 = self;
  v15[1] = (id)a2;
  v15[0] = -[TVPSBluetoothDeviceManaging pairedDevices](self->_bluetoothManager, "pairedDevices");
  objc_super v2 = (void *)objc_opt_class(v16);
  SEL v3 = (NSArray *)[v2 _sortedDevices:v15[0]];
  pairedDevices = v16->_pairedDevices;
  v16->_pairedDevices = v3;

  int v5 = (void *)objc_opt_class(v16);
  v6 = (NSDictionary *)[v5 _deviceLookupDictionaryFromDevices:v16->_pairedDevices];
  pairedDeviceByIdentifier = v16->_pairedDeviceByIdentifier;
  v16->_pairedDeviceByIdentifier = v6;

  pairedDeviceObservers = v16->_pairedDeviceObservers;
  uint64_t v9 = _NSConcreteStackBlock;
  int v10 = -1073741824;
  int v11 = 0;
  int v12 = sub_1000F6178;
  char v13 = &unk_1001BABA0;
  SEL v14 = v16;
  -[TVSObserverSet enumerateObserversUsingBlock:](pairedDeviceObservers, "enumerateObserversUsingBlock:");
  objc_storeStrong((id *)&v14, 0LL);
  objc_storeStrong(v15, 0LL);
}

- (void)_updatePairableDevicesAndNotify:(BOOL)a3
{
  os_log_type_t v23 = self;
  SEL v22 = a2;
  BOOL v21 = a3;
  BOOL isDiscoveringPairableDevices = self->_isDiscoveringPairableDevices;
  char v18 = 0;
  char v16 = 0;
  if (isDiscoveringPairableDevices)
  {
    id v19 = -[TVPSBluetoothDeviceManaging pairableDevices](v23->_bluetoothManager, "pairableDevices");
    char v18 = 1;
    int v4 = (NSSet *)v19;
  }

  else
  {
    v17 = +[NSSet set](&OBJC_CLASS___NSSet, "set");
    char v16 = 1;
    int v4 = v17;
  }

  id v20 = v4;
  if ((v16 & 1) != 0) {

  }
  if ((v18 & 1) != 0) {
  int v5 = (NSArray *)[(id)objc_opt_class(v23) _sortedDevices:v20];
  }
  pairableDevices = v23->_pairableDevices;
  v23->_pairableDevices = v5;

  id v7 = (NSDictionary *) [(id)objc_opt_class(v23) _deviceLookupDictionaryFromDevices:v23->_pairableDevices];
  pairableDeviceByIdentifier = v23->_pairableDeviceByIdentifier;
  v23->_pairableDeviceByIdentifier = v7;

  if (v21)
  {
    pairableDeviceObservers = v23->_pairableDeviceObservers;
    int v10 = _NSConcreteStackBlock;
    int v11 = -1073741824;
    int v12 = 0;
    char v13 = sub_1000F642C;
    SEL v14 = &unk_1001BABC8;
    SEL v15 = v23;
    -[TVSObserverSet enumerateObserversUsingBlock:](pairableDeviceObservers, "enumerateObserversUsingBlock:", &v10);
    objc_storeStrong((id *)&v15, 0LL);
  }

  objc_storeStrong(&v20, 0LL);
}

+ (id)_deviceSortDescriptors
{
  v4[2] = a1;
  v4[1] = (id)a2;
  v4[0] =  +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:selector:",  @"name",  1LL,  "localizedCaseInsensitiveCompare:");
  id v5 = v4[0];
  SEL v3 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL);
  objc_storeStrong(v4, 0LL);
  return v3;
}

+ (id)_sortedDevices:(id)a3
{
  id v9 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = objc_msgSend(location[0], "bs_map:", &stru_1001BAC08);
  id v5 = [v7 allObjects];
  id v4 = [v9 _deviceSortDescriptors];
  id v6 = objc_msgSend(v5, "sortedArrayUsingDescriptors:");

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

+ (id)_deviceLookupDictionaryFromDevices:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  char v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  id v13 = [obj countByEnumeratingWithState:__b objects:v18 count:16];
  if (v13)
  {
    uint64_t v9 = *(void *)__b[2];
    uint64_t v10 = 0LL;
    id v11 = v13;
    while (1)
    {
      uint64_t v8 = v10;
      if (*(void *)__b[2] != v9) {
        objc_enumerationMutation(obj);
      }
      id v15 = *(id *)(__b[1] + 8 * v10);
      id v6 = v16;
      id v5 = v15;
      id v7 = [v15 identifier];
      -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v5);

      ++v10;
      if (v8 + 1 >= (unint64_t)v11)
      {
        uint64_t v10 = 0LL;
        id v11 = [obj countByEnumeratingWithState:__b objects:v18 count:16];
        if (!v11) {
          break;
        }
      }
    }
  }

  id v4 = -[NSMutableDictionary copy](v16, "copy");
  objc_storeStrong((id *)&v16, 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (TVSSBluetoothControllerConfiguration)configuration
{
  return self->_configuration;
}

- (NSArray)pairedDevices
{
  return self->_pairedDevices;
}

- (NSArray)pairableDevices
{
  return self->_pairableDevices;
}

- (TVPSBluetoothDeviceManaging)bluetoothManager
{
  return self->_bluetoothManager;
}

- (void).cxx_destruct
{
}

@end