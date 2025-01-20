@interface CPLPrequeliteResourceDownloadQueue
- (BOOL)_createResourceTypeAndStatusIndex;
- (BOOL)_deleteEnqueuedResource:(id)a3 error:(id *)a4;
- (BOOL)_getNextPosition:(unint64_t *)a3 andBumpWithError:(id *)a4;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)enqueueBackgroundDownloadTaskForResource:(id)a3 intent:(unint64_t)a4 downloading:(BOOL)a5 error:(id *)a6;
- (BOOL)hasActiveOrQueuedBackgroundDownloadOperations;
- (BOOL)initializeStorage;
- (BOOL)markBackgroundDownloadTaskForResourceAsSuceeded:(id)a3 taskIdentifier:(unint64_t)a4 error:(id *)a5;
- (BOOL)openWithError:(id *)a3;
- (BOOL)reenqueueBackgroundDownloadTaskForResource:(id)a3 taskIdentifier:(unint64_t)a4 bumpRetryCount:(BOOL)a5 didDiscard:(BOOL *)a6 error:(id *)a7;
- (BOOL)removeAllBackgroundDownloadTasksForItemWithScopedIdentifier:(id)a3 error:(id *)a4;
- (BOOL)removeBackgroundDownloadTaskForResource:(id)a3 taskIdentifier:(unint64_t)a4 error:(id *)a5;
- (BOOL)resetDequeuedBackgroundDownloadTasksWithError:(id *)a3;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (CPLPrequeliteResourceDownloadQueue)initWithAbstractObject:(id)a3;
- (id)_enqueuedResourceForResource:(id)a3 verifyScopeIndex:(BOOL)a4;
- (id)dequeueNextBackgroundDownloadTasksForResourceType:(unint64_t)a3 andIntent:(unint64_t)a4 maximumSize:(unint64_t)a5 maximumCount:(unint64_t)a6 error:(id *)a7;
- (id)enumeratorForDownloadedResources;
- (id)recordsDesignation;
- (id)status;
- (id)statusPerScopeIndex;
- (unint64_t)_countOfRecordsWithStatus:(int)a3;
- (unint64_t)countOfQueuedDownloadTasks;
- (unint64_t)newTaskIdentifier;
@end

@implementation CPLPrequeliteResourceDownloadQueue

- (CPLPrequeliteResourceDownloadQueue)initWithAbstractObject:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CPLPrequeliteResourceDownloadQueue;
  v3 = -[CPLPrequeliteStorage initWithAbstractObject:](&v11, "initWithAbstractObject:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 variableWithName:@"nextTaskIdentifier" type:v4]);
    v6 = *(void **)(v3 + 36);
    *(void *)(v3 + 36) = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v3 variableWithName:@"nextPosition" type:v7]);
    v9 = *(void **)(v3 + 44);
    *(void *)(v3 + 44) = v8;
  }

  return (CPLPrequeliteResourceDownloadQueue *)v3;
}

- (BOOL)_createResourceTypeAndStatusIndex
{
  BOOL v3 = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"resourceType.status",  @"resourceType, status, intent, position DESC",  0LL,  0LL);
  if (v3) {
    LOBYTE(v3) = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"status",  @"status, intent, position DESC",  0LL,  0LL);
  }
  return v3;
}

