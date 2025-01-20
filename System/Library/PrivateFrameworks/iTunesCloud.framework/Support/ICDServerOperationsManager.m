@interface ICDServerOperationsManager
- (BOOL)cancelOperationsByClass:(Class)a3;
- (BOOL)hasOperationsOfClass:(Class)a3;
- (BOOL)isNetworkActivityIndicatorVisible;
- (ICDServerOperationsManager)init;
- (NSOperationQueue)backgroundOperationQueue;
- (NSOperationQueue)operationQueue;
- (OS_dispatch_queue)serialQueue;
- (id)listCloudServerOperations;
- (void)_setupInternalQueues;
- (void)_setupKVO;
- (void)_tearDownKVO;
- (void)addBackgroundOperation:(id)a3 priority:(int)a4;
- (void)addOperation:(id)a3 priority:(int)a4;
- (void)dealloc;
- (void)enumerateBackgroundOperationsUsingBlock:(id)a3;
- (void)enumerateOperationsUsingBlock:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setNetworkActivityIndicatorVisible:(BOOL)a3;
@end

@implementation ICDServerOperationsManager

- (ICDServerOperationsManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ICDServerOperationsManager;
  v2 = -[ICDServerOperationsManager init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[ICDServerOperationsManager _setupInternalQueues](v2, "_setupInternalQueues");
    -[ICDServerOperationsManager _setupKVO](v3, "_setupKVO");
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ICDServerOperationsManager;
  -[ICDServerOperationsManager dealloc](&v3, "dealloc");
}

- (void)addOperation:(id)a3 priority:(int)a4
{
  BOOL v6 = a4 == 2;
  id v7 = a3;
  v8 = v7;
  if (a4) {
    uint64_t v9 = 4LL * v6;
  }
  else {
    uint64_t v9 = -4LL;
  }
  [v7 setQueuePriority:v9];
  [v8 setQualityOfService:17];
  v10 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
    int v12 = 138544130;
    v13 = self;
    __int16 v14 = 2048;
    v15 = v8;
    __int16 v16 = 2114;
    v17 = v11;
    __int16 v18 = 1024;
    int v19 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Adding operation %p (name=%{public}@) with priority %d",  (uint8_t *)&v12,  0x26u);
  }

  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v8);
}

- (void)addBackgroundOperation:(id)a3 priority:(int)a4
{
  BOOL v6 = a4 == 2;
  id v7 = a3;
  v8 = v7;
  if (a4) {
    uint64_t v9 = 4LL * v6;
  }
  else {
    uint64_t v9 = -4LL;
  }
  [v7 setQueuePriority:v9];
  [v8 setQualityOfService:9];
  v10 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
    int v12 = 138544130;
    v13 = self;
    __int16 v14 = 2048;
    v15 = v8;
    __int16 v16 = 2114;
    v17 = v11;
    __int16 v18 = 1024;
    int v19 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Adding background operation %p (name=%{public}@) with priority %d",  (uint8_t *)&v12,  0x26u);
  }

  -[NSOperationQueue addOperation:](self->_backgroundOperationQueue, "addOperation:", v8);
}

- (void)enumerateOperationsUsingBlock:(id)a3
{
  v4 = (void (**)(id, uint64_t, char *))a3;
  if (v4)
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue operations](self->_operationQueue, "operations"));
    id v6 = [v5 copy];

    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
LABEL_4:
      uint64_t v10 = 0LL;
      while (1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        char v12 = 0;
        v4[2](v4, v11, &v12);
        if (v12) {
          break;
        }
        if (v8 == (id)++v10)
        {
          id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v8) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (void)enumerateBackgroundOperationsUsingBlock:(id)a3
{
  v4 = (void (**)(id, uint64_t, char *))a3;
  if (v4)
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue operations](self->_backgroundOperationQueue, "operations"));
    id v6 = [v5 copy];

    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
