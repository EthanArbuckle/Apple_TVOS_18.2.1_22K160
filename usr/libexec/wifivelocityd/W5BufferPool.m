@interface W5BufferPool
+ (id)sharedW5BufferPool;
- (NSDate)dateOfInvalidPoolBuffer;
- (NSMutableArray)bufferPool;
- (NSObject)lockBufferPool;
- (OS_dispatch_queue)queue;
- (OS_dispatch_semaphore)semaphore;
- (id)getBufferFromPool;
- (id)getPairOfBuffersFromPool;
- (id)initBuffersWithSize:(unint64_t)a3 bufferCount:(unint64_t)a4;
- (unint64_t)bufferSize;
- (unint64_t)getCountOfAllocatedBuffers;
- (unint64_t)getCountOfInUseBuffers;
- (void)freeIdleBufferOfTimer:(id)a3;
- (void)returnBufferToPool:(id)a3;
- (void)setBufferPool:(id)a3;
- (void)setBufferSize:(unint64_t)a3;
- (void)setDateOfInvalidPoolBuffer:(id)a3;
- (void)setLockBufferPool:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSemaphore:(id)a3;
@end

@implementation W5BufferPool

+ (id)sharedW5BufferPool
{
  if (qword_1000F7520 != -1) {
    dispatch_once(&qword_1000F7520, &stru_1000D1C80);
  }
  return (id)qword_1000F7518;
}

- (id)initBuffersWithSize:(unint64_t)a3 bufferCount:(unint64_t)a4
{
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___W5BufferPool;
  v6 = -[W5BufferPool init](&v28, "init");
  v7 = v6;
  if (v6)
  {
    v6->_bufferSize = a3;
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    bufferPool = v7->_bufferPool;
    v7->_bufferPool = (NSMutableArray *)v8;

    dispatch_semaphore_t v10 = dispatch_semaphore_create(a4);
    semaphore = v7->_semaphore;
    v7->_semaphore = (OS_dispatch_semaphore *)v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSObject);
    lockBufferPool = v7->_lockBufferPool;
    v7->_lockBufferPool = v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
    dateOfInvalidPoolBuffer = v7->_dateOfInvalidPoolBuffer;
    v7->_dateOfInvalidPoolBuffer = (NSDate *)v14;

    dispatch_queue_attr_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v16);
    dispatch_queue_t v18 = dispatch_queue_create("BufferPool", v17);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v18;

    for (; a4; --a4)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      [v20 setObject:v7->_dateOfInvalidPoolBuffer forKeyedSubscript:@"allocDate"];
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      [v20 setObject:v21 forKeyedSubscript:@"allocdBuffer"];

      [v20 setObject:v7->_dateOfInvalidPoolBuffer forKeyedSubscript:@"lastDateBorrowed"];
      [v20 setObject:v7->_dateOfInvalidPoolBuffer forKeyedSubscript:@"lastDateReturned"];
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
      [v20 setObject:v22 forKeyedSubscript:@"inUse"];

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      [v20 setObject:v23 forKeyedSubscript:@"timer"];

      -[NSMutableArray addObject:](v7->_bufferPool, "addObject:", v20);
    }
  }

  else
  {
    uint64_t v25 = sub_10008C90C();
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 136315650;
      v30 = "-[W5BufferPool initBuffersWithSize:bufferCount:]";
      __int16 v31 = 2080;
      v32 = "W5BufferPool.m";
      __int16 v33 = 1024;
      int v34 = 76;
      LODWORD(v27) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  0LL,  "[wifivelocity] %s (%s:%u) init error!",  (const char *)&v29,  v27,  LODWORD(v28.receiver));
    }
  }

  return v7;
}