- (BOOL)initializeStorage
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CPLPrequeliteResourceDownloadQueue;
  BOOL v3 = -[CPLPrequeliteStorage initializeStorage](&v5, "initializeStorage");
  if (v3)
  {
    BOOL v3 = -[CPLPrequeliteStorage createMainTableWithDefinition:error:]( self,  "createMainTableWithDefinition:error:",  @"position INTEGER NOT NULL,scopeIndex INTEGER NOT NULL,itemIdentifier TEXT NOT NULL,resourceType INTEGER NOT NULL,fingerPrint TEXT NOT NULL,fileUTI TEXT,fileSize INTEGER NOT NULL,taskIdentifier INTEGER NOT NULL,retryCount INTEGER NOT NULL,status INTEGER NOT NULL, intent INTEGER NOT NULL",  0LL);
    if (v3)
    {
      BOOL v3 = -[CPLPrequeliteStorage createVariable:defaultValue:error:]( self,  "createVariable:defaultValue:error:",  *(void *)(&self->super._shouldUpgradeSchema + 1),  &off_10025A470,  0LL);
      if (v3)
      {
        BOOL v3 = -[CPLPrequeliteStorage createVariable:defaultValue:error:]( self,  "createVariable:defaultValue:error:",  *(CPLPrequeliteVariable **)((char *)&self->_nextTaskIdentifier + 4),  &off_10025A470,  0LL);
        if (v3)
        {
          BOOL v3 = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"resource",  @"itemIdentifier, scopeIndex, resourceType",  1LL,  0LL);
          if (v3)
          {
            BOOL v3 = -[CPLPrequeliteResourceDownloadQueue _createResourceTypeAndStatusIndex]( self,  "_createResourceTypeAndStatusIndex");
            if (v3) {
              LOBYTE(v3) = -[CPLPrequeliteStorage createIndexOnColumn:error:]( self,  "createIndexOnColumn:error:",  @"scopeIndex",  0LL);
            }
          }
        }
      }
    }
  }

  return v3;
}

- (BOOL)upgradeStorageToVersion:(int64_t)a3
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___CPLPrequeliteResourceDownloadQueue;
  unsigned int v5 = -[CPLPrequeliteStorage upgradeStorageToVersion:](&v25, "upgradeStorageToVersion:");
  BOOL v6 = v5;
  if (a3 == 20 || !v5) {
    return v6;
  }
  BOOL v6 = 1;
  if (a3 <= 51)
  {
    if (a3 == 33)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 pqlConnection]);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
      unsigned __int8 v11 = [v9 cplExecute:@"ALTER TABLE %@ ADD COLUMN fileSize INTEGER DEFAULT 0", v10, v24];
