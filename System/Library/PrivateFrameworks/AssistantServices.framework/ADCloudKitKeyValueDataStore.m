@interface ADCloudKitKeyValueDataStore
- (ADCloudKitKeyValueDataStore)init;
- (BOOL)dataStoreIsOnSharedDatabase;
- (BOOL)dataStoreShouldMirrorData;
- (BOOL)hasMergedAllRecords;
- (BOOL)hasSetUpRecordZoneSubscription;
- (BOOL)isMirroredDataStore;
- (CKRecordZone)zone;
- (CKServerChangeToken)serverChangeToken;
- (NSArray)supportedRecordTypes;
- (NSMutableDictionary)localKeychainPreferenceCache;
- (NSMutableDictionary)localPreferenceCache;
- (NSMutableDictionary)modificationDateCache;
- (void)_mergeDataWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4 containsAllChanges:(BOOL)a5 completion:(id)a6;
- (void)deleteUserData:(id)a3;
- (void)fetchDeviceTypesForAllLanguages:(id)a3;
- (void)fetchDeviceTypesForLanguage:(id)a3 completion:(id)a4;
- (void)mergeDataWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4 containsAllChanges:(BOOL)a5 completion:(id)a6;
- (void)setDataStoreIsOnSharedDatabase:(BOOL)a3;
- (void)setDataStoreShouldMirrorData:(BOOL)a3;
- (void)setHasMergedAllRecords:(BOOL)a3;
- (void)setHasSetUpRecordZoneSubscription:(BOOL)a3;
- (void)setIsMirroredDataStore:(BOOL)a3;
- (void)setLocalKeychainPreferenceCache:(id)a3;
- (void)setLocalPreferenceCache:(id)a3;
- (void)setModificationDateCache:(id)a3;
- (void)setServerChangeToken:(id)a3;
- (void)setSupportedRecordTypes:(id)a3;
- (void)setZone:(id)a3;
- (void)synchronizeKeychainPreferencesWithCompletion:(id)a3;
- (void)synchronizeUsingActivity:(id)a3 completion:(id)a4;
- (void)synchronizeWithCompletion:(id)a3;
@end

@implementation ADCloudKitKeyValueDataStore

- (ADCloudKitKeyValueDataStore)init
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___ADCloudKitKeyValueDataStore;
  v2 = -[ADCloudKitKeyValueDataStore init](&v19, "init");
  if (v2)
  {
    v20 = @"AssistantKeyValueRecord";
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
    supportedRecordTypes = v2->_supportedRecordTypes;
    v2->_supportedRecordTypes = (NSArray *)v3;

    AFBackedUpPreferencesSynchronize(v5);
    v6 = sub_100274C40();
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    localPreferenceCache = v2->_localPreferenceCache;
    v2->_localPreferenceCache = (NSMutableDictionary *)v7;

    v9 = sub_100274E6C();
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    localKeychainPreferenceCache = v2->_localKeychainPreferenceCache;
    v2->_localKeychainPreferenceCache = (NSMutableDictionary *)v10;

    v12 = sub_100274F5C();
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    modificationDateCache = v2->_modificationDateCache;
    v2->_modificationDateCache = (NSMutableDictionary *)v13;

    id v15 = +[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitKeyValueDataStore serverChangeToken](v2, "serverChangeToken"));
    v2->_hasMergedAllRecords = v16 != 0LL;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    [v17 clearLegacyKeyValueServerChangeTokens];
  }

  return v2;
}

- (BOOL)hasSetUpRecordZoneSubscription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  unsigned __int8 v3 = [v2 hasSetUpKeyValueRecordZoneSubscription];

  return v3;
}

- (void)setHasSetUpRecordZoneSubscription:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  [v4 setHasSetUpKeyValueRecordZoneSubscription:v3];

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  [v5 synchronize];
}

