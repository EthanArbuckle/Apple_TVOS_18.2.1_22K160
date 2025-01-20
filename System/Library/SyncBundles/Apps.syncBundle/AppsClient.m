@interface AppsClient
+ (BOOL)_makeIconFromBundlePath:(id)a3 saveTo:(id)a4;
+ (id)_loadDemotedAppsPlist:(id)a3 withError:(id *)a4;
+ (id)_loadPlist:(id)a3 withError:(id *)a4;
+ (id)_orderTheItems:(id)a3;
+ (void)_notifySpringBoard:(BOOL)a3;
- (AppsClient)init;
- (BOOL)_appInstallationAllowed;
- (BOOL)_appRemovalAllowed;
- (BOOL)_isATCDaemon;
- (BOOL)_isRecoverableError:(id)a3;
- (BOOL)_placeholderExistsForApplication:(id)a3;
- (BOOL)_prepareDemotedAppForRestoreWithBundleId:(id)a3 iTunesMetadata:(id)a4 sinfData:(id)a5 iconData:(id)a6 demotionStatus:(unint64_t)a7;
- (BOOL)_prepareNonDemotedAppForRestoreWithBundleId:(id)a3 iTunesMetadata:(id)a4 sinfData:(id)a5 iconData:(id)a6;
- (BOOL)_processItunesRestoreInfo;
- (BOOL)createPlaceHolderPath:(id)a3 forBundleIdentifier:(id)a4 withAttributes:(id)a5;
- (BOOL)prepareAppForInstallUsingCoordination:(id)a3 existingApp:(BOOL)a4;
- (BOOL)prepareAppForRestoreUsingCoordination:(id)a3 iTunesMetadata:(id)a4 sinfData:(id)a5 iconData:(id)a6 demotionStatus:(unint64_t)a7;
- (BOOL)prepareForSyncWithHostAnchor:(id)a3 progressCallback:(id)a4 error:(id *)a5;
- (BOOL)reconcileRestoreOfType:(int)a3 withError:(id *)a4;
- (BOOL)reconcileSync:(unsigned int)a3 withNewAnchor:(id)a4 progressCallback:(id)a5 error:(id *)a6;
- (BOOL)updateTransferProgressForApp:(id)a3 existingApp:(BOOL)a4;
- (BOOL)writeIconData:(id)a3 atPath:(id)a4 returningFileSize:(unint64_t *)a5 forBundleIdentifier:(id)a6 withAttributes:(id)a7;
- (id)_createAppAssetPromiseForBundleIdentifier:(id)a3 atPath:(id)a4 andAddToCoordinatinator:(id)a5;
- (id)_createIconPromiseForBundleIdentifier:(id)a3 transferPath:(id)a4 diskSpaceNeeded:(unint64_t)a5 andAddToPlaceHolder:(id)a6 forAppInstall:(BOOL)a7;
- (id)_getSystemAppPlaceholders;
- (id)_initiatingOrUpdatingAppInstallCoordinatorForBundleIdentifier:(id)a3 existingApp:(BOOL)a4 createIfNotExisting:(BOOL)a5 error:(id *)a6;
- (id)_operationStateForIdentifier:(id)a3;
- (id)_placeHolderForBundleIdentifier:(id)a3 name:(id)a4 installType:(unint64_t)a5;
- (id)_placeHolderForBundleIdentifier:(id)a3 withiTunesMetadata:(id)a4 sinfData:(id)a5 iconData:(id)a6 demotionStatus:(unint64_t)a7;
- (id)_progressForAssetIdentifier:(id)a3;
- (id)_restoreStatePropertyForKey:(id)a3 identifier:(id)a4 version:(id)a5;
- (id)_userDataPromiseForBundleIdentifier:(id)a3;
- (id)accountsForAssets;
- (id)appleIDsForAssets;
- (id)currentSyncAnchor;
- (id)disabledAssetTypes;
- (id)installedAssetMetrics;
- (id)installedAssets;
- (id)outstandingAssetTransfers;
- (id)placeholderAppPathForBundleIdentifier:(id)a3;
- (id)supportedDataclasses;
- (int)_getAndResetNumAppInstallsAttempted;
- (void)_enumeratePlaceholdersWithBlock:(id)a3;
- (void)_setRestoreStatePropertyValue:(id)a3 forKey:(id)a4 identifier:(id)a5 version:(id)a6;
- (void)assetInstallFailed:(id)a3 withError:(id)a4;
- (void)assetInstallSucceeded:(id)a3;
- (void)assetSyncFinishedWithStatus:(BOOL)a3 outstandingItems:(id)a4;
- (void)assetTransfer:(id)a3 succeeded:(BOOL)a4 withError:(id)a5;
- (void)assetTransfer:(id)a3 updatedProgress:(double)a4;
- (void)assetTransferEndedWithSuccess:(BOOL)a3;
- (void)changeAssetID:(id)a3 toDo:(id)a4;
- (void)cleanRestoreStateForIdentifier:(id)a3;
- (void)clearSyncData;
- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5;
- (void)coordinatorDidCompleteSuccessfully:(id)a3;
- (void)coordinatorDidInstallPlaceholder:(id)a3;
- (void)coordinatorShouldPrioritize:(id)a3;
- (void)dataMigratorCancelledCoordinatorForRestoreAppBundle:(id)a3;
- (void)dataMigratorSetPlaceHolderPromiseForRestoreAppBundle:(id)a3;
- (void)dealloc;
- (void)icDidInstallPlaceHolderForAppBundle:(id)a3;
- (void)prepareForBackup;
- (void)promiseDidBeginFulfillmentWithIdentifier:(unint64_t)a3;
- (void)setupInstallCoordinatorObserver;
- (void)syncEndedWithSuccess:(BOOL)a3;
- (void)transferCompleteForApp:(id)a3 withError:(id)a4 isExistingApp:(BOOL)a5;
- (void)uninstallAppUsingCoordination:(id)a3;
@end

@implementation AppsClient

- (void)promiseDidBeginFulfillmentWithIdentifier:(unint64_t)a3
{
  uint64_t v4 = _ATLogCategorySyncBundle(self, a2);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    unint64_t v7 = a3;
    _os_log_impl( &dword_0,  v5,  OS_LOG_TYPE_DEFAULT,  "promiseDidBeginFulfillmentWithIdentifier %lu",  (uint8_t *)&v6,  0xCu);
  }
}

- (void)coordinatorDidInstallPlaceholder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _ATLogCategorySyncBundle(v4, v5);
  unint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleID]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 error]);
    int v11 = 138543618;
    v12 = v8;
    __int16 v13 = 2114;
    v14 = v9;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "coordinatorDidInstallPlaceholder for %{public}@ with error %{public}@",  (uint8_t *)&v11,  0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleID]);
  -[AppsClient icDidInstallPlaceHolderForAppBundle:](self, "icDidInstallPlaceHolderForAppBundle:", v10);
}

- (void)coordinatorDidCompleteSuccessfully:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _ATLogCategorySyncBundle(v4, v5);
  unint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleID]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 error]);
    int v15 = 138543618;
    v16 = v8;
    __int16 v17 = 2114;
    v18 = v9;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "coordinatorDidCompleteSuccessfully for %{public}@ with error %{public}@",  (uint8_t *)&v15,  0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 error]);
  int v11 = @"FAILED";
  if (!v10) {
    int v11 = @"INSTALLED";
  }
  v12 = v11;

  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleID]);
  -[AppsClient changeAssetID:toDo:](self, "changeAssetID:toDo:", v13, v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleID]);
  -[AppsClient cleanRestoreStateForIdentifier:](self, "cleanRestoreStateForIdentifier:", v14);
}

- (BOOL)prepareAppForInstallUsingCoordination:(id)a3 existingApp:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 prettyName]);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 variantOptions]);
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"Version"]);

  int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 infoPlist]);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v11));

  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v6 storePlist]);
  v126 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v13));

  v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"LSApplicationLaunchProhibited"]);
  unsigned int v15 = [v14 BOOLValue];

  uint64_t v16 = _ATLogCategorySyncBundle_Oversize();
  __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v137 = v8;
    __int16 v138 = 2114;
    *(void *)v139 = v7;
    *(_WORD *)&v139[8] = 2114;
    *(void *)&v139[10] = v12;
    __int16 v140 = 2114;
    uint64_t v141 = v10;
    _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEFAULT,  "processing app install for bundle '%{public}@', title %{public}@ assetplist %{public}@, version %{public}@ with in stall coordination",  buf,  0x2Au);
  }

  v125 = (void *)v10;

  if (v4) {
    v18 = @"Update app";
  }
  else {
    v18 = @"Install App";
  }
  +[AITransactionLog logStep:byParty:phase:success:forBundleID:description:]( &OBJC_CLASS___AITransactionLog,  "logStep:byParty:phase:success:forBundleID:description:",  1LL,  1LL,  1LL,  1LL,  v8,  v18);
  v124 = v12;
  if (![v7 length])
  {
    v19 = (os_log_s *)-[os_log_s length](v8, "length");
    if (!v19)
    {
      v22 = 0LL;
      v28 = 0LL;
      v21 = 0LL;
      goto LABEL_35;
    }
  }

  unsigned int v121 = v15;
  id v135 = 0LL;
  v21 = (void *)objc_claimAutoreleasedReturnValue( -[AppsClient _initiatingOrUpdatingAppInstallCoordinatorForBundleIdentifier:existingApp:createIfNotExisting:error:]( self,  "_initiatingOrUpdatingAppInstallCoordinatorForBundleIdentifier:existingApp:createIfNotExisting:error:",  v8,  v4,  1LL,  &v135));
  v19 = (os_log_s *)v135;
  v22 = v19;
  if (!v21)
  {
    v28 = 0LL;
LABEL_35:
    v53 = 0LL;
    LOBYTE(v51) = 0;
    BOOL v52 = 0LL;
    goto LABEL_96;
  }

  [v21 setObserver:self];
  id v23 = [v21 hasInstallOptions];
  v123 = v7;
  if ((v23 & 1) != 0)
  {
    uint64_t v25 = _ATLogCategorySyncBundle(v23, v24);
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v137 = v8;
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "coordinator for %{public}@ has install options", buf, 0xCu);
    }

    id v122 = 0LL;
    v27 = v22;
  }

  else
  {
    id v29 = [[MIStoreMetadata alloc] initWithDictionary:v126];
    v26 = (os_log_s *)objc_alloc_init(&OBJC_CLASS___MIInstallOptions);
    id v122 = v29;
    -[os_log_s setITunesMetadata:](v26, "setITunesMetadata:", v29);
    -[os_log_s setLsInstallType:](v26, "setLsInstallType:", 4LL);
    -[os_log_s setInstallTargetType:](v26, "setInstallTargetType:", 1LL);
    v134 = v22;
    unsigned __int8 v30 = [v21 setInstallOptions:v26 error:&v134];
    v27 = v134;

    uint64_t v33 = _ATLogCategorySyncBundle(v31, v32);
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    v35 = v34;
    if ((v30 & 1) == 0)
    {
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v137 = v27;
        __int16 v138 = 2114;
        *(void *)v139 = v8;
        _os_log_impl( &dword_0,  v35,  OS_LOG_TYPE_ERROR,  "Error %{public}@ setting install options on coordinator for '%{public}@'",  buf,  0x16u);
      }

      v28 = 0LL;
      LOBYTE(v51) = 0;
      BOOL v52 = 0LL;
      goto LABEL_52;
    }

    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v137 = v8;
      _os_log_impl(&dword_0, v35, OS_LOG_TYPE_DEFAULT, "set install options on coordinator for %{public}@", buf, 0xCu);
    }
  }

  id v36 = [v21 hasInitialODRAssetPromises];
  if ((v36 & 1) != 0)
  {
    uint64_t v38 = _ATLogCategorySyncBundle(v36, v37);
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v137 = v8;
      _os_log_impl( &dword_0,  v26,  OS_LOG_TYPE_DEFAULT,  "coordinator for %{public}@ has an ODR app asset promise",  buf,  0xCu);
    }

    v22 = v27;
    unint64_t v7 = v123;
  }

  else
  {
    v133 = v27;
    unsigned __int8 v43 = [v21 setInitialODRAssetPromises:&__NSArray0__struct error:&v133];
    v22 = v133;

    uint64_t v46 = _ATLogCategorySyncBundle(v44, v45);
    v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    v26 = v47;
    if ((v43 & 1) == 0)
    {
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v137 = v22;
        __int16 v138 = 2114;
        *(void *)v139 = v8;
        _os_log_impl( &dword_0,  v26,  OS_LOG_TYPE_ERROR,  "Error %{public}@ setting ODR asset promise for '%{public}@'",  buf,  0x16u);
      }

      v28 = 0LL;
      LOBYTE(v51) = 0;
      BOOL v52 = 0LL;
      goto LABEL_51;
    }

    unint64_t v7 = v123;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v137 = v8;
      _os_log_impl( &dword_0,  v26,  OS_LOG_TYPE_DEFAULT,  "set ODR asset promise to install coordinator for %{public}@",  buf,  0xCu);
    }
  }

  id v39 = [v21 hasAppAssetPromise];
  if ((_DWORD)v39)
  {
    uint64_t v41 = _ATLogCategorySyncBundle(v39, v40);
    v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v137 = v8;
      _os_log_impl(&dword_0, v42, OS_LOG_TYPE_DEFAULT, "coordinator for %{public}@ has an app asset promise", buf, 0xCu);
    }
  }

  else
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue( -[AppsClient _createAppAssetPromiseForBundleIdentifier:atPath:andAddToCoordinatinator:]( self,  "_createAppAssetPromiseForBundleIdentifier:atPath:andAddToCoordinatinator:",  v8,  0LL,  v21));

    if (!v28)
    {
      LOBYTE(v51) = 0;
      BOOL v52 = 0LL;
      v53 = v122;
      goto LABEL_96;
    }
  }

  id v48 = [v21 hasPlaceholderPromise];
  if ((v48 & 1) == 0)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue( -[AppsClient placeholderAppPathForBundleIdentifier:]( self,  "placeholderAppPathForBundleIdentifier:",  v8));
    v144[0] = NSFileOwnerAccountName;
    v144[1] = NSFileGroupOwnerAccountName;
    v145[0] = @"mobile";
    v145[1] = @"mobile";
    v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v145,  v144,  2LL));
    unsigned int v56 = -[AppsClient createPlaceHolderPath:forBundleIdentifier:withAttributes:]( self,  "createPlaceHolderPath:forBundleIdentifier:withAttributes:",  v54,  v8,  v55);

    v120 = v54;
    if (v56)
    {
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v54 stringByAppendingPathComponent:@"Icon.png"]);
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      v58 = (void *)objc_claimAutoreleasedReturnValue([v6 icon]);
      uint64_t v59 = objc_claimAutoreleasedReturnValue([v58 path]);

      v53 = v122;
      v118 = v57;
      v119 = (os_log_s *)v59;
      if (v59)
      {
        +[AITransactionLog logStep:byParty:phase:success:forBundleID:description:]( &OBJC_CLASS___AITransactionLog,  "logStep:byParty:phase:success:forBundleID:description:",  5LL,  1LL,  1LL,  1LL,  v8,  @"Copying icon");
        v132 = v22;
        unsigned int v60 = [v57 copyItemAtPath:v59 toPath:v26 error:&v132];
        v61 = v132;

        if (v60)
        {
          v131 = v61;
          v64 = (void *)objc_claimAutoreleasedReturnValue([v57 attributesOfItemAtPath:v26 error:&v131]);
          v22 = v131;

          id v67 = 0LL;
          if (v64 && !v22)
          {
            id v65 = [v64 fileSize];
            id v67 = v65;
          }

          uint64_t v68 = _ATLogCategorySyncBundle(v65, v66);
          v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            v137 = v8;
            __int16 v138 = 2114;
            *(void *)v139 = v26;
            *(_WORD *)&v139[8] = 2048;
            *(void *)&v139[10] = v67;
            _os_log_impl( &dword_0,  v69,  OS_LOG_TYPE_DEFAULT,  "icon for %{public}@ at %{public}@ has a size of %llu",  buf,  0x20u);
          }
        }

        else
        {
          id v67 = 0LL;
          v22 = v61;
        }

        uint64_t v70 = _ATLogCategorySyncBundle(v62, v63);
        v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544386;
          v137 = v119;
          __int16 v138 = 2114;
          *(void *)v139 = v26;
          *(_WORD *)&v139[8] = 2114;
          *(void *)&v139[10] = v22;
          __int16 v140 = 2114;
          uint64_t v141 = (uint64_t)v8;
          __int16 v142 = 2048;
          id v143 = v67;
          _os_log_impl( &dword_0,  v71,  OS_LOG_TYPE_DEFAULT,  "Copied icon from %{public}@ to %{public}@ with error %{public}@ for '%{public}@', sizeOnDisk:%llu",  buf,  0x34u);
        }

        +[AITransactionLog logStep:byParty:phase:success:forBundleID:description:]( &OBJC_CLASS___AITransactionLog,  "logStep:byParty:phase:success:forBundleID:description:",  5LL,  1LL,  2LL,  1LL,  v8,  @"Copying icon");
      }

      else
      {
        id v67 = 0LL;
      }
    }

    else
    {
      id v67 = 0LL;
      v26 = 0LL;
      v53 = v122;
    }

    if (v123) {
      v72 = (os_log_s *)v123;
    }
    else {
      v72 = v8;
    }
    uint64_t v73 = objc_claimAutoreleasedReturnValue( -[AppsClient _placeHolderForBundleIdentifier:name:installType:]( self,  "_placeHolderForBundleIdentifier:name:installType:",  v8,  v72,  4LL));
    v28 = (void *)v73;
    if (v73 && v67)
    {
      v74 = (void *)objc_claimAutoreleasedReturnValue( -[AppsClient _createIconPromiseForBundleIdentifier:transferPath:diskSpaceNeeded:andAddToPlaceHolder:forAppInstall:]( self,  "_createIconPromiseForBundleIdentifier:transferPath:diskSpaceNeeded:andAddToPlaceHolder:forAppInstall:",  v8,  v26,  v67,  v73,  1LL));

      if (!v74)
      {
LABEL_88:
        v127 = v22;
        id v51 = [v21 setPlaceholderPromise:v28 error:&v127];
        v27 = v127;

        uint64_t v100 = _ATLogCategorySyncBundle(v98, v99);
        v101 = (os_log_s *)objc_claimAutoreleasedReturnValue(v100);
        v102 = v101;
        if ((v51 & 1) != 0)
        {
          if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v137 = v8;
            v103 = "added placeholder promise to coordinator for %{public}@";
            v104 = v102;
            os_log_type_t v105 = OS_LOG_TYPE_DEFAULT;
            uint32_t v106 = 12;
LABEL_93:
            _os_log_impl(&dword_0, v104, v105, v103, buf, v106);
          }
        }

        else if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v137 = v27;
          __int16 v138 = 2114;
          *(void *)v139 = v8;
          v103 = "Error %{public}@ adding placeholder promise to coordinator for '%{public}@'";
          v104 = v102;
          os_log_type_t v105 = OS_LOG_TYPE_ERROR;
          uint32_t v106 = 22;
          goto LABEL_93;
        }

        BOOL v52 = (BOOL)v51;
        goto LABEL_95;
      }
    }

    else if (!v73)
    {
      goto LABEL_88;
    }

    v75 = (os_log_s *)[[IXPlaceholderAttributes alloc] initWithInfoPlistDictionary:v124];
    -[os_log_s setLaunchProhibited:](v75, "setLaunchProhibited:", v121);
    -[os_log_s setBundleVersion:](v75, "setBundleVersion:", v125);
    v130 = v22;
    unsigned __int8 v76 = [v28 setPlaceholderAttributes:v75 error:&v130];
    v77 = v130;

    uint64_t v80 = _ATLogCategorySyncBundle(v78, v79);
    v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
    v82 = v81;
    if ((v76 & 1) == 0)
    {
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v137 = v77;
        __int16 v138 = 2114;
        *(void *)v139 = v8;
        _os_log_impl( &dword_0,  v82,  OS_LOG_TYPE_ERROR,  "Error %{public}@ setting attributes on placeholder for '%{public}@'",  buf,  0x16u);
      }

      goto LABEL_87;
    }

    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v137 = v75;
      __int16 v138 = 2114;
      *(void *)v139 = v8;
      _os_log_impl( &dword_0,  v82,  OS_LOG_TYPE_DEFAULT,  "set %{public}@ attributes on placeholder for %{public}@",  buf,  0x16u);
    }

    v129 = v77;
    unsigned __int8 v83 = [v28 setMetadata:v53 error:&v129];
    v84 = v129;

    uint64_t v87 = _ATLogCategorySyncBundle(v85, v86);
    v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
    v75 = v88;
    if ((v83 & 1) == 0)
    {
      if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v137 = v84;
        __int16 v138 = 2114;
        *(void *)v139 = v8;
        _os_log_impl( &dword_0,  v75,  OS_LOG_TYPE_ERROR,  "Error %{public}@ setting store metadata on placeholder for '%{public}@'",  buf,  0x16u);
      }

      v77 = v84;
      goto LABEL_87;
    }

    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v137 = v8;
      _os_log_impl(&dword_0, v75, OS_LOG_TYPE_DEFAULT, "set store metadata on placeholder for %{public}@", buf, 0xCu);
    }

    v128 = v84;
    unsigned __int8 v89 = [v28 setConfigurationCompleteWithError:&v128];
    v77 = v128;

    uint64_t v92 = _ATLogCategorySyncBundle(v90, v91);
    v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v92);
    v75 = v93;
    if ((v89 & 1) != 0)
    {
      if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v137 = v8;
        v94 = "set placeholder configuration as complete for %{public}@";
        v95 = v75;
        os_log_type_t v96 = OS_LOG_TYPE_DEFAULT;
        uint32_t v97 = 12;
LABEL_86:
        _os_log_impl(&dword_0, v95, v96, v94, buf, v97);
      }
    }

    else if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v137 = v77;
      __int16 v138 = 2114;
      *(void *)v139 = v8;
      v94 = "Error %{public}@ setting placeholder configuration as complete for '%{public}@'";
      v95 = v75;
      os_log_type_t v96 = OS_LOG_TYPE_ERROR;
      uint32_t v97 = 22;
      goto LABEL_86;
    }

