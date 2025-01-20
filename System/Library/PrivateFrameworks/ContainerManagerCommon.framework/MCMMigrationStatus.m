@interface MCMMigrationStatus
+ (id)currentBuildVersion;
- (BOOL)_writeMigrationStatusToDisk;
- (BOOL)hasMigrationOccurredForType:(id)a3;
- (BOOL)isBuildUpgrade;
- (MCMMigrationStatus)init;
- (NSMutableDictionary)migrationInfo;
- (NSURL)migrationFileURL;
- (id)_iso8601DateFormatter;
- (id)_readMigrationStatusFromDisk;
- (id)_readMigrationStatusFromDiskAtURL:(id)a3;
- (id)initForMobileUserMigration;
- (id)initForSystemMigration;
- (void)_consolidateForUnifiedDaemonFromManyMarkerFilesToOneWithLibraryURL:(id)a3;
- (void)_consolidateForUserDaemonFromManyMarkerFilesToOneWithLibraryURL:(id)a3;
- (void)_consolidateSystemDaemonMigrationStatusWithLibraryURL:(id)a3;
- (void)_consolidateUnifiedDaemonMigrationStatusWithLibraryURL:(id)a3;
- (void)_consolidateUserDaemonMigrationStatusWithLibraryURL:(id)a3;
- (void)_readStatusFromMarkerFileWithName:(id)a3 andSetAsType:(id)a4 libraryURL:(id)a5;
- (void)_removeMarkerFileWithName:(id)a3 libraryURL:(id)a4;
- (void)setMigrationCompleteForType:(id)a3;
- (void)setMigrationFileURL:(id)a3;
- (void)setMigrationInfo:(id)a3;
- (void)writeCurrentBuildInfoToDisk;
@end

@implementation MCMMigrationStatus

- (id)initForSystemMigration
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MCMMigrationStatus;
  v2 = -[MCMMigrationStatus init](&v23, sel_init);
  if (!v2)
  {
LABEL_19:
    v18 = v2;
    goto LABEL_20;
  }

  id v3 = containermanager_copy_global_configuration();
  [v3 managedPathRegistry];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 containermanagerLibrary];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  [v5 url];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    container_log_handle_for_category();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    v17 = "Failed to get library url.";
LABEL_22:
    _os_log_error_impl(&dword_188846000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    goto LABEL_11;
  }

  uint64_t v8 = [v6 URLByAppendingPathComponent:@"mcm_migration_status.plist" isDirectory:0];
  migrationFileURL = v2->_migrationFileURL;
  v2->_migrationFileURL = (NSURL *)v8;

  uint64_t v10 = -[MCMMigrationStatus _readMigrationStatusFromDisk](v2, "_readMigrationStatusFromDisk");
  migrationInfo = v2->_migrationInfo;
  v2->_migrationInfo = (NSMutableDictionary *)v10;

  if (v2->_migrationInfo)
  {
    id v12 = containermanager_copy_global_configuration();
    int v13 = [v12 runmode];

    if (v13)
    {
      id v14 = containermanager_copy_global_configuration();
      int v15 = [v14 runmode];

      if (v15 == 2)
      {
        if (!-[NSMutableDictionary count](v2->_migrationInfo, "count")) {
          -[MCMMigrationStatus _consolidateUserDaemonMigrationStatusWithLibraryURL:]( v2,  "_consolidateUserDaemonMigrationStatusWithLibraryURL:",  v7);
        }
      }

      else
      {
        id v20 = containermanager_copy_global_configuration();
        int v21 = [v20 runmode];

        if (v21 == 1 && !-[NSMutableDictionary count](v2->_migrationInfo, "count")) {
          -[MCMMigrationStatus _consolidateUnifiedDaemonMigrationStatusWithLibraryURL:]( v2,  "_consolidateUnifiedDaemonMigrationStatusWithLibraryURL:",  v7);
        }
      }
    }

    else if (!-[NSMutableDictionary count](v2->_migrationInfo, "count") {
           || (-[NSMutableDictionary objectForKeyedSubscript:]( v2->_migrationInfo,  "objectForKeyedSubscript:",  @"MigrationStatusConsolidation"),  v19 = (void *)objc_claimAutoreleasedReturnValue(),  v19,  !v19))
    }
    {
      -[MCMMigrationStatus _consolidateSystemDaemonMigrationStatusWithLibraryURL:]( v2,  "_consolidateSystemDaemonMigrationStatusWithLibraryURL:",  v7);
      -[MCMMigrationStatus setMigrationCompleteForType:]( v2,  "setMigrationCompleteForType:",  @"MigrationStatusConsolidation");
    }

    goto LABEL_19;
  }

  container_log_handle_for_category();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v17 = "Error reading system migration file from disk.  This is bad";
    goto LABEL_22;
  }