- (CKServerChangeToken)serverChangeToken
{
  if (-[ADCloudKitKeyValueDataStore isMirroredDataStore](self, "isMirroredDataStore"))
  {
    v2 = 0LL;
  }

  else
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 keyValueServerChangeToken]);

    v2 = (void *)objc_claimAutoreleasedReturnValue( +[CKServerChangeToken ad_unarchiveTokenFromData:withExceptionBlock:]( &OBJC_CLASS___CKServerChangeToken,  "ad_unarchiveTokenFromData:withExceptionBlock:",  v4,  &stru_1004FB340));
  }

  return (CKServerChangeToken *)v2;
}

- (void)setServerChangeToken:(id)a3
{
  id v8 = a3;
  if (!-[ADCloudKitKeyValueDataStore isMirroredDataStore](self, "isMirroredDataStore"))
  {
    if (v8)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ad_archiveTokenToDataWithExceptionBlock:", &stru_1004FB360));
      if (!v4) {
        goto LABEL_7;
      }
    }

    else
    {
      v4 = 0LL;
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    [v5 setKeyValueServerChangeToken:v4];

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    [v6 synchronize];

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v7 postNotificationName:@"ADCloudKitManagerPreferencesDidSyncNotification" object:0];
  }

- (void)synchronizeWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  BOOL v6 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v6)
  {
    *(_DWORD *)buf = 136315138;
    v127 = "-[ADCloudKitKeyValueDataStore synchronizeWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  AFBackedUpPreferencesSynchronize(v6);
  uint64_t v7 = sub_100274C40();
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = sub_100274F5C();
  uint64_t v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v9);
  modificationDateCache = self->_modificationDateCache;
  self->_modificationDateCache = v10;

  v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v108 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_localPreferenceCache, "allKeys"));
  v105 = (void *)v12;
  if (v12) {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v12));
  }
  else {
    uint64_t v13 = 0LL;
  }
  v106 = (void (**)(void, void))v4;
  __int128 v123 = 0u;
  __int128 v124 = 0u;
  __int128 v121 = 0u;
  __int128 v122 = 0u;
  id obj = v8;
  id v14 = [obj countByEnumeratingWithState:&v121 objects:v133 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v122;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v122 != v16) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v121 + 1) + 8LL * (void)i);
        [v13 removeObject:v18];
        objc_super v19 = (void *)objc_claimAutoreleasedReturnValue([obj objectForKey:v18]);
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_localPreferenceCache, "objectForKey:", v18));
        unsigned __int8 v21 = sub_1002747C4(v19, v20, v18);

        if ((v21 & 1) == 0)
        {
          localPreferenceCache = self->_localPreferenceCache;
          if (v19)
          {
            -[NSMutableDictionary setObject:forKey:](localPreferenceCache, "setObject:forKey:", v19, v18);
            -[NSMutableDictionary setObject:forKey:](v108, "setObject:forKey:", v19, v18);
          }

          else
          {
            -[NSMutableDictionary removeObjectForKey:](localPreferenceCache, "removeObjectForKey:", v18);
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
            -[NSMutableDictionary setObject:forKey:](v108, "setObject:forKey:", v23, v18);
          }

          -[NSMutableDictionary setObject:forKey:](self->_modificationDateCache, "setObject:forKey:", v107, v18);
        }
      }

      id v15 = [obj countByEnumeratingWithState:&v121 objects:v133 count:16];
    }

    while (v15);
  }

  __int128 v119 = 0u;
  __int128 v120 = 0u;
  __int128 v117 = 0u;
  __int128 v118 = 0u;
  id v24 = v13;
  id v25 = [v24 countByEnumeratingWithState:&v117 objects:v132 count:16];
  v26 = v108;
  if (v25)
  {
    id v27 = v25;
    uint64_t v28 = *(void *)v118;
    do
    {
      for (j = 0LL; j != v27; j = (char *)j + 1)
      {
        if (*(void *)v118 != v28) {
          objc_enumerationMutation(v24);
        }
        uint64_t v30 = *(void *)(*((void *)&v117 + 1) + 8LL * (void)j);
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
        -[NSMutableDictionary setObject:forKey:](v108, "setObject:forKey:", v31, v30);
      }

      id v27 = [v24 countByEnumeratingWithState:&v117 objects:v132 count:16];
    }

    while (v27);
  }

  if (!-[NSMutableDictionary count](v108, "count")) {
    goto LABEL_115;
  }
  uint64_t v32 = kAFSessionLanguage;
  uint64_t v33 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v108, "objectForKey:", kAFSessionLanguage));

  uint64_t v34 = kAFOutputVoice;
  uint64_t v35 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v108, "objectForKey:", kAFOutputVoice));

  if (self->_hasMergedAllRecords
    || !(v33 | v35)
    || (v36 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences")),
        unsigned int v37 = [v36 isUsingDefaultLanguageSettings],
        v36,
        !v37))
  {
    if (v33)
    {
      if (v35)
      {
        int v104 = 1;
        goto LABEL_46;
      }

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_localPreferenceCache, "objectForKey:", v34));
      if (v38)
      {
        -[NSMutableDictionary setObject:forKey:](v108, "setObject:forKey:", v38, v34);
      }

      else
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
        -[NSMutableDictionary setObject:forKey:](v108, "setObject:forKey:", v39, v34);
      }

      int v104 = 1;
      uint64_t v40 = v34;
    }

    else
    {
      if (!v35) {
        goto LABEL_109;
      }
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_localPreferenceCache, "objectForKey:", v32));
      if (v38)
      {
        -[NSMutableDictionary setObject:forKey:](v108, "setObject:forKey:", v38, v32);
      }

      else
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
        -[NSMutableDictionary setObject:forKey:](v108, "setObject:forKey:", v41, v32);
      }

      int v104 = 0;
      uint64_t v40 = v32;
    }

    -[NSMutableDictionary setObject:forKey:](self->_modificationDateCache, "setObject:forKey:", v107, v40);

