@interface MRDHostedExternalDeviceManager
- (BOOL)isDirectConnectedToOutputDeviceUID:(id)a3;
- (MRDHostedExternalDeviceManager)init;
- (MRDHostedExternalDeviceManagerDelegate)delegate;
- (NSDictionary)availableExternalDevices;
- (id)disconnectUndiscoverableEndpoints:(id)a3;
- (id)hostedExternalDeviceForEndpointIdentifier:(id)a3;
- (void)_handleExternalDeviceConnectionStateDidChangeNotification:(id)a3;
- (void)_removeExternalDeviceWithEndpointIdentifier:(id)a3 error:(id)a4;
- (void)_removeExternalDeviceWithOutputDeviceUID:(id)a3 error:(id)a4;
- (void)_tombstoneHostedExternalDevice:(id)a3 error:(id)a4;
- (void)addHostedExternalDevice:(id)a3 endpoint:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation MRDHostedExternalDeviceManager

- (MRDHostedExternalDeviceManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MRDHostedExternalDeviceManager;
  v2 = -[MRDHostedExternalDeviceManager init](&v9, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    hostedExternalDeviceMap = v2->_hostedExternalDeviceMap;
    v2->_hostedExternalDeviceMap = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    hostedExternalDeviceGraveyard = v2->_hostedExternalDeviceGraveyard;
    v2->_hostedExternalDeviceGraveyard = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v7 addObserver:v2 selector:"_handleExternalDeviceConnectionStateDidChangeNotification:" name:kMRExternalDeviceConnectionStateDidChangeNotification object:0];
  }

  return v2;
}

- (NSDictionary)availableExternalDevices
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = -[NSMutableDictionary copy](v2->_hostedExternalDeviceMap, "copy");
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (void)addHostedExternalDevice:(id)a3 endpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  uint64_t v9 = objc_sync_enter(v8);
  uint64_t v11 = MRLogCategoryDiscovery(v9, v10);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueIdentifier]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v6 externalDevice]);
    *(_DWORD *)buf = 138543874;
    id v19 = v6;
    __int16 v20 = 2114;
    v21 = v13;
    __int16 v22 = 2112;
    v23 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[MRDHostedExternalDeviceManager] Created new hostedExternalDevice=%{public}@, endpoint=%{public}@ externalDevice=%@",  buf,  0x20u);
  }

  hostedExternalDeviceMap = v8->_hostedExternalDeviceMap;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueIdentifier]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](hostedExternalDeviceMap, "setObject:forKeyedSubscript:", v6, v16);

  objc_sync_exit(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100120F80;
  block[3] = &unk_100399250;
  block[4] = v8;
  dispatch_async(&_dispatch_main_q, block);
}

- (id)hostedExternalDeviceForEndpointIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v5->_hostedExternalDeviceMap,  "objectForKeyedSubscript:",  v4));
  objc_sync_exit(v5);

  return v6;
}

- (BOOL)isDirectConnectedToOutputDeviceUID:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  hostedExternalDeviceMap = v5->_hostedExternalDeviceMap;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001210FC;
  v10[3] = &unk_1003A14C0;
  id v7 = v4;
  id v11 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary msv_firstWhere:](hostedExternalDeviceMap, "msv_firstWhere:", v10));
  LOBYTE(hostedExternalDeviceMap) = v8 != 0LL;

  objc_sync_exit(v5);
  return (char)hostedExternalDeviceMap;
}

- (id)disconnectUndiscoverableEndpoints:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v6 = self;
  objc_sync_enter(v6);
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  hostedExternalDeviceMap = v6->_hostedExternalDeviceMap;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10012127C;
  v15[3] = &unk_1003A18C0;
  id v9 = v4;
  id v16 = v9;
  uint64_t v10 = v7;
  v17 = v10;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( hostedExternalDeviceMap,  "enumerateKeysAndObjectsUsingBlock:",  v15);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100121374;
  v13[3] = &unk_1003A18C0;
  v13[4] = v6;
  id v11 = v5;
  v14 = v11;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v10, "enumerateKeysAndObjectsUsingBlock:", v13);

  objc_sync_exit(v6);
  return v11;
}

