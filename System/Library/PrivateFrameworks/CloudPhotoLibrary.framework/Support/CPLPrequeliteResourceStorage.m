@interface CPLPrequeliteResourceStorage
- (BOOL)_refreshLargestResourceSizeWithError:(id *)a3;
- (BOOL)initializeStorage;
- (BOOL)openWithError:(id *)a3;
- (BOOL)releaseIdentity:(id)a3 lastReference:(BOOL *)a4 isTrackedOriginal:(BOOL)a5 error:(id *)a6;
- (BOOL)resetWithError:(id *)a3;
- (BOOL)retainIdentity:(id)a3 isTrackedOriginal:(BOOL)a4 error:(id *)a5;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (CPLPrequeliteResourceStorage)initWithAbstractObject:(id)a3;
- (id)status;
- (unint64_t)retainCountForIdentity:(id)a3;
- (unint64_t)totalOriginalResourceSize;
- (unint64_t)totalResourceSize;
- (void)enumerateIdentitiesWithBlock:(id)a3;
@end

@implementation CPLPrequeliteResourceStorage

- (CPLPrequeliteResourceStorage)initWithAbstractObject:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CPLPrequeliteResourceStorage;
  v3 = -[CPLPrequeliteStorage initWithAbstractObject:](&v14, "initWithAbstractObject:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 variableWithName:@"totalSize" type:v4]);
    v6 = *(void **)(v3 + 36);
    *(void *)(v3 + 36) = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v3 variableWithName:@"totalOriginalSize" type:v7]);
    v9 = *(void **)(v3 + 44);
    *(void *)(v3 + 44) = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v3 variableWithName:@"largestResourceSize" type:v10]);
    v12 = *(void **)(v3 + 52);
    *(void *)(v3 + 52) = v11;
  }

  return (CPLPrequeliteResourceStorage *)v3;
}

