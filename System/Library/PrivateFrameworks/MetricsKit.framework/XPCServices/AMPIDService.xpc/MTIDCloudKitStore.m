@interface MTIDCloudKitStore
+ (BOOL)updateRecord:(id)a3 isSpanRecord:(BOOL)a4 scheme:(id)a5 expectedKey:(id)a6 expiration:(id)a7 reset:(BOOL)a8;
+ (id)keyOfReferenceDate:(id)a3;
+ (id)recordZoneID;
+ (id)referenceDateOfRecord:(id)a3;
+ (id)referenceRecordIDForScheme:(id)a3 dsId:(id)a4;
+ (id)spanRecordIDForScheme:(id)a3 referenceRecordID:(id)a4 serialNumber:(unint64_t)a5;
+ (id)spanRecordKeyWithReferenceRecord:(id)a3 serialNumber:(unint64_t)a4;
- (BOOL)canSyncBetweenDevices;
- (MTIDCloudKitLocalDB)localDB;
- (MTIDCloudKitPromiseManager)promiseManager;
- (MTIDCloudKitStore)initWithContainerIdentifer:(id)a3 enableSync:(BOOL)a4;
- (MTIDSyncEngine)syncEngine;
- (NSMutableDictionary)generatedDates;
- (NSString)containerIdentifier;
- (OS_dispatch_queue)accessQueue;
- (id)debugInfo;
- (id)maintainSchemes:(id)a3 options:(id)a4;
- (id)promiseForRecordWithID:(id)a3 timeout:(double)a4 qualityOfService:(int64_t)a5 existingOnly:(BOOL)a6 updateRecordMaybe:(id)a7;
- (id)recordWithID:(id)a3;
- (id)recordWithID:(id)a3 qualityOfService:(int64_t)a4 updateRecordMaybe:(id)a5 error:(id *)a6;
- (id)referenceRecordForScheme:(id)a3 dsId:(id)a4 date:(id)a5 reset:(BOOL)a6 timeout:(double)a7 existingOnly:(BOOL)a8 qualityOfService:(int64_t)a9;
- (id)resetSchemes:(id)a3 options:(id)a4;
- (id)secretForScheme:(id)a3 options:(id)a4;
- (id)spanRecordForScheme:(id)a3 span:(id)a4 timeout:(double)a5 existingOnly:(BOOL)a6 qualityOfService:(int64_t)a7 referenceRecord:(id)a8;
- (id)syncForSchemes:(id)a3 options:(id)a4;
- (void)_generateFutureRecordsForScheme:(id)a3 referenceRecord:(id)a4;
- (void)accountDidChangeWithUserRecordID:(id)a3;
- (void)clearLocalData;
- (void)cloudKitLocalDB:(id)a3 didChangeRecord:(id)a4;
- (void)fetchChangesIfNeeded;
- (void)generateFutureRecordsForScheme:(id)a3 referenceRecord:(id)a4;
- (void)recordWasDeleted:(id)a3;
- (void)recordWasFailedToSave:(id)a3;
- (void)recordWasFetched:(id)a3;
- (void)recordWasSaved:(id)a3;
- (void)setAccessQueue:(id)a3;
- (void)setCanSyncBetweenDevices:(BOOL)a3;
- (void)setContainerIdentifier:(id)a3;
- (void)setGeneratedDates:(id)a3;
- (void)setLocalDB:(id)a3;
- (void)setPromiseManager:(id)a3;
- (void)setSyncEngine:(id)a3;
- (void)syncEngineDidStartWithError:(id)a3;
@end

@implementation MTIDCloudKitStore

