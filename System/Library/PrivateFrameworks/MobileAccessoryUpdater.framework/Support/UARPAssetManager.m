@interface UARPAssetManager
- (BOOL)getFetchedSupportedAccessories:(id)a3 forProductGroup:(id)a4;
- (BOOL)isAccessoryInfoAvailable:(id)a3;
- (BOOL)isAssetLookupComplete:(id)a3 forAccessory:(id)a4;
- (NSMutableSet)accessories;
- (UARPAssetManager)initWithDelegate:(id)a3;
- (id)containerIDForAssetID:(id)a3;
- (id)copyAssetIDForAccessoryID:(id)a3;
- (id)createUARPAccessoryInternalFromArchivedData:(id)a3;
- (id)getAttestationCertificates:(id)a3;
- (id)getSupplementalAssetNameForAccessoryID:(id)a3;
- (id)getUARPAccessoryInternalForUARPAccessoryID:(id)a3;
- (int64_t)addAccessoryID:(id)a3 assetID:(id)a4;
- (int64_t)changeAssetLocation:(id)a3 assetID:(id)a4;
- (int64_t)checkForUpdate:(id)a3;
- (int64_t)downloadFirmwareForAccessory:(id)a3 assetID:(id)a4 userIntent:(BOOL)a5;
- (int64_t)downloadFirmwareFromLocalPathForAccessory:(id)a3 assetID:(id)a4;
- (int64_t)downloadReleaseNotesForAccessoryID:(id)a3 assetID:(id)a4;
- (int64_t)downloadReleaseNotesFromLocalPathForAccessory:(id)a3 assetID:(id)a4;
- (int64_t)getAttestationCertificates:(id)a3 assetID:(id)a4;
- (int64_t)getSupportedAccessories:(id)a3 assetID:(id)a4 batchRequest:(BOOL)a5;
- (int64_t)performLocalUpdateCheckForAccessory:(id)a3;
- (int64_t)performRemoteUpdateCheckForAccessoryID:(id)a3;
- (int64_t)personalizationVectorForAccessoryID:(id)a3 assetTag:(unsigned int)a4 outVector:(unsigned int *)a5;
- (int64_t)purgeAccessoryID:(id)a3;
- (int64_t)qCheckDropBoxForAccessory:(id)a3;
- (int64_t)removeAccessoryID:(id)a3;
- (int64_t)removeAccessoryIDInternal:(id)a3;
- (int64_t)updateProperty:(unint64_t)a3 value:(id)a4 forAccessory:(id)a5;
- (void)allowConditionalDownloadOnCellular;
- (void)assetAvailabilityUpdateForAccessory:(id)a3 assetID:(id)a4 downstreamAppleModelNumber:(id)a5;
- (void)attestationCertificates:(id)a3 forSubjectKeyIdentifier:(id)a4;
- (void)cacheAccessoryID:(id)a3;
- (void)checkForPreInstalledFirmware;
- (void)checkForUpdateIfPossible:(id)a3;
- (void)createTemporaryFolder:(id)a3;
- (void)createTemporaryFolders;
- (void)dealloc;
- (void)handlePeriodicLaunch;
- (void)handlePeriodicLaunchInternal;
- (void)postActiveFirmwareAnalyticsEventForAccessoryID:(id)a3;
- (void)postFirmwareUpdateAppliedNotificationForAccessoryID:(id)a3;
- (void)postUrgentFirmwareUpdateAppliedNotificationForAccessoryID:(id)a3 assetID:(id)a4;
- (void)removeAccessoryIDFromCache:(id)a3;
- (void)sendUpdateFirmwareAnalyticsEventForAccessoryID:(id)a3 assetID:(id)a4 params:(id)a5;
- (void)setAccessories:(id)a3;
- (void)settingsChangedForSerialNumber:(id)a3;
- (void)supplementalAssetAvailabilityUpdateForAccessory:(id)a3 assetName:(id)a4;
- (void)supportedAccessories:(id)a3 forProductGroup:(id)a4 isComplete:(BOOL)a5;
- (void)updateCacheForAccessory:(id)a3 addAccessory:(BOOL)a4;
- (void)updateSettingsDatabaseForAccessory:(id)a3;
@end

@implementation UARPAssetManager

- (UARPAssetManager)initWithDelegate:(id)a3
{
  if (a3)
  {
    if ([a3 conformsToProtocol:&OBJC_PROTOCOL___UARPAssetManagerDelegate])
    {
      v14.receiver = self;
      v14.super_class = (Class)&OBJC_CLASS___UARPAssetManager;
      v5 = -[UARPAssetManager init](&v14, "init");
      self = v5;
      if (v5)
      {
        v5->_delegate = (UARPAssetManagerDelegate *)a3;
        v5->_log = os_log_create("com.apple.accessoryupdater.uarp", "assetManager");
        uint64_t v6 = UARPStringTempFilesFilepath();
        v13 = 0LL;
        -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v6,  &v13);
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&buf[4] = "-[UARPAssetManager initWithDelegate:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v6;
          *(_WORD *)&buf[22] = 2112;
          v17 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "%s: Cleared directory at path %@ with error %@",  buf,  0x20u);
        }

        uint64_t v8 = UARPStringDynamicAssetsFilepath();
        -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v8,  &v13);
        v9 = self->_log;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&buf[4] = "-[UARPAssetManager initWithDelegate:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v8;
          *(_WORD *)&buf[22] = 2112;
          v17 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s: Cleared directory at path %@ with error %@",  buf,  0x20u);
        }

        -[UARPAssetManager checkForPreInstalledFirmware](self, "checkForPreInstalledFirmware");
        sub_10003BCD0();
        self->_accessories = +[NSMutableSet setWithArray:]( NSMutableSet,  "setWithArray:",  objc_msgSend( +[UARPDatabase sharedDatabase](UARPDatabase, "sharedDatabase"),  "activeAccessories"));
        self->_workQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.aam.uarpAssetManager", 0LL);
        self->_delegateQueue = (OS_dispatch_queue *)dispatch_queue_create( "com.apple.aam.uarpAssetManager.delegate",  0LL);
        self->_mobileAssetManager = -[UARPMobileAssetManager initWithManager:queue:]( objc_alloc(&OBJC_CLASS___UARPMobileAssetManager),  "initWithManager:queue:",  self,  self->_workQueue);
        *(void *)buf = 0LL;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3052000000LL;
        v17 = sub_10002AF48;
        v18 = sub_10002AF58;
        v10 = (objc_class *)qword_10008E390;
        uint64_t v19 = qword_10008E390;
        if (!qword_10008E390)
        {
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472LL;
          v15[2] = sub_10002CFAC;
          v15[3] = &unk_100075AD0;
          v15[4] = buf;
          sub_10002CFAC((uint64_t)v15);
          v10 = *(objc_class **)(*(void *)&buf[8] + 40LL);
        }

        _Block_object_dispose(buf, 8);
        v11 = (UARPiCloudAssetManager *)[[v10 alloc] initWithManager:self];
        self->_iCloudAssetManager = v11;
        -[UARPiCloudAssetManager cleanupAssetCache](v11, "cleanupAssetCache");
        self->_productGroupToSupportedAccessoriesMap = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        self->_isSupportedAccessoriesFetchComplete = 1;
        self->_subjectKeyIdentifierToAttestationCertificatesMap = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        -[UARPAssetManager allowConditionalDownloadOnCellular](self, "allowConditionalDownloadOnCellular");
        if (notify_register_check( "com.apple.accessoryUpdater.uarp.firmareUpdateApplied",  &self->_firmwareUpdateNotificationToken))
        {
          if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
            sub_10004A40C();
          }
          self->_firmwareUpdateNotificationToken = -1;
        }

        if (notify_register_check( "com.apple.accessoryUpdater.uarp.urgentFirmwareUpdateApplied",  &self->_urgentFirmwareUpdateNotificationToken))
        {
          if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
            sub_10004A38C();
          }
          self->_urgentFirmwareUpdateNotificationToken = -1;
        }

        -[UARPAssetManager createTemporaryFolders](self, "createTemporaryFolders");
      }
    }
  }

  return self;
}

