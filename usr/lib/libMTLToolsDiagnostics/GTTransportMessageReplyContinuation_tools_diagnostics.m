@interface GTTransportMessageReplyContinuation_tools_diagnostics
- (void)dispatchError:(id)a3;
@end

@implementation GTTransportMessageReplyContinuation_tools_diagnostics

- (void)dispatchError:(id)a3
{
  queue = self->super.queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __53__GTTransportMessageReplyContinuation_dispatchError___block_invoke;
  v4[3] = &unk_209B0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async((dispatch_queue_t)queue, v4);
}

@end