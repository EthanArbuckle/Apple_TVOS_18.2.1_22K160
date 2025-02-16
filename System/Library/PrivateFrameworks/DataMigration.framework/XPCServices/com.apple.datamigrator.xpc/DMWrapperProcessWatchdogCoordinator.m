@interface DMWrapperProcessWatchdogCoordinator
- (DMWrapperProcessWatchdogCoordinator)init;
- (NSMutableSet)pidsKilled;
- (NSMutableSet)pluginStates;
- (OS_dispatch_queue)propertyAccessQueue;
- (id)_pluginStateThatBlocksNewRunEvents_onPropertyAccessQueue;
- (unint64_t)_countOfPlugins;
- (void)_killIfAppropriate_onPropertyAccessQueue;
- (void)callRunEventBlock:(id)a3 forPlugin:(id)a4;
- (void)setPidsKilled:(id)a3;
- (void)setPluginStates:(id)a3;
- (void)setPropertyAccessQueue:(id)a3;
- (void)watchdogPlugin:(id)a3 withPid:(int)a4;
@end

@implementation DMWrapperProcessWatchdogCoordinator

- (DMWrapperProcessWatchdogCoordinator)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DMWrapperProcessWatchdogCoordinator;
  v2 = -[DMWrapperProcessWatchdogCoordinator init](&v7, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    -[DMWrapperProcessWatchdogCoordinator setPluginStates:](v2, "setPluginStates:", v3);

    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    -[DMWrapperProcessWatchdogCoordinator setPidsKilled:](v2, "setPidsKilled:", v4);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.datamigrator.watchdogCoordinator.propertyAccess", 0LL);
    -[DMWrapperProcessWatchdogCoordinator setPropertyAccessQueue:](v2, "setPropertyAccessQueue:", v5);
  }

  return v2;
}

- (id)_pluginStateThatBlocksNewRunEvents_onPropertyAccessQueue
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DMWrapperProcessWatchdogCoordinator propertyAccessQueue](self, "propertyAccessQueue"));
  dispatch_assert_queue_V2(v3);

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMWrapperProcessWatchdogCoordinator pluginStates](self, "pluginStates", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    objc_super v7 = 0LL;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if ([v10 watchdogged])
        {
          if ([v10 pid])
          {
            if (!v7 || (int v11 = [v10 pid], v11 < (int)objc_msgSend(v7, "pid")))
            {
              id v12 = v10;

              objc_super v7 = v12;
            }
          }
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  else
  {
    objc_super v7 = 0LL;
  }

  return v7;
}

- (void)callRunEventBlock:(id)a3 forPlugin:(id)a4
{
  id v17 = a3;
  id v7 = a4;
  _DMLogFunc(v4, 7LL);
  v48[0] = 0LL;
  v48[1] = v48;
  v48[2] = 0x3032000000LL;
  v48[3] = sub_100010E74;
  v48[4] = sub_100010E84;
  id v49 = 0LL;
  uint64_t v42 = 0LL;
  v43 = &v42;
  uint64_t v44 = 0x3032000000LL;
  v45 = sub_100010E74;
  v46 = sub_100010E84;
  id v47 = 0LL;
  uint64_t v36 = 0LL;
  v37 = &v36;
  uint64_t v38 = 0x3032000000LL;
  v39 = sub_100010E74;
  v40 = sub_100010E84;
  id v41 = 0LL;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DMWrapperProcessWatchdogCoordinator propertyAccessQueue](self, "propertyAccessQueue", v7));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010E8C;
  block[3] = &unk_100020D20;
  block[4] = self;
  id v9 = v7;
  id v32 = v9;
  v33 = &v36;
  v34 = v48;
  v35 = &v42;
  dispatch_sync(v8, block);

  v10 = (void *)v37[5];
  if (v10)
  {
    objc_exception_throw(v10);
    __break(1u);
  }

  else
  {
    while (1)
    {
      uint64_t v25 = 0LL;
      v26 = &v25;
      uint64_t v27 = 0x3032000000LL;
      v28 = sub_100010E74;
      v29 = sub_100010E84;
      id v30 = 0LL;
      int v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( -[DMWrapperProcessWatchdogCoordinator propertyAccessQueue]( self,  "propertyAccessQueue",  v16));
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_100011054;
      v22[3] = &unk_100020D48;
      v22[4] = self;
      id v12 = v9;
      id v23 = v12;
      v24 = &v25;
      dispatch_sync(v11, v22);

      if (!v26[5]) {
        break;
      }
      -[DMWrapperProcessWatchdogCoordinator _blockedByPendingWatchdogOfAnotherPluginOnQueue:]( self,  "_blockedByPendingWatchdogOfAnotherPluginOnQueue:");
      id v16 = v12;
      _DMLogFunc(v4, 7LL);

      _Block_object_dispose(&v25, 8);
    }

    _Block_object_dispose(&v25, 8);
    v13 = (dispatch_queue_s *)v43[5];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000110E8;
    v18[3] = &unk_100020D70;
    id v20 = v17;
    v21 = v48;
    v18[4] = self;
    id v19 = v12;
    id v14 = v12;
    id v15 = v17;
    dispatch_sync(v13, v18);

    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v42, 8);

    _Block_object_dispose(v48, 8);
  }

