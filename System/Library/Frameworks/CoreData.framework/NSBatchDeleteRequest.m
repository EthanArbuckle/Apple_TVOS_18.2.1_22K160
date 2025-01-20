@interface NSBatchDeleteRequest
+ (id)decodeFromXPCArchive:(id)a3 withContext:(id)a4 withPolicy:(id)a5;
- (BOOL)_secureOperation;
- (NSBatchDeleteRequest)initWithFetchRequest:(NSFetchRequest *)fetch;
- (NSBatchDeleteRequest)initWithObjectIDs:(NSArray *)objects;
- (NSBatchDeleteRequestResultType)resultType;
- (NSFetchRequest)fetchRequest;
- (id)description;
- (id)encodeForXPC;
- (unint64_t)requestType;
- (void)_resolveEntityWithContext:(id)a3;
- (void)_setSecureOperation:(BOOL)a3;
- (void)dealloc;
- (void)setResultType:(NSBatchDeleteRequestResultType)resultType;
@end

@implementation NSBatchDeleteRequest

- (id)encodeForXPC
{
  id v2 = -[NSBatchDeleteRequestEncodingToken initForRequest:]( objc_alloc(&OBJC_CLASS___NSBatchDeleteRequestEncodingToken),  "initForRequest:",  self);
  v3 = (void *)[objc_alloc(MEMORY[0x1896078F8]) initRequiringSecureCoding:1];
  [v3 setDelegate:objc_opt_class()];
  [v3 encodeObject:v2 forKey:@"root"];
  [v3 finishEncoding];
  id v4 = (id)[v3 encodedData];

  return v4;
}

+ (id)decodeFromXPCArchive:(id)a3 withContext:(id)a4 withPolicy:(id)a5
{
  v7 = (void *)[objc_alloc(MEMORY[0x189607908]) initForReadingFromData:a3 error:0];
  [v7 setDelegate:a4];
  v8 = (void *)[v7 decodeObjectOfClass:objc_opt_class() forKey:@"root"];

  v9 = -[NSBatchDeleteRequest initWithFetchRequest:]( [NSBatchDeleteRequest alloc],  "initWithFetchRequest:",  +[NSFetchRequest decodeFromXPCArchive:withContext:andPolicy:]( NSFetchRequest,  "decodeFromXPCArchive:withContext:andPolicy:",  [v8 fetchData],  a4,  a5));
  -[NSBatchDeleteRequest setResultType:](v9, "setResultType:", [v8 resultType]);
  -[NSBatchDeleteRequest _setSecureOperation:](v9, "_setSecureOperation:", [v8 secure]);
  return v9;
}

- (NSBatchDeleteRequest)initWithObjectIDs:(NSArray *)objects
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (!-[NSArray count](objects, "count")) {
    goto LABEL_18;
  }
  uint64_t v5 = objc_msgSend(-[NSArray lastObject](objects, "lastObject"), "entity");
  if (v5)
  {
    if ((*(_BYTE *)(v5 + 120) & 4) != 0)
    {
      uint64_t v6 = *(void *)(v5 + 72);
    }

    else
    {
      do
      {
        uint64_t v6 = v5;
        uint64_t v5 = [(id)v5 superentity];
      }

      while (v5);
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v7 = -[NSArray countByEnumeratingWithState:objects:count:]( objects,  "countByEnumeratingWithState:objects:count:",  &v18,  v24,  16LL);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(objects);
        }
        if ((objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v10), "entity"), "isKindOfEntity:", v6) & 1) == 0)
        {

          self = (NSBatchDeleteRequest *)MEMORY[0x189603F70];
          uint64_t v13 = *MEMORY[0x189603A60];
          v22 = @"objectIDs";
          v23 = objects;
          uint64_t v14 = [MEMORY[0x189603F68] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
          v15 = @"mismatched objectIDs in batch delete initializer";
          v16 = self;
          uint64_t v17 = v13;
          while (1)
          {
            objc_exception_throw((id)-[NSBatchDeleteRequest exceptionWithName:reason:userInfo:]( v16,  "exceptionWithName:reason:userInfo:",  v17,  v15,  v14));
LABEL_18:

            v16 = (NSBatchDeleteRequest *)MEMORY[0x189603F70];
            uint64_t v17 = *MEMORY[0x189603A60];
            v15 = @"Must supply a non-zero number of objectIDs to request during initialization";
            uint64_t v14 = 0LL;
          }
        }

        ++v10;
      }

      while (v8 != v10);
      uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( objects,  "countByEnumeratingWithState:objects:count:",  &v18,  v24,  16LL);
    }

    while (v8);
  }

  v11 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
  -[NSFetchRequest setEntity:](v11, "setEntity:", v6);
  -[NSFetchRequest setPredicate:]( v11,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"SELF IN %@", objects]);
  -[NSFetchRequest setIncludesPendingChanges:](v11, "setIncludesPendingChanges:", 0LL);
  -[NSFetchRequest setResultType:](v11, "setResultType:", 1LL);
  -[NSFetchRequest _incrementInUseCounter](v11, "_incrementInUseCounter");
  return -[NSBatchDeleteRequest initWithFetchRequest:](self, "initWithFetchRequest:", v11);
}