LABEL_43:
      BOOL v6 = v11;
    }

    else
    {
      if (a3 != 39)
      {
        if (a3 == 49
          && -[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema")
          && !BYTE4(self->_nextPosition))
        {
          if (-[CPLPrequeliteStorage dropIndexWithName:error:]( self,  "dropIndexWithName:error:",  @"resource",  0LL)
            && -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"resource",  @"itemIdentifier, scopeIndex, resourceType",  1LL,  0LL))
          {
            BYTE4(self->_nextPosition) = 1;
          }

          else
          {
            return 0;
          }
        }

        return v6;
      }

      if (!-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema")) {
        return v6;
      }
      if (!_CPLSilentLogging)
      {
        id v12 = sub_10016AF58();
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
          *(_DWORD *)buf = 138412546;
          v27 = v14;
          __int16 v28 = 2048;
          uint64_t v29 = 39LL;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Upgrading %@ to version %llu: adding scopeIndex column",  buf,  0x16u);
        }
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
      v9 = (void *)objc_claimAutoreleasedReturnValue([v15 pqlConnection]);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
      unsigned int v17 = [v9 cplExecute:@"ALTER TABLE %@ ADD COLUMN scopeIndex INTEGER DEFAULT 1", v16];

      if (v17
        && -[CPLPrequeliteStorage dropIndexWithName:error:](self, "dropIndexWithName:error:", @"resource", 0LL)
        && (BOOL v6 = 1,
            -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"resource",  @"itemIdentifier, scopeIndex, resourceType",  1LL,  0LL)))
      {
        BYTE4(self->_nextPosition) = 1;
      }

      else
      {
        BOOL v6 = 0;
      }
    }

    return v6;
  }

  switch(a3)
  {
    case ':':
      if (-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema"))
      {
        if (-[CPLPrequeliteStorage dropIndexWithName:error:](self, "dropIndexWithName:error:", @"position", 0LL)
          && -[CPLPrequeliteStorage dropIndexWithName:error:](self, "dropIndexWithName:error:", @"status", 0LL))
        {
          unsigned __int8 v7 = -[CPLPrequeliteStorage dropIndexWithName:error:]( self,  "dropIndexWithName:error:",  @"resourceType",  0LL);
          goto LABEL_40;
        }

        return 0;
      }

      break;
    case ';':
    case '<':
    case '=':
    case '>':
    case '?':
    case '@':
      return v6;
    case 'A':
      if (-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema"))
      {
        if (!_CPLSilentLogging)
        {
          id v18 = sub_10016AF58();
          v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
            *(_DWORD *)buf = 138412546;
            v27 = v20;
            __int16 v28 = 2048;
            uint64_t v29 = 65LL;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Upgrading %@ to version %llu: adding intent column",  buf,  0x16u);
          }
        }

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
        v9 = (void *)objc_claimAutoreleasedReturnValue([v21 pqlConnection]);

        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
        unsigned __int8 v11 = [v9 cplExecute:@"ALTER TABLE %@ ADD COLUMN intent INTEGER DEFAULT 1", v10, v24];
        goto LABEL_43;
      }

      break;
    case 'B':
      if (-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema"))
      {
        if (-[CPLPrequeliteStorage dropIndexWithName:error:]( self,  "dropIndexWithName:error:",  @"resourceType.status",  0LL)
          && -[CPLPrequeliteStorage dropIndexWithName:error:](self, "dropIndexWithName:error:", @"status", 0LL))
        {
          unsigned __int8 v7 = -[CPLPrequeliteResourceDownloadQueue _createResourceTypeAndStatusIndex]( self,  "_createResourceTypeAndStatusIndex");
          goto LABEL_40;
        }

        return 0;
      }

      break;
    case 'C':
      if (-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema"))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
        v9 = (void *)objc_claimAutoreleasedReturnValue([v22 pqlConnection]);

        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
        unsigned __int8 v11 = [v9 cplExecute:@"DELETE FROM %@ WHERE intent = %i", v10, 5];
        goto LABEL_43;
      }

      break;
    default:
      if (a3 == 52 && -[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema"))
      {
        unsigned __int8 v7 = -[CPLPrequeliteStorage createIndexOnColumn:error:]( self,  "createIndexOnColumn:error:",  @"scopeIndex",  0LL);
LABEL_40:
        BOOL v6 = v7;
      }

      break;
  }

  return v6;
}

- (BOOL)openWithError:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CPLPrequeliteResourceDownloadQueue;
  if (!-[CPLPrequeliteStorage openWithError:](&v10, "openWithError:")) {
    return 0;
  }
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pqlConnection]);

  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned __int8 v8 = [v6 cplExecute:@"UPDATE OR FAIL %@ SET status = %i WHERE status = %i", v7, 1, 0];

  if (a3 && (v8 & 1) == 0) {
    *a3 = (id)objc_claimAutoreleasedReturnValue([v6 lastCPLError]);
  }

  return v8;
}

- (unint64_t)newTaskIdentifier
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteStorage valueForVariable:]( self,  "valueForVariable:",  *(void *)(&self->super._shouldUpgradeSchema + 1)));
  v4 = (char *)[v3 unsignedIntegerValue];

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v4 + 1));
  uint64_t v6 = *(void *)(&self->super._shouldUpgradeSchema + 1);
  id v12 = 0LL;
  unsigned __int8 v7 = -[CPLPrequeliteStorage setValue:forVariable:error:](self, "setValue:forVariable:error:", v5, v6, &v12);
  id v8 = v12;

  if ((v7 & 1) == 0 && !_CPLSilentLogging)
  {
    id v9 = sub_10016AF58();
    objc_super v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Unable to store next task identifier: %@",  buf,  0xCu);
    }
  }

  return (unint64_t)v4;
}

- (BOOL)_getNextPosition:(unint64_t *)a3 andBumpWithError:(id *)a4
{
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteStorage valueForVariable:]( self,  "valueForVariable:",  *(CPLPrequeliteVariable **)((char *)&self->_nextTaskIdentifier + 4)));
  *a3 = (unint64_t)[v7 unsignedIntegerValue];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", *a3 + 1));
  LOBYTE(a4) = -[CPLPrequeliteStorage setValue:forVariable:error:]( self,  "setValue:forVariable:error:",  v8,  *(CPLPrequeliteVariable **)((char *)&self->_nextTaskIdentifier + 4),  a4);

  return (char)a4;
}

