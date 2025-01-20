@interface NSSQLStoreRequestContext
- (BOOL)executeRequestCore:(id *)a3;
- (BOOL)executeRequestUsingConnection:(id)a3;
- (BOOL)isWritingRequest;
- (NSPersistentStoreRequest)persistentStoreRequest;
- (NSSQLObjectFaultRequestContext)createNestedObjectFaultContextForObjectWithID:(NSSQLObjectFaultRequestContext *)result;
- (NSSQLRowCache)rowCache;
- (NSSQLStoreRequestContext)initWithRequest:(id)a3 context:(id)a4 sqlCore:(id)a5;
- (id)result;
- (uint64_t)debugLogLevel;
- (void)dealloc;
- (void)setConnection:(uint64_t)a1;
- (void)setQueryGenerationToken:(id *)a1;
- (void)setResult:(id)a3;
@end

@implementation NSSQLStoreRequestContext

- (NSSQLStoreRequestContext)initWithRequest:(id)a3 context:(id)a4 sqlCore:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NSSQLStoreRequestContext;
  v8 = -[NSSQLStoreRequestContext init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_sqlCore = (NSSQLCore *)a5;
    v8->_persistentStoreRequest = (NSPersistentStoreRequest *)a3;
    v9->_context = (NSManagedObjectContext *)a4;
    v9->_useColoredLogging = +[NSSQLCore coloredLoggingDefault](&OBJC_CLASS___NSSQLCore, "coloredLoggingDefault");
    v9->_useConcurrentFetching = +[NSSQLCore useConcurrentFetching](&OBJC_CLASS___NSSQLCore, "useConcurrentFetching");
    if (a5)
    {
      v9->_hasHistoryTracking = (*((_DWORD *)a5 + 50) & 0x400) != 0;
      int v10 = (*((unsigned __int8 *)a5 + 201) >> 6) & 1;
    }

    else
    {
      LOBYTE(v10) = 0;
      v9->_hasHistoryTracking = 0;
    }

    v9->_storeIsInMemory = v10;
    -[NSSQLStoreRequestContext setQueryGenerationToken:]( (id *)&v9->super.isa,  (void *)-[NSManagedObjectContext _queryGenerationToken](v9->_context, "_queryGenerationToken"));
  }

  return v9;
}

- (void)setQueryGenerationToken:(id *)a1
{
  if (a1
    && ([a1 isWritingRequest] & 1) == 0
    && [a1[1] supportsGenerationalQuerying])
  {
    if ([a2 _isEnabled])
    {
      a1[8] = -[_NSQueryGenerationToken _generationalComponentForStore:]((uint64_t)a2, a1[1]);
    }

    else
    {

      a1[8] = 0LL;
    }
  }

- (BOOL)isWritingRequest
{
  return 0;
}

- (NSPersistentStoreRequest)persistentStoreRequest
{
  return self->_persistentStoreRequest;
}

- (void)setConnection:(uint64_t)a1
{
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    if (v4 != a2)
    {
      if (a2 && v4)
      {
        objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"*RequestContext connection may not be reset" userInfo:0]);
        -[NSSQLiteConnection performAndWait:]();
      }

      else
      {
        id v5 = a2;

        *(void *)(a1 + 24) = a2;
      }
    }
  }

