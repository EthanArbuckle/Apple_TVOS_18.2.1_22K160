@interface _NSXPCConnectionExpectedReplyInfo
- (void)cleanup;
- (void)dealloc;
- (void)initWithSelector:(void *)result;
@end

@implementation _NSXPCConnectionExpectedReplyInfo

- (void)initWithSelector:(void *)result
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)&OBJC_CLASS____NSXPCConnectionExpectedReplyInfo;
    result = objc_msgSendSuper2(&v3, sel_init);
    result[4] = a2;
  }

  return result;
}

- (void)cleanup
{
  if (a1)
  {
    v2 = *(dispatch_semaphore_s **)(a1 + 24);
    if (v2)
    {
      dispatch_semaphore_signal(v2);
      dispatch_release(*(dispatch_object_t *)(a1 + 24));
      *(void *)(a1 + 24) = 0LL;
    }
  }

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];

  timeoutSemaphore = (dispatch_object_s *)self->_timeoutSemaphore;
  if (timeoutSemaphore) {
    dispatch_release(timeoutSemaphore);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____NSXPCConnectionExpectedReplyInfo;
  -[_NSXPCConnectionExpectedReplyInfo dealloc](&v4, sel_dealloc);
}

@end