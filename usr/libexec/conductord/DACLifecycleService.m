@interface DACLifecycleService
- (DACLifecycleService)init;
- (id)_createClientForConnection:(id)a3;
- (void)_configureServiceInterfacesOnConnection:(id)a3;
- (void)_lostClient:(id)a3;
- (void)coordinator:(id)a3 activatedAssertionForActivity:(id)a4 withChangeMarker:(id)a5;
- (void)coordinator:(id)a3 activityListChanged:(id)a4;
- (void)coordinator:(id)a3 queryAssertions:(id)a4;
- (void)monitor:(id)a3 clusterIsActive:(BOOL)a4;
- (void)registerActivity:(id)a3;
- (void)relinquishAssertionOfActivity:(id)a3 requester:(id)a4 changeMarker:(id)a5;
- (void)requestActivationOfActivity:(id)a3 requester:(id)a4 changeMarker:(id)a5;
- (void)requestDeactivationOfActivity:(id)a3 requester:(id)a4 changeMarker:(id)a5;
- (void)requestToSubscribe:(id)a3;
- (void)roleManager:(id)a3 roleChanged:(id)a4;
- (void)subscribeWithExistingState:(id)a3 registeredActivities:(id)a4 assertedActivities:(id)a5;
- (void)unregisterActivity:(id)a3;
@end

@implementation DACLifecycleService

- (DACLifecycleService)init
{
  uint64_t v3 = DACLifecycleServiceServiceName;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DACLifecycleServiceResetNotificationName));
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___DACLifecycleService;
  v5 = -[DACService _initWithServiceName:entitlement:resetNotificationName:]( &v24,  "_initWithServiceName:entitlement:resetNotificationName:",  v3,  @"com.apple.private.DeviceActivityConductor.lifecycle",  v4);

  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    clusterMonitors = v5->_clusterMonitors;
    v5->_clusterMonitors = (NSMutableDictionary *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    activeClusters = v5->_activeClusters;
    v5->_activeClusters = (NSMutableSet *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    coordinators = v5->_coordinators;
    v5->_coordinators = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    activityDBs = v5->_activityDBs;
    v5->_activityDBs = (NSMutableDictionary *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    activityLists = v5->_activityLists;
    v5->_activityLists = (NSMutableDictionary *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    roleManagers = v5->_roleManagers;
    v5->_roleManagers = (NSMutableDictionary *)v16;

    uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    roles = v5->_roles;
    v5->_roles = (NSMutableDictionary *)v18;

    v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](v5, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100007440;
    block[3] = &unk_10001C3C0;
    v23 = v5;
    dispatch_async(v20, block);
  }

  return v5;
}

- (void)monitor:(id)a3 clusterIsActive:(BOOL)a4
{
  int v4 = a4;
  uint64_t v6 = a3;
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  if (v6) {
    uint64_t v8 = (void *)v6[2];
  }
  else {
    uint64_t v8 = 0LL;
  }
  id v9 = v8;
  if (self) {
    clusterMonitors = self->_clusterMonitors;
  }
  else {
    clusterMonitors = 0LL;
  }
  v11 = clusterMonitors;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v11, "objectForKey:", v9));
  unsigned __int8 v13 = [v6 isEqual:v12];

  if ((v13 & 1) == 0)
  {
    id v30 = sub_100014610(0);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v57 = self;
      __int16 v58 = 2048;
      v59 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%p discarding availability update from stale Cluster Monitor %p",  buf,  0x16u);
    }

    goto LABEL_52;
  }

  if (self) {
    activeClusters = self->_activeClusters;
  }
  else {
    activeClusters = 0LL;
  }
  if (-[NSMutableSet containsObject:](activeClusters, "containsObject:", v9) != v4)
  {
    if (v4)
    {
      if (self) {
        v15 = self->_activeClusters;
      }
      else {
        v15 = 0LL;
      }
      -[NSMutableSet addObject:](v15, "addObject:", v9);
      __int128 v52 = 0u;
      __int128 v53 = 0u;
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[DACService clients](self, "clients"));
      id v17 = -[os_log_s countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v50,  v55,  16LL);
      if (!v17) {
        goto LABEL_52;
      }
      id v18 = v17;
      v45 = self;
      v44 = v6;
      uint64_t v19 = *(void *)v51;
      do
      {
        v20 = 0LL;
        do
        {
          if (*(void *)v51 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v50 + 1) + 8LL * (void)v20);
          if (v21) {
            v22 = *(void **)(v21 + 32);
          }
          else {
            v22 = 0LL;
          }
          id v23 = v22;
          unsigned int v24 = [v9 isEqual:v23];

          if (v24)
          {
            if (v21)
            {
              v25 = (void (**)(void))*(id *)(v21 + 24);
              objc_setProperty_nonatomic_copy((id)v21, v26, 0LL, 24LL);
              if (v25)
              {
                id v27 = sub_100014610(0);
                v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 134218242;
                  v57 = v45;
                  __int16 v58 = 2114;
                  v59 = (void *)v21;
                  _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%p acknowledging subscription request from client %{public}@",  buf,  0x16u);
                }

                v25[2](v25);
              }
            }

            else
            {
              v25 = 0LL;
            }
          }

          v20 = (char *)v20 + 1;
        }

        while (v18 != v20);
        id v29 = -[os_log_s countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v50,  v55,  16LL);
        id v18 = v29;
      }

      while (v29);
    }

    else
    {
      if (self) {
        v31 = self->_activeClusters;
      }
      else {
        v31 = 0LL;
      }
      -[NSMutableSet removeObject:](v31, "removeObject:", v9);
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[DACService clients](self, "clients"));
      id v32 = -[os_log_s countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v46,  v54,  16LL);
      if (!v32) {
        goto LABEL_52;
      }
      id v33 = v32;
      v34 = self;
      v44 = v6;
      uint64_t v35 = *(void *)v47;
      do
      {
        v36 = 0LL;
        do
        {
          if (*(void *)v47 != v35) {
            objc_enumerationMutation(v16);
          }
          v37 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)v36);
          if (v37) {
            v38 = (void *)v37[4];
          }
          else {
            v38 = 0LL;
          }
          id v39 = v38;
          unsigned int v40 = [v9 isEqual:v39];

          if (v40)
          {
            id v41 = sub_100014610(0);
            v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              v57 = v34;
              __int16 v58 = 2114;
              v59 = v37;
              _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "%p disconnecting client %{public}@",  buf,  0x16u);
            }

            sub_100014588(v37);
          }

          v36 = (char *)v36 + 1;
        }

        while (v33 != v36);
        id v43 = -[os_log_s countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v46,  v54,  16LL);
        id v33 = v43;
      }

      while (v43);
    }

    uint64_t v6 = v44;
