@interface MobileInstallationHelperService
- (BOOL)_createDirectoryAndSetToDaemonOwnershipAt:(id)a3 withError:(id *)a4;
- (BOOL)_moveAndUpdateOwnershipFromURL:(id)a3 toURL:(id)a4 withError:(id *)a5;
- (BOOL)_validateArgsForMethodWithName:(const char *)a3 bundleIdentifier:(id)a4 wrapperURL:(id)a5 data:(id)a6 error:(id *)a7;
- (BOOL)_validateArgsForMethodWithName:(const char *)a3 bundleIdentifier:(id)a4 wrapperURL:(id)a5 error:(id *)a6;
- (MILimitedConcurrencyQueue)installAndStagingQueue;
- (NSString)clientName;
- (NSXPCConnection)xpcConnection;
- (id)_verifyBooleanEntitlement:(id)a3;
- (unint64_t)_changeOwnerTo:(unsigned int)a3 atURL:(id)a4;
- (void)_onQueue_createSafeHarborWithIdentifier:(id)a3 forPersona:(id)a4 containerType:(unint64_t)a5 andMigrateDataFrom:(id)a6 completion:(id)a7;
- (void)_onQueue_stageItemAtURL:(id)a3 options:(id)a4 completion:(id)a5;
- (void)_writeMigrationFileToDiskAtURL:(id)a3;
- (void)createSafeHarborWithIdentifier:(id)a3 forPersona:(id)a4 containerType:(unint64_t)a5 andMigrateDataFrom:(id)a6 completion:(id)a7;
- (void)dieForTesting;
- (void)getPidForTestingWithCompletion:(id)a3;
- (void)migrateMobileContentWithCompletion:(id)a3;
- (void)moveItemInStagingDirectory:(unint64_t)a3 atRelativePath:(id)a4 toDestinationURL:(id)a5 onBehalfOf:(id *)a6 completion:(id)a7;
- (void)setXpcConnection:(id)a3;
- (void)stageItemAtURL:(id)a3 options:(id)a4 completion:(id)a5;
- (void)wipeStagingRootAndSetUpPerUserDataDirWithCompletion:(id)a3;
@end

@implementation MobileInstallationHelperService

- (MILimitedConcurrencyQueue)installAndStagingQueue
{
  if (qword_100021688 != -1) {
    dispatch_once(&qword_100021688, &stru_10001CB28);
  }
  return (MILimitedConcurrencyQueue *)(id)qword_100021690;
}

- (id)_verifyBooleanEntitlement:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MobileInstallationHelperService xpcConnection](self, "xpcConnection"));
  v7 = v5;
  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:v4]);
    v9 = v8;
    if (v8)
    {
      if ((MIBooleanValue(v8, 0LL) & 1) != 0)
      {
        v10 = 0LL;
LABEL_9:

        goto LABEL_10;
      }

      v16 = (void *)MIInstallerErrorDomain;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MobileInstallationHelperService clientName](self, "clientName"));
      id v15 = _CreateAndLogError( (uint64_t)"-[MobileInstallationHelperService _verifyBooleanEntitlement:]",  142LL,  v16,  2LL,  0LL,  0LL,  @"Client %@ has the entitlement '%@' but its value is FALSE",  v17,  (uint64_t)v13);
    }

    else
    {
      v12 = (void *)MIInstallerErrorDomain;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MobileInstallationHelperService clientName](self, "clientName"));
      id v15 = _CreateAndLogError( (uint64_t)"-[MobileInstallationHelperService _verifyBooleanEntitlement:]",  138LL,  v12,  2LL,  0LL,  0LL,  @"Client %@ does not have the required entitlement '%@'",  v14,  (uint64_t)v13);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(v15);

    goto LABEL_9;
  }

  id v11 = _CreateAndLogError( (uint64_t)"-[MobileInstallationHelperService _verifyBooleanEntitlement:]",  133LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"Failed to get XPC connection",  v6,  v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v11);
LABEL_10:

  return v10;
}

- (NSString)clientName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MobileInstallationHelperService xpcConnection](self, "xpcConnection"));
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 processIdentifier];
    v5 = MICopyProcessNameForPid((int)v4);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (pid %d)",  v6,  v4));
  }

  else
  {
    v7 = @"Unknown client";
  }

  return (NSString *)v7;
}

