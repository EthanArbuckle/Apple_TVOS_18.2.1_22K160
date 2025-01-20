@interface RPNWEndpoint
+ (BOOL)addEndpointMapping:(id)a3 endpointID:(id)a4 applicationService:(id)a5 discoverySessionID:(id)a6 shouldAutomapListener:(BOOL)a7;
+ (BOOL)removeEndpointMapping:(id)a3 discoverySessionID:(id)a4 immediate:(BOOL)a5;
+ (BOOL)updateEndpointMapping:(id)a3 discoverySessionID:(id)a4;
+ (id)findEndpoint:(id)a3;
+ (id)listEndpointsForDiscoverySession:(id)a3;
+ (void)ageOutEndpointMapping:(id)a3;
+ (void)clearEndpointMappings:(id)a3;
+ (void)endpointTimerFired;
+ (void)initialize;
+ (void)listEndpoints:(id)a3;
+ (void)removeDiscoverySessionFromAllEndpoints:(id)a3;
+ (void)startEndpointTimer;
+ (void)updateClientBrowseResult:(id)a3 browseResponse:(id)a4 agentUUID:(id)a5 agentClientPID:(int)a6 applicationService:(id)a7 discoverySessionID:(id)a8;
- (BOOL)browseSession;
- (BOOL)removeDiscoverySession:(id)a3 lastEntry:(BOOL *)a4;
- (BOOL)seenBySession:(id)a3;
- (BOOL)shouldAutomapListener;
- (NSDate)ageOutTimeout;
- (NSMutableArray)sessions;
- (NSString)applicationService;
- (NSUUID)endpointUUID;
- (RPCompanionLinkDevice)device;
- (RPNWEndpoint)init;
- (RPNWEndpoint)initWithDevice:(id)a3 applicationService:(id)a4 endpointID:(id)a5 discoverySessionID:(id)a6 shouldAutomapListener:(BOOL)a7;
- (id)description;
- (void)addSession:(id)a3;
- (void)dealloc;
- (void)setAgeOutTimeout:(id)a3;
- (void)setApplicationService:(id)a3;
- (void)setBrowseSession:(BOOL)a3;
- (void)setDevice:(id)a3;
- (void)setEndpointUUID:(id)a3;
- (void)setSessions:(id)a3;
- (void)setShouldAutomapListener:(BOOL)a3;
- (void)startAgeOutTimer;
@end

@implementation RPNWEndpoint

+ (void)initialize
{
  uint64_t v3 = objc_opt_self(&OBJC_CLASS___RPNWEndpoint, a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);

  if (v4 == a1)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v6 = (void *)qword_100133400;
    qword_100133400 = (uint64_t)v5;

    +[RPNWEndpoint startEndpointTimer](&OBJC_CLASS___RPNWEndpoint, "startEndpointTimer");
  }

- (RPNWEndpoint)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPNWEndpoint;
  v2 = -[RPNWEndpoint init](&v6, "init");
  uint64_t v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

- (RPNWEndpoint)initWithDevice:(id)a3 applicationService:(id)a4 endpointID:(id)a5 discoverySessionID:(id)a6 shouldAutomapListener:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___RPNWEndpoint;
  v16 = -[RPNWEndpoint init](&v21, "init");
  v17 = v16;
  if (v16)
  {
    -[RPNWEndpoint setDevice:](v16, "setDevice:", v12);
    -[RPNWEndpoint setApplicationService:](v17, "setApplicationService:", v13);
    -[RPNWEndpoint setEndpointUUID:](v17, "setEndpointUUID:", v14);
    -[RPNWEndpoint setShouldAutomapListener:](v17, "setShouldAutomapListener:", v7);
    v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[RPNWEndpoint setSessions:](v17, "setSessions:", v18);

    if (v15)
    {
      -[RPNWEndpoint addSession:](v17, "addSession:", v15);
      -[RPNWEndpoint setBrowseSession:](v17, "setBrowseSession:", 1LL);
    }

    v19 = v17;
  }

  return v17;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___RPNWEndpoint;
  -[RPNWEndpoint dealloc](&v2, "dealloc");
}

