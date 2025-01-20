@interface MLMMediaLibraryMigrator
- (BOOL)performMigration;
- (MLMMediaLibraryMigrator)init;
- (float)estimatedDuration;
- (float)migrationProgress;
- (id)dataClassName;
@end

@implementation MLMMediaLibraryMigrator

- (MLMMediaLibraryMigrator)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MLMMediaLibraryMigrator;
  v2 = -[MLMMediaLibraryMigrator init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[ML3MusicLibrary allLibraries](&OBJC_CLASS___ML3MusicLibrary, "allLibraries"));
    libraries = v2->_libraries;
    v2->_libraries = (NSArray *)v3;

    v2->_migrated = 0;
  }

  return v2;
}

- (id)dataClassName
{
  return @"MediaLibrary";
}

- (BOOL)performMigration
{
  if (+[ML3MusicLibrary deviceSupportsMultipleLibraries]( &OBJC_CLASS___ML3MusicLibrary,  "deviceSupportsMultipleLibraries"))
  {
    v2 = os_log_create("com.apple.amp.medialibrary.migrator", "Migration");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_0,  v2,  OS_LOG_TYPE_DEFAULT,  "[Migrator] Multi-user mode detected, removing the single-user library",  buf,  2u);
    }

    if (MSVDeviceOSIsInternalInstall())
    {
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[ML3TerminationCoordinator sharedCoordinator]( &OBJC_CLASS___ML3TerminationCoordinator,  "sharedCoordinator"));
      [v3 execute];
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary pathForResourceFileOrFolder:]( &OBJC_CLASS___ML3MusicLibrary,  "pathForResourceFileOrFolder:",  9LL));
    [v4 removeItemAtPath:v5 error:0];

    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary pathForResourceFileOrFolder:]( &OBJC_CLASS___ML3MusicLibrary,  "pathForResourceFileOrFolder:",  8LL));
    [v4 removeItemAtPath:v6 error:0];

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ML3MusicLibrary mediaFolderPath](&OBJC_CLASS___ML3MusicLibrary, "mediaFolderPath"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary libraryPathForContainerPath:]( &OBJC_CLASS___ML3MusicLibrary,  "libraryPathForContainerPath:",  v7));
    [v4 removeItemAtPath:v8 error:0];

    v9 = (void *)objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary mediaFolderPathByAppendingPathComponent:]( &OBJC_CLASS___ML3MusicLibrary,  "mediaFolderPathByAppendingPathComponent:",  @"iTunes_Control"));
    LOBYTE(v8) = [v4 fileExistsAtPath:v9 isDirectory:0];

    if ((v8 & 1) == 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary mediaFolderPathByAppendingPathComponent:]( &OBJC_CLASS___ML3MusicLibrary,  "mediaFolderPathByAppendingPathComponent:",  @"iTunes_Control"));
      id v35 = 0LL;
      [v4 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:&v35];
      v11 = (NSArray *)v35;

      if (v11)
      {
        v12 = os_log_create("com.apple.amp.medialibrary.migrator", "Migration");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543362;
          v38 = v11;
          _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_FAULT,  "[Migrator] Failed to re-create iTunes_Control directory on multi-user device during migration - error=%{public}@",  buf,  0xCu);
        }
      }
    }

    v13 = os_log_create("com.apple.amp.medialibrary.migrator", "Migration");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "[Migrator] Single-user library removed", buf, 2u);
    }
  }

  v14 = os_log_create("com.apple.amp.medialibrary.migrator", "Migration");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    libraries = self->_libraries;
    *(_DWORD *)buf = 134217984;
    v38 = libraries;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "[Migrator] Validating media libraries %p", buf, 0xCu);
  }

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  uint64_t v29 = 16LL;
  v16 = self->_libraries;
  id v17 = -[NSArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v31,  v36,  16LL);
  if (v17)
  {
    uint64_t v18 = *(void *)v32;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v16);
        }
        v20 = *(NSArray **)(*((void *)&v31 + 1) + 8LL * (void)i);
        if ((-[NSArray validateDatabase](v20, "validateDatabase", v29) & 1) == 0)
        {
          v21 = os_log_create("com.apple.amp.medialibrary.migrator", "Migration");
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v38 = v20;
            _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_ERROR,  "[Migrator] Failed to validate media library %{public}@ during migration",  buf,  0xCu);
          }
        }
      }

      id v17 = -[NSArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v31,  v36,  16LL);
    }

    while (v17);
  }

  if ((+[ML3MusicLibrary deviceSupportsMultipleLibraries]( &OBJC_CLASS___ML3MusicLibrary,  "deviceSupportsMultipleLibraries") & 1) == 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&self->DataClassMigrator_opaque[v29] firstObject]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 valueForDatabaseProperty:@"MLCloudDatabaseRevision"]);
    BOOL v24 = [v23 intValue] == 0;

    if (!v24)
    {
      v25 = os_log_create("com.apple.amp.medialibrary.migrator", "Migration");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_0,  v25,  OS_LOG_TYPE_DEFAULT,  "[Migrator] Migrated from Copper or earlier. Disabling 'show offline music' switch automatically.",  buf,  2u);
      }

      v26 = (void *)CFPreferencesCopyAppValue( @"MusicShowCloudMediaEnabledSettingRevisionID",  @"com.apple.mobileipod");
      if ((objc_opt_respondsToSelector(v26, "integerValue") & 1) == 0 || (uint64_t)[v26 integerValue] < 1)
      {
        CFPreferencesSetAppValue( @"MusicShowCloudMediaEnabledSettingRevisionID",  &off_41D0,  @"com.apple.mobileipod");
        CFPreferencesSetAppValue(@"MusicShowCloudMediaEnabledSetting", 0LL, @"com.apple.mobileipod");
      }
    }
  }

  v27 = os_log_create("com.apple.amp.medialibrary.migrator", "Migration");
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "[Migrator] Migration successful", buf, 2u);
  }

  BOOL result = 1;
  self->_migrated = 1;
  return result;
}

- (float)estimatedDuration
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_libraries, "firstObject"));
  unsigned int v4 = [v3 currentDatabaseVersion];

  if (v4) {
    return (float)(2220020 - v4) / 200.0 * (double)-[NSArray count](self->_libraries, "count");
  }
  else {
    return 1.0;
  }
}

- (float)migrationProgress
{
  float result = 1.0;
  if (!self->_migrated) {
    return 0.0;
  }
  return result;
}

- (void).cxx_destruct
{
}

@end