- (MTIDCloudKitStore)initWithContainerIdentifer:(id)a3 enableSync:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___MTIDCloudKitStore;
  v7 = -[MTIDCloudKitStore init](&v24, "init");
  v8 = v7;
  if (v7)
  {
    -[MTIDCloudKitStore setContainerIdentifier:](v7, "setContainerIdentifier:", v6);
    if (v4)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[MTFrameworkEnvironment sharedEnvironment]( &OBJC_CLASS___MTFrameworkEnvironment,  "sharedEnvironment"));
      v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 valueForEntitlement:@"com.apple.developer.icloud-container-identifiers"]);

      -[MTIDCloudKitStore setCanSyncBetweenDevices:]( v8,  "setCanSyncBetweenDevices:",  [v10 containsObject:v6]);
      if (!-[MTIDCloudKitStore canSyncBetweenDevices](v8, "canSyncBetweenDevices"))
      {
        id v11 = MTMetricsKitOSLog();
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v26 = v6;
          __int16 v27 = 2112;
          v28 = @"com.apple.developer.icloud-container-identifiers";
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "MetricsKit: The application is missing container %@ in %@ entitlement.",  buf,  0x16u);
        }
      }
    }

    else
    {
      -[MTIDCloudKitStore setCanSyncBetweenDevices:](v8, "setCanSyncBetweenDevices:", 0LL);
    }

    id v13 = objc_claimAutoreleasedReturnValue([v6 stringByAppendingString:@".accessqueue"]);
    dispatch_queue_t v14 = dispatch_queue_create((const char *)[v13 UTF8String], 0);
    -[MTIDCloudKitStore setAccessQueue:](v8, "setAccessQueue:", v14);

    v15 = objc_alloc(&OBJC_CLASS___MTIDCloudKitLocalDB);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MTIDCloudKitStore recordZoneID](&OBJC_CLASS___MTIDCloudKitStore, "recordZoneID"));
    v17 = -[MTIDCloudKitLocalDB initWithContainerIdentifier:recordType:recordZoneID:]( v15,  "initWithContainerIdentifier:recordType:recordZoneID:",  v6,  @"MT_IDSecret",  v16);

    -[MTIDCloudKitLocalDB setDelegate:](v17, "setDelegate:", v8);
    -[MTIDCloudKitStore setLocalDB:](v8, "setLocalDB:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[MTIDCloudKitStore setGeneratedDates:](v8, "setGeneratedDates:", v18);

    if (-[MTIDCloudKitStore canSyncBetweenDevices](v8, "canSyncBetweenDevices"))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore syncEngine](v8, "syncEngine"));
      [v19 start];
    }

    v20 = objc_alloc(&OBJC_CLASS___MTIDCloudKitPromiseManager);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore accessQueue](v8, "accessQueue"));
    v22 = -[MTIDCloudKitPromiseManager initWithCallbackQueue:](v20, "initWithCallbackQueue:", v21);
    -[MTIDCloudKitStore setPromiseManager:](v8, "setPromiseManager:", v22);
  }

  return v8;
}

- (MTIDSyncEngine)syncEngine
{
  if (!self->_syncEngine && -[MTIDCloudKitStore canSyncBetweenDevices](self, "canSyncBetweenDevices"))
  {
    v3 = objc_alloc(&OBJC_CLASS___MTIDSyncEngine);
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore containerIdentifier](self, "containerIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTIDCloudKitStore recordZoneID](&OBJC_CLASS___MTIDCloudKitStore, "recordZoneID"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore accessQueue](self, "accessQueue"));
    v7 = -[MTIDSyncEngine initWithContainerIdentifier:zoneID:queue:delegate:]( v3,  "initWithContainerIdentifier:zoneID:queue:delegate:",  v4,  v5,  v6,  self);
    syncEngine = self->_syncEngine;
    self->_syncEngine = v7;
  }

  return self->_syncEngine;
}

