@interface TVSSNetworkController
- (BOOL)contentIsSelected;
- (NSArray)vpnConfigurations;
- (NSString)contentText1;
- (NSString)contentTitle;
- (NSString)debugDescription;
- (NSString)description;
- (OS_dispatch_queue)workQueue;
- (TVSSNetworkController)init;
- (TVSSNetworkController)initWithNetworkInterfaceManager:(id)a3;
- (TVSSNetworkState)networkState;
- (TVSWiFiNetwork)currentWiFiNetwork;
- (UIImage)contentImage;
- (id)_latestNetworkState;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_handleInternetAvailabilityChangedNotification:(id)a3;
- (void)_handlePhysicalNetworkStateChangedNotification:(id)a3;
- (void)_loadVPNConfigurations;
- (void)_notePublishNetworkStateNeeded;
- (void)_publishNetworkState;
- (void)_startObservingConfigurationManager;
- (void)_startObservingNetworkInterfaceKVONotifications;
- (void)_startObservingNetworkInterfaceManager;
- (void)_startObservingNotifications;
- (void)_startObservingSystemPathMonitor;
- (void)_stopObservingConfigurationManager;
- (void)_stopObservingNetworkInterfaceKVONotifications;
- (void)_stopObservingNetworkInterfaceManager;
- (void)_stopObservingNotifications;
- (void)_stopObservingSystemPathMonitor;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)networkInterfaceManager:(id)a3 didChangeInternetAvailability:(BOOL)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeObserver:(id)a3;
- (void)setCurrentWiFiNetwork:(id)a3;
- (void)setVpnConfigurations:(id)a3;
@end

@implementation TVSSNetworkController

- (TVSSNetworkController)initWithNetworkInterfaceManager:(id)a3
{
  id v31 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = v31;
  id v31 = 0LL;
  v29.receiver = v3;
  v29.super_class = (Class)&OBJC_CLASS___TVSSNetworkController;
  id v31 = -[TVSSNetworkController init](&v29, "init");
  objc_storeStrong(&v31, v31);
  if (v31)
  {
    dispatch_queue_t v4 = dispatch_queue_create("TVSSNetworkController", 0LL);
    v5 = (void *)*((void *)v31 + 8);
    *((void *)v31 + 8) = v4;

    objc_storeStrong((id *)v31 + 1, location[0]);
    v6 = objc_alloc_init(&OBJC_CLASS___TVSObserverSet);
    v7 = (void *)*((void *)v31 + 2);
    *((void *)v31 + 2) = v6;

    id v8 = +[NWSystemPathMonitor sharedSystemPathMonitor](&OBJC_CLASS___NWSystemPathMonitor, "sharedSystemPathMonitor");
    v9 = (void *)*((void *)v31 + 4);
    *((void *)v31 + 4) = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NEConfigurationManager);
    v11 = (void *)*((void *)v31 + 5);
    *((void *)v31 + 5) = v10;

    v19 = &_dispatch_main_q;
    dispatch_source_t v12 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_or, 0LL, 0LL, v19);
    v13 = (void *)*((void *)v31 + 3);
    *((void *)v31 + 3) = v12;

    objc_initWeak(&v28, v31);
    source = (dispatch_source_s *)*((void *)v31 + 3);
    v22 = _NSConcreteStackBlock;
    int v23 = -1073741824;
    int v24 = 0;
    v25 = sub_10004695C;
    v26 = &unk_1001B75D0;
    objc_copyWeak(&v27, &v28);
    dispatch_source_set_event_handler(source, &v22);
    dispatch_resume(*((dispatch_object_t *)v31 + 3));
    id v18 = [*((id *)v31 + 1) wifiInterface];
    id v21 = [v18 associatedNetwork];

    [v31 setCurrentWiFiNetwork:v21];
    [v31 _startObservingNotifications];
    [v31 _startObservingNetworkInterfaceKVONotifications];
    [v31 _startObservingNetworkInterfaceManager];
    [v31 _startObservingSystemPathMonitor];
    [v31 _startObservingConfigurationManager];
    [v31 _loadVPNConfigurations];
    id v14 = [v31 _latestNetworkState];
    v15 = (void *)*((void *)v31 + 6);
    *((void *)v31 + 6) = v14;

    objc_storeStrong(&v21, 0LL);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v28);
  }

  v17 = (TVSSNetworkController *)v31;
  objc_storeStrong(location, 0LL);
  objc_storeStrong(&v31, 0LL);
  return v17;
}

