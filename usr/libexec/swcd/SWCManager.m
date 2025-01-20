@interface SWCManager
+ (id)beginListening;
+ (id)new;
- (BOOL)_addJSONDataInDictionary:(id)a3 toStagingDirectoryAtURL:(id)a4 error:(id *)a5;
- (BOOL)_connectionIsEntitled:(id)a3 forMutation:(BOOL)a4;
- (BOOL)_connectionMayConnect:(id)a3;
- (BOOL)_copyStagingDirectoryAtURL:(id)a3 toAdditionalServiceDetailsDirectoriesForApplicationIdentifiers:(id)a4 error:(id *)a5;
- (BOOL)_isDeveloperModeEnabled;
- (BOOL)_setDeveloperModeEnabled:(BOOL)a3 error:(id *)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (SWCDatabase)database;
- (SWCDownloadScheduler)downloadScheduler;
- (SWCDownloader)downloader;
- (SWCManager)init;
- (SWCManager)initWithDatabase:(id)a3;
- (id).cxx_construct;
- (id)_createStagingDirectoryForAdditionalServiceDetailsReturningError:(id *)a3;
- (id)_developerModeSemaphoreURL;
- (id)_entriesWithServiceSpecifier:(id)a3 URL:(id)a4 limit:(unint64_t)a5 auditToken:(id *)a6;
- (id)_filterApplicationIdentifiers:(id)a3 toMatchEntitlementOfXPCConnection:(id)a4;
- (id)_serviceDetailsWithEntry:(id)a3;
- (void)_addEntriesForAllBundlesWithEnumerator:(id)a3 toWorkingSet:(id)a4 enterpriseContext:(id)a5 developerModeEnabled:(BOOL)a6;
- (void)_authorizeDeveloperModeChangeWithCompletionHandler:(id)a3;
- (void)_updateAllEntries:(id)a3;
- (void)_waitForSiteApprovalWithServiceSpecifier:(id)a3 completionHandler:(id)a4;
- (void)addAllAppsWithCompletionHandler:(id)a3;
- (void)addServiceWithServiceSpecifier:(id)a3 completionHandler:(id)a4;
- (void)commitServiceSettings:(id)a3 completionHandler:(id)a4;
- (void)downloader:(id)a3 didDownloadAASAFileContainingJSONObject:(id)a4 fromDomain:(id)a5 downloadRoute:(unsigned __int8)a6;
- (void)downloader:(id)a3 failedToDownloadAASAFileFromDomain:(id)a4 error:(id)a5;
- (void)downloader:(id)a3 willDownloadAASAFileFromDomain:(id)a4;
- (void)getDetailsWithServiceSpecifier:(id)a3 URL:(id)a4 limit:(unint64_t)a5 callerAuditToken:(id)a6 completionHandler:(id)a7;
- (void)getDeveloperModeEnabledWithCompletionHandler:(id)a3;
- (void)getServiceSettingsWithServiceSpecifier:(id)a3 completionHandler:(id)a4;
- (void)getTrackingDomains:(id)a3 sources:(unint64_t)a4 completionHandler:(id)a5;
- (void)receiveSIGTERMSignal;
- (void)removeServiceWithServiceSpecifier:(id)a3 completionHandler:(id)a4;
- (void)removeSettingsForKeys:(id)a3 serviceSpecifier:(id)a4 completionHandler:(id)a5;
- (void)removeSettingsForKeys:(id)a3 serviceType:(id)a4 completionHandler:(id)a5;
- (void)resetWithCompletionHandler:(id)a3;
- (void)setAdditionalServiceDetailsForApplicationIdentifiers:(id)a3 usingContentsOfDictionary:(id)a4 completionHandler:(id)a5;
- (void)setDetails:(id)a3 forServiceWithServiceSpecifier:(id)a4 completionHandler:(id)a5;
- (void)setDeveloperModeEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)setUserApprovalState:(unsigned __int8)a3 forServiceWithServiceSpecifier:(id)a4 completionHandler:(id)a5;
- (void)showWithVerbosity:(unsigned __int8)a3 isTTY:(BOOL)a4 fileDescriptor:(id)a5 completionHandler:(id)a6;
- (void)updateEntriesForAllBundlesIgnoringCurrentState:(BOOL)a3;
- (void)waitForSiteApprovalWithServiceSpecifier:(id)a3 completionHandler:(id)a4;
@end

@implementation SWCManager

- (SWCManager)initWithDatabase:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SWCManager;
  v6 = -[SWCManager init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_database, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___SWCDownloader);
    downloader = v7->_downloader;
    v7->_downloader = v8;

    -[SWCDownloader setDelegate:](v7->_downloader, "setDelegate:", v7);
    v10 = -[SWCDownloadScheduler initWithDownloader:database:]( objc_alloc(&OBJC_CLASS___SWCDownloadScheduler),  "initWithDownloader:database:",  v7->_downloader,  v7->_database);
    downloadScheduler = v7->_downloadScheduler;
    v7->_downloadScheduler = v10;
  }

  return v7;
}

+ (id)new
{
}

- (SWCManager)init
{
}

+ (id)beginListening
{
  if (qword_100037210 != -1) {
    dispatch_once(&qword_100037210, &stru_100030DE8);
  }
  return (id)qword_100037208;
}

- (void)receiveSIGTERMSignal
{
}

- (void)updateEntriesForAllBundlesIgnoringCurrentState:(BOOL)a3
{
  BOOL v3 = a3;
  v31 = (void *)os_transaction_create("com.apple.swc.enumerate-apps");
  id v5 = objc_autoreleasePoolPush();
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  id v32 = 0LL;
  [v6 getKnowledgeUUID:0 andSequenceNumber:&v32];
  id v7 = v32;

  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[SWCDatabase launchServicesDatabaseGeneration](self->_database, "launchServicesDatabaseGeneration"));
  v9 = (void *)v8;
  if (v7 && v8 && (objc_msgSend(v7, "isEqual:", v8, v31) & 1) != 0)
  {
    if (qword_100037220 != -1) {
      dispatch_once(&qword_100037220, &stru_100031160);
    }
    v10 = (os_log_s *)qword_100037218;
    if (os_log_type_enabled((os_log_t)qword_100037218, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v34 = (uint64_t)v7;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "LS database generation is still %{public}@. No need to synchronize the SWC database to it.",  buf,  0xCu);
    }

    int v11 = 0;
  }

  else
  {
    if (qword_100037220 != -1) {
      dispatch_once(&qword_100037220, &stru_100031160);
    }
    v12 = (os_log_s *)qword_100037218;
    if (os_log_type_enabled((os_log_t)qword_100037218, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v34 = (uint64_t)v9;
      __int16 v35 = 2114;
      uint64_t v36 = (uint64_t)v7;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "LS database generation has changed %{public}@ to %{public}@. Synchronizing SWC database to it.",  buf,  0x16u);
    }

    int v11 = 1;
  }

  objc_super v13 = objc_alloc_init(&OBJC_CLASS___SWCEnterpriseContext);
  uint64_t v14 = objc_claimAutoreleasedReturnValue(-[SWCEnterpriseContext state](v13, "state"));
  uint64_t v15 = objc_claimAutoreleasedReturnValue(-[SWCDatabase enterpriseState](self->_database, "enterpriseState"));
  v16 = (void *)v15;
  if (!(v14 | v15))
  {
    if (qword_100037220 != -1) {
      dispatch_once(&qword_100037220, &stru_100031160);
    }
    uint64_t v21 = qword_100037218;
    if (!os_log_type_enabled((os_log_t)qword_100037218, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_25;
    }
    *(_WORD *)buf = 0;
    v18 = "Enterprise state is still nil. No need to synchronize the SWC database to it.";
    v19 = (os_log_s *)v21;
    uint32_t v20 = 2;
    goto LABEL_44;
  }

  if (v14 && v15 && ([(id)v14 isEqual:v15] & 1) != 0)
  {
    if (qword_100037220 != -1) {
      dispatch_once(&qword_100037220, &stru_100031160);
    }
    uint64_t v17 = qword_100037218;
    if (!os_log_type_enabled((os_log_t)qword_100037218, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_25;
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = v14;
    v18 = "Enterprise state is still %{public}@. No need to synchronize the SWC database to it.";
    v19 = (os_log_s *)v17;
    uint32_t v20 = 12;
LABEL_44:
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, v18, buf, v20);
LABEL_25:
    int v22 = 0;
    goto LABEL_31;
  }

  if (qword_100037220 != -1) {
    dispatch_once(&qword_100037220, &stru_100031160);
  }
  v23 = (os_log_s *)qword_100037218;
  if (os_log_type_enabled((os_log_t)qword_100037218, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v34 = (uint64_t)v16;
    __int16 v35 = 2114;
    uint64_t v36 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Enterprise state has changed %{public}@ to %{public}@. Synchronizing SWC database to it.",  buf,  0x16u);
  }

  int v22 = 1;
LABEL_31:

  if (v3)
  {
    if (qword_100037220 != -1) {
      dispatch_once(&qword_100037220, &stru_100031160);
    }
    v24 = (os_log_s *)qword_100037218;
    if (os_log_type_enabled((os_log_t)qword_100037218, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Was asked to resynchronize the entire SWC database regardless of current state.",  buf,  2u);
    }
  }

  else if ((v11 | v22) != 1)
  {
    goto LABEL_42;
  }

  v25 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  BOOL v26 = -[SWCManager _isDeveloperModeEnabled](self, "_isDeveloperModeEnabled");
  if (qword_100037220 != -1) {
    dispatch_once(&qword_100037220, &stru_100031160);
  }
  v27 = (os_log_s *)qword_100037218;
  if (os_log_type_enabled((os_log_t)qword_100037218, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v34) = v26;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Developer mode enabled: %{BOOL}i", buf, 8u);
  }

  v28 = objc_autoreleasePoolPush();
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationRecord enumeratorWithOptions:]( &OBJC_CLASS___LSApplicationRecord,  "enumeratorWithOptions:",  0LL));
  [v29 setErrorHandler:&stru_100030E28];
  -[SWCManager _addEntriesForAllBundlesWithEnumerator:toWorkingSet:enterpriseContext:developerModeEnabled:]( self,  "_addEntriesForAllBundlesWithEnumerator:toWorkingSet:enterpriseContext:developerModeEnabled:",  v29,  v25,  v13,  v26);

  objc_autoreleasePoolPop(v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  [v30 _LSClearSchemaCaches];

  -[SWCManager _updateAllEntries:](self, "_updateAllEntries:", v25);
  -[SWCDatabase setLaunchServicesDatabaseGeneration:](self->_database, "setLaunchServicesDatabaseGeneration:", v7);
  -[SWCDatabase setEnterpriseState:](self->_database, "setEnterpriseState:", v14);

LABEL_42:
  objc_autoreleasePoolPop(v5);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  BOOL v6 = -[SWCManager _connectionMayConnect:](self, "_connectionMayConnect:", v5);
  if (v6)
  {
    if (qword_100037220 != -1) {
      dispatch_once(&qword_100037220, &stru_100031160);
    }
    id v7 = (os_log_s *)(id)qword_100037218;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(location[0]) = 134217984;
      *(id *)((char *)location + 4) = (id)(int)[v5 processIdentifier];
      _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Accepted connection: %llu",  (uint8_t *)location,  0xCu);
    }

    uint64_t v8 = _SWCGetServerInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    [v5 setExportedInterface:v9];

    [v5 setExportedObject:self];
    objc_initWeak(location, v5);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000152D0;
    v18[3] = &unk_100030CF8;
    objc_copyWeak(&v19, location);
    [v5 setInterruptionHandler:v18];
    objc_super v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472LL;
    uint64_t v15 = sub_1000153DC;
    v16 = &unk_100030CF8;
    objc_copyWeak(&v17, location);
    [v5 setInvalidationHandler:&v13];
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SWCDatabase queue](&OBJC_CLASS___SWCDatabase, "queue", v13, v14, v15, v16));
    [v5 _setQueue:v10];

    [v5 resume];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(location);
  }

  else
  {
    if (qword_100037220 != -1) {
      dispatch_once(&qword_100037220, &stru_100031160);
    }
    int v11 = (os_log_s *)(id)qword_100037218;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LODWORD(location[0]) = 134217984;
      *(id *)((char *)location + 4) = (id)(int)[v5 processIdentifier];
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "### Unentitled process %llu attempted to connect",  (uint8_t *)location,  0xCu);
    }
  }

  return v6;
}

