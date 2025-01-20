@interface ADCloudKitAccountStatusDataStore
- (ADCloudKitAccountStatusDataStore)init;
- (BOOL)cloudSyncEnabled;
- (BOOL)dataStoreIsOnSharedDatabase;
- (BOOL)dataStoreShouldMirrorData;
- (BOOL)hasSetUpRecordZoneSubscription;
- (BOOL)isMirroredDataStore;
- (CKRecordZone)zone;
- (CKServerChangeToken)serverChangeToken;
- (NSArray)supportedRecordTypes;
- (void)deleteUserData:(id)a3;
- (void)fetchDeviceTypesForAllLanguages:(id)a3;
- (void)fetchDeviceTypesForLanguage:(id)a3 completion:(id)a4;
- (void)mergeDataWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4 containsAllChanges:(BOOL)a5 completion:(id)a6;
- (void)setCloudSyncEnabled:(BOOL)a3;
- (void)setDataStoreIsOnSharedDatabase:(BOOL)a3;
- (void)setDataStoreShouldMirrorData:(BOOL)a3;
- (void)setHasSetUpRecordZoneSubscription:(BOOL)a3;
- (void)setIsMirroredDataStore:(BOOL)a3;
- (void)setServerChangeToken:(id)a3;
- (void)setSupportedRecordTypes:(id)a3;
- (void)setZone:(id)a3;
- (void)synchronizeUsingActivity:(id)a3 completion:(id)a4;
- (void)synchronizeWithCompletion:(id)a3;
@end

@implementation ADCloudKitAccountStatusDataStore

- (ADCloudKitAccountStatusDataStore)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ADCloudKitAccountStatusDataStore;
  v2 = -[ADCloudKitAccountStatusDataStore init](&v7, "init");
  if (v2)
  {
    v8 = @"AssistantKeyValueRecord";
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
    supportedRecordTypes = v2->_supportedRecordTypes;
    v2->_supportedRecordTypes = (NSArray *)v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    v2->_cloudSyncEnabled = [v5 cloudSyncEnabled];
  }

  return v2;
}

- (BOOL)hasSetUpRecordZoneSubscription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  unsigned __int8 v3 = [v2 hasSetUpAccountStatusRecordZoneSubscription];

  return v3;
}

- (void)setHasSetUpRecordZoneSubscription:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  [v4 setHasSetUpAccountStatusRecordZoneSubscription:v3];

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  [v5 synchronize];
}

- (CKServerChangeToken)serverChangeToken
{
  if (-[ADCloudKitAccountStatusDataStore isMirroredDataStore](self, "isMirroredDataStore"))
  {
    v2 = 0LL;
  }

  else
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accountStatusServerChangeToken]);

    v2 = (void *)objc_claimAutoreleasedReturnValue( +[CKServerChangeToken ad_unarchiveTokenFromData:withExceptionBlock:]( &OBJC_CLASS___CKServerChangeToken,  "ad_unarchiveTokenFromData:withExceptionBlock:",  v4,  &stru_1004FCE38));
  }

  return (CKServerChangeToken *)v2;
}

- (void)setServerChangeToken:(id)a3
{
  id v7 = a3;
  if (!-[ADCloudKitAccountStatusDataStore isMirroredDataStore](self, "isMirroredDataStore"))
  {
    if (v7)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ad_archiveTokenToDataWithExceptionBlock:", &stru_1004FCE58));
      if (!v4) {
        goto LABEL_7;
      }
    }

    else
    {
      v4 = 0LL;
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    [v5 setAccountStatusServerChangeToken:v4];

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    [v6 synchronize];
  }

- (void)synchronizeWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned int v6 = [v5 cloudSyncEnabled];

  if (self->_cloudSyncEnabled != v6)
  {
    self->_cloudSyncEnabled = v6;
    if (v6)
    {
      unsigned __int8 v7 = -[ADCloudKitAccountStatusDataStore isMirroredDataStore](self, "isMirroredDataStore");
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADCloudKitManager sharedManager](&OBJC_CLASS___ADCloudKitManager, "sharedManager"));
      v9 = v8;
      if ((v7 & 1) != 0)
      {
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472LL;
        v10[2] = sub_100340654;
        v10[3] = &unk_1004FCEE8;
        id v11 = v4;
        [v9 saveCloudSyncEnabledRecord:1 mirror:1 completion:v10];

        goto LABEL_8;
      }

      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_1003405F8;
      v12[3] = &unk_1004FCEC0;
      v12[4] = self;
      [v8 saveCloudSyncEnabledRecord:1 mirror:0 completion:v12];
    }
  }

  if (v4) {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1LL);
  }
LABEL_8:
}

