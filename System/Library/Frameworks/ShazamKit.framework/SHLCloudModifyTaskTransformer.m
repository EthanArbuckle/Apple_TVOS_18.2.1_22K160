@interface SHLCloudModifyTaskTransformer
- (CKModifyRecordsOperation)modifyRecordsOperation;
- (SHLCloudModifyTaskTransformer)initWithConfiguration:(id)a3;
- (SHLSyncSessionConfiguration)configuration;
- (id)cloudBackedOperationFromModifyTask:(id)a3 container:(id)a4;
- (id)recordIDsToDeleteFromModifyTask:(id)a3;
- (id)recordsToSaveFromModifyTask:(id)a3 container:(id)a4;
- (void)setModifyRecordsOperation:(id)a3;
@end

@implementation SHLCloudModifyTaskTransformer

- (SHLCloudModifyTaskTransformer)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SHLCloudModifyTaskTransformer;
  v6 = -[SHLCloudModifyTaskTransformer init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___CKModifyRecordsOperation);
    modifyRecordsOperation = v7->_modifyRecordsOperation;
    v7->_modifyRecordsOperation = v8;

    -[CKModifyRecordsOperation setSavePolicy:](v7->_modifyRecordsOperation, "setSavePolicy:", 1LL);
  }

  return v7;
}

- (id)cloudBackedOperationFromModifyTask:(id)a3 container:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 container]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 privateCloudDatabase]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudModifyTaskTransformer modifyRecordsOperation](self, "modifyRecordsOperation"));
  [v10 setDatabase:v9];

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( -[SHLCloudModifyTaskTransformer recordsToSaveFromModifyTask:container:]( self,  "recordsToSaveFromModifyTask:container:",  v6,  v7));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudModifyTaskTransformer modifyRecordsOperation](self, "modifyRecordsOperation"));
  [v12 setRecordsToSave:v11];

  v13 = (void *)objc_claimAutoreleasedReturnValue( -[SHLCloudModifyTaskTransformer recordIDsToDeleteFromModifyTask:]( self,  "recordIDsToDeleteFromModifyTask:",  v6));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudModifyTaskTransformer modifyRecordsOperation](self, "modifyRecordsOperation"));
  [v14 setRecordIDsToDelete:v13];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 progress]);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudModifyTaskTransformer modifyRecordsOperation](self, "modifyRecordsOperation"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 recordsToSave]);
  objc_msgSend(v15, "setTotalUnitCount:", objc_msgSend(v17, "count"));

  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_1000297E4;
  v52[3] = &unk_10006D898;
  id v18 = v6;
  id v53 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudModifyTaskTransformer modifyRecordsOperation](self, "modifyRecordsOperation"));
  [v19 setPerRecordSaveBlock:v52];

  v20 = objc_alloc(&OBJC_CLASS___SHLCloudLibraryCache);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudModifyTaskTransformer configuration](self, "configuration"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 callingProcessIdentifier]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v7 container]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 containerIdentifier]);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudModifyTaskTransformer configuration](self, "configuration"));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 sessionIdentifier]);
  v27 = -[SHLCloudLibraryCache initWithCallingProcessIdentifier:containerIdentifier:transactionIdentifier:]( v20,  "initWithCallingProcessIdentifier:containerIdentifier:transactionIdentifier:",  v22,  v24,  v26);

  v45 = _NSConcreteStackBlock;
  uint64_t v46 = 3221225472LL;
  v47 = sub_100029840;
  v48 = &unk_10006D8C0;
  v49 = v27;
  id v50 = v18;
  id v51 = v7;
  id v28 = v7;
  id v29 = v18;
  v30 = v27;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudModifyTaskTransformer modifyRecordsOperation](self, "modifyRecordsOperation"));
  [v31 setModifyRecordsCompletionBlock:&v45];

  v32 = objc_alloc_init(&OBJC_CLASS___CKOperationGroup);
  -[CKOperationGroup setExpectedSendSize:](v32, "setExpectedSendSize:", 1LL);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudModifyTaskTransformer modifyRecordsOperation](self, "modifyRecordsOperation"));
  v34 = (void *)objc_claimAutoreleasedReturnValue([v33 recordsToSave]);
  v35 = (char *)[v34 count];
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudModifyTaskTransformer modifyRecordsOperation](self, "modifyRecordsOperation"));
  v37 = (void *)objc_claimAutoreleasedReturnValue([v36 recordIDsToDelete]);
  -[CKOperationGroup setQuantity:](v32, "setQuantity:", &v35[(void)[v37 count]]);

  v38 = (void *)objc_claimAutoreleasedReturnValue([v29 syncStartCondition]);
  v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@",  v38,  @"ModifyRecords",  v45,  v46,  v47,  v48));
  -[CKOperationGroup setName:](v32, "setName:", v39);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudModifyTaskTransformer modifyRecordsOperation](self, "modifyRecordsOperation"));
  [v40 setGroup:v32];

  v41 = objc_alloc(&OBJC_CLASS___SHLCloudBackedOperation);
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudModifyTaskTransformer modifyRecordsOperation](self, "modifyRecordsOperation"));
  v43 = -[SHLCloudBackedOperation initWithOperation:](v41, "initWithOperation:", v42);

  return v43;
}

