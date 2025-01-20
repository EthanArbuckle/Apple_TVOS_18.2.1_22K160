@interface MTPromiseCompletionBlocks
- (MTPromiseCompletionBlocks)init;
- (void)addCompletionBlock:(id)a3;
- (void)addErrorBlock:(id)a3;
- (void)addSuccessBlock:(id)a3;
- (void)callCompletionBlock:(id)a3 withPromiseResult:(id)a4;
- (void)callErrorBlock:(id)a3 withPromiseResult:(id)a4;
- (void)callSuccessBlock:(id)a3 withPromiseResult:(id)a4;
- (void)flushCompletionBlocksWithPromiseResult:(id)a3;
@end

@implementation MTPromiseCompletionBlocks

- (MTPromiseCompletionBlocks)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTPromiseCompletionBlocks;
  v2 = -[MTPromiseCompletionBlocks init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    completionBlocks = v2->_completionBlocks;
    v2->_completionBlocks = v3;
  }

  return v2;
}

- (void)addCompletionBlock:(id)a3
{
  id v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  completionBlocks = v4->_completionBlocks;
  id v6 = [v7 copy];
  -[NSMutableArray addObject:](completionBlocks, "addObject:", v6);

  objc_sync_exit(v4);
}

- (void)addErrorBlock:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000C8E4;
  v5[3] = &unk_100020530;
  id v6 = a3;
  id v4 = v6;
  -[MTPromiseCompletionBlocks addCompletionBlock:](self, "addCompletionBlock:", v5);
}

- (void)addSuccessBlock:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000C974;
  v5[3] = &unk_100020530;
  id v6 = a3;
  id v4 = v6;
  -[MTPromiseCompletionBlocks addCompletionBlock:](self, "addCompletionBlock:", v5);
}

- (void)callCompletionBlock:(id)a3 withPromiseResult:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue([v5 result]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);

  (*((void (**)(id, id, void *))a3 + 2))(v6, v8, v7);
}

- (void)callErrorBlock:(id)a3 withPromiseResult:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000CA90;
  v7[3] = &unk_100020530;
  id v8 = a3;
  id v6 = v8;
  -[MTPromiseCompletionBlocks callCompletionBlock:withPromiseResult:]( self,  "callCompletionBlock:withPromiseResult:",  v7,  a4);
}

- (void)callSuccessBlock:(id)a3 withPromiseResult:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000CB30;
  v7[3] = &unk_100020530;
  id v8 = a3;
  id v6 = v8;
  -[MTPromiseCompletionBlocks callCompletionBlock:withPromiseResult:]( self,  "callCompletionBlock:withPromiseResult:",  v7,  a4);
}

- (void)flushCompletionBlocksWithPromiseResult:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = -[NSMutableArray copy](v5->_completionBlocks, "copy");
  -[NSMutableArray removeAllObjects](v5->_completionBlocks, "removeAllObjects");
  objc_sync_exit(v5);

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "result", (void)v14));
        v13 = (void *)objc_claimAutoreleasedReturnValue([v4 error]);
        (*(void (**)(uint64_t, void *, void *))(v11 + 16))(v11, v12, v13);

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }
}

- (void).cxx_destruct
{
}

@end