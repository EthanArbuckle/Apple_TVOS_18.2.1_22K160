@interface TVSSVPNController
- (BOOL)includesRelays;
- (NEConfigurationManager)configurationManager;
- (NSArray)configurations;
- (NSMutableDictionary)tvSSConfigurationsByIdentifier;
- (OS_dispatch_queue)workQueue;
- (TVSObserverSet)observers;
- (TVSSVPNConfiguration)activeConfiguration;
- (TVSSVPNController)init;
- (void)_notifyObserversConfigurationsChanged:(id)a3;
- (void)_updateConfigurationsWithNEConfigurations:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)loadConfigurations;
- (void)removeObserver:(id)a3;
- (void)saveConfiguration:(id)a3;
- (void)setActiveConfiguration:(id)a3;
- (void)setConfigurationManager:(id)a3;
- (void)setConfigurations:(id)a3;
- (void)setTvSSConfigurationsByIdentifier:(id)a3;
@end

@implementation TVSSVPNController

- (TVSSVPNController)init
{
  SEL v22 = a2;
  v23 = 0LL;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___TVSSVPNController;
  v23 = -[TVSSVPNController init](&v21, "init");
  objc_storeStrong((id *)&v23, v23);
  if (v23)
  {
    dispatch_queue_t v2 = dispatch_queue_create("TVSSVPNController", 0LL);
    workQueue = v23->_workQueue;
    v23->_workQueue = (OS_dispatch_queue *)v2;

    v4 = objc_alloc_init(&OBJC_CLASS___NEConfigurationManager);
    configurationManager = v23->_configurationManager;
    v23->_configurationManager = v4;

    v6 = objc_alloc_init(&OBJC_CLASS___TVSObserverSet);
    observers = v23->_observers;
    v23->_observers = v6;

    v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    tvSSConfigurationsByIdentifier = v23->_tvSSConfigurationsByIdentifier;
    v23->_tvSSConfigurationsByIdentifier = v8;

    -[TVSSVPNController loadConfigurations](v23, "loadConfigurations");
    objc_initWeak(&v20, v23);
    v12 = v23->_configurationManager;
    v13 = v23->_workQueue;
    v14 = _NSConcreteStackBlock;
    int v15 = -1073741824;
    int v16 = 0;
    v17 = sub_10000CF88;
    v18 = &unk_1001B6120;
    objc_copyWeak(&v19, &v20);
    -[NEConfigurationManager setChangedQueue:andHandler:](v12, "setChangedQueue:andHandler:", v13, &v14);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v20);
  }

  v11 = v23;
  objc_storeStrong((id *)&v23, 0LL);
  return v11;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[NEConfigurationManager setChangedQueue:andHandler:](self->_configurationManager, "setChangedQueue:andHandler:", 0LL);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSVPNController;
  -[TVSSVPNController dealloc](&v2, "dealloc");
}

- (void)loadConfigurations
{
  v11 = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  configurationManager = v11->_configurationManager;
  workQueue = v11->_workQueue;
  v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_10000D134;
  v8 = &unk_1001B6148;
  objc_copyWeak(&v9, location);
  -[NEConfigurationManager loadConfigurationsWithCompletionQueue:handler:]( configurationManager,  "loadConfigurationsWithCompletionQueue:handler:",  workQueue,  &v4);
  objc_destroyWeak(&v9);
  objc_destroyWeak(location);
}

- (void)saveConfiguration:(id)a3
{
  int v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_initWeak(&v13, v15);
  configurationManager = v15->_configurationManager;
  id v4 = location[0];
  workQueue = v15->_workQueue;
  int v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = sub_10000D408;
  v10 = &unk_1001B6170;
  id v11 = location[0];
  objc_copyWeak(&v12, &v13);
  -[NEConfigurationManager saveConfiguration:withCompletionQueue:handler:]( configurationManager,  "saveConfiguration:withCompletionQueue:handler:",  v4,  workQueue,  &v6);
  objc_destroyWeak(&v12);
  objc_storeStrong(&v11, 0LL);
  objc_destroyWeak(&v13);
  objc_storeStrong(location, 0LL);
}

- (void)setActiveConfiguration:(id)a3
{
  int v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v16->_activeConfiguration, location[0]);
  [location[0] setEnabled:1];
  id v9 = v16;
  id v10 = [location[0] neConfiguration];
  -[TVSSVPNController saveConfiguration:](v9, "saveConfiguration:");

  memset(__b, 0, sizeof(__b));
  obj = -[TVSSVPNController configurations](v16, "configurations");
  id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v17,  16LL);
  if (v12)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0LL;
    id v8 = v12;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      id v14 = *(id *)(__b[1] + 8 * v7);
      if (v14 != location[0] && ([v14 enabled] & 1) != 0)
      {
        [v14 setEnabled:0];
        SEL v3 = v16;
        id v4 = [v14 neConfiguration];
        -[TVSSVPNController saveConfiguration:](v3, "saveConfiguration:");
      }

      ++v7;
      if (v5 + 1 >= (unint64_t)v8)
      {
        uint64_t v7 = 0LL;
        id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v17,  16LL);
        if (!v8) {
          break;
        }
      }
    }
  }

  objc_storeStrong(location, 0LL);
}

