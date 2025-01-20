@interface ADNotifyAndPushContextCollector
- (ADNotifyAndPushContextCollector)init;
- (BOOL)_hasCompletionForPID:(int)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)_addCompletion:(id)a3 forPID:(int)a4;
- (void)_getContextForAppInfo:(id)a3 completion:(id)a4;
- (void)_invokeAllCompletionsWithError;
- (void)_invokeCompletionWithContext:(id)a3 forPID:(int)a4;
- (void)_setContext:(id)a3 forPID:(int)a4;
- (void)getContextForAppInfos:(id)a3 completion:(id)a4;
@end

@implementation ADNotifyAndPushContextCollector

- (ADNotifyAndPushContextCollector)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ADNotifyAndPushContextCollector;
  v2 = -[ADNotifyAndPushContextCollector init](&v10, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create(0LL, v4);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    completionsByPID = v2->_completionsByPID;
    v2->_completionsByPID = v7;
  }

  return v2;
}

- (void)getContextForAppInfos:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002E6394;
  block[3] = &unk_1004FD9E0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  return 0;
}

- (void)_setContext:(id)a3 forPID:(int)a4
{
  id v6 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002E6384;
  block[3] = &unk_1004FAF80;
  block[4] = self;
  id v10 = v6;
  int v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)_getContextForAppInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  uint64_t v9 = AFContextProviderNameForBundleId(v8);
  id v10 = objc_claimAutoreleasedReturnValue(v9);
  int v11 = (const char *)[v10 UTF8String];

  int out_token = -1;
  if (v11 && !notify_register_check(v11, &out_token))
  {
    *(void *)buf = 0LL;
    uint32_t state = notify_get_state(out_token, (uint64_t *)buf);
    uint64_t v17 = *(void *)buf;
    notify_cancel(out_token);
    BOOL v12 = 0;
    if (!state && v17 == 1) {
      BOOL v12 = notify_post(v11) == 0;
    }
  }

  else
  {
    BOOL v12 = 0;
  }

  id v13 = [v6 pid];
  v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v15 = "No";
    *(_DWORD *)buf = 136315906;
    *(void *)&buf[4] = "-[ADNotifyAndPushContextCollector _getContextForAppInfo:completion:]";
    if (v12) {
      v15 = "Getting";
    }
    __int16 v20 = 2080;
    v21 = v15;
    __int16 v22 = 2080;
    v23 = v11;
    __int16 v24 = 1024;
    int v25 = (int)v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s %s push context for %s %d", buf, 0x26u);
  }

  if (v7)
  {
    if (v12) {
      -[ADNotifyAndPushContextCollector _addCompletion:forPID:](self, "_addCompletion:forPID:", v7, v13);
    }
    else {
      v7[2](v7, 0LL);
    }
  }
}

- (BOOL)_hasCompletionForPID:(int)a3
{
  completionsByPID = self->_completionsByPID;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(void *)&a3));
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](completionsByPID, "objectForKey:", v4));
  LOBYTE(completionsByPID) = v5 != 0LL;

  return (char)completionsByPID;
}

- (void)_addCompletion:(id)a3 forPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  completionsByPID = self->_completionsByPID;
  id v7 = objc_retainBlock(a3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
  -[NSMutableDictionary setObject:forKey:](completionsByPID, "setObject:forKey:", v7, v6);
}

- (void)_invokeCompletionWithContext:(id)a3 forPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v11 = a3;
  completionsByPID = self->_completionsByPID;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
  id v8 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( completionsByPID,  "objectForKey:",  v7));

  if (v8) {
    ((void (**)(void, id))v8)[2](v8, v11);
  }
  uint64_t v9 = self->_completionsByPID;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
  -[NSMutableDictionary removeObjectForKey:](v9, "removeObjectForKey:", v10);
}

- (void)_invokeAllCompletionsWithError
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  dispatch_queue_attr_t v3 = self->_completionsByPID;
  id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v13,  v21,  16LL);
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v14;
    *(void *)&__int128 v5 = 136315394LL;
    __int128 v12 = v5;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)v8);
        id v10 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v12;
          v18 = "-[ADNotifyAndPushContextCollector _invokeAllCompletionsWithError]";
          __int16 v19 = 2112;
          uint64_t v20 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Push context time out for pid %@",  buf,  0x16u);
        }

        id v11 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_completionsByPID,  "objectForKey:",  v9,  v12,  (void)v13));
        v11[2](v11, 0LL);

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v13,  v21,  16LL);
    }

    while (v6);
  }

  -[NSMutableDictionary removeAllObjects](self->_completionsByPID, "removeAllObjects");
}

- (void).cxx_destruct
{
}

@end