@interface TVSMDefaultModuleDataSource
+ (BOOL)TVSMIsExpanseActive;
+ (BOOL)TVSMShouldShowExpanseModule;
- (BOOL)shouldEnableModuleWithInfo:(id)a3;
- (BOOL)shouldShowAirPodsModule;
- (BOOL)shouldShowGameControllerModule;
- (NSMutableSet)totalAvailableModuleIdentifiers;
- (TVNPGroupableRoutingController)routingController;
- (TVPSBluetoothDeviceManaging)bluetoothDeviceManager;
- (TVSMDefaultModuleDataSource)init;
- (id)sortedModuleInfos:(id)a3;
- (void)bluetoothDeviceManager:(id)a3 didUpdatePairedDevices:(id)a4;
- (void)dealloc;
- (void)expanseContextDidUpdate:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setTotalAvailableModuleIdentifiers:(id)a3;
- (void)updateAvailableModules;
@end

@implementation TVSMDefaultModuleDataSource

- (TVSMDefaultModuleDataSource)init
{
  SEL v17 = a2;
  v18 = 0LL;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVSMDefaultModuleDataSource;
  v13 = -[TVSMModuleDataSource initWithModuleType:shouldUpdateAvailableModules:]( &v16,  "initWithModuleType:shouldUpdateAvailableModules:",  0LL,  0LL);
  v18 = v13;
  objc_storeStrong((id *)&v18, v13);
  if (v13)
  {
    v20 = (dispatch_once_t *)&unk_100056D08;
    id location = 0LL;
    objc_storeStrong(&location, &stru_1000498A8);
    if (*v20 != -1) {
      dispatch_once(v20, location);
    }
    objc_storeStrong(&location, 0LL);
    id v15 = +[TVSMSystemMenuManager sharedInstance](&OBJC_CLASS___TVSMSystemMenuManager, "sharedInstance");
    objc_msgSend(v15, "addObserver:forKeyPath:options:context:", v18, @"startupContext");
    v2 = -[TVNPGroupableRoutingController initWithOutputContextUID:allowsRetargeting:initalFetchCompletion:]( objc_alloc(&OBJC_CLASS___TVNPGroupableRoutingController),  "initWithOutputContextUID:allowsRetargeting:initalFetchCompletion:",  0LL,  1LL);
    routingController = v18->_routingController;
    v18->_routingController = v2;

    -[TVNPGroupableRoutingController addObserver:forKeyPath:options:context:]( v18->_routingController,  "addObserver:forKeyPath:options:context:",  v18,  @"currentRoutes",  0LL,  off_100056710);
    id v14 =  +[TVPSBluetoothDeviceManagerConfiguration gameControllersConfiguration]( &OBJC_CLASS___TVPSBluetoothDeviceManagerConfiguration,  "gameControllersConfiguration");
    v4 = (TVPSBluetoothDeviceManaging *)(id)TVPSBluetoothDeviceManagerWithConfiguration(v14);
    bluetoothDeviceManager = v18->_bluetoothDeviceManager;
    v18->_bluetoothDeviceManager = v4;

    -[TVPSBluetoothDeviceManaging addPairedDevicesObserver:]( v18->_bluetoothDeviceManager,  "addPairedDevicesObserver:",  v18);
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    totalAvailableModuleIdentifiers = v18->_totalAvailableModuleIdentifiers;
    v18->_totalAvailableModuleIdentifiers = v6;

    if ((TUSharePlayForceDisabled() & 1) == 0)
    {
      id v12 = +[TVCSExpanseContext sharedContext](&OBJC_CLASS___TVCSExpanseContext, "sharedContext");
      v10 = v18;
      v11 = &_dispatch_main_q;
      objc_msgSend(v12, "addObserver:queue:", v10);
    }

    -[TVSMDefaultModuleDataSource updateAvailableModules](v18, "updateAvailableModules");
    objc_storeStrong(&v14, 0LL);
    objc_storeStrong(&v15, 0LL);
  }

  v9 = v18;
  objc_storeStrong((id *)&v18, 0LL);
  return v9;
}

