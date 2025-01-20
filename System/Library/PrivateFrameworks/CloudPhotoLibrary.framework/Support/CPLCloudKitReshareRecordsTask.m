@interface CPLCloudKitReshareRecordsTask
- (BOOL)shouldCopyCKRecordKeyToDestinationCKRecord:(id)a3;
- (BOOL)shouldCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4;
- (CPLCloudKitReshareRecordsTask)initWithController:(id)a3 records:(id)a4 sourceScope:(id)a5 destinationScope:(id)a6 transportScopeMapping:(id)a7 completionHandler:(id)a8;
- (CPLEngineScope)destinationScope;
- (CPLEngineScope)sourceScope;
- (NSDictionary)records;
- (id)baseDestinationCKRecordForSourceCKRecord:(id)a3 destinationCKRecordID:(id)a4 error:(id *)a5;
- (id)completionHandler;
- (id)finalizedDestinationCKRecordFromProposedCKRecord:(id)a3 error:(id *)a4;
- (id)recordNameInDestinationCKRecordFromRecordName:(id)a3 error:(id *)a4;
- (id)rejectedScopedIdentifierForRejectedCKRecordID:(id)a3;
- (void)_deleteSourceRecordIDs:(id)a3;
- (void)prepareCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4;
- (void)runOperations;
@end

@implementation CPLCloudKitReshareRecordsTask

- (CPLCloudKitReshareRecordsTask)initWithController:(id)a3 records:(id)a4 sourceScope:(id)a5 destinationScope:(id)a6 transportScopeMapping:(id)a7 completionHandler:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___CPLCloudKitReshareRecordsTask;
  v19 = -[CPLCloudKitTransportTask initWithController:](&v25, "initWithController:", a3);
  if (v19)
  {
    v20 = (NSDictionary *)[v14 copy];
    records = v19->_records;
    v19->_records = v20;

    id v22 = [v18 copy];
    id completionHandler = v19->_completionHandler;
    v19->_id completionHandler = v22;

    objc_storeStrong((id *)&v19->_sourceScope, a5);
    objc_storeStrong((id *)&v19->_destinationScope, a6);
    -[CPLCloudKitTransportTask setTransportScopeMapping:](v19, "setTransportScopeMapping:", v17);
  }

  return v19;
}

- (void)_deleteSourceRecordIDs:(id)a3
{
  id v4 = a3;
  id v14 = 0LL;
  unsigned __int8 v5 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v14);
  id v6 = v14;
  if ((v5 & 1) != 0)
  {
    v7 = -[CKModifyRecordsOperation initWithRecordsToSave:recordIDsToDelete:]( objc_alloc(&OBJC_CLASS___CKModifyRecordsOperation),  "initWithRecordsToSave:recordIDsToDelete:",  0LL,  v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask fetchCache](self, "fetchCache"));
    v9 = v8;
    if (v8)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_100064DFC;
      v12[3] = &unk_10023F750;
      v12[4] = self;
      id v13 = v8;
      -[CKModifyRecordsOperation setPerRecordDeleteBlock:](v7, "setPerRecordDeleteBlock:", v12);
    }

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100064E9C;
    v10[3] = &unk_100240B98;
    v10[4] = self;
    id v11 = v4;
    -[CKModifyRecordsOperation setModifyRecordsCompletionBlock:](v7, "setModifyRecordsCompletionBlock:", v10);
    -[CPLCloudKitTransportTask launchOperation:type:withContext:]( self,  "launchOperation:type:withContext:",  v7,  -[CPLCloudKitZoneIdentification operationType](self->_sourceIdentification, "operationType"),  0LL);
  }

  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (void)runOperations
{
  v42[0] = 0LL;
  unsigned __int8 v3 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", v42);
  id v4 = v42[0];
  if ((v3 & 1) != 0)
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineScope scopeIdentifier](self->_sourceScope, "scopeIdentifier"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransportTask cloudKitScopeForScopeIdentifier:]( self,  "cloudKitScopeForScopeIdentifier:",  v5));

    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineScope scopeIdentifier](self->_destinationScope, "scopeIdentifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransportTask cloudKitScopeForScopeIdentifier:]( self,  "cloudKitScopeForScopeIdentifier:",  v8));

      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);
      if (v10)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
        v12 = (CPLCloudKitZoneIdentification *)objc_claimAutoreleasedReturnValue( [v11 zoneIdentificationForCloudKitScope:v6 engineScope:self->_sourceScope]);
        sourceIdentification = self->_sourceIdentification;
        self->_sourceIdentification = v12;

        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
        id v15 = (CPLCloudKitZoneIdentification *)objc_claimAutoreleasedReturnValue( [v14 zoneIdentificationForCloudKitScope:v9 engineScope:self->_destinationScope]);
        destinationIdentification = self->_destinationIdentification;
        self->_destinationIdentification = v15;

        id v17 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSDictionary count](self->_records, "count"));
        id v18 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSDictionary count](self->_records, "count"));
        v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        v20 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  -[NSDictionary count](self->_records, "count"));
        rejectedMapping = self->_rejectedMapping;
        self->_rejectedMapping = v20;

        records = self->_records;
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472LL;
        v38[2] = sub_10006551C;
        v38[3] = &unk_100240BC0;
        v38[4] = self;
        v23 = v19;
        v39 = v23;
        v40 = v17;
        v41 = v18;
        v24 = v18;
        objc_super v25 = v17;
        -[NSDictionary enumerateKeysAndObjectsUsingBlock:](records, "enumerateKeysAndObjectsUsingBlock:", v38);
        v26 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        recordModificationDate = self->_recordModificationDate;
        self->_recordModificationDate = v26;

        v28 = (CPLCKRecordPropertyMapping *)objc_claimAutoreleasedReturnValue( +[CPLCKRecordPropertyMapping sharedInstance]( &OBJC_CLASS___CPLCKRecordPropertyMapping,  "sharedInstance"));
        mapping = self->_mapping;
        self->_mapping = v28;

        int64_t v30 = -[CPLCloudKitZoneIdentification operationType](self->_sourceIdentification, "operationType");
        int64_t v31 = -[CPLCloudKitZoneIdentification operationType](self->_destinationIdentification, "operationType");
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472LL;
        v35[2] = sub_100065650;
        v35[3] = &unk_100240BE8;
        v36 = v23;
        v37 = self;
        v32 = v23;
        -[CPLCloudKitTransportTask moveRecordsWithIDs:followRemapping:sourceType:destinationRecordIDs:destinationType:helper:completionHandler:]( self,  "moveRecordsWithIDs:followRemapping:sourceType:destinationRecordIDs:destinationType:helper:completionHandler:",  v25,  1LL,  v30,  v24,  v31,  self,  v35);
      }

      else
      {
        id completionHandler = (void (**)(id, id))self->_completionHandler;
        objc_super v25 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  80LL,  @"Missing required zone for destination scope"));
        completionHandler[2](completionHandler, v25);
      }
    }

    else
    {
      v33 = (void (**)(id, void *))self->_completionHandler;
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  80LL,  @"Missing required zone for source scope"));
      v33[2](v33, v9);
    }
  }

  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (id)rejectedScopedIdentifierForRejectedCKRecordID:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_rejectedMapping, "objectForKeyedSubscript:", v4));
  id v6 = v5;
  if (v5)
  {
    v7 = v5;
  }

  else
  {
    v8 = objc_alloc(&OBJC_CLASS___CPLScopedIdentifier);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification scopeIdentifier](self->_destinationIdentification, "scopeIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 recordName]);
    v7 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:](v8, "initWithScopeIdentifier:identifier:", v9, v10);
  }

  return v7;
}

