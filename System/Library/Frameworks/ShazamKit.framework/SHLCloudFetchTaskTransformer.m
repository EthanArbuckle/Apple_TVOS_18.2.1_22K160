@interface SHLCloudFetchTaskTransformer
- (CKFetchDatabaseChangesOperation)databaseChangesOperation;
- (CKFetchRecordZoneChangesOperation)recordZoneChangesOperation;
- (SHLCloudFetchTaskTransformer)initWithConfiguration:(id)a3;
- (SHLSyncSessionConfiguration)configuration;
- (id)cloudBackedDatabaseChangesOperationFromFetchTask:(id)a3 container:(id)a4 completion:(id)a5;
- (id)cloudBackedZoneChangesOperationFromFetchTask:(id)a3 forChangedZones:(id)a4 container:(id)a5;
- (id)configurationsByRecordZoneIDUsingCache:(id)a3;
- (id)recordIDsFromCloudBackedZones:(id)a3;
- (void)setDatabaseChangesOperation:(id)a3;
- (void)setRecordZoneChangesOperation:(id)a3;
@end

@implementation SHLCloudFetchTaskTransformer

- (SHLCloudFetchTaskTransformer)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SHLCloudFetchTaskTransformer;
  v6 = -[SHLCloudFetchTaskTransformer init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___CKFetchDatabaseChangesOperation);
    databaseChangesOperation = v7->_databaseChangesOperation;
    v7->_databaseChangesOperation = v8;

    -[CKFetchDatabaseChangesOperation setFetchAllChanges:](v7->_databaseChangesOperation, "setFetchAllChanges:", 1LL);
    v10 = objc_alloc_init(&OBJC_CLASS___CKFetchRecordZoneChangesOperation);
    recordZoneChangesOperation = v7->_recordZoneChangesOperation;
    v7->_recordZoneChangesOperation = v10;

    -[CKFetchRecordZoneChangesOperation setFetchAllChanges:]( v7->_recordZoneChangesOperation,  "setFetchAllChanges:",  1LL);
  }

  return v7;
}

- (id)cloudBackedDatabaseChangesOperationFromFetchTask:(id)a3 container:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v51 = a5;
  id v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 container]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 privateCloudDatabase]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudFetchTaskTransformer databaseChangesOperation](self, "databaseChangesOperation"));
  [v12 setDatabase:v11];

  objc_super v13 = objc_alloc(&OBJC_CLASS___SHLCloudLibraryCache);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudFetchTaskTransformer configuration](self, "configuration"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 callingProcessIdentifier]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v9 container]);

  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 containerIdentifier]);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudFetchTaskTransformer configuration](self, "configuration"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 sessionIdentifier]);
  v20 = -[SHLCloudLibraryCache initWithCallingProcessIdentifier:containerIdentifier:transactionIdentifier:]( v13,  "initWithCallingProcessIdentifier:containerIdentifier:transactionIdentifier:",  v15,  v17,  v19);

  if ([v8 fetchType] == (id)1)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudLibraryCache databaseToken](v20, "databaseToken"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 serverChangeToken]);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudFetchTaskTransformer databaseChangesOperation](self, "databaseChangesOperation"));
    [v23 setPreviousServerChangeToken:v22];

    id v24 = sub_10002D0D8();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudFetchTaskTransformer databaseChangesOperation](self, "databaseChangesOperation"));
      v27 = (void *)objc_claimAutoreleasedReturnValue([v26 previousServerChangeToken]);
      *(_DWORD *)buf = 138412290;
      v67 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEBUG,  "Using <token: %@> for database fetch",  buf,  0xCu);
    }
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472LL;
  v63[2] = sub_100037C60;
  v63[3] = &unk_10006DC38;
  v29 = v20;
  v64 = v29;
  id v30 = v28;
  id v65 = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudFetchTaskTransformer databaseChangesOperation](self, "databaseChangesOperation"));
  [v31 setRecordZoneWithIDChangedBlock:v63];

  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472LL;
  v60[2] = sub_100037E50;
  v60[3] = &unk_10006DC38;
  v32 = v29;
  v61 = v32;
  id v33 = v8;
  id v62 = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudFetchTaskTransformer databaseChangesOperation](self, "databaseChangesOperation"));
  [v34 setRecordZoneWithIDWasDeletedBlock:v60];

  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472LL;
  v57[2] = sub_100038050;
  v57[3] = &unk_10006DC38;
  v35 = v32;
  v58 = v35;
  id v36 = v33;
  id v59 = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudFetchTaskTransformer databaseChangesOperation](self, "databaseChangesOperation"));
  [v37 setRecordZoneWithIDWasPurgedBlock:v57];

  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_100038250;
  v52[3] = &unk_10006DC60;
  v53 = v35;
  id v54 = v30;
  id v55 = v36;
  id v56 = v51;
  id v38 = v36;
  id v39 = v51;
  id v40 = v30;
  v41 = v35;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudFetchTaskTransformer databaseChangesOperation](self, "databaseChangesOperation"));
  [v42 setFetchDatabaseChangesCompletionBlock:v52];

  v43 = objc_alloc_init(&OBJC_CLASS___CKOperationGroup);
  -[CKOperationGroup setExpectedReceiveSize:](v43, "setExpectedReceiveSize:", 1LL);
  -[CKOperationGroup setQuantity:](v43, "setQuantity:", 1LL);
  v44 = (void *)objc_claimAutoreleasedReturnValue([v38 syncStartCondition]);
  v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@",  v44,  @"FetchDatabaseChanges"));
  -[CKOperationGroup setName:](v43, "setName:", v45);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudFetchTaskTransformer databaseChangesOperation](self, "databaseChangesOperation"));
  [v46 setGroup:v43];

  v47 = objc_alloc(&OBJC_CLASS___SHLCloudBackedOperation);
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudFetchTaskTransformer databaseChangesOperation](self, "databaseChangesOperation"));
  v49 = -[SHLCloudBackedOperation initWithOperation:](v47, "initWithOperation:", v48);

  return v49;
}

