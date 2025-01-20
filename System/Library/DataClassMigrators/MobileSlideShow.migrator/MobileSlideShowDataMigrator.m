@interface MobileSlideShowDataMigrator
- (BOOL)_didRestoreFromDevice;
- (BOOL)_didRestoreFromMegaBackup;
- (BOOL)_didRestoreFromiTunes;
- (BOOL)performMigration;
- (MobileSlideShowDataMigrator)init;
- (PLAssetsdClient)assetsdClient;
- (PLPhotoLibraryPathManager)pathManager;
- (float)migrationProgress;
- (id)dataClassName;
- (void)_recordDataMigrationInfo;
- (void)_setOTARestoreTokenIfNeeded;
- (void)setPathManager:(id)a3;
@end

@implementation MobileSlideShowDataMigrator

- (MobileSlideShowDataMigrator)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MobileSlideShowDataMigrator;
  v2 = -[MobileSlideShowDataMigrator init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[PLPhotoLibraryPathManager systemLibraryPathManager]( &OBJC_CLASS___PLPhotoLibraryPathManager,  "systemLibraryPathManager"));
    pathManager = v2->_pathManager;
    v2->_pathManager = (PLPhotoLibraryPathManager *)v3;

    v5 = -[PLDataMigratorSupport initWithPathManager:]( objc_alloc(&OBJC_CLASS___PLDataMigratorSupport),  "initWithPathManager:",  v2->_pathManager);
    dataMigratorSupport = v2->_dataMigratorSupport;
    v2->_dataMigratorSupport = v5;
  }

  return v2;
}

- (id)dataClassName
{
  return @"MobileSlideShow";
}

- (BOOL)performMigration
{
  uint64_t Log = PLMigrationGetLog(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = qos_class_self();
    uint64_t v6 = PLStringFromQoSClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    int v43 = 138543362;
    v44 = v7;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Starting migration at QoS: %{public}@", (uint8_t *)&v43, 0xCu);
  }

  -[MobileSlideShowDataMigrator _setOTARestoreTokenIfNeeded](self, "_setOTARestoreTokenIfNeeded");
  -[MobileSlideShowDataMigrator _recordDataMigrationInfo](self, "_recordDataMigrationInfo");
  -[PLDataMigratorSupport removeModelInterestDatabase](self->_dataMigratorSupport, "removeModelInterestDatabase");
  -[PLDataMigratorSupport removeAsidePhotosDatabase](self->_dataMigratorSupport, "removeAsidePhotosDatabase");
  -[PLDataMigratorSupport removeLegacyMetadataFiles](self->_dataMigratorSupport, "removeLegacyMetadataFiles");
  id v8 = -[MobileSlideShowDataMigrator didRestoreFromBackup](self, "didRestoreFromBackup");
  if ((_DWORD)v8)
  {
    id v8 = -[MobileSlideShowDataMigrator didRestoreFromCloudBackup](self, "didRestoreFromCloudBackup");
    if ((v8 & 1) != 0)
    {
      uint64_t v10 = 2LL;
    }

    else
    {
      id v8 = (id)-[MobileSlideShowDataMigrator _didRestoreFromDevice](self, "_didRestoreFromDevice");
      if ((_DWORD)v8) {
        uint64_t v10 = 3LL;
      }
      else {
        uint64_t v10 = 1LL;
      }
    }
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  uint64_t v11 = PLMigrationGetLog(v8, v9);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = PLStringFromDataMigrationRestoreType(v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = qos_class_self();
    uint64_t v16 = PLStringFromQoSClass(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    int v43 = 138543618;
    v44 = v14;
    __int16 v45 = 2114;
    v46 = v17;
    _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "Starting assetsd migration service requests for restore type: %{public}@ at QoS: %{public}@",  (uint8_t *)&v43,  0x16u);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MobileSlideShowDataMigrator assetsdClient](self, "assetsdClient"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 migrationClient]);
  [v19 cleanupModelForDataMigrationForRestoreType:v10];

  uint64_t v22 = PLMigrationGetLog(v20, v21);
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = PLStringFromDataMigrationRestoreType(v10);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    uint64_t v26 = qos_class_self();
    uint64_t v27 = PLStringFromQoSClass(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    int v43 = 138543618;
    v44 = v25;
    __int16 v45 = 2114;
    v46 = v28;
    _os_log_impl( &dword_0,  v23,  OS_LOG_TYPE_DEFAULT,  "Sent cleanupModelForDataMigrationForRestoreType: %{public}@ at QoS: %{public}@",  (uint8_t *)&v43,  0x16u);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MobileSlideShowDataMigrator assetsdClient](self, "assetsdClient"));
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 migrationClient]);
  [v30 dataMigrationWillFinish];

  uint64_t v33 = PLMigrationGetLog(v31, v32);
  v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v35 = qos_class_self();
    uint64_t v36 = PLStringFromQoSClass(v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    int v43 = 138543362;
    v44 = v37;
    _os_log_impl( &dword_0,  v34,  OS_LOG_TYPE_DEFAULT,  "Sent dataMigrationWillFinish at %{public}@",  (uint8_t *)&v43,  0xCu);
  }

  uint64_t v40 = PLMigrationGetLog(v38, v39);
  v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v43) = 0;
    _os_log_impl(&dword_0, v41, OS_LOG_TYPE_DEFAULT, "Migration complete", (uint8_t *)&v43, 2u);
  }

  return 1;
}

