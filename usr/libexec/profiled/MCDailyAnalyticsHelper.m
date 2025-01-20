@interface MCDailyAnalyticsHelper
+ (id)_allFalseSettingsKeys;
+ (id)_allPayloadCountKeys;
+ (id)_allTrueSettingsKeys;
+ (id)_falseRestrictionsDictionary;
+ (id)_falseSettingsDictionary;
+ (id)_getCounterDictionaryFromKeySet:(id)a3;
+ (id)_intersectionRestrictionsDictionary;
+ (id)_objectRestrictionsDictionary;
+ (id)_payloadCountDictionary;
+ (id)_trueRestrictionsDictionary;
+ (id)_trueSettingsDictionary;
+ (id)_valueRestrictionsDictionary;
+ (void)addCloudConfigInfoWithEventPayload:(id)a3;
+ (void)addMDMConfigInfoWithEventPayload:(id)a3;
+ (void)addPasscodeInfoWithEventPayload:(id)a3;
+ (void)addProfileAndPayloadInfoWithEventPayload:(id)a3;
+ (void)addRestrictionInfoWithEventPayload:(id)a3;
+ (void)addSettingsInfoWithEventPayload:(id)a3;
+ (void)addSharediPadInfoWithEventPayload:(id)a3;
@end

@implementation MCDailyAnalyticsHelper

+ (void)addCloudConfigInfoWithEventPayload:(id)a3
{
  id v3 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](&OBJC_CLASS___MDMCloudConfiguration, "sharedConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v6 isSupervised]));
  [v3 setObject:v4 forKeyedSubscript:@"isSupervised"];

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v6 isTeslaEnrolled]));
  [v3 setObject:v5 forKeyedSubscript:@"isDEP"];
}

+ (void)addMDMConfigInfoWithEventPayload:(id)a3
{
  id v3 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](&OBJC_CLASS___MDMConfiguration, "sharedConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v11 memberQueueManagingProfileIdentifier]);
  BOOL v5 = v4 != 0LL;

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v5));
  [v3 setObject:v6 forKeyedSubscript:@"isMDMEnrolled"];

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v11 isUserEnrollment]));
  [v3 setObject:v7 forKeyedSubscript:@"isUserEnrollment"];

  v8 = (void *)objc_claimAutoreleasedReturnValue([v11 personaID]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8 != 0LL));
  [v3 setObject:v9 forKeyedSubscript:@"isDataSeparated"];

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
  [v3 setObject:v10 forKeyedSubscript:@"isAccountDrivenEnrollment"];
}

+ (void)addSharediPadInfoWithEventPayload:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  +[DMCMultiUserModeUtilities isSharediPad](&OBJC_CLASS___DMCMultiUserModeUtilities, "isSharediPad")));
  [v3 setObject:v4 forKeyedSubscript:@"isSharediPad"];
}

+ (void)addProfileAndPayloadInfoWithEventPayload:(id)a3
{
  id v33 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
  id v34 = objc_alloc_init(&OBJC_CLASS___MCProfileTrustEvaluator);
  BOOL v5 = objc_alloc(&OBJC_CLASS___NSSet);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifiersOfProfilesWithFilterFlags:2]);
  v37 = -[NSSet initWithArray:](v5, "initWithArray:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[MCDailyAnalyticsHelper _payloadCountDictionary]( &OBJC_CLASS___MCDailyAnalyticsHelper,  "_payloadCountDictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _allPayloadCountKeys]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _getCounterDictionaryFromKeySet:v8]);

  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  v39 = v4;
  id obj = (id)objc_claimAutoreleasedReturnValue([v4 allInstalledProfileIdentifiers]);
  id v40 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
  uint64_t v10 = 0LL;
  if (v40)
  {
    unsigned int v36 = 0;
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v38 = *(void *)v53;
    do
    {
      for (i = 0LL; i != v40; i = (char *)i + 1)
      {
        if (*(void *)v53 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v52 + 1) + 8LL * (void)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue([v39 installedProfileWithIdentifier:v14]);
        if (v15)
        {
          int v46 = v11;
          int v47 = v10;
          int v45 = v12;
          v44 = i;
          unsigned int v42 = -[NSSet containsObject:](v37, "containsObject:", v14);
          if ([v15 isSigned])
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue([v15 signerCertificates]);
            unsigned int v17 = [v34 sanitizedProfileSignerCertificateChainIsAllowedToWriteDefaults:v16];

            v36 += v17;
          }

          unsigned int v41 = [v15 isEncrypted];
          __int128 v48 = 0u;
          __int128 v49 = 0u;
          __int128 v50 = 0u;
          __int128 v51 = 0u;
          v43 = v15;
          v18 = (void *)objc_claimAutoreleasedReturnValue([v15 payloads]);
          id v19 = [v18 countByEnumeratingWithState:&v48 objects:v56 count:16];
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v49;
            do
            {
              for (j = 0LL; j != v20; j = (char *)j + 1)
              {
                if (*(void *)v49 != v21) {
                  objc_enumerationMutation(v18);
                }
                v24 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v23]);

                if (v24)
                {
                  v25 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v24]);

                  if (v25)
                  {
                    v26 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v24]);
                    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v26 unsignedIntValue] + 1));
                    [v9 setObject:v27 forKeyedSubscript:v24];
                  }
                }
              }

              id v20 = [v18 countByEnumeratingWithState:&v48 objects:v56 count:16];
            }

            while (v20);
          }

          uint64_t v12 = (v45 + 1);
          uint64_t v11 = v46 + v42;
          uint64_t v10 = v47 + v41;

          v15 = v43;
          i = v44;
        }
      }

      id v40 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
    }

    while (v40);
  }

  else
  {
    unsigned int v36 = 0;
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v12));
  [v33 setObject:v28 forKeyedSubscript:@"profile_count"];

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v11));
  [v33 setObject:v29 forKeyedSubscript:@"profile_count_carrier"];

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v10));
  [v33 setObject:v30 forKeyedSubscript:@"profile_count_encrypted"];

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v36));
  [v33 setObject:v31 forKeyedSubscript:@"profile_count_signed"];

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v36));
  [v33 setObject:v32 forKeyedSubscript:@"profile_count_signedByApple"];

  [v33 addEntriesFromDictionary:v9];
}

