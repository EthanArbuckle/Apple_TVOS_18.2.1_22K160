@interface PDXPCEventStreamObserverEntry
- (OS_dispatch_queue)replyQueue;
- (PDXPCEventStreamObserver)observer;
- (void)setObserver:(id)a3;
- (void)setReplyQueue:(id)a3;
@end

@implementation PDXPCEventStreamObserverEntry

- (PDXPCEventStreamObserver)observer
{
  return (PDXPCEventStreamObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
}

- (OS_dispatch_queue)replyQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setReplyQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end