- (id)cloudBackedZoneChangesOperationFromFetchTask:(id)a3 forChangedZones:(id)a4 container:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 container]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 privateCloudDatabase]);
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudFetchTaskTransformer recordZoneChangesOperation](self, "recordZoneChangesOperation"));
  [v13 setDatabase:v12];

  v14 = (void *)objc_claimAutoreleasedReturnValue( -[SHLCloudFetchTaskTransformer recordIDsFromCloudBackedZones:]( self,  "recordIDsFromCloudBackedZones:",  v10));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudFetchTaskTransformer recordZoneChangesOperation](self, "recordZoneChangesOperation"));
  [v15 setRecordZoneIDs:v14];

  v16 = objc_alloc(&OBJC_CLASS___SHLCloudLibraryCache);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudFetchTaskTransformer configuration](self, "configuration"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 callingProcessIdentifier]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v9 container]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 containerIdentifier]);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudFetchTaskTransformer configuration](self, "configuration"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 sessionIdentifier]);
  v23 = -[SHLCloudLibraryCache initWithCallingProcessIdentifier:containerIdentifier:transactionIdentifier:]( v16,  "initWithCallingProcessIdentifier:containerIdentifier:transactionIdentifier:",  v18,  v20,  v22);

  if ([v8 fetchType] == (id)1)
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue( -[SHLCloudFetchTaskTransformer configurationsByRecordZoneIDUsingCache:]( self,  "configurationsByRecordZoneIDUsingCache:",  v23));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudFetchTaskTransformer recordZoneChangesOperation](self, "recordZoneChangesOperation"));
    [v25 setConfigurationsByRecordZoneID:v24];
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472LL;
  v67[2] = sub_1000389AC;
  v67[3] = &unk_10006DC88;
  id v28 = v26;
  id v68 = v28;
  id v69 = v9;
  id v29 = v27;
  id v70 = v29;
  id v30 = v9;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudFetchTaskTransformer recordZoneChangesOperation](self, "recordZoneChangesOperation"));
  [v31 setRecordWasChangedBlock:v67];

  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472LL;
  v65[2] = sub_100038B60;
  v65[3] = &unk_10006DCB0;
  id v32 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v66 = v32;
  id v33 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudFetchTaskTransformer recordZoneChangesOperation](self, "recordZoneChangesOperation"));
  [v33 setRecordWithIDWasDeletedBlock:v65];

  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472LL;
  v63[2] = sub_100038BA4;
  v63[3] = &unk_10006DCD8;
  v34 = v23;
  v64 = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudFetchTaskTransformer recordZoneChangesOperation](self, "recordZoneChangesOperation"));
  [v35 setRecordZoneChangeTokensUpdatedBlock:v63];

  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472LL;
  v61[2] = sub_100038C40;
  v61[3] = &unk_10006DD00;
  id v36 = v34;
  id v62 = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudFetchTaskTransformer recordZoneChangesOperation](self, "recordZoneChangesOperation"));
  [v37 setRecordZoneFetchCompletionBlock:v61];

  v52 = _NSConcreteStackBlock;
  uint64_t v53 = 3221225472LL;
  id v54 = sub_100038E18;
  id v55 = &unk_10006DD28;
  id v56 = v36;
  id v57 = v8;
  id v58 = v28;
  id v59 = v29;
  id v60 = v32;
  id v38 = v32;
  id v39 = v29;
  id v40 = v28;
  id v41 = v8;
  v42 = v36;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudFetchTaskTransformer recordZoneChangesOperation](self, "recordZoneChangesOperation"));
  [v43 setFetchRecordZoneChangesCompletionBlock:&v52];

  v44 = objc_alloc_init(&OBJC_CLASS___CKOperationGroup);
  -[CKOperationGroup setExpectedReceiveSize:](v44, "setExpectedReceiveSize:", 1LL);
  -[CKOperationGroup setQuantity:](v44, "setQuantity:", 1LL);
  v45 = (void *)objc_claimAutoreleasedReturnValue([v41 syncStartCondition]);
  v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@",  v45,  @"FetchZoneChanges",  v52,  v53,  v54,  v55));
  -[CKOperationGroup setName:](v44, "setName:", v46);

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudFetchTaskTransformer recordZoneChangesOperation](self, "recordZoneChangesOperation"));
  [v47 setGroup:v44];

  v48 = objc_alloc(&OBJC_CLASS___SHLCloudBackedOperation);
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudFetchTaskTransformer recordZoneChangesOperation](self, "recordZoneChangesOperation"));
  v50 = -[SHLCloudBackedOperation initWithOperation:](v48, "initWithOperation:", v49);

  return v50;
}

