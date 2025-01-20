@interface MCServerSideHacks
+ (id)mergeArray:(id)a3 withArray:(id)a4;
+ (id)sharedHacks;
+ (void)setAllowHacksToCallExternalComponents:(BOOL)a3;
- (BOOL)_anyBoolRestrictionChangedInSet:(id)a3 oldRestrictions:(id)a4 newRestrictions:(id)a5;
- (BOOL)applyEffectiveSettings:(id)a3 toSettings:(id)a4 withOldRestrictions:(id)a5 newRestrictions:(id)a6;
- (id)recomputeAccountVPNAssociations;
- (void)_applyServerSideChangesWithOldRestrictions:(id)a3 newRestrictions:(id)a4 oldEffectiveUserSettings:(id)a5 newEffectiveUserSettings:(id)a6;
- (void)applyEffectiveSettings:(id)a3 toOtherSubsystemsPasscode:(id)a4 credentialSet:(id)a5;
- (void)applyGracePeriodSettingFromKeybagToUserSettings;
- (void)recomputeAppOptionsEffectiveUserSettings:(id)a3 outEffectiveChangeDetected:(BOOL *)a4;
- (void)recomputeAppRulesForNetworkExtension;
- (void)recomputeHacksAfterProfileChangesEffectiveUserSettings:(id)a3 sendNotifications:(BOOL)a4;
- (void)recomputeWebContentFilterEffectiveUserSettings:(id)a3 outEffectiveChangeDetected:(BOOL *)a4 outMechanismChangedDetected:(BOOL *)a5;
- (void)resetSettingsSender:(id)a3;
- (void)setUserTrackingTCCAccessOverrideForRestrictions:(id)a3;
@end

@implementation MCServerSideHacks

+ (void)setAllowHacksToCallExternalComponents:(BOOL)a3
{
  BOOL v3 = a3;
  byte_1000DBFE0 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MCActivationUtilities sharedInstance](&OBJC_CLASS___MCActivationUtilities, "sharedInstance"));
  [v4 setIsReady:v3];
}

+ (id)sharedHacks
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MCServerSideHacks;
  id v2 = objc_msgSendSuper2(&v4, "sharedHacks");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (BOOL)_anyBoolRestrictionChangedInSet:(id)a3 oldRestrictions:(id)a4 newRestrictions:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v10);
        }
        if ((+[MCRestrictionManagerWriter restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:]( &OBJC_CLASS___MCRestrictionManagerWriter,  "restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)i),  v8,  v9,  (void)v15) & 1) != 0)
        {
          LOBYTE(v11) = 1;
          goto LABEL_11;
        }
      }

      id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

- (void)_applyServerSideChangesWithOldRestrictions:(id)a3 newRestrictions:(id)a4 oldEffectiveUserSettings:(id)a5 newEffectiveUserSettings:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!byte_1000DBFE0)
  {
    v33 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_INFO,  "Not calling out to external components.",  buf,  2u);
    }

    goto LABEL_68;
  }

  if (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",  MCFeatureEncryptedBackupRequired,  v12,  v13)) {
    -[MCServerSideHacks _setRequriesEncryptedBackupInLockdownWithEffectiveUserSettings:]( self,  "_setRequriesEncryptedBackupInLockdownWithEffectiveUserSettings:",  v13);
  }
  v62 = self;
  uint64_t v14 = MCFeatureAppInstallationAllowed;
  if (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",  MCFeatureAppInstallationAllowed,  v12,  v13))
  {
    BOOL v15 = +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSettingForFeature:withUserSettingDictionary:",  v14,  v13) != 2;
    uint64_t v16 = MCLockdownOperationQueue();
    __int128 v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100072EE8;
    block[3] = &unk_1000C3F18;
    BOOL v81 = v15;
    dispatch_async(v17, block);
  }

  uint64_t v18 = MCFeatureAppRemovalAllowed;
  if (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",  MCFeatureAppRemovalAllowed,  v12,  v13))
  {
    BOOL v19 = +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSettingForFeature:withUserSettingDictionary:",  v18,  v13) != 2;
    uint64_t v20 = MCLockdownOperationQueue();
    v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v20);
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472LL;
    v78[2] = sub_100072F5C;
    v78[3] = &unk_1000C3F18;
    BOOL v79 = v19;
    dispatch_async(v21, v78);
  }

  uint64_t v22 = MCFeatureHostPairingAllowed;
  if (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",  MCFeatureHostPairingAllowed,  v12,  v13)
    && +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSettingForFeature:withUserSettingDictionary:",  v22,  v13) == 2)
  {
    uint64_t v23 = MCLockdownOperationQueue();
    v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v23);
    dispatch_async(v24, &stru_1000C3F38);
  }

  v25 = self;
  if (+[MCRestrictionManager unionValuesSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManager,  "unionValuesSetting:valueChangedBetweenOldSettings:andNewSettings:",  MCFeatureTrustedCodeSigningIdentities,  v12,  v13))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[MCProvisioningProfileJanitor sharedJanitor]( &OBJC_CLASS___MCProvisioningProfileJanitor,  "sharedJanitor"));
    [v26 updateMISTrust];
  }

  uint64_t v27 = MCFeatureAssistantAllowed;
  if (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",  MCFeatureAssistantAllowed,  v12,  v13)
    && +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSettingForFeature:withUserSettingDictionary:",  v27,  v13) == 2)
  {
    CFPreferencesSetAppValue(@"Assistant Enabled", kCFBooleanFalse, @"com.apple.assistant.support");
    CFPreferencesAppSynchronize(@"com.apple.assistant.support");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification( DarwinNotifyCenter,  @"kAFPreferencesDidChangeDarwinNotification",  0LL,  0LL,  1u);
  }

  uint64_t v29 = MCFeatureFIPSVerificationForced;
  if (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",  MCFeatureFIPSVerificationForced,  v12,  v13))
  {
    if (+[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSettingForFeature:withUserSettingDictionary:",  v29,  v13) == 1)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
      [v30 writeToFile:@"/var/mobile/Library/Preferences/enable_fips_mode" atomically:0];

      v31 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v32 = "Turning on FIPS verification.";
LABEL_24:
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, v32, buf, 2u);
      }
    }

    else
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      [v34 removeItemAtPath:@"/var/mobile/Library/Preferences/enable_fips_mode" error:0];

      v31 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v32 = "Turning off FIPS verification.";
        goto LABEL_24;
      }
    }
  }

  uint64_t v35 = MCFeatureDiagnosticsSubmissionAllowed;
  if (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",  MCFeatureDiagnosticsSubmissionAllowed,  v12,  v13)
    && +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSettingForFeature:withUserSettingDictionary:",  v35,  v12))
  {
    v36 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification( v36,  @"com.apple.OTACrashCopier.SubmissionPreferenceChanged",  0LL,  0LL,  1u);
  }

  uint64_t v37 = MCFeatureCloudKeychainSyncAllowed;
  if (!+[MCRestrictionManager restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:]( &OBJC_CLASS___MCRestrictionManager,  "restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:",  MCFeatureCloudKeychainSyncAllowed,  v10,  v11)
    || +[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "restrictedBoolForFeature:withRestrictionsDictionary:",  v37,  v11) != 2)
  {
    goto LABEL_37;
  }

  v38 = (void *)objc_opt_new(&OBJC_CLASS___OTConfigurationContext);
  id v39 = [[OTClique alloc] initWithContextData:v38];
  id v77 = 0LL;
  unsigned __int8 v40 = [v39 setUserControllableViewsSyncStatus:0 error:&v77];
  id v41 = v77;
  os_log_t v42 = _MCLogObjects[0];
  if ((v40 & 1) != 0)
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v43 = "Disabled keychain sync.";
      v44 = v42;
      os_log_type_t v45 = OS_LOG_TYPE_DEFAULT;
      uint32_t v46 = 2;
LABEL_35:
      _os_log_impl((void *)&_mh_execute_header, v44, v45, v43, buf, v46);
    }
  }

  else if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v85 = v41;
    v43 = "Unable to leave clique to disable keychain sync. Error: %{public}@";
    v44 = v42;
    os_log_type_t v45 = OS_LOG_TYPE_ERROR;
    uint32_t v46 = 12;
    goto LABEL_35;
  }

  v25 = v62;