- (unint64_t)_changeOwnerTo:(unsigned int)a3 atURL:(id)a4
{
  id v5 = a4;
  v19[0] = (char *)[v5 fileSystemRepresentation];
  v19[1] = 0LL;
  uint64_t v6 = fts_open(v19, 84, 0LL);
  if (v6)
  {
    v7 = v6;
    v8 = fts_read(v6);
    if (v8)
    {
      v9 = v8;
      unint64_t v10 = 0LL;
      while (1)
      {
        unsigned int fts_info = v9->fts_info;
        if (fts_info > 0xD) {
          break;
        }
        if (((1 << fts_info) & 0x310A) != 0)
        {
          if (lchown(v9->fts_path, a3, a3))
          {
            uint64_t v12 = gLogHandle;
            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
            {
              v13 = __error();
              strerror(*v13);
              uint64_t v14 = v12;
              goto LABEL_14;
            }

            goto LABEL_15;
          }
        }

        else if (fts_info != 6)
        {
          break;
        }

- (BOOL)_moveAndUpdateOwnershipFromURL:(id)a3 toURL:(id)a4 withError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  unsigned int v10 = [v9 itemDoesNotExistAtURL:v8];

  if (v10)
  {
    uint64_t v11 = gLogHandle;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
      v26 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
      MOLogWrite(v11);
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager", v24, v26));
    id v28 = 0LL;
    unsigned __int8 v13 = [v12 moveItemIfExistsAtURL:v7 toURL:v8 error:&v28];
    id v14 = v28;

    if ((v13 & 1) == 0)
    {
      id v22 = _CreateAndLogError( (uint64_t)"-[MobileInstallationHelperService _moveAndUpdateOwnershipFromURL:toURL:withError:]",  225LL,  MIInstallerErrorDomain,  4LL,  v14,  0LL,  @"Failed to move data directory into installd's home directory",  v15,  v25);
      uint64_t v21 = objc_claimAutoreleasedReturnValue(v22);
      goto LABEL_10;
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
    uint64_t v17 = -[MobileInstallationHelperService _changeOwnerTo:atURL:]( self,  "_changeOwnerTo:atURL:",  [v16 uid],  v8);

    if (v17)
    {
      v18 = (void *)MIInstallerErrorDomain;
      uint64_t v27 = objc_claimAutoreleasedReturnValue([v8 path]);
      id v20 = _CreateAndLogError( (uint64_t)"-[MobileInstallationHelperService _moveAndUpdateOwnershipFromURL:toURL:withError:]",  230LL,  v18,  109LL,  v14,  0LL,  @"%llu errors changing ownership for installd at %@",  v19,  v17);
      uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);

      id v14 = (id)v27;
LABEL_10:

      id v14 = (id)v21;
    }
  }

  else
  {
    id v14 = 0LL;
  }

  return 1;
}

- (void)_writeMigrationFileToDiskAtURL:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);

  uint64_t v6 = (void *)_CFCopySystemVersionDictionary();
  id v7 = v6;
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:_kCFSystemVersionBuildVersionKey]);
    v9 = v8;
    if (v8) {
      unsigned int v10 = v8;
    }
    else {
      unsigned int v10 = @"Unknown";
    }
  }

  else
  {
    unsigned int v10 = @"Unknown";
  }

  v15[0] = @"MIHMigrationVersionNumber";
  v15[1] = @"MIHMigrationTime";
  v16[0] = v10;
  v16[1] = v5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  2LL));
  unsigned __int8 v12 = [v11 writeToURL:v3 atomically:1];
  uint64_t v13 = gLogHandle;
  if ((v12 & 1) != 0)
  {
  }

  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
    MOLogWrite(v13);
  }
}

- (void)migrateMobileContentWithCompletion:(id)a3
{
  v37 = (void (**)(id, id))a3;
  v40 = self;
  id v4 = (id)objc_claimAutoreleasedReturnValue( -[MobileInstallationHelperService _verifyBooleanEntitlement:]( self,  "_verifyBooleanEntitlement:",  @"com.apple.private.MobileInstallationHelperService.InstallDaemonOpsEnabled"));
  if (v4)
  {
    v37[2](v37, v4);
    goto LABEL_23;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 oldDataDirectoryPath]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dataDirectory]);
  uint64_t v47 = 0LL;
  unsigned int v9 = -[MobileInstallationHelperService _moveAndUpdateOwnershipFromURL:toURL:withError:]( v40,  "_moveAndUpdateOwnershipFromURL:toURL:withError:",  v6,  v8,  &v47);

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 oldLoggingPath]);
  id v46 = 0LL;
  v36 = (void *)objc_claimAutoreleasedReturnValue([v10 urlsForItemsInDirectoryAtURL:v12 ignoringSymlinks:1 error:&v46]);
  id v4 = v46;

  if (v36)
  {
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    id obj = v36;
    id v13 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v13)
    {
      uint64_t v39 = *(void *)v43;
      do
      {
        id v14 = 0LL;
        uint64_t v15 = v4;
        do
        {
          if (*(void *)v43 != v39) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)v14);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
          v18 = (void *)objc_claimAutoreleasedReturnValue([v17 logDirectory]);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v16 lastPathComponent]);
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 URLByAppendingPathComponent:v19 isDirectory:0]);
          id v41 = v15;
          unsigned __int8 v21 = -[MobileInstallationHelperService _moveAndUpdateOwnershipFromURL:toURL:withError:]( v40,  "_moveAndUpdateOwnershipFromURL:toURL:withError:",  v16,  v20,  &v41);
          id v4 = v41;

          LOBYTE(v9) = v21 & v9;
          id v14 = (char *)v14 + 1;
          uint64_t v15 = v4;
        }

        while (v13 != v14);
        id v13 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
      }

      while (v13);
    }

    if ((v9 & 1) != 0) {
      goto LABEL_12;
    }
    goto LABEL_16;
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
  if (![v26 isEqualToString:NSPOSIXErrorDomain])
  {

    goto LABEL_18;
  }

  BOOL v27 = [v4 code] == (id)2;

  if (!v27)
  {
LABEL_18:
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 oldLoggingPath]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 path]);
    id v29 = _CreateAndLogError( (uint64_t)"-[MobileInstallationHelperService migrateMobileContentWithCompletion:]",  288LL,  MIInstallerErrorDomain,  109LL,  v4,  0LL,  @"Failed to get items for deletion: %@ : %@",  v28,  (uint64_t)v24);
    uint64_t v30 = objc_claimAutoreleasedReturnValue(v29);

    int v25 = 0;
    id v4 = (id)v30;
    goto LABEL_19;
  }

  if (v9)
  {
LABEL_12:
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 oldLoggingPath]);
    [v22 removeItemAtURL:v24 error:0];
    int v25 = 1;
LABEL_19:

    goto LABEL_20;
  }

- (BOOL)_createDirectoryAndSetToDaemonOwnershipAt:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  id v8 = [v7 uid];

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  id v10 = [v9 gid];

  id v18 = 0LL;
  unsigned int v11 = [v6 createDirectoryAtURL:v5 withIntermediateDirectories:0 mode:493 class:4 error:&v18];
  id v12 = v18;
  id v13 = v12;
  if (v11)
  {
    id v17 = v12;
    unsigned __int8 v14 = [v6 setOwnerOfURL:v5 toUID:v8 gid:v10 error:&v17];
    id v15 = v17;

    id v13 = v15;
    if (!a4) {
      goto LABEL_7;
    }
  }

  else
  {
    unsigned __int8 v14 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }

  if ((v14 & 1) == 0) {
    *a4 = v13;
  }
LABEL_7:

  return v14;
}

