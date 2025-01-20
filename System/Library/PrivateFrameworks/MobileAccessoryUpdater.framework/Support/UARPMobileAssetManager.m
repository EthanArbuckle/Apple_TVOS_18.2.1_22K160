@interface UARPMobileAssetManager
- (BOOL)_updateFusingforAccessory:(id)a3;
- (BOOL)isRoamingEnabled;
- (BOOL)performFirmwareAssetQuery:(id)a3;
- (BOOL)performIsRoamingEnabledCheck;
- (BOOL)uarpDownloadOnCellularAllowed;
- (BOOL)updateAssetSettingsForAccessory:(id)a3 checkForUpdate:(BOOL)a4 automaticUpdatesDisabled:(BOOL *)a5;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (UARPMobileAssetManager)initWithManager:(id)a3 queue:(id)a4;
- (id)assetWithMaxVersion:(id)a3;
- (id)getAssetBundle:(id)a3;
- (id)getAssetVersionForMAAsset:(id)a3;
- (id)profileAssetOverrideSettings;
- (int64_t)downloadFirmwareForAccessory:(id)a3 assetID:(id)a4 mobileAsset:(id)a5;
- (int64_t)downloadRemoteFirmwareForAccessory:(id)a3 assetID:(id)a4 mobileAsset:(id)a5;
- (int64_t)performDownload:(id)a3 accessory:(id)a4 assetID:(id)a5 supplementalAsset:(BOOL)a6;
- (int64_t)performRemoteQueryForAccessory:(id)a3;
- (int64_t)performRemoteUpdateCheckForAccessory:(id)a3;
- (int64_t)uarpAssetLocationType:(unint64_t)a3;
- (void)_mergePartnerAccessoriesInAssetSettings:(id)a3;
- (void)cleanupAssetCache;
- (void)dealloc;
- (void)handleFirmwareAssetQueryCompletion:(id)a3 result:(int64_t)a4 forAccessory:(id)a5 downstreamAppleModelNumber:(id)a6;
- (void)handleMobileAssetDownloadCompletion:(id)a3 status:(int64_t)a4 accessory:(id)a5 assetID:(id)a6;
- (void)handleSupplementalAssetDownloadCompletion:(id)a3 result:(int64_t)a4 forAccessory:(id)a5;
- (void)handleSupplementalAssetQueryCompletion:(id)a3 result:(int64_t)a4 forAccessory:(id)a5;
- (void)notifyFirmwareUpdateAvailabilityStatus:(int64_t)a3 accessory:(id)a4 downstreamAppleModelNumber:(id)a5;
- (void)performQuery:(id)a3 assetType:(id)a4 supplementalAsset:(BOOL)a5 downstreamAppleModelNumber:(id)a6;
- (void)performRemoteDownstreamAssetQuery:(id)a3 appleModelNumbers:(id)a4;
- (void)performRemoteSupplementalAssetQuery:(id)a3 supplementalAssets:(id)a4;
- (void)setUarpDownloadOnCellularAllowed:(BOOL)a3;
- (void)updateAccessoryInfoInDatabaseIfNeeded:(id)a3 serialNumber:(id)a4 accessory:(id)a5 updatePartnerSerialNumbers:(BOOL)a6;
- (void)updateSettingsDatabaseForAccessory:(id)a3;
@end

@implementation UARPMobileAssetManager

- (UARPMobileAssetManager)initWithManager:(id)a3 queue:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UARPMobileAssetManager;
  v6 = -[UARPMobileAssetManager init](&v8, "init");
  if (v6)
  {
    v6->_log = os_log_create("com.apple.accessoryupdater.uarp", "mobileAssetManager");
    v6->_assetManager = (UARPAssetManager *)a3;
    v6->_queue = (OS_dispatch_queue *)a4;
    v6->_delegateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.aam.uarpMobileAssetManager.queue", 0LL);
    -[UARPMobileAssetManager cleanupAssetCache](v6, "cleanupAssetCache");
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPMobileAssetManager;
  -[UARPMobileAssetManager dealloc](&v3, "dealloc");
}

- (void)cleanupAssetCache
{
  objc_super v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v4 = sub_10003BF64();
  v5 = &ADClientAddValueForScalarKey_ptr;
  v6 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@A", v4);
  v7 = -[NSFileManager enumeratorAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "enumeratorAtPath:",  v4);
  id v8 = -[NSDirectoryEnumerator nextObject](v7, "nextObject");
  if (v8)
  {
    id v9 = v8;
    v10 = &ADClientAddValueForScalarKey_ptr;
    v30 = v7;
    do
    {
      v11 = v5[138];
      v43[0] = v4;
      v43[1] = v9;
      id v12 = objc_msgSend(v11, "pathWithComponents:", objc_msgSend(v10[116], "arrayWithObjects:count:", v43, 2));
      if ([v12 hasPrefix:v6])
      {
        uint64_t v13 = v4;
        v14 = v6;
        v15 = v10;
        v16 = v5;
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v42 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Removing legacy mobile asset download at %@",  buf,  0xCu);
        }

        -[NSMutableArray addObject:](v3, "addObject:", v12);
        v5 = v16;
        v10 = v15;
        v6 = v14;
        uint64_t v4 = v13;
        v7 = v30;
      }

      id v9 = -[NSDirectoryEnumerator nextObject](v7, "nextObject");
    }

    while (v9);
  }

  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v35,  v40,  16LL);
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v36 != v20) {
          objc_enumerationMutation(v3);
        }
        -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  *(void *)(*((void *)&v35 + 1) + 8LL * (void)i),  0LL);
      }

      id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v35,  v40,  16LL);
    }

    while (v19);
  }

  -[NSMutableArray removeAllObjects](v3, "removeAllObjects");
  v22 = sub_10000E86C();
  id v23 = sub_1000138C4(v22, 0LL, 2592000.0);
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v24 = [v23 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v32;
    do
    {
      for (j = 0LL; j != v25; j = (char *)j + 1)
      {
        if (*(void *)v32 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)j);
        v29 = self->_log;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v42 = v28;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "Removing current mobile asset download at %@",  buf,  0xCu);
        }

        -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v28,  0LL);
      }

      id v25 = [v23 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }

    while (v25);
  }

- (BOOL)isRoamingEnabled
{
  return -[UARPMobileAssetManager performIsRoamingEnabledCheck](self, "performIsRoamingEnabledCheck");
}

- (int64_t)performRemoteUpdateCheckForAccessory:(id)a3
{
  return -[UARPMobileAssetManager performRemoteQueryForAccessory:](self, "performRemoteQueryForAccessory:", a3);
}

- (int64_t)downloadFirmwareForAccessory:(id)a3 assetID:(id)a4 mobileAsset:(id)a5
{
  if (a5) {
    return -[UARPMobileAssetManager downloadRemoteFirmwareForAccessory:assetID:mobileAsset:]( self,  "downloadRemoteFirmwareForAccessory:assetID:mobileAsset:",  a3,  a4);
  }
  else {
    return 4LL;
  }
}