LABEL_52:
  }
}

- (void)coordinator:(id)a3 activityListChanged:(id)a4
{
  uint64_t v6 = a3;
  id v7 = a4;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  if (v6) {
    id v9 = (void *)v6[2];
  }
  else {
    id v9 = 0LL;
  }
  id v10 = v9;
  if (self) {
    coordinators = self->_coordinators;
  }
  else {
    coordinators = 0LL;
  }
  uint64_t v12 = coordinators;
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v12, "objectForKey:", v10));
  unsigned __int8 v14 = [v6 isEqual:v13];

  if ((v14 & 1) != 0)
  {
    if (self) {
      activityLists = self->_activityLists;
    }
    else {
      activityLists = 0LL;
    }
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](activityLists, "objectForKey:", v10));
    if (!v16) {
      uint64_t v16 = objc_alloc_init(&OBJC_CLASS___DACActivityList);
    }
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 changesFromList:v16 includingMetadata:1]);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_100007D18;
    v42[3] = &unk_10001C630;
    v42[4] = self;
    id v18 = v10;
    id v43 = v18;
    [v17 enumerate:v42];
    if (self) {
      uint64_t v19 = self->_activityLists;
    }
    else {
      uint64_t v19 = 0LL;
    }
    -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v7, v18);
    id v20 = sub_100014610(0);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218242;
      __int128 v49 = self;
      __int16 v50 = 2114;
      __int128 v51 = v7;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "%p updated effective list %{public}@",  buf,  0x16u);
    }

    id v22 = v18;
    if (self)
    {
      unsigned int v40 = v17;
      id v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
      dispatch_assert_queue_V2(v23);

      id v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_activityLists, "objectForKey:", v22));
      if (v41)
      {
        id v39 = v10;
        __int128 v46 = 0u;
        __int128 v47 = 0u;
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        unsigned int v24 = self;
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[DACService clients](self, "clients"));
        id v26 = [v25 countByEnumeratingWithState:&v44 objects:buf count:16];
        if (v26)
        {
          id v27 = v26;
          v37 = v16;
          id v38 = v7;
          uint64_t v28 = *(void *)v45;
          do
          {
            id v29 = 0LL;
            do
            {
              if (*(void *)v45 != v28) {
                objc_enumerationMutation(v25);
              }
              id v30 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)v29);
              if (v30) {
                v31 = (void *)v30[4];
              }
              else {
                v31 = 0LL;
              }
              id v32 = v31;
              unsigned int v33 = [v22 isEqual:v32];

              if (v33) {
                sub_10000A168(v24, v30, v41);
              }
              id v29 = (char *)v29 + 1;
            }

            while (v27 != v29);
            id v34 = [v25 countByEnumeratingWithState:&v44 objects:buf count:16];
            id v27 = v34;
          }

          while (v34);
          id v7 = v38;
          id v10 = v39;
          uint64_t v16 = v37;
        }
      }

      else
      {
        id v36 = sub_100014610(0);
        v25 = (void *)objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          __int128 v49 = self;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v25,  OS_LOG_TYPE_ERROR,  "%p no Activity List",  buf,  0xCu);
        }
      }

      id v17 = v40;
    }
  }

  else
  {
    id v35 = sub_100014610(0);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      __int128 v49 = self;
      __int16 v50 = 2048;
      __int128 v51 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%p discarding list update from stale Coordinator %p",  buf,  0x16u);
    }
  }
}

