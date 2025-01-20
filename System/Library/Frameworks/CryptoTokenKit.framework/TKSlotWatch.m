@interface TKSlotWatch
+ (BOOL)smartCard:(id)a3 mightHandleAIDFromExtension:(id)a4 foundAID:(id *)a5;
+ (id)supportedAIDsOfExtension:(id)a3;
+ (void)parseAIDForAttribute:(id)a3 into:(id)a4;
- (NSString)name;
- (TKSlotWatch)initWithName:(id)a3 endpoint:(id)a4 slotType:(id)a5 watcher:(id)a6;
- (void)dealloc;
- (void)getTokenIDs:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)remove;
- (void)startObserving;
- (void)tokenArrived;
- (void)tokenRemoved;
@end

@implementation TKSlotWatch

- (TKSlotWatch)initWithName:(id)a3 endpoint:(id)a4 slotType:(id)a5 watcher:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___TKSlotWatch;
  v15 = -[TKSlotWatch init](&v40, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    objc_storeStrong((id *)&v16->_slotType, a5);
    objc_storeStrong((id *)&v16->_endpoint, a4);
    objc_storeWeak((id *)&v16->_slotWatcher, v14);
    v16->_previousSlotState = 1LL;
    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    tokenConnections = v16->_tokenConnections;
    v16->_tokenConnections = (NSMutableDictionary *)v17;

    id v39 = 0LL;
    v19 = -[TKSmartCardSlot initWithEndpoint:error:]( objc_alloc(&OBJC_CLASS___TKSmartCardSlot),  "initWithEndpoint:error:",  v12,  &v39);
    id v20 = v39;
    smartCardSlot = v16->_smartCardSlot;
    v16->_smartCardSlot = v19;

    if (v16->_smartCardSlot)
    {
      id v22 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"slotwatch:%@", v11));
      uint64_t v23 = os_transaction_create([v22 UTF8String]);
      transaction = v16->_transaction;
      v16->_transaction = (OS_os_transaction *)v23;

      v25 = (TKSlotWatch *) objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"slotwatch:%@", v11));
      v26 = (const char *)-[TKSlotWatch UTF8String](v25, "UTF8String");
      dispatch_queue_attr_t v27 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v28 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v27);
      dispatch_queue_t v29 = dispatch_queue_create(v26, v28);
      queue = v16->_queue;
      v16->_queue = (OS_dispatch_queue *)v29;
    }

    else
    {
      id v31 = sub_100008648();
      v28 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR)) {
        sub_100010A98((uint64_t)v20, (os_log_s *)v28, v32, v33, v34, v35, v36, v37);
      }
      v25 = v16;
      v16 = 0LL;
    }
  }

  return v16;
}

- (void)dealloc
{
  smartCardSlot = self->_smartCardSlot;
  v4 = NSStringFromSelector("state");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[TKSmartCardSlot removeObserver:forKeyPath:context:]( smartCardSlot,  "removeObserver:forKeyPath:context:",  self,  v5,  0LL);

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TKSlotWatch;
  -[TKSlotWatch dealloc](&v6, "dealloc");
}

- (void)startObserving
{
  smartCardSlot = self->_smartCardSlot;
  v4 = NSStringFromSelector("state");
  id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  -[TKSmartCardSlot addObserver:forKeyPath:options:context:]( smartCardSlot,  "addObserver:forKeyPath:options:context:",  self,  v5,  7LL,  0LL);
}

- (void)remove
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_slotWatcher);
  [WeakRetained removeSlotWatch:self];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "objectForKey:", NSKeyValueChangeNewKey, a4));
  id v8 = [v7 integerValue];

  int64_t previousSlotState = self->_previousSlotState;
  if (v8 != (id)2)
  {
    if (v8 == (id)previousSlotState)
    {
      int64_t previousSlotState = (int64_t)v8;
    }

    else if (v8)
    {
      if (v8 == (id)1)
      {
        queue = (dispatch_queue_s *)self->_queue;
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472LL;
        v12[2] = sub_1000088C0;
        v12[3] = &unk_10001C5E8;
        v12[4] = self;
        dispatch_async(queue, v12);
        int64_t previousSlotState = 1LL;
      }

      else
      {
        int64_t previousSlotState = (int64_t)v8;
        if (v8 == (id)4)
        {
          v10 = (dispatch_queue_s *)self->_queue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000088B8;
          block[3] = &unk_10001C5E8;
          block[4] = self;
          dispatch_async(v10, block);
          int64_t previousSlotState = 4LL;
        }
      }
    }

    else
    {
      -[TKSlotWatch remove](self, "remove");
      int64_t previousSlotState = 0LL;
    }
  }

  self->_int64_t previousSlotState = previousSlotState;
}