- (void)downloader:(id)a3 willDownloadAASAFileFromDomain:(id)a4
{
  id v5 = a4;
  BOOL v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[SWCDatabase queue](&OBJC_CLASS___SWCDatabase, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100015594;
  v8[3] = &unk_1000307A0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)downloader:(id)a3 didDownloadAASAFileContainingJSONObject:(id)a4 fromDomain:(id)a5 downloadRoute:(unsigned __int8)a6
{
  id v8 = a4;
  id v9 = a5;
  v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[SWCDatabase queue](&OBJC_CLASS___SWCDatabase, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000156AC;
  block[3] = &unk_100030D68;
  block[4] = self;
  id v14 = v9;
  id v15 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, block);
}

- (void)downloader:(id)a3 failedToDownloadAASAFileFromDomain:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[SWCDatabase queue](&OBJC_CLASS___SWCDatabase, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100015828;
  block[3] = &unk_100030D68;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

- (void)waitForSiteApprovalWithServiceSpecifier:(id)a3 completionHandler:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100015AA4;
  v6[3] = &unk_100030EB0;
  id v7 = self;
  id v8 = a4;
  id v5 = v8;
  -[SWCManager _waitForSiteApprovalWithServiceSpecifier:completionHandler:]( v7,  "_waitForSiteApprovalWithServiceSpecifier:completionHandler:",  a3,  v6);
}

- (void)getDetailsWithServiceSpecifier:(id)a3 URL:(id)a4 limit:(unint64_t)a5 callerAuditToken:(id)a6 completionHandler:(id)a7
{
  id v25 = a3;
  id v27 = a4;
  id v12 = a6;
  id v13 = (void (**)(id, id, void))a7;
  if (v12 && (id v14 = objc_retainAutorelease(v12), !strcmp((const char *)[v14 objCType], "{?=[8I]}")))
  {
    [v14 getValue:&v35 size:32];
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection", v25));
    v16 = v15;
    if (v15)
    {
      [v15 auditToken];
    }

    else
    {
      __int128 v33 = 0u;
      __int128 v34 = 0u;
    }

    __int128 v35 = v33;
    __int128 v36 = v34;
  }

  v32[0] = v35;
  v32[1] = v36;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( -[SWCManager _entriesWithServiceSpecifier:URL:limit:auditToken:]( self,  "_entriesWithServiceSpecifier:URL:limit:auditToken:",  v25,  v27,  a5,  v32,  v25));
  v18 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v17 count]);
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v19 = v17;
  id v20 = [v19 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(v19);
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue( -[SWCManager _serviceDetailsWithEntry:]( self,  "_serviceDetailsWithEntry:",  *(void *)(*((void *)&v28 + 1) + 8LL * (void)i)));
        if (v23) {
          -[NSMutableArray addObject:](v18, "addObject:", v23);
        }
      }

      id v20 = [v19 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }

    while (v20);
  }

  id v24 = -[NSMutableArray copy](v18, "copy");
  v13[2](v13, v24, 0LL);
}

- (void)addServiceWithServiceSpecifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  unsigned __int8 v9 = -[SWCManager _connectionIsEntitled:forMutation:](self, "_connectionIsEntitled:forMutation:", v8, 1LL);

  if ((v9 & 1) != 0)
  {
    if (v6
      && (id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 SWCApplicationIdentifier]),
          v10,
          v10))
    {
      id v11 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
      id v13 = [v11 initWithBundleIdentifier:v12 allowPlaceholder:0 error:0];

      if ((v13
         || (id v14 = objc_alloc(&OBJC_CLASS___LSApplicationExtensionRecord),
             id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]),
             id v13 = [v14 initWithBundleIdentifier:v15 error:0],
             v15,
             v13))
        && ([v6 isFullySpecified] & 1) == 0)
      {
        -[SWCManager updateEntriesForAllBundlesIgnoringCurrentState:]( self,  "updateEntriesForAllBundlesIgnoringCurrentState:",  0LL);
        v7[2](v7, 1LL, 0LL);
      }

      else if ([v6 isFullySpecified])
      {
        v16 = (SWCEntry *)objc_claimAutoreleasedReturnValue( -[SWCDatabase entryMatchingServiceSpecifier:]( self->_database,  "entryMatchingServiceSpecifier:",  v6));
        if (!v16)
        {
          v16 = -[SWCEntry initWithServiceSpecifier:]( objc_alloc(&OBJC_CLASS___SWCEntry), "initWithServiceSpecifier:", v6);
          id v17 = -[SWCEntry fields](v16, "fields");
          *(_WORD *)id v17 = *(_WORD *)v17 & 0xF8FF | 0x200;
          database = self->_database;
          id v19 = -[NSOrderedSet initWithObject:](objc_alloc(&OBJC_CLASS___NSOrderedSet), "initWithObject:", v16);
          -[SWCDatabase addEntries:](database, "addEntries:", v19);
        }

        v7[2](v7, 1LL, 0LL);
      }

      else
      {
        BOOL v26 = objc_alloc(&OBJC_CLASS___NSError);
        v32[0] = @"Line";
        v32[1] = @"Function";
        v33[0] = &off_1000326C8;
        id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCManager addServiceWithServiceSpecifier:completionHandler:]"));
        v33[1] = v27;
        __int128 v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  2LL));
        __int128 v29 = -[NSError initWithDomain:code:userInfo:](v26, "initWithDomain:code:userInfo:", _SWCErrorDomain, 3LL, v28);
        ((void (**)(id, uint64_t, NSError *))v7)[2](v7, 0LL, v29);
      }
    }

    else
    {
      v23 = objc_alloc(&OBJC_CLASS___NSError);
      v30[0] = @"Line";
      v30[1] = @"Function";
      v31[0] = &off_1000326E0;
      id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCManager addServiceWithServiceSpecifier:completionHandler:]"));
      v31[1] = v13;
      id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  2LL));
      id v25 = -[NSError initWithDomain:code:userInfo:](v23, "initWithDomain:code:userInfo:", _SWCErrorDomain, 2LL, v24);
      ((void (**)(id, uint64_t, NSError *))v7)[2](v7, 0LL, v25);
    }
  }

  else
  {
    id v20 = objc_alloc(&OBJC_CLASS___NSError);
    v35[0] = &off_1000326B0;
    v34[0] = @"Line";
    v34[1] = @"Function";
    id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCManager addServiceWithServiceSpecifier:completionHandler:]"));
    v34[2] = NSDebugDescriptionErrorKey;
    v35[1] = v13;
    v35[2] = @"Entitlement required to mutate SWC database";
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v34,  3LL));
    int v22 = -[NSError initWithDomain:code:userInfo:](v20, "initWithDomain:code:userInfo:", _SWCErrorDomain, 1LL, v21);
    ((void (**)(id, uint64_t, NSError *))v7)[2](v7, 0LL, v22);
  }
}

- (void)removeServiceWithServiceSpecifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  unsigned __int8 v9 = -[SWCManager _connectionIsEntitled:forMutation:](self, "_connectionIsEntitled:forMutation:", v8, 1LL);

  if ((v9 & 1) != 0)
  {
    if (v6)
    {
      id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
      database = self->_database;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_100016828;
      v25[3] = &unk_100030ED8;
      id v12 = v10;
      BOOL v26 = v12;
      -[SWCDatabase enumerateEntriesMatchingServiceSpecifier:block:]( database,  "enumerateEntriesMatchingServiceSpecifier:block:",  v6,  v25);
      if (-[NSMutableOrderedSet count](v12, "count"))
      {
        -[SWCDatabase removeEntries:](self->_database, "removeEntries:", v12);
LABEL_5:
        v7[2](v7, 1LL, 0LL);
LABEL_16:
        id v14 = v26;
        goto LABEL_17;
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceType]);
      if (v18 || (v18 = (void *)objc_claimAutoreleasedReturnValue([v6 SWCApplicationIdentifier])) != 0)
      {
      }

      else
      {
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v6 SWCDomain]);

        if (!v24) {
          goto LABEL_5;
        }
      }

      if (qword_100037220 != -1) {
        dispatch_once(&qword_100037220, &stru_100031160);
      }
      id v19 = (os_log_s *)qword_100037218;
      if (os_log_type_enabled((os_log_t)qword_100037218, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v6;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "Service '%@' not found to remove",  buf,  0xCu);
      }

      id v20 = objc_alloc(&OBJC_CLASS___NSError);
      v29[0] = @"Line";
      v29[1] = @"Function";
      v30[0] = &off_100032710;
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCManager removeServiceWithServiceSpecifier:completionHandler:]"));
      v30[1] = v21;
      int v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  2LL));
      v23 = -[NSError initWithDomain:code:userInfo:](v20, "initWithDomain:code:userInfo:", _SWCErrorDomain, 3LL, v22);
      ((void (**)(id, uint64_t, NSError *))v7)[2](v7, 0LL, v23);

      goto LABEL_16;
    }

    v16 = objc_alloc(&OBJC_CLASS___NSError);
    v27[0] = @"Line";
    v27[1] = @"Function";
    v28[0] = &off_100032728;
    id v12 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCManager removeServiceWithServiceSpecifier:completionHandler:]"));
    v28[1] = v12;
    id v14 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  2LL));
    id v17 = -[NSError initWithDomain:code:userInfo:](v16, "initWithDomain:code:userInfo:", _SWCErrorDomain, 2LL, v14);
    ((void (**)(id, uint64_t, NSError *))v7)[2](v7, 0LL, v17);
  }

  else
  {
    id v13 = objc_alloc(&OBJC_CLASS___NSError);
    v34[0] = &off_1000326F8;
    v33[0] = @"Line";
    v33[1] = @"Function";
    id v12 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCManager removeServiceWithServiceSpecifier:completionHandler:]"));
    void v33[2] = NSDebugDescriptionErrorKey;
    v34[1] = v12;
    v34[2] = @"Entitlement required to mutate SWC database";
    id v14 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v34,  v33,  3LL));
    id v15 = -[NSError initWithDomain:code:userInfo:](v13, "initWithDomain:code:userInfo:", _SWCErrorDomain, 1LL, v14);
    ((void (**)(id, uint64_t, NSError *))v7)[2](v7, 0LL, v15);
  }

- (void)setDetails:(id)a3 forServiceWithServiceSpecifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  unsigned __int8 v12 = -[SWCManager _connectionIsEntitled:forMutation:](self, "_connectionIsEntitled:forMutation:", v11, 1LL);

  if ((v12 & 1) == 0)
  {
    id v17 = objc_alloc(&OBJC_CLASS___NSError);
    v34[0] = &off_100032740;
    v33[0] = @"Line";
    v33[1] = @"Function";
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCManager setDetails:forServiceWithServiceSpecifier:completionHandler:]"));
    void v33[2] = NSDebugDescriptionErrorKey;
    v34[1] = v18;
    v34[2] = @"Entitlement required to mutate SWC database";
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v34,  v33,  3LL));
    id v20 = -[NSError initWithDomain:code:userInfo:](v17, "initWithDomain:code:userInfo:", _SWCErrorDomain, 1LL, v19);
    v10[2](v10, 0LL, v20);
LABEL_11:

    goto LABEL_20;
  }

  if (![v9 isFullySpecified])
  {
    uint64_t v21 = objc_alloc(&OBJC_CLASS___NSError);
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCManager setDetails:forServiceWithServiceSpecifier:completionHandler:]",  @"Line",  @"Function",  &off_100032758));
    v28[1] = v18;
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  &v27,  2LL));
    id v20 = -[NSError initWithDomain:code:userInfo:](v21, "initWithDomain:code:userInfo:", _SWCErrorDomain, 2LL, v19);
    v10[2](v10, 0LL, v20);
    goto LABEL_11;
  }

  id v13 = (SWCEntry *)objc_claimAutoreleasedReturnValue( -[SWCDatabase entryMatchingServiceSpecifier:]( self->_database,  "entryMatchingServiceSpecifier:",  v9));
  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[_SWCPatternList patternListWithDetailsDictionary:]( &OBJC_CLASS____SWCPatternList,  "patternListWithDetailsDictionary:",  v8));
    -[SWCEntry setPatterns:](v13, "setPatterns:", v14);

    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[_SWCSubstitutionVariableList substitutionVariableListWithDictionary:]( &OBJC_CLASS____SWCSubstitutionVariableList,  "substitutionVariableListWithDictionary:",  v8));
    -[SWCEntry setSubstitutionVariables:](v13, "setSubstitutionVariables:", v15);

    if (qword_100037220 != -1) {
      dispatch_once(&qword_100037220, &stru_100031160);
    }
    v16 = (os_log_s *)qword_100037218;
    if (os_log_type_enabled((os_log_t)qword_100037218, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      __int128 v30 = v13;
      __int16 v31 = 2112;
      id v32 = v8;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Set details on %@: %@", buf, 0x16u);
    }

    -[SWCDatabase scheduleNextSave](self->_database, "scheduleNextSave");
  }

  else
  {
    id v13 = -[SWCEntry initWithServiceSpecifier:](objc_alloc(&OBJC_CLASS___SWCEntry), "initWithServiceSpecifier:", v9);
    if (v8)
    {
      int v22 = (void *)objc_claimAutoreleasedReturnValue( +[_SWCPatternList patternListWithDetailsDictionary:]( &OBJC_CLASS____SWCPatternList,  "patternListWithDetailsDictionary:",  v8));
      -[SWCEntry setPatterns:](v13, "setPatterns:", v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue( +[_SWCSubstitutionVariableList substitutionVariableListWithDictionary:]( &OBJC_CLASS____SWCSubstitutionVariableList,  "substitutionVariableListWithDictionary:",  v8));
      -[SWCEntry setSubstitutionVariables:](v13, "setSubstitutionVariables:", v23);
    }

    if (qword_100037220 != -1) {
      dispatch_once(&qword_100037220, &stru_100031160);
    }
    id v24 = (os_log_s *)qword_100037218;
    if (os_log_type_enabled((os_log_t)qword_100037218, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      __int128 v30 = v13;
      __int16 v31 = 2112;
      id v32 = v8;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Added %@ with details: %@", buf, 0x16u);
    }

    database = self->_database;
    BOOL v26 = -[NSOrderedSet initWithObject:](objc_alloc(&OBJC_CLASS___NSOrderedSet), "initWithObject:", v13);
    -[SWCDatabase addEntries:](database, "addEntries:", v26);
  }

  v10[2](v10, 1LL, 0LL);
LABEL_20:
}

- (void)setUserApprovalState:(unsigned __int8)a3 forServiceWithServiceSpecifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v6 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t, id))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  unsigned __int8 v11 = -[SWCManager _connectionIsEntitled:forMutation:](self, "_connectionIsEntitled:forMutation:", v10, 1LL);

  if ((v11 & 1) == 0)
  {
    id v17 = objc_alloc(&OBJC_CLASS___NSError);
    v31[0] = &off_100032770;
    v30[0] = @"Line";
    v30[1] = @"Function";
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCManager setUserApprovalState:forServiceWithServiceSpecifier:completionHandler:]"));
    void v30[2] = NSDebugDescriptionErrorKey;
    v31[1] = v18;
    void v31[2] = @"Entitlement required to mutate SWC database";
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  3LL));
    v16 = -[NSError initWithDomain:code:userInfo:](v17, "initWithDomain:code:userInfo:", _SWCErrorDomain, 1LL, v19);

    goto LABEL_5;
  }

  if (v6 >= 3)
  {
    unsigned __int8 v12 = objc_alloc(&OBJC_CLASS___NSError);
    v29[0] = &off_100032788;
    v28[0] = @"Line";
    v28[1] = @"Function";
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCManager setUserApprovalState:forServiceWithServiceSpecifier:completionHandler:]"));
    v29[1] = v13;
    void v29[2] = @"Unknown approval state specified by caller";
    void v28[2] = NSDebugDescriptionErrorKey;
    v28[3] = @"ApprovalState";
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v6));
    v29[3] = v14;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  4LL));
    v16 = -[NSError initWithDomain:code:userInfo:](v12, "initWithDomain:code:userInfo:", _SWCErrorDomain, 2LL, v15);

