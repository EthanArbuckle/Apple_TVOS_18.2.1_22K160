@interface ADCloudKitMultiUserSharedDataStore
- (ADCloudKitMultiUserSharedDataStore)init;
- (ADCloudKitMultiUserSharedDataStore)initWithInstanceContext:(id)a3;
- (BOOL)_cleanupCacheDirectory;
- (BOOL)_errorIsRecoverableForPrimary:(int64_t)a3;
- (BOOL)_errorIsRecoverableForSecondary:(int64_t)a3;
- (BOOL)_errorIsUserNotPresentOnTV:(int64_t)a3;
- (BOOL)dataStoreIsOnSharedDatabase;
- (BOOL)dataStoreShouldMirrorData;
- (BOOL)hasSetUpRecordZoneSubscription;
- (BOOL)isMirroredDataStore;
- (CKRecordZone)zone;
- (CKServerChangeToken)serverChangeToken;
- (NSArray)supportedRecordTypes;
- (OS_dispatch_queue)serialQueue;
- (id)_cacheDirectory;
- (id)_constructRecord:(id)a3 fileArchives:(id)a4 assetManifest:(id)a5 filePath:(id)a6;
- (id)_createCacheDirectory;
- (id)_extractRecord:(id)a3 atPath:(id)a4 fileManager:(id)a5;
- (id)_homeMembershipsFromUnencryptedRecords:(id)a3;
- (void)_logRelevantAnalyticsOnMultiUserVoiceProfileDownloadSuccessWithSharedUserID:(id)a3 isPrimary:(BOOL)a4 isNewUser:(BOOL)a5;
- (void)_mergeDataWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4 containsAllChanges:(BOOL)a5 completion:(id)a6;
- (void)_synchronizeUsingActivity:(id)a3 completion:(id)a4;
- (void)_updateVoiceIDProfilesForSharedUser:(id)a3 iCloudAltDSID:(id)a4 records:(id)a5 isPrimary:(BOOL)a6 isNewUser:(BOOL)a7 completion:(id)a8;
- (void)cleanupCacheDirectory;
- (void)deleteUserData:(id)a3;
- (void)fetchDeviceTypesForAllLanguages:(id)a3;
- (void)fetchDeviceTypesForLanguage:(id)a3 completion:(id)a4;
- (void)mergeDataWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4 containsAllChanges:(BOOL)a5 completion:(id)a6;
- (void)setDataStoreIsOnSharedDatabase:(BOOL)a3;
- (void)setDataStoreShouldMirrorData:(BOOL)a3;
- (void)setHasSetUpRecordZoneSubscription:(BOOL)a3;
- (void)setIsMirroredDataStore:(BOOL)a3;
- (void)setKeyValueRecordsAndVoiceProfile:(id)a3 records:(id)a4 completion:(id)a5;
- (void)setSerialQueue:(id)a3;
- (void)setServerChangeToken:(id)a3;
- (void)setSupportedRecordTypes:(id)a3;
- (void)setZone:(id)a3;
- (void)synchronizeUsingActivity:(id)a3 completion:(id)a4;
- (void)synchronizeWithCompletion:(id)a3;
@end

@implementation ADCloudKitMultiUserSharedDataStore

- (ADCloudKitMultiUserSharedDataStore)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFInstanceContext currentContext](&OBJC_CLASS___AFInstanceContext, "currentContext"));
  v4 = -[ADCloudKitMultiUserSharedDataStore initWithInstanceContext:](self, "initWithInstanceContext:", v3);

  return v4;
}

- (ADCloudKitMultiUserSharedDataStore)initWithInstanceContext:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___ADCloudKitMultiUserSharedDataStore;
  v5 = -[ADCloudKitMultiUserSharedDataStore init](&v22, "init");
  if (v5)
  {
    v23[0] = @"AssistantVoiceTriggerFileAssetRecord";
    v23[1] = @"AssistantKeyValueRecord";
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 2LL));
    supportedRecordTypes = v5->_supportedRecordTypes;
    v5->_supportedRecordTypes = (NSArray *)v6;

    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create("ADCloudKitMultiUserSharedDataStore.Serial", v9);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 endpointUUID]);
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[SSRVoiceProfileManager sharedInstanceWithEndpointId:]( &OBJC_CLASS___SSRVoiceProfileManager,  "sharedInstanceWithEndpointId:",  v12));
    voiceProfileManager = v5->_voiceProfileManager;
    v5->_voiceProfileManager = (SSRVoiceProfileManager *)v13;

    os_signpost_id_t v15 = os_signpost_id_generate(AFSiriLogContextMultiUser);
    v16 = (os_log_s *)AFSiriLogContextMultiUser;
    v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)v21 = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v17,  OS_SIGNPOST_INTERVAL_BEGIN,  v15,  "MultiUserService",  "Setting up ADCloudKitMultiUserSharedDataStore listener",  v21,  2u);
    }

    v5->multiUserSyncedRecordsSignpost = v15;
    v5->isATVOnly = AFIsATV(v18, v19);
  }

  return v5;
}

- (BOOL)hasSetUpRecordZoneSubscription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  unsigned __int8 v3 = [v2 hasSetUpMultiUserSharedRecordZoneSubscription];

  return v3;
}

- (void)setHasSetUpRecordZoneSubscription:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  [v4 setHasSetupMultiUserSharedRecordZoneSubscription:v3];

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  [v5 synchronize];
}

- (CKServerChangeToken)serverChangeToken
{
  BOOL v3 = -[ADCloudKitMultiUserSharedDataStore isMirroredDataStore](self, "isMirroredDataStore");
  if (v3
    || (AFSupportsMultiUser(v3, v4) & 1) != 0
    || -[ADCloudKitMultiUserSharedDataStore dataStoreIsOnSharedDatabase](self, "dataStoreIsOnSharedDatabase"))
  {
    id v5 = 0LL;
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    dispatch_queue_attr_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 multiUserSharedDataServerChangeToken]);

    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[CKServerChangeToken ad_unarchiveTokenFromData:withExceptionBlock:]( &OBJC_CLASS___CKServerChangeToken,  "ad_unarchiveTokenFromData:withExceptionBlock:",  v8,  &stru_1004F2E20));
  }

  return (CKServerChangeToken *)v5;
}

- (void)setServerChangeToken:(id)a3
{
  id v12 = a3;
  BOOL v4 = -[ADCloudKitMultiUserSharedDataStore isMirroredDataStore](self, "isMirroredDataStore");
  if (!v4 && (AFSupportsMultiUser(v4, v5) & 1) == 0)
  {
    if (v12)
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ad_archiveTokenToDataWithExceptionBlock:", &stru_1004F2E40));
      if (!v6) {
        goto LABEL_13;
      }
    }

    else
    {
      uint64_t v6 = 0LL;
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitMultiUserSharedDataStore zone](self, "zone"));
    dispatch_queue_attr_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneID]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 ownerName]);

    if (-[ADCloudKitMultiUserSharedDataStore dataStoreIsOnSharedDatabase](self, "dataStoreIsOnSharedDatabase"))
    {
      if (!v9)
      {
LABEL_12:

        goto LABEL_13;
      }

      dispatch_queue_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
      [v10 setMultiUserSharedDataServerChangeToken:v6 forOwnerName:v9];
    }

    else
    {
      dispatch_queue_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
      [v10 setMultiUserSharedDataServerChangeToken:v6];
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    [v11 synchronize];

    goto LABEL_12;
  }

