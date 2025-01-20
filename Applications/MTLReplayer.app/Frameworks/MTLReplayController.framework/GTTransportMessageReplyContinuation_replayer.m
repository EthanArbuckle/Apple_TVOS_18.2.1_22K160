@interface GTTransportMessageReplyContinuation_replayer
- (void)dispatchError:(id)a3;
@end

@implementation GTTransportMessageReplyContinuation_replayer

- (void)dispatchError:(id)a3
{
  queue = (dispatch_queue_s *)self->super.queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __53__GTTransportMessageReplyContinuation_dispatchError___block_invoke;
  v4[3] = &unk_58E1F8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

@end