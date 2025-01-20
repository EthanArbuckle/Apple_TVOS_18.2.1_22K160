@interface RPNWNearbyInvitationEndpoint
+ (BOOL)addEndpointMapping:(id)a3 endpointID:(id)a4 applicationService:(id)a5 discoverySessionID:(id)a6;
+ (BOOL)removeEndpointMapping:(id)a3 discoverySessionID:(id)a4;
+ (BOOL)updateEndpointMapping:(id)a3 discoverySessionID:(id)a4;
+ (id)findEndpoint:(id)a3;
+ (id)listEndpointsForDiscoverySession:(id)a3;
+ (void)clearEndpointMappings:(id)a3;
+ (void)initialize;
+ (void)listEndpoints:(id)a3;
+ (void)removeDiscoverySessionFromAllEndpoints:(id)a3;
+ (void)updateClientBrowseResult:(id)a3 browseResponse:(id)a4 agentUUID:(id)a5 applicationService:(id)a6 discoverySessionID:(id)a7;
- (BOOL)browseSession;
- (BOOL)removeDiscoverySession:(id)a3;
- (BOOL)seenBySession:(id)a3;
- (NSMutableArray)sessions;
- (NSString)applicationService;
- (NSUUID)endpointUUID;
- (RPNWNearbyInvitationEndpoint)init;
- (RPNWNearbyInvitationEndpoint)initWithDevice:(id)a3 applicationService:(id)a4 endpointID:(id)a5 discoverySessionID:(id)a6;
- (RPNearbyInvitationDevice)device;
- (id)description;
- (void)addSession:(id)a3;
- (void)dealloc;
- (void)setApplicationService:(id)a3;
- (void)setBrowseSession:(BOOL)a3;
- (void)setDevice:(id)a3;
- (void)setEndpointUUID:(id)a3;
- (void)setSessions:(id)a3;
@end

@implementation RPNWNearbyInvitationEndpoint

+ (void)initialize
{
  uint64_t v3 = objc_opt_self(&OBJC_CLASS___RPNWNearbyInvitationEndpoint, a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);

  if (v4 == a1)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v6 = (void *)qword_100133398;
    qword_100133398 = (uint64_t)v5;
  }

- (RPNWNearbyInvitationEndpoint)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPNWNearbyInvitationEndpoint;
  v2 = -[RPNWNearbyInvitationEndpoint init](&v6, "init");
  uint64_t v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

- (RPNWNearbyInvitationEndpoint)initWithDevice:(id)a3 applicationService:(id)a4 endpointID:(id)a5 discoverySessionID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___RPNWNearbyInvitationEndpoint;
  v14 = -[RPNWNearbyInvitationEndpoint init](&v19, "init");
  v15 = v14;
  if (v14)
  {
    -[RPNWNearbyInvitationEndpoint setDevice:](v14, "setDevice:", v10);
    -[RPNWNearbyInvitationEndpoint setApplicationService:](v15, "setApplicationService:", v11);
    -[RPNWNearbyInvitationEndpoint setEndpointUUID:](v15, "setEndpointUUID:", v12);
    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[RPNWNearbyInvitationEndpoint setSessions:](v15, "setSessions:", v16);

    if (v13)
    {
      -[RPNWNearbyInvitationEndpoint addSession:](v15, "addSession:", v13);
      -[RPNWNearbyInvitationEndpoint setBrowseSession:](v15, "setBrowseSession:", 1LL);
    }

    v17 = v15;
  }

  return v15;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___RPNWNearbyInvitationEndpoint;
  -[RPNWNearbyInvitationEndpoint dealloc](&v2, "dealloc");
}

- (id)description
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"RPNWNearbyInvitationEndpoint[%@:%@] '%@'",  self->_applicationService,  self->_endpointUUID,  self->_device);
  return v3;
}