- (void)freeIdleBufferOfTimer:(id)a3
{
  id v4 = a3;
  __int16 v31 = self;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[W5BufferPool lockBufferPool](self, "lockBufferPool"));
  objc_sync_enter(obj);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  v30 = self->_bufferPool;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v30,  "countByEnumeratingWithState:objects:count:",  &v33,  v45,  16LL);
  if (v5)
  {
    uint64_t v32 = *(void *)v34;
    uint64_t v6 = 0x7FFFFFFFLL;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v34 != v32) {
          objc_enumerationMutation(v30);
        }
        uint64_t v8 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        id v9 = (id)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"timer"]);
        BOOL v10 = v9 == v4;

        if (v10)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"inUse"]);
          unsigned int v12 = [v11 BOOLValue];

          uint64_t v6 = (uint64_t)-[NSMutableArray indexOfObject:](v31->_bufferPool, "indexOfObject:", v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"lastDateReturned"]);
          [v13 timeIntervalSinceNow];
          double v15 = v14;

          uint64_t v16 = sub_10008C90C();
          v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            dispatch_queue_t v18 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"allocDate"]);
            v19 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"lastDateBorrowed"]);
            v20 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"lastDateReturned"]);
            *(_DWORD *)buf = 67110146;
            *(_DWORD *)v38 = v12;
            *(_WORD *)&v38[4] = 2048;
            *(void *)&v38[6] = v6;
            __int16 v39 = 2112;
            v40 = v18;
            __int16 v41 = 2112;
            v42 = v19;
            __int16 v43 = 2112;
            v44 = v20;
            LODWORD(v28) = 48;
            _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  "[wifivelocity] W5BufferPool Idle Timer: inUse %d index %lu allocDate %@ lastDateBorrowed %@ lastDateReturned %@",  buf,  v28);
          }

          if (v15 >= -10.0) {
            char v21 = 1;
          }
          else {
            char v21 = v12;
          }
          if ((v21 & 1) == 0)
          {
            uint64_t v22 = sub_10008C90C();
            v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              *(void *)v38 = v6;
              _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v23,  0LL,  "[wifivelocity] W5BufferPool Idle Timer: Freeing index %lu",  buf);
            }

            [v8 setObject:v31->_dateOfInvalidPoolBuffer forKeyedSubscript:@"allocDate"];
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
            [v8 setObject:v24 forKeyedSubscript:@"allocdBuffer"];

            [v8 setObject:v31->_dateOfInvalidPoolBuffer forKeyedSubscript:@"lastDateBorrowed"];
            [v8 setObject:v31->_dateOfInvalidPoolBuffer forKeyedSubscript:@"lastDateReturned"];
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
            [v8 setObject:v25 forKeyedSubscript:@"inUse"];
          }
        }
      }

      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v30,  "countByEnumeratingWithState:objects:count:",  &v33,  v45,  16LL);
    }

    while (v5);
  }

  else
  {
    uint64_t v6 = 0x7FFFFFFFLL;
  }

  uint64_t v26 = sub_10008E334();
  v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_signpost_enabled(v27))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)v38 = v6;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v27,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "W5BufferPool Buffer",  "Allocated idx %lu",  buf,  0xCu);
  }

  objc_sync_exit(obj);
}

