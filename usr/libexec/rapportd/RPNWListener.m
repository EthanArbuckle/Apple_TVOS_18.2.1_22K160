@interface RPNWListener
+ (BOOL)addListenerAgentClient:(id)a3;
+ (id)addDeviceToApplicationServiceMapping:(id)a3 device:(id)a4 completion:(id)a5;
+ (id)findListenerForAgentClient:(id)a3 sender:(id)a4 browseRequest:(BOOL)a5;
+ (id)findListenerForID:(id)a3 applicationService:(id)a4 fromPeer:(id)a5;
+ (void)initialize;
+ (void)listAllowedApplicationServices:(id)a3;
+ (void)queryDeviceToApplicationServiceMapping:(id)a3 device:(id)a4 completion:(id)a5;
+ (void)removeListenerForApplicationService:(id)a3;
+ (void)setAutoMapping:(BOOL)a3;
+ (void)startListenerMappingTimeout:(id)a3;
- (BOOL)automapped;
- (BOOL)hasTriggeredConnection;
- (NSDate)ageOutTimeout;
- (NSDate)triggerTime;
- (NSMutableArray)incomingConnections;
- (NSMutableArray)listenerNotifications;
- (NSMutableArray)peerDevices;
- (NSString)applicationService;
- (NSUUID)mappingID;
- (OS_dispatch_source)ageOutListenerTimer;
- (RPNWAgentClient)agentClient;
- (RPNWConnection)triggeredConnection;
- (RPNWListener)init;
- (id)description;
- (id)getConnectionWithID:(id)a3;
- (id)longDescription;
- (id)removeTriggeredConnection;
- (int)pid;
- (void)addIncomingConnection:(id)a3;
- (void)dealloc;
- (void)markConnectionAsTriggered:(id)a3;
- (void)setAgeOutListenerTimer:(id)a3;
- (void)setAgeOutTimeout:(id)a3;
- (void)setAgentClient:(id)a3;
- (void)setApplicationService:(id)a3;
- (void)setAutomapped:(BOOL)a3;
- (void)setIncomingConnections:(id)a3;
- (void)setListenerNotifications:(id)a3;
- (void)setMappingID:(id)a3;
- (void)setPeerDevices:(id)a3;
- (void)setPid:(int)a3;
- (void)setTriggerTime:(id)a3;
- (void)setTriggeredConnection:(id)a3;
@end

@implementation RPNWListener

+ (void)initialize
{
  uint64_t v3 = objc_opt_self(&OBJC_CLASS___RPNWListener, a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);

  if (v4 == a1)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v6 = (void *)qword_1001332B8;
    qword_1001332B8 = (uint64_t)v5;
  }

- (RPNWListener)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___RPNWListener;
  v2 = -[RPNWListener init](&v11, "init");
  if (v2)
  {
    if (dword_1001317B0 <= 30
      && (dword_1001317B0 != -1 || _LogCategory_Initialize(&dword_1001317B0, 30LL)))
    {
      uint64_t v3 = v2;
      id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
      -[NSMutableString appendFormat:](v4, "appendFormat:", @"%p", v3);

      LogPrintF(&dword_1001317B0, "-[RPNWListener init]", 30LL, "Initializing RPNWListener[%@]\n", v4);
    }

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    peerDevices = v2->_peerDevices;
    v2->_peerDevices = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    listenerNotifications = v2->_listenerNotifications;
    v2->_listenerNotifications = v7;

    v9 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___RPNWListener;
  -[RPNWListener dealloc](&v2, "dealloc");
}