- (void)updateSettingsDatabaseForAccessory:(id)a3
{
  if (objc_msgSend( +[UARPSupportedAccessory findByAppleModelNumber:]( UARPSupportedAccessory,  "findByAppleModelNumber:",  objc_msgSend(objc_msgSend(a3, "accessoryID"), "modelNumber")),  "supportsInternalSettings")) {
    -[UARPMobileAssetManager updateAssetSettingsForAccessory:checkForUpdate:automaticUpdatesDisabled:]( self,  "updateAssetSettingsForAccessory:checkForUpdate:automaticUpdatesDisabled:",  a3,  0LL,  &v5);
  }
}

- (BOOL)uarpDownloadOnCellularAllowed
{
  return self->_uarpDownloadOnCellularAllowed;
}

- (void)setUarpDownloadOnCellularAllowed:(BOOL)a3
{
  self->_uarpDownloadOnCellularAllowed = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (BOOL)performIsRoamingEnabledCheck
{
  return 0;
}

- (id)profileAssetOverrideSettings
{
  objc_super v3 = +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/Library/Managed Preferences/mobile/com.apple.AUDeveloperSettings.plist");
  uint64_t v20 = 0LL;
  uint64_t v4 = +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v3,  &v20);
  if (!v4)
  {
    uint64_t v13 = v20;
    if (v20)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v22 = "-[UARPMobileAssetManager(Query) profileAssetOverrideSettings]";
        __int16 v23 = 2114;
        id v24 = v3;
        __int16 v25 = 2114;
        uint64_t v26 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "%s: Failed to read managedPrefs at %{public}@ error %{public}@",  buf,  0x20u);
      }
    }

    return 0LL;
  }

  id v5 = -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", @"models");
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10004AE98();
    }
    return 0LL;
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v16 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = [v5 objectForKeyedSubscript:*(void *)(*((void *)&v16 + 1) + 8 * (void)i)];
        uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) == 0)
        {
          if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
            sub_10004AE28();
          }
          return 0LL;
        }
      }

      id v8 = [v5 countByEnumeratingWithState:&v16 objects:v27 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  return v5;
}

- (int64_t)uarpAssetLocationType:(unint64_t)a3
{
  uint64_t v3 = 13LL;
  if (a3 == 6) {
    uint64_t v3 = 14LL;
  }
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 4) {
    int64_t v4 = 11LL;
  }
  else {
    int64_t v4 = v3;
  }
  if (a3 >= 2) {
    return v4;
  }
  else {
    return 12LL;
  }
}