- (void)wipeStagingRootAndSetUpPerUserDataDirWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  id v6 = (id)objc_claimAutoreleasedReturnValue( -[MobileInstallationHelperService _verifyBooleanEntitlement:]( self,  "_verifyBooleanEntitlement:",  @"com.apple.private.MobileInstallationHelperService.InstallDaemonOpsEnabled"));
  if (v6)
  {
    v4[2](v4, v6);
    goto LABEL_40;
  }

  uint64_t v7 = objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  v71 = (void *)objc_claimAutoreleasedReturnValue([(id)v7 stagingRootForSystemContent]);

  id v81 = 0LL;
  LOBYTE(v7) = [v5 removeItemAtURL:v71 keepParent:1 error:&v81];
  id v8 = v81;
  if ((v7 & 1) == 0)
  {
    uint64_t v9 = gLogHandle;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue([v71 path]);
      id v63 = v8;
      MOLogWrite(v9);
    }

    id v8 = 0LL;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[MIDaemonConfiguration sharedInstance]( &OBJC_CLASS___MIDaemonConfiguration,  "sharedInstance",  v61,  v63));
  unsigned int v68 = [v10 uid];

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  gid_t v12 = [v11 gid];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  id v70 = (id)objc_claimAutoreleasedReturnValue([v13 currentUserDataDirectory]);

  if (!v70)
  {
    v37 = @"Failed to get current user data directory";
    uint64_t v38 = 381LL;
LABEL_31:
    id v39 = _CreateAndLogError( (uint64_t)"-[MobileInstallationHelperService wipeStagingRootAndSetUpPerUserDataDirWithCompletion:]",  v38,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  v37,  v14,  (uint64_t)v62);
    uint64_t v40 = objc_claimAutoreleasedReturnValue(v39);
    uint64_t v16 = 0LL;
LABEL_32:
    id v18 = 0LL;
LABEL_33:
    id v25 = v8;
LABEL_34:
    id v6 = (id)v40;
LABEL_35:

    goto LABEL_36;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 currentUserCachesDirectory]);

  if (!v16)
  {
    v37 = @"Failed to get user caches directory";
    uint64_t v38 = 387LL;
    goto LABEL_31;
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 stagingRootForUserContent]);

  if (!v18)
  {
    id v42 = _CreateAndLogError( (uint64_t)"-[MobileInstallationHelperService wipeStagingRootAndSetUpPerUserDataDirWithCompletion:]",  393LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"Failed to get user content staging directory",  v19,  (uint64_t)v62);
    uint64_t v40 = objc_claimAutoreleasedReturnValue(v42);
    goto LABEL_32;
  }

  id v80 = v8;
  unsigned __int8 v20 = [v5 removeItemAtURL:v18 keepParent:1 error:&v80];
  id v21 = v80;

  id v22 = v21;
  if ((v20 & 1) == 0)
  {
    uint64_t v23 = gLogHandle;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue([v18 path]);
      v64 = v22;
      MOLogWrite(v23);
    }
  }

  id v79 = v22;
  unsigned __int8 v24 = -[MobileInstallationHelperService _createDirectoryAndSetToDaemonOwnershipAt:withError:]( self,  "_createDirectoryAndSetToDaemonOwnershipAt:withError:",  v16,  &v79,  v62,  v64);
  id v25 = v79;

  if ((v24 & 1) == 0)
  {
    id v43 = _CreateAndLogError( (uint64_t)"-[MobileInstallationHelperService wipeStagingRootAndSetUpPerUserDataDirWithCompletion:]",  404LL,  MIInstallerErrorDomain,  4LL,  v25,  0LL,  @"Failed to create user caches directory at %@ : %@",  v26,  (uint64_t)v16);
    uint64_t v40 = objc_claimAutoreleasedReturnValue(v43);
    goto LABEL_34;
  }

  id v78 = v25;
  unsigned __int8 v27 = -[MobileInstallationHelperService _createDirectoryAndSetToDaemonOwnershipAt:withError:]( self,  "_createDirectoryAndSetToDaemonOwnershipAt:withError:",  v18,  &v78);
  id v8 = v78;

  if ((v27 & 1) == 0)
  {
    id v44 = _CreateAndLogError( (uint64_t)"-[MobileInstallationHelperService wipeStagingRootAndSetUpPerUserDataDirWithCompletion:]",  409LL,  MIInstallerErrorDomain,  4LL,  v8,  0LL,  @"Failed to create user content staging directory at %@ : %@",  v28,  (uint64_t)v18);
    uint64_t v40 = objc_claimAutoreleasedReturnValue(v44);
    goto LABEL_33;
  }

  id v77 = v8;
  unsigned __int8 v29 = -[MobileInstallationHelperService _createDirectoryAndSetToDaemonOwnershipAt:withError:]( self,  "_createDirectoryAndSetToDaemonOwnershipAt:withError:",  v70,  &v77);
  id v25 = v77;

  if ((v29 & 1) == 0)
  {
    id v45 = _CreateAndLogError( (uint64_t)"-[MobileInstallationHelperService wipeStagingRootAndSetUpPerUserDataDirWithCompletion:]",  415LL,  MIInstallerErrorDomain,  4LL,  v25,  0LL,  @"Failed to create user data directory at %@ : %@",  v30,  (uint64_t)v70);
    uint64_t v40 = objc_claimAutoreleasedReturnValue(v45);
    goto LABEL_34;
  }

  id v76 = v25;
  char v31 = MIAssumeIdentity(v68, v12, &v76);
  id v6 = v76;

  if ((v31 & 1) != 0)
  {
    id v67 = v70;
    if (!access((const char *)[v67 fileSystemRepresentation], 7))
    {
      char v41 = 1;
      goto LABEL_37;
    }

    int __errnum = *__error();
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    id v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "MI_allAccessURLs"));
    id v32 = 0LL;
    id v33 = [v25 countByEnumeratingWithState:&v72 objects:v84 count:16];
    if (v33)
    {
      uint64_t v69 = *(void *)v73;
      while (2)
      {
        v34 = 0LL;
        v35 = v32;
        do
        {
          if (*(void *)v73 != v69) {
            objc_enumerationMutation(v25);
          }
          id v36 = *(id *)(*((void *)&v72 + 1) + 8LL * (void)v34);
          if (!access((const char *)[v36 fileSystemRepresentation], 1))
          {
            id v32 = v35;
            goto LABEL_49;
          }

          id v32 = v36;

          v34 = (char *)v34 + 1;
          v35 = v32;
        }

        while (v33 != v34);
        id v33 = [v25 countByEnumeratingWithState:&v72 objects:v84 count:16];
        if (v33) {
          continue;
        }
        break;
      }
    }