- (BOOL)shouldCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4
{
  return 1;
}

- (void)prepareCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = (CPLScopedIdentifier *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransportTask scopedIdentifierForCKRecordID:]( self,  "scopedIdentifierForCKRecordID:",  v7));
  currentSourceScopedIdentifier = self->_currentSourceScopedIdentifier;
  self->_currentSourceScopedIdentifier = v9;

  if (!self->_currentSourceScopedIdentifier) {
    sub_1001947B0((uint64_t)v7, (uint64_t)a2, (uint64_t)self);
  }
  id v11 = (CPLRecordChange *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_records, "objectForKeyedSubscript:"));
  currentSharedRecord = self->_currentSharedRecord;
  self->_currentSharedRecord = v11;

  if (!self->_currentSharedRecord) {
    sub_10019488C(&self->_currentSourceScopedIdentifier, (uint64_t)a2, (uint64_t)self);
  }
  unint64_t v18 = (unint64_t)v7;
  uint64_t v13 = objc_claimAutoreleasedReturnValue([v8 recordID]);
  if (v18 && v13)
  {
    unsigned __int8 v14 = [(id)v18 isEqual:v13];

    if ((v14 & 1) != 0) {
      goto LABEL_11;
    }
  }

  else
  {

    if (!(v18 | v13)) {
      goto LABEL_11;
    }
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_rejectedMapping,  "objectForKeyedSubscript:",  v18));
  if (v15)
  {
    rejectedMapping = self->_rejectedMapping;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 recordID]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](rejectedMapping, "setObject:forKeyedSubscript:", v15, v17);
  }

LABEL_11:
}

