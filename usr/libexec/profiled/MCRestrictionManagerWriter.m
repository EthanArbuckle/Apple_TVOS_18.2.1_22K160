@interface MCRestrictionManagerWriter
+ (BOOL)restrictionsAlreadyInstalledFromPayload:(id)a3;
+ (id)enforcedAppWhitelistRestrictions;
+ (id)sharedManager;
- (BOOL)memberQueueCheckPasscodeCompliesWithCurrentRestrictions;
- (BOOL)memberQueueCheckPasscodeCompliesWithProfileRestrictions;
- (BOOL)memberQueueIsPasscodeComplianceMandatoryWithOutLocalizedWarning:(id *)a3;
- (BOOL)memberQueueRecomputeEffectiveUserSettingsPasscode:(id)a3 credentialSet:(id)a4;
- (BOOL)memberQueueSetAllClientRestrictions:(id)a3 sender:(id)a4 outRestrictionsChanged:(BOOL *)a5 outEffectiveSettingsChanged:(BOOL *)a6 outError:(id *)a7;
- (BOOL)memberQueueSetParametersForSettingsByType:(id)a3 configurationUUID:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 credentialSet:(id)a8 sender:(id)a9;
- (BOOL)memberQueueSetSystemClientRestrictions:(id)a3 userClientRestrictions:(id)a4 sender:(id)a5 outRestrictionsChanged:(BOOL *)a6 outEffectiveSettingsChanged:(BOOL *)a7 outError:(id *)a8;
- (BOOL)recomputeNagMetadata;
- (BOOL)recomputeNagMetadata:(BOOL *)a3;
- (BOOL)removeOrphanedClientRestrictions;
- (BOOL)setAllClientRestrictions:(id)a3 sender:(id)a4 outRestrictionsChanged:(BOOL *)a5 outEffectiveSettingsChanged:(BOOL *)a6 outRecomputedNag:(BOOL *)a7 outError:(id *)a8;
- (BOOL)setClientRestrictions:(id)a3 clientType:(id)a4 clientUUID:(id)a5 sender:(id)a6 localizedClientDescription:(id)a7 localizedWarning:(id)a8 outRestrictionsChanged:(BOOL *)a9 outEffectiveSettingsChanged:(BOOL *)a10 outRecomputedNag:(BOOL *)a11 outError:(id *)a12;
- (BOOL)setClientRestrictions:(id)a3 overrideRestrictions:(BOOL)a4 appsAndOptions:(id)a5 system:(BOOL)a6 clientType:(id)a7 clientUUID:(id)a8 sender:(id)a9 localizedClientDescription:(id)a10 localizedWarning:(id)a11 shouldRecomputeNag:(BOOL)a12 outRestrictionsChanged:(BOOL *)a13 outEffectiveSettingsChanged:(BOOL *)a14 outRecomputedNag:(BOOL *)a15 outError:(id *)a16;
- (BOOL)setParametersForSettingsByType:(id)a3 configurationUUID:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 credentialSet:(id)a8 sender:(id)a9;
- (BOOL)setParametersForSettingsByType:(id)a3 sender:(id)a4;
- (BOOL)setSystemProfileRestrictions:(id)a3 userProfileRestrictions:(id)a4 sender:(id)a5 outRestrictionsChanged:(BOOL *)a6 outEffectiveSettingsChanged:(BOOL *)a7 outAppWhitelistSettingsChanged:(BOOL *)a8 outRecomputedNag:(BOOL *)a9 outError:(id *)a10;
- (NSDictionary)clientTypeLoaders;
- (NSMutableSet)memberQueueRecomputePasscodeComplianceForClientUUID;
- (NSNumber)memberQueuePasscodeCompliesWithProfileRestrictions;
- (NSNumber)memberQueuePasscodeCompliesWithRestrictions;
- (id)_init;
- (id)_liveClientUUIDsForClientType:(id)a3 outLoaderMissing:(BOOL *)a4;
- (id)_memberQueueNewUserSettingsWithParametersForSettingsByType:(id)a3 currentUserSettings:(id)a4;
- (id)orphanCheckExemptClientTypes;
- (id)orphanCheckUnexemptClientTypes;
- (id)orphanedClientUUIDsForClientRestrictionDictionary:(id)a3;
- (int)senderPID;
- (void)clearAllPasscodeComplianceCaches;
- (void)memberQueueCacheClientRestrictionPasscodeCompliance;
- (void)memberQueueClearAllPasscodeComplianceCaches;
- (void)memberQueueClearPasscodeHistoryIfNecessary;
- (void)memberQueueClearProfileRestrictionPasscodeComplianceCache;
- (void)memberQueueClearRestrictionPasscodeComplianceCache;
- (void)memberQueueCommitClientRestrictionsToDisk;
- (void)memberQueueCommitEffectiveUserSettingsToDiskOldEffectiveUserSettings:(id)a3;
- (void)memberQueueCommitRestrictionsToDisk;
- (void)memberQueueCommitUserSettingsToDisk;
- (void)memberQueueMarkToClearPasscodeComplianceCacheWithOldSystemClientRestrictions:(id)a3 newSystemClientRestrictions:(id)a4;
- (void)notifyClientsToRecomputeCompliance;
- (void)notifyHaveSeenComplianceMessageWithLastLockDate:(id)a3;
- (void)recomputeEffectiveUserSettingsPasscode:(id)a3;
- (void)recomputeUserRestrictionsAndEffectiveUserSettings;
- (void)removeBoolSetting:(id)a3 sender:(id)a4;
- (void)removeValueSetting:(id)a3 sender:(id)a4;
- (void)resetAllSettingsToDefaultsSender:(id)a3;
- (void)setBoolValue:(BOOL)a3 ask:(BOOL)a4 forSetting:(id)a5 sender:(id)a6;
- (void)setBoolValue:(BOOL)a3 forSetting:(id)a4 sender:(id)a5;
- (void)setIntersectionValues:(id)a3 forSetting:(id)a4 sender:(id)a5;
- (void)setMemberQueuePasscodeCompliesWithProfileRestrictions:(id)a3;
- (void)setMemberQueuePasscodeCompliesWithRestrictions:(id)a3;
- (void)setMemberQueueRecomputePasscodeComplianceForClientUUID:(id)a3;
- (void)setSenderPID:(int)a3;
- (void)setShowNagMessage;
- (void)setUnionValues:(id)a3 forSetting:(id)a4 sender:(id)a5;
- (void)setUserInfo:(id)a3 forClientUUID:(id)a4;
- (void)setUserInfo:(id)a3 forClientUUID:(id)a4 sender:(id)a5;
- (void)setValue:(id)a3 forSetting:(id)a4 sender:(id)a5;
@end

@implementation MCRestrictionManagerWriter

+ (id)sharedManager
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MCRestrictionManagerWriter;
  id v2 = objc_msgSendSuper2(&v4, "sharedManager");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

+ (id)enforcedAppWhitelistRestrictions
{
  if (qword_1000DC190 != -1) {
    dispatch_once(&qword_1000DC190, &stru_1000C3C00);
  }
  return (id)qword_1000DC188;
}

- (id)_init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MCRestrictionManagerWriter;
  id v2 = -[MCRestrictionManagerWriter init](&v4, "init");
  if (v2) {
    v2->_senderPID = getpid();
  }
  return v2;
}

- (void)memberQueueCommitRestrictionsToDisk
{
  v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Committing restrictions.", v10, 2u);
  }

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueRestrictions](self, "memberQueueRestrictions"));
  uint64_t v5 = MCRestrictionsFilePath();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v4 MCWriteToBinaryFile:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueSettingsEvents](self, "memberQueueSettingsEvents"));
  uint64_t v8 = MCSettingsEventsFilePath();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v7 MCWriteToBinaryFile:v9];
}

- (BOOL)setSystemProfileRestrictions:(id)a3 userProfileRestrictions:(id)a4 sender:(id)a5 outRestrictionsChanged:(BOOL *)a6 outEffectiveSettingsChanged:(BOOL *)a7 outAppWhitelistSettingsChanged:(BOOL *)a8 outRecomputedNag:(BOOL *)a9 outError:(id *)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  uint64_t v46 = 0LL;
  v47 = &v46;
  uint64_t v48 = 0x2020000000LL;
  char v49 = 0;
  uint64_t v40 = 0LL;
  v41 = &v40;
  uint64_t v42 = 0x3032000000LL;
  v43 = sub_10005CBB4;
  v44 = sub_10005CBC4;
  id v45 = 0LL;
  v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueue](self, "memberQueue"));
  v27 = _NSConcreteStackBlock;
  uint64_t v28 = 3221225472LL;
  v29 = sub_10005CBCC;
  v30 = &unk_1000C3C28;
  v31 = self;
  id v20 = v16;
  id v32 = v20;
  id v21 = v17;
  id v33 = v21;
  id v22 = v18;
  v38 = a6;
  v39 = a7;
  id v34 = v22;
  v35 = &v46;
  v36 = &v40;
  v37 = a8;
  dispatch_sync(v19, &v27);

  BOOL v23 = -[MCRestrictionManagerWriter recomputeNagMetadata](self, "recomputeNagMetadata", v27, v28, v29, v30, v31);
  if (a9) {
    *a9 = v23;
  }
  int v24 = *((unsigned __int8 *)v47 + 24);
  if (a10 && !*((_BYTE *)v47 + 24))
  {
    *a10 = (id) v41[5];
    int v24 = *((unsigned __int8 *)v47 + 24);
  }

  BOOL v25 = v24 != 0;

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

  return v25;
}