- (id)initForMobileUserMigration
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MCMMigrationStatus;
  v2 = -[MCMMigrationStatus init](&v16, sel_init);
  if (!v2) {
    goto LABEL_5;
  }
  +[MCMUserIdentitySharedCache sharedInstance](&OBJC_CLASS___MCMUserIdentitySharedCache, "sharedInstance");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 managedUserPathRegistryForUserIdentity:0];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 containermanagerUserLibrary];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  [v5 url];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    container_log_handle_for_category();
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      id v12 = 0LL;
      goto LABEL_10;
    }

    *(_WORD *)buf = 0;
    id v14 = "Failed to get library url.";
LABEL_12:
    _os_log_error_impl(&dword_188846000, (os_log_t)v13, OS_LOG_TYPE_ERROR, v14, buf, 2u);
    goto LABEL_9;
  }

  uint64_t v8 = [v6 URLByAppendingPathComponent:@"mcm_user_migration_status.plist" isDirectory:0];
  migrationFileURL = v2->_migrationFileURL;
  v2->_migrationFileURL = (NSURL *)v8;

  uint64_t v10 = -[MCMMigrationStatus _readMigrationStatusFromDisk](v2, "_readMigrationStatusFromDisk");
  migrationInfo = v2->_migrationInfo;
  v2->_migrationInfo = (NSMutableDictionary *)v10;

  if (!v2->_migrationInfo)
  {
    container_log_handle_for_category();
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    id v14 = "Error reading user migration file from disk.  This is bad";
    goto LABEL_12;
  }

LABEL_5:
  id v12 = v2;
LABEL_10:

  return v12;
}

- (MCMMigrationStatus)init
{
  return (MCMMigrationStatus *)-[MCMMigrationStatus initForSystemMigration](self, "initForSystemMigration");
}

- (void)_consolidateSystemDaemonMigrationStatusWithLibraryURL:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  container_log_handle_for_category();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v21 = 0;
    _os_log_impl( &dword_188846000,  v5,  OS_LOG_TYPE_DEFAULT,  "Consolidating system session daemon migration status",  v21,  2u);
  }

  [v4 URLByDeletingLastPathComponent];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  [v6 URLByAppendingPathComponent:@"mcm_migration_status.plist" isDirectory:0];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMMigrationStatus _readMigrationStatusFromDiskAtURL:](self, "_readMigrationStatusFromDiskAtURL:", v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MCMMigrationStatus migrationInfo](self, "migrationInfo");
  [v9 objectForKeyedSubscript:@"BundleMigration"];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  int v11 = 0;
  if (!v10)
  {
    [v8 objectForKeyedSubscript:@"BundleMigration"];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      [v8 objectForKeyedSubscript:@"BundleMigration"];
      int v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMMigrationStatus migrationInfo](self, "migrationInfo");
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 setObject:v13 forKeyedSubscript:@"BundleMigration"];

      int v11 = 0;
    }

    else
    {
      -[MCMMigrationStatus _readStatusFromMarkerFileWithName:andSetAsType:libraryURL:]( self,  "_readStatusFromMarkerFileWithName:andSetAsType:libraryURL:",  @"mcm_bundle_migration_complete.plist",  @"BundleMigration",  v6);
      int v11 = 1;
    }
  }

  -[MCMMigrationStatus migrationInfo](self, "migrationInfo");
  int v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 objectForKeyedSubscript:@"ACLMigration"];
  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16) {
    goto LABEL_10;
  }
  [v8 objectForKeyedSubscript:@"ACLMigration"];
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    [v8 objectForKeyedSubscript:@"ACLMigration"];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[MCMMigrationStatus migrationInfo](self, "migrationInfo");
    [v19 setObject:v18 forKeyedSubscript:@"ACLMigration"];