- (TVSSNetworkController)init
{
  v6 = self;
  dispatch_queue_t v4 = +[TVSSNetworkInterfaceManager sharedInstance](&OBJC_CLASS___TVSSNetworkInterfaceManager, "sharedInstance");
  v6 = 0LL;
  v6 = -[TVSSNetworkController initWithNetworkInterfaceManager:](self, "initWithNetworkInterfaceManager:");
  v5 = v6;

  objc_storeStrong((id *)&v6, 0LL);
  return v5;
}

- (void)dealloc
{
  dispatch_queue_t v4 = self;
  SEL v3 = a2;
  -[TVSSNetworkController invalidate](self, "invalidate");
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSNetworkController;
  -[TVSSNetworkController dealloc](&v2, "dealloc");
}

- (void)invalidate
{
  if (self->_publishNetworkStateDataSource)
  {
    dispatch_source_cancel((dispatch_source_t)self->_publishNetworkStateDataSource);
    objc_storeStrong((id *)&self->_publishNetworkStateDataSource, 0LL);
    -[TVSSNetworkController setCurrentWiFiNetwork:](self, "setCurrentWiFiNetwork:", 0LL);
    -[TVSSNetworkController _stopObservingNotifications](self, "_stopObservingNotifications");
    -[TVSSNetworkController _stopObservingNetworkInterfaceKVONotifications]( self,  "_stopObservingNetworkInterfaceKVONotifications");
    -[TVSSNetworkController _stopObservingNetworkInterfaceManager](self, "_stopObservingNetworkInterfaceManager");
    -[TVSSNetworkController _stopObservingSystemPathMonitor](self, "_stopObservingSystemPathMonitor");
    -[TVSSNetworkController _stopObservingConfigurationManager](self, "_stopObservingConfigurationManager");
  }

- (void)addObserver:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = -[TVSObserverSet addObserver:](v5->_observers, "addObserver:", location[0]);
  objc_storeStrong(location, 0LL);
}

- (void)removeObserver:(id)a3
{
  dispatch_queue_t v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSObserverSet removeObserver:](v4->_observers, "removeObserver:", location[0]);
  objc_storeStrong(location, 0LL);
}

- (void)_handleInternetAvailabilityChangedNotification:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)NetworkControllerLog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100014A50((uint64_t)v6, (uint64_t)"-[TVSSNetworkController _handleInternetAvailabilityChangedNotification:]");
    _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "%s: TVSNetworkUtilities internet availability change detected. Will update network state",  v6,  0xCu);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  -[TVSSNetworkController _notePublishNetworkStateNeeded](v5, "_notePublishNetworkStateNeeded");
  objc_storeStrong(location, 0LL);
}