LABEL_46:
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v108, "objectForKey:", v32));
    id v43 = sub_100272F7C(v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v108, "objectForKey:", v34));
    v46 = sub_100272EE8(v45, v44);
    v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
    v48 = v47;
    if (!v47)
    {
      v60 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v127 = "-[ADCloudKitKeyValueDataStore synchronizeWithCompletion:]";
        __int16 v128 = 2112;
        v129 = v42;
        __int16 v130 = 2112;
        v131 = v45;
        _os_log_error_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_ERROR,  "%s Not synching language (%@) and output voice(%@) due to mismatch",  buf,  0x20u);
      }

      v125[0] = v32;
      v125[1] = v34;
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v125, 2LL));
      -[NSMutableDictionary removeObjectsForKeys:](v108, "removeObjectsForKeys:", v51);
      v48 = 0LL;
      goto LABEL_108;
    }

    v101 = v42;
    v103 = v45;
    uint64_t v49 = v34;
    v50 = sub_100273034(v47);
    v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
    uint64_t v52 = objc_claimAutoreleasedReturnValue([v51 dictionaryRepresentation]);
    v53 = @"Output Voice v12";
    v54 = (void *)v52;
    -[NSMutableDictionary setObject:forKey:](v108, "setObject:forKey:", v52, @"Output Voice v12");

    if (sub_100273110(v51, v44))
    {
      if (v104)
      {
        v55 = v48;
        v56 = sub_100273FDC(v44);
        v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
        v58 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v127 = "-[ADCloudKitKeyValueDataStore synchronizeWithCompletion:]";
          __int16 v128 = 2112;
          v129 = v44;
          __int16 v130 = 2112;
          v131 = v57;
          _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_INFO,  "%s Synching default voice for version 1 sync clients (%@) : %@",  buf,  0x20u);
        }

        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "dictionaryRepresentation", v101));
        -[NSMutableDictionary setObject:forKey:](v108, "setObject:forKey:", v59, v49);

        v48 = v55;
        v54 = (void *)v52;
        if ((sub_100273E0C(v51, v44) & 1) == 0) {
          goto LABEL_71;
        }