- (void)coordinator:(id)a3 activatedAssertionForActivity:(id)a4 withChangeMarker:(id)a5
{
  uint64_t v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  if (v8) {
    uint64_t v12 = (void *)v8[2];
  }
  else {
    uint64_t v12 = 0LL;
  }
  id v13 = v12;
  if (self) {
    coordinators = self->_coordinators;
  }
  else {
    coordinators = 0LL;
  }
  v15 = coordinators;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v15, "objectForKey:", v13));
  unsigned __int8 v17 = [v8 isEqual:v16];

  if ((v17 & 1) != 0)
  {
    sub_1000083C8(self, v9, v10, v13, 1);
  }

  else
  {
    id v18 = sub_100014610(0);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v20 = 134218240;
      uint64_t v21 = self;
      __int16 v22 = 2048;
      id v23 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%p discarding assertion activation from stale Coordinator %p",  (uint8_t *)&v20,  0x16u);
    }
  }
}

- (void)coordinator:(id)a3 queryAssertions:(id)a4
{
  uint64_t v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  if (v6) {
    id v9 = (void *)v6[2];
  }
  else {
    id v9 = 0LL;
  }
  id v10 = v9;
  if (self) {
    coordinators = self->_coordinators;
  }
  else {
    coordinators = 0LL;
  }
  uint64_t v12 = coordinators;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v12, "objectForKey:", v10));
  unsigned __int8 v14 = [v6 isEqual:v13];

  if ((v14 & 1) != 0)
  {
    id v43 = v7;
    __int128 v44 = v6;
    id v41 = v10;
    id v15 = v10;
    v42 = self;
    if (self)
    {
      uint64_t v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
      dispatch_assert_queue_V2(v16);

      unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      __int128 v53 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue(-[DACService clients](self, "clients"));
      id v18 = [obj countByEnumeratingWithState:&v50 objects:buf count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v51;
        uint64_t v21 = &selRef_decodeIntegerForKey_;
        do
        {
          __int16 v22 = 0LL;
          do
          {
            if (*(void *)v51 != v20) {
              objc_enumerationMutation(obj);
            }
            uint64_t v23 = *(void *)(*((void *)&v50 + 1) + 8LL * (void)v22);
            if (v23) {
              unsigned int v24 = *(void **)(v23 + *((int *)v21 + 345));
            }
            else {
              unsigned int v24 = 0LL;
            }
            id v25 = v24;
            unsigned int v26 = [v15 isEqual:v25];

            if (v26)
            {
              __int128 v48 = 0u;
              __int128 v49 = 0u;
              __int128 v46 = 0u;
              __int128 v47 = 0u;
              if (v23) {
                id v27 = *(void **)(v23 + 40);
              }
              else {
                id v27 = 0LL;
              }
              id v28 = v27;
              id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 allKeys]);

              id v30 = [v29 countByEnumeratingWithState:&v46 objects:v54 count:16];
              if (v30)
              {
                id v31 = v30;
                uint64_t v32 = *(void *)v47;
                do
                {
                  for (i = 0LL; i != v31; i = (char *)i + 1)
                  {
                    if (*(void *)v47 != v32) {
                      objc_enumerationMutation(v29);
                    }
                    id v34 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
                  }

                  id v31 = [v29 countByEnumeratingWithState:&v46 objects:v54 count:16];
                }

                while (v31);
              }

              uint64_t v21 = &selRef_decodeIntegerForKey_;
            }

            __int16 v22 = (char *)v22 + 1;
          }

          while (v22 != v19);
          id v35 = [obj countByEnumeratingWithState:&v50 objects:buf count:16];
          id v19 = v35;
        }

        while (v35);
      }
    }

    else
    {
      unsigned __int8 v17 = 0LL;
    }

    id v7 = v43;
    uint64_t v6 = v44;
    id v10 = v41;
    self = v42;
  }

  else
  {
    id v36 = sub_100014610(0);
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v56 = self;
      __int16 v57 = 2048;
      __int16 v58 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "%p received assertion query from stale Coordinator %p",  buf,  0x16u);
    }

    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  }

  id v38 = sub_100014610(0);
  id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v40 = [v17 count];
    *(_DWORD *)buf = 134218498;
    v56 = self;
    __int16 v57 = 2048;
    __int16 v58 = v40;
    __int16 v59 = 2114;
    v60 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "%p holding %lu total assertions (%{public}@)",  buf,  0x20u);
  }

  v7[2](v7, v17);
}