- (id)description
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"RPNWEndpoint[%@:%@] '%@'",  self->_applicationService,  self->_endpointUUID,  self->_device);
  ageOutTimeout = self->_ageOutTimeout;
  if (ageOutTimeout)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    -[NSDate timeIntervalSinceDate:](ageOutTimeout, "timeIntervalSinceDate:", v5);
    double v7 = v6;

    if (v7 >= 0.0)
    {
      double v10 = v7;
      v8 = @" ageOut=%.0fs ";
    }

    else
    {
      v8 = @" ageOut=stale ";
    }

    -[NSMutableString appendFormat:](v3, "appendFormat:", v8, *(void *)&v10);
  }

  return v3;
}

- (void)startAgeOutTimer
{
  uint64_t v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 180.0));
  ageOutTimeout = self->_ageOutTimeout;
  self->_ageOutTimeout = v3;
}

- (void)addSession:(id)a3
{
  ageOutTimeout = self->_ageOutTimeout;
  self->_ageOutTimeout = 0LL;
}

- (BOOL)seenBySession:(id)a3
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v5 = self->_sessions;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)i), "isEqual:", v4, (void)v10))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

- (BOOL)removeDiscoverySession:(id)a3 lastEntry:(BOOL *)a4
{
  id v6 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v7 = self->_sessions;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        __int128 v11 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if (objc_msgSend(v11, "isEqual:", v6, (void)v13))
        {
          -[NSMutableArray removeObject:](self->_sessions, "removeObject:", v11);
          LODWORD(v8) = 1;
          goto LABEL_11;
        }
      }

      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      if (v8) {
        continue;
      }
      break;
    }
  }

+ (id)listEndpointsForDiscoverySession:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = (id)qword_100133400;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue( [(id)qword_100133400 objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * (void)v9)]);
        if ([v10 seenBySession:v3])
        {
          __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 description]);
          -[NSMutableString appendFormat:](v4, "appendFormat:", @"  %@\n", v11);
        }

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  return v4;
}

+ (void)startEndpointTimer
{
  objc_super v2 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent sharedNetworkAgent](&OBJC_CLASS___RPNWNetworkAgent, "sharedNetworkAgent"));
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v2 dispatchQueue]);
  dispatch_source_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v3);
  id v5 = (void *)qword_100133408;
  qword_100133408 = (uint64_t)v4;

  dispatch_source_set_event_handler((dispatch_source_t)qword_100133408, &stru_100113098);
  CUDispatchTimerSet(qword_100133408, 60.0, 60.0, 1.0);
  dispatch_activate((dispatch_object_t)qword_100133408);
}

+ (void)endpointTimerFired
{
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id obj = (id)qword_100133400;
  id v2 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
        id v7 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100133400 objectForKeyedSubscript:v6]);
        uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 ageOutTimeout]);
        if (v8)
        {
          uint64_t v9 = (void *)v8;
          __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
          __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v7 ageOutTimeout]);
          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v10 earlierDate:v11]);
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v7 ageOutTimeout]);

          if (v12 == v13)
          {
            if (dword_1001320C0 <= 30
              && (dword_1001320C0 != -1 || _LogCategory_Initialize(&dword_1001320C0, 30LL)))
            {
              LogPrintF( &dword_1001320C0,  "+[RPNWEndpoint endpointTimerFired]",  30LL,  "Endpoint aged out, removing endpoint '%@'\n",  v7);
            }

            [v14 addObject:v6];
          }
        }
      }

      id v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v3);
  }

  [(id)qword_100133400 removeObjectsForKeys:v14];
}

