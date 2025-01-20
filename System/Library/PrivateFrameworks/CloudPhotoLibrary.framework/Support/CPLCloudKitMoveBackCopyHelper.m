@interface CPLCloudKitMoveBackCopyHelper
- (BOOL)shouldCopyCKRecordKeyToDestinationCKRecord:(id)a3;
- (BOOL)shouldCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4;
- (CKRecordID)userRecordID;
- (CPLCloudKitMoveBackCopyHelper)initWithUserRecordID:(id)a3 scopeProvider:(id)a4;
- (CPLCloudKitScopeProvider)scopeProvider;
- (CPLFingerprintContext)fingerprintContext;
- (id)baseDestinationCKRecordForSourceCKRecord:(id)a3 destinationCKRecordID:(id)a4 error:(id *)a5;
- (id)cloudKitScopeForScopeIdentifier:(id)a3;
- (id)finalizedDestinationCKRecordFromProposedCKRecord:(id)a3 error:(id *)a4;
- (id)recordNameInDestinationCKRecordFromRecordName:(id)a3 error:(id *)a4;
- (id)rejectedScopedIdentifierForRejectedCKRecordID:(id)a3;
- (id)scopeIdentifierFromZoneID:(id)a3;
- (id)scopedIdentifierForCKRecordID:(id)a3;
- (id)zoneIDFromScopeIdentifier:(id)a3;
- (void)prepareCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4;
@end

@implementation CPLCloudKitMoveBackCopyHelper

- (CPLFingerprintContext)fingerprintContext
{
  return (CPLFingerprintContext *)-[CPLCloudKitScopeProvider fingerprintContext]( self->_scopeProvider,  "fingerprintContext");
}

- (CPLCloudKitMoveBackCopyHelper)initWithUserRecordID:(id)a3 scopeProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CPLCloudKitMoveBackCopyHelper;
  v9 = -[CPLCloudKitMoveBackCopyHelper init](&v15, "init");
  if (v9)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[CPLCKRecordPropertyMapping sharedInstance](&OBJC_CLASS___CPLCKRecordPropertyMapping, "sharedInstance"));
    mapping = v9->_mapping;
    v9->_mapping = (CPLCKRecordPropertyMapping *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    recordModificationDate = v9->_recordModificationDate;
    v9->_recordModificationDate = (NSDate *)v12;

    objc_storeStrong((id *)&v9->_userRecordID, a3);
    objc_storeStrong((id *)&v9->_scopeProvider, a4);
  }

  return v9;
}

- (BOOL)shouldCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"remappedRef"]);

  if (v5 && !_CPLSilentLogging)
  {
    id v6 = sub_1000AD2D4();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 recordType]);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 cplFullDescription]);
      int v12 = 138412546;
      v13 = v8;
      __int16 v14 = 2112;
      objc_super v15 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Ignoring remapped <%@ %@>",  (uint8_t *)&v12,  0x16u);
    }
  }

  return v5 == 0LL;
}

- (void)prepareCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "recordType", a3));
  self->_recordClass = (Class)CPLRecordChangeClassForCKRecordType(v5);
}

- (id)baseDestinationCKRecordForSourceCKRecord:(id)a3 destinationCKRecordID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v7,  "cpl_destinationRecordIDInPrivateScopeWithCurrentUserRecordID:proposedDestinationRecordID:",  self->_userRecordID,  v8));
  if (([v9 isEqual:v8] & 1) == 0 && !_CPLSilentLogging)
  {
    id v10 = sub_1000AD2D4();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = (void *)objc_claimAutoreleasedReturnValue([v7 recordID]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 cplFullDescription]);
      __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v9 cplFullDescription]);
      objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v8 cplFullDescription]);
      int v20 = 138412802;
      v21 = v13;
      __int16 v22 = 2112;
      v23 = v14;
      __int16 v24 = 2112;
      v25 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Moving %@ to %@ instead of %@",  (uint8_t *)&v20,  0x20u);
    }
  }

  v16 = objc_alloc(&OBJC_CLASS___CKRecord);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v7 recordType]);
  v18 = -[CKRecord initWithRecordType:recordID:](v16, "initWithRecordType:recordID:", v17, v9);

  return v18;
}

- (BOOL)shouldCopyCKRecordKeyToDestinationCKRecord:(id)a3
{
  return 1;
}

- (id)recordNameInDestinationCKRecordFromRecordName:(id)a3 error:(id *)a4
{
  return a3;
}

- (id)finalizedDestinationCKRecordFromProposedCKRecord:(id)a3 error:(id *)a4
{
  id v5 = a3;
  [v5 setObject:self->_recordModificationDate forKey:@"recordModificationDate"];
  [v5 setObject:0 forKey:@"linkedShareZoneName"];
  [v5 setObject:0 forKey:@"linkedShareZoneOwner"];
  [v5 setObject:0 forKey:@"linkedShareRecordName"];
  return v5;
}

- (id)cloudKitScopeForScopeIdentifier:(id)a3
{
  return -[CPLCloudKitScopeProvider cloudKitScopeForScopeIdentifier:]( self->_scopeProvider,  "cloudKitScopeForScopeIdentifier:",  a3);
}

- (id)zoneIDFromScopeIdentifier:(id)a3
{
  return -[CPLCloudKitScopeProvider zoneIDFromScopeIdentifier:](self->_scopeProvider, "zoneIDFromScopeIdentifier:", a3);
}

- (id)scopeIdentifierFromZoneID:(id)a3
{
  return -[CPLCloudKitScopeProvider scopeIdentifierFromZoneID:](self->_scopeProvider, "scopeIdentifierFromZoneID:", a3);
}

- (id)scopedIdentifierForCKRecordID:(id)a3
{
  return -[CPLCloudKitScopeProvider scopedIdentifierForCKRecordID:]( self->_scopeProvider,  "scopedIdentifierForCKRecordID:",  a3);
}

- (id)rejectedScopedIdentifierForRejectedCKRecordID:(id)a3
{
  return -[CPLCloudKitScopeProvider rejectedScopedIdentifierForRejectedCKRecordID:]( self->_scopeProvider,  "rejectedScopedIdentifierForRejectedCKRecordID:",  a3);
}

- (CKRecordID)userRecordID
{
  return self->_userRecordID;
}

- (CPLCloudKitScopeProvider)scopeProvider
{
  return self->_scopeProvider;
}

- (void).cxx_destruct
{
}

@end