- (id)baseDestinationCKRecordForSourceCKRecord:(id)a3 destinationCKRecordID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLRecordChange recordChangeData](self->_currentSharedRecord, "recordChangeData"));
  if (!v9
    || (v10 = +[CPLArchiver unarchiveObjectWithData:ofClass:]( &OBJC_CLASS___CPLArchiver,  "unarchiveObjectWithData:ofClass:",  v9,  objc_opt_class(&OBJC_CLASS___CKRecord)),  id v11 = (CKRecord *)objc_claimAutoreleasedReturnValue(v10),  (v12 = v11) == 0LL))
  {
LABEL_16:
    v29 = objc_alloc(&OBJC_CLASS___CKRecord);
    int64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v7 recordType]);
    v12 = -[CKRecord initWithRecordType:recordID:](v29, "initWithRecordType:recordID:", v30, v8);

    -[CKRecord setKnownToServer:](v12, "setKnownToServer:", 1LL);
    -[CKRecord setEtag:](v12, "setEtag:", @"-gateon");
    goto LABEL_17;
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordType](v11, "recordType"));
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v7 recordType]);
  unsigned __int8 v15 = [v13 isEqualToString:v14];

  if ((v15 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      id v24 = sub_1000650DC();
      objc_super v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        currentSourceScopedIdentifier = self->_currentSourceScopedIdentifier;
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[CPLRecordChange scopedIdentifier](self->_currentSharedRecord, "scopedIdentifier"));
        v27 = (void *)objc_claimAutoreleasedReturnValue([v7 recordType]);
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordType](v12, "recordType"));
        *(_DWORD *)buf = 138413058;
        v44 = currentSourceScopedIdentifier;
        __int16 v45 = 2112;
        v46 = v26;
        __int16 v47 = 2112;
        v48 = v27;
        __int16 v49 = 2112;
        v50 = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "Trying to move %@ to %@ but source is %@ while destination is %@",  buf,  0x2Au);
      }
    }

    goto LABEL_16;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordID](v12, "recordID"));
  unsigned __int8 v17 = [v16 isEqual:v8];

  if (_CPLSilentLogging) {
    char v18 = 1;
  }
  else {
    char v18 = v17;
  }
  if ((v18 & 1) == 0)
  {
    id v19 = sub_1000650DC();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v41 = self->_currentSourceScopedIdentifier;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CPLRecordChange scopedIdentifier](self->_currentSharedRecord, "scopedIdentifier"));
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v7 recordID]);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordID](v12, "recordID"));
      *(_DWORD *)buf = 138413058;
      v44 = v41;
      __int16 v45 = 2112;
      v46 = v21;
      __int16 v47 = 2112;
      v48 = v22;
      __int16 v49 = 2112;
      v50 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Trying to move %@ to %@ but proposed record ID is %@ while expected record ID is %@",  buf,  0x2Au);
    }
  }

- (BOOL)shouldCopyCKRecordKeyToDestinationCKRecord:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"dateExpunged"])
  {
    BOOL v5 = 1;
  }

  else
  {
    id v6 = -[CPLRecordChange recordClass](self->_currentSharedRecord, "recordClass");
    if (-[CPLCKRecordPropertyMapping isKeyReadOnly:recordClass:](self->_mapping, "isKeyReadOnly:recordClass:", v4, v6)) {
      BOOL v5 = 0;
    }
    else {
      BOOL v5 = -[CPLCKRecordPropertyMapping shouldUpdateKeyOnSharedRecord:recordClass:]( self->_mapping,  "shouldUpdateKeyOnSharedRecord:recordClass:",  v4,  v6);
    }
  }

  return v5;
}

- (id)recordNameInDestinationCKRecordFromRecordName:(id)a3 error:(id *)a4
{
  id v5 = a3;
  sourceRelatedRecordName = self->_sourceRelatedRecordName;
  if (sourceRelatedRecordName && -[NSString isEqual:](sourceRelatedRecordName, "isEqual:", v5))
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[CPLRecordChange relatedIdentifier](self->_currentSharedRecord, "relatedIdentifier"));
    id v8 = (void *)v7;
    if (v7) {
      v9 = (void *)v7;
    }
    else {
      v9 = v5;
    }
    id v10 = v9;
  }

  else
  {
    id v10 = v5;
  }

  return v10;
}

- (id)finalizedDestinationCKRecordFromProposedCKRecord:(id)a3 error:(id *)a4
{
  id v5 = a3;
  [v5 setObject:self->_recordModificationDate forKey:@"recordModificationDate"];
  id v6 = -[CPLRecordChange recordClass](self->_currentSharedRecord, "recordClass");
  if (!-[CPLCloudKitZoneIdentification supportsDirectDeletionOfRecordClass:]( self->_destinationIdentification,  "supportsDirectDeletionOfRecordClass:",  v6))
  {
    [v5 setObject:&__kCFBooleanFalse forKey:@"isExpunged"];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"isDeleted"]);

    if (!v7) {
      [v5 setObject:&__kCFBooleanFalse forKey:@"isDeleted"];
    }
  }

  if ([v6 supportsSharingScopedIdentifier])
  {
    [v5 setObject:0 forKey:@"linkedShareZoneName"];
    [v5 setObject:0 forKey:@"linkedShareZoneOwner"];
    [v5 setObject:0 forKey:@"linkedShareRecordName"];
  }

  return v5;
}

- (NSDictionary)records
{
  return self->_records;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (CPLEngineScope)sourceScope
{
  return self->_sourceScope;
}

- (CPLEngineScope)destinationScope
{
  return self->_destinationScope;
}

- (void).cxx_destruct
{
}

@end