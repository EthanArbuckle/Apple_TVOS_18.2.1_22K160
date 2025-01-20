@interface W5FaultEventManager
- (W5DiagnosticsModeManager)diagnosticsModeManager;
- (W5FaultEventManager)initWithPeerManager:(id)a3 diagnosticsModeManager:(id)a4;
- (W5Peer)localPeer;
- (W5PeerGenericRequestListener)listener;
- (W5PeerManager)peerManager;
- (id)faultEventCache;
- (id)faultEventHandler;
- (void)__addFaultEvent:(id)a3;
- (void)__archiveEventCache;
- (void)__archiveNotifyPeers;
- (void)__purgeObsoleteFaultEvents;
- (void)__unarchiveEventCache;
- (void)__unarchiveNotifyPeers;
- (void)invalidate;
- (void)notifyPeersWithFaultEvent:(id)a3 info:(id)a4;
- (void)queryFaultEventCacheForPeer:(id)a3 reply:(id)a4;
- (void)setDiagnosticsModeManager:(id)a3;
- (void)setFaultEventHandler:(id)a3;
- (void)setListener:(id)a3;
- (void)setLocalPeer:(id)a3;
- (void)setPeerManager:(id)a3;
- (void)startMonitoringFaultEventsForPeer:(id)a3 reply:(id)a4;
- (void)stopMonitoringFaultEventsForPeer:(id)a3 reply:(id)a4;
- (void)submitFaultEvent:(id)a3;
@end

@implementation W5FaultEventManager

- (W5FaultEventManager)initWithPeerManager:(id)a3 diagnosticsModeManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___W5FaultEventManager;
  v9 = -[W5FaultEventManager init](&v22, "init");
  v10 = v9;
  if (v9
    && (objc_storeStrong((id *)&v9->_peerManager, a3), v10->_peerManager)
    && (objc_storeStrong((id *)&v10->_diagnosticsModeManager, a4), v10->_diagnosticsModeManager)
    && (v11 = objc_alloc_init(&OBJC_CLASS___W5PeerGenericRequestListener),
        listener = v10->_listener,
        v10->_listener = v11,
        listener,
        (v13 = v10->_listener) != 0LL))
  {
    -[W5PeerGenericRequestListener setIdentifier:](v13, "setIdentifier:", @"com.apple.wifi.peer.faults");
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10007E024;
    v19[3] = &unk_1000D3210;
    v20 = v10;
    v14 = v20;
    v21 = v14;
    -[W5PeerGenericRequestListener setRequestHandler:](v10->_listener, "setRequestHandler:", v19);

    v15 = (os_log_s *)v20;
  }

  else
  {

    uint64_t v17 = sub_10008C90C();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 136315650;
      v24 = "-[W5FaultEventManager initWithPeerManager:diagnosticsModeManager:]";
      __int16 v25 = 2080;
      v26 = "W5FaultEventManager.m";
      __int16 v27 = 1024;
      int v28 = 164;
      LODWORD(v18) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "[wifivelocity] %s (%s:%u) init error!",  (const char *)&v23,  v18,  LODWORD(v19[0]));
    }

    v14 = 0LL;
  }

  return v14;
}

- (void)invalidate
{
}

- (void)startMonitoringFaultEventsForPeer:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  v9 = objc_alloc_init(&OBJC_CLASS___W5PeerGenericRequest);
  -[W5PeerGenericRequest setIdentifier:](v9, "setIdentifier:", @"com.apple.wifi.peer.faults");
  -[W5PeerGenericRequest setPeer:](v9, "setPeer:", v6);
  -[W5PeerGenericRequest setDiscoveryFlags:](v9, "setDiscoveryFlags:", 1LL);
  -[W5PeerGenericRequest setControlFlags:](v9, "setControlFlags:", [v6 controlFlags]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v10 setObject:&off_1000DF768 forKeyedSubscript:@"Type"];
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[W5FaultEventManager localPeer](v8, "localPeer"));
  [v10 setObject:v11 forKeyedSubscript:@"RequestPeer"];

  [v10 setObject:v6 forKeyedSubscript:@"ResponsePeer"];
  -[W5PeerGenericRequest setRequestInfo:](v9, "setRequestInfo:", v10);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10007E8A8;
  v15[3] = &unk_1000D3238;
  v15[4] = v8;
  id v12 = v6;
  id v16 = v12;
  id v13 = v7;
  id v17 = v13;
  -[W5PeerGenericRequest setResponseHandler:](v9, "setResponseHandler:", v15);
  id v14 = -[W5PeerManager sendRequest:](v8->_peerManager, "sendRequest:", v9);

  objc_sync_exit(v8);
}

