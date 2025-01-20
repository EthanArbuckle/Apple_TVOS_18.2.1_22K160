@interface IDSCloudKitKeyTransparencyStore
- (BOOL)cachedManateeAvailability;
- (BOOL)initializeKVS;
- (CKContainer)container;
- (CKRecordZone)cachedRecordZone;
- (CUTUnsafePromise)currentDeviceRecordsPromise;
- (IDSCloudKitKeyTransparencyDeviceRecord)lastSuccessfulUpsertDeviceRecord;
- (IDSCloudKitKeyTransparencyStore)initWithContainer:(id)a3 serverBag:(id)a4 kvStore:(id)a5 queue:(id)a6;
- (IDSCloudKitKeyTransparencyStore)initWithQueue:(id)a3;
- (IDSServerBag)serverBag;
- (NSUbiquitousKeyValueStore)kvStore;
- (OS_dispatch_queue)queue;
- (id)_clientErrorWithCode:(int64_t)a3 debugDescription:(id)a4 underlyingError:(id)a5;
- (id)_cloudKitRecordForDeviceRecord:(id)a3;
- (id)_deviceRecordForCloudKitRecord:(id)a3;
- (id)_no_timeout_no_cache_fetchKeyTransparencyDeviceRecords;
- (id)_recordIDForDeviceRecord:(id)a3;
- (id)_recordType;
- (id)_zoneID;
- (id)database;
- (id)fetchAllEntries;
- (id)fetchEntryForKey:(id)a3;
- (id)forceKVSSync;
- (void)_copyDeviceRecord:(id)a3 toCloudKitRecordRef:(id *)a4;
- (void)_createZoneIfNeededUsingTimeIntervalForRequest:(double)a3 isNonDiscretionary:(BOOL)a4 completion:(id)a5;
- (void)_no_timeout_fetchKeyTransparencyDeviceRecordsWithCompletion:(id)a3;
- (void)_no_timeout_nukeKeyTransparencyDeviceRecordsWithCompletion:(id)a3;
- (void)_no_timeout_upsertKeyTransparencyDeviceRecord:(id)a3 recordsToModify:(id)a4 recordsToDelete:(id)a5 completion:(id)a6;
- (void)_no_timeout_verifyEncryptionPrerequisitesWithCompletion:(id)a3;
- (void)deleteKeyTransparencyDeviceRecordsForPushToken:(id)a3 completion:(id)a4;
- (void)fetchAccountEligibilityForDeviceToDeviceEncryptionWithCompletion:(id)a3;
- (void)fetchKeyTransparencyDeviceRecordsWithCompletion:(id)a3;
- (void)handleKVSUpdate:(id)a3;
- (void)insertDictionary:(id)a3 forKey:(id)a4;
- (void)nukeKeyTransparencyDeviceRecordsWithCompletion:(id)a3;
- (void)removeAllEntries;
- (void)removeEntryForKey:(id)a3;
- (void)setCachedManateeAvailability:(BOOL)a3;
- (void)setCachedRecordZone:(id)a3;
- (void)setCurrentDeviceRecordsPromise:(id)a3;
- (void)setKvStore:(id)a3;
- (void)setLastSuccessfulUpsertDeviceRecord:(id)a3;
- (void)setupContainerCache;
- (void)systemDidLeaveFirstDataProtectionLock;
- (void)upsertKeyTransparencyDeviceRecord:(id)a3 recordsToModify:(id)a4 recordsToDelete:(id)a5 completion:(id)a6;
@end

@implementation IDSCloudKitKeyTransparencyStore

- (IDSCloudKitKeyTransparencyStore)initWithQueue:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
  unsigned __int8 v6 = [v5 isUnderFirstDataProtectionLock];

  if ((v6 & 1) != 0)
  {
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "We are under first data protection lock, we cannot initialize KVS.",  v15,  2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSCloudKitKeyTransparencyStoreErrorDomain",  -5002LL,  0LL));
    [v8 logResultForEvent:@"IDSKTKVSCreationMetric" hardFailure:0 result:v9];

    v10 = 0LL;
  }

  else
  {
    v10 = -[NSUbiquitousKeyValueStore initWithStoreIdentifier:type:]( objc_alloc(&OBJC_CLASS___NSUbiquitousKeyValueStore),  "initWithStoreIdentifier:type:",  @"com.apple.private.ids.kt-kvs",  2LL);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
    [v11 logSuccessForEventNamed:@"IDSKTKVSCreationMetric"];
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[IDSServerBag sharedInstanceForBagType:]( &OBJC_CLASS___IDSServerBag,  "sharedInstanceForBagType:",  0LL));
  v13 = -[IDSCloudKitKeyTransparencyStore initWithContainer:serverBag:kvStore:queue:]( self,  "initWithContainer:serverBag:kvStore:queue:",  0LL,  v12,  v10,  v4);

  return v13;
}

