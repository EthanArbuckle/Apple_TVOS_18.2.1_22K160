@interface MSDOperationBuilder
- (BOOL)disableBackgroundInstall;
- (BOOL)forBackgroundDownload;
- (BOOL)verifyHashBeforeStaging;
- (MSDOperationBuilder)initWithSignedManifest:(id)a3 forBackgroundDownload:(BOOL)a4 verifyHashBeforeStaging:(BOOL)a5;
- (MSDSignedManifest)signedManifest;
- (id)buildAppDataOperationsWithIdentifier:(id)a3 andDependencies:(id)a4;
- (id)buildAppOperationsWithIdentifier:(id)a3 shouldDeferApp:(BOOL)a4;
- (id)buildAppRemovalOperationsWithIdentifier:(id)a3;
- (id)buildBackupOperationsWithPath:(id)a3 andIndex:(unint64_t)a4;
- (id)buildConfigurationProfileOperationsWithIdentifier:(id)a3;
- (id)buildProvisioningProfileOperations:(id)a3;
- (id)buildSettingsOperationWithIdentifier:(id)a3;
- (id)buildStandalonePkgOperationsWithIdentifier:(id)a3;
- (id)buildSystemAppOperationsWithIdentifier:(id)a3;
- (id)sequentialGroupForIdentifiers:(id)a3 andContext:(id)a4;
- (id)sequentialOperationsForIdentifiers:(id)a3 andContext:(id)a4;
- (void)setDisableBackgroundInstall:(BOOL)a3;
- (void)setForBackgroundDownload:(BOOL)a3;
- (void)setSignedManifest:(id)a3;
- (void)setVerifyHashBeforeStaging:(BOOL)a3;
@end

@implementation MSDOperationBuilder

- (MSDOperationBuilder)initWithSignedManifest:(id)a3 forBackgroundDownload:(BOOL)a4 verifyHashBeforeStaging:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MSDOperationBuilder;
  v9 = -[MSDOperationBuilder init](&v17, "init");
  v10 = v9;
  if (v9)
  {
    -[MSDOperationBuilder setSignedManifest:](v9, "setSignedManifest:", v8);
    -[MSDOperationBuilder setForBackgroundDownload:](v10, "setForBackgroundDownload:", v6);
    -[MSDOperationBuilder setVerifyHashBeforeStaging:](v10, "setVerifyHashBeforeStaging:", v5);
    -[MSDOperationBuilder setDisableBackgroundInstall:]( v10,  "setDisableBackgroundInstall:",  +[MSDHubFeatureFlags disableBackgroundInstall](&OBJC_CLASS___MSDHubFeatureFlags, "disableBackgroundInstall"));
    if (-[MSDOperationBuilder disableBackgroundInstall](v10, "disableBackgroundInstall"))
    {
      id v11 = sub_10003A95C();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Background install is disabled by feature flag!",  v16,  2u);
      }
    }

    +[MSDOperationContext setDownloadOnly:](&OBJC_CLASS___MSDOperationContext, "setDownloadOnly:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[MSDContentFilesContext processedContainers]( &OBJC_CLASS___MSDContentFilesContext,  "processedContainers"));
    [v13 removeAllObjects];

    v14 = v10;
  }

  return v10;
}

