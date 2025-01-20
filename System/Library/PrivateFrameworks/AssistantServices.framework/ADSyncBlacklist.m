@interface ADSyncBlacklist
+ (id)sharedInstance;
- (ADSyncBlacklist)init;
- (id)_storePath;
- (id)_timeouts:(id)a3 expiringAfter:(id)a4;
- (id)_timeoutsExpiringAfter:(id)a3;
- (id)timeoutsExpiringAfter:(id)a3;
- (void)_saveTimeouts:(id)a3;
- (void)checkIfAnyUserVocabularyIsBlacklistedForApp:(id)a3 completion:(id)a4;
- (void)checkPermissionToSyncSlot:(id)a3 forApp:(id)a4 completion:(id)a5;
- (void)filterBlacklistedAnchorsFrom:(id)a3 includingNewRestrictionsFromResponse:(id)a4;
- (void)filterBlacklistedKeys:(id)a3 appSources:(id)a4;
- (void)filterBlacklistedKeys:(id)a3 vocabSources:(id)a4;
- (void)saveTimeouts:(id)a3;
@end

@implementation ADSyncBlacklist

- (ADSyncBlacklist)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___ADSyncBlacklist;
  v2 = -[ADSyncBlacklist init](&v16, "init");
  v3 = v2;
  if (v2)
  {
    id v4 = [(id)objc_opt_class(v2) description];
    id v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = (const char *)[v5 UTF8String];
    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create(v6, v8);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v9;

    cachedTimeoutTable = v3->_cachedTimeoutTable;
    v3->_cachedTimeoutTable = (NSDictionary *)&__NSDictionary0__struct;

    v12 = (dispatch_queue_s *)v3->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A3964;
    block[3] = &unk_1004FD940;
    v15 = v3;
    dispatch_async(v12, block);
  }

  return v3;
}

- (id)_storePath
{
  uint64_t v2 = AFUserSupportDirectoryPath(self, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"SyncTimeouts.plist"]);

  return v4;
}

- (void)checkIfAnyUserVocabularyIsBlacklistedForApp:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A37A4;
    block[3] = &unk_1004FD9E0;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(queue, block);
  }
}

- (void)checkPermissionToSyncSlot:(id)a3 forApp:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000A3638;
  v15[3] = &unk_1004FDA30;
  id v16 = v9;
  id v17 = v8;
  v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(queue, v15);
}

- (void)filterBlacklistedAnchorsFrom:(id)a3 includingNewRestrictionsFromResponse:(id)a4
{
  id v28 = a3;
  id v5 = a4;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v31 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v29 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  0LL);
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  v27 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 anchors]);
  id v7 = [v6 countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v33;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 suspendDurationInSeconds]);
        [v12 doubleValue];
        if (v13 != 0.0)
        {
          double v14 = v13;
          if (objc_msgSend(v11, "_af_isValid"))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_af_normalizedKey"));
            if (v14 >= 0.0)
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue([v30 dateByAddingTimeInterval:v14]);
              v22 = (os_log_s *)AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315650;
                v37 = "-[ADSyncBlacklist filterBlacklistedAnchorsFrom:includingNewRestrictionsFromResponse:]";
                __int16 v38 = 2112;
                v39 = v21;
                __int16 v40 = 2112;
                v41 = v11;
                _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "%s Anchor was throttled until %@ %@",  buf,  0x20u);
              }

              -[NSMutableDictionary setObject:forKey:](v29, "setObject:forKey:", v21, v15);
            }

            else
            {
              id v16 = (os_log_s *)AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v37 = "-[ADSyncBlacklist filterBlacklistedAnchorsFrom:includingNewRestrictionsFromResponse:]";
                __int16 v38 = 2112;
                v39 = v11;
                _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s Invalid sync anchor was rejected by server %@",  buf,  0x16u);
              }
            }

            -[NSMutableSet addObject:](v31, "addObject:", v15);
          }

          else
          {
            id v17 = (void *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
            {
              v18 = v17;
              id v19 = (void *)objc_claimAutoreleasedReturnValue([v11 key]);
              v20 = (void *)objc_claimAutoreleasedReturnValue([v11 aceId]);
              *(_DWORD *)buf = 136315650;
              v37 = "-[ADSyncBlacklist filterBlacklistedAnchorsFrom:includingNewRestrictionsFromResponse:]";
              __int16 v38 = 2114;
              v39 = v19;
              __int16 v40 = 2112;
              v41 = v20;
              _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s Unable to stop synching anchors of type %{public}@, because the example anchor is malformed aceID=%@",  buf,  0x20u);
            }
          }
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v32 objects:v42 count:16];
    }

    while (v8);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ADSyncBlacklist timeoutsExpiringAfter:](self, "timeoutsExpiringAfter:", v30));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 allKeys]);
  -[NSMutableSet addObjectsFromArray:](v31, "addObjectsFromArray:", v24);

  -[NSMutableDictionary addEntriesFromDictionary:](v29, "addEntriesFromDictionary:", v23);
  -[ADSyncBlacklist saveTimeouts:](self, "saveTimeouts:", v29);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v31, "allObjects"));
  [v28 removeObjectsForKeys:v25];
}