- (id)description
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  id v4 = self;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"%p", v4);

  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"RPNWListener[%@][%@]=%@ : ",  v5,  v4->_applicationService,  v4->_mappingID);
  ageOutTimeout = v4->_ageOutTimeout;
  if (ageOutTimeout)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    -[NSDate timeIntervalSinceDate:](ageOutTimeout, "timeIntervalSinceDate:", v7);
    uint64_t v9 = v8;

    -[NSMutableString appendFormat:](v3, "appendFormat:", @"ageOut=%.0fs ", v9);
  }

  else
  {
    -[NSMutableString appendString:](v3, "appendString:", @"ageOut=N/A ");
  }

  id v10 = objc_loadWeakRetained((id *)&v4->_agentClient);
  objc_super v11 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendFormat:](v11, "appendFormat:", @"%p", v10);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @"agentClient=%@ { ", v11);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v12 = v4->_peerDevices;
  id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      v16 = 0LL;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v19 + 1) + 8 * (void)v16) name]);
        -[NSMutableString appendFormat:](v3, "appendFormat:", @"'%@' ", v17);

        v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
    }

    while (v14);
  }

  -[NSMutableString appendString:](v3, "appendString:", @"}");
  return v3;
}

- (id)longDescription
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWListener description](self, "description"));
  -[NSMutableString appendString:](v3, "appendString:", v4);

  incomingConnections = self->_incomingConnections;
  if (incomingConnections && -[NSMutableArray count](incomingConnections, "count"))
  {
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"  Incoming Connections:\n");
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    v6 = self->_incomingConnections;
    id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        id v10 = 0LL;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"   + %@\n",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)v10));
          id v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      }

      while (v8);
    }
  }

  return v3;
}

+ (void)removeListenerForApplicationService:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1001332B8 objectForKeyedSubscript:v3]);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "incomingConnections", 0));
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) sendStatusUpdate:2];
        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }

  [(id)qword_1001332B8 removeObjectForKey:v3];
}

+ (id)addDeviceToApplicationServiceMapping:(id)a3 device:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void *, void))a5;
  if (dword_1001317B0 <= 30 && (dword_1001317B0 != -1 || _LogCategory_Initialize(&dword_1001317B0, 30LL)))
  {
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
    LogPrintF( &dword_1001317B0,  "+[RPNWListener addDeviceToApplicationServiceMapping:device:completion:]",  30LL,  "addDeviceToApplicationServiceMapping appSvc='%@' device='%@'\n",  v7,  v10);
  }

  if (v7)
  {
    __int128 v11 = (RPNWListener *)objc_claimAutoreleasedReturnValue([(id)qword_1001332B8 objectForKeyedSubscript:v7]);
    if (v11)
    {
      __int128 v12 = v11;
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWListener agentClient](v11, "agentClient"));

      if (v13) {
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWListener agentClient](v12, "agentClient"));
      }
      else {
        -[RPNWListener setPid:](v12, "setPid:", 0LL);
      }
    }

    else
    {
      __int128 v12 = objc_alloc_init(&OBJC_CLASS___RPNWListener);
      [(id)qword_1001332B8 setObject:v12 forKeyedSubscript:v7];
      -[RPNWListener setApplicationService:](v12, "setApplicationService:", v7);
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      -[RPNWListener setMappingID:](v12, "setMappingID:", v14);

      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[RPNWAgentClient findListenerAgentClientFromApplicationServiceName:]( &OBJC_CLASS___RPNWAgentClient,  "findListenerAgentClientFromApplicationServiceName:",  v7));
      if (v13)
      {
        -[RPNWListener setAgentClient:](v12, "setAgentClient:", v13);
        -[RPNWListener setPid:](v12, "setPid:", [v13 pid]);
      }

      else
      {
        +[RPNWListener startListenerMappingTimeout:](&OBJC_CLASS___RPNWListener, "startListenerMappingTimeout:", v7);
      }

      if (dword_1001317B0 <= 30
        && (dword_1001317B0 != -1 || _LogCategory_Initialize(&dword_1001317B0, 30LL)))
      {
        LogPrintF( &dword_1001317B0,  "+[RPNWListener addDeviceToApplicationServiceMapping:device:completion:]",  30LL,  "Created new listener %@\n",  v12);
      }
    }

    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWListener peerDevices](v12, "peerDevices"));
    [v15 addObject:v8];

    if (v9)
    {
      if (v13)
      {
        if (dword_1001317B0 <= 30
          && (dword_1001317B0 != -1 || _LogCategory_Initialize(&dword_1001317B0, 30LL)))
        {
          LogPrintF( &dword_1001317B0,  "+[RPNWListener addDeviceToApplicationServiceMapping:device:completion:]",  30LL,  "agentClient already created, notifying client\n");
        }

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWListener mappingID](v12, "mappingID"));
        v9[2](v9, v16, 0LL);
      }

      else
      {
        if (dword_1001317B0 <= 30
          && (dword_1001317B0 != -1 || _LogCategory_Initialize(&dword_1001317B0, 30LL)))
        {
          LogPrintF( &dword_1001317B0,  "+[RPNWListener addDeviceToApplicationServiceMapping:device:completion:]",  30LL,  "No agentClient created, saving client\n");
        }

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWListener listenerNotifications](v12, "listenerNotifications"));
        v17 = objc_retainBlock(v9);
        [v16 addObject:v17];
      }
    }
  }

  else
  {
    if (dword_1001317B0 <= 90
      && (dword_1001317B0 != -1 || _LogCategory_Initialize(&dword_1001317B0, 90LL)))
    {
      LogPrintF( &dword_1001317B0,  "+[RPNWListener addDeviceToApplicationServiceMapping:device:completion:]",  90LL,  "Invalid appSvc, could not add mapping");
    }

    __int128 v12 = 0LL;
  }

  return v12;
}