- (void)roleManager:(id)a3 roleChanged:(id)a4
{
  id v6 = a3;
  id v30 = a4;
  id v31 = self;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  uint64_t v35 = 0LL;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  id v38 = sub_100009314;
  id v39 = sub_100009324;
  id v40 = 0LL;
  if (self) {
    roleManagers = self->_roleManagers;
  }
  else {
    roleManagers = 0LL;
  }
  id v9 = roleManagers;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_10000932C;
  v32[3] = &unk_10001C590;
  id v29 = v6;
  id v33 = v29;
  id v34 = &v35;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v9, "enumerateKeysAndObjectsUsingBlock:", v32);

  id v10 = v36;
  if (v36[5])
  {
    if (self) {
      roles = self->_roles;
    }
    else {
      roles = 0LL;
    }
    uint64_t v12 = roles;
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v30, v10[5]);

    id v13 = sub_100014610(0);
    unsigned __int8 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218242;
      __int128 v46 = self;
      __int16 v47 = 2114;
      id v48 = v30;
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%p updated Role %{public}@", buf, 0x16u);
    }

    id v15 = (id)v36[5];
    if (self)
    {
      uint64_t v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
      dispatch_assert_queue_V2(v16);

      unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_roles, "objectForKey:", v15));
      if (v17)
      {
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        id v18 = (void *)objc_claimAutoreleasedReturnValue(-[DACService clients](self, "clients"));
        id v19 = [v18 countByEnumeratingWithState:&v41 objects:buf count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v42;
          do
          {
            uint64_t v21 = 0LL;
            do
            {
              if (*(void *)v42 != v20) {
                objc_enumerationMutation(v18);
              }
              __int16 v22 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)v21);
              if (v22) {
                uint64_t v23 = (void *)v22[4];
              }
              else {
                uint64_t v23 = 0LL;
              }
              id v24 = v23;
              unsigned int v25 = [v15 isEqual:v24];

              if (v25) {
                sub_100009FFC(v31, v22, v17);
              }
              uint64_t v21 = (char *)v21 + 1;
            }

            while (v19 != v21);
            id v26 = [v18 countByEnumeratingWithState:&v41 objects:buf count:16];
            id v19 = v26;
          }

          while (v26);
        }
      }

      else
      {
        id v28 = sub_100014610(0);
        id v18 = (void *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          __int128 v46 = self;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_ERROR, "%p no Role", buf, 0xCu);
        }
      }
    }
  }

  else
  {
    id v27 = sub_100014610(0);
    id v15 = (id)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      __int128 v46 = self;
      __int16 v47 = 2048;
      id v48 = v29;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v15,  OS_LOG_TYPE_ERROR,  "%p discarding role update from stale Role Manager %p",  buf,  0x16u);
    }
  }

  _Block_object_dispose(&v35, 8);
}