LABEL_60:
        v62 = sub_100273FDC(v44);
        v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
        v64 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v127 = "-[ADCloudKitKeyValueDataStore synchronizeWithCompletion:]";
          __int16 v128 = 2112;
          v129 = v44;
          __int16 v130 = 2112;
          v131 = v63;
          _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_INFO,  "%s Synching default voice for version 2 sync clients (%@) : %@",  buf,  0x20u);
        }

        v65 = (void *)objc_claimAutoreleasedReturnValue([v63 dictionaryRepresentation]);
        -[NSMutableDictionary setObject:forKey:](v108, "setObject:forKey:", v65, @"Output Voice v2");

        v42 = v102;
        v54 = (void *)v52;
        if ((sub_100273F08(v51, v44) & 1) != 0)
        {
LABEL_75:
          v69 = v42;
          v70 = sub_100273FDC(v44);
          v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
          v72 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315650;
            v127 = "-[ADCloudKitKeyValueDataStore synchronizeWithCompletion:]";
            __int16 v128 = 2112;
            v129 = v44;
            __int16 v130 = 2112;
            v131 = v71;
            _os_log_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_INFO,  "%s Synching default voice for version 3 sync clients (%@) : %@",  buf,  0x20u);
          }

          v73 = (void *)objc_claimAutoreleasedReturnValue([v71 dictionaryRepresentation]);
          -[NSMutableDictionary setObject:forKey:](v108, "setObject:forKey:", v73, @"Output Voice v3");

          v42 = v69;
          v54 = (void *)v52;
          if ((sub_100273358(v51, v44) & 1) == 0) {
            goto LABEL_94;
          }
LABEL_83:
          v75 = v42;
          v76 = sub_100273FDC(v44);
          v77 = (void *)objc_claimAutoreleasedReturnValue(v76);
          v78 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315650;
            v127 = "-[ADCloudKitKeyValueDataStore synchronizeWithCompletion:]";
            __int16 v128 = 2112;
            v129 = v44;
            __int16 v130 = 2112;
            v131 = v77;
            _os_log_impl( (void *)&_mh_execute_header,  v78,  OS_LOG_TYPE_INFO,  "%s Synching default voice for version 4 sync clients (%@) : %@",  buf,  0x20u);
          }

          v79 = (void *)objc_claimAutoreleasedReturnValue([v77 dictionaryRepresentation]);
          -[NSMutableDictionary setObject:forKey:](v108, "setObject:forKey:", v79, @"Output Voice v4");

          v42 = v75;
          v54 = (void *)v52;
          if ((sub_1002734D8(v51, v44) & 1) != 0) {
            goto LABEL_98;
          }
          goto LABEL_101;
        }

        goto LABEL_79;
      }

      v66 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v127 = "-[ADCloudKitKeyValueDataStore synchronizeWithCompletion:]";
        __int16 v128 = 2112;
        v129 = v44;
        __int16 v130 = 2112;
        v131 = v51;
        _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_INFO,  "%s Skipping sync of version 1 voice for language (%@) : %@",  buf,  0x20u);
      }

      -[NSMutableDictionary removeObjectForKey:](v108, "removeObjectForKey:", v49, v101);
      if ((sub_100273E0C(v51, v44) & 1) != 0)
      {
LABEL_67:
        v67 = (os_log_s *)AFSiriLogContextDaemon;
        v42 = v102;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v127 = "-[ADCloudKitKeyValueDataStore synchronizeWithCompletion:]";
          __int16 v128 = 2112;
          v129 = v44;
          __int16 v130 = 2112;
          v131 = v51;
          _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_INFO,  "%s Skipping sync of version 2 voice for language (%@) : %@",  buf,  0x20u);
        }

        -[NSMutableDictionary removeObjectForKey:](v108, "removeObjectForKey:", @"Output Voice v2");
        if ((sub_100273F08(v51, v44) & 1) != 0) {
          goto LABEL_87;
        }
        goto LABEL_79;
      }
    }

    else
    {
      v61 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v127 = "-[ADCloudKitKeyValueDataStore synchronizeWithCompletion:]";
        __int16 v128 = 2112;
        v129 = v44;
        __int16 v130 = 2112;
        v131 = v51;
        _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_INFO,  "%s Synching voice for version 1 sync clients as well (%@) : %@",  buf,  0x20u);
      }

      -[NSMutableDictionary setObject:forKey:](v108, "setObject:forKey:", v52, v49, v101);
      if ((sub_100273E0C(v51, v44) & 1) != 0)
      {
        if (v104) {
          goto LABEL_60;
        }
        goto LABEL_67;
      }
    }

- (void)synchronizeKeychainPreferencesWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v38 = "-[ADCloudKitKeyValueDataStore synchronizeKeychainPreferencesWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  BOOL v6 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v7 = sub_100274F5C();
  id v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v7);
  modificationDateCache = self->_modificationDateCache;
  self->_modificationDateCache = v8;

  id v12 = sub_100274B58(v10, v11);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if ([v13 containsObject:@"User Identifier"])
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 sharedUserIdentifier]);

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_localKeychainPreferenceCache,  "objectForKey:",  @"User Identifier"));
    unsigned __int8 v17 = [v15 isEqual:v16];

    if ((v17 & 1) == 0)
    {
      if (v15)
      {
        -[NSMutableDictionary setObject:forKey:]( self->_localKeychainPreferenceCache,  "setObject:forKey:",  v15,  @"User Identifier");
        -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v15, @"User Identifier");
      }

      else
      {
        -[NSMutableDictionary removeObjectForKey:]( self->_localPreferenceCache,  "removeObjectForKey:",  @"User Identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
        -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v18, @"User Identifier");
      }

      objc_super v19 = self->_modificationDateCache;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v20, @"User Identifier");
    }
  }

  if ([v13 containsObject:@"Logging User Identifier"])
  {
    unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 loggingSharedUserIdentifier]);

    v23 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_localKeychainPreferenceCache,  "objectForKey:",  @"Logging User Identifier"));
    unsigned __int8 v24 = [v22 isEqual:v23];

    if ((v24 & 1) == 0)
    {
      if (v22)
      {
        -[NSMutableDictionary setObject:forKey:]( self->_localKeychainPreferenceCache,  "setObject:forKey:",  v22,  @"Logging User Identifier");
        -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v22, @"Logging User Identifier");
      }

      else
      {
        -[NSMutableDictionary removeObjectForKey:]( self->_localPreferenceCache,  "removeObjectForKey:",  @"Logging User Identifier");
        id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
        -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v25, @"Logging User Identifier");
      }

      v26 = self->_modificationDateCache;
      id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      -[NSMutableDictionary setObject:forKey:](v26, "setObject:forKey:", v27, @"Logging User Identifier");
    }
  }

  if (-[NSMutableDictionary count](v6, "count"))
  {
    sub_100274948(self->_modificationDateCache, kAFModificationDates);
    AFBackedUpPreferencesSynchronize(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v6, "allKeys"));
    uint64_t v30 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[ADCloudKitKeyValueDataStore synchronizeKeychainPreferencesWithCompletion:]";
      __int16 v39 = 2112;
      uint64_t v40 = v29;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "%s Saving keys: %@", buf, 0x16u);
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[ADCloudKitManager sharedManager](&OBJC_CLASS___ADCloudKitManager, "sharedManager"));
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_1002F5498;
    v33[3] = &unk_1004FB388;
    id v34 = v29;
    uint64_t v35 = self;
    v36 = v6;
    id v32 = v29;
    [v31 saveKeyValueRecordsWithDictionary:v36 mirror:0 completion:v33];
  }

  if (v4) {
    v4[2](v4, 1LL);
  }
}