LABEL_10:
    int v20 = 0;
    goto LABEL_11;
  }

  -[MCMMigrationStatus _readStatusFromMarkerFileWithName:andSetAsType:libraryURL:]( self,  "_readStatusFromMarkerFileWithName:andSetAsType:libraryURL:",  @"mcm_acl2_migration_complete.plist",  @"ACLMigration",  v6);
  int v20 = 1;
LABEL_11:
  if (-[MCMMigrationStatus _writeMigrationStatusToDisk](self, "_writeMigrationStatusToDisk"))
  {
    if (v11) {
      -[MCMMigrationStatus _removeMarkerFileWithName:libraryURL:]( self,  "_removeMarkerFileWithName:libraryURL:",  @"mcm_bundle_migration_complete.plist",  v6);
    }
    if (v20) {
      -[MCMMigrationStatus _removeMarkerFileWithName:libraryURL:]( self,  "_removeMarkerFileWithName:libraryURL:",  @"mcm_acl2_migration_complete.plist",  v6);
    }
  }
}

- (void)_consolidateUserDaemonMigrationStatusWithLibraryURL:(id)a3
{
}

- (void)_consolidateUnifiedDaemonMigrationStatusWithLibraryURL:(id)a3
{
}

- (void)_consolidateForUserDaemonFromManyMarkerFilesToOneWithLibraryURL:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  container_log_handle_for_category();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_188846000, v5, OS_LOG_TYPE_DEFAULT, "Migrating from many marker files down to one", v6, 2u);
  }

  -[MCMMigrationStatus _readStatusFromMarkerFileWithName:andSetAsType:libraryURL:]( self,  "_readStatusFromMarkerFileWithName:andSetAsType:libraryURL:",  @"mcm_group_id_migration_complete.plist",  @"GroupIdMigration",  v4);
  -[MCMMigrationStatus _readStatusFromMarkerFileWithName:andSetAsType:libraryURL:]( self,  "_readStatusFromMarkerFileWithName:andSetAsType:libraryURL:",  @"mcm_code_signing_migration_complete.plist",  @"CodeSigningMigration",  v4);
  if (-[MCMMigrationStatus _writeMigrationStatusToDisk](self, "_writeMigrationStatusToDisk"))
  {
    -[MCMMigrationStatus _removeMarkerFileWithName:libraryURL:]( self,  "_removeMarkerFileWithName:libraryURL:",  @"mcm_group_id_migration_complete.plist",  v4);
    -[MCMMigrationStatus _removeMarkerFileWithName:libraryURL:]( self,  "_removeMarkerFileWithName:libraryURL:",  @"mcm_code_signing_migration_complete.plist",  v4);
  }
}