- (BOOL)initializeStorage
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CPLPrequeliteResourceStorage;
  BOOL v3 = -[CPLPrequeliteStorage initializeStorage](&v5, "initializeStorage");
  if (v3)
  {
    BOOL v3 = -[CPLPrequeliteStorage createMainTableWithDefinition:error:]( self,  "createMainTableWithDefinition:error:",  @"identifierForStorage TEXT UNIQUE NOT NULL,retainCount INTEGER NOT NULL,size INTEGER,CHECK(retainCount > 0)",  0LL);
    if (v3)
    {
      BOOL v3 = -[CPLPrequeliteStorage createVariable:defaultValue:error:]( self,  "createVariable:defaultValue:error:",  *(void *)(&self->super._shouldUpgradeSchema + 1),  &off_10025A488,  0LL);
      if (v3)
      {
        BOOL v3 = -[CPLPrequeliteStorage createVariable:defaultValue:error:]( self,  "createVariable:defaultValue:error:",  *(CPLPrequeliteVariable **)((char *)&self->_totalSizeVar + 4),  &off_10025A488,  0LL);
        if (v3)
        {
          BOOL v3 = -[CPLPrequeliteStorage createVariable:defaultValue:error:]( self,  "createVariable:defaultValue:error:",  *(CPLPrequeliteVariable **)((char *)&self->_totalOriginalSizeVar + 4),  &off_10025A488,  0LL);
          if (v3)
          {
            BOOL v3 = -[CPLPrequeliteStorage createIndexOnColumn:error:]( self,  "createIndexOnColumn:error:",  @"identifierForStorage",  0LL);
            if (v3) {
              LOBYTE(v3) = -[CPLPrequeliteStorage createIndexWithName:withDefinition:condition:unique:error:]( self,  "createIndexWithName:withDefinition:condition:unique:error:",  @"size",  @"size DESC",  @"size IS NOT NULL",  0LL,  0LL);
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
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CPLPrequeliteResourceStorage;
  BOOL v5 = -[CPLPrequeliteStorage upgradeStorageToVersion:](&v18, "upgradeStorageToVersion:");
  if (v5)
  {
    if (a3 != 91)
    {
      if (a3 != 25)
      {
        if (a3 == 20)
        {
          v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
          v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
          id v8 = [v6 tableCountOfRecords:v7];

          if (v8)
          {
            if (!_CPLSilentLogging)
            {
              id v9 = sub_1001713AC();
              v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
              if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Upgrading store to version 20 and Resource Storage is not empty. We must trigger a reset sync",  buf,  2u);
              }
            }

            uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
            [v11 triggerResetAfterUpgrade:0 withReason:@"Upgrade to version 20"];
          }
        }

        goto LABEL_18;
      }

      if (-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema"))
      {
        LOBYTE(v5) = -[CPLPrequeliteStorage createVariable:defaultValue:error:]( self,  "createVariable:defaultValue:error:",  *(CPLPrequeliteVariable **)((char *)&self->_totalSizeVar + 4),  &off_10025A488,  0LL);
        return v5;
      }

- (BOOL)openWithError:(id *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CPLPrequeliteResourceStorage;
  BOOL v4 = -[CPLPrequeliteStorage openWithError:](&v12, "openWithError:", a3);
  if (v4)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteResourceStorage abstractObject](self, "abstractObject"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 engineStore]);

    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[CPLPrequeliteResourceStorage totalResourceSize](self, "totalResourceSize")));
    [v6 predictSyncSessionValue:v7 ofType:CPLSyncSessionPredictionTypeUploadResourceSize];

    uint64_t v8 = objc_claimAutoreleasedReturnValue( -[CPLPrequeliteStorage valueForVariable:]( self,  "valueForVariable:",  *(CPLPrequeliteVariable **)((char *)&self->_totalOriginalSizeVar + 4)));
    id v9 = (void *)v8;
    if (v8) {
      v10 = (_UNKNOWN **)v8;
    }
    else {
      v10 = &off_10025A488;
    }
    [v6 predictSyncSessionValue:v10 ofType:CPLSyncSessionPredictionTypeLargestResourceSize];
  }

  return v4;
}

- (BOOL)retainIdentity:(id)a3 isTrackedOriginal:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 pqlConnection]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 identityForStorage]);
  id v12 = [v8 fileSize];
  if (v12 <= +[CPLResource largeResourceSizeThreshold](&OBJC_CLASS___CPLResource, "largeResourceSizeThreshold")) {
    v13 = 0LL;
  }
  else {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v8 fileSize]));
  }
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned int v15 = [v10 cplExecute:@"INSERT OR IGNORE INTO %@ VALUES (%@, 1, %@)", v14, v11, v13];

  if (!v15)
  {
    if (!a5)
    {
      unsigned __int8 v17 = 0;
      goto LABEL_14;
    }

    goto LABEL_13;
  }

  if (![v10 changes])
  {
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    unsigned __int8 v17 = [v10 cplExecute:@"UPDATE %@ SET retainCount = retainCount + 1 WHERE identifierForStorage = %@", v18, v11];

    if (!a5 || (v17 & 1) != 0) {
      goto LABEL_14;
    }
LABEL_13:
    unsigned __int8 v17 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue([v10 lastCPLError]);
    goto LABEL_14;
  }

  int v16 = sub_1001716A8((uint64_t)self, (unint64_t)[v8 fileSize], (uint64_t)a5);
  unsigned __int8 v17 = v16;
  if (v6 && v16) {
    unsigned __int8 v17 = sub_100171724((char *)self, (uint64_t)[v8 fileSize], (uint64_t)a5);
  }
LABEL_14:

  return v17;
}

- (BOOL)releaseIdentity:(id)a3 lastReference:(BOOL *)a4 isTrackedOriginal:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pqlConnection]);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 identityForStorage]);
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned int v15 = [v12 cplExecute:@"UPDATE OR IGNORE %@ SET retainCount = retainCount - 1 WHERE identifierForStorage = %@", v14, v13];

  if (!v15) {
    goto LABEL_9;
  }
  if (![v12 changes])
  {
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    unsigned int v18 = [v12 cplExecute:@"DELETE FROM %@ WHERE identifierForStorage = %@", v17, v13];

    if (v18)
    {
      int v19 = sub_10017191C((uint64_t)self, (unint64_t)[v10 fileSize], (uint64_t)a6);
      if (v7 && v19)
      {
        if ((sub_100171BB0( (uint64_t)self,  (unint64_t)[v10 fileSize],  (uint64_t)a6) & 1) == 0) {
          goto LABEL_13;
        }
LABEL_12:
        BOOL v16 = 1;
        *a4 = 1;
        goto LABEL_14;
      }

      if (v19) {
        goto LABEL_12;
      }
LABEL_13:
      BOOL v16 = 0;
      goto LABEL_14;
    }

- (unint64_t)retainCountForIdentity:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pqlConnection]);

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identityForStorage]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v10 = [v6 cplFetchObjectOfClass:v8, @"SELECT retainCount FROM %@ WHERE identifierForStorage = %@", v9, v7 sql];

  id v11 = [v10 unsignedIntegerValue];
  return (unint64_t)v11;
}

