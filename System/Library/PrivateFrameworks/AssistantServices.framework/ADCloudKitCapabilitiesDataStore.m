@interface ADCloudKitCapabilitiesDataStore
- (ADCloudKitCapabilitiesDataStore)initWithHelper:(id)a3;
- (BOOL)dataStoreIsOnSharedDatabase;
- (BOOL)dataStoreShouldMirrorData;
- (BOOL)hasSetUpRecordZoneSubscription;
- (BOOL)isMirroredDataStore;
- (CKRecordZone)zone;
- (CKServerChangeToken)serverChangeToken;
- (NSArray)supportedRecordTypes;
- (id)_addMissingColumnsForTable:(id)a3 withDescription:(id)a4 inDatabase:(id)a5;
- (id)_databasePath;
- (id)_fetchSQLiteRecordsOwnedByLocalDeviceFromTable:(id)a3;
- (id)_preparedDatabaseWithError:(id *)a3;
- (void)_deleteSQLiteRecordsWithCriterion:(id)a3 inTable:(id)a4;
- (void)_writeSQLiteRecords:(id)a3 toTable:(id)a4;
- (void)fetchDeviceTypesForAllLanguages:(id)a3;
- (void)fetchDeviceTypesForLanguage:(id)a3 completion:(id)a4;
- (void)mergeDataWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4 containsAllChanges:(BOOL)a5 completion:(id)a6;
- (void)setDataStoreIsOnSharedDatabase:(BOOL)a3;
- (void)setDataStoreShouldMirrorData:(BOOL)a3;
- (void)setHasSetUpRecordZoneSubscription:(BOOL)a3;
- (void)setIsMirroredDataStore:(BOOL)a3;
- (void)setServerChangeToken:(id)a3;
- (void)setZone:(id)a3;
- (void)synchronizeUsingActivity:(id)a3 completion:(id)a4;
- (void)synchronizeWithCompletion:(id)a3;
@end

@implementation ADCloudKitCapabilitiesDataStore

- (ADCloudKitCapabilitiesDataStore)initWithHelper:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADCloudKitCapabilitiesDataStore;
  v6 = -[ADCloudKitCapabilitiesDataStore init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_helper, a3);
  }

  return v7;
}

- (id)_databasePath
{
  id v2 = +[ADAudioFileWriter _savedAudioFilesDirectory]_0();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 URLByAppendingPathComponent:@"capabilities.db"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);

  return v5;
}

- (id)_preparedDatabaseWithError:(id *)a3
{
  if (a3) {
    *a3 = 0LL;
  }
  database = self->_database;
  if (database) {
    goto LABEL_4;
  }
  location = (id *)&self->_database;
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[ADCloudKitCapabilitiesDataStore _databasePath](self, "_databasePath"));
  v8 = (os_log_t *)&AFSiriLogContextDaemon;
  objc_super v9 = (os_log_s *)AFSiriLogContextDaemon;
  v56 = a3;
  v55 = self;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v65 = "-[ADCloudKitCapabilitiesDataStore _preparedDatabaseWithError:]";
    __int16 v66 = 2112;
    v67 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s path: %@", buf, 0x16u);
  }

  v10 = 0LL;
  id v11 = 0LL;
  v12 = 0LL;
  v13 = &OBJC_CLASS___NSPredicate_ptr;
  v14 = (os_log_t *)&AFSiriLogContextAnalytics;
  do
  {
    v15 = v11;
    id v11 = [objc_alloc((Class)v13[478]) initWithPath:v7 dataProtectionClass:2 options:3];

    id v62 = 0LL;
    unsigned int v16 = [v11 openWithError:&v62];
    v17 = (__CFString *)v62;
    if (v16)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      unsigned int v19 = [v18 fileExistsAtPath:v7];

      v20 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v65 = "-[ADCloudKitCapabilitiesDataStore _preparedDatabaseWithError:]";
        __int16 v66 = 2112;
        v67 = v7;
        __int16 v68 = 1024;
        LODWORD(v69) = v19;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "%s Database created at %@: %d",  buf,  0x1Cu);
        if (v17) {
          goto LABEL_17;
        }
        goto LABEL_14;
      }