LABEL_37:
  id v60 = v13;
  id v61 = v12;
  uint64_t v71 = MCFeaturePhotoStreamAllowed;
  uint64_t v72 = MCFeatureCloudPhotoLibraryAllowed;
  v83[0] = MCFeatureCloudPhotoLibraryAllowed;
  v83[1] = MCFeaturePhotoStreamAllowed;
  uint64_t v69 = MCFeatureCloudBackupAllowed;
  uint64_t v70 = MCFeatureSharedStreamAllowed;
  v83[2] = MCFeatureSharedStreamAllowed;
  v83[3] = MCFeatureCloudBackupAllowed;
  uint64_t v47 = MCFeatureCloudDocumentSyncAllowed;
  v83[4] = MCFeatureCloudDocumentSyncAllowed;
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v83, 5LL));
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v48));
  unsigned int v50 = -[MCServerSideHacks _anyBoolRestrictionChangedInSet:oldRestrictions:newRestrictions:]( v25,  "_anyBoolRestrictionChangedInSet:oldRestrictions:newRestrictions:",  v49,  v10,  v11);

  if (v50)
  {
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
    id obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "aa_appleAccounts"));
    id v51 = [obj countByEnumeratingWithState:&v73 objects:v82 count:16];
    if (!v51) {
      goto LABEL_65;
    }
    id v52 = v51;
    uint64_t v53 = *(void *)v74;
    uint64_t v54 = kAccountDataclassCloudPhotos;
    uint64_t v68 = kAccountDataclassMediaStream;
    uint64_t v67 = kAccountDataclassSharedStreams;
    uint64_t v66 = kAccountDataclassBackup;
    uint64_t v65 = kAccountDataclassUbiquity;
    uint64_t v55 = kAccountDataclassKeyValue;
    uint64_t v56 = kAccountDataclassCloudPhotos;
    while (1)
    {
      for (i = 0LL; i != v52; i = (char *)i + 1)
      {
        if (*(void *)v74 != v53) {
          objc_enumerationMutation(obj);
        }
        v58 = *(void **)(*((void *)&v73 + 1) + 8LL * (void)i);
        if (+[MCRestrictionManagerWriter restrictedBoolForFeature:withRestrictionsDictionary:]( MCRestrictionManagerWriter,  "restrictedBoolForFeature:withRestrictionsDictionary:",  v72,  v11) == 2 && [v58 isEnabledForDataclass:v54])
        {
          [v58 setEnabled:0 forDataclass:v54];
          int v59 = 1;
        }

        else
        {
          int v59 = 0;
        }

        if (+[MCRestrictionManagerWriter restrictedBoolForFeature:withRestrictionsDictionary:]( MCRestrictionManagerWriter,  "restrictedBoolForFeature:withRestrictionsDictionary:",  v71,  v11) == 2 && [v58 isEnabledForDataclass:v68])
        {
          [v58 setEnabled:0 forDataclass:v68];
          int v59 = 1;
        }

        if (+[MCRestrictionManagerWriter restrictedBoolForFeature:withRestrictionsDictionary:]( MCRestrictionManagerWriter,  "restrictedBoolForFeature:withRestrictionsDictionary:",  v70,  v11) == 2 && [v58 isEnabledForDataclass:v67])
        {
          [v58 setEnabled:0 forDataclass:v67];
          int v59 = 1;
        }

        if (+[MCRestrictionManagerWriter restrictedBoolForFeature:withRestrictionsDictionary:]( MCRestrictionManagerWriter,  "restrictedBoolForFeature:withRestrictionsDictionary:",  v69,  v11) == 2 && [v58 isEnabledForDataclass:v66])
        {
          [v58 setEnabled:0 forDataclass:v66];
          int v59 = 1;
        }

        if (+[MCRestrictionManagerWriter restrictedBoolForFeature:withRestrictionsDictionary:]( &OBJC_CLASS___MCRestrictionManagerWriter,  "restrictedBoolForFeature:withRestrictionsDictionary:",  v47,  v11) != 2) {
          goto LABEL_61;
        }
        if ([v58 isEnabledForDataclass:v65])
        {
          [v58 setEnabled:0 forDataclass:v65];
          int v59 = 1;
        }

        if ([v58 isEnabledForDataclass:v55])
        {
          [v58 setEnabled:0 forDataclass:v55];
        }

        else
        {
LABEL_61:
          if (!v59) {
            goto LABEL_63;
          }
        }

        [v64 saveAccount:v58 withDataclassActions:0 doVerify:0 completion:&stru_1000C3F78];
LABEL_63:
        uint64_t v54 = v56;
      }

      id v52 = [obj countByEnumeratingWithState:&v73 objects:v82 count:16];
      if (!v52)
      {
LABEL_65:

        v25 = v62;
        break;
      }
    }
  }

  id v13 = v60;
  id v12 = v61;
  if (+[MCRestrictionManager restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:]( &OBJC_CLASS___MCRestrictionManager,  "restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:",  MCFeatureLimitAdTrackingForced,  v10,  v11)) {
    -[MCServerSideHacks setUserTrackingTCCAccessOverrideForRestrictions:]( v25,  "setUserTrackingTCCAccessOverrideForRestrictions:",  v11);
  }
