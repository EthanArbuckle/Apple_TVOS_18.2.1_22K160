@interface CPLCKSplitCopyHelper
- (BOOL)fromPrivateRecord;
- (BOOL)shouldCopyCKRecordKeyToDestinationCKRecord:(id)a3;
- (BOOL)shouldCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4;
- (CKRecord)baseCKRecord;
- (CKRecordID)destinationRecordID;
- (CKRecordID)sourceRecordID;
- (CPLCKBatchUploadPlanner)planner;
- (CPLCKSplitCopyHelper)initWithBaseCKRecord:(id)a3 sourceRecordID:(id)a4 fromPrivateRecord:(BOOL)a5 recordClass:(Class)a6 sourceDatabaseScope:(int64_t)a7 destinationRecordID:(id)a8 planner:(id)a9;
- (CPLFingerprintContext)fingerprintContext;
- (Class)recordClass;
- (NSString)action;
- (id)baseDestinationCKRecordForSourceCKRecord:(id)a3 destinationCKRecordID:(id)a4 error:(id *)a5;
- (id)cloudKitScopeForScopeIdentifier:(id)a3;
- (id)copiedRecordFromSourceRecord:(id)a3 action:(id)a4 error:(id *)a5;
- (id)finalizedDestinationCKRecordFromProposedCKRecord:(id)a3 error:(id *)a4;
- (id)recordNameInDestinationCKRecordFromRecordName:(id)a3 error:(id *)a4;
- (id)rejectedScopedIdentifierForRejectedCKRecordID:(id)a3;
- (id)scopeIdentifierFromZoneID:(id)a3;
- (id)scopedIdentifierForCKRecordID:(id)a3;
- (id)zoneIDFromScopeIdentifier:(id)a3;
- (int64_t)sourceDatabaseScope;
@end

@implementation CPLCKSplitCopyHelper

- (CPLFingerprintContext)fingerprintContext
{
  return -[CPLCKBatchUploadPlanner fingerprintContext](self->_planner, "fingerprintContext");
}

- (CPLCKSplitCopyHelper)initWithBaseCKRecord:(id)a3 sourceRecordID:(id)a4 fromPrivateRecord:(BOOL)a5 recordClass:(Class)a6 sourceDatabaseScope:(int64_t)a7 destinationRecordID:(id)a8 planner:(id)a9
{
  id v22 = a3;
  id v15 = a4;
  id v16 = a8;
  id v17 = a9;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___CPLCKSplitCopyHelper;
  v18 = -[CPLCKSplitCopyHelper init](&v23, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_baseCKRecord, a3);
    objc_storeStrong((id *)&v19->_sourceRecordID, a4);
    v19->_fromPrivateRecord = a5;
    objc_storeStrong((id *)&v19->_recordClass, a6);
    v19->_sourceDatabaseScope = a7;
    objc_storeStrong((id *)&v19->_destinationRecordID, a8);
    objc_storeStrong((id *)&v19->_planner, a9);
  }

  return v19;
}

- (id)copiedRecordFromSourceRecord:(id)a3 action:(id)a4 error:(id *)a5
{
  return +[CPLCloudKitTransportTask copiedRecordFromSourceRecord:sourceDatabaseScope:toRecordID:helper:action:error:]( &OBJC_CLASS___CPLCloudKitTransportTask,  "copiedRecordFromSourceRecord:sourceDatabaseScope:toRecordID:helper:action:error:",  a3,  self->_sourceDatabaseScope,  self->_destinationRecordID,  self,  a4,  a5);
}

- (BOOL)shouldCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4
{
  return 1;
}

- (id)baseDestinationCKRecordForSourceCKRecord:(id)a3 destinationCKRecordID:(id)a4 error:(id *)a5
{
  baseCKRecord = self->_baseCKRecord;
  if (baseCKRecord)
  {
    v6 = baseCKRecord;
  }

  else
  {
    id v8 = a4;
    id v9 = a3;
    v10 = objc_alloc(&OBJC_CLASS___CKRecord);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v9 recordType]);

    v6 = -[CKRecord initWithRecordType:recordID:](v10, "initWithRecordType:recordID:", v11, v8);
  }

  return v6;
}

