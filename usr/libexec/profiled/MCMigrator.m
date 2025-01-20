@interface MCMigrator
+ (BOOL)payloadHasHardwareBoundKey:(id)a3;
+ (id)stringWithContext:(int)a3;
- (BOOL)_applyAccountTagsToProfile:(id)a3;
- (BOOL)_copyAlmostAtomicallyItemAtPath:(id)a3 toPath:(id)a4 error:(id *)a5;
- (BOOL)_isDirectoryEmptyAtPath:(id)a3;
- (BOOL)_isLegacyProfileStoragePresent;
- (BOOL)_isMultiUserMode;
- (BOOL)_shouldAttemptToMigrateLegacyProfileStorage;
- (BOOL)systemProfileStorageWasMigratedFromLegacyStorage;
- (MCMigrator)init;
- (MCNotifier)notifier;
- (NSFileManager)fileManager;
- (id)_attributeDictionaryForProfileStorageWithPosixPermissions:(unint64_t)a3;
- (id)_attributesForSystemProfileStorageItems;
- (id)_attributesForUserProfileStorageItem;
- (id)_generatedManifestIfNeededFromOrderedProfiles:(id)a3 hiddenProfiles:(id)a4 existingManifest:(id)a5;
- (id)_lastSystemMigratedBuildVersion;
- (id)_lastUserMigratedBuildVersion;
- (id)_profilesFromManifestAtPath:(id)a3;
- (id)_removeOrphanedManifestEntriesFromManifestInDirectory:(id)a3;
- (id)_updateProfileRestrictionsForProfileRestrictions:(id)a3;
- (id)systemMetadataDictionary;
- (id)userMetadataDictionary;
- (void)_applyDefaultSettings;
- (void)_applyImpliedSettings;
- (void)_checkValidUserEnrollment;
- (void)_cleanUpAppConfiguration;
- (void)_correctCloudConfigurationIfNecessary;
- (void)_correctInstallOptionsOnProfileStubs;
- (void)_correctMDMConfigurationFile;
- (void)_createDirectories;
- (void)_createDirectoryAtPath:(id)a3;
- (void)_createDirectoryAtPath:(id)a3 attributes:(id)a4;
- (void)_createStubs;
- (void)_createSystemGroupContainerAndMoveFiles;
- (void)_createSystemProfileStorageDirectoryMigratingFromLegacyStorageIfNecessary;
- (void)_fixDirectoryAtPath:(id)a3 permissions:(id)a4;
- (void)_fixManifestFromStubsIfNecessary;
- (void)_fixManifestFromStubsIfNecessaryWithStubPath:(id)a3 manifestPath:(id)a4;
- (void)_fixPermissionsOnTheSystemProfileLibraryDirectoryAndContents;
- (void)_migrateBoolRestrictions:(id)a3 withAppID:(id)a4 forKey:(id)a5 valuesToRestrictions:(id)a6 currentBoolUserSettings:(id)a7;
- (void)_migrateBoolValueToFeature:(id)a3 withAppID:(id)a4 forKey:(id)a5 synchronize:(BOOL)a6;
- (void)_migrateClientRestrictions;
- (void)_migrateExtensibleSSO;
- (void)_migrateLegacySystemProfileStorage;
- (void)_migrateLostModeLastLocationRequestDate;
- (void)_migrateManifestLocation;
- (void)_migrateOTAProfiles;
- (void)_migratePasscodeDidRestore:(BOOL)a3 passcodeWasSet:(BOOL)a4 historyRequired:(BOOL)a5;
- (void)_migrateProfileStubsForNetworkExtension;
- (void)_migrateSettings;
- (void)_migrateSharedDeviceConfiguration;
- (void)_migrateSupervisionSettings;
- (void)_migrateValueRestrictions:(id)a3 withAppID:(id)a4 forKey:(id)a5 keysToRestricitons:(id)a6 currentValueUserSettings:(id)a7;
- (void)_moveFilesToPublicDirectories;
- (void)_moveSignerCertificatesInProfileStubDictionary:(id)a3;
- (void)_profilesFromStubsAtPath:(id)a3 orderedProfiles:(id *)a4 hiddenProfiles:(id *)a5;
- (void)_removeDuplicatedHiddenIdentifiers;
- (void)_removeExistingSystemProfileStorageDirectoryBlockingMigration;
- (void)_removeHardwareBoundPayloads;
- (void)_removeInvalidOptionsFromLegacyCloudConfiguration;
- (void)_removeLegacyAPNConfigurations;
- (void)_removeLegacyProfileStorageDirectory;
- (void)_removeMDMProfileIfDataSeparated;
- (void)_removeOSXServerPayloadAccount;
- (void)_removeOriginalCopies;
- (void)_removeOrphanedManifestEntries;
- (void)_removeSupervisionProfiles;
- (void)_removeUnmanageableApps;
- (void)_removeUnusedManifestArrays;
- (void)_removeiPCUCertificates;
- (void)_sendCloudConfigurationChangedNotificationIfWeMigratedLegacyProfileStorage;
- (void)_setAttributesOnSystemProfileStorageDirectory;
- (void)_tagIMAPAccountsWithProfileAndPayloadProperties;
- (void)_tagManagedAccounts;
- (void)_tellAMFIIfWeAreSupervised;
- (void)_transferInstallationDatesFromOriginalProfiles;
- (void)_transferRemovalPasswordsFromOriginalProfiles;
- (void)_transferSignerCertificates;
- (void)_transferTagsToProfileStubs;
- (void)_updateClientRestrictions;
- (void)_updateProfileRestrictions;
- (void)_validateCloudConfiguration;
- (void)_wakeDaemonsPostMigration;
- (void)migrateCleanupMigratorWithContext:(int)a3;
- (void)migratePostDataMigratorWithContext:(int)a3 passcodeWasSetInBackup:(BOOL)a4;
- (void)migrateWithPostMigrationTaskQueue:(id)a3;
- (void)setFileManager:(id)a3;
- (void)setNotifier:(id)a3;
- (void)setSystemMetadataDictionary:(id)a3;
- (void)setSystemProfileStorageWasMigratedFromLegacyStorage:(BOOL)a3;
- (void)setUserMetadataDictionary:(id)a3;
@end

@implementation MCMigrator

- (MCMigrator)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MCMigrator;
  v2 = -[MCMigrator init](&v8, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSFileManager);
    fileManager = v2->_fileManager;
    v2->_fileManager = v3;

    v5 = objc_opt_new(&OBJC_CLASS___MCNotifier);
    notifier = v2->_notifier;
    v2->_notifier = v5;

    v2->_systemProfileStorageWasMigratedFromLegacyStorage = 0;
  }

  return v2;
}

- (id)systemMetadataDictionary
{
  uint64_t v2 = MCSystemMetadataFilePath(self, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization MCSafePropertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "MCSafePropertyListWithData:options:format:error:",  v4,  1LL,  0LL,  0LL));

  if (!v5 || (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary), (objc_opt_isKindOfClass(v5, v6) & 1) == 0))
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));

    v5 = (void *)v7;
  }

  return v5;
}

- (void)setSystemMetadataDictionary:(id)a3
{
  id v3 = a3;
  uint64_t v5 = MCSystemMetadataFilePath(v3, v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  [v3 MCWriteToBinaryFile:v6];
}

- (id)userMetadataDictionary
{
  uint64_t v2 = MCUserMetadataFilePath(self, a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization MCSafePropertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "MCSafePropertyListWithData:options:format:error:",  v4,  1LL,  0LL,  0LL));

  if (!v5 || (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary), (objc_opt_isKindOfClass(v5, v6) & 1) == 0))
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));

    uint64_t v5 = (void *)v7;
  }

  return v5;
}

- (void)setUserMetadataDictionary:(id)a3
{
  id v3 = a3;
  uint64_t v5 = MCUserMetadataFilePath(v3, v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  [v3 MCWriteToBinaryFile:v6];
}

- (id)_lastSystemMigratedBuildVersion
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator systemMetadataDictionary](self, "systemMetadataDictionary"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:kMCMetaLastMigratedBuildKey]);

  return v3;
}

- (id)_lastUserMigratedBuildVersion
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator userMetadataDictionary](self, "userMetadataDictionary"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:kMCMetaLastMigratedBuildKey]);

  return v3;
}

- (void)_migratePasscodeDidRestore:(BOOL)a3 passcodeWasSet:(BOOL)a4 historyRequired:(BOOL)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  v9 = _MCLogObjects[12];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Migrating passcode...", buf, 2u);
  }

  if (v7 && v6)
  {
    if (MKBGetDeviceLockState(0LL) == 3)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
      uint64_t v11 = MCBackupContainsPasscodeFilePath();
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      [v10 writeToFile:v12 atomically:1];
    }

    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
      uint64_t v13 = MCBackupContainsPasscodeFilePath();
      v12 = (void *)objc_claimAutoreleasedReturnValue(v13);
      [v10 removeItemAtPath:v12 error:0];
    }
  }

  if (!a5)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](&OBJC_CLASS___MCPasscodeManagerWriter, "sharedManager"));
    [v14 clearPasscodeHistory];
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](&OBJC_CLASS___MCPasscodeManagerWriter, "sharedManager"));
  [v15 migratePasscodeMetadata];

  v16 = _MCLogObjects[12];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Completed migrating passcode.", v17, 2u);
  }

- (BOOL)_isMultiUserMode
{
  uint64_t v2 = MCCloudConfigurationDetailsFilePath(self);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  v3));

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kCCIsMultiUserKey]);
  unsigned __int8 v6 = [v5 BOOLValue];

  return v6;
}

- (void)_removeiPCUCertificates
{
  id v3 = _MCLogObjects[12];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Removing iPCU associations...", buf, 2u);
  }

  uint64_t v4 = MCiPCUKeychainMapPath();
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v5));

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v7,  "objectForKey:",  *(void *)(*((void *)&v17 + 1) + 8 * (void)i),  (void)v17));
        +[MCKeychain removeItemWithPersistentID:useSystemKeychain:]( &OBJC_CLASS___MCKeychain,  "removeItemWithPersistentID:useSystemKeychain:",  v12,  1LL);
      }

      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }

    while (v9);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  uint64_t v14 = MCiPCUKeychainMapPath();
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  [v13 removeItemAtPath:v15 error:0];

  v16 = _MCLogObjects[12];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Finished removing iPCU associations.", buf, 2u);
  }
}

- (void)_removeOSXServerPayloadAccount
{
  uint64_t v2 = (os_log_s *)_MCLogObjects[12];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Removing OSX Server Payload Accounts not available on Simulator",  v3,  2u);
  }

- (void)_removeHardwareBoundPayloads
{
  v86 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
  __int128 v107 = 0u;
  __int128 v108 = 0u;
  __int128 v109 = 0u;
  __int128 v110 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue([v86 allInstalledProfileIdentifiers]);
  id v3 = [v2 countByEnumeratingWithState:&v107 objects:v118 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v108;
LABEL_3:
    uint64_t v6 = 0LL;
    while (1)
    {
      if (*(void *)v108 != v5) {
        objc_enumerationMutation(v2);
      }
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v86 installedProfileWithIdentifier:*(void *)(*((void *)&v107 + 1) + 8 * v6)]);
      id v8 = [v7 payloadsWithClass:objc_opt_class(MCMDMPayload)];
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      id v10 = [v9 count];

      if (v10) {
        break;
      }

      if (v4 == (id)++v6)
      {
        id v4 = [v2 countByEnumeratingWithState:&v107 objects:v118 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }

  else
  {
LABEL_9:
    id v7 = 0LL;
  }

  __int128 v105 = 0u;
  __int128 v106 = 0u;
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 payloads]);
  id v12 = [v11 countByEnumeratingWithState:&v103 objects:v117 count:16];
  uint64_t v13 = &selRef_setMemberQueueUserOrphansDict_;
  v76 = v7;
  if (v12)
  {
    id v14 = v12;
    uint64_t v15 = *(void *)v104;
    while (2)
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v104 != v15) {
          objc_enumerationMutation(v11);
        }
        if (+[MCMigrator payloadHasHardwareBoundKey:]( &OBJC_CLASS___MCMigrator,  "payloadHasHardwareBoundKey:",  *(void *)(*((void *)&v103 + 1) + 8LL * (void)i)))
        {
          __int128 v17 = _MCLogObjects[12];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "MCCleanupMigrator: Unenrolling from MDM because identity was hardware-bound",  buf,  2u);
          }

          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller"));
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
          objc_msgSend( v18,  "removeProfileWithIdentifier:installationType:source:",  v19,  objc_msgSend(v7, "installType"),  @"Hardware-bound Profile Removal");

          uint64_t v20 = objc_claimAutoreleasedReturnValue([v86 allInstalledProfileIdentifiers]);
          int v74 = 1;
          id v2 = (id)v20;
          goto LABEL_22;
        }
      }

      id v14 = [v11 countByEnumeratingWithState:&v103 objects:v117 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  int v74 = 0;
LABEL_22:

  context = objc_autoreleasePoolPush();
  v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v99 = 0u;
  __int128 v100 = 0u;
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  id obj = v2;
  id v80 = [obj countByEnumeratingWithState:&v99 objects:v116 count:16];
  if (v80)
  {
    uint64_t v79 = *(void *)v100;
    uint64_t v21 = kAppSSOKerberosExtensionID;
    v22 = &MailAccountHostname_ptr;
    uint64_t v83 = kAppSSOKerberosExtensionID;
    do
    {
      uint64_t v23 = 0LL;
      do
      {
        if (*(void *)v100 != v79) {
          objc_enumerationMutation(obj);
        }
        uint64_t v82 = v23;
        v24 = (void *)objc_claimAutoreleasedReturnValue( [v86 installedProfileWithIdentifier:*(void *)(*((void *)&v99 + 1) + 8 * v23)]);
        __int128 v95 = 0u;
        __int128 v96 = 0u;
        __int128 v97 = 0u;
        __int128 v98 = 0u;
        v25 = (void *)objc_claimAutoreleasedReturnValue([v24 payloads]);
        id v26 = [v25 countByEnumeratingWithState:&v95 objects:v115 count:16];
        if (v26)
        {
          id v27 = v26;
          uint64_t v28 = *(void *)v96;
          v81 = v24;
          uint64_t v84 = *(void *)v96;
          v85 = v25;
          while (2)
          {
            for (j = 0LL; j != v27; j = (char *)j + 1)
            {
              if (*(void *)v96 != v28) {
                objc_enumerationMutation(v25);
              }
              v30 = *(void **)(*((void *)&v95 + 1) + 8LL * (void)j);
              if ([v13 + 310 payloadHasHardwareBoundKey:v30])
              {
                v24 = v81;
                [v78 addObject:v81];
                goto LABEL_54;
              }

              uint64_t v31 = objc_opt_class(v22[81]);
              if ((objc_opt_isKindOfClass(v30, v31) & 1) != 0)
              {
                id v32 = v30;
                v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "esso_extensionIdentifier"));
                unsigned int v34 = [v33 isEqualToString:v21];

                if (v34)
                {
                  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "esso_extensionData"));
                  v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:@"certificateUUID"]);

                  if (v36)
                  {
                    __int128 v93 = 0u;
                    __int128 v94 = 0u;
                    __int128 v91 = 0u;
                    __int128 v92 = 0u;
                    v37 = (void *)objc_claimAutoreleasedReturnValue([v86 allInstalledProfileIdentifiers]);
                    id v38 = [v37 countByEnumeratingWithState:&v91 objects:v114 count:16];
                    if (v38)
                    {
                      id v39 = v38;
                      uint64_t v40 = *(void *)v92;
LABEL_38:
                      uint64_t v41 = 0LL;
                      while (1)
                      {
                        if (*(void *)v92 != v40) {
                          objc_enumerationMutation(v37);
                        }
                        v42 = (void *)objc_claimAutoreleasedReturnValue( [v86 installedProfileWithIdentifier:*(void *)(*((void *)&v91 + 1) + 8 * v41)]);
                        uint64_t v43 = objc_claimAutoreleasedReturnValue([v42 payloadWithUUID:v36]);
                        if (v43) {
                          break;
                        }

                        if (v39 == (id)++v41)
                        {
                          id v39 = [v37 countByEnumeratingWithState:&v91 objects:v114 count:16];
                          uint64_t v13 = &selRef_setMemberQueueUserOrphansDict_;
                          if (v39) {
                            goto LABEL_38;
                          }
                          goto LABEL_47;
                        }
                      }

                      v44 = (void *)v43;
                      uint64_t v13 = &selRef_setMemberQueueUserOrphansDict_;
                      if (!+[MCMigrator payloadHasHardwareBoundKey:]( &OBJC_CLASS___MCMigrator,  "payloadHasHardwareBoundKey:",  v43))
                      {

                        goto LABEL_47;
                      }

                      v24 = v81;
                      [v78 addObject:v81];

                      uint64_t v21 = v83;
                      v22 = &MailAccountHostname_ptr;
                      v25 = v85;
                      goto LABEL_54;
                    }

+ (BOOL)payloadHasHardwareBoundKey:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___MCCertificatePayload);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    unsigned __int8 v5 = [v3 isHardwareBound];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

+ (id)stringWithContext:(int)a3
{
  else {
    return *(&off_1000C3628 + a3);
  }
}

- (void)migratePostDataMigratorWithContext:(int)a3 passcodeWasSetInBackup:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-MigratePostDataMigrator"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCMigrator stringWithContext:](&OBJC_CLASS___MCMigrator, "stringWithContext:", v5));
  id v9 = _MCLogObjects[12];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138543618;
    id v27 = v8;
    __int16 v28 = 1024;
    BOOL v29 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Beginning post-DataMigrator migration. Context: %{public}@, passcode was set in backup: %d",  (uint8_t *)&v26,  0x12u);
  }

  -[MCMigrator _tellAMFIIfWeAreSupervised](self, "_tellAMFIIfWeAreSupervised");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 valueForFeature:MCFeaturePasscodeHistoryCount]);
  BOOL v12 = [v11 unsignedIntValue] != 0;

  -[MCMigrator _migratePasscodeDidRestore:passcodeWasSet:historyRequired:]( self,  "_migratePasscodeDidRestore:passcodeWasSet:historyRequired:",  (v5 & 0xFFFFFFFE) == 2,  v4,  v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v13 notifyClientsToRecomputeCompliance];
  if ((_DWORD)v5 == 3) {
    -[MCMigrator _removeiPCUCertificates](self, "_removeiPCUCertificates");
  }
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](&OBJC_CLASS___MCServerSideHacks, "sharedHacks"));
  [v14 recomputeAppRulesForNetworkExtension];

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](&OBJC_CLASS___MCServerSideHacks, "sharedHacks"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v13 effectiveUserSettings]);
  [v15 recomputeAppOptionsEffectiveUserSettings:v16 outEffectiveChangeDetected:0];

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](&OBJC_CLASS___MCServerSideHacks, "sharedHacks"));
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v13 effectiveUserSettings]);
  [v17 recomputeWebContentFilterEffectiveUserSettings:v18 outEffectiveChangeDetected:0 outMechanismChangedDetected:0];

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](&OBJC_CLASS___MCServerSideHacks, "sharedHacks"));
  id v20 = [v19 recomputeAccountVPNAssociations];

  uint64_t v21 = (const __CFString *)kMCPreferencesLockdownActivationIndicatesCloudConfigurationAvailableKey;
  v22 = (const __CFString *)kMCNotBackedUpPreferencesDomain;
  uint64_t v23 = (void *)CFPreferencesCopyAppValue( kMCPreferencesLockdownActivationIndicatesCloudConfigurationAvailableKey,  kMCNotBackedUpPreferencesDomain);
  v24 = (void *)CFPreferencesCopyAppValue(kMCPreferencesLockdownCloudConfigurationAvailableKey, v22);
  if ([v24 BOOLValue] && !v23)
  {
    CFPreferencesSetAppValue(v21, kCFBooleanTrue, v22);
    CFPreferencesAppSynchronize(v22);
  }

  if ((_DWORD)v5 == 2)
  {
    [v13 clearAllPasscodeComplianceCaches];
    MCSendClientTruthChangedNotification([v13 recomputeNagMetadata]);
  }

  v25 = _MCLogObjects[12];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v26) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Post-DataMigrator migration complete.",  (uint8_t *)&v26,  2u);
  }
}

- (void)_tellAMFIIfWeAreSupervised
{
  uint64_t v2 = MCCloudConfigurationDetailsFilePath(self);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v3));

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kCCIsSupervisedKey]);
    unsigned int v6 = [v5 BOOLValue];

    if (v6)
    {
      id v7 = _MCLogObjects[12];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Informing AMFI that this device is supervised.",  v8,  2u);
      }

      +[MCCloudConfigurationWriter setAMFISupervisionFromCloudConfiguration:]( &OBJC_CLASS___MCCloudConfigurationWriter,  "setAMFISupervisionFromCloudConfiguration:",  v4);
    }
  }
}