- (void)_onQueue_stageItemAtURL:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void, id))a5;
  unsigned __int8 v71 = 0;
  uint64_t v11 = objc_claimAutoreleasedReturnValue( -[MobileInstallationHelperService _verifyBooleanEntitlement:]( self,  "_verifyBooleanEntitlement:",  @"com.apple.private.MobileInstallationHelperService.InstallDaemonOpsEnabled"));
  if (!v11)
  {
    if (v9)
    {
      objc_opt_class(&OBJC_CLASS___MIInstallOptions);
      if ((objc_opt_isKindOfClass(v9) & 1) == 0)
      {
        id v39 = (void *)MIInstallerErrorDomain;
        uint64_t v40 = (objc_class *)objc_opt_class(v9);
        char v41 = NSStringFromClass(v40);
        id v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
        id v44 = _CreateAndLogError( (uint64_t)"-[MobileInstallationHelperService _onQueue_stageItemAtURL:options:completion:]",  498LL,  v39,  104LL,  0LL,  0LL,  @"Options parameter is not an instance of MIInstallOptions; found %@",
                v43,
                (uint64_t)v42);
        id v12 = (id)objc_claimAutoreleasedReturnValue(v44);

        goto LABEL_3;
      }
    }

    unsigned int v14 = [v9 performAPFSClone];
    if (!v8)
    {
      id v45 = 0LL;
      id v46 = _CreateAndLogError( (uint64_t)"-[MobileInstallationHelperService _onQueue_stageItemAtURL:options:completion:]",  508LL,  MIInstallerErrorDomain,  104LL,  0LL,  0LL,  @"Input Path cannot be nil",  v15,  v60);
      id v12 = (id)objc_claimAutoreleasedReturnValue(v46);
      id v13 = 0LL;
LABEL_30:

      v10[2](v10, v13, v71, v12);
      goto LABEL_31;
    }

    unsigned int v63 = v14;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
    id v70 = 0LL;
    unsigned __int8 v17 = [v16 itemExistsAtURL:v8 error:&v70];
    id v18 = v70;

    if ((v17 & 1) == 0)
    {
      id v47 = [v8 fileSystemRepresentation];
      id v49 = _CreateAndLogError( (uint64_t)"-[MobileInstallationHelperService _onQueue_stageItemAtURL:options:completion:]",  514LL,  MIInstallerErrorDomain,  3LL,  v18,  &off_10001F588,  @"Could not access item to be installed at %s",  v48,  (uint64_t)v47);
      id v12 = (id)objc_claimAutoreleasedReturnValue(v49);
      id v22 = 0LL;
      id v13 = 0LL;
LABEL_28:

      goto LABEL_29;
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
    unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 stagingRootForSystemContent]);
    id v69 = v18;
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v19 createTemporaryDirectoryInDirectoryURL:v21 error:&v69]);
    id v23 = v69;

    if (!v22)
    {
      id v50 = (id)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
      int v51 = (void *)objc_claimAutoreleasedReturnValue([v50 stagingRootForSystemContent]);
      uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v51 path]);
      id v54 = _CreateAndLogError( (uint64_t)"-[MobileInstallationHelperService _onQueue_stageItemAtURL:options:completion:]",  521LL,  MIInstallerErrorDomain,  105LL,  v23,  0LL,  @"Failed to create temporary staging dir in %@",  v53,  (uint64_t)v52);
      id v12 = (id)objc_claimAutoreleasedReturnValue(v54);

      id v22 = 0LL;
      id v13 = 0LL;
      goto LABEL_26;
    }

    unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
    id v25 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
    id v26 = [v25 uid];
    unsigned __int8 v27 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
    id v68 = v23;
    LOBYTE(v26) = objc_msgSend( v24,  "setOwnerOfURL:toUID:gid:error:",  v22,  v26,  objc_msgSend(v27, "gid"),  &v68);
    id v28 = v68;

    if ((v26 & 1) != 0)
    {
      unsigned __int8 v29 = (void *)objc_claimAutoreleasedReturnValue([v8 lastPathComponent]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v22 URLByAppendingPathComponent:v29]);

      if (v63) {
        uint64_t v30 = 2LL;
      }
      else {
        uint64_t v30 = 0LL;
      }
      v64 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
      v62 = (void *)objc_claimAutoreleasedReturnValue([v8 lastPathComponent]);
      char v31 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
      id v32 = [v31 uid];
      id v33 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
      id v67 = v28;
      unsigned __int8 v34 = objc_msgSend( v64,  "stageURL:toItemName:inStagingDir:stagingMode:settingUID:gid:hasSymlink:error:",  v8,  v62,  v22,  v30,  v32,  objc_msgSend(v33, "gid"),  &v71,  &v67);
      id v12 = v67;

      if ((v34 & 1) != 0) {
        goto LABEL_21;
      }
      v35 = (void *)objc_claimAutoreleasedReturnValue([v8 lastPathComponent]);
      v65 = (void *)objc_claimAutoreleasedReturnValue([v22 URLByAppendingPathComponent:v35 isDirectory:0]);
      v61 = (void *)objc_claimAutoreleasedReturnValue([v65 path]);
      id v37 = _CreateAndLogError( (uint64_t)"-[MobileInstallationHelperService _onQueue_stageItemAtURL:options:completion:]",  552LL,  MIInstallerErrorDomain,  107LL,  v12,  0LL,  @"Failed to stage %@ to %@",  v36,  (uint64_t)v8);
      uint64_t v38 = objc_claimAutoreleasedReturnValue(v37);

      id v28 = v65;
      id v12 = (id)v38;
    }

    else
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue([v22 path]);
      id v56 = _CreateAndLogError( (uint64_t)"-[MobileInstallationHelperService _onQueue_stageItemAtURL:options:completion:]",  527LL,  MIInstallerErrorDomain,  105LL,  v28,  0LL,  @"Failed to chown temporary staging directory %@ to _installd/_installd",  v55,  (uint64_t)v35);
      id v12 = (id)objc_claimAutoreleasedReturnValue(v56);
      id v13 = 0LL;
    }