- (void)synchronizeUsingActivity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10014E4AC;
  block[3] = &unk_1004FD9E0;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(serialQueue, block);
}

- (void)synchronizeWithCompletion:(id)a3
{
}

- (void)_synchronizeUsingActivity:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, uint64_t))a4;
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    id v9 = "-[ADCloudKitMultiUserSharedDataStore _synchronizeUsingActivity:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }

  if (v6) {
    v6[2](v6, 1LL);
  }
}

- (void)mergeDataWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4 containsAllChanges:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10014E498;
  block[3] = &unk_1004F95C8;
  block[4] = self;
  id v18 = v10;
  BOOL v21 = a5;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(serialQueue, block);
}

- (void)_mergeDataWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4 containsAllChanges:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v31 = a6;
  id v12 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v13 = v12;
    id v14 = [v10 count];
    id v15 = [v11 count];
    BOOL dataStoreIsOnSharedDatabase = self->_dataStoreIsOnSharedDatabase;
    v17 = @"partial";
    *(_DWORD *)buf = 136316162;
    v39 = "-[ADCloudKitMultiUserSharedDataStore _mergeDataWithModifiedRecords:deletedRecordIDs:containsAllChanges:completion:]";
    if (v7) {
      v17 = @"full";
    }
    id v18 = @"shared";
    __int16 v40 = 2048;
    id v41 = v14;
    __int16 v42 = 2048;
    id v43 = v15;
    __int16 v44 = 2112;
    if (!dataStoreIsOnSharedDatabase) {
      id v18 = @"owner";
    }
    v45 = v17;
    __int16 v46 = 2112;
    v47 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Merging %zd modified records, %zd deleted records, %@ sync, %@",  buf,  0x34u);
  }

  v32 = v11;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v21 = v10;
  id v22 = [v21 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v34;
    do
    {
      for (i = 0LL; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        v27 = (void *)objc_claimAutoreleasedReturnValue([v26 recordType]);
        unsigned __int8 v28 = [v27 isEqualToString:@"AssistantKeyValueRecord"];
        v29 = v19;
        if ((v28 & 1) != 0
          || (unsigned int v30 = [v27 isEqualToString:@"AssistantVoiceTriggerFileAssetRecord"],
              v29 = v20,
              v30))
        {
          -[NSMutableArray addObject:](v29, "addObject:", v26);
        }
      }

      id v23 = [v21 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }

    while (v23);
  }

  -[ADCloudKitMultiUserSharedDataStore setKeyValueRecordsAndVoiceProfile:records:completion:]( self,  "setKeyValueRecordsAndVoiceProfile:records:completion:",  v19,  v20,  v31);
}

- (void)_updateVoiceIDProfilesForSharedUser:(id)a3 iCloudAltDSID:(id)a4 records:(id)a5 isPrimary:(BOOL)a6 isNewUser:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  v17 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v120 = "-[ADCloudKitMultiUserSharedDataStore _updateVoiceIDProfilesForSharedUser:iCloudAltDSID:records:isPrimary:isNe"
           "wUser:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (v9)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    v114[0] = _NSConcreteStackBlock;
    v114[1] = 3221225472LL;
    v114[2] = sub_10014DE20;
    v114[3] = &unk_1004F8F98;
    BOOL v115 = a6;
    [v18 logEventWithType:6111 contextProvider:v114];
  }

  id v19 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v20 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v93 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v90 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v87 = objc_opt_class(&OBJC_CLASS___CKAsset);
  uint64_t v78 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ([v15 count])
  {
    BOOL v70 = a6;
    BOOL v71 = v9;
    v74 = v13;
    v75 = v19;
    v72 = (void (**)(void, void))v16;
    id v73 = v15;
    v77 = v14;
    __int128 v112 = 0u;
    __int128 v113 = 0u;
    __int128 v110 = 0u;
    __int128 v111 = 0u;
    id v21 = v15;
    id v22 = [v21 countByEnumeratingWithState:&v110 objects:v125 count:16];
    if (!v22) {
      goto LABEL_72;
    }
    id v24 = v22;
    uint64_t v25 = *(void *)v111;
    *(void *)&__int128 v23 = 136315650LL;
    __int128 v69 = v23;
    v80 = v20;
    id v92 = v21;
    while (1)
    {
      for (i = 0LL; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v111 != v25) {
          objc_enumerationMutation(v21);
        }
        v27 = *(void **)(*((void *)&v110 + 1) + 8LL * (void)i);
        unsigned __int8 v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "recordType", v69));
        if (([v28 isEqualToString:@"AssistantKeyValueRecord"] & 1) == 0)
        {
          if (([v28 isEqualToString:@"AssistantVoiceTriggerFileAssetRecord"] & 1) == 0)
          {
            v45 = (void *)AFSiriLogContextDaemon;
            if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_70;
            }
            unsigned int v30 = v45;
            __int16 v46 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 recordType]);
            *(_DWORD *)buf = 136315394;
            v120 = "-[ADCloudKitMultiUserSharedDataStore _updateVoiceIDProfilesForSharedUser:iCloudAltDSID:records:isPrim"
                   "ary:isNewUser:completion:]";
            __int16 v121 = 2112;
            v122 = v46;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEBUG,  "%s Unsupported record type : (%@)",  buf,  0x16u);

            goto LABEL_69;
          }

          v29 = (void *)objc_claimAutoreleasedReturnValue([v27 recordID]);
          unsigned int v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 recordName]);

          if (-[os_log_s length](v30, "length"))
          {
            id v31 = (void *)objc_claimAutoreleasedReturnValue([v27 encryptedValuesByKey]);
            v32 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKey:@"fileName"]);
            if ((objc_opt_isKindOfClass(v32, v93) & 1) == 0 || ![v32 length])
            {
              v47 = (os_log_s *)AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v120 = "-[ADCloudKitMultiUserSharedDataStore _updateVoiceIDProfilesForSharedUser:iCloudAltDSID:records:is"
                       "Primary:isNewUser:completion:]";
                __int16 v121 = 2112;
                v122 = v30;
                _os_log_error_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_ERROR,  "%s Record (%@) has invalid file name",  buf,  0x16u);
              }

              goto LABEL_68;
            }

            __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKey:@"fileCompressionType"]);
            v91 = v33;
            if ((objc_opt_isKindOfClass(v33, v90) & 1) != 0)
            {
              if ([v33 unsignedIntegerValue] == (id)2)
              {
                uint64_t v89 = objc_claimAutoreleasedReturnValue([v31 objectForKey:@"fileAssetSize"]);
                if ((objc_opt_isKindOfClass(v89, v90) & 1) == 0)
                {
                  __int128 v34 = (os_log_s *)AFSiriLogContextDaemon;
                  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 136315394;
                    v120 = "-[ADCloudKitMultiUserSharedDataStore _updateVoiceIDProfilesForSharedUser:iCloudAltDSID:record"
                           "s:isPrimary:isNewUser:completion:]";
                    __int16 v121 = 2112;
                    v122 = v30;
                    _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  "%s Record (%@) has invalid file size type",  buf,  0x16u);
                  }
                }

                __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"fileAsset"]);
                v88 = v35;
                if ((objc_opt_isKindOfClass(v35, v87) & 1) != 0)
                {
                  __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v35 fileURL]);
                  v37 = (void *)objc_claimAutoreleasedReturnValue([v36 path]);

                  v82 = v36;
                  if (v37)
                  {
                    v38 = (void *)objc_claimAutoreleasedReturnValue([v36 path]);
                    id v20 = v80;
                    -[NSMutableDictionary setObject:forKey:](v80, "setObject:forKey:", v38, v32);

                    v39 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKey:@"languages"]);
                    v79 = v39;
                    if ((objc_opt_isKindOfClass(v39, v78) & 1) != 0 && [v39 count])
                    {
                      __int128 v108 = 0u;
                      __int128 v109 = 0u;
                      __int128 v106 = 0u;
                      __int128 v107 = 0u;
                      id obj = v39;
                      id v85 = [obj countByEnumeratingWithState:&v106 objects:v118 count:16];
                      if (v85)
                      {
                        uint64_t v83 = *(void *)v107;
LABEL_27:
                        uint64_t v40 = 0LL;
                        while (1)
                        {
                          if (*(void *)v107 != v83) {
                            objc_enumerationMutation(obj);
                          }
                          id v41 = *(void **)(*((void *)&v106 + 1) + 8 * v40);
                          if ((objc_opt_isKindOfClass(v41, v93) & 1) == 0 || ![v41 length]) {
                            break;
                          }
                          if (v85 == (id)++v40)
                          {
                            id v20 = v80;
                            id v85 = [obj countByEnumeratingWithState:&v106 objects:v118 count:16];
                            if (v85) {
                              goto LABEL_27;
                            }
                            goto LABEL_34;
                          }
                        }

                        v60 = (os_log_s *)AFSiriLogContextDaemon;
                        id v20 = v80;
                        v55 = (void *)v89;
                        if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
                          goto LABEL_64;
                        }
                        *(_DWORD *)buf = 136315394;
                        v120 = "-[ADCloudKitMultiUserSharedDataStore _updateVoiceIDProfilesForSharedUser:iCloudAltDSID:re"
                               "cords:isPrimary:isNewUser:completion:]";
                        __int16 v121 = 2112;
                        v122 = v30;
                        v57 = v60;
                        v58 = "%s Record (%@) has invalid language in array";
LABEL_60:
                        _os_log_error_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, v58, buf, 0x16u);
                      }

                      else
                      {
LABEL_34:

                        v86 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKey:@"productType"]);
                        if ((objc_opt_isKindOfClass(v86, v93) & 1) != 0 && [v86 length])
                        {
                          uint64_t v42 = objc_claimAutoreleasedReturnValue([v27 modificationDate]);
                          if (!v42) {
                            uint64_t v42 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
                          }
                          v116[0] = @"modificationDate";
                          v116[1] = @"languages";
                          v84 = (void *)v42;
                          v117[0] = v42;
                          v117[1] = obj;
                          v116[2] = @"productType";
                          v117[2] = v86;
                          id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v117,  v116,  3LL));
                          -[NSMutableDictionary setObject:forKey:](v75, "setObject:forKey:", v43, v30);
                          __int16 v44 = (os_log_s *)AFSiriLogContextDaemon;
                          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)buf = 136315394;
                            v120 = "-[ADCloudKitMultiUserSharedDataStore _updateVoiceIDProfilesForSharedUser:iCloudAltDSI"
                                   "D:records:isPrimary:isNewUser:completion:]";
                            __int16 v121 = 2112;
                            v122 = v43;
                            _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_INFO,  "%s voice record: %@",  buf,  0x16u);
                          }
                        }

                        else
                        {
                          v61 = (os_log_s *)AFSiriLogContextDaemon;
                          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 136315394;
                            v120 = "-[ADCloudKitMultiUserSharedDataStore _updateVoiceIDProfilesForSharedUser:iCloudAltDSI"
                                   "D:records:isPrimary:isNewUser:completion:]";
                            __int16 v121 = 2112;
                            v122 = v30;
                            _os_log_error_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_ERROR,  "%s Record (%@) has invalid product type",  buf,  0x16u);
                          }
                        }

                        v55 = (void *)v89;
                      }
                    }

                    else
                    {
                      v56 = (os_log_s *)AFSiriLogContextDaemon;
                      v55 = (void *)v89;
                      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 136315394;
                        v120 = "-[ADCloudKitMultiUserSharedDataStore _updateVoiceIDProfilesForSharedUser:iCloudAltDSID:re"
                               "cords:isPrimary:isNewUser:completion:]";
                        __int16 v121 = 2112;
                        v122 = v30;
                        v57 = v56;
                        v58 = "%s Record (%@) has invalid language array";
                        goto LABEL_60;
                      }
                    }

