@interface CPLPrequeliteChangePipeEnumerator
- (BOOL)hasChanges;
- (CPLPrequeliteChangePipeEnumerator)initWithStore:(id)a3 table:(id)a4;
- (CPLPrequeliteStore)store;
- (CPLPrequeliteTable)table;
- (void)enumerateChangesWithBlock:(id)a3;
@end

@implementation CPLPrequeliteChangePipeEnumerator

- (CPLPrequeliteChangePipeEnumerator)initWithStore:(id)a3 table:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CPLPrequeliteChangePipeEnumerator;
  v9 = -[CPLPrequeliteChangePipeEnumerator init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_store, a3);
    objc_storeStrong((id *)&v10->_table, a4);
    table = v10->_table;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:forTable:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:forTable:type:",  @"pullMarker",  table,  v12));
    pullGenerationVar = v10->_pullGenerationVar;
    v10->_pullGenerationVar = (CPLPrequeliteVariable *)v13;

    v10->_hasAlterationFlags = [v7 table:v10->_table hasColumnWithName:@"flags"];
  }

  return v10;
}

- (BOOL)hasChanges
{
  return -[CPLPrequeliteStore tableHasRecords:](self->_store, "tableHasRecords:", self->_table);
}

- (void)enumerateChangesWithBlock:(id)a3
{
  v4 = (void (**)(id, void *, id, _BYTE *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore pqlConnection](self->_store, "pqlConnection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteStore valueForGlobalVariable:]( self->_store,  "valueForGlobalVariable:",  self->_pullGenerationVar));
  id v7 = [v6 integerValue];

  if (self->_hasAlterationFlags) {
    id v8 = @"SELECT serializedRecord, flags FROM %@ WHERE batch_marker >= %lu";
  }
  else {
    id v8 = @"SELECT serializedRecord FROM %@ WHERE batch_marker >= %lu";
  }
  id v9 = objc_msgSend(v5, "cplFetch:", v8, self->_table, v7);
  do
  {
    v10 = objc_autoreleasePoolPush();
    v11 = (void *)objc_claimAutoreleasedReturnValue([v9 cplChangeAtIndex:0]);
    id v12 = self->_hasAlterationFlags ? [v9 unsignedIntegerAtIndex:1] : 0;
    unsigned __int8 v14 = 0;
    v4[2](v4, v11, v12, &v14);
    int v13 = v14;

    objc_autoreleasePoolPop(v10);
  }

  while (!v13);
}

- (CPLPrequeliteStore)store
{
  return self->_store;
}

- (CPLPrequeliteTable)table
{
  return self->_table;
}

- (void).cxx_destruct
{
}

@end