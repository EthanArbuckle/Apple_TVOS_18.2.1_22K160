@interface TVSSStatusMenuItemProvider
+ (id)_cyclingMenuItemsSortOrderDictionary;
- (BOOL)_isDoNotDisturbEnabled;
- (BOOL)_isLocationActive;
- (BOOL)_remoteHasNotablePowerState;
- (BOOL)shouldShowMenuItem;
- (BOOL)updateVisualContentForMenuItem:(id)a3;
- (TVSSStatusMenuItemProvider)initWithDoNotDisturbController:(id)a3 bluetoothRemoteController:(id)a4 sensorActivityController:(id)a5;
- (id)_currentRemotePowerStateMenuItem;
- (id)_doNotDisturbMenuItem;
- (id)_newCyclingVisualContent;
- (id)_remotePowerStateContentWithPowerState:(unint64_t)a3;
- (id)_remotePowerStateMenuItem;
- (id)_remotePowerStateMenuItemIdentifierForPowerState:(unint64_t)a3;
- (id)_sortedCyclingMenuItems;
- (id)log;
- (id)newMenuItem;
- (unint64_t)_currentRemotePowerState;
- (void)_updateCyclingMenuItems;
- (void)bluetoothRemoteController:(id)a3 didUpdateCurrentRemote:(id)a4;
- (void)dealloc;
- (void)doNotDisturbControllerDidUpdate:(id)a3;
- (void)sensorActivityControllerDidUpdate:(id)a3;
@end

@implementation TVSSStatusMenuItemProvider

