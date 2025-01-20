@interface ASSyncConnection
- (ASSyncConnection)initWithDelegate:(id)a3;
- (BOOL)_getChunkInfoWithHandler:(id)a3 batchSize:(int64_t)a4 lastAnchor:(id)a5 updates:(id)a6 deletes:(id)a7 post:(id *)a8 targetIsLocal:(BOOL)a9;
- (BOOL)_infoIsValid:(id)a3 forPreAnchor:(id)a4;
- (BOOL)_sendChunkWithUpdates:(id)a3 deletes:(id)a4 pre:(id)a5 post:(id)a6 validity:(id)a7 forRequestUUID:(id)a8;
- (id)currentSyncSnapshotFromHandler:(id)a3 forKey:(id)a4;
- (int64_t)defaultChunkBatchSize;
- (void)runSyncWithHandler:(id)a3 info:(id)a4 forRequestUUID:(id)a5;
@end

@implementation ASSyncConnection

- (ASSyncConnection)initWithDelegate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ASSyncConnection;
  v6 = -[ASSyncConnection init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_delegate, a3);
  }

  return v7;
}

- (BOOL)_sendChunkWithUpdates:(id)a3 deletes:(id)a4 pre:(id)a5 post:(id)a6 validity:(id)a7 forRequestUUID:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v20 = (void *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    v21 = v20;
    int v24 = 136316162;
    v25 = "-[ASSyncConnection _sendChunkWithUpdates:deletes:pre:post:validity:forRequestUUID:]";
    __int16 v26 = 2048;
    id v27 = [v14 count];
    __int16 v28 = 2048;
    id v29 = [v15 count];
    __int16 v30 = 2112;
    id v31 = v16;
    __int16 v32 = 2112;
    id v33 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%s Sending chunk with %lu updates %lu deletes. Anchors (%@, %@)",  (uint8_t *)&v24,  0x34u);
  }

  unsigned __int8 v22 = -[ASSyncConnectionDelegate sendSyncChunksWithPreAnchor:postAnchor:updates:deletes:validity:forRequestUUID:]( self->_delegate,  "sendSyncChunksWithPreAnchor:postAnchor:updates:deletes:validity:forRequestUUID:",  v16,  v17,  v14,  v15,  v18,  v19);

  return v22 ^ 1;
}

