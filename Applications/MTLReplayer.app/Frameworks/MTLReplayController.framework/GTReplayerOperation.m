@interface GTReplayerOperation
- (GTReplayerOperation)initWithBatch:(id)a3 withBlock:(id)a4;
- (GTReplayerOperation)initWithRequestID:(unint64_t)a3 withBlock:(id)a4;
- (void)main;
@end

@implementation GTReplayerOperation

- (GTReplayerOperation)initWithRequestID:(unint64_t)a3 withBlock:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___GTReplayerOperation;
  v7 = -[GTReplayerOperation init](&v14, "init");
  if (v7)
  {
    id v8 = objc_retainBlock(v6);
    id v9 = v7->super._private;
    v7->super._private = v8;

    *(void *)&v7->super._private1 = a3;
    GTCoreOperationControl_addOperation(a3);
    objc_initWeak(&location, v7);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = __51__GTReplayerOperation_initWithRequestID_withBlock___block_invoke;
    v11[3] = &unk_58F298;
    objc_copyWeak(v12, &location);
    v12[1] = (id)a3;
    -[GTReplayerOperation setCompletionBlock:](v7, "setCompletionBlock:", v11);
    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (GTReplayerOperation)initWithBatch:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___GTReplayerOperation;
  id v8 = -[GTReplayerOperation init](&v12, "init");
  if (v8)
  {
    id v9 = objc_retainBlock(v7);
    id v10 = v8->super._private;
    v8->super._private = v9;

    *(void *)&v8->super._private1 = [v6 uuid];
  }

  return v8;
}

- (void)main
{
}

- (void).cxx_destruct
{
}

void __51__GTReplayerOperation_initWithRequestID_withBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  GTCoreOperationControl_removeOperation(*(void *)(a1 + 40));
}

@end