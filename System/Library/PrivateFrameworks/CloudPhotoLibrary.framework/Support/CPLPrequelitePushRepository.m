@interface CPLPrequelitePushRepository
- (BOOL)_createFlagsIndexes;
- (BOOL)_createIndexForFlags:(int64_t)a3;
- (BOOL)_createIndexesWithPriority:(BOOL)a3;
- (BOOL)_mergeChange:(id)a3 overChange:(id)a4 discardedUploadIdentifier:(id *)a5 error:(id *)a6;
- (BOOL)_overwriteChange:(id)a3 pushContext:(id)a4 error:(id *)a5;
- (BOOL)_storeChange:(id)a3 update:(BOOL)a4 error:(id *)a5;
- (BOOL)acknowledgeContributorsUpdates:(id)a3 error:(id *)a4;
- (BOOL)checkInBatchStorage:(id)a3 error:(id *)a4;
- (BOOL)createIndexWithName:(id)a3 withDefinition:(id)a4 unique:(BOOL)a5 error:(id *)a6;
- (BOOL)deleteAllChangesWithError:(id *)a3;
- (BOOL)deleteChangeWithScopedIdentifier:(id)a3 discardedUploadIdentifier:(id *)a4 error:(id *)a5;
- (BOOL)deleteChangeWithScopedIdentifier:(id)a3 error:(id *)a4;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 discardedUploadIdentifiers:(id *)a6 error:(id *)a7;
- (BOOL)deleteSharingFlagsWithMaxCount:(unint64_t)a3 deletedCount:(unint64_t *)a4 error:(id *)a5;
- (BOOL)fixStorageAfterAnyVersionChange;
- (BOOL)getRelatedScopedIdentifier:(id *)a3 forRecordWithScopedIdentifier:(id)a4;
- (BOOL)hasAnyChangeWithRelatedScopedIdentifier:(id)a3;
- (BOOL)hasChangesInScopeWithIdentifier:(id)a3;
- (BOOL)hasChangesInScopeWithIdentifier:(id)a3 table:(id)a4;
- (BOOL)hasChangesWithPriorityGreaterThanPriority:(unint64_t)a3 inScopeWithIdentifier:(id)a4;
- (BOOL)hasChangesWithPriorityLowerThanPriority:(unint64_t)a3 inScopeWithIdentifier:(id)a4;
- (BOOL)hasChangesWithRelatedScopedIdentifier:(id)a3 class:(Class)a4;
- (BOOL)hasChangesWithScopeFilter:(id)a3;
- (BOOL)hasSomeChangeWithScopedIdentifier:(id)a3;
- (BOOL)initializeStorage;
- (BOOL)isEmpty;
- (BOOL)reinjectChange:(id)a3 dequeueOrder:(int64_t)a4 discardedUploadIdentifier:(id *)a5 overwrittenRecord:(BOOL *)a6 error:(id *)a7;
- (BOOL)storeChange:(id)a3 pushContext:(id)a4 discardedUploadIdentifier:(id *)a5 error:(id *)a6;
- (BOOL)storeExtractedBatch:(id)a3 error:(id *)a4;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (CPLPrequelitePushRepository)initWithAbstractObject:(id)a3;
- (id)_allChangesWithScopeIdentifier:(id)a3 scopeIndex:(int64_t)a4 ordered:(BOOL)a5 table:(id)a6 query:(id)a7;
- (id)_injectionForChangeType:(unint64_t)a3;
- (id)_pqlChangeWithScopedIdentifier:(id)a3;
- (id)_scopedIdentifierForIdentifier:(id)a3 scopeIndex:(int64_t)a4;
- (id)allChangesWithClass:(Class)a3 relatedScopedIdentifier:(id)a4;
- (id)allChangesWithClass:(Class)a3 relatedScopedIdentifier:(id)a4 table:(id)a5;
- (id)allChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 changeType:(unint64_t)a5 table:(id)a6;
- (id)allChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 trashed:(BOOL)a5 table:(id)a6;
- (id)allChangesWithClass:(Class)a3 secondaryScopedIdentifier:(id)a4 table:(id)a5;
- (id)allChangesWithScopeIdentifier:(id)a3;
- (id)allChangesWithScopeIdentifier:(id)a3 table:(id)a4;
- (id)allNonDeletedChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 table:(id)a5;
- (id)changeWithScopedIdentifier:(id)a3;
- (id)checkOutBatchStorageWithPriority:(unint64_t)a3 error:(id *)a4;
- (id)contributorsUpdatesForScopeWithIdentifier:(id)a3 maxCount:(unint64_t)a4;
- (id)countPerFlagsForScopeWithIdentifier:(id)a3;
- (id)scopedIdentifiersForChangesWithFlag:(int64_t)a3 forScopeWithIdentifier:(id)a4;
- (id)status;
- (id)statusDictionary;
- (id)statusPerScopeIndex;
- (int64_t)_scopeIndexForScopeIdentifier:(id)a3;
- (int64_t)_scopeIndexForScopedIdentifier:(id)a3;
- (unint64_t)countOfChangesInScopeWithIdentifier:(id)a3;
- (unint64_t)minimumPriorityForChangesInScopeWithIdentifier:(id)a3;
- (void)writeTransactionDidFail;
- (void)writeTransactionDidSucceed;
@end

@implementation CPLPrequelitePushRepository

- (CPLPrequelitePushRepository)initWithAbstractObject:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CPLPrequelitePushRepository;
  v3 = -[CPLPrequeliteStorage initWithAbstractObject:](&v10, "initWithAbstractObject:", a3);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v5 = *(void **)(v3 + 36);
    *(void *)(v3 + 36) = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dataType](&OBJC_CLASS___CPLPrequeliteType, "dataType"));
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v3 variableWithName:@"extractedBatch" type:v6]);
    v8 = *(void **)(v3 + 44);
    *(void *)(v3 + 44) = v7;

    [*(id *)(v3 + 44) setShouldNotCacheValue:1];
  }

  return (CPLPrequelitePushRepository *)v3;
}

- (BOOL)_createIndexForFlags:(int64_t)a3
{
  v5 = objc_autoreleasePoolPush();
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 pqlConnection]);

  v8 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"flags%ld", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable indexVariableForVariableWithName:forTable:]( &OBJC_CLASS___CPLPrequeliteVariable,  "indexVariableForVariableWithName:forTable:",  v8,  v9));

  v11 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"(flags & %ld) != 0",  a3);
  v12 = objc_alloc(&OBJC_CLASS___PQLRawInjection);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSString dataUsingEncoding:](v11, "dataUsingEncoding:", 4LL));
  v14 = -[PQLRawInjection initWithData:](v12, "initWithData:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  LOBYTE(v13) = [v7 cplExecute:@"CREATE INDEX IF NOT EXISTS %@ ON %@ (scopeIndex, flags) WHERE %@", v10, v15, v14];

  objc_autoreleasePoolPop(v5);
  return (char)v13;
}

- (BOOL)_createFlagsIndexes
{
  BOOL v3 = -[CPLPrequelitePushRepository _createIndexForFlags:](self, "_createIndexForFlags:", 1LL);
  if (v3)
  {
    unint64_t v4 = 0LL;
    do
    {
      unint64_t v5 = v4;
      if (v4 == 2) {
        break;
      }
      unsigned __int8 v6 = -[CPLPrequelitePushRepository _createIndexForFlags:](self, "_createIndexForFlags:", qword_100219D18[v4 + 1]);
      unint64_t v4 = v5 + 1;
    }

    while ((v6 & 1) != 0);
    LOBYTE(v3) = v5 > 1;
  }

  return v3;
}

- (BOOL)createIndexWithName:(id)a3 withDefinition:(id)a4 unique:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  if (BYTE4(self->_batchStoragesPerPriority))
  {
    id v10 = a4;
    id v11 = (id)objc_claimAutoreleasedReturnValue([a3 stringByAppendingString:@".pri"]);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(@"priority, ", "stringByAppendingString:", v10));

    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___CPLPrequelitePushRepository;
    BOOL v13 = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( &v15,  "createIndexWithName:withDefinition:unique:error:",  v11,  v12,  v7,  a6);
  }

  else
  {
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___CPLPrequelitePushRepository;
    id v11 = a4;
    BOOL v13 = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( &v16,  "createIndexWithName:withDefinition:unique:error:",  a3,  v11,  v7,  a6);
  }

  return v13;
}

