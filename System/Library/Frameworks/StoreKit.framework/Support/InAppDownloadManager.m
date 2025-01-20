@interface InAppDownloadManager
+ (id)manager;
- (BOOL)startDownloadWithID:(id)a3 client:(id)a4 auditToken:(id *)a5;
- (InAppDownloadManager)init;
- (id)addDownloadObserver:(id)a3;
- (id)processDownloadsForTransactions:(id)a3;
- (void)_notifyObserversDownloadStatusChanged:(id)a3;
- (void)cancelDownloadWithID:(id)a3;
- (void)pauseDownloadWithID:(id)a3;
- (void)removeDownloadObserver:(id)a3;
- (void)removeDownloadsForTransactionID:(id)a3;
@end

@implementation InAppDownloadManager

+ (id)manager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000BAA0;
  block[3] = &unk_1002E6B20;
  block[4] = a1;
  if (qword_10032DDC8 != -1) {
    dispatch_once(&qword_10032DDC8, block);
  }
  return (id)qword_10032DDC0;
}

- (InAppDownloadManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___InAppDownloadManager;
  v2 = -[InAppDownloadManager init](&v12, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSLock);
    downloadLock = v2->_downloadLock;
    v2->_downloadLock = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    downloadQueue = v2->_downloadQueue;
    v2->_downloadQueue = v5;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_downloadQueue, "setMaxConcurrentOperationCount:", 3LL);
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSMapTable mapTableWithKeyOptions:valueOptions:]( &OBJC_CLASS___NSMapTable,  "mapTableWithKeyOptions:valueOptions:",  0x10000LL,  5LL));
    observers = v2->_observers;
    v2->_observers = (NSMapTable *)v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    pendingDownloads = v2->_pendingDownloads;
    v2->_pendingDownloads = v9;
  }

  return v2;
}

- (id)addDownloadObserver:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);

  uint64_t v7 = self->_observers;
  objc_sync_enter(v7);
  -[NSMapTable setObject:forKey:](self->_observers, "setObject:forKey:", v4, v6);
  objc_sync_exit(v7);

  return v6;
}

- (void)removeDownloadObserver:(id)a3
{
  id v5 = a3;
  id v4 = self->_observers;
  objc_sync_enter(v4);
  -[NSMapTable removeObjectForKey:](self->_observers, "removeObjectForKey:", v5);
  objc_sync_exit(v4);
}

- (BOOL)startDownloadWithID:(id)a3 client:(id)a4 auditToken:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  -[NSLock lock](self->_downloadLock, "lock");
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pendingDownloads,  "objectForKeyedSubscript:",  v7));
  v10 = (InAppDownloadTask *)objc_claimAutoreleasedReturnValue([v9 task]);
  v11 = v10;
  if (!v9)
  {
    if (qword_10032DE18 != -1) {
      dispatch_once(&qword_10032DE18, &stru_1002E6DC8);
    }
    v21 = off_100327AA0;
    if (os_log_type_enabled((os_log_t)off_100327AA0, OS_LOG_TYPE_ERROR)) {
      sub_10025B5F0(v21, (uint64_t)self, (uint64_t)v7);
    }
    goto LABEL_25;
  }

  if (!v10) {
    goto LABEL_15;
  }
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[InAppDownloadTask status](v10, "status"));
  if (![v12 state])
  {

    goto LABEL_21;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[InAppDownloadTask status](v11, "status"));
  id v14 = [v13 state];

  if (v14 == (id)1)
  {
LABEL_21:
    if (qword_10032DE18 != -1) {
      dispatch_once(&qword_10032DE18, &stru_1002E6DC8);
    }
    v29 = off_100327AA0;
    if (os_log_type_enabled((os_log_t)off_100327AA0, OS_LOG_TYPE_INFO))
    {
      v30 = v29;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[InAppDownloadTask logKey](v11, "logKey"));
      *(_DWORD *)buf = 138543618;
      v40 = v31;
      __int16 v41 = 2114;
      id v42 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "[%{public}@] Download already started for ID %{public}@",  buf,  0x16u);
    }

    goto LABEL_25;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[InAppDownloadTask status](v11, "status"));
  id v16 = [v15 state];

  if (v16 == (id)3)
  {
    if (qword_10032DE18 != -1) {
      dispatch_once(&qword_10032DE18, &stru_1002E6DC8);
    }
    v17 = off_100327AA0;
    if (os_log_type_enabled((os_log_t)off_100327AA0, OS_LOG_TYPE_INFO))
    {
      v18 = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[InAppDownloadTask logKey](v11, "logKey"));
      *(_DWORD *)buf = 138543618;
      v40 = v19;
      __int16 v41 = 2114;
      id v42 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "[%{public}@] Download already finished for ID %{public}@",  buf,  0x16u);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[InAppDownloadTask status](v11, "status"));
    -[InAppDownloadManager _notifyObserversDownloadStatusChanged:](self, "_notifyObserversDownloadStatusChanged:", v20);