+ (void)queryDeviceToApplicationServiceMapping:(id)a3 device:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void *, void))a5;
  if (dword_1001317B0 <= 30 && (dword_1001317B0 != -1 || _LogCategory_Initialize(&dword_1001317B0, 30LL)))
  {
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
    LogPrintF( &dword_1001317B0,  "+[RPNWListener queryDeviceToApplicationServiceMapping:device:completion:]",  30LL,  "queryDeviceToApplicationServiceMapping appSvc='%@' device='%@'\n",  v7,  v10);
  }

  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1001332B8 objectForKeyedSubscript:v7]);
  __int128 v12 = v11;
  if (v11
    && (__int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v11 agentClient]), v13, v13))
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v12 peerDevices]);
    id v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v22;
      while (2)
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          __int128 v19 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
          if ([v19 isEqualToDevice:v8])
          {
            if (dword_1001317B0 <= 30
              && (dword_1001317B0 != -1 || _LogCategory_Initialize(&dword_1001317B0, 30LL)))
            {
              LogPrintF( &dword_1001317B0,  "+[RPNWListener queryDeviceToApplicationServiceMapping:device:completion:]",  30LL,  "Found matching device '%@'\n",  v19);
            }

            __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v12 mappingID]);
            v9[2](v9, v20, 0LL);

            goto LABEL_31;
          }
        }

        id v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    if (dword_1001317B0 <= 30
      && (dword_1001317B0 != -1 || _LogCategory_Initialize(&dword_1001317B0, 30LL)))
    {
      LogPrintF( &dword_1001317B0,  "+[RPNWListener queryDeviceToApplicationServiceMapping:device:completion:]",  30LL,  "No matching device\n");
    }
  }

  else if (dword_1001317B0 <= 30 {
         && (dword_1001317B0 != -1 || _LogCategory_Initialize(&dword_1001317B0, 30LL)))
  }
  {
    LogPrintF( &dword_1001317B0,  "+[RPNWListener queryDeviceToApplicationServiceMapping:device:completion:]",  30LL,  "No listener for this application service\n");
  }

  v9[2](v9, 0LL, 0LL);
LABEL_31:
}

