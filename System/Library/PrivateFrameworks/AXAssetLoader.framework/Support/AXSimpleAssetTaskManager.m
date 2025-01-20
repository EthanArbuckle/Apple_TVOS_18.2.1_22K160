@interface AXSimpleAssetTaskManager
+ (id)sharedInstance;
- (AXSimpleAssetTaskManager)init;
- (NSMutableDictionary)taskQueues;
- (NSMutableSet)inflightTasks;
- (NSMutableSet)registeredTasks;
- (OS_dispatch_queue)notificationQueue;
- (OS_dispatch_queue)taskCompletionWaitingQueue;
- (OS_dispatch_queue)taskDispatcherQueue;
- (id)_anonymousTaskForId:(id)a3 withArguments:(id)a4;
- (id)_getBootTime;
- (id)_taskQueueForTask:(Class)a3;
- (id)_tasksForNotification:(id)a3;
- (id)_tasksForTriggerType:(unint64_t)a3;
- (void)_dispatchTask:(id)a3 completion:(id)a4;
- (void)_handleNotification:(id)a3;
- (void)_handleXPCActivity:(id)a3 taskClass:(Class)a4;
- (void)handleFirstBoot:(BOOL)a3;
- (void)handleFirstUnlock;
- (void)invokeTaskById:(id)a3 arguments:(id)a4;
- (void)registerTask:(Class)a3;
- (void)setInflightTasks:(id)a3;
- (void)setNotificationQueue:(id)a3;
- (void)setRegisteredTasks:(id)a3;
- (void)setTaskCompletionWaitingQueue:(id)a3;
- (void)setTaskDispatcherQueue:(id)a3;
- (void)setTaskQueues:(id)a3;
- (void)start;
@end

@implementation AXSimpleAssetTaskManager

+ (id)sharedInstance
{
  if (qword_100027A40 != -1) {
    dispatch_once(&qword_100027A40, &stru_100020940);
  }
  return (id)qword_100027A38;
}

- (AXSimpleAssetTaskManager)init
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___AXSimpleAssetTaskManager;
  v2 = -[AXSimpleAssetTaskManager init](&v22, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    taskQueues = v2->_taskQueues;
    v2->_taskQueues = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    registeredTasks = v2->_registeredTasks;
    v2->_registeredTasks = (NSMutableSet *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    inflightTasks = v2->_inflightTasks;
    v2->_inflightTasks = (NSMutableSet *)v7;

    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_t v11 = dispatch_queue_create("simpleTaskDispatcher", v10);
    taskDispatcherQueue = v2->_taskDispatcherQueue;
    v2->_taskDispatcherQueue = (OS_dispatch_queue *)v11;

    dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);
    dispatch_queue_t v15 = dispatch_queue_create("simpleTaskDispatcher_note", v14);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v15;

    dispatch_queue_attr_t v17 = dispatch_queue_attr_make_with_autorelease_frequency( &_dispatch_queue_attr_concurrent,  DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v17);
    dispatch_queue_t v19 = dispatch_queue_create("simpleTaskDispatcher_completion", v18);
    taskCompletionWaitingQueue = v2->_taskCompletionWaitingQueue;
    v2->_taskCompletionWaitingQueue = (OS_dispatch_queue *)v19;
  }

  return v2;
}

- (void)start
{
  notificationQueue = self->_notificationQueue;
  v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472LL;
  v6 = sub_10000B0B0;
  uint64_t v7 = &unk_100020968;
  objc_copyWeak(&v8, &location);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)notificationQueue, &v4);
  -[AXSimpleAssetTaskManager handleFirstBoot:](self, "handleFirstBoot:", 0LL, v4, v5, v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)registerTask:(Class)a3
{
  v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXSimpleAssetTaskManager registeredTasks](v4, "registeredTasks"));
  [v5 addObject:a3];

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  Class v14 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class triggers](a3, "triggers"));
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        if (![v10 type])
        {
          objc_initWeak(&location, v4);
          xpc_object_t v11 = XPC_ACTIVITY_CHECK_IN;
          id v12 = objc_claimAutoreleasedReturnValue([v10 launchActivityId]);
          dispatch_queue_attr_t v13 = (const char *)[v12 UTF8String];
          handler[0] = _NSConcreteStackBlock;
          handler[1] = 3221225472LL;
          handler[2] = sub_10000B414;
          handler[3] = &unk_100020990;
          objc_copyWeak(v16, &location);
          handler[4] = v4;
          handler[5] = v10;
          v16[1] = v14;
          xpc_activity_register(v13, v11, handler);

          objc_destroyWeak(v16);
          objc_destroyWeak(&location);
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v7);
  }

  objc_sync_exit(v4);
}