- (void)_consolidateForUnifiedDaemonFromManyMarkerFilesToOneWithLibraryURL:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  container_log_handle_for_category();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_188846000, v5, OS_LOG_TYPE_DEFAULT, "Migrating from many marker files down to one", v6, 2u);
  }

  -[MCMMigrationStatus _readStatusFromMarkerFileWithName:andSetAsType:libraryURL:]( self,  "_readStatusFromMarkerFileWithName:andSetAsType:libraryURL:",  @"mcm_bundle_migration_complete.plist",  @"BundleMigration",  v4);
  -[MCMMigrationStatus _readStatusFromMarkerFileWithName:andSetAsType:libraryURL:]( self,  "_readStatusFromMarkerFileWithName:andSetAsType:libraryURL:",  @"mcm_acl2_migration_complete.plist",  @"ACLMigration",  v4);
  -[MCMMigrationStatus _readStatusFromMarkerFileWithName:andSetAsType:libraryURL:]( self,  "_readStatusFromMarkerFileWithName:andSetAsType:libraryURL:",  @"mcm_group_id_migration_complete.plist",  @"GroupIdMigration",  v4);
  -[MCMMigrationStatus _readStatusFromMarkerFileWithName:andSetAsType:libraryURL:]( self,  "_readStatusFromMarkerFileWithName:andSetAsType:libraryURL:",  @"mcm_code_signing_migration_complete.plist",  @"CodeSigningMigration",  v4);
  if (-[MCMMigrationStatus _writeMigrationStatusToDisk](self, "_writeMigrationStatusToDisk"))
  {
    -[MCMMigrationStatus _removeMarkerFileWithName:libraryURL:]( self,  "_removeMarkerFileWithName:libraryURL:",  @"mcm_bundle_migration_complete.plist",  v4);
    -[MCMMigrationStatus _removeMarkerFileWithName:libraryURL:]( self,  "_removeMarkerFileWithName:libraryURL:",  @"mcm_acl2_migration_complete.plist",  v4);
    -[MCMMigrationStatus _removeMarkerFileWithName:libraryURL:]( self,  "_removeMarkerFileWithName:libraryURL:",  @"mcm_group_id_migration_complete.plist",  v4);
    -[MCMMigrationStatus _removeMarkerFileWithName:libraryURL:]( self,  "_removeMarkerFileWithName:libraryURL:",  @"mcm_code_signing_migration_complete.plist",  v4);
  }
}

- (void)_readStatusFromMarkerFileWithName:(id)a3 andSetAsType:(id)a4 libraryURL:(id)a5
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v8 = a4;
  [a5 URLByAppendingPathComponent:a3 isDirectory:0];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = 0LL;
  objc_msgSend(MEMORY[0x189603F68], "MCM_dictionaryWithContentsOfURL:options:error:", v9, 0, &v17);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v17;
  id v12 = v11;
  if (v10)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_migrationInfo, "setObject:forKeyedSubscript:", v10, v8);
  }

  else
  {
    [v11 domain];
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v13 isEqualToString:*MEMORY[0x189607688]])
    {
      uint64_t v14 = [v12 code];

      if (v14 == 2) {
        goto LABEL_10;
      }
    }

    else
    {
    }

    container_log_handle_for_category();
    int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      [v9 path];
      objc_super v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v16;
      __int16 v20 = 2112;
      int v21 = v12;
      _os_log_error_impl( &dword_188846000,  v15,  OS_LOG_TYPE_ERROR,  "Failed to read migration marker file at %@ : %@",  buf,  0x16u);
    }
  }

- (void)_removeMarkerFileWithName:(id)a3 libraryURL:(id)a4
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  [a4 URLByAppendingPathComponent:a3 isDirectory:0];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  id v10 = 0LL;
  char v6 = [v5 removeItemAtURL:v4 error:&v10];
  id v7 = v10;

  if ((v6 & 1) == 0)
  {
    container_log_handle_for_category();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      [v4 path];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      id v12 = v9;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_error_impl(&dword_188846000, v8, OS_LOG_TYPE_ERROR, "Failed to remove marker file at %@: %@", buf, 0x16u);
    }
  }
}

- (id)_readMigrationStatusFromDisk
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMMigrationStatus _readMigrationStatusFromDiskAtURL:](self, "_readMigrationStatusFromDiskAtURL:", v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_readMigrationStatusFromDiskAtURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v13 = 0LL;
  objc_msgSend(MEMORY[0x189603F68], "MCM_dictionaryWithContentsOfURL:options:error:", a3, 0, &v13);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v13;
  char v6 = (void *)[v4 mutableCopy];

  if (!v6)
  {
    [v5 domain];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v7 isEqualToString:*MEMORY[0x189607688]])
    {
      uint64_t v8 = [v5 code];

      if (v8 == 2)
      {
        char v6 = (void *)objc_opt_new();
        goto LABEL_9;
      }
    }

    else
    {
    }

    container_log_handle_for_category();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[MCMMigrationStatus migrationFileURL](self, "migrationFileURL");
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 path];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = v12;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_error_impl( &dword_188846000,  v9,  OS_LOG_TYPE_ERROR,  "Failed to read migration status file at %@ : %@",  buf,  0x16u);
    }

    char v6 = 0LL;
  }

