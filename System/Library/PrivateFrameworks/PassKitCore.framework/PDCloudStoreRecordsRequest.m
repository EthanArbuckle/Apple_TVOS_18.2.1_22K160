@interface PDCloudStoreRecordsRequest
- (BOOL)canCoalesceWithRequest:(id)a3;
- (BOOL)detectConflicts;
- (BOOL)formReport;
- (BOOL)ignoreChangesMadeByThisDevice;
- (BOOL)ignoreExistingRecordHash;
- (BOOL)isModifyingShare;
- (BOOL)returnRecords;
- (BOOL)shouldSaveToken;
- (BOOL)storeChangesInDatabase;
- (BOOL)useLastChangeToken;
- (CKQuery)ckQuery;
- (NSDate)ignoreRecordsAfterDate;
- (NSDate)ignoreRecordsBeforeDate;
- (NSDictionary)recordIDsByDatabaseIdentifier;
- (NSDictionary)recordsToSaveByDatabaseIdentifier;
- (NSMutableSet)completionHandlers;
- (NSString)groupName;
- (NSString)groupNameSuffix;
- (NSString)recordName;
- (PDCloudStoreContainerDatabase)containerDatabase;
- (PDCloudStoreRecordsRequest)initWithRequestType:(unint64_t)a3 storeChanges:(BOOL)a4 returnRecords:(BOOL)a5 qualityOfService:(int64_t)a6 groupName:(id)a7 groupNameSuffix:(id)a8;
- (PDCloudStoreRecordsRequestModificationOperationConfiguration)recordModificationOperationConfiguration;
- (PKCloudStoreZone)cloudStoreZone;
- (id)batchHandler;
- (id)description;
- (int64_t)batchLimit;
- (int64_t)qualityOfService;
- (unint64_t)requestType;
- (void)addCompletion:(id)a3;
- (void)callCompletionsWithResponse:(id)a3 error:(id)a4;
- (void)setBatchHandler:(id)a3;
- (void)setBatchLimit:(int64_t)a3;
- (void)setCkQuery:(id)a3;
- (void)setCloudStoreZone:(id)a3;
- (void)setCompletionHandlers:(id)a3;
- (void)setContainerDatabase:(id)a3;
- (void)setDetectConflicts:(BOOL)a3;
- (void)setFormReport:(BOOL)a3;
- (void)setGroupName:(id)a3;
- (void)setGroupNameSuffix:(id)a3;
- (void)setIgnoreChangesMadeByThisDevice:(BOOL)a3;
- (void)setIgnoreExistingRecordHash:(BOOL)a3;
- (void)setIgnoreRecordsAfterDate:(id)a3;
- (void)setIgnoreRecordsBeforeDate:(id)a3;
- (void)setIsModifyingShare:(BOOL)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setRecordIDsByDatabaseIdentifier:(id)a3;
- (void)setRecordModificationOperationConfiguration:(id)a3;
- (void)setRecordName:(id)a3;
- (void)setRecordsToSaveByDatabaseIdentifier:(id)a3;
- (void)setRequestType:(unint64_t)a3;
- (void)setReturnRecords:(BOOL)a3;
- (void)setShouldSaveToken:(BOOL)a3;
- (void)setStoreChangesInDatabase:(BOOL)a3;
- (void)setUseLastChangeToken:(BOOL)a3;
@end

@implementation PDCloudStoreRecordsRequest

- (PDCloudStoreRecordsRequest)initWithRequestType:(unint64_t)a3 storeChanges:(BOOL)a4 returnRecords:(BOOL)a5 qualityOfService:(int64_t)a6 groupName:(id)a7 groupNameSuffix:(id)a8
{
  id v15 = a7;
  id v16 = a8;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___PDCloudStoreRecordsRequest;
  v17 = -[PDCloudStoreRecordsRequest init](&v22, "init");
  v18 = v17;
  if (v17)
  {
    v17->_storeChangesInDatabase = a4;
    v17->_returnRecords = a5;
    v17->_qualityOfService = a6;
    v17->_requestType = a3;
    objc_storeStrong((id *)&v17->_groupName, a7);
    objc_storeStrong((id *)&v18->_groupNameSuffix, a8);
    v19 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    completionHandlers = v18->_completionHandlers;
    v18->_completionHandlers = v19;
  }

  return v18;
}