- (void)_removeExternalDeviceWithEndpointIdentifier:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_hostedExternalDeviceMap,  "objectForKeyedSubscript:",  v6));
  uint64_t v10 = MRLogCategoryDiscovery(v8, v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v8 externalDevice]);
    *(_DWORD *)buf = 138544130;
    v15 = v8;
    __int16 v16 = 2114;
    id v17 = v6;
    __int16 v18 = 2114;
    id v19 = v7;
    __int16 v20 = 2112;
    v21 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[MRDHostedExternalDeviceManager] Removing hostedExternalDevice=%{public}@, endpointIdentifier=%{public}@ reason=%{ public}@ externalDevice=%@",  buf,  0x2Au);
  }

  -[MRDHostedExternalDeviceManager _tombstoneHostedExternalDevice:error:]( self,  "_tombstoneHostedExternalDevice:error:",  v8,  v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_hostedExternalDeviceMap,  "setObject:forKeyedSubscript:",  0LL,  v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100121638;
  block[3] = &unk_100399250;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)_removeExternalDeviceWithOutputDeviceUID:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  hostedExternalDeviceMap = self->_hostedExternalDeviceMap;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100121818;
  v22[3] = &unk_1003A18E8;
  id v10 = v6;
  id v23 = v10;
  id v11 = v7;
  id v24 = v11;
  v12 = v8;
  v25 = v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( hostedExternalDeviceMap,  "enumerateKeysAndObjectsUsingBlock:",  v22);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v13 = v12;
  id v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v18,  v26,  16LL);
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      id v17 = 0LL;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        -[MRDHostedExternalDeviceManager _removeExternalDeviceWithEndpointIdentifier:error:]( self,  "_removeExternalDeviceWithEndpointIdentifier:error:",  *(void *)(*((void *)&v18 + 1) + 8LL * (void)v17),  v11,  (void)v18);
        id v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v18,  v26,  16LL);
    }

    while (v15);
  }
}

- (void)_tombstoneHostedExternalDevice:(id)a3 error:(id)a4
{
  id v6 = a3;
  [v6 tombstoneWithError:a4];
  -[NSMutableArray addObject:](self->_hostedExternalDeviceGraveyard, "addObject:", v6);
  if (qword_1003FE060 != -1) {
    dispatch_once(&qword_1003FE060, &stru_1003A1908);
  }
  dispatch_time_t v7 = dispatch_time(0LL, 5000000000LL);
  v8 = (dispatch_queue_s *)qword_1003FE058;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100121A80;
  v10[3] = &unk_100398E60;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_after(v7, v8, v10);
}

- (void)_handleExternalDeviceConnectionStateDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:kMRExternalDeviceConnectionStateUserInfoKey]);
  unsigned int v7 = [v6 unsignedIntValue];

  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  if (v7 == 3)
  {
    id v9 = self;
    objc_sync_enter(v9);
    uint64_t v19 = 0LL;
    __int128 v20 = &v19;
    uint64_t v21 = 0x3032000000LL;
    __int16 v22 = sub_100121C88;
    id v23 = sub_100121C98;
    id v24 = 0LL;
    hostedExternalDeviceMap = v9->_hostedExternalDeviceMap;
    v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472LL;
    id v15 = sub_100121CA0;
    uint64_t v16 = &unk_1003A1930;
    id v17 = v8;
    __int128 v18 = &v19;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( hostedExternalDeviceMap,  "enumerateKeysAndObjectsUsingBlock:",  &v13);
    if (v20[5])
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo", v13, v14, v15, v16));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:NSUnderlyingErrorKey]);

      -[MRDHostedExternalDeviceManager _removeExternalDeviceWithEndpointIdentifier:error:]( v9,  "_removeExternalDeviceWithEndpointIdentifier:error:",  v20[5],  v12);
    }

    _Block_object_dispose(&v19, 8);
    objc_sync_exit(v9);
  }
}

- (MRDHostedExternalDeviceManagerDelegate)delegate
{
  return (MRDHostedExternalDeviceManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end