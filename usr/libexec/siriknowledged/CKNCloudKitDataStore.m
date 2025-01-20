@interface CKNCloudKitDataStore
- (void)mergeRecordsWithDictionary:(id)a3 deletedRecordKeys:(id)a4 containsAllChanges:(BOOL)a5;
@end

@implementation CKNCloudKitDataStore

- (void)mergeRecordsWithDictionary:(id)a3 deletedRecordKeys:(id)a4 containsAllChanges:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  v9 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[CKNCloudKitDataStore mergeRecordsWithDictionary:deletedRecordKeys:containsAllChanges:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (v5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKDaemon sharedDaemon](&OBJC_CLASS___CKDaemon, "sharedDaemon"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100003AD8;
    v13[3] = &unk_100018590;
    id v14 = v7;
    id v15 = v8;
    [v10 keysInStoreWithIdentifier:@"synched" completionHandler:v13];

    v11 = v14;
LABEL_9:

    goto LABEL_10;
  }

  if ([v7 count])
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CKDaemon sharedDaemon](&OBJC_CLASS___CKDaemon, "sharedDaemon"));
    [v12 saveKeysAndValues:v7 toStoreWithIdentifier:@"synched" completionHandler:&stru_1000185B0];
  }

  if ([v8 count])
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CKDaemon sharedDaemon](&OBJC_CLASS___CKDaemon, "sharedDaemon"));
    [v11 removeValuesForKeys:v8 fromStoreWithIdentifier:@"synched" completionHandler:&stru_1000185D0];
    goto LABEL_9;
  }

@end