+ (void)removeDiscoverySessionFromAllEndpoints:(id)a3
{
  id v3 = a3;
  if (dword_1001320C0 <= 30 && (dword_1001320C0 != -1 || _LogCategory_Initialize(&dword_1001320C0, 30LL))) {
    LogPrintF( &dword_1001320C0,  "+[RPNWEndpoint removeDiscoverySessionFromAllEndpoints:]",  30LL,  "Starting timeout for endpoints for session '%@'",  v3);
  }
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v4 = (id)qword_100133400;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( [(id)qword_100133400 objectForKeyedSubscript:*(void *)(*((void *)&v10 + 1) + 8 * (void)i)]);
        [v9 removeDiscoverySession:v3 lastEntry:0];
      }

      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }
}

+ (BOOL)addEndpointMapping:(id)a3 endpointID:(id)a4 applicationService:(id)a5 discoverySessionID:(id)a6 shouldAutomapListener:(BOOL)a7
{
  BOOL v37 = a7;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (dword_1001320C0 <= 30 && (dword_1001320C0 != -1 || _LogCategory_Initialize(&dword_1001320C0, 30LL))) {
    LogPrintF( &dword_1001320C0,  "+[RPNWEndpoint addEndpointMapping:endpointID:applicationService:discoverySessionID:shouldAutomapListener:]",  30LL,  "Adding endpoint mapping [%@:%@] for device '%@' and session '%@'\n",  v12,  v11,  v10,  v13);
  }
  id v38 = v12;
  id v39 = v13;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v14 = (RPNWEndpoint *)(id)qword_100133400;
  id v15 = -[RPNWEndpoint countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v45,  v50,  16LL);
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v46;
    while (2)
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v46 != v17) {
          objc_enumerationMutation(v14);
        }
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( [(id)qword_100133400 objectForKeyedSubscript:*(void *)(*((void *)&v45 + 1) + 8 * (void)i)]);
        v20 = (void *)objc_claimAutoreleasedReturnValue([v19 device]);
        if ([v20 isEqualToDevice:v10])
        {
          objc_super v21 = (void *)objc_claimAutoreleasedReturnValue([v19 endpointUUID]);
          unsigned int v22 = [v21 isEqual:v11];

          if (v22)
          {
            if (dword_1001320C0 <= 40
              && (dword_1001320C0 != -1 || _LogCategory_Initialize(&dword_1001320C0, 40LL)))
            {
              LogPrintF( &dword_1001320C0,  "+[RPNWEndpoint addEndpointMapping:endpointID:applicationService:discoverySessionID:shouldAutomapListener:]",  40LL,  "Found existing endpoint '%@'\n",  v10);
            }

            v23 = v39;
            v24 = v11;
            v25 = v38;
            if (v39 && ([v19 seenBySession:v39] & 1) == 0)
            {
              [v19 addSession:v39];
              BOOL v26 = 1;
            }

            else
            {
              BOOL v26 = 0;
            }

            goto LABEL_50;
          }
        }

        else
        {
        }
      }

      id v16 = -[RPNWEndpoint countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v45,  v50,  16LL);
      if (v16) {
        continue;
      }
      break;
    }
  }

  v23 = v39;
  if (!v39)
  {
    if (dword_1001320C0 <= 40
      && (dword_1001320C0 != -1 || _LogCategory_Initialize(&dword_1001320C0, 40LL)))
    {
      LogPrintF( &dword_1001320C0,  "+[RPNWEndpoint addEndpointMapping:endpointID:applicationService:discoverySessionID:shouldAutomapListener:]",  40LL,  "Removing existing device mappings to other peers\n");
    }

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    id v27 = (id)qword_100133400;
    id v28 = [v27 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v42;
      do
      {
        for (j = 0LL; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v42 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = *(void *)(*((void *)&v41 + 1) + 8LL * (void)j);
          v33 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100133400 objectForKeyedSubscript:v32]);
          if (([v33 browseSession] & 1) == 0)
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue([v33 device]);
            unsigned __int8 v35 = [v34 isEqualToDevice:v10];

            if ((v35 & 1) == 0)
            {
              if (dword_1001320C0 <= 40
                && (dword_1001320C0 != -1 || _LogCategory_Initialize(&dword_1001320C0, 40LL)))
              {
                LogPrintF( &dword_1001320C0,  "+[RPNWEndpoint addEndpointMapping:endpointID:applicationService:discoverySessionID:shouldAutomapListener:]",  40LL,  "Removing endpoint '%@'\n",  v33);
              }

              [v40 addObject:v32];
            }
          }
        }

        id v29 = [v27 countByEnumeratingWithState:&v41 objects:v49 count:16];
      }

      while (v29);
    }

    [(id)qword_100133400 removeObjectsForKeys:v40];
    +[RPNWConnection stopAllOutgoingConnectionsNotForPeer:]( &OBJC_CLASS___RPNWConnection,  "stopAllOutgoingConnectionsNotForPeer:",  v10);

    v23 = 0LL;
  }

  v25 = v38;
  v24 = v11;
  __int128 v14 = -[RPNWEndpoint initWithDevice:applicationService:endpointID:discoverySessionID:shouldAutomapListener:]( objc_alloc(&OBJC_CLASS___RPNWEndpoint),  "initWithDevice:applicationService:endpointID:discoverySessionID:shouldAutomapListener:",  v10,  v38,  v11,  v23,  v37);
  if (dword_1001320C0 <= 40 && (dword_1001320C0 != -1 || _LogCategory_Initialize(&dword_1001320C0, 40LL))) {
    LogPrintF( &dword_1001320C0,  "+[RPNWEndpoint addEndpointMapping:endpointID:applicationService:discoverySessionID:shouldAutomapListener:]",  40LL,  "Found no existing endpoint, created new endpoint '%@'\n",  v14);
  }
  [(id)qword_100133400 setObject:v14 forKeyedSubscript:v11];
  BOOL v26 = 1;