- (IDSCloudKitKeyTransparencyStore)initWithContainer:(id)a3 serverBag:(id)a4 kvStore:(id)a5 queue:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___IDSCloudKitKeyTransparencyStore;
  v15 = -[IDSCloudKitKeyTransparencyStore init](&v20, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_container, a3);
    objc_storeStrong((id *)&v16->_serverBag, a4);
    objc_storeStrong((id *)&v16->_kvStore, a5);
    objc_storeStrong((id *)&v16->_queue, a6);
    if (v16->_kvStore)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v17 addObserver:v16 selector:"handleKVSUpdate:" name:NSUbiquitousKeyValueStoreDidChangeExternallyNotification object:v16->_kvStore];
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
    [v18 addListener:v16];

    -[IDSCloudKitKeyTransparencyStore setupContainerCache](v16, "setupContainerCache");
  }

  return v16;
}

- (CKContainer)container
{
  container = self->_container;
  if (container)
  {
    v3 = container;
  }

  else
  {
    if (qword_1009BEA48 != -1) {
      dispatch_once(&qword_1009BEA48, &stru_1008FA9B8);
    }
    id v4 = (void *)qword_1009BEA40;
    if (!qword_1009BEA40)
    {
      v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        sub_10069B99C();
      }

      id v4 = (void *)qword_1009BEA40;
    }

    v3 = (CKContainer *)objc_claimAutoreleasedReturnValue( [v4 containerWithIdentifier:@"com.apple.private.ids.kt"]);
  }

  return v3;
}

- (void)systemDidLeaveFirstDataProtectionLock
{
  if (!self->_kvStore)
  {
    v3 = -[NSUbiquitousKeyValueStore initWithStoreIdentifier:type:]( objc_alloc(&OBJC_CLASS___NSUbiquitousKeyValueStore),  "initWithStoreIdentifier:type:",  @"com.apple.private.ids.kt-kvs",  2LL);
    kvStore = self->_kvStore;
    self->_kvStore = v3;

    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 addObserver:self selector:"handleKVSUpdate:" name:NSUbiquitousKeyValueStoreDidChangeExternallyNotification object:self->_kvStore];
  }

- (id)database
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore container](self, "container"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 privateCloudDatabase]);

  return v3;
}

- (id)_zoneID
{
  if (qword_1009BEA68 != -1) {
    dispatch_once(&qword_1009BEA68, &stru_1008FA9F8);
  }
  v2 = (void *)qword_1009BEA60;
  if (!qword_1009BEA60)
  {
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_10069BA18();
    }

    v2 = (void *)qword_1009BEA60;
  }

  id v4 = objc_alloc((Class)v2);
  if (qword_1009BEA38 != -1) {
    dispatch_once(&qword_1009BEA38, &stru_1008FA998);
  }
  return [v4 initWithZoneName:@"IDSKeyTransparencyDataZone" ownerName:qword_1009BEA30];
}

- (id)_recordType
{
  return @"IDSKeyTransparencyDeviceRecord";
}

- (id)_recordIDForDeviceRecord:(id)a3
{
  id v4 = a3;
  if (qword_1009BEA58 != -1) {
    dispatch_once(&qword_1009BEA58, &stru_1008FA9D8);
  }
  id v5 = (void *)qword_1009BEA50;
  if (!qword_1009BEA50)
  {
    unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_10069BA94();
    }

    id v5 = (void *)qword_1009BEA50;
  }

  id v7 = objc_alloc((Class)v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore _zoneID](self, "_zoneID"));
  id v10 = [v7 initWithRecordName:v8 zoneID:v9];

  return v10;
}