LABEL_68:
}

- (void)applyEffectiveSettings:(id)a3 toOtherSubsystemsPasscode:(id)a4 credentialSet:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (byte_1000DBFE0)
  {
    id v78 = v9;
    id v11 = +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSettingForFeature:withUserSettingDictionary:",  MCFeatureAutomaticDateAndTimeForced,  v7);
    if ((_DWORD)v11 == 1)
    {
      TMSetAutomaticTimeZoneEnabled();
      id v11 = (id)TMSetAutomaticTimeEnabled(1LL);
    }

    if (MCGestaltHasSEP(v11))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 memberQueueRestrictions]);

      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager valueForFeature:withRestrictionsDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "valueForFeature:withRestrictionsDictionary:",  MCFeatureMaximumFailedPasscodeAttempts,  v13));
      id v15 = [v14 unsignedIntegerValue];

      if (v15 != (id)MCKeybagCurrentMaximumFailedPasscodeAttempts())
      {
        uint64_t v16 = MCKeybagSetMaximumFailedPasscodeAttempts(v15, v8);
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        if (v17)
        {
          uint64_t v18 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v99 = v17;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Failed to set maximum failed passcode attempts. Error: %{public}@",  buf,  0xCu);
          }
        }
      }
    }

    uint64_t v19 = MCFeaturePasscodeLockGraceTime;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager valueSettingForFeature:withUserSettingDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "valueSettingForFeature:withUserSettingDictionary:",  MCFeaturePasscodeLockGraceTime,  v7));
    id v21 = [v20 unsignedLongValue];

    uint64_t v22 = MCKeybagCurrentPasscodeGracePeriod();
    if (v21 != (id)v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = MCKeybagSetPasscodeGracePeriod(v21, v8);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      if (v25)
      {
        v26 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v99 = v25;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Failed to set grace period. Error: %{public}@",  buf,  0xCu);
        }

        uint64_t v96 = MCRestrictedValueKey;
        uint64_t v94 = v19;
        uint64_t v92 = MCRestrictedValueValueKey;
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v23));
        v93 = v27;
        v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v93,  &v92,  1LL));
        v95 = v28;
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v95,  &v94,  1LL));
        v97 = v29;
        v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v97,  &v96,  1LL));

        [v7 MCDeepCopyEntriesFromDictionary:v30];
      }
    }

    if (_os_feature_enabled_impl("MobileKeyBag", "Memento")
      && +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSettingForFeature:withUserSettingDictionary:",  MCFeaturePasscodeRecoveryAllowed,  v7) == 2 && MCKeybagMementoBlobExists())
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](&OBJC_CLASS___MCPasscodeManagerWriter, "sharedManager"));
      v32 = (void *)objc_claimAutoreleasedReturnValue([v31 clearRecoveryPasscode]);

      if (v32)
      {
        v33 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v99 = v32;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "Failed to clear recovery passcode. Error: %{public}@",  buf,  0xCu);
        }
      }

      else
      {
        +[MCPasscodeAnalytics sendRecoveryPasscodeClearedEventWithReason:]( &OBJC_CLASS___MCPasscodeAnalytics,  "sendRecoveryPasscodeClearedEventWithReason:",  4LL);
      }
    }

    char v35 = sub_100049A70();
    id v36 = 0LL;
    id v37 = 0LL;
    id v79 = v8;
    if ((v35 & 1) != 0)
    {
      uint64_t v38 = MCFeatureFingerprintUnlockAllowed;
      unsigned int v39 = +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSettingForFeature:withUserSettingDictionary:",  MCFeatureFingerprintUnlockAllowed,  v7);
      else {
        uint64_t v41 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v40 != 2));
      }
      uint64_t v43 = MCFeatureFingerprintForContactlessPaymentAllowed;
      unsigned int v44 = +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSettingForFeature:withUserSettingDictionary:",  MCFeatureFingerprintForContactlessPaymentAllowed,  v7);
      else {
        uint64_t v46 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v45 != 2));
      }
      if (v41 | v46)
      {
        uint64_t v47 = sub_100049A78();
        v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
        if (v48)
        {
          if (v41)
          {
            uint64_t v90 = MCRestrictedBoolKey;
            id v87 = v36;
            uint64_t v88 = v38;
            uint64_t v86 = MCRestrictedBoolValueKey;
            id v77 = v48;
            v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v87,  &v86,  1LL));
            v89 = v49;
            unsigned int v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v89,  &v88,  1LL));
            v91 = v50;
            id v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v91,  &v90,  1LL));

            [v7 MCDeepCopyEntriesFromDictionary:v51];
            v48 = v77;
          }

          if (v46)
          {
            uint64_t v84 = MCRestrictedBoolKey;
            id v81 = v37;
            uint64_t v82 = v43;
            uint64_t v80 = MCRestrictedBoolValueKey;
            id v52 = v48;
            uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v81,  &v80,  1LL));
            v83 = v53;
            uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v83,  &v82,  1LL));
            id v85 = v54;
            uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v85,  &v84,  1LL));

            [v7 MCDeepCopyEntriesFromDictionary:v55];
            v48 = v52;
          }
        }
      }
    }

    else
    {
      os_log_t v42 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_INFO,  "Fingerprint unlock state is currently not available. Ignoring.",  buf,  2u);
      }
    }

    if (+[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSettingForFeature:withUserSettingDictionary:",  MCFeatureWifiPowerOnEnforced,  v7) == 1)
    {
      uint64_t v56 = WiFiManagerClientCreate(kCFAllocatorDefault, 0LL);
      if (v56)
      {
        v57 = (const void *)v56;
        CFRunLoopRef Current = CFRunLoopGetCurrent();
        WiFiManagerClientScheduleWithRunLoop(v57, Current, kCFRunLoopDefaultMode);
        CFRunLoopRef v59 = CFRunLoopGetCurrent();
        WiFiManagerClientUnscheduleFromRunLoop(v57, v59, kCFRunLoopDefaultMode);
        CFRelease(v57);
      }
    }

    id v60 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager valueSettingForFeature:withUserSettingDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "valueSettingForFeature:withUserSettingDictionary:",  MCFeatureSafariAcceptCookies,  v7));
    id v61 = v60;
    v62 = (id *)&kMCSafariCookieAcceptPolicyExclusivelyFromMainDocumentDomain;
    if (v60)
    {
      [v60 floatValue];
      if (v63 >= 2.0)
      {
        v62 = (id *)&kMCSafariCookieAcceptPolicyAlways;
        uint64_t v64 = 3LL;
      }

      else if (v63 >= 1.5)
      {
        v62 = (id *)&kMCSafariCookieAcceptPolicyOnlyFromMainDocumentDomain;
        uint64_t v64 = 2LL;
      }

      else
      {
        uint64_t v64 = v63 >= 1.0;
        if (v63 < 1.0) {
          v62 = (id *)&kMCSafariCookieAcceptPolicyNever;
        }
      }
    }

    else
    {
      uint64_t v64 = 1LL;
    }

    id v65 = *v62;
    uint64_t v66 = (void *)CFPreferencesCopyAppValue(@"CookieAcceptPolicy", @"com.apple.WebUI");
    if ((MCEqualStrings(v65, v66) & 1) == 0)
    {
      CFPreferencesSetAppValue(@"CookieAcceptPolicy", v65, @"com.apple.WebUI");
      CFPreferencesAppSynchronize(@"com.apple.WebUI");
      uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSHTTPCookieStorage sharedHTTPCookieStorage]( &OBJC_CLASS___NSHTTPCookieStorage,  "sharedHTTPCookieStorage"));
      [v67 setCookieAcceptPolicy:v64];

      MCSendSafariCookiePolicyChangedNotification();
    }

    unsigned int v68 = +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSettingForFeature:withUserSettingDictionary:",  MCFeatureEnterpriseBookBackupAllowed,  v7);
    uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v70 = MDMManagedNonStoreBooksDirectory();
    uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
    unsigned int v72 = [v69 fileExistsAtPath:v71];

    if (v72)
    {
      uint64_t v73 = MDMManagedNonStoreBooksDirectory();
      __int128 v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
      char v75 = MCSetSkipBackupAttributeToItemAtPath(v74, v68 == 2);

      if ((v75 & 1) == 0)
      {
        __int128 v76 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_ERROR,  "Failed to set backup exclusion on managed books directory",  buf,  2u);
        }
      }
    }

    id v10 = v78;
    id v8 = v79;
  }

  else
  {
    v34 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  "Not calling out to external components.",  buf,  2u);
    }
  }
}