- (id)buildBackupOperationsWithPath:(id)a3 andIndex:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 getVersion]));

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[MSDSignedManifest getComponentFromPath:forManifestVersion:]( &OBJC_CLASS___MSDSignedManifest,  "getComponentFromPath:forManifestVersion:",  v6,  v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 demoUserHomePath]);

  v12 = objc_alloc(&OBJC_CLASS___MSDManifest);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mergedBackupManifest:", a4, 1));
  v15 = -[MSDManifest initWithDictionary:andUserHomePath:](v12, "initWithDictionary:andUserHomePath:", v14, v11);

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[MSDContentFilesContext defaultContextForBackupItem:]( &OBJC_CLASS___MSDContentFilesContext,  "defaultContextForBackupItem:",  v9));
    [v16 setMasterManifest:v15];
    objc_msgSend( v16,  "setVerifyFileHash:",  -[MSDOperationBuilder verifyHashBeforeStaging](self, "verifyHashBeforeStaging"));
    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "originServerForBackupManifest:", a4, 1));
    [v16 setOriginServer:v18];

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 getDataComponentRealSizeFromSection:@"BackupData" forIdentifier:v9]);
    [v16 setDiskSpacedRequired:v20];

    objc_msgSend(v16, "setContentBeingInstalled:", a4, 1);
    [v16 setAppIdentifier:v9];
    if (-[MSDOperationBuilder forBackgroundDownload](self, "forBackgroundDownload")) {
      v21 = @"/private/var/mnt/com.apple.mobilestoredemo.snapshot";
    }
    else {
      v21 = @"/";
    }
    [v16 setRootFileSystemPath:v21];
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithObjects:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObjects:",  @"MSDContentFilesPrepareOperation",  @"MSDContentFilesDownloadOperation",  @"MSDContentFilesInstallOperation",  0LL));
    if (-[MSDOperationBuilder forBackgroundDownload](self, "forBackgroundDownload")
      && -[MSDOperationBuilder disableBackgroundInstall](self, "disableBackgroundInstall"))
    {
      [v22 removeLastObject];
    }

    if (-[MSDOperationBuilder forBackgroundDownload](self, "forBackgroundDownload")) {
      goto LABEL_13;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
    unsigned __int8 v24 = [v23 isItemBaseBackup:v6];

    if ((v24 & 1) != 0
      || (v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest")),
          unsigned __int8 v26 = [v25 isItemProvisioningProfileBackup:v6],
          v25,
          (v26 & 1) != 0))
    {
      v27 = &off_1000FA1A0;
    }

    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
      unsigned int v31 = [v30 isItemConfigurationProfileBackup:v6];

      if (!v31) {
        goto LABEL_13;
      }
      v27 = &off_1000FA198;
    }

    [v22 addObject:*v27];
LABEL_13:
    v28 = (void *)objc_claimAutoreleasedReturnValue( -[MSDOperationBuilder sequentialOperationsForIdentifiers:andContext:]( self,  "sequentialOperationsForIdentifiers:andContext:",  v22,  v16));

    goto LABEL_14;
  }

  id v32 = sub_10003A95C();
  v16 = (void *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR)) {
    sub_10009D67C();
  }
  v28 = 0LL;
LABEL_14:

  return v28;
}

- (id)buildSystemAppOperationsWithIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 getSystemAppDataList]);

  if (v7 && (uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary, v8), (objc_opt_isKindOfClass(v7, v9) & 1) != 0))
  {
    id v44 = v4;
    if (-[MSDOperationBuilder forBackgroundDownload](self, "forBackgroundDownload"))
    {
      v10 = 0LL;
    }

    else
    {
      v10 = objc_alloc_init(&OBJC_CLASS___MSDOperationContext);
      -[MSDOperationContext setIdentifier:](v10, "setIdentifier:", v4);
      v53 = @"MSDSystemAppsDataPrepareOperation";
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v53, 1LL));
      v12 = (MSDOperationContext *)objc_claimAutoreleasedReturnValue( -[MSDOperationBuilder sequentialGroupForIdentifiers:andContext:]( self,  "sequentialGroupForIdentifiers:andContext:",  v11,  v10));

      if (!v12) {
        goto LABEL_30;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationContext operations](v12, "operations"));
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 allObjects]);
      -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v14);

      v10 = v12;
    }

    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    v43 = v7;
    id obj = v7;
    id v15 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v47;
      while (2)
      {
        v18 = 0LL;
        do
        {
          if (*(void *)v47 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v46 + 1) + 8LL * (void)v18);
          id v20 = sub_10003A95C();
          v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v51 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Processing system app: %{public}@",  buf,  0xCu);
          }

          v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
          v23 = (void *)objc_claimAutoreleasedReturnValue([v22 getSystemAppDependecies:v19]);

          if (v23
            && (uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSDictionary, v24), (objc_opt_isKindOfClass(v23, v25) & 1) != 0))
          {
            unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue( -[MSDOperationBuilder buildAppDataOperationsWithIdentifier:andDependencies:]( self,  "buildAppDataOperationsWithIdentifier:andDependencies:",  v19,  v23));
            if (!v26)
            {
              id v32 = sub_10003A95C();
              v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
                sub_10009D6DC(v33, v34, v35, v36, v37, v38, v39, v40);
              }

              v12 = 0LL;
              goto LABEL_29;
            }

            v27 = v26;
            if (v10) {
              [v26 addDependency:v10];
            }
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "operations", v43));
            v29 = (void *)objc_claimAutoreleasedReturnValue([v28 allObjects]);
            -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v29);
          }

          else
          {
            id v30 = sub_10003A95C();
            v27 = (void *)objc_claimAutoreleasedReturnValue(v30);
            if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v51 = v19;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v27,  OS_LOG_TYPE_DEFAULT,  "Missing app data dependencies for system app:  %{public}@",  buf,  0xCu);
            }
          }

          v18 = (char *)v18 + 1;
        }

        while (v16 != v18);
        id v31 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
        id v16 = v31;
        if (v31) {
          continue;
        }
        break;
      }
    }

    v12 = v5;
LABEL_29:
    v7 = v43;
    id v4 = v44;
  }

  else
  {
    id v42 = sub_10003A95C();
    v10 = (MSDOperationContext *)objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_DEFAULT,  "Missing SystemApps data section.",  buf,  2u);
    }

    v12 = 0LL;
  }

- (id)buildAppOperationsWithIdentifier:(id)a3 shouldDeferApp:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v72 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 getAppManifest:v6]);

  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary, v9);
  v70 = v8;
  if ((objc_opt_isKindOfClass(v8, v10) & 1) == 0)
  {
    id v52 = sub_10003A95C();
    v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v75 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "Unexpected app info format: %{public}@",  buf,  0xCu);
    }

    v18 = 0LL;
    __int128 v47 = 0LL;
    uint64_t v40 = 0LL;
    v23 = 0LL;
    v73 = 0LL;
    v71 = 0LL;
    goto LABEL_45;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 getAppDependecies:v6]);

  v71 = v12;
  if (v12)
  {
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary, v13);
    if ((objc_opt_isKindOfClass(v12, v14) & 1) == 0)
    {
      id v58 = sub_10003A95C();
      v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v75 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "Unexpected app dependencies format: %{public}@",  buf,  0xCu);
      }

      v18 = 0LL;
      __int128 v47 = 0LL;
      uint64_t v40 = 0LL;
      v23 = 0LL;
      v73 = 0LL;
LABEL_45:
      v69 = 0LL;
      goto LABEL_46;
    }
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"ProvisioningProfiles"]);
  v69 = v15;
  if (v15 && (id v16 = v15, [v15 count]))
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[MSDOperationBuilder buildProvisioningProfileOperations:]( self,  "buildProvisioningProfileOperations:",  v16));
    v18 = v17;
    if (!v17)
    {
      __int128 v47 = 0LL;
      uint64_t v40 = 0LL;
      v23 = 0LL;
      v73 = 0LL;
      goto LABEL_46;
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v17 operations]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 allObjects]);
    -[NSMutableArray addObjectsFromArray:](v72, "addObjectsFromArray:", v20);
  }

  else
  {
    v18 = 0LL;
  }

  uint64_t v21 = objc_claimAutoreleasedReturnValue([v8 objectForKey:@"Identifier"]);
  uint64_t v22 = objc_claimAutoreleasedReturnValue([v8 objectForKey:@"Hash"]);
  v23 = (void *)v22;
  v73 = (void *)v21;
  if (!v21 || !v22)
  {
    id v54 = sub_10003A95C();
    v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v75 = v8;
      v56 = "Missing app identifier or hash data from app info: %{public}@";
LABEL_39:
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, v56, buf, 0xCu);
    }

- (id)buildStandalonePkgOperationsWithIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 getManifestInfoFromSection:@"Packages" forIdentifier:v4]);

  if (!v6)
  {
    id v22 = sub_10003A95C();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v26 = v4;
      v23 = "Missing Info section for stand-alone package:  %{public}@";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v23, buf, 0xCu);
    }

- (id)buildConfigurationProfileOperationsWithIdentifier:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v23 = sub_10003A95C();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10009D70C(v6, v24, v25, v26, v27, v28, v29, v30);
    }
    goto LABEL_22;
  }

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 getManifestDataFromSection:@"ConfigurationProfiles" forIdentifier:v4]);

  if (!v6)
  {
    id v31 = sub_10003A95C();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10009D774();
    }
    goto LABEL_22;
  }

  if (-[os_log_s count](v6, "count") != (id)1)
  {
    id v32 = sub_10003A95C();
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_10009D8BC();
    }
    goto LABEL_18;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 getManifestInfoFromSection:@"ConfigurationProfiles" forIdentifier:v4]);

  if (!v8)
  {
    id v34 = sub_10003A95C();
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_10009D7E4();
    }
LABEL_18:

LABEL_22:
    uint64_t v21 = 0LL;
    goto LABEL_9;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s allKeys](v6, "allKeys"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v6, "objectForKey:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"MSDManifestFileHash"]);

  if (!v12)
  {
    id v35 = sub_10003A95C();
    uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_10009D854();
    }

    goto LABEL_22;
  }

  uint64_t v13 = objc_alloc_init(&OBJC_CLASS___MSDInstallableFileContext);
  -[MSDOperationContext setIdentifier:](v13, "setIdentifier:", v4);
  -[MSDInstallableFileContext setFileType:](v13, "setFileType:", 3LL);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 hexStringRepresentation]);
  -[MSDInstallableFileContext setFileHash:](v13, "setFileHash:", v14);

  -[MSDInstallableFileContext setVerifyFileHash:]( v13,  "setVerifyFileHash:",  -[MSDOperationBuilder verifyHashBeforeStaging](self, "verifyHashBeforeStaging"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 getOriginServerFromSection:@"ConfigurationProfiles" forIdentifier:v4]);
  -[MSDInstallableFileContext setOriginServer:](v13, "setOriginServer:", v16);

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 getDataComponentRealSizeFromSection:@"ConfigurationProfiles" forIdentifier:v4]);
  -[MSDOperationContext setDiskSpacedRequired:](v13, "setDiskSpacedRequired:", v18);

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ProfileIdentifier"]);
  -[MSDInstallableFileContext setProfileIdentifier:](v13, "setProfileIdentifier:", v19);

  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithObjects:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObjects:",  @"MSDBasePrepareOperation",  @"MSDInstallableFileDownloadOperation",  0LL));
  if (!-[MSDOperationBuilder forBackgroundDownload](self, "forBackgroundDownload")) {
    [v20 addObject:@"MSDConfigurationProfileInstallOperation"];
  }
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[MSDOperationBuilder sequentialOperationsForIdentifiers:andContext:]( self,  "sequentialOperationsForIdentifiers:andContext:",  v20,  v13));

  id v6 = (os_log_s *)v20;
LABEL_9:

  return v21;
}

- (id)buildAppRemovalOperationsWithIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v6 = objc_alloc_init(&OBJC_CLASS___MSDInstallableFileContext);
  -[MSDInstallableFileContext setFileType:](v6, "setFileType:", 0LL);
  -[MSDOperationContext setIdentifier:](v6, "setIdentifier:", v4);

  -[MSDInstallableFileContext setVerifyFileHash:]( v6,  "setVerifyFileHash:",  -[MSDOperationBuilder verifyHashBeforeStaging](self, "verifyHashBeforeStaging"));
  id v22 = @"MSDIPAUninstallOperation";
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[MSDOperationBuilder sequentialGroupForIdentifiers:andContext:]( self,  "sequentialGroupForIdentifiers:andContext:",  v7,  v6));

  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 operations]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allObjects]);
    -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v10);

    id v11 = v5;
  }

  else
  {
    id v13 = sub_10003A95C();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10009D91C(v14, v15, v16, v17, v18, v19, v20, v21);
    }

    id v11 = 0LL;
  }

  return v11;
}

- (id)buildSettingsOperationWithIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 getSettingsDataFromSection:@"BackupData" forIdentifier:v4]);

  id v7 = sub_10003A95C();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315394;
      uint64_t v14 = "-[MSDOperationBuilder buildSettingsOperationWithIdentifier:]";
      __int16 v15 = 2114;
      uint64_t v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s - %{public}@", (uint8_t *)&v13, 0x16u);
    }

    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[MSDSettingsContext defaultContextForIdentifier:]( &OBJC_CLASS___MSDSettingsContext,  "defaultContextForIdentifier:",  v4));
    -[os_log_s setDataDict:](v9, "setDataDict:", v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    [v10 addObject:@"MSDSettingsInstallOperation"];
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[MSDOperationBuilder sequentialOperationsForIdentifiers:andContext:]( self,  "sequentialOperationsForIdentifiers:andContext:",  v10,  v9));
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10009D94C();
    }
    id v11 = 0LL;
  }

  return v11;
}

- (id)sequentialOperationsForIdentifiers:(id)a3 andContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_claimAutoreleasedReturnValue( +[MSDOperationRepository createOperationFromIdentifier:withContext:]( &OBJC_CLASS___MSDOperationRepository,  "createOperationFromIdentifier:withContext:",  *(void *)(*((void *)&v18 + 1) + 8LL * (void)v12),  v6,  (void)v18));
        if (!v13)
        {

          uint64_t v16 = 0LL;
          goto LABEL_13;
        }

        uint64_t v14 = (void *)v13;
        if (-[NSMutableArray count](v7, "count"))
        {
          __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](v7, "lastObject"));
          [v14 addDependency:v15];
        }

        -[NSMutableArray addObject:](v7, "addObject:", v14);

        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  uint64_t v16 = v7;
LABEL_13:

  return v16;
}

- (id)sequentialGroupForIdentifiers:(id)a3 andContext:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MSDOperationBuilder sequentialOperationsForIdentifiers:andContext:]( self,  "sequentialOperationsForIdentifiers:andContext:",  a3,  a4));
  id v5 = -[MSDOperationGroup initWithOperations:](objc_alloc(&OBJC_CLASS___MSDOperationGroup), "initWithOperations:", v4);

  return v5;
}