- (id)getBufferFromPool
{
  id obj = (id)objc_claimAutoreleasedReturnValue(-[W5BufferPool lockBufferPool](self, "lockBufferPool"));
  objc_sync_enter(obj);
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  v40 = self->_bufferPool;
  id v2 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v40,  "countByEnumeratingWithState:objects:count:",  &v48,  v57,  16LL);
  if (v2)
  {
    uint64_t v3 = *(void *)v49;
    uint64_t v4 = 0x7FFFFFFFLL;
    do
    {
      for (i = 0LL; i != v2; i = (char *)i + 1)
      {
        if (*(void *)v49 != v3) {
          objc_enumerationMutation(v40);
        }
        uint64_t v6 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)i);
        v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"inUse"]);
        if ([v7 BOOLValue])
        {
        }

        else
        {
          uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"allocdBuffer"]);
          id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
          unsigned __int8 v10 = [v8 isEqual:v9];

          if ((v10 & 1) == 0)
          {
            uint64_t v4 = (uint64_t)-[NSMutableArray indexOfObject:](self->_bufferPool, "indexOfObject:", v6);
            v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
            [v6 setObject:v11 forKeyedSubscript:@"inUse"];

            unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
            [v6 setObject:v12 forKeyedSubscript:@"lastDateBorrowed"];

            queue = (dispatch_queue_s *)self->_queue;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_10002559C;
            block[3] = &unk_1000D11C8;
            block[4] = v6;
            dispatch_sync(queue, block);
            double v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"allocdBuffer"]);
            if (v14) {
              goto LABEL_30;
            }
          }
        }
      }

      id v2 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v40,  "countByEnumeratingWithState:objects:count:",  &v48,  v57,  16LL);
    }

    while (v2);
  }

  else
  {
    uint64_t v4 = 0x7FFFFFFFLL;
  }

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  v40 = self->_bufferPool;
  id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v40,  "countByEnumeratingWithState:objects:count:",  &v43,  v56,  16LL);
  if (v15)
  {
    uint64_t v16 = *(void *)v44;
    do
    {
      for (j = 0LL; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v44 != v16) {
          objc_enumerationMutation(v40);
        }
        dispatch_queue_t v18 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)j);
        v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"inUse"]);
        if ([v19 BOOLValue])
        {
        }

        else
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"allocdBuffer"]);
          char v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
          unsigned int v22 = [v20 isEqual:v21];

          if (v22)
          {
            uint64_t v4 = (uint64_t)-[NSMutableArray indexOfObject:](self->_bufferPool, "indexOfObject:", v18);
            v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithLength:]( &OBJC_CLASS___NSMutableData,  "dataWithLength:",  self->_bufferSize));
            uint64_t v24 = sub_10008E334();
            uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
            if (os_signpost_enabled(v25))
            {
              *(_DWORD *)buf = 134217984;
              unint64_t v53 = v4;
              _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v25,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "W5BufferPool Buffer",  "Allocated idx %lu",  buf,  0xCu);
            }

            uint64_t v26 = sub_10008C90C();
            v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              unint64_t bufferSize = self->_bufferSize;
              *(_DWORD *)buf = 134218240;
              unint64_t v53 = bufferSize;
              __int16 v54 = 2048;
              uint64_t v55 = v4;
              LODWORD(v38) = 22;
              _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v27,  0LL,  "[wifivelocity] W5BufferPool Alloc: Allocating a NSMutableData of size %lu bytes in index %lu",  buf,  v38);
            }

            int v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
            [v18 setObject:v29 forKeyedSubscript:@"allocDate"];

            [v18 setObject:v23 forKeyedSubscript:@"allocdBuffer"];
            v30 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"allocDate"]);
            [v18 setObject:v30 forKeyedSubscript:@"lastDateBorrowed"];

            __int16 v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
            [v18 setObject:v31 forKeyedSubscript:@"inUse"];

            uint64_t v32 = (dispatch_queue_s *)self->_queue;
            v42[0] = _NSConcreteStackBlock;
            v42[1] = 3221225472LL;
            v42[2] = sub_10002568C;
            v42[3] = &unk_1000D11C8;
            v42[4] = v18;
            dispatch_sync(v32, v42);
            double v14 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"allocdBuffer"]);

            if (v14) {
              goto LABEL_30;
            }
          }
        }
      }

      id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v40,  "countByEnumeratingWithState:objects:count:",  &v43,  v56,  16LL);
    }

    while (v15);
  }

  double v14 = 0LL;
LABEL_30:

  uint64_t v33 = sub_10008E334();
  __int128 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  if (os_signpost_enabled(v34))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v53 = v4;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v34,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "W5BufferPool Buffer",  "Borrowed idx %lu",  buf,  0xCu);
  }

  uint64_t v35 = sub_10008C90C();
  __int128 v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v53 = v4;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v36,  0LL,  "[wifivelocity] W5BufferPool Borrowed index %lu",  buf);
  }

  objc_sync_exit(obj);
  return v14;
}

- (id)getPairOfBuffersFromPool
{
  uint64_t v3 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[W5BufferPool semaphore](self, "semaphore"));
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[W5BufferPool getBufferFromPool](self, "getBufferFromPool"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5BufferPool getBufferFromPool](self, "getBufferFromPool"));
  v8[0] = v4;
  v8[1] = v5;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 2LL));

  return v6;
}