- (id)_addMissingColumnsForTable:(id)a3 withDescription:(id)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v44 = a5;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v7 columns]);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v9 count]));

  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id v43 = v7;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 columns]);
  id v12 = [v11 countByEnumeratingWithState:&v54 objects:v68 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v55;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v55 != v14) {
          objc_enumerationMutation(v11);
        }
        unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v54 + 1) + 8 * (void)i) name]);
        [v10 addObject:v16];
      }

      id v13 = [v11 countByEnumeratingWithState:&v54 objects:v68 count:16];
    }

    while (v13);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([v8 columns]);
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v17 count]));

  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  v42 = v8;
  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v8 columns]);
  id v20 = [v19 countByEnumeratingWithState:&v50 objects:v67 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v51;
    do
    {
      for (j = 0LL; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v51 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)j);
        unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v24 name]);
        unsigned __int8 v26 = [v10 containsObject:v25];

        if ((v26 & 1) == 0) {
          [v18 addObject:v24];
        }
      }

      id v21 = [v19 countByEnumeratingWithState:&v50 objects:v67 count:16];
    }

    while (v21);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue([v43 name]);
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id v28 = v18;
  id v29 = [v28 countByEnumeratingWithState:&v46 objects:v66 count:16];
  if (v29)
  {
    id v30 = v29;
    id v31 = 0LL;
    uint64_t v32 = *(void *)v47;
    while (2)
    {
      v33 = 0LL;
      v34 = v31;
      do
      {
        if (*(void *)v47 != v32) {
          objc_enumerationMutation(v28);
        }
        v35 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)v33);
        id v45 = v34;
        unsigned __int8 v36 = [v44 alterTableWithName:v27 addColumn:v35 error:&v45];
        id v31 = v45;

        if ((v36 & 1) == 0)
        {
          v37 = (void *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            id v40 = v37;
            id v41 = (void *)objc_claimAutoreleasedReturnValue([v35 name]);
            *(_DWORD *)buf = 136315906;
            id v59 = "-[ADCloudKitCapabilitiesDataStore _addMissingColumnsForTable:withDescription:inDatabase:]";
            __int16 v60 = 2112;
            id v61 = v41;
            __int16 v62 = 2112;
            v63 = v27;
            __int16 v64 = 2112;
            id v65 = v31;
            _os_log_error_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "%s Failed to add column '%@' to '%@' table with error %@",  buf,  0x2Au);
          }

          id v38 = v31;

          goto LABEL_31;
        }

        v33 = (char *)v33 + 1;
        v34 = v31;
      }

      while (v30 != v33);
      id v30 = [v28 countByEnumeratingWithState:&v46 objects:v66 count:16];
      if (v30) {
        continue;
      }
      break;
    }
  }

  else
  {
    id v31 = 0LL;
  }

  id v38 = v31;
LABEL_31:

  return v38;
}

- (id)_fetchSQLiteRecordsOwnedByLocalDeviceFromTable:(id)a3
{
  id v4 = a3;
  id v21 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[ADCloudKitCapabilitiesDataStore _preparedDatabaseWithError:]( self,  "_preparedDatabaseWithError:",  &v21));
  id v6 = v21;
  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADDeviceCircleManager sharedInstance](&OBJC_CLASS___ADDeviceCircleManager, "sharedInstance"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localPeerInfo]);
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 idsDeviceUniqueIdentifier]);

    v10 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreSQLiteQueryCriterion isQueryCriterionWithColumnName:value:negation:]( &OBJC_CLASS___SiriCoreSQLiteQueryCriterion,  "isQueryCriterionWithColumnName:value:negation:",  @"device_id",  v9,  0LL));
    id v11 = sub_100198480(v4, @"device_id");
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[_ADCloudKitCapabilitiesDataStoreHelper recordBuilder](self->_helper, "recordBuilder"));
    id v20 = v6;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( [v5 selectRecordsFromTableWithName:v4 columnNames:0 behavior:0 indexedBy:v12 criterion:v10 order:0 range:0 recordBuilder:v13 error:&v20]);
    id v15 = v20;

    if (v15)
    {
      unsigned int v16 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "-[ADCloudKitCapabilitiesDataStore _fetchSQLiteRecordsOwnedByLocalDeviceFromTable:]";
        __int16 v24 = 2112;
        id v25 = v15;
        _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s Failed to select database records due to error %@",  buf,  0x16u);
      }

      id v17 = 0LL;
    }

    else
    {
      id v17 = v14;
    }
  }

  else
  {
    v18 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[ADCloudKitCapabilitiesDataStore _fetchSQLiteRecordsOwnedByLocalDeviceFromTable:]";
      __int16 v24 = 2112;
      id v25 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s Error preparing the database: %@",  buf,  0x16u);
    }

    id v17 = 0LL;
    id v15 = v6;
  }

  return v17;
}