- (void)addCompletion:(id)a3
{
  if (a3)
  {
    completionHandlers = self->_completionHandlers;
    id v4 = objc_retainBlock(a3);
    -[NSMutableSet addObject:](completionHandlers, "addObject:", v4);
  }

- (void)callCompletionsWithResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[NSMutableSet copy](self->_completionHandlers, "copy");
  -[NSMutableSet removeAllObjects](self->_completionHandlers, "removeAllObjects");
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      v13 = 0LL;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8LL * (void)v13) + 16LL))(*(void *)(*((void *)&v14 + 1) + 8LL * (void)v13));
        v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v11);
  }
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p; ",
         objc_opt_class(self, a2),
         self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  unint64_t v6 = self->_requestType - 1;
  if (v6 > 7) {
    id v7 = @"token";
  }
  else {
    id v7 = *(&off_100652218 + v6);
  }
  [v4 appendFormat:@"type: '%@'; ", v7];
  if (self->_useLastChangeToken) {
    id v8 = @"YES";
  }
  else {
    id v8 = @"NO";
  }
  [v5 appendFormat:@"use last token: '%@'; ", v8];
  if (self->_shouldSaveToken) {
    id v9 = @"YES";
  }
  else {
    id v9 = @"NO";
  }
  [v5 appendFormat:@"should save token: '%@'; ", v9];
  if (self->_storeChangesInDatabase) {
    id v10 = @"YES";
  }
  else {
    id v10 = @"NO";
  }
  [v5 appendFormat:@"store changes: '%@'; ", v10];
  if (self->_returnRecords) {
    id v11 = @"YES";
  }
  else {
    id v11 = @"NO";
  }
  [v5 appendFormat:@"return records: '%@'; ", v11];
  [v5 appendFormat:@"group name: '%@'; ", self->_groupName];
  [v5 appendFormat:@"group name suffix: '%@'; ", self->_groupNameSuffix];
  if (self->_ckQuery) {
    [v5 appendFormat:@"ckQuery: '%@'; ", self->_ckQuery];
  }
  cloudStoreZone = self->_cloudStoreZone;
  if (cloudStoreZone)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PKCloudStoreZone zoneName](cloudStoreZone, "zoneName"));
    [v5 appendFormat:@"zoneName: '%@'; ", v13];
  }

  containerDatabase = self->_containerDatabase;
  if (containerDatabase)
  {
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerDatabase database](containerDatabase, "database"));
    uint64_t v16 = CKDatabaseScopeString([v15 scope]);
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    [v5 appendFormat:@"containerDatabase: '%@'; ", v17];
  }

  if (self->_recordModificationOperationConfiguration) {
    objc_msgSend( v5,  "appendFormat:",  @"recordModificationOperationConfiguration: '%@'; ",
  }
      self->_recordModificationOperationConfiguration);
  if (self->_ignoreExistingRecordHash) {
    [v5 appendFormat:@"ignoreExistingRecordHash: '%@'; ", @"YES"];
  }
  if (self->_isModifyingShare) {
    [v5 appendFormat:@"isModifyingShare: '%@'; ", @"YES"];
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PKCloudStoreZone containerName](self->_cloudStoreZone, "containerName"));
  [v5 appendFormat:@"containerName: '%@'; ", v18];

  [v5 appendString:@">"];
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v5));

  return v19;
}

