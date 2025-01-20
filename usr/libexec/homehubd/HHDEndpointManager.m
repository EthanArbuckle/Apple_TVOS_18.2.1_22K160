@interface HHDEndpointManager
+ (id)endpointManager;
- (BOOL)_canActivateEndpoint:(id)a3 error:(id *)a4;
- (BOOL)_updateStateForEndpoint:(id)a3 changeType:(int64_t)a4 error:(id *)a5;
- (BOOL)activateEndpointWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)deleteEndpointWithIdentifier:(id)a3 error:(id *)a4;
- (NSArray)endpointList;
- (id)_endpointForBubble:(id)a3;
- (id)createEndpointWithAccessoryIdentifier:(id)a3 mediaRouteId:(id)a4 error:(id *)a5;
- (id)endpointForIdentifier:(id)a3 error:(id *)a4;
- (void)_deactivateEndpointWithIdentifier:(id)a3 persist:(BOOL)a4 callback:(id)a5;
- (void)addEndpointObserver:(id)a3;
- (void)bootstrapWithServiceRegistry:(id)a3;
- (void)deactivateEndpointWithIdentifier:(id)a3 callback:(id)a4;
- (void)postDarwinNotificationForEndpoint:(id)a3 changeType:(int64_t)a4;
- (void)postEndpointListChangedWithEndpoint:(id)a3 changeType:(int64_t)a4;
- (void)postUpdateWithObserver:(id)a3 endpoint:(id)a4 changeType:(int64_t)a5;
- (void)removeEndpointObserver:(id)a3;
- (void)start;
@end

@implementation HHDEndpointManager

+ (id)endpointManager
{
  return objc_alloc_init(&OBJC_CLASS___HHDEndpointManager);
}

- (void)bootstrapWithServiceRegistry:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_endpoints)
  {
    id v6 = sub_100007F64();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v22 = 138412290;
      v23 = &stru_100024E50;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%@Endpoints have already been initialized (start called twice?).",  (uint8_t *)&v22,  0xCu);
    }
  }

  else
  {
    v8 = (HHDBubbleManagementService *)objc_claimAutoreleasedReturnValue([v4 bubbleManager]);
    bubbleManager = self->_bubbleManager;
    self->_bubbleManager = v8;

    v10 = (HHDPersistence *)objc_claimAutoreleasedReturnValue([v5 persistence]);
    persistence = self->_persistence;
    self->_persistence = v10;

    v12 = self->_persistence;
    if (!v12)
    {
      id v13 = sub_100007F64();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v22 = 138412290;
        v23 = &stru_100024E50;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%@Error: Unable to load persistence layer.",  (uint8_t *)&v22,  0xCu);
      }

      v12 = self->_persistence;
    }

    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[HHDPersistence allEndpoints](v12, "allEndpoints"));
    v7 = v15;
    if (v15)
    {
      v16 = (NSMutableArray *)-[os_log_s mutableCopy](v15, "mutableCopy");
    }

    else
    {
      id v17 = sub_100007F64();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v22 = 138412290;
        v23 = &stru_100024E50;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%@Error: Persistence returned nil endpoints.",  (uint8_t *)&v22,  0xCu);
      }

      v16 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    }

    endpoints = self->_endpoints;
    self->_endpoints = v16;

    v20 = (HHDNotificationProxy *)objc_claimAutoreleasedReturnValue([v5 notificationProxy]);
    notificationProxy = self->_notificationProxy;
    self->_notificationProxy = v20;
  }
}