- (id)_clientErrorWithCode:(int64_t)a3 debugDescription:(id)a4 underlyingError:(id)a5
{
  unint64_t v7 = (unint64_t)a4;
  unint64_t v8 = (unint64_t)a5;
  if (v7 | v8)
  {
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v10 = v9;
    if (v7) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v7,  NSDebugDescriptionErrorKey);
    }
    if (v8) {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v8, NSUnderlyingErrorKey);
    }
  }

  else
  {
    id v10 = 0LL;
  }

  id v11 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"IDSCloudKitKeyTransparencyStoreErrorDomain",  a3,  v10);

  return v11;
}

- (id)_deviceRecordForCloudKitRecord:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 encryptedValues]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"IDSKTDevice"]);

  uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"IDSKTMetadata"]);
  unint64_t v7 = (void *)v6;
  if (v5 && v6)
  {
    unint64_t v8 = objc_alloc(&OBJC_CLASS___IDSCloudKitKeyTransparencyDeviceRecord);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v3 recordID]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 recordName]);
    id v11 = -[IDSCloudKitKeyTransparencyDeviceRecord initWithDeviceData:deviceMetadata:recordID:]( v8,  "initWithDeviceData:deviceMetadata:recordID:",  v5,  v7,  v10);
  }

  else
  {
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412802;
      id v15 = v3;
      __int16 v16 = 2112;
      v17 = v5;
      __int16 v18 = 2112;
      v19 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Unable to convert CloudKit record to device record {cloudKitRecord: %@, deviceData: %@, deviceMetadata: %@}",  (uint8_t *)&v14,  0x20u);
    }

    id v11 = 0LL;
  }

  return v11;
}

- (id)_cloudKitRecordForDeviceRecord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 deviceData]);
  if (v5
    && (uint64_t v6 = (void *)v5,
        unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceMetadata]),
        v7,
        v6,
        v7))
  {
    if (qword_1009BEA78 != -1) {
      dispatch_once(&qword_1009BEA78, &stru_1008FAA18);
    }
    unint64_t v8 = (void *)qword_1009BEA70;
    if (!qword_1009BEA70)
    {
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        sub_10069BB74();
      }

      unint64_t v8 = (void *)qword_1009BEA70;
    }

    id v10 = objc_alloc((Class)v8);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore _recordType](self, "_recordType"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore _recordIDForDeviceRecord:](self, "_recordIDForDeviceRecord:", v4));
    id v13 = [v10 initWithRecordType:v11 recordID:v12];

    id v22 = v13;
    -[IDSCloudKitKeyTransparencyStore _copyDeviceRecord:toCloudKitRecordRef:]( self,  "_copyDeviceRecord:toCloudKitRecordRef:",  v4,  &v22);
    id v14 = v22;
  }

  else
  {
    id v13 = (id)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
      sub_10069BB10((uint64_t)v4, (os_log_s *)v13, v15, v16, v17, v18, v19, v20);
    }
    id v14 = 0LL;
  }

  return v14;
}

- (void)_copyDeviceRecord:(id)a3 toCloudKitRecordRef:(id *)a4
{
  if (a4)
  {
    id v9 = *a4;
    id v5 = a3;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceData]);
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v9 encryptedValues]);
    [v7 setObject:v6 forKeyedSubscript:@"IDSKTDevice"];

    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceMetadata]);
    [v9 setObject:v8 forKeyedSubscript:@"IDSKTMetadata"];

    [v9 setObject:&off_100946CC0 forKeyedSubscript:@"IDSKTState"];
  }

- (void)_createZoneIfNeededUsingTimeIntervalForRequest:(double)a3 isNonDiscretionary:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  unint64_t v8 = (void (**)(id, void))a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore cachedRecordZone](self, "cachedRecordZone"));

  if (v9)
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore cachedRecordZone](self, "cachedRecordZone"));
      *(_DWORD *)buf = 138412290;
      id v36 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Cached record zone exists -- continuing without zone fetch {cachedRecordZone: %@}",  buf,  0xCu);
    }

    if (v8) {
      v8[2](v8, 0LL);
    }
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore _zoneID](self, "_zoneID"));
    if (qword_1009BEA98 != -1) {
      dispatch_once(&qword_1009BEA98, &stru_1008FAA58);
    }
    id v13 = (void *)qword_1009BEA90;
    if (!qword_1009BEA90)
    {
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        sub_10069BBF0();
      }

      id v13 = (void *)qword_1009BEA90;
    }

    id v15 = objc_alloc((Class)v13);
    v34 = v12;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v34, 1LL));
    id v17 = [v15 initWithRecordZoneIDs:v16];

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore container](self, "container"));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v17 configuration]);
    [v19 setContainer:v18];

    if (v5)
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v17 configuration]);
      [v20 setDiscretionaryNetworkBehavior:0];
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue([v17 configuration]);
    [v21 setTimeoutIntervalForRequest:a3];

    v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472LL;
    v27 = sub_100102A74;
    v28 = &unk_1008FA4E8;
    v29 = self;
    id v22 = v12;
    id v30 = v22;
    BOOL v33 = v5;
    double v32 = a3;
    v31 = v8;
    [v17 setFetchRecordZonesCompletionBlock:&v25];
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog KeyTransparency]( &OBJC_CLASS___IDSFoundationLog,  "KeyTransparency",  v25,  v26,  v27,  v28,  v29));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Starting CloudKit zone fetch {operation: %@}",  buf,  0xCu);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore database](self, "database"));
    [v24 addOperation:v17];
  }
}