- (BOOL)_createIndexesWithPriority:(BOOL)a3
{
  BYTE4(self->_batchStoragesPerPriority) = a3;
  unsigned int v4 = -[CPLPrequelitePushRepository createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"scopedIdentifier",  @"scopeIndex, identifier",  0LL,  0LL);
  BOOL result = 0;
  if (v4)
  {
    unsigned int v6 = -[CPLPrequelitePushRepository createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"relatedIdentifier",  @"class, scopeIndex, relatedIdentifier",  0LL,  0LL);
    BOOL result = 0;
    if (v6)
    {
      unsigned int v7 = -[CPLPrequelitePushRepository createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"secondaryIdentifier",  @"class, scopeIndex, secondaryIdentifier",  0LL,  0LL);
      BOOL result = 0;
      if (v7)
      {
        unsigned int v8 = -[CPLPrequelitePushRepository createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"class",  @"scopeIndex, class, dequeueOrder DESC",  0LL,  0LL);
        BOOL result = 0;
        if (v8)
        {
          unsigned int v9 = -[CPLPrequelitePushRepository createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"dequeueOrder",  @"scopeIndex, dequeueOrder DESC",  0LL,  0LL);
          BOOL result = 0;
          if (v9)
          {
            unsigned int v10 = -[CPLPrequelitePushRepository createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"class.trashed",  @"scopeIndex, class, trashed, dequeueOrder DESC",  0LL,  0LL);
            BOOL result = 0;
            if (v10)
            {
              unsigned int v11 = -[CPLPrequelitePushRepository createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"class.changeType",  @"scopeIndex, class, changeType, dequeueOrder DESC",  0LL,  0LL);
              BOOL result = 0;
              if (v11) {
                BOOL result = -[CPLPrequelitePushRepository createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"flags",  @"scopeIndex, flags",  0LL,  0LL);
              }
            }
          }
        }
      }
    }
  }

  BYTE4(self->_batchStoragesPerPriority) = 0;
  return result;
}

- (BOOL)initializeStorage
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CPLPrequelitePushRepository;
  BOOL v3 = -[CPLPrequeliteStorage initializeStorage](&v7, "initializeStorage");
  if (v3)
  {
    BOOL v3 = -[CPLPrequeliteStorage createMainTableWithDefinition:error:]( self,  "createMainTableWithDefinition:error:",  @"class TEXT NOT NULL,scopeIndex INTEGER NOT NULL,identifier TEXT NOT NULL,changeType INTEGER NOT NULL,relatedIdentifier TEXT,secondaryIdentifier TEXT,dequeueOrder INTEGER NOT NULL,trashed INTEGER NOT NULL,uploadIdentifier TEXT,flags INTEGER NOT NULL DEFAULT 0,priority INTEGER NOT NULL DEFAULT 0,trustLevel INTEGER NOT NULL DEFAULT 0,serializedRecord DATA",  0LL);
    if (v3)
    {
      unsigned int v4 = -[CPLPrequelitePushRepository _createIndexesWithPriority:](self, "_createIndexesWithPriority:", 0LL);
      LOBYTE(v3) = 0;
      if (v4)
      {
        BOOL v3 = -[CPLPrequelitePushRepository _createIndexesWithPriority:](self, "_createIndexesWithPriority:", 1LL);
        if (v3)
        {
          uint64_t v5 = *(uint64_t *)((char *)&self->_injectionPerChangeType + 4);
          if (!v5
            || (BOOL v3 = -[CPLPrequeliteStorage createVariable:defaultValue:error:]( self,  "createVariable:defaultValue:error:",  v5,  0LL,  0LL)))
          {
            LOBYTE(v3) = -[CPLPrequelitePushRepository _createFlagsIndexes](self, "_createFlagsIndexes");
          }
        }
      }
    }
  }

  return v3;
}

- (BOOL)fixStorageAfterAnyVersionChange
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CPLPrequelitePushRepository;
  BOOL v3 = -[CPLPrequeliteStorage fixStorageAfterAnyVersionChange](&v5, "fixStorageAfterAnyVersionChange");
  if (v3) {
    LOBYTE(v3) = -[CPLPrequelitePushRepository _createFlagsIndexes](self, "_createFlagsIndexes");
  }
  return v3;
}

- (BOOL)upgradeStorageToVersion:(int64_t)a3
{
  v68.receiver = self;
  v68.super_class = (Class)&OBJC_CLASS___CPLPrequelitePushRepository;
  if (!-[CPLPrequeliteStorage upgradeStorageToVersion:](&v68, "upgradeStorageToVersion:")) {
    return 0;
  }
  unsigned __int8 v5 = 1;
  if (a3 <= 57)
  {
    if (a3 <= 38)
    {
      if (a3 == 31) {
        return -[CPLPrequeliteStorage createStorage](self, "createStorage");
      }
      if (a3 != 32 || !-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema")) {
        return v5;
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 pqlConnection]);

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
      unsigned int v23 = [v21 tableHasRecords:v22];

      if (v23)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
        [v24 recordUpgradeEvent:@"Adding trust level column will mark all existing changes as un-trustable"];
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
      unsigned __int8 v5 = [v20 cplExecute:@"ALTER TABLE %@ ADD COLUMN trustLevel INTEGER DEFAULT 2", v25];

      goto LABEL_81;
    }

    if (a3 != 39)
    {
      if (a3 != 48)
      {
        if (a3 == 57)
        {
          unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
          objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
          unsigned int v8 = [v6 tableHasRecords:v7];

          if (v8)
          {
            unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
            unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 abstractObject]);
            unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 scopes]);
            v12 = (void *)objc_claimAutoreleasedReturnValue([v11 platformObject]);

            unsigned __int8 v5 = [v12 forcePushToTransportForActiveScopesWithError:0];
          }

          else
          {
            return 1;
          }
        }

        return v5;
      }

      if (!-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema")) {
        return v5;
      }
      return -[CPLPrequeliteStorage recreateMainTableWithCopyInstructions:oldFields:error:]( self,  "recreateMainTableWithCopyInstructions:oldFields:error:",  @"class, scopeIndex, identifier, changeType, relatedIdentifier, secondaryIdentifier, dequeueOrder, trashed, uploadIdentifier, flags, priority, trustLevel, serializedRecord",  @"class, scopeIndex, identifier, changeType, relatedIdentifier, secondaryIdentifier, dequeueOrder, trashed, uploadIdentifier, flags, priority, trustLevel, serializedRecord",  0LL);
    }

    if (!-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema")) {
      return v5;
    }
    if (-[CPLPrequeliteStorage recreateMainTableWithCopyInstructions:oldFields:error:]( self,  "recreateMainTableWithCopyInstructions:oldFields:error:",  @"class, scopeIndex, identifier, changeType, relatedIdentifier, secondaryIdentifier, dequeueOrder, trashed, uploadIdentifier, flags, priority, trustLevel, serializedRecord",  @"class, 1, identifier, changeType, relatedIdentifier, secondaryIdentifier, dequeueOrder, trashed, uploadIdentifier, 0, 0, trustLevel, serializedRecord",  0LL))
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequelitePushRepository storedExtractedBatch](self, "storedExtractedBatch"));
      v20 = v49;
      if (v49)
      {
        [v49 forceScopeIndexOnAllRecordsTo:1];
        unsigned __int8 v50 = -[CPLPrequelitePushRepository storeExtractedBatch:error:](self, "storeExtractedBatch:error:", v20, 0LL);
LABEL_64:
        unsigned __int8 v5 = v50;
      }

- (id)_scopedIdentifierForIdentifier:(id)a3 scopeIndex:(int64_t)a4
{
  id v6 = a3;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequelitePushRepository abstractObject](self, "abstractObject"));
  id v8 = [v7 scopeType];

  switch((unint64_t)v8)
  {
    case 0uLL:
    case 3uLL:
      sub_10019C448();
    case 1uLL:
      uint64_t v9 = objc_claimAutoreleasedReturnValue( -[CPLPrequeliteStorage scopedIdentifierForLocalIdentifier:scopeIndex:]( self,  "scopedIdentifierForLocalIdentifier:scopeIndex:",  v6,  a4));
      goto LABEL_4;
    case 2uLL:
      uint64_t v9 = objc_claimAutoreleasedReturnValue( -[CPLPrequeliteStorage scopedIdentifierForCloudIdentifier:scopeIndex:]( self,  "scopedIdentifierForCloudIdentifier:scopeIndex:",  v6,  a4));
LABEL_4:
      unsigned int v10 = (void *)v9;
      break;
    default:
      unsigned int v10 = 0LL;
      break;
  }

  return v10;
}

- (int64_t)_scopeIndexForScopeIdentifier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequelitePushRepository abstractObject](self, "abstractObject"));
  id v6 = [v5 scopeType];

  switch((unint64_t)v6)
  {
    case 0uLL:
    case 3uLL:
      sub_10019C4B8();
    case 1uLL:
      int64_t v7 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", v4);
      goto LABEL_4;
    case 2uLL:
      int64_t v7 = -[CPLPrequeliteStorage cloudScopeIndexForScopeIdentifier:](self, "cloudScopeIndexForScopeIdentifier:", v4);
LABEL_4:
      int64_t v8 = v7;
      break;
    default:
      int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
      break;
  }

  return v8;
}

- (int64_t)_scopeIndexForScopedIdentifier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequelitePushRepository abstractObject](self, "abstractObject"));
  id v6 = [v5 scopeType];

  switch((unint64_t)v6)
  {
    case 0uLL:
    case 3uLL:
      sub_10019C528();
    case 1uLL:
      int64_t v7 = -[CPLPrequeliteStorage scopeIndexForLocalScopedIdentifier:](self, "scopeIndexForLocalScopedIdentifier:", v4);
      goto LABEL_4;
    case 2uLL:
      int64_t v7 = -[CPLPrequeliteStorage scopeIndexForCloudScopedIdentifier:](self, "scopeIndexForCloudScopedIdentifier:", v4);
LABEL_4:
      int64_t v8 = v7;
      break;
    default:
      int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
      break;
  }

  return v8;
}