- (void)handleFirstBoot:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXAssetMetadataStore store](&OBJC_CLASS___AXAssetMetadataStore, "store"));
  uint64_t v6 = kAXTTSResourceAssetType;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"SystemBootTime" forAssetType:kAXTTSResourceAssetType]);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXSimpleAssetTaskManager _getBootTime](self, "_getBootTime"));
  id v9 = [v8 isEqualToDate:v7];
  if ((_DWORD)v9) {
    BOOL v10 = !v3;
  }
  else {
    BOOL v10 = 0;
  }
  if (!v10)
  {
    v24 = v8;
    uint64_t v11 = AXLogAssetDaemon(v9);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Performing first boot tasks", buf, 2u);
    }

    dispatch_queue_attr_t v13 = dispatch_group_create();
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    Class v14 = (void *)objc_claimAutoreleasedReturnValue(-[AXSimpleAssetTaskManager _tasksForTriggerType:](self, "_tasksForTriggerType:", 2LL));
    id v15 = [v14 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)i);
          dispatch_group_enter(v13);
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472LL;
          v25[2] = sub_10000B884;
          v25[3] = &unk_1000209B8;
          v26 = v13;
          -[AXSimpleAssetTaskManager _dispatchTask:completion:](self, "_dispatchTask:completion:", v19, v25);
        }

        id v16 = [v14 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }

      while (v16);
    }

    uint64_t v20 = dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v21 = AXLogAssetDaemon(v20);
    objc_super v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Finished first boot tasks", buf, 2u);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[AXAssetMetadataStore store](&OBJC_CLASS___AXAssetMetadataStore, "store"));
    uint64_t v8 = v24;
    [v23 setValue:v24 forKey:@"SystemBootTime" forAssetType:v6];
  }
}

- (void)handleFirstUnlock
{
  uint64_t v3 = AXLogAssetDaemon(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Performing first unlock tasks", buf, 2u);
  }

  uint64_t v5 = dispatch_group_create();
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXSimpleAssetTaskManager _tasksForTriggerType:](self, "_tasksForTriggerType:", 3LL));
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      BOOL v10 = 0LL;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v10);
        dispatch_group_enter(v5);
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472LL;
        v15[2] = sub_10000BA88;
        v15[3] = &unk_1000209B8;
        id v16 = v5;
        -[AXSimpleAssetTaskManager _dispatchTask:completion:](self, "_dispatchTask:completion:", v11, v15);

        BOOL v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }

    while (v8);
  }

  uint64_t v12 = dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v13 = AXLogAssetDaemon(v12);
  Class v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Finished first unlock tasks", buf, 2u);
  }
}

- (void)invokeTaskById:(id)a3 arguments:(id)a4
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[AXSimpleAssetTaskManager _anonymousTaskForId:withArguments:]( self,  "_anonymousTaskForId:withArguments:",  a3,  a4));
  if (v5)
  {
    uint64_t v6 = v5;
    -[AXSimpleAssetTaskManager _dispatchTask:completion:](self, "_dispatchTask:completion:", v5, &stru_1000209D8);
    uint64_t v5 = v6;
  }
}

- (void)_handleNotification:(id)a3
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXSimpleAssetTaskManager _tasksForNotification:](self, "_tasksForNotification:", a3, 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[AXSimpleAssetTaskManager _dispatchTask:completion:]( self,  "_dispatchTask:completion:",  *(void *)(*((void *)&v9 + 1) + 8LL * (void)v8),  &stru_1000209F8);
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }
}

- (id)_tasksForNotification:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  v23 = v5;
  id v25 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXSimpleAssetTaskManager registeredTasks](v5, "registeredTasks"));
  id v7 = [v6 countByEnumeratingWithState:&v34 objects:v41 count:16];
  if (v7)
  {
    uint64_t v26 = *(void *)v35;
    id obj = v6;
    do
    {
      id v27 = v7;
      for (i = 0LL; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v35 != v26) {
          objc_enumerationMutation(obj);
        }
        __int128 v9 = *(objc_class **)(*((void *)&v34 + 1) + 8LL * (void)i);
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class triggers](v9, "triggers"));
        id v11 = [v10 countByEnumeratingWithState:&v30 objects:v40 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v31;
          while (2)
          {
            for (j = 0LL; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v31 != v12) {
                objc_enumerationMutation(v10);
              }
              Class v14 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)j);
              if ([v14 type] == (id)1)
              {
                id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 notificationName]);
                unsigned int v16 = [v4 isEqualToString:v15];

                if (v16)
                {
                  id v17 = [v14 copy];
                  id v18 = objc_claimAutoreleasedReturnValue([v14 notificationName]);
                  notify_register_check( (const char *)objc_msgSend( v18,  "cStringUsingEncoding:",  +[NSString defaultCStringEncoding](NSString, "defaultCStringEncoding")),  &out_token);

                  notify_get_state(out_token, &state64);
                  notify_cancel(out_token);
                  v38 = @"notifyArg";
                  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  state64));
                  v39 = v19;
                  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));
                  [v17 setArguments:v20];

                  id v21 = [[v9 alloc] initWithTrigger:v17];
                  [v25 addObject:v21];

                  goto LABEL_17;
                }
              }
            }

            id v11 = [v10 countByEnumeratingWithState:&v30 objects:v40 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

- (id)_anonymousTaskForId:(id)a3 withArguments:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXSimpleAssetTaskManager registeredTasks](v8, "registeredTasks", 0LL));
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(objc_class **)(*((void *)&v18 + 1) + 8LL * (void)i);
        Class v14 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class taskIdentifier](v13, "taskIdentifier"));
        unsigned int v15 = [v14 isEqualToString:v6];

        if (v15)
        {
          unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( +[AXSimpleAssetTaskTrigger withAnonymousInvokation:]( &OBJC_CLASS___AXSimpleAssetTaskTrigger,  "withAnonymousInvokation:",  v7));
          id v10 = [[v13 alloc] initWithTrigger:v16];

          goto LABEL_11;
        }
      }

      id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

