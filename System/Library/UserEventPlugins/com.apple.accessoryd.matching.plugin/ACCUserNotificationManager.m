@interface ACCUserNotificationManager
+ (id)sharedManager;
- (ACCUserNotificationManager)init;
- (NSMutableDictionary)completionHandlers;
- (NSMutableSet)userNotifications;
- (NSRecursiveLock)lock;
- (OS_dispatch_queue)queue;
- (id)userNotificationWithUUID:(id)a3;
- (void)dismissNotification:(id)a3;
- (void)dismissNotificationWithIdentifier:(id)a3;
- (void)dismissNotificationsWithGroupIdentifier:(id)a3;
- (void)dismisssAllNotifications;
- (void)presentNotification:(id)a3 completionHandler:(id)a4;
- (void)removeUserNotification:(id)a3;
- (void)setCompletionHandlers:(id)a3;
- (void)setLock:(id)a3;
- (void)setQueue:(id)a3;
- (void)setUserNotifications:(id)a3;
@end

@implementation ACCUserNotificationManager

- (ACCUserNotificationManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___ACCUserNotificationManager;
  v2 = -[ACCUserNotificationManager init](&v16, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (objc_class *)objc_opt_class(v2);
    v5 = NSStringFromClass(v4);
    id v6 = objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create((const char *)[v6 UTF8String], 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    userNotifications = v3->_userNotifications;
    v3->_userNotifications = (NSMutableSet *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    completionHandlers = v3->_completionHandlers;
    v3->_completionHandlers = (NSMutableDictionary *)v11;

    v13 = objc_alloc_init(&OBJC_CLASS___NSRecursiveLock);
    lock = v3->_lock;
    v3->_lock = v13;
  }

  return v3;
}

- (void)presentNotification:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);

    if (v8)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
      -[ACCUserNotificationManager dismissNotificationWithIdentifier:](self, "dismissNotificationWithIdentifier:", v9);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ACCUserNotificationManager lock](self, "lock"));
    [v10 lock];

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ACCUserNotificationManager userNotifications](self, "userNotifications"));
    [v11 addObject:v6];

    if (v7)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ACCUserNotificationManager completionHandlers](self, "completionHandlers"));
      id v13 = objc_retainBlock(v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
      [v12 setObject:v13 forKey:v14];
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ACCUserNotificationManager lock](self, "lock"));
    [v15 unlock];

    [v6 createBackingUserNotification];
    objc_super v16 = (void *)objc_claimAutoreleasedReturnValue([v6 userNotificationCFDict]);

    if (v16)
    {
      unsigned int v17 = [v6 type] - 1;
      if (v17 > 2) {
        CFOptionFlags v18 = 3LL;
      }
      else {
        CFOptionFlags v18 = qword_10910[v17];
      }
      SInt32 error = 0;
      uint64_t v35 = 0LL;
      v36 = &v35;
      uint64_t v37 = 0x2020000000LL;
      unint64_t v38 = 0xAAAAAAAAAAAAAAAALL;
      v19 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([v6 userNotificationCFDict]);
      CFUserNotificationRef v20 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, v18, &error, v19);

      unint64_t v38 = (unint64_t)v20;
      if (error || !v36[3])
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[ACCUserNotificationManager lock](self, "lock"));
        [v21 lock];

        [v6 setUserNotificationCF:0];
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[ACCUserNotificationManager lock](self, "lock"));
        [v22 unlock];

        v23 = (const void *)v36[3];
        if (v23)
        {
          CFRelease(v23);
          v36[3] = 0LL;
        }
      }

      else
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[ACCUserNotificationManager lock](self, "lock"));
        [v24 lock];

        [v6 setUserNotificationCF:v36[3]];
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[ACCUserNotificationManager lock](self, "lock"));
        [v25 unlock];

        [v6 timeout];
        if (v26 > 0.0)
        {
          [v6 timeout];
          dispatch_time_t v28 = dispatch_time(0LL, (uint64_t)(v27 * 1000000000.0));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = __68__ACCUserNotificationManager_presentNotification_completionHandler___block_invoke;
          block[3] = &unk_14CD8;
          block[4] = self;
          id v34 = v6;
          dispatch_after(v28, &_dispatch_main_q, block);
        }

        v29 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ACCUserNotificationManager queue](self, "queue"));
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472LL;
        v30[2] = __68__ACCUserNotificationManager_presentNotification_completionHandler___block_invoke_2;
        v30[3] = &unk_14D40;
        v32 = &v35;
        v30[4] = self;
        id v31 = v6;
        dispatch_async(v29, v30);
      }

      _Block_object_dispose(&v35, 8);
    }
  }
}

id __68__ACCUserNotificationManager_presentNotification_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissNotification:*(void *)(a1 + 40)];
}

