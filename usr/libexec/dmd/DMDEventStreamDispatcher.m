@interface DMDEventStreamDispatcher
- (DMDEventStreamDispatcher)initWithListeners:(id)a3;
- (NSMutableDictionary)distributedNotificationNameToListenersMap;
- (NSMutableDictionary)notifyMatchingNotificationToListenersMap;
- (NSPointerArray)alarmListeners;
- (void)_dispatchToListenerForKey:(id)a3 inMap:(id)a4 withBlock:(id)a5;
- (void)_registerEventStreamHandlers;
- (void)_registerListener:(id)a3 forKeys:(id)a4 inMap:(id)a5;
@end

@implementation DMDEventStreamDispatcher

- (DMDEventStreamDispatcher)initWithListeners:(id)a3
{
  id v20 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___DMDEventStreamDispatcher;
  v4 = -[DMDEventStreamDispatcher init](&v25, "init");
  if (v4)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSPointerArray weakObjectsPointerArray](&OBJC_CLASS___NSPointerArray, "weakObjectsPointerArray"));
    alarmListeners = v4->_alarmListeners;
    v4->_alarmListeners = (NSPointerArray *)v5;

    v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    distributedNotificationNameToListenersMap = v4->_distributedNotificationNameToListenersMap;
    v4->_distributedNotificationNameToListenersMap = v7;

    v9 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    notifyMatchingNotificationToListenersMap = v4->_notifyMatchingNotificationToListenersMap;
    v4->_notifyMatchingNotificationToListenersMap = v9;

    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v11 = v20;
    id v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v11);
          }
          v15 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
          if ((objc_opt_respondsToSelector(v15, "alarms") & 1) != 0 && [v15 alarms])
          {
            v16 = v4->_alarmListeners;
            objc_sync_enter(v16);
            -[NSPointerArray addPointer:](v4->_alarmListeners, "addPointer:", v15);
            objc_sync_exit(v16);
          }

          if ((objc_opt_respondsToSelector(v15, "distributedNotificationNames") & 1) != 0)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue([v15 distributedNotificationNames]);
            -[DMDEventStreamDispatcher _registerListener:forKeys:inMap:]( v4,  "_registerListener:forKeys:inMap:",  v15,  v17,  v4->_distributedNotificationNameToListenersMap);
          }

          if ((objc_opt_respondsToSelector(v15, "notifyMatchingNotifications") & 1) != 0)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue([v15 notifyMatchingNotifications]);
            -[DMDEventStreamDispatcher _registerListener:forKeys:inMap:]( v4,  "_registerListener:forKeys:inMap:",  v15,  v18,  v4->_notifyMatchingNotificationToListenersMap);
          }
        }

        id v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }

      while (v12);
    }

    -[DMDEventStreamDispatcher _registerEventStreamHandlers](v4, "_registerEventStreamHandlers");
  }

  return v4;
}

- (void)_registerEventStreamHandlers
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100038874;
  block[3] = &unk_10009E070;
  block[4] = self;
  if (qword_1000CCCD0 != -1) {
    dispatch_once(&qword_1000CCCD0, block);
  }
}

- (void)_registerListener:(id)a3 forKeys:(id)a4 inMap:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v13);
        id v15 = v9;
        objc_sync_enter(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v14, (void)v17));
        if (!v16)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSPointerArray weakObjectsPointerArray]( &OBJC_CLASS___NSPointerArray,  "weakObjectsPointerArray"));
          [v15 setObject:v16 forKeyedSubscript:v14];
        }

        [v16 addPointer:v7];

        objc_sync_exit(v15);
        uint64_t v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v11);
  }
}

- (void)_dispatchToListenerForKey:(id)a3 inMap:(id)a4 withBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  if (v7)
  {
    id v10 = v8;
    objc_sync_enter(v10);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v7]);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allObjects", 0));
    id v13 = [v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v17;
      do
      {
        id v15 = 0LL;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v12);
          }
          if (v9) {
            v9[2](v9, *(void *)(*((void *)&v16 + 1) + 8LL * (void)v15));
          }
          id v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v13);
    }

    objc_sync_exit(v10);
  }
}

- (NSPointerArray)alarmListeners
{
  return self->_alarmListeners;
}

- (NSMutableDictionary)distributedNotificationNameToListenersMap
{
  return self->_distributedNotificationNameToListenersMap;
}

- (NSMutableDictionary)notifyMatchingNotificationToListenersMap
{
  return self->_notifyMatchingNotificationToListenersMap;
}

- (void).cxx_destruct
{
}

@end