- (void)dealloc
{
  workQueue = (dispatch_object_s *)self->_workQueue;
  if (workQueue)
  {
    dispatch_release(workQueue);
    self->_workQueue = 0LL;
  }

  int urgentFirmwareUpdateNotificationToken = self->_urgentFirmwareUpdateNotificationToken;
  if (urgentFirmwareUpdateNotificationToken != -1) {
    notify_cancel(urgentFirmwareUpdateNotificationToken);
  }
  int firmwareUpdateNotificationToken = self->_firmwareUpdateNotificationToken;
  if (firmwareUpdateNotificationToken != -1) {
    notify_cancel(firmwareUpdateNotificationToken);
  }
  self->_isSupportedAccessoriesFetchComplete = 1;

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UARPAssetManager;
  -[UARPAssetManager dealloc](&v6, "dealloc");
}

- (void)checkForPreInstalledFirmware
{
  v3 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  v4 = (void *)kUARPStandaloneFirmwareDirectory;
  v5 = -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:]( v3,  "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:",  +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", kUARPStandaloneFirmwareDirectory),  0LL,  0LL,  0LL);
  id v6 = -[NSDirectoryEnumerator nextObject](v5, "nextObject");
  if (v6)
  {
    id v8 = v6;
    v9 = (void *)kUARPFirmwareDropboxDirectory;
    *(void *)&__int128 v7 = 136315650LL;
    __int128 v19 = v7;
    do
    {
      if (!objc_msgSend(v8, "hasDirectoryPath", v19))
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v22 = "-[UARPAssetManager checkForPreInstalledFirmware]";
          __int16 v23 = 2114;
          id v24 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "%s: Found preinstalled file: %{public}@",  buf,  0x16u);
        }

        id v11 = objc_msgSend( v9,  "stringByAppendingPathComponent:",  objc_msgSend(objc_msgSend(v8, "path"), "substringFromIndex:", objc_msgSend(v4, "length")));
        if (-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( v3,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  [v11 stringByDeletingLastPathComponent],  1,  0,  &v20))
        {
          if (!-[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v11,  &v20))
          {
            v12 = self->_log;
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v19;
              v22 = "-[UARPAssetManager checkForPreInstalledFirmware]";
              __int16 v23 = 2114;
              id v24 = v11;
              __int16 v25 = 2114;
              uint64_t v26 = v20;
              _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s: Failed to delete file at path %{public}@ with error %{public}@",  buf,  0x20u);
            }
          }

          unsigned __int8 v13 = -[NSFileManager copyItemAtPath:toPath:error:]( v3,  "copyItemAtPath:toPath:error:",  [v8 path],  v11,  &v20);
          objc_super v14 = self->_log;
          if ((v13 & 1) != 0)
          {
            if (os_log_type_enabled(self->_log, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v22 = "-[UARPAssetManager checkForPreInstalledFirmware]";
              __int16 v23 = 2114;
              id v24 = v8;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s: Copied firmware from path %{public}@",  buf,  0x16u);
            }

            goto LABEL_16;
          }

          if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            v22 = "-[UARPAssetManager checkForPreInstalledFirmware]";
            __int16 v23 = 2114;
            id v24 = v8;
            __int16 v25 = 2114;
            uint64_t v26 = v20;
            v17 = v14;
            v18 = "%s: Failed to copy from path %{public}@ error: %{public}@";
            goto LABEL_19;
          }
        }

        else
        {
          v15 = self->_log;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            id v16 = [v11 stringByDeletingLastPathComponent];
            *(_DWORD *)buf = v19;
            v22 = "-[UARPAssetManager checkForPreInstalledFirmware]";
            __int16 v23 = 2114;
            id v24 = v16;
            __int16 v25 = 2114;
            uint64_t v26 = v20;
            v17 = v15;
            v18 = "%s: Failed to create dir %{public}@ error: %{public}@";
LABEL_19:
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v18, buf, 0x20u);
          }
        }
      }

