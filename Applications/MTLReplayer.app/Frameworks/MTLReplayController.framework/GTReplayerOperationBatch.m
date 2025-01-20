@interface GTReplayerOperationBatch
- (GTReplayerOperationBatch)initWithRequestID:(unint64_t)a3;
- (unint64_t)uuid;
- (void)addOperation:(id)a3;
- (void)finish:(id)a3;
- (void)flush:(id)a3;
@end

@implementation GTReplayerOperationBatch

- (GTReplayerOperationBatch)initWithRequestID:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___GTReplayerOperationBatch;
  v4 = -[GTReplayerOperationBatch init](&v9, "init");
  v5 = v4;
  if (v4)
  {
    v4->_uuid = a3;
    v6 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 16LL);
    operations = v5->_operations;
    v5->_operations = v6;

    GTCoreOperationControl_addOperation(a3);
  }

  return v5;
}

- (void)addOperation:(id)a3
{
}

- (void)flush:(id)a3
{
  id v4 = a3;
  if (-[NSMutableArray count](self->_operations, "count"))
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    v5 = self->_operations;
    id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        objc_super v9 = 0LL;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(v4, "addOperation:", *(void *)(*((void *)&v10 + 1) + 8 * (void)v9), (void)v10);
          objc_super v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
      }

      while (v7);
    }

    -[NSMutableArray removeAllObjects](self->_operations, "removeAllObjects");
  }
}

- (void)finish:(id)a3
{
  id v4 = a3;
  if (-[NSMutableArray count](self->_operations, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_operations, "lastObject"));
    unint64_t uuid = self->_uuid;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = __35__GTReplayerOperationBatch_finish___block_invoke;
    v16[3] = &__block_descriptor_40_e5_v8__0l;
    v16[4] = uuid;
    [v5 setCompletionBlock:v16];
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v7 = self->_operations;
    id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v17,  16LL);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        __int128 v11 = 0LL;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(v4, "addOperation:", *(void *)(*((void *)&v12 + 1) + 8 * (void)v11), (void)v12);
          __int128 v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v17,  16LL);
      }

      while (v9);
    }

    -[NSMutableArray removeAllObjects](self->_operations, "removeAllObjects");
  }

  else
  {
    GTCoreOperationControl_removeOperation(self->_uuid);
  }
}

- (unint64_t)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
}

uint64_t __35__GTReplayerOperationBatch_finish___block_invoke(uint64_t a1)
{
  return GTCoreOperationControl_removeOperation(*(void *)(a1 + 32));
}

@end