- (BOOL)_updateFusingforAccessory:(id)a3
{
  id v5 = +[AUDeveloperSettingsDatabase sharedDatabase](&OBJC_CLASS___AUDeveloperSettingsDatabase, "sharedDatabase");
  id v6 = objc_msgSend( objc_msgSend(v5, "accessoriesDictionary"),  "objectForKey:",  objc_msgSend(objc_msgSend(a3, "accessoryID"), "serialNumber"));
  if (v6)
  {
    id v7 = v6;
    id v8 = +[UARPSupportedAccessory findByAppleModelNumber:]( UARPSupportedAccessory,  "findByAppleModelNumber:",  objc_msgSend(objc_msgSend(a3, "accessoryID"), "modelNumber"));
    if (![v8 fusingOverrideUnfused]
      || (objc_msgSend( objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType"),  "isEqualToString:",  @"unfused") & 1) == 0)
    {
      id v9 = [v7 mutableCopy];
      id v10 = [v9 objectForKeyedSubscript:@"fusing"];
      id v11 = objc_msgSend(v9, "objectForKeyedSubscript:");
      id v12 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType"), "caseInsensitiveCompare:", v10);
      BOOL v13 = v12 != 0LL;
      if (!v12)
      {
LABEL_24:

        return v13;
      }

      id v23 = v11;
      if (objc_msgSend( objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType"),  "isEqualToString:",  @"prod"))
      {
        unint64_t v14 = 1LL;
      }

      else if (objc_msgSend( objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType"),  "isEqualToString:",  @"dev"))
      {
        unint64_t v14 = 0LL;
      }

      else
      {
        if (!objc_msgSend( objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType"),  "isEqualToString:",  @"unfused")) {
          goto LABEL_15;
        }
        unint64_t v14 = 2LL;
      }

      objc_msgSend( v9,  "setObject:forKeyedSubscript:",  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sub_100002D0C(v14)),  @"fusing");
LABEL_15:
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        id v25 = [a3 accessoryID];
        __int16 v26 = 2114;
        id v27 = v10;
        __int16 v28 = 2114;
        id v29 = [v9 objectForKeyedSubscript:@"fusing"];
        _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Updating HW Fusing for %{public}@, from %{public}@ to %{public}@",  buf,  0x20u);
      }

      if (MGGetBoolAnswer(@"InternalBuild", v17)
        && (objc_msgSend( objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType"),  "isEqualToString:",  @"prod") & 1) == 0)
      {
        objc_msgSend( v9,  "setObject:forKeyedSubscript:",  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sub_100002E44(0)),  @"assetLocation");
        unint64_t v18 = 0LL;
        if (!objc_msgSend(objc_msgSend(v8, "supplementalAssets"), "count")) {
          goto LABEL_21;
        }
      }

      else
      {
        unint64_t v18 = 2LL;
        objc_msgSend( v9,  "setObject:forKeyedSubscript:",  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sub_100002E44(2uLL)),  @"assetLocation");
        if (!objc_msgSend(objc_msgSend(v8, "supplementalAssets"), "count"))
        {
LABEL_21:
          __int128 v19 = self->_log;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            id v20 = [a3 accessoryID];
            id v21 = [v9 objectForKeyedSubscript:@"assetLocation"];
            *(_DWORD *)buf = 138543874;
            id v25 = v20;
            __int16 v26 = 2114;
            id v27 = v23;
            __int16 v28 = 2114;
            id v29 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Updating Asset Location for %{public}@, from %{public}@ to %{public}@",  buf,  0x20u);
          }

          objc_msgSend( v5,  "addAccessoryWithSerialNumber:info:",  objc_msgSend(objc_msgSend(a3, "accessoryID"), "serialNumber"),  +[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v9));
          goto LABEL_24;
        }
      }

      objc_msgSend( v9,  "setObject:forKeyedSubscript:",  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sub_100002E44(v18)),  @"supplementalAssetLocation");
      goto LABEL_21;
    }

    return 0;
  }

  v15 = self->_log;
  BOOL v13 = 0;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = [a3 accessoryID];
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Not updating fusing for %@ no Entry in Database",  buf,  0xCu);
    return 0;
  }

  return v13;
}

- (void)_mergePartnerAccessoriesInAssetSettings:(id)a3
{
  unsigned int v4 = -[UARPMobileAssetManager _updateFusingforAccessory:](self, "_updateFusingforAccessory:");
  id v35 = objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType");
  if (!v35) {
    return;
  }
  HIDWORD(v30) = v4;
  id v34 = +[UARPSupportedAccessory findByAppleModelNumber:]( UARPSupportedAccessory,  "findByAppleModelNumber:",  objc_msgSend(objc_msgSend(a3, "accessoryID"), "modelNumber"));
  id v37 = +[AUDeveloperSettingsDatabase sharedDatabase](&OBJC_CLASS___AUDeveloperSettingsDatabase, "sharedDatabase");
  id v5 = objc_msgSend( objc_msgSend(v37, "accessoriesDictionary"),  "objectForKey:",  objc_msgSend(objc_msgSend(a3, "accessoryID"), "serialNumber"));
  id v6 = objc_msgSend(objc_msgSend(a3, "accessoryID"), "partnerSerialNumbers");
  if (![v6 count])
  {
    id v6 = sub_10000325C(objc_msgSend(objc_msgSend(a3, "accessoryID"), "serialNumber"));
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v44 = v6;
      __int16 v45 = 2112;
      id v46 = [a3 accessoryID];
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Found Partner Serial Numbers updated to %@ for accessory %@",  buf,  0x16u);
    }
  }

  __int128 v33 = v5;
  id v8 = self->_log;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [a3 accessoryID];
    *(_DWORD *)buf = 138412546;
    id v44 = v6;
    __int16 v45 = 2112;
    id v46 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Using reported Partner Serial Numbers %@ for accessory %@",  buf,  0x16u);
  }

  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v10 = v6;
  LODWORD(v30) = v5 == 0LL;
  id v11 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v42, 16, v30);
  if (!v11)
  {
LABEL_25:
    if (v33) {
      return;
    }
    goto LABEL_43;
  }

  id v12 = v11;
  uint64_t v13 = *(void *)v39;
LABEL_9:
  uint64_t v14 = 0LL;
  while (1)
  {
    if (*(void *)v39 != v13) {
      objc_enumerationMutation(v10);
    }
    id v15 = *(id *)(*((void *)&v38 + 1) + 8 * v14);
    id v16 = objc_msgSend(objc_msgSend(v37, "accessoriesDictionary"), "objectForKey:", v15);
    id v17 = [v16 objectForKey:@"fusing"];
    if (v17)
    {
      if (!objc_msgSend( v15,  "isEqualToString:",  objc_msgSend(objc_msgSend(a3, "accessoryID"), "serialNumber"))) {
        break;
      }
    }

    unint64_t v18 = self->_log;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v44 = v15;
      __int16 v45 = 2112;
      id v46 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "Unexpected Accessory Entry for %@ with fusing %@",  buf,  0x16u);
    }

- (BOOL)updateAssetSettingsForAccessory:(id)a3 checkForUpdate:(BOOL)a4 automaticUpdatesDisabled:(BOOL *)a5
{
  BOOL v6 = a4;
  *a5 = 0;
  if (!objc_msgSend(objc_msgSend(a3, "accessoryID"), "serialNumber"))
  {
    log = self->_log;
    BOOL v17 = os_log_type_enabled(log, OS_LOG_TYPE_ERROR);
    if (!v17) {
      return v17;
    }
    sub_10004AF08(a3, log);
    goto LABEL_43;
  }

  BOOL v42 = v6;
  -[UARPMobileAssetManager _mergePartnerAccessoriesInAssetSettings:]( self,  "_mergePartnerAccessoriesInAssetSettings:",  a3);
  id v9 = +[AUDeveloperSettingsDatabase sharedDatabase](&OBJC_CLASS___AUDeveloperSettingsDatabase, "sharedDatabase");
  id v10 = objc_msgSend( objc_msgSend(v9, "accessoriesDictionary"),  "objectForKey:",  objc_msgSend(objc_msgSend(a3, "accessoryID"), "serialNumber"));
  id v44 = a5;
  id v45 = a3;
  v43 = self;
  if (v10)
  {
    id v11 = self->_log;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = objc_msgSend(objc_msgSend(a3, "accessoryID"), "serialNumber");
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = sub_100036B4C(v10, 0);
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Entry found in AUDeveloperSettingsDatabase Accessory:%@ assetLocation:%@",  buf,  0x16u);
    }

    id v12 = v10;
    [v10 objectForKeyedSubscript:@"modelNumber"];
    id v13 = objc_msgSend(objc_msgSend(v45, "accessoryID"), "serialNumber");
    id v14 = v12;
    id v15 = v12;
LABEL_6:
    -[UARPMobileAssetManager updateAccessoryInfoInDatabaseIfNeeded:serialNumber:accessory:updatePartnerSerialNumbers:]( self,  "updateAccessoryInfoInDatabaseIfNeeded:serialNumber:accessory:updatePartnerSerialNumbers:",  v15,  v13,  v45,  v14 != 0LL);
    id v15 = objc_msgSend(objc_msgSend(v9, "accessoriesDictionary"), "objectForKey:", v13);
    goto LABEL_32;
  }

  id v18 = objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType");
  id v19 = objc_msgSend(objc_msgSend(a3, "accessoryID"), "partnerSerialNumbers");
  if (![v19 count]) {
    id v19 = sub_10000325C(objc_msgSend(objc_msgSend(a3, "accessoryID"), "serialNumber"));
  }
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id v20 = [v19 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v48;
LABEL_13:
    uint64_t v22 = 0LL;
    while (1)
    {
      if (*(void *)v48 != v21) {
        objc_enumerationMutation(v19);
      }
      id v13 = *(id *)(*((void *)&v47 + 1) + 8 * v22);
      id v15 = objc_msgSend(objc_msgSend(v9, "accessoriesDictionary"), "objectForKey:", v13);
      id v23 = [v15 objectForKey:@"fusing"];
      if (v23)
      {
        if ((objc_msgSend( v13,  "isEqualToString:",  objc_msgSend(objc_msgSend(v45, "accessoryID"), "serialNumber")) & 1) == 0 && (!objc_msgSend(v23, "caseInsensitiveCompare:", v18)
           || ([v18 isEqualToString:@"prod"] & 1) == 0
           && [v23 caseInsensitiveCompare:@"prod"]))
        {
          break;
        }
      }

      if (v20 == (id)++v22)
      {
        id v20 = [v19 countByEnumeratingWithState:&v47 objects:v55 count:16];
        if (v20) {
          goto LABEL_13;
        }
        goto LABEL_29;
      }
    }

    if (!v15) {
      goto LABEL_29;
    }
    int v24 = self->_log;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = sub_100036B4C(v15, 0);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Entry found in AUDeveloperSettingsDatabase Partner Accessory:%@ assetLocation:%@",  buf,  0x16u);
    }

    unsigned int v26 = objc_msgSend( objc_msgSend(objc_msgSend(v45, "accessoryID"), "modelNumber"),  "isEqualToString:",  objc_msgSend(v15, "objectForKeyedSubscript:", @"modelNumber"));
    id v14 = 0LL;
    if (v26) {
      goto LABEL_6;
    }
  }

  else
  {
LABEL_29:
    id v27 = self->_log;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_10004B068(v45, v27);
    }
    id v15 = 0LL;
    *id v44 = 1;
  }

