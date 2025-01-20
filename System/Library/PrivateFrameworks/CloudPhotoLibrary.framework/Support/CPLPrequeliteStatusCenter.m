@interface CPLPrequeliteStatusCenter
- (BOOL)acknowledgeChangedStatus:(id)a3 hasBeenDeleted:(BOOL *)a4 error:(id *)a5;
- (BOOL)addStatus:(id)a3 error:(id *)a4;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)discardNotificationForRecordWithScopedIdentifier:(id)a3 error:(id *)a4;
- (BOOL)getNewGeneration:(unint64_t *)a3 error:(id *)a4;
- (BOOL)hasStatusChanges;
- (BOOL)initializeStorage;
- (BOOL)openWithError:(id *)a3;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (CPLPrequeliteStatusCenter)initWithAbstractObject:(id)a3;
- (id)status;
- (id)statusChangesMaximumCount:(unint64_t)a3;
- (id)statusForRecordWithScopedIdentifier:(id)a3;
@end

@implementation CPLPrequeliteStatusCenter

- (CPLPrequeliteStatusCenter)initWithAbstractObject:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CPLPrequeliteStatusCenter;
  v3 = -[CPLPrequeliteStorage initWithAbstractObject:](&v8, "initWithAbstractObject:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 variableWithName:@"generation" type:v4]);
    v6 = *(void **)(v3 + 36);
    *(void *)(v3 + 36) = v5;
  }

  return (CPLPrequeliteStatusCenter *)v3;
}

- (BOOL)initializeStorage
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CPLPrequeliteStatusCenter;
  BOOL v3 = -[CPLPrequeliteStorage initializeStorage](&v5, "initializeStorage");
  if (v3)
  {
    BOOL v3 = -[CPLPrequeliteStorage createMainTableWithDefinition:error:]( self,  "createMainTableWithDefinition:error:",  @"scopeIndex INTEGER NOT NULL,identifier TEXT NOT NULL,class TEXT NOT NULL,generation INTEGER NOT NULL",  0LL);
    if (v3)
    {
      BOOL v3 = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"scopedIdentifier",  @"identifier, scopeIndex",  1LL,  0LL);
      if (v3)
      {
        BOOL v3 = -[CPLPrequeliteStorage createIndexOnColumn:error:](self, "createIndexOnColumn:error:", @"class", 0LL);
        if (v3)
        {
          BOOL v3 = -[CPLPrequeliteStorage createVariable:defaultValue:error:]( self,  "createVariable:defaultValue:error:",  *(void *)(&self->super._shouldUpgradeSchema + 1),  &off_10025A4D0,  0LL);
          if (v3) {
            LOBYTE(v3) = -[CPLPrequeliteStorage createIndexOnColumn:error:]( self,  "createIndexOnColumn:error:",  @"scopeIndex",  0LL);
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
  v18.super_class = (Class)&OBJC_CLASS___CPLPrequeliteStatusCenter;
  if (!-[CPLPrequeliteStorage upgradeStorageToVersion:](&v18, "upgradeStorageToVersion:")) {
    return 0;
  }
  unsigned __int8 v5 = 1;
  if (a3 <= 41)
  {
    if (a3 == 35) {
      return -[CPLPrequeliteStorage createStorage](self, "createStorage");
    }
    if (a3 == 39 && -[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema"))
    {
      if (!_CPLSilentLogging)
      {
        if (qword_1002A3C18 != -1) {
          dispatch_once(&qword_1002A3C18, &stru_100247E38);
        }
        v7 = (void *)qword_1002A3C20;
        if (os_log_type_enabled((os_log_t)qword_1002A3C20, OS_LOG_TYPE_DEFAULT))
        {
          objc_super v8 = v7;
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
          *(_DWORD *)buf = 138412546;
          v20 = v9;
          __int16 v21 = 2048;
          uint64_t v22 = 39LL;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Upgrading %@ to version %llu: adding scopeIndex column",  buf,  0x16u);
        }
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pqlConnection]);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
      unsigned __int8 v5 = [v11 cplExecute:@"ALTER TABLE %@ ADD COLUMN scopeIndex INTEGER DEFAULT 1", v12];
    }
  }

  else if (a3 == 42)
  {
    if (-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:type:",  @"generation",  v13));

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 valueForGlobalVariable:v14]);

      -[CPLPrequeliteStorage createVariable:defaultValue:error:]( self,  "createVariable:defaultValue:error:",  *(void *)(&self->super._shouldUpgradeSchema + 1),  v16,  0LL);
      return 1;
    }
  }

  else if (a3 == 52)
  {
    if (-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema")) {
      return -[CPLPrequeliteStorage createIndexOnColumn:error:]( self,  "createIndexOnColumn:error:",  @"scopeIndex",  0LL);
    }
  }

  else if (a3 == 53 && -[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema"))
  {
    if (-[CPLPrequeliteStorage dropIndexWithName:error:](self, "dropIndexWithName:error:", @"identifier", 0LL)) {
      return -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"scopedIdentifier",  @"identifier, scopeIndex",  1LL,  0LL);
    }
    return 0;
  }

  return v5;
}

- (BOOL)openWithError:(id *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CPLPrequeliteStatusCenter;
  return -[CPLPrequeliteStorage openWithError:](&v4, "openWithError:", a3);
}

- (BOOL)hasStatusChanges
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned __int8 v5 = [v3 tableHasRecords:v4];

  return v5;
}

- (BOOL)getNewGeneration:(unint64_t *)a3 error:(id *)a4
{
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteStorage valueForVariable:]( self,  "valueForVariable:",  *(void *)(&self->super._shouldUpgradeSchema + 1)));
  *a3 = (unint64_t)[v7 unsignedIntegerValue] + 1;

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", *a3));
  LOBYTE(a4) = -[CPLPrequeliteStorage setValue:forVariable:error:]( self,  "setValue:forVariable:error:",  v8,  *(void *)(&self->super._shouldUpgradeSchema + 1),  a4);

  return (char)a4;
}

