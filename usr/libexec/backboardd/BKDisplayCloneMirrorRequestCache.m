@interface BKDisplayCloneMirrorRequestCache
- (void)_lock_addDeathWatcherForPid:(int)a3;
- (void)_lock_rebuildModeCache;
@end

@implementation BKDisplayCloneMirrorRequestCache

- (void)_lock_addDeathWatcherForPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (!self->_pidToDeathWatcher)
  {
    NSMutableDictionary *v5 = [[NSMutableDictionary alloc] init];
    pidToDeathWatcher = self->_pidToDeathWatcher;
    self->_pidToDeathWatcher = v5;
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000286E4;
  v10[3] = &unk_1000B7CF0;
  v10[4] = self;
  int v11 = v3;
  BSProcessDeathWatcher *v7 = [[BSProcessDeathWatcher alloc] initWithPID:v3 queue:_dispatch_main_q deathHandler:v10];
  v8 = self->_pidToDeathWatcher;
  v9 = [NSNumber numberWithInt:v3];
  [v8 setObject:v7 forKey:v9];
}

- (void)_lock_rebuildModeCache
{
  NSMutableDictionary *v3 = [[NSMutableDictionary alloc] init];
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v4 = self->_modeRequestsInOrder;
  [v4 countByEnumeratingWithState:v18 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)v8);
        if (v9) {
          v10 = *(void **)(v9 + 16);
        }
        else {
          v10 = 0LL;
        }
        id v11 = v10;
        v12 = [v3 objectForKey:v11];

        if (!v12) {
          [v3 setObject:v9 forKey:v11];
        }

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      [v4 countByEnumeratingWithState:v18 objects:v24 count:16];
      id v6 = v13;
    }

    while (v13);
  }

  self->_displayUUIDToModeRequest = v3;
  uint64_t v15 = BKLogDisplay(v14);
  v16 = [os_log_s logWithName:v15];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [BSDescriptionStream descriptionForRootObject:v3];
    *(_DWORD *)buf = 138543362;
    v23 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "clone mirror cache is now %{public}@",  buf,  0xCu);
  }
}

- (void).cxx_destruct
{
}

@end