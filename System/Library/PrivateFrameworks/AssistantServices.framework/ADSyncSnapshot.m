@interface ADSyncSnapshot
+ (id)sharedInstance;
- (ADSyncSnapshot)init;
- (BOOL)_pruneAppsCacheWithTruth:(id)a3;
- (BOOL)shouldIgnoreSyncKey:(id)a3;
- (id)_storePath;
- (void)_cancelSaveTimer;
- (void)_fetchSentAnchorsOnQueue:(id)a3 completion:(id)a4;
- (void)_noteSendingPostGen:(id)a3 validity:(id)a4 key:(id)a5 appMetaData:(id)a6;
- (void)_readFromDisk;
- (void)_save;
- (void)_scheduleSave;
- (void)deleteSavedSnapshots;
- (void)fetchSentAnchorsOnQueue:(id)a3 completion:(id)a4;
- (void)noteSendingChunk:(id)a3;
- (void)pruneCacheWithCurrentSynapseInfo:(id)a3;
@end

@implementation ADSyncSnapshot

- (ADSyncSnapshot)init
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___ADSyncSnapshot;
  v2 = -[ADSyncSnapshot init](&v19, "init");
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

    v11 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  0LL);
    pluginCache = v3->_pluginCache;
    v3->_pluginCache = v11;

    v13 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  0LL);
    appsCache = v3->_appsCache;
    v3->_appsCache = v13;

    v15 = (dispatch_queue_s *)v3->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000B30B8;
    block[3] = &unk_1004FD940;
    v18 = v3;
    dispatch_async(v15, block);
  }

  return v3;
}

- (id)_storePath
{
  uint64_t v2 = AFUserSupportDirectoryPath(self, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"SyncSnapshot.plist"]);

  return v4;
}

- (void)_fetchSentAnchorsOnQueue:(id)a3 completion:(id)a4
{
  id v6 = a4;
  dispatch_queue_attr_t v7 = (dispatch_queue_s *)a3;
  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  pluginCache = self->_pluginCache;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000B2F60;
  v20[3] = &unk_1004EFF58;
  v10 = v8;
  v21 = v10;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](pluginCache, "enumerateKeysAndObjectsUsingBlock:", v20);
  appsCache = self->_appsCache;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000B2FB0;
  v18[3] = &unk_1004F43F0;
  v12 = v10;
  objc_super v19 = v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](appsCache, "enumerateKeysAndObjectsUsingBlock:", v18);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000B304C;
  v15[3] = &unk_1004FD990;
  v16 = v12;
  id v17 = v6;
  v13 = v12;
  id v14 = v6;
  dispatch_async(v7, v15);
}

- (void)fetchSentAnchorsOnQueue:(id)a3 completion:(id)a4
{
  id v6 = (dispatch_queue_s *)a3;
  id v7 = a4;
  if (v7)
  {
    if (!v6)
    {
      id v6 = &_dispatch_main_q;
      v8 = &_dispatch_main_q;
    }

    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000B2F50;
    block[3] = &unk_1004FD9E0;
    void block[4] = self;
    id v6 = v6;
    v12 = v6;
    id v13 = v7;
    dispatch_async(queue, block);
  }

  else
  {
    v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[ADSyncSnapshot fetchSentAnchorsOnQueue:completion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Can not get anchors without a completion block",  buf,  0xCu);
    }
  }
}

