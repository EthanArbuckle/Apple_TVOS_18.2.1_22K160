@interface BMAsyncBlockOperation
- (BMAsyncBlockOperation)initWithAsyncOperationBlock:(id)a3;
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (id)block;
- (void)start;
@end

@implementation BMAsyncBlockOperation

- (BMAsyncBlockOperation)initWithAsyncOperationBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___BMAsyncBlockOperation;
  v5 = -[BMAsyncBlockOperation init](&v9, "init");
  if (v5)
  {
    id v6 = [v4 copy];
    v7 = *(void **)&v5->super._private1;
    *(void *)&v5->super._private1 = v6;

    LOBYTE(v5->super._private) = 0;
    BYTE1(v5->super._private) = 0;
  }

  return v5;
}

- (void)start
{
  if ((-[BMAsyncBlockOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[BMAsyncBlockOperation willChangeValueForKey:](self, "willChangeValueForKey:", @"isExecuting");
    LOBYTE(self->super._private) = 1;
    -[BMAsyncBlockOperation didChangeValueForKey:](self, "didChangeValueForKey:", @"isExecuting");
    v3 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[BMAsyncBlockOperation block](self, "block"));
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_1000324C0;
    v4[3] = &unk_100068B70;
    v4[4] = self;
    ((void (**)(void, void *))v3)[2](v3, v4);
  }

- (BOOL)isFinished
{
  return BYTE1(self->super._private);
}

- (BOOL)isExecuting
{
  return (BOOL)self->super._private;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (id)block
{
  return *(id *)&self->super._private1;
}

- (void).cxx_destruct
{
}

@end