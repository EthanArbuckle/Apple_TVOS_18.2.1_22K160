@interface PLPlatformLibraryServicesDelegate
+ (Class)platformLibraryServicesDelegateClass;
- (BOOL)shouldSkipFileSystemImportOperation;
- (PLLibraryServicesManager)libraryServicesManager;
- (PLPlatformLibraryServicesDelegate)initWithLibraryServicesManager:(id)a3;
- (id)commonBuiltInOperations;
- (id)logPrefix;
- (id)operationForGreenTeaContactsAuthorizationCheck;
- (id)operationForLocaleChangeCheck;
- (id)operationsForLibraryStateTransition:(int64_t)a3;
- (id)systemLibraryBuiltInOperations;
- (int64_t)migrationType;
- (int64_t)requiredStateForFileSystemImportOperation;
- (void)handleCompletedAllOperationsForLibraryState:(int64_t)a3;
- (void)operationCompletionActivities;
- (void)setMigrationType:(int64_t)a3;
- (void)setShouldSkipFileSystemImportOperation:(BOOL)a3;
@end

@implementation PLPlatformLibraryServicesDelegate

+ (Class)platformLibraryServicesDelegateClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___PLIOSPlatformLibraryServicesDelegate, a2);
}

- (PLPlatformLibraryServicesDelegate)initWithLibraryServicesManager:(id)a3
{
  id v4 = a3;
  v5 = -[PLPlatformLibraryServicesDelegate init](self, "init");
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_libraryServicesManager, v4);
  }

  return v6;
}

- (int64_t)requiredStateForFileSystemImportOperation
{
  return 7LL;
}

- (id)operationsForLibraryStateTransition:(int64_t)a3
{
  v3 = 0LL;
  v17 = sub_10001123C;
  v18 = sub_10001124C;
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  id v19 = 0LL;
  if (a3 == 1)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100011254;
    v13[3] = &unk_100021020;
    v13[4] = &v14;
    v5 = objc_retainBlock(v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PLPlatformLibraryServicesDelegate libraryServicesManager](self, "libraryServicesManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 libraryURL]);
    unsigned int v8 = +[PLPhotoLibraryPathManager isSystemPhotoLibraryURL:]( &OBJC_CLASS___PLPhotoLibraryPathManager,  "isSystemPhotoLibraryURL:",  v7);

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue( -[PLPlatformLibraryServicesDelegate systemLibraryBuiltInOperations]( self,  "systemLibraryBuiltInOperations"));
      ((void (*)(void *, void *))v5[2])(v5, v9);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PLPlatformLibraryServicesDelegate commonBuiltInOperations](self, "commonBuiltInOperations"));
    ((void (*)(void *, void *))v5[2])(v5, v10);

    v3 = (void *)v15[5];
  }

  id v11 = v3;
  _Block_object_dispose(&v14, 8);

  return v11;
}

- (id)systemLibraryBuiltInOperations
{
  uint64_t v3 = PLLibraryServicesOperationNameCreateConstraintsDirectory;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PLPlatformLibraryServicesDelegate libraryServicesManager](self, "libraryServicesManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 preRunningProgress]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100011200;
  v13[3] = &unk_1000211C8;
  v13[4] = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v3,  3LL,  v5,  v13));
  v14[0] = v6;
  uint64_t v7 = PLLibraryServicesOperationNameNotifyLibraryAvailability;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[PLPlatformLibraryServicesDelegate libraryServicesManager](self, "libraryServicesManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 preRunningProgress]);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v7,  6LL,  v9,  &stru_100021040));
  v14[1] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));

  return v11;
}

- (id)operationForLocaleChangeCheck
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000110A8;
  v3[3] = &unk_1000211C8;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  PLLibraryServicesOperationNameLocaleChangeCheck,  6LL,  0LL,  v3));
}

- (id)operationForGreenTeaContactsAuthorizationCheck
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100010FA0;
  v3[3] = &unk_1000211C8;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  PLLibraryServicesOperationNameGreenTeaContactsAuthorizationChangeCheck,  6LL,  0LL,  v3));
}