- (void)_cancelSaveTimer
{
  saveTimer = self->_saveTimer;
  if (saveTimer)
  {
    dispatch_source_cancel((dispatch_source_t)saveTimer);
    id v4 = self->_saveTimer;
    self->_saveTimer = 0LL;
  }

- (void)_scheduleSave
{
  saveTimer = self->_saveTimer;
  if (!saveTimer)
  {
    id v4 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
    id v5 = self->_saveTimer;
    self->_saveTimer = v4;

    id v6 = self->_saveTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000B2F48;
    handler[3] = &unk_1004FD940;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v6, handler);
    dispatch_activate((dispatch_object_t)self->_saveTimer);
    saveTimer = self->_saveTimer;
  }

  dispatch_time_t v7 = dispatch_time(0LL, 10000000000LL);
  dispatch_source_set_timer((dispatch_source_t)saveTimer, v7, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[ADSyncSnapshot _scheduleSave]";
    __int16 v12 = 2048;
    uint64_t v13 = 0x4024000000000000LL;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Waiting %.4g seconds to save", buf, 0x16u);
  }

- (void)_noteSendingPostGen:(id)a3 validity:(id)a4 key:(id)a5 appMetaData:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v12 length])
  {
    id v14 = objc_alloc_init(&OBJC_CLASS____ADChunkInfo);
    -[_ADChunkInfo setValidity:](v14, "setValidity:", v11);
    -[_ADChunkInfo setPostGen:](v14, "setPostGen:", v10);
    if ([v12 isEqualToString:AFSynapseSyncAnchorKey])
    {
      id v25 = v10;
      uint64_t v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_af_preferredBundleID"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v13 syncSlots]);
      id v17 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_appsCache, "objectForKey:", v15));
      if (!v17)
      {
        id v17 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v16 count]);
        -[NSMutableDictionary setObject:forKey:](self->_appsCache, "setObject:forKey:", v17, v15);
      }

      v24 = (void *)v15;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      id v18 = v16;
      id v19 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v27;
        do
        {
          v22 = 0LL;
          do
          {
            if (*(void *)v27 != v21) {
              objc_enumerationMutation(v18);
            }
            -[NSMutableDictionary setObject:forKey:]( v17,  "setObject:forKey:",  v14,  *(void *)(*((void *)&v26 + 1) + 8LL * (void)v22),  v24);
            v22 = (char *)v22 + 1;
          }

          while (v20 != v22);
          id v20 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }

        while (v20);
      }

      id v10 = v25;
    }

    else
    {
      -[NSMutableDictionary setObject:forKey:](self->_pluginCache, "setObject:forKey:", v14, v12);
    }

    -[ADSyncSnapshot _scheduleSave](self, "_scheduleSave", v24);
  }

  else
  {
    v23 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "-[ADSyncSnapshot _noteSendingPostGen:validity:key:appMetaData:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%s Missing key, ignoring this sync chunk",  buf,  0xCu);
    }
  }
}

- (void)noteSendingChunk:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 key]);
  id v6 = [v5 copy];

  if (-[ADSyncSnapshot shouldIgnoreSyncKey:](self, "shouldIgnoreSyncKey:", v6))
  {
    dispatch_time_t v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[ADSyncSnapshot noteSendingChunk:]";
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Not caching %@", buf, 0x16u);
    }
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 postGen]);
    id v9 = [v8 copy];

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 validity]);
    id v11 = [v10 copy];

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 appMetaData]);
    id v13 = [v12 copy];

    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000B2F34;
    block[3] = &unk_1004F7698;
    void block[4] = self;
    id v19 = v9;
    id v20 = v11;
    id v21 = v6;
    id v22 = v13;
    id v15 = v13;
    id v16 = v11;
    id v17 = v9;
    dispatch_async(queue, block);
  }
}

- (void)deleteSavedSnapshots
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B2E68;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)shouldIgnoreSyncKey:(id)a3
{
  id v3 = a3;
  else {
    unsigned __int8 v4 = [v3 isEqualToString:AFIntentSupportAndVocabSyncNanoKey];
  }

  return v4;
}