- (void)_removeMDMProfileIfDataSeparated
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 verifiedMDMProfileIdentifierWithCleanUp]);

  if (v3)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[MCManifest installedProfileWithIdentifier:]( &OBJC_CLASS___MCManifest,  "installedProfileWithIdentifier:",  v3));
    if (!v4)
    {
      uint64_t v11 = _MCLogObjects[12];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v16 = 138543362;
        __int128 v17 = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "MCCleanupMigrator: could not create MDM profile from identifier %{public}@",  (uint8_t *)&v16,  0xCu);
      }

      goto LABEL_20;
    }

    id v5 = [v4 payloadsWithClass:objc_opt_class(MCMDMPayload)];
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = v6;
    if (v6)
    {
      id v8 = [v6 count];
      if (v8 == (id)1)
      {
        BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:0]);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 personaID]);

        if (v13)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller"));
          objc_msgSend( v14,  "removeProfileWithIdentifier:installationType:source:",  v3,  objc_msgSend(v4, "installType"),  @"User Enrollment Profile Removal");

          uint64_t v15 = _MCLogObjects[12];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v16) = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "MCCleanupMigrator: Removed data separated (PDUE/ADUE/ADDE) MDM profile",  (uint8_t *)&v16,  2u);
          }
        }

        goto LABEL_19;
      }

      if (v8)
      {
        id v9 = _MCLogObjects[12];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v16) = 0;
          id v10 = "MCCleanupMigrator: MDM profile contains more than one MDM payload";
          goto LABEL_18;
        }
      }

      else
      {
        id v9 = _MCLogObjects[12];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v16) = 0;
          id v10 = "MCCleanupMigrator: MDM profile contains no MDM payloads";
LABEL_18:
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v16, 2u);
        }
      }
    }

    else
    {
      id v9 = _MCLogObjects[12];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v16) = 0;
        id v10 = "MCCleanupMigrator: payloadsWithClass: unexpectedly returned nil for MDM profile";
        goto LABEL_18;
      }
    }

- (void)migrateCleanupMigratorWithContext:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-MigrationCleanup"];
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCMigrator stringWithContext:](&OBJC_CLASS___MCMigrator, "stringWithContext:", v3));
  id v7 = _MCLogObjects[12];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v56 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "MCCleanupMigrator: work beginning, context: %{public}@",  buf,  0xCu);
  }

  uint64_t v8 = MCProductBuildVersion();
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator systemMetadataDictionary](self, "systemMetadataDictionary"));
  [v10 setObject:v9 forKey:kMCMetaLastMDMMigratedBuildKey];
  -[MCMigrator setSystemMetadataDictionary:](self, "setSystemMetadataDictionary:", v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller"));
  if ((_DWORD)v3 == 2)
  {
    int v42 = 2;
    -[MCMigrator _removeMDMProfileIfDataSeparated](self, "_removeMDMProfileIfDataSeparated");
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[MDMClient sharedClient](&OBJC_CLASS___MDMClient, "sharedClient"));
    [(id)v3 scheduleTokenUpdate];
  }

  else
  {
    if ((_DWORD)v3 != 3) {
      goto LABEL_26;
    }
    int v42 = 3;
    id v39 = self;
    uint64_t v40 = v6;
    id v41 = v5;
    BOOL v12 = _MCLogObjects[12];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "MCCleanupMigrator: removing profiles",  buf,  2u);
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifiersOfInstalledProfilesWithFilterFlags:", 19, v10));
    uint64_t v53 = kMCRemoveProfileOptionRemovedDueToMigrationFromOtherDevice;
    v54 = &__kCFBooleanTrue;
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v54,  &v53,  1LL));
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    uint64_t v3 = v13;
    id v15 = [(id)v3 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v48;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v48 != v17) {
            objc_enumerationMutation((id)v3);
          }
          uint64_t v19 = *(void *)(*((void *)&v47 + 1) + 8LL * (void)i);
          id v20 = objc_autoreleasePoolPush();
          [v11 removeProfileWithIdentifier:v19 installationType:1 options:v14 source:@"Migrator System Profile Removal"];
          objc_autoreleasePoolPop(v20);
        }

        id v16 = [(id)v3 countByEnumeratingWithState:&v47 objects:v52 count:16];
      }

      while (v16);
    }

    id v38 = v9;

    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    id v21 = (id)objc_claimAutoreleasedReturnValue([v11 identifiersOfInstalledProfilesWithFilterFlags:9]);
    id v22 = [v21 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v44;
      do
      {
        for (j = 0LL; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v44 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v43 + 1) + 8LL * (void)j);
          id v27 = objc_autoreleasePoolPush();
          [v11 removeProfileWithIdentifier:v26 installationType:2 options:v14 source:@"Migrator User Profile Removal"];
          objc_autoreleasePoolPop(v27);
        }

        id v23 = [v21 countByEnumeratingWithState:&v43 objects:v51 count:16];
      }

      while (v23);
    }

    uint64_t v28 = SecTrustStoreForDomain(2LL);
    int v29 = SecTrustStoreRemoveAll(v28);
    v30 = _MCLogObjects[12];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v56) = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "MCCleanupMigrator: removed all certificate trust settings (%i)",  buf,  8u);
    }

    unsigned int v6 = v40;
    id v5 = v41;
    id v9 = v38;
    self = v39;
    id v10 = v37;
  }

  LODWORD(v3) = v42;
LABEL_26:
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  [v31 checkCarrierProfile];

  if ((v3 & 0xFFFFFFFE) == 2)
  {
    -[MCMigrator _removeHardwareBoundPayloads](self, "_removeHardwareBoundPayloads");
    id v32 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter sharedManager]( &OBJC_CLASS___MCRestrictionManagerWriter,  "sharedManager"));
    [v32 setBoolValue:1 forSetting:MCFeatureDefaultBrowserPromptingAllowed sender:@"MCCleanupMigrator.migrateCleanupMigratorWithContext"];
  }

  else if (!(_DWORD)v3)
  {
    goto LABEL_34;
  }

  v33 = _MCLogObjects[9];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Fixing orphaned accounts...", buf, 2u);
  }

  +[MCAccountUtilities checkAccountConsistencyAndReleaseOrphanedAccounts]( &OBJC_CLASS___MCAccountUtilities,  "checkAccountConsistencyAndReleaseOrphanedAccounts");
  +[DMCEnrollmentAccountUtilities removeOrphanedEnrollmentAccounts]( &OBJC_CLASS___DMCEnrollmentAccountUtilities,  "removeOrphanedEnrollmentAccounts");
LABEL_34:
  unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 unverifiedInstalledMDMProfileIdentifier]);

  if (v35) {
    +[MDMProvisioningProfileTrust didEnrollInMDMWithPasscode:duringMigration:]( &OBJC_CLASS___MDMProvisioningProfileTrust,  "didEnrollInMDMWithPasscode:duringMigration:",  0LL,  1LL);
  }
  -[MCNotifier sendCleanupMigrationFinishedNotification](self->_notifier, "sendCleanupMigrationFinishedNotification");
  v36 = _MCLogObjects[12];
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "MCCleanupMigrator: work complete", buf, 2u);
  }
}

- (void)migrateWithPostMigrationTaskQueue:(id)a3
{
  BOOL v4 = (dispatch_queue_s *)a3;
  id v29 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-MigrateWithPostMigrationTask"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator _lastSystemMigratedBuildVersion](self, "_lastSystemMigratedBuildVersion"));

  unsigned int v6 = _MCLogObjects[12];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = "NO";
    if (!v5) {
      id v7 = "YES";
    }
    *(_DWORD *)buf = 136315138;
    id v32 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Managed Configuration migrating (erase = %s) ...",  buf,  0xCu);
  }

  -[MCMigrator _createDirectories](self, "_createDirectories");
  +[MCServerSideHacks setAllowHacksToCallExternalComponents:]( &OBJC_CLASS___MCServerSideHacks,  "setAllowHacksToCallExternalComponents:",  0LL);
  if (v5)
  {
    -[MCMigrator _removeInvalidOptionsFromLegacyCloudConfiguration]( self,  "_removeInvalidOptionsFromLegacyCloudConfiguration");
    -[MCMigrator _createSystemGroupContainerAndMoveFiles](self, "_createSystemGroupContainerAndMoveFiles");
    -[MCMigrator _moveFilesToPublicDirectories](self, "_moveFilesToPublicDirectories");
    -[MCMigrator _migrateManifestLocation](self, "_migrateManifestLocation");
    -[MCMigrator _removeUnusedManifestArrays](self, "_removeUnusedManifestArrays");
    -[MCMigrator _removeDuplicatedHiddenIdentifiers](self, "_removeDuplicatedHiddenIdentifiers");
    -[MCMigrator _createStubs](self, "_createStubs");
    -[MCMigrator _removeOrphanedManifestEntries](self, "_removeOrphanedManifestEntries");
    -[MCMigrator _transferSignerCertificates](self, "_transferSignerCertificates");
    -[MCMigrator _transferRemovalPasswordsFromOriginalProfiles](self, "_transferRemovalPasswordsFromOriginalProfiles");
    -[MCMigrator _migrateOTAProfiles](self, "_migrateOTAProfiles");
    -[MCMigrator _transferInstallationDatesFromOriginalProfiles](self, "_transferInstallationDatesFromOriginalProfiles");
    -[MCMigrator _transferTagsToProfileStubs](self, "_transferTagsToProfileStubs");
    -[MCMigrator _removeOriginalCopies](self, "_removeOriginalCopies");
  }

  else
  {
    -[MCMigrator _createSystemGroupContainerAndMoveFiles](self, "_createSystemGroupContainerAndMoveFiles");
  }

  -[MCMigrator _applyDefaultSettings](self, "_applyDefaultSettings");
  if (!-[MCMigrator _isMultiUserMode](self, "_isMultiUserMode")) {
    -[MCMigrator _migrateSettings](self, "_migrateSettings");
  }
  if (v5)
  {
    -[MCMigrator _migrateClientRestrictions](self, "_migrateClientRestrictions");
    -[MCMigrator _updateClientRestrictions](self, "_updateClientRestrictions");
    -[MCMigrator _updateProfileRestrictions](self, "_updateProfileRestrictions");
    -[MCMigrator _applyImpliedSettings](self, "_applyImpliedSettings");
    -[MCMigrator _migrateSharedDeviceConfiguration](self, "_migrateSharedDeviceConfiguration");
    -[MCMigrator _migrateLostModeLastLocationRequestDate](self, "_migrateLostModeLastLocationRequestDate");
    -[MCMigrator _fixManifestFromStubsIfNecessary](self, "_fixManifestFromStubsIfNecessary");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
    [v8 invalidateCache];

    -[MCMigrator _migrateSupervisionSettings](self, "_migrateSupervisionSettings");
    -[MCMigrator _removeSupervisionProfiles](self, "_removeSupervisionProfiles");
    -[MCMigrator _cleanUpAppConfiguration](self, "_cleanUpAppConfiguration");
    -[MCMigrator _removeUnmanageableApps](self, "_removeUnmanageableApps");
  }

  else
  {
    -[MCMigrator _updateClientRestrictions](self, "_updateClientRestrictions");
    -[MCMigrator _updateProfileRestrictions](self, "_updateProfileRestrictions");
    -[MCMigrator _applyImpliedSettings](self, "_applyImpliedSettings");
    -[MCMigrator _fixManifestFromStubsIfNecessary](self, "_fixManifestFromStubsIfNecessary");
  }

  id v9 = objc_autoreleasePoolPush();
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller"));
  [v10 recomputeProfileRestrictionsWithCompletionBlock:&stru_1000C3598];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v11 systemUserSettings]);
  id v13 = [v12 mutableCopy];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](&OBJC_CLASS___MCHacks, "sharedHacks"));
  [v14 _applyInternalDiagnosticEnforcementToSettings:v13];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](&OBJC_CLASS___MCHacks, "sharedHacks"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 currentRestrictions]);
  [v15 _applyImpliedSettingsToSettingsDictionary:v13 currentSettings:v13 restrictions:v17];

  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v18 setParametersForSettingsByType:v13 sender:@"MCMigrator.Migrate"];

  objc_autoreleasePoolPop(v9);
  if (v5)
  {
    -[MCMigrator _migrateProfileStubsForNetworkExtension](self, "_migrateProfileStubsForNetworkExtension");
    GSFontInitialize(-[MCMigrator _migrateExtensibleSSO](self, "_migrateExtensibleSSO"));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](&OBJC_CLASS___MCHacks, "sharedHacks"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter sharedManager]( &OBJC_CLASS___MCRestrictionManagerWriter,  "sharedManager"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 effectiveUserSettings]);
    [v19 _setRequriesEncryptedBackupInLockdownWithEffectiveUserSettings:v21];

    -[MCMigrator _correctInstallOptionsOnProfileStubs](self, "_correctInstallOptionsOnProfileStubs");
    -[MCMigrator _tagManagedAccounts](self, "_tagManagedAccounts");
    -[MCMigrator _tagIMAPAccountsWithProfileAndPayloadProperties]( self,  "_tagIMAPAccountsWithProfileAndPayloadProperties");
    -[MCMigrator _correctCloudConfigurationIfNecessary](self, "_correctCloudConfigurationIfNecessary");
    -[MCMigrator _validateCloudConfiguration](self, "_validateCloudConfiguration");
    -[MCMigrator _removeLegacyAPNConfigurations](self, "_removeLegacyAPNConfigurations");
    -[MCMigrator _correctMDMConfigurationFile](self, "_correctMDMConfigurationFile");
    -[MCMigrator _checkValidUserEnrollment](self, "_checkValidUserEnrollment");
  }

  else
  {
    GSFontInitialize(-[MCMigrator _migrateExtensibleSSO](self, "_migrateExtensibleSSO"));
  }

  +[MCServerSideHacks setAllowHacksToCallExternalComponents:]( &OBJC_CLASS___MCServerSideHacks,  "setAllowHacksToCallExternalComponents:",  1LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002B460;
  block[3] = &unk_1000C29D0;
  block[4] = self;
  dispatch_async(v4, block);
  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[MCProvisioningProfileJanitor sharedJanitor]( &OBJC_CLASS___MCProvisioningProfileJanitor,  "sharedJanitor"));
  [v22 updateMISTrust];

  uint64_t v23 = MCProductBuildVersion();
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator systemMetadataDictionary](self, "systemMetadataDictionary"));
  uint64_t v26 = kMCMetaLastMigratedBuildKey;
  [v25 setObject:v24 forKey:kMCMetaLastMigratedBuildKey];
  -[MCMigrator setSystemMetadataDictionary:](self, "setSystemMetadataDictionary:", v25);
  id v27 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator userMetadataDictionary](self, "userMetadataDictionary"));
  [v27 setObject:v24 forKey:v26];
  -[MCMigrator setUserMetadataDictionary:](self, "setUserMetadataDictionary:", v27);
  uint64_t v28 = _MCLogObjects[12];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Managed Configuration completed migration.",  buf,  2u);
  }
}

- (void)_createDirectoryAtPath:(id)a3
{
  id v7 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  unsigned __int8 v5 = [v4 fileExistsAtPath:v7];

  if ((v5 & 1) == 0)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
    [v6 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:0];
  }
}

- (void)_createDirectoryAtPath:(id)a3 attributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  unsigned __int8 v9 = [v8 fileExistsAtPath:v6];

  if ((v9 & 1) == 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
    id v13 = 0LL;
    [v10 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:v7 error:&v13];
    id v11 = v13;

    if (v11)
    {
      BOOL v12 = _MCLogObjects[12];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v15 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to create directory with error %{public}@",  buf,  0xCu);
      }
    }
  }
}

- (void)_fixDirectoryAtPath:(id)a3 permissions:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  unsigned int v8 = [v7 fileExistsAtPath:v10];

  if (v8)
  {
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
    [v9 setAttributes:v6 ofItemAtPath:v10 error:0];
  }
}

- (void)_createDirectories
{
  uint64_t v3 = objc_autoreleasePoolPush();
  uint64_t v4 = MCSystemPreferencesDirectory();
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[MCMigrator _createDirectoryAtPath:](self, "_createDirectoryAtPath:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", 493LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v6,  NSFilePosixPermissions));

  uint64_t v8 = MCLegacyProfileStorageDirectory();
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[MCMigrator _fixDirectoryAtPath:permissions:](self, "_fixDirectoryAtPath:permissions:", v9, v7);

  uint64_t v10 = MCSystemPreferencesDirectory();
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[MCMigrator _fixDirectoryAtPath:permissions:](self, "_fixDirectoryAtPath:permissions:", v11, v7);

  uint64_t v12 = MCLegacyPublicInfoDirectory();
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[MCMigrator _fixDirectoryAtPath:permissions:](self, "_fixDirectoryAtPath:permissions:", v13, v7);

  objc_autoreleasePoolPop(v3);
}

- (void)_removeInvalidOptionsFromLegacyCloudConfiguration
{
  uint64_t v3 = objc_autoreleasePoolPush();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  uint64_t v5 = MCLegacyCloudConfigurationDetailsFilePath();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  unsigned int v7 = [v4 fileExistsAtPath:v6];

  if (v7)
  {
    uint64_t v8 = MCLegacyCloudConfigurationDetailsFilePath();
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  v9));

    uint64_t v11 = kCCIsMultiUserKey;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:kCCIsMultiUserKey]);
    unsigned int v13 = [v12 BOOLValue];

    if (v13)
    {
      [v10 removeObjectForKey:v11];
      id v14 = _MCLogObjects[12];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Removing invalid options from legacy cloud configuration...",  v17,  2u);
      }

      uint64_t v15 = MCLegacyCloudConfigurationDetailsFilePath();
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      [v10 MCWriteToBinaryFile:v16];
    }
  }

  objc_autoreleasePoolPop(v3);
}

- (void)_createSystemGroupContainerAndMoveFiles
{
  uint64_t v3 = objc_autoreleasePoolPush();
  uint64_t v4 = _MCLogObjects[12];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Migrating legacy profile storage directory to system group container...",  buf,  2u);
  }

  uint64_t v5 = MCSystemPublicInfoDirectory( -[MCMigrator _createSystemProfileStorageDirectoryMigratingFromLegacyStorageIfNecessary]( self,  "_createSystemProfileStorageDirectoryMigratingFromLegacyStorageIfNecessary"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator _attributesForSystemProfileStorageItems](self, "_attributesForSystemProfileStorageItems"));
  -[MCMigrator _createDirectoryAtPath:attributes:](self, "_createDirectoryAtPath:attributes:", v6, v7);

  uint64_t v8 = MCUserProfileStorageDirectory();
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator _attributesForUserProfileStorageItem](self, "_attributesForUserProfileStorageItem"));
  -[MCMigrator _createDirectoryAtPath:attributes:](self, "_createDirectoryAtPath:attributes:", v9, v10);

  uint64_t v11 = MCUserPublicInfoDirectory();
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator _attributesForUserProfileStorageItem](self, "_attributesForUserProfileStorageItem"));
  -[MCMigrator _createDirectoryAtPath:attributes:](self, "_createDirectoryAtPath:attributes:", v12, v13);

  -[MCMigrator _fixPermissionsOnTheSystemProfileLibraryDirectoryAndContents]( self,  "_fixPermissionsOnTheSystemProfileLibraryDirectoryAndContents");
  -[MCMigrator _sendCloudConfigurationChangedNotificationIfWeMigratedLegacyProfileStorage]( self,  "_sendCloudConfigurationChangedNotificationIfWeMigratedLegacyProfileStorage");
  id v14 = _MCLogObjects[12];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Completed system group container migration.",  v15,  2u);
  }

  objc_autoreleasePoolPop(v3);
}

- (void)_fixPermissionsOnTheSystemProfileLibraryDirectoryAndContents
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  uint64_t v3 = MCSystemProfileLibraryDirectory();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v8 = 0LL;
  char v5 = MCFixPermissionsOfSystemGroupContainerDirectoryAndContentsFM(v2, v4, &v8);
  id v6 = v8;

  if ((v5 & 1) == 0)
  {
    if ([v6 count])
    {
      unsigned int v7 = _MCLogObjects[12];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v10 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Failed to fix permissions of device profile library with errors %{public}@",  buf,  0xCu);
      }
    }
  }
}

- (void)_sendCloudConfigurationChangedNotificationIfWeMigratedLegacyProfileStorage
{
  if (-[MCMigrator systemProfileStorageWasMigratedFromLegacyStorage]( self,  "systemProfileStorageWasMigratedFromLegacyStorage"))
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(-[MCMigrator notifier](self, "notifier"));
    [v3 sendCloudConfigurationDetailsChangedNotification];
  }

- (void)_createSystemProfileStorageDirectoryMigratingFromLegacyStorageIfNecessary
{
  if (-[MCMigrator _shouldAttemptToMigrateLegacyProfileStorage](self, "_shouldAttemptToMigrateLegacyProfileStorage")) {
    -[MCMigrator _migrateLegacySystemProfileStorage](self, "_migrateLegacySystemProfileStorage");
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  uint64_t v4 = MCSystemProfileStorageDirectory();
  char v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unsigned __int8 v6 = [v3 fileExistsAtPath:v5];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = MCSystemProfileStorageDirectory();
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( -[MCMigrator _attributesForSystemProfileStorageItems]( self,  "_attributesForSystemProfileStorageItems"));
    -[MCMigrator _createDirectoryAtPath:attributes:](self, "_createDirectoryAtPath:attributes:", v8, v9);
  }

  -[MCMigrator _removeLegacyProfileStorageDirectory](self, "_removeLegacyProfileStorageDirectory");
}