- (float)migrationProgress
{
  return self->_migrationProgress;
}

- (BOOL)_didRestoreFromDevice
{
  return (-[MobileSlideShowDataMigrator userDataDisposition](self, "userDataDisposition") >> 6) & 1;
}

- (BOOL)_didRestoreFromiTunes
{
  return (-[MobileSlideShowDataMigrator userDataDisposition](self, "userDataDisposition") >> 5) & 1;
}

- (BOOL)_didRestoreFromMegaBackup
{
  unsigned int v3 = -[MobileSlideShowDataMigrator didRestoreFromCloudBackup](self, "didRestoreFromCloudBackup");
  if (v3) {
    return (-[MobileSlideShowDataMigrator userDataDisposition](self, "userDataDisposition") >> 7) & 1;
  }
  return v3;
}

- (void)_recordDataMigrationInfo
{
  v16[0] = PLDataMigrationDidUpgradeKey;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[MobileSlideShowDataMigrator didUpgrade](self, "didUpgrade")));
  v17[0] = v15;
  v16[1] = PLDataMigrationDidRestoreFromBackupKey;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[MobileSlideShowDataMigrator didRestoreFromBackup](self, "didRestoreFromBackup")));
  v17[1] = v14;
  v16[2] = PLDataMigrationDidMigrateBackupFromDifferentDeviceKey;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[MobileSlideShowDataMigrator didMigrateBackupFromDifferentDevice]( self,  "didMigrateBackupFromDifferentDevice")));
  v17[2] = v13;
  v16[3] = PLDataMigrationDidRestoreFromCloudBackupKey;
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[MobileSlideShowDataMigrator didRestoreFromCloudBackup](self, "didRestoreFromCloudBackup")));
  v17[3] = v3;
  v16[4] = PLDataMigrationDidRestoreFromMegaBackupKey;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[MobileSlideShowDataMigrator _didRestoreFromMegaBackup](self, "_didRestoreFromMegaBackup")));
  v17[4] = v4;
  v16[5] = PLDataMigrationDidRestoreFromDeviceBackupKey;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[MobileSlideShowDataMigrator _didRestoreFromDevice](self, "_didRestoreFromDevice")));
  v17[5] = v5;
  v16[6] = PLDataMigrationDidRestoreFromiTunesBackupKey;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[MobileSlideShowDataMigrator _didRestoreFromiTunes](self, "_didRestoreFromiTunes")));
  v17[6] = v6;
  v16[7] = PLDataMigrationBuildVersionKey;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PLBuildVersion currentBuildVersionString](&OBJC_CLASS___PLBuildVersion, "currentBuildVersionString"));
  v17[7] = v7;
  v16[8] = PLDataMigrationDateKey;
  uint64_t v8 = PLCompleteDateFormatter();
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 stringFromDate:v10]);
  v17[8] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  9LL));

  -[PLDataMigratorSupport recordDataMigrationInfo:](self->_dataMigratorSupport, "recordDataMigrationInfo:", v12);
}

- (void)_setOTARestoreTokenIfNeeded
{
  if (!self->_didSetOTARestoreTokenIfNeeded
    && -[MobileSlideShowDataMigrator didRestoreFromCloudBackup](self, "didRestoreFromCloudBackup"))
  {
    pathManager = self->_pathManager;
    id v10 = 0LL;
    unsigned int v4 = +[PLDeviceRestoreMigrationPostProcessingSupport createForegroundRestoreFromCloudBackupCompleteTokenWithPathManager:error:]( &OBJC_CLASS___PLDeviceRestoreMigrationPostProcessingSupport,  "createForegroundRestoreFromCloudBackupCompleteTokenWithPathManager:error:",  pathManager,  &v10);
    id v5 = v10;
    uint64_t Log = PLMigrationGetLog(v5, v6);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    uint64_t v9 = v8;
    if (v4)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "Created foreground restore from cloud backup complete token",  buf,  2u);
      }

      self->_didSetOTARestoreTokenIfNeeded = 1;
    }

    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v12 = v5;
        _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_ERROR,  "Failed to create foreground restore from cloud backup complete token: %{public}@",  buf,  0xCu);
      }
    }
  }

- (PLAssetsdClient)assetsdClient
{
  assetsdClient = self->_assetsdClient;
  if (!assetsdClient)
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotoLibraryPathManager libraryURL](self->_pathManager, "libraryURL"));
    id v5 = (PLAssetsdClient *)objc_claimAutoreleasedReturnValue( +[PLPhotoLibraryBundleController sharedAssetsdClientForPhotoLibraryURL:]( &OBJC_CLASS___PLPhotoLibraryBundleController,  "sharedAssetsdClientForPhotoLibraryURL:",  v4));
    uint64_t v6 = self->_assetsdClient;
    self->_assetsdClient = v5;

    assetsdClient = self->_assetsdClient;
  }

  return assetsdClient;
}

- (PLPhotoLibraryPathManager)pathManager
{
  return self->_pathManager;
}

- (void)setPathManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end