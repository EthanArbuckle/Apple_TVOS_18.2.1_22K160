@interface SHLCloudLibraryCache
- (BOOL)commitTransactionWithError:(id *)a3;
- (BOOL)createBundleDirectory;
- (BOOL)createPrivateDatabaseFolderPathWithError:(id *)a3;
- (BOOL)createTaskFolderPaths;
- (BOOL)createZoneFolderPathWithError:(id *)a3;
- (BOOL)doesCacheDirectoryExist;
- (BOOL)doesLegacyCacheDirectoryExist;
- (BOOL)doesPrivateDatabaseFolderPathExist;
- (BOOL)doesTaskFolderPathsExist;
- (BOOL)doesZoneFolderPathExist;
- (BOOL)migrateWithError:(id *)a3;
- (BOOL)needsMigration;
- (BOOL)removeDatabaseTokenWithError:(id *)a3;
- (BOOL)removeSubscriptionForZoneIdentifier:(id)a3 error:(id *)a4;
- (BOOL)removeTaskOfType:(int64_t)a3 forIdentifier:(id)a4 error:(id *)a5;
- (BOOL)removeTokenAtPath:(id)a3 error:(id *)a4;
- (BOOL)removeTokenForZoneIdentifier:(id)a3 error:(id *)a4;
- (BOOL)removeZoneIdentifier:(id)a3 error:(id *)a4;
- (BOOL)resetWithError:(id *)a3;
- (BOOL)startTransactionWithError:(id *)a3;
- (BOOL)storeDatabaseToken:(id)a3 error:(id *)a4;
- (BOOL)storeSubscription:(id)a3 forZoneIdentifier:(id)a4 error:(id *)a5;
- (BOOL)storeTask:(id)a3 ofType:(int64_t)a4 error:(id *)a5;
- (BOOL)storeZoneIdentifier:(id)a3 error:(id *)a4;
- (BOOL)storeZoneToken:(id)a3 forZoneIdentifier:(id)a4 error:(id *)a5;
- (BOOL)subscriptionExistsForZoneIdentifier:(id)a3;
- (BOOL)undoTransactionWithError:(id *)a3;
- (BOOL)writeToken:(id)a3 toPath:(id)a4 error:(id *)a5;
- (BOOL)zoneExistsForIdentifier:(id)a3;
- (NSString)containerID;
- (NSString)processID;
- (NSUUID)transactionID;
- (SHLCloudLibraryCache)initWithCallingProcessIdentifier:(id)a3 containerIdentifier:(id)a4 transactionIdentifier:(id)a5;
- (id)bundleDirectory;
- (id)cacheDirectory;
- (id)currentDatabaseFolderPath;
- (id)databaseToken;
- (id)failedFolderPath;
- (id)failedTaskPathForIdentifier:(id)a3;
- (id)inflightFolderPath;
- (id)inflightTaskPathForIdentifier:(id)a3;
- (id)legacyCacheDirectory;
- (id)privateDatabaseFolderPath;
- (id)privateDatabaseTransactionPath;
- (id)rootDirectory;
- (id)taskForFilePath:(id)a3;
- (id)taskOfType:(int64_t)a3 identifier:(id)a4;
- (id)tasksForFolderPath:(id)a3 ofType:(int64_t)a4;
- (id)tasksOfType:(int64_t)a3;
- (id)zonePathForIdentifier:(id)a3;
- (id)zoneTokenForZoneIdentifier:(id)a3;
- (id)zonesFolderPath;
- (void)removeAllTasksOfType:(int64_t)a3;
@end

@implementation SHLCloudLibraryCache

- (SHLCloudLibraryCache)initWithCallingProcessIdentifier:(id)a3 containerIdentifier:(id)a4 transactionIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SHLCloudLibraryCache;
  v12 = -[SHLCloudLibraryCache init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_processID, a3);
    objc_storeStrong((id *)&v13->_containerID, a4);
    objc_storeStrong((id *)&v13->_transactionID, a5);
  }

  return v13;
}

