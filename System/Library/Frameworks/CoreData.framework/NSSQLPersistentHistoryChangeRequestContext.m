@interface NSSQLPersistentHistoryChangeRequestContext
- (BOOL)executeRequestUsingConnection:(id)a3;
- (BOOL)isWritingRequest;
- (BOOL)shouldUseBatches;
- (NSPersistentHistoryChangeRequest)request;
- (NSSQLPersistentHistoryChangeRequestContext)initWithRequest:(id)a3 context:(id)a4 sqlCore:(id)a5;
- (id)createCountRequestContextForChanges;
- (id)createDeleteTransactionsRequestContext;
- (id)createRequestContextForChangesWithTransactionIDs:(id)a3;
- (id)fetchRequestContextForChanges;
- (id)fetchRequestDescribingChanges;
- (void)dealloc;
- (void)executePrologue;
@end

@implementation NSSQLPersistentHistoryChangeRequestContext

- (NSSQLPersistentHistoryChangeRequestContext)initWithRequest:(id)a3 context:(id)a4 sqlCore:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSSQLPersistentHistoryChangeRequestContext;
  v6 = -[NSSQLStoreRequestContext initWithRequest:context:sqlCore:]( &v9,  sel_initWithRequest_context_sqlCore_,  a3,  a4,  a5);
  if (v6)
  {
    if ([a3 fetchBatchSize]) {
      BOOL v7 = [a3 resultType] > 2;
    }
    else {
      BOOL v7 = 0;
    }
    v6->_shouldUseBatches = v7;
  }

  return v6;
}

- (void)dealloc
{
  self->_fetchRequest = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLPersistentHistoryChangeRequestContext;
  -[NSSQLStoreRequestContext dealloc](&v3, sel_dealloc);
}

- (NSPersistentHistoryChangeRequest)request
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLPersistentHistoryChangeRequestContext;
  return (NSPersistentHistoryChangeRequest *)-[NSSQLStoreRequestContext persistentStoreRequest]( &v3,  sel_persistentStoreRequest);
}

- (id)fetchRequestDescribingChanges
{
  v6[1] = *MEMORY[0x1895F89C0];
  if (result)
  {
    v1 = result;
    if (!result[11])
    {
      uint64_t v2 = objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(result[1], "ancillarySQLModels"),  "objectForKey:",  @"NSPersistentHistoryTrackingKey"),  "entityNamed:",  objc_msgSend((id)objc_msgSend(result, "request"), "entityNameToFetch"));
      if (v2)
      {
        objc_super v3 = (void *)v2;
        v4 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
        v1[11] = v4;
        -[NSFetchRequest setEntity:](v4, "setEntity:", [v3 entityDescription]);
        [v1[11] setIncludesSubentities:0];
        objc_msgSend( v1[11],  "setPredicate:",  objc_msgSend( (id)objc_msgSend(v1, "request"),  "predicateForStoreIdentifier:",  objc_msgSend(v1[1], "identifier")));
        [v1[11] setIncludesPropertyValues:1];
        [v1[11] setIncludesPendingChanges:0];
        if (objc_msgSend((id)objc_msgSend(v1, "request"), "fetchLimit"))
        {
          objc_msgSend(v1[11], "setFetchLimit:", objc_msgSend((id)objc_msgSend(v1, "request"), "fetchLimit"));
          if (objc_msgSend((id)objc_msgSend(v1, "request"), "fetchOffset")) {
            objc_msgSend(v1[11], "setFetchOffset:", objc_msgSend((id)objc_msgSend(v1, "request"), "fetchOffset"));
          }
        }

        if (objc_msgSend((id)objc_msgSend(v1, "request"), "fetchRequest")
          && objc_msgSend( (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v1, "request"), "fetchRequest"), "sortDescriptors"),  "count"))
        {
          objc_msgSend( v1[11],  "setSortDescriptors:",  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v1, "request"), "fetchRequest"), "sortDescriptors"));
        }

        if (objc_msgSend((id)objc_msgSend(v1, "request"), "fetchBatchSize"))
        {
          objc_msgSend(v1[11], "setFetchBatchSize:", objc_msgSend((id)objc_msgSend(v1, "request"), "fetchBatchSize"));
          if (!objc_msgSend((id)objc_msgSend(v1[11], "sortDescriptors"), "count"))
          {
            id v5 = v1[11];
            v6[0] = [MEMORY[0x189607A20] sortDescriptorWithKey:@"self" ascending:1];
            objc_msgSend( v5,  "setSortDescriptors:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v6, 1));
          }
        }
      }
    }

    return (id *)v1[11];
  }

  return result;
}

