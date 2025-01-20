@interface PLWatchPlatformLibraryServicesDelegate
- (id)commonBuiltInOperations;
- (id)systemLibraryBuiltInOperations;
@end

@implementation PLWatchPlatformLibraryServicesDelegate

- (id)systemLibraryBuiltInOperations
{
  return &__NSArray0__struct;
}

- (id)commonBuiltInOperations
{
  uint64_t v3 = PLWatchPlatformLibraryServicesOperationNameWaitForFirstUnlock;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PLPlatformLibraryServicesDelegate libraryServicesManager](self, "libraryServicesManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 preRunningProgress]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v3,  2LL,  v5,  &stru_100020C38));
  v26[0] = v6;
  uint64_t v7 = PLWatchPlatformLibraryServicesOperationNameMigrateOrRebuild;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PLPlatformLibraryServicesDelegate libraryServicesManager](self, "libraryServicesManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 preRunningProgress]);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10000620C;
  v25[3] = &unk_1000211C8;
  v25[4] = self;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v7,  4LL,  v9,  v25));
  v26[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 2LL));

  if (PLPlatformCloudPhotosPrimarySyncSupported())
  {
    uint64_t v12 = PLWatchPlatformLibraryServicesOperationNameInitCPLManager;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PLPlatformLibraryServicesDelegate libraryServicesManager](self, "libraryServicesManager"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 preRunningProgress]);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100006460;
    v24[3] = &unk_1000211C8;
    v24[4] = self;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[PLLibraryServicesOperation operationWithName:requiredState:parentProgress:execution:]( &OBJC_CLASS___PLLibraryServicesOperation,  "operationWithName:requiredState:parentProgress:execution:",  v12,  5LL,  v14,  v24));
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v11 arrayByAddingObject:v15]);

    v11 = (void *)v16;
  }

  if (PLIsChinaSKU())
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( -[PLPlatformLibraryServicesDelegate operationForGreenTeaContactsAuthorizationCheck]( self,  "operationForGreenTeaContactsAuthorizationCheck"));
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v11 arrayByAddingObject:v17]);

    v11 = (void *)v18;
  }

  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___PLWatchPlatformLibraryServicesDelegate;
  id v19 = -[PLPlatformLibraryServicesDelegate commonBuiltInOperations](&v23, "commonBuiltInOperations");
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 arrayByAddingObjectsFromArray:v11]);

  return v21;
}

@end