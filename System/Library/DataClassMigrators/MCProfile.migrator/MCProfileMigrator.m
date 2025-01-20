@interface MCProfileMigrator
- (BOOL)performMigration;
- (float)estimatedDuration;
- (float)migrationProgress;
- (id)_placeholderCloudConfig;
- (id)dataClassName;
- (void)_allowGrandfatheredRestrictionsIfNeeded;
- (void)_applyHeuristicsToGrandfatheredRestrictionsIfNeeded;
- (void)_createSystemMetadataFileIfNeeded;
- (void)_handleUnsupervisedGrandfatheredRestrictions;
- (void)_recomputeProfileRestrictions;
- (void)_setStopFilteringGrandfatheredRestrictionsState:(BOOL)a3;
- (void)_stopAllowingGrandfatheredRestrictions;
- (void)_storeAllowedGrandfatheredRestrictionsIfNeeded;
@end

@implementation MCProfileMigrator

- (id)dataClassName
{
  return @"mc_profiles";
}

- (float)estimatedDuration
{
  return 1.0;
}

- (float)migrationProgress
{
  return -1.0;
}

- (BOOL)performMigration
{
  uint64_t v4 = _DMLogFunc(v2, 5LL);
  uint64_t v5 = MCSystemProfileStorageDirectory(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_2504(v6);

  uint64_t v7 = MCSystemPublicInfoDirectory();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  sub_2504(v8);

  if (-[MCProfileMigrator didRestoreFromBackup](self, "didRestoreFromBackup"))
  {
    unsigned int v9 = -[MCProfileMigrator didMigrateBackupFromDifferentDevice]( self,  "didMigrateBackupFromDifferentDevice");
    uint64_t v10 = ((uint64_t (*)(void))MCSystemMetadataFilePath)();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  v11));

    if (v12)
    {
      uint64_t v13 = MCSystemMetadataFilePath([v12 removeObjectForKey:kMCMetaLastMigratedBuildKey]);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      [v12 MCWriteToBinaryFile:v14];
    }

    uint64_t v15 = ((uint64_t (*)(void))MCUserMetadataFilePath)();
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  v16));

    if (v17)
    {
      uint64_t v18 = MCUserMetadataFilePath([v17 removeObjectForKey:kMCMetaLastMigratedBuildKey]);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      [v17 writeToFile:v19 atomically:1];
    }

    BOOL v20 = v9 == 0;
    if (v9) {
      unsigned int v21 = 3;
    }
    else {
      unsigned int v21 = 2;
    }
    v22 = @"Restore from the same device";
    v23 = @"Restore from a different device";
  }

  else
  {
    unsigned int v21 = -[MCProfileMigrator didUpgrade](self, "didUpgrade");
    v22 = @"Device erasure";
    v23 = @"Software update";
    BOOL v20 = v21 == 0;
  }

  if (v20) {
    v24 = v22;
  }
  else {
    v24 = v23;
  }
  uint64_t v25 = ((uint64_t (*)(void))MCCloudConfigurationDetailsFilePath)();
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v26));

  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:kCCIsSupervisedKey]);
    unsigned __int8 v29 = [v28 BOOLValue];
  }

  else
  {
    unsigned __int8 v29 = 0;
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if (v21 == 3)
  {
    uint64_t v35 = _DMLogFunc(v2, 5LL);
    uint64_t v36 = MCCloudConfigurationDetailsFilePath(v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    [v30 removeItemAtPath:v37 error:0];

    uint64_t v38 = MCLegacyCloudConfigurationDetailsFilePath();
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    [v30 removeItemAtPath:v39 error:0];

    uint64_t v40 = MCSendCloudConfigurationDetailsChangedNotification();
    uint64_t v41 = MCPostSetupAutoInstallProfilePath(v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    [v30 removeItemAtPath:v42 error:0];

    uint64_t v43 = MCLegacyPostSetupAutoInstallProfilePath();
    v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    [v30 removeItemAtPath:v44 error:0];
  }

  else
  {
    if (v21 != 2
      || (uint64_t v31 = _DMLogFunc(v2, 5LL),
          uint64_t v32 = MCCloudConfigurationDetailsFilePath(v31),
          v33 = (void *)objc_claimAutoreleasedReturnValue(v32),
          unsigned __int8 v34 = [v30 fileExistsAtPath:v33 isDirectory:0],
          v33,
          (v34 & 1) != 0))
    {
      if ((v29 & 1) != 0) {
        goto LABEL_26;
      }
      goto LABEL_25;
    }

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileMigrator _placeholderCloudConfig](self, "_placeholderCloudConfig"));
    uint64_t v45 = MCCloudConfigurationDetailsFilePath(v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
    [v44 MCWriteToBinaryFile:v46];

    MCSendCloudConfigurationDetailsChangedNotification();
  }

LABEL_25:
  -[MCProfileMigrator _handleUnsupervisedGrandfatheredRestrictions]( self,  "_handleUnsupervisedGrandfatheredRestrictions");
LABEL_26:
  _DMLogFunc(v2, 5LL);
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_27BC;
  v49[3] = &unk_41A8;
  unsigned int v52 = v21;
  v50 = (__CFString *)v24;
  v51 = self;
  [v47 shutDownWithCompletion:v49];

  return 1;
}

- (id)_placeholderCloudConfig
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v2 setObject:&__kCFBooleanFalse forKeyedSubscript:kCCIsSupervisedKey];
  [v2 setObject:&__kCFBooleanTrue forKeyedSubscript:kCCAllowPairingKey];
  [v2 setObject:&__kCFBooleanTrue forKeyedSubscript:kCCIsMandatoryKey];
  [v2 setObject:&__kCFBooleanTrue forKeyedSubscript:kCCCloudConfigurationUICompleteKey];
  [v2 setObject:&__kCFBooleanTrue forKeyedSubscript:kCCPostSetupProfileWasInstalledKey];
  return v2;
}