- (void)stopMonitoringFaultEventsForPeer:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  -[NSCountedSet removeObject:](v8->_monitoringPeers, "removeObject:", v6);
  if (!-[NSCountedSet countForObject:](v8->_monitoringPeers, "countForObject:", v6))
  {
    v9 = objc_alloc_init(&OBJC_CLASS___W5PeerGenericRequest);
    -[W5PeerGenericRequest setIdentifier:](v9, "setIdentifier:", @"com.apple.wifi.peer.faults");
    -[W5PeerGenericRequest setPeer:](v9, "setPeer:", v6);
    -[W5PeerGenericRequest setDiscoveryFlags:](v9, "setDiscoveryFlags:", 1LL);
    -[W5PeerGenericRequest setControlFlags:](v9, "setControlFlags:", [v6 controlFlags]);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v10 setObject:&off_1000DF780 forKeyedSubscript:@"Type"];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[W5FaultEventManager localPeer](v8, "localPeer"));
    [v10 setObject:v11 forKeyedSubscript:@"RequestPeer"];

    [v10 setObject:v6 forKeyedSubscript:@"ResponsePeer"];
    -[W5PeerGenericRequest setRequestInfo:](v9, "setRequestInfo:", v10);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10007EB40;
    v13[3] = &unk_1000D3260;
    id v14 = v7;
    -[W5PeerGenericRequest setResponseHandler:](v9, "setResponseHandler:", v13);
    id v12 = -[W5PeerManager sendRequest:](v8->_peerManager, "sendRequest:", v9);
  }

  objc_sync_exit(v8);
}

- (void)queryFaultEventCacheForPeer:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS___W5PeerGenericRequest);
  -[W5PeerGenericRequest setIdentifier:](v8, "setIdentifier:", @"com.apple.wifi.peer.faults");
  -[W5PeerGenericRequest setPeer:](v8, "setPeer:", v7);
  -[W5PeerGenericRequest setDiscoveryFlags:](v8, "setDiscoveryFlags:", 1LL);
  -[W5PeerGenericRequest setControlFlags:](v8, "setControlFlags:", [v7 controlFlags]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v9 setObject:&off_1000DF798 forKeyedSubscript:@"Type"];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[W5FaultEventManager localPeer](self, "localPeer"));
  [v9 setObject:v10 forKeyedSubscript:@"RequestPeer"];

  [v9 setObject:v7 forKeyedSubscript:@"ResponsePeer"];
  -[W5PeerGenericRequest setRequestInfo:](v8, "setRequestInfo:", v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10007ECCC;
  v13[3] = &unk_1000D3260;
  id v14 = v6;
  id v11 = v6;
  -[W5PeerGenericRequest setResponseHandler:](v8, "setResponseHandler:", v13);
  id v12 = -[W5PeerManager sendRequest:](self->_peerManager, "sendRequest:", v8);
}

- (void)__archiveNotifyPeers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.wifi.logs"]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:@"FaultEventNotifyPeers"]);

  id v6 = -[NSMutableSet copy](self->_notifyPeers, "copy");
  id v14 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v6,  1LL,  &v14));
  id v8 = v14;

  if (!v7)
  {
    uint64_t v12 = sub_10008C90C();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      id v16 = v8;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "[wifivelocity] FAILED to archive notify peers, returned error (%{public}@)",  &v15,  12);
    }

    goto LABEL_7;
  }

  id v13 = 0LL;
  unsigned __int8 v9 = [v7 writeToURL:v5 options:1 error:&v13];
  id v8 = v13;
  if ((v9 & 1) == 0)
  {
    uint64_t v10 = sub_10008C90C();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      id v16 = v8;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "[wifivelocity] FAILED to write notify peers to URL, returned error (%{public}@)",  &v15,  12);
    }

