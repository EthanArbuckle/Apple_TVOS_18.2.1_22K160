@interface ADSyncFlagManager
+ (id)sharedManager;
- (ADSyncFlagManager)init;
- (void)_clearSyncNeededFlagsForKeys:(id)a3;
- (void)_fetchSyncFlagsOnDisk;
- (void)_setSyncNeededFlagsForKeys:(id)a3;
- (void)clearAllFlags;
- (void)clearFlagsForKeys:(id)a3;
- (void)fetchKeysThatNeedToSync:(id)a3;
- (void)setSyncNeededFlagForKeys:(id)a3;
@end

@implementation ADSyncFlagManager

- (ADSyncFlagManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ADSyncFlagManager;
  v2 = -[ADSyncFlagManager init](&v8, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("ADSyncFlagManagerQueue", v4);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    -[ADSyncFlagManager _fetchSyncFlagsOnDisk](v2, "_fetchSyncFlagsOnDisk");
  }

  return v2;
}

- (void)fetchKeysThatNeedToSync:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1002D4250;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)setSyncNeededFlagForKeys:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    queue = (dispatch_queue_s *)self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1002D421C;
    v6[3] = &unk_1004FD968;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(queue, v6);
  }
}

- (void)clearFlagsForKeys:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    queue = (dispatch_queue_s *)self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1002D41E8;
    v6[3] = &unk_1004FD968;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(queue, v6);
  }
}

- (void)clearAllFlags
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002D418C;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_fetchSyncFlagsOnDisk
{
  uint64_t v3 = AFUserSupportDirectoryPath(self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 contentsOfDirectoryAtPath:v4 error:0]);

  if (v6)
  {
    id v7 = -[NSMutableSet initWithCapacity:]( [NSMutableSet alloc],  "initWithCapacity:",  [v6 count]);
    cachedFlags = self->_cachedFlags;
    self->_cachedFlags = v7;

    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          if ((objc_msgSend(v14, "isEqualToString:", @"sync_flag", (void)v16) & 1) == 0
            && [v14 hasPrefix:@"sync_flag"])
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "substringFromIndex:", objc_msgSend(@"sync_flag", "length")));
            -[NSMutableSet addObject:](self->_cachedFlags, "addObject:", v15);
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v11);
    }
  }
}

- (void)_setSyncNeededFlagsForKeys:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AFUserSupportDirectoryPath(v4);
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v21;
    *(void *)&__int128 v9 = 136315650LL;
    __int128 v18 = v9;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
        if ((-[NSMutableSet containsObject:](self->_cachedFlags, "containsObject:", v13, v18) & 1) == 0)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue([@"sync_flag" stringByAppendingString:v13]);
          v15 = (void *)objc_claimAutoreleasedReturnValue([v19 stringByAppendingPathComponent:v14]);
          unsigned __int8 v16 = [v6 createFileAtPath:v15 contents:0 attributes:0];

          if ((v16 & 1) == 0)
          {
            __int128 v17 = (os_log_s *)AFSiriLogContextUtility;
            if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v18;
              v25 = "-[ADSyncFlagManager _setSyncNeededFlagsForKeys:]";
              __int16 v26 = 2112;
              uint64_t v27 = v13;
              __int16 v28 = 2112;
              v29 = v19;
              _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s Failed to create the sync flag for %@ at %@",  buf,  0x20u);
            }
          }

          -[NSMutableSet addObject:](self->_cachedFlags, "addObject:", v13);
        }
      }

      id v10 = [v7 countByEnumeratingWithState:&v20 objects:v30 count:16];
    }

    while (v10);
  }
}

- (void)_clearSyncNeededFlagsForKeys:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AFUserSupportDirectoryPath(v4);
  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        if (-[NSMutableSet containsObject:](self->_cachedFlags, "containsObject:", v12))
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([@"sync_flag" stringByAppendingString:v12]);
          v14 = (void *)objc_claimAutoreleasedReturnValue([v16 stringByAppendingPathComponent:v13]);
          id v17 = 0LL;
          [v6 removeItemAtPath:v14 error:&v17];
          id v15 = v17;

          -[NSMutableSet removeObject:](self->_cachedFlags, "removeObject:", v12);
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v9);
  }
}

- (void).cxx_destruct
{
}

+ (id)sharedManager
{
  if (qword_1005783E0 != -1) {
    dispatch_once(&qword_1005783E0, &stru_1004FA830);
  }
  return (id)qword_1005783D8;
}

@end