- (void)_migrateLegacySystemProfileStorage
{
  uint64_t v3 = MCLegacyProfileStorageDirectory( -[MCMigrator _removeExistingSystemProfileStorageDirectoryBlockingMigration]( self,  "_removeExistingSystemProfileStorageDirectoryBlockingMigration"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = MCSystemProfileStorageDirectory();
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v14 = 0LL;
  unsigned __int8 v7 = -[MCMigrator _copyAlmostAtomicallyItemAtPath:toPath:error:]( self,  "_copyAlmostAtomicallyItemAtPath:toPath:error:",  v4,  v6,  &v14);
  id v8 = v14;

  if ((v7 & 1) == 0)
  {
    unsigned __int8 v9 = _MCLogObjects[12];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Failed to move legacy profile storage with error %{public}@",  buf,  0xCu);
    }
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  uint64_t v11 = MCSystemProfileStorageDirectory();
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  unsigned int v13 = [v10 fileExistsAtPath:v12];

  if (v13)
  {
    -[MCMigrator _setAttributesOnSystemProfileStorageDirectory](self, "_setAttributesOnSystemProfileStorageDirectory");
    -[MCMigrator setSystemProfileStorageWasMigratedFromLegacyStorage:]( self,  "setSystemProfileStorageWasMigratedFromLegacyStorage:",  1LL);
  }
}

- (void)_removeExistingSystemProfileStorageDirectoryBlockingMigration
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  uint64_t v3 = MCSystemProfileStorageDirectory();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v12 = 0LL;
  unsigned int v5 = [v2 removeItemAtPath:v4 error:&v12];
  id v6 = v12;

  unsigned __int8 v7 = _MCLogObjects[12];
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v8 = "Removed the system profile storage directory blocking migration from legacy directory";
      unsigned __int8 v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
      uint32_t v11 = 2;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, buf, v11);
    }
  }

  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = v6;
    id v8 = "Failed to remove the system profile storage directory blocking migration from legacy directory, error: %{public}@";
    unsigned __int8 v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
    uint32_t v11 = 12;
    goto LABEL_6;
  }
}

- (void)_setAttributesOnSystemProfileStorageDirectory
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator _attributesForSystemProfileStorageItems](self, "_attributesForSystemProfileStorageItems"));
  uint64_t v5 = MCSystemProfileStorageDirectory();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v10 = 0LL;
  unsigned __int8 v7 = [v3 setAttributes:v4 ofItemAtPath:v6 error:&v10];
  id v8 = v10;

  if ((v7 & 1) == 0)
  {
    unsigned __int8 v9 = _MCLogObjects[12];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Failed to set permissions on new profile storage directory with error %{public}@",  buf,  0xCu);
    }
  }
}

- (id)_attributesForSystemProfileStorageItems
{
  return -[MCMigrator _attributeDictionaryForProfileStorageWithPosixPermissions:]( self,  "_attributeDictionaryForProfileStorageWithPosixPermissions:",  511LL);
}

- (id)_attributesForUserProfileStorageItem
{
  return -[MCMigrator _attributeDictionaryForProfileStorageWithPosixPermissions:]( self,  "_attributeDictionaryForProfileStorageWithPosixPermissions:",  493LL);
}

- (id)_attributeDictionaryForProfileStorageWithPosixPermissions:(unint64_t)a3
{
  v6[0] = NSFilePosixPermissions;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", a3));
  v6[1] = NSFileProtectionKey;
  v7[0] = v3;
  v7[1] = NSFileProtectionNone;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL));

  return v4;
}

- (BOOL)_copyAlmostAtomicallyItemAtPath:(id)a3 toPath:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByDeletingLastPathComponent]);
  uint32_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 lastPathComponent]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 stringByAppendingString:@".temporary"]);
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathComponent:v12]);
  if ((MCDestinationPathIsSafeFromSymlinkAttacks(v8) & 1) == 0)
  {
    id v14 = _MCLogObjects[12];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v32 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_FAULT,  "Destination path contains suspicious symlink: %{public}@",  buf,  0xCu);
    }
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  [v15 removeItemAtPath:v13 error:0];

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  id v30 = 0LL;
  unsigned __int8 v17 = [v16 copyItemAtPath:v9 toPath:v13 error:&v30];

  id v18 = v30;
  if ((v17 & 1) != 0)
  {
    id v27 = a5;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
    id v29 = 0LL;
    unsigned __int8 v20 = [v19 moveItemAtPath:v13 toPath:v8 error:&v29];
    id v21 = v29;

    if ((v20 & 1) == 0)
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
      id v28 = 0LL;
      unsigned __int8 v23 = [v22 removeItemAtPath:v13 error:&v28];
      id v26 = v28;

      if ((v23 & 1) == 0)
      {
        uint64_t v24 = _MCLogObjects[12];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v32 = v26;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Failed to clean up temporary item when copy failed, error %{public}@",  buf,  0xCu);
        }
      }

      if (v27) {
        *id v27 = v21;
      }
    }
  }

  else
  {
    unsigned __int8 v20 = 0;
    if (a5) {
      *a5 = v18;
    }
  }

  return v20;
}

- (BOOL)_shouldAttemptToMigrateLegacyProfileStorage
{
  BOOL v3 = -[MCMigrator _isLegacyProfileStoragePresent](self, "_isLegacyProfileStoragePresent");
  if (v3)
  {
    uint64_t v4 = MCLegacyProfileStorageDirectory(v3);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    unsigned int v6 = !-[MCMigrator _isDirectoryEmptyAtPath:](self, "_isDirectoryEmptyAtPath:", v5);
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)_isLegacyProfileStoragePresent
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  uint64_t v3 = MCLegacyProfileStorageDirectory(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unsigned __int8 v5 = [v2 fileExistsAtPath:v4 isDirectory:&v7];

  if (v7) {
    return v5;
  }
  else {
    return 0;
  }
}

- (BOOL)_isDirectoryEmptyAtPath:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 contentsOfDirectoryAtPath:v4 error:0]);

  if (v6) {
    BOOL v7 = [v6 count] == 0;
  }
  else {
    BOOL v7 = 1;
  }

  return v7;
}

- (void)_removeLegacyProfileStorageDirectory
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  uint64_t v3 = MCLegacyProfileStorageDirectory(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v10 = 0LL;
  unsigned __int8 v5 = [v2 removeItemAtPath:v4 error:&v10];
  id v6 = v10;

  if ((v5 & 1) == 0)
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
    if ([v7 isEqualToString:NSCocoaErrorDomain])
    {
      id v8 = [v6 code];

      if (v8 == (id)4) {
        goto LABEL_8;
      }
    }

    else
    {
    }

    id v9 = _MCLogObjects[12];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Failed to delete legacy profile storage with error %{public}@",  buf,  0xCu);
    }
  }

- (void)_moveFilesToPublicDirectories
{
  uint64_t v3 = objc_autoreleasePoolPush();
  uint64_t v4 = MCSystemProfileStorageDirectory();
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"Truth.plist"]);

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  uint64_t v8 = MCRestrictionsFilePath();
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v7 moveItemAtPath:v6 toPath:v9 error:0];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  uint64_t v11 = MCEffectiveUserSettingsFilePath();
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v10 removeItemAtPath:v12 error:0];

  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  uint64_t v14 = MCPublicEffectiveUserSettingsFilePath();
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  [v13 removeItemAtPath:v15 error:0];

  uint64_t v16 = MCSystemProfileStorageDirectory();
  unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 stringByAppendingPathComponent:@"MCMeta.plist"]);

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  uint64_t v21 = MCSystemMetadataFilePath(v19, v20);
  id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  [v19 moveItemAtPath:v18 toPath:v22 error:0];

  objc_autoreleasePoolPop(v3);
}

- (void)_migrateManifestLocation
{
  uint64_t v3 = objc_autoreleasePoolPush();
  uint64_t v4 = _MCLogObjects[12];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Beginning manifest migration...", buf, 2u);
  }

  uint64_t v5 = MCSystemProfileStorageDirectory();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"PayloadManifest.plist"]);

  uint64_t v8 = MCSystemProfileStorageDirectory();
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathComponent:@"PayloadManifest2.plist"]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  unsigned int v12 = [v11 fileExistsAtPath:v7];

  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  unsigned int v14 = [v13 fileExistsAtPath:v10];

  if ((v12 & 1) != 0 || v14)
  {
    if (v12)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v7));
      if (v15)
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization MCSafePropertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "MCSafePropertyListWithData:options:format:error:",  v15,  0LL,  0LL,  0LL));
        if (v16)
        {
          uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
          {
            char v18 = 1;
            int v19 = 2;
            goto LABEL_14;
          }

          uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSArray);
          if ((objc_opt_isKindOfClass(v16, v35) & 1) != 0)
          {
            int v19 = 1;
            char v18 = 1;
LABEL_14:

            if (v14)
            {
              uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v10));
              if (v20)
              {
                uint64_t v21 = (void *)v20;
                id v22 = _MCLogObjects[12];
                BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
                if (v23)
                {
                  *(_WORD *)id v39 = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "Migrating manifest from new path",  v39,  2u);
                }

                uint64_t v24 = MCSystemManifestPath(v23);
                v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
                [v21 MCWriteToBinaryFile:v25];

                id v26 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
                [v26 removeItemAtPath:v10 error:0];

LABEL_28:
                unsigned int v34 = _MCLogObjects[12];
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)v36 = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Completed manifest migration.",  v36,  2u);
                }

                goto LABEL_31;
              }

              id v27 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
              [v27 removeItemAtPath:v10 error:0];
            }

            id v28 = _MCLogObjects[12];
            BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
            char v30 = v18 ^ 1;
            if (v19 != 1) {
              char v30 = 1;
            }
            if ((v30 & 1) != 0)
            {
              if (v29)
              {
                *(_WORD *)v37 = 0;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Not migrating manifest", v37, 2u);
              }
            }

            else
            {
              if (v29)
              {
                *(_WORD *)id v38 = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "Migrating old-format manifest",  v38,  2u);
              }

              uint64_t v31 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  1LL);
              uint64_t v32 = MCSystemManifestPath(-[NSMutableDictionary setObject:forKey:](v31, "setObject:forKey:", v16, @"OrderedProfiles"));
              v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
              -[NSMutableDictionary MCWriteToBinaryFile:](v31, "MCWriteToBinaryFile:", v33);
            }

            goto LABEL_28;
          }
        }
      }

      else
      {
        uint64_t v16 = 0LL;
      }
    }

    else
    {
      uint64_t v16 = 0LL;
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
    [v15 removeItemAtPath:v7 error:0];
    int v19 = 0;
    char v18 = 0;
    goto LABEL_14;
  }

- (void)_removeUnusedManifestArrays
{
  uint64_t v3 = objc_autoreleasePoolPush();
  uint64_t v4 = MCSystemProfileStorageDirectory();
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"PayloadManifest.plist"]);

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v6));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization MCSafePropertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "MCSafePropertyListWithData:options:format:error:",  v7,  2LL,  0LL,  0LL));

  if (v8 && (uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v8, v9) & 1) != 0))
  {
    [v8 removeObjectForKey:@"DisabledProfiles"];
    [v8 removeObjectForKey:@"MissingProfiles"];
    [v8 MCWriteToBinaryFile:v6];
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
    [v10 removeItemAtPath:v6 error:0];
  }

  objc_autoreleasePoolPop(v3);
}

- (void)_removeDuplicatedHiddenIdentifiers
{
  uint64_t v3 = objc_autoreleasePoolPush();
  uint64_t v4 = _MCLogObjects[12];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Removing duplicated hidden profile identifiers...",  buf,  2u);
  }

  uint64_t v5 = MCSystemProfileStorageDirectory();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"PayloadManifest.plist"]);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v7));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization MCSafePropertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "MCSafePropertyListWithData:options:format:error:",  v8,  2LL,  0LL,  0LL));

  if (v9 && (uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v9, v10) & 1) != 0))
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"OrderedProfiles"]);
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"HiddenProfiles"]);
    unsigned int v13 = v12;
    if (v11 && v12)
    {
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v20;
        do
        {
          for (i = 0LL; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v20 != v16) {
              objc_enumerationMutation(v13);
            }
            [v11 removeObject:*(void *)(*((void *)&v19 + 1) + 8 * (void)i)];
          }

          id v15 = [v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }

        while (v15);
      }

      [v9 MCWriteToBinaryFile:v7];
    }
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
    [v11 removeItemAtPath:v7 error:0];
  }

  char v18 = _MCLogObjects[12];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Completed removing duplicated hidden profile identifiers.",  buf,  2u);
  }

  objc_autoreleasePoolPop(v3);
}

- (void)_createStubs
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = _MCLogObjects[12];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Creating stubs...", buf, 2u);
  }

  uint64_t v4 = MCSystemProfileStorageDirectory();
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"PayloadManifest.plist"]);

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v6));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization MCSafePropertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "MCSafePropertyListWithData:options:format:error:",  v7,  0LL,  0LL,  0LL));

  if (v8)
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    {
      int v42 = v6;
      __int128 v43 = v2;
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"HiddenProfiles"]);
      id v11 = [v10 mutableCopy];

      id v41 = v8;
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"OrderedProfiles"]);
      [v11 addObjectsFromArray:v12];

      __int128 v51 = 0u;
      __int128 v52 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      id obj = v11;
      unsigned int v13 = &MailAccountHostname_ptr;
      id v46 = [obj countByEnumeratingWithState:&v49 objects:v61 count:16];
      if (!v46) {
        goto LABEL_21;
      }
      uint64_t v45 = *(void *)v50;
      while (1)
      {
        for (i = 0LL; i != v46; i = (char *)i + 1)
        {
          if (*(void *)v50 != v45) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)i);
          uint64_t v16 = objc_autoreleasePoolPush();
          uint64_t v17 = MCSystemProfileStorageDirectory();
          char v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v15 MCOldStyleSafeFilenameHash]);
          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v18 stringByAppendingPathComponent:v19]);

          uint64_t v21 = MCSystemProfileStorageDirectory();
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
          BOOL v23 = (void *)objc_claimAutoreleasedReturnValue([v15 MCOldStyleSafeFilenameHashWithExtension:@"stub"]);
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v22 stringByAppendingPathComponent:v23]);

          uint64_t v25 = MCSystemProfileStorageDirectory();
          id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
          id v27 = (void *)objc_claimAutoreleasedReturnValue([v15 MCHashedFilenameWithExtension:@"stub"]);
          id v28 = (void *)objc_claimAutoreleasedReturnValue([v26 stringByAppendingPathComponent:v27]);

          BOOL v29 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
          LODWORD(v27) = [v29 fileExistsAtPath:v20];

          if ((_DWORD)v27)
          {
            char v30 = (void *)objc_claimAutoreleasedReturnValue([v13[133] dataWithContentsOfFile:v20]);
            id v31 = (id)objc_claimAutoreleasedReturnValue( +[MCProfile profileWithData:outError:]( &OBJC_CLASS___MCProfile,  "profileWithData:outError:",  v30,  0LL));

            if (v31)
            {
              uint64_t v32 = objc_opt_class(&OBJC_CLASS___MCConfigurationProfile);
              if ((objc_opt_isKindOfClass(v31, v32) & 1) != 0) {
                [v31 writeStubToPath:v28];
              }
            }
          }

          else
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
            unsigned int v34 = [v33 fileExistsAtPath:v24];

            if (!v34) {
              goto LABEL_19;
            }
            uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
            id v48 = 0LL;
            [v35 moveItemAtPath:v24 toPath:v28 error:&v48];
            id v31 = v48;

            if (v31)
            {
              os_log_t v36 = _MCLogObjects[12];
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                v37 = v36;
                id v38 = [v31 code];
                id v39 = (void *)objc_claimAutoreleasedReturnValue([v31 domain]);
                *(_DWORD *)buf = 138544130;
                v54 = v24;
                __int16 v55 = 2114;
                uint64_t v56 = v28;
                __int16 v57 = 2048;
                id v58 = v38;
                __int16 v59 = 2114;
                uint64_t v60 = v39;
                _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "Could not move profile from %{public}@ to %{public}@. Error: %ld / %{public}@",  buf,  0x2Au);

                unsigned int v13 = &MailAccountHostname_ptr;
              }
            }
          }

LABEL_19:
          objc_autoreleasePoolPop(v16);
        }

        id v46 = [obj countByEnumeratingWithState:&v49 objects:v61 count:16];
        if (!v46)
        {
LABEL_21:

          uint64_t v40 = _MCLogObjects[12];
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Completed creating stubs.", buf, 2u);
          }

          id v6 = v42;
          uint64_t v2 = v43;
          uint64_t v8 = v41;
          break;
        }
      }
    }
  }

  objc_autoreleasePoolPop(v2);
}

- (void)_removeOrphanedManifestEntries
{
  uint64_t v3 = objc_autoreleasePoolPush();
  uint64_t v4 = _MCLogObjects[12];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removing orphaned profiles...", buf, 2u);
  }

  uint64_t v5 = MCSystemProfileStorageDirectory();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( -[MCMigrator _removeOrphanedManifestEntriesFromManifestInDirectory:]( self,  "_removeOrphanedManifestEntriesFromManifestInDirectory:",  v6));

  if (v7)
  {
    uint64_t v9 = MCSystemManifestPath(v8);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    [v7 MCWriteToBinaryFile:v10];
  }

  uint64_t v11 = MCUserProfileStorageDirectory();
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( -[MCMigrator _removeOrphanedManifestEntriesFromManifestInDirectory:]( self,  "_removeOrphanedManifestEntriesFromManifestInDirectory:",  v12));

  if (v13)
  {
    uint64_t v14 = MCUserManifestPath();
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    [v13 MCWriteToBinaryFile:v15];
  }

  uint64_t v16 = _MCLogObjects[12];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Completed removing orphaned profiles...",  v17,  2u);
  }

  objc_autoreleasePoolPop(v3);
}

- (id)_removeOrphanedManifestEntriesFromManifestInDirectory:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"PayloadManifest.plist"]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization MCSafePropertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "MCSafePropertyListWithData:options:format:error:",  v5,  1LL,  0LL,  0LL));

  if (v6 && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v6, v7) & 1) != 0))
  {
    uint64_t v32 = v4;
    v33 = v6;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"OrderedProfiles"]);
    id obj = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v8 count]));
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v41;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v41 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 MCHashedFilenameWithExtension:@"stub"]);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:v15]);

          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v16));
          char v18 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfile profileWithData:outError:]( &OBJC_CLASS___MCProfile,  "profileWithData:outError:",  v17,  0LL));

          if (v18) {
            [obj addObject:v14];
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }

      while (v11);
    }

    [v33 setObject:obj forKey:@"OrderedProfiles"];
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKey:@"HiddenProfiles"]);
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v19 count]));
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id obja = v19;
    id v21 = [obja countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v37;
      do
      {
        for (j = 0LL; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v37 != v23) {
            objc_enumerationMutation(obja);
          }
          uint64_t v25 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)j);
          id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 MCHashedFilenameWithExtension:@"stub"]);
          id v27 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:v26]);

          id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v27));
          BOOL v29 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfile profileWithData:outError:]( &OBJC_CLASS___MCProfile,  "profileWithData:outError:",  v28,  0LL));

          if (v29) {
            [v20 addObject:v25];
          }
        }

        id v22 = [obja countByEnumeratingWithState:&v36 objects:v44 count:16];
      }

      while (v22);
    }

    id v6 = v33;
    [v33 setObject:v20 forKey:@"HiddenProfiles"];

    id v30 = v33;
    uint64_t v4 = v32;
  }

  else
  {
    id v30 = 0LL;
  }

  return v30;
}

- (void)_moveSignerCertificatesInProfileStubDictionary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"ProfileData"]);
  if (v4)
  {
    id v20 = 0LL;
    id v5 =  +[MCProfile dataFromCMSEncodedData:outSignerCertificates:]( &OBJC_CLASS___MCProfile,  "dataFromCMSEncodedData:outSignerCertificates:",  v4,  &v20);
    id v6 = v20;
    if ([v6 count])
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      id v8 = v6;
      id v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v17;
        do
        {
          uint64_t v12 = 0LL;
          do
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            unsigned int v13 = *(__SecCertificate **)(*((void *)&v16 + 1) + 8LL * (void)v12);
            uint64_t v14 = objc_autoreleasePoolPush();
            CFDataRef v15 = SecCertificateCopyData(v13);
            if (v15) {
              objc_msgSend(v7, "addObject:", v15, (void)v16);
            }

            objc_autoreleasePoolPop(v14);
            uint64_t v12 = (char *)v12 + 1;
          }

          while (v10 != v12);
          id v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
        }

        while (v10);
      }

      [v3 setObject:v7 forKeyedSubscript:@"SignerCerts"];
    }

    objc_msgSend(v3, "removeObjectForKey:", @"ProfileData", (void)v16);
    [v3 removeObjectForKey:@"SignerSummary"];
  }
}