- (void)_handlePhysicalNetworkStateChangedNotification:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)NetworkControllerLog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100014A50((uint64_t)v6, (uint64_t)"-[TVSSNetworkController _handlePhysicalNetworkStateChangedNotification:]");
    _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "%s: TVSNetworkUtilities physical network change detected. Will update network state",  v6,  0xCu);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  -[TVSSNetworkController _notePublishNetworkStateNeeded](v5, "_notePublishNetworkStateNeeded");
  objc_storeStrong(location, 0LL);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v33 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v31 = 0LL;
  objc_storeStrong(&v31, a4);
  id v30 = 0LL;
  objc_storeStrong(&v30, a5);
  objc_super v29 = a6;
  if (a6 == off_10021F250)
  {
    id v12 = [v30 objectForKey:NSKeyValueChangeNewKey];
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___TVSWiFiNetwork);
    id v13 = sub_1000472D8(v12, v6);

    v27[1] = v13;
    id v28 = v13;
    v27[0] = NetworkControllerLog();
    os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v27[0], OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_s *)v27[0];
      os_log_type_t type = v26;
      id v11 = -[TVSWiFiNetwork networkName](v33->_currentWiFiNetwork, "networkName");
      id v7 = v11;
      id v25 = v7;
      id v10 = [v28 networkName];
      id v24 = v10;
      sub_100047398( (uint64_t)v37,  (uint64_t)"-[TVSSNetworkController observeValueForKeyPath:ofObject:change:context:]",  (uint64_t)v7,  (uint64_t)v24);
      _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "%s: WiFi network change detected. Will update network state. oldNetwork=%@, newNetwork=%@",  v37,  0x20u);

      objc_storeStrong(&v24, 0LL);
      objc_storeStrong(&v25, 0LL);
    }

    objc_storeStrong(v27, 0LL);
    -[TVSSNetworkController setCurrentWiFiNetwork:](v33, "setCurrentWiFiNetwork:", v28);
    -[TVSSNetworkController _notePublishNetworkStateNeeded](v33, "_notePublishNetworkStateNeeded");
    objc_storeStrong(&v28, 0LL);
  }

  else if (v29 == off_10021F258)
  {
    id v23 = NetworkControllerLog();
    os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
    {
      sub_100014A50((uint64_t)v36, (uint64_t)"-[TVSSNetworkController observeValueForKeyPath:ofObject:change:context:]");
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v23,  v22,  "%s: Ethernet interface active change detected. Will update network state",  v36,  0xCu);
    }

    objc_storeStrong(&v23, 0LL);
    -[TVSSNetworkController _notePublishNetworkStateNeeded](v33, "_notePublishNetworkStateNeeded");
  }

  else if (v29 == off_10021F260)
  {
    id v21 = NetworkControllerLog();
    os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
    {
      sub_100014A50((uint64_t)v35, (uint64_t)"-[TVSSNetworkController observeValueForKeyPath:ofObject:change:context:]");
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v21,  v20,  "%s: WiFi signal strength change detected. Will update network state",  v35,  0xCu);
    }

    objc_storeStrong(&v21, 0LL);
    -[TVSSNetworkController _notePublishNetworkStateNeeded](v33, "_notePublishNetworkStateNeeded");
  }

  else if (v29 == off_10021F268)
  {
    os_log_t oslog = (os_log_t)NetworkControllerLog();
    os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_100014A50((uint64_t)v34, (uint64_t)"-[TVSSNetworkController observeValueForKeyPath:ofObject:change:context:]");
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  v18,  "%s: VPN active change detected. Will update network state",  v34,  0xCu);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    -[TVSSNetworkController _notePublishNetworkStateNeeded](v33, "_notePublishNetworkStateNeeded");
  }

  else
  {
    v17.receiver = v33;
    v17.super_class = (Class)&OBJC_CLASS___TVSSNetworkController;
    -[TVSSNetworkController observeValueForKeyPath:ofObject:change:context:]( &v17,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v31,  v30,  v29);
  }

  objc_storeStrong(&v30, 0LL);
  objc_storeStrong(&v31, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)networkInterfaceManager:(id)a3 didChangeInternetAvailability:(BOOL)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v6 = a4;
  os_log_t oslog = (os_log_t)NetworkControllerLog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100014A50( (uint64_t)v9,  (uint64_t)"-[TVSSNetworkController networkInterfaceManager:didChangeInternetAvailability:]");
    _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "%s: PBSSystemStatus internet availability change detected. Will update network state",  v9,  0xCu);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  -[TVSSNetworkController _notePublishNetworkStateNeeded](v8, "_notePublishNetworkStateNeeded");
  objc_storeStrong(location, 0LL);
}

