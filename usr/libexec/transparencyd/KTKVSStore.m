@interface KTKVSStore
+ (BOOL)afterFirstUnlock;
+ (id)strictStore;
- (BOOL)storeReady;
- (NSString)accountMetricID;
- (void)forceSync:(id)a3;
- (void)handleKVSStoreChange:(id)a3;
- (void)processChangedKeys:(id)a3;
@end

@implementation KTKVSStore

- (void)processChangedKeys:(id)a3
{
  id v3 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = kApplicationIdentifierMap;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue( +[KTOptInManagerServer optInKeyForApplication:]( &OBJC_CLASS___KTOptInManagerServer,  "optInKeyForApplication:",  v9,  (void)v13));
        if ([v3 containsObject:v10])
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue( +[KTOptInManagerServer notificationKeyForApplication:]( &OBJC_CLASS___KTOptInManagerServer,  "notificationKeyForApplication:",  v9));
          if (v11)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
            [v12 postNotificationName:v11 object:0 userInfo:0 deliverImmediately:1];
          }
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v6);
  }
}

- (void)handleKVSStoreChange:(id)a3
{
  id v9 = (id)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:NSUbiquitousKeyValueStoreChangeReasonKey]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:NSUbiquitousKeyValueStoreChangedKeysKey]);
  id v6 = [v4 integerValue];
  if (v6 == (id)2)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorAccount,  -284LL,  @"KVS store quota violation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
    [v8 logResultForEvent:@"KVSStoreQuotaViolation" hardFailure:1 result:v7];

    goto LABEL_6;
  }

  if (v6 == (id)3) {
LABEL_4:
  }
    -[KTKVSStore processChangedKeys:](self, "processChangedKeys:", v5);
LABEL_6:
}

+ (BOOL)afterFirstUnlock
{
  int v2 = MKBDeviceUnlockedSinceBoot(a1, a2);
  if (v2 != 1)
  {
    if (qword_1002EEC60 != -1) {
      dispatch_once(&qword_1002EEC60, &stru_100286A68);
    }
    id v3 = (os_log_s *)qword_1002EEC68;
    if (os_log_type_enabled((os_log_t)qword_1002EEC68, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = v2;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Unable to open KVS store, device never unlocked: %d",  (uint8_t *)v5,  8u);
    }
  }

  return v2 == 1;
}

+ (id)strictStore
{
  if (+[KTKVSStore afterFirstUnlock](&OBJC_CLASS___KTKVSStore, "afterFirstUnlock") && qword_1002EEC70 != -1) {
    dispatch_once(&qword_1002EEC70, &stru_100286A88);
  }
  return 0LL;
}

- (NSString)accountMetricID
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTKVSStore objectForKey:](self, "objectForKey:", @"accountMetricID"));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) == 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 UUIDString]);

    -[KTKVSStore setObject:forKey:](self, "setObject:forKey:", v7, @"accountMetricID");
    id v3 = (void *)v7;
  }

  return (NSString *)v3;
}

- (void)forceSync:(id)a3
{
  id v4 = a3;
  if (qword_1002EEC60 != -1) {
    dispatch_once(&qword_1002EEC60, &stru_100286AA8);
  }
  uint64_t v5 = (os_log_s *)qword_1002EEC68;
  if (os_log_type_enabled((os_log_t)qword_1002EEC68, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "KTKVSStore calling synchronizeWithCompletionHandler",  buf,  2u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10018B718;
  v7[3] = &unk_100279428;
  id v8 = v4;
  id v6 = v4;
  -[KTKVSStore synchronizeWithCompletionHandler:](self, "synchronizeWithCompletionHandler:", v7);
}

- (BOOL)storeReady
{
  return 1;
}

@end