- (void)_logRelevantAnalyticsOnMultiUserVoiceProfileDownloadSuccessWithSharedUserID:(id)a3 isPrimary:(BOOL)a4 isNewUser:(BOOL)a5
{
  BOOL v40 = a4;
  BOOL v41 = a5;
  id v5 = a3;
  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v47 = "-[ADCloudKitMultiUserSharedDataStore _logRelevantAnalyticsOnMultiUserVoiceProfileDownloadSuccessWithSharedUser"
          "ID:isPrimary:isNewUser:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  int v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 multiUserSetupStartTimes]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 multiUserSetupCompleteTimes]);

  uint64_t v12 = objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v5]);
  uint64_t v13 = objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v5]);
  if (v12 | v13) {
    BOOL v14 = 0;
  }
  else {
    BOOL v14 = (uint64_t)[(id)v12 longValue] > 0;
  }
  if (v12) {
    BOOL v15 = v13 == 0;
  }
  else {
    BOOL v15 = 0;
  }
  char v16 = v15;
  BOOL v17 = 1LL;
  if (!v14 && (v16 & 1) == 0)
  {
    [(id)v13 doubleValue];
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:"));
    [(id)v13 doubleValue];
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:"));
    BOOL v17 = [v18 compare:v19] == (id)1;
  }

  id v20 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    log = v20;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v41));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v17));
    *(_DWORD *)buf = 136316162;
    v47 = "-[ADCloudKitMultiUserSharedDataStore _logRelevantAnalyticsOnMultiUserVoiceProfileDownloadSuccessWithSharedUser"
          "ID:isPrimary:isNewUser:]";
    __int16 v48 = 2112;
    v49 = v38;
    __int16 v50 = 2112;
    uint64_t v51 = v12;
    __int16 v52 = 2112;
    uint64_t v53 = v13;
    __int16 v54 = 2112;
    v55 = v37;
    _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "%s #multi-user isNewUser:%@, userVoiceIDEnabledStartTime:%@, userVoiceIDEnabledCompleteTime:%@. Should log download success:%@",  buf,  0x34u);

    id v20 = (void *)AFSiriLogContextDaemon;
  }

  if (v17)
  {
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v47 = "-[ADCloudKitMultiUserSharedDataStore _logRelevantAnalyticsOnMultiUserVoiceProfileDownloadSuccessWithSharedUs"
            "erID:isPrimary:isNewUser:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v20,  OS_LOG_TYPE_DEBUG,  "%s #multi-user Logging AFAnalyticsEventTypeMultiUserVoiceProfileDownloadSuccess event on voice profile downloading completion.",  buf,  0xCu);
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v21 timeIntervalSince1970];
    double v23 = v22;

    if (v41)
    {
      if (v40) {
        id v24 = @"owner";
      }
      else {
        id v24 = @"participant";
      }
      v44[0] = @"user";
      v44[1] = @"timestamp";
      v45[0] = v24;
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v23));
      v45[1] = v25;
      v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v45,  v44,  2LL));
      v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v26));

      double v28 = v23 - (double)(uint64_t)[(id)v12 longValue];
      if (v28 > 0.0 && v28 != v23)
      {
        unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
        [v27 setObject:v30 forKeyedSubscript:@"multiuser-voiceid-setup-time"];
      }

      id v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v11));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v23));
      [v31 setObject:v32 forKeyedSubscript:v5];

      __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
      __int128 v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v31));
      [v33 setMultiUserSetUpCompleteTimes:v34];

      AFInternalPreferencesSynchronize();
    }

    else
    {
      v27 = v7;
    }

    __int128 v35 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315395;
      v47 = "-[ADCloudKitMultiUserSharedDataStore _logRelevantAnalyticsOnMultiUserVoiceProfileDownloadSuccessWithSharedUs"
            "erID:isPrimary:isNewUser:]";
      __int16 v48 = 2113;
      v49 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_INFO,  "%s #multi-user Logged AFAnalyticsEventTypeMultiUserVoiceProfileDownloadSuccess event with: %{private}@",  buf,  0x16u);
    }

    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_10014DE0C;
    v42[3] = &unk_1004FD8D0;
    id v7 = v27;
    id v43 = v7;
    [v36 logEventWithType:6107 contextProvider:v42];
  }

  else if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v47 = "-[ADCloudKitMultiUserSharedDataStore _logRelevantAnalyticsOnMultiUserVoiceProfileDownloadSuccessWithSharedUser"
          "ID:isPrimary:isNewUser:]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v20,  OS_LOG_TYPE_INFO,  "%s #multi-user Skipped logging of AFAnalyticsEventTypeMultiUserVoiceProfileDownloadSuccess event",  buf,  0xCu);
  }
}