- (void)getTokenIDs:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v5->_tokenConnections, "allKeys", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) stringRepresentation]);
        [v4 addObject:v10];

        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }

  objc_sync_exit(v5);
}

+ (void)parseAIDForAttribute:(id)a3 into:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    id v8 = v5;
    if (v8) {
      goto LABEL_15;
    }
    goto LABEL_16;
  }

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v5, v9) & 1) == 0) {
    goto LABEL_16;
  }
  id v10 = v5;
  char v19 = 0;
  *(_WORD *)__str = 0;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithCapacity:]( NSMutableData,  "dataWithCapacity:",  (unint64_t)[v10 length] >> 1));
  id v11 = v10;
  __int128 v12 = [v11 UTF8String];
  int v13 = 0;
  while (1)
  {
    int v14 = *v12;
    if (v14 != 32)
    {
      if (!*v12) {
        goto LABEL_14;
      }
      __str[v13++] = v14;
      if (v13 == 2) {
        break;
      }
    }

+ (id)supportedAIDsOfExtension:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 attributes]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:TKTokenClassDriverApplicationIDKey]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
    {
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      id v8 = v5;
      id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v15;
        do
        {
          __int128 v12 = 0LL;
          do
          {
            if (*(void *)v15 != v11) {
              objc_enumerationMutation(v8);
            }
            objc_msgSend( a1,  "parseAIDForAttribute:into:",  *(void *)(*((void *)&v14 + 1) + 8 * (void)v12),  v6,  (void)v14);
            __int128 v12 = (char *)v12 + 1;
          }

          while (v10 != v12);
          id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }

        while (v10);
      }
    }

    else
    {
      [a1 parseAIDForAttribute:v5 into:v6];
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

+ (BOOL)smartCard:(id)a3 mightHandleAIDFromExtension:(id)a4 foundAID:(id *)a5
{
  id v31 = a3;
  id v29 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "supportedAIDsOfExtension:"));
  id v8 = v7;
  if (v7)
  {
    uint64_t v41 = 0LL;
    v42 = &v41;
    uint64_t v43 = 0x3032000000LL;
    v44 = sub_100009058;
    v45 = sub_100009068;
    id v46 = 0LL;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    id obj = v7;
    id v9 = [obj countByEnumeratingWithState:&v37 objects:v51 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v38;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          __int128 v12 = v8;
          if (*(void *)v38 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v37 + 1) + 8LL * (void)i);
          id v36 = 0LL;
          v32[0] = _NSConcreteStackBlock;
          v32[1] = 3221225472LL;
          v32[2] = sub_100009070;
          v32[3] = &unk_10001C718;
          id v14 = v31;
          id v33 = v14;
          uint64_t v34 = v13;
          uint64_t v35 = &v41;
          unsigned __int8 v15 = [v14 inSessionWithError:&v36 executeBlock:v32];
          id v16 = v36;
          if ((v15 & 1) == 0)
          {
            id v19 = sub_100008648();
            id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              v26 = (void *)objc_claimAutoreleasedReturnValue([v14 slot]);
              dispatch_queue_attr_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 name]);
              *(_DWORD *)buf = 138543618;
              v48 = v27;
              __int16 v49 = 2114;
              id v50 = v16;
              _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Error connecting SmartCard in slot %{public}@: %{public}@",  buf,  0x16u);
            }

            id v8 = v12;
            goto LABEL_16;
          }

          BOOL v17 = v42[5] == 0;

          id v8 = v12;
          if (!v17) {
            goto LABEL_16;
          }
        }

        id v9 = [obj countByEnumeratingWithState:&v37 objects:v51 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

- (void)tokenArrived
{
  uint64_t v43 = _os_activity_create( (void *)&_mh_execute_header,  "token inserted",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v43, &state);
  id v3 = sub_100008648();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100010B48((uint64_t)self, v4, v5);
  }

  id v46 = (void *)objc_claimAutoreleasedReturnValue(-[TKSmartCardSlot makeSmartCard](self->_smartCardSlot, "makeSmartCard"));
  id WeakRetained = objc_loadWeakRetained((id *)&self->_slotWatcher);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained registry]);

  id v8 = objc_loadWeakRetained((id *)&self->_slotWatcher);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 registry]);
  v44 = (void *)objc_claimAutoreleasedReturnValue([v9 beginTransaction:@"tokenArrived"]);

  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  v42 = (void *)objc_claimAutoreleasedReturnValue([v44 tokenExtensions]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v42 allValues]);
  id v11 = [v10 countByEnumeratingWithState:&v53 objects:v64 count:16];
  char v12 = 0;
  if (v11)
  {
    uint64_t v50 = *(void *)v54;
    uint64_t v49 = TKTokenTypeKey;
    v45 = v7;
    id obj = v10;
    do
    {
      id v51 = v11;
      for (i = 0LL; i != v51; i = (char *)i + 1)
      {
        if (*(void *)v54 != v50) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)i);
        unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 attributes]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v49]);
        unsigned __int8 v17 = [v16 isEqual:@"smartcard"];

        if ((v17 & 1) != 0)
        {
          BOOL v18 = (void *)objc_opt_class(self);
          id v52 = 0LL;
          unsigned __int8 v19 = [v18 smartCard:v46 mightHandleAIDFromExtension:v14 foundAID:&v52];
          id v20 = v52;
          if ((v19 & 1) != 0)
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue([v7 driverCache]);
            v48 = (void *)objc_claimAutoreleasedReturnValue([v21 hostTokenDriverFromExtension:v14]);

            id v22 = -[TKHostTokenConnection initWithDriver:slot:AID:registry:error:]( objc_alloc(&OBJC_CLASS___TKHostTokenConnection),  "initWithDriver:slot:AID:registry:error:",  v48,  self->_endpoint,  v20,  v7,  0LL);
            if (v22)
            {
              id v23 = v20;
              v24 = self;
              objc_sync_enter(v24);
              tokenConnections = self->_tokenConnections;
              v26 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenConnection token](v22, "token"));
              dispatch_queue_attr_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 tokenID]);
              -[NSMutableDictionary setObject:forKey:](tokenConnections, "setObject:forKey:", v22, v27);

              id v20 = v23;
              id v28 = sub_100008648();
              id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                name = self->_name;
                id v31 = (NSString *)objc_claimAutoreleasedReturnValue([v14 identifier]);
                uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostTokenConnection token](v22, "token"));
                id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 tokenID]);
                *(_DWORD *)buf = 138543874;
                v59 = name;
                __int16 v60 = 2114;
                v61 = v31;
                __int16 v62 = 2114;
                v63 = v33;
                _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "%{public}@: %{public}@ is handling %{public}@",  buf,  0x20u);

                uint64_t v7 = v45;
                id v20 = v23;
              }

              objc_sync_exit(v24);
              char v12 = 1;
              goto LABEL_19;
            }

            if ((v12 & 1) != 0)
            {
              char v12 = 1;
            }

            else
            {
              id v34 = sub_100008648();
              v24 = (TKSlotWatch *)objc_claimAutoreleasedReturnValue(v34);
              if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v35 = (NSString *)objc_claimAutoreleasedReturnValue([v14 identifier]);
                id v36 = self->_name;
                *(_DWORD *)buf = 138543618;
                v59 = v35;
                __int16 v60 = 2114;
                v61 = v36;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v24,  OS_LOG_TYPE_DEFAULT,  "%{public}@ cannot handle token in slot %{public}@",  buf,  0x16u);
              }

              char v12 = 0;