- (void)_handleUnsupervisedGrandfatheredRestrictions
{
  if (-[MCProfileMigrator didUpgrade](self, "didUpgrade"))
  {
    -[MCProfileMigrator _allowGrandfatheredRestrictionsIfNeeded](self, "_allowGrandfatheredRestrictionsIfNeeded");
  }

  else if (-[MCProfileMigrator didRestoreFromBackup](self, "didRestoreFromBackup"))
  {
    -[MCProfileMigrator _stopAllowingGrandfatheredRestrictions](self, "_stopAllowingGrandfatheredRestrictions");
  }

  -[MCProfileMigrator _applyHeuristicsToGrandfatheredRestrictionsIfNeeded]( self,  "_applyHeuristicsToGrandfatheredRestrictionsIfNeeded");
}

- (void)_applyHeuristicsToGrandfatheredRestrictionsIfNeeded
{
  uint64_t v3 = _DMLogFunc(v2, 5LL);
  uint64_t v4 = MCSystemMetadataFilePath(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  v5));
  uint64_t v7 = v6;
  if (v6) {
    v8 = v6;
  }
  else {
    v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  }
  BOOL v20 = v8;

  uint64_t v9 = kMCMetaAllowedGrandfatheredRestrictions;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v20,  "objectForKeyedSubscript:",  kMCMetaAllowedGrandfatheredRestrictions));
  id v11 = [v10 mutableCopy];
  v12 = v11;
  if (v11) {
    uint64_t v13 = (NSMutableDictionary *)v11;
  }
  else {
    uint64_t v13 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  }
  v14 = v13;

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](&OBJC_CLASS___MCHacks, "sharedHacks"));
  [v15 _applyHeuristicsToGranfatheredRestrictionPayloadKeys:v14];

  if (-[NSMutableDictionary count](v14, "count"))
  {
    _DMLogFunc(v2, 5LL);
    id v16 = -[NSMutableDictionary copy](v14, "copy", v14);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v16, v9);

    uint64_t v18 = MCSystemMetadataFilePath(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    -[NSMutableDictionary MCWriteToBinaryFile:](v20, "MCWriteToBinaryFile:", v19);
  }
}