- (id)_constructRecord:(id)a3 fileArchives:(id)a4 assetManifest:(id)a5 filePath:(id)a6
{
  id v9 = a3;
  id v77 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 version]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 productCategory]);
  BOOL v70 = (void *)objc_claimAutoreleasedReturnValue([v9 languageCode]);
  if (v12 && v13)
  {
    if (v11)
    {
      v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      if (([v75 fileExistsAtPath:v11] & 1) == 0)
      {
        id v88 = 0LL;
        unsigned int v14 = [v75 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:&v88];
        BOOL v15 = (NSMutableArray *)v88;
        if (!v14)
        {
          id obj = v15;
          v62 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            id v92 = "-[ADCloudKitMultiUserSharedDataStore _constructRecord:fileArchives:assetManifest:filePath:]";
            __int16 v93 = 2112;
            id v94 = v11;
            __int16 v95 = 2112;
            v96 = obj;
            _os_log_error_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_ERROR,  "%s Failed to create update location (%@) with error (%@)",  buf,  0x20u);
          }

          uint64_t v63 = 4007LL;
          goto LABEL_57;
        }
      }

      __int128 v86 = 0u;
      __int128 v87 = 0u;
      __int128 v84 = 0u;
      __int128 v85 = 0u;
      char v16 = (NSMutableArray *)v10;
      id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v84,  v90,  16LL);
      __int128 v69 = v12;
      id v65 = v10;
      id v66 = v9;
      v74 = v11;
      BOOL v71 = v13;
      if (v17)
      {
        id v18 = v17;
        char v67 = 0;
        id obj = 0LL;
        uint64_t v19 = *(void *)v85;
        uint64_t v78 = v16;
        while (2)
        {
          id v20 = 0LL;
          id v72 = v18;
          do
          {
            if (*(void *)v85 != v19) {
              objc_enumerationMutation(v16);
            }
            id v21 = *(NSMutableArray **)(*((void *)&v84 + 1) + 8LL * (void)v20);
            double v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectForKey:](v16, "objectForKey:", v21, v65, v66));
            double v23 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray componentsSeparatedByString:]( v21,  "componentsSeparatedByString:",  @","));
            if ([v23 count] == (id)3)
            {
              id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectAtIndexedSubscript:0]);
              [v24 rangeOfString:@"Categ:"];
              uint64_t v26 = v25;

              v27 = (void *)objc_claimAutoreleasedReturnValue([v23 objectAtIndexedSubscript:0]);
              double v28 = (void *)objc_claimAutoreleasedReturnValue([v27 substringFromIndex:v26]);

              v29 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:@"languages"]);
              unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue([v29 objectAtIndex:0]);

              id v31 = (void *)objc_claimAutoreleasedReturnValue([v23 objectAtIndexedSubscript:2]);
              [v31 rangeOfString:@"Vers:"];
              uint64_t v33 = v32;

              __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v23 objectAtIndexedSubscript:2]);
              __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v34 substringFromIndex:v33]);

              if ([v71 isEqualToString:v28]
                && (!v70 || [v70 isEqualToString:v30]))
              {
                id v36 = [v69 integerValue];
                if (v36 == [v35 integerValue])
                {
                  v68 = (void *)objc_claimAutoreleasedReturnValue([v77 objectForKey:v21]);
                  v37 = (void *)objc_claimAutoreleasedReturnValue([v74 stringByAppendingPathComponent:v30]);
                  v38 = (os_log_s *)AFSiriLogContextDaemon;
                  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 136315650;
                    id v92 = "-[ADCloudKitMultiUserSharedDataStore _constructRecord:fileArchives:assetManifest:filePath:]";
                    __int16 v93 = 2112;
                    id v94 = v37;
                    __int16 v95 = 2112;
                    v96 = v21;
                    _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_INFO,  "%s Extracting file to location (%@) with key (%@)",  buf,  0x20u);
                  }

                  uint64_t v39 = objc_claimAutoreleasedReturnValue( -[ADCloudKitMultiUserSharedDataStore _extractRecord:atPath:fileManager:]( self,  "_extractRecord:atPath:fileManager:",  v68,  v37,  v75));
                  if (v39)
                  {
                    uint64_t v42 = (NSMutableArray *)v39;
                    __int16 v46 = (os_log_s *)AFSiriLogContextDaemon;
                    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136315650;
                      id v92 = "-[ADCloudKitMultiUserSharedDataStore _constructRecord:fileArchives:assetManifest:filePath:]";
                      __int16 v93 = 2112;
                      id v94 = v30;
                      __int16 v95 = 2112;
                      v96 = v42;
                      _os_log_error_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_ERROR,  "%s Failed to extract at location (%@) with error (%@)",  buf,  0x20u);
                    }

                    v47 = v78;
                    goto LABEL_60;
                  }

                  char v67 = 1;
                }

                else
                {
                  id v40 = [v35 integerValue];
                  if ((uint64_t)v40 < (uint64_t)[v69 integerValue])
                  {
                    BOOL v41 = obj;
                    if (!obj) {
                      BOOL v41 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
                    }
                    id obj = v41;
                    -[NSMutableArray addObject:](v41, "addObject:", v21);
                  }
                }
              }

              char v16 = v78;
              id v18 = v72;
            }

            id v20 = (char *)v20 + 1;
          }

          while (v18 != v20);
          id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v84,  v90,  16LL);
          if (v18) {
            continue;
          }
          break;
        }

        if ((v67 & 1) != 0)
        {
          uint64_t v42 = 0LL;
          goto LABEL_61;
        }

        id v10 = v65;
        id v9 = v66;
        __int16 v48 = obj;
        id v11 = v74;
        uint64_t v12 = v69;
        uint64_t v13 = v71;
      }

      else
      {

        __int16 v48 = 0LL;
      }

      if (-[NSMutableArray count](v48, "count", v65, v66))
      {
        __int128 v82 = 0u;
        __int128 v83 = 0u;
        __int128 v80 = 0u;
        __int128 v81 = 0u;
        id obj = v48;
        id v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v80,  v89,  16LL);
        if (v49)
        {
          id v50 = v49;
          v79 = v16;
          uint64_t v42 = 0LL;
          uint64_t v51 = *(void *)v81;
          do
          {
            for (i = 0LL; i != v50; i = (char *)i + 1)
            {
              uint64_t v53 = v42;
              if (*(void *)v81 != v51) {
                objc_enumerationMutation(obj);
              }
              __int16 v54 = *(NSMutableArray **)(*((void *)&v80 + 1) + 8LL * (void)i);
              v55 = (void *)objc_claimAutoreleasedReturnValue([v77 objectForKey:v54]);
              v56 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectForKey:](v79, "objectForKey:", v54));
              v57 = (void *)objc_claimAutoreleasedReturnValue([v56 objectForKey:@"languages"]);
              v58 = (void *)objc_claimAutoreleasedReturnValue([v57 objectAtIndex:0]);

              v59 = (void *)objc_claimAutoreleasedReturnValue([v74 stringByAppendingPathComponent:v58]);
              v60 = (os_log_s *)AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315650;
                id v92 = "-[ADCloudKitMultiUserSharedDataStore _constructRecord:fileArchives:assetManifest:filePath:]";
                __int16 v93 = 2112;
                id v94 = v59;
                __int16 v95 = 2112;
                v96 = v54;
                _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_INFO,  "%s Extracting near match to location (%@) with key (%@)",  buf,  0x20u);
              }

              uint64_t v42 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[ADCloudKitMultiUserSharedDataStore _extractRecord:atPath:fileManager:]( self,  "_extractRecord:atPath:fileManager:",  v55,  v59,  v75));

              if (v42)
              {
                v61 = (os_log_s *)AFSiriLogContextDaemon;
                if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  id v92 = "-[ADCloudKitMultiUserSharedDataStore _constructRecord:fileArchives:assetManifest:filePath:]";
                  __int16 v93 = 2112;
                  id v94 = v58;
                  __int16 v95 = 2112;
                  v96 = v42;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_ERROR,  "%s Failed to extract near match at location (%@) with error (%@)",  buf,  0x20u);
                }
              }
            }

            id v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v80,  v89,  16LL);
          }

          while (v50);
        }

        else
        {
          uint64_t v42 = 0LL;
        }

        v47 = obj;