- (void)start
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[HHDEndpointManager endpointList](self, "endpointList"));
  id v5 = [v4 countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v39;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v39 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v38 + 1) + 8 * (void)i) launchInstanceId]);
        -[NSMutableArray addObject:](v3, "addObject:", v9);
      }

      id v6 = [v4 countByEnumeratingWithState:&v38 objects:v52 count:16];
    }

    while (v6);
  }

  v28 = v3;
  -[HHDBubbleManagementService deleteBubblesNotInList:](self->_bubbleManager, "deleteBubblesNotInList:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HHDBubbleManagementService reactivateBubbles](self->_bubbleManager, "reactivateBubbles"));
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v11 = [v10 countByEnumeratingWithState:&v34 objects:v51 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v35;
    do
    {
      for (j = 0LL; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue( -[HHDEndpointManager _endpointForBubble:]( self,  "_endpointForBubble:",  *(void *)(*((void *)&v34 + 1) + 8LL * (void)j)));
        v16 = v15;
        if (v15)
        {
          [v15 setState:1];
          id v33 = 0LL;
          -[HHDEndpointManager _updateStateForEndpoint:changeType:error:]( self,  "_updateStateForEndpoint:changeType:error:",  v16,  1LL,  &v33);
          id v17 = v33;
          if (v17)
          {
            id v18 = sub_100007F64();
            v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue([v16 accessoryId]);
              v21 = (void *)objc_claimAutoreleasedReturnValue([v16 launchInstanceId]);
              *(_DWORD *)buf = 138413058;
              v44 = &stru_100024E50;
              __int16 v45 = 2114;
              v46 = v20;
              __int16 v47 = 2114;
              v48 = v21;
              __int16 v49 = 2112;
              id v50 = v17;
              _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%@Endpoint %{public}@ with instance id %{public}@ failed to persist inactive state after failed reactivation: %@",  buf,  0x2Au);
            }
          }
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v34 objects:v51 count:16];
    }

    while (v12);
  }

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  int v22 = self->_endpointObservers;
  id v23 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v29,  v42,  16LL);
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v30;
    do
    {
      for (k = 0LL; k != v24; k = (char *)k + 1)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)k);
      }

      id v24 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v29,  v42,  16LL);
    }

    while (v24);
  }
}

- (NSArray)endpointList
{
  endpoints = self->_endpoints;
  else {
    return (NSArray *)&__NSArray0__struct;
  }
}

- (void)postUpdateWithObserver:(id)a3 endpoint:(id)a4 changeType:(int64_t)a5
{
  id v9 = a3;
  id v8 = a4;
  switch(a5)
  {
    case 0LL:
      break;
    case 1LL:
      break;
    case 2LL:
      break;
    case 3LL:
      break;
    default:
      break;
  }
}

- (void)postDarwinNotificationForEndpoint:(id)a3 changeType:(int64_t)a4
{
  id v5 = a3;
  if (a4 == 1)
  {
    id v10 = sub_100007F64();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 accessoryId]);
      int v12 = 138412546;
      uint64_t v13 = &stru_100024E50;
      __int16 v14 = 2114;
      v15 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@Posting notify deactivated notification for endpoint: %{public}@",  (uint8_t *)&v12,  0x16u);
    }

    id v9 = "com.apple.homehubd.endpointDeactivated";
    goto LABEL_9;
  }

  if (!a4)
  {
    id v6 = sub_100007F64();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 accessoryId]);
      int v12 = 138412546;
      uint64_t v13 = &stru_100024E50;
      __int16 v14 = 2114;
      v15 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@Posting notify activated notification for endpoint: %{public}@",  (uint8_t *)&v12,  0x16u);
    }

    id v9 = "com.apple.homehubd.endpointActivated";
LABEL_9:

    notify_post(v9);
  }
}

- (void)postEndpointListChangedWithEndpoint:(id)a3 changeType:(int64_t)a4
{
  id v6 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v7 = self->_endpointObservers;
  id v8 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        -[HHDEndpointManager postUpdateWithObserver:endpoint:changeType:]( self,  "postUpdateWithObserver:endpoint:changeType:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v11),  v6,  a4,  (void)v14);
        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v9);
  }

  notificationProxy = self->_notificationProxy;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray hhd_bridgedArrayWithEndpoints:]( &OBJC_CLASS___NSArray,  "hhd_bridgedArrayWithEndpoints:",  self->_endpoints));
  -[HHDNotificationProxy endpointListChanged:](notificationProxy, "endpointListChanged:", v13);

  -[HHDEndpointManager postDarwinNotificationForEndpoint:changeType:]( self,  "postDarwinNotificationForEndpoint:changeType:",  v6,  a4);
}