LABEL_5:
    uint64_t v20 = 0LL;
    goto LABEL_9;
  }

  uint64_t v24 = 0LL;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  char v27 = 0;
  database = self->_database;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000170C8;
  v22[3] = &unk_100030F00;
  v22[4] = &v24;
  char v23 = v6;
  -[SWCDatabase enumerateEntriesMatchingServiceSpecifier:block:]( database,  "enumerateEntriesMatchingServiceSpecifier:block:",  v8,  v22);
  if (*((_BYTE *)v25 + 24)) {
    -[SWCDatabase scheduleNextSave](self->_database, "scheduleNextSave");
  }
  _Block_object_dispose(&v24, 8);
  v16 = 0LL;
  uint64_t v20 = 1LL;
LABEL_9:
  v9[2](v9, v20, v16);
}

- (void)addAllAppsWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, BOOL, id))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  BOOL v6 = -[SWCManager _connectionIsEntitled:forMutation:](self, "_connectionIsEntitled:forMutation:", v5, 1LL);

  if (v6)
  {
    if (qword_100037220 != -1) {
      dispatch_once(&qword_100037220, &stru_100031160);
    }
    id v7 = (os_log_s *)qword_100037218;
    if (os_log_type_enabled((os_log_t)qword_100037218, OS_LOG_TYPE_DEBUG))
    {
      __int16 v12 = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Add all apps", (uint8_t *)&v12, 2u);
    }

    id v8 = 0LL;
    -[SWCManager updateEntriesForAllBundlesIgnoringCurrentState:]( self,  "updateEntriesForAllBundlesIgnoringCurrentState:",  1LL);
  }

  else
  {
    id v9 = objc_alloc(&OBJC_CLASS___NSError);
    v14[0] = &off_1000327A0;
    v13[0] = @"Line";
    v13[1] = @"Function";
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCManager addAllAppsWithCompletionHandler:]"));
    v13[2] = NSDebugDescriptionErrorKey;
    v14[1] = v10;
    v14[2] = @"Entitlement required to mutate SWC database";
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  3LL));
    id v8 = -[NSError initWithDomain:code:userInfo:](v9, "initWithDomain:code:userInfo:", _SWCErrorDomain, 1LL, v11);
  }

  v4[2](v4, v6, v8);
}

- (void)showWithVerbosity:(unsigned __int8)a3 isTTY:(BOOL)a4 fileDescriptor:(id)a5 completionHandler:(id)a6
{
  BOOL v7 = a4;
  unsigned int v8 = a3;
  id v10 = a5;
  unsigned __int8 v11 = (void (**)(void))a6;
  if (v10)
  {
    if (xpc_get_type(v10) == (xpc_type_t)&_xpc_type_fd)
    {
      uint64_t v12 = xpc_fd_dup(v10);
      int v13 = v12;
      if ((v12 & 0x80000000) == 0)
      {
        if (v7) {
          _SWCForceTTY(v12);
        }
        id v14 = fdopen(v13, "w");
        if (v14)
        {
          context = objc_autoreleasePoolPush();
          id v15 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", getpid());
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          _SWCLogValueForKey(v14, @"PID", v16, 0xFFFFFFFFLL, 0xFFFFFFFFLL);

          id v17 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDatabase storageURL](self->_database, "storageURL"));
          v18 = (void *)objc_claimAutoreleasedReturnValue([v17 path]);
          _SWCLogValueForKey(v14, @"Storage", v18, 0xFFFFFFFFLL, 0xFFFFFFFFLL);

          if (v8)
          {
            id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDatabase settingsGeneration](self->_database, "settingsGeneration"));
            _SWCLogValueForKey(v14, @"Settings Generation", v19, 0xFFFFFFFFLL, 0xFFFFFFFFLL);

            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[SWCDatabase launchServicesDatabaseGeneration]( self->_database,  "launchServicesDatabaseGeneration"));
            _SWCLogValueForKey(v14, @"LS Generation", v20, 0xFFFFFFFFLL, 0xFFFFFFFFLL);

            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDatabase enterpriseState](self->_database, "enterpriseState"));
            int v22 = v21;
            if (v21) {
              char v23 = (void *)objc_claimAutoreleasedReturnValue([v21 base64EncodedStringWithOptions:0]);
            }
            else {
              char v23 = 0LL;
            }

            _SWCLogValueForKey(v14, @"Enterprise SHA", v23, 0xFFFFFFFFLL, 0xFFFFFFFFLL);
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SWCManager _isDeveloperModeEnabled](self, "_isDeveloperModeEnabled")));
            _SWCLogValueForKey(v14, @"Developer Mode", v24, 0xFFFFFFFFLL, 0xFFFFFFFFLL);
          }

          _SWCLogHeader(v14, @"Database");
          uint64_t v79 = 0LL;
          v80 = &v79;
          uint64_t v81 = 0x2020000000LL;
          char v82 = 0;
          database = self->_database;
          v77[0] = _NSConcreteStackBlock;
          v77[1] = 3221225472LL;
          v77[2] = sub_100017C14;
          v77[3] = &unk_100030F28;
          v77[4] = &v79;
          v77[5] = v14;
          char v78 = v8;
          -[SWCDatabase enumerateEntriesWithBlock:](database, "enumerateEntriesWithBlock:", v77);
          if (!*((_BYTE *)v80 + 24)) {
            _SWCLogLine(v14, @"(empty)", 8LL, 0xFFFFFFFFLL);
          }
          _SWCLogHeader(v14, @"Network");
          if (v8 < 2)
          {
            __int16 v31 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            downloader = self->_downloader;
            v71[0] = _NSConcreteStackBlock;
            v71[1] = 3221225472LL;
            v71[2] = sub_100017E08;
            v71[3] = &unk_100030F78;
            char v73 = v8;
            __int128 v33 = v31;
            v72 = v33;
            -[SWCDownloader enumerateActiveAASAFileDownloadsWithBlock:]( downloader,  "enumerateActiveAASAFileDownloadsWithBlock:",  v71);
            __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v33, "componentsJoinedByString:", @", "));
            _SWCLogLine(v14, v34, 0xFFFFFFFFLL, 0xFFFFFFFFLL);

            if (!v8)
            {
LABEL_41:
              _Block_object_dispose(&v79, 8);
              objc_autoreleasePoolPop(context);
              fclose(v14);
              goto LABEL_3;
            }
          }

          else
          {
            uint64_t v26 = objc_alloc_init(&OBJC_CLASS___NSByteCountFormatter);
            char v27 = self->_downloader;
            v74[0] = _NSConcreteStackBlock;
            v74[1] = 3221225472LL;
            v74[2] = sub_100017C90;
            v74[3] = &unk_100030F50;
            v75 = v26;
            v76 = v14;
            __int128 v28 = v26;
            -[SWCDownloader enumerateActiveAASAFileDownloadsWithBlock:]( v27,  "enumerateActiveAASAFileDownloadsWithBlock:",  v74);

            _SWCLogHeader(v14, @"Preferences");
            __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](&OBJC_CLASS____SWCPrefs, "sharedPrefs"));
            __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v29 descriptionOfAllPrefs]);
            v70[0] = _NSConcreteStackBlock;
            v70[1] = 3221225472LL;
            v70[2] = sub_100017F18;
            v70[3] = &unk_100030F98;
            v70[4] = v14;
            [v30 enumerateKeysAndObjectsUsingBlock:v70];
          }

          _SWCLogHeader(v14, @"Settings");
          uint64_t v60 = 0LL;
          v61 = &v60;
          uint64_t v62 = 0x2020000000LL;
          LOBYTE(v63) = 0;
          __int128 v35 = self->_database;
          v69[0] = _NSConcreteStackBlock;
          v69[1] = 3221225472LL;
          v69[2] = sub_100017F28;
          v69[3] = &unk_100030FC0;
          v69[4] = &v60;
          v69[5] = v14;
          -[SWCDatabase enumerateSettingsDictionariesWithBlock:](v35, "enumerateSettingsDictionariesWithBlock:", v69);
          if (!*((_BYTE *)v61 + 24)) {
            _SWCLogLine(v14, @"(empty)", 8LL, 0xFFFFFFFFLL);
          }
          _Block_object_dispose(&v60, 8);
          _SWCLogHeader(v14, @"Memory Usage");
          __int128 v36 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          v37 = self->_database;
          v67[0] = _NSConcreteStackBlock;
          v67[1] = 3221225472LL;
          v67[2] = sub_100017FEC;
          v67[3] = &unk_100030ED8;
          v38 = v36;
          v68 = v38;
          v58 = v38;
          -[SWCDatabase enumerateEntriesWithBlock:](v37, "enumerateEntriesWithBlock:", v67);
          uint64_t v60 = 0LL;
          v61 = &v60;
          uint64_t v62 = 0x4812000000LL;
          v63 = sub_10001813C;
          v64 = sub_100018160;
          v65 = "";
          memset(v66, 0, sizeof(v66));
          v59[0] = _NSConcreteStackBlock;
          v59[1] = 3221225472LL;
          v59[2] = sub_100018188;
          v59[3] = &unk_100030FE8;
          v59[4] = &v60;
          -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v38, "enumerateKeysAndObjectsUsingBlock:", v59);
          v39 = (void **)v61[6];
          v40 = (void **)v61[7];
          unint64_t v41 = 126 - 2 * __clz(((char *)v40 - (char *)v39) >> 4);
          v83 = &stru_100031028;
          if (v40 == v39) {
            uint64_t v42 = 0LL;
          }
          else {
            uint64_t v42 = v41;
          }
          sub_10001C810(v39, v40, (uint64_t)&v83, v42, 1);

          if (v61[6] == v61[7])
          {
            _SWCLogLine(v14, @"(empty)", 8LL, 0xFFFFFFFFLL);
          }

          else
          {
            v54 = v11;
            id v55 = v10;
            v43 = v14;
            unsigned int v44 = v8;
            v57 = objc_alloc_init(&OBJC_CLASS___NSByteCountFormatter);
            uint64_t v45 = v61[6];
            uint64_t v46 = v61[7];
            while (v45 != v46)
            {
              if (*(void *)(v45 + 8))
              {
                id v47 = *(id *)v45;
                v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(v45 + 8)));
                unint64_t v49 = *(void *)(v45 + 8);
                if (v49 > 0x2000) {
                  uint64_t v50 = 0LL;
                }
                else {
                  uint64_t v50 = 0xFFFFFFFFLL;
                }
                if (v49 <= 0x2000) {
                  uint64_t v51 = 0xFFFFFFFFLL;
                }
                else {
                  uint64_t v51 = 220LL;
                }
                v52 = (void *)objc_claimAutoreleasedReturnValue([v47 description]);
                if (v44 <= 1)
                {
                  v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSByteCountFormatter stringForObjectValue:](v57, "stringForObjectValue:", v48));
                  _SWCLogValueForKey(v43, v52, v53, v50, v51);
                }

                else
                {
                  _SWCLogValueForKey(v43, v52, v48, v50, v51);
                }

                v38 = v58;
              }

              v45 += 16LL;
            }

            id v14 = v43;
            unsigned __int8 v11 = v54;
            id v10 = v55;
          }

          _Block_object_dispose(&v60, 8);
          v84 = (void **)v66;
          sub_10001C7A4(&v84);

          goto LABEL_41;
        }
      }
    }
  }