- (TVSSStatusMenuItemProvider)initWithDoNotDisturbController:(id)a3 bluetoothRemoteController:(id)a4 sensorActivityController:(id)a5
{
  id v90 = self;
  SEL aSelector = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v87 = 0LL;
  objc_storeStrong(&v87, a4);
  id v86 = 0LL;
  objc_storeStrong(&v86, a5);
  id v85 = location;
  id v84 = 0LL;
  Class v83 = NSClassFromString(@"TVSSDoNotDisturbController");
  if (!v85)
  {
    id v82 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil");
    os_log_t oslog = &_os_log_default;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v41 = type;
      v43 = NSStringFromSelector(aSelector);
      v39 = v43;
      v79 = v39;
      v5 = (objc_class *)objc_opt_class(v90);
      v42 = NSStringFromClass(v5);
      v78 = v42;
      sub_10000583C( (uint64_t)v96,  (uint64_t)v39,  (uint64_t)v78,  (uint64_t)v90,  (uint64_t)@"TVSSStatusMenuItemProvider.m",  87,  (uint64_t)v82);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  v41,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v96,  0x3Au);

      objc_storeStrong((id *)&v78, 0LL);
      objc_storeStrong((id *)&v79, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    _bs_set_crash_log_message([v82 UTF8String]);
    __break(0);
    JUMPOUT(0x1000E10E8LL);
  }

  if (((objc_opt_isKindOfClass(v85, v83) ^ 1) & 1) != 0)
  {
    id v77 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:TVSSDoNotDisturbControllerClass]");
    os_log_t v76 = &_os_log_default;
    os_log_type_t v75 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
    {
      v35 = v76;
      os_log_type_t v36 = v75;
      v38 = NSStringFromSelector(aSelector);
      v34 = v38;
      v74 = v34;
      v6 = (objc_class *)objc_opt_class(v90);
      v37 = NSStringFromClass(v6);
      v73 = v37;
      sub_10000583C( (uint64_t)v95,  (uint64_t)v34,  (uint64_t)v73,  (uint64_t)v90,  (uint64_t)@"TVSSStatusMenuItemProvider.m",  87,  (uint64_t)v77);
      _os_log_error_impl( (void *)&_mh_execute_header,  v35,  v36,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v95,  0x3Au);

      objc_storeStrong((id *)&v73, 0LL);
      objc_storeStrong((id *)&v74, 0LL);
    }

    objc_storeStrong((id *)&v76, 0LL);
    _bs_set_crash_log_message([v77 UTF8String]);
    __break(0);
    JUMPOUT(0x1000E12A0LL);
  }

  objc_storeStrong(&v84, 0LL);
  objc_storeStrong(&v85, 0LL);
  id v72 = v87;
  id v71 = 0LL;
  Class v70 = NSClassFromString(@"TVSSBluetoothRemoteController");
  if (!v72)
  {
    id v69 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil");
    os_log_t v68 = &_os_log_default;
    os_log_type_t v67 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      v30 = v68;
      os_log_type_t v31 = v67;
      v33 = NSStringFromSelector(aSelector);
      v29 = v33;
      v66 = v29;
      v7 = (objc_class *)objc_opt_class(v90);
      v32 = NSStringFromClass(v7);
      v65 = v32;
      sub_10000583C( (uint64_t)v94,  (uint64_t)v29,  (uint64_t)v65,  (uint64_t)v90,  (uint64_t)@"TVSSStatusMenuItemProvider.m",  88,  (uint64_t)v69);
      _os_log_error_impl( (void *)&_mh_execute_header,  v30,  v31,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v94,  0x3Au);

      objc_storeStrong((id *)&v65, 0LL);
      objc_storeStrong((id *)&v66, 0LL);
    }

    objc_storeStrong((id *)&v68, 0LL);
    _bs_set_crash_log_message([v69 UTF8String]);
    __break(0);
    JUMPOUT(0x1000E149CLL);
  }

  if (((objc_opt_isKindOfClass(v72, v70) ^ 1) & 1) != 0)
  {
    id v64 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:TVSSBluetoothRemoteControllerClass]");
    os_log_t v63 = &_os_log_default;
    os_log_type_t v62 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      v25 = v63;
      os_log_type_t v26 = v62;
      v28 = NSStringFromSelector(aSelector);
      v24 = v28;
      v61 = v24;
      v8 = (objc_class *)objc_opt_class(v90);
      v27 = NSStringFromClass(v8);
      v60 = v27;
      sub_10000583C( (uint64_t)v93,  (uint64_t)v24,  (uint64_t)v60,  (uint64_t)v90,  (uint64_t)@"TVSSStatusMenuItemProvider.m",  88,  (uint64_t)v64);
      _os_log_error_impl( (void *)&_mh_execute_header,  v25,  v26,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v93,  0x3Au);

      objc_storeStrong((id *)&v60, 0LL);
      objc_storeStrong((id *)&v61, 0LL);
    }

    objc_storeStrong((id *)&v63, 0LL);
    _bs_set_crash_log_message([v64 UTF8String]);
    __break(0);
    JUMPOUT(0x1000E1654LL);
  }

  objc_storeStrong(&v71, 0LL);
  objc_storeStrong(&v72, 0LL);
  id v59 = v86;
  id v58 = 0LL;
  Class v57 = NSClassFromString(@"TVSSSensorActivityController");
  if (!v59)
  {
    id v56 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil");
    os_log_t v55 = &_os_log_default;
    os_log_type_t v54 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      v20 = v55;
      os_log_type_t v21 = v54;
      v23 = NSStringFromSelector(aSelector);
      v19 = v23;
      v53 = v19;
      v9 = (objc_class *)objc_opt_class(v90);
      v22 = NSStringFromClass(v9);
      v52 = v22;
      sub_10000583C( (uint64_t)v92,  (uint64_t)v19,  (uint64_t)v52,  (uint64_t)v90,  (uint64_t)@"TVSSStatusMenuItemProvider.m",  89,  (uint64_t)v56);
      _os_log_error_impl( (void *)&_mh_execute_header,  v20,  v21,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v92,  0x3Au);

      objc_storeStrong((id *)&v52, 0LL);
      objc_storeStrong((id *)&v53, 0LL);
    }

    objc_storeStrong((id *)&v55, 0LL);
    _bs_set_crash_log_message([v56 UTF8String]);
    __break(0);
    JUMPOUT(0x1000E1850LL);
  }

  if (((objc_opt_isKindOfClass(v59, v57) ^ 1) & 1) != 0)
  {
    id v51 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:TVSSSensorActivityControllerClass]");
    os_log_t v50 = &_os_log_default;
    os_log_type_t v49 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      v15 = v50;
      os_log_type_t v16 = v49;
      v18 = NSStringFromSelector(aSelector);
      v14 = v18;
      v48 = v14;
      v10 = (objc_class *)objc_opt_class(v90);
      v17 = NSStringFromClass(v10);
      v47 = v17;
      sub_10000583C( (uint64_t)v91,  (uint64_t)v14,  (uint64_t)v47,  (uint64_t)v90,  (uint64_t)@"TVSSStatusMenuItemProvider.m",  89,  (uint64_t)v51);
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  v16,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v91,  0x3Au);

      objc_storeStrong((id *)&v47, 0LL);
      objc_storeStrong((id *)&v48, 0LL);
    }

    objc_storeStrong((id *)&v50, 0LL);
    _bs_set_crash_log_message([v51 UTF8String]);
    __break(0);
    JUMPOUT(0x1000E1A08LL);
  }

  objc_storeStrong(&v58, 0LL);
  objc_storeStrong(&v59, 0LL);
  id v11 = v90;
  id v90 = 0LL;
  v46.receiver = v11;
  v46.super_class = (Class)&OBJC_CLASS___TVSSStatusMenuItemProvider;
  id v90 = -[TVSSMenuItemProvider initWithIdentifier:]( &v46,  "initWithIdentifier:",  @"com.apple.TVSystemUIService.status.provider");
  objc_storeStrong(&v90, v90);
  if (v90)
  {
    objc_storeStrong((id *)v90 + 6, v86);
    [*((id *)v90 + 6) addObserver:v90];
    objc_storeStrong((id *)v90 + 5, location);
    [*((id *)v90 + 5) addObserver:v90];
    objc_storeStrong((id *)v90 + 4, v87);
    [*((id *)v90 + 4) addObserver:v90];
    objc_storeStrong((id *)v90 + 7, &__NSDictionary0__struct);
    [v90 updateMenuItemWithReason:@"Initial update"];
  }

  v13 = (TVSSStatusMenuItemProvider *)v90;
  objc_storeStrong(&v86, 0LL);
  objc_storeStrong(&v87, 0LL);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v90, 0LL);
  return v13;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[TVSSSensorActivityController removeObserver:](self->_sensorActivityController, "removeObserver:", self);
  -[TVSSDoNotDisturbController removeObserver:](v4->_doNotDisturbController, "removeObserver:", v4);
  -[TVSSBluetoothRemoteController removeObserver:](v4->_bluetoothRemoteController, "removeObserver:", v4);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSStatusMenuItemProvider;
  -[TVSSStatusMenuItemProvider dealloc](&v2, "dealloc");
}