- (unint64_t)countOfChangesInScopeWithIdentifier:(id)a3
{
  int64_t v4 = -[CPLPrequelitePushRepository _scopeIndexForScopeIdentifier:](self, "_scopeIndexForScopeIdentifier:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0LL;
  }
  int64_t v6 = v4;
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"scopeIndex = %ld",  v6));
  id v10 = [v7 table:v8 countOfRecordsMatchingQuery:v9];

  return (unint64_t)v10;
}

- (BOOL)hasChangesInScopeWithIdentifier:(id)a3 table:(id)a4
{
  id v6 = a4;
  int64_t v7 = -[CPLPrequelitePushRepository _scopeIndexForScopeIdentifier:](self, "_scopeIndexForScopeIdentifier:", a3);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v8 = 0;
  }

  else
  {
    int64_t v9 = v7;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"scopeIndex = %ld",  v9));
    unsigned __int8 v8 = [v10 table:v6 hasRecordsMatchingQuery:v11];
  }

  return v8;
}

- (BOOL)hasChangesInScopeWithIdentifier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  LOBYTE(self) = -[CPLPrequelitePushRepository hasChangesInScopeWithIdentifier:table:]( self,  "hasChangesInScopeWithIdentifier:table:",  v4,  v5);

  return (char)self;
}

- (unint64_t)minimumPriorityForChangesInScopeWithIdentifier:(id)a3
{
  int64_t v4 = -[CPLPrequelitePushRepository _scopeIndexForScopeIdentifier:](self, "_scopeIndexForScopeIdentifier:", a3);
  unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v6 = v4;
    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pqlConnection]);

    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v11 = [v8 cplFetchObjectOfClass:v9, @"SELECT priority FROM %@ where scopeIndex = %ld ORDER BY priority LIMIT 1", v10, v6 sql];

    if (v11) {
      unint64_t v5 = (unint64_t)[v11 unsignedIntegerValue];
    }
    else {
      unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return v5;
}

- (BOOL)hasChangesWithPriorityLowerThanPriority:(unint64_t)a3 inScopeWithIdentifier:(id)a4
{
  int64_t v6 = -[CPLPrequelitePushRepository _scopeIndexForScopeIdentifier:](self, "_scopeIndexForScopeIdentifier:", a4);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  int64_t v8 = v6;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"priority < %lu AND scopeIndex = %ld",  a3,  v8));
  LOBYTE(v8) = [v9 table:v10 hasRecordsMatchingQuery:v11];

  return v8;
}

- (BOOL)hasChangesWithPriorityGreaterThanPriority:(unint64_t)a3 inScopeWithIdentifier:(id)a4
{
  int64_t v6 = -[CPLPrequelitePushRepository _scopeIndexForScopeIdentifier:](self, "_scopeIndexForScopeIdentifier:", a4);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  int64_t v8 = v6;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"priority > %lu AND scopeIndex = %ld",  a3,  v8));
  LOBYTE(v8) = [v9 table:v10 hasRecordsMatchingQuery:v11];

  return v8;
}

- (BOOL)hasChangesWithScopeFilter:(id)a3
{
  id v4 = a3;
  if (!-[CPLPrequelitePushRepository isEmpty](self, "isEmpty"))
  {
    id v6 = v4;
    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 includedScopeIdentifiers]);

    if (v7)
    {
      int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 localIndexes]);
      id v9 = [v8 count];

      if (!v9)
      {
        unsigned __int8 v5 = 0;
LABEL_9:

        goto LABEL_10;
      }
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 excludedScopeIdentifiers]);

      if (v10)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 localIndexes]);
        id v12 = [v11 count];

        if (!v12)
        {
          unsigned __int8 v5 = 1;
          goto LABEL_9;
        }
      }
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v6 localIndexesInjection]);
    unsigned __int8 v5 = [v13 table:v14 hasRecordsMatchingQuery:v15];

    goto LABEL_9;
  }

  unsigned __int8 v5 = 0;
LABEL_10:

  return v5;
}

- (id)_pqlChangeWithScopedIdentifier:(id)a3
{
  id v5 = a3;
  if ([v5 scopeIndex] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = (CPLPrequelitePushRepository *)sub_10019C598(v5, a2, self);
    return (id)-[CPLPrequelitePushRepository _storeChange:update:error:](v14, v15, v16, v17, v18);
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 pqlConnection]);

    uint64_t v8 = objc_opt_class(&OBJC_CLASS___CPLPrequelitePushedChange);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v10 = [v5 scopeIndex];
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    id v12 = [v7 cplFetchObjectOfClass:v8, @"SELECT class, scopeIndex, identifier, changeType, relatedIdentifier, secondaryIdentifier, dequeueOrder, trashed, uploadIdentifier, flags, priority, trustLevel, serializedRecord FROM %@ WHERE scopeIndex = %ld AND identifier = %@", v9, v10, v11 sql];

    return v12;
  }

- (BOOL)_storeChange:(id)a3 update:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 pqlConnection]);

  v67 = a5;
  objc_super v68 = (void *)v10;
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  if (v6)
  {
    if (v8)
    {
      id v11 = NSStringFromClass((Class)v8[3]);
      v58 = (void *)objc_claimAutoreleasedReturnValue(v11);
      uint64_t v60 = v8[4];
      id v12 = (id)v8[5];
      uint64_t v54 = *((unsigned int *)v8 + 12);
      id v13 = (id)v8[7];
      id v56 = (id)v8[8];
      uint64_t v52 = *((unsigned __int8 *)v8 + 8);
      uint64_t v50 = v8[9];
      v14 = (void *)v8[10];
    }

    else
    {
      id v45 = NSStringFromClass(0LL);
      v58 = (void *)objc_claimAutoreleasedReturnValue(v45);
      uint64_t v52 = 0LL;
      id v56 = 0LL;
      uint64_t v54 = 0LL;
      uint64_t v60 = 0LL;
      id v12 = 0LL;
      id v13 = 0LL;
      uint64_t v50 = 0LL;
      v14 = 0LL;
    }

    id v65 = v14;
    SEL v15 = (void *)objc_claimAutoreleasedReturnValue([v65 uploadIdentifier]);
    if (v8) {
      id v16 = (void *)v8[10];
    }
    else {
      id v16 = 0LL;
    }
    id v17 = v16;
    id v18 = [v17 flags];
    if (v8) {
      v19 = (void *)v8[10];
    }
    else {
      v19 = 0LL;
    }
    id v20 = v19;
    id v21 = [v20 priority];
    if (v8)
    {
      uint64_t v22 = *((unsigned int *)v8 + 3);
      unsigned int v23 = sub_10017CD50(v8);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      uint64_t v25 = v8[4];
      uint64_t v26 = v8[5];
    }

    else
    {
      uint64_t v25 = 0LL;
      uint64_t v22 = 0LL;
      v24 = 0LL;
      uint64_t v26 = 0LL;
    }

    uint64_t v48 = v22;
    v27 = v68;
    unsigned __int8 v61 = [v68 cplExecute:@"UPDATE %@ SET class = %@, scopeIndex = %ld, identifier = %@, changeType = %i, relatedIdentifier = %@, secondaryIdentifier = %@, dequeueOrder = %ld, trashed = %i, uploadIdentifier = %@, flags = %ld, priority = %lu, trustLevel = %i, serializedRecord = %@ WHERE scopeIndex = %ld AND identifier = %@", v69, v58, v60, v12, v54, v13, v56, v50, v52, v15, v18, v21, v48, v24, v25, v26];

    if ((v61 & 1) != 0)
    {
      BOOL v28 = 1;
      goto LABEL_27;
    }

    goto LABEL_25;
  }

  if (v8)
  {
    v29 = NSStringFromClass((Class)v8[3]);
    v59 = (void *)objc_claimAutoreleasedReturnValue(v29);
    uint64_t v62 = v8[4];
    id v49 = (id)v8[5];
    uint64_t v55 = *((unsigned int *)v8 + 12);
    id v30 = (id)v8[7];
    id v57 = (id)v8[8];
    uint64_t v53 = *((unsigned __int8 *)v8 + 8);
    uint64_t v51 = v8[9];
    v31 = (void *)v8[10];
  }

  else
  {
    uint64_t v46 = NSStringFromClass(0LL);
    v59 = (void *)objc_claimAutoreleasedReturnValue(v46);
    uint64_t v53 = 0LL;
    id v57 = 0LL;
    uint64_t v55 = 0LL;
    uint64_t v62 = 0LL;
    id v49 = 0LL;
    uint64_t v51 = 0LL;
    id v30 = 0LL;
    v31 = 0LL;
  }

  id v32 = v31;
  v33 = (void *)objc_claimAutoreleasedReturnValue([v32 uploadIdentifier]);
  if (v8) {
    v34 = (void *)v8[10];
  }
  else {
    v34 = 0LL;
  }
  id v35 = v34;
  id v36 = [v35 flags];
  v66 = v32;
  if (v8) {
    id v37 = (void *)v8[10];
  }
  else {
    id v37 = 0LL;
  }
  id v38 = v37;
  id v39 = [v38 priority];
  uint64_t v64 = v35;
  if (v8) {
    uint64_t v40 = *((unsigned int *)v8 + 3);
  }
  else {
    uint64_t v40 = 0LL;
  }
  id v41 = sub_10017CD50(v8);
  id v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  id v47 = v39;
  v27 = v68;
  unsigned __int8 v63 = [v68 cplExecute:@"INSERT INTO %@ (class, scopeIndex, identifier, changeType, relatedIdentifier, secondaryIdentifier, dequeueOrder, trashed, uploadIdentifier, flags, priority, trustLevel, serializedRecord) VALUES (%@, %ld, %@, %i, %@, %@, %ld, %i, %@, %ld, %lu, %i, %@)", v69, v59, v62, v49, v55, v30, v57, v51, v53, v33, v36, v47, v40, v42];

  if ((v63 & 1) == 0)
  {
LABEL_25:
    BOOL v28 = 0;
    if (v67) {
      id *v67 = (id)objc_claimAutoreleasedReturnValue([v27 lastCPLError]);
    }
    goto LABEL_27;
  }

  if (v8) {
    v43 = (void *)v8[10];
  }
  else {
    v43 = 0LL;
  }
  BOOL v28 = 1;
  if ([v43 flags]) {
    BYTE4(self->_cachedExtractedBatch) = 1;
  }
