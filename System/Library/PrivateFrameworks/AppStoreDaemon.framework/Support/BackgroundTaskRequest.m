@interface BackgroundTaskRequest
- (BackgroundTaskRequest)init;
@end

@implementation BackgroundTaskRequest

- (BackgroundTaskRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___BackgroundTaskRequest;
  v2 = -[BackgroundTaskRequest init](&v6, "init");
  if (v2)
  {
    empty = (OS_xpc_object *)xpc_dictionary_create_empty();
    job = v2->_job;
    v2->_job = empty;
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end