LABEL_60:

LABEL_61:
        id v10 = v65;
        id v9 = v66;
        id v11 = v74;
        uint64_t v12 = v69;
        uint64_t v13 = v71;
        goto LABEL_62;
      }

      id obj = v48;
      uint64_t v63 = 4010LL;
LABEL_57:
      uint64_t v42 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", v63));
LABEL_62:
      v45 = v42;

      goto LABEL_63;
    }

    __int16 v44 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v92 = "-[ADCloudKitMultiUserSharedDataStore _constructRecord:fileArchives:assetManifest:filePath:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "%s Unable to get voice trigger update path",  buf,  0xCu);
    }

    uint64_t v43 = 4006LL;
  }

  else
  {
    uint64_t v43 = 4008LL;
  }

  v45 = (NSMutableArray *)(id)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", v43));
LABEL_63:

  return v45;
}

- (id)_extractRecord:(id)a3 atPath:(id)a4 fileManager:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v9 fileExistsAtPath:v8])
  {
    id v82 = 0LL;
    unsigned __int8 v10 = [v9 removeItemAtPath:v8 error:&v82];
    id v11 = v82;
    uint64_t v12 = v11;
    if ((v10 & 1) == 0)
    {
      double v28 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[ADCloudKitMultiUserSharedDataStore _extractRecord:atPath:fileManager:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v12;
        _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%s Failed to delete archive expansion location with error (%@)",  buf,  0x16u);
      }

      goto LABEL_32;
    }
  }

  id v81 = 0LL;
  unsigned __int8 v13 = [v9 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v81];
  id v14 = v81;
  if ((v13 & 1) == 0)
  {
    uint64_t v26 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ADCloudKitMultiUserSharedDataStore _extractRecord:atPath:fileManager:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v14;
      _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "%s Failed to create archive expansion location with error (%@)",  buf,  0x16u);
    }

    id v27 = v14;
    goto LABEL_30;
  }

  id v79 = v7;
  id v80 = v8;
  BOOL v15 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "_ADCloudKitExtractArchiveToDirectory";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v16 = objc_alloc(&OBJC_CLASS___SZExtractor);
  uint64_t v117 = SZExtractorOptionsDenyInvalidSymlinks;
  v118 = &__kCFBooleanTrue;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v118,  &v117,  1LL));
  id v18 = [v16 initWithPath:v80 options:v17];

  if (!v18)
  {
    v29 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "_ADCloudKitExtractArchiveToDirectory";
      _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "%s Failed to set up streaming unzipper",  buf,  0xCu);
    }

    char v30 = 0;
    goto LABEL_23;
  }

  uint64_t v95 = 0LL;
  v96 = &v95;
  uint64_t v97 = 0x2020000000LL;
  uint64_t v98 = 0LL;
  uint64_t v89 = 0LL;
  uint64_t v90 = &v89;
  uint64_t v91 = 0x3032000000LL;
  id v92 = sub_100071DB4;
  __int16 v93 = sub_100071DC4;
  id v94 = 0LL;
  dispatch_semaphore_t v19 = dispatch_semaphore_create(0LL);
  *(void *)buf = _NSConcreteStackBlock;
  *(void *)&buf[8] = 3221225472LL;
  *(void *)&buf[16] = sub_100071DCC;
  __int128 v113 = &unk_1004EEFE8;
  BOOL v115 = &v89;
  v116 = &v95;
  id v20 = v19;
  v114 = v20;
  [v18 prepareForExtraction:buf];
  dispatch_time_t v21 = dispatch_time(0LL, 10000000000LL);
  uint64_t v78 = v20;
  if (dispatch_semaphore_wait(v20, v21))
  {
    double v22 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 v107 = 136315138;
      *(void *)&v107[4] = "_ADCloudKitExtractArchiveToDirectory";
      double v23 = "%s StreamingZip Error: time out while preparing extractor";
      id v24 = v22;
      uint32_t v25 = 12;
LABEL_73:
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v23, v107, v25);
      goto LABEL_21;
    }

    goto LABEL_21;
  }

  uint64_t v31 = v90[5];
  if (v31)
  {
    uint64_t v32 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 v107 = 136315394;
      *(void *)&v107[4] = "_ADCloudKitExtractArchiveToDirectory";
      *(_WORD *)&v107[12] = 2112;
      *(void *)&v107[14] = v31;
      double v23 = "%s StreamingZip Error: %@";
      id v24 = v32;
      uint32_t v25 = 22;
      goto LABEL_73;
    }

- (id)_cacheDirectory
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:@"com.apple.assistantd/voiceid.cache"]);
  return v5;
}