- (void)uninstallAppUsingCoordination:(id)a3
{
  id v3 = a3;
  +[AITransactionLog logStep:byParty:phase:success:forBundleID:description:]( &OBJC_CLASS___AITransactionLog,  "logStep:byParty:phase:success:forBundleID:description:",  7LL,  1LL,  1LL,  1LL,  v3,  @"Uninstall app");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_6218;
  v5[3] = &unk_18438;
  id v6 = v3;
  id v4 = v3;
  +[IXAppInstallCoordinator uninstallAppWithBundleID:requestUserConfirmation:completion:]( &OBJC_CLASS___IXAppInstallCoordinator,  "uninstallAppWithBundleID:requestUserConfirmation:completion:",  v4,  0LL,  v5);
}

- (BOOL)prepareAppForRestoreUsingCoordination:(id)a3 iTunesMetadata:(id)a4 sinfData:(id)a5 iconData:(id)a6 demotionStatus:(unint64_t)a7
{
  if (a7) {
    return -[AppsClient _prepareDemotedAppForRestoreWithBundleId:iTunesMetadata:sinfData:iconData:demotionStatus:]( self,  "_prepareDemotedAppForRestoreWithBundleId:iTunesMetadata:sinfData:iconData:demotionStatus:",  a3,  a4,  a5,  a6);
  }
  else {
    return -[AppsClient _prepareNonDemotedAppForRestoreWithBundleId:iTunesMetadata:sinfData:iconData:]( self,  "_prepareNonDemotedAppForRestoreWithBundleId:iTunesMetadata:sinfData:iconData:",  a3,  a4,  a5,  a6);
  }
}

- (BOOL)_prepareDemotedAppForRestoreWithBundleId:(id)a3 iTunesMetadata:(id)a4 sinfData:(id)a5 iconData:(id)a6 demotionStatus:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a5;
  id v66 = a6;
  char v71 = 0;
  id v14 = a4;
  uint64_t v16 = _ATLogCategorySyncBundle(v14, v15);
  __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v73 = v12;
    _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEFAULT,  "processing app restore for demoted bundle '%{public}@' with install coordination",  buf,  0xCu);
  }

  +[AITransactionLog logStep:byParty:phase:success:forBundleID:description:]( &OBJC_CLASS___AITransactionLog,  "logStep:byParty:phase:success:forBundleID:description:",  2LL,  1LL,  1LL,  1LL,  v12,  @"Restore demoted app");
  id v70 = 0LL;
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v14,  0LL,  0LL,  &v70));

  id v19 = v70;
  id v21 = v19;
  v64 = self;
  id v65 = v13;
  if (!v18)
  {
    uint64_t v31 = _ATLogCategorySyncBundle(v19, v20);
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v73 = v12;
      __int16 v74 = 2114;
      v75[0] = v21;
      _os_log_impl( &dword_0,  v29,  OS_LOG_TYPE_ERROR,  "failed to parse itunes metadata for '%{public}@'. err=%{public}@",  buf,  0x16u);
    }

    uint64_t v32 = 0LL;
    v22 = 0LL;
    unsigned __int8 v30 = 0LL;
    goto LABEL_13;
  }

  id v69 = v19;
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[IXRestoringDemotedAppInstallCoordinator coordinatorForAppWithBundleID:withClientID:createIfNotExisting:created:error:]( &OBJC_CLASS___IXRestoringDemotedAppInstallCoordinator,  "coordinatorForAppWithBundleID:withClientID:createIfNotExisting:created:error:",  v12,  3LL,  1LL,  &v71,  &v69));
  id v23 = v69;

  if (!v22)
  {
    uint64_t v35 = _ATLogCategorySyncBundle(v24, v25);
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v73 = v23;
      __int16 v74 = 2114;
      v75[0] = v12;
      _os_log_impl( &dword_0,  v29,  OS_LOG_TYPE_ERROR,  "Error %{public}@ creating restore coordinator for %{public}@",  buf,  0x16u);
    }

    uint64_t v32 = 0LL;
    v22 = 0LL;
    unsigned __int8 v30 = 0LL;
    char v33 = 0;
    BOOL v34 = 0LL;
    goto LABEL_25;
  }

  [v22 setObserver:self];
  id v26 = [v22 hasUserDataPromise];
  if ((v26 & 1) != 0)
  {
    uint64_t v28 = _ATLogCategorySyncBundle(v26, v27);
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v73 = v12;
      _os_log_impl( &dword_0,  v29,  OS_LOG_TYPE_DEFAULT,  "Coordinator for %{public}@ has a valid user data promise",  buf,  0xCu);
    }

    unsigned __int8 v30 = 0LL;
    id v21 = v23;
LABEL_9:

    id v23 = v21;
    goto LABEL_21;
  }

  unsigned __int8 v30 = (void *)objc_claimAutoreleasedReturnValue(-[AppsClient _userDataPromiseForBundleIdentifier:](self, "_userDataPromiseForBundleIdentifier:", v12));
  if (v30)
  {
    id v68 = v23;
    unsigned __int8 v36 = [v22 setUserDataPromise:v30 error:&v68];
    id v21 = v68;

    uint64_t v39 = _ATLogCategorySyncBundle(v37, v38);
    uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    id v29 = v40;
    if ((v36 & 1) != 0)
    {
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v73 = v12;
        _os_log_impl( &dword_0,  v29,  OS_LOG_TYPE_DEFAULT,  "Added out of band user data promise for for %{public}@",  buf,  0xCu);
      }

      goto LABEL_9;
    }

    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v73 = v21;
      __int16 v74 = 2114;
      v75[0] = v12;
      _os_log_impl( &dword_0,  v29,  OS_LOG_TYPE_ERROR,  "Error %{public}@ adding out of band data promise for '%{public}@'",  buf,  0x16u);
    }

    uint64_t v32 = 0LL;
LABEL_13:
    char v33 = 0;
    BOOL v34 = 0LL;
LABEL_26:

    id v23 = v21;
    goto LABEL_27;
  }

- (BOOL)_prepareNonDemotedAppForRestoreWithBundleId:(id)a3 iTunesMetadata:(id)a4 sinfData:(id)a5 iconData:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  char v82 = 0;
  id v13 = a4;
  uint64_t v15 = _ATLogCategorySyncBundle(v13, v14);
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v84 = v10;
    _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_DEFAULT,  "processing app restore for non demoted bundle '%{public}@' with install coordination",  buf,  0xCu);
  }

  +[AITransactionLog logStep:byParty:phase:success:forBundleID:description:]( &OBJC_CLASS___AITransactionLog,  "logStep:byParty:phase:success:forBundleID:description:",  2LL,  1LL,  1LL,  1LL,  v10,  @"Restore app");
  id v81 = 0LL;
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v13,  0LL,  0LL,  &v81));

  id v18 = v81;
  id v20 = v18;
  unsigned __int8 v76 = v12;
  if (!v17)
  {
    __int16 v74 = self;
    id v75 = v11;
    uint64_t v31 = _ATLogCategorySyncBundle(v18, v19);
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v84 = v10;
      __int16 v85 = 2114;
      v86[0] = v20;
      _os_log_impl( &dword_0,  v32,  OS_LOG_TYPE_ERROR,  "failed to parse itunes metadata for '%{public}@'. err=%{public}@",  buf,  0x16u);
    }

    id v29 = 0LL;
    id v21 = 0LL;
    unsigned __int8 v30 = 0LL;
    goto LABEL_12;
  }

  id v80 = v18;
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[IXRestoringAppInstallCoordinator coordinatorForAppWithBundleID:withClientID:createIfNotExisting:created:error:]( &OBJC_CLASS___IXRestoringAppInstallCoordinator,  "coordinatorForAppWithBundleID:withClientID:createIfNotExisting:created:error:",  v10,  3LL,  1LL,  &v82,  &v80));
  id v22 = v80;

  if (!v21)
  {
    __int16 v74 = self;
    id v75 = v11;
    uint64_t v35 = _ATLogCategorySyncBundle(v23, v24);
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v84 = v22;
      __int16 v85 = 2114;
      v86[0] = v10;
      _os_log_impl( &dword_0,  v32,  OS_LOG_TYPE_ERROR,  "Error %{public}@ creating restore coordinator for %{public}@",  buf,  0x16u);
    }

    id v29 = 0LL;
    id v21 = 0LL;
    unsigned __int8 v30 = 0LL;
    uint64_t v33 = 0LL;
    char v34 = 1;
    id v20 = v22;
    goto LABEL_16;
  }

  if ([v21 appAssetPromiseResponsibleClientWithError:0] == (char *)&dword_0 + 1)
  {
    uint64_t v26 = _ATLogCategorySyncBundle(1LL, v25);
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v84 = v10;
      __int16 v85 = 2048;
      v86[0] = 1LL;
      _os_log_impl( &dword_0,  v27,  OS_LOG_TYPE_DEFAULT,  "App asset DRI for %{public}@ is set to %lu - nothing more for atc to do",  buf,  0x16u);
    }

    BOOL v28 = 1;
    +[AITransactionLog logStep:byParty:phase:success:forBundleID:description:]( &OBJC_CLASS___AITransactionLog,  "logStep:byParty:phase:success:forBundleID:description:",  2LL,  1LL,  2LL,  1LL,  v10,  @"Restore app");
    id v29 = 0LL;
    unsigned __int8 v30 = 0LL;
    goto LABEL_32;
  }

  [v21 setObserver:self];
  id v49 = [v21 hasUserDataPromise];
  __int16 v74 = self;
  id v75 = v11;
  if ((v49 & 1) != 0)
  {
    uint64_t v51 = _ATLogCategorySyncBundle(v49, v50);
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v84 = v10;
      _os_log_impl( &dword_0,  v32,  OS_LOG_TYPE_DEFAULT,  "Coordinator for %{public}@ has a valid user data promise",  buf,  0xCu);
    }

    unsigned __int8 v30 = 0LL;
    id v20 = v22;
  }

  else
  {
    unsigned __int8 v30 = (void *)objc_claimAutoreleasedReturnValue( -[AppsClient _userDataPromiseForBundleIdentifier:]( self,  "_userDataPromiseForBundleIdentifier:",  v10));
    if (!v30) {
      goto LABEL_42;
    }
    id v79 = v22;
    unsigned __int8 v52 = [v21 setUserDataPromise:v30 error:&v79];
    id v20 = v79;

    uint64_t v55 = _ATLogCategorySyncBundle(v53, v54);
    unsigned int v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
    uint64_t v32 = v56;
    if ((v52 & 1) == 0)
    {
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v84 = v20;
        __int16 v85 = 2114;
        v86[0] = v10;
        _os_log_impl( &dword_0,  v32,  OS_LOG_TYPE_ERROR,  "Error %{public}@ adding out of band data promise for '%{public}@'",  buf,  0x16u);
      }

      id v29 = 0LL;
      goto LABEL_12;
    }

    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v84 = v10;
      _os_log_impl( &dword_0,  v32,  OS_LOG_TYPE_DEFAULT,  "Added out of band user data promise for for %{public}@",  buf,  0xCu);
    }
  }

  id v22 = v20;
