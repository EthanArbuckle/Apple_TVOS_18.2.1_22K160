@interface GEOPlaceDataLocalProxy
+ (GEOPlaceDataLocalProxy)shared;
- (GEOPlaceDataLocalProxy)init;
- (id)pdPlaceCache;
- (id)serviceRequester;
- (unint64_t)calculateFreeableSpaceSync;
- (unint64_t)shrinkBySizeSync:(unint64_t)a3;
- (void)_callHistoryRecentsClearedObserver:(id)a3;
- (void)_cleanupPendingRequestMananger;
- (void)_privacyAndLocationSettingsResetObserver:(id)a3;
- (void)_requestIdentifiersFromNetwork:(id)a3 resultProviderID:(int)a4 requestUUID:(id)a5 traits:(id)a6 auditToken:(id)a7 throttleToken:(id)a8 finished:(id)a9 error:(id)a10;
- (void)_resetRequestTimeout;
- (void)calculateFreeableSpaceWithHandler:(id)a3;
- (void)cancelRequest:(id)a3;
- (void)clearCache;
- (void)dealloc;
- (void)fetchAllCacheEntriesWithRequesterHandler:(id)a3;
- (void)performPlaceDataRequest:(id)a3 requestUUID:(id)a4 traits:(id)a5 cachePolicy:(unint64_t)a6 timeout:(double)a7 auditToken:(id)a8 throttleToken:(id)a9 requesterHandler:(id)a10;
- (void)registerCacheResult:(unsigned __int8)a3 forMapItem:(id)a4 cachedByteCount:(unint64_t)a5 forRequestType:(int)a6 auditToken:(id)a7;
- (void)requestIdentifiers:(id)a3 resultProviderID:(int)a4 requestUUID:(id)a5 traits:(id)a6 options:(unint64_t)a7 auditToken:(id)a8 throttleToken:(id)a9 requesterHandler:(id)a10;
- (void)requestPhoneNumbers:(id)a3 requestUUID:(id)a4 allowCellularDataForLookup:(BOOL)a5 traits:(id)a6 auditToken:(id)a7 throttleToken:(id)a8 requesterHandler:(id)a9;
- (void)shrinkBySize:(unint64_t)a3 finished:(id)a4;
- (void)startRequest:(id)a3 requestUUID:(id)a4 traits:(id)a5 timeout:(double)a6 auditToken:(id)a7 throttleToken:(id)a8 finished:(id)a9 error:(id)a10;
- (void)trackPlaceData:(id)a3;
@end

@implementation GEOPlaceDataLocalProxy

+ (GEOPlaceDataLocalProxy)shared
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100034184;
  block[3] = &unk_10005A948;
  block[4] = a1;
  if (qword_10006B0C0 != -1) {
    dispatch_once(&qword_10006B0C0, block);
  }
  return (GEOPlaceDataLocalProxy *)(id)qword_10006B0B8;
}

- (id)serviceRequester
{
  serviceRequester = self->_serviceRequester;
  if (serviceRequester) {
    return serviceRequester;
  }
  else {
    return (id)objc_claimAutoreleasedReturnValue( +[GEOPlaceDataRequester sharedInstance]( &OBJC_CLASS___GEOPlaceDataRequester,  "sharedInstance"));
  }
}

