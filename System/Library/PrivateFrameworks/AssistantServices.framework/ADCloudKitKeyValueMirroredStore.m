@interface ADCloudKitKeyValueMirroredStore
- (ADCloudKitKeyValueMirroredStore)init;
- (BOOL)dataStoreIsOnSharedDatabase;
- (BOOL)dataStoreShouldMirrorData;
- (BOOL)hasSetUpRecordZoneSubscription;
- (BOOL)isMirroredDataStore;
- (CKRecordZone)zone;
- (CKServerChangeToken)serverChangeToken;
- (NSArray)supportedRecordTypes;
- (NSMutableDictionary)localKeychainPreferenceCache;
- (NSMutableDictionary)localPreferenceCache;
- (NSMutableDictionary)modificationDateCache;
- (void)deleteUserData:(id)a3;
- (void)fetchDeviceTypesForAllLanguages:(id)a3;
- (void)fetchDeviceTypesForLanguage:(id)a3 completion:(id)a4;
- (void)mergeDataWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4 containsAllChanges:(BOOL)a5 completion:(id)a6;
- (void)setDataStoreIsOnSharedDatabase:(BOOL)a3;
- (void)setDataStoreShouldMirrorData:(BOOL)a3;
- (void)setIsMirroredDataStore:(BOOL)a3;
- (void)setLocalKeychainPreferenceCache:(id)a3;
- (void)setLocalPreferenceCache:(id)a3;
- (void)setModificationDateCache:(id)a3;
- (void)setSupportedRecordTypes:(id)a3;
- (void)setZone:(id)a3;
- (void)synchronizeKeychainPreferencesWithCompletion:(id)a3;
- (void)synchronizeUsingActivity:(id)a3 completion:(id)a4;
- (void)synchronizeWithCompletion:(id)a3;
@end

@implementation ADCloudKitKeyValueMirroredStore

- (ADCloudKitKeyValueMirroredStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ADCloudKitKeyValueMirroredStore;
  v2 = -[ADCloudKitKeyValueMirroredStore init](&v6, "init");
  if (v2)
  {
    v7 = @"AssistantKeyValueRecord";
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
    supportedRecordTypes = v2->_supportedRecordTypes;
    v2->_supportedRecordTypes = (NSArray *)v3;
  }

  return v2;
}

- (BOOL)hasSetUpRecordZoneSubscription
{
  return 0;
}

- (CKServerChangeToken)serverChangeToken
{
  return 0LL;
}

- (void)synchronizeWithCompletion:(id)a3
{
  uint64_t v3 = (void (**)(id, uint64_t))a3;
  v4 = (os_log_s *)AFSiriLogContextDaemon;
  BOOL v5 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v5)
  {
    *(_DWORD *)buf = 136315138;
    v129 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  AFBackedUpPreferencesSynchronize(v5);
  objc_super v6 = sub_100274C40();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v123 = 0u;
  __int128 v124 = 0u;
  __int128 v125 = 0u;
  __int128 v126 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v123 objects:v134 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v124;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v124 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v123 + 1) + 8LL * (void)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v14]);
        if (v15)
        {
          -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v15, v14);
        }

        else
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
          -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v16, v14);
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v123 objects:v134 count:16];
    }

    while (v11);
  }

  if (-[NSMutableDictionary count](v8, "count"))
  {
    v120 = v3;
    uint64_t v17 = kAFSessionLanguage;
    uint64_t v18 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v8, "objectForKey:", kAFSessionLanguage));

    uint64_t v19 = kAFOutputVoice;
    uint64_t v20 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v8, "objectForKey:", kAFOutputVoice));
    uint64_t v21 = v18 | v20;

    if (!v21) {
      goto LABEL_155;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v8, "objectForKey:", v17));
    id v23 = sub_100272F7C(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v118 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v8, "objectForKey:", v19));
    v25 = sub_100272EE8(v118, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v117 = v26;
    if (!v26)
    {
      v37 = (os_log_s *)AFSiriLogContextDaemon;
      v38 = v118;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v129 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
        __int16 v130 = 2112;
        v131 = v22;
        __int16 v132 = 2112;
        v133 = (AFVoiceInfo *)v118;
        _os_log_error_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "%s Not synching language (%@) and output voice(%@) due to mismatch",  buf,  0x20u);
      }

      v127[0] = v17;
      v127[1] = v19;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v127, 2LL));
      -[NSMutableDictionary removeObjectsForKeys:](v8, "removeObjectsForKeys:", v29);
      goto LABEL_154;
    }

    v27 = v22;
    v28 = sub_100273034(v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    uint64_t v30 = objc_claimAutoreleasedReturnValue([v29 dictionaryRepresentation]);
    v31 = @"Output Voice v12";
    v119 = (void *)v30;
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v30, @"Output Voice v12");

    if (sub_100273110(v29, v24))
    {
      if (v18)
      {
        v22 = v27;
        v32 = sub_100273FDC(v24);
        v33 = (AFVoiceInfo *)objc_claimAutoreleasedReturnValue(v32);
        v34 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v129 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
          __int16 v130 = 2112;
          v131 = v24;
          __int16 v132 = 2112;
          v133 = v33;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  "%s Synching default voice for version 1 sync clients (%@) : %@",  buf,  0x20u);
        }

        v35 = (void *)objc_claimAutoreleasedReturnValue(-[AFVoiceInfo dictionaryRepresentation](v33, "dictionaryRepresentation"));
        -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v35, v19);

        v36 = v119;
        if ((sub_100273E0C(v29, v24) & 1) == 0) {
          goto LABEL_40;
        }