+ (BOOL)addListenerAgentClient:(id)a3
{
  id v3 = a3;
  id v4 = (void *)qword_1001332B8;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 applicationService]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  if (!v6)
  {
    if (dword_1001317B0 <= 40
      && (dword_1001317B0 != -1 || _LogCategory_Initialize(&dword_1001317B0, 40LL)))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 applicationService]);
      LogPrintF( &dword_1001317B0,  "+[RPNWListener addListenerAgentClient:]",  40LL,  "Could not find registered listener for appSvc=%@\n",  v8);
    }

    goto LABEL_47;
  }

  if (dword_1001317B0 <= 40 && (dword_1001317B0 != -1 || _LogCategory_Initialize(&dword_1001317B0, 40LL)))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 applicationService]);
    LogPrintF( &dword_1001317B0,  "+[RPNWListener addListenerAgentClient:]",  40LL,  "Found registered listener %@ for appSvc=%@\n",  v6,  v7);
  }

  if ([v6 pid])
  {
    unsigned int v9 = [v6 pid];
    if (v9 != [v3 pid])
    {
      if (dword_1001317B0 <= 40
        && (dword_1001317B0 != -1 || _LogCategory_Initialize(&dword_1001317B0, 40LL)))
      {
        LogPrintF( &dword_1001317B0,  "+[RPNWListener addListenerAgentClient:]",  40,  "Agent client PID (was %d, now %d) has changed, removing stale listener\n",  [v6 pid],  objc_msgSend(v3, "pid"));
      }

      v28 = (void *)objc_claimAutoreleasedReturnValue([v3 applicationService]);
      +[RPNWListener removeListenerForApplicationService:]( &OBJC_CLASS___RPNWListener,  "removeListenerForApplicationService:",  v28);

LABEL_47:
      BOOL v27 = 0;
      goto LABEL_48;
    }
  }

  if (dword_1001317B0 <= 30 && (dword_1001317B0 != -1 || _LogCategory_Initialize(&dword_1001317B0, 30LL)))
  {
    id v10 = v3;
    __int128 v11 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    -[NSMutableString appendFormat:](v11, "appendFormat:", @"%p", v10);

    LogPrintF( &dword_1001317B0,  "+[RPNWListener addListenerAgentClient:]",  30LL,  "Adding RPNWAgentClient[%@] to %@\n",  v11,  v6);
  }

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v6 ageOutListenerTimer]);

  if (v12)
  {
    if (dword_1001317B0 <= 40
      && (dword_1001317B0 != -1 || _LogCategory_Initialize(&dword_1001317B0, 40LL)))
    {
      LogPrintF( &dword_1001317B0,  "+[RPNWListener addListenerAgentClient:]",  40LL,  "Canceling listener age out timer for listener");
    }

    __int128 v13 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v6 ageOutListenerTimer]);
    dispatch_source_cancel(v13);

    [v6 setAgeOutTimeout:0];
    [v6 setAgeOutListenerTimer:0];
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v6 incomingConnections]);
  id v15 = [v14 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v34 + 1) + 8 * (void)i) sendStatusUpdate:3];
      }

      id v16 = [v14 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }

    while (v16);
  }

  [v6 setAgentClient:v3];
  objc_msgSend(v6, "setPid:", objc_msgSend(v3, "pid"));
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v6 listenerNotifications]);
  id v20 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v31;
    do
    {
      for (j = 0LL; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v30 + 1) + 8LL * (void)j);
        if (dword_1001317B0 <= 30
          && (dword_1001317B0 != -1 || _LogCategory_Initialize(&dword_1001317B0, 30LL)))
        {
          LogPrintF( &dword_1001317B0,  "+[RPNWListener addListenerAgentClient:]",  30LL,  "Listener already registered, notifying client\n");
        }

        v25 = (void *)objc_claimAutoreleasedReturnValue([v6 mappingID]);
        (*(void (**)(uint64_t, void *, void))(v24 + 16))(v24, v25, 0LL);
      }

      id v21 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }

    while (v21);
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue([v6 listenerNotifications]);
  [v26 removeAllObjects];

  BOOL v27 = 1;