LABEL_21:
    if (!v12)
    {
LABEL_29:
      id v45 = v22;
      goto LABEL_30;
    }

    uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
    id v66 = 0LL;
    unsigned __int8 v58 = [v57 removeItemAtURL:v22 error:&v66];
    id v50 = v66;

    if ((v58 & 1) != 0) {
      goto LABEL_27;
    }
    uint64_t v59 = gLogHandle;
    if (gLogHandle)
    {
    }

    int v51 = (void *)objc_claimAutoreleasedReturnValue([v22 path]);
    MOLogWrite(v59);
LABEL_26:

LABEL_27:
    id v18 = v50;
    goto LABEL_28;
  }

  id v12 = (id)v11;
LABEL_3:
  v10[2](v10, 0LL, 0LL, v12);
  id v13 = 0LL;
LABEL_31:
}

- (void)stageItemAtURL:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class(&OBJC_CLASS___NSURL);
  id v11 = v8;
  if ((objc_opt_isKindOfClass(v11) & 1) != 0) {
    id v12 = v11;
  }
  else {
    id v12 = 0LL;
  }

  if (v12)
  {
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[MobileInstallationHelperService installAndStagingQueue](self, "installAndStagingQueue"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[MobileInstallationHelperService stageItemAtURL:options:completion:]"));
    v19[0] = (uint64_t)_NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = (uint64_t)sub_100010D4C;
    v19[3] = (uint64_t)&unk_10001C9F8;
    v19[4] = (uint64_t)self;
    id v20 = v11;
    id v21 = v9;
    id v22 = v10;
    [v14 runAsyncForIdentifier:v15 description:v16 operation:v19];
  }

  else
  {
    id v17 = _CreateAndLogError( (uint64_t)"-[MobileInstallationHelperService stageItemAtURL:options:completion:]",  579LL,  MIInstallerErrorDomain,  104LL,  0LL,  0LL,  @"url parameter is not a valid url",  v13,  v19[0]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0LL, 0LL, v18);
  }
}

- (void)_onQueue_createSafeHarborWithIdentifier:(id)a3 forPersona:(id)a4 containerType:(unint64_t)a5 andMigrateDataFrom:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v15 = (void (**)(id, uint64_t))a7;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  uint64_t v17 = objc_claimAutoreleasedReturnValue( -[MobileInstallationHelperService _verifyBooleanEntitlement:]( self,  "_verifyBooleanEntitlement:",  @"com.apple.private.MobileInstallationHelperService.InstallDaemonOpsEnabled"));
  if (v17) {
    goto LABEL_10;
  }
  objc_opt_class(&OBJC_CLASS___NSString);
  id v18 = v12;
  if ((objc_opt_isKindOfClass(v18) & 1) != 0) {
    id v19 = v18;
  }
  else {
    id v19 = 0LL;
  }

  if (!v19)
  {
    id v21 = (void *)MIInstallerErrorDomain;
    id v22 = @"Identifier parameter was not a string";
    uint64_t v23 = 686LL;
    goto LABEL_9;
  }

  if (a5 - 15 <= 0xFFFFFFFFFFFFFFF1LL)
  {
    id v21 = (void *)MIInstallerErrorDomain;
    id v22 = @"Container type parameter did not correspond to a defined container content class.";
    uint64_t v23 = 692LL;
LABEL_9:
    id v24 = _CreateAndLogError( (uint64_t)"-[MobileInstallationHelperService _onQueue_createSafeHarborWithIdentifier:forPersona:containerType: andMigrateDataFrom:completion:]",  v23,  v21,  104LL,  0LL,  0LL,  v22,  v20,  v48);
    uint64_t v17 = objc_claimAutoreleasedReturnValue(v24);
LABEL_10:
    id v25 = (id)v17;
    v15[2](v15, v17);
    id v26 = 0LL;
    goto LABEL_11;
  }

  objc_opt_class(&OBJC_CLASS___NSURL);
  id v27 = v14;
  id v58 = v13;
  if ((objc_opt_isKindOfClass(v27) & 1) != 0) {
    id v28 = v27;
  }
  else {
    id v28 = 0LL;
  }

  if (!v28)
  {
    id v41 = _CreateAndLogError( (uint64_t)"-[MobileInstallationHelperService _onQueue_createSafeHarborWithIdentifier:forPersona:containerType: andMigrateDataFrom:completion:]",  698LL,  MIInstallerErrorDomain,  104LL,  0LL,  0LL,  @"incomingURL parameter is not a valid url",  v29,  v48);
    id v25 = (id)objc_claimAutoreleasedReturnValue(v41);
    v15[2](v15, (uint64_t)v25);
    id v26 = 0LL;
    goto LABEL_11;
  }

  uint64_t v57 = v27;
  uint64_t v67 = 0LL;
  MIGetCurrentMobileUserInfo((_DWORD *)&v67 + 1, &v67);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  char v31 = (void *)objc_claimAutoreleasedReturnValue([v30 stagingRootForUserContent]);
  id v66 = 0LL;
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v16 createTemporaryDirectoryInDirectoryURL:v31 error:&v66]);
  id v25 = v66;

  if (!v26)
  {
    id v42 = 0LL;
LABEL_33:
    id v13 = v58;
    goto LABEL_34;
  }

  id v65 = v25;
  unsigned __int8 v32 = [v16 setOwnerOfURL:v26 toUID:HIDWORD(v67) gid:v67 error:&v65];
  id v59 = v65;

  if ((v32 & 1) == 0)
  {
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v26 path]);
    id v45 = _CreateAndLogError( (uint64_t)"-[MobileInstallationHelperService _onQueue_createSafeHarborWithIdentifier:forPersona:containerType: andMigrateDataFrom:completion:]",  725LL,  MIInstallerErrorDomain,  105LL,  v59,  0LL,  @"Failed to chown temporary staging directory %@ to mobile/mobile",  v44,  (uint64_t)v43);
    id v25 = (id)objc_claimAutoreleasedReturnValue(v45);
    id v42 = 0LL;
