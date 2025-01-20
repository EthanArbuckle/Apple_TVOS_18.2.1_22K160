@interface MSUCheckpointAsyncContext
- (BOOL)wait;
- (BOOL)waitUntilDate:(id)a3;
- (MSUCheckpointAsyncContext)init;
- (NSError)error;
- (NSString)contextUUID;
- (int)result;
- (void)checkpoint_closure_context;
- (void)dealloc;
- (void)runForCheckpoint:(void *)a3;
- (void)runSynchronousForCheckpoint:(void *)a3;
- (void)setCheckpoint_closure_context:(void *)a3;
- (void)setContextUUID:(id)a3;
- (void)setError:(id)a3;
- (void)setResult:(int)a3;
@end

@implementation MSUCheckpointAsyncContext

- (MSUCheckpointAsyncContext)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MSUCheckpointAsyncContext;
  v2 = -[MSUCheckpointAsyncContext init](&v4, "init");
  if (v2) {
    -[MSUCheckpointAsyncContext setContextUUID:]( v2,  "setContextUUID:",  -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString"));
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSUCheckpointAsyncContext;
  -[MSUCheckpointAsyncContext dealloc](&v3, "dealloc");
}

- (void)runForCheckpoint:(void *)a3
{
}

- (void)runSynchronousForCheckpoint:(void *)a3
{
}

- (BOOL)wait
{
  return 0;
}

- (BOOL)waitUntilDate:(id)a3
{
  return 0;
}

- (NSString)contextUUID
{
  return self->_contextUUID;
}

- (void)setContextUUID:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (int)result
{
  return self->_result;
}

- (void)setResult:(int)a3
{
  self->_result = a3;
}

- (void)checkpoint_closure_context
{
  return self->_checkpoint_closure_context;
}

- (void)setCheckpoint_closure_context:(void *)a3
{
  self->_checkpoint_closure_context = a3;
}

@end