- (void)requestToSubscribe:(id)a3
{
  int v4 = (void (**)(void))a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1000050FC();
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[DACService _currentClient](self, "_currentClient"));
  id v9 = (void *)v8;
  if (!v8)
  {
    id v12 = sub_100014610(0);
    id v13 = (id *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      int v20 = 134217984;
      uint64_t v21 = self;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  OS_LOG_TYPE_ERROR,  "%p no client to subscribe",  (uint8_t *)&v20,  0xCu);
    }

    goto LABEL_16;
  }

  objc_storeStrong((id *)(v8 + 32), v7);
  if (self) {
    activeClusters = self->_activeClusters;
  }
  else {
    activeClusters = 0LL;
  }
  if (!-[NSMutableSet containsObject:](activeClusters, "containsObject:", v7))
  {
    objc_setProperty_nonatomic_copy(v9, v11, v4, 24LL);
    if (self) {
      clusterMonitors = self->_clusterMonitors;
    }
    else {
      clusterMonitors = 0LL;
    }
    id v13 = (id *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](clusterMonitors, "objectForKey:", v7));
    if (!v13)
    {
      id v15 = objc_alloc(&OBJC_CLASS___DACClusterMonitor);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
      id v13 = sub_10000CFC0((id *)&v15->super.isa, self, v16, v7);

      id v17 = sub_100014610(0);
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 134218240;
        uint64_t v21 = self;
        __int16 v22 = 2048;
        uint64_t v23 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%p created Monitor %p",  (uint8_t *)&v20,  0x16u);
      }

      if (self) {
        id v19 = self->_clusterMonitors;
      }
      else {
        id v19 = 0LL;
      }
      -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v13, v7);
    }

