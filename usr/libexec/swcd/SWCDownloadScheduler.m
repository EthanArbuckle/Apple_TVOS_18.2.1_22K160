@interface SWCDownloadScheduler
+ (id)new;
- (BOOL)isEnabled;
- (SWCDatabase)database;
- (SWCDownloadScheduler)init;
- (SWCDownloadScheduler)initWithDownloader:(id)a3 database:(id)a4;
- (SWCDownloader)downloader;
- (id)_init;
- (id)_updateableEntries;
- (void)_performUpdateWithActivity:(id)a3;
- (void)_performUpdatesWithTransaction:(id)a3;
- (void)_scheduleUpdateTimer;
- (void)setEnabled:(BOOL)a3;
- (void)update;
@end

@implementation SWCDownloadScheduler

- (SWCDownloadScheduler)initWithDownloader:(id)a3 database:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SWCDownloadScheduler;
  v9 = -[SWCDownloadScheduler init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_downloader, a3);
    objc_storeStrong((id *)&v10->_database, a4);
    v10->_enabled = 1;
  }

  return v10;
}

+ (id)new
{
}

- (SWCDownloadScheduler)init
{
}

- (void)update
{
  id v3 = (id)os_transaction_create("com.apple.swc.update.explicit", a2);
  -[SWCDownloadScheduler _performUpdatesWithTransaction:](self, "_performUpdatesWithTransaction:");
}

- (SWCDownloader)downloader
{
  return (SWCDownloader *)objc_getProperty(self, a2, 16LL, 1);
}

- (SWCDatabase)database
{
  return (SWCDatabase *)objc_getProperty(self, a2, 24LL, 1);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
}

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SWCDownloadScheduler;
  v2 = -[SWCDownloadScheduler init](&v5, "init");
  id v3 = v2;
  if (v2) {
    -[SWCDownloadScheduler _scheduleUpdateTimer](v2, "_scheduleUpdateTimer");
  }
  return v3;
}

- (void)_scheduleUpdateTimer
{
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  v4 = v3;
  if (v3)
  {
    xpc_dictionary_set_string(v3, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
    xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
    xpc_dictionary_set_int64(v4, XPC_ACTIVITY_INTERVAL, 3600LL);
    xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
    xpc_dictionary_set_string( v4,  XPC_ACTIVITY_NETWORK_TRANSFER_DIRECTION,  XPC_ACTIVITY_NETWORK_TRANSFER_DIRECTION_DOWNLOAD);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100013368;
    handler[3] = &unk_100030D40;
    handler[4] = self;
    xpc_activity_register("com.apple.SharedWebCredentials.recheck", v4, handler);
  }
}

- (void)_performUpdateWithActivity:(id)a3
{
  v4 = (_xpc_activity_s *)a3;
  v6 = (void *)os_transaction_create("com.apple.swc.update.scheduled", v5);
  xpc_activity_state_t state = xpc_activity_get_state(v4);
  if (qword_1000371F0 != -1) {
    dispatch_once(&qword_1000371F0, &stru_100030D88);
  }
  id v8 = (os_log_s *)qword_1000371E8;
  if (os_log_type_enabled((os_log_t)qword_1000371E8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    xpc_activity_state_t v17 = state;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Update activity state: %lli", buf, 0xCu);
    if (state == 2)
    {
      if (qword_1000371F0 != -1) {
        dispatch_once(&qword_1000371F0, &stru_100030D88);
      }
      goto LABEL_8;
    }

    if (qword_1000371F0 != -1) {
      dispatch_once(&qword_1000371F0, &stru_100030D88);
    }
  }

  else if (state == 2)
  {
LABEL_8:
    v9 = (os_log_s *)qword_1000371E8;
    if (os_log_type_enabled((os_log_t)qword_1000371E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Performing SWC update.", buf, 2u);
    }

    if (xpc_activity_set_state(v4, 4LL))
    {
      v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[SWCDatabase queue](&OBJC_CLASS___SWCDatabase, "queue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000136C8;
      block[3] = &unk_100030D68;
      block[4] = self;
      id v14 = v6;
      v15 = v4;
      dispatch_async(v10, block);
    }

    else
    {
      if (qword_1000371F0 != -1) {
        dispatch_once(&qword_1000371F0, &stru_100030D88);
      }
      objc_super v12 = (os_log_s *)qword_1000371E8;
      if (os_log_type_enabled((os_log_t)qword_1000371E8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Continue activity state failed; downloads will not proceed at this time.",
          buf,
          2u);
      }
    }

    goto LABEL_20;
  }

  v11 = (os_log_s *)qword_1000371E8;
  if (os_log_type_enabled((os_log_t)qword_1000371E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    xpc_activity_state_t v17 = state;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "Activity block was fired with state %lli; not running now.",
      buf,
      0xCu);
  }

- (id)_updateableEntries
{
  xpc_object_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  database = self->_database;
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  v13 = sub_100013804;
  id v14 = &unk_100030C80;
  id v6 = v4;
  id v15 = v6;
  id v7 = v3;
  v16 = v7;
  -[SWCDatabase enumerateEntriesWithBlock:](database, "enumerateEntriesWithBlock:", &v11);
  if (!-[NSMutableOrderedSet count](v7, "count", v11, v12, v13, v14))
  {

    id v7 = 0LL;
  }

  id v8 = v16;
  v9 = v7;

  return v9;
}

- (void)_performUpdatesWithTransaction:(id)a3
{
  if (-[SWCDownloadScheduler isEnabled](self, "isEnabled", a3))
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDownloadScheduler _updateableEntries](self, "_updateableEntries"));
    id v5 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v5)
    {
      uint64_t v7 = *(void *)v18;
      *(void *)&__int128 v6 = 138412290LL;
      __int128 v16 = v6;
      do
      {
        id v8 = 0LL;
        do
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)v8);
          if (objc_msgSend(v9, "needsFirstDownload", v16))
          {
            downloader = self->_downloader;
            v11 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
            uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 applicationIdentifier]);
            -[SWCDownloader downloadAASAFileForDomain:applicationIdentifier:completionHandler:]( downloader,  "downloadAASAFileForDomain:applicationIdentifier:completionHandler:",  v11,  v12,  0LL);
          }

          else
          {
            if (qword_1000371F0 != -1) {
              dispatch_once(&qword_1000371F0, &stru_100030D88);
            }
            v13 = (os_log_s *)qword_1000371E8;
            if (os_log_type_enabled((os_log_t)qword_1000371E8, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v16;
              v22 = v9;
              _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Updating entry %@", buf, 0xCu);
            }

            id v14 = self->_downloader;
            v11 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
            uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 applicationIdentifier]);
            -[SWCDownloader updateAASAFileForDomain:applicationIdentifier:completionHandler:]( v14,  "updateAASAFileForDomain:applicationIdentifier:completionHandler:",  v11,  v12,  0LL);
          }

          id v8 = (char *)v8 + 1;
        }

        while (v5 != v8);
        id v5 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }

      while (v5);
    }
  }

  else
  {
    if (qword_1000371F0 != -1) {
      dispatch_once(&qword_1000371F0, &stru_100030D88);
    }
    id v15 = (os_log_s *)qword_1000371E8;
    if (os_log_type_enabled((os_log_t)qword_1000371E8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "Ignoring call to schedule downloads because the scheduler is disabled",  buf,  2u);
    }
  }

@end