- (void)resetWithCompletionHandler:(id)a3
{
  v4 = (uint64_t (**)(id, id, id))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  unsigned __int8 v6 = -[SWCManager _connectionIsEntitled:forMutation:](self, "_connectionIsEntitled:forMutation:", v5, 1LL);

  if ((v6 & 1) != 0)
  {
    -[SWCDatabase removeAllEntries](self->_database, "removeAllEntries");
    -[SWCManager updateEntriesForAllBundlesIgnoringCurrentState:]( self,  "updateEntriesForAllBundlesIgnoringCurrentState:",  1LL);
    database = self->_database;
    id v14 = 0LL;
    BOOL v8 = -[SWCDatabase saveReturningError:](database, "saveReturningError:", &v14);
    id v9 = v14;
    uint64_t v10 = v4[2](v4, (id)v8, v9);
    xpc_transaction_exit_clean(v10);
  }

  else
  {
    unsigned __int8 v11 = objc_alloc(&OBJC_CLASS___NSError);
    v16[0] = &off_1000327B8;
    v15[0] = @"Line";
    v15[1] = @"Function";
    id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCManager resetWithCompletionHandler:]"));
    v15[2] = NSDebugDescriptionErrorKey;
    v16[1] = v9;
    v16[2] = @"Entitlement required to mutate SWC database";
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  3LL));
    int v13 = -[NSError initWithDomain:code:userInfo:](v11, "initWithDomain:code:userInfo:", _SWCErrorDomain, 1LL, v12);
    v4[2](v4, 0LL, v13);
  }
}

- (void)getServiceSettingsWithServiceSpecifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, id, id))a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( -[SWCDatabase settingsDictionaryForServiceSpecifier:]( self->_database,  "settingsDictionaryForServiceSpecifier:",  v6));
  if (!v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDatabase entryMatchingServiceSpecifier:](self->_database, "entryMatchingServiceSpecifier:", v6));

    if (!v9)
    {
      id v14 = objc_alloc(&OBJC_CLASS___NSError);
      v18[0] = &off_1000327D0;
      v17[0] = @"Line";
      v17[1] = @"Function";
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCManager getServiceSettingsWithServiceSpecifier:completionHandler:]"));
      v17[2] = NSDebugDescriptionErrorKey;
      v18[1] = v15;
      v18[2] = @"No services match the service specifier, so settings cannot be saved for it.";
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  3LL));
      int v13 = -[NSError initWithDomain:code:userInfo:](v14, "initWithDomain:code:userInfo:", _SWCErrorDomain, 3LL, v16);

      BOOL v8 = 0LL;
      id v12 = 0LL;
      goto LABEL_5;
    }

    BOOL v8 = &__NSDictionary0__struct;
  }

  id v10 = objc_alloc(&OBJC_CLASS____SWCServiceSettings);
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDatabase settingsGeneration](self->_database, "settingsGeneration"));
  id v12 = [v10 _initWithServiceSpecifier:v6 dictionary:v8 generation:v11];

  int v13 = 0LL;
LABEL_5:
  v7[2](v7, v12, v13);
}

- (void)commitServiceSettings:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void *, id))a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDatabase settingsGeneration](self->_database, "settingsGeneration"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  unsigned __int8 v10 = -[SWCManager _connectionIsEntitled:forMutation:](self, "_connectionIsEntitled:forMutation:", v9, 1LL);

  if ((v10 & 1) == 0)
  {
    id v17 = objc_alloc(&OBJC_CLASS___NSError);
    v30[0] = &off_1000327E8;
    v29[0] = @"Line";
    v29[1] = @"Function";
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCManager commitServiceSettings:completionHandler:]"));
    void v29[2] = NSDebugDescriptionErrorKey;
    v30[1] = v18;
    void v30[2] = @"Entitlement required to mutate SWC database";
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  3LL));
    uint64_t v20 = -[NSError initWithDomain:code:userInfo:](v17, "initWithDomain:code:userInfo:", _SWCErrorDomain, 1LL, v19);

LABEL_7:
    v16 = 0LL;
    goto LABEL_10;
  }

  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v6 generation]);
  unsigned __int8 v12 = [v11 isEqual:v8];

  if ((v12 & 1) == 0)
  {
    uint64_t v21 = objc_alloc(&OBJC_CLASS___NSError);
    v28[0] = &off_100032800;
    v27[0] = @"Line";
    v27[1] = @"Function";
    int v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCManager commitServiceSettings:completionHandler:]"));
    v28[1] = v22;
    void v28[2] = @"Settings conflict detected. Try again.";
    void v27[2] = NSDebugDescriptionErrorKey;
    v27[3] = @"Generation";
    char v23 = (void *)objc_claimAutoreleasedReturnValue([v6 generation]);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 description]);
    v28[3] = v24;
    v27[4] = @"ExpectedGeneration";
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v8 description]);
    void v28[4] = v25;
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  5LL));
    uint64_t v20 = -[NSError initWithDomain:code:userInfo:](v21, "initWithDomain:code:userInfo:", _SWCErrorDomain, 1000LL, v26);

    goto LABEL_7;
  }

  int v13 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceSpecifier]);
  if (v13)
  {
    database = self->_database;
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 dictionaryRepresentation]);
    -[SWCDatabase setSettingsDictionary:forServiceSpecifier:]( database,  "setSettingsDictionary:forServiceSpecifier:",  v15,  v13);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDatabase settingsGeneration](self->_database, "settingsGeneration"));
  }

  else
  {
    v16 = 0LL;
  }

  uint64_t v20 = 0LL;
LABEL_10:
  v7[2](v7, v16, v20);
}

- (void)removeSettingsForKeys:(id)a3 serviceType:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = (void (**)(id, uint64_t, void *))a5;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  unsigned __int8 v12 = -[SWCManager _connectionIsEntitled:forMutation:](self, "_connectionIsEntitled:forMutation:", v11, 1LL);

  if ((v12 & 1) == 0)
  {
    id v15 = objc_alloc(&OBJC_CLASS___NSError);
    v23[0] = &off_100032818;
    v22[0] = @"Line";
    v22[1] = @"Function";
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCManager removeSettingsForKeys:serviceType:completionHandler:]"));
    v22[2] = NSDebugDescriptionErrorKey;
    v23[1] = v16;
    v23[2] = @"Entitlement required to mutate SWC database";
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  3LL));
    v18 = -[NSError initWithDomain:code:userInfo:](v15, "initWithDomain:code:userInfo:", _SWCErrorDomain, 1LL, v17);
LABEL_8:
    int v13 = v18;

    uint64_t v14 = 0LL;
    goto LABEL_9;
  }

  if (!v9 || v8 && (_NSIsNSSet(v8) & 1) == 0)
  {
    id v19 = objc_alloc(&OBJC_CLASS___NSError);
    v20[0] = @"Line";
    v20[1] = @"Function";
    v21[0] = &off_100032830;
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCManager removeSettingsForKeys:serviceType:completionHandler:]"));
    v21[1] = v16;
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));
    v18 = -[NSError initWithDomain:code:userInfo:](v19, "initWithDomain:code:userInfo:", _SWCErrorDomain, 2LL, v17);
    goto LABEL_8;
  }

  int v13 = 0LL;
  -[SWCDatabase removeSettingsForKeys:serviceType:](self->_database, "removeSettingsForKeys:serviceType:", v8, v9);
  uint64_t v14 = 1LL;
LABEL_9:
  v10[2](v10, v14, v13);
}

