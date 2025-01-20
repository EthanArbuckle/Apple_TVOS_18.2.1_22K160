@interface CPLPrequeliteRevertRecords
- (BOOL)_isEmpty;
- (BOOL)addRecordsToRevertWithLocalScopedIdentifier:(id)a3 class:(Class)a4 error:(id *)a5;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)deleteRecordsToRevertWithLocalScopedIdentifier:(id)a3 error:(id *)a4;
- (BOOL)initializeStorage;
- (BOOL)shouldRevertRecordWithLocalScopedIdentifier:(id)a3;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (CPLPrequeliteRevertRecords)initWithAbstractObject:(id)a3;
- (id)revertedPlaceholderRecordsEnumerator;
- (id)status;
- (void)writeTransactionDidFail;
@end

@implementation CPLPrequeliteRevertRecords

- (CPLPrequeliteRevertRecords)initWithAbstractObject:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CPLPrequeliteRevertRecords;
  v3 = -[CPLPrequeliteStorage initWithAbstractObject:](&v8, "initWithAbstractObject:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:type:]( &OBJC_CLASS___CPLPrequeliteSynthesizedVariable,  "variableWithName:type:",  @"isEmpty",  v4));
    v6 = *(void **)(v3 + 36);
    *(void *)(v3 + 36) = v5;
  }

  return (CPLPrequeliteRevertRecords *)v3;
}

- (BOOL)_isEmpty
{
  v2 = *(void **)(&self->super._shouldUpgradeSchema + 1);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100185948;
  v6[3] = &unk_100247CB0;
  v6[4] = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 valueWithConstructor:v6]);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)initializeStorage
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CPLPrequeliteRevertRecords;
  BOOL v3 = -[CPLPrequeliteStorage initializeStorage](&v5, "initializeStorage");
  if (v3)
  {
    BOOL v3 = -[CPLPrequeliteStorage createMainTableWithDefinition:error:]( self,  "createMainTableWithDefinition:error:",  @"scopeIndex INTEGER NOT NULL,identifier TEXT NOT NULL,class TEXT NOT NULL",  0LL);
    if (v3)
    {
      BOOL v3 = -[CPLPrequeliteStorage createIndexOnColumn:error:]( self,  "createIndexOnColumn:error:",  @"scopeIndex",  0LL);
      if (v3) {
        LOBYTE(v3) = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"scopedIdentifier",  @"scopeIndex, identifier",  1LL,  0LL);
      }
    }
  }

  return v3;
}

- (BOOL)upgradeStorageToVersion:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CPLPrequeliteRevertRecords;
  BOOL v5 = -[CPLPrequeliteStorage upgradeStorageToVersion:](&v7, "upgradeStorageToVersion:");
  if (a3 == 81 && v5) {
    LOBYTE(v5) = -[CPLPrequeliteStorage createStorage](self, "createStorage");
  }
  return v5;
}

- (BOOL)addRecordsToRevertWithLocalScopedIdentifier:(id)a3 class:(Class)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 scopeIdentifier]);
  int64_t v10 = -[CPLPrequeliteStorage stableScopeIndexForScopeIdentifier:](self, "stableScopeIndexForScopeIdentifier:", v9);

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a5)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v8 scopeIdentifier]);
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopeIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopeIdentifier:",  v11));
    }

    unsigned __int8 v12 = 0;
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 pqlConnection]);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    v17 = NSStringFromClass(a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    unsigned __int8 v12 = [v14 cplExecute:@"INSERT OR IGNORE INTO %@ (scopeIndex, identifier, class) VALUES (%ld, %@, %@)", v15, v10, v16, v18];

    if ((v12 & 1) != 0)
    {
      if ((uint64_t)[v14 changes] >= 1)
      {
        if (!_CPLSilentLogging)
        {
          if (qword_1002A3BF8 != -1) {
            dispatch_once(&qword_1002A3BF8, &stru_100247DF8);
          }
          v19 = (os_log_s *)qword_1002A3C00;
          if (os_log_type_enabled((os_log_t)qword_1002A3C00, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            Class v22 = a4;
            __int16 v23 = 2112;
            id v24 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Scheduling <%@ %@> to be reverted by client",  buf,  0x16u);
          }
        }

        [*(id *)(&self->super._shouldUpgradeSchema + 1) setValue:&__kCFBooleanFalse];
      }
    }

    else if (a5)
    {
      *a5 = (id)objc_claimAutoreleasedReturnValue([v14 lastError]);
    }
  }

  return v12;
}