- (void)watchdogPlugin:(id)a3 withPid:(int)a4
{
  id v6 = a3;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = sub_100010E74;
  id v19 = sub_100010E84;
  id v20 = 0LL;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DMWrapperProcessWatchdogCoordinator propertyAccessQueue](self, "propertyAccessQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100011318;
  v10[3] = &unk_100020D98;
  id v8 = v6;
  int v14 = a4;
  id v11 = v8;
  id v12 = self;
  v13 = &v15;
  dispatch_sync(v7, v10);

  id v9 = (void *)v16[5];
  if (v9)
  {
    objc_exception_throw(v9);
    __break(1u);
  }

  else
  {

    _Block_object_dispose(&v15, 8);
  }

- (void)_killIfAppropriate_onPropertyAccessQueue
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DMWrapperProcessWatchdogCoordinator propertyAccessQueue](self, "propertyAccessQueue"));
  dispatch_assert_queue_V2(v3);

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMWrapperProcessWatchdogCoordinator pluginStates](self, "pluginStates"));
  id v5 = [v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = 0LL;
    uint64_t v8 = 0LL;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v4);
        }
        id v11 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        v8 += [v11 watchdogged];
        v7 += [v11 running];
      }

      id v6 = [v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }

    while (v6);

    if (v8 != v7)
    {
      _DMLogFunc(v24, 7LL);
      return;
    }
  }

  else
  {
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMWrapperProcessWatchdogCoordinator pluginStates](self, "pluginStates"));
  id v13 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      for (j = 0LL; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)j);
        if ([v17 watchdogged] && objc_msgSend(v17, "pid"))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[DMWrapperProcessWatchdogCoordinator pidsKilled](self, "pidsKilled"));
          id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v17 pid]));
          unsigned __int8 v20 = [v18 containsObject:v19];

          if ((v20 & 1) == 0)
          {
            id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v17 pid]));
            _DMLogFunc(v24, 6LL);

            v21 = (void *)objc_claimAutoreleasedReturnValue(-[DMWrapperProcessWatchdogCoordinator pidsKilled](self, "pidsKilled", v23));
            v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v17 pid]));
            [v21 addObject:v22];

            +[DMProcessTerminator killPid:](DMProcessTerminator, "killPid:", [v17 pid]);
          }
        }
      }

      id v14 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }

    while (v14);
  }
}

- (unint64_t)_countOfPlugins
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DMWrapperProcessWatchdogCoordinator propertyAccessQueue](self, "propertyAccessQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000118D4;
  v6[3] = &unk_100020DC0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (NSMutableSet)pluginStates
{
  return self->_pluginStates;
}

- (void)setPluginStates:(id)a3
{
}

- (NSMutableSet)pidsKilled
{
  return self->_pidsKilled;
}

- (void)setPidsKilled:(id)a3
{
}

- (OS_dispatch_queue)propertyAccessQueue
{
  return self->_propertyAccessQueue;
}

- (void)setPropertyAccessQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end