- (BOOL)_deleteEnqueuedResource:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 itemScopedIdentifier]);
  id v8 = [v7 scopeIndex];
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL) {
    sub_10019B954();
  }
  id v9 = v8;
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pqlConnection]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  unsigned __int8 v14 = [v11 cplExecute:@"DELETE FROM %@ WHERE itemIdentifier = %@ AND resourceType = %i AND scopeIndex = %ld", v12, v13, objc_msgSend(v6, "resourceType"), v9];

  if (a4 && (v14 & 1) == 0) {
    *a4 = (id)objc_claimAutoreleasedReturnValue([v11 lastCPLError]);
  }

  return v14;
}

- (id)_enqueuedResourceForResource:(id)a3 verifyScopeIndex:(BOOL)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 itemScopedIdentifier]);
  id v8 = v7;
  if (!a4)
  {
    id v9 = [v7 scopeIndex];
    if (v9 == (id)0x7FFFFFFFFFFFFFFFLL) {
      sub_10019BA04();
    }
    goto LABEL_5;
  }

  id v9 = -[CPLPrequeliteStorage scopeIndexForLocalScopedIdentifier:](self, "scopeIndexForLocalScopedIdentifier:", v7);
  if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_5:
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pqlConnection]);

    uint64_t v13 = objc_opt_class(&OBJC_CLASS___CPLPrequeliteDownloadResource);
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    id v10 = [v12 cplFetchObjectOfClass:v13, @"SELECT position, scopeIndex, itemIdentifier, resourceType, fingerPrint, fileUTI, fileSize, taskIdentifier, retryCount, status, intent FROM %@ WHERE itemIdentifier = %@ AND resourceType = %i AND scopeIndex = %ld", v14, v15, objc_msgSend(v6, "resourceType"), v9 sql];

    goto LABEL_6;
  }

  id v10 = 0LL;
LABEL_6:

  return v10;
}