- (void)memberQueueCommitClientRestrictionsToDisk
{
  v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Committing client restrictions.", v13, 2u);
  }

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueSystemClientRestrictions]( self,  "memberQueueSystemClientRestrictions"));
  uint64_t v5 = MCSystemClientRestrictionsFilePath();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v4 MCWriteToBinaryFile:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueUserClientRestrictions]( self,  "memberQueueUserClientRestrictions"));
  uint64_t v8 = MCUserClientRestrictionsFilePath();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v7 MCWriteToBinaryFile:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueSettingsEvents](self, "memberQueueSettingsEvents"));
  uint64_t v11 = MCSettingsEventsFilePath();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v10 MCWriteToBinaryFile:v12];
}

- (void)setUserInfo:(id)a3 forClientUUID:(id)a4
{
}

- (void)setUserInfo:(id)a3 forClientUUID:(id)a4 sender:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = v8;
    __int16 v19 = 2114;
    id v20 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "Setting user info %{public}@ for client uuid %{public}@",  buf,  0x16u);
  }

  if (v9)
  {
    v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueue](self, "memberQueue"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10005D37C;
    v13[3] = &unk_1000C3C50;
    v13[4] = self;
    id v14 = v9;
    id v15 = v8;
    id v16 = v10;
    dispatch_sync(v12, v13);
  }
}

- (BOOL)memberQueueSetAllClientRestrictions:(id)a3 sender:(id)a4 outRestrictionsChanged:(BOOL *)a5 outEffectiveSettingsChanged:(BOOL *)a6 outError:(id *)a7
{
  id v12 = a4;
  id v13 = a3;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueUserClientRestrictions]( self,  "memberQueueUserClientRestrictions"));
  LOBYTE(a7) = -[MCRestrictionManagerWriter memberQueueSetSystemClientRestrictions:userClientRestrictions:sender:outRestrictionsChanged:outEffectiveSettingsChanged:outError:]( self,  "memberQueueSetSystemClientRestrictions:userClientRestrictions:sender:outRestrictionsChanged:outEffectiv eSettingsChanged:outError:",  v13,  v14,  v12,  a5,  a6,  a7);

  return (char)a7;
}

- (BOOL)memberQueueSetSystemClientRestrictions:(id)a3 userClientRestrictions:(id)a4 sender:(id)a5 outRestrictionsChanged:(BOOL *)a6 outEffectiveSettingsChanged:(BOOL *)a7 outError:(id *)a8
{
  id v42 = a3;
  id v12 = a4;
  id v13 = a5;
  BOOL v43 = 0;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueRestrictions](self, "memberQueueRestrictions"));
  id v15 = [v14 copy];

  id v16 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueSystemClientRestrictions]( self,  "memberQueueSystemClientRestrictions"));
  id v41 = [v16 copy];

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueRestrictions](self, "memberQueueRestrictions"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter defaultRestrictions](self, "defaultRestrictions"));
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueSystemProfileRestrictions]( self,  "memberQueueSystemProfileRestrictions"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueUserProfileRestrictions]( self,  "memberQueueUserProfileRestrictions"));
  v36 = a8;
  id v21 = v12;
  id v22 = v42;
  BOOL v23 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter restrictionsWithCurrentRestrictions:defaultRestrictions:systemProfileRestrictions:userProfileRestrictions:systemClientRestrictions:userClientRestrictions:outRestrictionsChanged:outError:]( &OBJC_CLASS___MCRestrictionManagerWriter,  "restrictionsWithCurrentRestrictions:defaultRestrictions:systemProfileRestrictions:userProfileRestric tions:systemClientRestrictions:userClientRestrictions:outRestrictionsChanged:outError:",  v17,  v18,  v19,  v20,  v42,  v12,  &v43,  v36));

  if (v23)
  {
    unsigned __int8 v24 = -[MCRestrictionManagerWriter applyConfiguration:toDomain:inNamespace:fromSender:]( self,  "applyConfiguration:toDomain:inNamespace:fromSender:",  v42,  8LL,  0LL,  v13);
    v38 = v21;
    unsigned int v25 = -[MCRestrictionManagerWriter applyConfiguration:toDomain:inNamespace:fromSender:]( self,  "applyConfiguration:toDomain:inNamespace:fromSender:",  v21,  9LL,  0LL,  v13);
    -[MCRestrictionManagerWriter applyConfiguration:toDomain:inNamespace:fromSender:]( self,  "applyConfiguration:toDomain:inNamespace:fromSender:",  v23,  5LL,  0LL,  v13);
    -[MCRestrictionManagerWriter memberQueueCommitClientRestrictionsToDisk]( self,  "memberQueueCommitClientRestrictionsToDisk");
    -[MCRestrictionManagerWriter memberQueueCommitRestrictionsToDisk](self, "memberQueueCommitRestrictionsToDisk");
    v26 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueEffectiveUserSettings]( self,  "memberQueueEffectiveUserSettings"));
    id v27 = [v26 MCDeepCopy];

    BOOL v37 = -[MCRestrictionManagerWriter memberQueueRecomputeEffectiveUserSettingsPasscode:credentialSet:]( self,  "memberQueueRecomputeEffectiveUserSettingsPasscode:credentialSet:",  0LL,  0LL);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](&OBJC_CLASS___MCHacks, "sharedHacks"));
    v29 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueEffectiveUserSettings]( self,  "memberQueueEffectiveUserSettings"));
    [v28 _applyServerSideChangesWithOldRestrictions:v15 newRestrictions:v23 oldEffectiveUserSettings:v27 newEffectiveUserSettings:v29];

    if ((v24 & 1) != 0 || v25) {
      uint64_t v30 = MCSendClientTruthChangedNotification( -[MCRestrictionManagerWriter memberQueueMarkToClearPasscodeComplianceCacheWithOldSystemClientRestrictions:newSystemClientRestrictions:]( self,  "memberQueueMarkToClearPasscodeComplianceCacheWithOldSystemClientRestrictions:newSystemClientRestrictions:",  v41,  v42));
    }
    if (v43)
    {
      MCSendRestrictionChangedNotification(v30);
      if (+[MCPasscodeManagerWriter didPasscodePolicyChangeWithOldRestrictions:newRestrictions:]( &OBJC_CLASS___MCPasscodeManagerWriter,  "didPasscodePolicyChangeWithOldRestrictions:newRestrictions:",  v15,  v23))
      {
        -[MCRestrictionManagerWriter memberQueueClearPasscodeHistoryIfNecessary]( self,  "memberQueueClearPasscodeHistoryIfNecessary");
        MCSendPasscodePolicyChangedNotification( -[MCRestrictionManagerWriter memberQueueClearRestrictionPasscodeComplianceCache]( self,  "memberQueueClearRestrictionPasscodeComplianceCache"));
      }

      uint64_t v31 = MCFeatureNotificationRestrictedApps;
      id v32 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager unionValuesForFeature:withRestrictionsDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "unionValuesForFeature:withRestrictionsDictionary:",  MCFeatureNotificationRestrictedApps,  v15));
      id v33 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager unionValuesForFeature:withRestrictionsDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "unionValuesForFeature:withRestrictionsDictionary:",  v31,  v23));
      unsigned __int8 v34 = [v32 isEqualToArray:v33];

      if ((v34 & 1) == 0) {
        MCSendUserNotificationsSettingsChangedNotification();
      }
    }

    if (a6) {
      *a6 = v43;
    }
    id v22 = v42;
    if (v37) {
      MCSendEffectiveSettingsChangedNotification(self->_senderPID);
    }
    if (a7) {
      *a7 = v37;
    }

    id v21 = v38;
  }

  return v23 != 0LL;
}