- (void)addSession:(id)a3
{
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

- (BOOL)removeDiscoverySession:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v5 = self->_sessions;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        __int128 v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if (objc_msgSend(v10, "isEqual:", v4, (void)v13))
        {
          -[NSMutableArray removeObject:](self->_sessions, "removeObject:", v10);

          -[NSMutableArray count](self->_sessions, "count");
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

  BOOL v11 = 0;
LABEL_11:

  return v11;
}

+ (id)listEndpointsForDiscoverySession:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = (id)qword_100133398;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue( [(id)qword_100133398 objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * (void)v9)]);
        if ([v10 seenBySession:v3])
        {
          BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 description]);
          -[NSMutableString appendFormat:](v4, "appendFormat:", @"  %@\n", v11);
        }

        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  return v4;
}

+ (void)removeDiscoverySessionFromAllEndpoints:(id)a3
{
  id v3 = a3;
  if (dword_100131DC0 <= 30 && (dword_100131DC0 != -1 || _LogCategory_Initialize(&dword_100131DC0, 30LL))) {
    LogPrintF( &dword_100131DC0,  "+[RPNWNearbyInvitationEndpoint removeDiscoverySessionFromAllEndpoints:]",  30LL,  "Removing endpoints for session '%@'",  v3);
  }
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100133398 allKeys]);
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100133398 objectForKeyedSubscript:v9]);
        if ([v10 removeDiscoverySession:v3])
        {
          BOOL v11 = (void *)qword_100133398;
          uint64_t v17 = v9;
          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v17,  1LL));
          [v11 removeObjectsForKeys:v12];
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }

    while (v6);
  }
}

+ (BOOL)addEndpointMapping:(id)a3 endpointID:(id)a4 applicationService:(id)a5 discoverySessionID:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (dword_100131DC0 <= 30 && (dword_100131DC0 != -1 || _LogCategory_Initialize(&dword_100131DC0, 30LL))) {
    LogPrintF( &dword_100131DC0,  "+[RPNWNearbyInvitationEndpoint addEndpointMapping:endpointID:applicationService:discoverySessionID:]",  30LL,  "Adding endpoint mapping [%@:%@] for device '%@' and session '%@'\n",  v11,  v10,  v9,  v12);
  }
  id v30 = v12;
  id v31 = v11;
  id v32 = v10;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  p_cb = &OBJC_PROTOCOL___RTIInputSystemDelegate.cb;
  __int128 v14 = (RPNWNearbyInvitationEndpoint *)(id)qword_100133398;
  id v15 = -[RPNWNearbyInvitationEndpoint countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v33,  v37,  16LL);
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v34;
    while (2)
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_super v19 = (void *)objc_claimAutoreleasedReturnValue( [*((id *)p_cb + 115) objectForKeyedSubscript:*(void *)(*((void *)&v33 + 1) + 8 * (void)i)]);
        v20 = (void *)objc_claimAutoreleasedReturnValue([v19 device]);
        if ([v20 isEqualToDevice:v9])
        {
          v21 = p_cb;
          v22 = v14;
          v23 = (void *)objc_claimAutoreleasedReturnValue([v19 endpointUUID]);
          unsigned int v24 = [v23 isEqual:v32];

          __int128 v14 = v22;
          p_cb = v21;

          if (v24)
          {
            if (dword_100131DC0 <= 40
              && (dword_100131DC0 != -1 || _LogCategory_Initialize(&dword_100131DC0, 40LL)))
            {
              LogPrintF( &dword_100131DC0,  "+[RPNWNearbyInvitationEndpoint addEndpointMapping:endpointID:applicationService:discoverySessionID:]",  40LL,  "Found existing endpoint '%@'\n",  v9);
            }

            v25 = v31;
            v26 = v32;
            v27 = v30;
            if (v30 && ([v19 seenBySession:v30] & 1) == 0)
            {
              [v19 addSession:v30];
              BOOL v28 = 1;
            }

            else
            {
              BOOL v28 = 0;
            }

            goto LABEL_30;
          }
        }

        else
        {
        }
      }

      id v16 = -[RPNWNearbyInvitationEndpoint countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v33,  v37,  16LL);
      if (v16) {
        continue;
      }
      break;
    }
  }

  v25 = v31;
  v26 = v32;
  v27 = v30;
  __int128 v14 = -[RPNWNearbyInvitationEndpoint initWithDevice:applicationService:endpointID:discoverySessionID:]( objc_alloc(&OBJC_CLASS___RPNWNearbyInvitationEndpoint),  "initWithDevice:applicationService:endpointID:discoverySessionID:",  v9,  v31,  v32,  v30);
  if (dword_100131DC0 <= 40 && (dword_100131DC0 != -1 || _LogCategory_Initialize(&dword_100131DC0, 40LL))) {
    LogPrintF( &dword_100131DC0,  "+[RPNWNearbyInvitationEndpoint addEndpointMapping:endpointID:applicationService:discoverySessionID:]",  40LL,  "Found no existing endpoint, created new endpoint '%@'\n",  v14);
  }
  [*((id *)p_cb + 115) setObject:v14 forKeyedSubscript:v32];
  BOOL v28 = 1;