- (void)sensorActivityControllerDidUpdate:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSSimpleMenuItemProvider updateMenuItemWithReason:]( v4,  "updateMenuItemWithReason:",  @"Sensor activities state has changed");
  objc_storeStrong(location, 0LL);
}

- (void)doNotDisturbControllerDidUpdate:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSSimpleMenuItemProvider updateMenuItemWithReason:]( v4,  "updateMenuItemWithReason:",  @"Do-not-disturb state has changed");
  objc_storeStrong(location, 0LL);
}

- (void)bluetoothRemoteController:(id)a3 didUpdateCurrentRemote:(id)a4
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  -[TVSSSimpleMenuItemProvider updateMenuItemWithReason:]( v7,  "updateMenuItemWithReason:",  @"Bluetooth remote state has changed");
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (BOOL)shouldShowMenuItem
{
  if (-[TVSSStatusMenuItemProvider _isLocationActive](self, "_isLocationActive")) {
    return 0;
  }
  char v5 = -[TVSSStatusMenuItemProvider _remoteHasNotablePowerState](self, "_remoteHasNotablePowerState");
  char v4 = -[TVSSStatusMenuItemProvider _isDoNotDisturbEnabled](self, "_isDoNotDisturbEnabled");
  char v3 = 1;
  if ((v5 & 1) == 0) {
    char v3 = v4;
  }
  return v3 & 1;
}

- (id)newMenuItem
{
  v6 = self;
  v5[1] = (id)a2;
  v5[0] = -[TVSSMenuItem initWithIdentifier:]( objc_alloc(&OBJC_CLASS___TVSSMenuItem),  "initWithIdentifier:",  @"com.apple.TVSystemUIService.status.item");
  id v4 = -[TVSSStatusMenuItemProvider _newCyclingVisualContent](v6, "_newCyclingVisualContent");
  [v5[0] setVisualContent:v4];
  id v3 = v5[0];
  objc_storeStrong(&v4, 0LL);
  objc_storeStrong(v5, 0LL);
  return v3;
}

- (id)log
{
  id v4 = (dispatch_once_t *)&unk_100221D70;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001BA748);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221D68;
}

- (BOOL)updateVisualContentForMenuItem:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  char v10 = 0;
  id v6 = [location[0] visualContent];
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVSSCyclingVisualContent);
  id v7 = sub_1000E212C(v6, v3);

  v8[1] = v7;
  id v9 = v7;
  v8[0] = -[TVSSStatusMenuItemProvider _newCyclingVisualContent](v12, "_newCyclingVisualContent");
  if ((BSEqualObjects(v7, v8[0]) & 1) == 0)
  {
    [location[0] setVisualContent:v8[0]];
    char v10 = 1;
  }

  char v5 = v10;
  objc_storeStrong(v8, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
  return v5 & 1;
}

- (BOOL)_isLocationActive
{
  uint64_t v3 =  -[TVSSSensorActivityController activeLocationActivityAttributions]( self->_sensorActivityController,  "activeLocationActivityAttributions");
  BOOL v4 = -[NSOrderedSet count](v3, "count") != 0;

  return v4;
}