- (void)returnBufferToPool:(id)a3
{
  id v4 = a3;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[W5BufferPool lockBufferPool](self, "lockBufferPool"));
  objc_sync_enter(obj);
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  uint64_t v25 = self->_bufferPool;
  uint64_t v5 = 0LL;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v27,  v35,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v28;
    uint64_t v8 = 0x7FFFFFFFLL;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v25);
        }
        unsigned __int8 v10 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        id v11 = (id)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"allocdBuffer"]);
        BOOL v12 = v11 == v4;

        if (v12)
        {
          uint64_t v8 = (uint64_t)-[NSMutableArray indexOfObject:](self->_bufferPool, "indexOfObject:", v10);
          queue = (dispatch_queue_s *)self->_queue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_100025BC8;
          block[3] = &unk_1000D0FF8;
          block[4] = v10;
          void block[5] = self;
          dispatch_sync(queue, block);
          double v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"inUse"]);
          [v14 BOOLValue];

          id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
          [v10 setObject:v15 forKeyedSubscript:@"inUse"];

          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          [v10 setObject:v16 forKeyedSubscript:@"lastDateReturned"];

          [v4 setLength:self->_bufferSize];
        }

        v17 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"inUse"]);
        unsigned int v18 = [v17 BOOLValue];

        v5 += v18 ^ 1;
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v27,  v35,  16LL);
    }

    while (v6);
  }

  else
  {
    uint64_t v8 = 0x7FFFFFFFLL;
  }

  uint64_t v19 = sub_10008E334();
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_signpost_enabled(v20))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v32 = v8;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v20,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "W5BufferPool Buffer",  "Borrowed idx %lu",  buf,  0xCu);
  }

  uint64_t v21 = sub_10008C90C();
  unsigned int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v32 = v8;
    __int16 v33 = 2048;
    uint64_t v34 = v5;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  0LL,  "[wifivelocity] W5BufferPool Returned index %lu, totalAvail %lu ",  buf,  22);
  }

  if (v5 == 2)
  {
    v23 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[W5BufferPool semaphore](self, "semaphore"));
    dispatch_semaphore_signal(v23);
  }

  objc_sync_exit(obj);
}

- (unint64_t)getCountOfAllocatedBuffers
{
  id obj = (id)objc_claimAutoreleasedReturnValue(-[W5BufferPool lockBufferPool](self, "lockBufferPool"));
  objc_sync_enter(obj);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  double v14 = self->_bufferPool;
  unint64_t v3 = 0LL;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v4)
  {
    uint64_t v5 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v14);
        }
        uint64_t v7 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", @"allocdBuffer", obj));

        id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"allocdBuffer"]);
        unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
        unsigned int v11 = [v9 isEqual:v10];

        v3 += (v8 != 0LL) & ~v11;
      }

      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v4);
  }

  objc_sync_exit(obj);
  return v3;
}

- (unint64_t)getCountOfInUseBuffers
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[W5BufferPool lockBufferPool](self, "lockBufferPool"));
  objc_sync_enter(v3);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = self->_bufferPool;
  unint64_t v5 = 0LL;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v12 + 1) + 8 * (void)v8),  "objectForKeyedSubscript:",  @"inUse",  (void)v12));
        unsigned int v10 = [v9 BOOLValue];

        v5 += v10;
        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v6);
  }

  objc_sync_exit(v3);
  return v5;
}

- (NSMutableArray)bufferPool
{
  return self->_bufferPool;
}

- (void)setBufferPool:(id)a3
{
}

- (NSObject)lockBufferPool
{
  return self->_lockBufferPool;
}

- (void)setLockBufferPool:(id)a3
{
}

- (unint64_t)bufferSize
{
  return self->_bufferSize;
}

- (void)setBufferSize:(unint64_t)a3
{
  self->_unint64_t bufferSize = a3;
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (void)setSemaphore:(id)a3
{
}

- (NSDate)dateOfInvalidPoolBuffer
{
  return self->_dateOfInvalidPoolBuffer;
}

- (void)setDateOfInvalidPoolBuffer:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end