- (id)revertedPlaceholderRecordsEnumerator
{
  if (-[CPLPrequeliteRevertRecords _isEmpty](self, "_isEmpty")) {
    return &__NSArray0__struct;
  }
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  v23[3] = 0x7FFFFFFFFFFFFFFFLL;
  v21[0] = 0LL;
  v21[1] = v21;
  v21[2] = 0x3032000000LL;
  v21[3] = sub_100185F14;
  v21[4] = sub_100185F24;
  id v22 = 0LL;
  v19[0] = 0LL;
  v19[1] = v19;
  v19[2] = 0x2020000000LL;
  char v20 = 0;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteRevertRecords abstractObject](self, "abstractObject"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 engineStore]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 scopes]);

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pqlConnection]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v10 = [v8 cplFetch:@"SELECT scopeIndex, identifier, class FROM %@", v9];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100185F2C;
  v14[3] = &unk_100247DD8;
  v16 = v23;
  id v11 = v6;
  id v15 = v11;
  v17 = v19;
  v18 = v21;
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v10 enumerateObjects:v14]);

  id v13 = [[CPLMapEnumerator alloc] initWithEnumerator:v12];
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);

  _Block_object_dispose(v23, 8);
  return v13;
}

- (BOOL)deleteRecordsToRevertWithLocalScopedIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 scopeIdentifier]);
  int64_t v8 = -[CPLPrequeliteStorage stableScopeIndexForScopeIdentifier:](self, "stableScopeIndexForScopeIdentifier:", v7);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!a4)
    {
      unsigned __int8 v10 = 0;
      goto LABEL_10;
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 scopeIdentifier]);
    unsigned __int8 v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopeIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopeIdentifier:",  v9));
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v11 pqlConnection]);

    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    unsigned __int8 v10 = [v9 cplExecute:@"DELETE FROM %@ WHERE scopeIndex = %ld AND identifier = %@", v12, v8, v13];

    if (a4 && (v10 & 1) == 0) {
      *a4 = (id)objc_claimAutoreleasedReturnValue([v9 lastError]);
    }
    [*(id *)(&self->super._shouldUpgradeSchema + 1) discardCachedValue];
  }

LABEL_10:
  return v10;
}

- (BOOL)shouldRevertRecordWithLocalScopedIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 scopeIdentifier]);
  int64_t v6 = -[CPLPrequeliteStorage stableScopeIndexForScopeIdentifier:](self, "stableScopeIndexForScopeIdentifier:", v5);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v7 = 0;
  }

  else
  {
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"scopeIndex = %ld AND identifier = %@",  v6,  v10));
    unsigned __int8 v7 = [v8 table:v9 hasRecordsMatchingQuery:v11];
  }

  return v7;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pqlConnection]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned int v14 = [v12 cplExecute:@"DELETE FROM %@ WHERE scopeIndex = %ld LIMIT %ld", v13, a3, a4];

  if (v14)
  {
    *a5 = (int64_t)[v12 changes];
  }

  else if (a6)
  {
    *a6 = (id)objc_claimAutoreleasedReturnValue([v12 lastError]);
  }

  [*(id *)(&self->super._shouldUpgradeSchema + 1) discardCachedValue];

  return v14;
}

- (id)status
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v5 = [v3 tableCountOfRecords:v4];

  if (v5) {
    int64_t v6 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lu records to revert",  v5);
  }
  else {
    int64_t v6 = 0LL;
  }
  return v6;
}

- (void)writeTransactionDidFail
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CPLPrequeliteRevertRecords;
  -[CPLPrequeliteStorage writeTransactionDidFail](&v3, "writeTransactionDidFail");
  [*(id *)(&self->super._shouldUpgradeSchema + 1) discardCachedValue];
}

- (void).cxx_destruct
{
}

@end