- (GEOPlaceDataLocalProxy)init
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___GEOPlaceDataLocalProxy;
  v2 = -[GEOPlaceDataLocalProxy init](&v19, "init");
  if (v2)
  {
    uint64_t v3 = geo_reentrant_isolater_create("GEOPlaceDataLocalProxy.accessSearialQueue");
    accessIsolater = v2->_accessIsolater;
    v2->_accessIsolater = (geo_reentrant_isolater *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  5LL));
    requestUUIDToRequesters = v2->_requestUUIDToRequesters;
    v2->_requestUUIDToRequesters = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  5LL));
    requestUUIDToRequests = v2->_requestUUIDToRequests;
    v2->_requestUUIDToRequests = (NSMutableDictionary *)v7;

    v9 = objc_alloc_init(&OBJC_CLASS____GEOPlaceDataPendingRequestManager);
    pendingRequestManager = v2->_pendingRequestManager;
    v2->_pendingRequestManager = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 addObserver:v2 selector:"_callHistoryRecentsClearedObserver:" name:kGEOCallHistoryRecentsClearedNotification object:0];

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 addObserver:v2 selector:"_privacyAndLocationSettingsResetObserver:" name:kGEOResetPrivacyWarningsNotification object:0];

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPrivacyManager sharedManager](&OBJC_CLASS___GEOPrivacyManager, "sharedManager"));
    unsigned int v14 = [v13 hasFiredCallHistoryRecentsClearedNotification];

    if (v14) {
      -[GEOPlaceDataLocalProxy _callHistoryRecentsClearedObserver:](v2, "_callHistoryRecentsClearedObserver:", 0LL);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPrivacyManager sharedManager](&OBJC_CLASS___GEOPrivacyManager, "sharedManager"));
    unsigned int v16 = [v15 hasFiredResetPrivacyWarningsNotification];

    if (v16) {
      -[GEOPlaceDataLocalProxy _privacyAndLocationSettingsResetObserver:]( v2,  "_privacyAndLocationSettingsResetObserver:",  0LL);
    }
    v17 = v2;
  }

  return v2;
}

- (void)dealloc
{
  requestTimeoutTimer = self->_requestTimeoutTimer;
  if (requestTimeoutTimer)
  {
    dispatch_source_set_timer((dispatch_source_t)requestTimeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    dispatch_source_set_event_handler((dispatch_source_t)self->_requestTimeoutTimer, &stru_10005A968);
    v4 = self->_requestTimeoutTimer;
    self->_requestTimeoutTimer = 0LL;
  }

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_requestUUIDToRequests, "allKeys"));
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOPlaceDataLocalProxy cancelRequest:]( self,  "cancelRequest:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)v9));
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  -[GEOPlaceDataLocalProxy _cleanupPendingRequestMananger](self, "_cleanupPendingRequestMananger");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v10 removeObserver:self];

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___GEOPlaceDataLocalProxy;
  -[GEOPlaceDataLocalProxy dealloc](&v11, "dealloc");
}

- (id)pdPlaceCache
{
  pdPlaceCache = self->_pdPlaceCache;
  if (!pdPlaceCache)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFilePaths pathFor:](&OBJC_CLASS___GEOFilePaths, "pathFor:", 32790LL));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFilePaths pathFor:](&OBJC_CLASS___GEOFilePaths, "pathFor:", 22LL));
    +[GEOSQLiteDB migrateAllDBFilesFrom:to:](&OBJC_CLASS___GEOSQLiteDB, "migrateAllDBFilesFrom:to:", v4, v5);
    id v6 = -[GEOPDPlaceCache initWithCacheFilePath:schedulingDelegate:manifestInfoProvider:]( objc_alloc(&OBJC_CLASS___GEOPDPlaceCache),  "initWithCacheFilePath:schedulingDelegate:manifestInfoProvider:",  v5,  0LL,  0LL);
    id v7 = self->_pdPlaceCache;
    self->_pdPlaceCache = v6;

    pdPlaceCache = self->_pdPlaceCache;
  }

  return pdPlaceCache;
}

- (void)registerCacheResult:(unsigned __int8)a3 forMapItem:(id)a4 cachedByteCount:(unint64_t)a5 forRequestType:(int)a6 auditToken:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  uint64_t v8 = a3;
  uint64_t v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(a7, "bundleId", a3, a4, a5));
  v10 = (void *)v9;
  objc_super v11 = @"<unknown>";
  if (v9) {
    objc_super v11 = (__CFString *)v9;
  }
  __int128 v12 = v11;

  id v14 = (id)objc_claimAutoreleasedReturnValue(+[GEORequestCounter sharedCounter](&OBJC_CLASS___GEORequestCounter, "sharedCounter"));
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v14 placeCacheRegisterCacheResult:v8 forApp:v12 requestType:v7 timestamp:v13];
}

- (void)_cleanupPendingRequestMananger
{
  accessIsolater = self->_accessIsolater;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100034674;
  v3[3] = &unk_100059190;
  v3[4] = self;
  geo_reentrant_isolate_sync(accessIsolater, v3);
}