LABEL_50:

  return v26;
}

+ (BOOL)updateEndpointMapping:(id)a3 discoverySessionID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (dword_1001320C0 <= 30 && (dword_1001320C0 != -1 || _LogCategory_Initialize(&dword_1001320C0, 30LL))) {
    LogPrintF( &dword_1001320C0,  "+[RPNWEndpoint updateEndpointMapping:discoverySessionID:]",  30LL,  "Updating endpoint for device '%@'",  v5);
  }
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = (id)qword_100133400;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    char v16 = 0;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = (void *)objc_claimAutoreleasedReturnValue( [(id)qword_100133400 objectForKeyedSubscript:*(void *)(*((void *)&v17 + 1) + 8 * (void)i)]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 device]);
        if ([v13 isEqualToDevice:v5])
        {
          unsigned int v14 = [v12 seenBySession:v6];

          if (v14)
          {
            if (dword_1001320C0 <= 40
              && (dword_1001320C0 != -1 || _LogCategory_Initialize(&dword_1001320C0, 40LL)))
            {
              LogPrintF( &dword_1001320C0,  "+[RPNWEndpoint updateEndpointMapping:discoverySessionID:]",  40LL,  "Found existing endpoint to update '%@'\n",  v12);
            }

            [v12 setDevice:v5];
            char v16 = 1;
          }
        }

        else
        {
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v9);
  }

  else
  {
    char v16 = 0;
  }

  return v16 & 1;
}

+ (void)ageOutEndpointMapping:(id)a3
{
  id v3 = a3;
  id v10 = v3;
  if (dword_1001320C0 <= 30)
  {
    if (dword_1001320C0 != -1 || (v4 = _LogCategory_Initialize(&dword_1001320C0, 30LL), id v3 = v10, v4))
    {
      LogPrintF(&dword_1001320C0, "+[RPNWEndpoint ageOutEndpointMapping:]", 30LL, "Age out endpoint with ID '%@'", v3);
      id v3 = v10;
    }
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWEndpoint findEndpoint:](&OBJC_CLASS___RPNWEndpoint, "findEndpoint:", v3));
  id v6 = v5;
  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 sessions]);
    id v8 = [v7 count];

    if (v8)
    {
      if (dword_1001320C0 <= 30
        && (dword_1001320C0 != -1 || _LogCategory_Initialize(&dword_1001320C0, 30LL)))
      {
        LogPrintF( &dword_1001320C0,  "+[RPNWEndpoint ageOutEndpointMapping:]",  30LL,  "Endpoint still owned by a discovery session",  v9);
      }
    }

    else
    {
      [v6 startAgeOutTimer];
    }
  }

  else if (dword_1001320C0 <= 30 {
         && (dword_1001320C0 != -1 || _LogCategory_Initialize(&dword_1001320C0, 30LL)))
  }
  {
    LogPrintF( &dword_1001320C0,  "+[RPNWEndpoint ageOutEndpointMapping:]",  30LL,  "Did not find endpoint with ID '%@'",  v10);
  }
}