LABEL_25:
    BOOL v28 = 0;
    goto LABEL_26;
  }

- (void)cancelDownloadWithID:(id)a3
{
  id v4 = a3;
  -[NSLock lock](self->_downloadLock, "lock");
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pendingDownloads,  "objectForKeyedSubscript:",  v4));
  v6 = v5;
  if (!v5)
  {
    if (qword_10032DE18 != -1) {
      dispatch_once(&qword_10032DE18, &stru_1002E6DC8);
    }
    v15 = off_100327AA0;
    if (!os_log_type_enabled((os_log_t)off_100327AA0, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    id v14 = v15;
    *(_DWORD *)v19 = 138543618;
    *(void *)&v19[4] = objc_opt_class(self);
    *(_WORD *)&v19[12] = 2114;
    *(void *)&v19[14] = v4;
    id v16 = *(id *)&v19[4];
    v17 = "%{public}@: No downloads to cancel for ID %{public}@";
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v17, v19, 0x16u);

LABEL_18:
    goto LABEL_19;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 task]);

  if (!v7)
  {
    if (qword_10032DE18 != -1) {
      dispatch_once(&qword_10032DE18, &stru_1002E6DC8);
    }
    v18 = off_100327AA0;
    if (!os_log_type_enabled((os_log_t)off_100327AA0, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    id v14 = v18;
    *(_DWORD *)v19 = 138543618;
    *(void *)&v19[4] = objc_opt_class(self);
    *(_WORD *)&v19[12] = 2114;
    *(void *)&v19[14] = v4;
    id v16 = *(id *)&v19[4];
    v17 = "%{public}@: Download is not started for ID %{public}@";
    goto LABEL_17;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 task]);
  unsigned int v9 = [v8 isExecuting];

  if (v9)
  {
    if (qword_10032DE18 != -1) {
      dispatch_once(&qword_10032DE18, &stru_1002E6DC8);
    }
    v10 = off_100327AA0;
    if (os_log_type_enabled((os_log_t)off_100327AA0, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v6 task]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 logKey]);
      *(_DWORD *)v19 = 138543618;
      *(void *)&v19[4] = v13;
      *(_WORD *)&v19[12] = 2114;
      *(void *)&v19[14] = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Cancelling download for ID %{public}@",  v19,  0x16u);
    }

    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 task]);
    -[os_log_s cancel](v14, "cancel");
    goto LABEL_18;
  }

