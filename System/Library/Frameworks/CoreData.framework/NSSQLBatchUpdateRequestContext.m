@interface NSSQLBatchUpdateRequestContext
- (BOOL)executeRequestCore:(id *)a3;
- (BOOL)isWritingRequest;
- (NSBatchUpdateRequest)request;
- (NSSQLBatchUpdateRequestContext)initWithRequest:(id)a3 context:(id)a4 sqlCore:(id)a5;
- (id)createFetchRequestContextForObjectsToUpdate;
- (void)dealloc;
- (void)executePrologue;
@end

@implementation NSSQLBatchUpdateRequestContext

- (NSSQLBatchUpdateRequestContext)initWithRequest:(id)a3 context:(id)a4 sqlCore:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSSQLBatchUpdateRequestContext;
  v7 = -[NSSQLStoreRequestContext initWithRequest:context:sqlCore:]( &v9,  sel_initWithRequest_context_sqlCore_,  a3,  a4,  a5);
  if (v7) {
    [a3 _resolveEntityWithContext:a4];
  }
  return v7;
}

- (void)dealloc
{
  self->_updateStatement = 0LL;
  self->_fetchRequest = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLBatchUpdateRequestContext;
  -[NSSQLBatchOperationRequestContext dealloc](&v3, sel_dealloc);
}

- (NSBatchUpdateRequest)request
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLBatchUpdateRequestContext;
  return (NSBatchUpdateRequest *)-[NSSQLStoreRequestContext persistentStoreRequest](&v3, sel_persistentStoreRequest);
}

- (id)createFetchRequestContextForObjectsToUpdate
{
  if (self)
  {
    fetchRequest = self->_fetchRequest;
    if (!fetchRequest)
    {
      v4 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
      self->_fetchRequest = v4;
      -[NSFetchRequest setEntity:]( v4,  "setEntity:",  -[NSBatchUpdateRequest entity](-[NSSQLBatchUpdateRequestContext request](self, "request"), "entity"));
      -[NSFetchRequest setIncludesSubentities:]( self->_fetchRequest,  "setIncludesSubentities:",  -[NSBatchUpdateRequest includesSubentities]( -[NSSQLBatchUpdateRequestContext request](self, "request"),  "includesSubentities"));
      -[NSFetchRequest setPredicate:]( self->_fetchRequest,  "setPredicate:",  -[NSBatchUpdateRequest predicate](-[NSSQLBatchUpdateRequestContext request](self, "request"), "predicate"));
      -[NSFetchRequest setIncludesPropertyValues:](self->_fetchRequest, "setIncludesPropertyValues:", 0LL);
      -[NSFetchRequest setIncludesPendingChanges:](self->_fetchRequest, "setIncludesPendingChanges:", 0LL);
      -[NSFetchRequest setResultType:](self->_fetchRequest, "setResultType:", 1LL);
      fetchRequest = self->_fetchRequest;
    }

    v5 = objc_alloc(&OBJC_CLASS___NSSQLFetchRequestContext);
    context = self->super.super._context;
    sqlCore = self->super.super._sqlCore;
  }

  else
  {
    v5 = objc_alloc(&OBJC_CLASS___NSSQLFetchRequestContext);
    context = 0LL;
    fetchRequest = 0LL;
    sqlCore = 0LL;
  }

  return -[NSSQLFetchRequestContext initWithRequest:context:sqlCore:]( v5,  "initWithRequest:context:sqlCore:",  fetchRequest,  context,  sqlCore);
}

- (BOOL)isWritingRequest
{
  return 1;
}

- (void)executePrologue
{
  if (self)
  {
    objc_super v3 =  -[NSSQLGenerator initWithPersistentStore:]( objc_alloc(&OBJC_CLASS___NSSQLGenerator),  "initWithPersistentStore:",  self->super.super._sqlCore);
    v4 = -[NSSQLBatchUpdateRequestContext request](self, "request");
    if (v3) {
      v5 = -[NSSQLGenerator newSQLStatementForRequest:ignoreInheritance:countOnly:nestingLevel:nestIsWhereScoped:requestContext:]( (uint64_t)v3,  v4,  0LL,  0,  0LL,  0,  0LL);
    }
    else {
      v5 = 0LL;
    }
    self->_updateStatement = v5;
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