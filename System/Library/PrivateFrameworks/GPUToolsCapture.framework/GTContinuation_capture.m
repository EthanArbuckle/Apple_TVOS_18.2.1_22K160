@interface GTContinuation_capture
- (GTContinuation_capture)init;
- (GTContinuation_capture)initWithQueue:(id)a3 block:(id)a4;
- (void)dealloc;
- (void)dispatch;
@end

@implementation GTContinuation_capture

- (GTContinuation_capture)init
{
  return 0LL;
}

- (GTContinuation_capture)initWithQueue:(id)a3 block:(id)a4
{
  if (!a3)
  {
    if (s_logUsingOsLog)
    {
      v8 = (os_log_s *)gt_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v9 = "fail: queue cannot be NULL";
        goto LABEL_12;
      }

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->queue);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GTContinuation_capture;
  -[GTContinuation_capture dealloc](&v3, "dealloc");
}

- (void)dispatch
{
}

@end