LABEL_4:
      uint64_t v10 = 0LL;
      while (1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        char v12 = 0;
        v4[2](v4, v11, &v12);
        if (v12) {
          break;
        }
        if (v8 == (id)++v10)
        {
          id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v8) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (BOOL)hasOperationsOfClass:(Class)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue operations](self->_operationQueue, "operations", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ((objc_opt_isKindOfClass(*(void *)(*((void *)&v11 + 1) + 8LL * (void)i), a3) & 1) != 0)
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)cancelOperationsByClass:(Class)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue operations](self->_operationQueue, "operations", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ((objc_opt_isKindOfClass(v10, a3) & 1) != 0)
        {
          [v10 cancel];
          char v7 = 1;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }

  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

- (id)listCloudServerOperations
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue operations](self->_operationQueue, "operations"));
  id v4 = [v3 copy];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue operations](self->_backgroundOperationQueue, "operations"));
  id v6 = [v5 copy];

  char v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v8 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v54 = [v4 count];
    *(_WORD *)&v54[4] = 1024;
    *(_DWORD *)&v54[6] = [v6 count];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "operations count=%d, backgroundOperations count=%d",  buf,  0xEu);
  }

  v42 = v7;
  id v41 = v6;
  if ([v4 count])
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    id v10 = v4;
    id v11 = [v10 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v48;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v48 != v13) {
            objc_enumerationMutation(v10);
          }
          __int128 v15 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)i);
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 name]);
          __int16 v18 = v16;
          if (v16)
          {
            id v19 = v16;
          }

          else
          {
            v20 = (objc_class *)objc_opt_class(v15, v17);
            v21 = NSStringFromClass(v20);
            id v19 = (id)objc_claimAutoreleasedReturnValue(v21);
          }

          v22 = v19;

          v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"name=%@, object=%p",  v22,  v15));
          [v9 addObject:v23];
        }

        id v12 = [v10 countByEnumeratingWithState:&v47 objects:v52 count:16];
      }

      while (v12);
    }

    char v7 = v42;
    [v42 setObject:v9 forKey:@"ICDServerOperationsManagerOperationNamesKey"];

    id v6 = v41;
  }

  if ([v6 count])
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    id v25 = v6;
    id v26 = [v25 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v44;
      do
      {
        for (j = 0LL; j != v27; j = (char *)j + 1)
        {
          if (*(void *)v44 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)j);
          v31 = (void *)objc_claimAutoreleasedReturnValue([v30 name]);
          v33 = v31;
          if (v31)
          {
            id v34 = v31;
          }

          else
          {
            v35 = (objc_class *)objc_opt_class(v30, v32);
            v36 = NSStringFromClass(v35);
            id v34 = (id)objc_claimAutoreleasedReturnValue(v36);
          }

          v37 = v34;

          v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"name=%@, object=%p",  v37,  v30));
          [v24 addObject:v38];
        }

        id v27 = [v25 countByEnumeratingWithState:&v43 objects:v51 count:16];
      }

      while (v27);
    }

    char v7 = v42;
    [v42 setObject:v24 forKey:@"ICDServerOperationsManagerBackgroundOperationNamesKey"];

    id v6 = v41;
  }

  v39 = os_log_create("com.apple.amp.itunescloudd", "Default_Oversize");
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)v54 = v7;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "cloudServerOperations=%{public}@", buf, 0xCu);
  }

  return v7;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001DAA30 != a6)
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___ICDServerOperationsManager;
    -[ICDServerOperationsManager observeValueForKeyPath:ofObject:change:context:]( &v6,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)setNetworkActivityIndicatorVisible:(BOOL)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ICDServerOperationsManager serialQueue](self, "serialQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000689D8;
  v6[3] = &unk_1001A5D58;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
}

- (BOOL)isNetworkActivityIndicatorVisible
{
  v2 = self;
  uint64_t v6 = 0LL;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  objc_super v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ICDServerOperationsManager serialQueue](self, "serialQueue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000689C4;
  v5[3] = &unk_1001A65D8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)_setupInternalQueues
{
  objc_super v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunescloudd.ICDServerOperationsManager.serial.queue", 0LL);
  serialQueue = self->_serialQueue;
  self->_serialQueue = v3;

  id v5 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
  operationQueue = self->_operationQueue;
  self->_operationQueue = v5;

  -[NSOperationQueue setName:]( self->_operationQueue,  "setName:",  @"com.apple.itunescloudd.ICDServerOperationsManager.operationQueue");
  -[NSOperationQueue setMaxConcurrentOperationCount:](self->_operationQueue, "setMaxConcurrentOperationCount:", 1LL);
  BOOL v7 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
  backgroundOperationQueue = self->_backgroundOperationQueue;
  self->_backgroundOperationQueue = v7;

  -[NSOperationQueue setName:]( self->_backgroundOperationQueue,  "setName:",  @"com.apple.itunescloudd.ICDServerOperationsManager.backgroundOperationQueue");
  -[NSOperationQueue setMaxConcurrentOperationCount:]( self->_backgroundOperationQueue,  "setMaxConcurrentOperationCount:",  1LL);
}

- (void)_setupKVO
{
}

- (void)_tearDownKVO
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (NSOperationQueue)backgroundOperationQueue
{
  return self->_backgroundOperationQueue;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void).cxx_destruct
{
}

@end