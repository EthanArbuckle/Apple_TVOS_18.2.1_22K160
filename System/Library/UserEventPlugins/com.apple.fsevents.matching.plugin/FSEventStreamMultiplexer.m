@interface FSEventStreamMultiplexer
- (BOOL)unregisterClient:(int)a3;
- (FSEventStreamMultiplexer)init;
- (FSEventStreamMultiplexer)initWithLogHandle:(id)a3;
- (NSArray)pathsWatched;
- (NSMutableDictionary)clients;
- (NSMutableDictionary)pathToClientsMap;
- (NSString)streamState;
- (OS_dispatch_queue)queue;
- (OS_os_log)logHandle;
- (__FSEventStream)eventStream;
- (id)_copyResolvedPathToClientsMap;
- (id)summary;
- (int)nextAvailableID;
- (int)registerClient:(id)a3 ofPaths:(id)a4 withCallback:(id)a5;
- (unsigned)eventStreamCreateFlags;
- (void)_handleStream:(__FSEventStream *)a3 numEvents:(unint64_t)a4 eventPaths:(const char *)a5 eventFlags:(const unsigned int *)a6 eventIds:(const unint64_t *)a7;
- (void)_refreshStream;
- (void)dealloc;
- (void)setEventStream:(__FSEventStream *)a3;
- (void)setEventStreamCreateFlags:(unsigned int)a3;
- (void)setNextAvailableID:(int)a3;
- (void)setStreamState:(id)a3;
@end

@implementation FSEventStreamMultiplexer

- (FSEventStreamMultiplexer)initWithLogHandle:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___FSEventStreamMultiplexer;
  v6 = -[FSEventStreamMultiplexer init](&v17, "init");
  v7 = v6;
  if (v6)
  {
    v6->_nextAvailableID = 0;
    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.UserEventAgent.fsevents.FSEventStreamMultiplexer", v9);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    clients = v7->_clients;
    v7->_clients = v12;

    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    pathToClientsMap = v7->_pathToClientsMap;
    v7->_pathToClientsMap = v14;

    v7->_eventStreamCreateFlags = 0;
    v7->_eventStream = 0LL;
    objc_storeStrong((id *)&v7->_logHandle, a3);
    v7->_streamState = (NSString *)@"not created";
  }

  return v7;
}

- (NSArray)pathsWatched
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FSEventStreamMultiplexer pathToClientsMap](self, "pathToClientsMap"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allKeys]);

  return (NSArray *)v3;
}

- (FSEventStreamMultiplexer)init
{
  return -[FSEventStreamMultiplexer initWithLogHandle:](self, "initWithLogHandle:", &_os_log_default);
}

- (int)registerClient:(id)a3 ofPaths:(id)a4 withCallback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  int v24 = -1;
  v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[FSEventStreamMultiplexer queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_4764;
  block[3] = &unk_87F0;
  block[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v20 = &v21;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_sync(v11, block);

  LODWORD(v11) = *((_DWORD *)v22 + 6);
  _Block_object_dispose(&v21, 8);
  return (int)v11;
}

- (BOOL)unregisterClient:(int)a3
{
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = 0;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[FSEventStreamMultiplexer queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_4B30;
  block[3] = &unk_8818;
  int v8 = a3;
  block[4] = self;
  void block[5] = &v9;
  dispatch_sync(v5, block);

  LOBYTE(a3) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return a3;
}

- (id)summary
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FSEventStreamMultiplexer streamState](self, "streamState"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"state");

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[FSEventStreamMultiplexer eventStreamCreateFlags](self, "eventStreamCreateFlags")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"flags");

  v6 = (__CFString *)objc_claimAutoreleasedReturnValue(-[FSEventStreamMultiplexer streamState](self, "streamState"));
  if (v6 != @"not created")
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[FSEventStreamMultiplexer clients](self, "clients", 0LL));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allValues]);

    id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        id v13 = 0LL;
        do
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v20 + 1) + 8 * (void)v13) name]);
          -[NSMutableArray addObject:](v7, "addObject:", v14);

          id v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v11);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingSelector:](v7, "sortedArrayUsingSelector:", "compare:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v15, @"clients");

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FSEventStreamMultiplexer pathsWatched](self, "pathsWatched"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 sortedArrayUsingSelector:"compare:"]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v17, @"paths");
  }

  id v18 = -[NSMutableDictionary copy](v3, "copy");

  return v18;
}