- (BOOL)resetWithError:(id *)a3
{
  if (-[SHLCloudLibraryCache doesCacheDirectoryExist](self, "doesCacheDirectoryExist"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache cacheDirectory](self, "cacheDirectory"));
    unsigned __int8 v7 = [v5 removeItemAtPath:v6 error:a3];
  }

  else
  {
    unsigned __int8 v7 = 1;
  }

  if (-[SHLCloudLibraryCache doesLegacyCacheDirectoryExist](self, "doesLegacyCacheDirectoryExist"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache legacyCacheDirectory](self, "legacyCacheDirectory"));
    [v8 removeItemAtPath:v9 error:a3];
  }

  return v7;
}

- (BOOL)storeTask:(id)a3 ofType:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (!-[SHLCloudLibraryCache doesTaskFolderPathsExist](self, "doesTaskFolderPathsExist")
    && !-[SHLCloudLibraryCache createTaskFolderPaths](self, "createTaskFolderPaths"))
  {
    unsigned __int8 v11 = 0;
    goto LABEL_18;
  }

  if (a4 == 1)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache failedTaskPathForIdentifier:](self, "failedTaskPathForIdentifier:", v9));
  }

  else
  {
    if (a4)
    {
      v12 = 0LL;
      goto LABEL_10;
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache inflightTaskPathForIdentifier:](self, "inflightTaskPathForIdentifier:", v9));
  }

  v12 = (void *)v10;

LABEL_10:
  id v20 = 0LL;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v8,  1LL,  &v20));
  id v14 = v20;
  objc_super v15 = v14;
  if (v13)
  {
    id v19 = 0LL;
    unsigned __int8 v11 = [v13 writeToFile:v12 options:1 error:&v19];
    id v16 = v19;
    v17 = v16;
    if (a5 && (v11 & 1) == 0) {
      *a5 = v16;
    }
  }

  else
  {
    unsigned __int8 v11 = 0;
    if (a5) {
      *a5 = v14;
    }
  }

LABEL_18:
  return v11;
}

- (BOOL)removeTaskOfType:(int64_t)a3 forIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (a3 == 1)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache failedTaskPathForIdentifier:](self, "failedTaskPathForIdentifier:", v8));
    goto LABEL_5;
  }

  if (!a3)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache inflightTaskPathForIdentifier:](self, "inflightTaskPathForIdentifier:", v8));
LABEL_5:
    uint64_t v10 = (void *)v9;
    goto LABEL_7;
  }

  uint64_t v10 = 0LL;
LABEL_7:
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v12 = [v11 fileExistsAtPath:v10];

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v14 = [v13 removeItemAtPath:v10 error:a5];
  }

  else
  {
    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (void)removeAllTasksOfType:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache tasksOfType:](self, "tasksOfType:"));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) identifier]);
        -[SHLCloudLibraryCache removeTaskOfType:forIdentifier:error:]( self,  "removeTaskOfType:forIdentifier:error:",  a3,  v10,  0LL);

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }
}

- (id)tasksOfType:(int64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache failedFolderPath](self, "failedFolderPath"));
    goto LABEL_5;
  }

  if (!a3)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache inflightFolderPath](self, "inflightFolderPath"));
LABEL_5:
    id v6 = (void *)v5;
    goto LABEL_7;
  }

  id v6 = 0LL;
LABEL_7:
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v8 = [v7 fileExistsAtPath:v6];

  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v6));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache tasksForFolderPath:ofType:](self, "tasksForFolderPath:ofType:", v9, a3));
  }

  else
  {
    uint64_t v10 = &__NSArray0__struct;
  }

  return v10;
}

- (id)taskOfType:(int64_t)a3 identifier:(id)a4
{
  id v6 = a4;
  if (a3 == 1)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache failedTaskPathForIdentifier:](self, "failedTaskPathForIdentifier:", v6));
    goto LABEL_5;
  }

  if (!a3)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache inflightTaskPathForIdentifier:](self, "inflightTaskPathForIdentifier:", v6));
LABEL_5:
    unsigned int v8 = (void *)v7;
    goto LABEL_7;
  }

  unsigned int v8 = 0LL;