- (id)commonBuiltInOperations
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PLPlatformLibraryServicesDelegate libraryServicesManager](self, "libraryServicesManager"));
  uint64_t v4 = PLLibraryServicesOperationNameActivateTCC;
  v54 = (void *)objc_claimAutoreleasedReturnValue([v3 preRunningProgress]);
  v53 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v4,  3LL,  v54,  &stru_100021060));
  v82[0] = v53;
  uint64_t v5 = PLLibraryServicesOperationNameCoreAnalyticsSetup;
  v52 = (void *)objc_claimAutoreleasedReturnValue([v3 preRunningProgress]);
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472LL;
  v80[2] = sub_10000FB68;
  v80[3] = &unk_1000211C8;
  id v6 = v3;
  id v81 = v6;
  v51 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v5,  3LL,  v52,  v80));
  v82[1] = v51;
  uint64_t v7 = PLLibraryServicesOperationNameInitChangeHandling;
  v50 = (void *)objc_claimAutoreleasedReturnValue([v6 preRunningProgress]);
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472LL;
  v78[2] = sub_10000FBE8;
  v78[3] = &unk_1000211C8;
  id v8 = v6;
  id v79 = v8;
  v49 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v7,  5LL,  v50,  v78));
  v82[2] = v49;
  uint64_t v9 = PLLibraryServicesOperationNameFilesystemImportNotifyEvent;
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472LL;
  v76[2] = sub_10000FBF0;
  v76[3] = &unk_1000211C8;
  id v10 = v8;
  id v77 = v10;
  v48 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v9,  6LL,  0LL,  v76));
  v82[3] = v48;
  uint64_t v11 = PLLibraryServicesOperationNameCreateSingletonAlbums;
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472LL;
  v73[2] = sub_10000FC20;
  v73[3] = &unk_1000211F0;
  id v12 = v10;
  id v74 = v12;
  v75 = self;
  v46 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v11,  6LL,  0LL,  v73));
  v82[4] = v46;
  uint64_t v13 = PLLibraryServicesOperationNameCrashRecoveryOps;
  v45 = (void *)objc_claimAutoreleasedReturnValue([v12 preRunningProgress]);
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472LL;
  v71[2] = sub_10000FDC8;
  v71[3] = &unk_1000211C8;
  id v14 = v12;
  id v72 = v14;
  v44 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v13,  6LL,  v45,  v71));
  v82[5] = v44;
  uint64_t v15 = PLLibraryServicesOperationNameUpdateGraphLabels;
  v43 = (void *)objc_claimAutoreleasedReturnValue([v14 preRunningProgress]);
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472LL;
  v68[2] = sub_10000FDDC;
  v68[3] = &unk_1000211F0;
  id v16 = v14;
  id v69 = v16;
  v70 = self;
  v42 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v15,  6LL,  v43,  v68));
  v82[6] = v42;
  uint64_t v17 = PLLibraryServicesOperationNameCheckForMediaAnalysisVersionBump;
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472LL;
  v66[2] = sub_10000FEC0;
  v66[3] = &unk_1000211C8;
  id v18 = v16;
  id v67 = v18;
  v41 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v17,  6LL,  0LL,  v66));
  v82[7] = v41;
  uint64_t v19 = PLLibraryServicesOperationNameUpdatePADLibraryOpened;
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472LL;
  v64[2] = sub_10000FF20;
  v64[3] = &unk_1000211C8;
  id v20 = v18;
  id v65 = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v19,  7LL,  0LL,  v64));
  v82[8] = v21;
  uint64_t v22 = PLLibraryServicesOperationNameSpaceAttribution;
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472LL;
  v60[2] = sub_10000FFC0;
  v60[3] = &unk_1000210D8;
  id v23 = v20;
  id v61 = v23;
  v62 = self;
  v24 = self;
  SEL v63 = a2;
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v22,  7LL,  0LL,  v60));
  v82[9] = v25;
  uint64_t v26 = PLLibraryServicesOperationNameThumbnailRebuildReq;
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472LL;
  v58[2] = sub_1000103A4;
  v58[3] = &unk_1000211C8;
  id v27 = v23;
  id v59 = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v26,  7LL,  0LL,  v58));
  v82[10] = v28;
  v29 = v24;
  uint64_t v30 = PLLibraryServicesOperationNameFileSystemImport;
  id v31 = -[PLPlatformLibraryServicesDelegate requiredStateForFileSystemImportOperation]( v29,  "requiredStateForFileSystemImportOperation");
  v32 = (void *)objc_claimAutoreleasedReturnValue([v27 postRunningProgress]);
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472LL;
  v56[2] = sub_100010480;
  v56[3] = &unk_1000211F0;
  v56[4] = v29;
  id v33 = v27;
  id v57 = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v30,  v31,  v32,  v56));
  v82[11] = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v82, 12LL));

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[PLPlatformLibraryServicesDelegate libraryServicesManager](v29, "libraryServicesManager"));
  v37 = (void *)objc_claimAutoreleasedReturnValue([v36 pathManager]);
  LODWORD(v34) = +[PLRebuildJournalManager isEnabledWithPathManager:error:]( &OBJC_CLASS___PLRebuildJournalManager,  "isEnabledWithPathManager:error:",  v37,  0LL);

  if ((_DWORD)v34)
  {
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472LL;
    v55[2] = sub_100010628;
    v55[3] = &unk_1000211C8;
    v55[4] = v29;
    v38 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  PLLibraryServicesOperationNameStartJournalManager,  7LL,  0LL,  v55));
    uint64_t v39 = objc_claimAutoreleasedReturnValue([v35 arrayByAddingObject:v38]);

    v35 = (void *)v39;
  }

  return v35;
}