- (BOOL)applyEffectiveSettings:(id)a3 toSettings:(id)a4 withOldRestrictions:(id)a5 newRestrictions:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = MCFeaturePasscodeLockGraceTime;
  if (+[MCRestrictionManager restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:]( &OBJC_CLASS___MCRestrictionManager,  "restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:",  MCFeaturePasscodeLockGraceTime,  a5,  a6)
    && (id v12 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager valueSettingForFeature:withUserSettingDictionary:]( MCRestrictionManager,  "valueSettingForFeature:withUserSettingDictionary:",  v11,  v9)),  v13 = [v12 unsignedLongValue],  v12,  v14 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager valueSettingForFeature:withUserSettingDictionary:]( MCRestrictionManager,  "valueSettingForFeature:withUserSettingDictionary:",  v11,  v10)),  v15 = objc_msgSend(v14, "unsignedLongValue"),  v14,  v13 != v15))
  {
    uint64_t v26 = MCRestrictedValueKey;
    uint64_t v24 = v11;
    uint64_t v22 = MCRestrictedValueValueKey;
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v13));
    uint64_t v23 = v17;
    BOOL v16 = 1;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
    v25 = v18;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
    uint64_t v27 = v19;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));

    [v10 MCDeepCopyEntriesFromDictionary:v20];
  }

  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (void)recomputeAppOptionsEffectiveUserSettings:(id)a3 outEffectiveChangeDetected:(BOOL *)a4
{
  id v89 = a3;
  objc_super v4 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Recomputing app options.", buf, 2u);
  }

  uint64_t v94 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest", a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v94 allInstalledProfileIdentifiers]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v140 = 0u;
  __int128 v141 = 0u;
  __int128 v142 = 0u;
  __int128 v143 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v140 objects:v152 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v141;
    uint64_t v10 = kMCAppWhitelistIdentifierKey;
    uint64_t v11 = &MailAccountHostname_ptr;
    uint64_t v91 = *(void *)v141;
    do
    {
      uint64_t v12 = 0LL;
      id v92 = v8;
      do
      {
        if (*(void *)v141 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v97 = v12;
        uint64_t v13 = *(void *)(*((void *)&v140 + 1) + 8 * v12);
        context = objc_autoreleasePoolPush();
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v94 installedProfileWithIdentifier:v13]);
        uint64_t v15 = objc_opt_class(&OBJC_CLASS___MCConfigurationProfile);
        if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
        {
          BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
          __int128 v136 = 0u;
          __int128 v137 = 0u;
          __int128 v138 = 0u;
          __int128 v139 = 0u;
          v95 = v14;
          id v110 = (id)objc_claimAutoreleasedReturnValue([v14 payloads]);
          id v17 = [v110 countByEnumeratingWithState:&v136 objects:v151 count:16];
          if (v17)
          {
            id v18 = v17;
            id v19 = *(id *)v137;
            id v98 = *(id *)v137;
            v102 = v16;
            do
            {
              uint64_t v20 = 0LL;
              id v106 = v18;
              do
              {
                if (*(id *)v137 != v19) {
                  objc_enumerationMutation(v110);
                }
                id v21 = *(void **)(*((void *)&v136 + 1) + 8LL * (void)v20);
                uint64_t v22 = objc_opt_class(v11[62]);
                if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0)
                {
                  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v21 whitelistedAppsAndOptions]);
                  if (v23)
                  {
                    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v21 UUID]);
                    [v16 setObject:v23 forKey:v24];

                    __int128 v134 = 0u;
                    __int128 v135 = 0u;
                    __int128 v132 = 0u;
                    __int128 v133 = 0u;
                    id v25 = v23;
                    id v26 = [v25 countByEnumeratingWithState:&v132 objects:v150 count:16];
                    if (v26)
                    {
                      id v27 = v26;
                      uint64_t v28 = *(void *)v133;
                      do
                      {
                        for (i = 0LL; i != v27; i = (char *)i + 1)
                        {
                          if (*(void *)v133 != v28) {
                            objc_enumerationMutation(v25);
                          }
                          v30 = *(void **)(*((void *)&v132 + 1) + 8LL * (void)i);
                          v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKey:v10]);
                          if (v31) {
                            [v6 setObject:v30 forKey:v31];
                          }
                        }

                        id v27 = [v25 countByEnumeratingWithState:&v132 objects:v150 count:16];
                      }

                      while (v27);
                    }

                    uint64_t v11 = &MailAccountHostname_ptr;
                    id v19 = v98;
                    BOOL v16 = v102;
                    id v18 = v106;
                  }
                }

                uint64_t v20 = (char *)v20 + 1;
              }

              while (v20 != v18);
              id v18 = [v110 countByEnumeratingWithState:&v136 objects:v151 count:16];
            }

            while (v18);
          }

          if ([v16 count])
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue([v95 identifier]);
            [v90 setObject:v16 forKey:v32];
          }

          uint64_t v9 = v91;
          id v8 = v92;
          uint64_t v14 = v95;
        }

        objc_autoreleasePoolPop(context);
        uint64_t v12 = v97 + 1;
      }

      while ((id)(v97 + 1) != v8);
      id v8 = [obj countByEnumeratingWithState:&v140 objects:v152 count:16];
    }

    while (v8);
  }

  __int128 v128 = 0u;
  __int128 v129 = 0u;
  __int128 v130 = 0u;
  __int128 v131 = 0u;
  id v111 = (id)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  id v99 = (id)objc_claimAutoreleasedReturnValue([v111 memberQueueUserClientRestrictions]);
  id v107 = [v99 countByEnumeratingWithState:&v128 objects:v149 count:16];
  if (v107)
  {
    uint64_t v103 = *(void *)v129;
    uint64_t v33 = kMCAppWhitelistIdentifierKey;
    do
    {
      for (j = 0LL; j != v107; j = (char *)j + 1)
      {
        if (*(void *)v129 != v103) {
          objc_enumerationMutation(v99);
        }
        char v35 = (void *)objc_claimAutoreleasedReturnValue( [v111 memberQueueAppsAndOptionsForClientUUID:*(void *)(*((void *)&v128 + 1) + 8 * (void)j)]);
        id v36 = v35;
        if (v35)
        {
          __int128 v126 = 0u;
          __int128 v127 = 0u;
          __int128 v124 = 0u;
          __int128 v125 = 0u;
          id v37 = [v35 countByEnumeratingWithState:&v124 objects:v148 count:16];
          if (v37)
          {
            id v38 = v37;
            uint64_t v39 = *(void *)v125;
            do
            {
              for (k = 0LL; k != v38; k = (char *)k + 1)
              {
                if (*(void *)v125 != v39) {
                  objc_enumerationMutation(v36);
                }
                uint64_t v41 = *(void **)(*((void *)&v124 + 1) + 8LL * (void)k);
                os_log_t v42 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKey:v33]);
                if (v42)
                {
                  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v42]);

                  if (!v43) {
                    [v6 setObject:v41 forKey:v42];
                  }
                }
              }

              id v38 = [v36 countByEnumeratingWithState:&v124 objects:v148 count:16];
            }

            while (v38);
          }
        }
      }

      id v107 = [v99 countByEnumeratingWithState:&v128 objects:v149 count:16];
    }

    while (v107);
  }

  __int128 v122 = 0u;
  __int128 v123 = 0u;
  __int128 v120 = 0u;
  __int128 v121 = 0u;
  id v100 = (id)objc_claimAutoreleasedReturnValue([v111 memberQueueSystemClientRestrictions]);
  id v108 = [v100 countByEnumeratingWithState:&v120 objects:v147 count:16];
  if (v108)
  {
    uint64_t v104 = *(void *)v121;
    uint64_t v44 = kMCAppWhitelistIdentifierKey;
    do
    {
      for (m = 0LL; m != v108; m = (char *)m + 1)
      {
        if (*(void *)v121 != v104) {
          objc_enumerationMutation(v100);
        }
        uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue( [v111 memberQueueAppsAndOptionsForClientUUID:*(void *)(*((void *)&v120 + 1) + 8 * (void)m)]);
        uint64_t v47 = v46;
        if (v46)
        {
          __int128 v118 = 0u;
          __int128 v119 = 0u;
          __int128 v116 = 0u;
          __int128 v117 = 0u;
          id v48 = [v46 countByEnumeratingWithState:&v116 objects:v146 count:16];
          if (v48)
          {
            id v49 = v48;
            uint64_t v50 = *(void *)v117;
            do
            {
              for (n = 0LL; n != v49; n = (char *)n + 1)
              {
                if (*(void *)v117 != v50) {
                  objc_enumerationMutation(v47);
                }
                id v52 = *(void **)(*((void *)&v116 + 1) + 8LL * (void)n);
                uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v52 objectForKey:v44]);
                if (v53)
                {
                  uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v53]);

                  if (!v54) {
                    [v6 setObject:v52 forKey:v53];
                  }
                }
              }

              id v49 = [v47 countByEnumeratingWithState:&v116 objects:v146 count:16];
            }

            while (v49);
          }
        }
      }

      id v108 = [v100 countByEnumeratingWithState:&v120 objects:v147 count:16];
    }

    while (v108);
  }

  uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v56 = [v6 count];
  uint64_t v57 = MCSystemAppOptionsByBundleIDFilePath();
  v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
  CFRunLoopRef v59 = v90;
  if (v56) {
    [v6 writeToFile:v58 atomically:1];
  }
  else {
    [v55 removeItemAtPath:v58 error:0];
  }

  id v60 = [v90 count];
  uint64_t v61 = MCSystemAppWhitelistByProfileFilePath();
  v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
  if (v60)
  {
    [v90 writeToFile:v62 atomically:1];
  }

  else
  {
    [v55 removeItemAtPath:v62 error:0];

    uint64_t v63 = MCSystemEffectiveAppWhitelistFilePath();
    v62 = (void *)objc_claimAutoreleasedReturnValue(v63);
    [v55 removeItemAtPath:v62 error:0];
  }

  uint64_t v64 = MCSystemEffectiveAppWhitelistFilePath();
  id v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
  uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v65));

  if (v66) {
    uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization MCSafePropertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "MCSafePropertyListWithData:options:format:error:",  v66,  0LL,  0LL,  0LL));
  }
  else {
    uint64_t v67 = 0LL;
  }
  if ([v6 count])
  {
    unsigned int v68 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager intersectedValuesSettingForFeature:withUserSettingDectionary:]( &OBJC_CLASS___MCRestrictionManager,  "intersectedValuesSettingForFeature:withUserSettingDectionary:",  MCFeatureAppLockBundleIDs,  v89));
    if ([v68 count])
    {
      id v101 = v67;
      v105 = v66;
      v109 = v55;
      uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v68));
      uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v68 count]));
      __int128 v112 = 0u;
      __int128 v113 = 0u;
      __int128 v114 = 0u;
      __int128 v115 = 0u;
      id v71 = v6;
      id v72 = [v71 countByEnumeratingWithState:&v112 objects:v145 count:16];
      if (v72)
      {
        id v73 = v72;
        uint64_t v74 = *(void *)v113;
        do
        {
          for (ii = 0LL; ii != v73; ii = (char *)ii + 1)
          {
            if (*(void *)v113 != v74) {
              objc_enumerationMutation(v71);
            }
            uint64_t v76 = *(void *)(*((void *)&v112 + 1) + 8LL * (void)ii);
            id v77 = (void *)objc_claimAutoreleasedReturnValue([v71 objectForKey:v76]);
          }

          id v73 = [v71 countByEnumeratingWithState:&v112 objects:v145 count:16];
        }

        while (v73);
      }

      if ([v70 count])
      {
        uint64_t v78 = MCSystemEffectiveAppWhitelistFilePath();
        id v79 = (void *)objc_claimAutoreleasedReturnValue(v78);
        char v80 = 1;
        [v70 writeToFile:v79 atomically:1];

        CFRunLoopRef v59 = v90;
        uint64_t v66 = v105;
        uint64_t v55 = v109;
        uint64_t v67 = v101;
        goto LABEL_97;
      }

      CFRunLoopRef v59 = v90;
      uint64_t v66 = v105;
      uint64_t v55 = v109;
      uint64_t v67 = v101;
    }

    else
    {
      uint64_t v70 = 0LL;
    }
  }

  else
  {
    uint64_t v70 = 0LL;
  }

  uint64_t v81 = MCSystemEffectiveAppWhitelistFilePath();
  unsigned int v68 = (void *)objc_claimAutoreleasedReturnValue(v81);
  [v55 removeItemAtPath:v68 error:0];
  char v80 = 0;