LABEL_7:
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v10 = [v9 fileExistsAtPath:v8];

  if (v10) {
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache taskForFilePath:](self, "taskForFilePath:", v8));
  }
  else {
    __int128 v11 = 0LL;
  }

  return v11;
}

- (id)tasksForFolderPath:(id)a3 ofType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v29 = 0LL;
  v23 = v6;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 contentsOfDirectoryAtURL:v6 includingPropertiesForKeys:&__NSArray0__struct options:4 error:&v29]);
  id v22 = v29;

  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v8 count]));
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        __int128 v14 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v14 lastPathComponent]);
        if (v15)
        {
          if (a4 == 1)
          {
            uint64_t v16 = objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache failedTaskPathForIdentifier:](self, "failedTaskPathForIdentifier:", v15));
            goto LABEL_11;
          }

          if (a4)
          {
            v18 = 0LL;
          }

          else
          {
            uint64_t v16 = objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache inflightTaskPathForIdentifier:](self, "inflightTaskPathForIdentifier:", v15));
LABEL_11:
            v17 = (void *)v16;
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache taskForFilePath:](self, "taskForFilePath:", v16));

            if (v18 && [v18 conformsToProtocol:&OBJC_PROTOCOL___SHLSyncSessionTask])
            {
              [v24 addObject:v18];
LABEL_16:

              goto LABEL_17;
            }
          }

          id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          [v19 removeItemAtURL:v14 error:0];

          goto LABEL_16;
        }

- (id)taskForFilePath:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", a3));
  id v10 = 0LL;
  v4 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v3,  &v10);
  id v5 = v10;
  v11[0] = objc_opt_class(&OBJC_CLASS___SHLSyncSessionModifyTask);
  v11[1] = objc_opt_class(&OBJC_CLASS___SHLSyncSessionFetchTask);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSKeyedUnarchiver decodeObjectOfClasses:forKey:]( v4,  "decodeObjectOfClasses:forKey:",  v7,  NSKeyedArchiveRootObjectKey));
  -[NSKeyedUnarchiver finishDecoding](v4, "finishDecoding");

  return v8;
}

- (BOOL)storeZoneIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (-[SHLCloudLibraryCache doesZoneFolderPathExist](self, "doesZoneFolderPathExist")
    || -[SHLCloudLibraryCache createZoneFolderPathWithError:](self, "createZoneFolderPathWithError:", a4))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache zonePathForIdentifier:](self, "zonePathForIdentifier:", v6));
    unsigned __int8 v9 = [v7 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:a4];
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)removeZoneIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (-[SHLCloudLibraryCache zoneExistsForIdentifier:](self, "zoneExistsForIdentifier:", v6))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache zonePathForIdentifier:](self, "zonePathForIdentifier:", v6));
    unsigned __int8 v9 = [v7 removeItemAtPath:v8 error:a4];
  }

  else
  {
    unsigned __int8 v9 = 1;
  }

  return v9;
}

- (BOOL)zoneExistsForIdentifier:(id)a3
{
  char v9 = 0;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache zonePathForIdentifier:](self, "zonePathForIdentifier:", v4));

  unsigned __int8 v7 = [v5 fileExistsAtPath:v6 isDirectory:&v9];
  if (v9) {
    return v7;
  }
  else {
    return 0;
  }
}

- (BOOL)storeDatabaseToken:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (-[SHLCloudLibraryCache doesPrivateDatabaseFolderPathExist](self, "doesPrivateDatabaseFolderPathExist")
    || -[SHLCloudLibraryCache createPrivateDatabaseFolderPathWithError:]( self,  "createPrivateDatabaseFolderPathWithError:",  a4))
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache currentDatabaseFolderPath](self, "currentDatabaseFolderPath"));
    BOOL v8 = -[SHLCloudLibraryCache writeToken:toPath:error:](self, "writeToken:toPath:error:", v6, v7, a4);
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)storeZoneToken:(id)a3 forZoneIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (-[SHLCloudLibraryCache doesZoneFolderPathExist](self, "doesZoneFolderPathExist")
    || -[SHLCloudLibraryCache createZoneFolderPathWithError:](self, "createZoneFolderPathWithError:", a5))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache zonePathForIdentifier:](self, "zonePathForIdentifier:", v9));
    BOOL v11 = -[SHLCloudLibraryCache writeToken:toPath:error:](self, "writeToken:toPath:error:", v8, v10, a5);
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)writeToken:(id)a3 toPath:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a4 stringByAppendingPathComponent:@"token"]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 serverChangeToken]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v9,  1LL,  a5));
  LOBYTE(a5) = [v10 writeToFile:v8 options:1 error:a5];

  return (char)a5;
}