- (void)removeSettingsForKeys:(id)a3 serviceSpecifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = (void (**)(id, uint64_t, void *))a5;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  unsigned __int8 v12 = -[SWCManager _connectionIsEntitled:forMutation:](self, "_connectionIsEntitled:forMutation:", v11, 1LL);

  if ((v12 & 1) == 0)
  {
    uint64_t v20 = objc_alloc(&OBJC_CLASS___NSError);
    v26[0] = &off_100032848;
    v25[0] = @"Line";
    v25[1] = @"Function";
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCManager removeSettingsForKeys:serviceSpecifier:completionHandler:]"));
    v25[2] = NSDebugDescriptionErrorKey;
    v26[1] = v17;
    v26[2] = @"Entitlement required to mutate SWC database";
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  3LL));
    id v19 = -[NSError initWithDomain:code:userInfo:](v20, "initWithDomain:code:userInfo:", _SWCErrorDomain, 1LL, v18);
    goto LABEL_8;
  }

  if (v9)
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v9 serviceType]);
    uint64_t v14 = v13;
    if (v13)
    {
      if (v8)
      {
        char v15 = _NSIsNSSet(v8);

        if ((v15 & 1) == 0) {
          goto LABEL_6;
        }
      }

      else
      {
      }

      uint64_t v21 = 0LL;
      -[SWCDatabase removeSettingsForKeys:serviceSpecifier:]( self->_database,  "removeSettingsForKeys:serviceSpecifier:",  v8,  v9);
      uint64_t v22 = 1LL;
      goto LABEL_9;
    }
  }

- (void)getTrackingDomains:(id)a3 sources:(unint64_t)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a5;
  if (v7 && !_NSIsNSSet(v7))
  {
LABEL_13:
    v8[2](v8, &__NSDictionary0__struct);
  }

  else
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v18;
      while (2)
      {
        unsigned __int8 v12 = 0LL;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v9);
          }
          if ((_NSIsNSString(*(void *)(*((void *)&v17 + 1) + 8LL * (void)v12)) & 1) == 0)
          {

            goto LABEL_13;
          }

          unsigned __int8 v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100019460;
    void v14[3] = &unk_100031050;
    id v15 = (id)os_transaction_create("com.apple.swc.tracking-domains");
    v16 = v8;
    id v13 = v15;
    +[_SWCTrackingDomainInfo _getTrackingDomainInfoWithDomains:sources:completionHandler:]( &OBJC_CLASS____SWCTrackingDomainInfo,  "_getTrackingDomainInfoWithDomains:sources:completionHandler:",  v9,  a4,  v14);
  }
}

- (void)getDeveloperModeEnabledWithCompletionHandler:(id)a3
{
  id v5 = (void (**)(id, void *, void))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SWCManager _isDeveloperModeEnabled](self, "_isDeveloperModeEnabled")));
  v5[2](v5, v4, 0LL);
}

- (void)setDeveloperModeEnabled:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, uint64_t, void))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  unsigned __int8 v8 = -[SWCManager _connectionIsEntitled:forMutation:](self, "_connectionIsEntitled:forMutation:", v7, 1LL);

  if ((v8 & 1) != 0)
  {
    if (-[SWCManager _isDeveloperModeEnabled](self, "_isDeveloperModeEnabled") == v4)
    {
      v6[2](v6, 1LL, 0LL);
    }

    else if (v4)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_10001978C;
      void v16[3] = &unk_100031078;
      v16[4] = self;
      __int128 v17 = v6;
      -[SWCManager _authorizeDeveloperModeChangeWithCompletionHandler:]( self,  "_authorizeDeveloperModeChangeWithCompletionHandler:",  v16);
    }

    else
    {
      id v15 = 0LL;
      BOOL v13 = -[SWCManager _setDeveloperModeEnabled:error:](self, "_setDeveloperModeEnabled:error:", 0LL, &v15);
      id v14 = v15;
      ((void (**)(id, uint64_t, id))v6)[2](v6, v13, v14);
    }
  }

  else
  {
    id v9 = objc_alloc(&OBJC_CLASS___NSError);
    v19[0] = &off_100032878;
    v18[0] = @"Line";
    v18[1] = @"Function";
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCManager setDeveloperModeEnabled:completionHandler:]"));
    v18[2] = NSDebugDescriptionErrorKey;
    v19[1] = v10;
    v19[2] = @"Entitlement required to enable Associated Domains developer mode.";
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  3LL));
    unsigned __int8 v12 = -[NSError initWithDomain:code:userInfo:](v9, "initWithDomain:code:userInfo:", _SWCErrorDomain, 1LL, v11);

    ((void (**)(id, uint64_t, NSError *))v6)[2](v6, 0LL, v12);
  }
}

- (void)setAdditionalServiceDetailsForApplicationIdentifiers:(id)a3 usingContentsOfDictionary:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, BOOL, id))a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  if (!-[SWCManager _connectionIsEntitled:forMutation:](self, "_connectionIsEntitled:forMutation:", v11, 1LL))
  {
    __int128 v18 = objc_alloc(&OBJC_CLASS___NSError);
    v35[0] = &off_100032890;
    v34[0] = @"Line";
    v34[1] = @"Function";
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCManager setAdditionalServiceDetailsForApplicationIdentifiers:usingContentsOfDictionary:completionHandler:]"));
    v34[2] = NSDebugDescriptionErrorKey;
    v35[1] = v12;
    v35[2] = @"Entitlement required to mutate SWC database";
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v34,  3LL));
    __int128 v19 = -[NSError initWithDomain:code:userInfo:](v18, "initWithDomain:code:userInfo:", _SWCErrorDomain, 1LL, v13);
LABEL_12:
    id v15 = v19;
    goto LABEL_13;
  }

  if (!v8 || !_NSIsNSSet(v8) || ![v8 count])
  {
    __int128 v20 = objc_alloc(&OBJC_CLASS___NSError);
    v33[0] = &off_1000328A8;
    v32[0] = @"Line";
    v32[1] = @"Function";
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCManager setAdditionalServiceDetailsForApplicationIdentifiers:usingContentsOfDictionary:completionHandler:]"));
    void v32[2] = NSDebugDescriptionErrorKey;
    v33[1] = v12;
    void v33[2] = @"Invalid app ID list.";
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  3LL));
    __int128 v19 = -[NSError initWithDomain:code:userInfo:](v20, "initWithDomain:code:userInfo:", _SWCErrorDomain, 2LL, v13);
    goto LABEL_12;
  }

  if (!v9 || (_NSIsNSDictionary(v9) & 1) == 0)
  {
    uint64_t v21 = objc_alloc(&OBJC_CLASS___NSError);
    v31[0] = &off_1000328C0;
    v30[0] = @"Line";
    v30[1] = @"Function";
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCManager setAdditionalServiceDetailsForApplicationIdentifiers:usingContentsOfDictionary:completionHandler:]"));
    void v30[2] = NSDebugDescriptionErrorKey;
    v31[1] = v12;
    void v31[2] = @"Invalid domain-to-JSON dictionary.";
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  3LL));
    __int128 v19 = -[NSError initWithDomain:code:userInfo:](v21, "initWithDomain:code:userInfo:", _SWCErrorDomain, 2LL, v13);
    goto LABEL_12;
  }

  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue( -[SWCManager _filterApplicationIdentifiers:toMatchEntitlementOfXPCConnection:]( self,  "_filterApplicationIdentifiers:toMatchEntitlementOfXPCConnection:",  v8,  v11));
  id v27 = 0LL;
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( -[SWCManager _createStagingDirectoryForAdditionalServiceDetailsReturningError:]( self,  "_createStagingDirectoryForAdditionalServiceDetailsReturningError:",  &v27));
  id v14 = (NSError *)v27;
  id v15 = v14;
  if (!v13)
  {
LABEL_13:
    BOOL v16 = 0LL;
    goto LABEL_14;
  }

  uint64_t v26 = v14;
  BOOL v16 = -[SWCManager _addJSONDataInDictionary:toStagingDirectoryAtURL:error:]( self,  "_addJSONDataInDictionary:toStagingDirectoryAtURL:error:",  v9,  v13,  &v26);
  __int128 v17 = v26;

  if (v16)
  {
    id v25 = v17;
    BOOL v16 = -[SWCManager _copyStagingDirectoryAtURL:toAdditionalServiceDetailsDirectoriesForApplicationIdentifiers:error:]( self,  "_copyStagingDirectoryAtURL:toAdditionalServiceDetailsDirectoriesForApplicationIdentifiers:error:",  v13,  v12,  &v25);
    id v15 = v25;
  }

  else
  {
    id v15 = v17;
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  [v22 removeItemAtURL:v13 error:0];

  if (v16)
  {
    id v23 = sub_100014EBC();
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v8;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "Updating all apps after updating additional service details for %@",  buf,  0xCu);
    }

    BOOL v16 = 1LL;
    -[SWCManager updateEntriesForAllBundlesIgnoringCurrentState:]( self,  "updateEntriesForAllBundlesIgnoringCurrentState:",  1LL);
  }

- (SWCDatabase)database
{
  return (SWCDatabase *)objc_getProperty(self, a2, 24LL, 1);
}

- (SWCDownloader)downloader
{
  return (SWCDownloader *)objc_getProperty(self, a2, 32LL, 1);
}

- (SWCDownloadScheduler)downloadScheduler
{
  return (SWCDownloadScheduler *)objc_getProperty(self, a2, 40LL, 1);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_WORD *)self + 8) = 0;
  return self;
}

- (void)_addEntriesForAllBundlesWithEnumerator:(id)a3 toWorkingSet:(id)a4 enterpriseContext:(id)a5 developerModeEnabled:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  context = objc_autoreleasePoolPush();
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v21;
    do
    {
      id v15 = 0LL;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v15);
        __int128 v17 = objc_autoreleasePoolPush();
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[SWCEntry entriesForBundleRecord:enterpriseContext:developerModeEnabled:]( &OBJC_CLASS___SWCEntry,  "entriesForBundleRecord:enterpriseContext:developerModeEnabled:",  v16,  v11,  v6));
        if ([v18 count]) {
          [v10 unionOrderedSet:v18];
        }

        objc_autoreleasePoolPop(v17);
        id v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v13);
  }

  objc_autoreleasePoolPop(context);
}