- (void)setupContainerCache
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1001032CC;
  v2[3] = &unk_1008FA510;
  v2[4] = self;
  -[IDSCloudKitKeyTransparencyStore _no_timeout_verifyEncryptionPrerequisitesWithCompletion:]( self,  "_no_timeout_verifyEncryptionPrerequisitesWithCompletion:",  v2);
}

- (void)fetchAccountEligibilityForDeviceToDeviceEncryptionWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Determining account eligibility for device-to-device encryption",  buf,  2u);
  }

  v25[0] = 0LL;
  v25[1] = v25;
  v25[2] = 0x2020000000LL;
  char v26 = 0;
  *(void *)buf = 0LL;
  uint64_t v20 = buf;
  uint64_t v21 = 0x3032000000LL;
  id v22 = sub_100103584;
  v23 = sub_100103594;
  id v24 = 0LL;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10010359C;
  v18[3] = &unk_1008FA588;
  v18[4] = self;
  v18[5] = v25;
  v18[6] = buf;
  unint64_t v7 = objc_retainBlock(v18);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100103764;
  v14[3] = &unk_1008FA5D8;
  v14[4] = self;
  uint64_t v16 = buf;
  id v8 = v4;
  id v15 = v8;
  id v17 = v25;
  id v9 = objc_retainBlock(v14);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore serverBag](self, "serverBag"));
  double v11 = sub_100107FAC(v10, (uint64_t)@"ck-kt-account-timeout", 30.0);

  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v27 = 134217984;
    double v28 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Starting device-to-device encryption eligibility task with timeout {timeoutInSeconds: %f}",  v27,  0xCu);
  }

  dispatch_time_t v13 = dispatch_time(0LL, (uint64_t)(v11 * 1000000000.0));
  im_dispatch_async_with_timeout(v13, v7, v9, &stru_1008FA5F8);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v25, 8);
}

- (void)_no_timeout_verifyEncryptionPrerequisitesWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Starting CloudKit container account info fetch",  buf,  2u);
  }

  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore container](self, "container"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100103A30;
  v9[3] = &unk_1008FA620;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 accountInfoWithCompletionHandler:v9];
}

- (void)upsertKeyTransparencyDeviceRecord:(id)a3 recordsToModify:(id)a4 recordsToDelete:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (uint64_t (*)(uint64_t, uint64_t))a5;
  id v13 = a6;
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore queue](self, "queue"));
  dispatch_assert_queue_V2(v14);

  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    v41 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Upserting trusted device record { deviceRecord: %@ }, { recordsToModify: %@ }, { recordsToDelete: %@ }",  buf,  0x20u);
  }

  *(void *)buf = 0LL;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000LL;
  v41 = sub_100103584;
  v42 = sub_100103594;
  id v43 = 0LL;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100103F4C;
  v33[3] = &unk_1008FA698;
  v33[4] = self;
  id v16 = v10;
  id v34 = v16;
  id v17 = v11;
  id v35 = v17;
  uint64_t v18 = v12;
  id v36 = v18;
  v37 = buf;
  uint64_t v19 = objc_retainBlock(v33);
  char v26 = _NSConcreteStackBlock;
  uint64_t v27 = 3221225472LL;
  double v28 = sub_10010410C;
  v29 = &unk_1008FA6E8;
  id v30 = self;
  double v32 = buf;
  id v20 = v13;
  id v31 = v20;
  uint64_t v21 = objc_retainBlock(&v26);
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore serverBag](self, "serverBag", v26, v27, v28, v29, v30));
  double v23 = sub_100107FAC(v22, (uint64_t)@"ck-kt-upsert-timeout", 80.0);

  id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v38 = 134217984;
    double v39 = v23;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Starting trusted device upsert task with timeout {timeoutInSeconds: %f}",  v38,  0xCu);
  }

  dispatch_time_t v25 = dispatch_time(0LL, (uint64_t)(v23 * 1000000000.0));
  im_dispatch_async_with_timeout(v25, v19, v21, &stru_1008FA708);

  _Block_object_dispose(buf, 8);
}