- (void)_resetRequestTimeout
{
  accessIsolater = self->_accessIsolater;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000346D8;
  v3[3] = &unk_100059190;
  v3[4] = self;
  geo_reentrant_isolate_sync(accessIsolater, v3);
}

- (void)startRequest:(id)a3 requestUUID:(id)a4 traits:(id)a5 timeout:(double)a6 auditToken:(id)a7 throttleToken:(id)a8 finished:(id)a9 error:(id)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a9;
  id v20 = a10;
  id v21 = a8;
  id v22 = a7;
  id v23 = a5;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlaceDataLocalProxy serviceRequester](self, "serviceRequester"));
  accessIsolater = self->_accessIsolater;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_100034A28;
  v36[3] = &unk_100059D78;
  v36[4] = self;
  id v26 = v18;
  id v37 = v26;
  id v38 = v24;
  id v39 = v17;
  id v27 = v17;
  id v28 = v24;
  geo_reentrant_isolate_sync_data(accessIsolater, v36);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_100034A60;
  v32[3] = &unk_10005A990;
  v32[4] = self;
  id v33 = v26;
  id v34 = v20;
  id v35 = v19;
  id v29 = v19;
  id v30 = v20;
  id v31 = v26;
  [v28 startWithRequest:v27 traits:v23 timeout:v22 auditToken:v21 throttleToken:v32 completionHandler:a6];
}

- (void)cancelRequest:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  v24 = sub_100034C88;
  v25 = sub_100034C98;
  id v26 = 0LL;
  uint64_t v15 = 0LL;
  unsigned int v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = sub_100034C88;
  id v19 = sub_100034C98;
  id v20 = 0LL;
  accessIsolater = self->_accessIsolater;
  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  uint64_t v9 = sub_100034CA0;
  v10 = &unk_10005A7D8;
  __int128 v13 = &v21;
  objc_super v11 = self;
  id v6 = v4;
  id v12 = v6;
  id v14 = &v15;
  geo_reentrant_isolate_sync_data(accessIsolater, &v7);
  objc_msgSend((id)v22[5], "cancelRequest:", v16[5], v7, v8, v9, v10, v11);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
}

- (void)requestIdentifiers:(id)a3 resultProviderID:(int)a4 requestUUID:(id)a5 traits:(id)a6 options:(unint64_t)a7 auditToken:(id)a8 throttleToken:(id)a9 requesterHandler:(id)a10
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  accessIsolater = self->_accessIsolater;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_10003556C;
  v30[3] = &unk_10005AA80;
  unint64_t v38 = a7;
  SEL v39 = a2;
  id v36 = v20;
  id v37 = v21;
  id v31 = v16;
  id v32 = v18;
  id v33 = self;
  id v34 = v19;
  int v40 = a4;
  id v35 = v17;
  id v22 = v20;
  id v23 = v17;
  id v24 = v19;
  id v25 = v18;
  id v26 = v21;
  id v29 = v16;
  geo_reentrant_isolate_sync(accessIsolater, v30);
}

- (void)_requestIdentifiersFromNetwork:(id)a3 resultProviderID:(int)a4 requestUUID:(id)a5 traits:(id)a6 auditToken:(id)a7 throttleToken:(id)a8 finished:(id)a9 error:(id)a10
{
  uint64_t v14 = *(void *)&a4;
  id v16 = a3;
  id v17 = a6;
  id v18 = a9;
  id v19 = a10;
  id v20 = a8;
  id v21 = a7;
  id v22 = a5;
  id v23 = [[GEOPDPlaceRequest alloc] initWithIdentifiers:v16 resultProviderID:v14 traits:v17];
  [v23 clearSensitiveFields:0];
  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPlaceDataLocalProxy");
  id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    id v33 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEBUG,  "Making request for identifiers: %{private}@",  buf,  0xCu);
  }

  double v26 = GEODataRequestTimeout(0x1700000300LL);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100036C60;
  v29[3] = &unk_10005AAA8;
  id v30 = v18;
  id v31 = v19;
  id v27 = v19;
  id v28 = v18;
  -[GEOPlaceDataLocalProxy startRequest:requestUUID:traits:timeout:auditToken:throttleToken:finished:error:]( self,  "startRequest:requestUUID:traits:timeout:auditToken:throttleToken:finished:error:",  v23,  v22,  v17,  v21,  v20,  v29,  v26,  v27);

  -[GEOPlaceDataLocalProxy _resetRequestTimeout](self, "_resetRequestTimeout");
}