- (BOOL)enqueueBackgroundDownloadTaskForResource:(id)a3 intent:(unint64_t)a4 downloading:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 itemScopedIdentifier]);
  if (-[CPLPrequeliteStorage scopeIndexForLocalScopedIdentifier:](self, "scopeIndexForLocalScopedIdentifier:", v11) != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!-[CPLPrequeliteResourceDownloadQueue _getNextPosition:andBumpWithError:]( self,  "_getNextPosition:andBumpWithError:",  &v39,  a6)) {
      goto LABEL_8;
    }
    uint64_t v29 = a6;
    id v37 = v10;
    uint64_t v13 = -[CPLPrequeliteDownloadResource initWithResource:]( objc_alloc(&OBJC_CLASS___CPLPrequeliteDownloadResource),  "initWithResource:",  v10);
    -[CPLPrequeliteDownloadResource setPosition:](v13, "setPosition:", v39);
    -[CPLPrequeliteDownloadResource setStatus:](v13, "setStatus:", !v7);
    -[CPLPrequeliteDownloadResource setIntent:](v13, "setIntent:", a4);
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    v38 = (void *)objc_claimAutoreleasedReturnValue([v14 pqlConnection]);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v33 = -[CPLPrequeliteDownloadResource position](v13, "position");
    id v31 = -[CPLPrequeliteDownloadResource scopeIndex](v13, "scopeIndex");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteDownloadResource itemIdentifier](v13, "itemIdentifier"));
    id v30 = -[CPLPrequeliteDownloadResource resourceType](v13, "resourceType");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteDownloadResource fingerPrint](v13, "fingerPrint"));
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteDownloadResource fileUTI](v13, "fileUTI"));
    id v18 = v38;
    unsigned int v19 = [v38 cplExecute:@"INSERT OR IGNORE INTO %@ (position, scopeIndex, itemIdentifier, resourceType, fingerPrint, fileUTI, fileSize, taskIdentifier, retryCount, status, intent) VALUES (%lu, %ld, %@, %i, %@, %@, %lu, %lu, %i, %i, %lu)", v35, v33, v31, v15, v30, v16, v17, -[CPLPrequeliteDownloadResource fileSize](v13, "fileSize"), -[CPLPrequeliteDownloadResource taskIdentifier](v13, "taskIdentifier"), -[CPLPrequeliteDownloadResource retryCount](v13, "retryCount"), -[CPLPrequeliteDownloadResource status](v13, "status"), -[CPLPrequeliteDownloadResource intent](v13, "intent")];

    if (v19)
    {
      if ([v38 changes])
      {
        unsigned __int8 v12 = 1;
LABEL_20:

        goto LABEL_21;
      }

      if (-[CPLPrequeliteResourceDownloadQueue _deleteEnqueuedResource:error:]( self,  "_deleteEnqueuedResource:error:",  v10,  v29))
      {
        if (!_CPLSilentLogging)
        {
          id v21 = sub_10016AF58();
          v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue( +[CPLResourceTransferTaskOptions descriptionForIntent:]( &OBJC_CLASS___CPLResourceTransferTaskOptions,  "descriptionForIntent:",  -[CPLPrequeliteDownloadResource intent](v13, "intent")));
            *(_DWORD *)buf = 138412546;
            id v41 = v10;
            __int16 v42 = 2112;
            v43 = v23;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "New background download will superseeds current enqueued one for %@, intent: %@",  buf,  0x16u);
          }
        }

        v36 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
        id v34 = -[CPLPrequeliteDownloadResource position](v13, "position");
        id v32 = -[CPLPrequeliteDownloadResource scopeIndex](v13, "scopeIndex");
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteDownloadResource itemIdentifier](v13, "itemIdentifier"));
        id v25 = -[CPLPrequeliteDownloadResource resourceType](v13, "resourceType");
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteDownloadResource fingerPrint](v13, "fingerPrint"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteDownloadResource fileUTI](v13, "fileUTI"));
        unsigned __int8 v12 = [v38 cplExecute:@"INSERT INTO %@ (position, scopeIndex, itemIdentifier, resourceType, fingerPrint, fileUTI, fileSize, taskIdentifier, retryCount, status, intent) VALUES (%lu, %ld, %@, %i, %@, %@, %lu, %lu, %i, %i, %lu)", v36, v34, v32, v24, v25, v26, v27, -[CPLPrequeliteDownloadResource fileSize](v13, "fileSize"), -[CPLPrequeliteDownloadResource taskIdentifier](v13, "taskIdentifier"), -[CPLPrequeliteDownloadResource retryCount](v13, "retryCount"), -[CPLPrequeliteDownloadResource status](v13, "status"), -[CPLPrequeliteDownloadResource intent](v13, "intent")];

        v20 = v29;
        if (!v29)
        {
          id v10 = v37;
          id v18 = v38;
          goto LABEL_20;
        }

        id v10 = v37;
        id v18 = v38;
        if ((v12 & 1) != 0) {
          goto LABEL_20;
        }
        goto LABEL_10;
      }
    }

    else
    {
      v20 = v29;
      if (v29)
      {
LABEL_10:
        unsigned __int8 v12 = 0;
        id *v20 = (id)objc_claimAutoreleasedReturnValue([v18 lastCPLError]);
        goto LABEL_20;
      }
    }

    unsigned __int8 v12 = 0;
    goto LABEL_20;
  }

  if (!a6)
  {
LABEL_8:
    unsigned __int8 v12 = 0;
    goto LABEL_21;
  }

  unsigned __int8 v12 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopedIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopedIdentifier:",  v11));
LABEL_21:

  return v12;
}