- (id)buildAppDataOperationsWithIdentifier:(id)a3 andDependencies:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue([v8 demoUserHomePath]);

  uint64_t v66 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v9 = objc_alloc_init(&OBJC_CLASS___MSDOperationContext);
  uint64_t v65 = v6;
  -[MSDOperationContext setIdentifier:](v9, "setIdentifier:", v6);
  if ([v7 count])
  {
    v81 = @"MSDApplicationDataPrepareOperation";
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v81, 1LL));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[MSDOperationBuilder sequentialGroupForIdentifiers:andContext:]( self,  "sequentialGroupForIdentifiers:andContext:",  v10,  v9));

    if (v11)
    {
      -[NSMutableArray addObject:](v66, "addObject:", v11);
      __int128 v73 = 0u;
      __int128 v74 = 0u;
      __int128 v71 = 0u;
      __int128 v72 = 0u;
      id v12 = v7;
      id v13 = [v12 countByEnumeratingWithState:&v71 objects:v80 count:16];
      if (!v13) {
        goto LABEL_49;
      }
      id v14 = v13;
      uint64_t v60 = *(void *)v72;
      uint64_t v63 = v11;
      id v57 = v9;
      id v58 = v7;
      v59 = v12;
      while (1)
      {
        uint64_t v15 = 0LL;
        id v56 = v14;
        do
        {
          if (*(void *)v72 != v60) {
            objc_enumerationMutation(v12);
          }
          uint64_t v61 = v15;
          uint64_t v16 = *(void **)(*((void *)&v71 + 1) + 8 * v15);
          uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v16]);
          __int128 v18 = v16;
          if (!v17 || !-[os_log_s count](v17, "count"))
          {
            id v24 = sub_10003A95C();
            __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_44;
            }
            *(_DWORD *)buf = 138543362;
            v76 = v18;
            __int128 v21 = v20;
            id v22 = "No dependency listed under: %{public}@";
LABEL_15:
            uint32_t v23 = 12;
LABEL_16:
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v22, buf, v23);
            goto LABEL_44;
          }

          if ([v18 isEqualToString:@"ProvisioningProfiles"])
          {
            id v19 = sub_10003A95C();
            __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_44;
            }
            *(_WORD *)buf = 0;
            __int128 v21 = v20;
            id v22 = "Skip app provisioning profile dependency.";
            uint32_t v23 = 2;
            goto LABEL_16;
          }

          if (([v18 isEqualToString:@"AppData"] & 1) != 0
            || ([v18 isEqualToString:@"ExtensionData"] & 1) != 0
            || ([v18 isEqualToString:@"GroupData"] & 1) != 0
            || ([v18 isEqualToString:@"UserData"] & 1) != 0
            || ([v18 isEqualToString:@"SharedAppData"] & 1) != 0)
          {
            __int128 v69 = 0u;
            __int128 v70 = 0u;
            __int128 v67 = 0u;
            __int128 v68 = 0u;
            __int128 v20 = v17;
            id v25 = -[os_log_s countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v67,  v79,  16LL);
            if (v25)
            {
              id v26 = v25;
              id obj = v20;
              uint64_t v27 = *(void *)v68;
              while (2)
              {
                for (i = 0LL; i != v26; i = (char *)i + 1)
                {
                  if (*(void *)v68 != v27) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v29 = *(const char **)(*((void *)&v67 + 1) + 8LL * (void)i);
                  id v30 = sub_10003A95C();
                  id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543618;
                    v76 = v29;
                    __int16 v77 = 2114;
                    v78 = v18;
                    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Creating operation sequence for app data: <Name = %{public}@, Type = %{public}@>",  buf,  0x16u);
                  }

                  id v32 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
                  v33 = (void *)objc_claimAutoreleasedReturnValue([v32 getManifestDataFromSection:v18 forIdentifier:v29]);

                  if (!v33)
                  {
                    id v52 = sub_10003A95C();
                    uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
                    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315394;
                      v76 = "-[MSDOperationBuilder buildAppDataOperationsWithIdentifier:andDependencies:]";
                      __int16 v77 = 2114;
                      v78 = (char *)v29;
                      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "%s - Failed to retrieve master manifest data for %{public}@",  buf,  0x16u);
                    }

                    goto LABEL_56;
                  }

                  id v34 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
                  unsigned int v35 = [v34 isContainerizedComponent:v18];

                  if (v35) {
                    uint64_t v36 = objc_claimAutoreleasedReturnValue( +[MSDContentFilesContext defaultContextForContainerizedAppDataItem:]( &OBJC_CLASS___MSDContentFilesContext,  "defaultContextForContainerizedAppDataItem:",  v29));
                  }
                  else {
                    uint64_t v36 = objc_claimAutoreleasedReturnValue( +[MSDContentFilesContext defaultContextForNonContainerizedAppDataItem:]( &OBJC_CLASS___MSDContentFilesContext,  "defaultContextForNonContainerizedAppDataItem:",  v29));
                  }
                  uint64_t v37 = (os_log_s *)v36;
                  uint64_t v38 = -[MSDManifest initWithDictionary:andUserHomePath:]( objc_alloc(&OBJC_CLASS___MSDManifest),  "initWithDictionary:andUserHomePath:",  v33,  v64);
                  -[os_log_s setMasterManifest:](v37, "setMasterManifest:", v38);

                  -[os_log_s setIdentifier:](v37, "setIdentifier:", v29);
                  -[os_log_s setContainerType:](v37, "setContainerType:", v18);
                  -[os_log_s setVerifyFileHash:]( v37,  "setVerifyFileHash:",  -[MSDOperationBuilder verifyHashBeforeStaging](self, "verifyHashBeforeStaging"));
                  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
                  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v39 getOriginServerFromSection:v18 forIdentifier:v29]);
                  -[os_log_s setOriginServer:](v37, "setOriginServer:", v40);

                  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
                  id v42 = (void *)objc_claimAutoreleasedReturnValue([v41 getDataComponentRealSizeFromSection:v18 forIdentifier:v29]);
                  -[os_log_s setDiskSpacedRequired:](v37, "setDiskSpacedRequired:", v42);

                  -[os_log_s setAppIdentifier:](v37, "setAppIdentifier:", v65);
                  if (-[MSDOperationBuilder forBackgroundDownload](self, "forBackgroundDownload")) {
                    v43 = @"/private/var/mnt/com.apple.mobilestoredemo.snapshot";
                  }
                  else {
                    v43 = @"/";
                  }
                  -[os_log_s setRootFileSystemPath:](v37, "setRootFileSystemPath:", v43);
                  id v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithObjects:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObjects:",  @"MSDContentFilesPrepareOperation",  @"MSDContentFilesDownloadOperation",  @"MSDContentFilesInstallOperation",  0LL));
                  if (-[MSDOperationBuilder forBackgroundDownload](self, "forBackgroundDownload")
                    && -[MSDOperationBuilder disableBackgroundInstall](self, "disableBackgroundInstall"))
                  {
                    [v44 removeLastObject];
                  }

                  v45 = (void *)objc_claimAutoreleasedReturnValue( -[MSDOperationBuilder sequentialGroupForIdentifiers:andContext:]( self,  "sequentialGroupForIdentifiers:andContext:",  v44,  v37));
                  uint64_t v11 = v63;
                  if (!v45)
                  {

LABEL_56:
                    uint64_t v49 = 0LL;
                    id v9 = v57;
                    id v7 = v58;
                    goto LABEL_57;
                  }

                  __int128 v46 = v45;
                  [v45 addDependency:v63];
                  -[NSMutableArray addObject:](v66, "addObject:", v46);
                }

                id v26 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v67,  v79,  16LL);
                if (v26) {
                  continue;
                }
                break;
              }

              __int128 v20 = obj;
              uint64_t v17 = obj;
              id v12 = v59;
              id v14 = v56;
            }

            else
            {
              uint64_t v17 = v20;
            }
          }

          else
          {
            id v47 = sub_10003A95C();
            __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v76 = v18;
              __int128 v21 = v20;
              id v22 = "Ignore unrecognized app dependency: %{public}@";
              goto LABEL_15;
            }
          }