LABEL_42:
  id v57 = [v21 hasPlaceholderPromise];
  char v34 = (char)v57;
  if ((v57 & 1) != 0)
  {
    uint64_t v59 = _ATLogCategorySyncBundle(v57, v58);
    id v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v84 = v10;
      _os_log_impl( &dword_0,  v60,  OS_LOG_TYPE_DEFAULT,  "Coordinator for %{public}@ has a valid placeholder promise",  buf,  0xCu);
    }

    id v29 = 0LL;
    id v20 = v22;
LABEL_46:
    uint64_t v61 = v20;

    id v77 = v20;
    unsigned __int8 v62 = [v21 setAppAssetPromiseResponsibleClient:1 error:&v77];
    id v20 = v77;

    uint64_t v65 = _ATLogCategorySyncBundle(v63, v64);
    id v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
    uint64_t v32 = v66;
    if ((v62 & 1) != 0)
    {
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v84 = v10;
        _os_log_impl( &dword_0,  v32,  OS_LOG_TYPE_DEFAULT,  "set IXClientAppStore to satisfy app asset promise for %{public}@",  buf,  0xCu);
      }

      uint64_t v33 = 1LL;
    }

    else
    {
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v84 = v20;
        __int16 v85 = 2114;
        v86[0] = v10;
        _os_log_impl( &dword_0,  v32,  OS_LOG_TYPE_ERROR,  "Error %{public}@ setting IXClientAppStore to satisfy app data promise for '%{public}@'",  buf,  0x16u);
      }

      uint64_t v33 = 0LL;
    }

    goto LABEL_16;
  }

  uint64_t v36 = objc_claimAutoreleasedReturnValue( -[AppsClient _placeHolderForBundleIdentifier:withiTunesMetadata:sinfData:iconData:demotionStatus:]( v74,  "_placeHolderForBundleIdentifier:withiTunesMetadata:sinfData:iconData:demotionStatus:",  v10,  v17,  v75,  v12,  0LL));
  id v29 = (void *)v36;
  if (!v36)
  {
    uint64_t v33 = 0LL;
    char v34 = 1;
    goto LABEL_17;
  }

  id v78 = v22;
  unsigned __int8 v67 = [v21 setPlaceholderPromise:v36 error:&v78];
  id v20 = v78;

  if ((v67 & 1) != 0)
  {
    id v70 = -[AppsClient dataMigratorSetPlaceHolderPromiseForRestoreAppBundle:]( v74,  "dataMigratorSetPlaceHolderPromiseForRestoreAppBundle:",  v10);
    uint64_t v72 = _ATLogCategorySyncBundle(v70, v71);
    id v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v84 = v10;
      _os_log_impl(&dword_0, v60, OS_LOG_TYPE_DEFAULT, "added placeholder promise for %{public}@", buf, 0xCu);
    }

    goto LABEL_46;
  }

  uint64_t v73 = _ATLogCategorySyncBundle(v68, v69);
  uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v84 = v20;
    __int16 v85 = 2114;
    v86[0] = v10;
    _os_log_impl( &dword_0,  v32,  OS_LOG_TYPE_ERROR,  "Error %{public}@ setting placeholder promise for '%{public}@'",  buf,  0x16u);
  }

- (BOOL)updateTransferProgressForApp:(id)a3 existingApp:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  id v32 = 0LL;
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[AppsClient _initiatingOrUpdatingAppInstallCoordinatorForBundleIdentifier:existingApp:createIfNotExisting:error:]( self,  "_initiatingOrUpdatingAppInstallCoordinatorForBundleIdentifier:existingApp:createIfNotExisting:error:",  v7,  v4,  0LL,  &v32));
  id v9 = v32;

  if (v8 && (id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 error]), v10, !v10))
  {
    id v31 = v9;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 appAssetPromiseWithError:&v31]);
    id v13 = v31;

    id v14 = [v12 isComplete];
    char v16 = (char)v14;
    if ((_DWORD)v14)
    {
      uint64_t v17 = _ATLogCategorySyncBundle(v14, v15);
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
        *(_DWORD *)buf = 138543362;
        double v34 = *(double *)&v19;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Asset promise is already satisfied for %{public}@", buf, 0xCu);
      }
    }

    else
    {
      if (!v12)
      {
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue( -[AppsClient _createAppAssetPromiseForBundleIdentifier:atPath:andAddToCoordinatinator:]( self,  "_createAppAssetPromiseForBundleIdentifier:atPath:andAddToCoordinatinator:",  v20,  v21,  v8));
      }

      uint64_t v22 = _ATLogCategorySyncBundle(v14, v15);
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        [v6 downloadProgress];
        double v25 = v24;
        [v6 installProgress];
        double v27 = v26;
        BOOL v28 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
        *(_DWORD *)buf = 134218498;
        double v34 = v25;
        __int16 v35 = 2048;
        double v36 = v27;
        __int16 v37 = 2114;
        uint64_t v38 = v28;
        _os_log_impl( &dword_0,  v23,  OS_LOG_TYPE_DEFAULT,  "Updating download progress: %f install progress:%f for %{public}@",  buf,  0x20u);
      }

      [v6 downloadProgress];
      [v12 setPercentComplete:v29];
    }

    char v11 = v16 ^ 1;

    id v9 = v13;
  }

  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)transferCompleteForApp:(id)a3 withError:(id)a4 isExistingApp:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  id v30 = 0LL;
  char v11 = (void *)objc_claimAutoreleasedReturnValue( -[AppsClient _initiatingOrUpdatingAppInstallCoordinatorForBundleIdentifier:existingApp:createIfNotExisting:error:]( self,  "_initiatingOrUpdatingAppInstallCoordinatorForBundleIdentifier:existingApp:createIfNotExisting:error:",  v10,  v5,  0LL,  &v30));
  id v12 = v30;

  if (v11)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 error]);

    if (!v13)
    {
      if (v9)
      {
        uint64_t v14 = IXCreateUserPresentableError(1LL, 0LL, v9);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        [v11 cancelForReason:v15 client:3 error:0];
        id v16 = v12;
      }

      else
      {
        id v29 = v12;
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v11 appAssetPromiseWithError:&v29]);
        id v16 = v29;

        id v17 = [v15 isComplete];
        if ((_DWORD)v17)
        {
          uint64_t v19 = _ATLogCategorySyncBundle(v17, v18);
          id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            id v21 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
            *(_DWORD *)buf = 138543362;
            id v32 = v21;
            _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_DEFAULT,  "Asset promise is already satisfied for %{public}@",  buf,  0xCu);
          }
        }

        else
        {
          if (v15)
          {
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v22));
            [v15 setTransferPath:v23];
          }

          else
          {
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[AppsClient _createAppAssetPromiseForBundleIdentifier:atPath:andAddToCoordinatinator:]( self,  "_createAppAssetPromiseForBundleIdentifier:atPath:andAddToCoordinatinator:",  v22,  v23,  v11));
          }

          uint64_t v26 = _ATLogCategorySyncBundle(v24, v25);
          double v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v28 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
            *(_DWORD *)buf = 138543362;
            id v32 = v28;
            _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "Satisfying asset promise for %{public}@", buf, 0xCu);
          }

          [v15 setPercentComplete:1.0];
          [v15 setComplete:1];
        }
      }

      id v12 = v16;
    }
  }
}

- (void)assetSyncFinishedWithStatus:(BOOL)a3 outstandingItems:(id)a4
{
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = a4;
  id v5 = [obj countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v21;
    *(void *)&__int128 v6 = 138543618LL;
    __int128 v17 = v6;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v9);
        id v19 = 0LL;
        char v11 = (void *)objc_claimAutoreleasedReturnValue( +[IXAppInstallCoordinator coordinatorForAppWithBundleID:withClientID:createIfNotExisting:created:error:]( &OBJC_CLASS___IXAppInstallCoordinator,  "coordinatorForAppWithBundleID:withClientID:createIfNotExisting:created:error:",  v10,  3LL,  0LL,  0LL,  &v19,  v17));
        id v12 = v19;
        if (v11 && !a3)
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"ATError",  30LL,  0LL));
          uint64_t v15 = _ATLogCategorySyncBundle(v13, v14);
          id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            uint64_t v25 = v13;
            __int16 v26 = 2114;
            uint64_t v27 = v10;
            _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_DEFAULT,  "Cancelling coordinator with error %{public}@ for %{public}@",  buf,  0x16u);
          }

          [v11 cancelForReason:v13 client:3 error:0];
        }

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [obj countByEnumeratingWithState:&v20 objects:v28 count:16];
    }

    while (v7);
  }
}

- (id)_createIconPromiseForBundleIdentifier:(id)a3 transferPath:(id)a4 diskSpaceNeeded:(unint64_t)a5 andAddToPlaceHolder:(id)a6 forAppInstall:(BOOL)a7
{
  BOOL v7 = a7;
  char v11 = (os_log_s *)a3;
  id v12 = a4;
  id v14 = a6;
  if (!v14)
  {
    uint64_t v26 = _ATLogCategorySyncBundle(0LL, v13);
    __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v32 = v11;
      _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_ERROR,  "Placeholder to add icon promise is nil for '%{public}@'",  buf,  0xCu);
    }

    id v18 = 0LL;
    goto LABEL_17;
  }

  id v15 = objc_alloc(&OBJC_CLASS___IXPromisedTransferToPath);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s stringByAppendingString:](v11, "stringByAppendingString:", @"-Icon"));
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v12));
  id v18 = [v15 initWithName:v16 client:3 transferPath:v17 diskSpaceNeeded:a5];

  if (v18)
  {
    [v18 setPercentComplete:1.0];
    [v18 setComplete:1];
    id v30 = 0LL;
    unsigned __int8 v19 = [v14 setIconPromise:v18 error:&v30];
    __int128 v20 = (os_log_s *)v30;
    uint64_t v22 = _ATLogCategorySyncBundle(v20, v21);
    __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    uint64_t v24 = v23;
    if ((v19 & 1) != 0)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v32 = v11;
        _os_log_impl( &dword_0,  v24,  OS_LOG_TYPE_DEFAULT,  "Added icon promise to placeholder for '%{public}@'",  buf,  0xCu);
      }

      uint64_t v25 = v18;
      goto LABEL_18;
    }

    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v32 = v20;
      __int16 v33 = 2114;
      double v34 = v11;
      _os_log_impl( &dword_0,  v24,  OS_LOG_TYPE_ERROR,  "Error %{public}@ adding icon promise to placeholder for '%{public}@'",  buf,  0x16u);
    }

    if (v7) {
      uint64_t v27 = 30LL;
    }
    else {
      uint64_t v27 = 29LL;
    }
    __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"ATError",  v27,  0LL));
    [v18 cancelForReason:v20 client:3 error:0];
LABEL_17:
    uint64_t v25 = 0LL;
LABEL_18:

    goto LABEL_19;
  }

  uint64_t v25 = 0LL;
LABEL_19:
  id v28 = v25;

  return v28;
}

- (id)_placeHolderForBundleIdentifier:(id)a3 name:(id)a4 installType:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  +[AITransactionLog logStep:byParty:phase:success:forBundleID:description:]( &OBJC_CLASS___AITransactionLog,  "logStep:byParty:phase:success:forBundleID:description:",  4LL,  1LL,  1LL,  1LL,  v7,  @"Create placeholder");
  id v9 = [[IXPlaceholder alloc] initAppPlaceholderWithBundleName:v8 bundleID:v7 installType:a5 client:3];

  id v10 = +[AITransactionLog logStep:byParty:phase:success:forBundleID:description:]( &OBJC_CLASS___AITransactionLog,  "logStep:byParty:phase:success:forBundleID:description:",  4LL,  1LL,  2LL,  v9 != 0LL,  v7,  @"Finished creating placeholder");
  uint64_t v12 = _ATLogCategorySyncBundle(v10, v11);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543874;
    id v16 = v9;
    __int16 v17 = 2114;
    id v18 = v7;
    __int16 v19 = 2048;
    unint64_t v20 = a5;
    _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEFAULT,  "Created placeholder %{public}@ for '%{public}@' of type %lu",  (uint8_t *)&v15,  0x20u);
  }

  return v9;
}

- (id)_initiatingOrUpdatingAppInstallCoordinatorForBundleIdentifier:(id)a3 existingApp:(BOOL)a4 createIfNotExisting:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v9 = a3;
  char v25 = 0;
  +[AITransactionLog logStep:byParty:phase:success:forBundleID:description:]( &OBJC_CLASS___AITransactionLog,  "logStep:byParty:phase:success:forBundleID:description:",  3LL,  1LL,  1LL,  1LL,  v9,  @"Create coordinator");
  if (v8)
  {
    id v10 = &OBJC_CLASS___IXUpdatingAppInstallCoordinator;
    uint64_t v24 = 0LL;
    uint64_t v11 = (id *)&v24;
    uint64_t v12 = &v24;
  }

  else
  {
    id v10 = &OBJC_CLASS___IXInitiatingAppInstallCoordinator;
    uint64_t v23 = 0LL;
    uint64_t v11 = (id *)&v23;
    uint64_t v12 = &v23;
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( [v10 coordinatorForAppWithBundleID:v9 withClientID:3 createIfNotExisting:v7 created:&v25 error:v12]);
  id v14 = *v11;
  if (v13)
  {
    int v15 = (char *)[v13 creatorIdentifier];
    uint64_t v17 = _ATLogCategorySyncBundle(v15, v16);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v15 == (_BYTE *)&dword_0 + 3)
    {
      if (v19)
      {
        unint64_t v20 = "initiating";
        *(_DWORD *)buf = 136316418;
        if (v8) {
          unint64_t v20 = "updating";
        }
        uint64_t v27 = v20;
        __int16 v28 = 2114;
        id v29 = v13;
        __int16 v30 = 1024;
        BOOL v31 = v7;
        __int16 v32 = 1024;
        BOOL v33 = v8;
        __int16 v34 = 2114;
        id v35 = v9;
        __int16 v36 = 2114;
        id v37 = v14;
        _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_DEFAULT,  "Created %s coordinator %{public}@ (createIfNotExisting:%d, existingApp:%d) for %{public}@ with error %{public}@",  buf,  0x36u);
      }
    }

    else
    {
      if (v19)
      {
        uint64_t v21 = "initiating";
        *(_DWORD *)buf = 136316674;
        if (v8) {
          uint64_t v21 = "updating";
        }
        uint64_t v27 = v21;
        __int16 v28 = 2114;
        id v29 = v13;
        __int16 v30 = 1024;
        BOOL v31 = v7;
        __int16 v32 = 1024;
        BOOL v33 = v8;
        __int16 v34 = 2048;
        id v35 = v15;
        __int16 v36 = 2114;
        id v37 = v9;
        __int16 v38 = 2114;
        id v39 = v14;
        _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_DEFAULT,  "IC returned %s coordinator %{public}@ (createIfNotExisting:%d, existingApp:%d, creatorIdentifier=%lu) for %{pu blic}@ with error %{public}@ - Will not perform install/update for this bundle",  buf,  0x40u);
      }

      id v18 = (os_log_s *)v13;
      uint64_t v13 = 0LL;
    }
  }

  if (a6) {
    *a6 = v14;
  }
  +[AITransactionLog logStep:byParty:phase:success:forBundleID:description:]( &OBJC_CLASS___AITransactionLog,  "logStep:byParty:phase:success:forBundleID:description:",  3LL,  1LL,  2LL,  v13 != 0LL,  v9,  @"Finished creating coordinator");

  return v13;
}