- (id)createEndpointWithAccessoryIdentifier:(id)a3 mediaRouteId:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[HHAnalyticsReporter sharedReporter](&OBJC_CLASS___HHAnalyticsReporter, "sharedReporter"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 startIntervalWithEventName:@"com.apple.homehub.endpoint.create" eventBuilder:0]);

  int v12 = (void *)objc_claimAutoreleasedReturnValue( -[HHDBubbleManagementService createBubbleAndReturnError:]( self->_bubbleManager,  "createBubbleAndReturnError:",  a5));
  uint64_t v13 = v12;
  if (v12)
  {
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
    id v15 = sub_100007F64();
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412546;
      id v24 = &stru_100024E50;
      __int16 v25 = 2114;
      v26 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%@Creating endpoint with bubble id %{public}@.",  (uint8_t *)&v23,  0x16u);
    }

    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[HHDEndpoint endpointWithAccessoryId:mediaRouteId:bubbleId:state:]( &OBJC_CLASS___HHDEndpoint,  "endpointWithAccessoryId:mediaRouteId:bubbleId:state:",  v8,  v9,  v14,  1LL));
    if ((-[HHDPersistence saveEndpoint:error:](self->_persistence, "saveEndpoint:error:", v17, a5) & 1) != 0)
    {
      -[NSMutableArray addObject:](self->_endpoints, "addObject:", v17);
      -[HHDEndpointManager postEndpointListChangedWithEndpoint:changeType:]( self,  "postEndpointListChangedWithEndpoint:changeType:",  v17,  2LL);
      if (a5) {
        id v18 = *a5;
      }
      else {
        id v18 = 0LL;
      }
      [v11 endAndSendWithError:v18 eventBuilder:0];
      id v21 = v17;
    }

    else
    {
      if (a5) {
        id v20 = *a5;
      }
      else {
        id v20 = 0LL;
      }
      [v11 endAndSendWithError:v20 eventBuilder:0];
      id v21 = 0LL;
    }
  }

  else
  {
    if (a5) {
      id v19 = *a5;
    }
    else {
      id v19 = 0LL;
    }
    [v11 endAndSendWithError:v19 eventBuilder:0];
    id v21 = 0LL;
  }

  return v21;
}

- (BOOL)deleteEndpointWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[HHAnalyticsReporter sharedReporter](&OBJC_CLASS___HHAnalyticsReporter, "sharedReporter"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 startIntervalWithEventName:@"com.apple.homehub.endpoint.delete" eventBuilder:0]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[HHDEndpointManager endpointForIdentifier:error:](self, "endpointForIdentifier:error:", v6, a4));
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = [v9 state];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100008BB8;
    v21[3] = &unk_1000248E0;
    id v12 = v6;
    id v22 = v12;
    int v23 = self;
    id v13 = v10;
    id v24 = v13;
    -[HHDEndpointManager _deactivateEndpointWithIdentifier:persist:callback:]( self,  "_deactivateEndpointWithIdentifier:persist:callback:",  v12,  0LL,  v21);
    if (v11 != (id)1)
    {
      [v13 setState:1];
      -[HHDEndpointManager postEndpointListChangedWithEndpoint:changeType:]( self,  "postEndpointListChangedWithEndpoint:changeType:",  v13,  1LL);
    }

    if ((-[HHDPersistence removeEndpoint:](self->_persistence, "removeEndpoint:", v13) & 1) == 0)
    {
      id v14 = sub_100007F64();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v26 = &stru_100024E50;
        __int16 v27 = 2114;
        id v28 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%@Persistence failed to remove endpoint with identifier %{public}@",  buf,  0x16u);
      }
    }

    -[NSMutableArray removeObject:](self->_endpoints, "removeObject:", v13);
    id v16 = sub_100007F64();
    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v26 = &stru_100024E50;
      __int16 v27 = 2114;
      id v28 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%@Deleting endpoint with identifier %{public}@",  buf,  0x16u);
    }

    -[HHDEndpointManager postEndpointListChangedWithEndpoint:changeType:]( self,  "postEndpointListChangedWithEndpoint:changeType:",  v13,  3LL);
    if (a4) {
      id v18 = *a4;
    }
    else {
      id v18 = 0LL;
    }
    [v8 endAndSendWithError:v18 eventBuilder:0];
  }

  else
  {
    if (a4) {
      id v19 = *a4;
    }
    else {
      id v19 = 0LL;
    }
    [v8 endAndSendWithError:v19 eventBuilder:0];
  }

  return v10 != 0LL;
}