LABEL_32:

    goto LABEL_33;
  }

  id v33 = (void *)objc_claimAutoreleasedReturnValue([v57 lastPathComponent]);
  id v56 = (void *)objc_claimAutoreleasedReturnValue([v26 URLByAppendingPathComponent:v33 isDirectory:1]);

  uint64_t v34 = gLogHandle;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v57 path]);
    id v54 = (void *)objc_claimAutoreleasedReturnValue([v56 path]);
    id v50 = v58;
    unint64_t v52 = a5;
    uint64_t v48 = (uint64_t)v18;
    MOLogWrite(v34);
  }

  unsigned __int8 v64 = 0;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "lastPathComponent", v48, v50, v52, v53, v54));
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v56 URLByDeletingLastPathComponent]);
  id v63 = v59;
  LOBYTE(v49) = 0;
  unsigned __int8 v37 = [v16 stageURLByMoving:v57 toItemName:v35 inStagingDir:v36 settingUID:HIDWORD(v67) gid:v67 dataProtectionClass:0xFFFFFFFFLL breakHardlinks:v49 hasSymlink:&v64 error:&v63];
  id v55 = v63;

  if ((v37 & 1) == 0)
  {
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v57 path]);
    uint64_t v51 = objc_claimAutoreleasedReturnValue([v26 path]);
    id v47 = _CreateAndLogError( (uint64_t)"-[MobileInstallationHelperService _onQueue_createSafeHarborWithIdentifier:forPersona:containerType: andMigrateDataFrom:completion:]",  736LL,  MIInstallerErrorDomain,  4LL,  v55,  0LL,  @"Failed to stage safe harbor content at %@ to %@",  v46,  (uint64_t)v43);
    id v25 = (id)objc_claimAutoreleasedReturnValue(v47);

    id v59 = (id)v51;
    id v42 = v56;
    goto LABEL_32;
  }

  id v62 = v55;
  int v38 = MIAssumeMobileIdentity(&v62);
  id v25 = v62;

  if (v38)
  {
    id v39 = (void *)objc_claimAutoreleasedReturnValue(+[MISafeHarborManager defaultManager](&OBJC_CLASS___MISafeHarborManager, "defaultManager"));
    id v61 = v25;
    unsigned __int8 v40 = objc_msgSend( v39,  "fromMIH_createSafeHarborWithIdentifier:forPersona:containerType:andMigrateDataFrom:contains OneOrMoreSymlinks:withError:",  v18,  v58,  a5,  v56,  v64,  &v61);
    id v60 = v61;

    id v13 = v58;
    MIRestoreIdentity();
    id v25 = v60;
    goto LABEL_35;
  }

  id v13 = v58;
  id v42 = v56;
LABEL_34:

LABEL_35:
  if (v26) {
    [v16 removeItemAtURL:v26 error:0];
  }
  v15[2](v15, (uint64_t)v25);
LABEL_11:
}

- (void)createSafeHarborWithIdentifier:(id)a3 forPersona:(id)a4 containerType:(unint64_t)a5 andMigrateDataFrom:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (qword_100021698 != -1) {
    dispatch_once(&qword_100021698, &stru_10001CB48);
  }
  uint64_t v16 = (dispatch_queue_s *)qword_1000216A0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000115D8;
  v21[3] = &unk_10001CB70;
  v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v25 = v15;
  unint64_t v26 = a5;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(v16, v21);
}

- (BOOL)_validateArgsForMethodWithName:(const char *)a3 bundleIdentifier:(id)a4 wrapperURL:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  objc_opt_class(&OBJC_CLASS___NSString);
  id v11 = v9;
  if ((objc_opt_isKindOfClass(v11) & 1) != 0) {
    id v12 = v11;
  }
  else {
    id v12 = 0LL;
  }

  if (v12)
  {
    objc_opt_class(&OBJC_CLASS___NSURL);
    id v14 = v10;
    if ((objc_opt_isKindOfClass(v14) & 1) != 0) {
      id v15 = v14;
    }
    else {
      id v15 = 0LL;
    }

    if (v15)
    {
      id v18 = 0LL;
      goto LABEL_15;
    }

    id v16 = _CreateAndLogError( (uint64_t)"-[MobileInstallationHelperService _validateArgsForMethodWithName:bundleIdentifier:wrapperURL:error:]",  1520LL,  MIInstallerErrorDomain,  104LL,  0LL,  0LL,  @"Parameter validation failed for: %s, wrapperURL parameter was not a valid url",  v17,  (uint64_t)a3);
  }

  else
  {
    id v16 = _CreateAndLogError( (uint64_t)"-[MobileInstallationHelperService _validateArgsForMethodWithName:bundleIdentifier:wrapperURL:error:]",  1515LL,  MIInstallerErrorDomain,  104LL,  0LL,  0LL,  @"Parameter validation failed for: %s, bundleIdentifier parameter was not a string",  v13,  (uint64_t)a3);
  }

  id v18 = (id)objc_claimAutoreleasedReturnValue(v16);
  if (a6 && v18)
  {
    id v18 = v18;
    *a6 = v18;
  }