- (BOOL)setAllClientRestrictions:(id)a3 sender:(id)a4 outRestrictionsChanged:(BOOL *)a5 outEffectiveSettingsChanged:(BOOL *)a6 outRecomputedNag:(BOOL *)a7 outError:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  uint64_t v40 = 0LL;
  id v41 = &v40;
  uint64_t v42 = 0x2020000000LL;
  char v43 = 0;
  uint64_t v34 = 0LL;
  v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  BOOL v37 = sub_10005CBB4;
  v38 = sub_10005CBC4;
  id v39 = 0LL;
  id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueue](self, "memberQueue"));
  BOOL v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472LL;
  unsigned int v25 = sub_10005DA58;
  v26 = &unk_1000C3C78;
  uint64_t v30 = &v40;
  id v27 = self;
  id v17 = v14;
  id v28 = v17;
  id v18 = v15;
  id v32 = a5;
  id v33 = a6;
  id v29 = v18;
  uint64_t v31 = &v34;
  dispatch_sync(v16, &v23);

  BOOL v19 = -[MCRestrictionManagerWriter recomputeNagMetadata](self, "recomputeNagMetadata", v23, v24, v25, v26, v27);
  if (a7) {
    *a7 = v19;
  }
  int v20 = *((unsigned __int8 *)v41 + 24);
  if (a8 && !*((_BYTE *)v41 + 24))
  {
    *a8 = (id) v35[5];
    int v20 = *((unsigned __int8 *)v41 + 24);
  }

  BOOL v21 = v20 != 0;

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  return v21;
}

- (BOOL)setClientRestrictions:(id)a3 clientType:(id)a4 clientUUID:(id)a5 sender:(id)a6 localizedClientDescription:(id)a7 localizedWarning:(id)a8 outRestrictionsChanged:(BOOL *)a9 outEffectiveSettingsChanged:(BOOL *)a10 outRecomputedNag:(BOOL *)a11 outError:(id *)a12
{
  LOBYTE(v13) = 1;
  return -[MCRestrictionManagerWriter setClientRestrictions:overrideRestrictions:appsAndOptions:system:clientType:clientUUID:sender:localizedClientDescription:localizedWarning:shouldRecomputeNag:outRestrictionsChanged:outEffectiveSettingsChanged:outRecomputedNag:outError:]( self,  "setClientRestrictions:overrideRestrictions:appsAndOptions:system:clientType:clientUUID:sender:localizedClient Description:localizedWarning:shouldRecomputeNag:outRestrictionsChanged:outEffectiveSettingsChanged:outRecompu tedNag:outError:",  a3,  0LL,  0LL,  1LL,  a4,  a5,  a6,  a7,  a8,  v13,  a9,  a10,  a11,  a12);
}

- (BOOL)setClientRestrictions:(id)a3 overrideRestrictions:(BOOL)a4 appsAndOptions:(id)a5 system:(BOOL)a6 clientType:(id)a7 clientUUID:(id)a8 sender:(id)a9 localizedClientDescription:(id)a10 localizedWarning:(id)a11 shouldRecomputeNag:(BOOL)a12 outRestrictionsChanged:(BOOL *)a13 outEffectiveSettingsChanged:(BOOL *)a14 outRecomputedNag:(BOOL *)a15 outError:(id *)a16
{
  id v35 = a3;
  id v33 = a5;
  id v34 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  v26 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v35;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Setting client truth %{public}@ for client %{public}@",  buf,  0x16u);
  }

  uint64_t v51 = 0LL;
  v52 = &v51;
  uint64_t v53 = 0x2020000000LL;
  char v54 = 0;
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v56 = sub_10005CBB4;
  v57 = sub_10005CBC4;
  id v58 = 0LL;
  if (v22)
  {
    id v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueue](self, "memberQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005DE48;
    block[3] = &unk_1000C3CA0;
    BOOL v49 = a4;
    id v37 = v34;
    v38 = self;
    id v39 = v22;
    id v40 = v35;
    id v41 = v24;
    id v45 = &v51;
    BOOL v50 = a6;
    id v42 = v25;
    id v43 = v33;
    v47 = a13;
    uint64_t v48 = a14;
    id v44 = v23;
    uint64_t v46 = buf;
    dispatch_block_t v28 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
    dispatch_sync(v27, v28);

    if (a12)
    {
      BOOL v29 = -[MCRestrictionManagerWriter recomputeNagMetadata](self, "recomputeNagMetadata");
      if (a15) {
        *a15 = v29;
      }
    }

    int v30 = *((unsigned __int8 *)v52 + 24);
  }

  else
  {
    int v30 = 0;
  }

  if (a16 && !v30)
  {
    *a16 = *(id *)(*(void *)&buf[8] + 40LL);
    int v30 = *((unsigned __int8 *)v52 + 24);
  }

  BOOL v31 = v30 != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v51, 8);
  return v31;
}

- (id)orphanCheckExemptClientTypes
{
  if (qword_1000DC1C8 != -1) {
    dispatch_once(&qword_1000DC1C8, &stru_1000C3D30);
  }
  return (id)qword_1000DC1A0;
}

- (id)orphanCheckUnexemptClientTypes
{
  if (qword_1000DC1C8 != -1) {
    dispatch_once(&qword_1000DC1C8, &stru_1000C3D30);
  }
  id v2 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1000DC198 allKeys]);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v2));
  objc_super v4 = v3;
  if (qword_1000DC1A0) {
    objc_msgSend(v3, "minusSet:");
  }
  id v5 = [v4 copy];

  return v5;
}

- (id)_liveClientUUIDsForClientType:(id)a3 outLoaderMissing:(BOOL *)a4
{
  id v5 = a3;
  if (qword_1000DC1C8 != -1) {
    dispatch_once(&qword_1000DC1C8, &stru_1000C3D30);
  }
  Value = (void *)CFDictionaryGetValue((CFDictionaryRef)qword_1000DC1A8, v5);
  v7 = CFDictionaryGetValue((CFDictionaryRef)qword_1000DC1B0, v5);
  if (Value)
  {
    uint64_t v8 = ((uint64_t (*)(void *, const void *, id))[Value methodForSelector:v7])( Value,  v7,  v5);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v13) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "Called plugin to get UUIDs",  (uint8_t *)&v13,  2u);
    }

    if (a4) {
LABEL_7:
    }
      *a4 = Value == 0LL;
  }

  else
  {
    id v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      int v13 = 138543362;
      id v14 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "No loader was found for client type %{public}@",  (uint8_t *)&v13,  0xCu);
    }

    id v9 = 0LL;
    if (a4) {
      goto LABEL_7;
    }
  }

  return v9;
}

- (void)notifyClientsToRecomputeCompliance
{
  if (qword_1000DC1C8 != -1) {
    dispatch_once(&qword_1000DC1C8, &stru_1000C3D30);
  }
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v3 = self->_clientTypeLoaders;
  id v4 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(const void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        Value = (void *)CFDictionaryGetValue((CFDictionaryRef)qword_1000DC1A8, v8);
        id v10 = CFDictionaryGetValue((CFDictionaryRef)qword_1000DC1B8, v8);
        if (Value) {
          BOOL v11 = v10 == 0LL;
        }
        else {
          BOOL v11 = 1;
        }
        if (!v11)
        {
          ((void (*)(void *, const void *, const void *))[Value methodForSelector:v10])( Value,  v10,  v8);
          id v12 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)int v13 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Called plugin to recompute compliance",  v13,  2u);
          }
        }
      }

      id v5 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v5);
  }
}

- (id)orphanedClientUUIDsForClientRestrictionDictionary:(id)a3
{
  id v3 = a3;
  if (qword_1000DC1C8 != -1) {
    dispatch_once(&qword_1000DC1C8, &stru_1000C3D30);
  }
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v51;
    uint64_t v9 = kMCClientRestrictionsType;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v51 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v50 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v11]);
        int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v9]);

        if (v13)
        {
          __int128 v14 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v4, "objectForKey:", v13));
          if (!v14)
          {
            __int128 v14 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
            -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v14, v13);
          }

          -[NSMutableSet addObject:](v14, "addObject:", v11);
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v50 objects:v58 count:16];
    }

    while (v7);
  }

  __int128 v15 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v16 = v4;
  id v17 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v46,  v57,  16LL);
  if (v17)
  {
    id v19 = v17;
    uint64_t v20 = *(void *)v47;
    *(void *)&__int128 v18 = 138412290LL;
    __int128 v39 = v18;
    do
    {
      for (j = 0LL; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v47 != v20) {
          objc_enumerationMutation(v16);
        }
        uint64_t v22 = *(void *)(*((void *)&v46 + 1) + 8LL * (void)j);
        if (objc_msgSend((id)qword_1000DC1A0, "containsObject:", v22, v39))
        {
          id v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v16, "objectForKey:", v22));
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 allObjects]);
          -[NSMutableSet addObjectsFromArray:](v15, "addObjectsFromArray:", v24);

          continue;
        }

        char v45 = 0;
        id v25 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter _liveClientUUIDsForClientType:outLoaderMissing:]( self,  "_liveClientUUIDsForClientType:outLoaderMissing:",  v22,  &v45));
        v26 = v25;
        if (v45)
        {
          id v27 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v56 = v22;
            _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "Loader for client type %{public}@ missing. All client restrictions will be removed.",  buf,  0xCu);
          }

          goto LABEL_31;
        }

        if (v25)
        {
          dispatch_block_t v28 = (void *)objc_claimAutoreleasedReturnValue([v25 allObjects]);
          -[NSMutableSet addObjectsFromArray:](v15, "addObjectsFromArray:", v28);
LABEL_30:

          goto LABEL_31;
        }

        if ([(id)qword_1000DC1C0 containsObject:v22])
        {
          BOOL v29 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v39;
            uint64_t v56 = v22;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Loader for client type %@ didn't return an answer. Preserving its client restrictions.",  buf,  0xCu);
          }

          dispatch_block_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v16, "objectForKey:", v22));
          int v30 = (void *)objc_claimAutoreleasedReturnValue([v28 allObjects]);
          -[NSMutableSet addObjectsFromArray:](v15, "addObjectsFromArray:", v30);

          goto LABEL_30;
        }