- (id)_copyResolvedPathToClientsMap
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (!v3)
  {
    __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[FSEventStreamMultiplexer logHandle](self, "logHandle"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_5A7C();
    }
    goto LABEL_12;
  }

  CFArrayRef v4 = FSEventStreamCopyPathsBeingWatchedWrapper(-[FSEventStreamMultiplexer eventStream](self, "eventStream"));
  if (!v4)
  {
    __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[FSEventStreamMultiplexer logHandle](self, "logHandle"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_5AA8();
    }
LABEL_12:

    CFArrayRef v5 = 0LL;
LABEL_16:
    __int128 v20 = 0LL;
    goto LABEL_17;
  }

  CFArrayRef v5 = v4;
  id v6 = -[__CFArray count](v4, "count");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FSEventStreamMultiplexer pathsWatched](self, "pathsWatched"));
  id v8 = [v7 count];

  if (v6 != v8)
  {
    __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[FSEventStreamMultiplexer logHandle](self, "logHandle"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_5AD4();
    }

    goto LABEL_16;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[FSEventStreamMultiplexer pathsWatched](self, "pathsWatched"));
  id v10 = [v9 count];

  if (v10)
  {
    unint64_t v11 = 0LL;
    do
    {
      uint64_t v12 = objc_autoreleasePoolPush();
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[FSEventStreamMultiplexer pathsWatched](self, "pathsWatched"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:v11]);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", v11));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[FSEventStreamMultiplexer pathToClientsMap](self, "pathToClientsMap"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v14]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v17, v15);

      objc_autoreleasePoolPop(v12);
      ++v11;
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[FSEventStreamMultiplexer pathsWatched](self, "pathsWatched"));
      id v19 = [v18 count];
    }

    while (v11 < (unint64_t)v19);
  }

  __int128 v20 = -[NSDictionary initWithDictionary:](objc_alloc(&OBJC_CLASS___NSDictionary), "initWithDictionary:", v3);
LABEL_17:

  return v20;
}

- (void)_handleStream:(__FSEventStream *)a3 numEvents:(unint64_t)a4 eventPaths:(const char *)a5 eventFlags:(const unsigned int *)a6 eventIds:(const unint64_t *)a7
{
  id v8 = a5;
  unint64_t v9 = a4;
  unint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[FSEventStreamMultiplexer queue](self, "queue", a3, a4, a5, a6, a7));
  dispatch_assert_queue_V2(v11);

  if ((*(_BYTE *)a6 & 0x10) == 0)
  {
    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v13 = -[FSEventStreamMultiplexer _copyResolvedPathToClientsMap](self, "_copyResolvedPathToClientsMap");
    if (v9)
    {
      uint64_t v14 = 0LL;
      unint64_t v39 = v9;
      v40 = v8;
      do
      {
        v15 = objc_autoreleasePoolPush();
        v16 = v15;
        if (v8 && v8[v14])
        {
          v42 = v15;
          id v17 = -[NSString initWithCString:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCString:encoding:",  v8[v14],  4LL);
          id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[FSEventStreamMultiplexer logHandle](self, "logHandle"));
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v56 = v17;
            _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Received FSEvent about %{public}@", buf, 0xCu);
          }

          __int128 v49 = 0u;
          __int128 v50 = 0u;
          __int128 v47 = 0u;
          __int128 v48 = 0u;
          v41 = v17;
          id v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSString pathComponents](v17, "pathComponents"));
          id v20 = [v19 countByEnumeratingWithState:&v47 objects:v54 count:16];
          if (v20)
          {
            id v21 = v20;
            uint64_t v22 = *(void *)v48;
            __int128 v23 = &stru_89B8;
            do
            {
              int v24 = 0LL;
              v25 = v23;
              do
              {
                if (*(void *)v48 != v22) {
                  objc_enumerationMutation(v19);
                }
                __int128 v23 = (__CFString *)objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingPathComponent:]( v25,  "stringByAppendingPathComponent:",  *(void *)(*((void *)&v47 + 1) + 8LL * (void)v24)));

                v26 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v23]);
                if (v26)
                {
                  v27 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v23]);
                  -[NSMutableSet unionSet:](v12, "unionSet:", v27);
                }

                int v24 = (char *)v24 + 1;
                v25 = v23;
              }

              while (v21 != v24);
              id v21 = [v19 countByEnumeratingWithState:&v47 objects:v54 count:16];
            }

            while (v21);
          }

          else
          {
            __int128 v23 = &stru_89B8;
          }

          unint64_t v9 = v39;
          id v8 = v40;
          v28 = (os_log_s *)v41;
          v16 = v42;
        }

        else
        {
          v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[FSEventStreamMultiplexer logHandle](self, "logHandle"));
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            sub_5B00(&v51, v52, v28);
          }
        }

        objc_autoreleasePoolPop(v16);
        ++v14;
      }

      while (v14 != v9);
    }

    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    v29 = v12;
    id v30 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v43,  v53,  16LL);
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v44;
      do
      {
        for (i = 0LL; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v44 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)i);
          v35 = (void *)objc_claimAutoreleasedReturnValue([v34 callback]);

          if (v35)
          {
            v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[FSEventStreamMultiplexer logHandle](self, "logHandle"));
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              v37 = (NSString *)objc_claimAutoreleasedReturnValue([v34 name]);
              *(_DWORD *)buf = 138543362;
              v56 = v37;
              _os_log_impl(&dword_0, v36, OS_LOG_TYPE_INFO, "Notifying client '%{public}@'", buf, 0xCu);
            }

            v38 = (void (**)(void))objc_claimAutoreleasedReturnValue([v34 callback]);
            v38[2]();
          }
        }

        id v31 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v43,  v53,  16LL);
      }

      while (v31);
    }
  }

