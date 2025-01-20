@interface CPLPrequeliteOutgoingResources
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 discardedResources:(id *)a6 error:(id *)a7;
- (BOOL)deleteResourcesToUploadWithUploadIdentifier:(id)a3 error:(id *)a4;
- (BOOL)initializeStorage;
- (BOOL)shouldUploadResource:(id)a3;
- (BOOL)storeResourceToUpload:(id)a3 withUploadIdentifier:(id)a4 error:(id *)a5;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (id)recordsDesignation;
- (id)resourceTypesToUploadForUploadIdentifier:(id)a3;
- (id)resourcesToUploadForUploadIdentifier:(id)a3;
- (id)status;
- (id)statusPerScopeIndex;
- (unint64_t)availableResourceSizeForUploadIdentifier:(id)a3;
- (unint64_t)countOfOriginalImages;
- (unint64_t)countOfOriginalOthers;
- (unint64_t)countOfOriginalVideos;
- (unint64_t)sizeOfOriginalResourcesToUpload;
- (unint64_t)sizeOfResourcesToUpload;
- (void)_cacheCountOfOriginalsIfNecessary;
- (void)_cacheUploadSizesIfNecessary;
- (void)writeTransactionDidFail;
@end

@implementation CPLPrequeliteOutgoingResources

- (BOOL)initializeStorage
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CPLPrequeliteOutgoingResources;
  BOOL v3 = -[CPLPrequeliteStorage initializeStorage](&v7, "initializeStorage");
  if (v3)
  {
    BOOL v3 = -[CPLPrequeliteStorage createMainTableWithDefinition:error:]( self,  "createMainTableWithDefinition:error:",  @"scopeIndex INTEGER NOT NULL,itemIdentifier TEXT NOT NULL,resourceType INTEGER NOT NULL,fingerPrint TEXT NOT NULL,fileUTI TEXT NOT NULL,fileKind INTEGER NOT NULL,fileSize INTEGER NOT NULL,uploadIdentifier TEXT NOT NULL",  0LL);
    if (v3)
    {
      unsigned int v4 = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"resourceType",  @"resourceType, fileKind",  0LL,  0LL);
      LOBYTE(v3) = 0;
      if (v4)
      {
        unsigned int v5 = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"resource",  @"itemIdentifier, resourceType, fingerPrint",  0LL,  0LL);
        LOBYTE(v3) = 0;
        if (v5)
        {
          BOOL v3 = -[CPLPrequeliteStorage createIndexOnColumn:error:]( self,  "createIndexOnColumn:error:",  @"uploadIdentifier",  0LL);
          if (v3)
          {
            BOOL v3 = -[CPLPrequeliteStorage createIndexOnColumn:error:]( self,  "createIndexOnColumn:error:",  @"scopeIndex",  0LL);
            if (v3)
            {
              LOBYTE(v3) = 1;
              *(&self->super._shouldUpgradeSchema + 1) = 1;
              *(void *)(&self->_countOfOriginalsIsCached + 4) = 0LL;
              *(unint64_t *)((char *)&self->_countOfOriginalImages + 4) = 0LL;
              *(unint64_t *)((char *)&self->_countOfOriginalVideos + 4) = 0LL;
              BYTE4(self->_sizeOfOriginalResourcesToUpload) = 1;
              *(unint64_t *)((char *)&self->_countOfOriginalOthers + 4) = 0LL;
              *(unint64_t *)((char *)&self->_sizeOfResourcesToUpload + 4) = 0LL;
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
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CPLPrequeliteOutgoingResources;
  if (!-[CPLPrequeliteStorage upgradeStorageToVersion:](&v14, "upgradeStorageToVersion:")) {
    return 0;
  }
  if (a3 == 52)
  {
    if (-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema")) {
      return -[CPLPrequeliteStorage createIndexOnColumn:error:]( self,  "createIndexOnColumn:error:",  @"scopeIndex",  0LL);
    }
    return 1;
  }

  if (a3 != 39)
  {
    if (a3 == 31) {
      return -[CPLPrequeliteStorage createStorage](self, "createStorage");
    }
    return 1;
  }

  if (!-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema")) {
    return 1;
  }
  if (!_CPLSilentLogging)
  {
    id v7 = sub_10015EFF8();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
      *(_DWORD *)buf = 138412546;
      v16 = v9;
      __int16 v17 = 2048;
      uint64_t v18 = 39LL;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Upgrading %@ to version %llu: adding scopeIndex column",  buf,  0x16u);
    }
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pqlConnection]);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned __int8 v6 = [v11 cplExecute:@"ALTER TABLE %@ ADD COLUMN scopeIndex INTEGER DEFAULT 1", v12];

  return v6;
}

- (BOOL)storeResourceToUpload:(id)a3 withUploadIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 itemScopedIdentifier]);
  int64_t v11 = -[CPLPrequeliteStorage scopeIndexForLocalScopedIdentifier:](self, "scopeIndexForLocalScopedIdentifier:", v10);

  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v32 = a5;
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    v36 = (void *)objc_claimAutoreleasedReturnValue([v14 pqlConnection]);

    id v33 = v9;
    v34 = v8;
    v15 = -[CPLPrequeliteOutgoingResource initWithResource:uploadIdentifier:]( objc_alloc(&OBJC_CLASS___CPLPrequeliteOutgoingResource),  "initWithResource:uploadIdentifier:",  v8,  v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v35 = -[CPLPrequeliteOutgoingResource scopeIndex](v15, "scopeIndex");
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteOutgoingResource itemIdentifier](v15, "itemIdentifier"));
    unint64_t v18 = -[CPLPrequeliteOutgoingResource resourceType](v15, "resourceType");
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteOutgoingResource fingerPrint](v15, "fingerPrint"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteOutgoingResource fileUTI](v15, "fileUTI"));
    id v21 = (id)-[CPLPrequeliteOutgoingResource fileKind](v15, "fileKind");
    id v22 = -[CPLPrequeliteOutgoingResource fileSize](v15, "fileSize");
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteOutgoingResource uploadIdentifier](v15, "uploadIdentifier"));
    unint64_t v31 = v18;
    v12 = v36;
    unsigned __int8 v13 = [v36 cplExecute:@"INSERT INTO %@ (scopeIndex, itemIdentifier, resourceType, fingerPrint, fileUTI, fileKind, fileSize, uploadIdentifier) VALUES (%ld, %@, %i, %@, %@, %i, %llu, %@)", v16, v35, v17, v31, v19, v20, v21, v22, v23];

    if ((v13 & 1) != 0)
    {
      BYTE5(self->_sizeOfOriginalResourcesToUpload) = 1;
      id v8 = v34;
      if (BYTE4(self->_sizeOfOriginalResourcesToUpload))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue([v34 identity]);
        id v25 = [v24 fileSize];

        *(unint64_t *)((char *)&self->_countOfOriginalOthers + 4) += (unint64_t)v25;
        if ([v34 resourceType] == (id)1) {
          *(unint64_t *)((char *)&self->_sizeOfResourcesToUpload + 4) += (unint64_t)v25;
        }
      }

      id v9 = v33;
      if (*(&self->super._shouldUpgradeSchema + 1) && [v34 resourceType] == (id)1)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue([v34 identity]);
        v27 = (void *)objc_claimAutoreleasedReturnValue([v26 fileUTI]);

        if (v27)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](&OBJC_CLASS___UTType, "typeWithIdentifier:", v27));
          if ([v28 conformsToType:UTTypeImage])
          {
            uint64_t v29 = 44LL;
          }

          else if ([v28 conformsToType:UTTypeMovie])
          {
            uint64_t v29 = 52LL;
          }

          else
          {
            uint64_t v29 = 60LL;
          }

          ++*(void *)&self->super.CPLPlatformObject_opaque[v29];
        }

        else
        {
          ++*(unint64_t *)((char *)&self->_countOfOriginalVideos + 4);
        }
      }
    }

    else
    {
      id v9 = v33;
      id v8 = v34;
      if (v32) {
        id *v32 = (id)objc_claimAutoreleasedReturnValue([v36 lastCPLError]);
      }
    }

    goto LABEL_23;
  }

  if (a5)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v8 itemScopedIdentifier]);
    unsigned __int8 v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopedIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopedIdentifier:",  v12));