- (void)generateFutureRecordsForScheme:(id)a3 referenceRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 lifespan] && -[MTIDCloudKitStore canSyncBetweenDevices](self, "canSyncBetweenDevices"))
  {
    objc_initWeak(&location, self);
    v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore accessQueue](self, "accessQueue"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10000EF00;
    v9[3] = &unk_100020B68;
    objc_copyWeak(&v12, &location);
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)_generateFutureRecordsForScheme:(id)a3 referenceRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_superclass = &OBJC_CLASS___MTIDSecret.superclass;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[MTIDCloudKitStore referenceDateOfRecord:]( &OBJC_CLASS___MTIDCloudKitStore,  "referenceDateOfRecord:",  v7));
  if (!v9)
  {
    v34 = 0LL;
    v17 = 0LL;
    v20 = (char *)[v6 storagePoolSize] - 1;
LABEL_10:
    id v25 = 0LL;
    do
    {
      id v26 = v25;
      __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v7 recordID]);
      v28 = (void *)objc_claimAutoreleasedReturnValue( [p_superclass + 9 spanRecordIDForScheme:v6 referenceRecordID:v27 serialNumber:v17]);

      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472LL;
      v36[2] = sub_10000F258;
      v36[3] = &unk_100020B90;
      id v37 = v7;
      v39 = v17;
      id v38 = v6;
      id v35 = v26;
      id v29 =  -[MTIDCloudKitStore recordWithID:qualityOfService:updateRecordMaybe:error:]( self,  "recordWithID:qualityOfService:updateRecordMaybe:error:",  v28,  -1LL,  v36,  &v35);
      id v25 = v35;

      ++v17;
    }

    while (v17 <= v20);

    v9 = v34;
    goto LABEL_14;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTFrameworkEnvironment sharedEnvironment](&OBJC_CLASS___MTFrameworkEnvironment, "sharedEnvironment"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 date]);

  [v6 maxFutureTimeInterval];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateByAddingTimeInterval:"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore generatedDates](self, "generatedDates"));
  dispatch_queue_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 idNamespace]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v14]);

  if (v15 && [v12 compare:v15] == (id)-1)
  {

    goto LABEL_14;
  }

  v33 = v15;
  v32 = (void *)objc_claimAutoreleasedReturnValue( +[MTIDSpan spanForScheme:date:referenceDate:]( &OBJC_CLASS___MTIDSpan,  "spanForScheme:date:referenceDate:",  v6,  v11,  v9));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[MTIDSpan spanForScheme:date:referenceDate:]( &OBJC_CLASS___MTIDSpan,  "spanForScheme:date:referenceDate:",  v6,  v12,  v9));
  v17 = (char *)[v32 serialNumber];
  v18 = (char *)[v16 serialNumber];
  v19 = (char *)[v6 storagePoolSize];
  if (v18 >= &v19[(void)v17 - 2]) {
    v20 = &v19[(void)v17 - 2];
  }
  else {
    v20 = v18;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue([v16 endDate]);
  v30 = self;
  v31 = v11;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore generatedDates](self, "generatedDates"));
  v23 = v12;
  objc_super v24 = (void *)objc_claimAutoreleasedReturnValue([v6 idNamespace]);
  [v22 setObject:v21 forKeyedSubscript:v24];

  if (v17 <= v20)
  {
    self = v30;
    v34 = v9;
    p_superclass = (__objc2_class **)(&OBJC_CLASS___MTIDSecret + 8);
    goto LABEL_10;
  }

- (id)recordWithID:(id)a3 qualityOfService:(int64_t)a4 updateRecordMaybe:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = (unsigned int (**)(id, id))a5;
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v12);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore localDB](self, "localDB"));
  id v25 = 0LL;
  dispatch_queue_t v14 = (CKRecord *)objc_claimAutoreleasedReturnValue([v13 recordWithID:v10 error:&v25]);
  id v15 = v25;
  if (!v15)
  {
    if (!v14)
    {
      v18 = objc_alloc(&OBJC_CLASS___CKRecord);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v13 recordType]);
      dispatch_queue_t v14 = -[CKRecord initWithRecordType:recordID:](v18, "initWithRecordType:recordID:", v19, v10);
    }

    if (v11[2](v11, v14))
    {
      id v24 = 0LL;
      unsigned __int8 v20 = [v13 writeRecord:v14 error:&v24];
      id v16 = v24;
      if ((v20 & 1) == 0)
      {
        if (a6) {
          goto LABEL_3;
        }
LABEL_13:
        v17 = 0LL;
        goto LABEL_14;
      }

      if (-[MTIDCloudKitStore canSyncBetweenDevices](self, "canSyncBetweenDevices"))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore syncEngine](self, "syncEngine"));
        id v26 = v10;
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
        [v21 saveRecordsWithIDs:v22 qualityOfService:a4];
      }
    }

    else
    {
      id v16 = 0LL;
    }

    dispatch_queue_t v14 = v14;
    v17 = v14;
    goto LABEL_14;
  }

  id v16 = v15;
  if (!a6) {
    goto LABEL_13;
  }
LABEL_3:
  id v16 = v16;
  v17 = 0LL;
  *a6 = v16;
LABEL_14:

  return v17;
}