- (id)buildProvisioningProfileOperations:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v6 = v4;
  id v33 = [v6 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v33)
  {
    uint64_t v32 = *(void *)v35;
    id obj = v6;
    id v31 = v5;
    while (2)
    {
      for (i = 0LL; i != v33; i = (char *)i + 1)
      {
        if (*(void *)v35 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v34 + 1) + 8LL * (void)i);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 getManifestDataFromSection:@"ProvisioningProfiles" forIdentifier:v8]);

        if (!v10)
        {
          id v25 = sub_10003A95C();
          id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v39 = v8;
            __int16 v40 = 2114;
            v41 = @"ProvisioningProfiles";
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "ERROR - Missing data for profile:  %{public}@ under component:  %{public}@",  buf,  0x16u);
          }

          goto LABEL_23;
        }

        if ([v10 count] != (id)1)
        {
          id v26 = sub_10003A95C();
          id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            sub_10009D8BC();
          }
          goto LABEL_23;
        }

        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allKeys]);
        id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 firstObject]);

        id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v12]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"MSDManifestFileHash"]);

        if (!v14)
        {
          id v27 = sub_10003A95C();
          uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            sub_10009D854();
          }

          goto LABEL_23;
        }

        uint64_t v15 = objc_alloc_init(&OBJC_CLASS___MSDInstallableFileContext);
        -[MSDOperationContext setIdentifier:](v15, "setIdentifier:", v8);
        -[MSDInstallableFileContext setFileType:](v15, "setFileType:", 2LL);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 hexStringRepresentation]);
        -[MSDInstallableFileContext setFileHash:](v15, "setFileHash:", v16);

        -[MSDInstallableFileContext setVerifyFileHash:]( v15,  "setVerifyFileHash:",  -[MSDOperationBuilder verifyHashBeforeStaging](self, "verifyHashBeforeStaging"));
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 getOriginServerFromSection:@"ProvisioningProfiles" forIdentifier:v8]);
        -[MSDInstallableFileContext setOriginServer:](v15, "setOriginServer:", v18);

        id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( [v19 getDataComponentRealSizeFromSection:@"ProvisioningProfiles" forIdentifier:v8]);
        -[MSDOperationContext setDiskSpacedRequired:](v15, "setDiskSpacedRequired:", v20);

        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithObjects:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObjects:",  @"MSDProvisioningProfilePrepareOperation",  @"MSDInstallableFileDownloadOperation",  0LL));
        if (!-[MSDOperationBuilder forBackgroundDownload](self, "forBackgroundDownload")) {
          [v21 addObject:@"MSDProvisioningProfileInstallOperation"];
        }
        uint64_t v22 = objc_claimAutoreleasedReturnValue( -[MSDOperationBuilder sequentialOperationsForIdentifiers:andContext:]( self,  "sequentialOperationsForIdentifiers:andContext:",  v21,  v15));
        id v5 = v31;
        if (!v22)
        {

          id v12 = (os_log_s *)v21;
LABEL_23:
          id v6 = obj;

          id v24 = 0LL;
          goto LABEL_24;
        }

        uint32_t v23 = (void *)v22;
        -[NSMutableArray addObjectsFromArray:](v31, "addObjectsFromArray:", v22);
      }

      id v6 = obj;
      id v33 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (v33) {
        continue;
      }
      break;
    }
  }

  id v24 = -[MSDOperationGroup initWithOperations:](objc_alloc(&OBJC_CLASS___MSDOperationGroup), "initWithOperations:", v5);
LABEL_24:

  return v24;
}

- (MSDSignedManifest)signedManifest
{
  return self->_signedManifest;
}

- (void)setSignedManifest:(id)a3
{
}

- (BOOL)forBackgroundDownload
{
  return self->_forBackgroundDownload;
}

- (void)setForBackgroundDownload:(BOOL)a3
{
  self->_forBackgroundDownload = a3;
}

- (BOOL)verifyHashBeforeStaging
{
  return self->_verifyHashBeforeStaging;
}

- (void)setVerifyHashBeforeStaging:(BOOL)a3
{
  self->_verifyHashBeforeStaging = a3;
}

- (BOOL)disableBackgroundInstall
{
  return self->_disableBackgroundInstall;
}

- (void)setDisableBackgroundInstall:(BOOL)a3
{
  self->_disableBackgroundInstall = a3;
}

- (void).cxx_destruct
{
}

@end