- (BOOL)removeDatabaseTokenWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache currentDatabaseFolderPath](self, "currentDatabaseFolderPath"));
  LOBYTE(a3) = -[SHLCloudLibraryCache removeTokenAtPath:error:](self, "removeTokenAtPath:error:", v5, a3);

  return (char)a3;
}

- (BOOL)removeTokenForZoneIdentifier:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache zonePathForIdentifier:](self, "zonePathForIdentifier:", a3));
  LOBYTE(a4) = -[SHLCloudLibraryCache removeTokenAtPath:error:](self, "removeTokenAtPath:error:", v6, a4);

  return (char)a4;
}

- (BOOL)removeTokenAtPath:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a3 stringByAppendingPathComponent:@"token"]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  LOBYTE(a4) = [v6 removeItemAtPath:v5 error:a4];

  return (char)a4;
}

- (id)databaseToken
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache currentDatabaseFolderPath](self, "currentDatabaseFolderPath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@"token"]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v3));
  if (v4)
  {
    uint64_t v10 = 0LL;
    id v5 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v4,  &v10);
    id v6 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v5,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___CKServerChangeToken),  NSKeyedArchiveRootObjectKey);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[NSKeyedUnarchiver finishDecoding](v5, "finishDecoding");
    if (v7) {
      id v8 = -[SHLCloudBackedToken initWithToken:](objc_alloc(&OBJC_CLASS___SHLCloudBackedToken), "initWithToken:", v7);
    }
    else {
      id v8 = 0LL;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)zoneTokenForZoneIdentifier:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache zonePathForIdentifier:](self, "zonePathForIdentifier:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"token"]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v4));
  if (v5)
  {
    uint64_t v11 = 0LL;
    id v6 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v5,  &v11);
    id v7 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v6,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___CKServerChangeToken),  NSKeyedArchiveRootObjectKey);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (v8) {
      id v9 = -[SHLCloudBackedToken initWithToken:](objc_alloc(&OBJC_CLASS___SHLCloudBackedToken), "initWithToken:", v8);
    }
    else {
      id v9 = 0LL;
    }
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (BOOL)storeSubscription:(id)a3 forZoneIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (-[SHLCloudLibraryCache doesZoneFolderPathExist](self, "doesZoneFolderPathExist")
    || -[SHLCloudLibraryCache createZoneFolderPathWithError:](self, "createZoneFolderPathWithError:", a5))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache zonePathForIdentifier:](self, "zonePathForIdentifier:", v9));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathComponent:@"zonesubscription"]);

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 subscription]);
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v12,  1LL,  a5));

    unsigned __int8 v14 = [v13 writeToFile:v11 options:1 error:a5];
  }

  else
  {
    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (BOOL)removeSubscriptionForZoneIdentifier:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache zonePathForIdentifier:](self, "zonePathForIdentifier:", a3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"zonesubscription"]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  LOBYTE(a4) = [v7 removeItemAtPath:v6 error:a4];

  return (char)a4;
}

- (BOOL)subscriptionExistsForZoneIdentifier:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache zonePathForIdentifier:](self, "zonePathForIdentifier:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"zonesubscription"]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v6 = [v5 fileExistsAtPath:v4 isDirectory:0];

  return v6;
}