- (void)enumerateIdentitiesWithBlock:(id)a3
{
  id v4 = (void (**)(id, void *, _BYTE *))a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pqlConnection]);

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v8 = [v6 cplFetch:@"SELECT identifierForStorage FROM %@", v7];

  if (v8)
  {
    v21 = v6;
    id v9 = [v8 enumerateObjectsOfClass:objc_opt_class(NSString)];
    char v26 = 0;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue(v9);
    id v11 = [v10 countByEnumeratingWithState:&v22 objects:v29 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          unsigned int v15 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
          BOOL v16 = (void *)objc_claimAutoreleasedReturnValue( +[CPLResourceIdentity identityFromStoredIdentity:]( &OBJC_CLASS___CPLResourceIdentity,  "identityFromStoredIdentity:",  v15));
          if (v16)
          {
            v4[2](v4, v16, &v26);
            if (v26)
            {
              [v10 close];

              goto LABEL_20;
            }
          }

          else if (!_CPLSilentLogging)
          {
            id v17 = sub_1001713AC();
            unsigned int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v28 = v15;
              _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Can't read identity from storage: %@",  buf,  0xCu);
            }
          }
        }

        id v12 = [v10 countByEnumeratingWithState:&v22 objects:v29 count:16];
      }

      while (v12);
    }

- (BOOL)_refreshLargestResourceSizeWithError:(id *)a3
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pqlConnection]);

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v9 = (_UNKNOWN **)[v6 fetchObjectOfClass:v7, @"SELECT MAX(size) FROM %@ WHERE size IS NOT NULL", v8 sql];

  BOOL v10 = -[CPLPrequeliteStorage setValue:forVariable:error:]( self,  "setValue:forVariable:error:",  v9,  *(CPLPrequeliteVariable **)((char *)&self->_totalOriginalSizeVar + 4),  a3);
  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteResourceStorage abstractObject](self, "abstractObject"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 engineStore]);
    uint64_t v13 = v12;
    if (v9) {
      objc_super v14 = v9;
    }
    else {
      objc_super v14 = &off_10025A488;
    }
    [v12 predictSyncSessionValue:v14 ofType:CPLSyncSessionPredictionTypeLargestResourceSize];
  }

  return v10;
}

- (unint64_t)totalResourceSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteStorage valueForVariable:]( self,  "valueForVariable:",  *(void *)(&self->super._shouldUpgradeSchema + 1)));
  id v3 = [v2 unsignedLongLongValue];

  return (unint64_t)v3;
}

- (unint64_t)totalOriginalResourceSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteStorage valueForVariable:]( self,  "valueForVariable:",  *(CPLPrequeliteVariable **)((char *)&self->_totalSizeVar + 4)));
  id v3 = [v2 unsignedLongLongValue];

  return (unint64_t)v3;
}

- (BOOL)resetWithError:(id *)a3
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pqlConnection]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned __int8 v8 = [v6 cplExecute:@"DELETE FROM %@", v7];

  if ((v8 & 1) != 0)
  {
    if (sub_100172298((uint64_t)self, 0LL, (uint64_t)a3)) {
      -[CPLPrequeliteStorage setValue:forVariable:error:]( self,  "setValue:forVariable:error:",  &off_10025A488,  *(CPLPrequeliteVariable **)((char *)&self->_totalSizeVar + 4),  a3);
    }
  }

  else if (a3)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v9 pqlConnection]);
    *a3 = (id)objc_claimAutoreleasedReturnValue([v10 lastError]);
  }

  return v8;
}

- (id)status
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unint64_t v5 = (unint64_t)[v3 tableCountOfRecords:v4];

  unint64_t v6 = -[CPLPrequeliteResourceStorage totalResourceSize](self, "totalResourceSize");
  if (v5 | v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSByteCountFormatter stringFromByteCount:countStyle:]( &OBJC_CLASS___NSByteCountFormatter,  "stringFromByteCount:countStyle:",  v6,  1LL));
    unsigned __int8 v8 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lu cached resources - %@",  v5,  v7));
  }

  else
  {
    unsigned __int8 v8 = @"0 cached resources";
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end