@interface SHLCloudModifyZoneTransformer
- (CKModifyRecordZonesOperation)modifyRecordZonesOperation;
- (SHLCloudModifyZoneTransformer)initWithConfiguration:(id)a3;
- (SHLSyncSessionConfiguration)configuration;
- (id)cloudBackedOperationForZonesToSave:(id)a3 container:(id)a4;
- (id)recordZonesFromCloudBackedZones:(id)a3;
- (void)setModifyRecordZonesOperation:(id)a3;
@end

@implementation SHLCloudModifyZoneTransformer

- (SHLCloudModifyZoneTransformer)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SHLCloudModifyZoneTransformer;
  v6 = -[SHLCloudModifyZoneTransformer init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___CKModifyRecordZonesOperation);
    modifyRecordZonesOperation = v7->_modifyRecordZonesOperation;
    v7->_modifyRecordZonesOperation = v8;
  }

  return v7;
}

- (id)cloudBackedOperationForZonesToSave:(id)a3 container:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 container]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 privateCloudDatabase]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudModifyZoneTransformer modifyRecordZonesOperation](self, "modifyRecordZonesOperation"));
  [v10 setDatabase:v9];

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( -[SHLCloudModifyZoneTransformer recordZonesFromCloudBackedZones:]( self,  "recordZonesFromCloudBackedZones:",  v7));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudModifyZoneTransformer modifyRecordZonesOperation](self, "modifyRecordZonesOperation"));
  [v12 setRecordZonesToSave:v11];

  v13 = objc_alloc(&OBJC_CLASS___SHLCloudLibraryCache);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudModifyZoneTransformer configuration](self, "configuration"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 callingProcessIdentifier]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v6 container]);

  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 containerIdentifier]);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudModifyZoneTransformer configuration](self, "configuration"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 sessionIdentifier]);
  v20 = -[SHLCloudLibraryCache initWithCallingProcessIdentifier:containerIdentifier:transactionIdentifier:]( v13,  "initWithCallingProcessIdentifier:containerIdentifier:transactionIdentifier:",  v15,  v17,  v19);

  v35 = _NSConcreteStackBlock;
  uint64_t v36 = 3221225472LL;
  v37 = sub_10003C3A0;
  v38 = &unk_10006DDF0;
  v39 = v20;
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudModifyZoneTransformer modifyRecordZonesOperation](self, "modifyRecordZonesOperation"));
  [v22 setModifyRecordZonesCompletionBlock:&v35];

  v23 = objc_alloc_init(&OBJC_CLASS___CKOperationGroup);
  -[CKOperationGroup setExpectedSendSize:](v23, "setExpectedSendSize:", 1LL);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudModifyZoneTransformer modifyRecordZonesOperation](self, "modifyRecordZonesOperation"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 recordZonesToSave]);
  v26 = (char *)[v25 count];
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudModifyZoneTransformer modifyRecordZonesOperation](self, "modifyRecordZonesOperation"));
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 recordZoneIDsToDelete]);
  -[CKOperationGroup setQuantity:](v23, "setQuantity:", &v26[(void)[v28 count]]);

  v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  @"ModifyZones",  v35,  v36,  v37,  v38));
  -[CKOperationGroup setName:](v23, "setName:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudModifyZoneTransformer modifyRecordZonesOperation](self, "modifyRecordZonesOperation"));
  [v30 setGroup:v23];

  v31 = objc_alloc(&OBJC_CLASS___SHLCloudBackedOperation);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudModifyZoneTransformer modifyRecordZonesOperation](self, "modifyRecordZonesOperation"));
  v33 = -[SHLCloudBackedOperation initWithOperation:](v31, "initWithOperation:", v32);

  return v33;
}

- (id)recordZonesFromCloudBackedZones:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v9), "zone", (void)v13));
        [v4 addObject:v10];

        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  id v11 = [v4 copy];
  return v11;
}

- (SHLSyncSessionConfiguration)configuration
{
  return self->_configuration;
}

- (CKModifyRecordZonesOperation)modifyRecordZonesOperation
{
  return self->_modifyRecordZonesOperation;
}

- (void)setModifyRecordZonesOperation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end