- (void)_readFromDisk
{
  id v3 = objc_alloc(&OBJC_CLASS___NSData);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADSyncSnapshot _storePath](self, "_storePath"));
  id v5 = -[NSData initWithContentsOfFile:](v3, "initWithContentsOfFile:", v4);

  if (-[NSData length](v5, "length"))
  {
    id v33 = 0LL;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v5,  2LL,  0LL,  &v33));
    dispatch_time_t v7 = (__CFString *)v33;
    if (v6)
    {
      if ((objc_opt_respondsToSelector(v6, "objectForKey:") & 1) != 0)
      {
        __int128 v27 = (const __CFString *)AFSynapseSyncAnchorKey;
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:"));
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"Plugins"]);
        id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        __int128 v28 = v10;
        if ((objc_opt_respondsToSelector(v9, "enumerateKeysAndObjectsUsingBlock:") & 1) != 0)
        {
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472LL;
          v31[2] = sub_1000B2AE0;
          v31[3] = &unk_1004F3280;
          v31[4] = self;
          v32 = v10;
          [v9 enumerateKeysAndObjectsUsingBlock:v31];
        }

        else if (v9)
        {
          id v17 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v35 = "-[ADSyncSnapshot _readFromDisk]";
            __int16 v36 = 2112;
            v37 = @"Plugins";
            _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s Saved %@ data is invalid, continuing...",  buf,  0x16u);
          }
        }

        if (-[NSMutableDictionary count](v28, "count")) {
          objc_storeStrong((id *)&self->_pluginCache, v28);
        }
        id v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        if ((objc_opt_respondsToSelector(v8, "enumerateKeysAndObjectsUsingBlock:") & 1) != 0)
        {
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472LL;
          v29[2] = sub_1000B2C00;
          v29[3] = &unk_1004F43F0;
          v30 = v18;
          [v8 enumerateKeysAndObjectsUsingBlock:v29];
        }

        else if (v8)
        {
          id v19 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v35 = "-[ADSyncSnapshot _readFromDisk]";
            __int16 v36 = 2112;
            v37 = v27;
            _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s Saved %@ data is invalid, continuing...",  buf,  0x16u);
          }
        }

        p_pluginCache = &self->_pluginCache;
        objc_storeStrong((id *)&self->_pluginCache, v28);
        p_appsCache = &self->_appsCache;
        objc_storeStrong((id *)&self->_appsCache, v18);
        id v22 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          v23 = *p_pluginCache;
          v24 = v22;
          __int16 v25 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSMutableDictionary count](v23, "count")));
          id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSMutableDictionary count](*p_appsCache, "count")));
          *(_DWORD *)buf = 136315650;
          v35 = "-[ADSyncSnapshot _readFromDisk]";
          __int16 v36 = 2112;
          v37 = v25;
          __int16 v38 = 2112;
          v39 = v26;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "%s Loaded sent sync anchors (%@ plugin anchors, %@ SiriKit anchors)",  buf,  0x20u);
        }

        goto LABEL_26;
      }

      id v16 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v35 = "-[ADSyncSnapshot _readFromDisk]";
        id v13 = "%s Saved data is invalid!";
        id v14 = v16;
        uint32_t v15 = 12;
        goto LABEL_12;
      }
    }

    else
    {
      id v12 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v35 = "-[ADSyncSnapshot _readFromDisk]";
        __int16 v36 = 2112;
        v37 = v7;
        id v13 = "%s Could not deserialize file %@";
        id v14 = v12;
        uint32_t v15 = 22;
LABEL_12:
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
      }
    }