- (void)postFirmwareUpdateAppliedNotificationForAccessoryID:(id)a3
{
  if (self->_firmwareUpdateNotificationToken != -1)
  {
    if ([a3 capability])
    {
      notify_set_state(self->_firmwareUpdateNotificationToken, (uint64_t)[a3 capability]);
      notify_post("com.apple.accessoryUpdater.uarp.firmareUpdateApplied");
    }
  }

- (void)postUrgentFirmwareUpdateAppliedNotificationForAccessoryID:(id)a3 assetID:(id)a4
{
  if (self->_urgentFirmwareUpdateNotificationToken != -1)
  {
    if (objc_msgSend(a4, "isUrgentUpdate", a3))
    {
      notify_set_state(self->_urgentFirmwareUpdateNotificationToken, 0LL);
      notify_post("com.apple.accessoryUpdater.uarp.urgentFirmwareUpdateApplied");
    }
  }

- (BOOL)isAccessoryInfoAvailable:(id)a3
{
  if (![a3 firmwareVersion])
  {
    log = self->_log;
    BOOL v5 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
    if (!v5) {
      return v5;
    }
    int v9 = 138412290;
    id v10 = a3;
    __int128 v7 = "Do not check asset server yet, waiting for firmware version %@";
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v9, 0xCu);
    LOBYTE(v5) = 0;
    return v5;
  }

  if ([a3 productGroup] && objc_msgSend(a3, "productNumber")) {
    goto LABEL_6;
  }
  if (![a3 hwFusingType])
  {
    log = self->_log;
    BOOL v5 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
    if (!v5) {
      return v5;
    }
    int v9 = 138412290;
    id v10 = a3;
    __int128 v7 = "Do not check asset server yet, waiting for HW Fusing %@";
    goto LABEL_13;
  }

  if (![a3 hwRevision])
  {
    log = self->_log;
    BOOL v5 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
    if (!v5) {
      return v5;
    }
    int v9 = 138412290;
    id v10 = a3;
    __int128 v7 = "Do not check asset server yet, waiting for HW Revision %@";
    goto LABEL_13;
  }

- (int64_t)addAccessoryID:(id)a3 assetID:(id)a4
{
  if (a3)
  {
    workQueue = (dispatch_queue_s *)self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100028EE8;
    block[3] = &unk_1000754F8;
    block[4] = a3;
    block[5] = a4;
    block[6] = self;
    dispatch_sync(workQueue, block);
  }

  return 0LL;
}

- (int64_t)performRemoteUpdateCheckForAccessoryID:(id)a3
{
  id v4 = -[UARPAssetManager getUARPAccessoryInternalForUARPAccessoryID:]( self,  "getUARPAccessoryInternalForUARPAccessoryID:");
  if (!v4 || !self->_delegate) {
    return 1LL;
  }
  BOOL v5 = v4;
  if (![v4 assetID]) {
    return 4LL;
  }
  if (sub_100003828([v5 accessoryID]))
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10004A48C();
    }
    return 1LL;
  }

  int64_t result = -[UARPAssetManager qCheckDropBoxForAccessory:](self, "qCheckDropBoxForAccessory:", v5);
  if (result == 1)
  {
    switch((unint64_t)objc_msgSend(objc_msgSend(v5, "assetID"), "type"))
    {
      case 0uLL:
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          LOWORD(v11) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Local File path check requested",  (uint8_t *)&v11,  2u);
        }

        int64_t result = -[UARPAssetManager performLocalUpdateCheckForAccessory:]( self,  "performLocalUpdateCheckForAccessory:",  v5);
        break;
      case 1uLL:
      case 2uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
      case 8uLL:
      case 0xFuLL:
        __int128 v7 = self->_log;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          LOWORD(v11) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Remote check on iCloud requested",  (uint8_t *)&v11,  2u);
        }

        -[UARPiCloudAssetManager performRemoteUpdateCheckForAccessories:inContainer:]( self->_iCloudAssetManager,  "performRemoteUpdateCheckForAccessories:inContainer:",  +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v5),  -[UARPAssetManager containerIDForAssetID:](self, "containerIDForAssetID:", [v5 assetID]));
        return 1LL;
      case 3uLL:
      case 0xBuLL:
      case 0xCuLL:
      case 0xDuLL:
      case 0xEuLL:
        id v8 = self->_log;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          int v11 = 136315138;
          uint64_t v12 = UARPAssetLocationTypeToString(objc_msgSend(objc_msgSend(v5, "assetID"), "type"));
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Remote check on %s requested",  (uint8_t *)&v11,  0xCu);
        }

        int64_t result = -[UARPMobileAssetManager performRemoteUpdateCheckForAccessory:]( self->_mobileAssetManager,  "performRemoteUpdateCheckForAccessory:",  v5);
        break;
      case 0x11uLL:
        if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
          sub_10004A55C();
        }
        return 1LL;
      default:
        id v10 = self->_log;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_10004A4F0(v5, (const char *)v10);
        }
        return 1LL;
    }
  }

  return result;
}

- (int64_t)performLocalUpdateCheckForAccessory:(id)a3
{
  if (!objc_msgSend(objc_msgSend(a3, "assetID"), "remoteURL"))
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10004A5C0(a3);
    }
    goto LABEL_14;
  }

  BOOL v5 = sub_10000EA98((uint64_t)objc_msgSend(objc_msgSend(objc_msgSend(a3, "assetID"), "remoteURL"), "path"));
  if (!v5)
  {
    log = (char *)self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_10004A62C(a3, log);
    }
LABEL_14:
    objc_msgSend(objc_msgSend(a3, "assetID"), "setUpdateAvailabilityStatus:", 6);
    int64_t v13 = 1LL;
    goto LABEL_18;
  }

  id v6 = v5;
  objc_msgSend(objc_msgSend(a3, "assetID"), "setUpdateAvailabilityStatus:", 1);
  objc_msgSend(objc_msgSend(a3, "assetID"), "setDownloadStatus:", 0);
  objc_msgSend(objc_msgSend(a3, "assetID"), "setAssetVersion:", v6);
  objc_msgSend(a3, "analyticsSetDownloadAvailableForAssetID:", objc_msgSend(a3, "assetID"));
  objc_msgSend(a3, "analyticsSetDownloadConsentRequestedForAssetID:", objc_msgSend(a3, "assetID"));
  __int128 v7 = self->_log;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543874;
    id v16 = v6;
    __int16 v17 = 2114;
    id v18 = objc_msgSend(objc_msgSend(a3, "assetID"), "remoteURL");
    __int16 v19 = 2114;
    id v20 = [a3 accessoryID];
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Found firmware version %{public}@ from url %{public}@ provided by client for accessory %{public}@",  (uint8_t *)&v15,  0x20u);
  }

  if (objc_msgSend(objc_msgSend(a3, "assetID"), "releaseNotesRemoteURL"))
  {
    unsigned int v8 = -[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "fileExistsAtPath:",  objc_msgSend(objc_msgSend(objc_msgSend(a3, "assetID"), "releaseNotesRemoteURL"), "path"));
    int v9 = self->_log;
    if (v8)
    {
      if (os_log_type_enabled(self->_log, OS_LOG_TYPE_INFO))
      {
        id v10 = (NSMutableString *)objc_msgSend(objc_msgSend(a3, "assetID"), "releaseNotesRemoteURL");
        id v11 = [a3 accessoryID];
        int v15 = 138412546;
        id v16 = v10;
        __int16 v17 = 2112;
        id v18 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Found release notes from url %@ provided by client for accessory %@",  (uint8_t *)&v15,  0x16u);
      }

      objc_msgSend(objc_msgSend(a3, "assetID"), "setReleaseNotesAvailabilityStatus:", 1);
      objc_msgSend(objc_msgSend(a3, "assetID"), "setReleaseNotesDownloadStatus:", 0);
    }

    else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_10004A6AC(a3, (char *)v9);
    }
  }

  int64_t v13 = 0LL;