- (void)_writeSQLiteRecords:(id)a3 toTable:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v42 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[ADCloudKitCapabilitiesDataStore _preparedDatabaseWithError:]( self,  "_preparedDatabaseWithError:",  &v42));
  id v9 = v42;
  id v10 = v9;
  if (v8)
  {
    id v41 = v9;
    unsigned __int8 v11 = [v8 beginTransactionWithError:&v41];
    id v12 = v41;

    if ((v11 & 1) != 0)
    {
      id v31 = v12;
      id v13 = [v6 mutableCopy];
      if ([v13 count])
      {
        uint64_t v32 = v13;
        do
        {
          context = objc_autoreleasePoolPush();
          if ((unint64_t)[v13 count] >= 0x11)
          {
            id v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "subarrayWithRange:", 0, 16));
            objc_msgSend(v13, "removeObjectsInRange:", 0, 16);
          }

          else
          {
            id v14 = [v13 copy];
            [v13 removeAllObjects];
          }

          __int128 v39 = 0u;
          __int128 v40 = 0u;
          __int128 v37 = 0u;
          __int128 v38 = 0u;
          id v15 = v14;
          id v16 = [v15 countByEnumeratingWithState:&v37 objects:v51 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v38;
            do
            {
              unsigned int v19 = 0LL;
              do
              {
                if (*(void *)v38 != v18) {
                  objc_enumerationMutation(v15);
                }
                id v20 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)v19);
                id v36 = 0LL;
                unsigned __int8 v21 = [v8 insertIntoTableWithName:v7 record:v20 error:&v36];
                id v22 = v36;
                if ((v21 & 1) == 0)
                {
                  v23 = (os_log_s *)AFSiriLogContextAnalytics;
                  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315906;
                    id v44 = "-[ADCloudKitCapabilitiesDataStore _writeSQLiteRecords:toTable:]";
                    __int16 v45 = 2112;
                    id v46 = v20;
                    __int16 v47 = 2112;
                    id v48 = v7;
                    __int16 v49 = 2112;
                    id v50 = v22;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%s Failed to insert event record %@ into %@ table due to error %@",  buf,  0x2Au);
                  }
                }

                unsigned int v19 = (char *)v19 + 1;
              }

              while (v17 != v19);
              id v17 = [v15 countByEnumeratingWithState:&v37 objects:v51 count:16];
            }

            while (v17);
          }

          objc_autoreleasePoolPop(context);
          id v13 = v32;
        }

        while ([v32 count]);
      }

      id v35 = v31;
      unsigned __int8 v24 = [v8 commitTransactionWithError:&v35];
      id v10 = v35;

      if ((v24 & 1) == 0)
      {
        id v25 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          id v44 = "-[ADCloudKitCapabilitiesDataStore _writeSQLiteRecords:toTable:]";
          __int16 v45 = 2112;
          id v46 = v10;
          _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "%s Failed to commit database transaction due to error %@",  buf,  0x16u);
        }

        id v34 = 0LL;
        unsigned __int8 v26 = [v8 rollbackTransactionWithError:&v34];
        id v27 = v34;
        if ((v26 & 1) == 0)
        {
          id v28 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            id v44 = "-[ADCloudKitCapabilitiesDataStore _writeSQLiteRecords:toTable:]";
            __int16 v45 = 2112;
            id v46 = v27;
            _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%s Failed to rollback database transaction due to error %@",  buf,  0x16u);
          }
        }
      }
    }

    else
    {
      id v30 = (os_log_s *)AFSiriLogContextAnalytics;
      if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v44 = "-[ADCloudKitCapabilitiesDataStore _writeSQLiteRecords:toTable:]";
        __int16 v45 = 2112;
        id v46 = v12;
        _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "%s Failed to begin database transaction due to error %@",  buf,  0x16u);
      }

      id v10 = v12;
    }
  }

  else
  {
    id v29 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v44 = "-[ADCloudKitCapabilitiesDataStore _writeSQLiteRecords:toTable:]";
      __int16 v45 = 2112;
      id v46 = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "%s Failed to prepare database: %@",  buf,  0x16u);
    }
  }
}