- (void)dealloc
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = +[TVSMSystemMenuManager sharedInstance](&OBJC_CLASS___TVSMSystemMenuManager, "sharedInstance");
  [location[0] removeObserver:v5 forKeyPath:@"startupContext" context:off_100056708];
  -[TVNPGroupableRoutingController removeObserver:forKeyPath:context:]( v5->_routingController,  "removeObserver:forKeyPath:context:",  v5,  @"currentRoutes",  off_100056710);
  if ((TUSharePlayForceDisabled( -[TVPSBluetoothDeviceManaging removePairedDevicesObserver:]( v5->_bluetoothDeviceManager,  "removePairedDevicesObserver:",  v5)) & 1) == 0)
  {
    id v2 = +[TVCSExpanseContext sharedContext](&OBJC_CLASS___TVCSExpanseContext, "sharedContext");
    [v2 removeObserver:v5];
  }

  objc_storeStrong(location, 0LL);
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS___TVSMDefaultModuleDataSource;
  -[TVSMDefaultModuleDataSource dealloc](&v3, "dealloc");
}

- (id)sortedModuleInfos:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = [location[0] sortedArrayUsingComparator:&stru_1000498E8];
  id v4 = v5;
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (void)updateAvailableModules
{
  v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSMDefaultModuleDataSource;
  -[TVSMModuleDataSource updateAvailableModules](&v5, "updateAvailableModules");
  id v2 = -[TVSMModuleDataSource availableModules](v7, "availableModules");
  id v4 = -[NSArray bs_map:](v2, "bs_map:", &stru_100049928);

  objc_super v3 = -[TVSMDefaultModuleDataSource totalAvailableModuleIdentifiers](v7, "totalAvailableModuleIdentifiers");
  -[NSMutableSet addObjectsFromArray:](v3, "addObjectsFromArray:", v4);

  objc_storeStrong(&v4, 0LL);
}