LABEL_48:

  return v27;
}

+ (void)startListenerMappingTimeout:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1001332B8 objectForKeyedSubscript:v3]);
  if (v4)
  {
    if (dword_1001317B0 <= 40
      && (dword_1001317B0 != -1 || _LogCategory_Initialize(&dword_1001317B0, 40LL)))
    {
      LogPrintF( &dword_1001317B0,  "+[RPNWListener startListenerMappingTimeout:]",  40LL,  "Starting age-out timer for listener=%@\n",  v4);
    }

    [v4 setAgentClient:0];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 180.0));
    [v4 setAgeOutTimeout:v5];

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent sharedNetworkAgent](&OBJC_CLASS___RPNWNetworkAgent, "sharedNetworkAgent"));
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 dispatchQueue]);
    dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v7);
    [v4 setAgeOutListenerTimer:v8];

    unsigned int v9 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v4 ageOutListenerTimer]);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10003F0DC;
    handler[3] = &unk_100111968;
    id v10 = v4;
    id v14 = v10;
    id v15 = v3;
    dispatch_source_set_event_handler(v9, handler);

    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 ageOutListenerTimer]);
    CUDispatchTimerSet(v11, 180.0, -1.0, 1.0);

    __int128 v12 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue([v10 ageOutListenerTimer]);
    dispatch_activate(v12);
  }
}

+ (id)findListenerForID:(id)a3 applicationService:(id)a4 fromPeer:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (dword_1001317B0 <= 30 && (dword_1001317B0 != -1 || _LogCategory_Initialize(&dword_1001317B0, 30LL)))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent getLogInfo](&OBJC_CLASS___RPNWNetworkAgent, "getLogInfo"));
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
    LogPrintF( &dword_1001317B0,  "+[RPNWListener findListenerForID:applicationService:fromPeer:]",  30LL,  "%@ Finding listener agent client for listener ID=%@, appSvc=%@, peer=%@\n",  v10,  v7,  v8,  v11);
  }

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1001332B8 objectForKeyedSubscript:v8]);
  if (!v12)
  {
    if (dword_1001317B0 <= 30
      && (dword_1001317B0 != -1 || _LogCategory_Initialize(&dword_1001317B0, 30LL)))
    {
      LogPrintF( &dword_1001317B0,  "+[RPNWListener findListenerForID:applicationService:fromPeer:]",  30LL,  "Found no matching appSvc\n");
    }

+ (id)findListenerForAgentClient:(id)a3 sender:(id)a4 browseRequest:(BOOL)a5
{
  BOOL v17 = a5;
  id v6 = a3;
  id v7 = a4;
  if (dword_1001317B0 <= 30 && (dword_1001317B0 != -1 || _LogCategory_Initialize(&dword_1001317B0, 30LL))) {
    LogPrintF( &dword_1001317B0,  "+[RPNWListener findListenerForAgentClient:sender:browseRequest:]",  30LL,  "Finding listener mapping for agent client=%@\n",  v6);
  }
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v8 = (id)qword_1001332B8;
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( [(id)qword_1001332B8 objectForKeyedSubscript:*(void *)(*((void *)&v18 + 1) + 8 * (void)i)]);
        id v14 = (id)objc_claimAutoreleasedReturnValue([v13 agentClient]);

        if (v14 == v6)
        {
          if (dword_1001317B0 <= 30
            && (dword_1001317B0 != -1 || _LogCategory_Initialize(&dword_1001317B0, 30LL)))
          {
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 mappingID]);
            LogPrintF( &dword_1001317B0,  "+[RPNWListener findListenerForAgentClient:sender:browseRequest:]",  30LL,  "Found listener mapping=%@\n",  v15);
          }

          goto LABEL_31;
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  if (dword_1001317B0 <= 90 && (dword_1001317B0 != -1 || _LogCategory_Initialize(&dword_1001317B0, 90LL))) {
    LogPrintF( &dword_1001317B0,  "+[RPNWListener findListenerForAgentClient:sender:browseRequest:]",  90LL,  "Failed to find listener mapping for agent client\n");
  }
  if (v7 && (byte_1001332C0 || v17))
  {
    if (dword_1001317B0 <= 40
      && (dword_1001317B0 != -1 || _LogCategory_Initialize(&dword_1001317B0, 40LL)))
    {
      LogPrintF( &dword_1001317B0,  "+[RPNWListener findListenerForAgentClient:sender:browseRequest:]",  40LL,  "Auto-mapping agent client\n");
    }

    id v8 = (id)objc_claimAutoreleasedReturnValue([v6 applicationService]);
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[RPNWListener addDeviceToApplicationServiceMapping:device:completion:]( &OBJC_CLASS___RPNWListener,  "addDeviceToApplicationServiceMapping:device:completion:",  v8,  v7,  0LL));
LABEL_31:
  }

  else
  {
    __int128 v13 = 0LL;
  }

  return v13;
}

