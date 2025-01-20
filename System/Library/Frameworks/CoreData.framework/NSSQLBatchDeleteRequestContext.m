@interface NSSQLBatchDeleteRequestContext
- (BOOL)executeRequestCore:(id *)a3;
- (BOOL)isWritingRequest;
- (NSBatchDeleteRequest)request;
- (NSSQLFetchRequestContext)_createFetchRequestContextForObjectsToDelete;
- (uint64_t)fetchRequestForObjectsToDelete;
- (void)_createDeleteStatements;
- (void)dealloc;
- (void)executePrologue;
@end

@implementation NSSQLBatchDeleteRequestContext

- (void)dealloc
{
  self->_deleteStatements = 0LL;
  self->_fetchRequestForObjectsToDelete = 0LL;

  self->_deletedObjectIDs = 0LL;
  self->_fetchContext = 0LL;

  self->_externalDataReferenceTriggerStatements = 0LL;
  self->super._tempTableName = 0LL;

  self->_externalDataReferencesToDelete = 0LL;
  self->_fileBackedFuturesToDelete = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLBatchDeleteRequestContext;
  -[NSSQLBatchOperationRequestContext dealloc](&v3, sel_dealloc);
}

- (NSBatchDeleteRequest)request
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLBatchDeleteRequestContext;
  return (NSBatchDeleteRequest *)-[NSSQLStoreRequestContext persistentStoreRequest](&v3, sel_persistentStoreRequest);
}

- (uint64_t)fetchRequestForObjectsToDelete
{
  if (result)
  {
    uint64_t v1 = result;
    result = *(void *)(result + 96);
    if (!result)
    {
      v2 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v1, "request"), "fetchRequest"), "copy");
      *(void *)(v1 + 96) = v2;
      [v2 _resolveEntityWithContext:*(void *)(v1 + 32)];
      [*(id *)(v1 + 96) setIncludesPropertyValues:0];
      [*(id *)(v1 + 96) setResultType:1];
      [*(id *)(v1 + 96) setPropertiesToFetch:0];
      [*(id *)(v1 + 96) setRelationshipKeyPathsForPrefetching:0];
      [*(id *)(v1 + 96) setShouldRefreshRefetchedObjects:0];
      [*(id *)(v1 + 96) setFetchBatchSize:0];
      [*(id *)(v1 + 96) setIncludesPendingChanges:0];
      return *(void *)(v1 + 96);
    }
  }

  return result;
}

- (NSSQLFetchRequestContext)_createFetchRequestContextForObjectsToDelete
{
  if (result) {
    return -[NSSQLFetchRequestContext initWithRequest:context:sqlCore:]( objc_alloc(&OBJC_CLASS___NSSQLFetchRequestContext),  "initWithRequest:context:sqlCore:",  -[NSSQLBatchDeleteRequestContext fetchRequestForObjectsToDelete]((uint64_t)result),  result->super._context,  result->super._sqlCore);
  }
  return result;
}

- (void)_createDeleteStatements
{
  if (a1)
  {
    if (!*(void *)(a1 + 104))
    {
      id newValue = 0LL;
      *(void *)(a1 + 104) = (id)-[NSSQLiteAdapter generateDeleteStatementsForRequest:error:]( [*(id *)(a1 + 8) adapter],  a1,  (uint64_t *)&newValue);
      objc_setProperty_nonatomic((id)a1, v2, newValue, 40LL);
    }
  }

- (BOOL)isWritingRequest
{
  return 1;
}

- (void)executePrologue
{
  if (-[NSBatchDeleteRequest resultType](-[NSSQLBatchDeleteRequestContext request](self, "request"), "resultType") == NSBatchDeleteResultTypeObjectIDs)
  {
    if (self)
    {
      fetchContext = self->_fetchContext;
      if (!fetchContext)
      {
        fetchContext = -[NSSQLBatchDeleteRequestContext _createFetchRequestContextForObjectsToDelete]((NSSQLFetchRequestContext *)self);
        self->_fetchContext = fetchContext;
      }
    }

    else
    {
      fetchContext = 0LL;
    }

    -[NSSQLFetchRequestContext fetchStatement](fetchContext, "fetchStatement");
  }

  else
  {
    -[NSSQLBatchDeleteRequestContext _createDeleteStatements]((uint64_t)self);
  }

- (BOOL)executeRequestCore:(id *)a3
{
  if (a3 && *a3)
  {
    if (!self) {
      return -[NSSQLStoreRequestContext result](self, "result") != 0;
    }
    objc_setProperty_nonatomic(self, v6, *a3, 40LL);
  }

  else if (!self)
  {
    return -[NSSQLStoreRequestContext result](self, "result") != 0;
  }

  if (self->super.super._exception || self->super.super._error) {
    return 0;
  }
  return -[NSSQLStoreRequestContext result](self, "result") != 0;
}

@end