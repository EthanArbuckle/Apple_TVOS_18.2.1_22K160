@interface MSDOperationQueue
- (MSDOperationBarrier)checkpointBarrier;
- (MSDOperationQueue)init;
- (void)addOperation:(id)a3;
- (void)setCheckpointBarrier:(id)a3;
- (void)setSuspended:(BOOL)a3;
@end

@implementation MSDOperationQueue

- (MSDOperationQueue)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MSDOperationQueue;
  v2 = -[MSDOperationQueue init](&v5, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___MSDOperationBarrier);
    -[MSDOperationQueue setCheckpointBarrier:](v2, "setCheckpointBarrier:", v3);
  }

  return v2;
}

- (void)addOperation:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationQueue checkpointBarrier](self, "checkpointBarrier"));
  [v4 addCheckpointBarrier:v5];

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSDOperationQueue;
  -[MSDOperationQueue addOperation:](&v6, "addOperation:", v4);
}

- (void)setSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MSDOperationQueue;
  -[MSDOperationQueue setSuspended:](&v7, "setSuspended:");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationQueue checkpointBarrier](self, "checkpointBarrier"));
  objc_super v6 = v5;
  if (v3) {
    [v5 activate];
  }
  else {
    [v5 deactivate];
  }
}

- (MSDOperationBarrier)checkpointBarrier
{
  return (MSDOperationBarrier *)self->super._private;
}

- (void)setCheckpointBarrier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end