- (void)filterBlacklistedKeys:(id)a3 vocabSources:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADSyncBlacklist timeoutsExpiringAfter:](self, "timeoutsExpiringAfter:", v7));

  if ([v8 count])
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allKeys]);
    [v12 removeObjectsInArray:v9];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000A33C8;
    v13[3] = &unk_1004EFCE0;
    id v14 = v9;
    v15 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v6 count]);
    id v10 = v15;
    id v11 = v9;
    [v6 enumerateKeysAndObjectsUsingBlock:v13];
    [v6 setDictionary:v10];
  }
}

- (void)filterBlacklistedKeys:(id)a3 appSources:(id)a4
{
  id v28 = self;
  id v29 = a3;
  id v5 = a4;
  id v6 = [v5 copy];
  [v5 removeAllObjects];
  id v7 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v5 count]);
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "appIdentifyingInfo", v28));
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleId]);

        if (v15)
        {
          uint64_t v16 = objc_claimAutoreleasedReturnValue([v13 syncSlots]);
          id v17 = (void *)v16;
          if (v16) {
            v18 = (void *)v16;
          }
          else {
            v18 = &__NSArray0__struct;
          }
          -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v18, v15);
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }

    while (v10);
  }

  -[ADSyncBlacklist filterBlacklistedKeys:vocabSources:](v28, "filterBlacklistedKeys:vocabSources:", v29, v7);
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v19 = v8;
  id v20 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v31;
    do
    {
      for (j = 0LL; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)j);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "appIdentifyingInfo", v28));
        v26 = (void *)objc_claimAutoreleasedReturnValue([v25 bundleId]);

        if (v26)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v7, "objectForKey:", v26));
          if (v27)
          {
            [v24 setSyncSlots:v27];
            [v5 addObject:v24];
          }
        }
      }

      id v21 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }

    while (v21);
  }
}

- (id)timeoutsExpiringAfter:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  double v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = sub_1000A3374;
  uint64_t v16 = sub_1000A3384;
  id v17 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A338C;
  block[3] = &unk_1004FBE80;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)_timeoutsExpiringAfter:(id)a3
{
  return -[ADSyncBlacklist _timeouts:expiringAfter:](self, "_timeouts:expiringAfter:", self->_cachedTimeoutTable, a3);
}

- (id)_timeouts:(id)a3 expiringAfter:(id)a4
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000A334C;
  v13[3] = &unk_1004EFD08;
  id v14 = a4;
  id v5 = v14;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 keysOfEntriesPassingTest:v13]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 dictionaryWithValuesForKeys:v8]);

  if (v9) {
    id v10 = v9;
  }
  else {
    id v10 = &__NSDictionary0__struct;
  }
  id v11 = v10;

  return v11;
}

- (void)saveTimeouts:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000A3340;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_saveTimeouts:(id)a3
{
  id v11 = a3;
  unsigned __int8 v4 = [v11 isEqual:self->_cachedTimeoutTable];
  id v5 = v11;
  if ((v4 & 1) == 0)
  {
    id v6 = (NSDictionary *)[v11 copy];
    cachedTimeoutTable = self->_cachedTimeoutTable;
    self->_cachedTimeoutTable = v6;

    if (-[NSDictionary count](self->_cachedTimeoutTable, "count"))
    {
      id v8 = self->_cachedTimeoutTable;
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADSyncBlacklist _storePath](self, "_storePath"));
      -[NSDictionary writeToFile:atomically:](v8, "writeToFile:atomically:", v9, 1LL);
    }

    else
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADSyncBlacklist _storePath](self, "_storePath"));
      [v9 removeItemAtPath:v10 error:0];
    }

    id v5 = v11;
  }
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A3A78;
  block[3] = &unk_1004FCFF8;
  void block[4] = a1;
  if (qword_100577BA0 != -1) {
    dispatch_once(&qword_100577BA0, block);
  }
  return (id)qword_100577B98;
}

@end