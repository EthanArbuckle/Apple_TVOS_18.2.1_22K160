@interface NSPersistentStoreCoordinator
- (BOOL)destroyPersistentStoreWithDescription:(id)a3 error:(id *)a4;
@end

@implementation NSPersistentStoreCoordinator

- (BOOL)destroyPersistentStoreWithDescription:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (_TUIsInternalInstall())
  {
    v26 = a4;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 URL]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByDeletingPathExtension]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingString:@"-corrupt"]);

    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 pathExtension]);
    if (v11)
    {
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathExtension:v11]);

      v10 = (void *)v12;
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue([v7 URLByDeletingLastPathComponent]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 URLByAppendingPathComponent:v10 isDirectory:0]);

    v15 = (void *)objc_claimAutoreleasedReturnValue([v6 options]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v6 type]);
    id v27 = 0LL;
    unsigned __int8 v17 = -[NSPersistentStoreCoordinator replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:storeType:error:]( self,  "replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:storeType:error:",  v14,  v15,  v7,  v15,  v16,  &v27);
    id v18 = v27;

    if ((v17 & 1) == 0)
    {
      uint64_t v19 = FTCServiceLog();
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10000CE2C((uint64_t)v6, (uint64_t)v18, v20);
      }
    }

    a4 = v26;
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue([v6 URL]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v6 type]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v6 options]);
  BOOL v24 = -[NSPersistentStoreCoordinator destroyPersistentStoreAtURL:withType:options:error:]( self,  "destroyPersistentStoreAtURL:withType:options:error:",  v21,  v22,  v23,  a4);

  return v24;
}

@end