- (BOOL)_getChunkInfoWithHandler:(id)a3 batchSize:(int64_t)a4 lastAnchor:(id)a5 updates:(id)a6 deletes:(id)a7 post:(id *)a8 targetIsLocal:(BOOL)a9
{
  id v14 = a3;
  id v15 = a5;
  id v43 = a6;
  id v42 = a7;
  id v16 = objc_alloc_init(&OBJC_CLASS___ASSyncChangeInfo);
  if (a4 < 1)
  {
    BOOL v31 = 0;
  }

  else
  {
    v41 = a8;
    int64_t v17 = 0LL;
    while (1)
    {
      -[ASSyncChangeInfo setObject:](v16, "setObject:", 0LL);
      -[ASSyncChangeInfo setIsDelete:](v16, "setIsDelete:", 0LL);
      -[ASSyncChangeInfo setPostAnchor:](v16, "setPostAnchor:", 0LL);
      id v18 = objc_autoreleasePoolPush();
      [v14 getChangeAfterAnchor:v15 changeInfo:v16];
      objc_autoreleasePoolPop(v18);
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[ASSyncChangeInfo object](v16, "object"));
      unsigned int v20 = -[ASSyncChangeInfo isDelete](v16, "isDelete");
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ASSyncChangeInfo postAnchor](v16, "postAnchor"));
      unsigned __int8 v22 = (void *)AFSiriLogContextSync;
      if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
      {
        v23 = v22;
        int v24 = (objc_class *)objc_opt_class(v14);
        v25 = NSStringFromClass(v24);
        __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        *(_DWORD *)buf = 136315650;
        v46 = "-[ASSyncConnection _getChunkInfoWithHandler:batchSize:lastAnchor:updates:deletes:post:targetIsLocal:]";
        __int16 v47 = 2112;
        id v48 = v26;
        __int16 v49 = 2112;
        v50 = v16;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s %@ change info %@", buf, 0x20u);
      }

      if (!-[ASSyncConnection _infoIsValid:forPreAnchor:](self, "_infoIsValid:forPreAnchor:", v16, v15))
      {
        __int16 v32 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v46 = "-[ASSyncConnection _getChunkInfoWithHandler:batchSize:lastAnchor:updates:deletes:post:targetIsLocal:]";
          __int16 v47 = 2114;
          id v48 = v14;
          __int16 v49 = 2112;
          v50 = v16;
          _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "%s Sync plugin %{public}@ gave bad sync info %@",  buf,  0x20u);
        }

        if (AFIsInternalInstall())
        {
          id v33 = (objc_class *)objc_opt_class(v14);
          v34 = NSStringFromClass(v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
          v36 = (objc_class *)objc_opt_class(v19);
          v37 = NSStringFromClass(v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
          v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Sync handler %@ return bad object %@",  v35,  v38));

          WriteStackshotReport_async(v39, 2329221573LL);
        }

        break;
      }

      id v27 = (void *)objc_claimAutoreleasedReturnValue([v19 properties]);
      id v28 = [v27 count];

      if (v28)
      {
        if (v20) {
          id v29 = v42;
        }
        else {
          id v29 = v43;
        }
        __int16 v30 = (void *)objc_claimAutoreleasedReturnValue([v19 dictionary]);
        [v29 addObject:v30];

        ++v17;
      }

      id v15 = v21;
      if (v17 >= a4)
      {
        BOOL v31 = 0;
        id v15 = v21;
        goto LABEL_21;
      }
    }

    BOOL v31 = 1;
LABEL_21:
    a8 = v41;
  }

  *a8 = [v15 copy];

  return v31;
}

- (BOOL)_infoIsValid:(id)a3 forPreAnchor:(id)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  id v5 = v4;
  if (v4 && (v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]), v6, !v6))
  {
    v8 = (os_log_s *)AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      v11 = "-[ASSyncConnection _infoIsValid:forPreAnchor:]";
      __int16 v12 = 2112;
      v13 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s Synced object has no identifier! %@",  (uint8_t *)&v10,  0x16u);
    }

    BOOL v7 = 0;
  }

  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (int64_t)defaultChunkBatchSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 persistentDomainForName:@"com.apple.assistant"]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"Sync Chunk Batch Size"]);

  if (v4)
  {
    id v5 = (char *)[v4 integerValue];
    else {
      int64_t v6 = (int64_t)v5;
    }
  }

  else
  {
    int64_t v6 = 100LL;
  }

  return v6;
}