- (BOOL)removeOrphanedClientRestrictions
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueue](self, "memberQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005EC84;
  block[3] = &unk_1000C29D0;
  void block[4] = self;
  dispatch_sync(v3, block);

  return -[MCRestrictionManagerWriter recomputeNagMetadata](self, "recomputeNagMetadata");
}

- (BOOL)recomputeNagMetadata
{
  return -[MCRestrictionManagerWriter recomputeNagMetadata:](self, "recomputeNagMetadata:", 0LL);
}

- (BOOL)recomputeNagMetadata:(BOOL *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](&OBJC_CLASS___MCPasscodeManagerWriter, "sharedManager"));
  unsigned __int8 v6 = [v5 isDeviceLocked];
  if ((v6 & 1) == 0)
  {
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueue](self, "memberQueue"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10005EFA4;
    v9[3] = &unk_1000C3038;
    v9[4] = self;
    v9[5] = a3;
    dispatch_sync(v7, v9);
  }

  return v6 ^ 1;
}

- (BOOL)memberQueueCheckPasscodeCompliesWithCurrentRestrictions
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueuePasscodeCompliesWithRestrictions]( self,  "memberQueuePasscodeCompliesWithRestrictions"));

  if (v3)
  {
    id v4 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Using cached passcode compliance with restrictions",  buf,  2u);
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueuePasscodeCompliesWithRestrictions]( self,  "memberQueuePasscodeCompliesWithRestrictions"));
    unsigned __int8 v6 = [v5 BOOLValue];

    id v7 = 0LL;
    if ((v6 & 1) != 0)
    {
LABEL_5:
      BOOL v8 = 1;
      goto LABEL_12;
    }
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](&OBJC_CLASS___MCPasscodeManagerWriter, "sharedManager"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueRestrictions](self, "memberQueueRestrictions"));
    id v16 = 0LL;
    id v11 = [v9 currentPasscodeCompliesWithPolicyFromRestrictions:v10 outError:&v16];
    id v7 = v16;

    id v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Caching passcode compliance with restrictions",  buf,  2u);
    }

    int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v11));
    -[MCRestrictionManagerWriter setMemberQueuePasscodeCompliesWithRestrictions:]( self,  "setMemberQueuePasscodeCompliesWithRestrictions:",  v13);
  }

  __int128 v14 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Current passcode does not comply with restrictions. Error: %{public}@",  buf,  0xCu);
  }

  BOOL v8 = 0;
LABEL_12:

  return v8;
}

- (BOOL)memberQueueCheckPasscodeCompliesWithProfileRestrictions
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueuePasscodeCompliesWithProfileRestrictions]( self,  "memberQueuePasscodeCompliesWithProfileRestrictions"));

  if (v3)
  {
    id v4 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Using cached passcode compliance with profile restrictions",  buf,  2u);
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueuePasscodeCompliesWithProfileRestrictions]( self,  "memberQueuePasscodeCompliesWithProfileRestrictions"));
    unsigned __int8 v6 = [v5 BOOLValue];

    id v7 = 0LL;
    if ((v6 & 1) != 0)
    {
LABEL_5:
      BOOL v8 = 1;
      goto LABEL_12;
    }
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](&OBJC_CLASS___MCPasscodeManagerWriter, "sharedManager"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueCombinedSystemProfileRestrictions]( self,  "memberQueueCombinedSystemProfileRestrictions"));
    id v16 = 0LL;
    id v11 = [v9 currentPasscodeCompliesWithPolicyFromRestrictions:v10 outError:&v16];
    id v7 = v16;

    id v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Caching passcode compliance with profile restrictions",  buf,  2u);
    }

    int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v11));
    -[MCRestrictionManagerWriter setMemberQueuePasscodeCompliesWithProfileRestrictions:]( self,  "setMemberQueuePasscodeCompliesWithProfileRestrictions:",  v13);
  }

  __int128 v14 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Current passcode does not comply with profile restrictions, so making change mandatory. Error: %{public}@",  buf,  0xCu);
  }

  BOOL v8 = 0;
LABEL_12:

  return v8;
}

- (BOOL)memberQueueIsPasscodeComplianceMandatoryWithOutLocalizedWarning:(id *)a3
{
  if (!-[MCRestrictionManagerWriter memberQueueCheckPasscodeCompliesWithProfileRestrictions]( self,  "memberQueueCheckPasscodeCompliesWithProfileRestrictions")) {
    return 1;
  }
  id v34 = a3;
  __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v36 = self;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueSystemClientRestrictions]( self,  "memberQueueSystemClientRestrictions"));
  id v6 = [v5 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v41;
    uint64_t v9 = kMCClientRestrictionsType;
    uint64_t v10 = kMCClientRestrictionsCompliant;
    uint64_t v35 = kMCClientRestrictionsTruth;
    uint64_t v38 = kMCClientRestrictionsLocalizedClientDescription;
    uint64_t v37 = *(void *)v41;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v41 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void *)(*((void *)&v40 + 1) + 8LL * (void)i);
        int v13 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v12]);
        uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 objectForKey:v9]);
        if (v14) {
          __int128 v15 = (__CFString *)v14;
        }
        else {
          __int128 v15 = @"Unknown";
        }
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v10]);
        if (!v16)
        {
          id v17 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            char v45 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Client restriction passcode compliance for client of type “%{public}@” was not cached when it should be. Recalculating.",  buf,  0xCu);
          }

          id v18 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueRecomputePasscodeComplianceForClientUUID]( v36,  "memberQueueRecomputePasscodeComplianceForClientUUID"));
          [v18 addObject:v12];

          id v19 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v35]);
          if (v19)
          {
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[MCPasscodeManagerWriter sharedManager]( &OBJC_CLASS___MCPasscodeManagerWriter,  "sharedManager"));
            uint64_t v21 = (uint64_t)[v20 currentPasscodeCompliesWithPolicyFromRestrictions:v19 outError:0];

            uint64_t v8 = v37;
          }

          else
          {
            uint64_t v21 = 1LL;
          }

          id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v21));
        }

        if (([v16 BOOLValue] & 1) == 0)
        {
          uint64_t v22 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            char v45 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Current passcode not compliant with client of type “%{public}@”",  buf,  0xCu);
          }

          if (!-[__CFString isEqualToString:](v15, "isEqualToString:", @"com.apple.eas.account"))
          {

            BOOL v30 = 1;
            id v29 = v5;
            id v27 = v39;
            goto LABEL_35;
          }

          id v24 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v38]);
          if (v24)
          {
            [v39 addObject:v24];
          }

          else
          {
            uint64_t v25 = MCLocalizedString(@"NAG_UI_ACCOUNT_UNKNOWN", v23);
            v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
            [v39 addObject:v26];

            uint64_t v8 = v37;
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v40 objects:v46 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v27 = v39;
  if ([v39 count])
  {
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v39 objectAtIndexedSubscript:0]);
    uint64_t v28 = MCLocalizedFormatByDevice(@"NAG_UI_ACCOUNT_WARNING");
    id v29 = (id)objc_claimAutoreleasedReturnValue(v28);
  }

  else
  {
    uint64_t v31 = MCLocalizedStringByDevice(@"NAG_UI_GENERIC_WARNING");
    id v29 = (id)objc_claimAutoreleasedReturnValue(v31);
  }

  if (v34)
  {
    id v29 = v29;
    BOOL v30 = 0;
    *id v34 = v29;
  }

  else
  {
    BOOL v30 = 0;
  }