- (BOOL)doesLegacyCacheDirectoryExist
{
  char v7 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache legacyCacheDirectory](self, "legacyCacheDirectory"));
  unsigned __int8 v5 = [v3 fileExistsAtPath:v4 isDirectory:&v7];

  if (v7) {
    return v5;
  }
  else {
    return 0;
  }
}

- (BOOL)createBundleDirectory
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache bundleDirectory](self, "bundleDirectory"));
  uint64_t v7 = 0LL;
  unsigned __int8 v5 = [v3 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v7];

  return v5;
}

- (BOOL)doesCacheDirectoryExist
{
  char v7 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache cacheDirectory](self, "cacheDirectory"));
  unsigned __int8 v5 = [v3 fileExistsAtPath:v4 isDirectory:&v7];

  if (v7) {
    return v5;
  }
  else {
    return 0;
  }
}

- (BOOL)doesZoneFolderPathExist
{
  char v7 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache zonesFolderPath](self, "zonesFolderPath"));
  unsigned __int8 v5 = [v3 fileExistsAtPath:v4 isDirectory:&v7];

  if (v7) {
    return v5;
  }
  else {
    return 0;
  }
}

- (BOOL)createZoneFolderPathWithError:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager", a3));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache zonesFolderPath](self, "zonesFolderPath"));
  uint64_t v8 = 0LL;
  unsigned __int8 v6 = [v4 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v8];

  return v6;
}

- (BOOL)doesTaskFolderPathsExist
{
  char v11 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache inflightFolderPath](self, "inflightFolderPath"));
  unsigned int v5 = [v3 fileExistsAtPath:v4 isDirectory:&v11];

  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  char v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache failedFolderPath](self, "failedFolderPath"));
  unsigned int v8 = [v6 fileExistsAtPath:v7 isDirectory:&v11];

  BOOL result = 0;
  if (v5) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10) {
    return v11 != 0;
  }
  return result;
}

- (BOOL)createTaskFolderPaths
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache inflightFolderPath](self, "inflightFolderPath"));
  id v15 = 0LL;
  unsigned int v5 = [v3 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v15];
  id v6 = v15;

  char v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache failedFolderPath](self, "failedFolderPath"));
  id v14 = v6;
  unsigned __int8 v9 = [v7 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v14];
  id v10 = v14;

  if (v10) {
    unsigned __int8 v11 = 0;
  }
  else {
    unsigned __int8 v11 = v9;
  }
  if (v5) {
    BOOL v12 = v11;
  }
  else {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)doesPrivateDatabaseFolderPathExist
{
  char v7 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache privateDatabaseFolderPath](self, "privateDatabaseFolderPath"));
  unsigned __int8 v5 = [v3 fileExistsAtPath:v4 isDirectory:&v7];

  if (v7) {
    return v5;
  }
  else {
    return 0;
  }
}

- (BOOL)createPrivateDatabaseFolderPathWithError:(id *)a3
{
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache privateDatabaseFolderPath](self, "privateDatabaseFolderPath"));
  LOBYTE(a3) = [v5 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:a3];

  return (char)a3;
}

- (id)legacyCacheDirectory
{
  v3 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache containerID](self, "containerID"));
  char v7 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:v6]);

  return v7;
}

- (id)rootDirectory
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);

  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:@"com.apple.shazamlibrary.cloud"]);
  return v5;
}

- (id)bundleDirectory
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache rootDirectory](self, "rootDirectory"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache processID](self, "processID"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:v4]);

  return v5;
}

- (id)cacheDirectory
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache bundleDirectory](self, "bundleDirectory"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache containerID](self, "containerID"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:v4]);

  return v5;
}

- (id)currentDatabaseFolderPath
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache privateDatabaseTransactionPath](self, "privateDatabaseTransactionPath"));
  unsigned int v5 = [v3 fileExistsAtPath:v4 isDirectory:0];

  if (v5) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache privateDatabaseTransactionPath](self, "privateDatabaseTransactionPath"));
  }
  else {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache privateDatabaseFolderPath](self, "privateDatabaseFolderPath"));
  }
  return v6;
}