- (id)promiseForRecordWithID:(id)a3 timeout:(double)a4 qualityOfService:(int64_t)a5 existingOnly:(BOOL)a6 updateRecordMaybe:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  dispatch_queue_t v14 = objc_alloc_init(&OBJC_CLASS___MTPromise);
  id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore accessQueue](self, "accessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000F600;
  block[3] = &unk_100020BE0;
  block[4] = self;
  id v23 = v12;
  id v25 = v13;
  int64_t v26 = a5;
  id v16 = v14;
  id v24 = v16;
  double v27 = a4;
  BOOL v28 = a6;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(v15, block);

  v19 = v24;
  unsigned __int8 v20 = v16;

  return v20;
}

+ (id)recordZoneID
{
  return  -[CKRecordZoneID initWithZoneName:ownerName:]( objc_alloc(&OBJC_CLASS___CKRecordZoneID),  "initWithZoneName:ownerName:",  @"MT_IDZone",  CKCurrentUserDefaultName);
}

+ (id)referenceRecordIDForScheme:(id)a3 dsId:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 idNamespace]);
  id v8 = [v6 idType];

  if (v5 && v8 == (id)2)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingFormat:", @"_%llx", objc_msgSend(v5, "unsignedLongLongValue")));

    id v7 = (void *)v9;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mt_SHA1Base62String"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([@"MT_ID" stringByAppendingString:v10]);

  id v12 = objc_alloc(&OBJC_CLASS___CKRecordID);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTIDCloudKitStore recordZoneID](&OBJC_CLASS___MTIDCloudKitStore, "recordZoneID"));
  dispatch_queue_t v14 = -[CKRecordID initWithRecordName:zoneID:](v12, "initWithRecordName:zoneID:", v11, v13);

  return v14;
}

+ (id)referenceDateOfRecord:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"secretKey"]);
  BOOL v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:"));
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

+ (id)keyOfReferenceDate:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  [a3 timeIntervalSince1970];
  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lld",  (uint64_t)v3));
}

+ (id)spanRecordIDForScheme:(id)a3 referenceRecordID:(id)a4 serialNumber:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a4 recordName]);
  unint64_t v10 = (unint64_t)[v8 storagePoolSize];

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%02lx",  v9,  a5 % v10));
  id v12 = objc_alloc(&OBJC_CLASS___CKRecordID);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([a1 recordZoneID]);
  dispatch_queue_t v14 = -[CKRecordID initWithRecordName:zoneID:](v12, "initWithRecordName:zoneID:", v11, v13);

  return v14;
}

+ (id)spanRecordKeyWithReferenceRecord:(id)a3 serialNumber:(unint64_t)a4
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llx", a4);
}

+ (BOOL)updateRecord:(id)a3 isSpanRecord:(BOOL)a4 scheme:(id)a5 expectedKey:(id)a6 expiration:(id)a7 reset:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v12 = a4;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v34 = a7;
  uint64_t v16 = objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"namespace"]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"secretKey"]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v14 idNamespace]);
  v33 = (void *)v16;
  LODWORD(v16) = [(id)v16 isEqualToString:v18];

  int v19 = v16 ^ 1;
  if (!v12 || (v19 & 1) != 0)
  {
    if ((v19 | v8) != 1)
    {
LABEL_5:
      BOOL v20 = 0;
      if (v17) {
        int v21 = 0;
      }
      else {
        int v21 = !v12;
      }
      if (v15)
      {
        v22 = v33;
        id v23 = v34;
        if (v21)
        {
          [v13 setObject:v15 forKeyedSubscript:@"secretKey"];
          id v24 = MTMetricsKitOSLog();
          id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v36 = v13;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEBUG,  "MetricsKit: Updating reference record %@ with current date",  buf,  0xCu);
          }

          BOOL v20 = 1;
        }
      }

      else
      {
        v22 = v33;
        id v23 = v34;
      }

      goto LABEL_17;
    }
  }

  else if ([v17 isEqualToString:v15] && !v8)
  {
    goto LABEL_5;
  }

  id v26 = MTMetricsKitOSLog();
  double v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    BOOL v28 = (void *)objc_claimAutoreleasedReturnValue([v14 idNamespace]);
    *(_DWORD *)buf = 138412802;
    id v36 = v13;
    __int16 v37 = 2112;
    id v38 = v28;
    __int16 v39 = 2112;
    id v40 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEBUG,  "MetricsKit: Updating record %@ for namespace %@ key %@",  buf,  0x20u);
  }

  id v29 = (void *)objc_claimAutoreleasedReturnValue([v14 idNamespace]);
  [v13 setObject:v29 forKeyedSubscript:@"namespace"];

  [v13 setObject:v15 forKeyedSubscript:@"secretKey"];
  id v23 = v34;
  [v13 setObject:v34 forKeyedSubscript:@"expiration"];
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 UUIDString]);
  objc_msgSend(v13, "mt_setSecretValue:", v31);

  objc_msgSend(v13, "mt_setSynchronized:", 0);
  BOOL v20 = 1;
  v22 = v33;