LABEL_18:
  -[UARPAssetManager assetAvailabilityUpdateForAccessory:assetID:downstreamAppleModelNumber:]( self,  "assetAvailabilityUpdateForAccessory:assetID:downstreamAppleModelNumber:",  [a3 accessoryID],  objc_msgSend(a3, "assetID"),  0);
  return v13;
}

- (int64_t)downloadFirmwareForAccessory:(id)a3 assetID:(id)a4 userIntent:(BOOL)a5
{
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  uint64_t v20 = 0LL;
  if (!a3)
  {
    log = self->_log;
    if (!os_log_type_enabled(log, OS_LOG_TYPE_INFO)) {
      goto LABEL_6;
    }
    *(_WORD *)buf = 0;
    int64_t v13 = "accessoryID = nil";
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, v13, buf, 2u);
    goto LABEL_6;
  }

  if (!a4)
  {
    log = self->_log;
    if (!os_log_type_enabled(log, OS_LOG_TYPE_INFO)) {
      goto LABEL_6;
    }
    *(_WORD *)buf = 0;
    int64_t v13 = "assetID = nil";
    goto LABEL_15;
  }

  if (![a4 remoteURL])
  {
    log = self->_log;
    if (!os_log_type_enabled(log, OS_LOG_TYPE_INFO)) {
      goto LABEL_6;
    }
    *(_WORD *)buf = 0;
    int64_t v13 = "assetID.remoteURL = nil";
    goto LABEL_15;
  }

  if (!self->_delegate)
  {
    log = self->_log;
    if (!os_log_type_enabled(log, OS_LOG_TYPE_INFO)) {
      goto LABEL_6;
    }
    *(_WORD *)buf = 0;
    int64_t v13 = "_delegate = nil";
    goto LABEL_15;
  }

  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100029880;
  block[3] = &unk_1000759B8;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  void block[7] = &v17;
  BOOL v15 = a5;
  dispatch_sync(workQueue, block);
LABEL_6:
  int64_t v10 = v18[3];
  _Block_object_dispose(&v17, 8);
  return v10;
}

- (int64_t)downloadFirmwareFromLocalPathForAccessory:(id)a3 assetID:(id)a4
{
  __int128 v7 = +[NSURL fileURLWithPath:]( NSURL,  "fileURLWithPath:",  objc_msgSend(objc_msgSend(a4, "remoteURL"), "path"));
  unsigned int v8 = sub_10000DD5C( v7,  (uint64_t)[a3 identifier],  objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType"),  objc_msgSend(a4, "assetVersion"));
  log = self->_log;
  BOOL v10 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      int v14 = 138412290;
      int64_t v15 = (int64_t)v8;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "File created %@", (uint8_t *)&v14, 0xCu);
    }

    [a4 setLocalURL:v8];
    [a4 setDownloadStatus:1];
    [a4 setUpdateAvailabilityStatus:3];
    [a3 analyticsSetDownloadCompleteForAssetID:a4 status:1];
    [a3 setAssetID:a4];
    int64_t v11 = 0LL;
  }

  else
  {
    if (v10)
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Firmware download failed", (uint8_t *)&v14, 2u);
    }

    [a4 setDownloadStatus:2];
    int64_t v11 = 1LL;
  }

  uint64_t v12 = self->_log;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v14 = 134217984;
    int64_t v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "uarpError = %ld", (uint8_t *)&v14, 0xCu);
  }

  if ((objc_opt_respondsToSelector(self->_delegate, "removeSandboxExtensionWithURL:") & 1) != 0) {
    -[UARPAssetManagerDelegate removeSandboxExtensionWithURL:](self->_delegate, "removeSandboxExtensionWithURL:", v7);
  }
  -[UARPAssetManager assetAvailabilityUpdateForAccessory:assetID:downstreamAppleModelNumber:]( self,  "assetAvailabilityUpdateForAccessory:assetID:downstreamAppleModelNumber:",  [a3 accessoryID],  a4,  0);
  return v11;
}

- (int64_t)downloadReleaseNotesForAccessoryID:(id)a3 assetID:(id)a4
{
  uint64_t v14 = 0LL;
  int64_t v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  uint64_t v17 = 0LL;
  if (!a3)
  {
    log = self->_log;
    if (!os_log_type_enabled(log, OS_LOG_TYPE_INFO)) {
      goto LABEL_6;
    }
    *(_WORD *)buf = 0;
    int64_t v11 = "accessoryID = nil";
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, v11, buf, 2u);
    goto LABEL_6;
  }

  if (!a4)
  {
    log = self->_log;
    if (!os_log_type_enabled(log, OS_LOG_TYPE_INFO)) {
      goto LABEL_6;
    }
    *(_WORD *)buf = 0;
    int64_t v11 = "assetID = nil";
    goto LABEL_15;
  }

  if (![a4 releaseNotesRemoteURL])
  {
    log = self->_log;
    if (!os_log_type_enabled(log, OS_LOG_TYPE_INFO)) {
      goto LABEL_6;
    }
    *(_WORD *)buf = 0;
    int64_t v11 = "assetID.releaseNotesRemoteURL = nil";
    goto LABEL_15;
  }

  if (!self->_delegate)
  {
    log = self->_log;
    if (!os_log_type_enabled(log, OS_LOG_TYPE_INFO)) {
      goto LABEL_6;
    }
    *(_WORD *)buf = 0;
    int64_t v11 = "_delegate = nil";
    goto LABEL_15;
  }

  workQueue = (dispatch_queue_s *)self->_workQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100029E3C;
  v12[3] = &unk_1000759E0;
  v12[4] = self;
  v12[5] = a3;
  v12[6] = a4;
  v12[7] = &v14;
  dispatch_sync(workQueue, v12);
LABEL_6:
  int64_t v8 = v15[3];
  _Block_object_dispose(&v14, 8);
  return v8;
}