- (void)addIncomingConnection:(id)a3
{
  id v4 = a3;
  incomingConnections = self->_incomingConnections;
  id v8 = v4;
  if (!incomingConnections)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v7 = self->_incomingConnections;
    self->_incomingConnections = v6;

    id v4 = v8;
    incomingConnections = self->_incomingConnections;
  }

  -[NSMutableArray addObject:](incomingConnections, "addObject:", v4);
}

- (id)getConnectionWithID:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v5 = self->_incomingConnections;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "connectionUUID", (void)v13));
        unsigned __int8 v11 = [v10 isEqual:v4];

        if ((v11 & 1) != 0)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

- (BOOL)hasTriggeredConnection
{
  if (dword_1001317B0 <= 40 && (dword_1001317B0 != -1 || _LogCategory_Initialize(&dword_1001317B0, 40LL))) {
    LogPrintF( &dword_1001317B0,  "-[RPNWListener hasTriggeredConnection]",  40LL,  "Checking for existing triggered connection\n");
  }
  if (!self->_triggeredConnection)
  {
    if (dword_1001317B0 <= 40)
    {
      if (dword_1001317B0 == -1)
      {
        int v7 = _LogCategory_Initialize(&dword_1001317B0, 40LL);
        if (!v7) {
          return v7;
        }
      }

      LogPrintF( &dword_1001317B0,  "-[RPNWListener hasTriggeredConnection]",  40LL,  "No outstanding triggered connection\n");
    }

- (void)markConnectionAsTriggered:(id)a3
{
  id v5 = a3;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  triggerTime = self->_incomingConnections;
  int v7 = (char *)-[NSMutableArray countByEnumeratingWithState:objects:count:]( triggerTime,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
  if (v7)
  {
    id v8 = v7;
    id obj = a3;
    id v9 = 0LL;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      unsigned __int8 v11 = 0LL;
      BOOL v17 = &v8[(void)v9];
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(triggerTime);
        }
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v18 + 1) + 8 * (void)v11) connectionUUID]);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v5 connectionUUID]);
        unsigned __int8 v14 = [v12 isEqual:v13];

        if ((v14 & 1) != 0)
        {

          if (dword_1001317B0 <= 40
            && (dword_1001317B0 != -1 || _LogCategory_Initialize(&dword_1001317B0, 40LL)))
          {
            LogPrintF( &dword_1001317B0,  "-[RPNWListener markConnectionAsTriggered:]",  40LL,  "Marking connection %@ triggered\n",  v5);
          }

          -[NSMutableArray removeObjectAtIndex:](self->_incomingConnections, "removeObjectAtIndex:", &v11[(void)v9]);
          objc_storeStrong((id *)&self->_triggeredConnection, obj);
          __int128 v15 = (NSDate *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  2.0));
          triggerTime = (NSMutableArray *)self->_triggerTime;
          self->_triggerTime = v15;
          goto LABEL_15;
        }

        ++v11;
      }

      while (v8 != v11);
      id v8 = (char *)-[NSMutableArray countByEnumeratingWithState:objects:count:]( triggerTime,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
      id v9 = v17;
      if (v8) {
        continue;
      }
      break;
    }
  }