- (void)subscribeWithExistingState:(id)a3 registeredActivities:(id)a4 assertedActivities:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (DACActivityDB *)a5;
  v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  id v12 = sub_1000050FC();
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = objc_claimAutoreleasedReturnValue(-[DACService _currentClient](self, "_currentClient"));
  id v15 = (void *)v14;
  if (v14)
  {
    objc_storeStrong((id *)(v14 + 32), v13);
    if (self) {
      roleManagers = self->_roleManagers;
    }
    else {
      roleManagers = 0LL;
    }
    id v17 = (DACActivityDB *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](roleManagers, "objectForKey:", v13));
    if (!v17)
    {
      id v18 = objc_alloc(&OBJC_CLASS___DACRoleManager);
      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
      int v20 = (void *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
      id v17 = (DACActivityDB *)[v18 initWithDelegate:self lastLeaderAt:v19 queue:v20];

      if (self) {
        uint64_t v21 = self->_roleManagers;
      }
      else {
        uint64_t v21 = 0LL;
      }
      -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v17, v13);
      id v22 = sub_100014610(0);
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v71 = self;
        __int16 v72 = 2048;
        v73 = v17;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%p created RoleManager %p", buf, 0x16u);
      }
    }

    if (self) {
      activityDBs = self->_activityDBs;
    }
    else {
      activityDBs = 0LL;
    }
    v61 = v10;
    unsigned int v25 = (DACActivityDB *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](activityDBs, "objectForKey:", v13, v17));
    if (!v25)
    {
      unsigned int v25 = objc_alloc_init(&OBJC_CLASS___DACActivityDB);
      if (self) {
        id v26 = self->_activityDBs;
      }
      else {
        id v26 = 0LL;
      }
      -[NSMutableDictionary setObject:forKey:](v26, "setObject:forKey:", v25, v13);
      id v27 = sub_100014610(0);
      id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v71 = self;
        __int16 v72 = 2048;
        v73 = v25;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%p created ActivityDB %p", buf, 0x16u);
      }
    }

    __int128 v68 = 0u;
    __int128 v69 = 0u;
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    id v29 = v9;
    id v30 = [v29 countByEnumeratingWithState:&v66 objects:v79 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v67;
      do
      {
        for (i = 0LL; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v67 != v32) {
            objc_enumerationMutation(v29);
          }
          sub_1000047E8(v25, *(void **)(*((void *)&v66 + 1) + 8LL * (void)i));
        }

        id v31 = [v29 countByEnumeratingWithState:&v66 objects:v79 count:16];
      }

      while (v31);
    }

    id v59 = v9;
    v60 = v8;

    id v34 = sub_100014610(0);
    uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v71 = self;
      __int16 v72 = 2114;
      v73 = v61;
      __int16 v74 = 2114;
      v75 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "%p matching assertions %{public}@ from subscribing client %{public}@",  buf,  0x20u);
    }

    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    id v36 = v61;
    id v37 = -[DACActivityDB countByEnumeratingWithState:objects:count:]( v36,  "countByEnumeratingWithState:objects:count:",  &v62,  v78,  16LL);
    if (v37)
    {
      id v38 = v37;
      uint64_t v39 = *(void *)v63;
      do
      {
        for (j = 0LL; j != v38; j = (char *)j + 1)
        {
          if (*(void *)v63 != v39) {
            objc_enumerationMutation(v36);
          }
          __int128 v41 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)j);
          __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(-[DACActivityDB objectForKey:](v36, "objectForKey:", v41));
          sub_100009CE4(self, v42, v41, v15);
          sub_1000083C8(self, v42, v41, v13, 0);
        }

        id v38 = -[DACActivityDB countByEnumeratingWithState:objects:count:]( v36,  "countByEnumeratingWithState:objects:count:",  &v62,  v78,  16LL);
      }

      while (v38);
    }

    if (self) {
      coordinators = self->_coordinators;
    }
    else {
      coordinators = 0LL;
    }
    id v8 = v60;
    __int128 v44 = coordinators;
    __int128 v45 = (id *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v44, "objectForKey:", v13));

    if (v45)
    {
      id v46 = sub_100014610(0);
      __int16 v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218754;
        v71 = self;
        __int16 v72 = 2048;
        v73 = (DACActivityDB *)v45;
        __int16 v74 = 2114;
        v75 = v15;
        __int16 v76 = 2114;
        v77 = v60;
        _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "%p already have Coordinator %p, disregarding client %{public}@ list %{public}@",  buf,  0x2Au);
      }

      id v9 = v59;
    }

    else
    {
      __int128 v50 = objc_alloc(&OBJC_CLASS___DACLifecycleCoordinator);
      __int128 v51 = (void *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
      __int128 v45 = sub_10000D458((id *)&v50->super.isa, self, v51, v25, v60, v13);

      if (self) {
        __int128 v52 = self->_coordinators;
      }
      else {
        __int128 v52 = 0LL;
      }
      -[NSMutableDictionary setObject:forKey:](v52, "setObject:forKey:", v45, v13);
      id v53 = sub_100014610(0);
      __int16 v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
      id v9 = v59;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        v71 = self;
        __int16 v72 = 2048;
        v73 = (DACActivityDB *)v45;
        __int16 v74 = 2114;
        v75 = v60;
        _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "%p created Coordinator %p with state %{public}@",  buf,  0x20u);
      }
    }

    if (self) {
      roles = self->_roles;
    }
    else {
      roles = 0LL;
    }
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](roles, "objectForKey:", v13));
    if (v55) {
      sub_100009FFC(self, v15, v55);
    }
    if (self) {
      activityLists = self->_activityLists;
    }
    else {
      activityLists = 0LL;
    }
    __int16 v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](activityLists, "objectForKey:", v13));
    if (v57) {
      sub_10000A168(self, v15, v57);
    }

    id v10 = v61;
    __int128 v49 = v58;
  }

  else
  {
    id v48 = sub_100014610(0);
    __int128 v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v71 = self;
      _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "%p no client to subscribe", buf, 0xCu);
    }
  }
}

