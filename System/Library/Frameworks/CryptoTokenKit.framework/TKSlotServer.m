@interface TKSlotServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)clientListener;
- (NSXPCListener)registryListener;
- (TKSlotServer)initWithRegistryListener:(id)a3 clientListener:(id)a4;
- (void)addClient:(id)a3 reply:(id)a4;
- (void)addSlotRegistration:(id)a3 name:(id)a4;
- (void)dealloc;
- (void)ensureSlotWatchersRunning;
- (void)notifyDesktopUp;
- (void)removeClient:(id)a3;
- (void)removeSlotRegistration:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation TKSlotServer

- (TKSlotServer)initWithRegistryListener:(id)a3 clientListener:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TKSlotServer;
  v9 = -[TKSlotServer init](&v15, "init");
  if (v9)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    clients = v9->_clients;
    v9->_clients = (NSMutableArray *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    registrations = v9->_registrations;
    v9->_registrations = (NSMutableArray *)v12;

    objc_storeStrong((id *)&v9->_registryListener, a3);
    -[NSXPCListener setDelegate:](v9->_registryListener, "setDelegate:", v9);
    objc_storeStrong((id *)&v9->_clientListener, a4);
    -[NSXPCListener setDelegate:](v9->_clientListener, "setDelegate:", v9);
  }

  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TKSlotServer;
  -[TKSlotServer dealloc](&v3, "dealloc");
}

- (void)start
{
}

- (void)stop
{
  obj = self;
  objc_sync_enter(obj);
  -[NSMutableArray removeAllObjects](obj->_clients, "removeAllObjects");
  -[NSMutableArray removeAllObjects](obj->_registrations, "removeAllObjects");
  objc_sync_exit(obj);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v6 = (NSXPCListener *)a3;
  id v7 = a4;
  if (self->_registryListener != v6)
  {
    if (self->_clientListener != v6
      || !+[TKSlotClient handleConnection:server:](&OBJC_CLASS___TKSlotClient, "handleConnection:server:", v7, self))
    {
      goto LABEL_4;
    }

- (void)addSlotRegistration:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v36 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  obj = (id *)&v7->super.isa;
  if (!-[NSMutableArray count](v7->_registrations, "count")) {
    -[TKSlotServer ensureSlotWatchersRunning](v7, "ensureSlotWatchersRunning");
  }
  LODWORD(v8) = 0;
LABEL_5:
  [v6 setSlotName:v36];
LABEL_6:
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v10 = obj[1];
  id v11 = [v10 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v43;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v43 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v42 + 1) + 8 * (void)i) slotName]);
        objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v6 slotName]);
        unsigned __int8 v16 = [v14 isEqualToString:v15];

        if ((v16 & 1) != 0)
        {

          uint64_t v8 = (v8 + 1);
          if ((_DWORD)v8)
          {
            v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %02d",  v36,  v8));
            [v6 setSlotName:v9];

            goto LABEL_6;
          }

          goto LABEL_5;
        }
      }

      id v11 = [v10 countByEnumeratingWithState:&v42 objects:v48 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  [obj[1] addObject:v6];
  v17 = (void *)objc_claimAutoreleasedReturnValue([v6 slotName]);
  id v18 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"slot server registration:%@", v17));
  v19 = (void *)os_transaction_create([v18 UTF8String]);
  [v6 setTransaction:v19];

  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v20 = obj[2];
  id v21 = [v20 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v39;
    do
    {
      for (j = 0LL; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v39 != v22) {
          objc_enumerationMutation(v20);
        }
        v24 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)j);
        v25 = (void *)objc_claimAutoreleasedReturnValue([v24 slotType]);
        if (v25)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue([v24 slotType]);
          v27 = (void *)objc_claimAutoreleasedReturnValue([v6 slotType]);
          unsigned int v28 = [v26 isEqualToString:v27];

          if (!v28) {
            continue;
          }
        }

        v29 = (void *)objc_claimAutoreleasedReturnValue([v24 notification]);
        v30 = (void *)objc_claimAutoreleasedReturnValue([v6 slotName]);
        v31 = (void *)objc_claimAutoreleasedReturnValue([v6 endpoint]);
        v32 = (void *)objc_claimAutoreleasedReturnValue([v6 slotType]);
        [v29 setSlotWithName:v30 endpoint:v31 type:v32 reply:&stru_10001C848];
      }

      id v21 = [v20 countByEnumeratingWithState:&v38 objects:v47 count:16];
    }

    while (v21);
  }

  id v33 = sub_10000AC90();
  v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue([v6 slotName]);
    sub_100010F5C(v35, (uint64_t)v46, v34);
  }

  objc_sync_exit(obj);
}