- (BOOL)_pruneAppsCacheWithTruth:(id)a3
{
  id v26 = a3;
  if (-[NSMutableDictionary count](self->_appsCache, "count"))
  {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_appsCache, "allKeys"));
    id v5 = [v4 copy];

    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id obj = v5;
    id v25 = [obj countByEnumeratingWithState:&v33 objects:v44 count:16];
    char v6 = 0;
    if (v25)
    {
      uint64_t v24 = *(void *)v34;
      while (2)
      {
        uint64_t v7 = 0LL;
        do
        {
          if (*(void *)v34 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v33 + 1) + 8 * v7);
          id v9 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKey:v8]);
          if (![v9 count])
          {
            id v21 = (os_log_s *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              __int16 v38 = "-[ADSyncSnapshot _pruneAppsCacheWithTruth:]";
              __int16 v39 = 2112;
              uint64_t v40 = v8;
              _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%s App %@ no longer has synapse data, removing from cache.",  buf,  0x16u);
            }

            -[NSMutableDictionary removeObjectForKey:](self->_appsCache, "removeObjectForKey:", v8);

            char v6 = 1;
            goto LABEL_25;
          }

          uint64_t v27 = v7;
          __int128 v28 = v9;
          id v10 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v9);
          id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_appsCache, "objectForKey:", v8));
          id v12 = [v11 copy];

          __int128 v31 = 0u;
          __int128 v32 = 0u;
          __int128 v29 = 0u;
          __int128 v30 = 0u;
          id v13 = v12;
          id v14 = [v13 countByEnumeratingWithState:&v29 objects:v43 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v30;
            do
            {
              for (i = 0LL; i != v15; i = (char *)i + 1)
              {
                if (*(void *)v30 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)i);
                if (!-[NSSet containsObject:](v10, "containsObject:", v18))
                {
                  id v19 = (os_log_s *)AFSiriLogContextDaemon;
                  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 136315650;
                    __int16 v38 = "-[ADSyncSnapshot _pruneAppsCacheWithTruth:]";
                    __int16 v39 = 2112;
                    uint64_t v40 = v8;
                    __int16 v41 = 2112;
                    uint64_t v42 = v18;
                    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s %@/%@ info is no longer on disk, removing from cache.",  buf,  0x20u);
                  }

                  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_appsCache, "objectForKey:", v8));
                  [v20 removeObjectForKey:v18];

                  char v6 = 1;
                }
              }

              id v15 = [v13 countByEnumeratingWithState:&v29 objects:v43 count:16];
            }

            while (v15);
          }

          uint64_t v7 = v27 + 1;
        }

        while ((id)(v27 + 1) != v25);
        id v25 = [obj countByEnumeratingWithState:&v33 objects:v44 count:16];
        if (v25) {
          continue;
        }
        break;
      }
    }

- (void)pruneCacheWithCurrentSynapseInfo:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000B2AA4;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_save
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v24 = "-[ADSyncSnapshot _save]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v4 = -[NSMutableDictionary initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableDictionary), "initWithCapacity:", 3LL);
  id v5 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  -[NSMutableDictionary count](self->_appsCache, "count"));
  appsCache = self->_appsCache;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000B2910;
  v21[3] = &unk_1004F1AF0;
  uint64_t v7 = v5;
  id v22 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](appsCache, "enumerateKeysAndObjectsUsingBlock:", v21);
  if (-[NSMutableDictionary count](v7, "count")) {
    -[NSMutableDictionary setValue:forKey:](v4, "setValue:forKey:", v7, AFSynapseSyncAnchorKey);
  }
  id v8 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  -[NSMutableDictionary count](self->_pluginCache, "count"));
  pluginCache = self->_pluginCache;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000B29E4;
  v19[3] = &unk_1004EFF58;
  id v10 = v8;
  id v20 = v10;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](pluginCache, "enumerateKeysAndObjectsUsingBlock:", v19);
  if (-[NSMutableDictionary count](v10, "count")) {
    -[NSMutableDictionary setValue:forKey:](v4, "setValue:forKey:", v10, @"Plugins");
  }
  if (-[NSMutableDictionary count](v4, "count"))
  {
    id v18 = 0LL;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v4,  200LL,  0LL,  &v18));
    id v12 = v18;
    if (!v11)
    {
      id v13 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v24 = "-[ADSyncSnapshot _save]";
        __int16 v25 = 2112;
        id v26 = v12;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Could not convert in-memory representation to plist %@",  buf,  0x16u);
      }
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ADSyncSnapshot _storePath](self, "_storePath"));
    unsigned __int8 v15 = [v11 writeToFile:v14 atomically:1];

    if ((v15 & 1) == 0)
    {
      uint64_t v16 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v24 = "-[ADSyncSnapshot _save]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s Failed to write plist to disk",  buf,  0xCu);
      }
    }
  }

  else
  {
    id v17 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v24 = "-[ADSyncSnapshot _save]";
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%s No anchors to save, so removing any existing files.",  buf,  0xCu);
    }

    id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADSyncSnapshot _storePath](self, "_storePath"));
    [v12 removeItemAtPath:v11 error:0];
  }

  -[ADSyncSnapshot _cancelSaveTimer](self, "_cancelSaveTimer");
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B3134;
  block[3] = &unk_1004FCFF8;
  void block[4] = a1;
  if (qword_100577BD0 != -1) {
    dispatch_once(&qword_100577BD0, block);
  }
  return (id)qword_100577BC8;
}

@end