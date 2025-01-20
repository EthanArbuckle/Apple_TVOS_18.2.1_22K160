@interface MSDOperationBarrier
- (BOOL)activated;
- (MSDOperationBarrier)init;
- (NSCondition)condition;
- (void)activate;
- (void)deactivate;
- (void)setActivated:(BOOL)a3;
- (void)setCondition:(id)a3;
- (void)waitUntilClear;
@end

@implementation MSDOperationBarrier

- (MSDOperationBarrier)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSDOperationBarrier;
  v2 = -[MSDOperationBarrier init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSCondition);
    -[MSDOperationBarrier setCondition:](v2, "setCondition:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBarrier condition](v2, "condition"));
    [v4 setName:@"com.apple.msd.operation_barrier"];
  }

  return v2;
}

- (void)waitUntilClear
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBarrier condition](self, "condition"));
  [v3 lock];

  if (-[MSDOperationBarrier activated](self, "activated"))
  {
    do
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBarrier condition](self, "condition"));
      [v4 wait];
    }

    while (-[MSDOperationBarrier activated](self, "activated"));
  }

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDOperationBarrier condition](self, "condition"));
  [v5 unlock];
}

- (void)activate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBarrier condition](self, "condition"));
  [v3 lock];

  -[MSDOperationBarrier setActivated:](self, "setActivated:", 1LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBarrier condition](self, "condition"));
  [v4 broadcast];

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDOperationBarrier condition](self, "condition"));
  [v5 unlock];
}

- (void)deactivate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBarrier condition](self, "condition"));
  [v3 lock];

  -[MSDOperationBarrier setActivated:](self, "setActivated:", 0LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBarrier condition](self, "condition"));
  [v4 broadcast];

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDOperationBarrier condition](self, "condition"));
  [v5 unlock];
}

- (BOOL)activated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (NSCondition)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
}

- (void).cxx_destruct
{
}

@end