@interface AsyncTask
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (void)completeWithError:(id)a3;
- (void)completeWithSuccess;
- (void)main;
- (void)mainWithCompletionHandler:(id)a3;
- (void)start;
@end

@implementation AsyncTask

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  BOOL success = self->super._success;
  -[Task unlock](self, "unlock");
  return success;
}

- (BOOL)isFinished
{
  BOOL v3 = *(&self->super._success + 1);
  -[Task unlock](self, "unlock");
  return v3;
}

- (void)start
{
  if (self && !-[AsyncTask isExecuting](self, "isExecuting"))
  {
    -[AsyncTask willChangeValueForKey:](self, "willChangeValueForKey:", @"isExecuting");
    -[Task lock](self, "lock");
    self->super._BOOL success = 1;
    -[Task unlock](self, "unlock");
    -[AsyncTask didChangeValueForKey:](self, "didChangeValueForKey:", @"isExecuting");
  }

  -[AsyncTask main](self, "main");
}

- (void)main
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1001E03D4;
  v2[3] = &unk_1003E9CA8;
  v2[4] = self;
  -[AsyncTask mainWithCompletionHandler:](self, "mainWithCompletionHandler:", v2);
}

- (void)mainWithCompletionHandler:(id)a3
{
}

- (void)completeWithError:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AsyncTask;
  -[Task completeWithError:](&v4, "completeWithError:", a3);
  sub_1001E0440(self);
}

- (void)completeWithSuccess
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AsyncTask;
  -[Task completeWithSuccess](&v3, "completeWithSuccess");
  sub_1001E0440(self);
}

@end