- (void)memberQueueMarkToClearPasscodeComplianceCacheWithOldSystemClientRestrictions:(id)a3 newSystemClientRestrictions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Checking if we need to clear client restriction passcode compliance caches",  buf,  2u);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueRecomputePasscodeComplianceForClientUUID]( self,  "memberQueueRecomputePasscodeComplianceForClientUUID"));

  if (v9)
  {
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    id v31 = v7;
    id v10 = v7;
    id v11 = [v10 countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v40;
      uint64_t v36 = kMCClientRestrictionsType;
      uint64_t v33 = kMCClientRestrictionsCompliant;
      uint64_t v34 = kMCClientRestrictionsTruth;
      uint64_t v35 = self;
      uint64_t v37 = *(void *)v40;
      id v38 = v10;
      id v32 = v6;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v40 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v39 + 1) + 8LL * (void)i);
          id v16 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueRecomputePasscodeComplianceForClientUUID]( self,  "memberQueueRecomputePasscodeComplianceForClientUUID",  v31));
          unsigned __int8 v17 = [v16 containsObject:v15];

          if ((v17 & 1) == 0)
          {
            id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v15]);
            uint64_t v19 = objc_claimAutoreleasedReturnValue([v18 objectForKey:v36]);
            if (v19) {
              uint64_t v20 = (__CFString *)v19;
            }
            else {
              uint64_t v20 = @"Unknown";
            }
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v15]);
            uint64_t v22 = v21;
            if (v21)
            {
              uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v33]);
              if (v23)
              {
                id v24 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:v34]);
                if (v24 || ![v23 BOOLValue])
                {
                  id v27 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:v34]);
                  if (+[MCPasscodeManagerWriter didPasscodePolicyChangeWithOldRestrictions:newRestrictions:]( &OBJC_CLASS___MCPasscodeManagerWriter,  "didPasscodePolicyChangeWithOldRestrictions:newRestrictions:",  v27,  v24))
                  {
                    uint64_t v28 = _MCLogObjects[0];
                    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543362;
                      __int128 v44 = v20;
                      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Passcode policy changed for client of type “%{public}@”. Clearing passcode compliance cache.",  buf,  0xCu);
                    }

                    id v29 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueRecomputePasscodeComplianceForClientUUID]( v35,  "memberQueueRecomputePasscodeComplianceForClientUUID"));
                    [v29 addObject:v15];

                    id v6 = v32;
                  }
                }

                else
                {
                  uint64_t v25 = _MCLogObjects[0];
                  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    __int128 v44 = v20;
                    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Client of type “%{public}@” has no restrictions and was previously compliant. No need to clear pas scode compliance cache.",  buf,  0xCu);
                  }
                }
              }

              else
              {
                BOOL v30 = _MCLogObjects[0];
                if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  __int128 v44 = v20;
                  _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Client of type “%{public}@” has no previous cached compliance; marking it to recalculate compliance.",
                    buf,
                    0xCu);
                }

                id v24 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueRecomputePasscodeComplianceForClientUUID]( self,  "memberQueueRecomputePasscodeComplianceForClientUUID"));
                [v24 addObject:v15];
              }

              self = v35;
            }

            else
            {
              v26 = _MCLogObjects[0];
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                __int128 v44 = v20;
                _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Client of type “%{public}@” is a new client; marking it to calculate compliance.",
                  buf,
                  0xCu);
              }

              uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueRecomputePasscodeComplianceForClientUUID]( self,  "memberQueueRecomputePasscodeComplianceForClientUUID"));
              [v23 addObject:v15];
            }

            uint64_t v13 = v37;
            id v10 = v38;
          }
        }

        id v12 = [v10 countByEnumeratingWithState:&v39 objects:v45 count:16];
      }

      while (v12);
    }

    id v7 = v31;
  }
}

- (void)memberQueueCacheClientRestrictionPasscodeCompliance
{
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](&OBJC_CLASS___MCPasscodeManagerWriter, "sharedManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueSystemClientRestrictions]( self,  "memberQueueSystemClientRestrictions"));
  id v4 = [v3 MCMutableDeepCopy];

  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueRecomputePasscodeComplianceForClientUUID]( self,  "memberQueueRecomputePasscodeComplianceForClientUUID"));
  uint64_t v33 = self;
  if (!v5)
  {
    id v10 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Recomputing passcode compliance for all client restrictions",  buf,  2u);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys", self));
    uint64_t v9 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    -[MCRestrictionManagerWriter setMemberQueueRecomputePasscodeComplianceForClientUUID:]( self,  "setMemberQueueRecomputePasscodeComplianceForClientUUID:",  v9);
    goto LABEL_7;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueRecomputePasscodeComplianceForClientUUID]( self,  "memberQueueRecomputePasscodeComplianceForClientUUID"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);

  os_log_t v8 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v8;
    *(_DWORD *)buf = 134217984;
    char v45 = (__CFString *)[v7 count];
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_DEFAULT,  "Recomputing passcode compliance for %lu clients",  buf,  0xCu);
LABEL_7:
  }

  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id obj = v7;
  id v11 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (!v11) {
    goto LABEL_31;
  }
  id v12 = v11;
  uint64_t v13 = *(void *)v40;
  uint64_t v38 = kMCClientRestrictionsType;
  uint64_t v37 = kMCClientRestrictionsTruth;
  uint64_t v14 = kMCClientRestrictionsCompliant;
  uint64_t v34 = kMCClientRestrictionsUserInfo;
  do
  {
    for (i = 0LL; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v40 != v13) {
        objc_enumerationMutation(obj);
      }
      unsigned __int8 v17 = v16;
      if (v16)
      {
        uint64_t v18 = objc_claimAutoreleasedReturnValue([v16 objectForKey:v38]);
        if (v18) {
          uint64_t v19 = (__CFString *)v18;
        }
        else {
          uint64_t v19 = @"Unknown";
        }
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v37]);
        if (v20)
        {
          unsigned int v21 = [v35 currentPasscodeCompliesWithPolicyFromRestrictions:v20 outError:0];
          uint64_t v22 = _MCLogObjects[0];
          BOOL v23 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT);
          if (v21)
          {
            if (v23)
            {
              *(_DWORD *)buf = 138543362;
              char v45 = v19;
              id v24 = v22;
              uint64_t v25 = "Passcode complies with client restrictions from client of type “%{public}@”";
              goto LABEL_23;
            }

            goto LABEL_24;
          }

          if (v23)
          {
            *(_DWORD *)buf = 138543362;
            char v45 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Passcode does not comply with client restrictions from client of type “%{public}@”",  buf,  0xCu);
          }

          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
          [v17 setObject:v28 forKey:v14];

          [v17 removeObjectForKey:v34];
        }

        else
        {
          os_log_t v26 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            char v45 = v19;
            id v24 = v26;
            uint64_t v25 = "Client of type “%{public}@” has no client restrictions. Marking as compliant.";
LABEL_23:
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);
          }

- (void)memberQueueClearRestrictionPasscodeComplianceCache
{
  id v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Clearing restriction passcode compliance cache.",  v4,  2u);
  }

  -[MCRestrictionManagerWriter setMemberQueuePasscodeCompliesWithRestrictions:]( self,  "setMemberQueuePasscodeCompliesWithRestrictions:",  0LL);
}

- (void)memberQueueClearProfileRestrictionPasscodeComplianceCache
{
  id v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Clearing profile restriction passcode compliance cache.",  v4,  2u);
  }

  -[MCRestrictionManagerWriter setMemberQueuePasscodeCompliesWithProfileRestrictions:]( self,  "setMemberQueuePasscodeCompliesWithProfileRestrictions:",  0LL);
}

- (void)memberQueueClearAllPasscodeComplianceCaches
{
  id v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Clearing all passcode compliance caches",  v4,  2u);
  }

  -[MCRestrictionManagerWriter setMemberQueuePasscodeCompliesWithRestrictions:]( self,  "setMemberQueuePasscodeCompliesWithRestrictions:",  0LL);
  -[MCRestrictionManagerWriter setMemberQueuePasscodeCompliesWithProfileRestrictions:]( self,  "setMemberQueuePasscodeCompliesWithProfileRestrictions:",  0LL);
  -[MCRestrictionManagerWriter setMemberQueueRecomputePasscodeComplianceForClientUUID:]( self,  "setMemberQueueRecomputePasscodeComplianceForClientUUID:",  0LL);
}

- (void)clearAllPasscodeComplianceCaches
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueue](self, "memberQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000605E4;
  block[3] = &unk_1000C29D0;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (void)memberQueueClearPasscodeHistoryIfNecessary
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueRestrictions](self, "memberQueueRestrictions"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:MCRestrictedValueKey]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:MCFeaturePasscodeHistoryCount]);
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:MCRestrictedValueValueKey]);

  if (![v6 unsignedIntValue])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](&OBJC_CLASS___MCPasscodeManagerWriter, "sharedManager"));
    [v5 clearPasscodeHistory];
  }
}

- (void)setShowNagMessage
{
  id v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueue](self, "memberQueue"));
  dispatch_sync(v2, &stru_1000C3CC0);
}