- (void)updateAccessoryInfoInDatabaseIfNeeded:(id)a3 serialNumber:(id)a4 accessory:(id)a5 updatePartnerSerialNumbers:(BOOL)a6
{
  BOOL v6 = a6;
  id v38 = +[UARPSupportedAccessory findByAppleModelNumber:]( UARPSupportedAccessory,  "findByAppleModelNumber:",  objc_msgSend(objc_msgSend(a5, "accessoryID"), "modelNumber"));
  if (a3)
  {
    BOOL v10 = v6;
    id v11 = a4;
    id v12 = [a3 objectForKeyedSubscript:@"fusing"];
    id v13 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", sub_100002D0C(3uLL));
    id v14 = (NSMutableDictionary *)[a3 mutableCopy];
    if (![v12 isEqualToString:v13]
      || !objc_msgSend(objc_msgSend(a5, "accessoryID"), "hwFusingType"))
    {
      id v16 = v38;
      if (objc_msgSend(objc_msgSend(v38, "supplementalAssets"), "count"))
      {
        a4 = v11;
        if (!-[NSMutableDictionary objectForKeyedSubscript:]( v14,  "objectForKeyedSubscript:",  @"supplementalAssetLocation"))
        {
          MGGetBoolAnswer(@"InternalBuild", v17);
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", sub_100002E44(2uLL)),  @"supplementalAssetLocation");
        }
      }

      else
      {
        a4 = v11;
      }

      BOOL v6 = v10;
      goto LABEL_34;
    }

    if (objc_msgSend( objc_msgSend(objc_msgSend(a5, "accessoryID"), "hwFusingType"),  "isEqualToString:",  @"dev"))
    {
      unint64_t v15 = 0LL;
    }

    else if (objc_msgSend( objc_msgSend(objc_msgSend(a5, "accessoryID"), "hwFusingType"),  "isEqualToString:",  @"prod"))
    {
      unint64_t v15 = 1LL;
    }

    else if (objc_msgSend( objc_msgSend(objc_msgSend(a5, "accessoryID"), "hwFusingType"),  "isEqualToString:",  @"unfused"))
    {
      unint64_t v15 = 2LL;
    }

    else
    {
      unint64_t v15 = 3LL;
    }

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v41 = [a5 identifier];
      __int16 v42 = 2080;
      v43 = sub_100002D0C(v15);
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Updating fusing type for %@ to %s",  buf,  0x16u);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", sub_100002D0C(v15)),  @"fusing");
    a4 = v11;
    BOOL v6 = v10;
  }

  else
  {
    id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    if (objc_msgSend( objc_msgSend(objc_msgSend(a5, "accessoryID"), "hwFusingType"),  "isEqualToString:",  @"dev"))
    {
      unint64_t v15 = 0LL;
    }

    else if (objc_msgSend( objc_msgSend(objc_msgSend(a5, "accessoryID"), "hwFusingType"),  "isEqualToString:",  @"prod"))
    {
      unint64_t v15 = 1LL;
    }

    else if (objc_msgSend( objc_msgSend(objc_msgSend(a5, "accessoryID"), "hwFusingType"),  "isEqualToString:",  @"unfused"))
    {
      unint64_t v15 = 2LL;
    }

    else
    {
      unint64_t v15 = 3LL;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", sub_100002D0C(v15)),  @"fusing");
    id v18 = objc_msgSend(objc_msgSend(objc_msgSend(a5, "accessoryID"), "firmwareVersion"), "copy");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  v18,  @"activeVersion");

    id v19 = objc_msgSend(objc_msgSend(objc_msgSend(a5, "accessoryID"), "hwRevision"), "copy");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v19, @"hwRevision");
  }

  if (!MGGetBoolAnswer(@"InternalBuild", v20) || (v15 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", sub_100002E44(2uLL)),  @"assetLocation");
    id v16 = v38;
    if (objc_msgSend(objc_msgSend(v38, "supplementalAssets"), "count"))
    {
      unint64_t v22 = 2LL;
      goto LABEL_33;
    }
  }

  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", sub_100002E44(0LL)),  @"assetLocation");
    id v16 = v38;
    if (objc_msgSend(objc_msgSend(v38, "supplementalAssets"), "count"))
    {
      unint64_t v22 = 0LL;
LABEL_33:
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", sub_100002E44(v22)),  @"supplementalAssetLocation");
    }
  }

- (BOOL)performFirmwareAssetQuery:(id)a3
{
  id v5 = +[NSMutableString stringWithFormat:]( NSMutableString,  "stringWithFormat:",  @"%@.%@",  @"com.apple.MobileAsset.UARP",  [a3 identifier]);
  id v6 = +[UARPSupportedAccessory findByAppleModelNumber:]( UARPSupportedAccessory,  "findByAppleModelNumber:",  objc_msgSend(objc_msgSend(a3, "accessoryID"), "modelNumber"));
  if (objc_msgSend(objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType"), "length")
    && objc_msgSend( objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType"),  "caseInsensitiveCompare:",  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%s",  UARPAccessoryHardwareFusingToString(2))))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v14 = objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType");
      __int16 v15 = 2114;
      id v16 = v5;
      __int16 v17 = 2114;
      id v18 = [a3 accessoryID];
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Appending hwFusingType %{public}@ to assetType %{public}@ for accessory:%{public}@",  buf,  0x20u);
    }

    -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"-%@",  objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType"));
  }

  if (!objc_msgSend(objc_msgSend(a3, "assetID"), "remoteURL")
    && [v6 supportsInternalSettings]
    && (-[UARPMobileAssetManager updateAssetSettingsForAccessory:checkForUpdate:automaticUpdatesDisabled:]( self,  "updateAssetSettingsForAccessory:checkForUpdate:automaticUpdatesDisabled:",  a3,  1LL,  &v12)
     || v12))
  {
    if (!v12) {
      return 0;
    }
    -[UARPMobileAssetManager notifyFirmwareUpdateAvailabilityStatus:accessory:downstreamAppleModelNumber:]( self,  "notifyFirmwareUpdateAvailabilityStatus:accessory:downstreamAppleModelNumber:",  6LL,  a3,  0LL);
  }

  else
  {
    if (objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "assetID"), "remoteURL"), "path"), "length"))
    {
      id v8 = self->_log;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = objc_msgSend(objc_msgSend(a3, "assetID"), "remoteURL");
        id v10 = [a3 accessoryID];
        *(_DWORD *)buf = 138412802;
        id v14 = v9;
        __int16 v15 = 2112;
        id v16 = v5;
        __int16 v17 = 2112;
        id v18 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Pointing MobileAsset URL to %@, assetType %@ for accessory:%@",  buf,  0x20u);
      }

      ASSetAssetServerURLForAssetType(objc_msgSend(objc_msgSend(a3, "assetID"), "remoteURL"), v5);
    }

    -[UARPMobileAssetManager performQuery:assetType:supplementalAsset:downstreamAppleModelNumber:]( self,  "performQuery:assetType:supplementalAsset:downstreamAppleModelNumber:",  a3,  v5,  0LL,  0LL);
  }

  return 1;
}