+ (void)addRestrictionInfoWithEventPayload:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 combinedProfileRestrictions]);

  id v20 = (id)objc_claimAutoreleasedReturnValue( +[MCDailyAnalyticsHelper _falseRestrictionsDictionary]( &OBJC_CLASS___MCDailyAnalyticsHelper,  "_falseRestrictionsDictionary"));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100039464;
  v33[3] = &unk_1000C3690;
  id v6 = v5;
  id v34 = v6;
  id v7 = v3;
  id v35 = v7;
  [v20 enumerateKeysAndObjectsUsingBlock:v33];
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[MCDailyAnalyticsHelper _trueRestrictionsDictionary]( &OBJC_CLASS___MCDailyAnalyticsHelper,  "_trueRestrictionsDictionary"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000394E4;
  v30[3] = &unk_1000C3690;
  id v9 = v6;
  id v31 = v9;
  id v10 = v7;
  id v32 = v10;
  [v8 enumerateKeysAndObjectsUsingBlock:v30];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[MCDailyAnalyticsHelper _objectRestrictionsDictionary]( &OBJC_CLASS___MCDailyAnalyticsHelper,  "_objectRestrictionsDictionary"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100039564;
  v27[3] = &unk_1000C3690;
  id v12 = v9;
  id v28 = v12;
  id v13 = v10;
  id v29 = v13;
  [v11 enumerateKeysAndObjectsUsingBlock:v27];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[MCDailyAnalyticsHelper _intersectionRestrictionsDictionary]( &OBJC_CLASS___MCDailyAnalyticsHelper,  "_intersectionRestrictionsDictionary"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000395F8;
  v24[3] = &unk_1000C3690;
  id v15 = v12;
  id v25 = v15;
  id v16 = v13;
  id v26 = v16;
  [v14 enumerateKeysAndObjectsUsingBlock:v24];
  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue( +[MCDailyAnalyticsHelper _valueRestrictionsDictionary]( &OBJC_CLASS___MCDailyAnalyticsHelper,  "_valueRestrictionsDictionary"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10003968C;
  v21[3] = &unk_1000C3690;
  id v22 = v15;
  id v23 = v16;
  id v18 = v16;
  id v19 = v15;
  [v17 enumerateKeysAndObjectsUsingBlock:v21];
}

+ (void)addSettingsInfoWithEventPayload:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userSettings]);

  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[MCDailyAnalyticsHelper _falseSettingsDictionary]( &OBJC_CLASS___MCDailyAnalyticsHelper,  "_falseSettingsDictionary"));
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue( +[MCDailyAnalyticsHelper _allFalseSettingsKeys]( &OBJC_CLASS___MCDailyAnalyticsHelper,  "_allFalseSettingsKeys"));
  id v6 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:v10]);
        if (+[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSettingForFeature:withUserSettingDictionary:",  v11,  v5) == 2) {
          id v12 = &__kCFBooleanTrue;
        }
        else {
          id v12 = &__kCFBooleanFalse;
        }
        [v3 setObject:v12 forKeyedSubscript:v10];
      }

      id v7 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }

    while (v7);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[MCDailyAnalyticsHelper _trueSettingsDictionary]( &OBJC_CLASS___MCDailyAnalyticsHelper,  "_trueSettingsDictionary"));
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[MCDailyAnalyticsHelper _allTrueSettingsKeys]( &OBJC_CLASS___MCDailyAnalyticsHelper,  "_allTrueSettingsKeys"));
  id v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (j = 0LL; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)j);
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v19]);
        if (+[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "BOOLSettingForFeature:withUserSettingDictionary:",  v20,  v5) == 1) {
          uint64_t v21 = &__kCFBooleanTrue;
        }
        else {
          uint64_t v21 = &__kCFBooleanFalse;
        }
        [v3 setObject:v21 forKeyedSubscript:v19];
      }

      id v16 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }

    while (v16);
  }
}