- (NSBatchDeleteRequest)initWithFetchRequest:(NSFetchRequest *)fetch
{
  if (!fetch || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    uint64_t v8 = (void *)MEMORY[0x189603F70];
    uint64_t v9 = *MEMORY[0x189603A60];
    uint64_t v10 = @"Must supply a fetch request during initialization";
LABEL_9:
    objc_exception_throw((id)[v8 exceptionWithName:v9 reason:v10 userInfo:0]);
    -[NSBatchDeleteRequest dealloc](v11, v12);
    return result;
  }

  if (!-[NSFetchRequest entityName](fetch, "entityName"))
  {

    uint64_t v8 = (void *)MEMORY[0x189603F70];
    uint64_t v9 = *MEMORY[0x189603A60];
    uint64_t v10 = @"Fetch must have an entity";
    goto LABEL_9;
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NSBatchDeleteRequest;
  uint64_t v5 = -[NSBatchDeleteRequest init](&v13, sel_init);
  if (v5)
  {
    uint64_t v6 = (NSFetchRequest *)-[NSFetchRequest copy](fetch, "copy");
    v5->_deleteTarget = v6;
    -[NSFetchRequest setIncludesPropertyValues:](v6, "setIncludesPropertyValues:", 0LL);
    -[NSFetchRequest setResultType:](v5->_deleteTarget, "setResultType:", 1LL);
    -[NSFetchRequest setPropertiesToFetch:](v5->_deleteTarget, "setPropertiesToFetch:", 0LL);
    -[NSFetchRequest setRelationshipKeyPathsForPrefetching:]( v5->_deleteTarget,  "setRelationshipKeyPathsForPrefetching:",  0LL);
    -[NSFetchRequest setShouldRefreshRefetchedObjects:](v5->_deleteTarget, "setShouldRefreshRefetchedObjects:", 0LL);
    -[NSFetchRequest setFetchBatchSize:](v5->_deleteTarget, "setFetchBatchSize:", 0LL);
    -[NSFetchRequest setIncludesPendingChanges:](v5->_deleteTarget, "setIncludesPendingChanges:", 0LL);
    -[NSFetchRequest _incrementInUseCounter](v5->_deleteTarget, "_incrementInUseCounter");
  }

  return v5;
}

- (void)dealloc
{
  self->_deleteTarget = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSBatchDeleteRequest;
  -[NSPersistentStoreRequest dealloc](&v3, sel_dealloc);
}

- (unint64_t)requestType
{
  return 7LL;
}

- (NSFetchRequest)fetchRequest
{
  return self->_deleteTarget;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<NSBatchDeleteRequest : resultType : %ld, fetch :%@ >", self->_resultType, self->_deleteTarget];
}

- (void)_setSecureOperation:(BOOL)a3
{
  self->_flags = a3;
}

- (BOOL)_secureOperation
{
  return self->_flags != 0;
}

- (void)_resolveEntityWithContext:(id)a3
{
}

- (NSBatchDeleteRequestResultType)resultType
{
  return self->_resultType;
}

- (void)setResultType:(NSBatchDeleteRequestResultType)resultType
{
  self->_resultType = resultType;
}

@end