- (int64_t)downloadReleaseNotesFromLocalPathForAccessory:(id)a3 assetID:(id)a4
{
  __int128 v7 = sub_10000DD5C( +[NSURL fileURLWithPath:]( NSURL,  "fileURLWithPath:",  objc_msgSend(objc_msgSend(a4, "releaseNotesRemoteURL"), "path")),  (uint64_t)objc_msgSend(a3, "identifier"),  objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType"),  objc_msgSend(a4, "assetVersion"));
  log = self->_log;
  BOOL v9 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      int64_t v18 = (int64_t)v7;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "File created %@", buf, 0xCu);
    }

    [a4 setReleaseNotesLocalURL:v7];
    int64_t v10 = 0LL;
    uint64_t v11 = 3LL;
    uint64_t v12 = 1LL;
  }

  else if (v9)
  {
    *(_WORD *)buf = 0;
    int64_t v10 = 1LL;
    uint64_t v12 = 2LL;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Firmware download failed", buf, 2u);
    uint64_t v11 = 0LL;
  }

  else
  {
    uint64_t v11 = 0LL;
    int64_t v10 = 1LL;
    uint64_t v12 = 2LL;
  }

  [a4 setReleaseNotesDownloadStatus:v12];
  [a4 setReleaseNotesAvailabilityStatus:v11];
  [a3 setAssetID:a4];
  int64_t v13 = self->_log;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v18 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "uarpError = %ld, calling delegate in 5 sec",  buf,  0xCu);
  }

  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002A1B8;
  block[3] = &unk_1000754F8;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(workQueue, block);
  return v10;
}

- (int64_t)removeAccessoryIDInternal:(id)a3
{
  id v5 = -[UARPAssetManager getUARPAccessoryInternalForUARPAccessoryID:]( self,  "getUARPAccessoryInternalForUARPAccessoryID:");
  if (v5)
  {
    id v6 = v5;
    sub_1000039D4(a3, 0);
    -[NSMutableSet removeObject:](self->_accessories, "removeObject:", v6);
    -[UARPAssetManager removeAccessoryIDFromCache:](self, "removeAccessoryIDFromCache:", a3);
    objc_msgSend( +[UARPDatabase sharedDatabase](UARPDatabase, "sharedDatabase"),  "removeActiveAccessoryForUUID:",  objc_msgSend(a3, "uuid"));
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      uint64_t v12 = (const char *)a3;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Accessory removed: %@", (uint8_t *)&v11, 0xCu);
    }

    return 0LL;
  }

  else
  {
    BOOL v9 = self->_log;
    int64_t v8 = 1LL;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315394;
      uint64_t v12 = "-[UARPAssetManager removeAccessoryIDInternal:]";
      __int16 v13 = 2112;
      id v14 = a3;
      int64_t v8 = 1LL;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s: Unknown UARPAccessoryID %@, dropping it",  (uint8_t *)&v11,  0x16u);
    }
  }

  return v8;
}

- (int64_t)removeAccessoryID:(id)a3
{
  uint64_t v7 = 0LL;
  int64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v10 = 0LL;
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002A3E8;
  block[3] = &unk_100075858;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(workQueue, block);
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (int64_t)purgeAccessoryID:(id)a3
{
  return 0LL;
}

- (void)updateSettingsDatabaseForAccessory:(id)a3
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002A47C;
  v4[3] = &unk_1000754A8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(workQueue, v4);
}

- (int64_t)checkForUpdate:(id)a3
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002A4E4;
  v5[3] = &unk_1000754A8;
  v5[4] = self;
  v5[5] = a3;
  dispatch_async(workQueue, v5);
  return 0LL;
}

- (void)handlePeriodicLaunch
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002A548;
  block[3] = &unk_100074F50;
  block[4] = self;
  dispatch_sync(workQueue, block);
}

- (void)handlePeriodicLaunchInternal
{
  id v3 = +[UARPDatabase sharedDatabase](&OBJC_CLASS___UARPDatabase, "sharedDatabase");
  id v4 = [v3 periodicLaunchAccessories];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[UARPAssetManager handlePeriodicLaunchInternal]";
    __int16 v32 = 2112;
    id v33 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "%s: Periodic launch accessories in database %@",  buf,  0x16u);
  }

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v6 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        if (-[UARPAssetManager isAccessoryInfoAvailable:]( self,  "isAccessoryInfoAvailable:",  [v10 accessoryID]))
        {
          -[UARPAssetManager postActiveFirmwareAnalyticsEventForAccessoryID:]( self,  "postActiveFirmwareAnalyticsEventForAccessoryID:",  [v10 accessoryID]);
        }
      }

      id v7 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }

    while (v7);
  }

  uint64_t v19 = v3;
  id v11 = [v3 activeAccessories];
  uint64_t v12 = self->_log;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[UARPAssetManager handlePeriodicLaunchInternal]";
    __int16 v32 = 2112;
    id v33 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s: Active accessories in database %@",  buf,  0x16u);
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (j = 0LL; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)j);
        if (objc_msgSend( objc_msgSend( +[UARPSupportedAccessory findByAppleModelNumber:]( UARPSupportedAccessory,  "findByAppleModelNumber:",  objc_msgSend(objc_msgSend(v17, "accessoryID"), "modelNumber")),  "downstreamAppleModelNumbers"),  "count"))
        {
          objc_msgSend(objc_msgSend(v17, "assetID"), "restoreDefaultStatus");
        }

        if (!objc_msgSend(objc_msgSend(v17, "accessoryID"), "productGroup")
          && !objc_msgSend(objc_msgSend(v17, "accessoryID"), "productNumber"))
        {
          int64_t v18 = self->_log;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v31 = "-[UARPAssetManager handlePeriodicLaunchInternal]";
            __int16 v32 = 2112;
            id v33 = v17;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s: Periodic Asset Check for %@",  buf,  0x16u);
          }

          -[UARPAssetManager checkForUpdateIfPossible:]( self,  "checkForUpdateIfPossible:",  [v17 accessoryID]);
        }
      }

      id v14 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }

    while (v14);
  }

  [v19 purgePeriodicLaunchCache];
}

- (void)postActiveFirmwareAnalyticsEventForAccessoryID:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___UARPActiveFirmwareAnalyticsEvent);
  -[UARPActiveFirmwareAnalyticsEvent updateWithAccessoryID:](v4, "updateWithAccessoryID:", a3);
  -[UARPActiveFirmwareAnalyticsEvent send](v4, "send");
}

