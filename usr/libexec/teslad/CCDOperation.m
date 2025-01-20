@interface CCDOperation
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)isReady;
- (BOOL)operationExecuting;
- (BOOL)operationFinished;
- (BOOL)operationReady;
- (CCDOperation)init;
- (void)endOperation;
- (void)setOperationExecuting:(BOOL)a3;
- (void)setOperationFinished:(BOOL)a3;
- (void)setOperationReady:(BOOL)a3;
@end

@implementation CCDOperation

- (CCDOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CCDOperation;
  result = -[CCDOperation init](&v3, "init");
  if (result) {
    BYTE2(result->super._private) = 1;
  }
  return result;
}

- (void)setOperationReady:(BOOL)a3
{
  if (BYTE2(self->super._private) != a3)
  {
    -[CCDOperation willChangeValueForKey:](self, "willChangeValueForKey:", @"ready");
    BYTE2(self->super._private) = a3;
    -[CCDOperation didChangeValueForKey:](self, "didChangeValueForKey:", @"ready");
  }

- (void)setOperationExecuting:(BOOL)a3
{
  if (LOBYTE(self->super._private) != a3)
  {
    -[CCDOperation willChangeValueForKey:](self, "willChangeValueForKey:", @"executing");
    LOBYTE(self->super._private) = a3;
    -[CCDOperation didChangeValueForKey:](self, "didChangeValueForKey:", @"executing");
  }

- (void)setOperationFinished:(BOOL)a3
{
  if (BYTE1(self->super._private) != a3)
  {
    -[CCDOperation willChangeValueForKey:](self, "willChangeValueForKey:", @"finished");
    BYTE1(self->super._private) = a3;
    -[CCDOperation didChangeValueForKey:](self, "didChangeValueForKey:", @"finished");
  }

- (void)endOperation
{
}

- (BOOL)isFinished
{
  return BYTE1(self->super._private);
}

- (BOOL)isExecuting
{
  return (BOOL)self->super._private;
}

- (BOOL)isReady
{
  return BYTE2(self->super._private);
}

- (BOOL)operationExecuting
{
  return (BOOL)self->super._private;
}

- (BOOL)operationFinished
{
  return BYTE1(self->super._private);
}

- (BOOL)operationReady
{
  return BYTE2(self->super._private);
}

@end