- (void)pauseDownloadWithID:(id)a3
{
  id v4 = a3;
  -[NSLock lock](self->_downloadLock, "lock");
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pendingDownloads,  "objectForKeyedSubscript:",  v4));
  v6 = v5;
  if (!v5)
  {
    if (qword_10032DE18 != -1) {
      dispatch_once(&qword_10032DE18, &stru_1002E6DC8);
    }
    v15 = off_100327AA0;
    if (!os_log_type_enabled((os_log_t)off_100327AA0, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    id v14 = v15;
    *(_DWORD *)v19 = 138543618;
    *(void *)&v19[4] = objc_opt_class(self);
    *(_WORD *)&v19[12] = 2114;
    *(void *)&v19[14] = v4;
    id v16 = *(id *)&v19[4];
    v17 = "%{public}@: No downloads to pause for ID %{public}@";
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v17, v19, 0x16u);

LABEL_18:
    goto LABEL_19;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 task]);

  if (!v7)
  {
    if (qword_10032DE18 != -1) {
      dispatch_once(&qword_10032DE18, &stru_1002E6DC8);
    }
    v18 = off_100327AA0;
    if (!os_log_type_enabled((os_log_t)off_100327AA0, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    id v14 = v18;
    *(_DWORD *)v19 = 138543618;
    *(void *)&v19[4] = objc_opt_class(self);
    *(_WORD *)&v19[12] = 2114;
    *(void *)&v19[14] = v4;
    id v16 = *(id *)&v19[4];
    v17 = "%{public}@: Download is not started for ID %{public}@";
    goto LABEL_17;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 task]);
  unsigned int v9 = [v8 isExecuting];

  if (v9)
  {
    if (qword_10032DE18 != -1) {
      dispatch_once(&qword_10032DE18, &stru_1002E6DC8);
    }
    v10 = off_100327AA0;
    if (os_log_type_enabled((os_log_t)off_100327AA0, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v6 task]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 logKey]);
      *(_DWORD *)v19 = 138543618;
      *(void *)&v19[4] = v13;
      *(_WORD *)&v19[12] = 2114;
      *(void *)&v19[14] = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Pausing download for ID %{public}@",  v19,  0x16u);
    }

    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 task]);
    -[os_log_s pause](v14, "pause");
    goto LABEL_18;
  }