+ (BOOL)removeEndpointMapping:(id)a3 discoverySessionID:(id)a4 immediate:(BOOL)a5
{
  BOOL v21 = a5;
  id v7 = a3;
  id v8 = a4;
  if (dword_1001320C0 <= 30 && (dword_1001320C0 != -1 || _LogCategory_Initialize(&dword_1001320C0, 30LL))) {
    LogPrintF( &dword_1001320C0,  "+[RPNWEndpoint removeEndpointMapping:discoverySessionID:immediate:]",  30LL,  "Removing endpoint '%@' for device '%@'",  a1,  v7);
  }
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v9 = (id)qword_100133400;
  id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    id v11 = v10;
    LOBYTE(v22) = 0;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)i);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100133400 objectForKeyedSubscript:v14]);
        char v16 = (void *)objc_claimAutoreleasedReturnValue([v15 device]);
        if ([v16 isEqualToDevice:v7])
        {
          unsigned int v17 = [v15 seenBySession:v8];

          if (v17)
          {
            char v23 = 0;
            unsigned int v22 = [v15 removeDiscoverySession:v8 lastEntry:&v23];
            if (v21)
            {
              if (v22) {
                BOOL v18 = v23 == 0;
              }
              else {
                BOOL v18 = 1;
              }
              if (!v18) {
                [v20 addObject:v14];
              }
            }
          }
        }

        else
        {
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v11);
  }

  else
  {
    LOBYTE(v22) = 0;
  }

  [(id)qword_100133400 removeObjectsForKeys:v20];
  return v22 & 1;
}

+ (void)clearEndpointMappings:(id)a3
{
  id v3 = a3;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v4 = (id)qword_100133400;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100133400 objectForKeyedSubscript:v9]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 device]);
        unsigned int v12 = [v11 isEqualToDevice:v3];

        if (v12) {
          [v13 addObject:v9];
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  [(id)qword_100133400 removeObjectsForKeys:v13];
}

+ (void)updateClientBrowseResult:(id)a3 browseResponse:(id)a4 agentUUID:(id)a5 agentClientPID:(int)a6 applicationService:(id)a7 discoverySessionID:(id)a8
{
  uint64_t v27 = *(void *)&a6;
  id v29 = a3;
  id v28 = (void (**)(id, void *))a4;
  id v12 = a5;
  id v13 = a7;
  id v14 = a8;
  id v15 = v13;
  id v16 = v14;
  v31 = (void *)nw_array_create();
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id obj = (id)qword_100133400;
  id v17 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  uint64_t v30 = v13;
  if (v17)
  {
    id v18 = v17;
    int v19 = 0;
    uint64_t v20 = *(void *)v34;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(obj);
        }
        unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue( [(id)qword_100133400 objectForKeyedSubscript:*(void *)(*((void *)&v33 + 1) + 8 * (void)i)]);
        if ([v22 seenBySession:v16])
        {
          char v23 = (void *)objc_claimAutoreleasedReturnValue( +[RPNWPeer createNWEndpointForEndpoint:agentID:applicationService:]( &OBJC_CLASS___RPNWPeer,  "createNWEndpointForEndpoint:agentID:applicationService:",  v22,  v12,  v15));
          if (dword_1001320C0 <= 30
            && (dword_1001320C0 != -1 || _LogCategory_Initialize(&dword_1001320C0, 30LL)))
          {
            LogPrintF( &dword_1001320C0,  "+[RPNWEndpoint updateClientBrowseResult:browseResponse:agentUUID:agentClientPID:applicationService:discoverySessionID:]",  30LL,  " %d -> %@",  (unsigned __int16)v19++,  v23);
            id v15 = v30;
          }

          nw_array_append(v31, v23);
        }
      }

      id v18 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }

    while (v18);
  }

  if (dword_1001320C0 <= 30 && (dword_1001320C0 != -1 || _LogCategory_Initialize(&dword_1001320C0, 30LL)))
  {
    id v24 = v29;
    __int128 v25 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    -[NSMutableString appendFormat:](v25, "appendFormat:", @"%p", v24);

    uint64_t count = nw_array_get_count(v31);
    LogPrintF( &dword_1001320C0,  "+[RPNWEndpoint updateClientBrowseResult:browseResponse:agentUUID:agentClientPID:applicationService:discoverySessionID:]",  30LL,  "Updated browse client [%d:%@] with %zu endpoints",  v27,  v25,  count);
  }

  v28[2](v28, v31);
}