- (void)_no_timeout_upsertKeyTransparencyDeviceRecord:(id)a3 recordsToModify:(id)a4 recordsToDelete:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void))a6;
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore queue](self, "queue"));
  dispatch_assert_queue_V2(v14);

  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[IDSCloudKitKeyTransparencyStore lastSuccessfulUpsertDeviceRecord]( self,  "lastSuccessfulUpsertDeviceRecord"));
  unsigned int v16 = [v15 isEqual:v10];

  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v18)
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Last known successful upsert device record is identical to the current request -- short-circuiting without perfo rming upsert {deviceRecord: %@}",  buf,  0xCu);
    }

    if (v13) {
      v13[2](v13, 0LL);
    }
  }

  else
  {
    if (v18)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Verifying encryption prerequisites for trusted device record upsert",  buf,  2u);
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore serverBag](self, "serverBag"));
    double v20 = sub_100107FAC(v19, (uint64_t)@"ck-kt-time-interval-for-requests", 60.0);

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore serverBag](self, "serverBag"));
    unsigned __int8 v22 = sub_100108014(v21, (id)1);

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10010452C;
    v23[3] = &unk_1008FA7D0;
    uint64_t v27 = v13;
    v23[4] = self;
    double v28 = v20;
    unsigned __int8 v29 = v22;
    id v24 = v10;
    id v25 = v11;
    id v26 = v12;
    -[IDSCloudKitKeyTransparencyStore _no_timeout_verifyEncryptionPrerequisitesWithCompletion:]( self,  "_no_timeout_verifyEncryptionPrerequisitesWithCompletion:",  v23);
  }
}

- (void)deleteKeyTransparencyDeviceRecordsForPushToken:(id)a3 completion:(id)a4
{
  unint64_t v7 = (void (**)(id, void *))a4;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if (v7)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[IDSCloudKitKeyTransparencyStore _clientErrorWithCode:debugDescription:underlyingError:]( self,  "_clientErrorWithCode:debugDescription:underlyingError:",  -2000LL,  @"Key transparency device record delete is not implemented",  0LL));
    v7[2](v7, v6);
  }
}

- (void)nukeKeyTransparencyDeviceRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Nuking key transparency device records",  buf,  2u);
  }

  *(void *)buf = 0LL;
  uint64_t v19 = buf;
  uint64_t v20 = 0x3032000000LL;
  uint64_t v21 = sub_100103584;
  unsigned __int8 v22 = sub_100103594;
  id v23 = 0LL;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100105128;
  v17[3] = &unk_1008F9E88;
  v17[4] = self;
  v17[5] = buf;
  unint64_t v7 = objc_retainBlock(v17);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100105294;
  v14[3] = &unk_1008FA6E8;
  v14[4] = self;
  unsigned int v16 = buf;
  id v8 = v4;
  id v15 = v8;
  id v9 = objc_retainBlock(v14);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore serverBag](self, "serverBag"));
  double v11 = sub_100107FAC(v10, (uint64_t)@"ck-kt-nuke-timeout", 80.0);

  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v24 = 134217984;
    double v25 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Starting key transparency device record nuke task with timeout {timeoutInSeconds: %f}",  v24,  0xCu);
  }

  dispatch_time_t v13 = dispatch_time(0LL, (uint64_t)(v11 * 1000000000.0));
  im_dispatch_async_with_timeout(v13, v7, v9, &stru_1008FA7F0);

  _Block_object_dispose(buf, 8);
}

