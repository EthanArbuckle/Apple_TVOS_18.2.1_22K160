@interface SHMediaLibraryPersistentConfiguration
+ (NSURL)managedObjectModelURL;
+ (id)applicationSupportDirectory;
+ (id)persistentStoreDescriptionForStoreType:(id)a3;
+ (id)persistentStoreURL;
@end

@implementation SHMediaLibraryPersistentConfiguration

+ (NSURL)managedObjectModelURL
{
  if (qword_1000889E0 != -1) {
    dispatch_once(&qword_1000889E0, &stru_10006D9D8);
  }
  return (NSURL *)(id)qword_1000889D8;
}

+ (id)applicationSupportDirectory
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v9 = 0LL;
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLForDirectory:14 inDomain:1 appropriateForURL:0 create:0 error:&v9]);
  id v4 = v9;

  if (!v3)
  {
    uint64_t v6 = sh_log_object(v5);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Unable to load Application Support directory: %@",  buf,  0xCu);
    }
  }

  return v3;
}

+ (id)persistentStoreURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 applicationSupportDirectory]);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLByAppendingPathComponent:@"com.apple.shazamd" isDirectory:1]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
    unsigned __int8 v7 = [v5 fileExistsAtPath:v6 isDirectory:0];

    if ((v7 & 1) == 0)
    {
      uint64_t v9 = sh_log_object(v8);
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "Parent directory of persistent store url doesn't exist, creating one now",  buf,  2u);
      }

      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
      id v20 = 0LL;
      unsigned __int8 v13 = [v11 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:&v20];
      id v14 = v20;

      if ((v13 & 1) == 0)
      {
        uint64_t v17 = sh_log_object(v15);
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v22 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Failed to create persistent store directory: %@",  buf,  0xCu);
        }

        v16 = 0LL;
        goto LABEL_12;
      }
    }

    id v14 = (id)objc_claimAutoreleasedReturnValue([v3 URLByAppendingPathComponent:@"ShazamLibrary" isDirectory:0]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v14 URLByAppendingPathExtension:@"sqlite"]);
LABEL_12:

    goto LABEL_13;
  }

  v16 = 0LL;
LABEL_13:

  return v16;
}

+ (id)persistentStoreDescriptionForStoreType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new(&OBJC_CLASS___NSPersistentStoreDescription);
  -[NSPersistentStoreDescription setType:](v5, "setType:", v4);
  -[NSPersistentStoreDescription setShouldMigrateStoreAutomatically:](v5, "setShouldMigrateStoreAutomatically:", 1LL);
  -[NSPersistentStoreDescription setShouldInferMappingModelAutomatically:]( v5,  "setShouldInferMappingModelAutomatically:",  1LL);
  -[NSPersistentStoreDescription setUsesPersistentHistoryTracking:](v5, "setUsesPersistentHistoryTracking:", 1LL);
  unsigned __int8 v6 = [v4 isEqualToString:NSInMemoryStoreType];

  if ((v6 & 1) == 0)
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([a1 persistentStoreURL]);
    if (v7)
    {
      -[NSPersistentStoreDescription setURL:](v5, "setURL:", v7);
    }

    else
    {
      uint64_t v8 = sh_log_object(0LL);
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Persistent store url missing, fallback to in memory store type",  v11,  2u);
      }
    }
  }

  return v5;
}

@end