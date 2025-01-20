@interface ADDeleteSyncDataService
- (ADDeleteSyncDataService)init;
- (void)beginSyncForInfo:(id)a3 chunkHandler:(id)a4;
@end

@implementation ADDeleteSyncDataService

- (ADDeleteSyncDataService)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ADDeleteSyncDataService;
  v2 = -[ADDeleteSyncDataService init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[ADService setIdentifier:](v2, "setIdentifier:", @"com.apple.siri.sync.DisabledSyncDataToBeDeleted");
  }
  return v3;
}

- (void)beginSyncForInfo:(id)a3 chunkHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    if ((uint64_t)[v5 count] < 1)
    {
      v10 = 0LL;
      v11 = 0LL;
    }

    else
    {
      v7 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        v8 = v7;
        v9 = (void *)objc_claimAutoreleasedReturnValue([v5 key]);
        *(_DWORD *)buf = 136315394;
        v15 = "-[ADDeleteSyncDataService beginSyncForInfo:chunkHandler:]";
        __int16 v16 = 2112;
        v17 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Clearing sync data of type %@", buf, 0x16u);
      }

      v10 = objc_alloc_init(&OBJC_CLASS___ADSyncChunkInfo);
      -[ADSyncChunkInfo setValidity:](v10, "setValidity:", @"DeleteSyncDataServiceValidity");
      -[ADSyncChunkInfo setToAdd:](v10, "setToAdd:", &__NSArray0__struct);
      -[ADSyncChunkInfo setToRemove:](v10, "setToRemove:", &__NSArray0__struct);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_100247930;
      v12[3] = &unk_1004FDA58;
      id v13 = v6;
      v11 = objc_retainBlock(v12);
    }

    (*((void (**)(id, ADSyncChunkInfo *, void, void *))v6 + 2))(v6, v10, 0LL, v11);
  }
}

@end