- (void)runSyncWithHandler:(id)a3 info:(id)a4 forRequestUUID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v62 = a5;
  objc_super v9 = (objc_class *)objc_opt_class(v7);
  int v10 = NSStringFromClass(v9);
  uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
  __int16 v12 = (void *)v11;
  v13 = @"unknown";
  if (v11) {
    v13 = (__CFString *)v11;
  }
  id v14 = v13;

  v56 = (void *)objc_claimAutoreleasedReturnValue([v8 reasons]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v56 allObjects]);
  uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 componentsJoinedByString:@"+"]);

  int64_t v17 = (os_log_s *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v70 = "-[ASSyncConnection runSyncWithHandler:info:forRequestUUID:]";
    __int16 v71 = 2112;
    v72 = (ASSyncBeginInfo *)v14;
    __int16 v73 = 2112;
    uint64_t v74 = (uint64_t)v8;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s %@ Beginning sync with info %@", buf, 0x20u);
  }

  id v18 = @"Assistant Service Event";
  v67[0] = @"Assistant Service Event";
  v67[1] = @"SyncHandler";
  v68[0] = @"Sync start";
  v68[1] = v14;
  v67[2] = @"SyncReasons";
  v55 = (void *)v16;
  v68[2] = v16;
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v68,  v67,  3LL));
  sub_1000044D4(v19);

  unsigned int v20 = objc_alloc_init(&OBJC_CLASS___ASSyncBeginInfo);
  uint64_t v21 = objc_claimAutoreleasedReturnValue([v8 anchor]);
  uint64_t v22 = objc_claimAutoreleasedReturnValue([v8 validity]);
  id v23 = [v8 count];
  int v24 = (void *)objc_claimAutoreleasedReturnValue([v8 key]);
  if ([v8 forVerification]
    && (objc_opt_respondsToSelector(v7, "syncVerificationKeyForKey:") & 1) != 0)
  {
    uint64_t v25 = objc_claimAutoreleasedReturnValue([v7 syncVerificationKeyForKey:v24]);

    __int16 v26 = (os_log_s *)AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v70 = "-[ASSyncConnection runSyncWithHandler:info:forRequestUUID:]";
      __int16 v71 = 2112;
      v72 = (ASSyncBeginInfo *)v14;
      __int16 v73 = 2112;
      uint64_t v74 = v25;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s %@ provided verification key %@", buf, 0x20u);
    }
  }

  else
  {
    uint64_t v25 = (uint64_t)v24;
  }

  -[ASSyncBeginInfo setAnchor:](v20, "setAnchor:", v21);
  -[ASSyncBeginInfo setValidity:](v20, "setValidity:", v22);
  -[ASSyncBeginInfo setCount:](v20, "setCount:", v23);
  -[ASSyncBeginInfo setKey:](v20, "setKey:", v25);
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v8 appMetadata]);
  -[ASSyncBeginInfo setAppMetadata:](v20, "setAppMetadata:", v27);

  id v28 = (void *)objc_claimAutoreleasedReturnValue([v8 reasons]);
  -[ASSyncBeginInfo setReasons:](v20, "setReasons:", v28);

  id v29 = objc_autoreleasePoolPush();
  v58 = (void *)v25;
  if ((objc_opt_respondsToSelector(v7, "beginSyncWithInfo:configuration:") & 1) != 0)
  {
    __int16 v30 = -[ASSyncConfiguration initWithConfigurationPlistForSyncKey:]( objc_alloc(&OBJC_CLASS___ASSyncConfiguration),  "initWithConfigurationPlistForSyncKey:",  v25);
    [v7 beginSyncWithInfo:v20 configuration:v30];
  }

  else
  {
    if ((objc_opt_respondsToSelector(v7, "beginSyncWithAnchor:validity:count:forKey:beginInfo:configuration:") & 1) == 0)
    {
      if ((objc_opt_respondsToSelector(v7, "beginSyncWithAnchor:validity:count:forKey:beginInfo:") & 1) != 0) {
        [v7 beginSyncWithAnchor:v21 validity:v22 count:v23 forKey:v25 beginInfo:v20];
      }
      else {
        [v7 beginSyncWithAnchor:v21 validity:v22 forKey:v25 beginInfo:v20];
      }
      goto LABEL_15;
    }

    __int16 v30 = -[ASSyncConfiguration initWithConfigurationPlistForSyncKey:]( objc_alloc(&OBJC_CLASS___ASSyncConfiguration),  "initWithConfigurationPlistForSyncKey:",  v25);
    [v7 beginSyncWithAnchor:v21 validity:v22 count:v23 forKey:v25 beginInfo:v20 configuration:v30];
  }