LABEL_97:

  if (v88)
  {
    char v82 = v80 ^ 1;
    if (!v67) {
      char v82 = 0;
    }
    if ((v82 & 1) != 0
      || (v83 = v67,
          uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v67)),
          id v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v70)),
          unsigned __int8 v86 = [v84 isEqualToSet:v85],
          v85,
          uint64_t v67 = v83,
          v84,
          (v86 & 1) == 0))
    {
      *uint64_t v88 = 1;
    }
  }
}

- (void)recomputeAppRulesForNetworkExtension
{
  id v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "Recomputing app rules for NetworkExtension.",  buf,  2u);
  }

  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[MDMManagedMediaReader attributesByAppID](&OBJC_CLASS___MDMManagedMediaReader, "attributesByAppID"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
  uint64_t v5 = MCNEProfileIngestionHandlerClassForPayload(@"PayloadTypeNone");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if ([v6 lockConfigurations])
  {
    [v6 loadConfigurationsForceReloadFromDisk];
    [v6 updatePerAppMappingRules:v3];
    [v6 updateManagedAppRules:v4];
    [v6 unlockConfigurations];
  }

  else
  {
    id v7 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "recomputeAppRulesForNetworkExtension could not get NetworkExtension store lock.",  v8,  2u);
    }
  }
}