LABEL_23:

    goto LABEL_24;
  }

  unsigned __int8 v13 = 0;
LABEL_24:

  return v13;
}

- (BOOL)deleteResourcesToUploadWithUploadIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pqlConnection]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned __int8 v10 = [v8 cplExecute:@"DELETE FROM %@ WHERE uploadIdentifier = %@", v9, v6];

  if ((v10 & 1) != 0)
  {
    BYTE5(self->_sizeOfOriginalResourcesToUpload) = 1;
    BYTE4(self->_sizeOfOriginalResourcesToUpload) = 0;
    *(&self->super._shouldUpgradeSchema + 1) = 0;
  }

  else if (a4)
  {
    *a4 = (id)objc_claimAutoreleasedReturnValue([v8 lastCPLError]);
  }

  return v10;
}

- (id)resourceTypesToUploadForUploadIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___CPLResourceTypeSet);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 pqlConnection]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v9 = [v7 cplFetch:@"SELECT resourceType FROM %@ WHERE uploadIdentifier = %@", v8, v4];

  if ([v9 next])
  {
    do
      objc_msgSend(v5, "addResourceType:", (int)objc_msgSend(v9, "intAtIndex:", 0));
    while (([v9 next] & 1) != 0);
  }

  return v5;
}

- (unint64_t)availableResourceSizeForUploadIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pqlConnection]);

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v9 = [v6 cplFetchObjectOfClass:v7, @"SELECT SUM(fileSize) FROM %@ WHERE uploadIdentifier = %@", v8, v4 sql];

  id v10 = [v9 unsignedLongLongValue];
  return (unint64_t)v10;
}

- (id)resourcesToUploadForUploadIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 pqlConnection]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v9 = [v7 cplFetch:@"SELECT scopeIndex, itemIdentifier, resourceType, fingerPrint, fileUTI, fileKind, fileSize, uploadIdentifier FROM %@ WHERE uploadIdentifier = %@", v8, v4];

  if ([v9 next])
  {
    do
    {
      id v10 = -[CPLPrequeliteOutgoingResource initFromPQLResultSet:error:]( objc_alloc(&OBJC_CLASS___CPLPrequeliteOutgoingResource),  "initFromPQLResultSet:error:",  v9,  0LL);
      int64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 resourceWithOutgoingResources:self]);
      if (v11) {
        -[NSMutableArray addObject:](v5, "addObject:", v11);
      }
    }

    while (([v9 next] & 1) != 0);
  }

  return v5;
}

- (BOOL)shouldUploadResource:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 itemScopedIdentifier]);
  int64_t v6 = -[CPLPrequeliteStorage scopeIndexForLocalScopedIdentifier:](self, "scopeIndexForLocalScopedIdentifier:", v5);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v7 = 0;
  }

  else
  {
    int64_t v8 = v6;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    int64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    id v12 = [v4 resourceType];
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v4 identity]);
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v13 fingerPrint]);
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"scopeIndex = %ld AND itemIdentifier = %@ AND resourceType = %i AND fingerPrint = %@",  v8,  v11,  v12,  v14));
    unsigned __int8 v7 = [v9 table:v10 hasRecordsMatchingQuery:v15];
  }

  return v7;
}