- (BOOL)_cleanupCacheDirectory
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitMultiUserSharedDataStore _cacheDirectory](self, "_cacheDirectory"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitMultiUserSharedDataStore _cacheDirectory](self, "_cacheDirectory"));
  unsigned int v6 = [v3 fileExistsAtPath:v5];

  if (v6 && ([v3 removeItemAtPath:v4 error:0] & 1) == 0)
  {
    id v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      id v11 = "-[ADCloudKitMultiUserSharedDataStore _cleanupCacheDirectory]";
      __int16 v12 = 2112;
      unsigned __int8 v13 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s Error deleting cache directory at %@",  (uint8_t *)&v10,  0x16u);
    }

    BOOL v7 = 0;
  }

  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (id)_createCacheDirectory
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitMultiUserSharedDataStore _cacheDirectory](self, "_cacheDirectory"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v5 = [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:0];

  if ((v5 & 1) != 0)
  {
    id v6 = v3;
  }

  else
  {
    BOOL v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      int v10 = "-[ADCloudKitMultiUserSharedDataStore _createCacheDirectory]";
      __int16 v11 = 2112;
      __int16 v12 = v3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s Error creating cache directory att %@",  (uint8_t *)&v9,  0x16u);
    }

    id v6 = 0LL;
  }

  return v6;
}

- (void)cleanupCacheDirectory
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10014DE04;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)deleteUserData:(id)a3
{
  BOOL v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[ADCloudKitMultiUserSharedDataStore deleteUserData:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }

  -[ADCloudKitMultiUserSharedDataStore setServerChangeToken:](self, "setServerChangeToken:", 0LL);
}

- (void)fetchDeviceTypesForLanguage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v14 = "-[ADCloudKitMultiUserSharedDataStore fetchDeviceTypesForLanguage:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }

    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10014DC30;
    block[3] = &unk_1004FD9E0;
    block[4] = self;
    id v12 = v7;
    id v11 = v6;
    dispatch_async(serialQueue, block);
  }
}

- (void)fetchDeviceTypesForAllLanguages:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10014DB84;
    block[3] = &unk_1004FC838;
    id v8 = v4;
    dispatch_async(serialQueue, block);
  }
}

- (BOOL)_errorIsRecoverableForPrimary:(int64_t)a3
{
  return a3 == 6000;
}

- (BOOL)_errorIsRecoverableForSecondary:(int64_t)a3
{
  return a3 == 6007;
}

- (BOOL)_errorIsUserNotPresentOnTV:(int64_t)a3
{
  return a3 == 6001;
}

- (id)_homeMembershipsFromUnencryptedRecords:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"meDeviceHomeUserUUID"]);
  if ([v5 count])
  {
    id v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315395;
      __int128 v35 = "-[ADCloudKitMultiUserSharedDataStore _homeMembershipsFromUnencryptedRecords:]";
      __int16 v36 = 2113;
      v37 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Found Version 0 home memberships and adding them: %{private}@",  buf,  0x16u);
    }

    [v4 addEntriesFromDictionary:v5];
  }

  id v24 = v5;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v7 = v3;
  id v8 = [v7 countByEnumeratingWithState:&v29 objects:v40 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v30;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        if ([v12 hasPrefix:@"sharedDeviceHomeUserUUIDPrefix"])
        {
          unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v12]);
          [v4 addEntriesFromDictionary:v13];
          id v14 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315651;
            __int128 v35 = "-[ADCloudKitMultiUserSharedDataStore _homeMembershipsFromUnencryptedRecords:]";
            __int16 v36 = 2112;
            v37 = v12;
            __int16 v38 = 2113;
            uint64_t v39 = v13;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Found home membership with Version 1 record key:%@, record object:%{private}@",  buf,  0x20u);
          }
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v29 objects:v40 count:16];
    }

    while (v9);
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v15 = v7;
  id v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v26;
    do
    {
      for (j = 0LL; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)j);
        if ([v20 hasPrefix:@"v2_sharedDeviceHomeUserUUIDPrefix"])
        {
          dispatch_time_t v21 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v20]);
          [v4 addEntriesFromDictionary:v21];
          double v22 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315651;
            __int128 v35 = "-[ADCloudKitMultiUserSharedDataStore _homeMembershipsFromUnencryptedRecords:]";
            __int16 v36 = 2112;
            v37 = v20;
            __int16 v38 = 2113;
            uint64_t v39 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "%s Found home membership with Version 2 record key:%@, record object:%{private}@",  buf,  0x20u);
          }
        }
      }

      id v17 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }

    while (v17);
  }

  return v4;
}