- (int64_t)performRemoteQueryForAccessory:(id)a3
{
  if (-[UARPMobileAssetManager performFirmwareAssetQuery:](self, "performFirmwareAssetQuery:"))
  {
    id v5 = +[UARPSupportedAccessory findByAppleModelNumber:]( UARPSupportedAccessory,  "findByAppleModelNumber:",  objc_msgSend(objc_msgSend(a3, "accessoryID"), "modelNumber"));
    if (v5)
    {
      id v6 = v5;
      -[UARPMobileAssetManager performRemoteSupplementalAssetQuery:supplementalAssets:]( self,  "performRemoteSupplementalAssetQuery:supplementalAssets:",  a3,  [v5 supplementalAssets]);
      -[UARPMobileAssetManager performRemoteDownstreamAssetQuery:appleModelNumbers:]( self,  "performRemoteDownstreamAssetQuery:appleModelNumbers:",  a3,  [v6 downstreamAppleModelNumbers]);
    }
  }

  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Skipping supplemental/downstream asset queries this iteration",  v9,  2u);
    }
  }

  return 0LL;
}

- (void)performQuery:(id)a3 assetType:(id)a4 supplementalAsset:(BOOL)a5 downstreamAppleModelNumber:(id)a6
{
  id v11 = [[MAAssetQuery alloc] initWithType:a4];
  id v12 = objc_alloc_init(&OBJC_CLASS___MADownloadOptions);
  [v12 setDiscretionary:0];
  unsigned int v13 = objc_msgSend(objc_msgSend(a3, "accessoryID"), "downloadOnCellularAllowed");
  BOOL uarpDownloadOnCellularAllowed = 0LL;
  if (v13) {
    BOOL uarpDownloadOnCellularAllowed = self->_uarpDownloadOnCellularAllowed;
  }
  [v12 setAllowsCellularAccess:uarpDownloadOnCellularAllowed];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100038DCC;
  v15[3] = &unk_100075DA8;
  v15[4] = self;
  v15[5] = a3;
  BOOL v16 = a5;
  v15[6] = a4;
  v15[7] = v11;
  v15[8] = a6;
  +[MAAsset startCatalogDownload:options:then:]( &OBJC_CLASS___MAAsset,  "startCatalogDownload:options:then:",  a4,  v12,  v15);
}

- (void)notifyFirmwareUpdateAvailabilityStatus:(int64_t)a3 accessory:(id)a4 downstreamAppleModelNumber:(id)a5
{
  if (a5)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v9 = objc_msgSend(objc_msgSend(a4, "assetID"), "downstreamAssetIDs");
    id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
          if (objc_msgSend(objc_msgSend(v14, "modelNumber"), "isEqualToString:", a5))
          {
            if (v14)
            {
              objc_msgSend(objc_msgSend(objc_msgSend(a4, "assetID"), "downstreamAssetIDs"), "removeObject:", v14);
            }

            goto LABEL_13;
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

- (void)handleFirmwareAssetQueryCompletion:(id)a3 result:(int64_t)a4 forAccessory:(id)a5 downstreamAppleModelNumber:(id)a6
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    int64_t v59 = a4;
    __int16 v60 = 2112;
    id v61 = [a5 accessoryID];
    __int16 v62 = 2112;
    id v63 = a6;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "MobileAsset query status:%ld for accessory %@ / %@",  buf,  0x20u);
  }

  if (!a6)
  {
    id v17 = [a5 assetID];
LABEL_19:
    id v19 = [a5 identifier];
    goto LABEL_21;
  }

  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id v11 = objc_msgSend(objc_msgSend(a5, "assetID"), "downstreamAssetIDs");
  id v12 = [v11 countByEnumeratingWithState:&v53 objects:v57 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v54;
    while (2)
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v54 != v14) {
          objc_enumerationMutation(v11);
        }
        BOOL v16 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)i);
        if (objc_msgSend(objc_msgSend(v16, "modelNumber"), "isEqualToString:", a6))
        {
          if (v16)
          {
            objc_msgSend(objc_msgSend(objc_msgSend(a5, "assetID"), "downstreamAssetIDs"), "removeObject:", v16);
          }

          goto LABEL_15;
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v53 objects:v57 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

- (id)assetWithMaxVersion:(id)a3
{
  __int128 v21 = 0uLL;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (!v5) {
    return 0LL;
  }
  id v7 = v5;
  BOOL v16 = 0LL;
  uint64_t v8 = *(void *)v18;
  *(void *)&__int128 v6 = 138412546LL;
  __int128 v15 = v6;
  do
  {
    for (i = 0LL; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(a3);
      }
      id v10 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
      if (objc_msgSend(v10, "state", v15) != (id)3)
      {
        id v11 = -[UARPMobileAssetManager getAssetVersionForMAAsset:](self, "getAssetVersionForMAAsset:", v10);
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          id v13 = sub_10000EC24((unint64_t)[v10 state]);
          *(_DWORD *)buf = v15;
          *(void *)&uint8_t buf[4] = v11;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v13;
          _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Comparing asset with version %@ / state %@",  buf,  0x16u);
        }

        +[UARPSuperBinaryAsset versionFromString:version:]( &OBJC_CLASS___UARPSuperBinaryAsset,  "versionFromString:version:",  v11,  buf);
        if (uarpVersionCompare(&v21, buf) == 1)
        {
          __int128 v21 = *(_OWORD *)buf;
          BOOL v16 = v10;
        }
      }
    }

    id v7 = [a3 countByEnumeratingWithState:&v17 objects:v23 count:16];
  }

  while (v7);
  return v16;
}