LABEL_27:

  return v28;
}

- (BOOL)_mergeChange:(id)a3 overChange:(id)a4 discardedUploadIdentifier:(id *)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = v12;
  if (v11)
  {
    int v14 = *((_DWORD *)v11 + 3);
    if (v12)
    {
LABEL_3:
      int v15 = *((_DWORD *)v12 + 3);
      goto LABEL_4;
    }
  }

  else
  {
    int v14 = 0;
    if (v12) {
      goto LABEL_3;
    }
  }

  int v15 = 0;
LABEL_4:
  id v56 = a6;
  BOOL v55 = (v15 | v14) != 0;
  if (v11) {
    id v16 = (void *)*((void *)v11 + 10);
  }
  else {
    id v16 = 0LL;
  }
  id v17 = v16;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 uploadIdentifier]);
  if (v13) {
    v19 = (void *)v13[10];
  }
  else {
    v19 = 0LL;
  }
  id v20 = v19;
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v17 uploadIdentifier]);
  if (v21)
  {

LABEL_12:
    *a5 = (id)objc_claimAutoreleasedReturnValue([v20 uploadIdentifier]);
    goto LABEL_13;
  }

  if (v11 && *((void *)v11 + 6) == 1024LL) {
    goto LABEL_12;
  }
  uint64_t v45 = objc_claimAutoreleasedReturnValue([v20 uploadIdentifier]);

  id v18 = (void *)v45;
LABEL_13:
  id v22 = [v20 flags];
  if (v11)
  {
    unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v17,  "pushContextMergingFlags:changeType:uploadIdentifier:priority:",  v22,  *((void *)v11 + 6),  v18,  objc_msgSend(v17, "priority")));
    sub_10017D100((uint64_t)v11, v23);

    v24 = (void *)*((void *)v11 + 10);
  }

  else
  {
    uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v17,  "pushContextMergingFlags:changeType:uploadIdentifier:priority:",  v22,  0,  v18,  objc_msgSend(v17, "priority")));
    sub_10017D100(0LL, v53);

    v24 = 0LL;
  }

  id v25 = v24;
  id v26 = [v25 flags];
  id v27 = [v20 flags];

  if (v26 != v27) {
    BYTE4(self->_cachedExtractedBatch) = 1;
  }
  if (v13 && v13[6] == 1024LL)
  {
    if (v11)
    {
      if (*((void *)v11 + 6) == 2LL)
      {
        uint64_t v28 = objc_opt_class(v13);
        if (v28 == objc_opt_class(&OBJC_CLASS___CPLContainerRelationChange))
        {
          *((void *)v11 + 6) = 0LL;
          [*((id *)v11 + 11) setChangeType:0];
          if (!_CPLSilentLogging)
          {
            id v29 = sub_10017CB04();
            id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              id v31 = sub_10017CDD4((uint64_t)v11, self);
              id v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
              *(_DWORD *)buf = 138412290;
              id v58 = v32;
              _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "Got an update over a delete (automatically fixing it): %@",  buf,  0xCu);
            }
          }
        }
      }

- (BOOL)storeChange:(id)a3 pushContext:(id)a4 discardedUploadIdentifier:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 scopedIdentifier]);
  if (-[CPLPrequelitePushRepository _scopeIndexForScopedIdentifier:](self, "_scopeIndexForScopedIdentifier:", v12) == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v13 = 0;
    if (a6) {
      *a6 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopedIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopedIdentifier:",  v12));
    }
  }

  else
  {
    int v14 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequelitePushRepository _pqlChangeWithScopedIdentifier:]( self,  "_pqlChangeWithScopedIdentifier:",  v12));
    int v15 = sub_10017C958((id *)objc_alloc(&OBJC_CLASS___CPLPrequelitePushedChange), v10, v11);
    if (v14) {
      unsigned __int8 v16 = -[CPLPrequelitePushRepository _mergeChange:overChange:discardedUploadIdentifier:error:]( self,  "_mergeChange:overChange:discardedUploadIdentifier:error:",  v15,  v14,  a5,  a6);
    }
    else {
      unsigned __int8 v16 = -[CPLPrequelitePushRepository _storeChange:update:error:](self, "_storeChange:update:error:", v15, 0LL, a6);
    }
    BOOL v13 = v16;
  }

  return v13;
}

- (BOOL)_overwriteChange:(id)a3 pushContext:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 scopedIdentifier]);
  if (-[CPLPrequelitePushRepository _scopeIndexForScopedIdentifier:](self, "_scopeIndexForScopedIdentifier:", v10) == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v11 = 0;
    if (a5) {
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopedIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopedIdentifier:",  v10));
    }
  }

  else
  {
    id v12 = sub_10017C958((id *)objc_alloc(&OBJC_CLASS___CPLPrequelitePushedChange), v8, v9);
    BOOL v11 = -[CPLPrequelitePushRepository _storeChange:update:error:](self, "_storeChange:update:error:", v12, 1LL, a5);
  }

  return v11;
}

- (BOOL)reinjectChange:(id)a3 dequeueOrder:(int64_t)a4 discardedUploadIdentifier:(id *)a5 overwrittenRecord:(BOOL *)a6 error:(id *)a7
{
  id v13 = a3;
  int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 scopedIdentifier]);
  id v15 = [v14 scopeIndex];

  if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    sub_10019C858(v13, a2, self);
  }

  else
  {
    unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v13 scopedIdentifier]);
    a2 = (SEL)objc_claimAutoreleasedReturnValue( -[CPLPrequelitePushRepository _pqlChangeWithScopedIdentifier:]( self,  "_pqlChangeWithScopedIdentifier:",  v16));

    *a6 = a2 != 0LL;
    id v17 = objc_alloc(&OBJC_CLASS___CPLPrequelitePushedChange);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v13 _pushContext]);
    a6 = (BOOL *)sub_10017C958((id *)&v17->super.isa, v13, v18);

    if (a6)
    {
      int v19 = *((_DWORD *)a6 + 3);
      if (v19 <= 1) {
        int v19 = 1;
      }
      *((_DWORD *)a6 + 3) = v19;
      if (a2) {
        goto LABEL_6;
      }
      if (*((void *)a6 + 9) < a4) {
        *((void *)a6 + 9) = a4;
      }
LABEL_9:
      unsigned __int8 v20 = -[CPLPrequelitePushRepository _storeChange:update:error:](self, "_storeChange:update:error:", a6, 0LL, a7);
      goto LABEL_10;
    }
  }

  if (!a2) {
    goto LABEL_9;
  }
LABEL_6:
  unsigned __int8 v20 = -[CPLPrequelitePushRepository _mergeChange:overChange:discardedUploadIdentifier:error:]( self,  "_mergeChange:overChange:discardedUploadIdentifier:error:",  a2,  a6,  a5,  a7);
LABEL_10:
  BOOL v21 = v20;

  return v21;
}

- (BOOL)deleteChangeWithScopedIdentifier:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if ([v7 scopeIndex] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v15 = (CPLPrequelitePushRepository *)sub_10019C92C(v7, a2, self);
    return -[CPLPrequelitePushRepository deleteChangeWithScopedIdentifier:discardedUploadIdentifier:error:]( v15,  v16,  v17,  v18,  v19);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 pqlConnection]);

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v11 = [v7 scopeIndex];
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    unsigned __int8 v13 = [v9 cplExecute:@"DELETE FROM %@ WHERE scopeIndex = %ld AND identifier = %@", v10, v11, v12];

    if ((v13 & 1) != 0)
    {
      BYTE4(self->_cachedExtractedBatch) = 1;
    }

    else if (a4)
    {
      *a4 = (id)objc_claimAutoreleasedReturnValue([v9 lastCPLError]);
    }

    return v13;
  }