- (BOOL)canCoalesceWithRequest:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(v4, v5);
  if ((objc_opt_isKindOfClass(self, v6) & 1) != 0)
  {
    id v7 = -[PDCloudStoreRecordsRequest requestType](self, "requestType");
    if (v7 == [v4 requestType])
    {
      unsigned int v8 = -[PDCloudStoreRecordsRequest returnRecords](self, "returnRecords");
      if (v8 == [v4 returnRecords])
      {
        unsigned int v9 = -[PDCloudStoreRecordsRequest useLastChangeToken](self, "useLastChangeToken");
        if (v9 == [v4 useLastChangeToken])
        {
          unsigned int v10 = -[PDCloudStoreRecordsRequest shouldSaveToken](self, "shouldSaveToken");
          if (v10 == [v4 shouldSaveToken])
          {
            id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreRecordsRequest containerDatabase](self, "containerDatabase"));
            uint64_t v12 = objc_claimAutoreleasedReturnValue([v4 containerDatabase]);

            if (v11 == (void *)v12)
            {
              unsigned int v13 = -[PDCloudStoreRecordsRequest detectConflicts](self, "detectConflicts");
              if (v13 == [v4 detectConflicts])
              {
                unsigned int v14 = -[PDCloudStoreRecordsRequest isModifyingShare](self, "isModifyingShare");
                if (v14 == [v4 isModifyingShare])
                {
                  switch(-[PDCloudStoreRecordsRequest requestType](self, "requestType"))
                  {
                    case 0uLL:
                    case 1uLL:
                      id v16 = v4;
                      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreRecordsRequest cloudStoreZone](self, "cloudStoreZone"));
                      if (v17)
                      {
                      }

                      else
                      {
                        v39 = (void *)objc_claimAutoreleasedReturnValue([v16 cloudStoreZone]);

                        if (!v39)
                        {
                          LOBYTE(v12) = 1;
                          goto LABEL_10;
                        }
                      }

                      id v18 = v16;
                      goto LABEL_26;
                    case 2uLL:
                    case 3uLL:
                      id v18 = v4;
LABEL_26:
                      uint64_t v12 = (uint64_t)v18;
                      id v23 = (id)objc_claimAutoreleasedReturnValue(-[PDCloudStoreRecordsRequest cloudStoreZone](self, "cloudStoreZone"));
                      uint64_t v38 = objc_claimAutoreleasedReturnValue([(id)v12 cloudStoreZone]);
                      goto LABEL_27;
                    case 4uLL:
                    case 7uLL:
                      id v19 = v4;
                      v20 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreRecordsRequest cloudStoreZone](self, "cloudStoreZone"));
                      v21 = (void *)objc_claimAutoreleasedReturnValue([v19 cloudStoreZone]);

                      int v22 = PKEqualObjects(v20, v21);
                      if (!v22) {
                        break;
                      }
                      id v23 = v19;
                      v24 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreRecordsRequest ckQuery](self, "ckQuery"));
                      v25 = (void *)objc_claimAutoreleasedReturnValue([v23 ckQuery]);
                      id v26 = v24;
                      id v27 = v25;
                      v28 = (void *)objc_claimAutoreleasedReturnValue([v26 recordType]);
                      v29 = (void *)objc_claimAutoreleasedReturnValue([v27 recordType]);
                      if (PKEqualObjects(v28, v29))
                      {
                        v30 = (void *)objc_claimAutoreleasedReturnValue([v26 predicate]);
                        v31 = (void *)objc_claimAutoreleasedReturnValue([v27 predicate]);
                        if (PKEqualObjects(v30, v31))
                        {
                          v40 = (void *)objc_claimAutoreleasedReturnValue([v26 sortDescriptors]);
                          v32 = (void *)objc_claimAutoreleasedReturnValue([v27 sortDescriptors]);
                          LOBYTE(v12) = PKEqualObjects(v40, v32);
                        }

                        else
                        {
                          LOBYTE(v12) = 0;
                        }
                      }

                      else
                      {
                        LOBYTE(v12) = 0;
                      }

                      goto LABEL_28;
                    case 5uLL:
                      id v33 = v4;
                      v34 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreRecordsRequest cloudStoreZone](self, "cloudStoreZone"));
                      uint64_t v35 = objc_claimAutoreleasedReturnValue([v33 cloudStoreZone]);
                      goto LABEL_21;
                    case 6uLL:
                      id v33 = v4;
                      v34 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreRecordsRequest recordsToSaveByDatabaseIdentifier]( self,  "recordsToSaveByDatabaseIdentifier"));
                      uint64_t v35 = objc_claimAutoreleasedReturnValue([v33 recordsToSaveByDatabaseIdentifier]);
LABEL_21:
                      v36 = (void *)v35;

                      int v37 = PKEqualObjects(v34, v36);
                      if (!v37) {
                        break;
                      }
                      uint64_t v12 = (uint64_t)v33;
                      id v23 = (id)objc_claimAutoreleasedReturnValue( -[PDCloudStoreRecordsRequest recordIDsByDatabaseIdentifier]( self,  "recordIDsByDatabaseIdentifier"));
                      uint64_t v38 = objc_claimAutoreleasedReturnValue([(id)v12 recordIDsByDatabaseIdentifier]);
LABEL_27:
                      id v26 = (id)v38;

                      LOBYTE(v12) = PKEqualObjects(v23, v26);