LABEL_29:
        v40 = sub_100273FDC(v24);
        v41 = (AFVoiceInfo *)objc_claimAutoreleasedReturnValue(v40);
        v42 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v129 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
          __int16 v130 = 2112;
          v131 = v24;
          __int16 v132 = 2112;
          v133 = v41;
          _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_INFO,  "%s Synching default voice for version 2 sync clients (%@) : %@",  buf,  0x20u);
        }

        v43 = (void *)objc_claimAutoreleasedReturnValue(-[AFVoiceInfo dictionaryRepresentation](v41, "dictionaryRepresentation"));
        -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v43, @"Output Voice v2");

        v36 = v119;
        if ((sub_100273F08(v29, v24) & 1) != 0)
        {
LABEL_44:
          v47 = sub_100273FDC(v24);
          v48 = (AFVoiceInfo *)objc_claimAutoreleasedReturnValue(v47);
          v49 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315650;
            v129 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
            __int16 v130 = 2112;
            v131 = v24;
            __int16 v132 = 2112;
            v133 = v48;
            _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_INFO,  "%s Synching default voice for version 3 sync clients (%@) : %@",  buf,  0x20u);
          }

          v50 = (void *)objc_claimAutoreleasedReturnValue(-[AFVoiceInfo dictionaryRepresentation](v48, "dictionaryRepresentation"));
          -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v50, @"Output Voice v3");

          v36 = v119;
          if ((sub_100273358(v29, v24) & 1) == 0) {
            goto LABEL_63;
          }
LABEL_52:
          v52 = sub_100273FDC(v24);
          v53 = (AFVoiceInfo *)objc_claimAutoreleasedReturnValue(v52);
          v54 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315650;
            v129 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
            __int16 v130 = 2112;
            v131 = v24;
            __int16 v132 = 2112;
            v133 = v53;
            _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_INFO,  "%s Synching default voice for version 4 sync clients (%@) : %@",  buf,  0x20u);
          }

          v55 = (void *)objc_claimAutoreleasedReturnValue(-[AFVoiceInfo dictionaryRepresentation](v53, "dictionaryRepresentation"));
          -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v55, @"Output Voice v4");

          v36 = v119;
          if ((sub_1002734D8(v29, v24) & 1) != 0)
          {
LABEL_67:
            v59 = sub_1002740A8(v24);
            v60 = (AFVoiceInfo *)objc_claimAutoreleasedReturnValue(v59);
            v61 = (os_log_s *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315650;
              v129 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
              __int16 v130 = 2112;
              v131 = v24;
              __int16 v132 = 2112;
              v133 = v60;
              _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_INFO,  "%s Synching default voice for version 5 sync clients (%@) : %@",  buf,  0x20u);
            }

            v62 = (void *)objc_claimAutoreleasedReturnValue(-[AFVoiceInfo dictionaryRepresentation](v60, "dictionaryRepresentation"));
            -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v62, @"Output Voice v5");

            v36 = v119;
            if ((sub_100273564(v29, v24) & 1) == 0) {
              goto LABEL_86;
            }