- (void)requestPhoneNumbers:(id)a3 requestUUID:(id)a4 allowCellularDataForLookup:(BOOL)a5 traits:(id)a6 auditToken:(id)a7 throttleToken:(id)a8 requesterHandler:(id)a9
{
  BOOL v12 = a5;
  id v16 = a3;
  id v47 = a4;
  id v17 = a6;
  id v48 = a7;
  id v49 = a8;
  id v18 = a9;
  id v19 = (void (**)(void, void, void))v18;
  if (!v16)
  {
    uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPlaceDataLocalProxy");
    id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      id v33 = NSStringFromSelector(a2);
      id v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v34;
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = "nil == phoneNumbers";
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", buf, 0x16u);
    }

    goto LABEL_21;
  }

  if (!v18)
  {
    uint64_t v35 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPlaceDataLocalProxy");
    id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      id v36 = NSStringFromSelector(a2);
      id v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v37;
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = "nil == requesterHandler";
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", buf, 0x16u);
    }

    goto LABEL_21;
  }

  if (!v17)
  {
    uint64_t v38 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPlaceDataLocalProxy");
    id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      SEL v39 = NSStringFromSelector(a2);
      int v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v40;
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = "nil == traits";
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", buf, 0x16u);
    }

- (void)fetchAllCacheEntriesWithRequesterHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlaceDataLocalProxy pdPlaceCache](self, "pdPlaceCache"));
  if (v5)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100037984;
    v10[3] = &unk_10005AB48;
    id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000379E0;
    v7[3] = &unk_100059750;
    id v8 = v11;
    id v9 = v4;
    id v6 = v11;
    [v5 iterateAllPlacesWithBlock:v10 finishedBlock:v7];
  }

  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0LL, 0LL);
  }
}

- (void)trackPlaceData:(id)a3
{
  id v4 = a3;
  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPlaceDataLocalProxy");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 compactDebugDescription]);
    int v9 = 138477827;
    v10 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "Tracking place data: %{private}@",  (uint8_t *)&v9,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlaceDataLocalProxy pdPlaceCache](self, "pdPlaceCache"));
  [v8 trackPlace:v4];
}

- (void)performPlaceDataRequest:(id)a3 requestUUID:(id)a4 traits:(id)a5 cachePolicy:(unint64_t)a6 timeout:(double)a7 auditToken:(id)a8 throttleToken:(id)a9 requesterHandler:(id)a10
{
  id v17 = a3;
  id v57 = a4;
  id v58 = a5;
  id v18 = a8;
  id v59 = a9;
  id v19 = (void (**)(id, void, id))a10;
  uint64_t v20 = DefaultLoggingSubsystem;
  uint64_t v21 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPlaceDataLocalProxy");
  id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v23 = _GEOLogPBCodableData(v17);
    id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    id v25 = v22;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68157955;
      *(_DWORD *)&uint8_t buf[4] = [v24 length];
      LOWORD(v81) = 2097;
      *(void *)((char *)&v81 + 2) = [v24 bytes];
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEBUG,  "Received request: %{private,geo:PBCodable}.*P",  buf,  0x12u);
    }
  }

  if (a6 == 4 || a6 == 1)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](&OBJC_CLASS___GEOPlatform, "sharedPlatform"));
    if (![v22 isInternalInstall])
    {
      id v28 = 0LL;
LABEL_12:

      goto LABEL_13;
    }
  }

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v17 requestedComponents]);
  id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v26));
  id v28 = (void *)objc_claimAutoreleasedReturnValue( +[GEOPDPlace componentTypesFromComponentInfos:]( &OBJC_CLASS___GEOPDPlace,  "componentTypesFromComponentInfos:",  v27));

  if (a6 == 4 || a6 == 1) {
    goto LABEL_12;
  }