- (void)_updateAllEntries:(id)a3
{
  id v33 = a3;
  __int128 v34 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  v37 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  BOOL v3 = objc_autoreleasePoolPush();
  database = self->_database;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_10001A844;
  v43[3] = &unk_100030C80;
  id v5 = v33;
  id v44 = v5;
  __int128 v36 = v34;
  uint64_t v45 = v36;
  -[SWCDatabase enumerateEntriesWithBlock:](database, "enumerateEntriesWithBlock:", v43);

  objc_autoreleasePoolPop(v3);
  context = objc_autoreleasePoolPush();
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v39 objects:v50 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v40;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)v8);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDatabase entry:](self->_database, "entry:", v9));
        if (!v10)
        {
          -[NSMutableOrderedSet addObject:](v37, "addObject:", v9);
          goto LABEL_14;
        }

        id v11 = v9;
        int v12 = *(unsigned __int16 *)[v11 fields];
        id v13 = v10;
        if (((*(unsigned __int16 *)[v13 fields] ^ v12) & 0x700) != 0)
        {
          -[NSMutableOrderedSet addObject:](v36, "addObject:", v13);
          -[NSMutableOrderedSet addObject:](v37, "addObject:", v11);
          if ((*(_WORD *)[v11 fields] & 0x700) != 0) {
            goto LABEL_19;
          }
          if (qword_100037220 != -1) {
            dispatch_once(&qword_100037220, &stru_100031160);
          }
          uint64_t v14 = (os_log_s *)qword_100037218;
          if (os_log_type_enabled((os_log_t)qword_100037218, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v47 = v13;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Entry %@ needs its JSON updated because it moved from on-disk to network",  buf,  0xCu);
          }

          goto LABEL_14;
        }

        id v18 = v11;
        if ((*(_WORD *)[v18 fields] & 0x700) == 0x300)
        {
          -[NSMutableOrderedSet addObject:](v36, "addObject:", v13);
          -[NSMutableOrderedSet addObject:](v37, "addObject:", v18);
        }

        else
        {
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 applicationPersistentIdentifier]);
          uint64_t v20 = objc_claimAutoreleasedReturnValue([v13 applicationPersistentIdentifier]);
          __int128 v21 = (void *)v20;
          if (!v19 || !v20) {
            goto LABEL_37;
          }
          uint64_t v22 = _LSPersistentIdentifierCompare(v19, v20);

          if (!v22)
          {
            __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 applicationVersion]);
            __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v13 applicationVersion]);
            if ([v18 isDownloadable] && objc_msgSend(v19, "isEqual:", v21))
            {
              if (qword_100037220 != -1) {
                dispatch_once(&qword_100037220, &stru_100031160);
              }
              __int128 v23 = (os_log_s *)qword_100037218;
              if (os_log_type_enabled((os_log_t)qword_100037218, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v47 = v13;
                _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Entry %@ has moved databases but hasn't changed versions; we won't download new JSON right now",
                  buf,
                  0xCu);
              }

              uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v18 applicationPersistentIdentifier]);
              [v13 setApplicationPersistentIdentifier:v16];
LABEL_16:

              goto LABEL_19;
            }

            if (qword_100037220 != -1) {
              dispatch_once(&qword_100037220, &stru_100031160);
            }
            uint64_t v24 = (os_log_s *)qword_100037218;
            if (os_log_type_enabled((os_log_t)qword_100037218, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v47 = v13;
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Entry %@ has moved databases, and it has changed versions or it is from on-disk, will update JSON",  buf,  0xCu);
            }

- (id)_entriesWithServiceSpecifier:(id)a3 URL:(id)a4 limit:(unint64_t)a5 auditToken:(id *)a6
{
  id v21 = a3;
  id v9 = a4;
  if (v9) {
    id v10 = -[NSURLComponents initWithURL:resolvingAgainstBaseURL:]( objc_alloc(&OBJC_CLASS___NSURLComponents),  "initWithURL:resolvingAgainstBaseURL:",  v9,  1LL,  v21);
  }
  else {
    id v10 = 0LL;
  }
  id v11 = objc_autoreleasePoolPush();
  int v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  database = self->_database;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  void v24[2] = sub_10001AAB0;
  v24[3] = &unk_1000310A0;
  id v14 = v21;
  id v25 = v14;
  id v15 = v10;
  id v26 = v15;
  __int128 v16 = *(_OWORD *)&a6->var0[4];
  __int128 v28 = *(_OWORD *)a6->var0;
  __int128 v29 = v16;
  __int128 v17 = v12;
  id v27 = v17;
  -[SWCDatabase enumerateEntriesMatchingServiceSpecifier:block:]( database,  "enumerateEntriesMatchingServiceSpecifier:block:",  v14,  v24);

  objc_autoreleasePoolPop(v11);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10001ADF8;
  void v22[3] = &unk_1000310C8;
  id v18 = v15;
  __int128 v23 = v18;
  -[NSMutableArray sortWithOptions:usingComparator:](v17, "sortWithOptions:usingComparator:", 16LL, v22);
  id v19 = -[NSMutableArray copy](v17, "copy");

  return v19;
}

- (id)_serviceDetailsWithEntry:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS____SWCServiceDetails);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceSpecifier]);
  id v6 = v3;
  id v7 = objc_msgSend(v4, "_initWithServiceSpecifier:fields:", v5, objc_msgSend(v6, "fields"));

  return v7;
}

- (void)_waitForSiteApprovalWithServiceSpecifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if (![v6 isFullySpecified])
  {
    id v11 = objc_alloc(&OBJC_CLASS___NSError);
    v37[0] = @"Line";
    v37[1] = @"Function";
    v38[0] = &off_100032908;
    id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCManager(Private) _waitForSiteApprovalWithServiceSpecifier:completionHandler:]"));
    v38[1] = v9;
    int v12 = (NSError *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v38,  v37,  2LL));
    id v13 = -[NSError initWithDomain:code:userInfo:](v11, "initWithDomain:code:userInfo:", _SWCErrorDomain, 2LL, v12);
    v7[2](v7, 0LL, v13);
    goto LABEL_20;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDatabase entryMatchingServiceSpecifier:](self->_database, "entryMatchingServiceSpecifier:", v6));
  if (!v8)
  {
    id v14 = objc_alloc(&OBJC_CLASS___NSError);
    v40[0] = &off_1000328F0;
    v39[0] = @"Line";
    v39[1] = @"Function";
    int v12 = (NSError *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCManager(Private) _waitForSiteApprovalWithServiceSpecifier:completionHandler:]"));
    v39[2] = NSDebugDescriptionErrorKey;
    v40[1] = v12;
    v40[2] = @"The specified service was not found in the SWC database.";
    id v13 = (NSError *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v40,  v39,  3LL));
    id v15 = -[NSError initWithDomain:code:userInfo:](v14, "initWithDomain:code:userInfo:", _SWCErrorDomain, 3LL, v13);
    v7[2](v7, 0LL, v15);

    id v9 = 0LL;
    goto LABEL_20;
  }

  id v9 = v8;
  if ((*(_WORD *)[v9 fields] & 0xC) == 0)
  {
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v9 retryCount]);
    if (v16)
    {
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v9 retryCount]);
      id v18 = [v17 unsignedIntegerValue];
      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](&OBJC_CLASS____SWCPrefs, "sharedPrefs"));
      id v20 = [v19 maximumRetryCount];

      if (v18 > v20)
      {
        if (qword_100037220 != -1) {
          dispatch_once(&qword_100037220, &stru_100031160);
        }
        id v21 = (os_log_s *)(id)qword_100037218;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v9 retryCount]);
          __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
          *(_DWORD *)buf = 138543874;
          id v44 = v22;
          __int16 v45 = 2112;
          id v46 = v9;
          __int16 v47 = 2048;
          uint64_t v48 = (int)[v23 processIdentifier];
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Exhausted retry attempts (%{public}@) for entry %@; will not attempt to download it on behalf of an interested caller %llu",
            buf,
            0x20u);
        }

        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v9 lastError]);
        id v25 = v24;
        if (v24)
        {
          int v12 = v24;
        }

        else
        {
          __int128 v28 = objc_alloc(&OBJC_CLASS___NSError);
          v41[0] = @"Line";
          v41[1] = @"Function";
          v42[0] = &off_1000328D8;
          __int128 v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCManager(Private) _waitForSiteApprovalWithServiceSpecifier:completionHandler:]"));
          v42[1] = v29;
          id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v42,  v41,  2LL));
          int v12 = -[NSError initWithDomain:code:userInfo:]( v28,  "initWithDomain:code:userInfo:",  _SWCErrorDomain,  -1LL,  v30);
        }

        v7[2](v7, 0LL, v12);
        goto LABEL_21;
      }
    }

    int v12 = (NSError *)objc_claimAutoreleasedReturnValue([v6 SWCDomain]);
    downloader = self->_downloader;
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v6 SWCApplicationIdentifier]);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_10001B75C;
    void v34[3] = &unk_100031118;
    __int128 v36 = v7;
    id v9 = v9;
    id v35 = v9;
    -[SWCDownloader downloadAASAFileForDomain:applicationIdentifier:completionHandler:]( downloader,  "downloadAASAFileForDomain:applicationIdentifier:completionHandler:",  v12,  v27,  v34);

    id v13 = v36;
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }

  if (qword_100037220 != -1) {
    dispatch_once(&qword_100037220, &stru_100031160);
  }
  id v10 = (os_log_s *)(id)qword_100037218;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t DebugDescription = _SWCServiceApprovalStateGetDebugDescription((*(unsigned __int8 *)[v9 fields] >> 2) & 3);
    id v32 = (id)objc_claimAutoreleasedReturnValue(DebugDescription);
    id v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    *(_DWORD *)buf = 138412802;
    id v44 = v9;
    __int16 v45 = 2114;
    id v46 = v32;
    __int16 v47 = 2048;
    uint64_t v48 = (int)[v33 processIdentifier];
    _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "Entry %@ already has approval state %{public}@, skipping download for interested caller %llu",  buf,  0x20u);
  }

  ((void (**)(id, id, id))v7)[2](v7, v9, 0LL);