- (BOOL)executeRequestUsingConnection:(id)a3
{
  v29[1] = *MEMORY[0x1895F89C0];
  id newValue = 0LL;
  BOOL v5 = -[NSSQLStoreRequestContext isWritingRequest](self, "isWritingRequest");
  if (self) {
    queryGeneration = self->_queryGeneration;
  }
  else {
    queryGeneration = 0LL;
  }
  -[NSSQLStoreRequestContext setConnection:]((uint64_t)self, a3);
  -[NSSQLiteConnection connect]((uint64_t)a3);
  int64x2_t v19 = 0u;
  if (self && (context = self->_context) != 0LL && (*((_BYTE *)&context->_flags + 3) & 0x40) != 0)
  {
    -[NSSQLiteConnection currentStats]((uint64_t)a3, (uint64_t)&v24);
    int64x2_t v19 = v24;
    uint64_t v8 = v25;
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  if (queryGeneration) {
    char v9 = v5;
  }
  else {
    char v9 = 1;
  }
  if ((v9 & 1) != 0)
  {
    int v10 = 0;
  }

  else
  {
    -[NSSQLiteConnection beginReadTransaction]((uint64_t)a3);
    uint64_t v11 = -[NSSQLiteConnection adoptQueryGenerationWithIdentifier:]((uint64_t)a3, (uint64_t)queryGeneration[3].super.isa);
    if ((_DWORD)v11)
    {
      v28 = @"NSSQLiteErrorDomain";
      v29[0] = [MEMORY[0x189607968] numberWithInt:v11];
      v17 = (void *)[MEMORY[0x189603F68] dictionaryWithObjects:v29 forKeys:&v28 count:1];
      id v18 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A48],  (int)v11,  (uint64_t)@"Database connection failed to adopt query generation",  v17);
      -[_NSCoreDataException _setDomain:]((uint64_t)v18, @"NSSQLiteErrorDomain");
      objc_exception_throw(v18);
      __break(1u);
      return result;
    }

    int v10 = 1;
  }

  BOOL v13 = -[NSSQLStoreRequestContext executeRequestCore:](self, "executeRequestCore:", &newValue, *(_OWORD *)&v19);
  if ((v9 & 1) == 0)
  {
    -[NSSQLiteConnection commitTransaction]((uint64_t)a3);
    int v10 = 0;
  }

  if (self)
  {
    v14 = self->_context;
    if (v14)
    {
      if ((*((_BYTE *)&v14->_flags + 3) & 0x40) != 0)
      {
        -[NSSQLiteConnection currentStats]((uint64_t)a3, (uint64_t)&v24);
        v15 = self->_context;
        int64x2_t v21 = vsubq_s64(v24, v20);
        uint64_t v22 = v25 - v8;
        uint64_t v23 = v26;
        -[NSManagedObjectContext _updateDatabaseStaticsWithCacheStats:]((uint64_t)v15, (int8x16_t *)&v21);
      }
    }
  }

  if (v10)
  {
    -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)a3, 0);
    -[NSSQLiteConnection rollbackTransaction]((uint64_t)a3);
  }

  if (self)
  {
    if (newValue) {
      objc_setProperty_nonatomic(self, v12, newValue, 40LL);
    }
  }

  -[NSSQLStoreRequestContext setConnection:]((uint64_t)self, 0LL);
  return v13;
}

- (uint64_t)debugLogLevel
{
  if (result) {
    return +[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault");
  }
  return result;
}

- (void)setResult:(id)a3
{
}

- (id)result
{
  return self->_result;
}

- (void)dealloc
{
  if (self->_connection)
  {
    NSLog((NSString *)@"API misuse: there shouldn't be a connection here", a2);
    __break(1u);
  }

  else
  {
    self->_sqlCore = 0LL;

    self->_queryGeneration = 0LL;
    self->_persistentStoreRequest = 0LL;

    self->_context = 0LL;
    self->_error = 0LL;

    self->_exception = 0LL;
    self->_BOOL result = 0LL;

    self->_connection = 0LL;
    v3.receiver = self;
    v3.super_class = (Class)&OBJC_CLASS___NSSQLStoreRequestContext;
    -[NSSQLStoreRequestContext dealloc](&v3, sel_dealloc);
  }

- (NSSQLRowCache)rowCache
{
  return (NSSQLRowCache *)-[NSSQLCore rowCacheForGeneration:](&self->_sqlCore->super.super.isa, self->_queryGeneration);
}

- (NSSQLObjectFaultRequestContext)createNestedObjectFaultContextForObjectWithID:(NSSQLObjectFaultRequestContext *)result
{
  if (result) {
    return -[NSSQLObjectFaultRequestContext initWithObjectID:context:sqlCore:]( objc_alloc(&OBJC_CLASS___NSSQLObjectFaultRequestContext),  "initWithObjectID:context:sqlCore:",  a2,  result->super._context,  result->super._sqlCore);
  }
  return result;
}

- (BOOL)executeRequestCore:(id *)a3
{
  return 0;
}

@end