- (BOOL)_writeMigrationStatusToDisk
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  -[MCMMigrationStatus migrationFileURL](self, "migrationFileURL");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 dataWritingOptionsForFileAtURL:v3];

  -[MCMMigrationStatus migrationInfo](self, "migrationInfo");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = 0LL;
  char v7 = objc_msgSend(v6, "MCM_writeToURL:withOptions:error:", v3, v5, &v13);
  id v8 = v13;

  if ((v7 & 1) == 0)
  {
    container_log_handle_for_category();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      [(id)objc_opt_class() currentBuildVersion];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 path];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      id v17 = v12;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_error_impl( &dword_188846000,  v9,  OS_LOG_TYPE_ERROR,  "Failed to write migration status on %@ for %@ : %@",  buf,  0x20u);
    }
  }

  return v7;
}

- (BOOL)hasMigrationOccurredForType:(id)a3
{
  id v4 = a3;
  -[MCMMigrationStatus migrationInfo](self, "migrationInfo");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:v4];
  char v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0LL;
}

- (void)setMigrationCompleteForType:(id)a3
{
  v18[2] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [MEMORY[0x189603F50] date];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMMigrationStatus _iso8601DateFormatter](self, "_iso8601DateFormatter");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 stringFromDate:v5];
  char v7 = (void *)objc_claimAutoreleasedReturnValue();

  [(id)objc_opt_class() currentBuildVersion];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = @"MCMMigrationVersionNumber";
  v17[1] = @"MCMMigrationTime";
  v18[0] = v8;
  v18[1] = v7;
  [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMMigrationStatus migrationInfo](self, "migrationInfo");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 setObject:v9 forKeyedSubscript:v4];

  if (-[MCMMigrationStatus _writeMigrationStatusToDisk](self, "_writeMigrationStatusToDisk"))
  {
    container_log_handle_for_category();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      [(id)objc_opt_class() currentBuildVersion];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      int v13 = 138412546;
      id v14 = v12;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl( &dword_188846000,  v11,  OS_LOG_TYPE_DEFAULT,  "Migration completed on %@ for %@",  (uint8_t *)&v13,  0x16u);
    }
  }
}