- (id)recomputeAccountVPNAssociations
{
  return 0LL;
}

+ (id)mergeArray:(id)a3 withArray:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5)
  {
    id v11 = v6;
LABEL_6:
    uint64_t v10 = v11;
    goto LABEL_7;
  }

  if (!v6)
  {
    id v11 = v5;
    goto LABEL_6;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 setByAddingObjectsFromArray:v7]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allObjects]);

LABEL_7:
  return v10;
}

- (void)recomputeWebContentFilterEffectiveUserSettings:(id)a3 outEffectiveChangeDetected:(BOOL *)a4 outMechanismChangedDetected:(BOOL *)a5
{
  id v5 = a3;
  id v6 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Recomputing web content filter.", buf, 2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v8 = ((uint64_t (*)(void))MCWebContentFilterOutputPath)();
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  __int128 v122 = v7;
  LODWORD(v7) = [v7 fileExistsAtPath:v9];

  if ((_DWORD)v7)
  {
    uint64_t v10 = ((uint64_t (*)(void))MCWebContentFilterOutputPath)();
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    __int128 v123 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v11));
  }

  else
  {
    __int128 v123 = 0LL;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCBookmarkManager sharedManager](&OBJC_CLASS___MCBookmarkManager, "sharedManager"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 userBookmarks]);

  __int128 v159 = 0u;
  __int128 v160 = 0u;
  __int128 v157 = 0u;
  __int128 v158 = 0u;
  id obj = v14;
  id v15 = [obj countByEnumeratingWithState:&v157 objects:v168 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v158;
    uint64_t v18 = kMCWCFAddressKey;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v158 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v157 + 1) + 8 * (void)i) serializableDictionary]);
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:v18]);
        if (v21) {
          [v12 setObject:v20 forKeyedSubscript:v21];
        }
      }

      id v16 = [obj countByEnumeratingWithState:&v157 objects:v168 count:16];
    }

    while (v16);
  }

  id v124 = v5;

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](&OBJC_CLASS___MCDependencyManager, "sharedManager"));
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 parentsInDomain:kMCDMProfileWithWebContentFilterToPayloadUUIDDependencyKey]);

  __int128 v155 = 0u;
  __int128 v156 = 0u;
  __int128 v153 = 0u;
  __int128 v154 = 0u;
  id v125 = v23;
  id v129 = [v125 countByEnumeratingWithState:&v153 objects:v167 count:16];
  int v24 = 0;
  if (v129)
  {
    uint64_t v127 = *(void *)v154;
    uint64_t v25 = kMCWCFAddressKey;
    id v26 = &MailAccountHostname_ptr;
    do
    {
      uint64_t v27 = 0LL;
      do
      {
        if (*(void *)v154 != v127) {
          objc_enumerationMutation(v125);
        }
        uint64_t v132 = v27;
        uint64_t v28 = *(void *)(*((void *)&v153 + 1) + 8 * v27);
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
        v30 = (void *)objc_claimAutoreleasedReturnValue([v29 installedProfileWithIdentifier:v28]);

        __int128 v151 = 0u;
        __int128 v152 = 0u;
        __int128 v149 = 0u;
        __int128 v150 = 0u;
        __int128 v130 = v30;
        id v139 = (id)objc_claimAutoreleasedReturnValue([v30 payloads]);
        id v31 = [v139 countByEnumeratingWithState:&v149 objects:v166 count:16];
        if (v31)
        {
          id v32 = v31;
          uint64_t v33 = *(void *)v150;
          uint64_t v134 = *(void *)v150;
          do
          {
            v34 = 0LL;
            id v137 = v32;
            do
            {
              if (*(void *)v150 != v33) {
                objc_enumerationMutation(v139);
              }
              char v35 = *(void **)(*((void *)&v149 + 1) + 8LL * (void)v34);
              id v36 = objc_autoreleasePoolPush();
              uint64_t v37 = objc_opt_class(v26[116]);
              if ((objc_opt_isKindOfClass(v35, v37) & 1) != 0)
              {
                id v38 = (void *)objc_claimAutoreleasedReturnValue([v35 allowListBookmarks]);
                __int128 v145 = 0u;
                __int128 v146 = 0u;
                __int128 v147 = 0u;
                __int128 v148 = 0u;
                id v39 = [v38 countByEnumeratingWithState:&v145 objects:v165 count:16];
                if (v39)
                {
                  id v40 = v39;
                  uint64_t v41 = *(void *)v146;
                  do
                  {
                    for (j = 0LL; j != v40; j = (char *)j + 1)
                    {
                      if (*(void *)v146 != v41) {
                        objc_enumerationMutation(v38);
                      }
                      uint64_t v43 = *(void **)(*((void *)&v145 + 1) + 8LL * (void)j);
                      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:v25]);
                      [v12 setObject:v43 forKeyedSubscript:v44];
                    }

                    id v40 = [v38 countByEnumeratingWithState:&v145 objects:v165 count:16];
                  }

                  while (v40);
                }

                int v24 = 1;
                id v26 = &MailAccountHostname_ptr;
                uint64_t v33 = v134;
                id v32 = v137;
              }

              objc_autoreleasePoolPop(v36);
              v34 = (char *)v34 + 1;
            }

            while (v34 != v32);
            id v32 = [v139 countByEnumeratingWithState:&v149 objects:v166 count:16];
          }

          while (v32);
        }

        uint64_t v27 = v132 + 1;
      }

      while ((id)(v132 + 1) != v129);
      id v129 = [v125 countByEnumeratingWithState:&v153 objects:v167 count:16];
    }

    while (v129);
  }

  unsigned int v45 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager intersectedValuesSettingForFeature:withUserSettingDectionary:]( &OBJC_CLASS___MCRestrictionManager,  "intersectedValuesSettingForFeature:withUserSettingDectionary:",  MCFeatureWebContentFilterWhitelistedBookmarks,  v124));
  uint64_t v135 = MCFeatureWebContentFilterWhitelistedURLs;
  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager intersectedValuesSettingForFeature:withUserSettingDectionary:]( &OBJC_CLASS___MCRestrictionManager,  "intersectedValuesSettingForFeature:withUserSettingDectionary:"));
  id v47 = [v46 count];
  id v140 = v46;
  if (v47 == [v45 count] && objc_msgSend(v46, "count"))
  {
    unint64_t v48 = 0LL;
    uint64_t v49 = kMCWCFAddressKey;
    uint64_t v50 = kMCWCFPageTitleKey;
    do
    {
      id v51 = (void *)objc_claimAutoreleasedReturnValue([v46 objectAtIndexedSubscript:v48]);
      v164[0] = v51;
      v163[0] = v49;
      v163[1] = v50;
      id v52 = (void *)objc_claimAutoreleasedReturnValue([v45 objectAtIndexedSubscript:v48]);
      v164[1] = v52;
      uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v164,  v163,  2LL));
      [v12 setObject:v53 forKeyedSubscript:v51];

      uint64_t v46 = v140;
      ++v48;
    }

    while (v48 < (unint64_t)[v140 count]);
  }

  __int128 v133 = v45;
  uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v54 setObject:&__kCFBooleanTrue forKeyedSubscript:@"restrictWeb"];
  id v55 = v124;
  unsigned int v56 = +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSettingForFeature:withUserSettingDictionary:",  MCFeatureWebContentFilterAutoForced,  v124);
  uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v56 == 1));
  [v54 setObject:v57 forKeyedSubscript:@"useContentFilter"];

  uint64_t v58 = objc_claimAutoreleasedReturnValue( +[MCRestrictionManager intersectedValuesSettingForFeature:withUserSettingDectionary:]( &OBJC_CLASS___MCRestrictionManager,  "intersectedValuesSettingForFeature:withUserSettingDectionary:",  MCFeatureWebContentFilterAutoPermittedURLs,  v124));
  __int128 v138 = (void *)v58;
  if (v58) {
    CFRunLoopRef v59 = (void *)v58;
  }
  else {
    CFRunLoopRef v59 = &__NSArray0__struct;
  }
  [v54 setObject:v59 forKeyedSubscript:@"filterWhitelist"];
  if (v46)
  {
    id v60 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager intersectedValuesSettingForFeature:withUserSettingDectionary:]( &OBJC_CLASS___MCRestrictionManager,  "intersectedValuesSettingForFeature:withUserSettingDectionary:",  v135,  v124));
    uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v60));

    v62 = (void *)objc_claimAutoreleasedReturnValue([v12 allKeys]);
    uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v62));

    [v63 intersectSet:v61];
    uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v63 count]));
    __int128 v141 = 0u;
    __int128 v142 = 0u;
    __int128 v143 = 0u;
    __int128 v144 = 0u;
    id v65 = v63;
    id v66 = [v65 countByEnumeratingWithState:&v141 objects:v162 count:16];
    if (v66)
    {
      id v67 = v66;
      uint64_t v68 = *(void *)v142;
      do
      {
        for (k = 0LL; k != v67; k = (char *)k + 1)
        {
          if (*(void *)v142 != v68) {
            objc_enumerationMutation(v65);
          }
          uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue( [v12 objectForKeyedSubscript:*(void *)(*((void *)&v141 + 1) + 8 * (void)k)]);
          [v64 addObject:v70];
        }

        id v67 = [v65 countByEnumeratingWithState:&v141 objects:v162 count:16];
      }

      while (v67);
    }

    [v54 setObject:v64 forKeyedSubscript:@"siteWhitelist"];
    id v55 = v124;
    uint64_t v46 = v140;
  }

  id v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v46 != 0LL));
  [v54 setObject:v71 forKeyedSubscript:@"whitelistEnabled"];

  uint64_t v72 = objc_claimAutoreleasedReturnValue( +[MCRestrictionManager unionValuesSettingForFeature:withUserSettingDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "unionValuesSettingForFeature:withUserSettingDictionary:",  MCFeatureWebContentFilterBlacklistedURLs,  v55));
  id v73 = (void *)v72;
  if (v72) {
    uint64_t v74 = (void *)v72;
  }
  else {
    uint64_t v74 = &__NSArray0__struct;
  }
  id v75 = v74;

  [v54 setObject:v75 forKeyedSubscript:@"filterBlacklist"];
  __int128 v131 = v75;
  if (v138) {
    BOOL v76 = 1LL;
  }
  else {
    BOOL v76 = [v75 count] != 0;
  }
  id v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v76));
  [v54 setObject:v77 forKeyedSubscript:@"useContentFilterOverrides"];

  uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue([v123 objectForKeyedSubscript:@"whitelistEnabled"]);
  unsigned int v79 = (v46 != 0) ^ [v78 BOOLValue];

  char v80 = (void *)objc_claimAutoreleasedReturnValue([v123 objectForKeyedSubscript:@"useContentFilter"]);
  unsigned int v81 = (v56 == 1) ^ [v80 BOOLValue];

  char v118 = v79 | v81;
  if ((v79 | v81) == 1) {
    sub_10007B964(v81, v56 == 1, v79, v140 != 0LL);
  }
  uint64_t v82 = objc_claimAutoreleasedReturnValue([v54 objectForKeyedSubscript:@"filterWhitelist"]);
  v83 = (void *)v82;
  if (v82) {
    uint64_t v84 = (void *)v82;
  }
  else {
    uint64_t v84 = &__NSArray0__struct;
  }
  id v85 = v54;
  id v86 = v84;

  uint64_t v87 = objc_claimAutoreleasedReturnValue([v123 objectForKeyedSubscript:@"filterWhitelist"]);
  uint64_t v88 = (void *)v87;
  if (v87) {
    id v89 = (void *)v87;
  }
  else {
    id v89 = &__NSArray0__struct;
  }
  id v90 = v89;

  uint64_t v91 = objc_claimAutoreleasedReturnValue([v54 objectForKeyedSubscript:@"filterBlacklist"]);
  id v92 = (void *)v91;
  if (v91) {
    v93 = (void *)v91;
  }
  else {
    v93 = &__NSArray0__struct;
  }
  id v94 = v93;

  uint64_t v95 = objc_claimAutoreleasedReturnValue([v123 objectForKeyedSubscript:@"filterBlacklist"]);
  uint64_t v96 = (void *)v95;
  if (v95) {
    uint64_t v97 = (void *)v95;
  }
  else {
    uint64_t v97 = &__NSArray0__struct;
  }
  id v98 = v97;

  __int128 v128 = v85;
  uint64_t v99 = objc_claimAutoreleasedReturnValue([v85 objectForKeyedSubscript:@"siteWhitelist"]);
  id v100 = (void *)v99;
  if (v99) {
    id v101 = (void *)v99;
  }
  else {
    id v101 = &__NSArray0__struct;
  }
  id v102 = v101;

  uint64_t v103 = objc_claimAutoreleasedReturnValue([v123 objectForKeyedSubscript:@"siteWhitelist"]);
  uint64_t v104 = (void *)v103;
  if (v103) {
    v105 = (void *)v103;
  }
  else {
    v105 = &__NSArray0__struct;
  }
  id v106 = v105;

  char v107 = [v86 isEqualToArray:v90] ^ 1;
  __int128 v136 = v94;
  __int128 v119 = v98;
  char v108 = [v94 isEqualToArray:v98] ^ 1;
  uint64_t v109 = (uint64_t)[v102 isEqualToArray:v106];
  int v110 = v109 ^ 1;
  id v111 = v124;
  if ((v107 & 1) != 0 || (v108 & 1) != 0 || v110)
  {
    id v112 = [v86 count];
    id v113 = [v136 count];
    id v114 = [v102 count];
    uint64_t v115 = (uint64_t)v112;
    id v111 = v124;
    uint64_t v109 = sub_10007B77C(v107, v115, v108, (uint64_t)v113, v110, (uint64_t)v114);
  }

  if (a5) {
    *a5 = v118;
  }
  if (a4)
  {
    uint64_t v109 = (uint64_t)[v123 isEqualToDictionary:v128];
    *a4 = v109 ^ 1;
  }

  uint64_t v116 = MCWebContentFilterOutputPath(v109);
  __int128 v117 = (void *)objc_claimAutoreleasedReturnValue(v116);
  [v128 MCWriteToBinaryFile:v117];
}