+ (void)addPasscodeInfoWithEventPayload:(id)a3
{
  id v3 = a3;
  id v14 = (id)objc_claimAutoreleasedReturnValue(+[MCPasscodeManager sharedManager](&OBJC_CLASS___MCPasscodeManager, "sharedManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v14 isPasscodeSet]));
  [v3 setObject:v4 forKeyedSubscript:@"passcode_hasPasscode"];

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentRestrictions]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  +[MCPasscodeManager restrictionsEnforcePasscodePolicy:]( &OBJC_CLASS___MCPasscodeManager,  "restrictionsEnforcePasscodePolicy:",  v6)));
  [v3 setObject:v7 forKeyedSubscript:@"passcode_hasPasscodePolicy"];

  uint64_t v8 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", MCKeybagMementoBlobExists());
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v3 setObject:v9 forKeyedSubscript:@"passcode_hasRecoveryPasscode"];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v14 currentUnlockScreenType]));
  [v3 setObject:v10 forKeyedSubscript:@"passcode_unlockScreenType"];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v14 currentUnlockSimplePasscodeType]));
  [v3 setObject:v11 forKeyedSubscript:@"passcode_simpleType"];

  id v12 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", MCKeybagMementoSupported());
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [v3 setObject:v13 forKeyedSubscript:@"passcode_supportsPasscodeRecovery"];
}

+ (id)_allPayloadCountKeys
{
  if (qword_1000DC068 != -1) {
    dispatch_once(&qword_1000DC068, &stru_1000C36B0);
  }
  return (id)qword_1000DC060;
}

+ (id)_payloadCountDictionary
{
  if (qword_1000DC078 != -1) {
    dispatch_once(&qword_1000DC078, &stru_1000C36D0);
  }
  return (id)qword_1000DC070;
}

+ (id)_falseRestrictionsDictionary
{
  if (qword_1000DC088 != -1) {
    dispatch_once(&qword_1000DC088, &stru_1000C36F0);
  }
  return (id)qword_1000DC080;
}

+ (id)_trueRestrictionsDictionary
{
  if (qword_1000DC098 != -1) {
    dispatch_once(&qword_1000DC098, &stru_1000C3710);
  }
  return (id)qword_1000DC090;
}

+ (id)_objectRestrictionsDictionary
{
  if (qword_1000DC0A8 != -1) {
    dispatch_once(&qword_1000DC0A8, &stru_1000C3730);
  }
  return (id)qword_1000DC0A0;
}

+ (id)_intersectionRestrictionsDictionary
{
  if (qword_1000DC0B8 != -1) {
    dispatch_once(&qword_1000DC0B8, &stru_1000C3750);
  }
  return (id)qword_1000DC0B0;
}

+ (id)_valueRestrictionsDictionary
{
  if (qword_1000DC0C8 != -1) {
    dispatch_once(&qword_1000DC0C8, &stru_1000C3770);
  }
  return (id)qword_1000DC0C0;
}

+ (id)_allFalseSettingsKeys
{
  if (qword_1000DC0D8 != -1) {
    dispatch_once(&qword_1000DC0D8, &stru_1000C3790);
  }
  return (id)qword_1000DC0D0;
}

+ (id)_falseSettingsDictionary
{
  if (qword_1000DC0E8 != -1) {
    dispatch_once(&qword_1000DC0E8, &stru_1000C37B0);
  }
  return (id)qword_1000DC0E0;
}

+ (id)_allTrueSettingsKeys
{
  if (qword_1000DC0F8 != -1) {
    dispatch_once(&qword_1000DC0F8, &stru_1000C37D0);
  }
  return (id)qword_1000DC0F0;
}

+ (id)_trueSettingsDictionary
{
  if (qword_1000DC108 != -1) {
    dispatch_once(&qword_1000DC108, &stru_1000C37F0);
  }
  return (id)qword_1000DC100;
}

+ (id)_getCounterDictionaryFromKeySet:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  &off_1000CBFE0,  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v9),  (void)v11);
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }

  return v4;
}

@end