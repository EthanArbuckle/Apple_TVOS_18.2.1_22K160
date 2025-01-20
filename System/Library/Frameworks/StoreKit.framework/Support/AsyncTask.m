@interface AsyncTask
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (void)completeWithError:(id)a3;
- (void)completeWithSuccess;
- (void)setExecuting:(BOOL)a3;
- (void)setFinished:(BOOL)a3;
- (void)start;
@end

@implementation AsyncTask

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)setExecuting:(BOOL)a3
{
  if (self->super._success != a3)
  {
    -[AsyncTask willChangeValueForKey:](self, "willChangeValueForKey:", @"isExecuting");
    self->super._success = a3;
    -[AsyncTask didChangeValueForKey:](self, "didChangeValueForKey:", @"isExecuting");
  }

- (void)setFinished:(BOOL)a3
{
  if (*(&self->super._success + 1) != a3)
  {
    -[AsyncTask willChangeValueForKey:](self, "willChangeValueForKey:", @"isFinished");
    *(&self->super._success + 1) = a3;
    -[AsyncTask didChangeValueForKey:](self, "didChangeValueForKey:", @"isFinished");
  }

- (void)start
{
}

- (void)completeWithError:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AsyncTask;
  -[Task completeWithError:](&v4, "completeWithError:", a3);
  -[AsyncTask setExecuting:](self, "setExecuting:", 0LL);
  -[AsyncTask setFinished:](self, "setFinished:", 1LL);
}

- (void)completeWithSuccess
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AsyncTask;
  -[Task completeWithSuccess](&v3, "completeWithSuccess");
  -[AsyncTask setExecuting:](self, "setExecuting:", 0LL);
  -[AsyncTask setFinished:](self, "setFinished:", 1LL);
}

- (BOOL)isExecuting
{
  return self->super._success;
}

- (BOOL)isFinished
{
  return *(&self->super._success + 1);
}

@end