LABEL_13:
  if (a6 != 1 && a6 != 4)
  {
    uint64_t v74 = 0LL;
    v75 = &v74;
    uint64_t v76 = 0x2020000000LL;
    char v77 = 0;
    *(void *)buf = 0LL;
    *(void *)&__int128 v81 = buf;
    *((void *)&v81 + 1) = 0x3032000000LL;
    v82 = sub_100034C88;
    v83 = sub_100034C98;
    id v84 = 0LL;
    uint64_t v70 = 0LL;
    v71 = &v70;
    uint64_t v72 = 0x2020000000LL;
    uint64_t v73 = 0LL;
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v17 handleData]);

    if (v29)
    {
      id v30 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlaceDataLocalProxy pdPlaceCache](self, "pdPlaceCache"));
      id v31 = (void *)objc_claimAutoreleasedReturnValue([v17 handleData]);
      v69[0] = _NSConcreteStackBlock;
      v69[1] = 3221225472LL;
      v69[2] = sub_1000383DC;
      v69[3] = &unk_100059548;
      v69[4] = buf;
      v69[5] = &v74;
      v69[6] = &v70;
      [v30 lookupPlaceByHandle:v31 allowExpired:0 resultBlock:v69];

      [v17 setHandleData:0];
    }

    id v32 = *(void **)(v81 + 40);
    if (!v32)
    {
      id v33 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlaceDataLocalProxy pdPlaceCache](self, "pdPlaceCache"));
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472LL;
      v68[2] = sub_100038438;
      v68[3] = &unk_100059548;
      v68[4] = buf;
      v68[5] = &v74;
      v68[6] = &v70;
      [v33 lookupPlaceByRequest:v17 allowExpired:0 resultBlock:v68];

      id v32 = *(void **)(v81 + 40);
    }

    if ([v32 nilPlace])
    {
      uint64_t v34 = GEOFindOrCreateLog(v20, "GEOPlaceDataLocalProxy");
      uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v78 = 0;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "Negative cached place", v78, 2u);
      }

      id v36 = (id)objc_claimAutoreleasedReturnValue(+[NSError GEOErrorWithCode:](&OBJC_CLASS___NSError, "GEOErrorWithCode:", -8LL));
      v19[2](v19, 0LL, v36);
    }

    else
    {
      uint64_t v38 = *(void **)(v81 + 40);
      if (v38 && ([v38 hasExpectedComponentTypes:v28] & 1) == 0)
      {
        uint64_t v39 = GEOFindOrCreateLog(v20, "GEOPlaceDataLocalProxy");
        int v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v78 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEBUG,  "Cached place does not have all expected components, ignoring cache",  v78,  2u);
        }

        uint64_t v41 = *(void **)(v81 + 40);
        *(void *)(v81 + 40) = 0LL;
      }

      if (*(void *)(v81 + 40))
      {
        id v42 = objc_alloc(&OBJC_CLASS___GEOPDPlaceResponse);
        id v36 = objc_msgSend( v42,  "initWithPlace:forRequestType:",  *(void *)(v81 + 40),  objc_msgSend(v17, "requestType"));
        ((void (**)(id, id, id))v19)[2](v19, v36, 0LL);

        uint64_t v43 = GEOFindOrCreateLog(v20, "GEOPlaceDataLocalProxy");
        v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v78 = 134217984;
          *(void *)v79 = v36;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "Response from the cache: %p", v78, 0xCu);
        }

        uint64_t v45 = v71[3];
        if (*((_BYTE *)v75 + 24))
        {
          -[GEOPlaceDataLocalProxy registerCacheResult:forMapItem:cachedByteCount:forRequestType:auditToken:]( self,  "registerCacheResult:forMapItem:cachedByteCount:forRequestType:auditToken:",  3,  0,  v45,  [v17 requestType],  v18);
          id v19 = 0LL;
          char v37 = 1;
        }

        else
        {
          -[GEOPlaceDataLocalProxy registerCacheResult:forMapItem:cachedByteCount:forRequestType:auditToken:]( self,  "registerCacheResult:forMapItem:cachedByteCount:forRequestType:auditToken:",  1,  0,  v45,  [v17 requestType],  v18);
          char v37 = 0;
          id v19 = 0LL;
        }

        goto LABEL_41;
      }

      -[GEOPlaceDataLocalProxy registerCacheResult:forMapItem:cachedByteCount:forRequestType:auditToken:]( self,  "registerCacheResult:forMapItem:cachedByteCount:forRequestType:auditToken:",  2,  0,  v71[3],  [v17 requestType],  v18);
      uint64_t v46 = GEOFindOrCreateLog(v20, "GEOPlaceDataLocalProxy");
      id v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled((os_log_t)v47, OS_LOG_TYPE_DEBUG))
      {
        id v48 = (void *)objc_claimAutoreleasedReturnValue([v17 placeRequestParameters]);
        uint64_t v49 = _GEOLogPBCodableData(v48);
        id v56 = (id)objc_claimAutoreleasedReturnValue(v49);

        v50 = v47;
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          log = v50;
          unsigned int v51 = [v56 length];
          id v52 = [v56 bytes];
          *(_DWORD *)v78 = 68157955;
          *(_DWORD *)v79 = v51;
          *(_WORD *)&v79[4] = 2097;
          *(void *)&v79[6] = v52;
          v50 = log;
          _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Did not find in cache for request: %{private,geo:PBCodable}.*P",  v78,  0x12u);
        }
      }

      if (a6 != 3)
      {
        char v37 = 1;
LABEL_42:
        _Block_object_dispose(&v70, 8);
        _Block_object_dispose(buf, 8);

        _Block_object_dispose(&v74, 8);
        if ((v37 & 1) == 0) {
          goto LABEL_46;
        }
        goto LABEL_43;
      }

      id v36 = (id)objc_claimAutoreleasedReturnValue(+[NSError GEOErrorWithCode:](&OBJC_CLASS___NSError, "GEOErrorWithCode:", -21LL));
      v19[2](v19, 0LL, v36);
    }

    char v37 = 0;