- (void)registerActivity:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_10000A3D8((id *)&self->super.super.isa);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  if (v7)
  {
    sub_1000047E8(v7, v4);
  }

  else
  {
    id v9 = sub_100014610(0);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 134218242;
      id v12 = self;
      __int16 v13 = 2114;
      id v14 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%p ignoring %{public}@ registration, no ActivityDB",  (uint8_t *)&v11,  0x16u);
    }
  }
}

- (void)unregisterActivity:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_10000A3D8((id *)&self->super.super.isa);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  if (v7)
  {
    sub_1000049D8(v7, v4);
  }

  else
  {
    id v9 = sub_100014610(0);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 134218242;
      id v12 = self;
      __int16 v13 = 2114;
      id v14 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%p ignoring %{public}@ unregistration, no ActivityDB",  (uint8_t *)&v11,  0x16u);
    }
  }
}

- (void)requestActivationOfActivity:(id)a3 requester:(id)a4 changeMarker:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  id v12 = sub_10000A80C((id *)&self->super.super.isa);
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[DACService _currentClient](self, "_currentClient"));
    if (v14) {
      sub_100009CE4(self, v8, v10, v14);
    }
    sub_10000DCD8((uint64_t)v13, v8, v9, v10);
  }

  else
  {
    id v15 = sub_100014610(0);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
    {
      int v16 = 134218242;
      id v17 = self;
      __int16 v18 = 2114;
      id v19 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  OS_LOG_TYPE_ERROR,  "%p ignoring %{public}@ activation, no Coordinator",  (uint8_t *)&v16,  0x16u);
    }
  }
}

- (void)requestDeactivationOfActivity:(id)a3 requester:(id)a4 changeMarker:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  id v12 = sub_10000A80C((id *)&self->super.super.isa);
  uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
  id v14 = (void *)v13;
  if (v13)
  {
    sub_10000E44C(v13, v8, v9, v10);
  }

  else
  {
    id v15 = sub_100014610(0);
    int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = 134218242;
      __int16 v18 = self;
      __int16 v19 = 2114;
      id v20 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%p ignoring %{public}@ deactivation, no Coordinator",  (uint8_t *)&v17,  0x16u);
    }
  }
}

- (void)relinquishAssertionOfActivity:(id)a3 requester:(id)a4 changeMarker:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[DACService _currentClient](self, "_currentClient"));
  uint64_t v13 = (void *)v12;
  id v32 = v9;
  if (v12) {
    id v14 = *(void **)(v12 + 40);
  }
  else {
    id v14 = 0LL;
  }
  id v15 = v14;
  id v33 = v8;
  int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v8]);

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v17 = v16;
  id v18 = [v17 countByEnumeratingWithState:&v34 objects:v48 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v35;
LABEL_5:
    uint64_t v21 = 0LL;
    while (1)
    {
      if (*(void *)v35 != v20) {
        objc_enumerationMutation(v17);
      }
      id v22 = *(void **)(*((void *)&v34 + 1) + 8 * v21);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "changeMarker", v32));
      unsigned __int8 v24 = [v10 isEqual:v23];

      if ((v24 & 1) != 0) {
        break;
      }
      if (v19 == (id)++v21)
      {
        id v19 = [v17 countByEnumeratingWithState:&v34 objects:v48 count:16];
        if (v19) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }

    id v25 = v22;

    if (!v25) {
      goto LABEL_16;
    }
    id v26 = v32;
    [v25 setOrigin:v32];
    id v27 = sub_100014610(2);
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    id v29 = v33;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134219010;
      uint64_t v39 = self;
      __int16 v40 = 2114;
      id v41 = v25;
      __int16 v42 = 2114;
      id v43 = v33;
      __int16 v44 = 2114;
      id v45 = v10;
      __int16 v46 = 2114;
      __int16 v47 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%p relinquishing %{public}@ for %{public}@ with %{public}@ held by %{public}@",  buf,  0x34u);
    }

    sub_100008054(self, v25, v33, v13);
  }

  else
  {
LABEL_11:

LABEL_16:
    id v30 = sub_100014610(2);
    id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    id v26 = v32;
    id v29 = v33;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218754;
      uint64_t v39 = self;
      __int16 v40 = 2114;
      id v41 = v33;
      __int16 v42 = 2114;
      id v43 = v10;
      __int16 v44 = 2114;
      id v45 = v13;
      _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "%p no assertion to relinquish for %{public}@ with %{public}@ held by %{public}@",  buf,  0x2Au);
    }

    id v25 = 0LL;
  }
}