- (id)recordIDsFromCloudBackedZones:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v9), "zone", (void)v14));
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneID]);
        [v4 addObject:v11];

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  id v12 = [v4 copy];
  return v12;
}

- (id)configurationsByRecordZoneIDUsingCache:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudFetchTaskTransformer recordZoneChangesOperation](self, "recordZoneChangesOperation"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 recordZoneIDs]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v6 count]));

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudFetchTaskTransformer recordZoneChangesOperation](self, "recordZoneChangesOperation"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 recordZoneIDs]);

  id v10 = [v9 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v26;
    *(void *)&__int128 v11 = 138412290LL;
    __int128 v24 = v11;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v9);
        }
        __int128 v15 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "zoneName", v24));
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneTokenForZoneIdentifier:v16]);

        if (v17)
        {
          v18 = objc_alloc_init(&OBJC_CLASS___CKFetchRecordZoneChangesConfiguration);
          v19 = (void *)objc_claimAutoreleasedReturnValue([v17 serverChangeToken]);
          -[CKFetchRecordZoneChangesConfiguration setPreviousServerChangeToken:]( v18,  "setPreviousServerChangeToken:",  v19);

          [v7 setObject:v18 forKeyedSubscript:v15];
          id v20 = sub_10002D0D8();
          v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v24;
            id v30 = v18;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "Using <zone changes configuration: %@> for fetch",  buf,  0xCu);
          }
        }
      }

      id v12 = [v9 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }

    while (v12);
  }

  id v22 = [v7 copy];
  return v22;
}

- (SHLSyncSessionConfiguration)configuration
{
  return self->_configuration;
}

- (CKFetchDatabaseChangesOperation)databaseChangesOperation
{
  return self->_databaseChangesOperation;
}

- (void)setDatabaseChangesOperation:(id)a3
{
}

- (CKFetchRecordZoneChangesOperation)recordZoneChangesOperation
{
  return self->_recordZoneChangesOperation;
}

- (void)setRecordZoneChangesOperation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end