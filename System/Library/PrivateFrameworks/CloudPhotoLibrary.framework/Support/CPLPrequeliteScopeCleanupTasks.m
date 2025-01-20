@interface CPLPrequeliteScopeCleanupTasks
- (BOOL)addCleanupTaskForScopeWithIndex:(int64_t)a3 scopeIdentifier:(id)a4 scopeType:(unint64_t)a5 error:(id *)a6;
- (BOOL)deleteCleanupTaskForScopeWithIndex:(int64_t)a3 error:(id *)a4;
- (BOOL)hasCleanupTasks;
- (BOOL)initializeStorage;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (id)status;
- (id)statusDictionary;
- (int64_t)nextCleanupTaskScopeIndexOfType:(unint64_t *)a3;
@end

@implementation CPLPrequeliteScopeCleanupTasks

- (BOOL)initializeStorage
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CPLPrequeliteScopeCleanupTasks;
  BOOL v3 = -[CPLPrequeliteStorage initializeStorage](&v5, "initializeStorage");
  if (v3) {
    LOBYTE(v3) = -[CPLPrequeliteStorage createMainTableWithDefinition:error:]( self,  "createMainTableWithDefinition:error:",  @"scopeIndex INTEGER NOT NULL,scopeType INTEGER NOT NULL,scopeIdentifier STRING NOT NULL",  0LL);
  }
  return v3;
}

- (BOOL)upgradeStorageToVersion:(int64_t)a3
{
  if (a3 == 40) {
    return -[CPLPrequeliteStorage createStorage](self, "createStorage");
  }
  else {
    return 1;
  }
}

- (BOOL)addCleanupTaskForScopeWithIndex:(int64_t)a3 scopeIdentifier:(id)a4 scopeType:(unint64_t)a5 error:(id *)a6
{
  id v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pqlConnection]);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned __int8 v14 = [v12 cplExecute:@"INSERT INTO %@ (scopeIndex, scopeType, scopeIdentifier) VALUES (%ld, %lu, %@)", v13, a3, a5, v10];

  if (a6 && (v14 & 1) == 0) {
    *a6 = (id)objc_claimAutoreleasedReturnValue([v12 lastError]);
  }

  return v14;
}

- (int64_t)nextCleanupTaskScopeIndexOfType:(unint64_t *)a3
{
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pqlConnection]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v8 = [v6 cplFetch:@"SELECT scopeIndex, scopeType FROM %@ LIMIT 1", v7];

  if ([v8 next])
  {
    do
    {
      int64_t v9 = (int64_t)[v8 integerAtIndex:0];
      *a3 = (unint64_t)[v8 unsignedIntegerAtIndex:1];
    }

    while (([v8 next] & 1) != 0);
  }

  else
  {
    int64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

- (BOOL)deleteCleanupTaskForScopeWithIndex:(int64_t)a3 error:(id *)a4
{
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pqlConnection]);

  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned __int8 v10 = [v8 cplExecute:@"DELETE FROM %@ WHERE scopeIndex = %ld", v9, a3];

  if (a4 && (v10 & 1) == 0) {
    *a4 = (id)objc_claimAutoreleasedReturnValue([v8 lastError]);
  }

  return v10;
}

- (BOOL)hasCleanupTasks
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned __int8 v5 = [v3 tableHasRecords:v4];

  return v5;
}

- (id)status
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v5 = [v3 tableCountOfRecords:v4];

  if (v5) {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lu scope indexes to clean",  v5));
  }
  else {
    v6 = 0LL;
  }
  return v6;
}

- (id)statusDictionary
{
  return &__NSDictionary0__struct;
}

@end