- (void)recomputeHacksAfterProfileChangesEffectiveUserSettings:(id)a3 sendNotifications:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  -[MCServerSideHacks recomputeAppRulesForNetworkExtension](self, "recomputeAppRulesForNetworkExtension");
  char v11 = 0;
  -[MCServerSideHacks recomputeAppOptionsEffectiveUserSettings:outEffectiveChangeDetected:]( self,  "recomputeAppOptionsEffectiveUserSettings:outEffectiveChangeDetected:",  v6,  &v11);
  char v10 = 0;
  char v9 = 0;
  -[MCServerSideHacks recomputeWebContentFilterEffectiveUserSettings:outEffectiveChangeDetected:outMechanismChangedDetected:]( self,  "recomputeWebContentFilterEffectiveUserSettings:outEffectiveChangeDetected:outMechanismChangedDetected:",  v6,  &v10,  &v9);

  if (v4)
  {
    if (v11) {
      uint64_t v7 = MCSendAppWhitelistChangedNotification();
    }
    if (v9) {
      uint64_t v7 = MCSendWebContentFilterTypeChangedNotification(v7);
    }
    if (v10) {
      MCSendWebContentFilterChangedNotification(v7);
    }
  }

  if (v11)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MDMClient sharedClient](&OBJC_CLASS___MDMClient, "sharedClient"));
    [v8 retryNotNowResponse];
  }