- (int64_t)changeAssetLocation:(id)a3 assetID:(id)a4
{
  int64_t v4 = 5LL;
  if (a3 && a4)
  {
    uint64_t v8 = 0LL;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2020000000LL;
    uint64_t v11 = 0LL;
    workQueue = (dispatch_queue_s *)self->_workQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10002A990;
    v7[3] = &unk_1000759E0;
    v7[4] = self;
    v7[5] = a3;
    v7[6] = a4;
    v7[7] = &v8;
    dispatch_sync(workQueue, v7);
    int64_t v4 = v9[3];
    _Block_object_dispose(&v8, 8);
  }

  return v4;
}

- (int64_t)qCheckDropBoxForAccessory:(id)a3
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v17 = 138412290;
    id v18 = [a3 accessoryID];
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Checking Dropbox for accessory %@",  (uint8_t *)&v17,  0xCu);
  }

  if ([a3 assetID])
  {
    [a3 checkDropbox];
    sub_1000038E0([a3 accessoryID], 0);
    if ([a3 dropboxFirmwarePath])
    {
      -[UARPMobileAssetManager updateSettingsDatabaseForAccessory:]( self->_mobileAssetManager,  "updateSettingsDatabaseForAccessory:",  a3);
      id v6 = sub_10000EA98((uint64_t)[a3 dropboxFirmwarePath]);
      id v7 = self->_log;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = [a3 dropboxFirmwarePath];
        id v9 = [a3 accessoryID];
        int v17 = 138412802;
        id v18 = v8;
        __int16 v19 = 2112;
        __int128 v20 = v6;
        __int16 v21 = 2112;
        id v22 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Found firmware %@ version %@ in Dropbox for accessory %@",  (uint8_t *)&v17,  0x20u);
      }

      objc_msgSend(objc_msgSend(a3, "assetID"), "setLocalURL:", 0);
      objc_msgSend( objc_msgSend(a3, "assetID"),  "setRemoteURL:",  +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", objc_msgSend(a3, "dropboxFirmwarePath")));
      objc_msgSend(objc_msgSend(a3, "assetID"), "setDownloadStatus:", 0);
      objc_msgSend(objc_msgSend(a3, "assetID"), "setUpdateAvailabilityStatus:", 4);
      objc_msgSend(objc_msgSend(a3, "assetID"), "setAssetVersion:", v6);
      objc_msgSend(a3, "analyticsSetDownloadAvailableForAssetID:", objc_msgSend(a3, "assetID"));
      objc_msgSend(a3, "analyticsSetDownloadConsentRequestedForAssetID:", objc_msgSend(a3, "assetID"));
      if ([a3 dropboxReleaseNotesPath])
      {
        uint64_t v10 = self->_log;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          id v11 = [a3 dropboxReleaseNotesPath];
          uint64_t v12 = (NSMutableString *)[a3 accessoryID];
          int v17 = 138412546;
          id v18 = v11;
          __int16 v19 = 2112;
          __int128 v20 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Found release notes %@ in Dropbox for accessory %@",  (uint8_t *)&v17,  0x16u);
        }

        objc_msgSend( objc_msgSend(a3, "assetID"),  "setReleaseNotesRemoteURL:",  +[NSURL fileURLWithPath:]( NSURL,  "fileURLWithPath:",  objc_msgSend(a3, "dropboxReleaseNotesPath")));
        objc_msgSend(objc_msgSend(a3, "assetID"), "setReleaseNotesDownloadStatus:", 0);
        objc_msgSend(objc_msgSend(a3, "assetID"), "setReleaseNotesAvailabilityStatus:", 4);
      }

      sub_1000038E0([a3 accessoryID], v6);
      -[UARPAssetManager assetAvailabilityUpdateForAccessory:assetID:downstreamAppleModelNumber:]( self,  "assetAvailabilityUpdateForAccessory:assetID:downstreamAppleModelNumber:",  [a3 accessoryID],  objc_msgSend(a3, "assetID"),  0);
      return 0LL;
    }

    int64_t v13 = 1LL;
  }

  else
  {
    int64_t v13 = 4LL;
  }

  uint64_t v15 = self->_log;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = [a3 accessoryID];
    int v17 = 138412290;
    id v18 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "No firmware found in Dropbox for accessory %@",  (uint8_t *)&v17,  0xCu);
  }

  return v13;
}

- (id)getUARPAccessoryInternalForUARPAccessoryID:(id)a3
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3052000000LL;
  uint64_t v10 = sub_10002AF48;
  id v11 = sub_10002AF58;
  uint64_t v12 = 0LL;
  accessories = self->_accessories;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10002AF64;
  v6[3] = &unk_100075A08;
  v6[4] = a3;
  v6[5] = &v7;
  -[NSMutableSet enumerateObjectsUsingBlock:](accessories, "enumerateObjectsUsingBlock:", v6);
  int64_t v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)allowConditionalDownloadOnCellular
{
  if ((MGGetBoolAnswer(@"InternalBuild", a2) & 1) != 0
    || !-[UARPMobileAssetManager isRoamingEnabled](self->_mobileAssetManager, "isRoamingEnabled"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      id v5 = "-[UARPAssetManager allowConditionalDownloadOnCellular]";
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "%s: UARP MA Download On cellular allowed",  (uint8_t *)&v4,  0xCu);
    }

    -[UARPMobileAssetManager setUarpDownloadOnCellularAllowed:]( self->_mobileAssetManager,  "setUarpDownloadOnCellularAllowed:",  1LL);
  }

- (id)createUARPAccessoryInternalFromArchivedData:(id)a3
{
  uint64_t v9 = 0LL;
  id v3 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___UARPAccessoryID),  a3,  &v9);
  int v4 = v3;
  if (v3)
  {
    if (-[UARPAccessoryInternal productGroup](v3, "productGroup")
      && -[UARPAccessoryInternal productNumber](v4, "productNumber"))
    {
      uint64_t v5 = 1LL;
    }

    else
    {
      uint64_t v5 = 3LL;
    }

    id v6 = -[UARPAssetID initWithLocationType:remoteURL:]( objc_alloc(&OBJC_CLASS___UARPAssetID),  "initWithLocationType:remoteURL:",  v5,  0LL);
    if (v6)
    {
      uint64_t v7 = v6;
      int v4 = -[UARPAccessoryInternal initWithAccessoryID:assetID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryInternal),  "initWithAccessoryID:assetID:",  v4,  v6);
    }

    else
    {
      return 0LL;
    }
  }

  return v4;
}

