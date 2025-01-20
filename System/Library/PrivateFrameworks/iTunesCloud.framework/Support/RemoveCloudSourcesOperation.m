@interface RemoveCloudSourcesOperation
+ (id)_icCloudSourceToMLCloudSourceMap;
+ (id)_icCloudSourceToMLCloudSourceMapDescription;
- (BOOL)deleteDB;
- (BOOL)disableActiveLockerAccount;
- (NSSet)removeCloudSouceAttributes;
- (id)_mlRemoveSourceAttributeFromICRemoveSource;
- (id)_removeCloudSourcesDescription;
- (void)main;
- (void)setDeleteDB:(BOOL)a3;
- (void)setDisableActiveLockerAccount:(BOOL)a3;
- (void)setRemoveCloudSouceAttributes:(id)a3;
@end

@implementation RemoveCloudSourcesOperation

- (void)main
{
  if (sub_1000B1B34())
  {
    -[CloudLibraryOperation setStatus:](self, "setStatus:", 1LL);
    v3 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v71 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Not running RemoveCloudSourcesOperation on non standalone wOS platform",  buf,  0xCu);
    }
  }

  else
  {
    v4 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v5 = -[RemoveCloudSourcesOperation deleteDB](self, "deleteDB");
      unsigned int v6 = -[RemoveCloudSourcesOperation disableActiveLockerAccount](self, "disableActiveLockerAccount");
      v7 = (void *)objc_claimAutoreleasedReturnValue( -[RemoveCloudSourcesOperation _removeCloudSourcesDescription]( self,  "_removeCloudSourcesDescription"));
      *(_DWORD *)buf = 138544130;
      v71 = self;
      __int16 v72 = 1024;
      *(_DWORD *)v73 = v5;
      *(_WORD *)&v73[4] = 1024;
      *(_DWORD *)&v73[6] = v6;
      *(_WORD *)v74 = 2114;
      *(void *)&v74[2] = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Starting deleteDB=%{BOOL}u, disableActiveLockerAccount=%{BOOL}u, removeSources=%{public}@",  buf,  0x22u);
    }

    v3 = (os_log_s *)[[MSVXPCTransaction alloc] initWithName:@"RemoveCloudSourcesOperation"];
    -[os_log_s beginTransaction](v3, "beginTransaction");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
    [v8 setClientIdentity:v9];

    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    double v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
    v13 = v12;
    if (LOBYTE(self->super._status))
    {
      v14 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v71 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Deleting database for deauthentication request",  buf,  0xCu);
      }

      [v13 emptyAllTables];
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v13 originalArtworkDirectory]);
      [v15 removeItemAtPath:v16 error:0];

      v17 = (void *)objc_claimAutoreleasedReturnValue([v13 rootArtworkCacheDirectory]);
      [v15 removeItemAtPath:v17 error:0];
    }

    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v12 sagaCloudLibraryCUID]);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v13 sagaCloudLibraryTroveID]);
      if ([v15 length] && objc_msgSend(v17, "length"))
      {
        v18 = objc_alloc(&OBJC_CLASS___CloudLibraryOptOutOperation);
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation configuration](self, "configuration"));
        v20 = -[CloudLibraryOptOutOperation initWithConfiguration:CUID:troveID:]( v18,  "initWithConfiguration:CUID:troveID:",  v19,  v15,  v17);

        -[CloudLibraryOptOutOperation setName:]( v20,  "setName:",  @"com.apple.itunescloudd.DisableCloudLibrary.optOutOperation");
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[ICDServer server](&OBJC_CLASS___ICDServer, "server"));
        [v21 addOperation:v20 priority:1];
      }

      uint64_t v22 = objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation userIdentity](self, "userIdentity"));
      id v67 = 0LL;
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation userIdentityStore](self, "userIdentityStore"));
      v23 = (void *)objc_claimAutoreleasedReturnValue([v55 getPropertiesForUserIdentity:v22 error:&v67]);
      id v56 = v67;
      v57 = v23;
      v54 = (void *)v22;
      if (v56 || !v23)
      {
        v32 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v71 = self;
          __int16 v72 = 2114;
          *(void *)v73 = v56;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Error (%{public}@) loading account properties. Not removing locker bit from account",  buf,  0x16u);
        }
      }

      else
      {
        unsigned int v24 = [v23 isActiveLocker];
        v25 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue([v23 DSID]);
          uint64_t v27 = ICCreateLoggableValueForDSID();
          v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
          *(_DWORD *)buf = 138543874;
          v71 = self;
          __int16 v72 = 2114;
          *(void *)v73 = v28;
          *(_WORD *)&v73[8] = 1024;
          *(_DWORD *)v74 = v24;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - DSID=%{public}@, isActiveLocker=%{BOOL}u",  buf,  0x1Cu);
        }

        if (BYTE1(self->super._status)) {
          unsigned int v29 = v24;
        }
        else {
          unsigned int v29 = 0;
        }
        if (v29 == 1)
        {
          dispatch_semaphore_t v30 = dispatch_semaphore_create(0LL);
          v31 = (void *)objc_claimAutoreleasedReturnValue([v57 DSID]);
          v63[0] = _NSConcreteStackBlock;
          v63[1] = 3221225472LL;
          v63[2] = sub_1000CE688;
          v63[3] = &unk_1001A5568;
          v32 = v30;
          v64 = v32;
          v65 = self;
          id v66 = v57;
          [v55 disableLockerAccountWithDSID:v31 completionHandler:v63];

          uint64_t v33 = dispatch_semaphore_wait((dispatch_semaphore_t)v32, 0xFFFFFFFFFFFFFFFFLL);
          ICSiriPostDynamiteClientStateChangedNotification(v33);
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterPostNotification( DarwinNotifyCenter,  ICCloudClientIsAuthenticatedDidChangeNotification,  0LL,  0LL,  1u);
          v35 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v71 = self;
            _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_INFO,  "%{public}@ - Posting notification [ICCloudClientIsAuthenticatedDidChangeNotification]",  buf,  0xCu);
          }
        }

        else
        {
          v32 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            v53 = (void *)objc_claimAutoreleasedReturnValue([v57 DSID]);
            uint64_t v36 = ICCreateLoggableValueForDSID();
            v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
            int v38 = BYTE1(self->super._status);
            *(_DWORD *)buf = 138544130;
            v71 = self;
            __int16 v72 = 2114;
            *(void *)v73 = v37;
            *(_WORD *)&v73[8] = 1024;
            *(_DWORD *)v74 = v38;
            *(_WORD *)&v74[4] = 1024;
            *(_DWORD *)&v74[6] = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Not disabling locker account=%{public}@, _disableActiveLockerAccount=%{BOOL}u, isActiveLocker=%{BOOL}u",  buf,  0x22u);
          }
        }
      }

      v39 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v71 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Cancelling any outstanding saga track downloads.",  buf,  0xCu);
      }

      sub_10006AF64(v13);
      v40 = (void *)objc_claimAutoreleasedReturnValue( -[RemoveCloudSourcesOperation _mlRemoveSourceAttributeFromICRemoveSource]( self,  "_mlRemoveSourceAttributeFromICRemoveSource"));
      uint64_t v68 = MLDatabaseOperationAttributeRemoveCloudSourcesKey;
      v69 = v40;
      v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v69,  &v68,  1LL));
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472LL;
      v61[2] = sub_1000CE780;
      v61[3] = &unk_1001A5AC0;
      dispatch_semaphore_t v62 = dispatch_semaphore_create(0LL);
      v42 = v62;
      [v13 removeCloudSourcesWithAttributes:v41 completionHandler:v61];
      dispatch_semaphore_wait(v42, 0xFFFFFFFFFFFFFFFFLL);
    }

    dispatch_semaphore_t v43 = dispatch_semaphore_create(0LL);
    v44 = (void *)objc_claimAutoreleasedReturnValue([v13 databasePath]);
    v45 = (void *)objc_claimAutoreleasedReturnValue( +[MLMediaLibraryService sharedMediaLibraryService]( &OBJC_CLASS___MLMediaLibraryService,  "sharedMediaLibraryService"));
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472LL;
    v58[2] = sub_1000CE788;
    v58[3] = &unk_1001A5590;
    v46 = v43;
    v59 = v46;
    v60 = self;
    [v45 performMaintenanceTasksForDatabaseAtPath:v44 withCompletionHandler:v58];

    dispatch_semaphore_wait(v46, 0xFFFFFFFFFFFFFFFFLL);
    [v13 notifyContentsDidChange];
    v47 = objc_alloc_init(&OBJC_CLASS___CSSearchableIndex);
    -[CSSearchableIndex deleteInteractionsWithGroupIdentifiers:bundleID:protectionClass:completionHandler:]( v47,  "deleteInteractionsWithGroupIdentifiers:bundleID:protectionClass:completionHandler:",  &off_1001B4BD8,  @"com.apple.Music",  0LL,  &stru_1001A55B0);

    v48 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
      *(_DWORD *)buf = 138543618;
      v71 = self;
      __int16 v72 = 2048;
      *(double *)v73 = v49 - v11;
      _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Completed disabling cloud library in %.2f seconds",  buf,  0x16u);
    }

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
    uint64_t v51 = MSVTCCIdentityForCurrentProcess();
    v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
    [v50 setClientIdentity:v52];

    -[os_log_s endTransaction](v3, "endTransaction");
  }
}