- (id)succinctDescription
{
  id v3 = -[TVSSNetworkController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  id v11 = self;
  v10[1] = (id)a2;
  v10[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  id v2 = [v10[0] appendObject:v11->_networkState withName:@"networkState"];
  id v6 = v10[0];
  id v7 = -[TVSWiFiNetwork networkName](v11->_currentWiFiNetwork, "networkName");
  objc_msgSend(v6, "appendString:withName:");

  id v8 = v10[0];
  -[TVSWiFiNetwork signalStrength](v11->_currentWiFiNetwork, "signalStrength");
  id v4 = [v8 appendFloat:@"currentWiFiNetwork.signalStrength" withName:v3];
  id v9 = v10[0];
  objc_storeStrong(v10, 0LL);
  return v9;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 =  -[TVSSNetworkController descriptionBuilderWithMultilinePrefix:]( v7,  "descriptionBuilderWithMultilinePrefix:",  location[0]);
  id v5 = [v4 build];

  objc_storeStrong(location, 0LL);
  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = -[TVSSNetworkController succinctDescriptionBuilder](v7, "succinctDescriptionBuilder");
  [v5 setActiveMultilinePrefix:location[0]];
  id v4 = v5;
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (NSString)description
{
  return (NSString *)-[TVSSNetworkController succinctDescription](self, "succinctDescription", a2, self);
}

- (NSString)debugDescription
{
  return (NSString *)-[TVSSNetworkController descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL,  a2,  self);
}

- (void)setCurrentWiFiNetwork:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v4->_currentWiFiNetwork) {
    -[TVSWiFiNetwork removeObserver:forKeyPath:context:]( v4->_currentWiFiNetwork,  "removeObserver:forKeyPath:context:",  v4,  @"signalStrength",  off_10021F260);
  }
  objc_storeStrong((id *)&v4->_currentWiFiNetwork, location[0]);
  if (v4->_currentWiFiNetwork) {
    -[TVSWiFiNetwork addObserver:forKeyPath:options:context:]( v4->_currentWiFiNetwork,  "addObserver:forKeyPath:options:context:",  v4,  @"signalStrength",  1LL,  off_10021F260);
  }
  objc_storeStrong(location, 0LL);
}

- (void)_startObservingNotifications
{
  float v3 = self;
  v2[1] = (id)a2;
  v2[0] = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  objc_msgSend( v2[0],  "addObserver:selector:name:object:",  v3,  "_handleInternetAvailabilityChangedNotification:",  kATVInternetAvailabilityChanged);
  [v2[0] addObserver:v3 selector:"_handlePhysicalNetworkStateChangedNotification:" name:kATVPhysicalNetworkStateChanged object:0];
  objc_storeStrong(v2, 0LL);
}

- (void)_stopObservingNotifications
{
  float v3 = self;
  v2[1] = (id)a2;
  v2[0] = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  objc_msgSend(v2[0], "removeObserver:name:object:", v3, kATVInternetAvailabilityChanged);
  [v2[0] removeObserver:v3 name:kATVPhysicalNetworkStateChanged object:0];
  objc_storeStrong(v2, 0LL);
}

- (void)_startObservingNetworkInterfaceKVONotifications
{
  id v4 = self;
  v3[1] = (id)a2;
  v3[0] = -[TVSSNetworkInterfaceManaging ethernetInterface](self->_networkInterfaceManager, "ethernetInterface");
  objc_msgSend(v3[0], "addObserver:forKeyPath:options:context:", v4, @"active");
  id v2 = -[TVSSNetworkInterfaceManaging wifiInterface](v4->_networkInterfaceManager, "wifiInterface");
  [v2 addObserver:v4 forKeyPath:@"associatedNetwork" options:1 context:off_10021F250];
  objc_storeStrong(&v2, 0LL);
  objc_storeStrong(v3, 0LL);
}

- (void)_stopObservingNetworkInterfaceKVONotifications
{
  id v4 = self;
  v3[1] = (id)a2;
  v3[0] = -[TVSSNetworkInterfaceManaging ethernetInterface](self->_networkInterfaceManager, "ethernetInterface");
  [v3[0] removeObserver:v4 forKeyPath:@"active" context:off_10021F258];
  id v2 = -[TVSSNetworkInterfaceManaging wifiInterface](v4->_networkInterfaceManager, "wifiInterface");
  [v2 removeObserver:v4 forKeyPath:@"associatedNetwork" context:off_10021F250];
  objc_storeStrong(&v2, 0LL);
  objc_storeStrong(v3, 0LL);
}

- (void)_startObservingNetworkInterfaceManager
{
}

- (void)_stopObservingNetworkInterfaceManager
{
}

- (void)_startObservingSystemPathMonitor
{
}

- (void)_stopObservingSystemPathMonitor
{
}

- (void)_startObservingConfigurationManager
{
  id v11 = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  configurationManager = v11->_configurationManager;
  workQueue = v11->_workQueue;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_100047DA4;
  id v8 = &unk_1001B6120;
  objc_copyWeak(&v9, location);
  -[NEConfigurationManager setChangedQueue:andHandler:]( configurationManager,  "setChangedQueue:andHandler:",  workQueue,  &v4);
  objc_destroyWeak(&v9);
  objc_destroyWeak(location);
}

- (void)_stopObservingConfigurationManager
{
}

- (void)_loadVPNConfigurations
{
  v9[2] = self;
  v9[1] = (id)a2;
  configurationManager = self->_configurationManager;
  workQueue = self->_workQueue;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_100047EF0;
  id v8 = &unk_1001B7A58;
  v9[0] = self;
  -[NEConfigurationManager loadConfigurationsWithCompletionQueue:handler:]( configurationManager,  "loadConfigurationsWithCompletionQueue:handler:",  workQueue);
  objc_storeStrong(v9, 0LL);
}

- (void)_notePublishNetworkStateNeeded
{
  if (self->_publishNetworkStateDataSource) {
    dispatch_source_merge_data((dispatch_source_t)self->_publishNetworkStateDataSource, 1uLL);
  }
}

- (id)_latestNetworkState
{
  id v23 = self;
  SEL v22 = a2;
  id v11 = -[TVSSNetworkInterfaceManaging ethernetInterface](self->_networkInterfaceManager, "ethernetInterface");
  unsigned __int8 v12 = [v11 isActive];

  char v21 = v12 & 1;
  uint64_t v2 = 2LL;
  if ((v12 & 1) != 0) {
    uint64_t v2 = 1LL;
  }
  uint64_t v20 = v2;
  char v19 = 0;
  os_log_type_t v18 = 0LL;
  if ((v21 & 1) != 0)
  {
    char v19 = -[TVSSNetworkInterfaceManaging isInternetAvailable]( v23->_networkInterfaceManager,  "isInternetAvailable") & 1;
  }

  else
  {
    id v17 = -[TVSSNetworkController currentWiFiNetwork](v23, "currentWiFiNetwork");
    if (v17)
    {
      char v19 = -[TVSSNetworkInterfaceManaging isInternetAvailable]( v23->_networkInterfaceManager,  "isInternetAvailable") & 1;
      [v17 signalStrength];
      float v16 = v3 / 5.0;
      id v15 = [v17 networkName];
      id v4 = objc_alloc(&OBJC_CLASS___TVSSWifiNetworkState);
      *(float *)&double v5 = v16;
      int v6 = -[TVSSWifiNetworkState initWithNetworkName:signalStrength:]( v4,  "initWithNetworkName:signalStrength:",  v15,  v5);
      id v7 = v18;
      os_log_type_t v18 = v6;

      objc_storeStrong(&v15, 0LL);
    }

    objc_storeStrong(&v17, 0LL);
  }

  BOOL v14 = -[NSArray count](v23->_vpnConfigurations, "count") != 0;
  char v13 = -[NWSystemPathMonitor isVPNActive](v23->_systemPathMonitor, "isVPNActive") & 1;
  id v8 = objc_alloc(&OBJC_CLASS___TVSSNetworkState);
  id v10 = -[TVSSNetworkState initWithActiveInterfaceType:internetAvailable:wifiState:vpnConfigured:vpnActive:]( v8,  "initWithActiveInterfaceType:internetAvailable:wifiState:vpnConfigured:vpnActive:",  v20,  v19 & 1,  v18,  v14,  v13 & 1);
  objc_storeStrong((id *)&v18, 0LL);
  return v10;
}

- (void)_publishNetworkState
{
  float v16 = self;
  v15[1] = (id)a2;
  v15[0] = self->_networkState;
  id v14 = -[TVSSNetworkController _latestNetworkState](v16, "_latestNetworkState");
  if ([v14 isEqual:v16->_networkState])
  {
    id location = NetworkControllerLog();
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_INFO))
    {
      sub_100025AE4((uint64_t)v18, (uint64_t)"-[TVSSNetworkController _publishNetworkState]", (uint64_t)v15[0]);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)location,  v12,  "%s: Network state has not changed. Will *not* inform observers. state=%@",  v18,  0x16u);
    }

    objc_storeStrong(&location, 0LL);
  }

  else
  {
    objc_storeStrong((id *)&v16->_networkState, v14);
    id v11 = NetworkControllerLog();
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      sub_100047398( (uint64_t)v17,  (uint64_t)"-[TVSSNetworkController _publishNetworkState]",  (uint64_t)v15[0],  (uint64_t)v14);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  v10,  "%s: Updated network state. Will inform observers. oldState=%@, newState=%@",  v17,  0x20u);
    }

    objc_storeStrong(&v11, 0LL);
    observers = v16->_observers;
    float v3 = _NSConcreteStackBlock;
    int v4 = -1073741824;
    int v5 = 0;
    int v6 = sub_1000485B0;
    id v7 = &unk_1001B7A80;
    id v8 = v16;
    id v9 = v14;
    -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", &v3);
    objc_storeStrong(&v9, 0LL);
    objc_storeStrong((id *)&v8, 0LL);
  }

  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(v15, 0LL);
}