- (void)_deleteSQLiteRecordsWithCriterion:(id)a3 inTable:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v16 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[ADCloudKitCapabilitiesDataStore _preparedDatabaseWithError:]( self,  "_preparedDatabaseWithError:",  &v16));
  id v9 = v16;
  id v10 = v9;
  if (v8)
  {
    id v15 = v9;
    unsigned __int8 v11 = [v8 deleteFromTableWithName:v7 indexedBy:0 criterion:v6 error:&v15];
    id v12 = v15;

    if ((v11 & 1) == 0)
    {
      id v13 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v18 = "-[ADCloudKitCapabilitiesDataStore _deleteSQLiteRecordsWithCriterion:inTable:]";
        __int16 v19 = 2112;
        id v20 = v12;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Failed to delete database records due to error %@",  buf,  0x16u);
      }
    }

    id v10 = v12;
  }

  else
  {
    id v14 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v18 = "-[ADCloudKitCapabilitiesDataStore _deleteSQLiteRecordsWithCriterion:inTable:]";
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s Failed to prepare database: %@",  buf,  0x16u);
    }
  }
}

- (void)synchronizeWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADCloudKitManager sharedManager](&OBJC_CLASS___ADCloudKitManager, "sharedManager"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_ADCloudKitCapabilitiesDataStoreHelper recordZoneName](self->_helper, "recordZoneName"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10019836C;
  v10[3] = &unk_1004FCF10;
  unsigned __int8 v11 = v5;
  id v12 = v4;
  id v8 = v4;
  id v9 = v5;
  [v6 saveRecordsWithDictionary:v9 inZone:v7 completion:v10];
}

- (void)synchronizeUsingActivity:(id)a3 completion:(id)a4
{
}

- (void)mergeDataWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4 containsAllChanges:(BOOL)a5 completion:(id)a6
{
  id v16 = (void (**)(id, void))a6;
  helper = self->_helper;
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[_ADCloudKitCapabilitiesDataStoreHelper tableDescription](helper, "tableDescription"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 name]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[_ADCloudKitCapabilitiesDataStoreHelper sqliteRecordsForCKRecords:]( self->_helper,  "sqliteRecordsForCKRecords:",  v11));
  -[ADCloudKitCapabilitiesDataStore _writeSQLiteRecords:toTable:](self, "_writeSQLiteRecords:toTable:", v14, v13);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[_ADCloudKitCapabilitiesDataStoreHelper deletionCriterionForCKRecordIDs:]( self->_helper,  "deletionCriterionForCKRecordIDs:",  v10));

  -[ADCloudKitCapabilitiesDataStore _deleteSQLiteRecordsWithCriterion:inTable:]( self,  "_deleteSQLiteRecordsWithCriterion:inTable:",  v15,  v13);
  if (v16) {
    v16[2](v16, 0LL);
  }
}

- (void)fetchDeviceTypesForAllLanguages:(id)a3
{
  if (a3) {
    (*((void (**)(id, void, void))a3 + 2))(a3, 0LL, 0LL);
  }
}

- (void)fetchDeviceTypesForLanguage:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0LL);
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

- (BOOL)hasSetUpRecordZoneSubscription
{
  return self->hasSetUpRecordZoneSubscription;
}

- (void)setHasSetUpRecordZoneSubscription:(BOOL)a3
{
  self->hasSetUpRecordZoneSubscription = a3;
}

- (CKServerChangeToken)serverChangeToken
{
  return self->serverChangeToken;
}

- (void)setServerChangeToken:(id)a3
{
}

- (NSArray)supportedRecordTypes
{
  return self->supportedRecordTypes;
}

- (void).cxx_destruct
{
}

@end