LABEL_15:
  objc_autoreleasePoolPop(v29);
  BOOL v31 = (os_log_s *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v70 = "-[ASSyncConnection runSyncWithHandler:info:forRequestUUID:]";
    __int16 v71 = 2112;
    v72 = v20;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%s BeginSyncInfo: %@", buf, 0x16u);
  }

  v57 = v14;
  v54 = v20;
  uint64_t v32 = objc_claimAutoreleasedReturnValue(-[ASSyncBeginInfo resetValidity](v20, "resetValidity"));
  uint64_t v60 = v32;
  if (v32) {
    id v33 = (void *)v32;
  }
  else {
    id v33 = (void *)v22;
  }
  id v61 = v33;
  v59 = (void *)v21;
  v53 = (void *)v22;
  if ((objc_opt_respondsToSelector(v7, "_syncBatchSize") & 1) != 0) {
    int64_t v34 = (int)[v7 _syncBatchSize];
  }
  else {
    int64_t v34 = -[ASSyncConnection defaultChunkBatchSize](self, "defaultChunkBatchSize");
  }
  v35 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v34);
  v36 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v34);
  v37 = v59;
  if (v60) {
    v37 = 0LL;
  }
  v38 = v37;
  do
  {
    v38 = v38;
    v39 = (os_log_s *)AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v70 = "-[ASSyncConnection runSyncWithHandler:info:forRequestUUID:]";
      __int16 v71 = 2112;
      v72 = v38;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "%s Gathering chunk with pre %@", buf, 0x16u);
    }

    v64 = v38;
    v40 = v8;
    LOBYTE(v52) = [v8 targetIsLocal];
    id v41 = v7;
    unsigned int v42 = -[ASSyncConnection _getChunkInfoWithHandler:batchSize:lastAnchor:updates:deletes:post:targetIsLocal:]( self,  "_getChunkInfoWithHandler:batchSize:lastAnchor:updates:deletes:post:targetIsLocal:",  v7,  v34,  v38,  v35,  v36,  &v64,  v52);
    unint64_t v43 = v64;

    if (v42)
    {
      v44 = (os_log_s *)AFSiriLogContextSync;
      if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v70 = "-[ASSyncConnection runSyncWithHandler:info:forRequestUUID:]";
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "%s Last chunk!", buf, 0xCu);
      }
    }

    if (v38)
    {
    }

    else if (!(v43 | v60))
    {
LABEL_33:
      v45 = (os_log_s *)AFSiriLogContextSync;
      if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v70 = "-[ASSyncConnection runSyncWithHandler:info:forRequestUUID:]";
        __int16 v71 = 2112;
        v72 = v38;
        _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_INFO,  "%s Ignoring empty sync chunk for anchors pre == post %@",  buf,  0x16u);
      }

      goto LABEL_37;
    }

    if (!-[ASSyncConnection _sendChunkWithUpdates:deletes:pre:post:validity:forRequestUUID:]( self,  "_sendChunkWithUpdates:deletes:pre:post:validity:forRequestUUID:",  v35,  v36,  v38,  v43,  v61,  v62))
    {
      id v48 = (os_log_s *)AFSiriLogContextSync;
      if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v70 = "-[ASSyncConnection runSyncWithHandler:info:forRequestUUID:]";
        _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_INFO,  "%s assistantd told us to stop sending chunks",  buf,  0xCu);
      }

      goto LABEL_41;
    }

- (id)currentSyncSnapshotFromHandler:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    objc_super v9 = (objc_class *)objc_opt_class(v5);
    int v10 = NSStringFromClass(v9);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    int v15 = 136315394;
    uint64_t v16 = "-[ASSyncConnection currentSyncSnapshotFromHandler:forKey:]";
    __int16 v17 = 2112;
    id v18 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Fetching sync info from handler %@",  (uint8_t *)&v15,  0x16u);
  }

  if ((objc_opt_respondsToSelector(v5, "syncSnapshotForKey:") & 1) != 0)
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v5 syncSnapshotForKey:v6]);
  }

  else
  {
    if ((objc_opt_respondsToSelector(v5, "currentSyncSnapshot") & 1) == 0)
    {
      v13 = 0LL;
      goto LABEL_9;
    }

    uint64_t v12 = objc_claimAutoreleasedReturnValue([v5 currentSyncSnapshot]);
  }

  v13 = (void *)v12;
LABEL_9:

  return v13;
}

- (void).cxx_destruct
{
}

@end