LABEL_17:

  return v20;
}

- (id)referenceRecordForScheme:(id)a3 dsId:(id)a4 date:(id)a5 reset:(BOOL)a6 timeout:(double)a7 existingOnly:(BOOL)a8 qualityOfService:(int64_t)a9
{
  BOOL v10 = a8;
  id v16 = a3;
  id v17 = a5;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[MTIDCloudKitStore referenceRecordIDForScheme:dsId:]( &OBJC_CLASS___MTIDCloudKitStore,  "referenceRecordIDForScheme:dsId:",  v16,  a4));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10000FF14;
  v23[3] = &unk_100020C08;
  BOOL v26 = v10;
  id v24 = v17;
  id v25 = v16;
  BOOL v27 = a6;
  id v19 = v16;
  id v20 = v17;
  int v21 = (void *)objc_claimAutoreleasedReturnValue( -[MTIDCloudKitStore promiseForRecordWithID:timeout:qualityOfService:existingOnly:updateRecordMaybe:]( self,  "promiseForRecordWithID:timeout:qualityOfService:existingOnly:updateRecordMaybe:",  v18,  a9,  v10,  v23,  a7));

  return v21;
}

- (id)spanRecordForScheme:(id)a3 span:(id)a4 timeout:(double)a5 existingOnly:(BOOL)a6 qualityOfService:(int64_t)a7 referenceRecord:(id)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 recordID]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[MTIDCloudKitStore spanRecordIDForScheme:referenceRecordID:serialNumber:]( MTIDCloudKitStore,  "spanRecordIDForScheme:referenceRecordID:serialNumber:",  v14,  v17,  [v15 serialNumber]));

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000100F4;
  v24[3] = &unk_100020C30;
  BOOL v28 = v10;
  id v25 = v16;
  id v26 = v15;
  id v27 = v14;
  id v19 = v14;
  id v20 = v15;
  id v21 = v16;
  v22 = (void *)objc_claimAutoreleasedReturnValue( -[MTIDCloudKitStore promiseForRecordWithID:timeout:qualityOfService:existingOnly:updateRecordMaybe:]( self,  "promiseForRecordWithID:timeout:qualityOfService:existingOnly:updateRecordMaybe:",  v18,  a7,  v10,  v24,  a5));

  return v22;
}

- (void)fetchChangesIfNeeded
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore localDB](self, "localDB"));
  unsigned int v4 = [v3 needsFetchRecords];

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore localDB](self, "localDB"));
    [v5 setNeedsFetchRecords:0];

    id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore syncEngine](self, "syncEngine"));
    [v6 fetchAllRecords];
  }

- (id)syncForSchemes:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a4 objectForKeyedSubscript:@"dsId"]);
  BOOL v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      id v13 = 0LL;
      id v14 = v8;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        id v15 = (void *)objc_claimAutoreleasedReturnValue( +[MTIDCloudKitStore referenceRecordIDForScheme:dsId:]( &OBJC_CLASS___MTIDCloudKitStore,  "referenceRecordIDForScheme:dsId:",  *(void *)(*((void *)&v22 + 1) + 8LL * (void)v13),  v7));
        BOOL v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableArray arrayByAddingObject:](v14, "arrayByAddingObject:", v15));

        id v13 = (char *)v13 + 1;
        id v14 = v8;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v11);
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore syncEngine](self, "syncEngine"));
  if (v16)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore syncEngine](self, "syncEngine"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 fetchRecordWithIDs:v8]);

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100010440;
    v21[3] = &unk_100020C58;
    v21[4] = self;
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 thenWithBlock:v21]);
  }

  else
  {
    id v19 = 0LL;
  }

  return v19;
}