- (id)_createAppAssetPromiseForBundleIdentifier:(id)a3 atPath:(id)a4 andAddToCoordinatinator:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    id v10 = objc_alloc(&OBJC_CLASS___IXPromisedTransferToPath);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingString:@"-Asset"]);
    if (v8)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v8));
      id v13 = [v10 initWithName:v11 client:3 transferPath:v12 diskSpaceNeeded:0];
    }

    else
    {
      id v13 = [v10 initWithName:v11 client:3 diskSpaceNeeded:0];
    }

    if (v13)
    {
      id v30 = 0LL;
      unsigned __int8 v18 = [v9 setAppAssetPromise:v13 error:&v30];
      id v14 = v30;
      uint64_t v20 = _ATLogCategorySyncBundle(v14, v19);
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      uint64_t v22 = v21;
      if ((v18 & 1) != 0)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v32 = v7;
          _os_log_impl( &dword_0,  v22,  OS_LOG_TYPE_DEFAULT,  "Added app asset promise to coordinator for '%{public}@'",  buf,  0xCu);
        }

        int v15 = v13;
        goto LABEL_20;
      }

      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v32 = v14;
        __int16 v33 = 2114;
        id v34 = v8;
        __int16 v35 = 2114;
        id v36 = v7;
        _os_log_impl( &dword_0,  v22,  OS_LOG_TYPE_ERROR,  "Error %{public}@ adding app asset promise at %{public}@ to '%{public}@'",  buf,  0x20u);
      }

      uint64_t v26 = _ATLogCategorySyncBundle(v24, v25);
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v32 = v7;
        _os_log_impl(&dword_0, v27, OS_LOG_TYPE_ERROR, "Cancelling asset promise for '%{public}@'", buf, 0xCu);
      }

      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"ATError",  30LL,  0LL));
      [v13 cancelForReason:v22 client:3 error:0];
    }

    else
    {
      uint64_t v23 = _ATLogCategorySyncBundle(v16, v17);
      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v32 = v7;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_ERROR, "Error creating asset promise for '%{public}@'", buf, 0xCu);
      }

      id v14 = 0LL;
      id v13 = 0LL;
    }

    int v15 = 0LL;
LABEL_20:

    goto LABEL_21;
  }

  id v14 = 0LL;
  id v13 = 0LL;
  int v15 = 0LL;
LABEL_21:
  id v28 = v15;

  return v28;
}

- (id)_userDataPromiseForBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___IXPromisedOutOfBandTransfer);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingString:@"-UserData"]);

  id v6 = [v4 initWithName:v5 client:3 diskSpaceNeeded:0];
  if (v6)
  {
    [v6 setPercentComplete:1.0];
    [v6 setComplete:1];
  }

  return v6;
}

- (id)_placeHolderForBundleIdentifier:(id)a3 withiTunesMetadata:(id)a4 sinfData:(id)a5 iconData:(id)a6 demotionStatus:(unint64_t)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v71 = 0LL;
  id v15 = (id)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"title"]);
  if (!v15)
  {
    id v15 = (id)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"itemName"]);
    if (!v15) {
      id v15 = v11;
    }
  }

  id v65 = v14;
  id v66 = v15;
  uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"bundleVersion"]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[AppsClient placeholderAppPathForBundleIdentifier:]( self,  "placeholderAppPathForBundleIdentifier:",  v11));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"LSApplicationLaunchProhibited"]);
  if (!v17) {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"launchProhibited"]);
  }
  uint64_t v61 = v17;
  id v62 = v12;
  unsigned int v58 = [v17 BOOLValue];
  v78[0] = NSFileOwnerAccountName;
  v78[1] = NSFileGroupOwnerAccountName;
  v79[0] = @"mobile";
  v79[1] = @"mobile";
  unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v79,  v78,  2LL));
  unsigned int v19 = -[AppsClient createPlaceHolderPath:forBundleIdentifier:withAttributes:]( self,  "createPlaceHolderPath:forBundleIdentifier:withAttributes:",  v16,  v11,  v18);

  uint64_t v63 = v16;
  if (v19)
  {
    v76[0] = NSFileOwnerAccountName;
    v76[1] = NSFileGroupOwnerAccountName;
    v77[0] = @"mobile";
    v77[1] = @"mobile";
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v16 stringByAppendingPathComponent:@"Icon.png"]);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v77,  v76,  2LL));
    uint64_t v22 = v65;
    -[AppsClient writeIconData:atPath:returningFileSize:forBundleIdentifier:withAttributes:]( self,  "writeIconData:atPath:returningFileSize:forBundleIdentifier:withAttributes:",  v65,  v20,  &v71,  v11,  v21);

    uint64_t v23 = 7LL;
    if (a7 != 2) {
      uint64_t v23 = 2LL;
    }
    if (a7 == 1) {
      uint64_t v24 = 8LL;
    }
    else {
      uint64_t v24 = v23;
    }
    uint64_t v25 = v11;
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( -[AppsClient _placeHolderForBundleIdentifier:name:installType:]( self,  "_placeHolderForBundleIdentifier:name:installType:",  v11,  v66,  v24));
    if (v26)
    {
      uint64_t v27 = v13;
      if (v71)
      {
        id v28 = (void *)objc_claimAutoreleasedReturnValue( -[AppsClient _createIconPromiseForBundleIdentifier:transferPath:diskSpaceNeeded:andAddToPlaceHolder:forAppInstall:]( self,  "_createIconPromiseForBundleIdentifier:transferPath:diskSpaceNeeded:andAddToPlaceHolder:forAppInstall:",  v25,  v20,  v71,  v26,  0LL));

        if (!v28)
        {
          BOOL v31 = 0LL;
          id v36 = v12;
LABEL_38:
          id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"ATError",  29LL,  0LL));
          [v26 cancelForReason:v29 client:3 error:0];
          id v49 = 0LL;
LABEL_39:

          goto LABEL_40;
        }
      }

      id v29 = (os_log_s *)objc_alloc_init(&OBJC_CLASS___IXPlaceholderAttributes);
      -[os_log_s setLaunchProhibited:](v29, "setLaunchProhibited:", v58);
      -[os_log_s setBundleVersion:](v29, "setBundleVersion:", v64);
      id v70 = 0LL;
      unsigned __int8 v30 = [v26 setPlaceholderAttributes:v29 error:&v70];
      BOOL v31 = (os_log_s *)v70;
      uint64_t v33 = _ATLogCategorySyncBundle(v31, v32);
      id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      __int16 v35 = v34;
      id v36 = v62;
      if ((v30 & 1) != 0)
      {
        id v60 = v20;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v73 = v29;
          __int16 v74 = 2114;
          id v75 = v25;
          _os_log_impl( &dword_0,  v35,  OS_LOG_TYPE_DEFAULT,  "set %{public}@ placeholder attributes for %{public}@",  buf,  0x16u);
        }

        id v29 = (os_log_s *)[[MIStoreMetadata alloc] initWithDictionary:v62];
        uint64_t v69 = v31;
        unsigned __int8 v37 = [v26 setMetadata:v29 error:&v69];
        __int16 v38 = v69;

        uint64_t v41 = _ATLogCategorySyncBundle(v39, v40);
        uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
        uint64_t v43 = v42;
        if ((v37 & 1) == 0)
        {
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v73 = v38;
            __int16 v74 = 2114;
            id v75 = v25;
            _os_log_impl( &dword_0,  v43,  OS_LOG_TYPE_ERROR,  "Error %{public}@ setting store metadata for '%{public}@'",  buf,  0x16u);
          }

          BOOL v31 = v38;
          uint64_t v22 = v65;
LABEL_36:
          uint64_t v20 = v60;
          goto LABEL_37;
        }

        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v73 = (os_log_s *)v25;
          _os_log_impl( &dword_0,  v43,  OS_LOG_TYPE_DEFAULT,  "set store metadata on placeholder for %{public}@",  buf,  0xCu);
        }

        if (!v27)
        {
          BOOL v31 = v38;
LABEL_42:
          uint64_t v22 = v65;
          unsigned __int8 v52 = v31;
          unsigned __int8 v67 = v31;
          unsigned __int8 v53 = [v26 setConfigurationCompleteWithError:&v67];
          BOOL v31 = v67;

          uint64_t v56 = _ATLogCategorySyncBundle(v54, v55);
          id v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
          id v29 = v57;
          if ((v53 & 1) != 0)
          {
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v73 = (os_log_s *)v25;
              _os_log_impl( &dword_0,  v29,  OS_LOG_TYPE_DEFAULT,  "set placeholder configuration complete for %{public}@",  buf,  0xCu);
            }

            id v49 = v26;
            uint64_t v20 = v60;
            goto LABEL_39;
          }

          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v73 = v31;
            __int16 v74 = 2114;
            id v75 = v25;
            _os_log_impl( &dword_0,  v29,  OS_LOG_TYPE_ERROR,  "Error %{public}@ setting placeholder configuration as complete for '%{public}@'",  buf,  0x16u);
          }

          goto LABEL_36;
        }

        uint64_t v68 = v38;
        unsigned __int8 v44 = [v26 setSinfData:v27 error:&v68];
        BOOL v31 = v68;

        uint64_t v47 = _ATLogCategorySyncBundle(v45, v46);
        id v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
        id v29 = v48;
        if ((v44 & 1) != 0)
        {
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v73 = (os_log_s *)v25;
            _os_log_impl(&dword_0, v29, OS_LOG_TYPE_DEFAULT, "set SINF data on placeholder for %{public}@", buf, 0xCu);
          }

          goto LABEL_42;
        }

        uint64_t v20 = v60;
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v73 = v31;
          __int16 v74 = 2114;
          id v75 = v25;
          _os_log_impl( &dword_0,  v29,  OS_LOG_TYPE_ERROR,  "Error %{public}@ setting SINF data for '%{public}@'",  buf,  0x16u);
        }
      }

      else
      {
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v73 = v31;
          __int16 v74 = 2114;
          id v75 = v25;
          _os_log_impl( &dword_0,  v35,  OS_LOG_TYPE_ERROR,  "Error %{public}@ setting placeholder attributes for '%{public}@'",  buf,  0x16u);
        }
      }

      uint64_t v22 = v65;
LABEL_37:

      goto LABEL_38;
    }

    BOOL v31 = 0LL;
    id v49 = 0LL;
    id v36 = v62;
    uint64_t v27 = v13;
  }

  else
  {
    uint64_t v25 = v11;
    BOOL v31 = 0LL;
    uint64_t v20 = 0LL;
    uint64_t v26 = 0LL;
    id v49 = 0LL;
    id v36 = v62;
    uint64_t v27 = v13;
    uint64_t v22 = v65;
  }

- (AppsClient)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___AppsClient;
  v2 = -[AppsClient init](&v7, "init");
  if (v2)
  {
    v2->_installGroup = (OS_dispatch_group *)dispatch_group_create();
    v2->_restorePlaceHoldersWaitGroup = (OS_dispatch_group *)dispatch_group_create();
    v2->_outstandingAFCTransfers = -[NSMutableSet initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableSet),  "initWithCapacity:",  0LL);
    v2->_vppAppsToIgnore = -[NSMutableSet initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableSet),  "initWithCapacity:",  0LL);
    v2->_placeholdersForRestoringApps = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v3 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    v2->_installOperationQueue = v3;
    -[NSOperationQueue setMaxConcurrentOperationCount:](v3, "setMaxConcurrentOperationCount:", 10LL);
    v2->_backupManager = objc_alloc_init(&OBJC_CLASS___MBManager);
    v2->_accessQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.amp.AirTraffic.AppSync", 0LL);
    v2->_restoreQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.amp.AirTraffic.AppRestore", 0LL);
    objc_msgSend( +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"),  "addObserver:",  v2);
    os_log_t v4 = os_log_create("com.apple.appinstallation", "atc.appsync");
    +[AITransactionLog initializeWithLog:](&OBJC_CLASS___AITransactionLog, "initializeWithLog:", v4);

    v2->_finishedWaitingForPlaceHolderInstalls = 0;
    v2->_restoringPlaceholderCount = 0LL;
    v2->_updatingApps = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v2->_userCancelledApps = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    if (-[AppsClient _isATCDaemon](v2, "_isATCDaemon"))
    {
      v2->_finishedWaitingForPlaceHolderInstalls = 1;
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver( DarwinNotifyCenter,  v2,  (CFNotificationCallback)_handleATCStartupCompletedNotification,  @"com.apple.atc.ATStartupCompleteNotification",  0LL,  CFNotificationSuspensionBehaviorDrop);
    }
  }

  return v2;
}

- (void)dealloc
{
  id v3 = (NSMutableSet *)-[NSMutableSet count](self->_outstandingAFCTransfers, "count");
  if (v3)
  {
    id v5 = v3;
    id v6 = (os_log_s *)_ATLogCategorySyncBundle(v3, v4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = self;
      __int16 v17 = 2048;
      unsigned __int8 v18 = v5;
      _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_ERROR,  "%{public}@ getting dealloc'd with %lu outstanding AFC transfers!",  buf,  0x16u);
    }
  }

  id v7 = -[NSMutableSet count](self->_placeholdersForRestoringApps, "count");
  if (v7)
  {
    id v9 = (os_log_s *)_ATLogCategorySyncBundle(v7, v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      placeholdersForRestoringApps = self->_placeholdersForRestoringApps;
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = self;
      __int16 v17 = 2114;
      unsigned __int8 v18 = placeholdersForRestoringApps;
      _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_ERROR,  "%{public}@ getting dealloc'd with %{public}@pending placeholder install complete notifications",  buf,  0x16u);
    }
  }

  installGroup = self->_installGroup;
  if (installGroup) {
    dispatch_release((dispatch_object_t)installGroup);
  }
  restorePlaceHoldersWaitGroup = self->_restorePlaceHoldersWaitGroup;
  if (restorePlaceHoldersWaitGroup) {
    dispatch_release((dispatch_object_t)restorePlaceHoldersWaitGroup);
  }
  objc_msgSend( +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"),  "removeObserver:",  self);
  if (-[AppsClient _isATCDaemon](self, "_isATCDaemon"))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver( DarwinNotifyCenter,  self,  @"com.apple.atc.ATStartupCompleteNotification",  0LL);
    self->_appInstallObserver = 0LL;
  }

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___AppsClient;
  -[AppsClient dealloc](&v14, "dealloc");
}

- (void)coordinatorShouldPrioritize:(id)a3
{
  id v5 = [a3 bundleID];
  BOOL v6 = -[AppsClient _isATCDaemon](self, "_isATCDaemon");
  if (v6 && v5)
  {
    uint64_t v8 = (os_log_s *)_ATLogCategorySyncBundle(v6, v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = [a3 bundleID];
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Prioritize %{public}@", buf, 0xCu);
    }

    id v9 = +[ATDeviceService sharedInstance](&OBJC_CLASS___ATDeviceService, "sharedInstance");
    uint64_t v10 = objc_opt_respondsToSelector(v9, "prioritizeAsset:withCompletion:");
    if ((v10 & 1) != 0)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_9788;
      v13[3] = &unk_18460;
      v13[4] = v5;
      -[ATDeviceService prioritizeAsset:withCompletion:]( v9,  "prioritizeAsset:withCompletion:",  +[ATAsset downloadAssetWithIdentifier:dataclass:prettyName:]( &OBJC_CLASS___ATAsset,  "downloadAssetWithIdentifier:dataclass:prettyName:",  v5,  @"Application",  0LL),  v13);
    }

    else
    {
      id v12 = (os_log_s *)_ATLogCategorySyncBundle(v10, v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v15 = v5;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "Cannot prioritize %{public}@ as it's not supported", buf, 0xCu);
      }
    }
  }

- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5
{
  id v6 = [a3 bundleID];
  if (-[AppsClient _isATCDaemon](self, "_isATCDaemon") && v6)
  {
    uint64_t v7 = +[ATDeviceService sharedInstance](&OBJC_CLASS___ATDeviceService, "sharedInstance");
    uint64_t v17 = 0LL;
    unsigned __int8 v18 = &v17;
    uint64_t v19 = 0x2020000000LL;
    char v20 = 0;
    accessQueue = self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_9A78;
    block[3] = &unk_18488;
    block[5] = v6;
    block[6] = &v17;
    block[4] = self;
    dispatch_sync((dispatch_queue_t)accessQueue, block);
    restoreQueue = self->_restoreQueue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_9AB4;
    v15[3] = &unk_184B0;
    v15[4] = self;
    v15[5] = v6;
    dispatch_sync((dispatch_queue_t)restoreQueue, v15);
    if (*((_BYTE *)v18 + 24)
      || (uint64_t v10 = objc_opt_respondsToSelector(v7, "cancelAssetTransferForFailedAsset:"), (v10 & 1) == 0))
    {
      id v13 = (os_log_s *)_ATLogCategorySyncBundle(v10, v11);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v14 = *((unsigned __int8 *)v18 + 24);
        *(_DWORD *)buf = 138543618;
        id v22 = v6;
        __int16 v23 = 1024;
        int v24 = v14;
        _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_ERROR,  "Cannot cancel %{public}@ as it's already cancelled %d OR the call is not supported",  buf,  0x12u);
      }
    }

    else
    {
      id v12 = (os_log_s *)_ATLogCategorySyncBundle(v10, v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v22 = v6;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Cancelling asset sync for %{public}@", buf, 0xCu);
      }

      -[ATDeviceService cancelAssetTransferForFailedAsset:]( v7,  "cancelAssetTransferForFailedAsset:",  +[ATAsset downloadAssetWithIdentifier:dataclass:prettyName:]( &OBJC_CLASS___ATAsset,  "downloadAssetWithIdentifier:dataclass:prettyName:",  v6,  @"Application",  0LL));
    }

    _Block_object_dispose(&v17, 8);
  }

- (id)supportedDataclasses
{
  return +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", @"Application");
}

- (id)currentSyncAnchor
{
  return @"NO_APP_SYNC_ANCHOR";
}

- (BOOL)prepareForSyncWithHostAnchor:(id)a3 progressCallback:(id)a4 error:(id *)a5
{
  return 1;
}

- (id)installedAssets
{
  id v3 = (os_log_s *)_ATLogCategorySyncBundle(self, a2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "getting installed assets", buf, 2u);
  }

  id v42 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  id v44 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v4 = +[AppsClient _loadPlist:withError:]( &OBJC_CLASS___AppsClient,  "_loadPlist:withError:",  @"/var/mobile/Library/ApplicationSync/iTunesStuff/ApplicationsSync.plist",  0LL);
  id v5 = +[AppsClient _loadPlist:withError:]( &OBJC_CLASS___AppsClient,  "_loadPlist:withError:",  @"/var/mobile/Library/ApplicationSync/LastSyncAppState.plist",  0LL);
  id v6 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
  uint64_t v7 = MobileInstallationLookupUninstalled(0LL);
  uint64_t v41 = self;
  if (v7)
  {
    id v9 = (void *)v7;

    uint64_t v10 = (NSArray *)[v9 allKeys];
    self->_uninstalledApps = v10;
    [v6 addObjectsFromArray:v10];
    CFRelease(v9);
  }

  else
  {
    uint64_t v11 = (os_log_s *)_ATLogCategorySyncBundle(0LL, v8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "MobileInstallationLookupUninstalled returned NULL", buf, 2u);
    }
  }

  if (v5)
  {
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    id v12 = [v5 countByEnumeratingWithState:&v53 objects:v64 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v54;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v54 != v14) {
            objc_enumerationMutation(v5);
          }
          uint64_t v16 = *(void *)(*((void *)&v53 + 1) + 8LL * (void)i);
          if ((objc_msgSend( +[LSApplicationWorkspace defaultWorkspace]( LSApplicationWorkspace,  "defaultWorkspace"),  "applicationIsInstalled:",  v16) & 1) == 0) {
            [v6 addObject:v16];
          }
        }

        id v13 = [v5 countByEnumeratingWithState:&v53 objects:v64 count:16];
      }

      while (v13);
    }
  }

  id v40 = v5;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id obj = v6;
  id v17 = [v6 countByEnumeratingWithState:&v49 objects:v63 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v50;
    do
    {
      char v20 = 0LL;
      do
      {
        if (*(void *)v50 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)v20);
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        __int128 v47 = 0u;
        __int128 v48 = 0u;
        id v22 = [v4 countByEnumeratingWithState:&v45 objects:v62 count:16];
        if (v22)
        {
          id v24 = v22;
          uint64_t v25 = *(void *)v46;
LABEL_24:
          uint64_t v26 = 0LL;
          while (1)
          {
            if (*(void *)v46 != v25) {
              objc_enumerationMutation(v4);
            }
            uint64_t v27 = *(void **)(*((void *)&v45 + 1) + 8 * v26);
            if (objc_msgSend( objc_msgSend(v27, "objectForKey:", @"identifier"),  "isEqualToString:",  v21)) {
              break;
            }
            if (v24 == (id)++v26)
            {
              id v22 = [v4 countByEnumeratingWithState:&v45 objects:v62 count:16];
              id v24 = v22;
              if (v22) {
                goto LABEL_24;
              }
              goto LABEL_30;
            }
          }

          id v31 = [v27 objectForKey:@"operation"];
          id v22 = [v31 isEqualToString:@"FAILED"];
          if ((v22 & 1) != 0)
          {
            int v30 = 0;
            int v28 = 1;
            int v29 = 1;
            goto LABEL_35;
          }

          id v22 = [v31 isEqualToString:@"INSTALLED"];
          if ((_DWORD)v22)
          {
            int v29 = 0;
            int v28 = 1;
            int v30 = 1;
            goto LABEL_35;
          }

          uint64_t v33 = (os_log_s *)_ATLogCategorySyncBundle(v22, v23);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v58 = v21;
            _os_log_impl( &dword_0,  v33,  OS_LOG_TYPE_DEFAULT,  "%{public}@ not installed, but is in our todo list. Not marking deleted",  buf,  0xCu);
          }
        }

        else
        {
LABEL_30:
          int v28 = 0;
          int v29 = 0;
          int v30 = 0;
LABEL_35:
          uint64_t v32 = (os_log_s *)_ATLogCategorySyncBundle(v22, v23);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138544130;
            id v58 = v21;
            __int16 v59 = 1024;
            *(_DWORD *)id v60 = v28;
            *(_WORD *)&v60[4] = 1024;
            *(_DWORD *)&v60[6] = v30;
            LOWORD(v61) = 1024;
            *(_DWORD *)((char *)&v61 + 2) = v29;
            _os_log_impl( &dword_0,  v32,  OS_LOG_TYPE_DEFAULT,  "%{public}@ not installed, and no todo (found=%d pi=%d failed=%d) Marking as deleted",  buf,  0x1Eu);
          }

          objc_msgSend( v44,  "addObject:",  +[NSDictionary dictionaryWithObjectsAndKeys:]( NSDictionary,  "dictionaryWithObjectsAndKeys:",  v21,  kCFBundleIdentifierKey,  0));
        }

        char v20 = (char *)v20 + 1;
      }

      while (v20 != v18);
      id v34 = [obj countByEnumeratingWithState:&v49 objects:v63 count:16];
      id v18 = v34;
    }

    while (v34);
  }

  id v35 = [v42 setObject:v44 forKey:@"_Deleted"];
  unsigned __int8 v37 = (os_log_s *)_ATLogCategorySyncBundle_Oversize(v35, v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    uninstalledApps = v41->_uninstalledApps;
    *(_DWORD *)buf = 138543874;
    id v58 = v4;
    __int16 v59 = 2114;
    *(void *)id v60 = uninstalledApps;
    *(_WORD *)&v60[8] = 2114;
    id v61 = v40;
    _os_log_impl( &dword_0,  v37,  OS_LOG_TYPE_DEFAULT,  "finished getting installed assets toDoList:%{public}@, uninstalled apps %{public}@, last synced apps%{public}@",  buf,  0x20u);
  }

  return v42;
}

- (BOOL)reconcileRestoreOfType:(int)a3 withError:(id *)a4
{
  uint64_t v7 = (os_log_s *)_ATLogCategorySyncBundle(self, a2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v14 = a3;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "reconcileRestoreOfType %d", buf, 8u);
  }

  +[AppsClient _notifySpringBoard:](&OBJC_CLASS___AppsClient, "_notifySpringBoard:", 1LL);
  id v12 = 0LL;
  -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  @"/var/mobile/Library/ApplicationSync",  1LL,  0LL,  a4);
  if ((a3 & 0xFFFFFFFE) == 2)
  {
    id v8 = -[MBManager airTrafficShouldCreateAppPlaceholdersWithError:]( self->_backupManager,  "airTrafficShouldCreateAppPlaceholdersWithError:",  &v12);
    if ((_DWORD)v8)
    {
      -[AppsClient _processItunesRestoreInfo](self, "_processItunesRestoreInfo");
    }

    else
    {
      uint64_t v10 = (os_log_s *)_ATLogCategorySyncBundle(v8, v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        int v14 = a3;
        __int16 v15 = 2114;
        uint64_t v16 = v12;
        _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "Will not reconcile restore of type %d - error %{public}@",  buf,  0x12u);
      }
    }
  }

  if (a4) {
    *a4 = v12;
  }
  return 1;
}

- (BOOL)reconcileSync:(unsigned int)a3 withNewAnchor:(id)a4 progressCallback:(id)a5 error:(id *)a6
{
  uint64_t v9 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager", *(void *)&a3, a4, a5);
  uint64_t v11 = (os_log_s *)_ATLogCategorySyncBundle(v9, v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v66 = a4;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "starting to reconcile sync with new anchor %{public}@", buf, 0xCu);
  }

  -[NSFileManager removeItemAtPath:error:]( v9,  "removeItemAtPath:error:",  @"/var/mobile/Library/ApplicationSync/iTunesStuff",  0LL);
  BOOL v12 = -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( v9,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  @"/var/mobile/Library/ApplicationSync",  1LL,  0LL,  a6);
  if (!v12)
  {
    __int128 v50 = (os_log_s *)_ATLogCategorySyncBundle(v12, v13);
    uint64_t v45 = os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT);
    BOOL v49 = 0;
    if (!(_DWORD)v45) {
      goto LABEL_47;
    }
    *(_WORD *)buf = 0;
    __int128 v51 = "can't create work area";
    goto LABEL_52;
  }

  BOOL v14 = -[NSFileManager fileExistsAtPath:]( v9,  "fileExistsAtPath:",  @"/var/mobile/Media/PublicStaging/ApplicationSync");
  if (!v14)
  {
    __int128 v52 = (os_log_s *)_ATLogCategorySyncBundle(v14, v15);
    uint64_t v45 = os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v45)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v52, OS_LOG_TYPE_DEFAULT, "Nothing to do", buf, 2u);
    }

- (void)syncEndedWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (os_log_s *)_ATLogCategorySyncBundle(self, a2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v3) {
      int v6 = 121;
    }
    else {
      int v6 = 110;
    }
    int v17 = 67109120;
    LODWORD(v18) = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "sync ended with success: %c", (uint8_t *)&v17, 8u);
  }

  if (v3)
  {
    uint64_t v7 = utimes("/var/mobile/Library/ApplicationSync", 0LL);
    if ((_DWORD)v7)
    {
      uint64_t v9 = (os_log_s *)_ATLogCategorySyncBundle(v7, v8);
      uint64_t v7 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
      if ((_DWORD)v7)
      {
        uint64_t v10 = __error();
        uint64_t v11 = strerror(*v10);
        int v17 = 136315394;
        unsigned __int8 v18 = "/var/mobile/Library/ApplicationSync";
        __int16 v19 = 2080;
        id v20 = v11;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "Failed to update utimes of %s: %s", (uint8_t *)&v17, 0x16u);
      }
    }

    if (self->_uninstalledApps)
    {
      BOOL v12 = (os_log_s *)_ATLogCategorySyncBundle(v7, v8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uninstalledApps = self->_uninstalledApps;
        int v17 = 138543362;
        unsigned __int8 v18 = (const char *)uninstalledApps;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "clearing uninstalled apps: %{public}@", (uint8_t *)&v17, 0xCu);
      }

      uint64_t v14 = MobileInstallationClearUninstalled(self->_uninstalledApps, 0LL);
      if ((_DWORD)v14)
      {
        BOOL v16 = (os_log_s *)_ATLogCategorySyncBundle(v14, v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v17) = 0;
          _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_ERROR,  "Failed to clear uninstalled apps from MobileInstallation.",  (uint8_t *)&v17,  2u);
        }
      }

      else
      {

        self->_uninstalledApps = 0LL;
      }
    }

    -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  @"/var/mobile/Library/ApplicationSync/LastSyncAppState.plist",  0LL);
  }

- (void)assetTransferEndedWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (os_log_s *)_ATLogCategorySyncBundle(self, a2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v3) {
      int v6 = 121;
    }
    else {
      int v6 = 110;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v17) = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "asset transfer ended withsuccess: %c", buf, 8u);
  }

  dispatch_group_wait((dispatch_group_t)self->_installGroup, 0xFFFFFFFFFFFFFFFFLL);
  +[AppsClient _notifySpringBoard:](&OBJC_CLASS___AppsClient, "_notifySpringBoard:", 0LL);
  if (-[AppsClient _getAndResetNumAppInstallsAttempted](self, "_getAndResetNumAppInstallsAttempted") >= 1)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___SSSoftwareLibrary);
    uint64_t v8 = dispatch_semaphore_create(0LL);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_ACD0;
    v15[3] = &unk_18460;
    v15[4] = v8;
    [v7 refreshReceiptsWithCompletionBlock:v15];
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v8);
  }

  if (-[NSMutableSet count](self->_outstandingAFCTransfers, "count"))
  {
    id v9 = -[AppsClient assetSyncFinishedWithStatus:outstandingItems:]( self,  "assetSyncFinishedWithStatus:outstandingItems:",  v3,  self->_outstandingAFCTransfers);
    if (v3)
    {
      uint64_t v11 = (os_log_s *)_ATLogCategorySyncBundle(v9, v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = -[NSMutableSet count](self->_outstandingAFCTransfers, "count");
        *(_DWORD *)buf = 134217984;
        id v17 = v12;
        _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_ERROR,  "Called with success == YES but with %lu outstanding AFC transfers!",  buf,  0xCu);
      }
    }

    -[NSMutableSet removeAllObjects](self->_outstandingAFCTransfers, "removeAllObjects");
    accessQueue = self->_accessQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_ADAC;
    v14[3] = &unk_184D8;
    v14[4] = self;
    dispatch_sync((dispatch_queue_t)accessQueue, v14);
  }