- (void)notifyHaveSeenComplianceMessageWithLastLockDate:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueue](self, "memberQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000607EC;
  block[3] = &unk_1000C29D0;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)memberQueueCommitUserSettingsToDisk
{
  id v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Committing user settings.", v19, 2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueSystemUserSettings](self, "memberQueueSystemUserSettings"));
  uint64_t v5 = MCSystemUserSettingsFilePath();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v4 MCWriteToBinaryFile:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueSystemNamespacedUserSettings]( self,  "memberQueueSystemNamespacedUserSettings"));
  uint64_t v8 = MCSystemNamespacedUserSettingsFilePath();
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v7 MCWriteToBinaryFile:v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueUserUserSettings](self, "memberQueueUserUserSettings"));
  uint64_t v11 = MCUserUserSettingsFilePath();
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v10 MCWriteToBinaryFile:v12];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueUserNamespacedUserSettings]( self,  "memberQueueUserNamespacedUserSettings"));
  uint64_t v14 = MCUserNamespacedUserSettingsFilePath();
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  [v13 MCWriteToBinaryFile:v15];

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueSettingsEvents](self, "memberQueueSettingsEvents"));
  uint64_t v17 = MCSettingsEventsFilePath();
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  [v16 MCWriteToBinaryFile:v18];

  MCSendSettingsChangedNotification();
}

- (void)memberQueueCommitEffectiveUserSettingsToDiskOldEffectiveUserSettings:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Committing effective user settings.", v20, 2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueEffectiveUserSettings]( self,  "memberQueueEffectiveUserSettings"));
  uint64_t v7 = MCEffectiveUserSettingsFilePath();
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v6 MCWriteToBinaryFile:v8];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueEffectiveUserSettings]( self,  "memberQueueEffectiveUserSettings"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter filterUserSettingsForPublicUse:]( &OBJC_CLASS___MCRestrictionManagerWriter,  "filterUserSettingsForPublicUse:",  v9));

  uint64_t v11 = MCPublicEffectiveUserSettingsFilePath();
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v10 MCWriteToBinaryFile:v12];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueSettingsEvents](self, "memberQueueSettingsEvents"));
  uint64_t v14 = MCSettingsEventsFilePath();
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  [v13 MCWriteToBinaryFile:v15];

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](&OBJC_CLASS___MCHacks, "sharedHacks"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueRestrictions](self, "memberQueueRestrictions"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueRestrictions](self, "memberQueueRestrictions"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueEffectiveUserSettings]( self,  "memberQueueEffectiveUserSettings"));
  [v16 _applyServerSideChangesWithOldRestrictions:v17 newRestrictions:v18 oldEffectiveUserSettings:v4 newEffectiveUserSettings:v19];

  MCSendEffectiveSettingsChangedNotification(self->_senderPID);
}

- (BOOL)memberQueueRecomputeEffectiveUserSettingsPasscode:(id)a3 credentialSet:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueSystemUserSettings](self, "memberQueueSystemUserSettings"));
  id v9 = [v8 MCMutableDeepCopy];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueUserUserSettings](self, "memberQueueUserUserSettings"));
  [v9 MCDeepCopyEntriesFromDictionary:v10];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueRestrictions](self, "memberQueueRestrictions"));
  id v12 = +[MCRestrictionManager newEffectiveSettingsByApplyingRestrictions:toSettings:]( &OBJC_CLASS___MCRestrictionManager,  "newEffectiveSettingsByApplyingRestrictions:toSettings:",  v11,  v9);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](&OBJC_CLASS___MCHacks, "sharedHacks"));
  [v13 _applyHeuristicsToEffectiveUserSettings:v12];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](&OBJC_CLASS___MCHacks, "sharedHacks"));
  [v14 _applyMandatorySettingsToEffectiveUserSettings:v12];

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueRestrictions](self, "memberQueueRestrictions"));
  unsigned int v16 = +[MCRestrictionManager appWhitelistStateWithSettingsDictionary:restrictionsDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "appWhitelistStateWithSettingsDictionary:restrictionsDictionary:",  v12,  v15);

  if (v16 <= 5 && ((1 << v16) & 0x34) != 0)
  {
    uint64_t v17 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Applying additional restrictions because we are enforcing shared app whitelist behavior.",  buf,  2u);
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter enforcedAppWhitelistRestrictions]( &OBJC_CLASS___MCRestrictionManagerWriter,  "enforcedAppWhitelistRestrictions"));
    id v19 = +[MCRestrictionManager newEffectiveSettingsByApplyingRestrictions:toSettings:]( &OBJC_CLASS___MCRestrictionManager,  "newEffectiveSettingsByApplyingRestrictions:toSettings:",  v18,  v12);

    id v12 = v19;
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](&OBJC_CLASS___MCServerSideHacks, "sharedHacks"));
  [v20 applyEffectiveSettings:v12 toOtherSubsystemsPasscode:v7 credentialSet:v6];

  unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueEffectiveUserSettings]( self,  "memberQueueEffectiveUserSettings"));
  unsigned __int8 v22 = [v21 isEqualToDictionary:v12];

  if ((v22 & 1) == 0)
  {
    unsigned __int8 v63 = v22;
    BOOL v23 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueEffectiveUserSettings]( self,  "memberQueueEffectiveUserSettings"));
    id v24 = [v23 copy];

    -[MCRestrictionManagerWriter applyConfiguration:toDomain:inNamespace:fromSender:]( self,  "applyConfiguration:toDomain:inNamespace:fromSender:",  v12,  4LL,  0LL,  @"MCRestrictionManagerWriter.RecomputeEffectiveUserSettings");
    -[MCRestrictionManagerWriter memberQueueCommitEffectiveUserSettingsToDiskOldEffectiveUserSettings:]( self,  "memberQueueCommitEffectiveUserSettingsToDiskOldEffectiveUserSettings:",  v24);
    if (+[MCRestrictionManager intersectedValuesForFeature:changedBetweenOldRestrictions:andNewRestrictions:]( &OBJC_CLASS___MCRestrictionManager,  "intersectedValuesForFeature:changedBetweenOldRestrictions:andNewRestrictions:",  MCFeatureAllowedExternalIntelligenceWorkspaceIDs,  v24,  v12)) {
      MCSendExternalIntelligenceWorkspaceListChangedNotification();
    }
    if ((+[MCRestrictionManager intersectedValuesSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManager,  "intersectedValuesSetting:valueChangedBetweenOldSettings:andNewSettings:",  MCFeatureAppLockBundleIDs,  v24,  v12) & 1) != 0 || (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",  MCFeatureAppLockMultipleAppsAllowed,  v24,  v12) & 1) != 0 || (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",  MCFeatureAppLockAccessWithoutPasscodeAllowed,  v24,  v12) & 1) != 0 || (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",  MCFeatureAppLockGrantSupervisorAccessForced,  v24,  v12) & 1) != 0 || +[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",  MCFeatureAppLockLogoutAllowed,  v24,  v12))
    {
      buf[0] = 0;
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](&OBJC_CLASS___MCServerSideHacks, "sharedHacks"));
      os_log_t v26 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueEffectiveUserSettings]( self,  "memberQueueEffectiveUserSettings"));
      [v25 recomputeAppOptionsEffectiveUserSettings:v26 outEffectiveChangeDetected:buf];

      if (buf[0])
      {
        MCSendAppWhitelistChangedNotification();
        id v27 = (void *)objc_claimAutoreleasedReturnValue(+[MDMClient sharedClient](&OBJC_CLASS___MDMClient, "sharedClient"));
        [v27 retryNotNowResponse];
      }
    }

    id v64 = v9;
    unsigned int v28 = +[MCRestrictionManager isWebContentFilterUIActiveWithRestrictionDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "isWebContentFilterUIActiveWithRestrictionDictionary:",  v24);
    unsigned int v29 = v28 ^ +[MCRestrictionManager isWebContentFilterUIActiveWithRestrictionDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "isWebContentFilterUIActiveWithRestrictionDictionary:",  v12);
    if ((v29 & 1) != 0
      || (+[MCRestrictionManager intersectedValuesSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManager,  "intersectedValuesSetting:valueChangedBetweenOldSettings:andNewSettings:",  MCFeatureWebContentFilterAutoPermittedURLs,  v24,  v12) & 1) != 0 || (+[MCRestrictionManager intersectedValuesSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManager,  "intersectedValuesSetting:valueChangedBetweenOldSettings:andNewSettings:",  MCFeatureWebContentFilterWhitelistedURLs,  v24,  v12) & 1) != 0 || (+[MCRestrictionManager unionValuesSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManager,  "unionValuesSetting:valueChangedBetweenOldSettings:andNewSettings:",  MCFeatureWebContentFilterBlacklistedURLs,  v24,  v12) & 1) != 0 || +[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",  MCFeatureWebContentFilterAutoForced,  v24,  v12))
    {
      buf[0] = 0;
      char v65 = 0;
      BOOL v30 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](&OBJC_CLASS___MCServerSideHacks, "sharedHacks"));
      id v31 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueEffectiveUserSettings]( self,  "memberQueueEffectiveUserSettings"));
      [v30 recomputeWebContentFilterEffectiveUserSettings:v31 outEffectiveChangeDetected:buf outMechanismChangedDetected:&v65];

      if (v65) {
        uint64_t v32 = MCSendWebContentFilterTypeChangedNotification();
      }
      if (buf[0]) {
        uint64_t v32 = MCSendWebContentFilterChangedNotification(v32);
      }
      if (v29) {
        MCSendWebContentFilterUIActiveChangedNotification(v32);
      }
    }

    if ((+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",  MCFeaturePredictiveKeyboardAllowed,  v24,  v12) & 1) != 0 || (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",  MCFeatureKeyboardShortcutsAllowed,  v24,  v12) & 1) != 0 || (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",  MCFeatureSpellCheckAllowed,  v24,  v12) & 1) != 0 || (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",  MCFeatureAutoCorrectionAllowed,  v24,  v12) & 1) != 0 || (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",  MCFeatureSmartPunctuationAllowed,  v24,  v12) & 1) != 0 || (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",  MCFeatureDictationAllowed,  v24,  v12) & 1) != 0 || +[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",  MCFeatureContinuousPathKeyboardAllowed,  v24,  v12))
    {
      MCSendKeyboardSettingsChangedNotification();
    }

    if ((+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",  MCFeatureNewsAllowed,  v24,  v12) & 1) != 0 || (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",  MCFeatureNewsTodayAllowed,  v24,  v12) & 1) != 0 || +[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",  MCFeatureSpotlightNewsAllowed,  v24,  v12))
    {
      MCSendNewsSettingsChangedNotification();
    }

    if (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",  MCFeaturePasscodeModificationAllowed,  v24,  v12)) {
      MCSendAllowPasscodeModificationChangedNotification();
    }
    if (+[MCRestrictionManager unionValuesSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManager,  "unionValuesSetting:valueChangedBetweenOldSettings:andNewSettings:",  MCFeatureRemovedSystemAppBundleIDs,  v24,  v12)) {
      MCSendRemovedSystemAppsChangedNotification();
    }
    if (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",  MCFeatureHealthDataSubmissionAllowed,  v24,  v12)) {
      MCSendAllowHealthDataSubmissionChangedNotification();
    }
    uint64_t v33 = MCFeatureBookstoreEroticaAllowed;
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueEffectiveUserSettings]( self,  "memberQueueEffectiveUserSettings"));
    BOOL v62 = +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSettingForFeature:withUserSettingDictionary:",  v33,  v34) != 2;

    uint64_t v35 = MCFeatureExplicitContentAllowed;
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueEffectiveUserSettings]( self,  "memberQueueEffectiveUserSettings"));
    BOOL v61 = +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSettingForFeature:withUserSettingDictionary:",  v35,  v36) != 2;

    uint64_t v37 = MCFeatureSpellCheckAllowed;
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueEffectiveUserSettings]( self,  "memberQueueEffectiveUserSettings"));
    BOOL v39 = +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSettingForFeature:withUserSettingDictionary:",  v37,  v38) != 2;

    uint64_t v40 = MCFeatureAutoCorrectionAllowed;
    __int128 v41 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueEffectiveUserSettings]( self,  "memberQueueEffectiveUserSettings"));
    BOOL v42 = +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSettingForFeature:withUserSettingDictionary:",  v40,  v41) != 2;

    uint64_t v43 = MCFeatureMaximumAppsRating;
    __int128 v44 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueEffectiveUserSettings]( self,  "memberQueueEffectiveUserSettings"));
    char v45 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager valueSettingForFeature:withUserSettingDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "valueSettingForFeature:withUserSettingDictionary:",  v43,  v44));

    uint64_t v46 = MCFeatureMaximumMoviesRating;
    __int128 v47 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueEffectiveUserSettings]( self,  "memberQueueEffectiveUserSettings"));
    __int128 v48 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager valueSettingForFeature:withUserSettingDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "valueSettingForFeature:withUserSettingDictionary:",  v46,  v47));

    uint64_t v49 = MCFeatureMaximumTVShowsRating;
    __int128 v50 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueEffectiveUserSettings]( self,  "memberQueueEffectiveUserSettings"));
    __int128 v51 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager valueSettingForFeature:withUserSettingDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "valueSettingForFeature:withUserSettingDictionary:",  v49,  v50));

    v67[0] = MCExplicitBooksAllowedThirdPartyQuery;
    __int128 v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v62));
    v68[0] = v52;
    v67[1] = MCExplicitMusicPodcastsAllowedThirdPartyQuery;
    __int128 v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v61));
    v68[1] = v53;
    v67[2] = MCSpellCheckAllowedThirdPartyQuery;
    char v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v39));
    v68[2] = v54;
    v67[3] = MCAutoCorrectionAllowedThirdPartyQuery;
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v42));
    v68[3] = v55;
    uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v68,  v67,  4LL));

    v57 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v56);
    id v58 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v59 = v58;
    if (v45) {
      -[NSMutableDictionary setObject:forKey:](v57, "setObject:forKey:", v45, MCMaximumAppsRatingThirdPartyQuery);
    }
    else {
      -[NSMutableArray addObject:](v58, "addObject:", MCMaximumAppsRatingThirdPartyQuery);
    }
    if (v48) {
      -[NSMutableDictionary setObject:forKey:](v57, "setObject:forKey:", v48, MCMaximumMoviesRatingThirdPartyQuery);
    }
    else {
      -[NSMutableArray addObject:](v59, "addObject:", MCMaximumMoviesRatingThirdPartyQuery);
    }
    if (v51) {
      -[NSMutableDictionary setObject:forKey:](v57, "setObject:forKey:", v51, MCMaximumTVShowsRatingThirdPartyQuery);
    }
    else {
      -[NSMutableArray addObject:](v59, "addObject:", MCMaximumTVShowsRatingThirdPartyQuery);
    }
    +[MCManagedPreferencesManager updateGlobalManagedPreferencesByAddingPreferences:removingPreferences:]( &OBJC_CLASS___MCManagedPreferencesManager,  "updateGlobalManagedPreferencesByAddingPreferences:removingPreferences:",  v57,  v59);

    id v9 = v64;
    unsigned __int8 v22 = v63;
  }

  return v22 ^ 1;
}

