@interface TVSSPeripheralsMenuItemProvider
+ (BOOL)_isSupportedBluetoothDevice:(id)a3;
+ (Class)_visualContentClassForDeviceType:(int64_t)a3;
- (TVSSPeripheralsMenuItemProvider)init;
- (TVSSPeripheralsMenuItemProvider)initWithBluetoothManager:(id)a3;
- (id)_log;
- (void)_handleBluetoothManagerDidUpdateNotification:(id)a3;
- (void)_updateItemsWithReason:(id)a3;
- (void)dealloc;
@end

@implementation TVSSPeripheralsMenuItemProvider

- (TVSSPeripheralsMenuItemProvider)init
{
  v6 = self;
  v4 = +[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance");
  v6 = 0LL;
  v6 = -[TVSSPeripheralsMenuItemProvider initWithBluetoothManager:](self, "initWithBluetoothManager:");
  v5 = v6;

  objc_storeStrong((id *)&v6, 0LL);
  return v5;
}

- (TVSSPeripheralsMenuItemProvider)initWithBluetoothManager:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0LL;
  v7.receiver = v3;
  v7.super_class = (Class)&OBJC_CLASS___TVSSPeripheralsMenuItemProvider;
  v9 = -[TVSSMenuItemProvider initWithIdentifier:]( &v7,  "initWithIdentifier:",  @"com.apple.TVSystemUIService.peripherals.provider");
  objc_storeStrong((id *)&v9, v9);
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bluetoothManager, location[0]);
    v6 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v6,  "addObserver:selector:name:object:",  v9,  "_handleBluetoothManagerDidUpdateNotification:",  TVSBluetoothManagerDidUpdateNotification,  0LL);

    -[TVSSPeripheralsMenuItemProvider _updateItemsWithReason:](v9, "_updateItemsWithReason:", @"Initial update");
  }

  v5 = v9;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v9, 0LL);
  return v5;
}

- (void)dealloc
{
  v5 = self;
  SEL v4 = a2;
  v2 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:]( v2,  "removeObserver:name:object:",  v5,  TVSBluetoothManagerDidUpdateNotification,  0LL);

  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS___TVSSPeripheralsMenuItemProvider;
  -[TVSSPeripheralsMenuItemProvider dealloc](&v3, "dealloc");
}

- (void)_handleBluetoothManagerDidUpdateNotification:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_initWeak(&v9, v11);
  objc_super v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  v6 = sub_10003BF20;
  objc_super v7 = &unk_1001B75D0;
  objc_copyWeak(&v8, &v9);
  BSDispatchMain(&v3);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v9);
  objc_storeStrong(location, 0LL);
}

- (id)_log
{
  int v4 = (dispatch_once_t *)&unk_100221C38;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B75F0);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221C30;
}

+ (BOOL)_isSupportedBluetoothDevice:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  char v5 = 0;
  id v4 = [location[0] type];
  if (v4 == (id)2 || v4 == (id)4) {
    char v5 = 1;
  }
  objc_storeStrong(location, 0LL);
  return v5 & 1;
}

