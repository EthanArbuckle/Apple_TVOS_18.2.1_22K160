@interface SDServiceManager
- (NSMutableArray)companionStreams;
- (NSMutableArray)enabledServices;
- (NSMutableDictionary)streamHandlers;
- (NSString)bundleID;
- (NSString)managerID;
- (SDServiceManager)initWithClientProxy:(id)a3 withIdentifier:(id)a4;
- (SFCompanionServiceManagerClient)clientProxy;
- (id)streamHandlerForService:(id)a3;
- (void)companionStreamClosedStreams:(id)a3;
- (void)disableService:(id)a3;
- (void)enableService:(id)a3;
- (void)manager:(id)a3 connectedToService:(id)a4 withFileHandle:(id)a5 acceptHandler:(id)a6;
- (void)setBundleID:(id)a3;
- (void)setClientProxy:(id)a3;
- (void)setCompanionStreams:(id)a3;
- (void)setEnabledServices:(id)a3;
- (void)setStreamHandlers:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation SDServiceManager

- (SDServiceManager)initWithClientProxy:(id)a3 withIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___SDServiceManager;
  v9 = -[SDServiceManager init](&v19, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientProxy, a3);
    objc_storeStrong((id *)&v10->_managerID, a4);
    bundleID = v10->_bundleID;
    v10->_bundleID = (NSString *)&stru_1005E3958;

    v12 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    enabledServices = v10->_enabledServices;
    v10->_enabledServices = v12;

    v14 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    companionStreams = v10->_companionStreams;
    v10->_companionStreams = v14;

    v16 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    streamHandlers = v10->_streamHandlers;
    v10->_streamHandlers = v16;
  }

  return v10;
}

- (void)start
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[SDStreamManager sharedManager](&OBJC_CLASS___SDStreamManager, "sharedManager"));
  [v3 registerManager:self];
}

- (void)stop
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v3 = self->_enabledServices;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDStreamManager sharedManager](&OBJC_CLASS___SDStreamManager, "sharedManager", (void)v13));
        [v9 removeService:v8];

        v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDStreamManager sharedManager](&OBJC_CLASS___SDStreamManager, "sharedManager"));
        v11 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
        [v10 closeStreamsForIdentifier:v11];

        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_enabledServices, "removeAllObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDStreamManager sharedManager](&OBJC_CLASS___SDStreamManager, "sharedManager"));
  [v12 unregisterManager:self];
}

- (id)streamHandlerForService:(id)a3
{
  streamHandlers = self->_streamHandlers;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](streamHandlers, "objectForKeyedSubscript:", v4));

  return v5;
}

- (void)enableService:(id)a3
{
  enabledServices = self->_enabledServices;
  id v4 = a3;
  -[NSMutableArray addObject:](enabledServices, "addObject:", v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[SDStreamManager sharedManager](&OBJC_CLASS___SDStreamManager, "sharedManager"));
  [v5 addService:v4];
}

- (void)disableService:(id)a3
{
  id v5 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDStreamManager sharedManager](&OBJC_CLASS___SDStreamManager, "sharedManager"));
  [v4 removeService:v5];

  -[NSMutableArray removeObject:](self->_enabledServices, "removeObject:", v5);
}

- (void)manager:(id)a3 connectedToService:(id)a4 withFileHandle:(id)a5 acceptHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int128 v14 = v13;
  if (v11)
  {
    if (v12)
    {
      clientProxy = self->_clientProxy;
      if (clientProxy)
      {
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472LL;
        v16[2] = sub_100117F28;
        v16[3] = &unk_1005CB098;
        id v17 = v13;
        -[SFCompanionServiceManagerClient streamToService:withFileHandle:acceptReply:]( clientProxy,  "streamToService:withFileHandle:acceptReply:",  v11,  v12,  v16);
        [v12 closeFile];
      }
    }
  }
}

- (void)companionStreamClosedStreams:(id)a3
{
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setBundleID:(id)a3
{
}

- (NSString)managerID
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (SFCompanionServiceManagerClient)clientProxy
{
  return (SFCompanionServiceManagerClient *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setClientProxy:(id)a3
{
}

- (NSMutableDictionary)streamHandlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setStreamHandlers:(id)a3
{
}

- (NSMutableArray)enabledServices
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setEnabledServices:(id)a3
{
}

- (NSMutableArray)companionStreams
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setCompanionStreams:(id)a3
{
}

- (void).cxx_destruct
{
}

@end