- (int64_t)performDownload:(id)a3 accessory:(id)a4 assetID:(id)a5 supplementalAsset:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = [a3 state];
  if (v11 == (id)1 || v11 == (id)4)
  {
    id v12 = objc_alloc_init(&OBJC_CLASS___MADownloadOptions);
    [v12 setDiscretionary:0];
    unsigned int v13 = objc_msgSend(objc_msgSend(a4, "accessoryID"), "downloadOnCellularAllowed");
    BOOL uarpDownloadOnCellularAllowed = 0LL;
    if (v13) {
      BOOL uarpDownloadOnCellularAllowed = self->_uarpDownloadOnCellularAllowed;
    }
    [v12 setAllowsCellularAccess:uarpDownloadOnCellularAllowed];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100039DBC;
    v17[3] = &unk_100075D80;
    BOOL v18 = v6;
    v17[4] = self;
    v17[5] = a3;
    v17[6] = a4;
    v17[7] = a5;
    [a3 startDownload:v12 then:v17];
    goto LABEL_12;
  }

  if (v11 == (id)2)
  {
    if (v6) {
      -[UARPMobileAssetManager handleSupplementalAssetDownloadCompletion:result:forAccessory:]( self,  "handleSupplementalAssetDownloadCompletion:result:forAccessory:",  a3,  0LL,  a4);
    }
    else {
      -[UARPMobileAssetManager handleMobileAssetDownloadCompletion:status:accessory:assetID:]( self,  "handleMobileAssetDownloadCompletion:status:accessory:assetID:",  a3,  0LL,  a4,  a5);
    }
    id v12 = 0LL;
LABEL_12:
    int64_t v15 = 0LL;
    goto LABEL_13;
  }

  id v12 = 0LL;
  int64_t v15 = 1LL;
LABEL_13:

  return v15;
}

- (int64_t)downloadRemoteFirmwareForAccessory:(id)a3 assetID:(id)a4 mobileAsset:(id)a5
{
  if ([a3 asset]) {
    return -[UARPMobileAssetManager performDownload:accessory:assetID:supplementalAsset:]( self,  "performDownload:accessory:assetID:supplementalAsset:",  a5,  a3,  a4,  0LL);
  }
  else {
    return 4LL;
  }
}

- (void)handleMobileAssetDownloadCompletion:(id)a3 status:(int64_t)a4 accessory:(id)a5 assetID:(id)a6
{
  id v11 = [a6 modelNumber];
  if (!v11
    || (id v12 = v11,
        id v13 = +[UARPSupportedAccessory findByAppleModelNumber:]( UARPSupportedAccessory,  "findByAppleModelNumber:",  v11),  [v13 mobileAssetAppleModelNumber])
    && (id v12 = [v13 mobileAssetAppleModelNumber]) == 0)
  {
    id v12 = [a5 identifier];
  }

  id v14 = sub_100036910([a5 accessoryID]);
  uint64_t v15 = (uint64_t)v14;
  if (a4)
  {
    if (v14)
    {
      BOOL v16 = sub_10000E8B4( (uint64_t)v12,  (uint64_t)objc_msgSend(objc_msgSend(a5, "accessoryID"), "hwFusingType"),  (uint64_t)v14);
      if (v16)
      {
        __int128 v17 = v16;
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          id v32 = (NSString *)-[NSURL description](v17, "description");
          __int16 v33 = 2114;
          id v34 = [a5 accessoryID];
          __int16 v35 = 2114;
          id v36 = [a6 modelNumber];
          _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Using latest downloaded asset from cache %{public}@ for accessory %{public}@ / %{public}@",  buf,  0x20u);
        }

        objc_msgSend(a6, "setAssetVersion:", sub_10000EA98((uint64_t)-[NSURL path](v17, "path")));
LABEL_21:
        [a6 setLocalURL:v17];
        [a6 setDownloadStatus:1];
        [a6 setUpdateAvailabilityStatus:3];
LABEL_22:
        -[UARPAssetManager assetAvailabilityUpdateForAccessory:assetID:downstreamAppleModelNumber:]( self->_assetManager,  "assetAvailabilityUpdateForAccessory:assetID:downstreamAppleModelNumber:",  [a5 accessoryID],  a6,  objc_msgSend(a6, "modelNumber"));
        return;
      }
    }
  }

  else
  {
    id v19 = -[UARPMobileAssetManager getAssetBundle:](self, "getAssetBundle:", a3);
    __int128 v20 = (NSString *)[v19 objectForInfoDictionaryKey:@"FirmwareImageFile"];
    if (v20)
    {
      __int128 v21 = v20;
      id v22 = objc_msgSend( v19,  "pathForResource:ofType:",  -[NSString stringByDeletingPathExtension](v20, "stringByDeletingPathExtension"),  -[NSString pathExtension](v20, "pathExtension"));
      if (v22)
      {
        id v23 = v22;
        id v24 = sub_10000E8B4((uint64_t)v12, (uint64_t)objc_msgSend(objc_msgSend(a5, "accessoryID"), "hwFusingType"), v15);
        id v25 = self->_log;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          id v32 = v21;
          __int16 v33 = 2112;
          id v34 = [a5 accessoryID];
          __int16 v35 = 2112;
          id v36 = [a6 modelNumber];
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "Moving Firmware File %@ from MobileAsset to UARP Cache for accessory %@ / %@",  buf,  0x20u);
        }

        id v26 = sub_10000E2EC( +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v23),  (uint64_t)v12,  (uint64_t)objc_msgSend(objc_msgSend(a5, "accessoryID"), "hwFusingType"),  objc_msgSend(a6, "assetVersion"),  v15);
        if (v26)
        {
          __int128 v17 = v26;
          if (!-[NSString isEqualToString:](-[NSURL path](v24, "path"), "isEqualToString:", -[NSURL path](v26, "path")))
          {
            BOOL v27 = self->_log;
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              id v28 = -[NSURL path](v24, "path");
              id v29 = [a5 accessoryID];
              id v30 = [a6 modelNumber];
              *(_DWORD *)buf = 138412802;
              id v32 = v28;
              __int16 v33 = 2112;
              id v34 = v29;
              __int16 v35 = 2112;
              id v36 = v30;
              _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "Deleting previously cached MobileAsset at %@ for accessory %@ / %@",  buf,  0x20u);
            }

            -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  -[NSString stringByDeletingLastPathComponent]( -[NSURL path](v24, "path"),  "stringByDeletingLastPathComponent"),  0LL);
          }

          [a5 analyticsSetDownloadCompleteForAssetID:a6 status:1];
          goto LABEL_21;
        }
      }
    }
  }

  if ((objc_msgSend(objc_msgSend(a5, "accessoryID"), "autoDownloadAllowed") & 1) == 0)
  {
    [a6 setLocalURL:0];
    [a6 setDownloadStatus:2];
    goto LABEL_22;
  }