- (BOOL)reenqueueBackgroundDownloadTaskForResource:(id)a3 taskIdentifier:(unint64_t)a4 bumpRetryCount:(BOOL)a5 didDiscard:(BOOL *)a6 error:(id *)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteResourceDownloadQueue _enqueuedResourceForResource:verifyScopeIndex:]( self,  "_enqueuedResourceForResource:verifyScopeIndex:",  v12,  0LL));
  unsigned __int8 v14 = v13;
  *a6 = 0;
  if (v13)
  {
    if ([v13 taskIdentifier] == (id)a4)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 pqlConnection]);

      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v12 itemScopedIdentifier]);
      id v18 = [v17 scopeIndex];
      if (v18 == (id)0x7FFFFFFFFFFFFFFFLL) {
        sub_10019BAB4();
      }
      id v19 = v18;
      if (v9)
      {
        int v20 = [v14 retryCount];
        if (v20 < 10)
        {
          uint64_t v31 = (v20 + 1);
          id v32 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
          id v33 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);
          unsigned __int8 v23 = [v16 cplExecute:@"UPDATE %@ SET retryCount = %i, status = %i WHERE itemIdentifier = %@ AND resourceType = %i AND scopeIndex = %ld", v32, v31, 2, v33, objc_msgSend(v12, "resourceType"), v19];

          if (a7 && (v23 & 1) == 0)
          {
            unsigned __int8 v23 = 0;
            *a7 = (id)objc_claimAutoreleasedReturnValue([v16 lastCPLError]);
          }
        }

        else
        {
          if (!_CPLSilentLogging)
          {
            id v21 = sub_10016AF58();
            v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v36 = v12;
              _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Discarding background download of %@: failed too many times",  buf,  0xCu);
            }
          }

          unsigned __int8 v23 = -[CPLPrequeliteResourceDownloadQueue _deleteEnqueuedResource:error:]( self,  "_deleteEnqueuedResource:error:",  v12,  a7);
          *a6 = 1;
        }
      }

      else
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
        __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 pqlConnection]);

        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
        id v30 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);
        unsigned __int8 v23 = [v28 cplExecute:@"UPDATE %@ SET status = %i WHERE itemIdentifier = %@ AND resourceType = %i AND scopeIndex = %ld", v29, 2, v30, objc_msgSend(v12, "resourceType"), v19];

        if (a7 && (v23 & 1) == 0) {
          *a7 = (id)objc_claimAutoreleasedReturnValue([v28 lastCPLError]);
        }
      }

      goto LABEL_27;
    }

    if (!_CPLSilentLogging)
    {
      id v26 = sub_10016AF58();
      v16 = (void *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v36 = v12;
        id v25 = "Dropping background download of %@ as the current enqueued task superseeeds it";
        goto LABEL_17;
      }

      goto LABEL_18;
    }

- (BOOL)markBackgroundDownloadTaskForResourceAsSuceeded:(id)a3 taskIdentifier:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 itemScopedIdentifier]);
  id v10 = [v9 scopeIndex];
  if (v10 == (id)0x7FFFFFFFFFFFFFFFLL) {
    sub_10019BB64();
  }
  id v11 = v10;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 pqlConnection]);

  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  unsigned __int8 v16 = [v13 cplExecute:@"UPDATE %@ SET status = %i WHERE itemIdentifier = %@ AND resourceType = %i AND taskIdentifier = %lu AND scopeIndex = %ld", v14, 3, v15, objc_msgSend(v8, "resourceType"), a4, v11];

  if (a5 && (v16 & 1) == 0) {
    *a5 = (id)objc_claimAutoreleasedReturnValue([v13 lastCPLError]);
  }

  return v16;
}

- (BOOL)removeBackgroundDownloadTaskForResource:(id)a3 taskIdentifier:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 itemScopedIdentifier]);
  id v10 = [v9 scopeIndex];
  if (v10 == (id)0x7FFFFFFFFFFFFFFFLL) {
    sub_10019BC14();
  }
  id v11 = v10;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 pqlConnection]);

  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  unsigned __int8 v16 = [v13 cplExecute:@"DELETE FROM %@ WHERE itemIdentifier = %@ AND resourceType = %i AND taskIdentifier = %lu AND scopeIndex = %ld", v14, v15, objc_msgSend(v8, "resourceType"), a4, v11];

  if (a5 && (v16 & 1) == 0) {
    *a5 = (id)objc_claimAutoreleasedReturnValue([v13 lastCPLError]);
  }

  return v16;
}