LABEL_30:

  return v28;
}

+ (BOOL)updateEndpointMapping:(id)a3 discoverySessionID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (dword_100131DC0 <= 30 && (dword_100131DC0 != -1 || _LogCategory_Initialize(&dword_100131DC0, 30LL))) {
    LogPrintF( &dword_100131DC0,  "+[RPNWNearbyInvitationEndpoint updateEndpointMapping:discoverySessionID:]",  30LL,  "Updating endpoint for device '%@'",  v5);
  }
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = (id)qword_100133398;
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
        id v12 = (void *)objc_claimAutoreleasedReturnValue( [(id)qword_100133398 objectForKeyedSubscript:*(void *)(*((void *)&v17 + 1) + 8 * (void)i)]);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 device]);
        if ([v13 isEqualToDevice:v5])
        {
          unsigned int v14 = [v12 seenBySession:v6];

          if (v14)
          {
            if (dword_100131DC0 <= 40
              && (dword_100131DC0 != -1 || _LogCategory_Initialize(&dword_100131DC0, 40LL)))
            {
              LogPrintF( &dword_100131DC0,  "+[RPNWNearbyInvitationEndpoint updateEndpointMapping:discoverySessionID:]",  40LL,  "Found existing endpoint to update '%@'\n",  v12);
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

+ (BOOL)removeEndpointMapping:(id)a3 discoverySessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100131DC0 <= 30 && (dword_100131DC0 != -1 || _LogCategory_Initialize(&dword_100131DC0, 30LL))) {
    LogPrintF( &dword_100131DC0,  "+[RPNWNearbyInvitationEndpoint removeEndpointMapping:discoverySessionID:]",  30LL,  "Removing endpoint '%@' for device '%@'",  a1,  v6);
  }
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v8 = (id)qword_100133398;
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    char v20 = 0;
    uint64_t v11 = *(void *)v22;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)v12);
        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100133398 objectForKeyedSubscript:v13]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 device]);
        if ([v15 isEqualToDevice:v6])
        {
          unsigned int v16 = [v14 seenBySession:v7];

          if (v16)
          {
            if ([v14 removeDiscoverySession:v7])
            {
              [v19 addObject:v13];
              char v20 = 1;
            }

            else
            {
              char v20 = 0;
            }
          }
        }

        else
        {
        }

        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v17 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      id v10 = v17;
    }

    while (v17);
  }

  else
  {
    char v20 = 0;
  }

  [(id)qword_100133398 removeObjectsForKeys:v19];
  return v20 & 1;
}