- (BOOL)deleteChangeWithScopedIdentifier:(id)a3 discardedUploadIdentifier:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  if ([v8 scopeIndex] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = sub_10019CA00(v8, a2, self);
    goto LABEL_8;
  }

  uint64_t v9 = objc_claimAutoreleasedReturnValue(-[CPLPrequelitePushRepository _pqlChangeWithScopedIdentifier:](self, "_pqlChangeWithScopedIdentifier:", v8));
  a2 = (SEL)v9;
  if (!v9)
  {
LABEL_8:
    *a4 = (id)objc_claimAutoreleasedReturnValue([(id)v9 uploadIdentifier]);
    LOBYTE(v17) = 1;
    goto LABEL_6;
  }

  id v10 = *(id *)(v9 + 80);
  id v11 = (id)objc_claimAutoreleasedReturnValue([v10 uploadIdentifier]);

  *a4 = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 pqlConnection]);

  int v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v15 = [v8 scopeIndex];
  SEL v16 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  unsigned int v17 = [v13 cplExecute:@"DELETE FROM %@ WHERE scopeIndex = %ld AND identifier = %@", v14, v15, v16];

  if (v17) {
    BYTE4(self->_cachedExtractedBatch) = 1;
  }

LABEL_6:
  return v17;
}

- (BOOL)hasSomeChangeWithScopedIdentifier:(id)a3
{
  id v5 = a3;
  if ([v5 scopeIndex] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = (CPLPrequelitePushRepository *)sub_10019CAD4(v5, a2, self);
    return -[CPLPrequelitePushRepository deleteAllChangesWithError:](v12, v13, v14);
  }

  else
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v8 = [v5 scopeIndex];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"scopeIndex = %ld AND identifier = %@",  v8,  v9));
    LOBYTE(v8) = [v6 table:v7 hasRecordsMatchingQuery:v10];

    return (char)v8;
  }

- (BOOL)deleteAllChangesWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pqlConnection]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned __int8 v8 = [v6 cplExecute:@"DELETE FROM %@", v7];

  if (a3 && (v8 & 1) == 0) {
    *a3 = (id)objc_claimAutoreleasedReturnValue([v6 lastCPLError]);
  }

  return v8;
}

- (BOOL)storeExtractedBatch:(id)a3 error:(id *)a4
{
  id v8 = a3;
  if (!*(NSMutableDictionary **)((char *)&self->_injectionPerChangeType + 4)) {
    sub_10019CBA8( (uint64_t)self,  (uint64_t)a2,  v9,  v10,  v11,  v12,  v13,  v14,  v24,  (uint64_t)v25,  v26,  v27,  v28,  v29,  v30,  v31,  v32,  v33,  v34,  vars0,  vars8);
  }
  id v15 = v8;
  SEL v16 = objc_autoreleasePoolPush();
  if (!v15) {
    goto LABEL_5;
  }
  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver cpl_archivedDataWithRootObject:]( &OBJC_CLASS___NSKeyedArchiver,  "cpl_archivedDataWithRootObject:",  v15));
  if (!v17)
  {
    sub_10019CCAC(v15, a2, self);
LABEL_5:
    unsigned int v17 = 0LL;
  }

  BYTE4(self->_extractedBatchVar) = 1;
  id v18 = (void **)(&self->_hasCachedExtractedBatch + 4);
  objc_storeStrong((id *)(&self->_hasCachedExtractedBatch + 4), a3);
  uint64_t v19 = *(uint64_t *)((char *)&self->_injectionPerChangeType + 4);
  id v25 = 0LL;
  BOOL v20 = -[CPLPrequeliteStorage setValue:forVariable:error:](self, "setValue:forVariable:error:", v17, v19, &v25);
  id v21 = v25;

  objc_autoreleasePoolPop(v16);
  if (!v20)
  {
    BYTE4(self->_extractedBatchVar) = 0;
    id v22 = *v18;
    id *v18 = 0LL;

    if (a4) {
      *a4 = v21;
    }
  }

  return v20;
}

- (id)changeWithScopedIdentifier:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequelitePushRepository _pqlChangeWithScopedIdentifier:]( self,  "_pqlChangeWithScopedIdentifier:",  a3));
  id v5 = sub_10017CDD4((uint64_t)v4, self);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)_allChangesWithScopeIdentifier:(id)a3 scopeIndex:(int64_t)a4 ordered:(BOOL)a5 table:(id)a6 query:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL
    && (a4 = -[CPLPrequelitePushRepository _scopeIndexForScopeIdentifier:](self, "_scopeIndexForScopeIdentifier:", v12),
        a4 == 0x7FFFFFFFFFFFFFFFLL))
  {
    id v15 = (CPLPrequeliteSkipNullEnumerator *)&__NSArray0__struct;
  }

  else
  {
    SEL v16 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 pqlConnection]);

    if (v9) {
      id v18 = @"SELECT class, scopeIndex, identifier, changeType, relatedIdentifier, secondaryIdentifier, dequeueOrder, trashed, uploadIdentifier, flags, priority, trustLevel, serializedRecord FROM %@ WHERE %@ AND scopeIndex = %ld ORDER BY dequeueOrder DESC, rowID DESC";
    }
    else {
      id v18 = @"SELECT class, scopeIndex, identifier, changeType, relatedIdentifier, secondaryIdentifier, dequeueOrder, trashed, uploadIdentifier, flags, priority, trustLevel, serializedRecord FROM %@ WHERE %@ AND scopeIndex = %ld";
    }
    id v19 = objc_msgSend(v17, "cplFetch:", v18, v13, v14, a4);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10017FFD0;
    v22[3] = &unk_100247278;
    v22[4] = self;
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v19 enumerateObjects:v22]);
    id v15 = -[CPLPrequeliteSkipNullEnumerator initWithEnumerator:]( objc_alloc(&OBJC_CLASS___CPLPrequeliteSkipNullEnumerator),  "initWithEnumerator:",  v20);
  }

  return v15;
}

- (id)allChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 trashed:(BOOL)a5 table:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = NSStringFromClass(a3);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"class = %@ AND trashed = %i",  v13,  v6));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequelitePushRepository _allChangesWithScopeIdentifier:scopeIndex:ordered:table:query:]( self,  "_allChangesWithScopeIdentifier:scopeIndex:ordered:table:query:",  v11,  0x7FFFFFFFFFFFFFFFLL,  1LL,  v10,  v14));

  return v15;
}

- (id)_injectionForChangeType:(unint64_t)a3
{
  id v5 = *(void **)(&self->super._shouldUpgradeSchema + 1);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);

  if (!v7)
  {
    if ((a3 & 0xFFFFFFFFFFFFFBFFLL) != 0) {
      id v8 = +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"((changeType & %i) = %i) OR (changeType = %i)",  a3,  a3,  0LL);
    }
    else {
      id v8 = +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"changeType = %i",  a3,  v12,  v13);
    }
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
    BOOL v9 = *(void **)(&self->super._shouldUpgradeSchema + 1);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    [v9 setObject:v7 forKeyedSubscript:v10];
  }

  return v7;
}

- (id)allChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 changeType:(unint64_t)a5 table:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  uint64_t v12 = NSStringFromClass(a3);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequelitePushRepository _injectionForChangeType:](self, "_injectionForChangeType:", a5));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"class = %@ AND (%@)",  v13,  v14));
  SEL v16 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequelitePushRepository _allChangesWithScopeIdentifier:scopeIndex:ordered:table:query:]( self,  "_allChangesWithScopeIdentifier:scopeIndex:ordered:table:query:",  v11,  0x7FFFFFFFFFFFFFFFLL,  1LL,  v10,  v15));

  return v16;
}

- (id)allNonDeletedChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 table:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = NSStringFromClass(a3);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"class = %@ AND changeType != %i",  v11,  1024LL));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequelitePushRepository _allChangesWithScopeIdentifier:scopeIndex:ordered:table:query:]( self,  "_allChangesWithScopeIdentifier:scopeIndex:ordered:table:query:",  v9,  0x7FFFFFFFFFFFFFFFLL,  1LL,  v8,  v12));

  return v13;
}

- (id)allChangesWithClass:(Class)a3 relatedScopedIdentifier:(id)a4 table:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if ([v9 scopeIndex] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v19 = (CPLPrequelitePushRepository *)sub_10019CF48(v9, a2, self);
    return -[CPLPrequelitePushRepository allChangesWithClass:relatedScopedIdentifier:](v19, v20, v21, v22);
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 scopeIdentifier]);
    id v12 = [v9 scopeIndex];
    uint64_t v13 = NSStringFromClass(a3);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    SEL v16 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"class = %@ AND relatedIdentifier = %@",  v14,  v15));
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequelitePushRepository _allChangesWithScopeIdentifier:scopeIndex:ordered:table:query:]( self,  "_allChangesWithScopeIdentifier:scopeIndex:ordered:table:query:",  v11,  v12,  0LL,  v10,  v16));

    return v17;
  }

- (id)allChangesWithClass:(Class)a3 relatedScopedIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequelitePushRepository allChangesWithClass:relatedScopedIdentifier:table:]( self,  "allChangesWithClass:relatedScopedIdentifier:table:",  a3,  v6,  v7));

  return v8;
}

- (id)allChangesWithClass:(Class)a3 secondaryScopedIdentifier:(id)a4 table:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if ([v9 scopeIndex] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v19 = (CPLPrequelitePushRepository *)sub_10019D01C(v9, a2, self);
    return -[CPLPrequelitePushRepository allChangesWithScopeIdentifier:table:](v19, v20, v21, v22);
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 scopeIdentifier]);
    id v12 = [v9 scopeIndex];
    uint64_t v13 = NSStringFromClass(a3);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    SEL v16 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"class = %@ AND secondaryIdentifier = %@",  v14,  v15));
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequelitePushRepository _allChangesWithScopeIdentifier:scopeIndex:ordered:table:query:]( self,  "_allChangesWithScopeIdentifier:scopeIndex:ordered:table:query:",  v11,  v12,  0LL,  v10,  v16));

    return v17;
  }