- (id)_mlRemoveSourceAttributeFromICRemoveSource
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RemoveCloudSourcesOperation removeCloudSouceAttributes](self, "removeCloudSouceAttributes"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000CE614;
  v11[3] = &unk_1001A55D8;
  id v5 = v3;
  id v12 = v5;
  [v4 enumerateObjectsUsingBlock:v11];
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  id v7 = [v6 sagaOnDiskDatabaseRevision];

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[RemoveCloudSourcesOperation _icCloudSourceToMLCloudSourceMap]( &OBJC_CLASS___RemoveCloudSourcesOperation,  "_icCloudSourceToMLCloudSourceMap"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:&off_1001B4138]);
    [v5 addObject:v9];
  }

  return v5;
}

- (id)_removeCloudSourcesDescription
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  double v10 = sub_1000CE55C;
  double v11 = sub_1000CE56C;
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RemoveCloudSourcesOperation removeCloudSouceAttributes](self, "removeCloudSouceAttributes"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000CE574;
  v6[3] = &unk_1001A5600;
  v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];
  id v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)deleteDB
{
  return self->super._status;
}

- (void)setDeleteDB:(BOOL)a3
{
  LOBYTE(self->super._status) = a3;
}

- (BOOL)disableActiveLockerAccount
{
  return BYTE1(self->super._status);
}

- (void)setDisableActiveLockerAccount:(BOOL)a3
{
  BYTE1(self->super._status) = a3;
}

- (NSSet)removeCloudSouceAttributes
{
  return (NSSet *)self->super._error;
}

- (void)setRemoveCloudSouceAttributes:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)_icCloudSourceToMLCloudSourceMap
{
  v3[0] = &off_1001B4150;
  v3[1] = &off_1001B4168;
  v4[0] = MLDatabaseOperationAttributeRemovePurchaseHistoryKey;
  v4[1] = MLDatabaseOperationAttributeRemovePurchaseHistoryForMediaItemsKey;
  v3[2] = &off_1001B4180;
  v3[3] = &off_1001B4138;
  v4[2] = MLDatabaseOperationAttributeRemoveSubscriptionContentKey;
  v4[3] = MLDatabaseOperationAttributeRemoveMatchKey;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL));
}

+ (id)_icCloudSourceToMLCloudSourceMapDescription
{
  if (qword_1001DB7C0 != -1) {
    dispatch_once(&qword_1001DB7C0, &stru_1001A5620);
  }
  return (id)qword_1001DB7B8;
}

@end