- (void)removeDownloadsForTransactionID:(id)a3
{
  id v4 = a3;
  v48 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSLock lock](self->_downloadLock, "lock");
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_pendingDownloads, "allValues"));
  id v6 = [v5 countByEnumeratingWithState:&v55 objects:v66 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v56;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v56 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 transactionIdentifier]);
        unsigned int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
          -[NSMutableArray addObject:](v48, "addObject:", v13);
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v55 objects:v66 count:16];
    }

    while (v7);
  }

  -[NSLock unlock](self->_downloadLock, "unlock");
  if (-[NSMutableArray count](v48, "count"))
  {
    if (qword_10032DE18 != -1) {
      dispatch_once(&qword_10032DE18, &stru_1002E6DC8);
    }
    id v14 = off_100327AA0;
    if (os_log_type_enabled((os_log_t)off_100327AA0, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      id v16 = (void *)objc_opt_class(self);
      id v17 = v16;
      id v18 = -[NSMutableArray count](v48, "count");
      *(_DWORD *)buf = 138543875;
      v61 = v16;
      __int16 v62 = 2048;
      id v63 = v18;
      __int16 v64 = 2113;
      id v65 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Removing %lu downloads for transaction %{private}@",  buf,  0x20u);
    }

    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    obj = v48;
    id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v51,  v59,  16LL);
    if (v19)
    {
      id v21 = v19;
      uint64_t v49 = *(void *)v52;
      *(void *)&__int128 v20 = 138543618LL;
      __int128 v46 = v20;
      do
      {
        v22 = 0LL;
        do
        {
          if (*(void *)v52 != v49) {
            objc_enumerationMutation(obj);
          }
          v23 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)v22);
          -[InAppDownloadManager cancelDownloadWithID:](self, "cancelDownloadWithID:", v23, v46);
          -[NSLock lock](self->_downloadLock, "lock");
          v24 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pendingDownloads,  "objectForKeyedSubscript:",  v23));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_pendingDownloads,  "setObject:forKeyedSubscript:",  0LL,  v23);
          -[NSLock unlock](self->_downloadLock, "unlock");
          v25 = (void *)objc_claimAutoreleasedReturnValue([v24 task]);
          v26 = (void *)objc_claimAutoreleasedReturnValue([v25 status]);
          v27 = (void *)objc_claimAutoreleasedReturnValue([v26 installPath]);

          if (v27)
          {
            if (qword_10032DE18 != -1) {
              dispatch_once(&qword_10032DE18, &stru_1002E6DC8);
            }
            BOOL v28 = off_100327AA0;
            if (os_log_type_enabled((os_log_t)off_100327AA0, OS_LOG_TYPE_DEFAULT))
            {
              v29 = v28;
              v30 = (void *)objc_opt_class(self);
              *(_DWORD *)buf = 138543874;
              v61 = v30;
              __int16 v62 = 2114;
              id v63 = v23;
              __int16 v64 = 2114;
              id v65 = v27;
              id v31 = v30;
              _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Removing downloaded content for %{public}@ at %{public}@",  buf,  0x20u);
            }

            v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
            if ([v32 fileExistsAtPath:v27])
            {
              id v50 = 0LL;
              [v32 removeItemAtPath:v27 error:&v50];
              id v33 = v50;
              if (v33)
              {
                if (qword_10032DE18 != -1) {
                  dispatch_once(&qword_10032DE18, &stru_1002E6DC8);
                }
                uint64_t v34 = off_100327AA0;
                if (os_log_type_enabled((os_log_t)off_100327AA0, OS_LOG_TYPE_ERROR))
                {
                  v43 = v34;
                  v44 = (void *)objc_opt_class(self);
                  *(_DWORD *)buf = 138543874;
                  v61 = v44;
                  __int16 v62 = 2114;
                  id v63 = v23;
                  __int16 v64 = 2114;
                  id v65 = v33;
                  id v45 = v44;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "%{public}@: Error removing downloaded content for ID %{public}@ - %{public}@",  buf,  0x20u);
                }
              }
            }

            else
            {
              if (qword_10032DE18 != -1) {
                dispatch_once(&qword_10032DE18, &stru_1002E6DC8);
              }
              v39 = off_100327AA0;
              if (os_log_type_enabled((os_log_t)off_100327AA0, OS_LOG_TYPE_DEFAULT))
              {
                v40 = v39;
                __int16 v41 = (void *)objc_opt_class(self);
                *(_DWORD *)buf = 138543874;
                v61 = v41;
                __int16 v62 = 2114;
                id v63 = v23;
                __int16 v64 = 2114;
                id v65 = v27;
                id v42 = v41;
                _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Downloaded content was already moved or removed for %{public}@ at %{public}@",  buf,  0x20u);
              }
            }
          }

          else
          {
            if (qword_10032DE18 != -1) {
              dispatch_once(&qword_10032DE18, &stru_1002E6DC8);
            }
            v35 = off_100327AA0;
            if (os_log_type_enabled((os_log_t)off_100327AA0, OS_LOG_TYPE_INFO))
            {
              v36 = v35;
              id v37 = (void *)objc_opt_class(self);
              *(_DWORD *)buf = v46;
              v61 = v37;
              __int16 v62 = 2114;
              id v63 = v23;
              id v38 = v37;
              _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_INFO,  "%{public}@: No download path to remove for ID %{public}@",  buf,  0x16u);
            }
          }

          v22 = (char *)v22 + 1;
        }

        while (v21 != v22);
        id v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v51,  v59,  16LL);
      }

      while (v21);
    }
  }

  -[NSLock unlock](self->_downloadLock, "unlock");
}