- (BOOL)addStatus:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 record]);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v7 scopedIdentifier]);
  int64_t v9 = -[CPLPrequeliteStorage scopeIndexForLocalScopedIdentifier:](self, "scopeIndexForLocalScopedIdentifier:", v8);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v10 = 0;
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopedIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopedIdentifier:",  v8));
    }
  }

  else
  {
    int64_t v11 = v9;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 pqlConnection]);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    v16 = (objc_class *)objc_opt_class(v7);
    v17 = NSStringFromClass(v16);
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    unsigned __int8 v10 = [v13 cplExecute:@"INSERT OR REPLACE INTO %@ (scopeIndex, identifier, class, generation) VALUES (%ld, %@, %@, %lu)", v14, v11, v15, v18, objc_msgSend(v6, "generation")];

    if (a4 && (v10 & 1) == 0) {
      *a4 = (id)objc_claimAutoreleasedReturnValue([v13 lastCPLError]);
    }
  }

  return v10;
}

- (id)statusForRecordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[CPLPrequeliteStorage scopeIndexForLocalScopedIdentifier:](self, "scopeIndexForLocalScopedIdentifier:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = 0LL;
  }

  else
  {
    int64_t v7 = v5;
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 pqlConnection]);

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100187904;
    v13[3] = &unk_100247278;
    v13[4] = self;
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    int64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    id v6 = [v9 cplFetchObject:v13, @"SELECT scopeIndex, identifier, class, generation FROM %@ WHERE scopeIndex = %ld AND identifier = %@", v10, v7, v11 sql];
  }

  return v6;
}

- (id)statusChangesMaximumCount:(unint64_t)a3
{
  int64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 pqlConnection]);

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v9 = [v7 cplFetch:@"SELECT scopeIndex, identifier, class, generation FROM %@", v8];

  do
  {
    id v10 = -[CPLRecordStatus initFromPQLResultSet:center:error:]( objc_alloc(&OBJC_CLASS___CPLRecordStatus),  "initFromPQLResultSet:center:error:",  v9,  self,  0LL);
    if (v10) {
      -[NSMutableArray addObject:](v5, "addObject:", v10);
    }
    id v11 = -[NSMutableArray count](v5, "count");
  }

  while ((unint64_t)v11 < a3);

  return v5;
}

- (BOOL)acknowledgeChangedStatus:(id)a3 hasBeenDeleted:(BOOL *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 record]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 scopedIdentifier]);
  id v11 = [v10 scopeIndex];
  if (v11 == (id)0x7FFFFFFFFFFFFFFFLL
    && (id v11 = -[CPLPrequeliteStorage scopeIndexForLocalScopedIdentifier:]( self,  "scopeIndexForLocalScopedIdentifier:",  v10),  v11 == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    unsigned __int8 v12 = 0;
    if (a5) {
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopedIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopedIdentifier:",  v10));
    }
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 pqlConnection]);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
    unsigned __int8 v12 = [v14 cplExecute:@"DELETE FROM %@ WHERE scopeIndex = %ld AND identifier = %@ AND generation <= %lu", v15, v11, v16, objc_msgSend(v8, "generation")];

    if ((v12 & 1) != 0)
    {
      *a4 = (uint64_t)[v14 changes] > 0;
    }

    else if (a5)
    {
      *a5 = (id)objc_claimAutoreleasedReturnValue([v14 lastCPLError]);
    }
  }

  return v12;
}

- (BOOL)discardNotificationForRecordWithScopedIdentifier:(id)a3 error:(id *)a4
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

    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    unsigned __int8 v8 = [v11 cplExecute:@"DELETE FROM %@ WHERE scopeIndex = %ld AND identifier = %@", v12, v9, v13];

    if (a4 && (v8 & 1) == 0) {
      *a4 = (id)objc_claimAutoreleasedReturnValue([v11 lastCPLError]);
    }
  }

  return v8;
}

- (id)status
{
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___CPLPrequeliteStatusCenter;
  id v3 = -[CPLPrequeliteStorage status](&v30, "status");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [v4 mutableCopy];

  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pqlConnection]);

  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  v25 = v8;
  id v10 = [v8 cplFetch:@"SELECT class, count(class) FROM %@ GROUP BY class", v9];

  if ([v10 next])
  {
    do
    {
      uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 stringAtIndex:0]);
      if (v11) {
        unsigned __int8 v12 = (__CFString *)v11;
      }
      else {
        unsigned __int8 v12 = @"(nil)";
      }
      v13 = (char *)[v10 unsignedIntegerAtIndex:1];
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v12));
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  &v13[(void)[v14 unsignedIntegerValue]]));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v15, v12);
    }

    while (([v10 next] & 1) != 0);
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v6, "allKeys"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 sortedArrayUsingSelector:"compare:"]);

  id v18 = [v17 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)i);
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v22));
        [v5 appendFormat:@"\n\t%@: %@", v22, v23];
      }

      id v19 = [v17 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }

    while (v19);
  }

  return v5;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pqlConnection]);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
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