LABEL_41:

    goto LABEL_42;
  }

- (void)calculateFreeableSpaceWithHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlaceDataLocalProxy pdPlaceCache](self, "pdPlaceCache"));
  id v6 = v5;
  if (v5) {
    [v5 calculateFreeableSpaceWithHandler:v4];
  }
  else {
    v4[2](v4, 0LL);
  }
}

- (void)shrinkBySize:(unint64_t)a3 finished:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlaceDataLocalProxy pdPlaceCache](self, "pdPlaceCache"));
  id v8 = v7;
  if (v7) {
    [v7 shrinkBySize:a3 finished:v6];
  }
  else {
    v6[2](v6, 0LL);
  }
}

- (unint64_t)calculateFreeableSpaceSync
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlaceDataLocalProxy pdPlaceCache](self, "pdPlaceCache"));
  id v3 = [v2 calculateFreeableSpaceSync];

  return (unint64_t)v3;
}

- (unint64_t)shrinkBySizeSync:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlaceDataLocalProxy pdPlaceCache](self, "pdPlaceCache"));
  id v5 = [v4 shrinkBySizeSync:a3];

  return (unint64_t)v5;
}

- (void)clearCache
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[GEOPlaceDataLocalProxy pdPlaceCache](self, "pdPlaceCache"));
  [v2 evictAllEntries];
}

- (void)_callHistoryRecentsClearedObserver:(id)a3
{
  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPlaceDataLocalProxy");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Received notification indicating phone recents were cleared.",  v7,  2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlaceDataLocalProxy pdPlaceCache](self, "pdPlaceCache"));
  [v6 deletePhoneNumberMapping];
}

- (void)_privacyAndLocationSettingsResetObserver:(id)a3
{
  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPlaceDataLocalProxy");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "User did reset privacy and location settings",  v7,  2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlaceDataLocalProxy pdPlaceCache](self, "pdPlaceCache"));
  [v6 deletePhoneNumberMapping];

  -[GEOPlaceDataLocalProxy clearCache](self, "clearCache");
}

- (void).cxx_destruct
{
}

@end