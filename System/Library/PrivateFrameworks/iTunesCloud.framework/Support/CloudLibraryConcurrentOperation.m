@interface CloudLibraryConcurrentOperation
- (BOOL)isAsynchronous;
- (BOOL)isConcurrent;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (void)finish;
- (void)start;
@end

@implementation CloudLibraryConcurrentOperation

- (void)start
{
  unsigned int v3 = -[CloudLibraryConcurrentOperation isCancelled](self, "isCancelled");
  if (v3) {
    v4 = &OBJC_IVAR___CloudLibraryConcurrentOperation__finished;
  }
  else {
    v4 = &OBJC_IVAR___CloudLibraryConcurrentOperation__executing;
  }
  v5 = &selRef_isFinished;
  if (!v3) {
    v5 = &selRef_isExecuting;
  }
  v6 = *v5;
  v7 = NSStringFromSelector(*v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[CloudLibraryConcurrentOperation willChangeValueForKey:](self, "willChangeValueForKey:", v8);

  *((_BYTE *)&self->super.super.super.isa + *v4) = 1;
  v9 = NSStringFromSelector(v6);
  id v10 = (id)objc_claimAutoreleasedReturnValue(v9);
  -[CloudLibraryConcurrentOperation didChangeValueForKey:](self, "didChangeValueForKey:", v10);
}

- (void)finish
{
  unsigned int v3 = NSStringFromSelector("isExecuting");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[CloudLibraryConcurrentOperation willChangeValueForKey:](self, "willChangeValueForKey:", v4);

  LOBYTE(self->super._status) = 0;
  v5 = NSStringFromSelector("isExecuting");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[CloudLibraryConcurrentOperation didChangeValueForKey:](self, "didChangeValueForKey:", v6);

  v7 = NSStringFromSelector("isFinished");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[CloudLibraryConcurrentOperation willChangeValueForKey:](self, "willChangeValueForKey:", v8);

  BYTE1(self->super._status) = 1;
  v9 = NSStringFromSelector("isFinished");
  id v10 = (id)objc_claimAutoreleasedReturnValue(v9);
  -[CloudLibraryConcurrentOperation didChangeValueForKey:](self, "didChangeValueForKey:", v10);
}

- (BOOL)isConcurrent
{
  return 1;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  return self->super._status;
}

- (BOOL)isFinished
{
  return BYTE1(self->super._status);
}

@end