- (id)privateDatabaseFolderPath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache cacheDirectory](self, "cacheDirectory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@"privatedatabase"]);

  return v3;
}

- (id)privateDatabaseTransactionPath
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache cacheDirectory](self, "cacheDirectory"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache transactionID](self, "transactionID"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@",  @"privatedatabasetransaction",  v5));
  char v7 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:v6]);

  return v7;
}

- (id)zonesFolderPath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache currentDatabaseFolderPath](self, "currentDatabaseFolderPath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@"zones"]);

  return v3;
}

- (id)inflightFolderPath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache currentDatabaseFolderPath](self, "currentDatabaseFolderPath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@"inflighttasks"]);

  return v3;
}

- (id)failedFolderPath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache currentDatabaseFolderPath](self, "currentDatabaseFolderPath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@"failedtasks"]);

  return v3;
}

- (id)zonePathForIdentifier:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache zonesFolderPath](self, "zonesFolderPath"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:v4]);

  return v6;
}

- (id)inflightTaskPathForIdentifier:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache inflightFolderPath](self, "inflightFolderPath"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:v4]);

  return v6;
}

- (id)failedTaskPathForIdentifier:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache failedFolderPath](self, "failedFolderPath"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:v4]);

  return v6;
}

- (BOOL)startTransactionWithError:(id *)a3
{
  if (!-[SHLCloudLibraryCache doesPrivateDatabaseFolderPathExist](self, "doesPrivateDatabaseFolderPathExist")
    && !-[SHLCloudLibraryCache createPrivateDatabaseFolderPathWithError:]( self,  "createPrivateDatabaseFolderPathWithError:",  a3))
  {
    return 0;
  }

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache privateDatabaseTransactionPath](self, "privateDatabaseTransactionPath"));
  unsigned int v7 = [v5 fileExistsAtPath:v6];

  if (v7)
  {
    if (!-[SHLCloudLibraryCache undoTransactionWithError:](self, "undoTransactionWithError:", a3)) {
      return 0;
    }
  }

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache privateDatabaseFolderPath](self, "privateDatabaseFolderPath"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache privateDatabaseTransactionPath](self, "privateDatabaseTransactionPath"));
  unsigned __int8 v11 = [v8 copyItemAtPath:v9 toPath:v10 error:a3];

  return v11;
}

- (BOOL)undoTransactionWithError:(id *)a3
{
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache privateDatabaseTransactionPath](self, "privateDatabaseTransactionPath"));
  LOBYTE(a3) = [v5 removeItemAtPath:v6 error:a3];

  return (char)a3;
}

- (BOOL)commitTransactionWithError:(id *)a3
{
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache privateDatabaseFolderPath](self, "privateDatabaseFolderPath"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v6));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache privateDatabaseTransactionPath](self, "privateDatabaseTransactionPath"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v8));
  LOBYTE(a3) = [v5 replaceItemAtURL:v7 withItemAtURL:v9 backupItemName:0 options:0 resultingItemURL:0 error:a3];

  return (char)a3;
}

- (BOOL)needsMigration
{
  unsigned __int8 v3 = -[SHLCloudLibraryCache doesCacheDirectoryExist](self, "doesCacheDirectoryExist");
  return -[SHLCloudLibraryCache doesLegacyCacheDirectoryExist](self, "doesLegacyCacheDirectoryExist") & ~v3;
}

- (BOOL)migrateWithError:(id *)a3
{
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache legacyCacheDirectory](self, "legacyCacheDirectory"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache cacheDirectory](self, "cacheDirectory"));
  unsigned int v8 = [v5 copyItemAtPath:v6 toPath:v7 error:a3];

  if (v8)
  {
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache legacyCacheDirectory](self, "legacyCacheDirectory"));
    [v9 removeItemAtPath:v10 error:0];
  }

  return v8;
}

- (NSString)processID
{
  return self->_processID;
}

- (NSString)containerID
{
  return self->_containerID;
}

- (NSUUID)transactionID
{
  return self->_transactionID;
}

- (void).cxx_destruct
{
}

@end