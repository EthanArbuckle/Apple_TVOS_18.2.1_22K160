@interface NRApplicationServiceManager
- (NRApplicationServiceManager)init;
- (id)description;
@end

@implementation NRApplicationServiceManager

- (NRApplicationServiceManager)init
{
  v70.receiver = self;
  v70.super_class = (Class)&OBJC_CLASS___NRApplicationServiceManager;
  v3 = -[NRApplicationServiceManager init](&v70, "init");
  if (!v3)
  {
    id v62 = sub_1000F4464();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v62, 16LL);

    if (IsLevelEnabled)
    {
      id v64 = sub_1000F4464();
      _NRLogWithArgs( v64,  16LL,  "%s%.30s:%-4d ABORTING: [super init] failed",  ",  "-[NRApplicationServiceManager init]"",  204);
    }

    uint64_t v65 = _os_log_pack_size(12LL);
    v66 = (char *)&v70 - ((__chkstk_darwin(v65) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    v67 = __error();
    uint64_t v68 = _os_log_pack_fill(v66, v65, *v67, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)uint64_t v68 = 136446210;
    *(void *)(v68 + 4) = "-[NRApplicationServiceManager init]";
    id v69 = sub_1000F4464();
    _NRLogAbortWithPack(v69, v66);
    goto LABEL_34;
  }

  v2 = v3;
  v4 = sub_100146AFC();
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v4;

  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  asNameToListenRequest = v2->_asNameToListenRequest;
  v2->_asNameToListenRequest = v6;

  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  asNameToBrowseRequests = v2->_asNameToBrowseRequests;
  v2->_asNameToBrowseRequests = v8;

  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  asNameToResolveRequests = v2->_asNameToResolveRequests;
  v2->_asNameToResolveRequests = v10;

  v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  asNamesToIncomingResolveRequestEndpoint = v2->_asNamesToIncomingResolveRequestEndpoint;
  v2->_asNamesToIncomingResolveRequestEndpoint = v12;

  v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  asClients = v2->_asClients;
  v2->_asClients = v14;

  v16 = (objc_class *)objc_opt_class(v2);
  v17 = NSStringFromClass(v16);
  uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
  policyIdentifier = v2->_policyIdentifier;
  v2->_policyIdentifier = (NSString *)v18;

  v20 = (OS_nw_agent *)nw_agent_create( "com.apple.networkrelay",  "ASResolver",  "NetworkRelay appsvc resolver",  v2->_queue);
  v86[0] = 0LL;
  v86[1] = 0LL;
  nw_agent_get_uuid(v20, v86);
  v21 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v86);
  resolverAgentUUID = v2->_resolverAgentUUID;
  v2->_resolverAgentUUID = v21;

  v75 = _NSConcreteStackBlock;
  uint64_t v76 = 3221225472LL;
  v77 = sub_1000F5294;
  v78 = &unk_1001AF808;
  v79 = v2;
  *(void *)&__int128 v71 = _NSConcreteStackBlock;
  *((void *)&v71 + 1) = 3221225472LL;
  *(void *)&__int128 v72 = sub_1000F5614;
  *((void *)&v72 + 1) = &unk_1001AF830;
  *(void *)&__int128 v73 = v2;
  nw_agent_set_browse_handlers(v20, &v75, &v71);
  v81 = _NSConcreteStackBlock;
  uint64_t v82 = 3221225472LL;
  v83 = sub_1000F5B58;
  v84 = &unk_1001AF808;
  v85 = v2;
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472LL;
  v80[2] = sub_1000F60BC;
  v80[3] = &unk_1001AF830;
  v80[4] = v2;
  nw_agent_add_resolve_handlers(v20, 6LL, 1LL, &v81, v80);
  nw_agent_change_state(v20, 1LL, 2LL, 0LL);
  resolverAgent = v2->_resolverAgent;
  v2->_resolverAgent = v20;
  v24 = v20;

  v25 = (OS_nw_agent *)nw_agent_create( "com.apple.networkrelay",  "ASListener",  "NetworkRelay appsvc listener",  v2->_queue);
  v81 = 0LL;
  uint64_t v82 = 0LL;
  nw_agent_get_uuid(v25, &v81);
  v26 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", &v81);
  listenerAgentUUID = v2->_listenerAgentUUID;
  v2->_listenerAgentUUID = v26;

  v75 = _NSConcreteStackBlock;
  uint64_t v76 = 3221225472LL;
  v77 = sub_1000F4654;
  v78 = &unk_1001AF808;
  v79 = v2;
  *(void *)&__int128 v71 = _NSConcreteStackBlock;
  *((void *)&v71 + 1) = 3221225472LL;
  *(void *)&__int128 v72 = sub_1000F490C;
  *((void *)&v72 + 1) = &unk_1001AF830;
  *(void *)&__int128 v73 = v2;
  nw_agent_set_browse_handlers(v25, &v75, &v71);
  nw_agent_change_state(v25, 1LL, 2LL, 0LL);
  listenerAgent = v2->_listenerAgent;
  v2->_listenerAgent = v25;
  v29 = v25;

  v30 = v2->_resolverAgentUUID;
  if (v30)
  {
  }

  else if (!v2->_listenerAgentUUID)
  {
    goto LABEL_20;
  }

  v31 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (v2->_resolverAgentUUID)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyResult removeNetworkAgentUUID:](&OBJC_CLASS___NEPolicyResult, "removeNetworkAgentUUID:"));
    -[NSMutableArray addObject:](v31, "addObject:", v32);
  }

  if (v2->_listenerAgentUUID)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyResult removeNetworkAgentUUID:](&OBJC_CLASS___NEPolicyResult, "removeNetworkAgentUUID:"));
    -[NSMutableArray addObject:](v31, "addObject:", v33);
  }

  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  v34 = v31;
  id v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v34,  "countByEnumeratingWithState:objects:count:",  &v71,  &v75,  16LL);
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = *(void *)v72;
    do
    {
      for (i = 0LL; i != v36; i = (char *)i + 1)
      {
        v39 = v2;
        if (*(void *)v72 != v37) {
          objc_enumerationMutation(v34);
        }
        uint64_t v40 = *(void *)(*((void *)&v71 + 1) + 8LL * (void)i);
        id v41 = objc_alloc(&OBJC_CLASS___NEPolicy);
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition allInterfaces](&OBJC_CLASS___NEPolicyCondition, "allInterfaces"));
        v80[0] = v42;
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v80, 1LL));
        id v44 = [v41 initWithOrder:20 result:v40 conditions:v43];

        objc_opt_self(&OBJC_CLASS___NRDPolicySessionManager);
        if (qword_1001DCB60 != -1) {
          dispatch_once(&qword_1001DCB60, &stru_1001B0538);
        }
        v2 = v39;
        id v45 = (id)qword_1001DCB58;
        id v46 = sub_100120E44((uint64_t)v45, v39->_policyIdentifier, v44);
      }

      id v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v34,  "countByEnumeratingWithState:objects:count:",  &v71,  &v75,  16LL);
    }

    while (v36);
  }