- (void)_refreshStream
{
  FSEventStreamEventId CurrentEventIdWrapper = FSEventsGetCurrentEventIdWrapper();
  CFArrayRef v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[FSEventStreamMultiplexer queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  v13.version = 0LL;
  memset(&v13.retain, 0, 24);
  v13.info = self;
  eventStream = self->_eventStream;
  if (eventStream)
  {
    FSEventStreamEventId CurrentEventIdWrapper = FSEventStreamGetLatestEventIdWrapper(eventStream);
    FSEventStreamStopWrapper(self->_eventStream);
    FSEventStreamInvalidateWrapper(self->_eventStream);
    FSEventStreamReleaseWrapper(self->_eventStream);
    self->_eventStream = 0LL;
    -[FSEventStreamMultiplexer setStreamState:]( self,  "setStreamState:",  @"stopped",  *(_OWORD *)&v13.version,  *(_OWORD *)&v13.retain,  v13.copyDescription);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[FSEventStreamMultiplexer clients]( self,  "clients",  *(_OWORD *)&v13.version,  *(_OWORD *)&v13.retain,  v13.copyDescription));
  id v7 = [v6 count];

  if (v7)
  {
    id v8 = (const __CFArray *)objc_claimAutoreleasedReturnValue(-[FSEventStreamMultiplexer pathsWatched](self, "pathsWatched"));
    self->_eventStream = FSEventStreamCreateWrapper( kCFAllocatorDefault,  (FSEventStreamCallback)sub_5828,  &v13,  v8,  CurrentEventIdWrapper,  0.1,  -[FSEventStreamMultiplexer eventStreamCreateFlags](self, "eventStreamCreateFlags"));

    if (self->_eventStream)
    {
      -[FSEventStreamMultiplexer setStreamState:](self, "setStreamState:", @"created");
      unint64_t v9 = self->_eventStream;
      id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[FSEventStreamMultiplexer queue](self, "queue"));
      FSEventStreamSetDispatchQueueWrapper(v9, v10);

      if (FSEventStreamStartWrapper(self->_eventStream))
      {
        -[FSEventStreamMultiplexer setStreamState:](self, "setStreamState:", @"started");
      }

      else
      {
        -[FSEventStreamMultiplexer setStreamState:](self, "setStreamState:", @"FAILED TO START");
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[FSEventStreamMultiplexer logHandle](self, "logHandle"));
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
          sub_5BAC(self);
        }

        FSEventStreamReleaseWrapper(self->_eventStream);
        self->_eventStream = 0LL;
      }
    }

    else
    {
      -[FSEventStreamMultiplexer setStreamState:](self, "setStreamState:", @"FAILED TO CREATE");
      unint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[FSEventStreamMultiplexer logHandle](self, "logHandle"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        sub_5B3C(self);
      }
    }
  }

- (void)dealloc
{
  eventStream = self->_eventStream;
  if (eventStream)
  {
    FSEventStreamStopWrapper(eventStream);
    FSEventStreamInvalidateWrapper(self->_eventStream);
    FSEventStreamReleaseWrapper(self->_eventStream);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___FSEventStreamMultiplexer;
  -[FSEventStreamMultiplexer dealloc](&v4, "dealloc");
}

- (unsigned)eventStreamCreateFlags
{
  return self->_eventStreamCreateFlags;
}

- (void)setEventStreamCreateFlags:(unsigned int)a3
{
  self->_eventStreamCreateFlags = a3;
}

- (int)nextAvailableID
{
  return self->_nextAvailableID;
}

- (void)setNextAvailableID:(int)a3
{
  self->_nextAvailableID = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16LL, 1);
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSMutableDictionary)clients
{
  return self->_clients;
}

- (NSMutableDictionary)pathToClientsMap
{
  return self->_pathToClientsMap;
}

- (__FSEventStream)eventStream
{
  return self->_eventStream;
}

- (void)setEventStream:(__FSEventStream *)a3
{
  self->_eventStream = a3;
}

- (NSString)streamState
{
  return self->_streamState;
}

- (void)setStreamState:(id)a3
{
  self->_streamState = (NSString *)a3;
}

- (void).cxx_destruct
{
}

@end