- (void)mergeDataWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4 containsAllChanges:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315138;
    id v15 = "-[ADCloudKitKeyValueDataStore mergeDataWithModifiedRecords:deletedRecordIDs:containsAllChanges:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v14, 0xCu);
  }

  -[ADCloudKitKeyValueDataStore _mergeDataWithModifiedRecords:deletedRecordIDs:containsAllChanges:completion:]( self,  "_mergeDataWithModifiedRecords:deletedRecordIDs:containsAllChanges:completion:",  v10,  v11,  v7,  v12);
}

- (void)_mergeDataWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4 containsAllChanges:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v181 = a6;
  id v12 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = [v10 count];
    id v14 = [v11 count];
    id v15 = @"partial";
    *(_DWORD *)buf = 136315906;
    v241 = "-[ADCloudKitKeyValueDataStore _mergeDataWithModifiedRecords:deletedRecordIDs:containsAllChanges:completion:]";
    if (v7) {
      id v15 = @"full";
    }
    __int16 v242 = 2048;
    id v243 = v13;
    __int16 v244 = 2048;
    id v245 = v14;
    __int16 v246 = 2112;
    v247 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Merging %zd modified records, %zd deleted records, %@ sync",  buf,  0x2Au);
  }

  log = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v190 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v17 = sub_100274B58((uint64_t)v190, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  BOOL hasMergedAllRecords = self->_hasMergedAllRecords;
  BOOL v183 = v7;
  v182 = v11;
  if (v7)
  {
    objc_super v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_localPreferenceCache, "allKeys"));
    if (v19)
    {
      id v20 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v19));
    }

    else
    {
      id v20 = 0LL;
    }

    [v20 addObject:@"User Identifier"];
    [v20 addObject:@"Logging User Identifier"];
    unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_modificationDateCache, "allKeys"));

    if (v21)
    {
      id v205 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v21));
    }

    else
    {
      id v205 = 0LL;
    }

    v201 = v20;
    self->_BOOL hasMergedAllRecords = 1;
  }

  else
  {
    id v205 = 0LL;
    v201 = 0LL;
  }

  v191 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  unsigned __int8 v22 = [v191 isUsingDefaultLanguageSettings];
  __int128 v227 = 0u;
  __int128 v228 = 0u;
  __int128 v229 = 0u;
  __int128 v230 = 0u;
  id obj = v10;
  id v23 = [obj countByEnumeratingWithState:&v227 objects:v239 count:16];
  v188 = v18;
  if (v23)
  {
    id v24 = v23;
    char v198 = 0;
    char v184 = 0;
    v189 = 0LL;
    uint64_t v25 = *(void *)v228;
    char v186 = v22 ^ 1;
    v194 = 0LL;
    id v195 = (id)kAFOutputVoice;
    uint64_t v192 = kAFSessionLanguage;
    while (1)
    {
      v26 = 0LL;
      do
      {
        if (*(void *)v228 != v25) {
          objc_enumerationMutation(obj);
        }
        id v27 = *(void **)(*((void *)&v227 + 1) + 8LL * (void)v26);
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 recordType]);
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_supportedRecordTypes, "firstObject"));
        unsigned __int8 v30 = [v28 isEqualToString:v29];

        if ((v30 & 1) != 0)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue([v27 recordID]);
          id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 recordName]);

          id v33 = [v32 length];
          id v34 = (os_log_s *)AFSiriLogContextDaemon;
          BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_INFO);
          if (!v33)
          {
            if (v35)
            {
              *(_DWORD *)buf = 136315394;
              v241 = "-[ADCloudKitKeyValueDataStore _mergeDataWithModifiedRecords:deletedRecordIDs:containsAllChanges:completion:]";
              __int16 v242 = 2112;
              id v243 = v27;
              __int16 v39 = v34;
              uint64_t v40 = "%s Modified record is lacking a name : (%@)";
              goto LABEL_37;
            }

- (void)deleteUserData:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315138;
    id v15 = "-[ADCloudKitKeyValueDataStore deleteUserData:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v14, 0xCu);
  }

  -[ADCloudKitKeyValueDataStore setServerChangeToken:](self, "setServerChangeToken:", 0LL);
  sub_100274948(0LL, kAFModificationDates);
  AFBackedUpPreferencesSynchronize(v6);
  BOOL v7 = sub_100274F5C();
  id v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v7);
  modificationDateCache = self->_modificationDateCache;
  self->_modificationDateCache = v8;

  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_localKeychainPreferenceCache,  "objectForKey:",  @"User Identifier"));
  if (v10)
  {

LABEL_6:
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[ADCloudKitManager sharedManager](&OBJC_CLASS___ADCloudKitManager, "sharedManager"));
    [v12 ignoreNextNotification:@"ADPreferencesSharedUserIdentifierDidChangeNotification"];

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    [v13 setSharedUserIdentifier:0 loggingSharedUserIdentifier:0];

    -[NSMutableDictionary removeObjectForKey:]( self->_localKeychainPreferenceCache,  "removeObjectForKey:",  @"User Identifier");
    -[NSMutableDictionary removeObjectForKey:]( self->_localKeychainPreferenceCache,  "removeObjectForKey:",  @"Logging User Identifier");
    goto LABEL_7;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_localKeychainPreferenceCache,  "objectForKey:",  @"Logging User Identifier"));

  if (v11) {
    goto LABEL_6;
  }
