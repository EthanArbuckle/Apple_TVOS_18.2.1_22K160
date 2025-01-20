@interface CPLPrequeliteQuarantinedRecords
- (BOOL)addQuarantinedRecordWithScopedIdentifier:(id)a3 recordClass:(Class)a4 reason:(id)a5 error:(id *)a6;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)initializeStorage;
- (BOOL)isRecordWithScopedIdentifierQuarantined:(id)a3;
- (BOOL)removeQuarantinedRecordWithScopedIdentifier:(id)a3 removed:(BOOL *)a4 error:(id *)a5;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (Class)classForQuarantinedRecordWithScopedIdentifier:(id)a3;
- (unint64_t)countOfQuarantinedRecords;
- (unint64_t)countOfQuarantinedRecordsInScopeWithIdentifier:(id)a3;
@end

@implementation CPLPrequeliteQuarantinedRecords

- (BOOL)initializeStorage
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CPLPrequeliteQuarantinedRecords;
  BOOL v3 = -[CPLPrequeliteStorage initializeStorage](&v5, "initializeStorage");
  if (v3)
  {
    BOOL v3 = -[CPLPrequeliteStorage createMainTableWithDefinition:error:]( self,  "createMainTableWithDefinition:error:",  @"scopeIndex INTEGER NOT NULL,localIdentifier TEXT NOT NULL,quarantineDate TIMESTAMP NOT NULL,class TEXT,reason TEXT NOT NULL",  0LL);
    if (v3) {
      LOBYTE(v3) = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"localScopedIdentifier",  @"localIdentifier, scopeIndex",  1LL,  0LL);
    }
  }

  return v3;
}

- (BOOL)upgradeStorageToVersion:(int64_t)a3
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___CPLPrequeliteQuarantinedRecords;
  if (!-[CPLPrequeliteStorage upgradeStorageToVersion:](&v25, "upgradeStorageToVersion:"))
  {
    LOBYTE(v5) = 0;
    return (char)v5;
  }

  LOBYTE(v5) = 1;
  if (a3 > 38)
  {
    if (a3 != 39)
    {
      if (a3 == 63)
      {
        if (-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema"))
        {
          if (!_CPLSilentLogging)
          {
            if (qword_1002A3C08 != -1) {
              dispatch_once(&qword_1002A3C08, &stru_100247E18);
            }
            v12 = (void *)qword_1002A3C10;
            if (os_log_type_enabled((os_log_t)qword_1002A3C10, OS_LOG_TYPE_DEFAULT))
            {
              v13 = v12;
              v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
              *(_DWORD *)buf = 138412546;
              v27 = v14;
              __int16 v28 = 2048;
              uint64_t v29 = 63LL;
              _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Upgrading %@ to version %llu: adding class column",  buf,  0x16u);
            }
          }

          v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
          v6 = (void *)objc_claimAutoreleasedReturnValue([v15 pqlConnection]);

          v16 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
          unsigned int v17 = [v6 cplExecute:@"ALTER TABLE %@ ADD COLUMN class TEXT DEFAULT NULL", v16];

          if (v17)
          {
            objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
            v18 = (void *)objc_claimAutoreleasedReturnValue([v5 clientCache]);
            v19 = (void *)objc_claimAutoreleasedReturnValue([v18 mainTable]);

            v20 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
            LODWORD(v5) = [v6 cplExecute:@"UPDATE %@ SET class = (SELECT class FROM %@ WHERE identifier = %@.localIdentifier AND scopeIndex = %@.scopeIndex)", v20, v19, v20, v20];
            if ((_DWORD)v5)
            {
              uint64_t v21 = (uint64_t)[v6 changes];
              if (v21 >= 1)
              {
                uint64_t v22 = v21;
                v23 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
                objc_msgSend( v23,  "recordUpgradeEvent:",  @"Updated quarantined record classes from client cache for %lld records",  v22);
              }
            }
          }

          else
          {
            LOBYTE(v5) = 0;
          }

          goto LABEL_31;
        }
      }

      else if (a3 == 68)
      {
        objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
        v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pqlConnection]);

        v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
        LODWORD(v5) = [v6 cplExecute:@"UPDATE %@ SET class = \"CPLMasterChange\" WHERE reason = \"Asset has been quarantined\"", v7];

        if (!(_DWORD)v5) {
          goto LABEL_31;
        }
        uint64_t v8 = (uint64_t)[v6 changes];
        if (v8 < 1) {
          goto LABEL_31;
        }
        uint64_t v9 = v8;
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
        objc_msgSend(v10, "recordUpgradeEvent:", @"Fixed %lld quarantined record classes to CPLMasterChange", v9);
LABEL_14:

LABEL_31:
        return (char)v5;
      }

      return (char)v5;
    }

    if (!-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema")) {
      return (char)v5;
    }
    unsigned __int8 v11 = -[CPLPrequeliteStorage recreateMainTableWithCopyInstructions:oldFields:error:]( self,  "recreateMainTableWithCopyInstructions:oldFields:error:",  @"scopeIndex, localIdentifier, quarantineDate, class, reason",  @"1, localIdentifier, quarantineDate, NULL, reason",  0LL);