- (void)addObserver:(id)a3
{
  uint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (location[0]) {
    id v3 = -[TVSObserverSet addObserver:](v5->_observers, "addObserver:", location[0]);
  }
  objc_storeStrong(location, 0LL);
}

- (void)removeObserver:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (location[0]) {
    -[TVSObserverSet removeObserver:](v4->_observers, "removeObserver:", location[0]);
  }
  objc_storeStrong(location, 0LL);
}

- (BOOL)includesRelays
{
  id v13 = self;
  SEL v12 = a2;
  memset(__b, 0, sizeof(__b));
  obj = -[TVSSVPNController configurations](v13, "configurations");
  id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v15,  16LL);
  if (v8)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0LL;
    id v6 = v8;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(id *)(__b[1] + 8 * v5);
      ++v5;
      if (v3 + 1 >= (unint64_t)v6)
      {
        uint64_t v5 = 0LL;
        id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v15,  16LL);
        if (!v6) {
          goto LABEL_9;
        }
      }
    }

    char v14 = 1;
    int v9 = 1;
  }

  else
  {
LABEL_9:
    int v9 = 0;
  }

  if (!v9) {
    char v14 = 0;
  }
  return v14 & 1;
}

- (void)_updateConfigurationsWithNEConfigurations:(id)a3
{
  v27 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v25 =  +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [location[0] count]);
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  id v18 = [obj countByEnumeratingWithState:__b objects:v28 count:16];
  if (v18)
  {
    uint64_t v14 = *(void *)__b[2];
    uint64_t v15 = 0LL;
    id v16 = v18;
    while (1)
    {
      uint64_t v13 = v15;
      if (*(void *)__b[2] != v14) {
        objc_enumerationMutation(obj);
      }
      id v24 = *(id *)(__b[1] + 8 * v15);
      SEL v12 = -[TVSSVPNController tvSSConfigurationsByIdentifier](v27, "tvSSConfigurationsByIdentifier");
      id v11 = [v24 identifier];
      id v22 = -[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:");

      if (v22)
      {
        [v22 updateWithNEConfiguration:v24];
      }

      else
      {
        uint64_t v3 = objc_alloc(&OBJC_CLASS___TVSSVPNConfiguration);
        uint64_t v4 = -[TVSSVPNConfiguration initWithNEConfiguration:](v3, "initWithNEConfiguration:", v24);
        id v5 = v22;
        id v22 = v4;

        id v8 = v22;
        id v10 = -[TVSSVPNController tvSSConfigurationsByIdentifier](v27, "tvSSConfigurationsByIdentifier");
        id v9 = [v24 identifier];
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v8);
      }

      -[NSMutableArray addObject:](v25, "addObject:", v22);
      id v6 = [v24 VPN];
      char v20 = 0;
      unsigned __int8 v7 = 1;
      if (([v6 isEnabled] & 1) == 0)
      {
        id v21 = [v24 relay];
        char v20 = 1;
        unsigned __int8 v7 = [v21 isEnabled];
      }

      if ((v20 & 1) != 0) {

      }
      if ((v7 & 1) != 0)
      {
        -[TVSSVPNController willChangeValueForKey:](v27, "willChangeValueForKey:");
        objc_storeStrong((id *)&v27->_activeConfiguration, v22);
        -[TVSSVPNController didChangeValueForKey:](v27, "didChangeValueForKey:", @"activeConfiguration");
      }

      objc_storeStrong(&v22, 0LL);
      ++v15;
      if (v13 + 1 >= (unint64_t)v16)
      {
        uint64_t v15 = 0LL;
        id v16 = [obj countByEnumeratingWithState:__b objects:v28 count:16];
        if (!v16) {
          break;
        }
      }
    }
  }

  id v19 = -[NSMutableArray copy](v25, "copy");
  -[TVSSVPNController setConfigurations:](v27, "setConfigurations:", v19);
  -[TVSSVPNController _notifyObserversConfigurationsChanged:](v27, "_notifyObserversConfigurationsChanged:", v19);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong((id *)&v25, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_notifyObserversConfigurationsChanged:(id)a3
{
  SEL v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  queue = &_dispatch_main_q;
  uint64_t v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  unsigned __int8 v7 = sub_10000E028;
  id v8 = &unk_1001B61C0;
  id v9 = v12;
  id v10 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v10, 0LL);
  objc_storeStrong((id *)&v9, 0LL);
  objc_storeStrong(location, 0LL);
}

- (NSArray)configurations
{
  return self->_configurations;
}

- (void)setConfigurations:(id)a3
{
}

- (TVSSVPNConfiguration)activeConfiguration
{
  return self->_activeConfiguration;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NEConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
}

- (NSMutableDictionary)tvSSConfigurationsByIdentifier
{
  return self->_tvSSConfigurationsByIdentifier;
}

- (void)setTvSSConfigurationsByIdentifier:(id)a3
{
}

- (TVSObserverSet)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
}

@end