- (void)__unarchiveNotifyPeers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.wifi.logs"]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:@"FaultEventNotifyPeers"]);

  id v6 = -[NSData initWithContentsOfURL:](objc_alloc(&OBJC_CLASS___NSData), "initWithContentsOfURL:", v5);
  if (-[NSData length](v6, "length"))
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSSet, v7);
    uint64_t v10 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v8,  objc_opt_class(&OBJC_CLASS___W5Peer, v9),  0LL);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v17 = 0LL;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v11,  v6,  &v17));
    id v13 = v17;

    if (v12)
    {
      -[NSMutableSet unionSet:](self->_notifyPeers, "unionSet:", v12);
    }

    else
    {
      uint64_t v14 = sub_10008C90C();
      int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138543362;
        id v19 = v13;
        LODWORD(v16) = 12;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "[wifivelocity] FAILED to unarchive notify peers from URL, returned error (%{public}@)",  &v18,  v16);
      }
    }
  }
}

- (void)__archiveEventCache
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.wifi.logs"]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:@"FaultEventCache"]);

  id v6 = -[NSMutableOrderedSet copy](self->_faultEventCache, "copy");
  id v14 = 0LL;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v6,  1LL,  &v14));
  id v8 = v14;

  if (!v7)
  {
    uint64_t v12 = sub_10008C90C();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      id v16 = v8;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "[wifivelocity] FAILED to archive event cache, returned error (%{public}@)",  &v15,  12);
    }

    goto LABEL_7;
  }

  id v13 = 0LL;
  unsigned __int8 v9 = [v7 writeToURL:v5 options:1 error:&v13];
  id v8 = v13;
  if ((v9 & 1) == 0)
  {
    uint64_t v10 = sub_10008C90C();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      id v16 = v8;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "[wifivelocity] FAILED to write event cache to URL, returned error (%{public}@)",  &v15,  12);
    }

- (void)__unarchiveEventCache
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.wifi.logs"]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:@"FaultEventCache"]);

  id v6 = -[NSData initWithContentsOfURL:](objc_alloc(&OBJC_CLASS___NSData), "initWithContentsOfURL:", v5);
  if (-[NSData length](v6, "length"))
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSOrderedSet, v7);
    uint64_t v10 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v8,  objc_opt_class(&OBJC_CLASS___W5Event, v9),  0LL);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v18 = 0LL;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v11,  v6,  &v18));
    id v13 = v18;

    if (v12)
    {
      faultEventCache = self->_faultEventCache;
      int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 set]);
      -[NSMutableOrderedSet unionSet:](faultEventCache, "unionSet:", v15);
    }

    else
    {
      uint64_t v16 = sub_10008C90C();
      int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138543362;
        id v20 = v13;
        LODWORD(v17) = 12;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "[wifivelocity] FAILED to unarchive event cache from URL, returned error (%{public}@)",  &v19,  v17);
      }
    }
  }
}

- (void)__purgeObsoleteFaultEvents
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](self->_faultEventCache, "array"));
  id v3 = [v2 mutableCopy];

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v5 = v4;
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:comparator:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:comparator:",  0LL,  0LL,  &stru_1000D32A0));
  v24 = v21;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
  [v3 sortUsingDescriptors:v6];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCountedSet set](&OBJC_CLASS___NSCountedSet, "set"));
  if ([v3 count])
  {
    unint64_t v9 = 0LL;
    int v23 = v7;
    do
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:v9]);
      [v10 timestamp];
      if (v5 - v11 <= 86400.0)
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 peer]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 peerID]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 info]);
        int v15 = v8;
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"FaultType"]);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  v13,  v16));

        uint64_t v8 = v15;
        id v18 = [v15 countForObject:v17];
        if (v18 && ((unint64_t v19 = (unint64_t)v18, [v10 timestamp], v5 - v20 > 3600.0) || v19 >= 0xA))
        {
          uint64_t v7 = v23;
          [v23 addIndex:v9];
        }

        else
        {
          [v15 addObject:v17];
          uint64_t v7 = v23;
        }
      }

      else
      {
        [v7 addIndex:v9];
      }

      ++v9;
    }

    while (v9 < (unint64_t)[v3 count]);
  }

  if ([v7 count]) {
    [v3 removeObjectsAtIndexes:v7];
  }
  -[NSMutableOrderedSet removeAllObjects](self->_faultEventCache, "removeAllObjects");
  -[NSMutableOrderedSet addObjectsFromArray:](self->_faultEventCache, "addObjectsFromArray:", v3);
}