- (void)assetTransfer:(id)a3 succeeded:(BOOL)a4 withError:(id)a5
{
  BOOL v6 = a4;
  uint64_t v55 = 0LL;
  __int128 v56 = &v55;
  uint64_t v57 = 0x2020000000LL;
  char v58 = 0;
  uint64_t v51 = 0LL;
  __int128 v52 = &v51;
  uint64_t v53 = 0x2020000000LL;
  char v54 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_B468;
  block[3] = &unk_18500;
  block[4] = self;
  block[5] = a3;
  block[6] = &v55;
  void block[7] = &v51;
  dispatch_sync((dispatch_queue_t)accessQueue, block);
  id v10 = -[NSMutableSet removeObject:](self->_outstandingAFCTransfers, "removeObject:", [a3 identifier]);
  if (a5)
  {
    id v12 = (os_log_s *)_ATLogCategorySyncBundle(v10, v11);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    int v13 = *((unsigned __int8 *)v56 + 24);
    id v14 = objc_msgSend(a5, "msv_description");
    *(_DWORD *)buf = 138544130;
    if (v6) {
      int v15 = 121;
    }
    else {
      int v15 = 110;
    }
    id v60 = a3;
    __int16 v61 = 1024;
    *(_DWORD *)__int128 v62 = v15;
    *(_WORD *)&v62[4] = 1024;
    *(_DWORD *)&v62[6] = v13;
    __int16 v63 = 2114;
    id v64 = v14;
    BOOL v16 = "transfer for asset %{public}@ ended with success %c existingApp:%d error=%{public}@";
    id v17 = v12;
    os_log_type_t v18 = OS_LOG_TYPE_ERROR;
    uint32_t v19 = 34;
  }

  else
  {
    id v20 = (os_log_s *)_ATLogCategorySyncBundle(v10, v11);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    if (v6) {
      int v21 = 121;
    }
    else {
      int v21 = 110;
    }
    int v22 = *((unsigned __int8 *)v56 + 24);
    *(_DWORD *)buf = 138543874;
    id v60 = a3;
    __int16 v61 = 1024;
    *(_DWORD *)__int128 v62 = v21;
    *(_WORD *)&v62[4] = 1024;
    *(_DWORD *)&v62[6] = v22;
    BOOL v16 = "transfer for asset %{public}@ ended with success %c existingApp:%d";
    id v17 = v20;
    os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
    uint32_t v19 = 24;
  }

  _os_log_impl(&dword_0, v17, v18, v16, buf, v19);
LABEL_13:
  id v23 = -[AppsClient _progressForAssetIdentifier:](self, "_progressForAssetIdentifier:", [a3 identifier]);
  if (v6)
  {
    id v25 = (os_log_s *)_ATLogCategorySyncBundle(v23, v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = [a3 identifier];
      *(_DWORD *)buf = 138543362;
      id v60 = v26;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "asset transfer succeeded for %{public}@", buf, 0xCu);
    }

    if ([a3 path])
    {
      uint64_t v27 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%s/%@",  "/var/mobile/Media/PublicStaging",  [a3 path]);
    }

    else
    {
      uint64_t v27 = -[AppsClient _restoreStatePropertyForKey:identifier:version:]( self,  "_restoreStatePropertyForKey:identifier:version:",  @"path",  [a3 identifier],  objc_msgSend(objc_msgSend(a3, "variantOptions"), "objectForKeyedSubscript:", @"Version"));
    }

    [a3 setPath:v27];
LABEL_35:
    BOOL v39 = sub_A874((BOOL)[a3 path]);
    if (v39)
    {
      id v41 = [a3 isDownload];
      if ((_DWORD)v41)
      {
        uint64_t v43 = (os_log_s *)_ATLogCategorySyncBundle(v41, v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          id v44 = [a3 path];
          *(_DWORD *)buf = 138543362;
          id v60 = v44;
          _os_log_impl(&dword_0, v43, OS_LOG_TYPE_DEFAULT, "Received file at %{public}@", buf, 0xCu);
        }

        -[AppsClient changeAssetID:toDo:]( self,  "changeAssetID:toDo:",  [a3 identifier],  @"DOWNLOADED");
        id v45 = [a3 isRestore];
        if ((v45 & 1) == 0)
        {
          __int128 v47 = (os_log_s *)_ATLogCategorySyncBundle(v45, v46);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v60 = a3;
            _os_log_impl(&dword_0, v47, OS_LOG_TYPE_DEFAULT, "Installing synced asset %{public}@", buf, 0xCu);
          }

          -[AppsClient transferCompleteForApp:withError:isExistingApp:]( self,  "transferCompleteForApp:withError:isExistingApp:",  a3,  0LL,  *((unsigned __int8 *)v56 + 24));
        }
      }

      else
      {
        -[AppsClient changeAssetID:toDo:](self, "changeAssetID:toDo:", [a3 identifier], @"SENT");
      }
    }

    else
    {
      uint64_t v48 = (os_log_s *)_ATLogCategorySyncBundle(v39, v40);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        id v49 = [a3 path];
        *(_DWORD *)buf = 138543362;
        id v60 = v49;
        _os_log_impl(&dword_0, v48, OS_LOG_TYPE_DEFAULT, "Ignoring invalid path: %{public}@", buf, 0xCu);
      }
    }

    goto LABEL_46;
  }

  int v28 = v23;
  BOOL v29 = -[AppsClient _isRecoverableError:](self, "_isRecoverableError:", a5);
  if (v29)
  {
    id v31 = (os_log_s *)_ATLogCategorySyncBundle(v29, v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      id v32 = [a3 identifier];
      *(_DWORD *)buf = 138543618;
      id v60 = v32;
      __int16 v61 = 2114;
      *(void *)__int128 v62 = a5;
      _os_log_impl( &dword_0,  v31,  OS_LOG_TYPE_DEFAULT,  "Failed to transfer asset %{public}@ with recoverable error=%{public}@",  buf,  0x16u);
    }

    [v28 setInstallState:4];
  }

  else
  {
    uint64_t v33 = (os_log_s *)_ATLogCategorySyncBundle(v29, v30);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      id v34 = [a3 identifier];
      *(_DWORD *)buf = 138543618;
      id v60 = v34;
      __int16 v61 = 2114;
      *(void *)__int128 v62 = a5;
      _os_log_impl( &dword_0,  v33,  OS_LOG_TYPE_ERROR,  "Failed to transfer asset %{public}@ with unrecoverable error=%{public}@",  buf,  0x16u);
    }

    if (objc_msgSend( +[LSApplicationWorkspace defaultWorkspace]( LSApplicationWorkspace,  "defaultWorkspace"),  "applicationIsInstalled:",  objc_msgSend(a3, "identifier"))
      && ([a3 isRestore] & 1) == 0)
    {
      id v35 = [v28 installState];
      id v37 = (os_log_s *)_ATLogCategorySyncBundle(v35, v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        id v38 = [a3 identifier];
        *(_DWORD *)buf = 138543362;
        id v60 = v38;
        _os_log_impl(&dword_0, v37, OS_LOG_TYPE_DEFAULT, "Uninstalling placeholder %{public}@", buf, 0xCu);
      }

      if (!*((_BYTE *)v52 + 24)) {
        -[AppsClient transferCompleteForApp:withError:isExistingApp:]( self,  "transferCompleteForApp:withError:isExistingApp:",  a3,  a5,  *((unsigned __int8 *)v56 + 24));
      }
    }
  }

- (void)assetInstallSucceeded:(id)a3
{
  id v5 = (os_log_s *)_ATLogCategorySyncBundle(self, a2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = [a3 identifier];
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ install succeeded", (uint8_t *)&v6, 0xCu);
  }

  -[AppsClient changeAssetID:toDo:](self, "changeAssetID:toDo:", [a3 identifier], @"INSTALLED");
  -[AppsClient cleanRestoreStateForIdentifier:](self, "cleanRestoreStateForIdentifier:", [a3 identifier]);
}

- (void)assetInstallFailed:(id)a3 withError:(id)a4
{
  id v7 = (id)-[AppsClient _isRecoverableError:](self, "_isRecoverableError:", a4);
  if (v7 & 1) != 0 || (id v7 = [a3 isRestore], (v7))
  {
    id v9 = (os_log_s *)_ATLogCategorySyncBundle(v7, v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543618;
      id v16 = [a3 identifier];
      __int16 v17 = 2114;
      id v18 = a4;
      _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ install failed but was recoverable: %{public}@",  (uint8_t *)&v15,  0x16u);
    }

    +[AITransactionLog logScenario:step:success:forBundleID:description:]( AITransactionLog,  "logScenario:step:success:forBundleID:description:",  @"iCloud restore",  0,  0,  [a3 identifier],  @"install failed recoverably");
  }

  else
  {
    id v10 = (os_log_s *)_ATLogCategorySyncBundle(v7, v8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138543618;
      id v16 = [a3 identifier];
      __int16 v17 = 2114;
      id v18 = a4;
      _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_ERROR,  "%{public}@ install failed unrecoverably: %{public}@",  (uint8_t *)&v15,  0x16u);
    }

    -[AppsClient changeAssetID:toDo:](self, "changeAssetID:toDo:", [a3 identifier], @"FAILED");
    id v11 = [a3 isRestore];
    if ((_DWORD)v11)
    {
      int v13 = (os_log_s *)_ATLogCategorySyncBundle(v11, v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [a3 identifier];
        int v15 = 138543362;
        id v16 = v14;
        _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEFAULT,  "not uninstalling restore asset %{public}@ as install coordination is enabled",  (uint8_t *)&v15,  0xCu);
      }
    }

    else
    {
      -[AppsClient uninstallAppUsingCoordination:]( self,  "uninstallAppUsingCoordination:",  [a3 identifier]);
    }
  }

  -[AppsClient cleanRestoreStateForIdentifier:](self, "cleanRestoreStateForIdentifier:", [a3 identifier]);
}

- (id)outstandingAssetTransfers
{
  v118 = +[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 16LL);
  unsigned int v126 = -[AppsClient _appInstallationAllowed](self, "_appInstallationAllowed");
  BOOL v3 = +[AppsClient _loadPlist:withError:]( &OBJC_CLASS___AppsClient,  "_loadPlist:withError:",  @"/var/mobile/Library/ApplicationSync/iTunesStuff/ApplicationsSync.plist",  0LL);
  id v121 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
  id v5 = (os_log_s *)_ATLogCategorySyncBundle_Oversize(v121, v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v146 = v3;
    _os_log_impl( &dword_0,  v5,  OS_LOG_TYPE_DEFAULT,  "outstandingAssetTransfers starting with todoList %{public}@",  buf,  0xCu);
  }

  v128 = v3;
  int v6 = +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  -[NSMutableDictionary count](v3, "count"));
  id v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v120 = -[AppsClient _getSystemAppPlaceholders](self, "_getSystemAppPlaceholders");
  v144[0] = _NSConcreteStackBlock;
  v144[1] = 3221225472LL;
  void v144[2] = sub_C7E8;
  v144[3] = &unk_18528;
  v144[4] = v7;
  id v122 = self;
  -[AppsClient _enumeratePlaceholdersWithBlock:](self, "_enumeratePlaceholdersWithBlock:", v144);
  id v8 = -[NSMutableDictionary addEntriesFromDictionary:](v6, "addEntriesFromDictionary:", v7);
  id v10 = (os_log_s *)_ATLogCategorySyncBundle_Oversize(v8, v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v146 = v7;
    __int16 v147 = 2114;
    *(void *)v148 = v6;
    _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "outstandingAssetTransfers preExistingPlaceHolders %{public}@, idsWeWant %{public}@",  buf,  0x16u);
  }

  __int128 v142 = 0u;
  __int128 v143 = 0u;
  __int128 v140 = 0u;
  __int128 v141 = 0u;
  id v11 = v128;
  id v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v128,  "countByEnumeratingWithState:objects:count:",  &v140,  v163,  16LL);
  int v13 = v121;
  if (v12)
  {
    id v14 = v12;
    uint64_t v15 = *(void *)v141;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v141 != v15) {
          objc_enumerationMutation(v11);
        }
        __int16 v17 = *(void **)(*((void *)&v140 + 1) + 8LL * (void)i);
        if (objc_msgSend( objc_msgSend(v17, "objectForKey:", @"operation"),  "isEqualToString:",  @"install"))
        {
          id v18 = (NSMutableDictionary *)[v17 objectForKey:@"identifier"];
          BOOL v19 = sub_A874((BOOL)v18);
          if (!v19)
          {
            id v26 = (os_log_s *)_ATLogCategorySyncBundle(v19, v20);
            if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
              continue;
            }
            *(_DWORD *)buf = 138543362;
            v146 = v18;
            uint64_t v24 = v26;
            id v25 = "Ignoring invalid path: %{public}@";
            goto LABEL_17;
          }

          if (-[NSMutableDictionary objectForKey:](v6, "objectForKey:", v18))
          {
            id v21 = [v13 addObject:v18];
            id v23 = (os_log_s *)_ATLogCategorySyncBundle(v21, v22);
            if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
              continue;
            }
            *(_DWORD *)buf = 138543362;
            v146 = v18;
            uint64_t v24 = v23;
            id v25 = "%{public}@ already has a placeholder - skipping";
