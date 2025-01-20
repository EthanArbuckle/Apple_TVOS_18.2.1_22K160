@interface PDApplePayCloudStoreRecordFetchOperation
- (PDApplePayCloudStoreRecordFetchOperation)init;
- (id)description;
- (id)identifier;
- (id)task;
- (void)addCompletion:(id)a3;
- (void)callCompletionsWithError:(id)a3 cloudStoreRecords:(id)a4;
- (void)updateTask:(id)a3;
@end

@implementation PDApplePayCloudStoreRecordFetchOperation

- (PDApplePayCloudStoreRecordFetchOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PDApplePayCloudStoreRecordFetchOperation;
  v2 = -[PDApplePayCloudStoreRecordFetchOperation init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    completions = v2->_completions;
    v2->_completions = v3;
  }

  return v2;
}

- (id)identifier
{
  return -[PKCloudStoreRecordFetchTask identifier](self->_task, "identifier");
}

- (void)updateTask:(id)a3
{
}

- (id)task
{
  return self->_task;
}

- (void)addCompletion:(id)a3
{
  completions = self->_completions;
  id v4 = objc_retainBlock(a3);
  -[NSMutableSet pk_safelyAddObject:](completions, "pk_safelyAddObject:", v4);
}

- (void)callCompletionsWithError:(id)a3 cloudStoreRecords:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[NSMutableSet copy](self->_completions, "copy");
  -[NSMutableSet removeAllObjects](self->_completions, "removeAllObjects");
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      v13 = 0LL;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8LL * (void)v13) + 16LL))(*(void *)(*((void *)&v14 + 1) + 8LL * (void)v13));
        v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v11);
  }
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p; ",
         objc_opt_class(self, a2),
         self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDApplePayCloudStoreRecordFetchOperation identifier](self, "identifier"));
  [v4 appendFormat:@"identifier: '%@'; ", v5];

  [v4 appendFormat:@"task: '%@'; ", self->_task];
  objc_msgSend(v4, "appendFormat:", @"completions: %ld; ", -[NSMutableSet count](self->_completions, "count"));
  [v4 appendFormat:@">"];
  return v4;
}

- (void).cxx_destruct
{
}

@end