- (id)_tasksForTriggerType:(unint64_t)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  __int128 v19 = v4;
  id v21 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXSimpleAssetTaskManager registeredTasks](v4, "registeredTasks"));
  id v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v27;
    id obj = v5;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(obj);
        }
        __int128 v9 = *(objc_class **)(*((void *)&v26 + 1) + 8LL * (void)i);
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class triggers](v9, "triggers"));
        id v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v23;
          while (2)
          {
            for (j = 0LL; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v23 != v12) {
                objc_enumerationMutation(v10);
              }
              Class v14 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)j);
              if ([v14 type] == (id)a3)
              {
                id v15 = objc_alloc(v9);
                id v16 = [v14 copy];
                id v17 = [v15 initWithTrigger:v16];

                [v21 addObject:v17];
                goto LABEL_16;
              }
            }

            id v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

- (void)_dispatchTask:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXAssetsDaemon sharedInstance](&OBJC_CLASS___AXAssetsDaemon, "sharedInstance"));
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 activityTransactionManager]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
  [v9 simpleTaskStarted:v10];

  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[AXSimpleAssetTaskManager taskDispatcherQueue](self, "taskDispatcherQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000C434;
  block[3] = &unk_100020A48;
  id v15 = v6;
  id v16 = self;
  id v17 = v7;
  id v12 = v7;
  id v13 = v6;
  dispatch_sync(v11, block);
}

- (void)_handleXPCActivity:(id)a3 taskClass:(Class)a4
{
  id v6 = a3;
  id v7 = [[a4 alloc] initWithTrigger:v6];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000CC44;
  v9[3] = &unk_1000209B8;
  id v10 = v7;
  id v8 = v7;
  -[AXSimpleAssetTaskManager _dispatchTask:completion:](self, "_dispatchTask:completion:", v8, v9);
}

- (id)_taskQueueForTask:(Class)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class taskIdentifier](a3, "taskIdentifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class taskGroupIdentifier](a3, "taskGroupIdentifier"));

  if (v6)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[objc_class taskGroupIdentifier](a3, "taskGroupIdentifier"));

    id v5 = (void *)v7;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXSimpleAssetTaskManager taskQueues](self, "taskQueues"));
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v5]);

  if (!v9)
  {
    dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);
    id v12 = v5;
    dispatch_queue_t v13 = dispatch_queue_create((const char *)[v12 cStringUsingEncoding:4], v11);
    Class v14 = (void *)objc_claimAutoreleasedReturnValue(-[AXSimpleAssetTaskManager taskQueues](self, "taskQueues"));
    [v14 setObject:v13 forKeyedSubscript:v12];
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[AXSimpleAssetTaskManager taskQueues](self, "taskQueues"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v5]);

  return v16;
}

- (id)_getBootTime
{
  *(void *)uint64_t v7 = 0x1500000001LL;
  size_t v6 = 16LL;
  if (sysctl(v7, 2u, &v4, &v6, 0LL, 0LL) == -1) {
    v2 = 0LL;
  }
  else {
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)v5 / 1000000.0 + (double)v4));
  }
  return v2;
}

- (NSMutableDictionary)taskQueues
{
  return self->_taskQueues;
}

- (void)setTaskQueues:(id)a3
{
}

- (NSMutableSet)registeredTasks
{
  return self->_registeredTasks;
}

- (void)setRegisteredTasks:(id)a3
{
}

- (NSMutableSet)inflightTasks
{
  return self->_inflightTasks;
}

- (void)setInflightTasks:(id)a3
{
}

- (OS_dispatch_queue)taskDispatcherQueue
{
  return self->_taskDispatcherQueue;
}

- (void)setTaskDispatcherQueue:(id)a3
{
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
}

- (OS_dispatch_queue)taskCompletionWaitingQueue
{
  return self->_taskCompletionWaitingQueue;
}

- (void)setTaskCompletionWaitingQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end