- (id)_memberQueueNewUserSettingsWithParametersForSettingsByType:(id)a3 currentUserSettings:(id)a4
{
  id v6 = a4;
  id v7 = [a3 MCMutableDeepCopy];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](&OBJC_CLASS___MCHacks, "sharedHacks"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueRestrictions](self, "memberQueueRestrictions"));
  [v8 _applyImpliedSettingsToSettingsDictionary:v7 currentSettings:v6 restrictions:v9];

  uint64_t v36 = v6;
  id v10 = [v6 MCMutableDeepCopy];
  [v10 MCDeepCopyEntriesFromDictionary:v7];
  uint64_t v11 = MCIntersectionKey;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:MCIntersectionKey]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v11]);
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v14 = [v13 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v42;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v42 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v18]);
        id v20 = [v19 mutableCopy];
        id v21 = [v18 copy];
        [v12 setObject:v20 forKey:v21];
      }

      id v15 = [v13 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }

    while (v15);
  }

  uint64_t v22 = MCUnionKey;
  id v34 = v10;
  BOOL v23 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:MCUnionKey]);
  uint64_t v35 = v7;
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v22]);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v25 = [v24 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v38;
    do
    {
      for (j = 0LL; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v38 != v27) {
          objc_enumerationMutation(v24);
        }
        unsigned int v29 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)j);
        BOOL v30 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKey:v29]);
        id v31 = [v30 mutableCopy];
        id v32 = [v29 copy];
        [v23 setObject:v31 forKey:v32];
      }

      id v26 = [v24 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }

    while (v26);
  }

  return v34;
}