- (BOOL)shouldCopyCKRecordKeyToDestinationCKRecord:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCKBatchUploadPlanner propertyMapping](self->_planner, "propertyMapping"));
  BOOL fromPrivateRecord = self->_fromPrivateRecord;
  unsigned __int8 v7 = [v5 isKeyReadOnly:v4 recordClass:self->_recordClass];
  if (fromPrivateRecord)
  {
    if ((v7 & 1) != 0
      || ([v5 shouldUpdateKeyOnSharedRecord:v4 recordClass:self->_recordClass] & 1) == 0)
    {
LABEL_9:
      char v11 = 0;
      goto LABEL_10;
    }
  }

  else if ((v7 & 1) != 0 {
         || ![v5 shouldUpdateKeyOnPrivateRecord:v4 recordClass:self->_recordClass])
  }
  {
    goto LABEL_9;
  }

  baseCKRecord = self->_baseCKRecord;
  if (baseCKRecord)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord changedKeys](baseCKRecord, "changedKeys"));
    unsigned __int8 v10 = [v9 containsObject:v4];

    char v11 = v10 ^ 1;
  }

  else
  {
    char v11 = 1;
  }

- (id)recordNameInDestinationCKRecordFromRecordName:(id)a3 error:(id *)a4
{
  id v5 = a3;
  BOOL fromPrivateRecord = self->_fromPrivateRecord;
  unsigned __int8 v7 = objc_alloc(&OBJC_CLASS___CPLScopedIdentifier);
  planner = self->_planner;
  if (!fromPrivateRecord)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCKBatchUploadPlanner sharedZoneIdentification](planner, "sharedZoneIdentification"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 scopeIdentifier]);
    char v11 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:](v7, "initWithScopeIdentifier:identifier:", v17, v5);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCKBatchUploadPlanner targetMapping](self->_planner, "targetMapping"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v18 targetForRecordWithOtherScopedIdentifier:v11]);

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 otherScopedIdentifier]);
      uint64_t v19 = objc_claimAutoreleasedReturnValue([v14 identifier]);
      v20 = (void *)v19;
      if (v19) {
        v21 = (void *)v19;
      }
      else {
        v21 = v5;
      }
      id v15 = v21;

      goto LABEL_9;
    }

- (id)finalizedDestinationCKRecordFromProposedCKRecord:(id)a3 error:(id *)a4
{
  return a3;
}

- (id)cloudKitScopeForScopeIdentifier:(id)a3
{
  return -[CPLCKBatchUploadPlanner cloudKitScopeForScopeIdentifier:]( self->_planner,  "cloudKitScopeForScopeIdentifier:",  a3);
}

- (id)zoneIDFromScopeIdentifier:(id)a3
{
  return -[CPLCKBatchUploadPlanner zoneIDFromScopeIdentifier:](self->_planner, "zoneIDFromScopeIdentifier:", a3);
}

- (id)scopeIdentifierFromZoneID:(id)a3
{
  return -[CPLCKBatchUploadPlanner scopeIdentifierFromZoneID:](self->_planner, "scopeIdentifierFromZoneID:", a3);
}

- (id)scopedIdentifierForCKRecordID:(id)a3
{
  return -[CPLCKBatchUploadPlanner scopedIdentifierForCKRecordID:](self->_planner, "scopedIdentifierForCKRecordID:", a3);
}

- (id)rejectedScopedIdentifierForRejectedCKRecordID:(id)a3
{
  return -[CPLCKBatchUploadPlanner rejectedScopedIdentifierForRejectedCKRecordID:]( self->_planner,  "rejectedScopedIdentifierForRejectedCKRecordID:",  a3);
}

- (CKRecord)baseCKRecord
{
  return self->_baseCKRecord;
}

- (CKRecordID)sourceRecordID
{
  return self->_sourceRecordID;
}

- (BOOL)fromPrivateRecord
{
  return self->_fromPrivateRecord;
}

- (Class)recordClass
{
  return self->_recordClass;
}

- (int64_t)sourceDatabaseScope
{
  return self->_sourceDatabaseScope;
}

- (CKRecordID)destinationRecordID
{
  return self->_destinationRecordID;
}

- (NSString)action
{
  return self->_action;
}

- (CPLCKBatchUploadPlanner)planner
{
  return self->_planner;
}

- (void).cxx_destruct
{
}

@end