LABEL_17:
            _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);
            continue;
          }

          uint64_t v27 = v6;
          int v28 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s/%@",  "/var/mobile/Library/ApplicationSync/iTunesStuff",  v18);
          id v29 = [v17 objectForKey:@"version"];
          id v30 = [v17 objectForKey:@"name"];
          id v31 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
          [v31 setObject:v28 forKey:@"Path"];
          [v31 setObject:v18 forKey:kCFBundleIdentifierKey];
          [v31 setObject:v28 forKey:@"Container"];
          if (v29) {
            [v31 setObject:v29 forKey:kCFBundleVersionKey];
          }
          int v13 = v121;
          if (v30) {
            [v31 setObject:v30 forKey:@"NameFromItunes"];
          }
          int v6 = v27;
          -[NSMutableDictionary setObject:forKey:](v27, "setObject:forKey:", v31, v18);
          [v121 addObject:v18];
          id v11 = v128;
        }
      }

      id v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v140,  v163,  16LL);
    }

    while (v14);
  }

  __int16 v138 = 0LL;
  v139 = 0LL;
  id v32 = +[InProgressAssetQuery currentInProgressAssetIDs:restoringAssetIDs:]( &OBJC_CLASS___InProgressAssetQuery,  "currentInProgressAssetIDs:restoringAssetIDs:",  &v139,  &v138);
  uint64_t v33 = v139;
  id v35 = (os_log_s *)_ATLogCategorySyncBundle(v32, v34);
  uint64_t v36 = v35;
  if (v33)
  {
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v146 = v139;
      _os_log_impl( &dword_0,  v36,  OS_LOG_TYPE_DEFAULT,  "Assets already in progress (not returning these): %{public}@",  buf,  0xCu);
    }

    id v37 = -[NSMutableDictionary removeObjectsForKeys:](v6, "removeObjectsForKeys:", v139);
  }

  else
  {
    id v37 = (id)os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if ((_DWORD)v37)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v36, OS_LOG_TYPE_ERROR, "Failed to get list of assets already in progress!", buf, 2u);
    }
  }

  BOOL v39 = v138;
  uint64_t v40 = (os_log_s *)_ATLogCategorySyncBundle(v37, v38);
  id v41 = v40;
  if (v39)
  {
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v146 = v138;
      uint64_t v42 = "Assets currently restoring: %{public}@";
      uint64_t v43 = v41;
      os_log_type_t v44 = OS_LOG_TYPE_DEFAULT;
      uint32_t v45 = 12;
LABEL_36:
      _os_log_impl(&dword_0, v43, v44, v42, buf, v45);
    }
  }

  else if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    uint64_t v42 = "Failed to get list of assets currently restoring!";
    uint64_t v43 = v41;
    os_log_type_t v44 = OS_LOG_TYPE_ERROR;
    uint32_t v45 = 2;
    goto LABEL_36;
  }

  id obj = +[AppsClient _orderTheItems:](&OBJC_CLASS___AppsClient, "_orderTheItems:", v6);
  uint64_t v46 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  -[NSFileManager removeItemAtPath:error:]( v46,  "removeItemAtPath:error:",  @"/var/mobile/Library/ApplicationSync/Icons",  0LL);
  v137 = 0LL;
  BOOL v47 = -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( v46,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  @"/var/mobile/Library/ApplicationSync/Icons",  0LL,  0LL,  &v137);
  if (!v47)
  {
    id v49 = (os_log_s *)_ATLogCategorySyncBundle(v47, v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v146 = v137;
      _os_log_impl(&dword_0, v49, OS_LOG_TYPE_ERROR, "Can't create icon scratch dir! %{public}@", buf, 0xCu);
    }
  }

  __int128 v135 = 0u;
  __int128 v136 = 0u;
  __int128 v133 = 0u;
  __int128 v134 = 0u;
  id v127 = [obj countByEnumeratingWithState:&v133 objects:v162 count:16];
  if (v127)
  {
    uint64_t v125 = *(void *)v134;
    uint64_t v124 = _kCFBundleDisplayNameKey;
    do
    {
      __int128 v50 = 0LL;
      do
      {
        if (*(void *)v134 != v125) {
          objc_enumerationMutation(obj);
        }
        uint64_t v51 = *(void **)(*((void *)&v133 + 1) + 8LL * (void)v50);
        __int128 v52 = (NSMutableDictionary *)[v51 objectForKey:kCFBundleIdentifierKey];
        id v53 = [v51 objectForKey:@"Path"];
        v130 = v52;
        char v54 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s/%@.png",  "/var/mobile/Library/ApplicationSync/Icons",  v52);
        id v55 = v53;
        __int128 v56 = -[NSBundle objectForInfoDictionaryKey:]( +[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", v53),  "objectForInfoDictionaryKey:",  v124);
        id v129 = [v51 objectForKey:kCFBundleVersionKey];
        id v57 = [v51 valueForKey:@"IsRestore"];
        if ((objc_opt_respondsToSelector(v57, "BOOLValue") & 1) != 0) {
          unsigned int v58 = [v57 BOOLValue];
        }
        else {
          unsigned int v58 = 0;
        }
        id v59 = [v51 valueForKey:@"auto_demoted_app"];
        if ((objc_opt_respondsToSelector(v59, "BOOLValue") & 1) != 0) {
          unsigned int v60 = [v59 BOOLValue];
        }
        else {
          unsigned int v60 = 0;
        }
        id v61 = [v51 valueForKey:@"intentional_demoted_app"];
        if ((objc_opt_respondsToSelector(v61, "BOOLValue") & 1) != 0) {
          unsigned int v62 = [v61 BOOLValue];
        }
        else {
          unsigned int v62 = 0;
        }
        id v63 = [v51 valueForKey:@"system_app"];
        if ((objc_opt_respondsToSelector(v63, "BOOLValue") & 1) != 0) {
          id v65 = [v63 BOOLValue];
        }
        else {
          id v65 = 0LL;
        }
        if (((v126 | v58) & 1) == 0)
        {
          uint64_t v73 = (os_log_s *)_ATLogCategorySyncBundle(v65, v64);
          if (!os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_66;
          }
          *(_DWORD *)buf = 138543362;
          v146 = v130;
          uint64_t v71 = v73;
          uint64_t v72 = "skipping %{public}@ - its not a restore and app installation is disabled";
          goto LABEL_64;
        }

        if (v58)
        {
          id v66 = -[NSMutableSet containsObject:](v122->_vppAppsToIgnore, "containsObject:", v130);
          int v67 = (int)v66;
          uint64_t v69 = (os_log_s *)_ATLogCategorySyncBundle(v66, v68);
          BOOL v70 = os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT);
          if (v67)
          {
            if (!v70) {
              goto LABEL_66;
            }
            *(_DWORD *)buf = 138543362;
            v146 = v130;
            uint64_t v71 = v69;
            uint64_t v72 = "%{public}@ is currenlty marked as to be ignored for download - skipping";
LABEL_64:
            uint32_t v74 = 12;
LABEL_65:
            _os_log_impl(&dword_0, v71, OS_LOG_TYPE_DEFAULT, v72, buf, v74);
            goto LABEL_66;
          }

          if (v70)
          {
            *(_DWORD *)buf = 138543362;
            v146 = v130;
            uint64_t v71 = v69;
            uint64_t v72 = "%{public}@ is currenlty marked to be restored and will be handled by appstored - skipping";
            goto LABEL_64;
          }
        }

        else if ((_DWORD)v65)
        {
          id v75 = (os_log_s *)_ATLogCategorySyncBundle(v65, v64);
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138544130;
            v146 = v130;
            __int16 v147 = 1024;
            *(_DWORD *)v148 = v60;
            *(_WORD *)&v148[4] = 1024;
            *(_DWORD *)&v148[6] = v62;
            LOWORD(v149) = 1024;
            *(_DWORD *)((char *)&v149 + 2) = 1;
            uint64_t v71 = v75;
            uint64_t v72 = "%{public}@ is auto demoted: %d, manual demoted: %d, system app:%d - skipping";
            uint32_t v74 = 30;
            goto LABEL_65;
          }
        }

        else
        {
          id v76 = [v120 containsObject:v130];
          if ((_DWORD)v76)
          {
            id v78 = (os_log_s *)_ATLogCategorySyncBundle(v76, v77);
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v146 = v130;
              uint64_t v71 = v78;
              uint64_t v72 = "%{public}@ is system app placeholder - skipping";
              goto LABEL_64;
            }
          }

          else
          {
            if ((v60 | v62) != 1) {
              goto LABEL_80;
            }
            id v79 = [v121 containsObject:v130];
            int v80 = (int)v79;
            char v82 = (os_log_s *)_ATLogCategorySyncBundle(v79, v81);
            BOOL v83 = os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT);
            if (v80)
            {
              if (v83)
              {
                *(_DWORD *)buf = 138543874;
                v146 = v130;
                __int16 v147 = 1024;
                *(_DWORD *)v148 = v60;
                *(_WORD *)&v148[4] = 1024;
                *(_DWORD *)&v148[6] = v62;
                _os_log_impl( &dword_0,  v82,  OS_LOG_TYPE_DEFAULT,  "%{public}@ is currenlty demoted (manual:%d, auto:%d) - but will be installed as it's requested by client",  buf,  0x18u);
              }

- (void)clearSyncData
{
  BOOL v3 = (os_log_s *)_ATLogCategorySyncBundle(self, a2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "blasting work area", buf, 2u);
  }

  BOOL v4 = -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  @"/var/mobile/Library/ApplicationSync",  0LL);
  int v6 = (os_log_s *)_ATLogCategorySyncBundle(v4, v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v16 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Cancelling remaining coordinator installs", v16, 2u);
  }

  -[AppsClient assetSyncFinishedWithStatus:outstandingItems:]( self,  "assetSyncFinishedWithStatus:outstandingItems:",  0LL,  self->_outstandingAFCTransfers);
  id v7 = (void *)MobileInstallationLookupUninstalled(0LL);
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = MobileInstallationClearUninstalled([v7 allKeys], 0);
    if ((_DWORD)v10)
    {
      id v12 = (os_log_s *)_ATLogCategorySyncBundle(v10, v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "Failed to clear uninstalled apps list", v15, 2u);
      }
    }

    CFRelease(v9);
  }

  else
  {
    int v13 = (os_log_s *)_ATLogCategorySyncBundle(0LL, v8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "Failed to fetch uninstalled apps list to clear it", v14, 2u);
    }
  }

- (id)installedAssetMetrics
{
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  uint64_t v18 = 0LL;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  uint64_t v14 = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_CD24;
  v10[3] = &unk_18578;
  v10[4] = &v15;
  v10[5] = &v11;
  id v2 = objc_msgSend( +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"),  "enumerateBundlesOfType:block:",  1,  v10);
  BOOL v4 = (os_log_s *)_ATLogCategorySyncBundle(v2, v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = v12[3];
    uint64_t v6 = v16[3];
    *(_DWORD *)buf = 134218496;
    uint64_t v20 = v5;
    __int16 v21 = 2048;
    uint64_t v22 = v6;
    __int16 v23 = 2048;
    uint64_t v24 = 0LL;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "found %ld apps using %lld bytes (%lld purgeable)", buf, 0x20u);
  }

  id v7 = +[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v12[3]);
  uint64_t v8 = +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v7,  @"_Count",  +[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v16[3]),  @"_PhysicalSize",  +[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", 0LL),  @"_PurgeableSize",  0LL);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  return v8;
}

- (id)appleIDsForAssets
{
  id v2 = (os_log_s *)_ATLogCategorySyncBundle(self, a2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "getting id's for assets", buf, 2u);
  }

  id v3 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_CEC0;
  v8[3] = &unk_185A0;
  v8[4] = v3;
  id v4 = objc_msgSend( +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"),  "enumerateBundlesOfType:block:",  1,  v8);
  uint64_t v6 = (os_log_s *)_ATLogCategorySyncBundle(v4, v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v3;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Returning apple ID set: %{public}@", buf, 0xCu);
  }

  return v3;
}

- (id)accountsForAssets
{
  id v2 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
  id v3 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
  uint64_t v5 = (os_log_s *)_ATLogCategorySyncBundle(v3, v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "getting accounts for assets", buf, 2u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_D354;
  v10[3] = &unk_185C8;
  v10[4] = v3;
  v10[5] = v2;
  id v6 = objc_msgSend( +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"),  "enumerateBundlesOfType:block:",  1,  v10);
  uint64_t v8 = (os_log_s *)_ATLogCategorySyncBundle(v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v2;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Returning accountInfo: %{public}@", buf, 0xCu);
  }

  return v2;
}

- (void)assetTransfer:(id)a3 updatedProgress:(double)a4
{
  uint64_t v7 = (os_log_s *)_ATLogCategorySyncBundle(self, a2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(double *)&uint8_t buf[4] = a4;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = [a3 identifier];
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "finished transferring %lf for %{public}@", buf, 0x16u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000LL;
  char v11 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_D6C4;
  block[3] = &unk_18488;
  block[5] = a3;
  void block[6] = buf;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)accessQueue, block);
  -[AppsClient updateTransferProgressForApp:existingApp:]( self,  "updateTransferProgressForApp:existingApp:",  a3,  *(unsigned __int8 *)(*(void *)&buf[8] + 24LL));
  -[NSMutableSet addObject:](self->_outstandingAFCTransfers, "addObject:", [a3 identifier]);
  _Block_object_dispose(buf, 8);
}

- (id)disabledAssetTypes
{
  if (-[AppsClient _appInstallationAllowed](self, "_appInstallationAllowed")
    || -[AppsClient _appRemovalAllowed](self, "_appRemovalAllowed"))
  {
    return 0LL;
  }

  else
  {
    return +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", @"Application", 0LL);
  }

- (void)prepareForBackup
{
  id v2 = (os_log_s *)_ATLogCategorySyncBundle(self, a2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "preparing for backup", buf, 2u);
  }

  id v3 = objc_msgSend( +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"),  "enumerateBundlesOfType:block:",  1,  &stru_18608);
  uint64_t v5 = (os_log_s *)_ATLogCategorySyncBundle(v3, v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "finished preparing for backup", v6, 2u);
  }

+ (void)_notifySpringBoard:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = notify_register_check("com.apple.springboard.atc.wsyncnotify", &out_token);
  int v5 = v4;
  uint64_t v7 = (os_log_s *)_ATLogCategorySyncBundle(v4, v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = "done";
    if (v3) {
      uint64_t v8 = "starting";
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v14 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Notifying SB we are %s syncing", buf, 0xCu);
  }

  uint64_t v9 = SBSSpringBoardBlockableServerPort();
  if (v5)
  {
    char v11 = (os_log_s *)_ATLogCategorySyncBundle(v9, v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v14) = v5;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "Uh Oh...can't send notification to SB:%d", buf, 8u);
    }
  }

  else
  {
    notify_set_state(out_token, v3);
    notify_post("com.apple.springboard.atc.wsyncnotify");
  }

+ (BOOL)_makeIconFromBundlePath:(id)a3 saveTo:(id)a4
{
  uint64_t v6 = (__CFData *)+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data");
  if (!a3)
  {
    id v26 = (os_log_s *)_ATLogCategorySyncBundle(v6, v7);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v36) = 0;
      uint64_t v27 = "missing bundlePath";
LABEL_17:
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_ERROR, v27, (uint8_t *)&v36, 2u);
    }

    return 0;
  }

  uint64_t v8 = v6;
  uint64_t v9 = CFURLCreateWithFileSystemPath(0LL, (CFStringRef)a3, kCFURLPOSIXPathStyle, 1u);
  if (!v9)
  {
    id v26 = (os_log_s *)_ATLogCategorySyncBundle(0LL, v10);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v36) = 0;
      uint64_t v27 = "couldn't create URL";
      goto LABEL_17;
    }

    return 0;
  }

  char v11 = v9;
  CFBundleRef v12 = CFBundleCreate(0LL, v9);
  if (!v12)
  {
    int v28 = (os_log_s *)_ATLogCategorySyncBundle(0LL, v13);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v36) = 0;
      _os_log_impl(&dword_0, v28, OS_LOG_TYPE_ERROR, "couldn't create bundle from URL", (uint8_t *)&v36, 2u);
    }

    CFRelease(v11);
    return 0;
  }

  CFBundleRef v14 = v12;
  id v16 = (CGImage *)LICreateDeviceAppropriateHomeScreenIconImageFromBundle();
  if (!v16)
  {
    id v29 = (os_log_s *)_ATLogCategorySyncBundle(0LL, v15);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v36) = 0;
      id v30 = "couldn't create SB icon from bundle";
LABEL_26:
      _os_log_impl(&dword_0, v29, OS_LOG_TYPE_ERROR, v30, (uint8_t *)&v36, 2u);
    }

+ (id)_loadPlist:(id)a3 withError:(id *)a4
{
  int v5 = +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  a3,  2LL,  a4);
  if (!-[NSData length](v5, "length")) {
    return 0LL;
  }
  id v6 = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v5,  1LL,  0LL,  a4);
  if (!v6)
  {
    CFBundleRef v12 = (os_log_s *)_ATLogCategorySyncBundle(0LL, v7);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = 0;
      uint64_t v13 = "couldn't parse todo list";
      CFBundleRef v14 = (uint8_t *)&v16;
LABEL_9:
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, v13, v14, 2u);
    }

    return 0LL;
  }

  uint64_t v8 = v6;
  objc_opt_class(&OBJC_CLASS___NSMutableArray);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v8);
  if ((isKindOfClass & 1) == 0)
  {
    CFBundleRef v12 = (os_log_s *)_ATLogCategorySyncBundle(isKindOfClass, v10);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = 0;
      uint64_t v13 = "todo list is not an array";
      CFBundleRef v14 = (uint8_t *)&v15;
      goto LABEL_9;
    }

    return 0LL;
  }

  return v8;
}

+ (id)_loadDemotedAppsPlist:(id)a3 withError:(id *)a4
{
  int v5 = +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  a3,  2LL,  a4);
  if (!-[NSData length](v5, "length")) {
    return 0LL;
  }
  id v6 = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v5,  0LL,  0LL,  a4);
  if (!v6)
  {
    CFBundleRef v12 = (os_log_s *)_ATLogCategorySyncBundle(0LL, v7);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = 0;
      uint64_t v13 = "couldn't parse demoted apps list";
      CFBundleRef v14 = (uint8_t *)&v16;
LABEL_9:
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, v13, v14, 2u);
    }

    return 0LL;
  }

  uint64_t v8 = v6;
  objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v8);
  if ((isKindOfClass & 1) == 0)
  {
    CFBundleRef v12 = (os_log_s *)_ATLogCategorySyncBundle(isKindOfClass, v10);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = 0;
      uint64_t v13 = "demoted apps list is not a dictionary";
      CFBundleRef v14 = (uint8_t *)&v15;
      goto LABEL_9;
    }

    return 0LL;
  }

  return v8;
}