- (BOOL)memberQueueSetParametersForSettingsByType:(id)a3 configurationUUID:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 credentialSet:(id)a8 sender:(id)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  if (v12)
  {
    id v20 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueSystemUserSettings]( self,  "memberQueueSystemUserSettings"));
    if (v16)
    {
      id v36 = v15;
      id v21 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueSystemNamespacedUserSettings]( self,  "memberQueueSystemNamespacedUserSettings"));
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v16]);
      BOOL v23 = v22;
      if (v22) {
        id v24 = v22;
      }
      else {
        id v24 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      }
      id v26 = v24;

      id v25 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter _memberQueueNewUserSettingsWithParametersForSettingsByType:currentUserSettings:]( self,  "_memberQueueNewUserSettingsWithParametersForSettingsByType:currentUserSettings:",  v36,  v26));
      -[MCRestrictionManagerWriter applyConfiguration:toDomain:inNamespace:fromSender:]( self,  "applyConfiguration:toDomain:inNamespace:fromSender:",  v25,  1LL,  v16,  v19);
      id v20 = v26;
      id v15 = v36;
    }

    else
    {
      id v25 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter _memberQueueNewUserSettingsWithParametersForSettingsByType:currentUserSettings:]( self,  "_memberQueueNewUserSettingsWithParametersForSettingsByType:currentUserSettings:",  v15,  v20));
      -[MCRestrictionManagerWriter applyConfiguration:toDomain:inNamespace:fromSender:]( self,  "applyConfiguration:toDomain:inNamespace:fromSender:",  v25,  0LL,  0LL,  v19);
    }
  }

  if (v11)
  {
    uint64_t v27 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueUserUserSettings]( self,  "memberQueueUserUserSettings"));
    if (v16)
    {
      unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueUserNamespacedUserSettings]( self,  "memberQueueUserNamespacedUserSettings"));
      unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:v16]);
      BOOL v30 = v29;
      if (v29) {
        id v31 = v29;
      }
      else {
        id v31 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      }
      uint64_t v33 = v31;

      id v32 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter _memberQueueNewUserSettingsWithParametersForSettingsByType:currentUserSettings:]( self,  "_memberQueueNewUserSettingsWithParametersForSettingsByType:currentUserSettings:",  v15,  v33));
      -[MCRestrictionManagerWriter applyConfiguration:toDomain:inNamespace:fromSender:]( self,  "applyConfiguration:toDomain:inNamespace:fromSender:",  v32,  3LL,  v16,  v19);
      uint64_t v27 = v33;
    }

    else
    {
      id v32 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter _memberQueueNewUserSettingsWithParametersForSettingsByType:currentUserSettings:]( self,  "_memberQueueNewUserSettingsWithParametersForSettingsByType:currentUserSettings:",  v15,  v27));
      -[MCRestrictionManagerWriter applyConfiguration:toDomain:inNamespace:fromSender:]( self,  "applyConfiguration:toDomain:inNamespace:fromSender:",  v32,  2LL,  0LL,  v19);
    }
  }

  -[MCRestrictionManagerWriter memberQueueCommitUserSettingsToDisk](self, "memberQueueCommitUserSettingsToDisk");
  BOOL v34 = -[MCRestrictionManagerWriter memberQueueRecomputeEffectiveUserSettingsPasscode:credentialSet:]( self,  "memberQueueRecomputeEffectiveUserSettingsPasscode:credentialSet:",  v17,  v18);

  return v34;
}

- (BOOL)setParametersForSettingsByType:(id)a3 sender:(id)a4
{
  return -[MCRestrictionManagerWriter setParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:sender:]( self,  "setParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:sender:",  a3,  0LL,  1LL,  0LL,  0LL,  0LL,  a4);
}

- (BOOL)setParametersForSettingsByType:(id)a3 configurationUUID:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 credentialSet:(id)a8 sender:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  uint64_t v37 = 0LL;
  __int128 v38 = &v37;
  uint64_t v39 = 0x2020000000LL;
  char v40 = 0;
  id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueue](self, "memberQueue"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100061CA0;
  v28[3] = &unk_1000C3CE8;
  id v33 = v19;
  BOOL v34 = &v37;
  v28[4] = self;
  id v29 = v15;
  BOOL v35 = a5;
  BOOL v36 = a6;
  id v30 = v16;
  id v31 = v17;
  id v32 = v18;
  id v21 = v19;
  id v22 = v18;
  id v23 = v17;
  id v24 = v16;
  id v25 = v15;
  dispatch_block_t v26 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, v28);
  dispatch_sync(v20, v26);

  LOBYTE(v20) = *((_BYTE *)v38 + 24);
  _Block_object_dispose(&v37, 8);
  return (char)v20;
}

- (void)setBoolValue:(BOOL)a3 forSetting:(id)a4 sender:(id)a5
{
}

- (void)setBoolValue:(BOOL)a3 ask:(BOOL)a4 forSetting:(id)a5 sender:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a5;
  id v11 = a6;
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
  [v12 setObject:v13 forKeyedSubscript:MCSettingParameterValueKey];

  if (v8)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7));
    [v12 setObject:v14 forKeyedSubscript:MCSettingParameterAskKey];
  }

  else
  {
    [v12 setObject:&__kCFBooleanFalse forKeyedSubscript:MCSettingParameterAskKey];
  }

  id v18 = v12;
  uint64_t v19 = MCRestrictedBoolKey;
  id v17 = v10;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
  id v20 = v15;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));

  -[MCRestrictionManagerWriter setParametersForSettingsByType:sender:]( self,  "setParametersForSettingsByType:sender:",  v16,  v11);
}

- (void)setValue:(id)a3 forSetting:(id)a4 sender:(id)a5
{
  uint64_t v18 = MCRestrictedValueKey;
  id v15 = a3;
  id v16 = a4;
  uint64_t v14 = MCRestrictedValueValueKey;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
  id v17 = v11;
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
  uint64_t v19 = v12;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));

  -[MCRestrictionManagerWriter setParametersForSettingsByType:sender:]( self,  "setParametersForSettingsByType:sender:",  v13,  v8);
}

- (void)setIntersectionValues:(id)a3 forSetting:(id)a4 sender:(id)a5
{
  if (a3)
  {
    uint64_t v24 = MCIntersectionKey;
    id v22 = a4;
    uint64_t v20 = MCSettingParameterValuesKey;
    id v9 = a5;
    id v10 = a4;
    id v11 = [a3 copy];
    id v21 = v11;
    id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
    id v23 = v12;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
    id v25 = v13;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
  }

  else
  {
    uint64_t v18 = MCIntersectionKey;
    id v16 = a4;
    id v17 = &__NSDictionary0__struct;
    id v15 = a5;
    id v12 = a4;
    id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
    id v19 = v11;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
  }

  -[MCRestrictionManagerWriter setParametersForSettingsByType:sender:]( self,  "setParametersForSettingsByType:sender:",  v14,  a5);
}

- (void)setUnionValues:(id)a3 forSetting:(id)a4 sender:(id)a5
{
  if (a3)
  {
    uint64_t v24 = MCUnionKey;
    id v22 = a4;
    uint64_t v20 = MCSettingParameterValuesKey;
    id v9 = a5;
    id v10 = a4;
    id v11 = [a3 copy];
    id v21 = v11;
    id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
    id v23 = v12;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
    id v25 = v13;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
  }

  else
  {
    uint64_t v18 = MCUnionKey;
    id v16 = a4;
    id v17 = &__NSDictionary0__struct;
    id v15 = a5;
    id v12 = a4;
    id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
    id v19 = v11;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
  }

  -[MCRestrictionManagerWriter setParametersForSettingsByType:sender:]( self,  "setParametersForSettingsByType:sender:",  v14,  a5);
}

- (void)removeBoolSetting:(id)a3 sender:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueue](self, "memberQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000623E0;
  block[3] = &unk_1000C3D10;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)removeValueSetting:(id)a3 sender:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueue](self, "memberQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100062568;
  block[3] = &unk_1000C3D10;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)resetAllSettingsToDefaultsSender:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueue](self, "memberQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000626CC;
  v7[3] = &unk_1000C2AA0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)recomputeEffectiveUserSettingsPasscode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueue](self, "memberQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000627CC;
  v7[3] = &unk_1000C2AA0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)recomputeUserRestrictionsAndEffectiveUserSettings
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueue](self, "memberQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100062848;
  block[3] = &unk_1000C29D0;
  void block[4] = self;
  dispatch_sync(v3, block);
}

+ (BOOL)restrictionsAlreadyInstalledFromPayload:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 restrictions]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedManager]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentRestrictions]);
  id v7 =  [a1 restrictionsAfterApplyingRestrictionsDictionary:v4 toRestrictionsDictionary:v6 outChangeDetected:&v9 outError:0];

  return v9 == 0;
}

- (int)senderPID
{
  return self->_senderPID;
}

- (void)setSenderPID:(int)a3
{
  self->_senderPID = a3;
}

- (NSDictionary)clientTypeLoaders
{
  return self->_clientTypeLoaders;
}

- (NSNumber)memberQueuePasscodeCompliesWithRestrictions
{
  return self->_memberQueuePasscodeCompliesWithRestrictions;
}

- (void)setMemberQueuePasscodeCompliesWithRestrictions:(id)a3
{
}

- (NSNumber)memberQueuePasscodeCompliesWithProfileRestrictions
{
  return self->_memberQueuePasscodeCompliesWithProfileRestrictions;
}

- (void)setMemberQueuePasscodeCompliesWithProfileRestrictions:(id)a3
{
}

- (NSMutableSet)memberQueueRecomputePasscodeComplianceForClientUUID
{
  return self->_memberQueueRecomputePasscodeComplianceForClientUUID;
}

- (void)setMemberQueueRecomputePasscodeComplianceForClientUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end