- (void)notifyDesktopUp
{
  obj = self;
  objc_sync_enter(obj);
  if (-[NSMutableArray count](obj->_registrations, "count")) {
    -[TKSlotServer ensureSlotWatchersRunning](obj, "ensureSlotWatchersRunning");
  }
  objc_sync_exit(obj);
}

- (void)ensureSlotWatchersRunning
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  objc_super v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v3, &stru_10001C868);
}

- (void)removeSlotRegistration:(id)a3
{
  id v4 = a3;
  obj = self;
  objc_sync_enter(obj);
  id v5 = sub_10000AC90();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 slotName]);
    sub_100011110(v7, (uint64_t)v26, v6);
  }

  -[NSMutableArray removeObject:](obj->_registrations, "removeObject:", v4);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t v8 = obj->_clients;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
  if (v9)
  {
    uint64_t v10 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 slotType]);
        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue([v12 slotType]);
          objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v4 slotType]);
          unsigned int v16 = [v14 isEqualToString:v15];

          if (!v16) {
            continue;
          }
        }

        v17 = (void *)objc_claimAutoreleasedReturnValue([v12 notification]);
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v4 slotName]);
        v19 = (void *)objc_claimAutoreleasedReturnValue([v4 slotType]);
        [v17 setSlotWithName:v18 endpoint:0 type:v19 reply:&stru_10001C8B0];
      }

      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
    }

    while (v9);
  }

  objc_sync_exit(obj);
}

- (void)addClient:(id)a3 reply:(id)a4
{
  id v6 = a3;
  dispatch_block_t block = a4;
  id v7 = self;
  objc_sync_enter(v7);
  __int128 v23 = v7;
  -[NSMutableArray addObject:](v7->_clients, "addObject:", v6);
  uint64_t v8 = dispatch_group_create();
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  obj = v7->_registrations;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
  if (v9)
  {
    uint64_t v10 = *(void *)v29;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v6 slotType]);
        if (!v13
          || (v14 = (void *)objc_claimAutoreleasedReturnValue([v6 slotType]),
              objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v12 slotType]),
              unsigned int v16 = [v14 isEqualToString:v15],
              v15,
              v14,
              v13,
              v16))
        {
          dispatch_group_enter(v8);
          v17 = (void *)objc_claimAutoreleasedReturnValue([v6 notification]);
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 slotName]);
          v19 = (void *)objc_claimAutoreleasedReturnValue([v12 endpoint]);
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v12 slotType]);
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472LL;
          v26[2] = sub_10000BDF8;
          v26[3] = &unk_10001C5E8;
          v27 = v8;
          [v17 setSlotWithName:v18 endpoint:v19 type:v20 reply:v26];
        }

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
    }

    while (v9);
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  __int128 v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_group_notify(v8, v22, block);

  objc_sync_exit(v23);
}

- (void)removeClient:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  -[NSMutableArray removeObject:](v4->_clients, "removeObject:", v5);
  objc_sync_exit(v4);
}

- (NSXPCListener)registryListener
{
  return self->_registryListener;
}

- (NSXPCListener)clientListener
{
  return self->_clientListener;
}

- (void).cxx_destruct
{
}

@end