- (void)_configureServiceInterfacesOnConnection:(id)a3
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___DACLifecycleService;
  id v4 = a3;
  -[DACService _configureServiceInterfacesOnConnection:](&v22, "_configureServiceInterfacesOnConnection:", v4);
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = &OBJC_PROTOCOL___DACLifecycleServiceInterface;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](&OBJC_CLASS___NSXPCInterface, "interfaceWithProtocol:", v6));
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___DACActivityDescriptor, v8);
  int v11 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v9,  objc_opt_class(&OBJC_CLASS___NSSet, v10),  0LL);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v7 setClasses:v12 forSelector:"subscribeWithExistingState:registeredActivities:assertedActivities:" argumentIndex:1 ofReply:0];
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___DACChangeMarker, v13);
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___DACActivityDescriptor, v15);
  id v18 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v14,  v16,  objc_opt_class(&OBJC_CLASS___NSDictionary, v17),  0LL);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  [v7 setClasses:v19 forSelector:"subscribeWithExistingState:registeredActivities:assertedActivities:" argumentIndex:2 ofReply:0];
  [v4 setExportedInterface:v7];
  [v4 setExportedObject:self];
  uint64_t v20 = &OBJC_PROTOCOL___DACLifecycleClientInterface;

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](&OBJC_CLASS___NSXPCInterface, "interfaceWithProtocol:", v20));
  [v4 setRemoteObjectInterface:v21];
}

- (id)_createClientForConnection:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = -[DACLifecycleServiceClient initWithConnection:]( objc_alloc(&OBJC_CLASS___DACLifecycleServiceClient),  "initWithConnection:",  v4);
  return v6;
}

- (void)_lostClient:(id)a3
{
  id v4 = (id *)a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___DACLifecycleService;
  -[DACService _lostClient:](&v24, "_lostClient:", v4);
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    id v6 = v4[4];
    if (v6)
    {
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DACService clients](self, "clients", 0LL));
      id v8 = [v7 countByEnumeratingWithState:&v20 objects:v27 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v21;
        while (2)
        {
          for (i = 0LL; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v21 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
            if (v12) {
              uint64_t v12 = (void *)v12[4];
            }
            uint64_t v13 = v12;
            unsigned __int8 v14 = [v6 isEqual:v13];

            if ((v14 & 1) != 0)
            {

              goto LABEL_19;
            }
          }

          id v9 = [v7 countByEnumeratingWithState:&v20 objects:v27 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }

      id v15 = sub_100014610(0);
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        id v26 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%p tearing down, no clients subscribed",  buf,  0xCu);
      }

      if (self)
      {
        -[NSMutableDictionary removeObjectForKey:](self->_clusterMonitors, "removeObjectForKey:", v6);
        -[NSMutableSet removeObject:](self->_activeClusters, "removeObject:", v6);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_coordinators, "objectForKey:", v6));
        sub_10000DB50((uint64_t)v17);

        -[NSMutableDictionary removeObjectForKey:](self->_coordinators, "removeObjectForKey:", v6);
        -[NSMutableDictionary removeObjectForKey:](self->_activityDBs, "removeObjectForKey:", v6);
        -[NSMutableDictionary removeObjectForKey:](self->_activityLists, "removeObjectForKey:", v6);
        -[NSMutableDictionary removeObjectForKey:](self->_roleManagers, "removeObjectForKey:", v6);
        roles = self->_roles;
      }

      else
      {
        [0 removeObjectForKey:v6];
        [0 removeObject:v6];
        id v19 = (void *)objc_claimAutoreleasedReturnValue([0 objectForKey:v6]);
        sub_10000DB50((uint64_t)v19);

        [0 removeObjectForKey:v6];
        [0 removeObjectForKey:v6];
        [0 removeObjectForKey:v6];
        [0 removeObjectForKey:v6];
        roles = 0LL;
      }

      -[NSMutableDictionary removeObjectForKey:](roles, "removeObjectForKey:", v6);
    }
  }

  else
  {
    id v6 = 0LL;
  }

- (void).cxx_destruct
{
}

@end