- (id)removeTriggeredConnection
{
  if (dword_1001317B0 <= 40 && (dword_1001317B0 != -1 || _LogCategory_Initialize(&dword_1001317B0, 40LL))) {
    LogPrintF( &dword_1001317B0,  "-[RPNWListener removeTriggeredConnection]",  40LL,  "Removing triggered connection %@\n",  self->_triggeredConnection);
  }
  id v3 = self->_triggeredConnection;
  triggeredConnection = self->_triggeredConnection;
  self->_triggeredConnection = 0LL;

  triggerTime = self->_triggerTime;
  self->_triggerTime = 0LL;

  return v3;
}

+ (void)listAllowedApplicationServices:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (byte_1001332C0) {
    id v5 = "on";
  }
  else {
    id v5 = "off";
  }
  objc_msgSend(v3, "appendFormat:", @"AutoMapping: %s\n", v5);
  [v4 appendString:@"Allowed Application Services\n"];
  if ([(id)qword_1001332B8 count])
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v6 = (id)qword_1001332B8;
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( [(id)qword_1001332B8 objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * (void)v10)]);
          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 longDescription]);
          [v4 appendFormat:@"  %@\n", v12];

          uint64_t v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v8);
    }
  }

  else
  {
    [v4 appendString:@"  <empty>\n"];
  }
}

+ (void)setAutoMapping:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001317B0 <= 40 && (dword_1001317B0 != -1 || _LogCategory_Initialize(&dword_1001317B0, 40LL)))
  {
    id v4 = "off";
    if (v3) {
      id v5 = "on";
    }
    else {
      id v5 = "off";
    }
    if (byte_1001332C0) {
      id v4 = "on";
    }
    LogPrintF( &dword_1001317B0,  "+[RPNWListener setAutoMapping:]",  40LL,  "Setting auto-mapping to %s (was %s)\n",  v5,  v4);
  }

  byte_1001332C0 = v3;
}

- (NSString)applicationService
{
  return self->_applicationService;
}

- (void)setApplicationService:(id)a3
{
}

- (NSUUID)mappingID
{
  return self->_mappingID;
}

- (void)setMappingID:(id)a3
{
}

- (NSMutableArray)peerDevices
{
  return self->_peerDevices;
}

- (void)setPeerDevices:(id)a3
{
}

- (NSMutableArray)listenerNotifications
{
  return self->_listenerNotifications;
}

- (void)setListenerNotifications:(id)a3
{
}

- (NSMutableArray)incomingConnections
{
  return self->_incomingConnections;
}

- (void)setIncomingConnections:(id)a3
{
}

- (RPNWConnection)triggeredConnection
{
  return self->_triggeredConnection;
}

- (void)setTriggeredConnection:(id)a3
{
}

- (NSDate)triggerTime
{
  return self->_triggerTime;
}

- (void)setTriggerTime:(id)a3
{
}

- (RPNWAgentClient)agentClient
{
  return (RPNWAgentClient *)objc_loadWeakRetained((id *)&self->_agentClient);
}

- (void)setAgentClient:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSDate)ageOutTimeout
{
  return self->_ageOutTimeout;
}

- (void)setAgeOutTimeout:(id)a3
{
}

- (OS_dispatch_source)ageOutListenerTimer
{
  return self->_ageOutListenerTimer;
}

- (void)setAgeOutListenerTimer:(id)a3
{
}

- (BOOL)automapped
{
  return self->_automapped;
}

- (void)setAutomapped:(BOOL)a3
{
  self->_automapped = a3;
}

- (void).cxx_destruct
{
}

@end