- (id)allChangesWithScopeIdentifier:(id)a3 table:(id)a4
{
  id v6 = a4;
  int64_t v7 = -[CPLPrequelitePushRepository _scopeIndexForScopeIdentifier:](self, "_scopeIndexForScopeIdentifier:", a3);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = (CPLPrequeliteSkipNullEnumerator *)&__NSArray0__struct;
  }

  else
  {
    int64_t v9 = v7;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pqlConnection]);

    id v12 = [v11 cplFetch:@"SELECT class, scopeIndex, identifier, changeType, relatedIdentifier, secondaryIdentifier, dequeueOrder, trashed, uploadIdentifier, flags, priority, trustLevel, serializedRecord FROM %@ WHERE scopeIndex = %ldORDER BY dequeueOrder DESC, rowID DESC", v6, v9];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100180748;
    v15[3] = &unk_100247278;
    v15[4] = self;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 enumerateObjects:v15]);
    id v8 = -[CPLPrequeliteSkipNullEnumerator initWithEnumerator:]( objc_alloc(&OBJC_CLASS___CPLPrequeliteSkipNullEnumerator),  "initWithEnumerator:",  v13);
  }

  return v8;
}

- (id)allChangesWithScopeIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequelitePushRepository allChangesWithScopeIdentifier:table:]( self,  "allChangesWithScopeIdentifier:table:",  v4,  v5));

  return v6;
}

- (BOOL)hasChangesWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v7 = a3;
  if ([v7 scopeIndex] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    SEL v16 = (CPLPrequelitePushRepository *)sub_10019D0F0(v7, a2, self);
    return -[CPLPrequelitePushRepository hasAnyChangeWithRelatedScopedIdentifier:](v16, v17, v18);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v10 = NSStringFromClass(a4);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v12 = [v7 scopeIndex];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"class = %@ AND scopeIndex = %ld AND relatedIdentifier = %@",  v11,  v12,  v13));
    LOBYTE(v12) = [v8 table:v9 hasRecordsMatchingQuery:v14];

    return (char)v12;
  }

- (BOOL)hasAnyChangeWithRelatedScopedIdentifier:(id)a3
{
  id v5 = a3;
  if ([v5 scopeIndex] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    SEL v16 = (CPLPrequelitePushRepository *)sub_10019D1C4(v5, a2, self);
    return -[CPLPrequelitePushRepository status](v16, v17);
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v8 = [v5 scopeIndex];
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"scopeIndex = %ld AND relatedIdentifier = %@",  v8,  v9));
    if ([v6 table:v7 hasRecordsMatchingQuery:v10])
    {
      unsigned __int8 v11 = 1;
    }

    else
    {
      id v12 = [v5 scopeIndex];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"scopeIndex = %ld AND secondaryIdentifier = %@",  v12,  v13));
      unsigned __int8 v11 = [v6 table:v7 hasRecordsMatchingQuery:v14];
    }

    return v11;
  }

- (id)status
{
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___CPLPrequelitePushRepository;
  id v3 = -[CPLPrequeliteStorage status](&v39, "status");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [v4 mutableCopy];

  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pqlConnection]);

  uint64_t v33 = self;
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  uint64_t v34 = v8;
  id v10 = [v8 cplFetch:@"SELECT class, changeType, trashed, count(*) FROM %@ GROUP BY class, changeType, trashed", v9];

  if ([v10 next])
  {
    do
    {
      uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 stringAtIndex:0]);
      if (v11) {
        id v12 = (__CFString *)v11;
      }
      else {
        id v12 = @"(nil)";
      }
      unsigned int v13 = [v10 intAtIndex:1];
      unsigned int v14 = [v10 intAtIndex:2];
      id v15 = (char *)[v10 unsignedIntegerAtIndex:3];
      SEL v16 = (_CPLPushRepositoryClassCount *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v6,  "objectForKeyedSubscript:",  v12));
      if (!v16)
      {
        SEL v16 = objc_alloc_init(&OBJC_CLASS____CPLPushRepositoryClassCount);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v16, v12);
      }

      if (v13 == 1024)
      {
        -[_CPLPushRepositoryClassCount setDeletes:]( v16,  "setDeletes:",  &v15[-[_CPLPushRepositoryClassCount deletes](v16, "deletes")]);
      }

      else
      {
        if (v14 == 1) {
          -[_CPLPushRepositoryClassCount setTrashed:]( v16,  "setTrashed:",  &v15[-[_CPLPushRepositoryClassCount trashed](v16, "trashed")]);
        }
        if (v13) {
          -[_CPLPushRepositoryClassCount setModifies:]( v16,  "setModifies:",  &v15[-[_CPLPushRepositoryClassCount modifies](v16, "modifies")]);
        }
        else {
          -[_CPLPushRepositoryClassCount setAdds:]( v16,  "setAdds:",  &v15[-[_CPLPushRepositoryClassCount adds](v16, "adds")]);
        }
      }
    }

    while (([v10 next] & 1) != 0);
  }

  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  SEL v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v6, "allKeys"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 sortedArrayUsingSelector:"compare:"]);

  id v19 = [v18 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v35 + 1) + 8LL * (void)i);
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v23));
        [v5 appendFormat:@"\n\t%@: %@", v23, v24];
      }

      id v20 = [v18 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }

    while (v20);
  }

  if (*(NSMutableDictionary **)((char *)&v33->_injectionPerChangeType + 4))
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequelitePushRepository storedExtractedBatch](v33, "storedExtractedBatch"));
    if (v25)
    {
      __int128 v26 = -[CPLPrequelitePushRepositoryBatchStorage initWithPushRepository:priority:]( objc_alloc(&OBJC_CLASS___CPLPrequelitePushRepositoryBatchStorage),  "initWithPushRepository:priority:",  v33,  -1LL);
      id v27 = [v25 effectiveResourceSizeToUploadUsingStorage:v26];
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v25 batch]);
      uint64_t v29 = objc_claimAutoreleasedReturnValue([v28 summaryDescription]);
      uint64_t v30 = (void *)v29;
      if (v27)
      {
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSByteCountFormatter stringFromByteCount:countStyle:]( &OBJC_CLASS___NSByteCountFormatter,  "stringFromByteCount:countStyle:",  v27,  1LL));
        [v5 appendFormat:@"\nCurrent extracted batch:\n\t%@ %@", v30, v31];
      }

      else
      {
        [v5 appendFormat:@"\nCurrent extracted batch:\n\t%@", v29];
      }
    }
  }

  return v5;
}

- (id)statusDictionary
{
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___CPLPrequelitePushRepository;
  id v3 = -[CPLPrequeliteStorage statusDictionary](&v32, "statusDictionary");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [v4 mutableCopy];

  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  [v5 setObject:v6 forKeyedSubscript:@"changes"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100181128;
  v30[3] = &unk_1002478D8;
  int64_t v9 = v6;
  uint64_t v31 = v9;
  [v7 table:v8 enumerateCountGroupedByProperty:@"class" block:v30];

  if (*(NSMutableDictionary **)((char *)&self->_injectionPerChangeType + 4))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequelitePushRepository storedExtractedBatch](self, "storedExtractedBatch"));
    if (v10)
    {
      id v25 = v9;
      uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      uint64_t v24 = v10;
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 batch]);
      id v13 = [v12 countByEnumeratingWithState:&v26 objects:v33 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v27;
        do
        {
          for (i = 0LL; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v27 != v15) {
              objc_enumerationMutation(v12);
            }
            SEL v17 = (objc_class *)objc_opt_class(*(void *)(*((void *)&v26 + 1) + 8LL * (void)i));
            id v18 = NSStringFromClass(v17);
            id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
            id v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v19));
            uint64_t v21 = v20;
            if (v20)
            {
              id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  (char *)[v20 unsignedIntegerValue] + 1));
              -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v22, v19);
            }

            else
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  &off_10025A4B8,  v19);
            }
          }

          id v14 = [v12 countByEnumeratingWithState:&v26 objects:v33 count:16];
        }

        while (v14);
      }

      [v5 setObject:v11 forKeyedSubscript:@"extracted"];
      id v10 = v24;
      int64_t v9 = v25;
    }
  }

  return v5;
}

