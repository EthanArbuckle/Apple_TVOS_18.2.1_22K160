@interface SHLTaskOutcome
- (NSArray)failedItemIdentifiers;
- (NSArray)tasksToRetry;
- (NSError)error;
- (SHLTaskOutcome)init;
- (SHLTaskOutcome)initWithError:(id)a3;
- (SHLTaskOutcome)initWithTasksToRetry:(id)a3 error:(id)a4;
- (id)_initWithTasksToRetry:(id)a3 error:(id)a4;
@end

@implementation SHLTaskOutcome

- (SHLTaskOutcome)init
{
  return (SHLTaskOutcome *)-[SHLTaskOutcome _initWithTasksToRetry:error:]( self,  "_initWithTasksToRetry:error:",  0LL,  0LL);
}

- (SHLTaskOutcome)initWithError:(id)a3
{
  return (SHLTaskOutcome *)-[SHLTaskOutcome _initWithTasksToRetry:error:](self, "_initWithTasksToRetry:error:", 0LL, a3);
}

- (SHLTaskOutcome)initWithTasksToRetry:(id)a3 error:(id)a4
{
  return (SHLTaskOutcome *)-[SHLTaskOutcome _initWithTasksToRetry:error:](self, "_initWithTasksToRetry:error:", a3, a4);
}

- (id)_initWithTasksToRetry:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SHLTaskOutcome;
  v8 = -[SHLTaskOutcome init](&v12, "init");
  p_isa = (id *)&v8->super.isa;
  if (v8)
  {
    if (v6) {
      v10 = v6;
    }
    else {
      v10 = &__NSArray0__struct;
    }
    objc_storeStrong((id *)&v8->_tasksToRetry, v10);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (NSArray)failedItemIdentifiers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHLTaskOutcome tasksToRetry](self, "tasksToRetry", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if (![v9 type])
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allItemIdentifiers]);
          [v3 addObjectsFromArray:v10];
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)tasksToRetry
{
  return self->_tasksToRetry;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
}

@end