- (void)accountDidChangeWithUserRecordID:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore localDB](self, "localDB"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 recordName]);
  unsigned int v8 = [v6 setUserRecordIDName:v7];

  if (v8)
  {
    id v9 = MTMetricsKitOSLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 recordName]);
      int v12 = 138412290;
      id v13 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "MetricsKit: Updated user record with ID %@",  (uint8_t *)&v12,  0xCu);
    }

    +[MTInterprocessChangeNotifier notify:]( &OBJC_CLASS___MTInterprocessChangeNotifier,  "notify:",  @"MTCloudKitAccountDidChangeNotification");
  }
}

- (void)syncEngineDidStartWithError:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@-%ld",  v6,  [v4 code]));

    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore localDB](self, "localDB"));
    [v8 setSyncStatusCode:v7];

    id v9 = MTMetricsKitOSLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v4;
      id v11 = "MetricsKit: Error starting sync engine: %@";
      int v12 = v10;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 12;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, buf, v14);
    }
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore localDB](self, "localDB"));
    [v15 setSyncStatusCode:@"Ready"];

    -[MTIDCloudKitStore fetchChangesIfNeeded](self, "fetchChangesIfNeeded");
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore localDB](self, "localDB"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v16 pendingRecordIDs]);

    if ([v7 count])
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore syncEngine](self, "syncEngine"));
      [v17 saveRecordsWithIDs:v7 qualityOfService:25];

      id v18 = MTMetricsKitOSLog();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v21) = [v7 count];
        id v11 = "MetricsKit: Started sync engine with %d unsynchronized records";
        int v12 = v10;
        os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
        uint32_t v14 = 8;
        goto LABEL_9;
      }
    }

    else
    {
      id v19 = MTMetricsKitOSLog();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        id v11 = "MetricsKit: Started sync engine with all records synchronized";
        int v12 = v10;
        os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
        uint32_t v14 = 2;
        goto LABEL_9;
      }
    }
  }
}

- (id)recordWithID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore localDB](self, "localDB"));
  id v12 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 recordWithID:v4 error:&v12]);
  id v7 = v12;

  if (!v6)
  {
    id v8 = MTMetricsKitOSLog();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 recordName]);
      *(_DWORD *)buf = 138412546;
      uint32_t v14 = v10;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "MetricsKit: Failed to read local record data with ID %@ error %@",  buf,  0x16u);
    }
  }

  return v6;
}

- (void)recordWasSaved:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 recordType]);
  unsigned int v6 = [v5 isEqualToString:@"MT_IDSecret"];

  if (v6)
  {
    objc_msgSend(v4, "mt_setSynchronized:", 1);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore localDB](self, "localDB"));
    id v14 = 0LL;
    unsigned __int8 v8 = [v7 writeRecord:v4 error:&v14];
    id v9 = v14;

    if ((v8 & 1) == 0)
    {
      id v10 = MTMetricsKitOSLog();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
        os_log_type_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 recordName]);
        *(_DWORD *)buf = 138412546;
        id v16 = v13;
        __int16 v17 = 2112;
        id v18 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "MetricsKit: Failed to save local record data with ID %@ error %@",  buf,  0x16u);
      }
    }
  }
}

- (void)recordWasFailedToSave:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v7 recordType]);
  unsigned int v5 = [v4 isEqualToString:@"MT_IDSecret"];

  if (v5)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore promiseManager](self, "promiseManager"));
    [v6 finishPromisesOfRecord:v7];
  }
}

- (void)recordWasFetched:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 recordType]);
  unsigned int v6 = [v5 isEqualToString:@"MT_IDSecret"];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 recordName]);
    unsigned int v9 = [v8 hasPrefix:@"MT_ID"];

    if (v9)
    {
      objc_msgSend(v4, "mt_setSynchronized:", 1);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore localDB](self, "localDB"));
      id v17 = 0LL;
      unsigned __int8 v11 = [v10 writeRecord:v4 error:&v17];
      id v12 = v17;

      if ((v11 & 1) != 0)
      {
LABEL_9:

        goto LABEL_10;
      }

      id v13 = MTMetricsKitOSLog();
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (!os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
      {
LABEL_8:

        goto LABEL_9;
      }

      __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 recordName]);
      *(_DWORD *)buf = 138412546;
      id v20 = v16;
      __int16 v21 = 2112;
      id v22 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  OS_LOG_TYPE_ERROR,  "MetricsKit: Failed to save local record data with ID %@ error %@",  buf,  0x16u);
    }

    else
    {
      id v12 = (id)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore syncEngine](self, "syncEngine"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
      id v18 = v14;
      __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
      [v12 deleteRecordsWithIDs:v15];
    }

    goto LABEL_8;
  }

