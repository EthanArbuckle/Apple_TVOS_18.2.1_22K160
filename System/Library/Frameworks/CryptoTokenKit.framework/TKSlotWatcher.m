@interface TKSlotWatcher
- (BOOL)hasStarted;
- (TKHostTokenRegistry)registry;
- (TKSlotWatcher)initWithTokenRegistry:(id)a3;
- (void)dealloc;
- (void)removeSlotWatch:(id)a3;
- (void)setSlotWithName:(id)a3 endpoint:(id)a4 type:(id)a5 reply:(id)a6;
- (void)startWithSlotServer:(id)a3;
- (void)stop;
@end

@implementation TKSlotWatcher

- (TKSlotWatcher)initWithTokenRegistry:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TKSlotWatcher;
  v6 = -[TKSlotWatcher init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_registry, a3);
  }

  return v7;
}

- (BOOL)hasStarted
{
  v2 = self;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_connection);
  BOOL v4 = WeakRetained != 0LL;

  objc_sync_exit(v2);
  return v4;
}

- (void)startWithSlotServer:(id)a3
{
  id v4 = a3;
  if (!-[TKSlotWatcher hasStarted](self, "hasStarted"))
  {
    id v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    slots = self->_slots;
    self->_slots = v5;

    p_connection = &self->_connection;
    objc_storeWeak((id *)&self->_connection, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___TKProtocolSlotClient));
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    [WeakRetained setRemoteObjectInterface:v8];

    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___TKProtocolSlotClientNotification));
    id v11 = objc_loadWeakRetained((id *)&self->_connection);
    [v11 setExportedInterface:v10];

    id v12 = objc_loadWeakRetained((id *)&self->_connection);
    [v12 setExportedObject:self];

    id v13 = objc_loadWeakRetained((id *)&self->_connection);
    [v13 resume];

    id v14 = objc_loadWeakRetained((id *)&self->_connection);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 synchronousRemoteObjectProxyWithErrorHandler:&stru_10001C758]);
    [v15 reportChangesForSlotType:0 reply:&stru_10001C778];

    objc_initWeak(&location, self);
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472LL;
    v21 = sub_100009BC4;
    v22 = &unk_10001C638;
    objc_copyWeak(&v23, &location);
    [v4 setInterruptionHandler:&v19];
    id v16 = sub_100008648();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_100010C20((uint64_t)v25, (uint64_t)-[NSMutableArray count](self->_slots, "count", v19, v20, v21, v22), v17);
    }

    if (!-[NSMutableArray count](self->_slots, "count"))
    {
      id v18 = objc_loadWeakRetained((id *)&self->_connection);
      [v18 invalidate];

      objc_storeWeak((id *)p_connection, 0LL);
    }

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  [WeakRetained invalidate];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TKSlotWatcher;
  -[TKSlotWatcher dealloc](&v4, "dealloc");
}

- (void)setSlotWithName:(id)a3 endpoint:(id)a4 type:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(void))a6;
  if (v11)
  {
    id v14 = self;
    objc_sync_enter(v14);
    v15 = -[TKSlotWatch initWithName:endpoint:slotType:watcher:]( objc_alloc(&OBJC_CLASS___TKSlotWatch),  "initWithName:endpoint:slotType:watcher:",  v10,  v11,  v12,  v14);
    if (v15)
    {
      -[NSMutableArray addObject:](v14->_slots, "addObject:", v15);
      -[TKSlotWatch startObserving](v15, "startObserving");
      id v16 = sub_100008648();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        id v18 = -[NSMutableArray count](v14->_slots, "count");
        int v19 = 138543874;
        id v20 = v12;
        __int16 v21 = 2114;
        id v22 = v10;
        __int16 v23 = 2048;
        id v24 = v18;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "added slot: type=%{public}@, name=%{public}@ - total %lu slots",  (uint8_t *)&v19,  0x20u);
      }
    }

    objc_sync_exit(v14);
  }

  v13[2](v13);
}

- (void)removeSlotWatch:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (-[NSMutableArray indexOfObject:](v5->_slots, "indexOfObject:", v4) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObject:](v5->_slots, "removeObject:", v4);
    id v6 = sub_100008648();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
      sub_100010D00(v8, v9, (uint64_t)-[NSMutableArray count](v5->_slots, "count"), v7);
    }
  }

  objc_sync_exit(v5);
}

- (void)stop
{
  v3 = self;
  objc_sync_enter(v3);
  id WeakRetained = objc_loadWeakRetained((id *)&v3->_connection);
  [WeakRetained invalidate];

  id v5 = -[NSMutableArray copy](v3->_slots, "copy");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      objc_super v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) remove];
        objc_super v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }

  if (-[NSMutableArray count](v3->_slots, "count"))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    objc_msgSend( v10,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  v3,  @"TKSlotWatcher.m",  342,  @"%d slots still present after removing them",  -[NSMutableArray count](v3->_slots, "count"));
  }

  objc_sync_exit(v3);
}

- (TKHostTokenRegistry)registry
{
  return self->_registry;
}

- (void).cxx_destruct
{
}

@end