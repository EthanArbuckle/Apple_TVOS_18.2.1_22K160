@interface PLMacPlatformLibraryServicesDelegate
- (BOOL)performedLegacyMigration;
- (id)commonBuiltInOperations;
- (id)systemLibraryBuiltInOperations;
- (void)setPerformedLegacyMigration:(BOOL)a3;
@end

@implementation PLMacPlatformLibraryServicesDelegate

- (id)systemLibraryBuiltInOperations
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PLPlatformLibraryServicesDelegate libraryServicesManager](self, "libraryServicesManager"));
  uint64_t v4 = PLMacPlatformLibraryServicesOperationNameCheckForAutoCreateSPL;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 preRunningProgress]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100011DA8;
  v21[3] = &unk_1000211C8;
  id v6 = v3;
  id v22 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v4,  3LL,  v5,  v21));
  v23[0] = v7;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100011E3C;
  v20[3] = &unk_1000211C8;
  v20[4] = self;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  PLMacPlatformLibraryServicesOperationNameNotifySPLMigrated,  7LL,  0LL,  v20));
  v23[1] = v8;
  uint64_t v9 = PLMacPlatformLibraryServicesOperationNameInitializePhotoStream;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100011E74;
  v18[3] = &unk_1000211F0;
  v18[4] = self;
  id v19 = v6;
  id v10 = v6;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v9,  7LL,  0LL,  v18));
  v23[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 3LL));

  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PLMacPlatformLibraryServicesDelegate;
  id v13 = -[PLPlatformLibraryServicesDelegate systemLibraryBuiltInOperations](&v17, "systemLibraryBuiltInOperations");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 arrayByAddingObjectsFromArray:v12]);

  return v15;
}

- (id)commonBuiltInOperations
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PLPlatformLibraryServicesDelegate libraryServicesManager](self, "libraryServicesManager"));
  uint64_t v4 = PLMacPlatformLibraryServicesOperationNameCheckFilesystemForSyncRoot;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_1000119B0;
  v52[3] = &unk_1000211C8;
  id v5 = v3;
  id v53 = v5;
  v38 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v4,  1LL,  0LL,  v52));
  v54[0] = v38;
  uint64_t v6 = PLMacPlatformLibraryServicesOperationNameMigrateOrRebuild;
  v37 = (void *)objc_claimAutoreleasedReturnValue([v5 preRunningProgress]);
  v36 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v6,  4LL,  v37,  &stru_100021230));
  v54[1] = v36;
  uint64_t v7 = PLLibraryServicesOperationNameBackupExclusionAttribute;
  v35 = (void *)objc_claimAutoreleasedReturnValue([v5 preRunningProgress]);
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_100011BF8;
  v50[3] = &unk_1000211C8;
  id v8 = v5;
  id v51 = v8;
  v34 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v7,  5LL,  v35,  v50));
  v54[2] = v34;
  uint64_t v9 = PLMacPlatformLibraryServicesOperationNameInitCPLManager;
  v32 = (void *)objc_claimAutoreleasedReturnValue([v8 preRunningProgress]);
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_100011C30;
  v48[3] = &unk_1000211C8;
  id v10 = v8;
  id v49 = v10;
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v9,  5LL,  v32,  v48));
  v54[3] = v31;
  v30 = (void *)objc_claimAutoreleasedReturnValue( -[PLPlatformLibraryServicesDelegate operationForLocaleChangeCheck]( self,  "operationForLocaleChangeCheck"));
  v54[4] = v30;
  uint64_t v11 = PLMacPlatformLibraryServicesOperationNameDuplicateMergeCrashRecovery;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_100011C4C;
  v46[3] = &unk_1000211C8;
  id v12 = v10;
  id v47 = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v11,  6LL,  0LL,  v46));
  v54[5] = v13;
  uint64_t v14 = PLiOSPlatformLibraryServicesOperationNameAssetCreationRecovery;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_100011C90;
  v44[3] = &unk_1000211C8;
  id v15 = v12;
  id v45 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v14,  7LL,  0LL,  v44));
  v54[6] = v16;
  objc_super v17 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  PLMacPlatformLibraryServicesOperationNameCleanInvalidSSB,  7LL,  0LL,  &stru_100021250));
  v54[7] = v17;
  uint64_t v18 = PLMacPlatformLibraryServicesOperationNameRegisterBackgroundJobService;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_100011CD4;
  v42[3] = &unk_1000211C8;
  id v19 = v15;
  id v43 = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v18,  7LL,  0LL,  v42));
  v54[8] = v20;
  uint64_t v21 = PLMacPlatformLibraryServicesOperationNameInitCacheDeleteSupport;
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v19 preRunningProgress]);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_100011D2C;
  v40[3] = &unk_1000211C8;
  id v41 = v19;
  id v23 = v19;
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v21,  7LL,  v22,  v40));
  v54[9] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v54, 10LL));

  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___PLMacPlatformLibraryServicesDelegate;
  id v26 = -[PLPlatformLibraryServicesDelegate commonBuiltInOperations](&v39, "commonBuiltInOperations");
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 arrayByAddingObjectsFromArray:v25]);

  return v28;
}

- (BOOL)performedLegacyMigration
{
  return self->_performedLegacyMigration;
}

- (void)setPerformedLegacyMigration:(BOOL)a3
{
  self->_performedLegacyMigration = a3;
}

@end