- (id)_newCyclingVisualContent
{
  id v7 = self;
  v6[1] = (id)a2;
  -[TVSSStatusMenuItemProvider _updateCyclingMenuItems](self, "_updateCyclingMenuItems");
  v6[0] = -[TVSSStatusMenuItemProvider _sortedCyclingMenuItems](v7, "_sortedCyclingMenuItems");
  objc_super v2 = objc_alloc(&OBJC_CLASS___TVSSCyclingVisualContent);
  char v5 = -[TVSSCyclingVisualContent initWithMenuItems:](v2, "initWithMenuItems:", v6[0]);
  BOOL v4 = v5;
  objc_storeStrong((id *)&v5, 0LL);
  objc_storeStrong(v6, 0LL);
  return v4;
}

- (void)_updateCyclingMenuItems
{
  char v10 = self;
  v9[1] = (id)a2;
  v9[0] = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v8 = -[TVSSStatusMenuItemProvider _remotePowerStateMenuItem](v10, "_remotePowerStateMenuItem");
  if (v8)
  {
    id v6 = [v8 identifier];
    objc_msgSend(v9[0], "setObject:forKey:", v8);
  }

  id location = -[TVSSStatusMenuItemProvider _doNotDisturbMenuItem](v10, "_doNotDisturbMenuItem");
  if (location)
  {
    id v5 = [location identifier];
    objc_msgSend(v9[0], "setObject:forKey:", location);
  }

  objc_super v2 = (NSDictionary *)objc_msgSend(v9[0], "copy", v9);
  cyclingMenuItemsDictionary = v10->_cyclingMenuItemsDictionary;
  v10->_cyclingMenuItemsDictionary = v2;

  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(v4, 0LL);
}

- (id)_sortedCyclingMenuItems
{
  v14 = self;
  v13[1] = (id)a2;
  v13[0] = -[NSDictionary allValues](self->_cyclingMenuItemsDictionary, "allValues");
  id v12 = [(id)objc_opt_class(v14) _cyclingMenuItemsSortOrderDictionary];
  id v3 = v13[0];
  id v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_1000E25B8;
  id v9 = &unk_1001BA770;
  id v10 = v12;
  id v11 = objc_msgSend(v3, "sortedArrayUsingComparator:");
  BOOL v4 = +[NSOrderedSet orderedSetWithArray:](&OBJC_CLASS___NSOrderedSet, "orderedSetWithArray:", v11);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(v13, 0LL);
  return v4;
}

+ (id)_cyclingMenuItemsSortOrderDictionary
{
  BOOL v4 = (dispatch_once_t *)&unk_100221D80;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001BA790);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221D78;
}

- (id)_currentRemotePowerStateMenuItem
{
  id v5 = self;
  v4[1] = (id)a2;
  v4[0] =  -[NSDictionary objectForKey:]( self->_cyclingMenuItemsDictionary,  "objectForKey:",  @"com.apple.TVSystemUIService.status.remoteLowBatteryItem");
  if (!v4[0])
  {
    v4[0] =  -[NSDictionary objectForKey:]( v5->_cyclingMenuItemsDictionary,  "objectForKey:",  @"com.apple.TVSystemUIService.status.remoteVeryLowBatteryItem");
  }

  id v3 = v4[0];
  objc_storeStrong(v4, 0LL);
  return v3;
}

- (id)_remotePowerStateMenuItemIdentifierForPowerState:(unint64_t)a3
{
  v5[3] = self;
  id v5[2] = (id)a2;
  v5[1] = (id)a3;
  v5[0] = 0LL;
  if (a3 <= 4) {
    __asm { BR              X8 }
  }

  id v4 = v5[0];
  objc_storeStrong(v5, 0LL);
  return v4;
}

- (BOOL)_remoteHasNotablePowerState
{
  unint64_t v4 = -[TVSSStatusMenuItemProvider _currentRemotePowerState](self, "_currentRemotePowerState");
  BOOL v3 = 1;
  if (v4 != 2) {
    return v4 == 3;
  }
  return v3;
}

- (unint64_t)_currentRemotePowerState
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = -[TVSSBluetoothRemoteController currentRemote](self->_bluetoothRemoteController, "currentRemote");
  if ([location[0] isBatteryCharging])
  {
    unint64_t v5 = 4LL;
  }

  else
  {
    id v3 = [location[0] lowBatteryState];
    if ((unint64_t)v3 <= 3) {
      __asm { BR              X8 }
    }
  }

  objc_storeStrong(location, 0LL);
  return v5;
}