- (void)_transferSignerCertificates
{
  id v3 = objc_autoreleasePoolPush();
  uint64_t v4 = _MCLogObjects[12];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Transferring profile signer certificates...",  buf,  2u);
  }

  uint64_t v5 = MCSystemProfileStorageDirectory();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"PayloadManifest.plist"]);

  id v8 = &MailAccountHostname_ptr;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v7));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization MCSafePropertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "MCSafePropertyListWithData:options:format:error:",  v9,  0LL,  0LL,  0LL));

  if (v10)
  {
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    {
      __int128 v52 = v7;
      uint64_t v53 = v3;
      uint64_t v56 = self;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"HiddenProfiles"]);
      id v13 = [v12 mutableCopy];

      __int128 v51 = v10;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"OrderedProfiles"]);
      [v13 addObjectsFromArray:v14];

      __int128 v66 = 0u;
      __int128 v67 = 0u;
      __int128 v64 = 0u;
      __int128 v65 = 0u;
      id obj = v13;
      CFDataRef v15 = &MailAccountHostname_ptr;
      id v57 = [obj countByEnumeratingWithState:&v64 objects:v70 count:16];
      if (v57)
      {
        uint64_t v16 = *(void *)v65;
        uint64_t v54 = *(void *)v65;
        do
        {
          for (i = 0LL; i != v57; i = (char *)i + 1)
          {
            if (*(void *)v65 != v16) {
              objc_enumerationMutation(obj);
            }
            __int128 v18 = *(void **)(*((void *)&v64 + 1) + 8LL * (void)i);
            __int128 v19 = objc_autoreleasePoolPush();
            uint64_t v20 = MCSystemProfileStorageDirectory();
            id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
            id v22 = (void *)objc_claimAutoreleasedReturnValue([v18 MCOldStyleSafeFilenameHash]);
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v21 stringByAppendingPathComponent:v22]);

            uint64_t v24 = MCSystemProfileStorageDirectory();
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
            id v26 = (void *)objc_claimAutoreleasedReturnValue([v18 MCHashedFilenameWithExtension:@"stub"]);
            id v27 = (void *)objc_claimAutoreleasedReturnValue([v25 stringByAppendingPathComponent:v26]);

            id v28 = (void *)objc_claimAutoreleasedReturnValue([v8[133] dataWithContentsOfFile:v27]);
            BOOL v29 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfile profileWithData:outError:]( &OBJC_CLASS___MCProfile,  "profileWithData:outError:",  v28,  0LL));

            id v30 = (void *)objc_claimAutoreleasedReturnValue([v8[133] dataWithContentsOfFile:v23]);
            if (v30) {
              BOOL v31 = v29 == 0LL;
            }
            else {
              BOOL v31 = 1;
            }
            if (!v31)
            {
              id v63 = 0LL;
              id v32 = (id)objc_claimAutoreleasedReturnValue( +[MCProfile dataFromCMSEncodedData:outSignerCertificates:]( &OBJC_CLASS___MCProfile,  "dataFromCMSEncodedData:outSignerCertificates:",  v30,  &v63));
              id v33 = v63;
              if (!v32) {
                id v32 = v30;
              }
              unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue( [v15[152] MCSafePropertyListWithData:v32 options:0 format:0 error:0]);
              if (v34
                && (uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v34, v35) & 1) != 0))
              {
                __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKey:@"EncryptedPayloadContent"]);

                BOOL v31 = v36 == 0LL;
                CFDataRef v15 = &MailAccountHostname_ptr;
                uint64_t v37 = !v31;
              }

              else
              {
                uint64_t v37 = 0LL;
              }

              [v29 setEncrypted:v37];
              if ([v33 count]) {
                [v29 setSignerCertificates:v33];
              }
              [v29 writeStubToPath:v27];

              id v8 = &MailAccountHostname_ptr;
              uint64_t v16 = v54;
            }

            objc_autoreleasePoolPop(v19);
          }

          id v57 = [obj countByEnumeratingWithState:&v64 objects:v70 count:16];
        }

        while (v57);
      }

      __int128 v61 = 0u;
      __int128 v62 = 0u;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      id v58 = obj;
      id v38 = [v58 countByEnumeratingWithState:&v59 objects:v69 count:16];
      if (v38)
      {
        id v39 = v38;
        uint64_t v40 = *(void *)v60;
        do
        {
          for (j = 0LL; j != v39; j = (char *)j + 1)
          {
            if (*(void *)v60 != v40) {
              objc_enumerationMutation(v58);
            }
            __int128 v42 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)j);
            uint64_t v43 = MCSystemProfileStorageDirectory();
            __int128 v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
            uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v42 MCHashedFilenameWithExtension:@"stub"]);
            id v46 = (void *)objc_claimAutoreleasedReturnValue([v44 stringByAppendingPathComponent:v45]);

            __int128 v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  v46));
            if (v47)
            {
              -[MCMigrator _moveSignerCertificatesInProfileStubDictionary:]( v56,  "_moveSignerCertificatesInProfileStubDictionary:",  v47);
              id v48 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:@"OTAProfileStub"]);
              id v49 = [v48 mutableCopy];

              if (v49)
              {
                -[MCMigrator _moveSignerCertificatesInProfileStubDictionary:]( v56,  "_moveSignerCertificatesInProfileStubDictionary:",  v49);
                [v47 setObject:v49 forKeyedSubscript:@"OTAProfileStub"];
              }

              [v47 MCWriteToBinaryFile:v46];
            }
          }

          id v39 = [v58 countByEnumeratingWithState:&v59 objects:v69 count:16];
        }

        while (v39);
      }

      __int128 v50 = _MCLogObjects[12];
      uint64_t v7 = v52;
      id v3 = v53;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "Completed transferring profile signer certificates.",  buf,  2u);
      }

      id v10 = v51;
    }
  }

  objc_autoreleasePoolPop(v3);
}

- (void)_transferRemovalPasswordsFromOriginalProfiles
{
  context = objc_autoreleasePoolPush();
  uint64_t v2 = _MCLogObjects[12];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Migrating profile removal passwords...",  buf,  2u);
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifiersOfInstalledProfilesWithFilterFlags:3]);

  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id obj = v4;
  id v38 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v45;
    uint64_t v5 = &MailAccountHostname_ptr;
    do
    {
      for (i = 0LL; i != v38; i = (char *)i + 1)
      {
        if (*(void *)v45 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
        id v8 = objc_autoreleasePoolPush();
        uint64_t v9 = MCSystemProfileStorageDirectory();
        id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 MCOldStyleSafeFilenameHash]);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathComponent:v11]);

        id v13 = (void *)objc_claimAutoreleasedReturnValue([v5[133] dataWithContentsOfFile:v12]);
        if (v13)
        {
          id v39 = v8;
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfile profileWithData:outError:]( &OBJC_CLASS___MCProfile,  "profileWithData:outError:",  v13,  0LL));
          uint64_t v15 = MCSystemProfileStorageDirectory();
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v7 MCHashedFilenameWithExtension:@"stub"]);
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v16 stringByAppendingPathComponent:v17]);

          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v5[133] dataWithContentsOfFile:v18]);
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfile profileWithData:outError:]( &OBJC_CLASS___MCProfile,  "profileWithData:outError:",  v19,  0LL));

          uint64_t v21 = objc_opt_class(&OBJC_CLASS___MCConfigurationProfile);
          if ((objc_opt_isKindOfClass(v14, v21) & 1) != 0 && v20)
          {
            objc_msgSend(v20, "setLocked:", objc_msgSend(v14, "isLocked"));
            id v22 = (void *)objc_claimAutoreleasedReturnValue([v14 removalPasscode]);
            if (v22)
            {
              uint64_t v35 = v14;
              [v20 setRemovalPasscode:v22];
              __int128 v42 = 0u;
              __int128 v43 = 0u;
              __int128 v40 = 0u;
              __int128 v41 = 0u;
              uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v20 payloads]);
              id v24 = [v23 countByEnumeratingWithState:&v40 objects:v49 count:16];
              if (v24)
              {
                id v25 = v24;
                uint64_t v26 = *(void *)v41;
                unsigned int v34 = v22;
                while (2)
                {
                  for (j = 0LL; j != v25; j = (char *)j + 1)
                  {
                    if (*(void *)v41 != v26) {
                      objc_enumerationMutation(v23);
                    }
                    id v28 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)j);
                    uint64_t v29 = objc_opt_class(&OBJC_CLASS___MCRemovalPasswordPayload);
                    if ((objc_opt_isKindOfClass(v28, v29) & 1) != 0)
                    {
                      id v22 = v34;
                      [v28 setRemovalPasscode:v34];
                      goto LABEL_25;
                    }
                  }

                  id v25 = [v23 countByEnumeratingWithState:&v40 objects:v49 count:16];
                  id v22 = v34;
                  if (v25) {
                    continue;
                  }
                  break;
                }
              }

- (void)_migrateOTAProfiles
{
  id v3 = objc_autoreleasePoolPush();
  uint64_t v4 = _MCLogObjects[12];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Migrating OTA profiles...", buf, 2u);
  }

  uint64_t v5 = MCSystemProfileStorageDirectory();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"ProfileService"]);

  uint64_t v8 = MCSystemProfileStorageDirectory();
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathComponent:@"PayloadManifest.plist"]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v7));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization MCSafePropertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "MCSafePropertyListWithData:options:format:error:",  v11,  2LL,  0LL,  0LL));

  if (v12)
  {
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    {
      v86 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"Profile"]);
      __int128 v91 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"Service"]);
      uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"SCEP"]);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v10));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization MCSafePropertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "MCSafePropertyListWithData:options:format:error:",  v14,  2LL,  0LL,  0LL));

      if (v15)
      {
        uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
        {
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"HiddenProfiles"]);
          id v18 = [v17 mutableCopy];

          int v74 = v15;
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"OrderedProfiles"]);
          id v20 = [v19 mutableCopy];

          __int128 v101 = 0u;
          __int128 v102 = 0u;
          __int128 v99 = 0u;
          __int128 v100 = 0u;
          id v21 = v18;
          id v22 = [v21 countByEnumeratingWithState:&v99 objects:v106 count:16];
          if (v22)
          {
            id v23 = v22;
            uint64_t v24 = *(void *)v100;
            do
            {
              for (i = 0LL; i != v23; i = (char *)i + 1)
              {
                if (*(void *)v100 != v24) {
                  objc_enumerationMutation(v21);
                }
                [v20 removeObject:*(void *)(*((void *)&v99 + 1) + 8 * (void)i)];
              }

              id v23 = [v21 countByEnumeratingWithState:&v99 objects:v106 count:16];
            }

            while (v23);
          }

          v78 = self;
          uint64_t v79 = v12;
          v76 = v3;
          v77 = v10;
          v75 = v7;
          id v80 = v21;

          v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
          __int128 v95 = 0u;
          __int128 v96 = 0u;
          __int128 v97 = 0u;
          __int128 v98 = 0u;
          id obj = v20;
          uint64_t v26 = v86;
          id v93 = [obj countByEnumeratingWithState:&v95 objects:v105 count:16];
          if (v93)
          {
            uint64_t v92 = *(void *)v96;
            do
            {
              for (j = 0LL; j != v93; j = (char *)j + 1)
              {
                if (*(void *)v96 != v92) {
                  objc_enumerationMutation(obj);
                }
                id v28 = *(void **)(*((void *)&v95 + 1) + 8LL * (void)j);
                uint64_t v29 = objc_autoreleasePoolPush();
                uint64_t v30 = MCSystemProfileStorageDirectory();
                BOOL v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
                id v32 = (void *)objc_claimAutoreleasedReturnValue([v28 MCHashedFilenameWithExtension:@"stub"]);
                id v33 = (void *)objc_claimAutoreleasedReturnValue([v31 stringByAppendingPathComponent:v32]);

                unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  v33));
                uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKey:@"PayloadUUID"]);
                __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKey:v35]);
                if (v36)
                {
                  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v91 objectForKey:v36]);
                  id v38 = [v37 MCMutableDeepCopy];

                  if (v38)
                  {
                    id v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
                    [v38 setObject:v39 forKey:@"MCProfileIsRemovalStub"];

                    __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKey:@"PayloadContent"]);
                    __int128 v41 = v40;
                    if (v40)
                    {
                      __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v40 objectForKey:@"SCEP"]);
                      if (v42)
                      {
                        __int128 v43 = (void *)objc_claimAutoreleasedReturnValue([v83 objectForKey:v42]);
                        if (v43)
                        {
                          id v84 = v43;
                          __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKey:@"Persistent Reference"]);
                          if (v44)
                          {
                            __int128 v87 = v44;
                            [v81 addObject:v44];
                            [v41 setObject:v87 forKey:@"EnrollmentIdentityPersistentID"];
                            [v41 removeObjectForKey:@"SCEP"];
                            [v34 setObject:v38 forKey:@"OTAProfileStub"];
                            [v34 MCWriteToBinaryFile:v33];
                            log = _MCLogObjects[12];
                            BOOL v45 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
                            __int128 v44 = v87;
                            if (v45)
                            {
                              *(_DWORD *)buf = 138543362;
                              __int128 v104 = v28;
                              _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Migrated OTA profile %{public}@",  buf,  0xCu);
                              __int128 v44 = v87;
                            }
                          }

                          __int128 v43 = v84;
                        }
                      }

                      uint64_t v26 = v86;
                    }
                  }
                }

                objc_autoreleasePoolPop(v29);
              }

              id v93 = [obj countByEnumeratingWithState:&v95 objects:v105 count:16];
            }

            while (v93);
          }

          __int128 v46 = v80;
          id v10 = v77;
          self = v78;
          uint64_t v12 = v79;
          __int128 v47 = &MailAccountHostname_ptr;
          if ([v80 count])
          {
            unint64_t v48 = 0LL;
            do
            {
              id v49 = objc_autoreleasePoolPush();
              __int128 v50 = (void *)objc_claimAutoreleasedReturnValue([v46 objectAtIndex:v48]);
              uint64_t v51 = MCSystemProfileStorageDirectory();
              __int128 v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
              uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v50 MCHashedFilenameWithExtension:@"stub"]);
              uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v52 stringByAppendingPathComponent:v53]);

              __int16 v55 = (void *)objc_claimAutoreleasedReturnValue([v47[136] dictionaryWithContentsOfFile:v54]);
              if (v55 && (uint64_t v56 = objc_opt_class(v47[136]), (objc_opt_isKindOfClass(v55, v56) & 1) != 0))
              {
                id v57 = (void *)objc_claimAutoreleasedReturnValue([v55 objectForKey:@"PayloadContent"]);
                if (v57
                  && (uint64_t v58 = objc_opt_class(&OBJC_CLASS___NSArray), (objc_opt_isKindOfClass(v57, v58) & 1) != 0)
                  && [v57 count])
                {
                  uint64_t v59 = objc_claimAutoreleasedReturnValue([v57 objectAtIndex:0]);
                  __int128 v94 = (void *)v59;
                  if (v59
                    && (__int128 v60 = (void *)v59,
                        uint64_t v61 = objc_opt_class(&OBJC_CLASS___NSDictionary),
                        (objc_opt_isKindOfClass(v60, v61) & 1) != 0))
                  {
                    __int128 v62 = (void *)objc_claimAutoreleasedReturnValue([v60 objectForKey:@"PERSISTENT_REF"]);
                    if (v62 && [v81 containsObject:v62])
                    {
                      id v63 = _MCLogObjects[12];
                      if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138543362;
                        __int128 v104 = v50;
                        _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_INFO,  "Removing unused hidden profile %{public}@",  buf,  0xCu);
                      }

                      [v80 removeObjectAtIndex:v48];
                      __int128 v64 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
                      uint64_t v65 = MCSystemProfileStorageDirectory();
                      __int128 v88 = (void *)objc_claimAutoreleasedReturnValue(v65);
                      __int128 v66 = (void *)objc_claimAutoreleasedReturnValue([v50 MCOldStyleSafeFilenameHash]);
                      __int128 v67 = (void *)objc_claimAutoreleasedReturnValue([v88 stringByAppendingPathComponent:v66]);
                      [v64 removeItemAtPath:v67 error:0];

                      id v85 = (id)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](v78, "fileManager"));
                      uint64_t v68 = MCSystemProfileStorageDirectory();
                      __int128 v89 = (void *)objc_claimAutoreleasedReturnValue(v68);
                      uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue([v50 MCHashedFilenameWithExtension:@"stub"]);
                      v70 = (void *)objc_claimAutoreleasedReturnValue([v89 stringByAppendingPathComponent:v69]);
                      [v85 removeItemAtPath:v70 error:0];

                      self = v78;
                      uint64_t v71 = 0LL;
                      id v10 = v77;
                    }

                    else
                    {
                      uint64_t v71 = 1LL;
                    }

                    uint64_t v12 = v79;
                  }

                  else
                  {
                    uint64_t v71 = 1LL;
                  }
                }

                else
                {
                  uint64_t v71 = 1LL;
                }

                __int128 v47 = &MailAccountHostname_ptr;
              }

              else
              {
                uint64_t v71 = 1LL;
              }

              v48 += v71;
              objc_autoreleasePoolPop(v49);
              __int128 v46 = v80;
            }

            while (v48 < (unint64_t)[v80 count]);
          }

          uint64_t v15 = v74;
          [v74 setObject:v46 forKey:@"HiddenProfiles"];
          [v74 setObject:obj forKey:@"OrderedProfiles"];
          [v74 MCWriteToBinaryFile:v10];

          uint64_t v7 = v75;
          id v3 = v76;
        }
      }
    }
  }

  uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  [v72 removeItemAtPath:v7 error:0];

  v73 = _MCLogObjects[12];
  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "Completed migrating OTA profiles.", buf, 2u);
  }

  objc_autoreleasePoolPop(v3);
}

- (void)_transferInstallationDatesFromOriginalProfiles
{
  context = objc_autoreleasePoolPush();
  id v3 = _MCLogObjects[12];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Transferring installation dates...", buf, 2u);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifiersOfInstalledProfilesWithFilterFlags:3]);

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v33;
    uint64_t v30 = self;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
        uint64_t v11 = objc_autoreleasePoolPush();
        uint64_t v12 = MCSystemProfileStorageDirectory();
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 MCOldStyleSafeFilenameHash]);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 stringByAppendingPathComponent:v14]);

        uint64_t v16 = MCSystemProfileStorageDirectory();
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 MCHashedFilenameWithExtension:@"stub"]);
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v17 stringByAppendingPathComponent:v18]);

        id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  v19));
        id v21 = v20;
        if (v20)
        {
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:@"InstallDate"]);

          if (!v22)
          {
            id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 attributesOfItemAtPath:v15 error:0]);

            if (v24)
            {
              id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKey:NSFileCreationDate]);
              if (!v25)
              {
                id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKey:NSFileModificationDate]);
                if (!v25) {
                  goto LABEL_20;
                }
              }
            }

            else
            {
              uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
              id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 attributesOfItemAtPath:v19 error:0]);

              if (v27)
              {
                id v25 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:NSFileCreationDate]);
                if (!v25) {
                  id v25 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:NSFileModificationDate]);
                }
              }

              else
              {
                id v25 = 0LL;
              }

              self = v30;
              if (!v25) {
                goto LABEL_20;
              }
            }

            [v21 setObject:v25 forKey:@"InstallDate"];
            [v21 MCWriteToBinaryFile:v19];

LABEL_20:
          }
        }

        objc_autoreleasePoolPop(v11);
      }

      id v7 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }

    while (v7);
  }

  id v28 = _MCLogObjects[12];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Completed transferring installation dates.",  buf,  2u);
  }

  objc_autoreleasePoolPop(context);
}

- (BOOL)_applyAccountTagsToProfile:(id)a3
{
  id v3 = a3;
  if (qword_1000DC048 != -1) {
    dispatch_once(&qword_1000DC048, &stru_1000C35B8);
  }
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v21 = v3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 payloads]);
  id v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v5)
  {
    char v7 = 0;
    goto LABEL_22;
  }

  id v6 = v5;
  char v7 = 0;
  uint64_t v8 = *(void *)v23;
  do
  {
    uint64_t v9 = 0LL;
    do
    {
      if (*(void *)v23 != v8) {
        objc_enumerationMutation(v4);
      }
      id v10 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)v9);
      uint64_t v11 = (void *)qword_1000DC050;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 UUID]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v12]);

      if ([v13 length])
      {
        uint64_t v14 = objc_opt_class(&OBJC_CLASS___MCEASAccountPayload);
        if ((objc_opt_isKindOfClass(v10, v14) & 1) != 0
          || (uint64_t v15 = objc_opt_class(&OBJC_CLASS___MCCalDAVAccountPayload), (objc_opt_isKindOfClass(v10, v15) & 1) != 0)
          || (uint64_t v16 = objc_opt_class(&OBJC_CLASS___MCLDAPAccountPayload), (objc_opt_isKindOfClass(v10, v16) & 1) != 0)
          || (uint64_t v17 = objc_opt_class(&OBJC_CLASS___MCSubCalAccountPayload), (objc_opt_isKindOfClass(v10, v17) & 1) != 0))
        {
          [v10 performSelector:"setAccountPersistentUUID:" withObject:v13];
LABEL_14:
          char v7 = 1;
          goto LABEL_15;
        }

        uint64_t v18 = objc_opt_class(&OBJC_CLASS___MCEmailAccountPayload);
        if ((objc_opt_isKindOfClass(v10, v18) & 1) != 0)
        {
          [v10 setPersistentResourceID:v13];
          goto LABEL_14;
        }
      }