+ (void)clearEndpointMappings:(id)a3
{
  id v3 = a3;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v4 = (id)qword_100133398;
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
        id v10 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100133398 objectForKeyedSubscript:v9]);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 device]);
        unsigned int v12 = [v11 isEqualToDevice:v3];

        if (v12) {
          [v13 addObject:v9];
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  [(id)qword_100133398 removeObjectsForKeys:v13];
}

+ (void)updateClientBrowseResult:(id)a3 browseResponse:(id)a4 agentUUID:(id)a5 applicationService:(id)a6 discoverySessionID:(id)a7
{
  id v27 = a3;
  v26 = (void (**)(id, void *))a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  id v14 = v12;
  id v15 = v13;
  v29 = (void *)nw_array_create();
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id obj = (id)qword_100133398;
  id v16 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  BOOL v28 = v12;
  if (v16)
  {
    id v17 = v16;
    int v18 = 0;
    uint64_t v19 = *(void *)v32;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v32 != v19) {
          objc_enumerationMutation(obj);
        }
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( [(id)qword_100133398 objectForKeyedSubscript:*(void *)(*((void *)&v31 + 1) + 8 * (void)i)]);
        if ([v21 seenBySession:v15])
        {
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[RPNWNearbyInvitationPeer createNWEndpointForEndpoint:agentID:applicationService:]( &OBJC_CLASS___RPNWNearbyInvitationPeer,  "createNWEndpointForEndpoint:agentID:applicationService:",  v21,  v11,  v14));
          if (dword_100131DC0 <= 30
            && (dword_100131DC0 != -1 || _LogCategory_Initialize(&dword_100131DC0, 30LL)))
          {
            LogPrintF( &dword_100131DC0,  "+[RPNWNearbyInvitationEndpoint updateClientBrowseResult:browseResponse:agentUUID:applicationService:discoverySessionID:]",  30LL,  " %d -> %@",  (unsigned __int16)v18++,  v22);
            id v14 = v28;
          }

          nw_array_append(v29, v22);
        }
      }

      id v17 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }

    while (v17);
  }

  if (dword_100131DC0 <= 30 && (dword_100131DC0 != -1 || _LogCategory_Initialize(&dword_100131DC0, 30LL)))
  {
    id v23 = v27;
    __int128 v24 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    -[NSMutableString appendFormat:](v24, "appendFormat:", @"%p", v23);

    uint64_t count = nw_array_get_count(v29);
    LogPrintF( &dword_100131DC0,  "+[RPNWNearbyInvitationEndpoint updateClientBrowseResult:browseResponse:agentUUID:applicationService:discoverySessionID:]",  30LL,  "Updated browse client [%@] with %zu endpoints",  v24,  count);
  }

  v26[2](v26, v29);
}

+ (id)findEndpoint:(id)a3
{
  id v3 = a3;
  if (dword_100131DC0 <= 30 && (dword_100131DC0 != -1 || _LogCategory_Initialize(&dword_100131DC0, 30LL))) {
    LogPrintF( &dword_100131DC0,  "+[RPNWNearbyInvitationEndpoint findEndpoint:]",  30LL,  "Searching for endpoint with UUID='%@'",  v3);
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100133398 objectForKeyedSubscript:v3]);
  if (v4)
  {
    if (dword_100131DC0 <= 30
      && (dword_100131DC0 != -1 || _LogCategory_Initialize(&dword_100131DC0, 30LL)))
    {
      LogPrintF(&dword_100131DC0, "+[RPNWNearbyInvitationEndpoint findEndpoint:]", 30LL, "Found endpoint '%@'", v4);
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
  if ([(id)qword_100133398 count])
  {
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id obj = (id)qword_100133398;
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
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( [*((id *)p_cb + 115) objectForKeyedSubscript:*(void *)(*((void *)&v22 + 1) + 8 * (void)v7)]);
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

- (RPNearbyInvitationDevice)device
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

- (NSMutableArray)sessions
{
  return self->_sessions;
}

- (void)setSessions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end