- (id)createCountRequestContextForChanges
{
  objc_super v3 = -[NSSQLPersistentHistoryChangeRequestContext fetchRequestDescribingChanges]((id *)&self->super.super.isa);
  [v3 setResultType:4];
  v4 = objc_alloc(&OBJC_CLASS___NSSQLCountRequestContext);
  if (self)
  {
    context = self->super._context;
    sqlCore = self->super._sqlCore;
  }

  else
  {
    context = 0LL;
    sqlCore = 0LL;
  }

  return  -[NSSQLFetchRequestContext initWithRequest:context:sqlCore:]( v4,  "initWithRequest:context:sqlCore:",  v3,  context,  sqlCore);
}

- (id)fetchRequestContextForChanges
{
  v13[1] = *MEMORY[0x1895F89C0];
  objc_super v3 = -[NSSQLPersistentHistoryChangeRequestContext fetchRequestDescribingChanges]((id *)&self->super.super.isa);
  unint64_t v4 = -[NSPersistentHistoryChangeRequest fetchBatchSize]( -[NSSQLPersistentHistoryChangeRequestContext request](self, "request"),  "fetchBatchSize");
  fetchRequest = self->_fetchRequest;
  if (v4)
  {
    -[NSFetchRequest setResultType:](fetchRequest, "setResultType:", 0LL);
  }

  else
  {
    -[NSFetchRequest setResultType:](fetchRequest, "setResultType:", 2LL);
    -[NSFetchRequest setAllocationType:](self->_fetchRequest, "setAllocationType:", 1LL);
  }

  if (-[NSPersistentHistoryChangeRequest resultType]( -[NSSQLPersistentHistoryChangeRequestContext request](self, "request"),  "resultType") == NSPersistentHistoryResultTypeTransactionsAndChanges)
  {
    v13[0] = @"CHANGES";
    objc_msgSend( v3,  "setRelationshipKeyPathsForPrefetching:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v13, 1));
  }

  BOOL v6 = -[NSPersistentHistoryChangeRequest resultType]( -[NSSQLPersistentHistoryChangeRequestContext request](self, "request"),  "resultType") == NSPersistentHistoryResultTypeStatusOnly || -[NSPersistentHistoryChangeRequest resultType]( -[NSSQLPersistentHistoryChangeRequestContext request](self, "request"),  "resultType") == NSPersistentHistoryResultTypeCount || -[NSPersistentHistoryChangeRequest resultType]( -[NSSQLPersistentHistoryChangeRequestContext request](self, "request"),  "resultType") == (NSPersistentHistoryResultTypeChangesOnly|NSPersistentHistoryResultTypeCount);
  if (-[NSPersistentHistoryChangeRequest propertiesToFetch]( -[NSSQLPersistentHistoryChangeRequestContext request](self, "request"),  "propertiesToFetch"))
  {
    id v7 = -[NSPersistentHistoryChangeRequest propertiesToFetch]( -[NSSQLPersistentHistoryChangeRequestContext request](self, "request"),  "propertiesToFetch");
LABEL_12:
    [v3 setPropertiesToFetch:v7];
    goto LABEL_13;
  }

  if (!v6)
  {
    v11 = (void *)objc_msgSend( MEMORY[0x189603FA8],  "arrayWithArray:",  -[NSPersistentHistoryChangeRequest propertiesToFetchForEntity:includeTransactionStrings:]( -[NSSQLPersistentHistoryChangeRequestContext request](self, "request"),  "propertiesToFetchForEntity:includeTransactionStrings:",  objc_msgSend(v3, "entity"),  -[NSSQLiteConnection _hasHistoryTransactionStringTable]((uint64_t)self->super._connection)));
    id v7 = v11;
    context = self->super._context;
    if (context && (*((_BYTE *)&context->_flags + 3) & 1) != 0) {
      [v11 removeObject:@"QUERYGEN"];
    }
    goto LABEL_12;
  }

- (id)createRequestContextForChangesWithTransactionIDs:(id)a3
{
  unint64_t v4 = -[NSPersistentHistoryChangeRequest initWithTransactionIDs:]( objc_alloc(&OBJC_CLASS___NSPersistentHistoryChangeRequest),  "initWithTransactionIDs:",  a3);
  id v5 = objc_alloc(&OBJC_CLASS___NSSQLPersistentHistoryChangeRequestContext);
  if (self)
  {
    context = self->super._context;
    sqlCore = self->super._sqlCore;
  }

  else
  {
    context = 0LL;
    sqlCore = 0LL;
  }

  v8 = -[NSSQLPersistentHistoryChangeRequestContext initWithRequest:context:sqlCore:]( v5,  "initWithRequest:context:sqlCore:",  v4,  context,  sqlCore);

  -[NSSQLPersistentHistoryChangeRequestContext executePrologue](v8, "executePrologue");
  return v8;
}

- (id)createDeleteTransactionsRequestContext
{
  objc_super v3 = -[NSBatchDeleteRequest initWithFetchRequest:]( objc_alloc(&OBJC_CLASS___NSBatchDeleteRequest),  "initWithFetchRequest:",  -[NSSQLPersistentHistoryChangeRequestContext fetchRequestDescribingChanges]((id *)&self->super.super.isa));
  -[NSBatchDeleteRequest setResultType:]( v3,  "setResultType:",  2LL * (-[NSPersistentHistoryChangeRequest resultType]( -[NSSQLPersistentHistoryChangeRequestContext request](self, "request"),  "resultType") != NSPersistentHistoryResultTypeStatusOnly));
  unint64_t v4 = objc_alloc(&OBJC_CLASS___NSSQLBatchDeleteRequestContext);
  if (self)
  {
    context = self->super._context;
    sqlCore = self->super._sqlCore;
  }

  else
  {
    context = 0LL;
    sqlCore = 0LL;
  }

  id v7 = -[NSSQLStoreRequestContext initWithRequest:context:sqlCore:]( v4,  "initWithRequest:context:sqlCore:",  v3,  context,  sqlCore);

  return v7;
}

- (BOOL)isWritingRequest
{
  return -[NSPersistentHistoryChangeRequest isDelete]( -[NSSQLPersistentHistoryChangeRequestContext request](self, "request"),  "isDelete")
      || -[NSPersistentHistoryChangeRequest isPercentageDelete]( -[NSSQLPersistentHistoryChangeRequestContext request](self, "request"),  "isPercentageDelete");
}

- (void)executePrologue
{
  if (-[NSPersistentHistoryChangeRequest fetchRequest]( -[NSSQLPersistentHistoryChangeRequestContext request](self, "request"),  "fetchRequest"))
  {
    id v3 = -[NSPersistentHistoryChangeRequest entityNameToFetch]( -[NSSQLPersistentHistoryChangeRequestContext request](self, "request"),  "entityNameToFetch");
    if (self) {
      sqlCore = self->super._sqlCore;
    }
    else {
      sqlCore = 0LL;
    }
    if (!objc_msgSend( (id)objc_msgSend( -[NSSQLCore ancillarySQLModels](sqlCore, "ancillarySQLModels"),  "objectForKey:",  @"NSPersistentHistoryTrackingKey"),  "entityNamed:",  v3))
    {
      id v5 = (void *)MEMORY[0x189603F70];
      uint64_t v6 = [NSString stringWithFormat:@"Invalid entity for NSPersistentHistoryChangeRequest: %@", v3];
      objc_exception_throw((id)[v5 exceptionWithName:*MEMORY[0x189603A58] reason:v6 userInfo:0]);
      __break(1u);
    }
  }

- (BOOL)executeRequestUsingConnection:(id)a3
{
  id newValue = 0LL;
  id v5 = (void *)MEMORY[0x186E3E5D8](self, a2);
  -[NSSQLStoreRequestContext setConnection:]((uint64_t)self, a3);
  -[NSSQLiteConnection connect]((uint64_t)a3);
  _executeChangeRequest(self, (uint64_t *)&newValue);
  uint64_t v8 = v7;
  if (v7)
  {
    objc_super v9 = -[NSSQLPersistentHistoryChangeRequestContext request](self, "request");
    if (self) {
      sqlCore = self->super._sqlCore;
    }
    else {
      sqlCore = 0LL;
    }
    -[NSSQLStoreRequestContext setResult:]( self,  "setResult:",  +[NSPersistentHistoryResult _processResult:forRequest:withProvider:]( &OBJC_CLASS___NSPersistentHistoryResult,  "_processResult:forRequest:withProvider:",  v8,  v9,  sqlCore));
  }

  BOOL v11 = newValue == 0LL;
  if (self && newValue) {
    objc_setProperty_nonatomic(self, v6, newValue, 40LL);
  }
  objc_autoreleasePoolPop(v5);
  -[NSSQLStoreRequestContext setConnection:]((uint64_t)self, 0LL);
  return v11;
}

- (BOOL)shouldUseBatches
{
  return self->_shouldUseBatches;
}

@end