- (void)_transferTagsToProfileStubs
{
  context = objc_autoreleasePoolPush();
  uint64_t v2 = _MCLogObjects[12];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Transferring tags to profiles...", buf, 2u);
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifiersOfInstalledProfilesWithFilterFlags:3]);

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        id v10 = objc_autoreleasePoolPush();
        uint64_t v11 = MCSystemProfileStorageDirectory();
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 MCHashedFilenameWithExtension:@"stub"]);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByAppendingPathComponent:v13]);

        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v14));
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfile profileWithData:outError:]( &OBJC_CLASS___MCProfile,  "profileWithData:outError:",  v15,  0LL));

        uint64_t v17 = objc_opt_class(&OBJC_CLASS___MCConfigurationProfile);
        if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0
          && -[MCMigrator _applyAccountTagsToProfile:](self, "_applyAccountTagsToProfile:", v16))
        {
          [v16 writeStubToPath:v14];
        }

        objc_autoreleasePoolPop(v10);
      }

      id v6 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }

    while (v6);
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  uint64_t v19 = MCTagsMappingFilePath(v18);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  [v18 removeItemAtPath:v20 error:0];

  id v21 = _MCLogObjects[12];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Completed transferring tags.", buf, 2u);
  }

  objc_autoreleasePoolPop(context);
}

- (void)_removeOriginalCopies
{
  id v3 = objc_autoreleasePoolPush();
  uint64_t v4 = _MCLogObjects[12];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removing old profile copies...", buf, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifiersOfInstalledProfilesWithFilterFlags:3]);

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        uint64_t v13 = objc_autoreleasePoolPush();
        uint64_t v14 = MCSystemProfileStorageDirectory(v13);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "MCOldStyleSafeFilenameHash", (void)v20));
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 stringByAppendingPathComponent:v16]);

        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
        [v18 removeItemAtPath:v17 error:0];

        objc_autoreleasePoolPop(v13);
      }

      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }

    while (v9);
  }

  uint64_t v19 = _MCLogObjects[12];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Completed removing old profile copies.",  buf,  2u);
  }

  objc_autoreleasePoolPop(v3);
}

- (void)_applyDefaultSettings
{
  context = objc_autoreleasePoolPush();
  uint64_t v2 = _MCLogObjects[12];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Applying default user settings...", buf, 2u);
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](&OBJC_CLASS___MCHacks, "sharedHacks"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 _deviceSpecificDefaultSettings]);

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter sharedManager]( &OBJC_CLASS___MCRestrictionManagerWriter,  "sharedManager"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 systemUserSettings]);
    id v7 = [v6 MCMutableDeepCopy];

    uint64_t v8 = MCRestrictedBoolKey;
    uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:MCRestrictedBoolKey]);
    if (!v54)
    {
      uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      objc_msgSend(v7, "setObject:forKey:");
    }

    uint64_t v9 = MCRestrictedValueKey;
    uint64_t v51 = objc_claimAutoreleasedReturnValue([v7 objectForKey:MCRestrictedValueKey]);
    if (!v51)
    {
      uint64_t v51 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      objc_msgSend(v7, "setObject:forKey:");
    }

    uint64_t v10 = MCAssignedObjectKey;
    uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:MCAssignedObjectKey]);
    if (!v53)
    {
      uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      objc_msgSend(v7, "setObject:forKey:");
    }

    uint64_t v11 = MCIntersectionKey;
    __int128 v52 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:MCIntersectionKey]);
    if (!v52)
    {
      __int128 v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      objc_msgSend(v7, "setObject:forKey:");
    }

    uint64_t v12 = MCUnionKey;
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v7 objectForKey:MCUnionKey]);
    if (!v13)
    {
      uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      [v7 setObject:v13 forKey:v12];
    }

    uint64_t v48 = v12;
    id v49 = (void *)v13;
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v4 objectForKey:v8]);
    uint64_t v15 = (void *)v51;
    __int128 v50 = (void *)v14;
    uint64_t v47 = v11;
    if (v14)
    {
      [v54 MCDeepCopyMissingEntriesFromDictionary:v14];
      uint64_t v16 = MCFeatureDiagnosticsSubmissionModificationAllowed;
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v50 objectForKey:MCFeatureDiagnosticsSubmissionModificationAllowed]);
      uint64_t v18 = objc_claimAutoreleasedReturnValue([v54 objectForKey:v16]);
      uint64_t v19 = (void *)v18;
      if (v17 && v18)
      {
        uint64_t v20 = v10;
        uint64_t v21 = MCSettingParameterValueKey;
        __int128 v22 = v5;
        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:MCSettingParameterValueKey]);
        id v24 = [v23 copy];
        uint64_t v25 = v21;
        uint64_t v10 = v20;
        [v19 setObject:v24 forKey:v25];

        id v5 = v22;
        uint64_t v15 = (void *)v51;
      }

      uint64_t v11 = v47;
    }

    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v9]);
    if (v26)
    {
      uint64_t v45 = v10;
      __int128 v46 = v5;
      [v15 MCDeepCopyMissingEntriesFromDictionary:v26];
      uint64_t v27 = MCFeatureAutoLockTime;
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKey:MCFeatureAutoLockTime]);
      uint64_t v29 = objc_claimAutoreleasedReturnValue([v15 objectForKey:v27]);
      uint64_t v30 = (void *)v29;
      if (v28 && v29)
      {
        uint64_t v31 = MCSettingParameterRangeMinimumKey;
        __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:MCSettingParameterRangeMinimumKey]);
        id v33 = [v32 copy];
        [v30 setObject:v33 forKey:v31];
      }

      uint64_t v34 = MCFeaturePasscodeKeyboardComplexity;
      __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKey:MCFeaturePasscodeKeyboardComplexity]);
      uint64_t v36 = objc_claimAutoreleasedReturnValue([v15 objectForKey:v34]);
      uint64_t v37 = (void *)v36;
      if (v35 && v36)
      {
        uint64_t v38 = MCSettingParameterValueKey;
        id v39 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKey:MCSettingParameterValueKey]);
        id v40 = [v39 copy];
        [v37 setObject:v40 forKey:v38];

        uint64_t v15 = (void *)v51;
        uint64_t v11 = v47;
      }

      uint64_t v10 = v45;
      id v5 = v46;
    }

    __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v10]);
    if (v41) {
      [v53 MCDeepCopyMissingEntriesFromDictionary:v41];
    }
    __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v11]);
    if (v42) {
      [v52 MCDeepCopyMissingEntriesFromDictionary:v42];
    }
    __int128 v43 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v48]);
    if (v43) {
      [v49 MCDeepCopyMissingEntriesFromDictionary:v43];
    }
    [v5 setParametersForSettingsByType:v7 sender:@"MCMigrator.ApplyDefaultSettings"];
  }

  __int128 v44 = _MCLogObjects[12];
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v56 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "Completed applying default user settings.",  v56,  2u);
  }

  objc_autoreleasePoolPop(context);
}

- (void)_migrateBoolRestrictions:(id)a3 withAppID:(id)a4 forKey:(id)a5 valuesToRestrictions:(id)a6 currentBoolUserSettings:(id)a7
{
  id v36 = a3;
  uint64_t v11 = (const __CFString *)a4;
  uint64_t v12 = (const __CFString *)a5;
  id v13 = a6;
  id v14 = a7;
  key = (__CFString *)v12;
  applicationID = (__CFString *)v11;
  uint64_t v15 = (void *)CFPreferencesCopyAppValue(v12, v11);
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 0LL));
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v16 = v15;
  id v17 = [v16 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v40;
    uint64_t v20 = MCRestrictedBoolValueKey;
    do
    {
      uint64_t v21 = 0LL;
      id v37 = v18;
      do
      {
        if (*(void *)v40 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v22 = *(void *)(*((void *)&v39 + 1) + 8LL * (void)v21);
        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v22]);
        if (v23)
        {
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v23]);
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKey:v20]);

          if (!v25)
          {
            uint64_t v26 = v19;
            id v27 = v13;
            uint64_t v28 = v20;
            id v29 = v14;
            id v30 = v16;
            uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
            __int128 v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v31,  @"value"));

            id v16 = v30;
            id v14 = v29;
            uint64_t v20 = v28;
            id v13 = v27;
            uint64_t v19 = v26;
            id v18 = v37;
            [v36 setObject:v32 forKey:v23];
          }
        }

        else
        {
          [v38 addObject:v22];
        }

        uint64_t v21 = (char *)v21 + 1;
      }

      while (v18 != v21);
      id v18 = [v16 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }

    while (v18);
  }

  if ([v38 count]) {
    id v33 = v38;
  }
  else {
    id v33 = 0LL;
  }
  CFPreferencesSetAppValue(key, v33, applicationID);
}

- (void)_migrateValueRestrictions:(id)a3 withAppID:(id)a4 forKey:(id)a5 keysToRestricitons:(id)a6 currentValueUserSettings:(id)a7
{
  id v30 = a3;
  uint64_t v11 = (const __CFString *)a4;
  uint64_t v12 = (const __CFString *)a5;
  id v13 = a6;
  id v32 = a7;
  uint64_t v28 = (__CFString *)v12;
  id v29 = (__CFString *)v11;
  id v14 = (void *)CFPreferencesCopyAppValue(v12, v11);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  0LL));
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v15 = v14;
  id v16 = [v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v34;
    uint64_t v19 = MCRestrictedValueValueKey;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v21 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)i);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v21]);
        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v21]);
        if (v23)
        {
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKey:v23]);
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKey:v19]);

          if (!v25)
          {
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v22,  @"value"));
            [v30 setObject:v26 forKey:v23];
          }
        }

        else
        {
          [v31 setObject:v22 forKey:v21];
        }
      }

      id v17 = [v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }

    while (v17);
  }

  if ([v31 count]) {
    id v27 = v31;
  }
  else {
    id v27 = 0LL;
  }
  CFPreferencesSetAppValue(v28, v27, v29);
}

- (void)_migrateBoolValueToFeature:(id)a3 withAppID:(id)a4 forKey:(id)a5 synchronize:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  uint64_t v10 = (__CFString *)a4;
  uint64_t v11 = (__CFString *)a5;
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(v11, v10, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    int v13 = AppBooleanValue;
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter sharedManager]( &OBJC_CLASS___MCRestrictionManagerWriter,  "sharedManager"));
    [v14 setBoolValue:v13 != 0 forSetting:v9 sender:@"MCMigrator.MigrateBoolValueToFeature"];
  }

  CFPreferencesSetAppValue(v11, 0LL, v10);
  if (v6) {
    CFPreferencesAppSynchronize(v10);
  }
}

- (void)_migrateSettings
{
  context = objc_autoreleasePoolPush();
  id v3 = _MCLogObjects[12];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Migrating settings...", buf, 2u);
  }

  buf[0] = 0;
  uint64_t v4 = (const __CFString *)MCSpringboardBundleIdentifier;
  uint64_t AppBooleanValue = CFPreferencesGetAppBooleanValue( @"SBSensitiveJibblerEnabled",  MCSpringboardBundleIdentifier,  buf);
  CFPreferencesSetAppValue(@"SBSensitiveJibblerEnabled", 0LL, @"com.apple.springboard");
  uint64_t v6 = MCRestrictedBoolKey;
  if (buf[0])
  {
    uint64_t v111 = MCRestrictedBoolKey;
    uint64_t v109 = MCFeatureAllowVoiceDialing;
    uint64_t v107 = MCSettingParameterValueKey;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  AppBooleanValue));
    __int128 v108 = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v108,  &v107,  1LL));
    __int128 v110 = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v110,  &v109,  1LL));
    v112 = v9;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v112,  &v111,  1LL));

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter sharedManager]( &OBJC_CLASS___MCRestrictionManagerWriter,  "sharedManager"));
    [v11 setParametersForSettingsByType:v10 sender:@"MCMigrator.MigrateSettings"];
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 systemUserSettings]);

  uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 objectForKey:v6]);
  uint64_t v15 = MCRestrictedValueKey;
  __int128 v87 = v13;
  id v85 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:MCRestrictedValueKey]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v83 = v6;
  [v16 setObject:v17 forKey:v6];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v90 = v15;
  [v16 setObject:v18 forKey:v15];
  v105[0] = @"explicitContent";
  v105[1] = @"applicationInstallation";
  uint64_t v19 = MCFeatureAppInstallationAllowed;
  v106[0] = MCFeatureExplicitContentAllowed;
  v106[1] = MCFeatureAppInstallationAllowed;
  v105[2] = @"camera";
  v105[3] = @"screenShot";
  uint64_t v20 = MCFeatureCameraAllowed;
  v106[2] = MCFeatureCameraAllowed;
  v106[3] = MCFeatureScreenShotAllowed;
  v105[4] = @"inAppPurchases";
  v106[4] = MCFeatureInAppPurchasesAllowed;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v106,  v105,  5LL));
  -[MCMigrator _migrateBoolRestrictions:withAppID:forKey:valuesToRestrictions:currentBoolUserSettings:]( self,  "_migrateBoolRestrictions:withAppID:forKey:valuesToRestrictions:currentBoolUserSettings:",  v17,  v4,  @"SBParentalControlsCapabilities",  v21,  v14);
  CFPreferencesSetAppValue(@"SBParentalControlsMCCapabilities", 0LL, v4);
  v103[0] = MCSafariBundleIdentifier;
  v103[1] = MCCameraBundleIdentifier;
  v104[0] = MCFeatureSafariAllowed;
  v104[1] = v20;
  v103[2] = @"com.apple.youtube";
  v103[3] = MCFeatureITunesAllowed;
  v104[2] = MCFeatureYouTubeAllowed;
  v104[3] = MCFeatureITunesAllowed;
  v103[4] = MCAppStoreBundleIdentifier;
  v104[4] = v19;
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v104,  v103,  5LL));
  v86 = (void *)v14;
  -[MCMigrator _migrateBoolRestrictions:withAppID:forKey:valuesToRestrictions:currentBoolUserSettings:]( self,  "_migrateBoolRestrictions:withAppID:forKey:valuesToRestrictions:currentBoolUserSettings:",  v17,  v4,  @"SBParentalControlsApplications",  v22,  v14);
  CFPreferencesSetAppValue(@"SBParentalControlsMCApplications", 0LL, v4);
  v101[0] = @"apps";
  v101[1] = @"tvshows";
  uint64_t v89 = MCFeatureMaximumAppsRating;
  v102[0] = MCFeatureMaximumAppsRating;
  v102[1] = MCFeatureMaximumTVShowsRating;
  v101[2] = @"movies";
  v102[2] = MCFeatureMaximumMoviesRating;
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v102,  v101,  3LL));
  __int128 v88 = self;
  -[MCMigrator _migrateValueRestrictions:withAppID:forKey:keysToRestricitons:currentValueUserSettings:]( self,  "_migrateValueRestrictions:withAppID:forKey:keysToRestricitons:currentValueUserSettings:",  v18,  v4,  @"SBParentalControlsMCContentRestrictions",  v23,  v85);
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v85 objectForKeyedSubscript:MCFeatureMaximumFailedPasscodeAttempts]);
  uint64_t v84 = MCRestrictedValueValueKey;
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:"));

  if (v25)
  {
    if (MCGestaltHasSEP())
    {
      id v26 = [v25 unsignedIntegerValue];
      if (v26 != (id)MCKeybagCurrentMaximumFailedPasscodeAttempts())
      {
        uint64_t v27 = MCKeybagSetMaximumFailedPasscodeAttempts(v26, 0LL);
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        if (v28)
        {
          log = _MCLogObjects[12];
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v28;
            _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to migrate maximum failed passcode attempts. Error: %{public}@",  buf,  0xCu);
          }
        }
      }
    }
  }

  id v29 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter sharedManager]( &OBJC_CLASS___MCRestrictionManagerWriter,  "sharedManager",  log));
  [v29 setParametersForSettingsByType:v16 sender:@"MCMigrator.MigrateSettings"];

  id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v30 setObject:v31 forKey:v90];
  id v32 = (const __CFNumber *)CFPreferencesCopyAppValue(@"SBAutoLockTime", v4);
  if (v32)
  {
    __int128 v33 = v32;
    CFTypeID v34 = CFGetTypeID(v32);
    if (v34 == CFNumberGetTypeID())
    {
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v33, kCFNumberIntType, buf);
      if ((*(_DWORD *)buf & 0x80000000) != 0) {
        *(_DWORD *)buf = 0x7FFFFFFF;
      }
      uint64_t v98 = v84;
      __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:"));
      __int128 v99 = v35;
      __int128 v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v99,  &v98,  1LL));
      [v31 setObject:v36 forKeyedSubscript:MCFeatureAutoLockTime];
    }

    CFRelease(v33);
  }

  id v37 = (const __CFNumber *)CFPreferencesCopyAppValue(@"SBDeviceLockGracePeriod", v4);
  if (v37)
  {
    uint64_t v38 = v37;
    *(void *)buf = 0LL;
    CFNumberGetValue(v37, kCFNumberLongType, buf);
    uint64_t v96 = v84;
    __int128 v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  *(void *)buf));
    __int128 v97 = v39;
    __int128 v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v97,  &v96,  1LL));
    [v31 setObject:v40 forKeyedSubscript:MCFeaturePasscodeLockGraceTime];

    CFRelease(v38);
  }

  CFPreferencesSetAppValue(@"SBAutoLockTime", 0LL, v4);
  CFPreferencesSetAppValue(@"SBDeviceLockGracePeriod", 0LL, v4);
  __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v41 setParametersForSettingsByType:v30 sender:@"MCMigrator.MigrateSettings"];

  __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v42 setObject:v43 forKey:MCUnionKey];
  CFPropertyListRef v44 = CFPreferencesCopyAppValue(@"SBTrustedCodeSigningIdentities", v4);
  if (v44)
  {
    uint64_t v45 = v44;
    CFTypeID v46 = CFGetTypeID(v44);
    if (v46 == CFArrayGetTypeID())
    {
      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter sharedManager]( &OBJC_CLASS___MCRestrictionManagerWriter,  "sharedManager"));
      [v47 setUnionValues:v45 forSetting:MCFeatureTrustedCodeSigningIdentities sender:@"MCMigrator.MigrateSettings"];
    }

    CFRelease(v45);
  }

  CFPreferencesSetAppValue(@"SBTrustedCodeSigningIdentities", 0LL, v4);

  buf[0] = 0;
  int v48 = CFPreferencesGetAppBooleanValue(@"Disable While Passcode Locked", @"com.apple.assistant", buf);
  if (buf[0])
  {
    int v49 = v48;
    __int128 v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v50 setObject:v51 forKey:v83];
    __int128 v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v51 setObject:v52 forKey:MCFeatureAssistantWhileLockedAllowed];
    uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v49 == 0));
    [v52 setObject:v53 forKey:MCRestrictedBoolValueKey];

    uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter sharedManager]( &OBJC_CLASS___MCRestrictionManagerWriter,  "sharedManager"));
    [v54 setParametersForSettingsByType:v50 sender:@"MCMigrator.MigrateSettings"];
  }

  CFPreferencesSetAppValue(@"Disable While Passcode Locked", 0LL, @"com.apple.assistant");
  CFPreferencesAppSynchronize(@"com.apple.assistant");
  CFPreferencesAppSynchronize(v4);
  buf[0] = 0;
  int v55 = CFPreferencesGetAppBooleanValue(@"enabled", @"com.apple.adtracking", buf);
  if (buf[0])
  {
    int v56 = v55;
    id v57 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter sharedManager]( &OBJC_CLASS___MCRestrictionManagerWriter,  "sharedManager"));
    [v57 setBoolValue:v56 == 0 forSetting:MCFeatureLimitAdTrackingForced sender:@"MCMigrator.MigrateSettings"];
  }

  CFPreferencesSetAppValue(@"enabled", 0LL, @"com.apple.adtracking");
  CFPreferencesAppSynchronize(@"com.apple.adtracking");
  -[MCMigrator _migrateBoolValueToFeature:withAppID:forKey:synchronize:]( v88,  "_migrateBoolValueToFeature:withAppID:forKey:synchronize:",  MCFeatureAutoCorrectionAllowed,  @"com.apple.Preferences",  @"KeyboardAutocorrection",  0LL);
  -[MCMigrator _migrateBoolValueToFeature:withAppID:forKey:synchronize:]( v88,  "_migrateBoolValueToFeature:withAppID:forKey:synchronize:",  MCFeatureSmartPunctuationAllowed,  @"com.apple.Preferences",  @"SmartPunctuation",  0LL);
  -[MCMigrator _migrateBoolValueToFeature:withAppID:forKey:synchronize:]( v88,  "_migrateBoolValueToFeature:withAppID:forKey:synchronize:",  MCFeaturePredictiveKeyboardAllowed,  @"com.apple.Preferences",  @"KeyboardPrediction",  0LL);
  -[MCMigrator _migrateBoolValueToFeature:withAppID:forKey:synchronize:]( v88,  "_migrateBoolValueToFeature:withAppID:forKey:synchronize:",  MCFeatureSpellCheckAllowed,  @"com.apple.Preferences",  @"KeyboardCheckSpelling",  1LL);
  uint64_t v58 = (void *)CFPreferencesCopyAppValue(@"CookieAcceptPolicy", @"com.apple.WebUI");
  if (v58)
  {
    uint64_t v59 = objc_opt_class(&OBJC_CLASS___NSString);
    float v60 = 1.5;
    if ((objc_opt_isKindOfClass(v58, v59) & 1) != 0)
    {
      float v60 = 2.0;
      if (([v58 isEqualToString:kMCSafariCookieAcceptPolicyAlways] & 1) == 0)
      {
        float v60 = 1.5;
        if (([v58 isEqualToString:kMCSafariCookieAcceptPolicyOnlyFromMainDocumentDomain] & 1) == 0)
        {
          float v60 = 1.0;
          if (([v58 isEqualToString:kMCSafariCookieAcceptPolicyExclusivelyFromMainDocumentDomain] & 1) == 0)
          {
            else {
              float v60 = 1.0;
            }
          }
        }
      }
    }
  }

  else
  {
    uint64_t v61 = (void *)CFPreferencesCopyAppValue(@"NSHTTPAcceptCookies", @"com.apple.WebFoundation");
    float v60 = 1.5;
    if (v61)
    {
      uint64_t v62 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v61, v62) & 1) != 0)
      {
        float v60 = 2.0;
        if (([v61 isEqualToString:@"always"] & 1) == 0)
        {
          else {
            float v60 = 1.5;
          }
        }

        CFPreferencesSetAppValue(@"NSHTTPAcceptCookies", 0LL, @"com.apple.WebFoundation");
        CFPreferencesAppSynchronize(@"com.apple.WebFoundation");
      }
    }
  }

  id v63 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
  uint64_t v64 = MCFeatureSafariAcceptCookies;
  uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue([v63 effectiveValueForSetting:MCFeatureSafariAcceptCookies]);

  if (!v65 || ([v65 floatValue], v66 != v60))
  {
    __int128 v67 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter sharedManager]( &OBJC_CLASS___MCRestrictionManagerWriter,  "sharedManager"));
    *(float *)&double v68 = v60;
    uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v68));
    [v67 setValue:v69 forSetting:v64 sender:@"MCMigrator.MigrateSettings"];

    v70 = _MCLogObjects[12];
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Migrated safari cookie policy.", buf, 2u);
    }
  }

  uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
  uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue([v71 userSettings]);
  uint64_t v73 = objc_claimAutoreleasedReturnValue([v72 objectForKeyedSubscript:v90]);
  int v74 = (void *)objc_claimAutoreleasedReturnValue([(id)v73 objectForKeyedSubscript:v89]);
  id v75 = [v74 mutableCopy];

  uint64_t v76 = MCSettingParameterRangeMaximumKey;
  v77 = (void *)objc_claimAutoreleasedReturnValue([v75 objectForKeyedSubscript:MCSettingParameterRangeMaximumKey]);
  LOBYTE(v73) = [v77 isEqualToNumber:&off_1000CBFB0];

  if ((v73 & 1) == 0)
  {
    [v75 setObject:&off_1000CBFB0 forKeyedSubscript:v76];
    id v93 = v75;
    uint64_t v94 = v90;
    uint64_t v92 = v89;
    v78 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v93,  &v92,  1LL));
    __int128 v95 = v78;
    uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v95,  &v94,  1LL));

    id v80 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter sharedManager]( &OBJC_CLASS___MCRestrictionManagerWriter,  "sharedManager"));
    [v80 setParametersForSettingsByType:v79 sender:@"MCMigrator.MigrateSettings"];
  }

  v81 = _MCLogObjects[12];
  if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "Completed migrating settings.", buf, 2u);
  }

  objc_autoreleasePoolPop(context);
}