- (void)updateCacheForAccessory:(id)a3 addAccessory:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  uint64_t v34 = 0LL;
  uint64_t v7 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a3,  1LL,  &v34);
  if (v7)
  {
    id v8 = v7;
    id v9 = sub_10000EBD0();
    BOOL v28 = v4;
    if (v9) {
      id v10 = [v9 mutableCopy];
    }
    else {
      id v10 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    }
    id v11 = v10;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v12 = [v10 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v31;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v30 + 1) + 8LL * (void)i);
          id v17 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___UARPAccessoryID),  v16,  &v34);
          if (!v17)
          {
            log = self->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              __int128 v20 = log;
              __int16 v21 = "Found invalid cachedAccessoryIDData in Cache, removing";
              uint32_t v22 = 2;
LABEL_17:
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, v21, buf, v22);
            }

- (void)cacheAccessoryID:(id)a3
{
}

- (void)removeAccessoryIDFromCache:(id)a3
{
}

- (id)containerIDForAssetID:(id)a3
{
  switch((unint64_t)[a3 type])
  {
    case 1uLL:
      uint64_t v5 = "com.apple.uarp";
      goto LABEL_13;
    case 2uLL:
      uint64_t v5 = "com.apple.uarp.staging";
      goto LABEL_13;
    case 5uLL:
      uint64_t v5 = "com.apple.uarp.uat";
      goto LABEL_13;
    case 6uLL:
      uint64_t v5 = "com.apple.uarp.staging.uat";
      goto LABEL_13;
    case 7uLL:
      uint64_t v5 = "com.apple.uarp.beta";
      goto LABEL_13;
    case 8uLL:
      uint64_t v5 = "com.apple.uarp.staging.beta";
      goto LABEL_13;
    case 0xFuLL:
      uint64_t v5 = "com.apple.chip";
      goto LABEL_13;
    case 0x10uLL:
      uint64_t v5 = "com.apple.chip.staging";
LABEL_13:
      id result = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v5);
      break;
    default:
      if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
        sub_10004A91C(a3);
      }
      id result = 0LL;
      break;
  }

  return result;
}

- (int64_t)personalizationVectorForAccessoryID:(id)a3 assetTag:(unsigned int)a4 outVector:(unsigned int *)a5
{
  return 1LL;
}

- (void)sendUpdateFirmwareAnalyticsEventForAccessoryID:(id)a3 assetID:(id)a4 params:(id)a5
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10002B694;
  v6[3] = &unk_100075A30;
  v6[4] = self;
  v6[5] = a3;
  void v6[6] = a4;
  v6[7] = a5;
  dispatch_sync(workQueue, v6);
}

- (void)checkForUpdateIfPossible:(id)a3
{
  if (-[UARPAssetManager isAccessoryInfoAvailable:](self, "isAccessoryInfoAvailable:"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      uint64_t v7 = "-[UARPAssetManager checkForUpdateIfPossible:]";
      __int16 v8 = 2112;
      id v9 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "%s: Triggering asset check, for accessory %@",  (uint8_t *)&v6,  0x16u);
    }

    -[UARPAssetManager checkForUpdate:](self, "checkForUpdate:", a3);
  }

- (int64_t)updateProperty:(unint64_t)a3 value:(id)a4 forAccessory:(id)a5
{
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002B928;
  block[3] = &unk_100075A58;
  block[4] = self;
  void block[5] = a5;
  void block[7] = &v9;
  void block[8] = a3;
  block[6] = a4;
  dispatch_sync(workQueue, block);
  int64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (id)copyAssetIDForAccessoryID:(id)a3
{
  uint64_t v7 = 0LL;
  __int16 v8 = &v7;
  uint64_t v9 = 0x3052000000LL;
  id v10 = sub_10002AF48;
  uint64_t v11 = sub_10002AF58;
  uint64_t v12 = 0LL;
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002BFDC;
  block[3] = &unk_100075548;
  block[4] = self;
  void block[5] = a3;
  block[6] = &v7;
  dispatch_sync(workQueue, block);
  BOOL v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)getSupplementalAssetNameForAccessoryID:(id)a3
{
  uint64_t v7 = 0LL;
  __int16 v8 = &v7;
  uint64_t v9 = 0x3052000000LL;
  id v10 = sub_10002AF48;
  uint64_t v11 = sub_10002AF58;
  uint64_t v12 = 0LL;
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002C0C4;
  block[3] = &unk_100075548;
  block[4] = self;
  void block[5] = a3;
  block[6] = &v7;
  dispatch_sync(workQueue, block);
  BOOL v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)isAssetLookupComplete:(id)a3 forAccessory:(id)a4
{
  id v5 = -[UARPAssetManager getUARPAccessoryInternalForUARPAccessoryID:]( self,  "getUARPAccessoryInternalForUARPAccessoryID:",  a4);
  if (!v5) {
    return 1;
  }
  int64_t v6 = v5;
  id v7 = objc_msgSend( objc_msgSend( +[UARPSupportedAccessory findByAppleModelNumber:]( UARPSupportedAccessory,  "findByAppleModelNumber:",  objc_msgSend(a4, "modelNumber")),  "downstreamAppleModelNumbers"),  "count");
  if (v7 != objc_msgSend(objc_msgSend(objc_msgSend(v6, "assetID"), "downstreamAssetIDs"), "count")) {
    return 0;
  }
  if (objc_msgSend(objc_msgSend(v6, "assetID"), "downloadStatus")) {
    return 1;
  }
  return objc_msgSend(objc_msgSend(v6, "assetID"), "updateAvailabilityStatus") != 0;
}

- (void)assetAvailabilityUpdateForAccessory:(id)a3 assetID:(id)a4 downstreamAppleModelNumber:(id)a5
{
  id v9 = -[UARPAssetManager getUARPAccessoryInternalForUARPAccessoryID:]( self,  "getUARPAccessoryInternalForUARPAccessoryID:");
  id v10 = v9;
  if (v9)
  {
    if (a5) {
      objc_msgSend(objc_msgSend(objc_msgSend(v9, "assetID"), "downstreamAssetIDs"), "addObject:", a4);
    }
    else {
      [v9 setAssetID:a4];
    }
    objc_msgSend( +[UARPDatabase sharedDatabase](UARPDatabase, "sharedDatabase"),  "updateActiveAccessory:",  v10);
  }

  if (![a4 localURL] || objc_msgSend(a4, "firmwareHash")) {
    goto LABEL_10;
  }
  uint64_t v11 = sub_100008764([a4 localURL], 10, (uint64_t)buf);
  if (v11)
  {
    [a4 setFirmwareHash:v11];
LABEL_10:
    if ([a4 deploymentAllowed])
    {
      if (-[UARPAssetManager isAssetLookupComplete:forAccessory:](self, "isAssetLookupComplete:forAccessory:", a4, a3))
      {
        delegateQueue = (dispatch_queue_s *)self->_delegateQueue;
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472LL;
        v15[2] = sub_10002C390;
        v15[3] = &unk_1000754A8;
        v15[4] = self;
        void v15[5] = a3;
        dispatch_async(delegateQueue, v15);
      }

      else
      {
        log = (char *)self->_log;
        if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
          sub_10004A988(v10, log);
        }
      }
    }

    else
    {
      id v13 = self->_log;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v17 = "-[UARPAssetManager assetAvailabilityUpdateForAccessory:assetID:downstreamAppleModelNumber:]";
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s: Deployment not allowed for this asset, not notifying delegate",  buf,  0xCu);
      }
    }

    return;
  }

  if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
    sub_10004AA04();
  }
}

