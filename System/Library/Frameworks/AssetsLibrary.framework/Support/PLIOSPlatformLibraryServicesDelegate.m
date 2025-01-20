@interface PLIOSPlatformLibraryServicesDelegate
- (id)commonBuiltInOperations;
- (id)systemLibraryBuiltInOperations;
- (int64_t)requiredStateForFileSystemImportOperation;
- (void)_abortWithMigrationFailureError:(id)a3;
- (void)_abortWithMigrationFailureReasonEACCES;
- (void)_abortWithMigrationFailureReasonENOSPC;
@end

@implementation PLIOSPlatformLibraryServicesDelegate

- (int64_t)requiredStateForFileSystemImportOperation
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PLIOSPlatformLibraryServicesDelegate;
  id v3 = -[PLPlatformLibraryServicesDelegate requiredStateForFileSystemImportOperation]( &v7,  "requiredStateForFileSystemImportOperation");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PLPlatformLibraryServicesDelegate libraryServicesManager](self, "libraryServicesManager"));
  unsigned __int8 v5 = [v4 createOptions];

  if ((v5 & 8) != 0) {
    return 6LL;
  }
  else {
    return (int64_t)v3;
  }
}

- (id)systemLibraryBuiltInOperations
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PLPlatformLibraryServicesDelegate libraryServicesManager](self, "libraryServicesManager"));
  uint64_t v4 = PLiOSPlatformLibraryServicesOperationNameInitializePhotoStream;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100003BE0;
  v13[3] = &unk_1000211F0;
  v13[4] = self;
  id v14 = v3;
  id v5 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v4,  7LL,  0LL,  v13));
  v15 = v6;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PLIOSPlatformLibraryServicesDelegate;
  id v8 = -[PLPlatformLibraryServicesDelegate systemLibraryBuiltInOperations](&v12, "systemLibraryBuiltInOperations");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 arrayByAddingObjectsFromArray:v7]);

  return v10;
}

- (void)_abortWithMigrationFailureReasonEACCES
{
  uint64_t Log = PLMigrationGetLog(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v7, 0xCu);
  }

  __break(1u);
}

- (void)_abortWithMigrationFailureReasonENOSPC
{
  uint64_t Log = PLMigrationGetLog(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v7, 0xCu);
  }

  __break(1u);
}

- (void)_abortWithMigrationFailureError:(id)a3
{
  id v4 = a3;
  if (PLIsErrorSQLiteDiskFull()) {
    -[PLIOSPlatformLibraryServicesDelegate _abortWithMigrationFailureReasonENOSPC]( self,  "_abortWithMigrationFailureReasonENOSPC");
  }
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  v27 = v4;
  uint64_t v5 = PLTopLevelErrorAndAllUnderlyingErrors(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v11 domain]);
        unsigned int v13 = [v12 isEqualToString:NSCocoaErrorDomain];

        if (!v13)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue([v11 domain]);
          unsigned int v16 = [v15 isEqualToString:NSPOSIXErrorDomain];

          if (!v16) {
            continue;
          }
          id v17 = [v11 code];
          if (v17 != (id)28)
          {
            if (v17 != (id)13) {
              continue;
            }
LABEL_15:
            -[PLIOSPlatformLibraryServicesDelegate _abortWithMigrationFailureReasonEACCES]( self,  "_abortWithMigrationFailureReasonEACCES");
            continue;
          }

- (id)commonBuiltInOperations
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PLPlatformLibraryServicesDelegate libraryServicesManager](self, "libraryServicesManager"));
  uint64_t v4 = PLiOSPlatformLibraryServicesOperationNameWaitForFirstUnlock;
  v33 = (void *)objc_claimAutoreleasedReturnValue([v3 preRunningProgress]);
  v32 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v4,  2LL,  v33,  &stru_100020BA0));
  v47[0] = v32;
  uint64_t v5 = PLiOSPlatformLibraryServicesOperationNameMigrateOrRebuild;
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v3 preRunningProgress]);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_100003590;
  v44[3] = &unk_1000211F0;
  id v6 = v3;
  id v45 = v6;
  v46 = self;
  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v5,  4LL,  v31,  v44));
  v47[1] = v30;
  uint64_t v7 = PLiOSPlatformLibraryServicesOperationNameInitCPLManager;
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v6 preRunningProgress]);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_100003AB0;
  v42[3] = &unk_1000211C8;
  id v8 = v6;
  id v43 = v8;
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v7,  5LL,  v29,  v42));
  v47[2] = v28;
  uint64_t v9 = PLLibraryServicesOperationNameBackupExclusionAttribute;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 preRunningProgress]);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_100003ACC;
  v40[3] = &unk_1000211C8;
  id v11 = v8;
  id v41 = v11;
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v9,  5LL,  v10,  v40));
  v47[3] = v12;
  v34 = self;
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( -[PLPlatformLibraryServicesDelegate operationForLocaleChangeCheck]( self,  "operationForLocaleChangeCheck"));
  v47[4] = v13;
  uint64_t v14 = PLiOSPlatformLibraryServicesOperationNameRegisterBackgroundJobService;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_100003B60;
  v38[3] = &unk_1000211C8;
  id v15 = v11;
  id v39 = v15;
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v14,  7LL,  0LL,  v38));
  v47[5] = v16;
  uint64_t v17 = PLiOSPlatformLibraryServicesOperationNameInitCacheDeleteSupport;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v15 preRunningProgress]);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_100003BB8;
  v36[3] = &unk_1000211C8;
  id v19 = v15;
  id v37 = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v17,  7LL,  v18,  v36));
  v47[6] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v47, 7LL));

  if (PLIsChinaSKU())
  {
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( -[PLPlatformLibraryServicesDelegate operationForGreenTeaContactsAuthorizationCheck]( v34,  "operationForGreenTeaContactsAuthorizationCheck"));
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v21 arrayByAddingObject:v22]);

    v21 = (void *)v23;
  }

  v35.receiver = v34;
  v35.super_class = (Class)&OBJC_CLASS___PLIOSPlatformLibraryServicesDelegate;
  id v24 = -[PLPlatformLibraryServicesDelegate commonBuiltInOperations](&v35, "commonBuiltInOperations");
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 arrayByAddingObjectsFromArray:v21]);

  return v26;
}

@end