LABEL_75:
            v64 = sub_1002740A8(v24);
            v65 = (AFVoiceInfo *)objc_claimAutoreleasedReturnValue(v64);
            v66 = (os_log_s *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315650;
              v129 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
              __int16 v130 = 2112;
              v131 = v24;
              __int16 v132 = 2112;
              v133 = v65;
              _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_INFO,  "%s Synching default voice for version 6 sync clients (%@) : %@",  buf,  0x20u);
            }

            v67 = (void *)objc_claimAutoreleasedReturnValue(-[AFVoiceInfo dictionaryRepresentation](v65, "dictionaryRepresentation"));
            -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v67, @"Output Voice v6");

            v36 = v119;
            if ((sub_1002737B0(v29, v24) & 1) != 0)
            {
LABEL_90:
              v71 = sub_1002741E8(v24);
              v72 = (AFVoiceInfo *)objc_claimAutoreleasedReturnValue(v71);
              v73 = (os_log_s *)AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315650;
                v129 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
                __int16 v130 = 2112;
                v131 = v24;
                __int16 v132 = 2112;
                v133 = v72;
                _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_INFO,  "%s Synching default voice for version 7 sync clients (%@) : %@",  buf,  0x20u);
              }

              v74 = (void *)objc_claimAutoreleasedReturnValue(-[AFVoiceInfo dictionaryRepresentation](v72, "dictionaryRepresentation"));
              -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v74, @"Output Voice v7");

              v36 = v119;
              if ((sub_10027383C(v29, v24) & 1) == 0) {
                goto LABEL_109;
              }
LABEL_98:
              v76 = sub_10027432C(v24);
              v77 = (AFVoiceInfo *)objc_claimAutoreleasedReturnValue(v76);
              v78 = (os_log_s *)AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315650;
                v129 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
                __int16 v130 = 2112;
                v131 = v24;
                __int16 v132 = 2112;
                v133 = v77;
                _os_log_impl( (void *)&_mh_execute_header,  v78,  OS_LOG_TYPE_INFO,  "%s Synching default voice for version 8 sync clients (%@) : %@",  buf,  0x20u);
              }

              v79 = (void *)objc_claimAutoreleasedReturnValue(-[AFVoiceInfo dictionaryRepresentation](v77, "dictionaryRepresentation"));
              -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v79, @"Output Voice v8");

              v36 = v119;
              if ((sub_100273904(v29, v24) & 1) != 0)
              {
LABEL_113:
                v83 = sub_1002744A8(v24);
                v84 = (AFVoiceInfo *)objc_claimAutoreleasedReturnValue(v83);
                v85 = (os_log_s *)AFSiriLogContextDaemon;
                if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315650;
                  v129 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
                  __int16 v130 = 2112;
                  v131 = v24;
                  __int16 v132 = 2112;
                  v133 = v84;
                  _os_log_impl( (void *)&_mh_execute_header,  v85,  OS_LOG_TYPE_INFO,  "%s Synching default voice for version 9 sync clients (%@) : %@",  buf,  0x20u);
                }

                v86 = (void *)objc_claimAutoreleasedReturnValue(-[AFVoiceInfo dictionaryRepresentation](v84, "dictionaryRepresentation"));
                -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v86, @"Output Voice v9");

                v36 = v119;
                if ((sub_100273BC4(v29, v24) & 1) == 0) {
                  goto LABEL_132;
                }
LABEL_121:
                v88 = sub_100274684(v24);
                v89 = (AFVoiceInfo *)objc_claimAutoreleasedReturnValue(v88);
                v90 = (os_log_s *)AFSiriLogContextDaemon;
                if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315650;
                  v129 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
                  __int16 v130 = 2112;
                  v131 = v24;
                  __int16 v132 = 2112;
                  v133 = v89;
                  _os_log_impl( (void *)&_mh_execute_header,  v90,  OS_LOG_TYPE_INFO,  "%s Synching default voice for version 10 sync clients (%@) : %@",  buf,  0x20u);
                }

                v91 = (void *)objc_claimAutoreleasedReturnValue(-[AFVoiceInfo dictionaryRepresentation](v89, "dictionaryRepresentation"));
                -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v91, @"Output Voice v10");

                v36 = v119;
                if ((sub_100273C50(v29, v24) & 1) != 0) {
                  goto LABEL_136;
                }
                goto LABEL_146;
              }

              goto LABEL_117;
            }

            goto LABEL_94;
          }

          goto LABEL_71;
        }

        goto LABEL_48;
      }

      v44 = (os_log_s *)AFSiriLogContextDaemon;
      v22 = v27;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v129 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
        __int16 v130 = 2112;
        v131 = v24;
        __int16 v132 = 2112;
        v133 = (AFVoiceInfo *)v29;
        _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_INFO,  "%s Skipping sync of version 1 voice for language (%@) : %@",  buf,  0x20u);
      }

      -[NSMutableDictionary removeObjectForKey:](v8, "removeObjectForKey:", v19);
      v36 = v119;
      if ((sub_100273E0C(v29, v24) & 1) != 0)
      {
LABEL_36:
        v45 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v129 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
          __int16 v130 = 2112;
          v131 = v24;
          __int16 v132 = 2112;
          v133 = (AFVoiceInfo *)v29;
          _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_INFO,  "%s Skipping sync of version 2 voice for language (%@) : %@",  buf,  0x20u);
        }

        -[NSMutableDictionary removeObjectForKey:](v8, "removeObjectForKey:", @"Output Voice v2");
        if ((sub_100273F08(v29, v24) & 1) != 0) {
          goto LABEL_56;
        }
        goto LABEL_48;
      }
    }

    else
    {
      v39 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v129 = "-[ADCloudKitKeyValueMirroredStore synchronizeWithCompletion:]";
        __int16 v130 = 2112;
        v131 = v24;
        __int16 v132 = 2112;
        v133 = (AFVoiceInfo *)v29;
        _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_INFO,  "%s Synching voice for version 1 sync clients as well (%@) : %@",  buf,  0x20u);
      }

      v36 = (void *)v30;
      -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v30, v19);
      v22 = v27;
      if ((sub_100273E0C(v29, v24) & 1) != 0)
      {
        if (v18) {
          goto LABEL_29;
        }
        goto LABEL_36;
      }
    }

- (void)synchronizeKeychainPreferencesWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  BOOL v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v38 = "-[ADCloudKitKeyValueMirroredStore synchronizeKeychainPreferencesWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  objc_super v6 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v7 = sub_100274F5C();
  v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v7);
  modificationDateCache = self->_modificationDateCache;
  self->_modificationDateCache = v8;

  id v10 = sub_100274E6C();
  id v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v10);
  localKeychainPreferenceCache = self->_localKeychainPreferenceCache;
  self->_localKeychainPreferenceCache = v11;

  id v15 = sub_100274B58(v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  if ([v16 containsObject:@"User Identifier"])
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 sharedUserIdentifier]);

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_localKeychainPreferenceCache,  "objectForKey:",  @"User Identifier"));
    unsigned __int8 v20 = [v18 isEqual:v19];

    if ((v20 & 1) == 0)
    {
      if (v18)
      {
        -[NSMutableDictionary setObject:forKey:]( self->_localKeychainPreferenceCache,  "setObject:forKey:",  v18,  @"User Identifier");
        -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v18, @"User Identifier");
      }

      else
      {
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
        -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v21, @"User Identifier");
      }

      v22 = self->_modificationDateCache;
      id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      -[NSMutableDictionary setObject:forKey:](v22, "setObject:forKey:", v23, @"User Identifier");
    }
  }

  if ([v16 containsObject:@"Logging User Identifier"])
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 loggingSharedUserIdentifier]);

    v26 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_localKeychainPreferenceCache,  "objectForKey:",  @"Logging User Identifier"));
    unsigned __int8 v27 = [v25 isEqual:v26];

    if ((v27 & 1) == 0)
    {
      if (v25)
      {
        -[NSMutableDictionary setObject:forKey:]( self->_localKeychainPreferenceCache,  "setObject:forKey:",  v25,  @"Logging User Identifier");
        -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v25, @"Logging User Identifier");
      }

      else
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
        -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v28, @"Logging User Identifier");
      }

      v29 = self->_modificationDateCache;
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      -[NSMutableDictionary setObject:forKey:](v29, "setObject:forKey:", v30, @"Logging User Identifier");
    }
  }

  if (-[NSMutableDictionary count](v6, "count"))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v6, "allKeys"));
    v32 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[ADCloudKitKeyValueMirroredStore synchronizeKeychainPreferencesWithCompletion:]";
      __int16 v39 = 2112;
      v40 = v31;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "%s Saving keys: %@", buf, 0x16u);
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[ADCloudKitManager sharedManager](&OBJC_CLASS___ADCloudKitManager, "sharedManager"));
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_100176E98;
    v35[3] = &unk_1004FCEC0;
    id v36 = v31;
    id v34 = v31;
    [v33 saveKeyValueRecordsWithDictionary:v6 mirror:1 completion:v35];
  }

  if (v4) {
    v4[2](v4, 1LL);
  }
}

- (void)mergeDataWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4 containsAllChanges:(BOOL)a5 completion:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a6;
  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[ADCloudKitKeyValueMirroredStore mergeDataWithModifiedRecords:deletedRecordIDs:containsAllChanges:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s No merging on mirrored container.",  (uint8_t *)&v12,  0xCu);
  }

  if (v10) {
    v10[2](v10, 0LL);
  }
}

- (void)deleteUserData:(id)a3
{
  uint64_t v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    BOOL v5 = "-[ADCloudKitKeyValueMirroredStore deleteUserData:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
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

- (void).cxx_destruct
{
}

@end