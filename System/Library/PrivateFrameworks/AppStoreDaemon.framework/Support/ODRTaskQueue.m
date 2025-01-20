@interface ODRTaskQueue
- (ODRTaskQueue)init;
@end

@implementation ODRTaskQueue

- (ODRTaskQueue)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ODRTaskQueue;
  v2 = -[ODRTaskQueue init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___TaskQueue);
    queue = v2->_queue;
    v2->_queue = v3;
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end