- (TVSSNetworkState)networkState
{
  return self->_networkState;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (TVSWiFiNetwork)currentWiFiNetwork
{
  return self->_currentWiFiNetwork;
}

- (NSArray)vpnConfigurations
{
  return self->_vpnConfigurations;
}

- (void)setVpnConfigurations:(id)a3
{
}

- (void).cxx_destruct
{
}

- (NSString)contentTitle
{
  int v5 = -[TVSSNetworkController networkState](self, "networkState");
  BOOL v6 = (id)-[TVSSNetworkState activeInterfaceType](v5, "activeInterfaceType") != (id)1;

  if (!v6) {
    return (NSString *)TVSSLocString(@"TVSSNetworkEthernetTitle");
  }
  float v3 = -[TVSSNetworkController networkState](self, "networkState");
  char v11 = 0;
  char v9 = 0;
  char v7 = 0;
  BOOL v4 = 0;
  if ((id)-[TVSSNetworkState activeInterfaceType](v3, "activeInterfaceType") == (id)2)
  {
    os_log_type_t v12 = -[TVSSNetworkController networkState](self, "networkState");
    char v11 = 1;
    os_log_type_t v10 = -[TVSSNetworkState wifiState](v12, "wifiState");
    char v9 = 1;
    id v8 = -[TVSSWifiNetworkState networkName](v10, "networkName");
    char v7 = 1;
    BOOL v4 = -[NSString length](v8, "length") != 0;
  }

  if ((v7 & 1) != 0) {

  }
  if ((v9 & 1) != 0) {
  if ((v11 & 1) != 0)
  }

  if (v4) {
    return (NSString *)TVSSWiFiLocString(@"TVSSNetworkWifiTitle_WIFI");
  }
  else {
    return (NSString *)TVSSLocString(@"TVSSNetworkNotConnectedTitle");
  }
}

- (UIImage)contentImage
{
  char v9 = -[TVSSNetworkController networkState](self, "networkState");
  BOOL v10 = (id)-[TVSSNetworkState activeInterfaceType](v9, "activeInterfaceType") != (id)1;

  if (!v10) {
    return (UIImage *)+[UIImage _systemImageNamed:](&OBJC_CLASS___UIImage, "_systemImageNamed:", @"ethernet");
  }
  char v7 = -[TVSSNetworkController networkState](self, "networkState");
  char v15 = 0;
  char v13 = 0;
  char v11 = 0;
  BOOL v8 = 0;
  if ((id)-[TVSSNetworkState activeInterfaceType](v7, "activeInterfaceType") == (id)2)
  {
    float v16 = -[TVSSNetworkController networkState](self, "networkState");
    char v15 = 1;
    id v14 = -[TVSSNetworkState wifiState](v16, "wifiState");
    char v13 = 1;
    os_log_type_t v12 = -[TVSSWifiNetworkState networkName](v14, "networkName");
    char v11 = 1;
    BOOL v8 = -[NSString length](v12, "length") != 0;
  }

  if ((v11 & 1) != 0) {

  }
  if ((v13 & 1) != 0) {
  if ((v15 & 1) != 0)
  }

  if (!v8) {
    return (UIImage *)+[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"wifi.slash");
  }
  int v5 = -[TVSSNetworkController networkState](self, "networkState");
  BOOL v4 = -[TVSSNetworkState wifiState](v5, "wifiState");
  -[TVSSWifiNetworkState signalStrength](v4, "signalStrength");
  float v6 = v3;

  return (UIImage *)  +[UIImage systemImageNamed:variableValue:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:variableValue:withConfiguration:",  @"wifi",  0LL,  v6);
}

- (NSString)contentText1
{
  int v5 = -[TVSSNetworkController networkState](self, "networkState");
  char v11 = 0;
  char v9 = 0;
  char v7 = 0;
  BOOL v6 = 0;
  if ((id)-[TVSSNetworkState activeInterfaceType](v5, "activeInterfaceType") == (id)2)
  {
    os_log_type_t v12 = -[TVSSNetworkController networkState](self, "networkState");
    char v11 = 1;
    BOOL v10 = -[TVSSNetworkState wifiState](v12, "wifiState");
    char v9 = 1;
    BOOL v8 = -[TVSSWifiNetworkState networkName](v10, "networkName");
    char v7 = 1;
    BOOL v6 = -[NSString length](v8, "length") != 0;
  }

  if ((v7 & 1) != 0) {

  }
  if ((v9 & 1) != 0) {
  if ((v11 & 1) != 0)
  }

  if (!v6) {
    return (NSString *)0LL;
  }
  BOOL v4 = -[TVSSNetworkController networkState](self, "networkState");
  float v3 = -[TVSSNetworkState wifiState](v4, "wifiState");
  id v14 = -[TVSSWifiNetworkState networkName](v3, "networkName");

  return v14;
}

- (BOOL)contentIsSelected
{
  float v3 = -[TVSSNetworkController networkState](self, "networkState");
  BOOL v4 = -[TVSSNetworkState activeInterfaceType](v3, "activeInterfaceType") == 0;

  return !v4;
}

@end