- (void)applyGracePeriodSettingFromKeybagToUserSettings
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  uint64_t v3 = MCFeaturePasscodeLockGraceTime;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v2 valueSettingForFeature:MCFeaturePasscodeLockGraceTime]);
  id v5 = [v4 unsignedIntegerValue];

  uint64_t v6 = MCKeybagCurrentPasscodeGracePeriod();
  if (v5 != (id)v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109120;
      v10[1] = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Setting grace period to %u to match keybag value.",  (uint8_t *)v10,  8u);
    }

    char v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v7));
    [v2 setValue:v9 forSetting:v3 sender:@"MCServerSideHacks.ApplyGracePeriodSettingFromKeybag"];
  }
}

- (void)resetSettingsSender:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v4 setBoolValue:0 forSetting:MCFeatureDiagnosticsSubmissionAllowed sender:v3];
  [v4 setBoolValue:0 forSetting:MCFeatureAppAnalyticsAllowed sender:v3];
}

- (void)setUserTrackingTCCAccessOverrideForRestrictions:(id)a3
{
  BOOL v3 = +[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "restrictedBoolForFeature:withRestrictionsDictionary:",  MCFeatureLimitAdTrackingForced,  a3) == 1;
  TCCAccessSetOverride(kTCCServiceUserTracking, v3);
}

@end