LABEL_29:
    LOBYTE(v5) = v11;
    return (char)v5;
  }

  if (a3 == 24)
  {
    unsigned __int8 v11 = -[CPLPrequeliteStorage createStorage](self, "createStorage");
    goto LABEL_29;
  }

  if (a3 == 38 && -[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema"))
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pqlConnection]);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    LOBYTE(v5) = [v6 cplExecute:@"ALTER TABLE %@ ADD COLUMN reason TEXT NOT NULL DEFAULT \"Unknown reason\"", v10];
    goto LABEL_14;
  }

  return (char)v5;
}

- (BOOL)addQuarantinedRecordWithScopedIdentifier:(id)a3 recordClass:(Class)a4 reason:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  int64_t v12 = -[CPLPrequeliteStorage scopeIndexForLocalScopedIdentifier:](self, "scopeIndexForLocalScopedIdentifier:", v10);
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v13 = 0;
    if (a6) {
      *a6 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopedIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopedIdentifier:",  v10));
    }
  }

  else
  {
    int64_t v14 = v12;
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    unint64_t v16 = (unint64_t)v15;
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 pqlConnection]);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
    uint64_t v21 = NSStringFromClass(a4);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    unsigned __int8 v13 = [v18 cplExecute:@"INSERT OR IGNORE INTO %@ (scopeIndex, localIdentifier, quarantineDate, class, reason) VALUES (%ld, %@, %lu, %@, %@)", v19, v14, v20, v16, v22, v11];

    if (a6 && (v13 & 1) == 0) {
      *a6 = (id)objc_claimAutoreleasedReturnValue([v18 lastCPLError]);
    }
  }

  return v13;
}

- (BOOL)removeQuarantinedRecordWithScopedIdentifier:(id)a3 removed:(BOOL *)a4 error:(id *)a5
{
  id v8 = a3;
  int64_t v9 = -[CPLPrequeliteStorage scopeIndexForLocalScopedIdentifier:](self, "scopeIndexForLocalScopedIdentifier:", v8);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v10 = 0;
    if (a5) {
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopedIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopedIdentifier:",  v8));
    }
  }

  else
  {
    int64_t v11 = v9;
    int64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 pqlConnection]);

    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    double v15 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    unsigned __int8 v10 = [v13 cplExecute:@"DELETE FROM %@ WHERE localIdentifier = %@ AND scopeIndex = %ld", v14, v15, v11];

    if ((v10 & 1) != 0)
    {
      *a4 = (uint64_t)[v13 changes] > 0;
    }

    else if (a5)
    {
      *a5 = (id)objc_claimAutoreleasedReturnValue([v13 lastCPLError]);
    }
  }

  return v10;
}

- (BOOL)isRecordWithScopedIdentifierQuarantined:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[CPLPrequeliteStorage scopeIndexForLocalScopedIdentifier:](self, "scopeIndexForLocalScopedIdentifier:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v6 = 0;
  }

  else
  {
    int64_t v7 = v5;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    int64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"localIdentifier = %@ AND scopeIndex = %ld",  v10,  v7));
    unsigned __int8 v6 = [v8 table:v9 hasRecordsMatchingQuery:v11];
  }

  return v6;
}

- (Class)classForQuarantinedRecordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[CPLPrequeliteStorage scopeIndexForLocalScopedIdentifier:](self, "scopeIndexForLocalScopedIdentifier:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v6 = 0LL;
  }

  else
  {
    int64_t v7 = v5;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 pqlConnection]);

    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
    int64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    unsigned __int8 v13 = (NSString *)[v9 cplFetchObjectOfClass:v10, @"SELECT class FROM %@ WHERE localIdentifier = %@ AND scopeIndex = %ld", v11, v12, v7 sql];

    if (v13)
    {
      Class v14 = NSClassFromString(v13);
      unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(v14);
    }

    else
    {
      unsigned __int8 v6 = 0LL;
    }
  }

  return (Class)v6;
}

- (unint64_t)countOfQuarantinedRecords
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v5 = [v3 tableCountOfRecords:v4];

  return (unint64_t)v5;
}

- (unint64_t)countOfQuarantinedRecordsInScopeWithIdentifier:(id)a3
{
  int64_t v4 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0LL;
  }
  int64_t v6 = v4;
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"scopeIndex = %ld",  v6));
  id v10 = [v7 table:v8 countOfRecordsMatchingQuery:v9];

  return (unint64_t)v10;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  int64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pqlConnection]);

  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
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

@end