- (void)performRemoteDownstreamAssetQuery:(id)a3 appleModelNumbers:(id)a4
{
  unsigned int v7 = sub_100003828([a3 accessoryID]);
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v8 = [a4 countByEnumeratingWithState:&v30 objects:v43 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v31;
    uint64_t v28 = *(void *)v31;
    do
    {
      id v11 = 0LL;
      id v29 = v9;
      do
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(a4);
        }
        id v12 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)v11);
        id v13 = +[UARPSupportedAccessory findByAppleModelNumber:]( &OBJC_CLASS___UARPSupportedAccessory,  "findByAppleModelNumber:",  v12);
        if (v13) {
          int v14 = v7;
        }
        else {
          int v14 = 1;
        }
        if (v14 == 1)
        {
          -[UARPMobileAssetManager notifyFirmwareUpdateAvailabilityStatus:accessory:downstreamAppleModelNumber:]( self,  "notifyFirmwareUpdateAvailabilityStatus:accessory:downstreamAppleModelNumber:",  6LL,  a3,  v12);
        }

        else
        {
          uint64_t v15 = v13;
          id v16 = [v13 mobileAssetAppleModelNumber];
          id v17 = v12;
          if (v16) {
            id v17 = [v15 mobileAssetAppleModelNumber];
          }
          BOOL v18 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"%@.%@",  @"com.apple.MobileAsset.UARP",  v17);
          if (objc_msgSend(objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType"), "length")
            && objc_msgSend( objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType"),  "caseInsensitiveCompare:",  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%s",  UARPAccessoryHardwareFusingToString(2))))
          {
            log = self->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
            {
              id v20 = objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType");
              id v21 = [a3 accessoryID];
              *(_DWORD *)buf = 138544130;
              id v36 = v20;
              __int16 v37 = 2114;
              id v38 = v18;
              __int16 v39 = 2114;
              id v40 = v21;
              __int16 v41 = 2114;
              id v42 = v12;
              _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Appending hwFusingType %{public}@ to assetType %{public}@ for accessory:%{public}@ with downstream accessory:%{public}@",  buf,  0x2Au);
            }

            -[NSMutableString appendFormat:]( v18,  "appendFormat:",  @"-%@",  objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType"));
          }

          id v22 = sub_100036B4C( objc_msgSend( objc_msgSend( +[AUDeveloperSettingsDatabase sharedDatabase]( AUDeveloperSettingsDatabase,  "sharedDatabase"),  "accessoriesDictionary"),  "objectForKey:",  objc_msgSend(objc_msgSend(a3, "accessoryID"), "serialNumber")),  0);
          if (v22)
          {
            id v23 = +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v22);
            id v24 = self->_log;
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v36 = v23;
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Downstream Asset remoteURL = %@",  buf,  0xCu);
            }

            if (-[NSString length](-[NSURL path](v23, "path"), "length"))
            {
              id v25 = self->_log;
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                id v26 = [a3 accessoryID];
                *(_DWORD *)buf = 138412802;
                id v36 = v23;
                __int16 v37 = 2112;
                id v38 = v18;
                __int16 v39 = 2112;
                id v40 = v26;
                _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Pointing MobileAsset URL to %@, assetType %@ for accessory:%@",  buf,  0x20u);
              }

              ASSetAssetServerURLForAssetType(v23, v18);
            }
          }

          else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
          {
            sub_10004B184((uint64_t)v34, a3);
          }

          BOOL v27 = self->_log;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v36 = v18;
            _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Perform Downstream Asset query:%@",  buf,  0xCu);
          }

          -[UARPMobileAssetManager performQuery:assetType:supplementalAsset:downstreamAppleModelNumber:]( self,  "performQuery:assetType:supplementalAsset:downstreamAppleModelNumber:",  a3,  v18,  0LL,  v12);
          uint64_t v10 = v28;
          id v9 = v29;
        }

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [a4 countByEnumeratingWithState:&v30 objects:v43 count:16];
    }

    while (v9);
  }

- (void)performRemoteSupplementalAssetQuery:(id)a3 supplementalAssets:(id)a4
{
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v6 = [a4 countByEnumeratingWithState:&v18 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(a4);
        }
        uint64_t v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  @"com.apple.MobileAsset.UARP",  *(void *)(*((void *)&v18 + 1) + 8LL * (void)i));
        id v11 = sub_100036B4C( objc_msgSend( objc_msgSend( +[AUDeveloperSettingsDatabase sharedDatabase]( AUDeveloperSettingsDatabase,  "sharedDatabase"),  "accessoriesDictionary"),  "objectForKey:",  objc_msgSend(objc_msgSend(a3, "accessoryID"), "serialNumber")),  1);
        if (v11)
        {
          id v12 = +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v11);
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v24 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Supplemental Asset remoteURL = %@",  buf,  0xCu);
          }

          if (-[NSString length](-[NSURL path](v12, "path"), "length"))
          {
            int v14 = self->_log;
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              id v15 = [a3 accessoryID];
              *(_DWORD *)buf = 138412802;
              id v24 = v12;
              __int16 v25 = 2112;
              id v26 = v10;
              __int16 v27 = 2112;
              id v28 = v15;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Pointing MobileAsset URL to %@, assetType %@ for accessory:%@",  buf,  0x20u);
            }

            ASSetAssetServerURLForAssetType(v12, v10);
          }
        }

        else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
        {
          sub_10004B1C4((uint64_t)v22, a3);
        }

        id v16 = self->_log;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = (NSURL *)v10;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Perform Supplemental Asset query:%@",  buf,  0xCu);
        }

        -[UARPMobileAssetManager performQuery:assetType:supplementalAsset:downstreamAppleModelNumber:]( self,  "performQuery:assetType:supplementalAsset:downstreamAppleModelNumber:",  a3,  v10,  1LL,  0LL);
      }

      id v7 = [a4 countByEnumeratingWithState:&v18 objects:v29 count:16];
    }

    while (v7);
  }

- (void)handleSupplementalAssetQueryCompletion:(id)a3 result:(int64_t)a4 forAccessory:(id)a5
{
  if (a4)
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10004B304();
    }
    return;
  }

  if (objc_msgSend(objc_msgSend(a3, "results"), "count"))
  {
    id v8 = -[UARPMobileAssetManager assetWithMaxVersion:](self, "assetWithMaxVersion:", [a3 results]);
    if (v8)
    {
      id v9 = v8;
      id v10 = objc_msgSend( objc_msgSend(objc_msgSend(a3, "assetType"), "componentsSeparatedByString:", @"."),  "lastObject");
      id v11 = -[NSFileManager contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:",  +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@/%@",  sub_10003BF64(),  @"supplementalassets",  v10)),  0LL,  4LL,  0LL);
      if (-[NSArray count](v11, "count"))
      {
        id v12 = -[UARPMobileAssetManager getAssetVersionForMAAsset:](self, "getAssetVersionForMAAsset:", v9);
        +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v32,  v40,  16LL);
        if (v13)
        {
          id v14 = v13;
          id v27 = v10;
          id v28 = v9;
          id v29 = (NSMutableString *)a5;
          char v30 = 0;
          uint64_t v15 = *(void *)v33;
          do
          {
            id v16 = v11;
            for (i = 0LL; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v33 != v15) {
                objc_enumerationMutation(v16);
              }
              __int128 v18 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
              __int128 v19 = sub_10000EA98((uint64_t)[v18 path]);
              log = self->_log;
              if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v37 = v12;
                __int16 v38 = 2112;
                __int16 v39 = v19;
                _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "SupplementalAsset version %@ available, cached version %@",  buf,  0x16u);
              }

              if (sub_100025168((uint64_t)v19, v12))
              {
                if (!-[NSFileManager removeItemAtURL:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtURL:error:",  v18,  &v31))
                {
                  __int128 v21 = self->_log;
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    id v37 = v18;
                    __int16 v38 = 2112;
                    __int16 v39 = v31;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Failed to clean up SupplementalAsset %@ with error %@",  buf,  0x16u);
                  }
                }
              }

              else
              {
                char v30 = 1;
              }
            }

            id v11 = v16;
            id v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v32,  v40,  16LL);
          }

          while (v14);
          if ((v30 & 1) != 0)
          {
            id v22 = self->_log;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v37 = v12;
              __int16 v38 = 2112;
              __int16 v39 = v29;
              _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Not Downloading SupplementalAsset version %@ for %@",  buf,  0x16u);
            }

            -[NSMutableString setSupplementalAssetName:](v29, "setSupplementalAssetName:", v27);
            -[UARPAssetManager supplementalAssetAvailabilityUpdateForAccessory:assetName:]( self->_assetManager,  "supplementalAssetAvailabilityUpdateForAccessory:assetName:",  -[NSMutableString accessoryID](v29, "accessoryID"),  -[NSMutableString supplementalAssetName](v29, "supplementalAssetName"));
            return;
          }

          id v9 = v28;
          a5 = v29;
        }

        id v26 = self->_log;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v37 = v12;
          id v24 = "Downloading SupplementalAsset version %@";
          __int16 v25 = v26;
          goto LABEL_36;
        }
      }

      else
      {
        id v23 = self->_log;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v37 = [a5 accessoryID];
          id v24 = "No cached SupplementalAsset found for accessory %@, downloading the asset available";
          __int16 v25 = v23;
LABEL_36:
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v24, buf, 0xCu);
        }
      }

      -[UARPMobileAssetManager performDownload:accessory:assetID:supplementalAsset:]( self,  "performDownload:accessory:assetID:supplementalAsset:",  v9,  a5,  0LL,  1LL);
      return;
    }

    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10004B284();
    }
  }

  else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_10004B204();
  }