- (id)dequeueNextBackgroundDownloadTasksForResourceType:(unint64_t)a3 andIntent:(unint64_t)a4 maximumSize:(unint64_t)a5 maximumCount:(unint64_t)a6 error:(id *)a7
{
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 pqlConnection]);

  uint64_t v14 = objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  v15 = (void *)v14;
  if (a3 == -1LL) {
    id v16 = [v13 cplFetch:@"SELECT position, scopeIndex, itemIdentifier, resourceType, fingerPrint, fileUTI, fileSize, taskIdentifier, retryCount, status, intent FROM %@ WHERE status = %i AND intent = %i ORDER BY position", v14, 1, a4, v34];
  }
  else {
    id v16 = [v13 cplFetch:@"SELECT position, scopeIndex, itemIdentifier, resourceType, fingerPrint, fileUTI, fileSize, taskIdentifier, retryCount, status, intent FROM %@ WHERE status = %i AND resourceType = %i AND intent = %i ORDER BY position", v14, 1, a3, a4];
  }
  unsigned int v17 = v16;

  if (v17)
  {
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    id v18 = [v17 enumerateObjectsOfClass:objc_opt_class(CPLPrequeliteDownloadResource)];
    id obj = (id)objc_claimAutoreleasedReturnValue(v18);
    id v42 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v42)
    {
      v35 = v17;
      v38 = v13;
      id v36 = a7;
      unint64_t v19 = 0LL;
      uint64_t v41 = *(void *)v44;
      while (2)
      {
        for (i = 0LL; i != v42; i = (char *)i + 1)
        {
          if (*(void *)v44 != v41) {
            objc_enumerationMutation(obj);
          }
          id v21 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v43 + 1) + 8 * (void)i) resourceWithDownloadQueue:self]);
          v22 = v21;
          if (v21)
          {
            id v23 = [v21 estimatedResourceSize];
            id v24 = v23;
            if ((a5 <= v19 || a5 - v19 < (unint64_t)v23) && -[NSMutableArray count](v11, "count"))
            {
              uint64_t v29 = 0LL;
              a7 = v36;
              uint64_t v13 = v38;
              goto LABEL_31;
            }

            id v25 = (void *)objc_claimAutoreleasedReturnValue([v22 itemScopedIdentifier]);
            if ([v25 scopeIndex] == (id)0x7FFFFFFFFFFFFFFFLL) {
              sub_10019BCC4();
            }
            id v26 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
            v27 = (void *)objc_claimAutoreleasedReturnValue([v25 identifier]);
            unsigned __int8 v28 = [v38 cplExecute:@"UPDATE %@ SET status = %i WHERE itemIdentifier = %@ AND resourceType = %i AND scopeIndex = %ld", v26, 0, v27, objc_msgSend(v22, "resourceType"), objc_msgSend(v25, "scopeIndex")];

            if ((v28 & 1) == 0)
            {
              uint64_t v13 = v38;
              uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v38 lastCPLError]);

              id v11 = 0LL;
              goto LABEL_26;
            }

            -[NSMutableArray addObject:](v11, "addObject:", v22);
            if ((unint64_t)-[NSMutableArray count](v11, "count") >= a6)
            {
              uint64_t v29 = 0LL;
              uint64_t v13 = v38;
LABEL_26:

              a7 = v36;
LABEL_31:
              unsigned int v17 = v35;

              goto LABEL_32;
            }

            v19 += (unint64_t)v24;
          }
        }

        id v42 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
        if (v42) {
          continue;
        }
        break;
      }

      uint64_t v29 = 0LL;
      unsigned int v17 = v35;
      a7 = v36;
      uint64_t v13 = v38;
    }

    else
    {
      uint64_t v29 = 0LL;
    }

- (BOOL)resetDequeuedBackgroundDownloadTasksWithError:(id *)a3
{
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pqlConnection]);

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned __int8 v8 = [v6 cplExecute:@"UPDATE OR FAIL %@ SET status = %i WHERE status = %i", v7, 1, 2];

  if (a3 && (v8 & 1) == 0) {
    *a3 = (id)objc_claimAutoreleasedReturnValue([v6 lastCPLError]);
  }

  return v8;
}

- (BOOL)removeAllBackgroundDownloadTasksForItemWithScopedIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = -[CPLPrequeliteStorage scopeIndexForLocalScopedIdentifier:](self, "scopeIndexForLocalScopedIdentifier:", v6);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v8 = 0;
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopedIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopedIdentifier:",  v6));
    }
  }

  else
  {
    int64_t v9 = v7;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pqlConnection]);

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    unsigned __int8 v8 = [v11 cplExecute:@"DELETE FROM %@ WHERE itemIdentifier = %@ AND scopeIndex = %ld", v12, v13, v9];

    if (a4 && (v8 & 1) == 0) {
      *a4 = (id)objc_claimAutoreleasedReturnValue([v11 lastCPLError]);
    }
  }

  return v8;
}