- (BOOL)activateEndpointWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[HHAnalyticsReporter sharedReporter](&OBJC_CLASS___HHAnalyticsReporter, "sharedReporter"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 startIntervalWithEventName:@"com.apple.homehub.endpoint.activate" eventBuilder:0]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[HHDEndpointManager endpointForIdentifier:error:](self, "endpointForIdentifier:error:", v6, a4));
  if (-[HHDEndpointManager _canActivateEndpoint:error:](self, "_canActivateEndpoint:error:", v9, a4))
  {
    id v10 = sub_100007F64();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v20 = 138412546;
      id v21 = &stru_100024E50;
      __int16 v22 = 2114;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%@Activating endpoint with identifier %{public}@",  (uint8_t *)&v20,  0x16u);
    }

    bubbleManager = self->_bubbleManager;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 launchInstanceId]);
    LOBYTE(bubbleManager) = -[HHDBubbleManagementService activateBubbleWithIdentifier:error:]( bubbleManager,  "activateBubbleWithIdentifier:error:",  v13,  a4);

    if ((bubbleManager & 1) != 0)
    {
      [v9 setState:2];
      -[HHDEndpointManager _updateStateForEndpoint:changeType:error:]( self,  "_updateStateForEndpoint:changeType:error:",  v9,  0LL,  a4);
      if (a4) {
        id v14 = *a4;
      }
      else {
        id v14 = 0LL;
      }
      [v8 endAndSendWithError:v14 eventBuilder:0];
      BOOL v18 = 1;
      goto LABEL_16;
    }

    id v15 = sub_100007F64();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v20 = 138412546;
      id v21 = &stru_100024E50;
      __int16 v22 = 2114;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%@Failed to activate endpoint with identifier %{public}@",  (uint8_t *)&v20,  0x16u);
    }
  }

  if (a4) {
    id v17 = *a4;
  }
  else {
    id v17 = 0LL;
  }
  [v8 endAndSendWithError:v17 eventBuilder:0];
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (void)deactivateEndpointWithIdentifier:(id)a3 callback:(id)a4
{
}

- (id)endpointForIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t v7 = self->_endpoints;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v19,  v27,  16LL);
  if (v8)
  {
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accessoryId", (void)v19));
        unsigned int v13 = [v12 isEqual:v6];

        if (v13)
        {
          id v8 = v11;
          id v14 = sub_100007F64();
          id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v24 = &stru_100024E50;
            __int16 v25 = 2114;
            id v26 = v6;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%@Found endpoint with identifier %{public}@",  buf,  0x16u);
          }

          goto LABEL_13;
        }
      }

      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v19,  v27,  16LL);
      if (v8) {
        continue;
      }
      break;
    }
  }

- (void)_deactivateEndpointWithIdentifier:(id)a3 persist:(BOOL)a4 callback:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[HHAnalyticsReporter sharedReporter](&OBJC_CLASS___HHAnalyticsReporter, "sharedReporter"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 startIntervalWithEventName:@"com.apple.homehub.endpoint.deactivate" eventBuilder:0]);

  id v29 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[HHDEndpointManager endpointForIdentifier:error:](self, "endpointForIdentifier:error:", v8, &v29));
  id v13 = v29;
  if (v12)
  {
    if ([v12 state] == (id)1)
    {
      [v11 endAndSendWithError:0 eventBuilder:0];
      id v14 = sub_100007F64();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        __int128 v31 = &stru_100024E50;
        __int16 v32 = 2114;
        id v33 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%@Endpoint with identifier %{public}@ is already inactive, cannot deactivate again.",  buf,  0x16u);
      }

      v9[2](v9, 0LL);
    }

    else
    {
      id v18 = sub_100007F64();
      __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        __int128 v31 = &stru_100024E50;
        __int16 v32 = 2114;
        id v33 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%@Deactivating endpoint with identifier %{public}@",  buf,  0x16u);
      }

      [v12 setOperationInProgress:1];
      bubbleManager = self->_bubbleManager;
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v12 launchInstanceId]);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_1000094E8;
      v22[3] = &unk_100024908;
      id v23 = v8;
      BOOL v28 = a4;
      id v24 = v12;
      __int16 v25 = self;
      id v26 = v11;
      __int16 v27 = v9;
      -[HHDBubbleManagementService deactivateBubbleWithIdentifier:callback:]( bubbleManager,  "deactivateBubbleWithIdentifier:callback:",  v21,  v22);
    }
  }

  else
  {
    [v11 endAndSendWithError:v13 eventBuilder:0];
    id v16 = sub_100007F64();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      __int128 v31 = &stru_100024E50;
      __int16 v32 = 2114;
      id v33 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%@Failed to deactivate, no endpoint with identifier %{public}@",  buf,  0x16u);
    }

    ((void (**)(id, id))v9)[2](v9, v13);
  }
}