- (void)_createSystemMetadataFileIfNeeded
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v4 = MCSystemMetadataFilePath(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unsigned __int8 v6 = [v3 fileExistsAtPath:v5];

  if ((v6 & 1) == 0)
  {
    _DMLogFunc(v2, 5LL);
    uint64_t v9 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v7 = MCSystemMetadataFilePath(v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[NSMutableDictionary MCWriteToBinaryFile:](v9, "MCWriteToBinaryFile:", v8);
  }

- (void)_storeAllowedGrandfatheredRestrictionsIfNeeded
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager effectiveGrandfatheredRestrictionPayloadKeysDictionary]( &OBJC_CLASS___MCRestrictionManager,  "effectiveGrandfatheredRestrictionPayloadKeysDictionary"));
  id v5 = [v4 count];

  if (v5)
  {
    uint64_t v6 = MCSystemMetadataFilePath(-[MCProfileMigrator _createSystemMetadataFileIfNeeded](self, "_createSystemMetadataFileIfNeeded"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  v7));

    _DMLogFunc(v2, 3LL);
    if (v8)
    {
      uint64_t v9 = kMCMetaAllowedGrandfatheredRestrictions;
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kMCMetaAllowedGrandfatheredRestrictions]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager effectiveGrandfatheredRestrictionPayloadKeysDictionary]( &OBJC_CLASS___MCRestrictionManager,  "effectiveGrandfatheredRestrictionPayloadKeysDictionary"));
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager addRestrictionPayloadKeysDictionary:toRestrictionPayloadKeysDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "addRestrictionPayloadKeysDictionary:toRestrictionPayloadKeysDictionary:",  v11,  v10));

      uint64_t v13 = MCSystemMetadataFilePath([v8 setObject:v12 forKeyedSubscript:v9]);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      [v8 MCWriteToBinaryFile:v14];
    }
  }

  else
  {
    _DMLogFunc(v2, 5LL);
  }

  -[MCProfileMigrator _setStopFilteringGrandfatheredRestrictionsState:]( self,  "_setStopFilteringGrandfatheredRestrictionsState:",  0LL);
}

- (void)_setStopFilteringGrandfatheredRestrictionsState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = MCSystemMetadataFilePath(-[MCProfileMigrator _createSystemMetadataFileIfNeeded](self, "_createSystemMetadataFileIfNeeded"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  v5));

  if (v10)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
    [v10 setObject:v6 forKeyedSubscript:kMCMetaStopFilteringGrandfatheredRestrictions];

    uint64_t v8 = MCSystemMetadataFilePath(v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    [v10 MCWriteToBinaryFile:v9];
  }
}

- (void)_allowGrandfatheredRestrictionsIfNeeded
{
}

- (void)_stopAllowingGrandfatheredRestrictions
{
  uint64_t v4 = _DMLogFunc(v2, 5LL);
  uint64_t v5 = MCSystemMetadataFilePath(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  v6));

  if (v9)
  {
    [v9 setObject:0 forKeyedSubscript:kMCMetaStopFilteringGrandfatheredRestrictions];
    uint64_t v7 = MCSystemMetadataFilePath([v9 setObject:0 forKeyedSubscript:kMCMetaAllowedGrandfatheredRestrictions]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v9 MCWriteToBinaryFile:v8];
  }

  -[MCProfileMigrator _recomputeProfileRestrictions](self, "_recomputeProfileRestrictions");
}

- (void)_recomputeProfileRestrictions
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  [v2 recomputeProfileRestrictionsWithCompletionBlock:&stru_41E8];
}

@end