- (void)recordWasDeleted:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore localDB](self, "localDB"));
  id v11 = 0LL;
  unsigned __int8 v6 = [v5 deleteRecordWithID:v4 error:&v11];
  id v7 = v11;

  if ((v6 & 1) == 0)
  {
    id v8 = MTMetricsKitOSLog();
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 recordName]);
      *(_DWORD *)buf = 138412546;
      id v13 = v10;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "MetricsKit: Failed to delete local record data with ID %@ error %@",  buf,  0x16u);
    }
  }
}

- (void)cloudKitLocalDB:(id)a3 didChangeRecord:(id)a4
{
  id v7 = a4;
  if (objc_msgSend(v7, "mt_isSynchronized"))
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore promiseManager](self, "promiseManager"));
    [v5 finishPromisesOfRecord:v7];

    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"namespace"]);
    +[MTInterprocessChangeNotifier notify:](&OBJC_CLASS___MTInterprocessChangeNotifier, "notify:", v6);
  }
}

- (id)secretForScheme:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"appBundleID"]);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore syncEngine](self, "syncEngine"));
  [v9 setApplicationBundleIdentifierOverrideForNetworkAttribution:v8];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"date"]);
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[MTFrameworkEnvironment sharedEnvironment]( &OBJC_CLASS___MTFrameworkEnvironment,  "sharedEnvironment"));
    id v12 = (id)objc_claimAutoreleasedReturnValue([v13 date]);
  }

  id v36 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"dsId"]);
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"reset"]);
  id v15 = [v14 BOOLValue];

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"syncWaitTime"]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"existingOnly"]);
  id v18 = [v17 BOOLValue];

  if (v16) {
    [v16 doubleValue];
  }
  else {
    +[MTIDSyncEngine transactionTimeout](&OBJC_CLASS___MTIDSyncEngine, "transactionTimeout");
  }
  double v20 = v19;
  id v21 = MTMetricsKitOSLog();
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v6 idNamespace]);
    __int128 v24 = @"NO";
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v23;
    if ((_DWORD)v18) {
      __int128 v24 = @"YES";
    }
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    v46 = (uint64_t (*)(uint64_t, uint64_t))v24;
    LOWORD(v47) = 2048;
    *(double *)((char *)&v47 + 2) = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "MetricsKit: Secret requested for scheme %@, date: %@, existingOnly: %@, timeout: %f",  buf,  0x2Au);
  }

  if (!(_DWORD)v18) {
    goto LABEL_14;
  }
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue( +[MTIDCloudKitStore referenceRecordIDForScheme:dsId:]( &OBJC_CLASS___MTIDCloudKitStore,  "referenceRecordIDForScheme:dsId:",  v6,  v36));
  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore localDB](self, "localDB"));
  id v44 = 0LL;
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 recordWithID:v25 error:&v44]);
  id v35 = v44;

  if (v27)
  {

LABEL_14:
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    v46 = sub_10001157C;
    *(void *)&__int128 v47 = sub_10001158C;
    *((void *)&v47 + 1) = 0LL;
    BOOL v28 = (void *)objc_claimAutoreleasedReturnValue( -[MTIDCloudKitStore referenceRecordForScheme:dsId:date:reset:timeout:existingOnly:qualityOfService:]( self,  "referenceRecordForScheme:dsId:date:reset:timeout:existingOnly:qualityOfService:",  v6,  v36,  v12,  v15,  v18,  25LL,  v20));
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_100011594;
    v37[3] = &unk_100020CA8;
    id v38 = v6;
    id v40 = self;
    v41 = buf;
    id v39 = v12;
    double v42 = v20;
    char v43 = (char)v18;
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 thenWithBlock:v37]);

    _Block_object_dispose(buf, 8);
    goto LABEL_15;
  }

  v31 = -[MTIDSecret initWithValue:effectiveDate:expirationDate:isSynchronize:]( objc_alloc(&OBJC_CLASS___MTIDSecret),  "initWithValue:effectiveDate:expirationDate:isSynchronize:",  &stru_100021530,  0LL,  0LL,  0LL);
  id v32 = MTMetricsKitOSLog();
  v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    id v34 = (void *)objc_claimAutoreleasedReturnValue([v6 idNamespace]);
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v34;
    _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_INFO,  "MetricsKit: Secret doesn't exist, returning empty secret for scheme %@",  buf,  0xCu);
  }

  id v29 = (void *)objc_claimAutoreleasedReturnValue(+[MTPromise promiseWithResult:](&OBJC_CLASS___MTPromise, "promiseWithResult:", v31));
