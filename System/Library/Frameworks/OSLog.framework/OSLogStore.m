@interface OSLogStore
+ (OSLogStore)storeWithScope:(OSLogStoreScope)scope error:(NSError *)error;
+ (OSLogStore)storeWithURL:(NSURL *)url error:(NSError *)error;
- (OSLogEnumerator)entriesEnumeratorAndReturnError:(NSError *)error;
- (OSLogEnumerator)entriesEnumeratorWithOptions:(OSLogEnumeratorOptions)options position:(OSLogPosition *)position predicate:(NSPredicate *)predicate error:(NSError *)error;
- (OSLogPosition)positionWithDate:(NSDate *)date;
- (OSLogPosition)positionWithTimeIntervalSinceEnd:(NSTimeInterval)seconds;
- (OSLogPosition)positionWithTimeIntervalSinceLatestBoot:(NSTimeInterval)seconds;
- (OSLogStore)init;
- (id)_constrainedEntriesEnumeratorWithOptions:(unint64_t)a3 position:(id)a4 predicate:(id)a5 error:(id *)a6;
- (id)initForFactory;
@end

@implementation OSLogStore

- (OSLogStore)init
{
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl( &dword_1869F5000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "Invalid direct use of -[OSLogStore init] (use factory instead)",  buf,  2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___OSLogStore;
  return -[OSLogStore init](&v4, sel_init);
}

- (id)initForFactory
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OSLogStore;
  return -[OSLogStore init](&v3, sel_init);
}

- (id)_constrainedEntriesEnumeratorWithOptions:(unint64_t)a3 position:(id)a4 predicate:(id)a5 error:(id *)a6
{
  id v8 = a5;
  id v9 = a4;
  v10 = -[OSLogCurrentProcessEnumerator initWithOptions:predicate:position:]( objc_alloc(&OBJC_CLASS___OSLogCurrentProcessEnumerator),  "initWithOptions:predicate:position:",  a3,  v8,  v9);

  return v10;
}

- (OSLogEnumerator)entriesEnumeratorWithOptions:(OSLogEnumeratorOptions)options position:(OSLogPosition *)position predicate:(NSPredicate *)predicate error:(NSError *)error
{
  v10 = position;
  v11 = predicate;
  if (self->_constraint)
  {
    -[OSLogStore _constrainedEntriesEnumeratorWithOptions:position:predicate:error:]( self,  "_constrainedEntriesEnumeratorWithOptions:position:predicate:error:",  options,  v10,  v11,  error);
    v12 = (OSLogSystemEnumerator *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v13 = (void *)[objc_alloc(MEMORY[0x189610830]) initWithSource:self->_source];
    v14 = v13;
    if (v11) {
      [v13 setFilterPredicate:v11];
    }
    v12 = -[OSLogSystemEnumerator initWithEventStream:options:position:]( objc_alloc(&OBJC_CLASS___OSLogSystemEnumerator),  "initWithEventStream:options:position:",  v14,  options,  v10);
  }

  return (OSLogEnumerator *)v12;
}

- (OSLogEnumerator)entriesEnumeratorAndReturnError:(NSError *)error
{
  return -[OSLogStore entriesEnumeratorWithOptions:position:predicate:error:]( self,  "entriesEnumeratorWithOptions:position:predicate:error:",  0LL,  0LL,  0LL,  error);
}

- (OSLogPosition)positionWithDate:(NSDate *)date
{
  objc_super v3 = date;
  objc_super v4 = -[OSLogPosition initWithDate:](objc_alloc(&OBJC_CLASS___OSLogPosition), "initWithDate:", v3);

  return v4;
}

- (OSLogPosition)positionWithTimeIntervalSinceEnd:(NSTimeInterval)seconds
{
  return  -[OSLogPosition initWithEventSource:timeIntervalSinceEnd:]( objc_alloc(&OBJC_CLASS___OSLogPosition),  "initWithEventSource:timeIntervalSinceEnd:",  self->_source,  seconds);
}

- (OSLogPosition)positionWithTimeIntervalSinceLatestBoot:(NSTimeInterval)seconds
{
  return  -[OSLogPosition initWithTimeIntervalSinceLatestBoot:]( objc_alloc(&OBJC_CLASS___OSLogPosition),  "initWithTimeIntervalSinceLatestBoot:",  seconds);
}

- (void).cxx_destruct
{
}

+ (OSLogStore)storeWithScope:(OSLogStoreScope)scope error:(NSError *)error
{
  if (scope != OSLogStoreCurrentProcessIdentifier) {
    return (OSLogStore *)0LL;
  }
  v6 = -[OSLogStore initForFactory](objc_alloc(&OBJC_CLASS___OSLogStore), "initForFactory", v4, v5);
  if (v6) {
    v6[4] = 1;
  }
  return (OSLogStore *)v6;
}

+ (OSLogStore)storeWithURL:(NSURL *)url error:(NSError *)error
{
  v18[1] = *MEMORY[0x1895F89C0];
  uint64_t v5 = url;
  id v6 = -[OSLogStore initForFactory](objc_alloc(&OBJC_CLASS___OSLogStore), "initForFactory");
  if (v6)
  {
    [MEMORY[0x189610828] storeWithArchiveURL:v5];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v12[0] = MEMORY[0x1895F87A8];
      v12[1] = 3221225472LL;
      v12[2] = __33__OSLogStore_storeWithURL_error___block_invoke;
      v12[3] = &unk_189F1DFE0;
      v14 = error;
      id v8 = v6;
      v13 = v8;
      [v7 prepareWithCompletionHandler:v12];
      if (v8[1]) {
        id v9 = v8;
      }
      else {
        id v9 = 0LL;
      }
      v10 = v13;
    }

    else
    {
      if (!error)
      {
        v7 = 0LL;
        id v9 = 0LL;
        goto LABEL_12;
      }

      uint64_t v15 = *MEMORY[0x1896075E0];
      v16 = @"Cannot open logarchive";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189610840] code:-1 userInfo:v10];
      id v9 = 0LL;
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    if (!error)
    {
      id v9 = 0LL;
      goto LABEL_13;
    }

    uint64_t v17 = *MEMORY[0x1896075E0];
    v18[0] = @"Unable to alloc/init";
    [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189610840] code:-1 userInfo:v7];
    id v9 = 0LL;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }

void __33__OSLogStore_storeWithURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (*(void *)(a1 + 40)) {
      **(void **)(a1 + 40) = v6;
    }
  }

  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 8LL), a2);
  }
}

@end