- (BOOL)_validateArgsForMethodWithName:(const char *)a3 bundleIdentifier:(id)a4 wrapperURL:(id)a5 data:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v20 = 0LL;
  LODWORD(a4) = -[MobileInstallationHelperService _validateArgsForMethodWithName:bundleIdentifier:wrapperURL:error:]( self,  "_validateArgsForMethodWithName:bundleIdentifier:wrapperURL:error:",  a3,  a4,  a5,  &v20);
  id v13 = v20;
  if ((_DWORD)a4)
  {
    objc_opt_class(&OBJC_CLASS___NSData);
    id v14 = v12;
    id v15 = (objc_opt_isKindOfClass(v14) & 1) != 0 ? v14 : 0LL;

    if (!v15)
    {
      id v17 = _CreateAndLogError( (uint64_t)"-[MobileInstallationHelperService _validateArgsForMethodWithName:bundleIdentifier:wrapperURL:data:error:]",  1541LL,  MIInstallerErrorDomain,  104LL,  0LL,  0LL,  @"Parameter validation failed for: %s, data parameter was not a data object",  v16,  (uint64_t)a3);
      uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);

      id v13 = (id)v18;
    }
  }

  if (a7 && v13) {
    *a7 = v13;
  }

  return v13 == 0LL;
}

- (void)moveItemInStagingDirectory:(unint64_t)a3 atRelativePath:(id)a4 toDestinationURL:(id)a5 onBehalfOf:(id *)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, id))a7;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 stagingRootForIdentifier:a3]);

  if (!v17)
  {
    id v21 = _CreateAndLogError( (uint64_t)"-[MobileInstallationHelperService moveItemInStagingDirectory:atRelativePath:toDestinationURL:onBeha lfOf:completion:]",  2041LL,  MIInstallerErrorDomain,  104LL,  0LL,  0LL,  @"Failed to get the staging root for identifier %lu",  v18,  a3);
    id v22 = (char *)objc_claimAutoreleasedReturnValue(v21);
    id v23 = 0LL;
    id v24 = 0LL;
    id v20 = 0LL;
    goto LABEL_17;
  }

  objc_opt_class(&OBJC_CLASS___NSString);
  id v19 = v12;
  if ((objc_opt_isKindOfClass(v19) & 1) != 0) {
    id v20 = v19;
  }
  else {
    id v20 = 0LL;
  }

  if (!v20)
  {
    id v27 = _CreateAndLogError( (uint64_t)"-[MobileInstallationHelperService moveItemInStagingDirectory:atRelativePath:toDestinationURL:onBeha lfOf:completion:]",  2046LL,  MIInstallerErrorDomain,  104LL,  0LL,  0LL,  @"Parameter validation failed, pathRelativeToStagingURL %@ parameter was not a valid string",  v25,  (uint64_t)v19);
    id v22 = (char *)objc_claimAutoreleasedReturnValue(v27);
    id v23 = 0LL;
    id v24 = 0LL;
    goto LABEL_17;
  }

  v84 = v15;
  objc_opt_class(&OBJC_CLASS___NSURL);
  id v26 = v13;
  if ((objc_opt_isKindOfClass(v26) & 1) != 0) {
    id v20 = v26;
  }
  else {
    id v20 = 0LL;
  }

  if (!v20)
  {
    id v30 = _CreateAndLogError( (uint64_t)"-[MobileInstallationHelperService moveItemInStagingDirectory:atRelativePath:toDestinationURL:onBeha lfOf:completion:]",  2051LL,  MIInstallerErrorDomain,  104LL,  0LL,  0LL,  @"Parameter validation failed, destinationURL %@ parameter was not a valid url",  v28,  (uint64_t)v26);
    goto LABEL_15;
  }

  id v20 = (id)objc_claimAutoreleasedReturnValue([v19 pathComponents]);
  if ([v20 containsObject:@".."])
  {
    id v30 = _CreateAndLogError( (uint64_t)"-[MobileInstallationHelperService moveItemInStagingDirectory:atRelativePath:toDestinationURL:onBeha lfOf:completion:]",  2057LL,  MIInstallerErrorDomain,  104LL,  0LL,  0LL,  @"Relative path string %@ contains '..', which isn't allowed",  v29,  (uint64_t)v19);
LABEL_15:
    id v22 = (char *)objc_claimAutoreleasedReturnValue(v30);
    id v23 = 0LL;
    id v24 = 0LL;
LABEL_16:
    id v15 = v84;
    goto LABEL_17;
  }

  id v24 = (void *)objc_claimAutoreleasedReturnValue([v17 URLByAppendingPathComponent:v19 isDirectory:0]);
  uint64_t v31 = objc_claimAutoreleasedReturnValue([v84 realPathForURL:v24 ifChildOfURL:v17]);
  if (!v31)
  {
    id v33 = (void *)MIInstallerErrorDomain;
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v24 path]);
    id v66 = (void *)objc_claimAutoreleasedReturnValue([v17 path]);
    id v36 = _CreateAndLogError( (uint64_t)"-[MobileInstallationHelperService moveItemInStagingDirectory:atRelativePath:toDestinationURL:onBeha lfOf:completion:]",  2064LL,  v33,  104LL,  0LL,  0LL,  @"Path %@ isn't a child of %@",  v35,  (uint64_t)v34);
    id v22 = (char *)objc_claimAutoreleasedReturnValue(v36);

    id v23 = 0LL;
    goto LABEL_16;
  }

  id v23 = (void *)v31;
  uint64_t v32 = objc_claimAutoreleasedReturnValue( -[MobileInstallationHelperService _verifyBooleanEntitlement:]( self,  "_verifyBooleanEntitlement:",  @"com.apple.private.MobileInstallationHelperService.InstallDaemonOpsEnabled"));
  if (v32)
  {
    id v22 = (char *)v32;
    goto LABEL_16;
  }

  unsigned __int8 v37 = (void *)objc_claimAutoreleasedReturnValue([v26 URLByDeletingLastPathComponent]);
  __int128 v38 = *(_OWORD *)&a6->var0[4];
  __int128 v91 = *(_OWORD *)a6->var0;
  __int128 v92 = v38;
  id v72 = v37;
  id v77 = (char *)[v72 fileSystemRepresentation];
  *(_OWORD *)&atoken.st_dev = v91;
  *(_OWORD *)&atoken.st_uid = v92;
  uint64_t v73 = audit_token_to_euid((audit_token_t *)&atoken);
  *(_OWORD *)&atoken.st_dev = v91;
  *(_OWORD *)&atoken.st_uid = v92;
  gid_t v69 = audit_token_to_egid((audit_token_t *)&atoken);
  memset(&atoken, 0, sizeof(atoken));
  if (lstat(v77, &atoken))
  {
    int v39 = *__error();
    uint64_t v40 = gLogHandle;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      strerror(v39);
      uint64_t v41 = v40;
LABEL_28:
      MOLogWrite(v41);
    }
  }

  else
  {
    uint64_t v41 = gLogHandle;
  }

  if (!(_DWORD)v73)
  {
    id v42 = 0LL;
    if (!access(v77, 2))
    {
      char v78 = 1;
      goto LABEL_38;
    }

    goto LABEL_34;
  }

  id v89 = 0LL;
  char v70 = MIAssumeIdentity(v73, v69, &v89);
  id v42 = v89;
  if ((v70 & 1) == 0)
  {
LABEL_36:
    id v42 = v42;
    char v78 = 0;
    id v74 = v42;
    goto LABEL_37;
  }

  if (access(v77, 2))
  {
LABEL_34:
    unsigned __int8 v71 = v42;
    uint64_t v43 = __error();
    id Error = _CreateError( (uint64_t)"_VerifyWriteAccessToURLWithToken",  1092LL,  NSPOSIXErrorDomain,  *v43,  0LL,  0LL,  @"access failed for uid %u path %s",  v44,  v73);
    id v42 = (id)objc_claimAutoreleasedReturnValue(Error);

    if ((_DWORD)v73) {
      MIRestoreIdentity();
    }
    goto LABEL_36;
  }

  MIRestoreIdentity();
  id v74 = 0LL;
  char v78 = 1;
