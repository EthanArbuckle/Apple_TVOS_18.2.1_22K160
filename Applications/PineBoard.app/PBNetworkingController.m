@interface PBNetworkingController
- (BOOL)vpnConnected;
- (NEConfiguration)currentConfiguration;
- (NEConfiguration)previouslyConnectedConfiguration;
- (NEConfigurationManager)configurationManager;
- (NWSystemPathMonitor)systemPathMonitor;
- (OS_dispatch_queue)workQueue;
- (PBNetworkingController)init;
- (TVSObserverSet)observers;
- (void)_mainQueue_notifyObserversVPNStatusChanged:(BOOL)a3 currentConfigurationName:(id)a4;
- (void)_workQueue_loadConfigurationsWithCompletion:(id)a3;
- (void)_workQueue_notifyObserversVPNStatusChanged;
- (void)_workQueue_setupConfigurationManagerWithCompletion:(id)a3;
- (void)_workQueue_updateCurrentConfiguration:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeObserver:(id)a3;
- (void)setCurrentConfiguration:(id)a3;
- (void)setPreviouslyConnectedConfiguration:(id)a3;
- (void)setVpnConnected:(BOOL)a3;
@end

@implementation PBNetworkingController

- (PBNetworkingController)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PBNetworkingController;
  v2 = -[PBNetworkingController init](&v10, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___TVSObserverSet);
    observers = v2->_observers;
    v2->_observers = v3;

    dispatch_queue_t v5 = dispatch_queue_create("PBNetworkingController", 0LL);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NWSystemPathMonitor sharedSystemPathMonitor](&OBJC_CLASS___NWSystemPathMonitor, "sharedSystemPathMonitor"));
    systemPathMonitor = v2->_systemPathMonitor;
    v2->_systemPathMonitor = (NWSystemPathMonitor *)v7;

    -[NWSystemPathMonitor addObserver:forKeyPath:options:context:]( v2->_systemPathMonitor,  "addObserver:forKeyPath:options:context:",  v2,  @"vpnActive",  1LL,  off_10046C7D0);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBNetworkingController;
  -[PBNetworkingController dealloc](&v3, "dealloc");
}

- (void)addObserver:(id)a3
{
  if (a3) {
    id v3 = -[TVSObserverSet addObserver:](self->_observers, "addObserver:");
  }
}

- (void)removeObserver:(id)a3
{
  if (a3) {
    -[TVSObserverSet removeObserver:](self->_observers, "removeObserver:");
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_10046C7D0 == a6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "objectForKey:", NSKeyValueChangeNewKey, a4));
    unsigned __int8 v8 = [v7 BOOLValue];

    workQueue = (dispatch_queue_s *)self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001707D4;
    block[3] = &unk_1003D2008;
    unsigned __int8 v12 = v8;
    block[4] = self;
    dispatch_async(workQueue, block);
  }

  else
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___PBNetworkingController;
    -[PBNetworkingController observeValueForKeyPath:ofObject:change:context:]( &v10,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)_workQueue_setupConfigurationManagerWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = objc_alloc_init(&OBJC_CLASS___NEConfigurationManager);
  configurationManager = self->_configurationManager;
  self->_configurationManager = v5;

  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  uint64_t v7 = self->_configurationManager;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100170A0C;
  v12[3] = &unk_1003D0A60;
  objc_copyWeak(&v13, &location);
  -[NEConfigurationManager setChangedQueue:andHandler:](v7, "setChangedQueue:andHandler:", workQueue, v12);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100170A3C;
  v10[3] = &unk_1003D0110;
  id v9 = v4;
  id v11 = v9;
  -[PBNetworkingController _workQueue_loadConfigurationsWithCompletion:]( self,  "_workQueue_loadConfigurationsWithCompletion:",  v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_workQueue_loadConfigurationsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  configurationManager = self->_configurationManager;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100170B30;
  v8[3] = &unk_1003D9EE0;
  objc_copyWeak(&v10, &location);
  id v7 = v4;
  id v9 = v7;
  -[NEConfigurationManager loadConfigurationsWithCompletionQueue:handler:]( configurationManager,  "loadConfigurationsWithCompletionQueue:handler:",  workQueue,  v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_workQueue_updateCurrentConfiguration:(id)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(NEConfiguration **)(*((void *)&v12 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NEConfiguration VPN](v9, "VPN", (void)v12));
        unsigned int v11 = [v10 isEnabled];

        if (v11)
        {
          if (-[PBNetworkingController vpnConnected](self, "vpnConnected") && v9 != self->_currentConfiguration) {
            -[PBNetworkingController setPreviouslyConnectedConfiguration:](self, "setPreviouslyConnectedConfiguration:");
          }
          -[PBNetworkingController setCurrentConfiguration:](self, "setCurrentConfiguration:", v9);
          goto LABEL_14;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)_workQueue_notifyObserversVPNStatusChanged
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBNetworkingController currentConfiguration](self, "currentConfiguration"));
  if (objc_msgSend(v3, "tvcs_isAppleConnectOTAConfiguration"))
  {

LABEL_4:
    -[PBNetworkingController setPreviouslyConnectedConfiguration:](self, "setPreviouslyConnectedConfiguration:", 0LL);
    return;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBNetworkingController previouslyConnectedConfiguration](self, "previouslyConnectedConfiguration"));
  unsigned int v5 = objc_msgSend(v4, "tvcs_isAppleConnectOTAConfiguration");

  if (v5) {
    goto LABEL_4;
  }
  unsigned __int8 v6 = -[PBNetworkingController vpnConnected](self, "vpnConnected");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBNetworkingController previouslyConnectedConfiguration](self, "previouslyConnectedConfiguration"));
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }

  else
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBNetworkingController currentConfiguration](self, "currentConfiguration"));
    id v10 = (id)objc_claimAutoreleasedReturnValue([v11 name]);
  }

  -[PBNetworkingController setPreviouslyConnectedConfiguration:](self, "setPreviouslyConnectedConfiguration:", 0LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100170E58;
  block[3] = &unk_1003D1490;
  unsigned __int8 v15 = v6;
  block[4] = self;
  id v14 = v10;
  id v12 = v10;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)_mainQueue_notifyObserversVPNStatusChanged:(BOOL)a3 currentConfigurationName:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  observers = self->_observers;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100170F54;
  v9[3] = &unk_1003D9F08;
  objc_copyWeak(&v11, &location);
  BOOL v12 = a3;
  id v8 = v6;
  id v10 = v8;
  -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (NWSystemPathMonitor)systemPathMonitor
{
  return self->_systemPathMonitor;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NEConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (TVSObserverSet)observers
{
  return self->_observers;
}

- (BOOL)vpnConnected
{
  return self->_vpnConnected;
}

- (void)setVpnConnected:(BOOL)a3
{
  self->_vpnConnected = a3;
}

- (NEConfiguration)previouslyConnectedConfiguration
{
  return self->_previouslyConnectedConfiguration;
}

- (void)setPreviouslyConnectedConfiguration:(id)a3
{
}

- (NEConfiguration)currentConfiguration
{
  return self->_currentConfiguration;
}

- (void)setCurrentConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end