- (BOOL)shouldEnableModuleWithInfo:(id)a3
{
  v27 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v16 = [location[0] infoPlist];
  id v25 = [v16 objectForKey:@"CFBundleIdentifier"];

  char v23 = 0;
  BOOL v17 = 0;
  if (([(id)qword_100056D18 containsObject:v25] & 1) == 0)
  {
    v24 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
    char v23 = 1;
    BOOL v17 = !-[NSUserDefaults BOOLForKey:](v24, "BOOLForKey:", @"AllowAllModules");
  }

  if ((v23 & 1) != 0) {

  }
  if (v17)
  {
    char v28 = 0;
    int v22 = 1;
  }

  else if ([v25 isEqualToString:@"com.apple.TVSystemMenu.AirPods-Module"])
  {
    id v21 = &_os_log_default;
    os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
    {
      sub_1000265A8( (uint64_t)v29,  -[TVSMDefaultModuleDataSource shouldShowAirPodsModule](v27, "shouldShowAirPodsModule"));
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v21, v20, "Should Show AirPods Module: %d", v29, 8u);
    }

    objc_storeStrong(&v21, 0LL);
    char v28 = -[TVSMDefaultModuleDataSource shouldShowAirPodsModule](v27, "shouldShowAirPodsModule");
    int v22 = 1;
  }

  else if ([v25 isEqualToString:@"com.apple.TVSystemMenu.Game-Controllers-Module"])
  {
    char v28 = -[TVSMDefaultModuleDataSource shouldShowGameControllerModule](v27, "shouldShowGameControllerModule");
    int v22 = 1;
  }

  else if ([v25 isEqualToString:@"com.apple.TVSystemMenu.Home-Module"])
  {
    id v15 = +[TVSMSystemMenuManager sharedInstance](&OBJC_CLASS___TVSMSystemMenuManager, "sharedInstance");
    id v14 = -[TVSMSystemMenuManager startupContext](v15, "startupContext");
    char v28 = -[TVSMSystemMenuStartupContext isHomeModuleAvailable](v14, "isHomeModuleAvailable") & 1;

    int v22 = 1;
  }

  else
  {
    id v3 = [v25 isEqualToString:@"com.apple.TVSystemMenu.Now-Playing-Module"];
    if ((v3 & 1) != 0)
    {
      LOBYTE(v13) = 1;
      if ((TUSharePlayForceDisabled(v3) & 1) == 0) {
        unsigned int v13 = !+[TVSMDefaultModuleDataSource TVSMIsExpanseActive]( &OBJC_CLASS___TVSMDefaultModuleDataSource,  "TVSMIsExpanseActive");
      }
      char v28 = v13 & 1;
      int v22 = 1;
    }

    else
    {
      id v4 = [v25 isEqualToString:@"com.apple.TVSystemMenu.Expanse-Now-Playing-Module"];
      if ((v4 & 1) != 0)
      {
        unsigned __int8 v12 = 0;
        if ((TUSharePlayForceDisabled(v4) & 1) == 0) {
          unsigned __int8 v12 = +[TVSMDefaultModuleDataSource TVSMIsExpanseActive]( &OBJC_CLASS___TVSMDefaultModuleDataSource,  "TVSMIsExpanseActive");
        }
        char v28 = v12 & 1;
        int v22 = 1;
      }

      else
      {
        id v5 = [v25 isEqualToString:@"com.apple.TVSystemMenu.Expanse-Module"];
        if ((v5 & 1) != 0)
        {
          unsigned __int8 v11 = 0;
          if ((TUSharePlayForceDisabled(v5) & 1) == 0) {
            unsigned __int8 v11 = +[TVSMDefaultModuleDataSource TVSMShouldShowExpanseModule]( &OBJC_CLASS___TVSMDefaultModuleDataSource,  "TVSMShouldShowExpanseModule");
          }
          char v28 = v11 & 1;
          int v22 = 1;
        }

        else
        {
          id v9 = [location[0] bundleURL];
          id v8 = [v9 absoluteString];
          unsigned __int8 v10 = [v8 containsString:@"AppleInternal"];

          if ((v10 & 1) != 0)
          {
            v7 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
            v19 = -[NSUserDefaults arrayForKey:](v7, "arrayForKey:", @"EnabledInternalModules");

            char v28 = -[NSArray containsObject:](v19, "containsObject:", v25);
            int v22 = 1;
            objc_storeStrong((id *)&v19, 0LL);
          }

          else
          {
            v18.receiver = v27;
            v18.super_class = (Class)&OBJC_CLASS___TVSMDefaultModuleDataSource;
            char v28 = -[TVSMModuleDataSource shouldEnableModuleWithInfo:](&v18, "shouldEnableModuleWithInfo:", location[0]);
            int v22 = 1;
          }
        }
      }
    }
  }

  objc_storeStrong(&v25, 0LL);
  objc_storeStrong(location, 0LL);
  return v28 & 1;
}

- (void)bluetoothDeviceManager:(id)a3 didUpdatePairedDevices:(id)a4
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  -[TVSMDefaultModuleDataSource updateAvailableModules](v7, "updateAvailableModules");
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v11 = 0LL;
  objc_storeStrong(&v11, a5);
  unsigned __int8 v10 = a6;
  if (a6 == off_100056708 || v10 == off_100056710)
  {
    -[TVSMDefaultModuleDataSource updateAvailableModules](v14, "updateAvailableModules");
  }

  else
  {
    v9.receiver = v14;
    v9.super_class = (Class)&OBJC_CLASS___TVSMDefaultModuleDataSource;
    -[TVSMDefaultModuleDataSource observeValueForKeyPath:ofObject:change:context:]( &v9,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v12,  v11,  v10);
  }

  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)expanseContextDidUpdate:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSMDefaultModuleDataSource updateAvailableModules](v4, "updateAvailableModules");
  objc_storeStrong(location, 0LL);
}