- (void)_no_timeout_nukeKeyTransparencyDeviceRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore serverBag](self, "serverBag"));
  double v7 = sub_100107FAC(v6, (uint64_t)@"ck-kt-time-interval-for-requests", 60.0);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore serverBag](self, "serverBag"));
  unsigned int v9 = sub_100108014(v8, (id)1);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore _zoneID](self, "_zoneID"));
  double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Deleting zone {zoneID: %@}", buf, 0xCu);
  }

  id v12 = objc_alloc((Class)sub_100102F74());
  id v24 = v10;
  dispatch_time_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
  id v14 = [v12 initWithRecordZonesToSave:0 recordZoneIDsToDelete:v13];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore container](self, "container"));
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v14 configuration]);
  [v16 setContainer:v15];

  if (v9)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 configuration]);
    [v17 setDiscretionaryNetworkBehavior:0];
  }

  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v14 configuration]);
  [v18 setTimeoutIntervalForRequest:v7];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100105720;
  v22[3] = &unk_1008FA498;
  v22[4] = self;
  id v19 = v4;
  id v23 = v19;
  [v14 setModifyRecordZonesCompletionBlock:v22];
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Starting CloudKit operation to delete KT zone {operation: %@}",  buf,  0xCu);
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore database](self, "database"));
  [v21 addOperation:v14];
}

- (void)fetchKeyTransparencyDeviceRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Fetching key transparency device records",  buf,  2u);
  }

  *(void *)buf = 0LL;
  unsigned __int8 v22 = buf;
  uint64_t v23 = 0x3032000000LL;
  id v24 = sub_100103584;
  double v25 = sub_100103594;
  id v26 = 0LL;
  v19[0] = 0LL;
  v19[1] = v19;
  v19[2] = 0x3032000000LL;
  v19[3] = sub_100103584;
  v19[4] = sub_100103594;
  id v20 = 0LL;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100105C68;
  v18[3] = &unk_1008FA588;
  v18[4] = self;
  v18[5] = buf;
  v18[6] = v19;
  double v7 = objc_retainBlock(v18);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100105E1C;
  v14[3] = &unk_1008FA5D8;
  v14[4] = self;
  unsigned int v16 = v19;
  id v8 = v4;
  id v15 = v8;
  id v17 = buf;
  unsigned int v9 = objc_retainBlock(v14);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore serverBag](self, "serverBag"));
  double v11 = sub_100107FAC(v10, (uint64_t)@"ck-kt-fetch-timeout", 120.0);

  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v27 = 134217984;
    double v28 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Starting key transparency device record fetch task with timeout {timeoutInSeconds: %f}",  v27,  0xCu);
  }

  dispatch_time_t v13 = dispatch_time(0LL, (uint64_t)(v11 * 1000000000.0));
  im_dispatch_async_with_timeout(v13, v7, v9, &stru_1008FA838);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(buf, 8);
}

- (void)_no_timeout_fetchKeyTransparencyDeviceRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore currentDeviceRecordsPromise](self, "currentDeviceRecordsPromise"));
  if (v6
    && (double v7 = (void *)v6,
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore serverBag](self, "serverBag")),
        unsigned __int8 v9 = sub_100108014(v8, (id)1),
        v8,
        v7,
        (v9 & 1) != 0))
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      double v11 = (void *)objc_claimAutoreleasedReturnValue( -[IDSCloudKitKeyTransparencyStore currentDeviceRecordsPromise]( self,  "currentDeviceRecordsPromise"));
      *(_DWORD *)buf = 138412290;
      unsigned __int8 v29 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Cache hit for key transparency device records {promise: %@}",  buf,  0xCu);
    }
  }

  else
  {
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[IDSCloudKitKeyTransparencyStore currentDeviceRecordsPromise]( self,  "currentDeviceRecordsPromise"));
      *(_DWORD *)buf = 138412290;
      unsigned __int8 v29 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Cache miss for key transparency device records -- starting fetch {promise: %@}",  buf,  0xCu);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue( -[IDSCloudKitKeyTransparencyStore _no_timeout_no_cache_fetchKeyTransparencyDeviceRecords]( self,  "_no_timeout_no_cache_fetchKeyTransparencyDeviceRecords"));
    -[IDSCloudKitKeyTransparencyStore setCurrentDeviceRecordsPromise:](self, "setCurrentDeviceRecordsPromise:", v14);

    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( -[IDSCloudKitKeyTransparencyStore currentDeviceRecordsPromise]( self,  "currentDeviceRecordsPromise"));
      *(_DWORD *)buf = 138412290;
      unsigned __int8 v29 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Updated cached promise for key transparency device records {promise: %@}",  buf,  0xCu);
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore serverBag](self, "serverBag"));
    double v18 = sub_100107FAC(v17, (uint64_t)@"ck-kt-cache-ttl", 30.0);

    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue( -[IDSCloudKitKeyTransparencyStore currentDeviceRecordsPromise]( self,  "currentDeviceRecordsPromise"));
      *(_DWORD *)buf = 138412546;
      unsigned __int8 v29 = v20;
      __int16 v30 = 2048;
      double v31 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Setting timer to clean up cached promise for key transparency device records {promise: %@, cleanUpDelay: %f}",  buf,  0x16u);
    }

    dispatch_time_t v21 = dispatch_time(0LL, (uint64_t)(v18 * 1000000000.0));
    unsigned __int8 v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100106388;
    block[3] = &unk_1008F6010;
    block[4] = self;
    dispatch_after(v21, v22, block);
  }

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore currentDeviceRecordsPromise](self, "currentDeviceRecordsPromise"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100106458;
  void v25[3] = &unk_1008FA860;
  v25[4] = self;
  id v26 = v4;
  id v24 = v4;
  [v23 registerResultBlock:v25];
}