LABEL_28:

                      goto LABEL_10;
                    case 8uLL:
                      uint64_t v12 = (uint64_t)v4;
                      id v23 = (id)objc_claimAutoreleasedReturnValue(-[PDCloudStoreRecordsRequest recordName](self, "recordName"));
                      uint64_t v38 = objc_claimAutoreleasedReturnValue([(id)v12 recordName]);
                      goto LABEL_27;
                    default:
                      goto LABEL_10;
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  LOBYTE(v12) = 0;
LABEL_10:

  return v12 & 1;
}

- (BOOL)storeChangesInDatabase
{
  return self->_storeChangesInDatabase;
}

- (void)setStoreChangesInDatabase:(BOOL)a3
{
  self->_storeChangesInDatabase = a3;
}

- (BOOL)returnRecords
{
  return self->_returnRecords;
}

- (void)setReturnRecords:(BOOL)a3
{
  self->_returnRecords = a3;
}

- (BOOL)formReport
{
  return self->_formReport;
}

- (void)setFormReport:(BOOL)a3
{
  self->_formReport = a3;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
}

- (NSString)groupNameSuffix
{
  return self->_groupNameSuffix;
}

- (void)setGroupNameSuffix:(id)a3
{
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (BOOL)useLastChangeToken
{
  return self->_useLastChangeToken;
}

- (void)setUseLastChangeToken:(BOOL)a3
{
  self->_useLastChangeToken = a3;
}

- (BOOL)shouldSaveToken
{
  return self->_shouldSaveToken;
}

- (void)setShouldSaveToken:(BOOL)a3
{
  self->_shouldSaveToken = a3;
}

- (BOOL)detectConflicts
{
  return self->_detectConflicts;
}

- (void)setDetectConflicts:(BOOL)a3
{
  self->_detectConflicts = a3;
}

- (BOOL)isModifyingShare
{
  return self->_isModifyingShare;
}

- (void)setIsModifyingShare:(BOOL)a3
{
  self->_isModifyingShare = a3;
}

- (BOOL)ignoreChangesMadeByThisDevice
{
  return self->_ignoreChangesMadeByThisDevice;
}

- (void)setIgnoreChangesMadeByThisDevice:(BOOL)a3
{
  self->_ignoreChangesMadeByThisDevice = a3;
}

- (PDCloudStoreContainerDatabase)containerDatabase
{
  return self->_containerDatabase;
}

- (void)setContainerDatabase:(id)a3
{
}

- (PKCloudStoreZone)cloudStoreZone
{
  return self->_cloudStoreZone;
}

- (void)setCloudStoreZone:(id)a3
{
}

- (CKQuery)ckQuery
{
  return self->_ckQuery;
}

- (void)setCkQuery:(id)a3
{
}

- (int64_t)batchLimit
{
  return self->_batchLimit;
}

- (void)setBatchLimit:(int64_t)a3
{
  self->_batchLimit = a3;
}

- (id)batchHandler
{
  return self->_batchHandler;
}

- (void)setBatchHandler:(id)a3
{
}

- (NSDictionary)recordsToSaveByDatabaseIdentifier
{
  return self->_recordsToSaveByDatabaseIdentifier;
}

- (void)setRecordsToSaveByDatabaseIdentifier:(id)a3
{
}

- (NSDictionary)recordIDsByDatabaseIdentifier
{
  return self->_recordIDsByDatabaseIdentifier;
}

- (void)setRecordIDsByDatabaseIdentifier:(id)a3
{
}

- (PDCloudStoreRecordsRequestModificationOperationConfiguration)recordModificationOperationConfiguration
{
  return self->_recordModificationOperationConfiguration;
}

- (void)setRecordModificationOperationConfiguration:(id)a3
{
}

- (NSString)recordName
{
  return self->_recordName;
}

- (void)setRecordName:(id)a3
{
}

- (NSDate)ignoreRecordsBeforeDate
{
  return self->_ignoreRecordsBeforeDate;
}

- (void)setIgnoreRecordsBeforeDate:(id)a3
{
}

- (NSDate)ignoreRecordsAfterDate
{
  return self->_ignoreRecordsAfterDate;
}

- (void)setIgnoreRecordsAfterDate:(id)a3
{
}

- (BOOL)ignoreExistingRecordHash
{
  return self->_ignoreExistingRecordHash;
}

- (void)setIgnoreExistingRecordHash:(BOOL)a3
{
  self->_ignoreExistingRecordHash = a3;
}

- (NSMutableSet)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end