- (void)handleSupplementalAssetDownloadCompletion:(id)a3 result:(int64_t)a4 forAccessory:(id)a5
{
  id v8 = -[UARPMobileAssetManager getAssetBundle:](self, "getAssetBundle:", a3, a4);
  if (v8)
  {
    id v9 = v8;
    id v10 = [v8 objectForInfoDictionaryKey:@"FirmwareImageFile"];
    if (v10)
    {
      id v11 = v10;
      id v12 = (NSURL *)objc_msgSend( v9,  "pathForResource:ofType:",  objc_msgSend(v10, "stringByDeletingPathExtension"),  objc_msgSend(v10, "pathExtension"));
      id v13 = objc_msgSend( objc_msgSend(objc_msgSend(a3, "assetType"), "componentsSeparatedByString:", @"."),  "lastObject");
      id v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@/%@/",  sub_10003BF64(),  @"supplementalassets",  v13);
      uint64_t v15 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v14);
      uint64_t v23 = 0LL;
      if (-[NSURL checkResourceIsReachableAndReturnError:](v15, "checkResourceIsReachableAndReturnError:", 0LL)
        || -[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createDirectoryAtURL:withIntermediateDirectories:attributes:error:",  v15,  1LL,  0LL,  &v23))
      {
        id v16 = +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  -[NSString stringByAppendingPathComponent:](v14, "stringByAppendingPathComponent:", v11));
        if (-[NSURL checkResourceIsReachableAndReturnError:](v16, "checkResourceIsReachableAndReturnError:", 0LL)
          && !-[NSFileManager removeItemAtURL:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtURL:error:",  v16,  &v23))
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
            sub_10004B468((uint64_t)v16, &v23, log);
          }
        }

        else
        {
          unsigned int v17 = -[NSFileManager copyItemAtURL:toURL:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "copyItemAtURL:toURL:error:",  +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v12),  v16,  &v23);
          __int128 v18 = self->_log;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            __int16 v25 = "-[UARPMobileAssetManager(Query) handleSupplementalAssetDownloadCompletion:result:forAccessory:]";
            __int16 v26 = 2112;
            id v27 = v16;
            __int16 v28 = 1024;
            *(_DWORD *)id v29 = v17;
            *(_WORD *)&v29[4] = 2112;
            *(void *)&v29[6] = v23;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s: Downloaded supplemental asset at location=%@, success=%d, error=%@",  buf,  0x26u);
          }

          if ((v17 & 1) != 0)
          {
            [a5 setSupplementalAssetName:v13];
            -[UARPAssetManager supplementalAssetAvailabilityUpdateForAccessory:assetName:]( self->_assetManager,  "supplementalAssetAvailabilityUpdateForAccessory:assetName:",  [a5 accessoryID],  objc_msgSend(a5, "supplementalAssetName"));
          }

          else
          {
            __int128 v19 = self->_log;
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315906;
              __int16 v25 = "-[UARPMobileAssetManager(Query) handleSupplementalAssetDownloadCompletion:result:forAccessory:]";
              __int16 v26 = 2112;
              id v27 = v12;
              __int16 v28 = 2112;
              *(void *)id v29 = v16;
              *(_WORD *)&v29[8] = 2112;
              *(void *)&v29[10] = v23;
              _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s: Failed to place supplemental asset from %@ to %@, error: %@",  buf,  0x2Au);
            }
          }
        }
      }

      else
      {
        __int128 v20 = self->_log;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_10004B500(&v23, v20, v21);
        }
      }
    }

    else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_10004B3F4();
    }
  }

  else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_10004B380();
  }

- (id)getAssetVersionForMAAsset:(id)a3
{
  unsigned int v4 = +[NSMutableString stringWithFormat:]( NSMutableString,  "stringWithFormat:",  @"%u.%u.%u",  objc_msgSend( objc_msgSend(objc_msgSend(a3, "attributes"), "objectForKey:", @"FirmwareVersionMajor"),  "unsignedIntValue"),  objc_msgSend( objc_msgSend(objc_msgSend(a3, "attributes"), "objectForKey:", @"FirmwareVersionMinor"),  "unsignedIntValue"),  objc_msgSend( objc_msgSend(objc_msgSend(a3, "attributes"), "objectForKey:", @"FirmwareVersionRelease"),  "unsignedIntValue"));
  id v5 = objc_msgSend(objc_msgSend(a3, "attributes"), "objectForKey:", @"FirmwareVersionBuild");
  if (v5) {
    -[NSMutableString appendFormat:](v4, "appendFormat:", @".%u", [v5 unsignedIntValue]);
  }
  return +[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v4);
}

- (id)getAssetBundle:(id)a3
{
  id v4 = objc_msgSend(objc_msgSend(a3, "attributes"), "objectForKey:", @"FirmwareBundle");
  if (v4
    && (id v5 = objc_msgSend( objc_msgSend(objc_msgSend(a3, "getLocalFileUrl"), "URLByAppendingPathComponent:", v4),  "filePathURL")) != 0)
  {
    return +[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", [v5 path]);
  }

  else
  {
    return 0LL;
  }

@end