- (BOOL)_canActivateEndpoint:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    if ([v5 operationInProgress])
    {
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSError hhErrorWithCode:description:]( &OBJC_CLASS___NSError,  "hhErrorWithCode:description:",  2LL,  @"Operation in progress that could counteract activation"));
      id v8 = v7;
      if (a4) {
        *a4 = v7;
      }
      id v9 = sub_100007F64();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 accessoryId]);
        int v17 = 138412802;
        id v18 = &stru_100024E50;
        __int16 v19 = 2114;
        __int128 v20 = v11;
        __int16 v21 = 2112;
        __int128 v22 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%@Failed activation for endpoint %{public}@ due to: %@",  (uint8_t *)&v17,  0x20u);
      }

      goto LABEL_14;
    }

    if ([v6 state] != (id)2)
    {
      BOOL v15 = 1;
      goto LABEL_15;
    }

    id v14 = sub_100007F64();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = &stru_100024E50;
      id v13 = "%@Not activating because the endpoint is already active.";
      goto LABEL_13;
    }
  }

  else
  {
    id v12 = sub_100007F64();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = &stru_100024E50;
      id v13 = "%@Not activating because no endpoint was found.";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v17, 0xCu);
    }
  }

- (BOOL)_updateStateForEndpoint:(id)a3 changeType:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = sub_100007F64();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 accessoryId]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 launchInstanceId]);
    uint64_t v13 = HHEndpointStateAsString([v8 state]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    int v27 = 138413058;
    BOOL v28 = &stru_100024E50;
    __int16 v29 = 2114;
    __int128 v30 = v11;
    __int16 v31 = 2114;
    __int16 v32 = v12;
    __int16 v33 = 2114;
    id v34 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%@Setting endpoint %{public}@ with instance id %{public}@ to %{public}@ and notifying clients.",  (uint8_t *)&v27,  0x2Au);
  }

  persistence = self->_persistence;
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 accessoryId]);
  unsigned __int8 v17 = -[HHDPersistence updateStateForEndpoint:state:error:]( persistence,  "updateStateForEndpoint:state:error:",  v16,  [v8 state],  a5);

  id v18 = self->_persistence;
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v8 launchInstanceId]);
  unsigned __int8 v20 = -[HHDPersistence updateStateForBubble:state:error:]( v18,  "updateStateForBubble:state:error:",  v19,  [v8 state],  a5);

  -[HHDEndpointManager postEndpointListChangedWithEndpoint:changeType:]( self,  "postEndpointListChangedWithEndpoint:changeType:",  v8,  a4);
  if (a5 && *a5)
  {
    id v21 = sub_100007F64();
    __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v8 accessoryId]);
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v8 launchInstanceId]);
      id v25 = *a5;
      int v27 = 138413058;
      BOOL v28 = &stru_100024E50;
      __int16 v29 = 2114;
      __int128 v30 = v23;
      __int16 v31 = 2114;
      __int16 v32 = v24;
      __int16 v33 = 2112;
      id v34 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%@Endpoint %{public}@ with instance id %{public}@ failed to persist endpoint with error: %@",  (uint8_t *)&v27,  0x2Au);
    }
  }

  return v17 & v20;
}

- (id)_endpointForBubble:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = self->_endpoints;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "launchInstanceId", (void)v14));
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
        unsigned __int8 v12 = [v10 isEqual:v11];

        if ((v12 & 1) != 0)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)addEndpointObserver:(id)a3
{
  id v4 = a3;
  endpointObservers = self->_endpointObservers;
  id v8 = v4;
  if (!endpointObservers)
  {
    id v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    uint64_t v7 = self->_endpointObservers;
    self->_endpointObservers = v6;

    id v4 = v8;
    endpointObservers = self->_endpointObservers;
  }

  -[NSHashTable addObject:](endpointObservers, "addObject:", v4);
}

- (void)removeEndpointObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end