- (void)_cacheCountOfOriginalsIfNecessary
{
  if (!*(&self->super._shouldUpgradeSchema + 1))
  {
    BOOL v3 = &self->_countOfOriginalsIsCached + 4;
    *(void *)(&self->_countOfOriginalsIsCached + 4) = 0LL;
    id v4 = (BOOL *)&self->_countOfOriginalImages + 4;
    *(unint64_t *)((char *)&self->_countOfOriginalImages + 4) = 0LL;
    id v5 = (BOOL *)&self->_countOfOriginalVideos + 4;
    *(unint64_t *)((char *)&self->_countOfOriginalVideos + 4) = 0LL;
    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    id v12 = (id)objc_claimAutoreleasedReturnValue([v6 pqlConnection]);

    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v8 = [v12 cplFetch:@"SELECT fileKind, count(fileKind) FROM %@ WHERE resourceType = %i GROUP BY fileKind", v7, 1];

    if ([v8 next])
    {
      do
      {
        unsigned int v9 = [v8 intAtIndex:0];
        id v10 = [v8 unsignedIntegerAtIndex:1];
        if (v9 == 1) {
          int64_t v11 = v4;
        }
        else {
          int64_t v11 = v5;
        }
        if (!v9) {
          int64_t v11 = v3;
        }
        *(void *)v11 += v10;
      }

      while (([v8 next] & 1) != 0);
    }

    *(&self->super._shouldUpgradeSchema + 1) = 1;
  }

- (unint64_t)countOfOriginalImages
{
  return *(void *)(&self->_countOfOriginalsIsCached + 4);
}

- (unint64_t)countOfOriginalVideos
{
  return *(unint64_t *)((char *)&self->_countOfOriginalImages + 4);
}

- (unint64_t)countOfOriginalOthers
{
  return *(unint64_t *)((char *)&self->_countOfOriginalVideos + 4);
}

- (void)_cacheUploadSizesIfNecessary
{
  if (!BYTE4(self->_sizeOfOriginalResourcesToUpload))
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    id v10 = (id)objc_claimAutoreleasedReturnValue([v3 pqlConnection]);

    uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v6 = [v10 cplFetchObjectOfClass:v4, @"SELECT SUM(fileSize) FROM %@", v5 sql];
    *(unint64_t *)((char *)&self->_countOfOriginalOthers + 4) = (unint64_t)[v6 unsignedLongLongValue];

    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v9 = [v10 cplFetchObjectOfClass:v7, @"SELECT SUM(fileSize) FROM %@ WHERE resourceType = %i", v8, 1 sql];
    *(unint64_t *)((char *)&self->_sizeOfResourcesToUpload + 4) = (unint64_t)[v9 unsignedLongLongValue];

    BYTE4(self->_sizeOfOriginalResourcesToUpload) = 1;
  }

- (unint64_t)sizeOfResourcesToUpload
{
  return *(unint64_t *)((char *)&self->_countOfOriginalOthers + 4);
}

- (unint64_t)sizeOfOriginalResourcesToUpload
{
  return *(unint64_t *)((char *)&self->_sizeOfResourcesToUpload + 4);
}

- (id)recordsDesignation
{
  return @"resources";
}

- (id)status
{
  uint64_t v12 = 0LL;
  unsigned __int8 v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = sub_100160204;
  v16 = sub_100160214;
  id v17 = 0LL;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10016021C;
  v11[3] = &unk_100247688;
  v11[4] = self;
  v11[5] = &v12;
  [v3 table:v4 enumerateCountGroupedByUnsignedIntegerProperty:@"resourceType" block:v11];

  id v5 = (void *)v13[5];
  if (v5)
  {
    id v6 = v5;
  }

  else
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___CPLPrequeliteOutgoingResources;
    id v7 = -[CPLPrequeliteStorage status](&v10, "status");
    id v6 = (id)objc_claimAutoreleasedReturnValue(v7);
  }

  id v8 = v6;
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (id)statusPerScopeIndex
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CPLPrequeliteOutgoingResources;
  id v2 = -[CPLPrequeliteStorage statusPerScopeIndexWithGroupProperty:valueDescription:]( &v4,  "statusPerScopeIndexWithGroupProperty:valueDescription:",  @"resourceType",  &stru_1002476C8);
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (void)writeTransactionDidFail
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CPLPrequeliteOutgoingResources;
  -[CPLPrequeliteStorage writeTransactionDidFail](&v3, "writeTransactionDidFail");
  if (BYTE5(self->_sizeOfOriginalResourcesToUpload))
  {
    BYTE4(self->_sizeOfOriginalResourcesToUpload) = 0;
    *(&self->super._shouldUpgradeSchema + 1) = 0;
  }

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 discardedResources:(id *)a6 error:(id *)a7
{
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  char v32 = 1;
  if (a4 >= 100) {
    int64_t v10 = 100LL;
  }
  else {
    int64_t v10 = a4;
  }
  int64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
  uint64_t v12 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v10);
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 pqlConnection]);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v16 = [v14 cplFetch:@"SELECT scopeIndex, itemIdentifier, resourceType, fingerPrint, fileUTI, fileKind, fileSize, uploadIdentifier, rowID FROM %@ WHERE scopeIndex = %ld LIMIT %ld", v15, a3, v10];
  while (1)
  {

    id v17 = -[CPLPrequeliteOutgoingResource initFromPQLResultSet:error:]( objc_alloc(&OBJC_CLASS___CPLPrequeliteOutgoingResource),  "initFromPQLResultSet:error:",  v16,  a7);
    v15 = v17;
    if (!v17)
    {
      *((_BYTE *)v30 + 24) = 0;
      break;
    }

    unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 resourceWithScopeIdentifier:@"<DELETED_SCOPE>"]);
    -[NSMutableArray addObject:](v12, "addObject:", v18);
    -[NSMutableIndexSet addIndex:](v11, "addIndex:", [v16 integerAtIndex:8]);
  }

  v19 = v30;
  if (*((_BYTE *)v30 + 24))
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1001607DC;
    v25[3] = &unk_1002476F0;
    v28 = &v29;
    id v20 = v14;
    id v26 = v20;
    v27 = self;
    -[NSMutableIndexSet enumerateIndexesUsingBlock:](v11, "enumerateIndexesUsingBlock:", v25);
    if (a7 && !*((_BYTE *)v30 + 24)) {
      *a7 = (id)objc_claimAutoreleasedReturnValue([v20 lastError]);
    }

    v19 = v30;
    if (*((_BYTE *)v30 + 24))
    {
      *a5 = (int64_t)-[NSMutableIndexSet count](v11, "count");
      *a6 = v12;
      v19 = v30;
    }
  }

  BYTE5(self->_sizeOfOriginalResourcesToUpload) = 1;
  BYTE4(self->_sizeOfOriginalResourcesToUpload) = 0;
  *(&self->super._shouldUpgradeSchema + 1) = 0;
  char v21 = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v29, 8);
  return v21;
}

@end