LABEL_22:
}

- (BOOL)_connectionIsEntitled:(id)a3 forMutation:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = v5;
  if (v5) {
    [v5 auditToken];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  char v7 = _SWCIsAuditTokenEntitled(v9, v4);

  return v7;
}

- (BOOL)_connectionMayConnect:(id)a3
{
  return -[SWCManager _connectionIsEntitled:forMutation:](self, "_connectionIsEntitled:forMutation:", a3, 0LL);
}

- (id)_developerModeSemaphoreURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](&OBJC_CLASS____SWCPrefs, "sharedPrefs"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 containerURLReturningError:0]);

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 URLByAppendingPathComponent:@".developerMode" isDirectory:0]);
  return v4;
}

- (void)_authorizeDeveloperModeChangeWithCompletionHandler:(id)a3
{
}

- (BOOL)_setDeveloperModeEnabled:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  char v7 = (void *)objc_claimAutoreleasedReturnValue(-[SWCManager _developerModeSemaphoreURL](self, "_developerModeSemaphoreURL"));
  if (!v7)
  {
    if (a4)
    {
      id v11 = objc_alloc(&OBJC_CLASS___NSError);
      v20[0] = &off_100032920;
      v19[0] = @"Line";
      v19[1] = @"Function";
      int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCManager(Private) _setDeveloperModeEnabled:error:]"));
      v19[2] = NSDebugDescriptionErrorKey;
      v20[1] = v12;
      void v20[2] = @"Unable to find path to developer mode semaphore file.";
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  3LL));
      *a4 = -[NSError initWithDomain:code:userInfo:](v11, "initWithDomain:code:userInfo:", _SWCErrorDomain, -1LL, v13);
    }

    return 0;
  }

  if (!v5)
  {
    if (qword_100037220 != -1) {
      dispatch_once(&qword_100037220, &stru_100031160);
    }
    id v14 = (os_log_s *)qword_100037218;
    if (os_log_type_enabled((os_log_t)qword_100037218, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v18 = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Disabling developer mode.", v18, 2u);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned int v16 = [v15 removeItemAtURL:v7 error:a4];

    if (!v16) {
      return 0;
    }
LABEL_16:
    self->_developerModeEnabled = (optional<BOOL>)(v5 | 0x100);
    -[SWCManager updateEntriesForAllBundlesIgnoringCurrentState:]( self,  "updateEntriesForAllBundlesIgnoringCurrentState:",  1LL);
    return 1;
  }

  if (qword_100037220 != -1) {
    dispatch_once(&qword_100037220, &stru_100031160);
  }
  id v8 = (os_log_s *)qword_100037218;
  if (os_log_type_enabled((os_log_t)qword_100037218, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v18 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Enabling developer mode.", v18, 2u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
  unsigned __int8 v10 = [v9 writeToURL:v7 options:1 error:a4];

  if ((v10 & 1) != 0) {
    goto LABEL_16;
  }
  return 0;
}

- (BOOL)_isDeveloperModeEnabled
{
  if (self->_developerModeEnabled.__engaged_)
  {
    unsigned int null_state = self->_developerModeEnabled.var0.__null_state_;
  }

  else
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SWCManager _developerModeSemaphoreURL](self, "_developerModeSemaphoreURL"));
    BOOL v5 = v4;
    if (v4) {
      unsigned int null_state = [v4 checkResourceIsReachableAndReturnError:0];
    }
    else {
      unsigned int null_state = 0;
    }

    self->_developerModeEnabled = (optional<BOOL>)(null_state | 0x100);
  }

  return null_state != 0;
}

- (id)_filterApplicationIdentifiers:(id)a3 toMatchEntitlementOfXPCConnection:(id)a4
{
  id v19 = a3;
  id v18 = a4;
  unsigned int v5 = [v18 processIdentifier];
  if (v5 == getpid())
  {
    if (qword_100037220 != -1) {
      dispatch_once(&qword_100037220, &stru_100031160);
    }
    id v6 = (os_log_s *)qword_100037218;
    if (os_log_type_enabled((os_log_t)qword_100037218, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "Treating connection from self as entitled (additional service details check)",  buf,  2u);
    }

    char v7 = (NSMutableSet *)v19;
    goto LABEL_24;
  }

  id v8 = (NSMutableSet *)objc_claimAutoreleasedReturnValue( [v18 valueForEntitlement:@"com.apple.private.swc.additional-service-details-provider"]);
  if (-[NSMutableSet isEqual:](v8, "isEqual:", @"*"))
  {
    char v7 = (NSMutableSet *)v19;
LABEL_23:

    goto LABEL_24;
  }

  if (!v8)
  {
    char v7 = 0LL;
    goto LABEL_24;
  }

  if ((_NSIsNSArray(v8) & 1) != 0
    || (id v26 = v8,
        char v7 = (NSMutableSet *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v26,  1LL)),  v8,  (v8 = v7) != 0LL))
  {
    char v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS____SWCApplicationIdentifier);
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v10 = v19;
    id v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v21;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
          if ((objc_opt_isKindOfClass(v14, v9) & 1) != 0)
          {
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 rawValue]);
            unsigned int v16 = -[NSMutableSet containsObject:](v8, "containsObject:", v15);

            if (v16) {
              -[NSMutableSet addObject:](v7, "addObject:", v14);
            }
          }
        }

        id v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }

      while (v11);
    }

    goto LABEL_23;
  }

- (id)_createStagingDirectoryForAdditionalServiceDetailsReturningError:(id *)a3
{
  BOOL v4 = objc_autoreleasePoolPush();
  unsigned int v5 = objc_alloc(&OBJC_CLASS___NSString);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  char v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  id v8 = -[NSString initWithFormat:](v5, "initWithFormat:", @"AdditionalServiceDetails/staged-%@", v7);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](&OBJC_CLASS____SWCPrefs, "sharedPrefs"));
  id v19 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 containerURLReturningError:&v19]);
  id v11 = v19;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 URLByAppendingPathComponent:v8 isDirectory:1]);

  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v18 = v11;
    unsigned int v14 = [v13 createDirectoryAtURL:v12 withIntermediateDirectories:1 attributes:0 error:&v18];
    id v15 = v18;

    if (v14) {
      id v16 = v12;
    }
    else {
      id v16 = 0LL;
    }
    id v11 = v15;
  }

  else
  {
    id v16 = 0LL;
  }

  objc_autoreleasePoolPop(v4);
  if (a3 && !v16) {
    *a3 = v11;
  }

  return v16;
}

- (BOOL)_addJSONDataInDictionary:(id)a3 toStagingDirectoryAtURL:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v22 = 0LL;
  __int128 v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  id v25 = sub_10001C340;
  id v26 = sub_10001C350;
  id v27 = 0LL;
  id v9 = [v7 count];
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  uint64_t v21 = 0LL;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10001C358;
  void v13[3] = &unk_100031140;
  uint64_t v17 = objc_opt_class(&OBJC_CLASS____SWCDomain);
  id v10 = v8;
  id v14 = v10;
  id v15 = &v22;
  id v16 = &v18;
  [v7 enumerateKeysAndObjectsUsingBlock:v13];
  id v11 = (id)v19[3];
  if (a5 && v11 != v9) {
    *a5 = (id) v23[5];
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v11 == v9;
}

- (BOOL)_copyStagingDirectoryAtURL:(id)a3 toAdditionalServiceDetailsDirectoriesForApplicationIdentifiers:(id)a4 error:(id *)a5
{
  id v23 = a3;
  id v6 = a4;
  uint64_t v21 = (char *)[v6 count];
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    id v8 = 0LL;
    id v9 = 0LL;
    uint64_t v10 = *(void *)v27;
LABEL_3:
    uint64_t v11 = 0LL;
    while (1)
    {
      if (*(void *)v27 != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(*((void *)&v26 + 1) + 8 * v11);
      id v13 = objc_autoreleasePoolPush();
      id v25 = v9;
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[SWCEntry additionalServiceDetailsDirectoryURLForApplicationIdentifier:createParentIfNeeded:error:]( &OBJC_CLASS___SWCEntry,  "additionalServiceDetailsDirectoryURLForApplicationIdentifier:createParentIfNeeded:error:",  v12,  1LL,  &v25));
      id v15 = v25;

      if (v14)
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        [v16 removeItemAtURL:v14 error:0];

        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        id v24 = v15;
        unsigned int v18 = [v17 copyItemAtURL:v23 toURL:v14 error:&v24];
        id v9 = v24;

        v8 += v18;
      }

      else
      {
        unsigned int v18 = 0;
        id v9 = v15;
      }

      objc_autoreleasePoolPop(v13);
      if (!v18) {
        break;
      }
      if (v7 == (id)++v11)
      {
        id v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  else
  {
    id v8 = 0LL;
    id v9 = 0LL;
  }

  if (a5 && v8 != v21) {
    *a5 = v9;
  }

  return v8 == v21;
}

@end