LABEL_37:

  id v42 = v74;
LABEL_38:
  id v46 = v42;

  if ((v78 & 1) == 0)
  {
    __int128 v51 = *(_OWORD *)&a6->var0[4];
    *(_OWORD *)&atoken.st_dev = *(_OWORD *)a6->var0;
    *(_OWORD *)&atoken.st_uid = v51;
    unint64_t v52 = v46;
    uint64_t v53 = audit_token_to_euid((audit_token_t *)&atoken);
    id v80 = (char *)MIInstallerErrorDomain;
    id v68 = (void *)objc_claimAutoreleasedReturnValue([v26 path]);
    id v55 = _CreateAndLogError( (uint64_t)"-[MobileInstallationHelperService moveItemInStagingDirectory:atRelativePath:toDestinationURL:onBeha lfOf:completion:]",  2075LL,  v80,  3LL,  v52,  0LL,  @"Unable to confirm write access for user %u to %@",  v54,  v53);
    id v22 = (char *)objc_claimAutoreleasedReturnValue(v55);

    goto LABEL_16;
  }

  id v79 = (char *)v46;
  if ([v84 itemExistsAtURL:v26])
  {
    id v47 = (void *)MIInstallerErrorDomain;
    uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v23 path]);
    uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue([v26 path]);
    id v50 = _CreateAndLogError( (uint64_t)"-[MobileInstallationHelperService moveItemInStagingDirectory:atRelativePath:toDestinationURL:onBeha lfOf:completion:]",  2081LL,  v47,  2LL,  0LL,  0LL,  @"Failed to move item from %@ to %@ because destination already exists",  v49,  (uint64_t)v48);
    id v22 = (char *)objc_claimAutoreleasedReturnValue(v50);

LABEL_41:
    goto LABEL_16;
  }

  __int128 v56 = *(_OWORD *)&a6->var0[4];
  *(_OWORD *)&atoken.st_dev = *(_OWORD *)a6->var0;
  *(_OWORD *)&atoken.st_uid = v56;
  uint64_t v57 = audit_token_to_euid((audit_token_t *)&atoken);
  __int128 v58 = *(_OWORD *)&a6->var0[4];
  *(_OWORD *)&atoken.st_dev = *(_OWORD *)a6->var0;
  *(_OWORD *)&atoken.st_uid = v58;
  v88 = v79;
  unsigned int v75 = [v84 standardizeOwnershipAtURL:v23 toUID:v57 GID:audit_token_to_egid((audit_token_t *)&atoken) removeACLs:0 setProtectionClass:0 foundSymlink:0 error:&v88];
  id v22 = v88;

  if (!v75) {
    goto LABEL_16;
  }
  id v59 = v22;
  v87 = v22;
  unsigned __int8 v81 = [v84 secureRenameFromSourceURL:v23 toDestinationURL:v26 destinationStatus:2 error:&v87];
  id v22 = v87;

  if ((v81 & 1) != 0)
  {

    id v22 = 0LL;
    goto LABEL_16;
  }

  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v22 domain]);
  v82 = (char *)[v22 code];

  id v60 = (char *)objc_claimAutoreleasedReturnValue([v26 path]);
  if (([v60 hasPrefix:@"/private/var/PersonaVolumes/"] & 1) != 0
    || [v60 hasPrefix:@"/var/PersonaVolumes/"])
  {
    stat v83 = v60;
    v86 = v22;
    unsigned int v76 = [v84 copyItemAtURL:v23 toURL:v26 error:&v86];
    id v61 = v86;

    if (v76)
    {
      v85 = v61;
      unsigned __int8 v62 = [v84 removeItemAtURL:v23 error:&v85];
      id v63 = v85;

      if ((v62 & 1) == 0)
      {
        uint64_t v64 = gLogHandle;
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          id v65 = (void *)objc_claimAutoreleasedReturnValue([v23 path]);
          MOLogWrite(v64);
        }
      }

      id v22 = 0LL;
      id v15 = v84;
    }

    else
    {
      id v22 = v61;
      id v15 = v84;
    }

    id v60 = v83;
  }

  else
  {
    id v15 = v84;
  }

LABEL_17:
  v14[2](v14, v22);
}

- (void)getPidForTestingWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t v4 = getpid();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, v4);
}

- (void)dieForTesting
{
  uint64_t v2 = gLogHandle;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MobileInstallationHelperService clientName](self, "clientName"));
    MOLogWrite(v2);
  }

  exit(1);
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_xpcConnection);
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end