- (void)__addFaultEvent:(id)a3
{
  id v4 = a3;
  faultEventCache = self->_faultEventCache;
  id v8 = v4;
  if (!faultEventCache)
  {
    id v6 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet"));
    uint64_t v7 = self->_faultEventCache;
    self->_faultEventCache = v6;

    -[W5FaultEventManager __unarchiveEventCache](self, "__unarchiveEventCache");
    id v4 = v8;
    faultEventCache = self->_faultEventCache;
  }

  -[NSMutableOrderedSet addObject:](faultEventCache, "addObject:", v4);
  -[W5FaultEventManager __purgeObsoleteFaultEvents](self, "__purgeObsoleteFaultEvents");
  -[W5FaultEventManager __archiveEventCache](self, "__archiveEventCache");
}

- (void)notifyPeersWithFaultEvent:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v44 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  if (!v7->_notifyPeers)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    notifyPeers = v7->_notifyPeers;
    v7->_notifyPeers = (NSMutableSet *)v8;

    -[W5FaultEventManager __unarchiveNotifyPeers](v7, "__unarchiveNotifyPeers");
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 info]);
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"FaultType"]);
  id v12 = [v11 integerValue];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[W5FaultEventManager diagnosticsModeManager](v7, "diagnosticsModeManager"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 registeredPeersForFaultType:v12]);

  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id obj = v14;
  id v15 = [obj countByEnumeratingWithState:&v54 objects:v69 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v55;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v55 != v16) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)i);
        unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 peer]);
        BOOL v20 = v19 == 0LL;

        if (v20)
        {
          uint64_t v23 = sub_10008C90C();
          objc_super v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            int v58 = 136315906;
            v59 = "-[W5FaultEventManager notifyPeersWithFaultEvent:info:]";
            __int16 v60 = 2080;
            v61 = "W5FaultEventManager.m";
            __int16 v62 = 1024;
            int v63 = 388;
            __int16 v64 = 2114;
            v65 = v18;
            LODWORD(v41) = 38;
            _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  0LL,  "[wifivelocity] %s (%s:%u) [DM] nil W5Peer for peer='%{public}@'",  &v58,  v41);
          }
        }

        else
        {
          v21 = v7->_notifyPeers;
          objc_super v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 peer]);
          -[NSMutableSet addObject:](v21, "addObject:", v22);
        }
      }

      id v15 = [obj countByEnumeratingWithState:&v54 objects:v69 count:16];
    }

    while (v15);
  }

  __int128 v53 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v50 = 0u;
  id v24 = -[NSMutableSet copy](v7->_notifyPeers, "copy");
  id v25 = [v24 countByEnumeratingWithState:&v50 objects:v68 count:16];
  if (v25)
  {
    uint64_t v45 = *(void *)v51;
    id v42 = v24;
    do
    {
      id v46 = v25;
      for (j = 0LL; j != v46; j = (char *)j + 1)
      {
        if (*(void *)v51 != v45) {
          objc_enumerationMutation(v42);
        }
        __int16 v27 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)j);
        int v28 = objc_alloc_init(&OBJC_CLASS___W5PeerGenericRequest);
        -[W5PeerGenericRequest setIdentifier:](v28, "setIdentifier:", @"com.apple.wifi.peer.faults");
        -[W5PeerGenericRequest setPeer:](v28, "setPeer:", v27);
        -[W5PeerGenericRequest setDiscoveryFlags:](v28, "setDiscoveryFlags:", 1LL);
        -[W5PeerGenericRequest setControlFlags:](v28, "setControlFlags:", 0LL);
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        [v29 setObject:&off_1000DF7B0 forKeyedSubscript:@"Type"];
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[W5FaultEventManager localPeer](v7, "localPeer"));
        [v29 setObject:v30 forKeyedSubscript:@"RequestPeer"];

        [v29 setObject:v27 forKeyedSubscript:@"ResponsePeer"];
        id v31 = [v6 copy];
        v32 = (void *)objc_claimAutoreleasedReturnValue([v6 info]);
        if (v32)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue([v6 info]);
          id v34 = [v33 mutableCopy];
        }

        else
        {
          id v34 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        }

        v35 = (void *)objc_claimAutoreleasedReturnValue(-[W5FaultEventManager diagnosticsModeManager](v7, "diagnosticsModeManager"));
        BOOL v36 = [v35 registeredRoleForPeer:v27] == (id)16;

        if (v36)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue([v27 peerID]);
          [v34 setObject:v37 forKeyedSubscript:@"RemoteListener"];

          if (v44)
          {
            v48[0] = _NSConcreteStackBlock;
            v48[1] = 3221225472LL;
            v48[2] = sub_10007FEFC;
            v48[3] = &unk_1000D32C8;
            id v49 = v34;
            [v44 enumerateKeysAndObjectsUsingBlock:v48];
          }
        }

        [v31 setInfo:v34];
        [v29 setObject:v31 forKeyedSubscript:@"Event"];
        -[W5PeerGenericRequest setRequestInfo:](v28, "setRequestInfo:", v29);
        uint64_t v38 = sub_10008C90C();
        v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          int v58 = 136316162;
          v59 = "-[W5FaultEventManager notifyPeersWithFaultEvent:info:]";
          __int16 v60 = 2080;
          v61 = "W5FaultEventManager.m";
          __int16 v62 = 1024;
          int v63 = 424;
          __int16 v64 = 2112;
          v65 = v27;
          __int16 v66 = 2112;
          id v67 = v31;
          LODWORD(v41) = 48;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v39,  0LL,  "[wifivelocity] %s (%s:%u) Notifying peer: %@ for event: %@",  &v58,  v41);
        }

        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472LL;
        v47[2] = sub_10007FF08;
        v47[3] = &unk_1000D32F0;
        v47[4] = v7;
        v47[5] = v27;
        -[W5PeerGenericRequest setResponseHandler:](v28, "setResponseHandler:", v47);
        id v40 = -[W5PeerManager sendRequest:](v7->_peerManager, "sendRequest:", v28);
      }

      id v24 = v42;
      id v25 = [v42 countByEnumeratingWithState:&v50 objects:v68 count:16];
    }

    while (v25);
  }

  objc_sync_exit(v7);
}