void __68__ACCUserNotificationManager_presentNotification_completionHandler___block_invoke_2(uint64_t a1)
{
  CFOptionFlags responseFlags = 3LL;
  CFUserNotificationReceiveResponse( *(CFUserNotificationRef *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL),  0.0,  &responseFlags);
  CFOptionFlags v2 = responseFlags;
  v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lock]);
  [v3 lock];

  v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) completionHandlers]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uuid]);
  id v6 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v4 objectForKey:v5]);

  [*(id *)(a1 + 40) setUserNotificationCF:0];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lock]);
  [v7 unlock];

  if (v6)
  {
    if (v2 == 1) {
      unsigned int v8 = 1;
    }
    else {
      unsigned int v8 = 2;
    }
    if (v2) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0LL;
    }
    v6[2](v6, v9);
  }

  CFRelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0LL;
  [*(id *)(a1 + 32) removeUserNotification:*(void *)(a1 + 40)];
}

- (void)dismissNotification:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v10 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACCUserNotificationManager lock](self, "lock"));
    [v5 lock];

    id v6 = (__CFUserNotification *)[v10 userNotificationCF];
    if (v6)
    {
      id v7 = v6;
      CFRetain(v6);
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACCUserNotificationManager lock](self, "lock"));
      [v8 unlock];

      CFUserNotificationCancel(v7);
      CFRelease(v7);
    }

    else
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[ACCUserNotificationManager lock](self, "lock"));
      [v9 unlock];
    }

    id v4 = v10;
  }
}

- (void)dismissNotificationWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACCUserNotificationManager lock](self, "lock"));
    [v5 lock];

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACCUserNotificationManager userNotifications](self, "userNotifications"));
    id v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v26;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
          unsigned int v14 = [v13 isEqualToString:v4];

          if (v14) {
            [v6 addObject:v12];
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }

      while (v9);
    }

    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v15 = v6;
    id v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v22;
      do
      {
        for (j = 0LL; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(v15);
          }
          -[ACCUserNotificationManager dismissNotification:]( self,  "dismissNotification:",  *(void *)(*((void *)&v21 + 1) + 8LL * (void)j),  (void)v21);
        }

        id v17 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }

      while (v17);
    }

    CFUserNotificationRef v20 = (void *)objc_claimAutoreleasedReturnValue(-[ACCUserNotificationManager lock](self, "lock"));
    [v20 unlock];
  }
}

- (void)dismissNotificationsWithGroupIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACCUserNotificationManager lock](self, "lock"));
    [v5 lock];

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACCUserNotificationManager userNotifications](self, "userNotifications"));
    id v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v26;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 groupIdentifier]);
          unsigned int v14 = [v13 isEqualToString:v4];

          if (v14) {
            [v6 addObject:v12];
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }

      while (v9);
    }

    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v15 = v6;
    id v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v22;
      do
      {
        for (j = 0LL; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(v15);
          }
          -[ACCUserNotificationManager dismissNotification:]( self,  "dismissNotification:",  *(void *)(*((void *)&v21 + 1) + 8LL * (void)j),  (void)v21);
        }

        id v17 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }

      while (v17);
    }

    CFUserNotificationRef v20 = (void *)objc_claimAutoreleasedReturnValue(-[ACCUserNotificationManager lock](self, "lock"));
    [v20 unlock];
  }
}

- (void)dismisssAllNotifications
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACCUserNotificationManager lock](self, "lock"));
  [v3 lock];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ACCUserNotificationManager userNotifications](self, "userNotifications"));
  id v5 = [v4 copy];

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        -[ACCUserNotificationManager dismissNotification:]( self,  "dismissNotification:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)v10),  (void)v12);
        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ACCUserNotificationManager lock](self, "lock"));
  [v11 unlock];
}

- (id)userNotificationWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACCUserNotificationManager lock](self, "lock"));
  [v5 lock];

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACCUserNotificationManager userNotifications](self, "userNotifications", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uuid]);
        unsigned int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (void)removeUserNotification:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACCUserNotificationManager lock](self, "lock"));
    [v5 lock];

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACCUserNotificationManager userNotifications](self, "userNotifications"));
    [v6 removeObject:v4];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACCUserNotificationManager completionHandlers](self, "completionHandlers"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
    [v7 removeObjectForKey:v8];

    [v4 setUserNotificationCF:0];
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[ACCUserNotificationManager lock](self, "lock"));
    [v9 unlock];
  }

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __43__ACCUserNotificationManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once != -1) {
    dispatch_once(&sharedManager_once, block);
  }
  return (id)sharedManager_sharedInstance;
}

void __43__ACCUserNotificationManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  CFOptionFlags v2 = (void *)sharedManager_sharedInstance;
  sharedManager_sharedInstance = (uint64_t)v1;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableSet)userNotifications
{
  return self->_userNotifications;
}

- (void)setUserNotifications:(id)a3
{
}

- (NSMutableDictionary)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end