- (void)supplementalAssetAvailabilityUpdateForAccessory:(id)a3 assetName:(id)a4
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v11 = "-[UARPAssetManager supplementalAssetAvailabilityUpdateForAccessory:assetName:]";
    __int16 v12 = 2112;
    id v13 = a4;
    __int16 v14 = 2112;
    id v15 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "%s: Supplemental asset %@ for %@; notifying delegate",
      buf,
      0x20u);
  }

  delegateQueue = (dispatch_queue_s *)self->_delegateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002C4D4;
  block[3] = &unk_1000754F8;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async(delegateQueue, block);
}

- (void)createTemporaryFolders
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002C554;
  block[3] = &unk_100074F50;
  block[4] = self;
  if (qword_10008E388 != -1) {
    dispatch_once(&qword_10008E388, block);
  }
}

- (void)createTemporaryFolder:(id)a3
{
  id v5 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  if (!-[NSFileManager fileExistsAtPath:](v5, "fileExistsAtPath:", a3))
  {
    uint64_t v6 = 0LL;
    if (-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( v5,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  a3,  1LL,  0LL,  &v6))
    {
      NSFileAttributeKey v7 = NSFilePosixPermissions;
      __int16 v8 = &off_10007E7C0;
      if (!-[NSFileManager setAttributes:ofItemAtPath:error:]( v5,  "setAttributes:ofItemAtPath:error:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL),  a3,  &v6)
        && os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
      {
        sub_10004AA7C((uint64_t)a3);
      }
    }

    else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_10004AAF0((uint64_t)a3);
    }
  }

- (int64_t)getSupportedAccessories:(id)a3 assetID:(id)a4 batchRequest:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = -[UARPAssetManager containerIDForAssetID:](self, "containerIDForAssetID:", a4);
  if (v8)
  {
    -[UARPiCloudAssetManager getSupportedAccessories:batchRequest:inContainer:]( self->_iCloudAssetManager,  "getSupportedAccessories:batchRequest:inContainer:",  a3,  v5,  v8);
    return 0LL;
  }

  else
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10004AB64();
    }
    return 4LL;
  }

- (BOOL)getFetchedSupportedAccessories:(id)a3 forProductGroup:(id)a4
{
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3052000000LL;
  id v17 = sub_10002AF48;
  id v18 = sub_10002AF58;
  uint64_t v19 = 0LL;
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 1;
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10002C904;
  v9[3] = &unk_100075A80;
  v9[4] = a4;
  v9[5] = self;
  v9[6] = &v14;
  v9[7] = &v10;
  dispatch_sync(workQueue, v9);
  uint64_t v6 = (void *)v15[5];
  if (v6)
  {
    objc_msgSend(a3, "addObjectsFromArray:", objc_msgSend(v6, "allObjects"));
  }

  char v7 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v7;
}

- (void)supportedAccessories:(id)a3 forProductGroup:(id)a4 isComplete:(BOOL)a5
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002CA18;
  block[3] = &unk_100075AA8;
  block[4] = a4;
  void block[5] = self;
  block[6] = a3;
  BOOL v14 = a5;
  dispatch_async(workQueue, block);
  delegateQueue = (dispatch_queue_s *)self->_delegateQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10002CA78;
  v11[3] = &unk_100075AA8;
  v11[4] = self;
  v11[5] = a3;
  v11[6] = a4;
  BOOL v12 = a5;
  dispatch_async(delegateQueue, v11);
}

- (int64_t)getAttestationCertificates:(id)a3 assetID:(id)a4
{
  id v6 = -[UARPAssetManager containerIDForAssetID:](self, "containerIDForAssetID:", a4);
  if (v6)
  {
    -[UARPiCloudAssetManager getAttestationCertificates:inContainer:]( self->_iCloudAssetManager,  "getAttestationCertificates:inContainer:",  a3,  v6);
    return 0LL;
  }

  else
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10004ABD4();
    }
    return 4LL;
  }

- (id)getAttestationCertificates:(id)a3
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3052000000LL;
  uint64_t v10 = sub_10002AF48;
  uint64_t v11 = sub_10002AF58;
  uint64_t v12 = 0LL;
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002CBD8;
  block[3] = &unk_100075548;
  block[4] = a3;
  void block[5] = self;
  block[6] = &v7;
  dispatch_sync(workQueue, block);
  BOOL v4 = +[NSDictionary dictionaryWithDictionary:](&OBJC_CLASS___NSDictionary, "dictionaryWithDictionary:", v8[5]);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)attestationCertificates:(id)a3 forSubjectKeyIdentifier:(id)a4
{
  if (a3) {
    -[NSMutableDictionary addEntriesFromDictionary:]( self->_subjectKeyIdentifierToAttestationCertificatesMap,  "addEntriesFromDictionary:",  a3);
  }
  delegateQueue = (dispatch_queue_s *)self->_delegateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002CCD4;
  block[3] = &unk_1000754F8;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async(delegateQueue, block);
}

- (void)settingsChangedForSerialNumber:(id)a3
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002CD40;
  v4[3] = &unk_1000754A8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(workQueue, v4);
}

- (NSMutableSet)accessories
{
  return (NSMutableSet *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setAccessories:(id)a3
{
}

@end