- (void)submitFaultEvent:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5FaultEventManager localPeer](v4, "localPeer"));
  [v7 setPeer:v5];

  -[W5FaultEventManager __addFaultEvent:](v4, "__addFaultEvent:", v7);
  id v6 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[W5FaultEventManager faultEventHandler](v4, "faultEventHandler"));
  ((void (**)(void, id))v6)[2](v6, v7);

  objc_sync_exit(v4);
}

- (id)faultEventCache
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_faultEventCache)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet"));
    faultEventCache = v2->_faultEventCache;
    v2->_faultEventCache = (NSMutableOrderedSet *)v3;

    -[W5FaultEventManager __unarchiveEventCache](v2, "__unarchiveEventCache");
  }

  -[W5FaultEventManager __purgeObsoleteFaultEvents](v2, "__purgeObsoleteFaultEvents");
  if (v2->_faultEventCache)
  {
    double v5 = objc_alloc(&OBJC_CLASS___NSArray);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](v2->_faultEventCache, "array"));
    id v7 = -[NSArray initWithArray:copyItems:](v5, "initWithArray:copyItems:", v6, 1LL);
  }

  else
  {
    id v7 = 0LL;
  }

  objc_sync_exit(v2);

  return v7;
}

- (id)faultEventHandler
{
  return self->_faultEventHandler;
}

- (void)setFaultEventHandler:(id)a3
{
}

- (W5Peer)localPeer
{
  return self->_localPeer;
}

- (void)setLocalPeer:(id)a3
{
}

- (W5PeerGenericRequestListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (W5PeerManager)peerManager
{
  return self->_peerManager;
}

- (void)setPeerManager:(id)a3
{
}

- (W5DiagnosticsModeManager)diagnosticsModeManager
{
  return self->_diagnosticsModeManager;
}

- (void)setDiagnosticsModeManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end