- (void)setKeyValueRecordsAndVoiceProfile:(id)a3 records:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  uint64_t v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v181 = "-[ADCloudKitMultiUserSharedDataStore setKeyValueRecordsAndVoiceProfile:records:completion:]";
    __int16 v182 = 2048;
    id v183 = [v7 count];
    __int16 v184 = 2048;
    id v185 = [v8 count];
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Modified %zd Key Value Records, %zd Voice Records",  buf,  0x20u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
  uint64_t v12 = objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
  unsigned __int8 v13 = (void *)v12;
  if (v12)
  {
    __int16 v123 = (void *)v12;
    v133 = v11;
    v143 = v9;
    v135 = v8;
    id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v175 = 0u;
    __int128 v176 = 0u;
    __int128 v177 = 0u;
    __int128 v178 = 0u;
    id v141 = v7;
    id obj = v7;
    id v15 = [obj countByEnumeratingWithState:&v175 objects:v179 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v176;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v176 != v17) {
            objc_enumerationMutation(obj);
          }
          dispatch_semaphore_t v19 = *(void **)(*((void *)&v175 + 1) + 8LL * (void)i);
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 recordID]);
          dispatch_time_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 recordName]);

          id v22 = sub_100103288(v19);
          double v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
          uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSString);
          if ((objc_opt_isKindOfClass(v23, v24) & 1) != 0)
          {
            id v25 = v23;
            -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v25, v21);
            __int128 v26 = (os_log_s *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315651;
              v181 = "-[ADCloudKitMultiUserSharedDataStore setKeyValueRecordsAndVoiceProfile:records:completion:]";
              __int16 v182 = 2113;
              id v183 = v25;
              __int16 v184 = 2113;
              id v185 = v21;
              _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "%s Found value (%{private}@) for key (%{private}@)",  buf,  0x20u);
            }
          }

          uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v23, v27) & 1) != 0)
          {
            id v28 = v23;
            -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v28, v21);
            __int128 v29 = (os_log_s *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315651;
              v181 = "-[ADCloudKitMultiUserSharedDataStore setKeyValueRecordsAndVoiceProfile:records:completion:]";
              __int16 v182 = 2113;
              id v183 = v28;
              __int16 v184 = 2113;
              id v185 = v21;
              _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "%s Found value (%{private}@) for key (%{private}@)",  buf,  0x20u);
            }
          }

          uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSData);
          if ((objc_opt_isKindOfClass(v23, v30) & 1) != 0)
          {
            id v31 = v23;
            -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v31, v21);
            __int128 v32 = (os_log_s *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315651;
              v181 = "-[ADCloudKitMultiUserSharedDataStore setKeyValueRecordsAndVoiceProfile:records:completion:]";
              __int16 v182 = 2113;
              id v183 = v31;
              __int16 v184 = 2113;
              id v185 = v21;
              _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_INFO,  "%s Found value (%{private}@) for key (%{private}@)",  buf,  0x20u);
            }
          }

          uint64_t v33 = objc_opt_class(&OBJC_CLASS___NSNumber);
          if ((objc_opt_isKindOfClass(v23, v33) & 1) != 0)
          {
            id v34 = v23;
            -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v34, v21);
            __int128 v35 = (os_log_s *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315651;
              v181 = "-[ADCloudKitMultiUserSharedDataStore setKeyValueRecordsAndVoiceProfile:records:completion:]";
              __int16 v182 = 2113;
              id v183 = v34;
              __int16 v184 = 2113;
              id v185 = v21;
              _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_INFO,  "%s Found value (%{private}@) for key (%{private}@)",  buf,  0x20u);
            }
          }

          uint64_t v36 = objc_opt_class(&OBJC_CLASS___NSArray);
          if ((objc_opt_isKindOfClass(v23, v36) & 1) != 0)
          {
            id v37 = v23;
            -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v37, v21);
            __int16 v38 = (os_log_s *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315651;
              v181 = "-[ADCloudKitMultiUserSharedDataStore setKeyValueRecordsAndVoiceProfile:records:completion:]";
              __int16 v182 = 2113;
              id v183 = v37;
              __int16 v184 = 2113;
              id v185 = v21;
              _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_INFO,  "%s Found value (%{private}@) for key (%{private}@)",  buf,  0x20u);
            }
          }

          uint64_t v39 = objc_opt_class(&OBJC_CLASS___NSNull);
          if ((objc_opt_isKindOfClass(v23, v39) & 1) != 0)
          {
            id v40 = (os_log_s *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315395;
              v181 = "-[ADCloudKitMultiUserSharedDataStore setKeyValueRecordsAndVoiceProfile:records:completion:]";
              __int16 v182 = 2113;
              id v183 = v21;
              _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_INFO,  "%s Found null value for key (%{private}@)",  buf,  0x16u);
            }
          }
        }

        id v16 = [obj countByEnumeratingWithState:&v175 objects:v179 count:16];
      }

      while (v16);
    }

    uint64_t v41 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v14, "objectForKey:", @"meDeviceSharedUserID"));
    if (!v41) {
      uint64_t v41 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v14, "objectForKey:", @"backupSharedUserID"));
    }
    id v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v14, "objectForKey:", @"meDeviceLoggingSharedUserID"));
    if (!v42) {
      id v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v14, "objectForKey:", @"backupLoggingSharedUserID"));
    }
    v144 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v14, "objectForKey:", @"meDeviceiCloudAltDSID"));
    v130 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v14, "objectForKey:", @"meDeviceAudioAppSignals"));
    uint64_t v43 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v14, "objectForKey:", @"meDeviceAssistantID"));
    v139 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v14, "objectForKey:", @"backupAssistantID"));
    uint64_t obja = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v14, "objectForKey:", @"meDeviceLoggingAssistantID"));
    uint64_t v44 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v14, "objectForKey:", @"meDeviceSpeechID"));
    v138 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v14, "objectForKey:", @"backupSpeechID"));
    v128 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v14, "objectForKey:", @"meDeviceIDSIdentifier"));
    v127 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v14, "objectForKey:", @"meProductPrefix"));
    v149 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v14, "objectForKey:", @"meDeviceACEHost"));
    v137 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v14, "objectForKey:", @"backupDeviceACEHost"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v14, "objectForKey:", @"meDeviceCapabilities"));
    int v46 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKey:@"meDeviceSyncMetadataCapability"]);
    uint64_t v47 = objc_opt_class(&OBJC_CLASS___NSNumber);
    v134 = (void *)v41;
    if ((objc_opt_isKindOfClass(v46, v47) & 1) != 0) {
      unsigned int v48 = [v46 BOOLValue];
    }
    else {
      unsigned int v48 = 0;
    }
    id v7 = v141;
    id v49 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKey:@"meDevicePeerToPeerHandoffCapability"]);

    uint64_t v50 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v49, v50) & 1) != 0) {
      unsigned __int8 v120 = [v49 BOOLValue];
    }
    else {
      unsigned __int8 v120 = 0;
    }
    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKey:@"meDeviceAssistantID"]);

    uint64_t v52 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v51, v52) & 1) != 0) {
      uint64_t v53 = v51;
    }
    else {
      uint64_t v53 = 0LL;
    }
    id v131 = v53;
    if ([v131 isEqual:v43])
    {
      if (v48)
      {
        v126 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v14, "objectForKey:", @"meDeviceSyncMetadata"));
        char v117 = 1;
        goto LABEL_56;
      }
    }

    else
    {
      __int16 v54 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v181 = "-[ADCloudKitMultiUserSharedDataStore setKeyValueRecordsAndVoiceProfile:records:completion:]";
        __int16 v182 = 2112;
        id v183 = (id)v43;
        __int16 v184 = 2112;
        id v185 = v131;
        _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_INFO,  "%s AssistantID of companion (%@) does not match assistantID (%@) from capabilities - dropping sync metadata",  buf,  0x20u);
      }

      unsigned __int8 v120 = 0;
    }

    char v117 = 0;
    v126 = 0LL;