- (void)_migrateClientRestrictions
{
  uint64_t v2 = objc_autoreleasePoolPush();
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 systemClientRestrictions]);

  uint64_t v53 = v4;
  if ([v4 count])
  {
    id v5 = [v4 MCMutableDeepCopy];
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v53 keyEnumerator]);
    id v7 = [v6 countByEnumeratingWithState:&v55 objects:v61 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v47 = v2;
      char v9 = 0;
      uint64_t v10 = *(void *)v56;
      uint64_t v11 = kMCClientRestrictionsTruth;
      uint64_t v50 = kMCClientRestrictionsType;
      uint64_t v49 = kEASAccountClientType;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v56 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v13 = *(void *)(*((void *)&v55 + 1) + 8LL * (void)i);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v53 objectForKey:v13]);
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v11]);
          if (v15)
          {
            [v5 setObject:v14 forKey:v13];
          }

          else
          {
            v59[0] = v11;
            v59[1] = v50;
            v60[0] = v14;
            v60[1] = v49;
            id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v60,  v59,  2LL));
            [v5 setObject:v16 forKeyedSubscript:v13];

            char v9 = 1;
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v55 objects:v61 count:16];
      }

      while (v8);

      uint64_t v2 = v47;
      if ((v9 & 1) == 0) {
        goto LABEL_15;
      }
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter sharedManager]( &OBJC_CLASS___MCRestrictionManagerWriter,  "sharedManager"));
      [v6 setAllClientRestrictions:v5 sender:@"MCMigrator.MigrateClientRestrictions" outRestrictionsChanged:0 outEffectiveSettingsChanged:0 outRecomputedNag:0 outError:0];
    }

LABEL_15:
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  uint64_t v18 = MCNewsBundleIdentifier;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v17 clientRestrictionsForClientUUID:MCNewsBundleIdentifier]);

  if (v19)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter sharedManager]( &OBJC_CLASS___MCRestrictionManagerWriter,  "sharedManager"));
    [v20 setClientRestrictions:&__NSDictionary0__struct clientType:v18 clientUUID:v18 sender:@"MCMigrator.MigrateClientRestrictions" localizedClientDescription:@"News" localizedWarning:0 outRestrictionsChan ged:0 outEffectiveSettingsChanged:0 outRecomputedNag:0 outError:0];
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  uint64_t v22 = kMCLSSystemAppRemovalClientType;
  __int128 v23 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v21 clientRestrictionsForClientUUID:kMCLSSystemAppRemovalClientType]);

  if (-[NSMutableDictionary count](v23, "count"))
  {
    uint64_t v24 = MCFeatureRemovedSystemAppBundleIDs;
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager unionValuesForFeature:withRestrictionsDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "unionValuesForFeature:withRestrictionsDictionary:",  MCFeatureRemovedSystemAppBundleIDs,  v23));
    id v26 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager unionValuesForFeature:withRestrictionsDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "unionValuesForFeature:withRestrictionsDictionary:",  MCFeatureBlacklistedAppBundleIDs,  v23));
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager unionValuesForFeature:withRestrictionsDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "unionValuesForFeature:withRestrictionsDictionary:",  MCFeatureBlockedAppBundleIDs,  v23));
    if (![v25 count] && (objc_msgSend(v26, "count") || objc_msgSend(v27, "count")))
    {
      uint64_t v51 = v19;
      int v48 = v2;
      uint64_t v28 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      uint64_t v29 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v26));
      id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v27));
      CFTypeID v46 = (void *)v29;
      [v30 unionSet:v29];
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 allObjects]);
      -[NSMutableDictionary MCSetUnionRestriction:values:](v28, "MCSetUnionRestriction:values:", v24, v31);
      id v32 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter sharedManager]( &OBJC_CLASS___MCRestrictionManagerWriter,  "sharedManager"));
      [v32 setClientRestrictions:v28 clientType:v22 clientUUID:v22 sender:@"MCMigrator.MigrateClientRestrictions" localizedClientDescription:&stru_1000C4568 localizedWarning:0 outRestrictionsCh anged:0 outEffectiveSettingsChanged:0 outRecomputedNag:0 outError:0];

      __int128 v33 = _MCLogObjects[12];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Migrated original removed system apps.",  buf,  2u);
      }

      uint64_t v2 = v48;
      __int128 v23 = v28;
      uint64_t v19 = v51;
    }
  }

  CFTypeID v34 = (const __CFString *)MCiCloudDriveBundleIdentifier;
  __int128 v35 = (void *)CFPreferencesCopyAppValue(@"SBIconVisibility", MCiCloudDriveBundleIdentifier);
  __int128 v36 = v35;
  if (!v35 || ([v35 BOOLValue] & 1) == 0)
  {
    __int128 v52 = v19;
    id v37 = v2;
    uint64_t v38 = MCFeatureRemovedSystemAppBundleIDs;
    __int128 v39 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager unionValuesForFeature:withRestrictionsDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "unionValuesForFeature:withRestrictionsDictionary:",  MCFeatureRemovedSystemAppBundleIDs,  v23));
    __int128 v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", v34));
    __int128 v41 = v40;
    if (v39) {
      [v40 addObjectsFromArray:v39];
    }
    __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v43 = (void *)objc_claimAutoreleasedReturnValue([v41 allObjects]);
    [v42 MCSetUnionRestriction:v38 values:v43];

    CFPropertyListRef v44 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter sharedManager]( &OBJC_CLASS___MCRestrictionManagerWriter,  "sharedManager"));
    [v44 setClientRestrictions:v42 clientType:v22 clientUUID:v22 sender:@"MCMigrator.MigrateClientRestrictions" localizedClientDescription:&stru_1000C4568 localizedWarning:0 outRestrictionsChan ged:0 outEffectiveSettingsChanged:0 outRecomputedNag:0 outError:0];

    CFPreferencesSetAppValue(@"SBIconVisibility", kCFBooleanTrue, v34);
    CFPreferencesAppSynchronize(v34);
    uint64_t v45 = _MCLogObjects[12];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Migrated iCloud Drive app.", buf, 2u);
    }

    uint64_t v2 = v37;
    uint64_t v19 = v52;
  }

  objc_autoreleasePoolPop(v2);
}

- (void)_updateClientRestrictions
{
  context = objc_autoreleasePoolPush();
  uint64_t v2 = _MCLogObjects[12];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Updating client restrictions...", buf, 2u);
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 systemClientRestrictions]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v4 count]));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v11]);
        id v13 = [v12 mutableCopy];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](&OBJC_CLASS___MCHacks, "sharedHacks"));
        [v14 _applyHeuristicsToRestrictions:v13 forProfile:0 ignoresUnrestrictableApps:0];

        [v5 setObject:v13 forKey:v11];
      }

      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }

    while (v8);
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v15 setAllClientRestrictions:v5 sender:@"MCMigrator.UpdateClientRestrictions" outRestrictionsChanged:0 outEffectiveSettingsChanged:0 outRecomputedNag:0 outError:0];

  os_log_t v16 = _MCLogObjects[12];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = v16;
    unsigned int v18 = [v5 count];
    *(_DWORD *)buf = 67109120;
    unsigned int v25 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Done updating. %d client restrictions processed.",  buf,  8u);
  }

  objc_autoreleasePoolPop(context);
}

- (id)_updateProfileRestrictionsForProfileRestrictions:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v3 count]));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v10, (void)v15));
        id v12 = [v11 mutableCopy];
        id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](&OBJC_CLASS___MCHacks, "sharedHacks"));
        [v13 _applyHeuristicsToRestrictions:v12 forProfile:0 ignoresUnrestrictableApps:0];

        [v4 setObject:v12 forKey:v10];
      }

      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v7);
  }

  return v4;
}

- (void)_updateProfileRestrictions
{
  id v3 = objc_autoreleasePoolPush();
  uint64_t v4 = _MCLogObjects[12];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Updating profile restrictions...", buf, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 systemProfileRestrictions]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[MCMigrator _updateProfileRestrictionsForProfileRestrictions:]( self,  "_updateProfileRestrictionsForProfileRestrictions:",  v6));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 userProfileRestrictions]);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[MCMigrator _updateProfileRestrictionsForProfileRestrictions:]( self,  "_updateProfileRestrictionsForProfileRestrictions:",  v9));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v11 setSystemProfileRestrictions:v7 userProfileRestrictions:v10 sender:@"MCMigrator.UpdateProfileRestrictions" outRestrictionsChanged:0 outEffectiveSettingsChanged:0 outAp pWhitelistSettingsChanged:0 outRecomputedNag:0 outError:0];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100032094;
  v15[3] = &unk_1000C35E0;
  id v16 = v7;
  id v17 = v10;
  id v13 = v10;
  id v14 = v7;
  [v12 recomputeProfileRestrictionsWithCompletionBlock:v15];

  objc_autoreleasePoolPop(v3);
}

- (void)_applyImpliedSettings
{
  uint64_t v2 = objc_autoreleasePoolPush();
  id v3 = _MCLogObjects[12];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Updating implied settings...", buf, 2u);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
  unsigned int v5 = [v4 effectiveRestrictedBoolForSetting:MCFeatureDiagnosticsSubmissionAllowed];

  if (v5 == 2)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter sharedManager]( &OBJC_CLASS___MCRestrictionManagerWriter,  "sharedManager"));
    [v6 setBoolValue:0 forSetting:MCFeatureAppAnalyticsAllowed sender:@"MCMigrator.ApplyImpliedSettings"];
  }

  id v7 = _MCLogObjects[12];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Done updating.", v8, 2u);
  }

  objc_autoreleasePoolPop(v2);
}

- (void)_migrateProfileStubsForNetworkExtension
{
  uint64_t v2 = objc_autoreleasePoolPush();
  if (!MCNEProfileIngestionClass())
  {
    unsigned int v5 = _MCLogObjects[12];
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_49;
    }
    *(_WORD *)buf = 0;
    CFTypeID v46 = "Skipping migrating NetworkExtension settings: not applicable";
LABEL_48:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v46, buf, 2u);
    goto LABEL_49;
  }

  Class v3 = NSClassFromString(@"NEProfileIngestion");
  char v4 = objc_opt_respondsToSelector(v3, "getServiceIDForPayload:");
  unsigned int v5 = _MCLogObjects[12];
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v4 & 1) == 0)
  {
    if (!v6) {
      goto LABEL_49;
    }
    *(_WORD *)buf = 0;
    CFTypeID v46 = "Skipping migrating NetworkExtension settings: nothing to do";
    goto LABEL_48;
  }

  uint64_t v47 = v2;
  if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Migrating NetworkExtension settings to profiles...",  buf,  2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifiersOfInstalledProfilesWithFilterFlags:3]);

  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  id obj = v8;
  id v9 = [obj countByEnumeratingWithState:&v59 objects:v66 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = &MailAccountHostname_ptr;
    id v12 = &MailAccountHostname_ptr;
    uint64_t v13 = *(void *)v60;
    uint64_t v49 = *(void *)v60;
    do
    {
      uint64_t v14 = 0LL;
      id v48 = v10;
      do
      {
        if (*(void *)v60 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v53 = v14;
        __int128 v15 = *(void **)(*((void *)&v59 + 1) + 8 * v14);
        context = objc_autoreleasePoolPush();
        uint64_t v16 = MCSystemProfileStorageDirectory(context);
        id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v15 MCHashedFilenameWithExtension:@"stub"]);
        uint64_t v19 = objc_claimAutoreleasedReturnValue([v17 stringByAppendingPathComponent:v18]);

        __int128 v20 = v11[101];
        uint64_t v54 = (void *)v19;
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v12[133] dataWithContentsOfFile:v19]);
        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v20 profileWithData:v21 outError:0]);

        uint64_t v23 = objc_opt_class(&OBJC_CLASS___MCConfigurationProfile);
        if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0)
        {
          __int128 v57 = 0u;
          __int128 v58 = 0u;
          __int128 v55 = 0u;
          __int128 v56 = 0u;
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v22 payloads]);
          id v25 = [v24 countByEnumeratingWithState:&v55 objects:v65 count:16];
          if (v25)
          {
            id v26 = v25;
            uint64_t v51 = v22;
            char v27 = 0;
            uint64_t v28 = *(void *)v56;
            do
            {
              for (i = 0LL; i != v26; i = (char *)i + 1)
              {
                if (*(void *)v56 != v28) {
                  objc_enumerationMutation(v24);
                }
                id v30 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)i);
                uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  4LL));
                id v32 = (void *)objc_claimAutoreleasedReturnValue([v30 type]);

                if (v32)
                {
                  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v30 type]);
                  [v31 setObject:v33 forKey:@"PayloadType"];
                }

                CFTypeID v34 = (void *)objc_claimAutoreleasedReturnValue([v30 UUID]);

                if (v34)
                {
                  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v30 UUID]);
                  [v31 setObject:v35 forKey:@"PayloadUUID"];
                }

                __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v30 identifier]);

                if (v36)
                {
                  id v37 = (void *)objc_claimAutoreleasedReturnValue([v30 identifier]);
                  [v31 setObject:v37 forKey:@"PayloadIdentifier"];
                }

                uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v30 displayName]);

                if (v38)
                {
                  __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v30 displayName]);
                  [v31 setObject:v39 forKey:@"PayloadDisplayName"];
                }

                __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v30 persistentResourceID]);

                if (v40)
                {
                  __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v30 persistentResourceID]);
                  [v31 setObject:v41 forKey:@"IdentificationUUID"];
                }

                if ([v30 version])
                {
                  __int128 v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%ld",  [v30 version]));
                  [v31 setObject:v42 forKey:@"PayloadVersion"];
                }

                __int128 v43 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class performSelector:withObject:]( v3,  "performSelector:withObject:",  "getServiceIDForPayload:",  v31));
                if (v43)
                {
                  [v30 setPersistentResourceID:v43];
                  char v27 = 1;
                }
              }

              id v26 = [v24 countByEnumeratingWithState:&v55 objects:v65 count:16];
            }

            while (v26);

            uint64_t v11 = &MailAccountHostname_ptr;
            id v10 = v48;
            uint64_t v13 = v49;
            id v12 = &MailAccountHostname_ptr;
            __int128 v22 = v51;
            if ((v27 & 1) != 0)
            {
              CFPropertyListRef v44 = _MCLogObjects[12];
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v64 = v54;
                _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "Migrating NetworkExtension: updating profile stub %{public}@",  buf,  0xCu);
              }

              __int128 v22 = v51;
              [v51 writeStubToPath:v54];
            }
          }

          else
          {

            uint64_t v13 = v49;
          }
        }

        objc_autoreleasePoolPop(context);
        uint64_t v14 = v53 + 1;
      }

      while ((id)(v53 + 1) != v10);
      id v10 = [obj countByEnumeratingWithState:&v59 objects:v66 count:16];
    }

    while (v10);
  }

  if ((objc_opt_respondsToSelector(v3, "profileMigrationComplete") & 1) != 0) {
    -[objc_class performSelector:](v3, "performSelector:", "profileMigrationComplete");
  }
  uint64_t v45 = _MCLogObjects[12];
  uint64_t v2 = v47;
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Completed migrating NetworkExtension settings.",  buf,  2u);
  }

LABEL_49:
  objc_autoreleasePoolPop(v2);
}

- (void)_migrateExtensibleSSO
{
  uint64_t v2 = objc_autoreleasePoolPush();
  Class v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
  id v4 = [v3 allInstalledPayloadsOfClass:objc_opt_class(MCExtensibleSingleSignOnPayload)];
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  if ([v5 count])
  {
    id v16 = 0LL;
    unsigned int v6 = +[MCExtensibleSingleSignOnPayloadHandler rebuildConfigurationIncludingPayloads:excludingPayloads:error:]( &OBJC_CLASS___MCExtensibleSingleSignOnPayloadHandler,  "rebuildConfigurationIncludingPayloads:excludingPayloads:error:",  v5,  0LL,  &v16);
    id v7 = v16;
    os_log_t v8 = _MCLogObjects[12];
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = v8;
        id v10 = [v5 count];
        *(_DWORD *)buf = 134217984;
        id v18 = v10;
        uint64_t v11 = "Rebuilt Extensible SSO configuration from %ld payload(s)";
        id v12 = v9;
        os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
        uint32_t v14 = 12;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, buf, v14);
      }
    }

    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = v8;
      id v15 = [v5 count];
      *(_DWORD *)buf = 134218242;
      id v18 = v15;
      __int16 v19 = 2114;
      id v20 = v7;
      uint64_t v11 = "Failed to rebuild Extensible SSO configuration from %ld payload(s): %{public}@";
      id v12 = v9;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 22;
      goto LABEL_7;
    }
  }

  objc_autoreleasePoolPop(v2);
}