- (void)_updateItemsWithReason:(id)a3
{
  v51 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v49 = -[TVSSPeripheralsMenuItemProvider _log](v51, "_log");
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v49, OS_LOG_TYPE_DEFAULT))
  {
    sub_100016200( (uint64_t)v58,  (uint64_t)"-[TVSSPeripheralsMenuItemProvider _updateItemsWithReason:]",  (uint64_t)location[0]);
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v49,  type,  "%s: Starting update for reason: %{public}@",  v58,  0x16u);
  }

  objc_storeStrong(&v49, 0LL);
  id v47 = -[TVSBluetoothManager connectedDevices](v51->_bluetoothManager, "connectedDevices");
  id v3 = objc_msgSend(v47, "bs_filter:", &stru_1001B7630);
  id v4 = v47;
  id v47 = v3;

  id v16 = [v47 allObjects];
  id v46 = [v16 sortedArrayUsingComparator:&stru_1001B7670];

  id v45 = [v46 firstObject];
  v17 = -[TVSSMenuItemProvider items](v51, "items");
  id v44 = -[NSOrderedSet firstObject](v17, "firstObject");

  id v43 = v44;
  if (v45)
  {
    id v42 = -[TVSSPeripheralsMenuItemProvider _log](v51, "_log");
    os_log_type_t v41 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (os_log_s *)v42;
      os_log_type_t v13 = v41;
      id v15 = [v45 identifier];
      id v11 = v15;
      id v40 = v11;
      id v14 = (id)TVSBluetoothDeviceTypeLogString( [v45 type],  objc_msgSend(v45, "transportType"));
      id v39 = v14;
      sub_100016194( (uint64_t)v57,  (uint64_t)"-[TVSSPeripheralsMenuItemProvider _updateItemsWithReason:]",  (uint64_t)v11,  (uint64_t)v39);
      _os_log_impl( (void *)&_mh_execute_header,  v12,  v13,  "%s: We have at least one connected device of interest. mostRecentDeviceIdentifier=%{public}@, mostRecentDeviceType=%{public}@",  v57,  0x20u);

      objc_storeStrong(&v39, 0LL);
      objc_storeStrong(&v40, 0LL);
    }

    objc_storeStrong(&v42, 0LL);
    id v38 = [v45 type];
    Class v37 = (Class)[(id)objc_opt_class(v51) _visualContentClassForDeviceType:v38];
    if (v44)
    {
      id v36 = [v44 visualContent];
      if ((Class)objc_opt_class(v36) == v37)
      {
        id v35 = -[TVSSPeripheralsMenuItemProvider _log](v51, "_log");
        os_log_type_t v34 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_DEFAULT))
        {
          sub_100016200( (uint64_t)v56,  (uint64_t)"-[TVSSPeripheralsMenuItemProvider _updateItemsWithReason:]",  (uint64_t)v36);
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v35,  v34,  "%s: The current peripherals menu item already has the correct visual content. (visualContent=%{public}@)",  v56,  0x16u);
        }

        objc_storeStrong(&v35, 0LL);
      }

      else
      {
        id v33 = objc_alloc_init(v37);
        os_log_t oslog = (os_log_t)-[TVSSPeripheralsMenuItemProvider _log](v51, "_log");
        os_log_type_t v31 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          id v8 = oslog;
          os_log_type_t v9 = v31;
          id v10 = [v44 visualContent];
          id v30 = v10;
          sub_100016194( (uint64_t)v55,  (uint64_t)"-[TVSSPeripheralsMenuItemProvider _updateItemsWithReason:]",  (uint64_t)v30,  (uint64_t)v33);
          _os_log_impl( (void *)&_mh_execute_header,  v8,  v9,  "%s: Updating visual content of menu item. (existingVisualContent=%{public}@, newVisualContent=%{public}@)",  v55,  0x20u);

          objc_storeStrong(&v30, 0LL);
        }

        objc_storeStrong((id *)&oslog, 0LL);
        [v44 setVisualContent:v33];
        objc_storeStrong(&v33, 0LL);
      }

      objc_storeStrong(&v36, 0LL);
    }

    else
    {
      char v5 = -[TVSSMenuItem initWithIdentifier:]( objc_alloc(&OBJC_CLASS___TVSSMenuItem),  "initWithIdentifier:",  @"com.apple.TVSystemUIService.peripherals.item");
      id v6 = v43;
      id v43 = v5;

      id v29 = objc_alloc_init(v37);
      [v43 setVisualContent:v29];
      objc_storeStrong(&v29, 0LL);
    }
  }

  else if (v44)
  {
    os_log_t v28 = (os_log_t)-[TVSSPeripheralsMenuItemProvider _log](v51, "_log");
    os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      sub_100014A50((uint64_t)v54, (uint64_t)"-[TVSSPeripheralsMenuItemProvider _updateItemsWithReason:]");
      _os_log_impl( (void *)&_mh_execute_header,  v28,  v27,  "%s: We don't have any connected devices of interest. Will remove menu item",  v54,  0xCu);
    }

    objc_storeStrong((id *)&v28, 0LL);
    objc_storeStrong(&v43, 0LL);
  }

  char v26 = 0;
  if (v44 != v43)
  {
    os_log_t v25 = (os_log_t)-[TVSSPeripheralsMenuItemProvider _log](v51, "_log");
    os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      sub_100016194( (uint64_t)v53,  (uint64_t)"-[TVSSPeripheralsMenuItemProvider _updateItemsWithReason:]",  (uint64_t)v44,  (uint64_t)v43);
      _os_log_impl( (void *)&_mh_execute_header,  v25,  v24,  "%s: Setting new peripherals menu item. (existingItem=%{public}@, newItem=%{public}@)",  v53,  0x20u);
    }

    objc_storeStrong((id *)&v25, 0LL);
    char v21 = 0;
    char v19 = 0;
    if (v43)
    {
      id v22 = +[NSOrderedSet orderedSetWithObject:](&OBJC_CLASS___NSOrderedSet, "orderedSetWithObject:", v43);
      char v21 = 1;
      id v7 = v22;
    }

    else
    {
      id v20 = +[NSOrderedSet orderedSet](&OBJC_CLASS___NSOrderedSet, "orderedSet");
      char v19 = 1;
      id v7 = v20;
    }

    id v23 = v7;
    if ((v19 & 1) != 0) {

    }
    if ((v21 & 1) != 0) {
    -[TVSSMenuItemProvider setItems:](v51, "setItems:", v23);
    }
    char v26 = 1;
    objc_storeStrong(&v23, 0LL);
  }

  os_log_t v18 = (os_log_t)-[TVSSPeripheralsMenuItemProvider _log](v51, "_log");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    sub_10003CBFC( (uint64_t)v52,  (uint64_t)"-[TVSSPeripheralsMenuItemProvider _updateItemsWithReason:]",  (uint64_t)location[0],  v26 & 1);
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s: Finished update for reason: %{public}@. didUpdateItems=%{BOOL}d",  v52,  0x1Cu);
  }

  objc_storeStrong((id *)&v18, 0LL);
  objc_storeStrong(&v43, 0LL);
  objc_storeStrong(&v44, 0LL);
  objc_storeStrong(&v45, 0LL);
  objc_storeStrong(&v46, 0LL);
  objc_storeStrong(&v47, 0LL);
  objc_storeStrong(location, 0LL);
}

+ (Class)_visualContentClassForDeviceType:(int64_t)a3
{
  if (a3 == 2) {
    return (Class)(id)objc_opt_class(&OBJC_CLASS___TVSSKeyboardPeripheralVisualContent);
  }
  if (a3 == 4) {
    return (Class)(id)objc_opt_class(&OBJC_CLASS___TVSSGameControllerPeripheralVisualContent);
  }
  return (Class)0LL;
}

- (void).cxx_destruct
{
}

@end