LABEL_19:
            }
          }

          continue;
        }
      }

      uint64_t v10 = obj;
      id v11 = [obj countByEnumeratingWithState:&v53 objects:v64 count:16];
    }

    while (v11);
  }

  [v44 commit];
  if ((v12 & 1) == 0)
  {
    id v37 = sub_100008648();
    __int128 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      __int128 v39 = (NSString *)objc_claimAutoreleasedReturnValue(-[TKSmartCardSlot ATR](self->_smartCardSlot, "ATR"));
      __int128 v40 = (void *)objc_claimAutoreleasedReturnValue(-[TKSmartCardSlot ATR](self->_smartCardSlot, "ATR"));
      uint64_t v41 = (NSString *)objc_claimAutoreleasedReturnValue([v40 bytes]);
      *(_DWORD *)buf = 138543618;
      v59 = v39;
      __int16 v60 = 2114;
      v61 = v41;
      _os_log_error_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "No token driver found for card %{public}@ (ATR: %{public}@)",  buf,  0x16u);
    }
  }

  os_activity_scope_leave(&state);
}

- (void)tokenRemoved
{
  id v3 = sub_100008648();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100010BB4((uint64_t)self, v4, v5);
  }

  id v6 = self;
  objc_sync_enter(v6);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v6->_tokenConnections, "allKeys", 0LL));
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v10);
        id WeakRetained = objc_loadWeakRetained((id *)&v6->_slotWatcher);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained registry]);
        [v13 removeTokenWithTokenID:v11];

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  -[NSMutableDictionary removeAllObjects](v6->_tokenConnections, "removeAllObjects");
  objc_sync_exit(v6);
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end