- (id)_remotePowerStateContentWithPowerState:(unint64_t)a3
{
  v17 = self;
  id location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0LL;
  id v12 = -[TVSSBluetoothRemoteController currentRemote](self->_bluetoothRemoteController, "currentRemote");
  id v13 = -[TVSSBluetoothDevice type](v12, "type");

  id v15 = v13;
  if (v13 == (id)1)
  {
    id v10 = -[TVSSBluetoothRemoteController currentRemoteInfo](v17->_bluetoothRemoteController, "currentRemoteInfo");
    id v11 = (char *)-[TVSBluetoothRemoteInfo remoteType](v10, "remoteType");

    if ((unint64_t)(v11 - 1) <= 1)
    {
      objc_storeStrong(location, @"menubar_battery_remote");
    }

    else if ((unint64_t)(v11 - 4) <= 1)
    {
      objc_storeStrong(location, @"menubar_battery_remote3");
    }

    else
    {
      objc_storeStrong(location, @"menubar_battery_remote2");
    }
  }

  else if (v15 == (id)2)
  {
    objc_storeStrong(location, @"menubar_battery_controller");
  }

  else
  {
    objc_storeStrong(location, @"menubar_battery");
  }

  v14 = 0LL;
  if (location[0])
  {
    int v7 = objc_alloc(&OBJC_CLASS___TVSSImageContent);
    id v9 = +[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", location[0]);
    id v8 = -[UIImage imageWithRenderingMode:](v9, "imageWithRenderingMode:", 2LL);
    id v3 = -[TVSSImageContent initWithImage:](v7, "initWithImage:");
    unint64_t v4 = v14;
    v14 = v3;
  }

  int v6 = v14;
  objc_storeStrong((id *)&v14, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

- (id)_remotePowerStateMenuItem
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  unint64_t v11 = -[TVSSStatusMenuItemProvider _currentRemotePowerState](self, "_currentRemotePowerState");
  id v10 =  -[TVSSStatusMenuItemProvider _remotePowerStateMenuItemIdentifierForPowerState:]( v13,  "_remotePowerStateMenuItemIdentifierForPowerState:",  v11);
  id v9 = -[TVSSStatusMenuItemProvider _currentRemotePowerStateMenuItem](v13, "_currentRemotePowerStateMenuItem");
  id v6 = [v9 identifier];
  char v7 = BSEqualObjects(v6, v10);

  if ((v7 & 1) != 0)
  {
    objc_storeStrong(location, v9);
  }

  else if (v10)
  {
    objc_super v2 = -[TVSSMenuItem initWithIdentifier:hasFocusableContent:]( objc_alloc(&OBJC_CLASS___TVSSMenuItem),  "initWithIdentifier:hasFocusableContent:",  v10,  0LL);
    id v3 = location[0];
    location[0] = v2;

    id v8 =  -[TVSSStatusMenuItemProvider _remotePowerStateContentWithPowerState:]( v13,  "_remotePowerStateContentWithPowerState:",  v11);
    [location[0] setVisualContent:v8];
    objc_storeStrong(&v8, 0LL);
  }

  id v5 = location[0];
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
  return v5;
}

- (BOOL)_isDoNotDisturbEnabled
{
  return -[TVSSDoNotDisturbController isEnabled](self->_doNotDisturbController, "isEnabled", a2, self);
}

- (id)_doNotDisturbMenuItem
{
  id v10 = self;
  v9[1] = (id)a2;
  v9[0] = 0LL;
  if (-[TVSSStatusMenuItemProvider _isDoNotDisturbEnabled](self, "_isDoNotDisturbEnabled"))
  {
    id v2 =  -[NSDictionary objectForKey:]( v10->_cyclingMenuItemsDictionary,  "objectForKey:",  @"com.apple.TVSystemUIService.status.doNotDisturbItem");
    id v3 = v9[0];
    v9[0] = v2;

    if (!v9[0])
    {
      v9[0] = -[TVSSMenuItem initWithIdentifier:hasFocusableContent:]( objc_alloc(&OBJC_CLASS___TVSSMenuItem),  "initWithIdentifier:hasFocusableContent:",  @"com.apple.TVSystemUIService.status.doNotDisturbItem",  0LL);

      id v6 = objc_alloc(&OBJC_CLASS___TVSSImageContent);
      id v7 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"moon.fill");
      id v8 = -[TVSSImageContent initWithImage:](v6, "initWithImage:");

      [v9[0] setVisualContent:v8];
      objc_storeStrong((id *)&v8, 0LL);
    }
  }

  id v5 = v9[0];
  objc_storeStrong(v9, 0LL);
  return v5;
}

- (void).cxx_destruct
{
}

@end