LABEL_15:

  return v29;
}

- (id)resetSchemes:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"appBundleID"]);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore syncEngine](self, "syncEngine"));
  [v9 setApplicationBundleIdentifierOverrideForNetworkAttribution:v8];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"dsId"]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v12 = v6;
  id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      id v16 = 0LL;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = (void *)objc_claimAutoreleasedReturnValue( -[MTIDCloudKitStore referenceRecordForScheme:dsId:date:reset:timeout:existingOnly:qualityOfService:]( self,  "referenceRecordForScheme:dsId:date:reset:timeout:existingOnly:qualityOfService:",  *(void *)(*((void *)&v21 + 1) + 8LL * (void)v16),  v10,  0LL,  1LL,  0LL,  25LL,  0.0,  (void)v21));
        [v11 addObject:v17];

        id v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v14);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[MTPromise promiseWithAll:](&OBJC_CLASS___MTPromise, "promiseWithAll:", v11));
  double v19 = (void *)objc_claimAutoreleasedReturnValue([v18 thenWithBlock:&stru_100020CE8]);

  return v19;
}

- (id)maintainSchemes:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"appBundleID"]);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore syncEngine](self, "syncEngine"));
  [v9 setApplicationBundleIdentifierOverrideForNetworkAttribution:v8];

  if (-[MTIDCloudKitStore canSyncBetweenDevices](self, "canSyncBetweenDevices"))
  {
    id v10 = MTMetricsKitOSLog();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v23 = [v6 count];
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "MetricsKit: Performing maintenance on %d ID schemes",  buf,  8u);
    }

    id v12 = objc_alloc_init(&OBJC_CLASS___MTPromise);
    id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore accessQueue](self, "accessQueue"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100011FB4;
    v18[3] = &unk_100020D60;
    v18[4] = self;
    id v19 = v7;
    id v20 = v6;
    id v14 = v12;
    __int128 v21 = v14;
    dispatch_async(v13, v18);

    uint64_t v15 = v21;
    id v16 = v14;
  }

  else
  {
    id v16 = (MTPromise *)objc_claimAutoreleasedReturnValue( +[MTPromise promiseWithResult:]( &OBJC_CLASS___MTPromise,  "promiseWithResult:",  &__kCFBooleanTrue));
  }

  return v16;
}

- (void)clearLocalData
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore localDB](self, "localDB"));
  [v2 clearData];
}

- (id)debugInfo
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore localDB](self, "localDB"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allRecords]);

  v11[0] = @"container";
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[MTIDCloudKitStore containerIdentifier](self, "containerIdentifier"));
  id v6 = (void *)v5;
  if (v5) {
    id v7 = (const __CFString *)v5;
  }
  else {
    id v7 = &stru_100021530;
  }
  v11[1] = @"secrets";
  v12[0] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mt_map:", &stru_100020DA0));
  v12[1] = v8;
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  2LL));

  return v9;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
}

- (BOOL)canSyncBetweenDevices
{
  return self->_canSyncBetweenDevices;
}

- (void)setCanSyncBetweenDevices:(BOOL)a3
{
  self->_canSyncBetweenDevices = a3;
}

- (void)setSyncEngine:(id)a3
{
}

- (MTIDCloudKitLocalDB)localDB
{
  return self->_localDB;
}

- (void)setLocalDB:(id)a3
{
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (NSMutableDictionary)generatedDates
{
  return self->_generatedDates;
}

- (void)setGeneratedDates:(id)a3
{
}

- (MTIDCloudKitPromiseManager)promiseManager
{
  return self->_promiseManager;
}

- (void)setPromiseManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end