- (id)statusPerScopeIndex
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pqlConnection]);

  __int128 v38 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v36 = self;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  __int128 v37 = v4;
  id v6 = [v4 cplFetch:@"SELECT scopeIndex, class, changeType, trashed, count(*) FROM %@ GROUP BY scopeIndex, class, changeType, trashed", v5];

  if ([v6 next])
  {
    do
    {
      id v7 = [v6 integerAtIndex:0];
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v7));
      int64_t v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v38, "objectForKeyedSubscript:", v8));

      if (!v9)
      {
        int64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v7));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v9, v10);
      }

      uint64_t v11 = objc_claimAutoreleasedReturnValue([v6 stringAtIndex:1]);
      if (v11) {
        id v12 = (__CFString *)v11;
      }
      else {
        id v12 = @"(nil)";
      }
      unsigned int v13 = [v6 intAtIndex:2];
      unsigned int v14 = [v6 intAtIndex:3];
      uint64_t v15 = (char *)[v6 unsignedIntegerAtIndex:4];
      SEL v16 = (_CPLPushRepositoryClassCount *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v9,  "objectForKeyedSubscript:",  v12));
      if (!v16)
      {
        SEL v16 = objc_alloc_init(&OBJC_CLASS____CPLPushRepositoryClassCount);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v16, v12);
      }

      if (v13 == 1024)
      {
        -[_CPLPushRepositoryClassCount setDeletes:]( v16,  "setDeletes:",  &v15[-[_CPLPushRepositoryClassCount deletes](v16, "deletes")]);
      }

      else
      {
        if (v14 == 1) {
          -[_CPLPushRepositoryClassCount setTrashed:]( v16,  "setTrashed:",  &v15[-[_CPLPushRepositoryClassCount trashed](v16, "trashed")]);
        }
        if (v13) {
          -[_CPLPushRepositoryClassCount setModifies:]( v16,  "setModifies:",  &v15[-[_CPLPushRepositoryClassCount modifies](v16, "modifies")]);
        }
        else {
          -[_CPLPushRepositoryClassCount setAdds:]( v16,  "setAdds:",  &v15[-[_CPLPushRepositoryClassCount adds](v16, "adds")]);
        }
      }
    }

    while (([v6 next] & 1) != 0);
  }

  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_100181650;
  v46[3] = &unk_100247CD8;
  SEL v17 =  -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  -[NSMutableDictionary count](v38, "count"));
  id v47 = v17;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v38, "enumerateKeysAndObjectsUsingBlock:", v46);
  id v18 = v4;
  if (*(NSMutableDictionary **)((char *)&v36->_injectionPerChangeType + 4))
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequelitePushRepository storedExtractedBatch](v36, "storedExtractedBatch"));
    if (v19)
    {
      id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      __int128 v35 = v19;
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v19 batch]);
      id v22 = [v21 countByEnumeratingWithState:&v42 objects:v48 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v43;
        do
        {
          for (i = 0LL; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v43 != v24) {
              objc_enumerationMutation(v21);
            }
            __int128 v26 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
            __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 scopedIdentifier]);
            __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 scopeIdentifier]);

            __int128 v29 = (CPLChangeBatch *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v20,  "objectForKeyedSubscript:",  v28));
            if (!v29)
            {
              __int128 v29 = objc_alloc_init(&OBJC_CLASS___CPLChangeBatch);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v29, v28);
            }

            -[CPLChangeBatch addRecord:](v29, "addRecord:", v26);
          }

          id v23 = [v21 countByEnumeratingWithState:&v42 objects:v48 count:16];
        }

        while (v23);
      }

      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequelitePushRepository abstractObject](v36, "abstractObject"));
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 engineStore]);
      objc_super v32 = (void *)objc_claimAutoreleasedReturnValue([v31 scopes]);

      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472LL;
      v39[2] = sub_1001817DC;
      v39[3] = &unk_100247D00;
      id v40 = v32;
      BOOL v41 = v17;
      id v33 = v32;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v20, "enumerateKeysAndObjectsUsingBlock:", v39);

      id v18 = v37;
      id v19 = v35;
    }
  }

  return v17;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 discardedUploadIdentifiers:(id *)a6 error:(id *)a7
{
  uint64_t v26 = 0LL;
  __int128 v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 1;
  if (a4 >= 100) {
    int64_t v12 = 100LL;
  }
  else {
    int64_t v12 = a4;
  }
  unsigned int v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  unsigned int v14 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  SEL v16 = (void *)objc_claimAutoreleasedReturnValue([v15 pqlConnection]);

  SEL v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v18 = [v16 cplFetch:@"SELECT rowID, uploadIdentifier FROM %@ WHERE scopeIndex = %ld LIMIT %ld", v17, a3, v12];
  while (1)
  {

    -[NSMutableIndexSet addIndex:](v14, "addIndex:", [v18 integerAtIndex:0]);
    SEL v17 = (void *)objc_claimAutoreleasedReturnValue([v18 stringAtIndex:1]);
    if (v17) {
      -[NSMutableArray addObject:](v13, "addObject:", v17);
    }
  }

  if (*((_BYTE *)v27 + 24))
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100181B50;
    v22[3] = &unk_1002476F0;
    id v25 = &v26;
    id v19 = v16;
    id v23 = v19;
    uint64_t v24 = self;
    -[NSMutableIndexSet enumerateIndexesUsingBlock:](v14, "enumerateIndexesUsingBlock:", v22);
    if (a7 && !*((_BYTE *)v27 + 24)) {
      *a7 = (id)objc_claimAutoreleasedReturnValue([v19 lastError]);
    }

    if (*((_BYTE *)v27 + 24))
    {
      *a5 = (int64_t)-[NSMutableIndexSet count](v14, "count");
      *a6 = v13;
      if (*a5 >= 1) {
        BYTE4(self->_cachedExtractedBatch) = 1;
      }
    }
  }

  char v20 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v26, 8);
  return v20;
}

- (BOOL)isEmpty
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  char v5 = [v3 tableHasRecords:v4] ^ 1;

  return v5;
}

- (BOOL)getRelatedScopedIdentifier:(id *)a3 forRecordWithScopedIdentifier:(id)a4
{
  id v7 = a4;
  if ([v7 scopeIndex] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v19 = (_Unwind_Exception *)sub_10019D298(v7, a2, self);
    _Block_object_dispose(&v21, 8);
    _Unwind_Resume(v19);
  }

  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 0;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 pqlConnection]);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100181E14;
  v20[3] = &unk_100247D28;
  v20[4] = &v21;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v11 = [v7 scopeIndex];
  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  id v13 = [v9 cplFetchObject:v20, @"SELECT relatedIdentifier FROM %@ WHERE scopeIndex = %ld AND identifier = %@", v10, v11, v12 sql];

  if (!*((_BYTE *)v22 + 24)
    || (id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null")),
        v14,
        v13 == v14))
  {
    *a3 = 0LL;
  }

  else
  {
    uint64_t v15 = objc_alloc(&OBJC_CLASS___CPLScopedIdentifier);
    SEL v16 = (void *)objc_claimAutoreleasedReturnValue([v7 scopeIdentifier]);
    *a3 =  -[CPLScopedIdentifier initWithScopeIdentifier:identifier:scopeIndex:]( v15,  "initWithScopeIdentifier:identifier:scopeIndex:",  v16,  v13,  [v7 scopeIndex]);
  }

  char v17 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return v17;
}

- (id)countPerFlagsForScopeWithIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[CPLPrequelitePushRepository _scopeIndexForScopeIdentifier:](self, "_scopeIndexForScopeIdentifier:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = &__NSDictionary0__struct;
  }

  else
  {
    int64_t v7 = v5;
    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 pqlConnection]);

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v12 = [v10 cplFetch:@"SELECT flags, COUNT(flags) FROM %@ WHERE scopeIndex = %ld AND flags != 0", v11, v7];

    if ([v12 next])
    {
      do
      {
        id v13 = [v12 integerAtIndex:0];
        id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v12 unsignedIntegerAtIndex:1]));
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v13));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v14, v15);
      }

      while (([v12 next] & 1) != 0);
    }

    SEL v16 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequelitePushRepository storedExtractedBatch](self, "storedExtractedBatch"));
    if (v16)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_100182064;
      v18[3] = &unk_100247D50;
      id v19 = v4;
      id v20 = v10;
      uint64_t v21 = self;
      int64_t v23 = v7;
      id v22 = v8;
      [v16 enumeratePushContextsWithBlock:v18];
    }

    id v6 = -[NSMutableDictionary copy](v8, "copy");
  }

  return v6;
}

- (id)scopedIdentifiersForChangesWithFlag:(int64_t)a3 forScopeWithIdentifier:(id)a4
{
  id v6 = a4;
  int64_t v7 = -[CPLPrequelitePushRepository _scopeIndexForScopeIdentifier:](self, "_scopeIndexForScopeIdentifier:", v6);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = &__NSArray0__struct;
  }

  else
  {
    int64_t v9 = v7;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pqlConnection]);

    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v13 = (void *)v12;
    if (a3) {
      id v14 = [v11 cplFetch:@"SELECT identifier FROM %@ WHERE scopeIndex = %ld AND (flags & %ld) != 0", v12, v9, a3];
    }
    else {
      id v14 = [v11 cplFetch:@"SELECT identifier FROM %@ WHERE scopeIndex = %ld AND flags = 0", v12, v9, v18];
    }
    uint64_t v15 = v14;

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1001823D8;
    v19[3] = &unk_1002479C0;
    id v20 = v6;
    int64_t v21 = v9;
    SEL v16 = (void *)objc_claimAutoreleasedReturnValue([v15 enumerateObjects:v19]);
    id v8 = [[CPLMapEnumerator alloc] initWithEnumerator:v16];
  }

  return v8;
}

- (BOOL)deleteSharingFlagsWithMaxCount:(unint64_t)a3 deletedCount:(unint64_t *)a4 error:(id *)a5
{
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 pqlConnection]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned int v12 = [v10 cplExecute:@"UPDATE %@ SET flags = flags & %ld WHERE (flags & %ld) != 0 LIMIT %lu", v11, -4, 3, a3];

  if (v12)
  {
    *a4 = (unint64_t)[v10 changes];
  }

  else if (a5)
  {
    *a5 = (id)objc_claimAutoreleasedReturnValue([v10 lastError]);
  }

  return v12;
}

