@interface MRDMRRelayConnectionManager
+ (id)sharedManager;
- (NSHashTable)observers;
- (NSMutableDictionary)connections;
- (NSMutableDictionary)pendingCompletionsPerOutputDeviceUID;
- (NSString)debugDescription;
- (id)connectionForOutputDeviceUID:(id)a3;
- (void)_callPendingCompletions;
- (void)addObserver:(id)a3;
- (void)ingestConnection:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setConnections:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPendingCompletionsPerOutputDeviceUID:(id)a3;
- (void)transportDidClose:(id)a3 error:(id)a4;
- (void)waitForConnectionWithOutputDeviceUID:(id)a3 timeout:(double)a4 completion:(id)a5;
@end

@implementation MRDMRRelayConnectionManager

+ (id)sharedManager
{
  if (qword_1003FDCD0 != -1) {
    dispatch_once(&qword_1003FDCD0, &stru_10039B7B0);
  }
  return (id)qword_1003FDCC8;
}

- (NSString)debugDescription
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v4 = objc_opt_class(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMRRelayConnectionManager connections](self, "connections"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mr_formattedDebugDescription"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[MRDMRRelayConnectionManager pendingCompletionsPerOutputDeviceUID]( self,  "pendingCompletionsPerOutputDeviceUID"));
  v8 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"<%@:%p {\n   connections=%@\n   completions=%@\n>",  v4,  self,  v6,  v7);

  return v8;
}

- (void)ingestConnection:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMRRelayConnectionManager connections](v5, "connections"));

  if (!v6)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[MRDMRRelayConnectionManager setConnections:](v5, "setConnections:", v7);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 connection]);
  [v8 addObserver:v5];

  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 connection]);
  unsigned int v10 = [v9 isValid];

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceInfo]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 deviceUID]);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMRRelayConnectionManager connections](v5, "connections"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v12]);

    if (v14)
    {
      uint64_t v16 = _MRLogForCategory(0LL, v15);
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v31 = v14;
        __int16 v32 = 2114;
        v33 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[MRDMRRelayConnectionManager] Pre-exisiting connection will be dropped: %{public}@, outputDeviceUID: %{public}@",  buf,  0x16u);
      }
    }

    uint64_t v18 = _MRLogForCategory(0LL, v15);
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v4 connection]);
      *(_DWORD *)buf = 138543618;
      v31 = v20;
      __int16 v32 = 2114;
      v33 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[MRDMRRelayConnectionManager] Ingesting connection: %{public}@, outputDeviceUID: %{public}@",  buf,  0x16u);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMRRelayConnectionManager connections](v5, "connections"));
    [v21 setObject:v4 forKeyedSubscript:v12];

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMRRelayConnectionManager observers](v5, "observers"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 allObjects]);

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10004C2E4;
    block[3] = &unk_100398F40;
    id v27 = v23;
    v28 = v5;
    id v29 = v4;
    id v24 = v23;
    dispatch_async(&_dispatch_main_q, block);
  }

  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue([v4 connection]);
    [v25 removeObserver:v5];
  }

  -[MRDMRRelayConnectionManager _callPendingCompletions](v5, "_callPendingCompletions");
  objc_sync_exit(v5);
}

- (id)connectionForOutputDeviceUID:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMRRelayConnectionManager connections](v5, "connections"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);

  objc_sync_exit(v5);
  return v7;
}

- (void)waitForConnectionWithOutputDeviceUID:(id)a3 timeout:(double)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);

  v13 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"MRDMRRelayConnectionManager.waitForConnection",  v12);
  uint64_t v15 = v13;
  if (v8) {
    -[NSMutableString appendFormat:](v13, "appendFormat:", @" for %@", v8);
  }
  uint64_t v16 = _MRLogForCategory(10LL, v14);
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v45 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_10004C81C;
  v39[3] = &unk_10039B7D8;
  id v18 = v8;
  id v40 = v18;
  id v19 = v12;
  id v41 = v19;
  id v20 = v10;
  id v42 = v20;
  id v21 = v9;
  id v43 = v21;
  v22 = objc_retainBlock(v39);
  v23 = self;
  objc_sync_enter(v23);
  id v24 = (void *)objc_claimAutoreleasedReturnValue( -[MRDMRRelayConnectionManager pendingCompletionsPerOutputDeviceUID]( v23,  "pendingCompletionsPerOutputDeviceUID"));
  BOOL v25 = v24 == 0LL;

  if (v25)
  {
    v26 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[MRDMRRelayConnectionManager setPendingCompletionsPerOutputDeviceUID:]( v23,  "setPendingCompletionsPerOutputDeviceUID:",  v26);
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue( -[MRDMRRelayConnectionManager pendingCompletionsPerOutputDeviceUID]( v23,  "pendingCompletionsPerOutputDeviceUID"));
  v28 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v18]);

  if (!v28)
  {
    v28 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v29 = (void *)objc_claimAutoreleasedReturnValue( -[MRDMRRelayConnectionManager pendingCompletionsPerOutputDeviceUID]( v23,  "pendingCompletionsPerOutputDeviceUID"));
    [v29 setObject:v28 forKeyedSubscript:v18];
  }

  v30 = objc_retainBlock(v22);
  -[NSMutableArray addObject:](v28, "addObject:", v30);

  -[MRDMRRelayConnectionManager _callPendingCompletions](v23, "_callPendingCompletions");
  dispatch_time_t v31 = dispatch_time(0LL, (uint64_t)(a4 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004CBA8;
  block[3] = &unk_10039B800;
  void block[4] = v23;
  v36 = v28;
  id v37 = v21;
  id v38 = v22;
  __int16 v32 = v22;
  id v33 = v21;
  v34 = v28;
  dispatch_after(v31, &_dispatch_main_q, block);

  objc_sync_exit(v23);
}

- (void)transportDidClose:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMRRelayConnectionManager connections](v8, "connections"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10004CE3C;
  v17[3] = &unk_10039B828;
  id v10 = v6;
  id v18 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "msv_firstWhere:", v17));

  if (v11)
  {
    uint64_t v13 = _MRLogForCategory(0LL, v12);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v20 = v10;
      __int16 v21 = 2114;
      uint64_t v22 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[MRDMRRelayConnectionManager] Removing connection: %{public}@ outputDeviceUID: %{public}@",  buf,  0x16u);
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMRRelayConnectionManager connections](v8, "connections"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 first]);
    [v15 removeObjectForKey:v16];
  }

  objc_sync_exit(v8);
}

- (void)addObserver:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMRRelayConnectionManager observers](v4, "observers"));

  if (!v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    -[MRDMRRelayConnectionManager setObservers:](v4, "setObservers:", v6);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMRRelayConnectionManager observers](v4, "observers"));
  [v7 addObject:v8];

  objc_sync_exit(v4);
}

- (void)removeObserver:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMRRelayConnectionManager observers](v4, "observers"));
  [v5 removeObject:v6];

  objc_sync_exit(v4);
}

- (void)_callPendingCompletions
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[MRDMRRelayConnectionManager pendingCompletionsPerOutputDeviceUID]( self,  "pendingCompletionsPerOutputDeviceUID"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10004D010;
  v4[3] = &unk_10039B850;
  v4[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

- (NSMutableDictionary)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
}

- (NSMutableDictionary)pendingCompletionsPerOutputDeviceUID
{
  return self->_pendingCompletionsPerOutputDeviceUID;
}

- (void)setPendingCompletionsPerOutputDeviceUID:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end