LABEL_56:
    v146 = v45;
    v55 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( v14,  "objectForKey:",  @"meDeviceVoiceIDChangedToEnabledTimestamp"));
    v56 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v181 = "-[ADCloudKitMultiUserSharedDataStore setKeyValueRecordsAndVoiceProfile:records:completion:]";
      __int16 v182 = 2112;
      id v183 = v55;
      _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_INFO,  "%s #multi-user - setKeyValueRecordsAndVoiceProfile - syncedVoiceIDEnabledTimestamp: %@",  buf,  0x16u);
    }

    v142 = v55;
    if ([v55 count])
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
      v58 = (void *)objc_claimAutoreleasedReturnValue([v57 multiUserSetupStartTimes]);

      if (v58)
      {
        id v59 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v58));
      }

      else
      {
        id v59 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      }

      v173[0] = _NSConcreteStackBlock;
      v173[1] = 3221225472LL;
      v173[2] = sub_10014C128;
      v173[3] = &unk_1004F56B8;
      id v60 = v59;
      id v174 = v60;
      [v142 enumerateKeysAndObjectsUsingBlock:v173];
      v61 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315395;
        v181 = "-[ADCloudKitMultiUserSharedDataStore setKeyValueRecordsAndVoiceProfile:records:completion:]";
        __int16 v182 = 2113;
        id v183 = v60;
        _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_INFO,  "%s #multi-user Setting multi-user start times to ADPreferences: %{private}@",  buf,  0x16u);
      }

      v62 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
      [v62 setMultiUserSetUpStartTimes:v60];
    }

    uint64_t v63 = v43 | v44 | obja;
    BOOL v136 = v63 != 0;
    if (!v63)
    {
      uint64_t v43 = v139;
      uint64_t v44 = v138;
      id v64 = v137;

      id v65 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v181 = "-[ADCloudKitMultiUserSharedDataStore setKeyValueRecordsAndVoiceProfile:records:completion:]";
        _os_log_debug_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEBUG, "%s Device is not meDevice", buf, 0xCu);
      }

      v149 = v64;
    }

    uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKey:@"meDevice"]);

    uint64_t v67 = objc_opt_class(&OBJC_CLASS___NSNumber);
    v132 = (void *)v43;
    v122 = v66;
    if ((objc_opt_isKindOfClass(v66, v67) & 1) != 0) {
      unsigned __int8 v116 = [v66 BOOLValue];
    }
    else {
      unsigned __int8 v116 = 1;
    }
    v125 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v14, "objectForKey:", @"siriLanguage"));
    v124 = (void *)objc_claimAutoreleasedReturnValue( -[ADCloudKitMultiUserSharedDataStore _homeMembershipsFromUnencryptedRecords:]( self,  "_homeMembershipsFromUnencryptedRecords:",  v14));
    v68 = (void *)objc_claimAutoreleasedReturnValue([v124 allKeys]);
    v140 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v68));

    __int128 v69 = v14;
    __int16 v121 = v42;
    v129 = (void *)v44;
    if (!v69)
    {
      id v70 = 0LL;
      id v11 = v133;
      goto LABEL_112;
    }

    id v70 = objc_alloc_init(&OBJC_CLASS___SAHomeMemberSettings);
    v118 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v69, "objectForKey:", @"meCountryCode"));
    objc_msgSend(v70, "setCountryCode:");
    BOOL v71 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v69, "objectForKey:", @"meCard"));
    if (v71) {
      BOOL v72 = v136;
    }
    else {
      BOOL v72 = 0;
    }
    if (v72
      || (uint64_t v73 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v69, "objectForKey:", @"backupMeCard")),
          v71,
          (BOOL v71 = (void *)v73) != 0LL))
    {
      v74 = (void *)objc_claimAutoreleasedReturnValue(+[AceObject aceObjectWithPlistData:](&OBJC_CLASS___AceObject, "aceObjectWithPlistData:", v71));
      v75 = (os_log_s *)AFSiriLogContextDaemonAce;
      if (os_log_type_enabled(AFSiriLogContextDaemonAce, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v181 = "saHomeMemberSettingsFromCloud";
        __int16 v182 = 2112;
        id v183 = v74;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_DEBUG,  "%s SAPerson object is (%@)",  buf,  0x16u);
      }

      [v70 setMeCard:v74];
    }

    v119 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v69, "objectForKey:", @"meParentalRestrictions"));
    objc_msgSend(v70, "setParentalRestrictions:");
    dispatch_semaphore_t v76 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v69, "objectForKey:", @"mePreferredLanguage"));
    [v70 setPreferredLanguage:v76];
    int v77 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v69, "objectForKey:", @"meRegion"));
    [v70 setRegion:v77];
    uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v69, "objectForKey:", @"meTemperatureUnit"));
    [v70 setTemperatureUnit:v78];
    id v79 = (os_log_s *)AFSiriLogContextDaemonAce;
    if (os_log_type_enabled(AFSiriLogContextDaemonAce, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316162;
      v181 = "saHomeMemberSettingsFromCloud";
      __int16 v182 = 2112;
      id v183 = v119;
      __int16 v184 = 2112;
      id v185 = v76;
      __int16 v186 = 2112;
      v187 = v77;
      __int16 v188 = 2112;
      v189 = v78;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v79,  OS_LOG_TYPE_DEBUG,  "%s parentalRestrictions = (%@), preferredLanguage = (%@), region = (%@), temperatureUnit = (%@)",  buf,  0x34u);
    }

    id v80 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v69, "objectForKey:", @"meTTSVoice"));
    if (v80)
    {
      id v81 = (void *)objc_claimAutoreleasedReturnValue(+[AceObject aceObjectWithPlistData:](&OBJC_CLASS___AceObject, "aceObjectWithPlistData:", v80));
      id v82 = (os_log_s *)AFSiriLogContextDaemonAce;
      if (os_log_type_enabled(AFSiriLogContextDaemonAce, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v181 = "saHomeMemberSettingsFromCloud";
        __int16 v182 = 2112;
        id v183 = v81;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v82,  OS_LOG_TYPE_DEBUG,  "%s ttsVoice object is (%@)",  buf,  0x16u);
      }

      [v70 setTtsVoice:v81];
    }

    uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v69, "objectForKey:", @"twentyFourHourTimeDisplay"));
    if (v83)
    {
      uint64_t v84 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v83, v84) & 1) != 0)
      {
        id v85 = v83;
        if ([v85 integerValue])
        {
          if ([v85 integerValue] != (id)1)
          {
            id v115 = [v85 integerValue];
            log = (os_log_s *)AFSiriLogContextDaemonAce;
            BOOL v91 = os_log_type_enabled(AFSiriLogContextDaemonAce, OS_LOG_TYPE_DEBUG);
            if (v115 == (id)-1LL)
            {
              if (v91)
              {
                *(_DWORD *)buf = 136315138;
                v181 = "saHomeMemberSettingsFromCloud";
                _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "%s companion has twentyFourHourTimeDisplay set to nil, forcing this communal device's twentyFourHourTimeDisplay to NO",  buf,  0xCu);
              }

              objc_msgSend(v70, "setTwentyFourHourTimeDisplay:", &__kCFBooleanFalse, log);
            }

            else if (v91)
            {
              *(_DWORD *)buf = 136315138;
              v181 = "saHomeMemberSettingsFromCloud";
              _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "%s twentyForHourTimeDisplay should be -1, 0, or 1",  buf,  0xCu);
            }

            goto LABEL_110;
          }

          __int128 v86 = (os_log_s *)AFSiriLogContextDaemonAce;
          if (os_log_type_enabled(AFSiriLogContextDaemonAce, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            v181 = "saHomeMemberSettingsFromCloud";
            _os_log_debug_impl( (void *)&_mh_execute_header,  v86,  OS_LOG_TYPE_DEBUG,  "%s companion set twentyFourHourTimeDisplay to YES",  buf,  0xCu);
          }

          __int128 v87 = &__kCFBooleanTrue;
        }

        else
        {
          uint64_t v90 = (os_log_s *)AFSiriLogContextDaemonAce;
          if (os_log_type_enabled(AFSiriLogContextDaemonAce, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            v181 = "saHomeMemberSettingsFromCloud";
            _os_log_debug_impl( (void *)&_mh_execute_header,  v90,  OS_LOG_TYPE_DEBUG,  "%s companion set twentyFourHourTimeDisplay to NO",  buf,  0xCu);
          }

          __int128 v87 = &__kCFBooleanFalse;
        }

        [v70 setTwentyFourHourTimeDisplay:v87];
        id v9 = v143;
LABEL_110:

        goto LABEL_111;
      }

      id v88 = (os_log_s *)AFSiriLogContextDaemonAce;
      if (os_log_type_enabled(AFSiriLogContextDaemonAce, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v181 = "saHomeMemberSettingsFromCloud";
        uint64_t v89 = "%s twentyForHourTimeDisplay should be NSNumber Integer";
        goto LABEL_99;
      }
    }

    else
    {
      id v88 = (os_log_s *)AFSiriLogContextDaemonAce;
      if (os_log_type_enabled(AFSiriLogContextDaemonAce, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v181 = "saHomeMemberSettingsFromCloud";
        uint64_t v89 = "%s companion did not set its twentyFourHourTimeDisplay";
LABEL_99:
        _os_log_debug_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEBUG, v89, buf, 0xCu);
      }
    }

- (BOOL)dataStoreIsOnSharedDatabase
{
  return self->_dataStoreIsOnSharedDatabase;
}

- (void)setDataStoreIsOnSharedDatabase:(BOOL)a3
{
  self->_BOOL dataStoreIsOnSharedDatabase = a3;
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

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (NSArray)supportedRecordTypes
{
  return self->_supportedRecordTypes;
}

- (void)setSupportedRecordTypes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end