- (id)contributorsUpdatesForScopeWithIdentifier:(id)a3 maxCount:(unint64_t)a4
{
  id v6 = a3;
  int64_t v7 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", a4);
  int64_t v8 = -[CPLPrequelitePushRepository _scopeIndexForScopeIdentifier:](self, "_scopeIndexForScopeIdentifier:", v6);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v9 = (NSMutableArray *)&__NSArray0__struct;
  }

  else
  {
    int64_t v10 = v8;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pqlConnection]);

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v14 = [v12 cplFetch:@"SELECT class, scopeIndex, identifier, changeType, relatedIdentifier, secondaryIdentifier, dequeueOrder, trashed, uploadIdentifier, flags, priority, trustLevel, serializedRecord FROM %@ WHERE (flags & %ld) != 0 AND scopeIndex = %ld LIMIT %lu", v13, 4, v10, a4];

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_10018271C;
    v26[3] = &unk_100247278;
    v26[4] = self;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 enumerateObjects:v26]);
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    SEL v16 = -[CPLPrequeliteSkipNullEnumerator initWithEnumerator:]( objc_alloc(&OBJC_CLASS___CPLPrequeliteSkipNullEnumerator),  "initWithEnumerator:",  v15);
    id v17 = -[CPLPrequeliteSkipNullEnumerator countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v22,  v27,  16LL);
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v23;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v16);
          }
          -[NSMutableArray addObject:](v7, "addObject:", *(void *)(*((void *)&v22 + 1) + 8LL * (void)i));
        }

        id v18 = -[CPLPrequeliteSkipNullEnumerator countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v22,  v27,  16LL);
      }

      while (v18);
    }

    int64_t v9 = v7;
  }

  return v9;
}

- (BOOL)acknowledgeContributorsUpdates:(id)a3 error:(id *)a4
{
  id v5 = a3;
  __int128 v44 = self;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 pqlConnection]);

  __int128 v45 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](v44, "mainTable"));
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id obj = v5;
  id v8 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v8)
  {
    uint64_t v40 = 0LL;
    id v41 = 0LL;
    uint64_t v43 = *(void *)v48;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v48 != v43) {
        objc_enumerationMutation(obj);
      }
      int64_t v10 = *(void **)(*((void *)&v47 + 1) + 8 * v9);
      id v11 = objc_autoreleasePoolPush();
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v10 scopedIdentifier]);
      if ([v12 scopeIndex] == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        sub_10019D374(v12, a2, v44);
        __break(1u);
      }

      *(void *)&__int128 v53 = 0LL;
      *((void *)&v53 + 1) = &v53;
      uint64_t v54 = 0x2020000000LL;
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472LL;
      v46[2] = sub_100182C78;
      v46[3] = &unk_100247D28;
      void v46[4] = &v53;
      id v13 = [v12 scopeIndex];
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v12 identifier]);
      uint64_t v15 = [v7 cplFetchObject:v46, @"SELECT rowID, class, scopeIndex, identifier, changeType, relatedIdentifier, secondaryIdentifier, dequeueOrder, trashed, uploadIdentifier, flags, priority, trustLevel, serializedRecord FROM %@ WHERE scopeIndex = %ld AND identifier = %@", v45, v13, v14 sql];

      SEL v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      LOBYTE(v14) = v15 == v16;

      if ((v14 & 1) == 0) {
        break;
      }
      int v25 = 1;
LABEL_24:

      _Block_object_dispose(&v53, 8);
      objc_autoreleasePoolPop(v11);
      if (!v25)
      {

        if (a4)
        {
          id v41 = v41;
          BOOL v34 = 0;
          *a4 = v41;
        }

        else
        {
          BOOL v34 = 0;
        }

        goto LABEL_39;
      }

      if (v8 == (id)++v9)
      {
        id v33 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
        id v8 = v33;
        if (v33) {
          goto LABEL_3;
        }
        goto LABEL_33;
      }
    }

    id v17 = sub_10017CDD4((uint64_t)v15, v44);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    uint64_t v19 = objc_claimAutoreleasedReturnValue([v18 updateSharingContributorUserIdentifiers]);
    uint64_t v20 = objc_claimAutoreleasedReturnValue([v10 updateSharingContributorUserIdentifiers]);
    int64_t v21 = (void *)v20;
    if (v19 && v20)
    {
      unsigned __int8 v22 = [(id)v19 isEqual:v20];

      if ((v22 & 1) == 0) {
        goto LABEL_11;
      }
    }

    else
    {
      BOOL v26 = (v19 | v20) != 0;

      if (v26)
      {
LABEL_11:
        if (!_CPLSilentLogging)
        {
          id v23 = sub_10017CB04();
          __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v52 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%@ still has contributors to update",  buf,  0xCu);
          }
        }

        goto LABEL_21;
      }
    }

    if (v15) {
      __int128 v27 = (void *)v15[10];
    }
    else {
      __int128 v27 = 0LL;
    }
    id v28 = v27;
    unint64_t v29 = (unint64_t)[v28 flags];

    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](v44, "mainTable"));
    unsigned __int8 v31 = [v7 cplExecute:@"UPDATE %@ SET flags = %ld WHERE rowID = %lu", v30, v29 & 0xFFFFFFFFFFFFFFFBLL, *(void *)(*((void *)&v53 + 1) + 24)];

    if ((v31 & 1) == 0)
    {
      uint64_t v32 = objc_claimAutoreleasedReturnValue([v7 lastError]);

      int v25 = 0;
      id v41 = (id)v32;
      goto LABEL_23;
    }

    ++v40;
LABEL_21:
    int v25 = 1;
LABEL_23:

    goto LABEL_24;
  }

  uint64_t v40 = 0LL;
  id v41 = 0LL;
LABEL_33:

  if (!_CPLSilentLogging)
  {
    id v35 = sub_10017CB04();
    __int128 v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v53) = 134217984;
      *(void *)((char *)&v53 + 4) = v40;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Acknowledged %lu contributors updates",  (uint8_t *)&v53,  0xCu);
    }
  }

  BOOL v34 = 1;
LABEL_39:

  return v34;
}

- (id)checkOutBatchStorageWithPriority:(unint64_t)a3 error:(id *)a4
{
  int64_t v7 = *(void **)(&self->_shouldNotifyFlagsCountChanges + 4);
  if (!v7)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v9 = *(void **)(&self->_shouldNotifyFlagsCountChanges + 4);
    *(void *)(&self->_shouldNotifyFlagsCountChanges + 4) = v8;

    int64_t v7 = *(void **)(&self->_shouldNotifyFlagsCountChanges + 4);
  }

  int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v11 = (CPLPrequelitePushRepositoryBatchStorage *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v10]);

  if (!v11)
  {
    id v11 = -[CPLPrequelitePushRepositoryBatchStorage initWithPushRepository:priority:]( objc_alloc(&OBJC_CLASS___CPLPrequelitePushRepositoryBatchStorage),  "initWithPushRepository:priority:",  self,  a3);
    unsigned int v12 = *(void **)(&self->_shouldNotifyFlagsCountChanges + 4);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    [v12 setObject:v11 forKeyedSubscript:v13];
  }

  if (-[CPLPrequelitePushRepositoryBatchStorage checkOutWithError:](v11, "checkOutWithError:", a4)) {
    uint64_t v14 = v11;
  }
  else {
    uint64_t v14 = 0LL;
  }

  return v14;
}

- (BOOL)checkInBatchStorage:(id)a3 error:(id *)a4
{
  id v7 = a3;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___CPLPrequelitePushRepositoryBatchStorage);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    uint64_t v9 = (CPLPrequelitePushRepository *)objc_claimAutoreleasedReturnValue([v7 pushRepository]);

    if (v9 == self)
    {
      unsigned __int8 v10 = [v7 checkInWithError:a4];

      return v10;
    }
  }

  else
  {
    sub_10019D524(v7, a2, self);
  }

  unsigned int v12 = (CPLPrequelitePushRepository *)sub_10019D450(v7, a2, self);
  -[CPLPrequelitePushRepository writeTransactionDidSucceed](v12, v13);
  return result;
}

- (void)writeTransactionDidSucceed
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CPLPrequelitePushRepository;
  -[CPLPrequeliteStorage writeTransactionDidSucceed](&v6, "writeTransactionDidSucceed");
  if (BYTE4(self->_cachedExtractedBatch))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequelitePushRepository abstractObject](self, "abstractObject"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 engineStore]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 engineLibrary]);
    [v5 notifyAttachedObjectsThatPushRepositoryFlagsCountsHaveChanged];

    BYTE4(self->_cachedExtractedBatch) = 0;
  }

- (void)writeTransactionDidFail
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CPLPrequelitePushRepository;
  -[CPLPrequeliteStorage writeTransactionDidFail](&v4, "writeTransactionDidFail");
  BYTE4(self->_extractedBatchVar) = 0;
  id v3 = *(void **)(&self->_hasCachedExtractedBatch + 4);
  *(void *)(&self->_hasCachedExtractedBatch + 4) = 0LL;

  BYTE4(self->_cachedExtractedBatch) = 0;
}

- (void).cxx_destruct
{
}

@end