LABEL_7:
}

- (void)fetchDeviceTypesForLanguage:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0LL);
  }
}

- (void)fetchDeviceTypesForAllLanguages:(id)a3
{
  if (a3) {
    (*((void (**)(id, void, void))a3 + 2))(a3, 0LL, 0LL);
  }
}

- (void)synchronizeUsingActivity:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, uint64_t))a4 + 2))(a4, 1LL);
  }
}

- (BOOL)dataStoreIsOnSharedDatabase
{
  return self->_dataStoreIsOnSharedDatabase;
}

- (void)setDataStoreIsOnSharedDatabase:(BOOL)a3
{
  self->_dataStoreIsOnSharedDatabase = a3;
}

- (BOOL)dataStoreShouldMirrorData
{
  return self->_dataStoreShouldMirrorData;
}

- (void)setDataStoreShouldMirrorData:(BOOL)a3
{
  self->_dataStoreShouldMirrorData = a3;
}

- (BOOL)isMirroredDataStore
{
  return self->_isMirroredDataStore;
}

- (void)setIsMirroredDataStore:(BOOL)a3
{
  self->_isMirroredDataStore = a3;
}

- (CKRecordZone)zone
{
  return self->_zone;
}

- (void)setZone:(id)a3
{
}

- (NSArray)supportedRecordTypes
{
  return self->_supportedRecordTypes;
}

- (void)setSupportedRecordTypes:(id)a3
{
}

- (NSMutableDictionary)localPreferenceCache
{
  return self->_localPreferenceCache;
}

- (void)setLocalPreferenceCache:(id)a3
{
}

- (NSMutableDictionary)localKeychainPreferenceCache
{
  return self->_localKeychainPreferenceCache;
}

- (void)setLocalKeychainPreferenceCache:(id)a3
{
}

- (NSMutableDictionary)modificationDateCache
{
  return self->_modificationDateCache;
}

- (void)setModificationDateCache:(id)a3
{
}

- (BOOL)hasMergedAllRecords
{
  return self->_hasMergedAllRecords;
}

- (void)setHasMergedAllRecords:(BOOL)a3
{
  self->_BOOL hasMergedAllRecords = a3;
}

- (void).cxx_destruct
{
}

@end