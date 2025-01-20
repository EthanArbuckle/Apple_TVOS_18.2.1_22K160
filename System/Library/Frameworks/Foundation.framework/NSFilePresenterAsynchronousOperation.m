@interface NSFilePresenterAsynchronousOperation
+ (id)operationWithBlock:(id)a3;
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (void)finish;
- (void)start;
@end

@implementation NSFilePresenterAsynchronousOperation

+ (id)operationWithBlock:(id)a3
{
  v4 = objc_alloc_init((Class)a1);
  v4[31] = [a3 copy];
  return v4;
}

- (void)start
{
  self->_isExecuting = 1;
  -[NSFilePresenterAsynchronousOperation didChangeValueForKey:](self, "didChangeValueForKey:", @"isExecuting");
  (*((void (**)(void))self->_block + 2))();
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)finish
{
  self->_block = 0LL;
  -[NSFilePresenterAsynchronousOperation willChangeValueForKey:](self, "willChangeValueForKey:", @"isFinished");
  -[NSFilePresenterAsynchronousOperation willChangeValueForKey:](self, "willChangeValueForKey:", @"isExecuting");
  self->_isFinished = 1;
  self->_isExecuting = 0;
  -[NSFilePresenterAsynchronousOperation didChangeValueForKey:](self, "didChangeValueForKey:", @"isExecuting");
  -[NSFilePresenterAsynchronousOperation didChangeValueForKey:](self, "didChangeValueForKey:", @"isFinished");
}

@end