- (BOOL)shouldShowAirPodsModule
{
  unsigned int v13 = self;
  v12[1] = (id)a2;
  v12[0] = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  memset(__b, 0, sizeof(__b));
  obj = -[TVNPGroupableRoutingController appleHeadsets](v13->_routingController, "appleHeadsets");
  id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v14,  16LL);
  if (v9)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0LL;
    id v7 = v9;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(id *)(__b[1] + 8 * v6);
      if ([v11 selectionState] == (id)2) {
        [v12[0] addObject:v11];
      }
      ++v6;
      if (v4 + 1 >= (unint64_t)v7)
      {
        uint64_t v6 = 0LL;
        id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v14,  16LL);
        if (!v7) {
          break;
        }
      }
    }
  }

  BOOL v3 = [v12[0] count] != 0;
  objc_storeStrong(v12, 0LL);
  return v3;
}

- (BOOL)shouldShowGameControllerModule
{
  id v3 = -[TVPSBluetoothDeviceManaging pairedDevices](self->_bluetoothDeviceManager, "pairedDevices");
  char v5 = 0;
  unsigned __int8 v4 = 1;
  if (![v3 count])
  {
    uint64_t v6 = -[TVSMDefaultModuleDataSource totalAvailableModuleIdentifiers](self, "totalAvailableModuleIdentifiers");
    char v5 = 1;
    unsigned __int8 v4 = -[NSMutableSet containsObject:]( v6,  "containsObject:",  @"com.apple.TVSystemMenu.Game-Controllers-Module");
  }

  if ((v5 & 1) != 0) {

  }
  return v4 & 1;
}

+ (BOOL)TVSMIsExpanseActive
{
  id v8 = a1;
  SEL v7 = a2;
  id v3 = +[TVCSExpanseContext sharedContext](&OBJC_CLASS___TVCSExpanseContext, "sharedContext");
  unsigned __int8 v4 = (char *)[v3 sessionState];

  uint64_t v6 = (uint64_t)v4;
  if ((unint64_t)(v4 - 1) <= 1)
  {
    char v9 = 0;
  }

  else if ((unint64_t)(v4 - 3) <= 1)
  {
    char v9 = 1;
  }

  else
  {
    os_log_t oslog = &_os_log_default;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_100026C70((uint64_t)v10, v6);
      _os_log_error_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_ERROR,  "Unexpected state received while determining whether Expanse is active: %lud",  v10,  0xCu);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    char v9 = 0;
  }

  return v9 & 1;
}

+ (BOOL)TVSMShouldShowExpanseModule
{
  id v8 = a1;
  SEL v7 = a2;
  id v3 = +[TVCSExpanseContext sharedContext](&OBJC_CLASS___TVCSExpanseContext, "sharedContext");
  unsigned __int8 v4 = (char *)[v3 sessionState];

  uint64_t v6 = (uint64_t)v4;
  if (v4 == (char *)1)
  {
    char v9 = 0;
  }

  else if ((unint64_t)(v4 - 2) <= 2)
  {
    char v9 = 1;
  }

  else
  {
    os_log_t oslog = &_os_log_default;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_100026C70((uint64_t)v10, v6);
      _os_log_error_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_ERROR,  "Unexpected state received while determining module enablement: %lud",  v10,  0xCu);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    char v9 = 0;
  }

  return v9 & 1;
}

- (TVNPGroupableRoutingController)routingController
{
  return self->_routingController;
}

- (NSMutableSet)totalAvailableModuleIdentifiers
{
  return self->_totalAvailableModuleIdentifiers;
}

- (void)setTotalAvailableModuleIdentifiers:(id)a3
{
}

- (TVPSBluetoothDeviceManaging)bluetoothDeviceManager
{
  return self->_bluetoothDeviceManager;
}

- (void).cxx_destruct
{
}

@end