- (void)writeCurrentBuildInfoToDisk
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v3 = (void *)_CFCopySystemVersionDictionary();
  -[MCMMigrationStatus migrationInfo](self, "migrationInfo");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v3 forKeyedSubscript:@"LastBuildInfo"];

  if (-[MCMMigrationStatus _writeMigrationStatusToDisk](self, "_writeMigrationStatusToDisk"))
  {
    container_log_handle_for_category();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      [(id)objc_opt_class() currentBuildVersion];
      char v6 = (void *)objc_claimAutoreleasedReturnValue();
      int v7 = 138412290;
      id v8 = v6;
      _os_log_impl(&dword_188846000, v5, OS_LOG_TYPE_DEFAULT, "Saved last build version of %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (BOOL)isBuildUpgrade
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  v2 = -[MCMMigrationStatus migrationInfo](self, "migrationInfo");
  [v2 objectForKeyedSubscript:@"LastBuildInfo"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    uint64_t v4 = *MEMORY[0x189604B60];
    [v3 objectForKeyedSubscript:*MEMORY[0x189604B60]];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      container_log_handle_for_category();
      int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v17) = 0;
        _os_log_error_impl( &dword_188846000,  v7,  OS_LOG_TYPE_ERROR,  "Could not get build version from last build info dictionary; assuming this is an upgrade",
          (uint8_t *)&v17,
          2u);
      }

      char v15 = 1;
      goto LABEL_26;
    }

    char v6 = (os_log_s *)_CFCopySystemVersionDictionary();
    int v7 = v6;
    if (!v6)
    {
      container_log_handle_for_category();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v17) = 0;
        _os_log_error_impl( &dword_188846000,  v8,  OS_LOG_TYPE_ERROR,  "Could not get current build info; assuming this is an upgrade",
          (uint8_t *)&v17,
          2u);
      }

      char v15 = 1;
      goto LABEL_25;
    }

    -[os_log_s objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v4);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      container_log_handle_for_category();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v17) = 0;
        _os_log_error_impl( &dword_188846000,  v9,  OS_LOG_TYPE_ERROR,  "Could not get current build string; assuming this is an upgrade",
          (uint8_t *)&v17,
          2u);
      }

      char v15 = 1;
      goto LABEL_24;
    }

    [v3 objectForKeyedSubscript:@"ReleaseType"];
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    -[os_log_s objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", @"ReleaseType");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v11 = [v5 isEqual:v8];
    container_log_handle_for_category();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        int v17 = 138413058;
        __int16 v18 = v8;
        __int16 v19 = 2112;
        uint64_t v20 = v10;
        __int16 v21 = 2112;
        uint64_t v22 = (os_log_s *)v5;
        __int16 v23 = 2112;
        v24 = v9;
        id v14 = "Current build version (%@ / %@) equal to last version recorded (%@ / %@); skipping upgrade";
LABEL_22:
        _os_log_impl(&dword_188846000, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v17, 0x2Au);
      }
    }

    else if (v13)
    {
      int v17 = 138413058;
      __int16 v18 = (os_log_s *)v5;
      __int16 v19 = 2112;
      uint64_t v20 = v9;
      __int16 v21 = 2112;
      uint64_t v22 = v8;
      __int16 v23 = 2112;
      v24 = v10;
      id v14 = "Detected upgrade from %@ (%@) to %@ (%@)";
      goto LABEL_22;
    }

    char v15 = v11 ^ 1;
LABEL_24:

LABEL_25:
LABEL_26:

    goto LABEL_27;
  }

  container_log_handle_for_category();
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl( &dword_188846000,  (os_log_t)v5,  OS_LOG_TYPE_DEFAULT,  "Did not find last build info; we must be upgrading from pre-9.3.1 or upgrading for the first time to a build with "
      "split daemon configuration or this is an erase install.",
      (uint8_t *)&v17,
      2u);
  }

  char v15 = 1;
LABEL_27:

  return v15;
}

- (id)_iso8601DateFormatter
{
  if (_iso8601DateFormatter_onceToken != -1) {
    dispatch_once(&_iso8601DateFormatter_onceToken, &__block_literal_global_42);
  }
  return (id)_iso8601DateFormatter_dateFormatter;
}

- (NSMutableDictionary)migrationInfo
{
  return self->_migrationInfo;
}

- (void)setMigrationInfo:(id)a3
{
}

- (NSURL)migrationFileURL
{
  return self->_migrationFileURL;
}

- (void)setMigrationFileURL:(id)a3
{
}

- (void).cxx_destruct
{
}

uint64_t __43__MCMMigrationStatus__iso8601DateFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_iso8601DateFormatter_dateFormatter;
  _iso8601DateFormatter_dateFormatter = v0;

  return [(id)_iso8601DateFormatter_dateFormatter setFormatOptions:1907];
}

+ (id)currentBuildVersion
{
  if (currentBuildVersion_onceToken != -1) {
    dispatch_once(&currentBuildVersion_onceToken, &__block_literal_global_10513);
  }
  return (id)currentBuildVersion_systemVersionNumber;
}

void __41__MCMMigrationStatus_currentBuildVersion__block_invoke()
{
  uint64_t v0 = (void *)_CFCopySystemVersionDictionary();
  if (v0)
  {
    id v2 = v0;
    [v0 objectForKeyedSubscript:*MEMORY[0x189604B60]];
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (v1) {
      objc_storeStrong((id *)&currentBuildVersion_systemVersionNumber, v1);
    }

    uint64_t v0 = v2;
  }
}

@end