- (void)_migrateSharedDeviceConfiguration
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = MCSharedDeviceConfigurationFilePath();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  v4));
  unsigned int v6 = v5;
  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"IfLostReturnToMessage"]);
    if (v7)
    {
      [v6 setObject:v7 forKeyedSubscript:kMCSharedDeviceLockScreenFootnoteKey];
      [v6 removeObjectForKey:@"IfLostReturnToMessage"];
      [v6 MCWriteToBinaryFile:v4];
    }
  }

  os_log_t v8 = _MCLogObjects[12];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Completed migrating Shared Device Configuration keys.",  v9,  2u);
  }

  objc_autoreleasePoolPop(v2);
}

- (void)_migrateLostModeLastLocationRequestDate
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = (const __CFString *)kMCMDMLostModeLastLocationRequestDateKey;
  id v4 = (const __CFString *)kMCNotBackedUpPreferencesDomain;
  id v5 = (id)CFPreferencesCopyAppValue(kMCMDMLostModeLastLocationRequestDateKey, kMCNotBackedUpPreferencesDomain);
  if (v5
    || (uint64_t v6 = ((uint64_t (*)(void))MCConfigurationProfilesSystemGroupContainer)(),
        (id v5 = (id)_CFPreferencesCopyValueWithContainer(v3, v4, kCFPreferencesAnyUser, kCFPreferencesCurrentHost, v6)) != 0LL))
  {
    id v7 = _MCLogObjects[12];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Migrating the Lost Mode last location request date.",  buf,  2u);
    }

    os_log_t v8 = objc_alloc(&OBJC_CLASS___NSURL);
    uint64_t v9 = MCSystemLostModeRequestPath();
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = -[NSURL initFileURLWithPath:isDirectory:](v8, "initFileURLWithPath:isDirectory:", v10, 0LL);

    *(void *)buf = 0LL;
    uint64_t v24 = buf;
    uint64_t v25 = 0x2020000000LL;
    char v26 = 0;
    id v12 = objc_opt_new(&OBJC_CLASS___NSFileCoordinator);
    __int128 v21 = buf;
    id v22 = 0LL;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100032F08;
    v19[3] = &unk_1000C3608;
    id v5 = v5;
    id v20 = v5;
    -[NSFileCoordinator coordinateWritingItemAtURL:options:error:byAccessor:]( v12,  "coordinateWritingItemAtURL:options:error:byAccessor:",  v11,  0LL,  &v22,  v19);
    id v13 = v22;

    if (!v24[24])
    {
      uint32_t v14 = _MCLogObjects[12];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)char v27 = 138543362;
        id v28 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Could not read device lost mode last location for migration: %{public}@",  v27,  0xCu);
      }
    }

    uint64_t v15 = ((uint64_t (*)(void))MCConfigurationProfilesSystemGroupContainer)();
    uint64_t v16 = _CFPreferencesSetValueWithContainer(v3, 0LL, v4, kCFPreferencesAnyUser, kCFPreferencesCurrentHost, v15);
    uint64_t v17 = MCConfigurationProfilesSystemGroupContainer(v16);
    _CFPreferencesSynchronizeWithContainer(v4, kCFPreferencesAnyUser, kCFPreferencesCurrentHost, v17);
    CFPreferencesSetValue(v3, 0LL, v4, kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
    CFPreferencesSynchronize(v4, kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
    CFPreferencesSetAppValue(v3, 0LL, v4);
    CFPreferencesAppSynchronize(v4);

    _Block_object_dispose(buf, 8);
  }

  id v18 = _MCLogObjects[12];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Completed migrating the Lost Mode last location request date.",  buf,  2u);
  }

  objc_autoreleasePoolPop(v2);
}

- (void)_fixManifestFromStubsIfNecessary
{
  uint64_t v3 = objc_autoreleasePoolPush();
  uint64_t v4 = MCSystemProfileStorageDirectory(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = MCSystemManifestPath(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[MCMigrator _fixManifestFromStubsIfNecessaryWithStubPath:manifestPath:]( self,  "_fixManifestFromStubsIfNecessaryWithStubPath:manifestPath:",  v5,  v7);

  uint64_t v8 = MCUserProfileStorageDirectory();
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = MCUserManifestPath();
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[MCMigrator _fixManifestFromStubsIfNecessaryWithStubPath:manifestPath:]( self,  "_fixManifestFromStubsIfNecessaryWithStubPath:manifestPath:",  v9,  v11);

  objc_autoreleasePoolPop(v3);
}

- (void)_fixManifestFromStubsIfNecessaryWithStubPath:(id)a3 manifestPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator _profilesFromManifestAtPath:](self, "_profilesFromManifestAtPath:", v7));
    id v19 = 0LL;
    id v20 = 0LL;
    -[MCMigrator _profilesFromStubsAtPath:orderedProfiles:hiddenProfiles:]( self,  "_profilesFromStubsAtPath:orderedProfiles:hiddenProfiles:",  v6,  &v20,  &v19);
    id v10 = v20;
    id v11 = v19;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[MCMigrator _generatedManifestIfNeededFromOrderedProfiles:hiddenProfiles:existingManifest:]( self,  "_generatedManifestIfNeededFromOrderedProfiles:hiddenProfiles:existingManifest:",  v10,  v11,  v9));
    id v13 = _MCLogObjects[12];
    if (v12)
    {
      if (os_log_type_enabled(_MCLogObjects[12], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_FAULT,  "Fixing incomplete profile manifest at path: %@",  buf,  0xCu);
      }

      uint32_t v14 = _MCLogObjects[12];
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      *(_DWORD *)buf = 138412290;
      id v22 = v8;
      uint64_t v15 = "Could not write replacement manifest file to path: %@";
      uint64_t v16 = v14;
      os_log_type_t v17 = OS_LOG_TYPE_ERROR;
    }

    else
    {
      if (!os_log_type_enabled(_MCLogObjects[12], OS_LOG_TYPE_DEFAULT))
      {
LABEL_14:

        goto LABEL_15;
      }

      *(_DWORD *)buf = 138412290;
      id v22 = v8;
      uint64_t v15 = "Profile manifest is complete, not rewriting, path: %@";
      uint64_t v16 = v13;
      os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
    }

    _os_log_impl((void *)&_mh_execute_header, v16, v17, v15, buf, 0xCu);
    goto LABEL_14;
  }

  id v18 = _MCLogObjects[12];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v6;
    __int16 v23 = 2112;
    uint64_t v24 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "stub path (%@) or manifest path (%@) is nil",  buf,  0x16u);
  }

- (id)_profilesFromManifestAtPath:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization MCSafePropertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "MCSafePropertyListWithData:options:format:error:",  v3,  0LL,  0LL,  0LL));

  if (v4 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v4, v5) & 1) != 0))
  {
    id v6 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"OrderedProfiles"]);
    uint64_t v8 = v7;
    if (v7)
    {
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      id v9 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v30;
        do
        {
          id v12 = 0LL;
          do
          {
            if (*(void *)v30 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)v12);
            uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
            if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0) {
              -[NSMutableSet addObject:](v6, "addObject:", v13);
            }
            id v12 = (char *)v12 + 1;
          }

          while (v10 != v12);
          id v10 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }

        while (v10);
      }
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"HiddenProfiles"]);
    uint64_t v16 = v15;
    if (v15)
    {
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      id v17 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v26;
        do
        {
          id v20 = 0LL;
          do
          {
            if (*(void *)v26 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)v20);
            uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSString);
            if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0) {
              -[NSMutableSet addObject:](v6, "addObject:", v21);
            }
            id v20 = (char *)v20 + 1;
          }

          while (v18 != v20);
          id v18 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }

        while (v18);
      }
    }

    id v23 = -[NSMutableSet copy](v6, "copy");
  }

  else
  {
    id v23 = 0LL;
  }

  return v23;
}

- (void)_profilesFromStubsAtPath:(id)a3 orderedProfiles:(id *)a4 hiddenProfiles:(id *)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  id v41 = 0LL;
  __int128 v35 = v8;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 contentsOfDirectoryAtPath:v8 error:&v41]);
  id v11 = v41;

  if (v10)
  {
    id v28 = v11;
    __int128 v29 = a4;
    __int128 v31 = a5;
    __int128 v33 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    __int128 v32 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v30 = v10;
    id obj = v10;
    id v12 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v38;
      uint64_t v34 = kMCInstallProfileOptionFilterFlag;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v38 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 pathExtension]);
          unsigned int v18 = [v17 isEqualToString:@"stub"];

          if (v18)
          {
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:v16]);
            id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v19));
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfile profileWithData:outError:]( &OBJC_CLASS___MCProfile,  "profileWithData:outError:",  v20,  0LL));
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 installOptions]);
            id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v34]);
            unsigned __int8 v24 = [v23 intValue];

            __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v21 identifier]);
            if (v25)
            {
              if ((v24 & 2) != 0) {
                __int128 v26 = v33;
              }
              else {
                __int128 v26 = v32;
              }
              -[NSMutableSet addObject:](v26, "addObject:", v25);
            }
          }
        }

        id v13 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
      }

      while (v13);
    }

    *__int128 v29 = -[NSMutableSet copy](v32, "copy");
    *__int128 v31 = -[NSMutableSet copy](v33, "copy");

    id v10 = v30;
    id v11 = v28;
  }

  else
  {
    __int128 v27 = _MCLogObjects[12];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      CFPropertyListRef v44 = v35;
      __int16 v45 = 2112;
      id v46 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "Cannot read directory for profiles stubs: %@: %@",  buf,  0x16u);
    }

    *a4 = 0LL;
    *a5 = 0LL;
  }
}

- (id)_generatedManifestIfNeededFromOrderedProfiles:(id)a3 hiddenProfiles:(id)a4 existingManifest:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v7 || v8 || v9)
  {
    id v12 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    id v13 = v12;
    if (v7)
    {
      uint64_t v14 = objc_claimAutoreleasedReturnValue(-[NSMutableSet setByAddingObjectsFromSet:](v12, "setByAddingObjectsFromSet:", v7));

      id v13 = (void *)v14;
    }

    if (v8)
    {
      uint64_t v15 = objc_claimAutoreleasedReturnValue([v13 setByAddingObjectsFromSet:v8]);

      id v13 = (void *)v15;
    }

    if (v10 && ([v13 isSubsetOfSet:v10] & 1) != 0)
    {
      id v11 = 0LL;
    }

    else
    {
      uint64_t v16 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      if (v7)
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v17,  @"OrderedProfiles");
      }

      if (v8)
      {
        unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v8 allObjects]);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v18,  @"HiddenProfiles");
      }

      id v11 = -[NSMutableDictionary copy](v16, "copy");
    }
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (void)_migrateSupervisionSettings
{
  uint64_t v3 = objc_autoreleasePoolPush();
  uint64_t IsAppleTV = MCGestaltIsAppleTV();
  if ((IsAppleTV & 1) == 0)
  {
    uint64_t v5 = MCSystemPublicInfoDirectory(IsAppleTV);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"Chaperone.plist"]);

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
    uint64_t v9 = MCCloudConfigurationDetailsFilePath(v8);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    unsigned int v11 = [v8 fileExistsAtPath:v10 isDirectory:0];

    if (v11)
    {
      id v12 = _MCLogObjects[12];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Supervision settings have been migrated.",  buf,  2u);
      }
    }

    else
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
      unsigned int v14 = [v13 fileExistsAtPath:v7 isDirectory:0];

      uint64_t v15 = 0LL;
      if (v14)
      {
        uint64_t v16 = _MCLogObjects[12];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Migrating supervision settings...",  buf,  2u);
        }

        id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v7));
        __int128 v52 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"organization"]);
        unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 allInstalledProfileIdentifiers]);

        __int128 v61 = 0u;
        __int128 v62 = 0u;
        __int128 v59 = 0u;
        __int128 v60 = 0u;
        id obj = v19;
        id v20 = [obj countByEnumeratingWithState:&v59 objects:v66 count:16];
        uint64_t v53 = v17;
        if (v20)
        {
          uint64_t v50 = v7;
          uint64_t v21 = *(void *)v60;
          while (2)
          {
            for (i = 0LL; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v60 != v21) {
                objc_enumerationMutation(obj);
              }
              uint64_t v23 = *(void *)(*((void *)&v59 + 1) + 8LL * (void)i);
              unsigned __int8 v24 = objc_autoreleasePoolPush();
              __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
              __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 installedProfileWithIdentifier:v23]);

              if ([v26 containsPayloadOfClass:objc_opt_class(MCChaperonePayload)])
              {
                __int128 v57 = 0u;
                __int128 v58 = 0u;
                __int128 v55 = 0u;
                __int128 v56 = 0u;
                id v28 = (void *)objc_claimAutoreleasedReturnValue([v26 payloads]);
                id v29 = [v28 countByEnumeratingWithState:&v55 objects:v65 count:16];
                if (v29)
                {
                  id v30 = v29;
                  uint64_t v49 = v3;
                  uint64_t v31 = *(void *)v56;
                  while (2)
                  {
                    for (j = 0LL; j != v30; j = (char *)j + 1)
                    {
                      if (*(void *)v56 != v31) {
                        objc_enumerationMutation(v28);
                      }
                      __int128 v33 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)j);
                      uint64_t v34 = objc_autoreleasePoolPush();
                      uint64_t v35 = objc_opt_class(&OBJC_CLASS___MCChaperonePayload);
                      LOBYTE(v20) = objc_opt_isKindOfClass(v33, v35);
                      if ((v20 & 1) != 0)
                      {
                        id v36 = v33;
                        __int128 v37 = _MCLogObjects[12];
                        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Supervision profile found. Using information in profile for migration.",  buf,  2u);
                        }

                        unsigned int v51 = [v36 nonChaperonePairingAllowed];
                        uint64_t v27 = objc_claimAutoreleasedReturnValue([v36 pairingCertificateData]);

                        objc_autoreleasePoolPop(v34);
                        goto LABEL_30;
                      }

                      objc_autoreleasePoolPop(v34);
                    }

                    id v30 = [v28 countByEnumeratingWithState:&v55 objects:v65 count:16];
                    if (v30) {
                      continue;
                    }
                    break;
                  }

                  uint64_t v27 = 0LL;
                  unsigned int v51 = 1;
LABEL_30:
                  uint64_t v3 = v49;
                }

                else
                {
                  uint64_t v27 = 0LL;
                  LOBYTE(v20) = 0;
                  unsigned int v51 = 1;
                }

                objc_autoreleasePoolPop(v24);
                goto LABEL_33;
              }

              objc_autoreleasePoolPop(v24);
            }

            id v20 = [obj countByEnumeratingWithState:&v59 objects:v66 count:16];
            if (v20) {
              continue;
            }
            break;
          }

          uint64_t v27 = 0LL;
          unsigned int v51 = 1;
LABEL_33:
          id v7 = v50;
        }

        else
        {
          uint64_t v27 = 0LL;
          unsigned int v51 = 1;
        }

        uint64_t v15 = (void *)v27;

        __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
        [v38 removeItemAtPath:v7 error:0];

        __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        __int128 v40 = v39;
        if (v52) {
          [v39 setObject:v52 forKeyedSubscript:kCCOrganizationNameKey];
        }
        id v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v20 & 1));
        [v40 setObject:v41 forKeyedSubscript:kCCIsSupervisedKey];

        __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v51));
        [v40 setObject:v42 forKeyedSubscript:kCCAllowPairingKey];

        if (v15)
        {
          uint64_t v64 = v15;
          __int128 v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v64,  1LL));
          [v40 setObject:v43 forKeyedSubscript:kCCSupervisorHostCertificatesKey];
        }

        [v40 setObject:&__kCFBooleanTrue forKeyedSubscript:kCCIsMandatoryKey];
        [v40 setObject:&__kCFBooleanTrue forKeyedSubscript:kCCCloudConfigurationUICompleteKey];
        uint64_t v44 = MCCloudConfigurationDetailsFilePath([v40 setObject:&__kCFBooleanTrue forKeyedSubscript:kCCPostSetupProfileWasInstalledKey]);
        __int16 v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
        [v40 MCWriteToBinaryFile:v45];

        MCSendCloudConfigurationDetailsChangedNotification();
        id v46 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter sharedManager]( &OBJC_CLASS___MCRestrictionManagerWriter,  "sharedManager"));
        [v46 setBoolValue:v51 forSetting:MCFeatureHostPairingAllowed sender:@"MCMigrator.MigrateSupervisionSettings"];
      }

      uint64_t v47 = _MCLogObjects[12];
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Finished migrating supervision settings.",  buf,  2u);
      }
    }

    id v48 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
    [v48 removeItemAtPath:v7 error:0];
  }

  objc_autoreleasePoolPop(v3);
}

- (void)_removeSupervisionProfiles
{
  context = objc_autoreleasePoolPush();
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allInstalledProfileIdentifiers]);

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
        id v10 = objc_autoreleasePoolPush();
        unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 installedProfileWithIdentifier:v9]);

        if ([v12 containsPayloadOfClass:objc_opt_class(MCChaperonePayload)])
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller"));
          objc_msgSend( v13,  "removeProfileWithIdentifier:installationType:source:",  v9,  objc_msgSend(v12, "installType"),  @"Supervision Profile Removal");

          unsigned int v14 = _MCLogObjects[12];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Removed supervision profile.", buf, 2u);
          }
        }

        objc_autoreleasePoolPop(v10);
      }

      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v6);
  }

  objc_autoreleasePoolPop(context);
}

- (void)_cleanUpAppConfiguration
{
  uint64_t v50 = objc_autoreleasePoolPush();
  uint64_t v2 = _MCLogObjects[12];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Cleaning up app configuration.", buf, 2u);
  }

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set", self));
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allInstalledProfileIdentifiers]);

  id v52 = [v5 countByEnumeratingWithState:&v68 objects:v77 count:16];
  if (v52)
  {
    uint64_t v51 = *(void *)v69;
    do
    {
      for (i = 0LL; i != v52; i = (char *)i + 1)
      {
        if (*(void *)v69 != v51) {
          objc_enumerationMutation(v5);
        }
        uint64_t v7 = *(void *)(*((void *)&v68 + 1) + 8LL * (void)i);
        context = objc_autoreleasePoolPush();
        id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 installedProfileWithIdentifier:v7]);

        __int128 v66 = 0u;
        __int128 v67 = 0u;
        __int128 v64 = 0u;
        __int128 v65 = 0u;
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 payloads]);
        id v11 = [v10 countByEnumeratingWithState:&v64 objects:v76 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v65;
          do
          {
            for (j = 0LL; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v65 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void **)(*((void *)&v64 + 1) + 8LL * (void)j);
              uint64_t v16 = objc_autoreleasePoolPush();
              uint64_t v17 = objc_opt_class(&OBJC_CLASS___MCDefaultsPayload);
              if ((objc_opt_isKindOfClass(v15, v17) & 1) != 0)
              {
                __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v15 domains]);
                [v3 addObjectsFromArray:v18];
              }

              objc_autoreleasePoolPop(v16);
            }

            id v12 = [v10 countByEnumeratingWithState:&v64 objects:v76 count:16];
          }

          while (v12);
        }

        objc_autoreleasePoolPop(context);
      }

      id v52 = [v5 countByEnumeratingWithState:&v68 objects:v77 count:16];
    }

    while (v52);
  }

  uint64_t v19 = MDMAppManagementFilePath();
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v20));

  contexta = v21;
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:kMDMManagedAppMetadataByBundleIDKey]);
  uint64_t v23 = objc_claimAutoreleasedReturnValue([v22 allKeys]);

  uint64_t v53 = (void *)v23;
  [v3 addObjectsFromArray:v23];
  unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue( +[MCManagedPreferencesManager globalManagedPreferencesDomain]( &OBJC_CLASS___MCManagedPreferencesManager,  "globalManagedPreferencesDomain"));
  [v3 addObject:v24];

  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v49 fileManager]);
  uint64_t v27 = MCSystemPreferencesDirectory();
  id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  id v29 = (void *)objc_claimAutoreleasedReturnValue([v26 contentsOfDirectoryAtPath:v28 error:0]);

  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  id v30 = v29;
  id v31 = [v30 countByEnumeratingWithState:&v60 objects:v75 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v61;
    do
    {
      for (k = 0LL; k != v32; k = (char *)k + 1)
      {
        if (*(void *)v61 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)k);
        id v36 = objc_autoreleasePoolPush();
        __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v35 stringByDeletingPathExtension]);
        if (([v37 rangeOfString:@"com.apple." options:8]
           || ([v37 isEqualToString:@"com.apple.Numbers"] & 1) != 0
           || ([v37 isEqualToString:@"com.apple.Pages"] & 1) != 0
           || [v37 isEqualToString:@"com.apple.Keynote"])
          && ([v3 containsObject:v37] & 1) == 0)
        {
          [v25 addObject:v37];
        }

        objc_autoreleasePoolPop(v36);
      }

      id v32 = [v30 countByEnumeratingWithState:&v60 objects:v75 count:16];
    }

    while (v32);
  }

  if ([v25 count])
  {
    os_log_t v38 = _MCLogObjects[12];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v39 = v38;
      id v40 = [v25 count];
      *(_DWORD *)buf = 134217984;
      id v74 = v40;
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Removing %lu unused managed default domains.",  buf,  0xCu);
    }

    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    id v41 = v25;
    id v42 = [v41 countByEnumeratingWithState:&v56 objects:v72 count:16];
    if (v42)
    {
      id v43 = v42;
      uint64_t v44 = *(void *)v57;
      do
      {
        for (m = 0LL; m != v43; m = (char *)m + 1)
        {
          if (*(void *)v57 != v44) {
            objc_enumerationMutation(v41);
          }
          id v46 = *(void **)(*((void *)&v56 + 1) + 8LL * (void)m);
          if ([v46 length]) {
            +[MCManagedPreferencesManager setManagedPreferences:forDomain:]( &OBJC_CLASS___MCManagedPreferencesManager,  "setManagedPreferences:forDomain:",  &__NSDictionary0__struct,  v46);
          }
        }

        id v43 = [v41 countByEnumeratingWithState:&v56 objects:v72 count:16];
      }

      while (v43);
    }
  }

  uint64_t v47 = _MCLogObjects[12];
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Finished cleaning up app configuration.",  buf,  2u);
  }

  objc_autoreleasePoolPop(v50);
}