- (id)enumeratorForDownloadedResources
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pqlConnection]);

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v6 = [v4 cplFetch:@"SELECT position, scopeIndex, itemIdentifier, resourceType, fingerPrint, fileUTI, fileSize, taskIdentifier, retryCount, status, intent FROM %@ WHERE status = %i", v5, 3];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10016CCF0;
  v10[3] = &unk_100247278;
  v10[4] = self;
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 enumerateObjects:v10]);
  unsigned __int8 v8 = -[CPLPrequeliteSkipNullEnumerator initWithEnumerator:]( objc_alloc(&OBJC_CLASS___CPLPrequeliteSkipNullEnumerator),  "initWithEnumerator:",  v7);

  return v8;
}

- (unint64_t)_countOfRecordsWithStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"status = %i",  v3));
  id v8 = [v5 table:v6 countOfRecordsMatchingQuery:v7];

  return (unint64_t)v8;
}

- (unint64_t)countOfQueuedDownloadTasks
{
  return -[CPLPrequeliteResourceDownloadQueue _countOfRecordsWithStatus:](self, "_countOfRecordsWithStatus:", 1LL);
}

- (BOOL)hasActiveOrQueuedBackgroundDownloadOperations
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"status != %i",  3LL));
  unsigned __int8 v6 = [v3 table:v4 hasRecordsMatchingQuery:v5];

  return v6;
}

- (id)recordsDesignation
{
  return @"resources";
}

- (id)status
{
  uint64_t v16 = 0LL;
  unsigned int v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  unint64_t v19 = sub_10016D0B8;
  int v20 = sub_10016D0C8;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CPLPrequeliteResourceDownloadQueue;
  id v3 = -[CPLPrequeliteStorage status](&v15, "status");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v21 = [v4 mutableCopy];

  unint64_t v5 = -[CPLPrequeliteResourceDownloadQueue _countOfRecordsWithStatus:](self, "_countOfRecordsWithStatus:", 2LL);
  unint64_t v6 = -[CPLPrequeliteResourceDownloadQueue _countOfRecordsWithStatus:](self, "_countOfRecordsWithStatus:", 3LL);
  unint64_t v7 = -[CPLPrequeliteResourceDownloadQueue _countOfRecordsWithStatus:](self, "_countOfRecordsWithStatus:", 0LL);
  if (v5) {
    objc_msgSend((id)v17[5], "appendFormat:", @" (%lu to retry)", v5);
  }
  if (v6) {
    objc_msgSend((id)v17[5], "appendFormat:", @" (%lu downloaded)", v6);
  }
  if (v7) {
    objc_msgSend((id)v17[5], "appendFormat:", @" (%lu downloading)", v7);
  }
  v13[0] = 0LL;
  v13[1] = v13;
  v13[2] = 0x2020000000LL;
  char v14 = 1;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10016D0D0;
  v12[3] = &unk_100247A08;
  v12[4] = v13;
  v12[5] = &v16;
  [v8 table:v9 enumerateCountGroupedByUnsignedIntegerProperty:@"resourceType" block:v12];

  id v10 = (id)v17[5];
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v16, 8);

  return v10;
}

- (id)statusPerScopeIndex
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CPLPrequeliteResourceDownloadQueue;
  id v2 = -[CPLPrequeliteStorage statusPerScopeIndexWithGroupProperty:valueDescription:]( &v4,  "statusPerScopeIndexWithGroupProperty:valueDescription:",  @"resourceType",  &stru_100247A28);
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pqlConnection]);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned int v14 = [v12 cplExecute:@"DELETE FROM %@ WHERE scopeIndex = %ld LIMIT %ld", v13, a3, a4];

  if (v14)
  {
    *a5 = (int64_t)[v12 changes];
  }

  else if (a6)
  {
    *a6 = (id)objc_claimAutoreleasedReturnValue([v12 lastError]);
  }

  return v14;
}

- (void).cxx_destruct
{
}

@end