- (void)mergeDataWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4 containsAllChanges:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v14 = v13;
    id v15 = [v10 count];
    id v16 = [v11 count];
    v17 = @"partial";
    *(_DWORD *)buf = 136315906;
    v54 = "-[ADCloudKitAccountStatusDataStore mergeDataWithModifiedRecords:deletedRecordIDs:containsAllChanges:completion:]";
    id v56 = v15;
    __int16 v55 = 2048;
    if (v7) {
      v17 = @"full";
    }
    __int16 v57 = 2048;
    id v58 = v16;
    __int16 v59 = 2112;
    v60 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Merging %zd modified records, %zd deleted records, %@ sync",  buf,  0x2Au);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned __int8 v19 = [v18 cloudSyncEnabled];
  self->_cloudSyncEnabled = v19;
  if ((v19 & 1) != 0)
  {
    v44 = (void (**)(void, void))v12;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    id v20 = v10;
    id v21 = [v20 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v21)
    {
      id v42 = v10;
      v43 = v18;
      id v41 = v11;
      uint64_t v22 = *(void *)v48;
LABEL_8:
      uint64_t v23 = 0LL;
      while (1)
      {
        if (*(void *)v48 != v22) {
          objc_enumerationMutation(v20);
        }
        v24 = *(void **)(*((void *)&v47 + 1) + 8 * v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "recordType", v41, v42));
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_supportedRecordTypes, "firstObject"));
        unsigned __int8 v27 = [v25 isEqualToString:v26];

        if ((v27 & 1) != 0)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue([v24 recordID]);
          v29 = (void *)objc_claimAutoreleasedReturnValue([v28 recordName]);

          if ([v29 length])
          {
            if ([v29 isEqualToString:@"SyncEnabled"])
            {
              id v21 = v24;

              if (!v21)
              {
                char v34 = 0;
                id v11 = v41;
                id v10 = v42;
                v18 = v43;
                goto LABEL_31;
              }

              v51[0] = objc_opt_class(&OBJC_CLASS___NSNumber);
              v51[1] = objc_opt_class(&OBJC_CLASS___NSString);
              v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v51,  2LL));
              v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v35));
              id v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "_ad_dataOfClasses:", v36));

              id v11 = v41;
              id v10 = v42;
              v18 = v43;
              v37 = (void *)objc_claimAutoreleasedReturnValue([v43 cloudSyncEnabledModificationDate]);
              if (v37)
              {
                v38 = (void *)objc_claimAutoreleasedReturnValue([v21 modificationDate]);
                v39 = v38;
                if (!v38 || [v38 compare:v37] == (id)1)
                {
                  [v43 setCloudSyncEnabled:0];

                  goto LABEL_41;
                }

                v40 = (void *)objc_claimAutoreleasedReturnValue(+[ADCloudKitManager sharedManager](&OBJC_CLASS___ADCloudKitManager, "sharedManager"));
                v45[0] = _NSConcreteStackBlock;
                v45[1] = 3221225472LL;
                v45[2] = sub_10034057C;
                v45[3] = &unk_1004FCF10;
                v45[4] = self;
                v46 = v44;
                char v34 = 1;
                [v40 saveCloudSyncEnabledRecord:1 mirror:0 completion:v45];

                v18 = v43;
              }

              else
              {
                [v43 setCloudSyncEnabled:0];
LABEL_41:
                +[ADCloudKitManager _setAppleAccountSiriStateEnabled:withCompletion:]( &OBJC_CLASS___ADCloudKitManager,  "_setAppleAccountSiriStateEnabled:withCompletion:",  0LL,  0LL);
                char v34 = 0;
              }

              goto LABEL_29;
            }
          }

          else
          {
            v33 = (os_log_s *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v54 = "-[ADCloudKitAccountStatusDataStore mergeDataWithModifiedRecords:deletedRecordIDs:containsAllChanges:completion:]";
              __int16 v55 = 2112;
              id v56 = v24;
              _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_INFO,  "%s Modified record is lacking a name : (%@)",  buf,  0x16u);
            }
          }
        }

        else
        {
          v30 = (void *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            v31 = v30;
            v32 = (void *)objc_claimAutoreleasedReturnValue([v24 recordType]);
            *(_DWORD *)buf = 136315394;
            v54 = "-[ADCloudKitAccountStatusDataStore mergeDataWithModifiedRecords:deletedRecordIDs:containsAllChanges:completion:]";
            __int16 v55 = 2112;
            id v56 = v32;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "%s Unsupported record type : (%@)",  buf,  0x16u);
          }
        }

        if (v21 == (id)++v23)
        {
          id v21 = [v20 countByEnumeratingWithState:&v47 objects:v52 count:16];
          if (v21) {
            goto LABEL_8;
          }
          char v34 = 0;
          id v11 = v41;
          id v10 = v42;
          v18 = v43;
          goto LABEL_29;
        }
      }
    }

    char v34 = 0;
LABEL_29:

LABEL_31:
    id v12 = v44;
    if (v44 && (v34 & 1) == 0) {
      v44[2](v44, 0LL);
    }
  }

  else if (v12)
  {
    (*((void (**)(id, void))v12 + 2))(v12, 0LL);
  }
}

- (void)deleteUserData:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    unsigned int v6 = "-[ADCloudKitAccountStatusDataStore deleteUserData:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }

  -[ADCloudKitAccountStatusDataStore setServerChangeToken:](self, "setServerChangeToken:", 0LL);
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

- (BOOL)cloudSyncEnabled
{
  return self->_cloudSyncEnabled;
}

- (void)setCloudSyncEnabled:(BOOL)a3
{
  self->_cloudSyncEnabled = a3;
}

- (void).cxx_destruct
{
}

@end