LABEL_20:
  v47 = v2->_resolverAgentUUID;
  if (v47)
  {
  }

  else if (!v2->_listenerAgentUUID)
  {
    goto LABEL_26;
  }

  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyResult skipWithOrder:](&OBJC_CLASS___NEPolicyResult, "skipWithOrder:", 21LL));
  v49 = (void *)objc_claimAutoreleasedReturnValue( +[NEPolicyCondition customEntitlement:]( &OBJC_CLASS___NEPolicyCondition,  "customEntitlement:",  @"com.apple.private.application-service-browse"));
  id v50 = objc_alloc(&OBJC_CLASS___NEPolicy);
  v51 = (void **)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition allInterfaces](&OBJC_CLASS___NEPolicyCondition, "allInterfaces"));
  v81 = v51;
  uint64_t v82 = (uint64_t)v49;
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v81, 2LL));
  id v53 = [v50 initWithOrder:15 result:v48 conditions:v52];

  objc_opt_self(&OBJC_CLASS___NRDPolicySessionManager);
  if (qword_1001DCB60 != -1) {
    dispatch_once(&qword_1001DCB60, &stru_1001B0538);
  }
  id v54 = (id)qword_1001DCB58;
  id v55 = sub_100120E44((uint64_t)v54, v2->_policyIdentifier, v53);

LABEL_26:
  objc_opt_self(&OBJC_CLASS___NRDPolicySessionManager);
  if (qword_1001DCB60 != -1) {
LABEL_34:
  }
    dispatch_once(&qword_1001DCB60, &stru_1001B0538);
  id v56 = (id)qword_1001DCB58;
  v57 = (id *)v56;
  if (v56)
  {
    dispatch_assert_queue_V2(*((dispatch_queue_t *)v56 + 1));
    if (([v57[2] apply] & 1) == 0) {
      sub_1001030D0( @"NRPolicySessionManager",  @"ApplyPolicy Failed",  0LL,  1,  @"Failed to apply policies",  v58,  v59,  v60,  (uint64_t)v70.receiver);
    }
  }

  return v2;
}

- (id)description
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"\nName: NRApplicationServiceManager");
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"\nlisten: %@", self->_asNameToListenRequest);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"\nbrowse: %@", self->_asNameToBrowseRequests);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"\nresolve: %@", self->_asNameToResolveRequests);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"\nincoming: %@",  self->_asNamesToIncomingResolveRequestEndpoint);
  v14 = v3;
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"\nclients: %@", self->_asClients);
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v5 = self->_asNameToResolveRequests;
  id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        v11 = sub_1000F4294((uint64_t)self, v10);
        if (-[NSMutableArray count](v11, "count"))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSMutableArray count](v11, "count")));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v12, v10);
        }
      }

      id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v7);
  }

  -[NSMutableString appendFormat:](v14, "appendFormat:", @"\nresolver keys: %@", v4);
  return v14;
}

- (void).cxx_destruct
{
}

@end