- (id)recordsToSaveFromModifyTask:(id)a3 container:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 tracksToModify]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 insertions]);
  v9 = (char *)[v8 count];
  v10 = (void *)objc_claimAutoreleasedReturnValue([v5 groupsToModify]);
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 insertions]);
  v12 = &v9[(void)[v11 count]];

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v12));
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v5 groupsToModify]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 insertions]);

  id v16 = [v15 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v39;
    do
    {
      v19 = 0LL;
      do
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue( +[SHLCloudGroupTransformer cloudBackedItemFromLibraryGroup:]( &OBJC_CLASS___SHLCloudGroupTransformer,  "cloudBackedItemFromLibraryGroup:",  *(void *)(*((void *)&v38 + 1) + 8LL * (void)v19)));
        v21 = v20;
        if (v20)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue([v20 record]);
          [v13 addObject:v22];
        }

        v19 = (char *)v19 + 1;
      }

      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }

    while (v17);
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tracksToModify", 0));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 insertions]);

  id v25 = [v24 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v35;
    do
    {
      id v28 = 0LL;
      do
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(v24);
        }
        id v29 = (void *)objc_claimAutoreleasedReturnValue( +[SHLCloudTrackTransformer cloudBackedItemFromLibraryTrack:usingEncryption:]( SHLCloudTrackTransformer,  "cloudBackedItemFromLibraryTrack:usingEncryption:",  *(void *)(*((void *)&v34 + 1) + 8 * (void)v28),  [v6 isEncrypted]));
        v30 = v29;
        if (v29)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue([v29 record]);
          [v13 addObject:v31];
        }

        id v28 = (char *)v28 + 1;
      }

      while (v26 != v28);
      id v26 = [v24 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }

    while (v26);
  }

  id v32 = [v13 copy];
  return v32;
}

- (id)recordIDsToDeleteFromModifyTask:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 tracksToModify]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 deletions]);
  id v6 = (char *)[v5 count];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 groupsToModify]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 deletions]);
  v9 = &v6[(void)[v8 count]];

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v9));
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(+[SHLCloudContext sharedContext](&OBJC_CLASS___SHLCloudContext, "sharedContext"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 shazamLibraryZone]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneID]);

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v3 groupsToModify]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 deletions]);

  id v16 = [v15 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v35;
    do
    {
      v19 = 0LL;
      do
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = -[CKRecordID initWithRecordName:zoneID:]( objc_alloc(&OBJC_CLASS___CKRecordID),  "initWithRecordName:zoneID:",  *(void *)(*((void *)&v34 + 1) + 8LL * (void)v19),  v13);
        [v10 addObject:v20];

        v19 = (char *)v19 + 1;
      }

      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }

    while (v17);
  }

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tracksToModify", 0));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 deletions]);

  id v23 = [v22 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v31;
    do
    {
      id v26 = 0LL;
      do
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = -[CKRecordID initWithRecordName:zoneID:]( objc_alloc(&OBJC_CLASS___CKRecordID),  "initWithRecordName:zoneID:",  *(void *)(*((void *)&v30 + 1) + 8LL * (void)v26),  v13);
        [v10 addObject:v27];

        id v26 = (char *)v26 + 1;
      }

      while (v24 != v26);
      id v24 = [v22 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }

    while (v24);
  }

  id v28 = [v10 copy];
  return v28;
}

- (SHLSyncSessionConfiguration)configuration
{
  return self->_configuration;
}

- (CKModifyRecordsOperation)modifyRecordsOperation
{
  return self->_modifyRecordsOperation;
}

- (void)setModifyRecordsOperation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end