- (id)_no_timeout_no_cache_fetchKeyTransparencyDeviceRecords
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Verifying encryption prerequisites for trusted device records fetch",  buf,  2u);
  }

  id v5 = objc_alloc_init(&OBJC_CLASS___CUTUnsafePromiseSeal);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore serverBag](self, "serverBag"));
  double v7 = sub_100107FAC(v6, (uint64_t)@"ck-kt-time-interval-for-requests", 60.0);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore serverBag](self, "serverBag"));
  unsigned __int8 v9 = sub_100108014(v8, 0LL);

  dispatch_time_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  id v15 = sub_100106670;
  unsigned int v16 = &unk_1008FA950;
  id v17 = v5;
  double v18 = self;
  double v19 = v7;
  unsigned __int8 v20 = v9;
  id v10 = v5;
  -[IDSCloudKitKeyTransparencyStore _no_timeout_verifyEncryptionPrerequisitesWithCompletion:]( self,  "_no_timeout_verifyEncryptionPrerequisitesWithCompletion:",  &v13);
  double v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "promise", v13, v14, v15, v16));

  return v11;
}

- (void)handleKVSUpdate:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:NSUbiquitousKeyValueStoreChangeReasonKey]);
  id v5 = [v4 integerValue];
  if (v5 == (id)2)
  {
    double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received KVS Quota Violation Notification.",  buf,  2u);
    }

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
    v15[0] = @"KVSErrorDomain";
    v15[1] = @"KVSErrorCode";
    v16[0] = @"IDSCloudKitKeyTransparencyStoreErrorDomain";
    v16[1] = &off_100946CD8;
    v15[2] = @"KTVersion";
    uint64_t v12 = _IDSKeyTransparencyVersionNumber(v6, v8, v9, v10, v11);
    dispatch_time_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v16[2] = v13;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  3LL));
    [v6 logHardFailureForEventNamed:@"IDSKTKVSQuotaViolation" withAttributes:v14];

    goto LABEL_9;
  }

  if (v5 == (id)3)
  {
LABEL_4:
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v18 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v6,  OS_LOG_TYPE_DEFAULT,  "Received KVS update notification. {Reason: %@}",  buf,  0xCu);
    }

- (void)insertDictionary:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Inserting KVS entry {key: %@, value: %@}",  (uint8_t *)&v11,  0x16u);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore kvStore](self, "kvStore"));
  if (v9)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore kvStore](self, "kvStore"));
    [v10 setDictionary:v6 forKey:v7];
  }

  else
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
      sub_10069C18C();
    }
  }
}

- (void)removeEntryForKey:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Removing KVS entry {key: %@}",  (uint8_t *)&v8,  0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore kvStore](self, "kvStore"));
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore kvStore](self, "kvStore"));
    [v7 removeObjectForKey:v4];
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      sub_10069C18C();
    }
  }
}

- (id)fetchEntryForKey:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Fetching KVS entry. {key: %@}",  (uint8_t *)&v10,  0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore kvStore](self, "kvStore"));
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore kvStore](self, "kvStore"));
    int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v4]);
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      sub_10069C18C();
    }
    int v8 = &__NSDictionary0__struct;
  }

  return v8;
}