+ (id)findEndpoint:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100133400 objectForKeyedSubscript:v3]);
  if (v4)
  {
    if (dword_1001320C0 <= 30
      && (dword_1001320C0 != -1 || _LogCategory_Initialize(&dword_1001320C0, 30LL)))
    {
      LogPrintF(&dword_1001320C0, "+[RPNWEndpoint findEndpoint:]", 30LL, "Found endpoint '%@'", v4);
    }

    id v5 = v4;
  }

  return v4;
}

+ (void)listEndpoints:(id)a3
{
  id v3 = a3;
  [v3 appendString:@"Discovered Endpoints\n"];
  p_cb = &OBJC_PROTOCOL___RTIInputSystemDelegate.cb;
  if ([(id)qword_100133400 count])
  {
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id obj = (id)qword_100133400;
    id v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v17 = *(void *)v23;
      do
      {
        uint64_t v7 = 0LL;
        do
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(obj);
          }
          id v8 = p_cb;
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( [*((id *)p_cb + 128) objectForKeyedSubscript:*(void *)(*((void *)&v22 + 1) + 8 * (void)v7)]);
          id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 description]);
          [v3 appendFormat:@"  %@\n", v10];

          __int128 v20 = 0u;
          __int128 v21 = 0u;
          __int128 v18 = 0u;
          __int128 v19 = 0u;
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 sessions]);
          id v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v19;
            do
            {
              id v15 = 0LL;
              do
              {
                if (*(void *)v19 != v14) {
                  objc_enumerationMutation(v11);
                }
                [v3 appendFormat:@"  + Discovered by session '%@'\n", *(void *)(*((void *)&v18 + 1) + 8 * (void)v15)];
                id v15 = (char *)v15 + 1;
              }

              while (v13 != v15);
              id v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
            }

            while (v13);
          }

          uint64_t v7 = (char *)v7 + 1;
          p_cb = v8;
        }

        while (v7 != v6);
        id v6 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
      }

      while (v6);
    }
  }

  else
  {
    [v3 appendString:@"  <empty>\n"];
  }
}

- (RPCompanionLinkDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NSUUID)endpointUUID
{
  return self->_endpointUUID;
}

- (void)setEndpointUUID:(id)a3
{
}

- (NSString)applicationService
{
  return self->_applicationService;
}

- (void)setApplicationService:(id)a3
{
}

- (BOOL)browseSession
{
  return self->_browseSession;
}

- (void)setBrowseSession:(BOOL)a3
{
  self->_browseSession = a3;
}

- (BOOL)shouldAutomapListener
{
  return self->_shouldAutomapListener;
}

- (void)setShouldAutomapListener:(BOOL)a3
{
  self->_shouldAutomapListener = a3;
}

- (NSMutableArray)sessions
{
  return self->_sessions;
}

- (void)setSessions:(id)a3
{
}

- (NSDate)ageOutTimeout
{
  return self->_ageOutTimeout;
}

- (void)setAgeOutTimeout:(id)a3
{
}

- (void).cxx_destruct
{
}

@end