- (id)processDownloadsForTransactions:(id)a3
{
  id v4 = a3;
  id v5 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v4 count]);
  v40 = self;
  -[NSLock lock](self->_downloadLock, "lock");
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v42;
    v10 = &unk_100327000;
    *(void *)&__int128 v7 = 138543619LL;
    __int128 v35 = v7;
    v36 = v5;
    uint64_t v37 = *(void *)v42;
    do
    {
      v11 = 0LL;
      id v38 = v8;
      do
      {
        if (*(void *)v42 != v9) {
          objc_enumerationMutation(obj);
        }
        unsigned int v12 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)v11);
        id v13 = objc_msgSend(v12, "mutableCopy", v35);
        id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tcr_numberForKey:", v10[492]));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tcr_stringForKey:", @"tid"));
        id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tcr_arrayForKey:", @"assets"));
        id v17 = v16;
        if (v14 && [v16 count])
        {
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 firstObject]);
          id v19 = [v18 mutableCopy];

          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tcr_stringForKey:", off_100328138[0]));
          [v19 setObject:v20 forKeyedSubscript:off_100328138[0]];

          id v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          v22 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"file-size"]);
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v21,  "setObject:forKeyedSubscript:",  v22,  @"hosted-content-length");

          v23 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"version"]);
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v21,  "setObject:forKeyedSubscript:",  v23,  @"hosted-version");

          uint64_t v49 = v21;
          v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v49,  1LL));
          [v13 setObject:v24 forKeyedSubscript:@"assets"];

          v25 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v40->_pendingDownloads,  "objectForKeyedSubscript:",  v14));
          if (v25)
          {
            if (qword_10032DE18 != -1) {
              dispatch_once(&qword_10032DE18, &stru_1002E6DC8);
            }
            v26 = off_100327AA0;
            if (os_log_type_enabled((os_log_t)off_100327AA0, OS_LOG_TYPE_INFO))
            {
              v27 = v26;
              BOOL v28 = (void *)objc_opt_class(v40);
              *(_DWORD *)buf = v35;
              __int128 v46 = v28;
              __int16 v47 = 2113;
              v48 = v14;
              id v29 = v28;
              _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "%{public}@: Download %{private}@ already added to pending downloads",  buf,  0x16u);

              goto LABEL_18;
            }
          }

          else
          {
            if (qword_10032DE18 != -1) {
              dispatch_once(&qword_10032DE18, &stru_1002E6DC8);
            }
            v30 = off_100327AA0;
            if (os_log_type_enabled((os_log_t)off_100327AA0, OS_LOG_TYPE_DEFAULT))
            {
              id v31 = v30;
              v32 = (void *)objc_opt_class(v40);
              *(_DWORD *)buf = v35;
              __int128 v46 = v32;
              __int16 v47 = 2113;
              v48 = v14;
              id v33 = v32;
              _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Adding download %{private}@ to pending downloads",  buf,  0x16u);
            }

            v27 = -[InAppDownload initWithIdentifier:transactionIdentifier:info:]( objc_alloc(&OBJC_CLASS___InAppDownload),  "initWithIdentifier:transactionIdentifier:info:",  v14,  v15,  v19);
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v40->_pendingDownloads,  "setObject:forKeyedSubscript:",  v27,  v14);
LABEL_18:

            id v5 = v36;
          }

          uint64_t v9 = v37;
          id v8 = v38;
          v10 = (void *)&unk_100327000;
        }

        -[NSMutableArray addObject:](v5, "addObject:", v13);

        v11 = (char *)v11 + 1;
      }

      while (v8 != v11);
      id v8 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
    }

    while (v8);
  }

  -[NSLock unlock](v40->_downloadLock, "unlock");
  return v5;
}

- (void)_notifyObserversDownloadStatusChanged:(id)a3
{
  id v4 = a3;
  id v5 = self->_observers;
  objc_sync_enter(v5);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_observers, "objectEnumerator", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) downloadManager:self updatedStatus:v4];
        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }

  objc_sync_exit(v5);
}

- (void).cxx_destruct
{
}

@end