- (void)_removeUnmanageableApps
{
  uint64_t v2 = objc_autoreleasePoolPush();
  v36[0] = MCiBooksBundleIdentifier;
  v36[1] = MCShortcutsOldBundleIdentifier;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v36, 2LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v3));

  uint64_t v5 = ((uint64_t (*)(void))MDMAppManagementFilePath)();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v6));

  if ([v7 count])
  {
    uint64_t v8 = kMDMManagedAppMetadataByBundleIDKey;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kMDMManagedAppMetadataByBundleIDKey]);
    id v10 = [v9 mutableCopy];

    if ([v10 count])
    {
      id v11 = _MCLogObjects[12];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Cleaning up managed apps...", buf, 2u);
      }

      uint64_t v26 = v8;
      id v28 = v2;
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v10 count]));
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      id v27 = v10;
      id v13 = v10;
      id v14 = [v13 countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v14)
      {
        id v15 = v14;
        int v16 = 0;
        uint64_t v17 = *(void *)v30;
        do
        {
          for (i = 0LL; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v30 != v17) {
              objc_enumerationMutation(v13);
            }
            uint64_t v19 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)i);
            if ([v4 containsObject:v19])
            {
              ++v16;
            }

            else
            {
              __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v19]);
              [v12 setObject:v20 forKeyedSubscript:v19];
            }
          }

          id v15 = [v13 countByEnumeratingWithState:&v29 objects:v35 count:16];
        }

        while (v15);
      }

      else
      {
        int v16 = 0;
      }

      if (([v13 isEqualToDictionary:v12] & 1) == 0)
      {
        id v21 = [v7 mutableCopy];
        uint64_t v22 = MDMAppManagementFilePath([v21 setObject:v12 forKeyedSubscript:v26]);
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        [v21 MCWriteToBinaryFile:v23];

        unsigned __int8 v24 = _MCLogObjects[12];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v34 = v16;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Removed %d apps.", buf, 8u);
        }
      }

      __int128 v25 = _MCLogObjects[12];
      id v10 = v27;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Finished cleaning up managed apps.",  buf,  2u);
      }

      uint64_t v2 = v28;
    }
  }

  objc_autoreleasePoolPop(v2);
}

- (void)_correctInstallOptionsOnProfileStubs
{
  context = objc_autoreleasePoolPush();
  uint64_t v2 = _MCLogObjects[12];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Correcting stubs with incorrect install options...",  buf,  2u);
  }

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest", context));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allInstalledProfileIdentifiers]);

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v31 = *(void *)v33;
    uint64_t v7 = kMCInstallProfileOptionIsInstalledByMDM;
    uint64_t v30 = kMCInstallProfileOptionsIsInstalledByDeclarativeManagement;
    uint64_t v8 = kMCInstallProfileOptionManagingProfileIdentifier;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v33 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)i);
        id v11 = objc_autoreleasePoolPush();
        id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 installedProfileWithIdentifier:v10]);

        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 installOptions]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v7]);
        LODWORD(v12) = [v15 BOOLValue];

        int v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v30]);
        unsigned __int8 v17 = [v16 BOOLValue];

        uint64_t v18 = objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v8]);
        uint64_t v19 = (void *)v18;
        if ((_DWORD)v12) {
          BOOL v20 = v18 == 0;
        }
        else {
          BOOL v20 = 0;
        }
        if (v20 && (v17 & 1) == 0)
        {
          id v21 = [v14 mutableCopy];
          [v21 removeObjectForKey:v7];
          id v22 = [v21 copy];
          [v13 setInstallOptions:v22];

          id v23 = [v13 isInstalledForUser];
          else {
            uint64_t v24 = MCSystemProfileStorageDirectory(v23);
          }
          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
          [v13 writeStubToDirectory:v25];
        }

        objc_autoreleasePoolPop(v11);
      }

      id v6 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }

    while (v6);
  }

  uint64_t v26 = _MCLogObjects[12];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Completed install options corrections.",  buf,  2u);
  }

  objc_autoreleasePoolPop(contexta);
}

- (void)_tagManagedAccounts
{
  context = objc_autoreleasePoolPush();
  uint64_t v2 = _MCLogObjects[12];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Tagging managed accounts...", buf, 2u);
  }

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](&OBJC_CLASS___MCDependencyManager, "sharedManager"));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  unsigned __int8 v17 = v3;
  id obj = (id)objc_claimAutoreleasedReturnValue([v3 accounts]);
  id v4 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v4)
  {
    id v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v22;
    uint64_t v8 = kMCDMManagedProfileToManagingProfileKey;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 mcProfileUUID]);
        if (v11)
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v20 dependentsOfParent:v11 inDomain:v8]);
          id v13 = [v12 count];

          BOOL v14 = v13 != 0LL;
          if (v13) {
            ++v6;
          }
        }

        else
        {
          BOOL v14 = 0LL;
        }

        id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v14));
        [v10 setAccountProperty:v15 forKey:@"MCAccountIsManaged"];
      }

      id v5 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }

    while (v5);
  }

  else
  {
    int v6 = 0;
  }

  int v16 = _MCLogObjects[12];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v26 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Completed tagging %d accounts as managed.",  buf,  8u);
  }

  objc_autoreleasePoolPop(context);
}

- (void)_tagIMAPAccountsWithProfileAndPayloadProperties
{
  __int128 v34 = objc_autoreleasePoolPush();
  uint64_t v2 = _MCLogObjects[12];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Adding missing tags to IMAP accounts...",  buf,  2u);
  }

  id v41 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount mailAccounts](&OBJC_CLASS___MailAccount, "mailAccounts", v34));
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allInstalledProfileIdentifiers]);

  id obj = v4;
  id v38 = [v4 countByEnumeratingWithState:&v61 objects:v69 count:16];
  int v5 = 0;
  if (v38)
  {
    uint64_t v37 = *(void *)v62;
    uint64_t v6 = MailAccountManagedTag;
    uint64_t v47 = kMCAccountProfileUUIDKey;
    uint64_t v45 = MailAccountManagedTag;
    uint64_t v46 = kMCAccountPayloadUUIDKey;
    uint64_t v7 = &MailAccountHostname_ptr;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v62 != v37)
        {
          uint64_t v9 = v8;
          objc_enumerationMutation(obj);
          uint64_t v8 = v9;
        }

        uint64_t v40 = v8;
        uint64_t v10 = *(void *)(*((void *)&v61 + 1) + 8 * v8);
        context = objc_autoreleasePoolPush();
        id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 installedProfileWithIdentifier:v10]);

        __int128 v59 = 0u;
        __int128 v60 = 0u;
        __int128 v57 = 0u;
        __int128 v58 = 0u;
        id v48 = v12;
        id v44 = (id)objc_claimAutoreleasedReturnValue([v12 payloads]);
        id v13 = [v44 countByEnumeratingWithState:&v57 objects:v68 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v58;
          uint64_t v42 = *(void *)v58;
          do
          {
            int v16 = 0LL;
            id v43 = v14;
            do
            {
              if (*(void *)v58 != v15) {
                objc_enumerationMutation(v44);
              }
              unsigned __int8 v17 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)v16);
              uint64_t v18 = objc_autoreleasePoolPush();
              uint64_t v19 = objc_opt_class(v7[80]);
              if ((objc_opt_isKindOfClass(v17, v19) & 1) != 0)
              {
                id v50 = v17;
                BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v50 persistentResourceID]);
                __int128 v53 = 0u;
                __int128 v54 = 0u;
                __int128 v55 = 0u;
                __int128 v56 = 0u;
                id v51 = v41;
                id v21 = [v51 countByEnumeratingWithState:&v53 objects:v67 count:16];
                if (v21)
                {
                  id v22 = v21;
                  uint64_t v23 = *(void *)v54;
                  uint64_t v49 = v20;
                  do
                  {
                    for (i = 0LL; i != v22; i = (char *)i + 1)
                    {
                      if (*(void *)v54 != v23) {
                        objc_enumerationMutation(v51);
                      }
                      __int128 v25 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)i);
                      int v26 = (void *)objc_claimAutoreleasedReturnValue([v25 accountPropertyForKey:v6]);
                      id v27 = v26;
                      if (v26 && [v26 isEqualToString:v20])
                      {
                        int v52 = v5;
                        id v28 = (void *)objc_claimAutoreleasedReturnValue([v48 UUID]);
                        [v25 setAccountProperty:v28 forKey:v47];

                        __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v50 UUID]);
                        [v25 setAccountProperty:v29 forKey:v46];

                        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v25 deliveryAccount]);
                        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v48 UUID]);
                        [v30 setAccountProperty:v31 forKey:v47];

                        __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v50 UUID]);
                        [v30 setAccountProperty:v32 forKey:v46];

                        uint64_t v6 = v45;
                        BOOL v20 = v49;
                        int v5 = v52 + 1;
                      }
                    }

                    id v22 = [v51 countByEnumeratingWithState:&v53 objects:v67 count:16];
                  }

                  while (v22);
                }

                uint64_t v7 = &MailAccountHostname_ptr;
                uint64_t v15 = v42;
                id v14 = v43;
              }

              objc_autoreleasePoolPop(v18);
              int v16 = (char *)v16 + 1;
            }

            while (v16 != v14);
            id v14 = [v44 countByEnumeratingWithState:&v57 objects:v68 count:16];
          }

          while (v14);
        }

        objc_autoreleasePoolPop(context);
        uint64_t v8 = v40 + 1;
      }

      while ((id)(v40 + 1) != v38);
      id v38 = [obj countByEnumeratingWithState:&v61 objects:v69 count:16];
    }

    while (v38);
  }

  __int128 v33 = _MCLogObjects[12];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v66 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Done adding missing tags to %d IMAP accounts.",  buf,  8u);
  }

  objc_autoreleasePoolPop(v35);
}

- (void)_validateCloudConfiguration
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[MCCloudConfigurationWriter sharedInstance]( &OBJC_CLASS___MCCloudConfigurationWriter,  "sharedInstance"));
  uint64_t v4 = MCCloudConfigurationDetailsFilePath(v3);
  int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  v5));

  id v20 = 0LL;
  unsigned int v7 = [v3 _validateDetails:v6 outReasonWhyInvalid:&v20];
  id v8 = v20;
  uint64_t v9 = _MCLogObjects[12];
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v10 = "Cloud configuration is valid";
      id v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      uint32_t v13 = 2;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, buf, v13);
    }
  }

  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v22 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_FAULT,  "Cloud configuration is invalid: %{public}@",  buf,  0xCu);
    }

    [v6 removeObjectForKey:kCCSkipSetupKey];
    id v19 = 0LL;
    unsigned int v14 = [v3 _validateDetails:v6 outReasonWhyInvalid:&v19];
    id v8 = v19;
    uint64_t v15 = _MCLogObjects[12];
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (v14)
    {
      if (v16)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Fixed cloud configuration by deleting skip keys",  buf,  2u);
      }

      uint64_t v17 = MCCloudConfigurationDetailsFilePath(v16);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      [v6 MCWriteToBinaryFile:v18];

      MCSendCloudConfigurationDetailsChangedNotification();
    }

    else if (v16)
    {
      *(_DWORD *)buf = 138543362;
      id v22 = v8;
      uint64_t v10 = "Unable to fix cloud configuration: %{public}@";
      id v11 = v15;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 12;
      goto LABEL_12;
    }
  }

  objc_autoreleasePoolPop(v2);
}

- (void)_correctCloudConfigurationIfNecessary
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = MCCloudConfigurationDetailsFilePath(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  v4));

  uint64_t v6 = kCCIsSupervisedKey;
  v52[0] = kCCIsSupervisedKey;
  v52[1] = kCCAllowPairingKey;
  v53[0] = &__kCFBooleanTrue;
  v53[1] = &__kCFBooleanTrue;
  v52[2] = kCCCloudConfigurationUICompleteKey;
  v52[3] = kCCPostSetupProfileWasInstalledKey;
  v53[2] = &__kCFBooleanTrue;
  v53[3] = &__kCFBooleanFalse;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v53,  v52,  4LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](&OBJC_CLASS___MCHacks, "sharedHacks"));
  unsigned int v9 = [v8 isSetupBuddyDone];

  uint64_t v10 = _MCLogObjects[12];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    BOOL v45 = v5 != 0LL;
    __int16 v46 = 1024;
    int v47 = v9 ^ 1;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Correcting cloud configuration if necessary... (hasCloudConfig %d, inSetupAssistant %d)",  buf,  0xEu);
  }

  if (v5) {
    unsigned int v11 = 0;
  }
  else {
    unsigned int v11 = v9;
  }
  if (v11 == 1) {
    id v5 = [v7 mutableCopy];
  }
  if (v5)
  {
    uint64_t v12 = kCCConfigurationSourceKey;
    uint32_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kCCConfigurationSourceKey]);

    if (v13
      || (uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]),
          unsigned int v16 = [v15 BOOLValue],
          v15,
          !v16))
    {
      if (!v11)
      {
        int v28 = 0;
        goto LABEL_26;
      }
    }

    else
    {
      v51[0] = objc_opt_class(&OBJC_CLASS___MCGlobalHTTPProxyPayload);
      v51[1] = objc_opt_class(&OBJC_CLASS___MCMDMPayload);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v51, 2LL));
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v17));

      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 allInstalledProfileIdentifiers]);

      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      id v21 = v20;
      uint64_t v22 = (uint64_t)[v21 countByEnumeratingWithState:&v40 objects:v50 count:16];
      if (v22)
      {
        uint64_t v36 = v12;
        uint64_t v37 = v6;
        id v38 = v7;
        __int128 v39 = v2;
        uint64_t v23 = *(void *)v41;
        while (2)
        {
          for (uint64_t i = 0LL; i != v22; ++i)
          {
            if (*(void *)v41 != v23) {
              objc_enumerationMutation(v21);
            }
            uint64_t v25 = *(void *)(*((void *)&v40 + 1) + 8 * i);
            uint64_t v26 = objc_claimAutoreleasedReturnValue( +[MCManifest sharedManifest]( &OBJC_CLASS___MCManifest,  "sharedManifest",  v36,  v37,  v38,  v39,  (void)v40));
            id v27 = (void *)objc_claimAutoreleasedReturnValue([(id)v26 installedProfileWithIdentifier:v25]);

            LOBYTE(v26) = [v27 containsAnyPayloadOfClasses:v18];
            if ((v26 & 1) != 0)
            {
              uint64_t v22 = 1LL;
              goto LABEL_23;
            }
          }

          uint64_t v22 = (uint64_t)[v21 countByEnumeratingWithState:&v40 objects:v50 count:16];
          if (v22) {
            continue;
          }
          break;
        }

- (void)_wakeDaemonsPostMigration
{
  uint64_t v2 = (os_log_s *)_MCLogObjects[12];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Waking daemons post migration", v5, 2u);
  }

  uint64_t Mode = MCPowerlogControlReadMode();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(Mode);
  MCPowerlogControlSwitchMode();
}

- (void)_removeLegacyAPNConfigurations
{
  context = objc_autoreleasePoolPush();
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCAPNPayload apnDomainName](&OBJC_CLASS___MCAPNPayload, "apnDomainName"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[MCManagedPreferencesManager managedPreferencesForDomain:]( &OBJC_CLASS___MCManagedPreferencesManager,  "managedPreferencesForDomain:",  v2));

  if (v3)
  {
    uint64_t v4 = _MCLogObjects[12];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "MCMigrator removing APN defaults: %@",  buf,  0xCu);
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCAPNPayload apnDomainName](&OBJC_CLASS___MCAPNPayload, "apnDomainName"));
    +[MCManagedPreferencesManager removeManagedPreferences:fromDomain:]( &OBJC_CLASS___MCManagedPreferencesManager,  "removeManagedPreferences:fromDomain:",  v5,  v6);
  }

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest", v3));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allInstalledProfileIdentifiers]);

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0LL; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
        unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 installedProfileWithIdentifier:v14]);

        if ([v16 containsPayloadOfClass:objc_opt_class(MCAPNPayload)])
        {
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller"));
          objc_msgSend( v17,  "removeProfileWithIdentifier:installationType:source:",  v14,  objc_msgSend(v16, "installType"),  @"migrator APN cleanup");
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v11);
  }

  objc_autoreleasePoolPop(context);
}

- (void)_correctMDMConfigurationFile
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = MDMFilePath();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v4));

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization DMCSafePropertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "DMCSafePropertyListWithData:options:format:error:",  v5,  1LL,  0LL,  0LL));
  unsigned int v7 = v6;
  if (v6)
  {
    uint64_t v8 = kMDMIsProfileLockedKey;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kMDMIsProfileLockedKey]);

    if (!v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 verifiedMDMProfileIdentifierWithCleanUp]);

      if (v11)
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[MCManifest installedProfileWithIdentifier:]( &OBJC_CLASS___MCManifest,  "installedProfileWithIdentifier:",  v11));
        uint32_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v12 isLocked]));
        [v7 setObject:v13 forKeyedSubscript:v8];
      }

      else
      {
        [v7 setObject:&__kCFBooleanFalse forKeyedSubscript:v8];
      }

      uint64_t v14 = MDMFilePath();
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      [v7 DMCWriteToBinaryFile:v15];
    }
  }

  objc_autoreleasePoolPop(v2);
}

- (void)_checkValidUserEnrollment
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 installedMDMProfile]);

  if (v4)
  {
    id v5 = [v4 payloadsWithClass:objc_opt_class(MCMDMPayload)];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);

    if (v7)
    {
      if (([v7 isUserEnrollment] & 1) == 0)
      {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 enrollmentID]);

        if (v8)
        {
          id v9 = _MCLogObjects[12];
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)__int128 v24 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Fixing UserEnrollment in profile stub and MDM.plist",  v24,  2u);
          }

          [v7 setIsUserEnrollment:1];
          id v10 = [v4 isInstalledForUser];
          else {
            uint64_t v11 = MCSystemProfileStorageDirectory(v10);
          }
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
          uint64_t v13 = MDMFilePath([v4 writeStubToDirectory:v12]);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary MCDictionaryFromFile:]( &OBJC_CLASS___NSDictionary,  "MCDictionaryFromFile:",  v14));
          id v16 = [v15 mutableCopy];

          [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:kMDMUserEnrollmentKey];
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v7 enrollmentID]);
          [v16 setObject:v17 forKeyedSubscript:kMDMEnrollmentIDKey];

          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v7 iCloudEnrollmentID]);
          [v16 setObject:v18 forKeyedSubscript:kMDMiCloudEnrollmentIDKey];

          id v19 = (void *)objc_claimAutoreleasedReturnValue([v7 easEnrollmentID]);
          [v16 setObject:v19 forKeyedSubscript:kMDMEASEnrollmentIDKey];

          uint64_t v21 = MDMFilePath(v20);
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
          [v16 MCWriteToBinaryFile:v22];

          __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](&OBJC_CLASS___MDMConfiguration, "sharedConfiguration"));
          [v23 refreshDetailsFromDisk];
        }
      }
    }
  }

  objc_autoreleasePoolPop(v2);
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
}

- (MCNotifier)notifier
{
  return self->_notifier;
}

- (void)setNotifier:(id)a3
{
}

- (BOOL)systemProfileStorageWasMigratedFromLegacyStorage
{
  return self->_systemProfileStorageWasMigratedFromLegacyStorage;
}

- (void)setSystemProfileStorageWasMigratedFromLegacyStorage:(BOOL)a3
{
  self->_systemProfileStorageWasMigratedFromLegacyStorage = a3;
}

- (void).cxx_destruct
{
}

@end