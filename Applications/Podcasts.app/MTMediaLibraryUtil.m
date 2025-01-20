@interface MTMediaLibraryUtil
+ (BOOL)isDeletingPersistentId:(unint64_t)a3;
+ (id)pendingDeletionPersistentIds;
+ (void)deleteMediaItems:(id)a3 completion:(id)a4;
+ (void)didDeletePersistentId:(unint64_t)a3;
+ (void)updateMediaLibraryItem:(unint64_t)a3 playhead:(double)a4 playState:(int64_t)a5 playCount:(int64_t)a6;
+ (void)willDeletePersistentId:(unint64_t)a3;
@end

@implementation MTMediaLibraryUtil

+ (void)updateMediaLibraryItem:(unint64_t)a3 playhead:(double)a4 playState:(int64_t)a5 playCount:(int64_t)a6
{
  if (a3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[MTMediaLibraryTransactionManager sharedInstance]( &OBJC_CLASS___MTMediaLibraryTransactionManager,  "sharedInstance"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10003AE00;
    v11[3] = &unk_100241608;
    v11[4] = a3;
    *(double *)&v11[5] = a4;
    v11[6] = a5;
    v11[7] = a6;
    [v10 requestMediaLibraryReadTransaction:v11];
  }

+ (id)pendingDeletionPersistentIds
{
  if (qword_1002B6938 != -1) {
    dispatch_once(&qword_1002B6938, &stru_100241628);
  }
  return (id)qword_1002B6930;
}

+ (BOOL)isDeletingPersistentId:(unint64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 pendingDeletionPersistentIds]);
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue([a1 pendingDeletionPersistentIds]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  unsigned int v8 = [v6 containsObject:v7];

  if (v8)
  {
    uint64_t v10 = _MTLogCategoryDownload(v9);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      unint64_t v14 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "isDeletingPersistentId %llu",  (uint8_t *)&v13,  0xCu);
    }
  }

  objc_sync_exit(v5);

  return v8;
}

+ (void)willDeletePersistentId:(unint64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 pendingDeletionPersistentIds]);
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue([a1 pendingDeletionPersistentIds]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  [v6 addObject:v7];

  uint64_t v9 = _MTLogCategoryDownload(v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = 134217984;
    unint64_t v12 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "willDeletePersistentId %llu",  (uint8_t *)&v11,  0xCu);
  }

  objc_sync_exit(v5);
}

+ (void)didDeletePersistentId:(unint64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 pendingDeletionPersistentIds]);
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue([a1 pendingDeletionPersistentIds]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  [v6 removeObject:v7];

  uint64_t v9 = _MTLogCategoryDownload(v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = 134217984;
    unint64_t v12 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "didDeletePersistentId %llu",  (uint8_t *)&v11,  0xCu);
  }

  objc_sync_exit(v5);
}

+ (void)deleteMediaItems:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = _MTLogCategoryMediaLibrary();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v26 = [v5 count];
    __int16 v27 = 2114;
    id v28 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Deleting %lu pids %{public}@ from MediaLibrary",  buf,  0x16u);
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      int v13 = 0LL;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        +[MTMediaLibraryUtil willDeletePersistentId:]( MTMediaLibraryUtil,  "willDeletePersistentId:",  [*(id *)(*((void *)&v20 + 1) + 8 * (void)v13) unsignedLongLongValue]);
        int v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v11);
  }

  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[MTMediaLibraryTransactionManager sharedInstance]( &OBJC_CLASS___MTMediaLibraryTransactionManager,  "sharedInstance"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10003B728;
  v17[3] = &unk_100241678;
  id v18 = v9;
  id v19 = v6;
  id v15 = v6;
  id v16 = v9;
  [v14 requestMediaLibraryReadTransaction:v17];
}

@end