- (id)fetchAllEntries
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Fetching all entries from KVS.", v8, 2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore kvStore](self, "kvStore"));
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore kvStore](self, "kvStore"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dictionaryRepresentation]);
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      sub_10069C18C();
    }
    id v6 = &__NSDictionary0__struct;
  }

  return v6;
}

- (void)removeAllEntries
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Wiping all entries from KVS.", buf, 2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore kvStore](self, "kvStore"));
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore fetchAllEntries](self, "fetchAllEntries"));
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)i);
          id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore kvStore](self, "kvStore"));
          [v11 removeObjectForKey:v10];
        }

        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }

      while (v7);
    }
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      sub_10069C18C();
    }
  }
}

- (id)forceKVSSync
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Trying to force sync KVS.", buf, 2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore kvStore](self, "kvStore"));
  if (!v4)
  {
    __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10069C18C();
    }

    id v6 = @"KVS not yet loaded.";
    id v7 = self;
    uint64_t v8 = -5003LL;
    goto LABEL_13;
  }

  if (+[IMUserDefaults shouldForceFailKTKVSSync](&OBJC_CLASS___IMUserDefaults, "shouldForceFailKTKVSSync")
    && CUTIsInternalInstall())
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Default set to force fail sync KVS.", buf, 2u);
    }

    id v6 = @"Force failing sync KVS.";
    id v7 = self;
    uint64_t v8 = -7000LL;
LABEL_13:
    id v11 = (id)objc_claimAutoreleasedReturnValue( -[IDSCloudKitKeyTransparencyStore _clientErrorWithCode:debugDescription:underlyingError:]( v7,  "_clientErrorWithCode:debugDescription:underlyingError:",  v8,  v6,  0LL));
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( +[CUTUnsafePromise failedPromiseWithError:]( &OBJC_CLASS___CUTUnsafePromise,  "failedPromiseWithError:",  v11));
    goto LABEL_14;
  }

  id v9 = objc_alloc_init(&OBJC_CLASS___CUTUnsafePromiseSeal);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore kvStore](self, "kvStore"));
  __int128 v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  id v17 = sub_100107C60;
  double v18 = &unk_1008FA978;
  id v19 = v9;
  unsigned __int8 v20 = self;
  id v11 = v9;
  [v10 synchronizeWithCompletionHandler:&v15];

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "promise", v15, v16, v17, v18));
LABEL_14:

  return v12;
}

- (BOOL)initializeKVS
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore kvStore](self, "kvStore"));

  if (v3) {
    return 1;
  }
  id v4 = -[NSUbiquitousKeyValueStore initWithStoreIdentifier:type:]( objc_alloc(&OBJC_CLASS___NSUbiquitousKeyValueStore),  "initWithStoreIdentifier:type:",  @"com.apple.private.ids.kt-kvs",  2LL);
  -[IDSCloudKitKeyTransparencyStore setKvStore:](self, "setKvStore:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCloudKitKeyTransparencyStore kvStore](self, "kvStore"));
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 addObserver:self selector:"handleKVSUpdate:" name:NSUbiquitousKeyValueStoreDidChangeExternallyNotification object:self->_kvStore];

    return 1;
  }

  return 0;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)cachedManateeAvailability
{
  return self->_cachedManateeAvailability;
}

- (void)setCachedManateeAvailability:(BOOL)a3
{
  self->_cachedManateeAvailability = a3;
}

- (IDSServerBag)serverBag
{
  return self->_serverBag;
}

- (CKRecordZone)cachedRecordZone
{
  return self->_cachedRecordZone;
}

- (void)setCachedRecordZone:(id)a3
{
}

- (IDSCloudKitKeyTransparencyDeviceRecord)lastSuccessfulUpsertDeviceRecord
{
  return self->_lastSuccessfulUpsertDeviceRecord;
}

- (void)setLastSuccessfulUpsertDeviceRecord:(id)a3
{
}

- (CUTUnsafePromise)currentDeviceRecordsPromise
{
  return self->_currentDeviceRecordsPromise;
}

- (void)setCurrentDeviceRecordsPromise:(id)a3
{
}

- (NSUbiquitousKeyValueStore)kvStore
{
  return self->_kvStore;
}

- (void)setKvStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end