- (void)operationCompletionActivities
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PLPlatformLibraryServicesDelegate libraryServicesManager](self, "libraryServicesManager"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 modelMigrator]);
  id v15 = (id)objc_claimAutoreleasedReturnValue([v4 analyticsEventManager]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PLPlatformLibraryServicesDelegate libraryServicesManager](self, "libraryServicesManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v5 wellKnownPhotoLibraryIdentifier]));
  uint64_t v7 = PLCoreAnalyticsLibraryEventWellKnownIdentifierKey;
  uint64_t v8 = PLCoreAnalyticsLibraryCreateEvent;
  [v15 setPayloadValue:v6 forKey:PLCoreAnalyticsLibraryEventWellKnownIdentifierKey onlyOnExistingEventWithName:PLCoreAnalyticsLibraryCreateEvent];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PLPlatformLibraryServicesDelegate libraryServicesManager](self, "libraryServicesManager"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v9 wellKnownPhotoLibraryIdentifier]));
  uint64_t v11 = PLCoreAnalyticsLibraryMigrateEvent;
  [v15 setPayloadValue:v10 forKey:v7 onlyOnExistingEventWithName:PLCoreAnalyticsLibraryMigrateEvent];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PLPlatformLibraryServicesDelegate libraryServicesManager](self, "libraryServicesManager"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v12 wellKnownPhotoLibraryIdentifier]));
  uint64_t v14 = PLCoreAnalyticsLibraryRebuildEvent;
  [v15 setPayloadValue:v13 forKey:v7 onlyOnExistingEventWithName:PLCoreAnalyticsLibraryRebuildEvent];

  [v15 publishEventWithName:v8];
  [v15 publishEventWithName:v11];
  [v15 publishEventWithName:v14];
}

- (void)handleCompletedAllOperationsForLibraryState:(int64_t)a3
{
  uint64_t v5 = 2LL;
  switch(a3)
  {
    case 1LL:
      goto LABEL_8;
    case 2LL:
      uint64_t v5 = 3LL;
      goto LABEL_8;
    case 3LL:
      uint64_t v5 = 4LL;
      goto LABEL_8;
    case 4LL:
      uint64_t v5 = 5LL;
      goto LABEL_8;
    case 5LL:
      uint64_t v5 = 6LL;
      goto LABEL_8;
    case 6LL:
      goto LABEL_7;
    case 7LL:
      -[PLPlatformLibraryServicesDelegate operationCompletionActivities](self, "operationCompletionActivities");
LABEL_7:
      uint64_t v5 = 7LL;
LABEL_8:
      if (v5 != a3)
      {
        id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PLPlatformLibraryServicesDelegate libraryServicesManager](self, "libraryServicesManager"));
        id v14 = 0LL;
        unsigned __int8 v7 = [v6 transitionToState:v5 error:&v14];
        id v8 = v14;

        if ((v7 & 1) == 0)
        {
          uint64_t Log = PLLibraryServicesGetLog();
          id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[PLPlatformLibraryServicesDelegate logPrefix](self, "logPrefix"));
            uint64_t v12 = PLStringFromLibraryServicesState(v5);
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
            *(_DWORD *)buf = 138543874;
            id v16 = v11;
            __int16 v17 = 2114;
            id v18 = v13;
            __int16 v19 = 2114;
            id v20 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%{public}@: Failed to perform built-in transition to %{public}@: %{public}@",  buf,  0x20u);
          }
        }
      }

      break;
    default:
      return;
  }

- (id)logPrefix
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PLPlatformLibraryServicesDelegate libraryServicesManager](self, "libraryServicesManager"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 logPrefix]);

  return v3;
}

- (PLLibraryServicesManager)libraryServicesManager
{
  return (PLLibraryServicesManager *)objc_loadWeakRetained((id *)&self->_libraryServicesManager);
}

- (int64_t)migrationType
{
  return self->_migrationType;
}

- (void)setMigrationType:(int64_t)a3
{
  self->_migrationType = a3;
}

- (BOOL)shouldSkipFileSystemImportOperation
{
  return self->_shouldSkipFileSystemImportOperation;
}

- (void)setShouldSkipFileSystemImportOperation:(BOOL)a3
{
  self->_shouldSkipFileSystemImportOperation = a3;
}

- (void).cxx_destruct
{
}

@end