+ (id)_orderTheItems:(id)a3
{
  *(void *)&size[1] = 0LL;
  uint64_t v4 = +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [a3 count]);
  uint64_t v5 = SBSSpringBoardBlockableServerPort();
  uint64_t v6 = SBGetFlattenedIconState(v5, 1LL, &size[1], size);
  if (*(void *)&size[1])
  {
    uint64_t v8 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", *(void *)&size[1], size[0]);
    uint64_t v10 = (os_log_s *)_ATLogCategorySyncBundle(v8, v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "saved icon sort order", buf, 2u);
    }

    -[NSData writeToFile:atomically:]( v8,  "writeToFile:atomically:",  @"/var/mobile/Library/ApplicationSync/AssetSortOrder.plist",  1LL);
    id v11 = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v8,  0LL,  0LL,  0LL);
    vm_deallocate(mach_task_self_, *(vm_address_t *)&size[1], size[0]);
  }

  else
  {
    CFBundleRef v12 = (os_log_s *)_ATLogCategorySyncBundle(v6, v7);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "got no icon sort order from SB", buf, 2u);
    }

    id v11 = 0LL;
  }

  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v13 = [v11 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v13)
  {
    id v15 = v13;
    uint64_t v16 = *(void *)v40;
    *(void *)&__int128 v14 = 138543362LL;
    __int128 v33 = v14;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v40 != v16) {
          objc_enumerationMutation(v11);
        }
        uint64_t v18 = *(void *)(*((void *)&v39 + 1) + 8LL * (void)i);
        id v19 = objc_msgSend(a3, "objectForKey:", v18, v33);
        if (v19)
        {
          id v21 = v19;
          BOOL v22 = (os_log_s *)_ATLogCategorySyncBundle(v19, v20);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v33;
            uint64_t v46 = v18;
            _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "prioritize %{public}@", buf, 0xCu);
          }

          -[NSMutableArray addObject:](v4, "addObject:", v21);
          [a3 removeObjectForKey:v18];
        }
      }

      id v15 = [v11 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }

    while (v15);
  }

  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v23 = [a3 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v23)
  {
    id v25 = v23;
    uint64_t v26 = *(void *)v36;
    *(void *)&__int128 v24 = 138543362LL;
    __int128 v34 = v24;
    do
    {
      for (j = 0LL; j != v25; j = (char *)j + 1)
      {
        if (*(void *)v36 != v26) {
          objc_enumerationMutation(a3);
        }
        uint64_t v28 = *(void *)(*((void *)&v35 + 1) + 8LL * (void)j);
        id v29 = objc_msgSend(a3, "objectForKey:", v28, v34);
        id v31 = (os_log_s *)_ATLogCategorySyncBundle(v29, v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v34;
          uint64_t v46 = v28;
          _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEFAULT, "lastly %{public}@", buf, 0xCu);
        }

        -[NSMutableArray addObject:](v4, "addObject:", v29);
      }

      id v25 = [a3 countByEnumeratingWithState:&v35 objects:v44 count:16];
    }

    while (v25);
  }

  return v4;
}

- (BOOL)_isATCDaemon
{
  return -[NSString isEqualToString:]( -[NSBundle bundleIdentifier]( +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"),  "bundleIdentifier"),  "isEqualToString:",  @"com.apple.atc");
}

- (id)_restoreStatePropertyForKey:(id)a3 identifier:(id)a4 version:(id)a5
{
  uint64_t v10 = 0LL;
  id result = +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  @"/var/mobile/Library/ApplicationSync/RestoreState.plist",  2LL,  &v10);
  if (result)
  {
    id result = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  result,  1LL,  0LL,  &v10);
    if (result)
    {
      id v9 = result;
      objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v9) & 1) != 0) {
        return objc_msgSend( objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", a4), "objectForKeyedSubscript:", a5),  "objectForKeyedSubscript:",  a3);
      }
      else {
        return 0LL;
      }
    }
  }

  return result;
}

- (void)_setRestoreStatePropertyValue:(id)a3 forKey:(id)a4 identifier:(id)a5 version:(id)a6
{
  uint64_t v13 = 0LL;
  uint64_t v10 = +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  @"/var/mobile/Library/ApplicationSync/RestoreState.plist",  2LL,  &v13);
  if (v10) {
    id v11 = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v10,  1LL,  0LL,  &v13);
  }
  else {
    id v11 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  }
  CFBundleRef v12 = v11;
  if (![v11 objectForKeyedSubscript:a5]) {
    objc_msgSend( v12,  "setObject:forKeyedSubscript:",  +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"),  a5);
  }
  if (!objc_msgSend(objc_msgSend(v12, "objectForKeyedSubscript:", a5), "objectForKeyedSubscript:", a6)) {
    objc_msgSend( objc_msgSend(v12, "objectForKeyedSubscript:", a5),  "setObject:forKeyedSubscript:",  +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"),  a6);
  }
  objc_msgSend( objc_msgSend(objc_msgSend(v12, "objectForKeyedSubscript:", a5), "objectForKeyedSubscript:", a6),  "setObject:forKeyedSubscript:",  a3,  a4);
  [v12 writeToFile:@"/var/mobile/Library/ApplicationSync/RestoreState.plist" atomically:1];
}

- (void)cleanRestoreStateForIdentifier:(id)a3
{
  uint64_t v6 = 0LL;
  uint64_t v4 = +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  @"/var/mobile/Library/ApplicationSync/RestoreState.plist",  2LL,  &v6);
  if (v4)
  {
    id v5 = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v4,  1LL,  0LL,  &v6);
    [v5 removeObjectForKey:a3];
    if ([v5 count]) {
      [v5 writeToFile:@"/var/mobile/Library/ApplicationSync/RestoreState.plist" atomically:1];
    }
    else {
      -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  @"/var/mobile/Library/ApplicationSync/RestoreState.plist",  0LL);
    }
  }

- (void)changeAssetID:(id)a3 toDo:(id)a4
{
  id v6 = +[AppsClient _loadPlist:withError:]( &OBJC_CLASS___AppsClient,  "_loadPlist:withError:",  @"/var/mobile/Library/ApplicationSync/iTunesStuff/ApplicationsSync.plist",  0LL);
  if ([v6 count])
  {
    uint64_t v7 = 0LL;
    while (1)
    {
      id v8 = [v6 objectAtIndex:v7];
      id v9 = objc_msgSend(objc_msgSend(v8, "objectForKey:", @"identifier"), "isEqualToString:", a3);
      if ((_DWORD)v9) {
        break;
      }
    }

    id v11 = (os_log_s *)_ATLogCategorySyncBundle(v9, v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543874;
      id v13 = a3;
      __int16 v14 = 2114;
      id v15 = [v8 objectForKey:@"operation"];
      __int16 v16 = 2114;
      id v17 = a4;
      _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "Changing %{public}@ from %{public}@ to %{public}@",  (uint8_t *)&v12,  0x20u);
    }

    [v8 setObject:a4 forKey:@"operation"];
    -[NSData writeToFile:atomically:]( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v6,  200LL,  0LL,  0LL),  "writeToFile:atomically:",  @"/var/mobile/Library/ApplicationSync/iTunesStuff/ApplicationsSync.plist",  1LL);
  }

- (void)dataMigratorSetPlaceHolderPromiseForRestoreAppBundle:(id)a3
{
  restoreQueue = self->_restoreQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_E838;
  v4[3] = &unk_184B0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync((dispatch_queue_t)restoreQueue, v4);
}

- (void)dataMigratorCancelledCoordinatorForRestoreAppBundle:(id)a3
{
  restoreQueue = self->_restoreQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_E974;
  v4[3] = &unk_184B0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync((dispatch_queue_t)restoreQueue, v4);
}

- (void)icDidInstallPlaceHolderForAppBundle:(id)a3
{
  restoreQueue = self->_restoreQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_EAB0;
  v4[3] = &unk_184B0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync((dispatch_queue_t)restoreQueue, v4);
}

- (id)_operationStateForIdentifier:(id)a3
{
  id v4 = +[AppsClient _loadPlist:withError:]( &OBJC_CLASS___AppsClient,  "_loadPlist:withError:",  @"/var/mobile/Library/ApplicationSync/iTunesStuff/ApplicationsSync.plist",  0LL);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id result = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)v8);
        if (objc_msgSend( objc_msgSend(v9, "objectForKeyedSubscript:", @"identifier"),  "isEqualToString:",  a3)) {
          return [v9 objectForKeyedSubscript:@"operation"];
        }
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id result = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v6 = result;
      if (result) {
        continue;
      }
      break;
    }
  }

  return result;
}

- (id)_progressForAssetIdentifier:(id)a3
{
  id v4 = (os_log_s *)_ATLogCategorySyncBundle(self, a2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = a3;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "Not returning NSProgress * for %{public}@ as installcoordination is enabled",  (uint8_t *)&v6,  0xCu);
  }

  return 0LL;
}

- (id)placeholderAppPathForBundleIdentifier:(id)a3
{
  BOOL v3 = -[NSArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithObjects:",  NSTemporaryDirectory(),  @"com.apple.atc.Apps",  a3,  0LL);
  id v4 = -[NSString stringByAppendingPathExtension:]( +[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v3),  "stringByAppendingPathExtension:",  @"app");

  return v4;
}

- (int)_getAndResetNumAppInstallsAttempted
{
  p_numAppInstallsAttempted = &self->_numAppInstallsAttempted;
LABEL_2:
  int result = *p_numAppInstallsAttempted;
  do
  {
    unsigned int v4 = __ldxr((unsigned int *)p_numAppInstallsAttempted);
    if (v4 != result)
    {
      __clrex();
      goto LABEL_2;
    }
  }

  while (__stxr(0, (unsigned int *)p_numAppInstallsAttempted));
  return result;
}

- (BOOL)_appInstallationAllowed
{
  id v2 = +[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection");
  return [v2 effectiveBoolValueForSetting:MCFeatureAppInstallationAllowed] != 2;
}

- (BOOL)_appRemovalAllowed
{
  id v2 = +[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection");
  return [v2 effectiveBoolValueForSetting:MCFeatureAppRemovalAllowed] != 2;
}

- (BOOL)_processItunesRestoreInfo
{
  uint64_t v59 = 0LL;
  BOOL v3 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  BOOL v4 = -[NSFileManager fileExistsAtPath:isDirectory:]( v3,  "fileExistsAtPath:isDirectory:",  @"/var/mobile/Media/iTunesRestore/RestoreApplications.plist",  0LL);
  if (!v4)
  {
    __int128 v37 = (os_log_s *)_ATLogCategorySyncBundle(v4, v5);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_0,  v37,  OS_LOG_TYPE_DEFAULT,  "no itunes restore plist found - skipping processing of itunes restored apps",  buf,  2u);
    }

    return 1;
  }

  int v6 = +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  @"/var/mobile/Media/iTunesRestore/RestoreApplications.plist",  2LL,  &v59);
  id v8 = (os_log_s *)_ATLogCategorySyncBundle(v6, v7);
  id v9 = v8;
  if (!v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v61 = v59;
      __int128 v39 = "failed to read itunes app restore info. err=%{public}@";
LABEL_40:
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, v39, buf, 0xCu);
    }

- (BOOL)createPlaceHolderPath:(id)a3 forBundleIdentifier:(id)a4 withAttributes:(id)a5
{
  id v19 = 0LL;
  id v7 = (id)-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  a3,  1LL,  a5,  &v19);
  BOOL v9 = (char)v7;
  if ((_DWORD)v7) {
    BOOL v10 = v19 == 0LL;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10
    || (id v7 = +[AITransactionLog logScenario:step:success:forBundleID:description:]( &OBJC_CLASS___AITransactionLog,  "logScenario:step:success:forBundleID:description:",  @"iTunes App Restore",  0LL,  0LL,  a4,  @"Failed to create app directory"),  !v19))
  {
    unsigned __int8 v17 = (os_log_s *)_ATLogCategorySyncBundle(v7, v8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v21 = a4;
      __int16 v22 = 2114;
      id v23 = a3;
      uint64_t v13 = "Created app directory for '%{public}@' at %{public}@.";
      __int16 v14 = v17;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      uint32_t v16 = 22;
      goto LABEL_10;
    }
  }

  else
  {
    id v11 = (os_log_s *)_ATLogCategorySyncBundle(v7, v8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = objc_msgSend(v19, "msv_description");
      *(_DWORD *)buf = 138543874;
      id v21 = a4;
      __int16 v22 = 2114;
      id v23 = a3;
      __int16 v24 = 2114;
      id v25 = v12;
      uint64_t v13 = "Created app directory for '%{public}@' at %{public}@. error=%{public}@";
      __int16 v14 = v11;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 32;
LABEL_10:
      _os_log_impl(&dword_0, v14, v15, v13, buf, v16);
    }
  }

  return v9;
}

- (BOOL)writeIconData:(id)a3 atPath:(id)a4 returningFileSize:(unint64_t *)a5 forBundleIdentifier:(id)a6 withAttributes:(id)a7
{
  uint64_t v21 = 0LL;
  if (a3)
  {
    id v12 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
    id v13 = (id)-[NSFileManager createFileAtPath:contents:attributes:]( v12,  "createFileAtPath:contents:attributes:",  a4,  a3,  a7);
    BOOL v15 = (int)v13;
    if ((_DWORD)v13
      && ((id v13 = -[NSFileManager attributesOfItemAtPath:error:](v12, "attributesOfItemAtPath:error:", a4, &v21)) != 0LL
        ? (BOOL v16 = v21 == 0)
        : (BOOL v16 = 0),
          v16))
    {
      id v13 = [v13 fileSize];
      id v17 = v13;
      if (a5) {
        *a5 = (unint64_t)v13;
      }
    }

    else
    {
      id v17 = 0LL;
    }

    uint64_t v18 = (os_log_s *)_ATLogCategorySyncBundle(v13, v14);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      id v23 = a6;
      __int16 v24 = 2114;
      id v25 = a4;
      __int16 v26 = 1024;
      BOOL v27 = v15;
      __int16 v28 = 2048;
      id v29 = v17;
      _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_DEFAULT,  "icon data for '%{public}@' was writen to %{public}@ with status:%d fileSize:%llu",  buf,  0x26u);
    }
  }

  else
  {
    id v19 = (os_log_s *)_ATLogCategorySyncBundle(self, a2);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = a6;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_ERROR, "no icon data for '%{public}@'", buf, 0xCu);
    }

    LOBYTE(v15) = 0;
  }

  return v15;
}

- (BOOL)_placeholderExistsForApplication:(id)a3
{
  return 0;
}

- (BOOL)_isRecoverableError:(id)a3
{
  BOOL v4 = (os_log_s *)_ATLogCategorySyncBundle(self, a2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = a3;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "Treating error %{public}@ as non recoverable",  (uint8_t *)&v6,  0xCu);
  }

  return 0;
}

- (void)_enumeratePlaceholdersWithBlock:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_F9B0;
  v3[3] = &unk_18630;
  v3[4] = a3;
  objc_msgSend( +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"),  "enumerateBundlesOfType:block:",  0,  v3);
}

- (id)_getSystemAppPlaceholders
{
  uint64_t v9 = 0LL;
  BOOL v10 = &v9;
  uint64_t v11 = 0x3052000000LL;
  id v12 = sub_FB88;
  id v13 = sub_FB98;
  id v14 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_FBA4;
  v8[3] = &unk_18658;
  v8[4] = &v9;
  id v2 = objc_msgSend( +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"),  "enumerateBundlesOfType:block:",  7,  v8);
  BOOL v4 = (os_log_s *)_ATLogCategorySyncBundle(v2, v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = v10[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v16 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "SystemAppPlaceholders %{public}@", buf, 0xCu);
  }

  int v6 = (void *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (void)setupInstallCoordinatorObserver
{
  if (!self->_appInstallObserver) {
    self->_appInstallObserver = -[IXAppInstallObserver initWithMachServiceName:forClients:delegate:]( objc_alloc(&OBJC_CLASS___IXAppInstallObserver),  "initWithMachServiceName:forClients:delegate:",  @"com.apple.atc.xpc.icappobserverdelegate",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", &off_19668, 0LL),  self);
  }
}

@end