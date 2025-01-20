@interface ReplayErrorTransport
- (ReplayErrorTransport)initWithTransport:(id)a3;
- (void)notifyError:(id)a3;
@end

@implementation ReplayErrorTransport

- (ReplayErrorTransport)initWithTransport:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ReplayErrorTransport;
  v6 = -[ReplayErrorTransport init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_transport, a3);
  }

  return v7;
}

- (void)notifyError:(id)a3
{
  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[GTTransportMessage_replayer messageWithKind:attributes:objectPayload:]( &OBJC_CLASS___GTTransportMessage_replayer,  "messageWithKind:attributes:objectPayload:",  4127LL,  0LL,  a3));
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
    dispatch_time_t v6 = dispatch_time(0LL, 3000000000LL);
    transport = self->_transport;
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = __36__ReplayErrorTransport_notifyError___block_invoke;
    v11[3] = &unk_58EFD0;
    dispatch_semaphore_t v12 = v5;
    v10 = v5;
    -[GTTransport_replayer send:inReplyTo:error:replyQueue:timeout:handler:]( transport,  "send:inReplyTo:error:replyQueue:timeout:handler:",  v4,  0LL,  0LL,  v9,  v6,  v11);

    dispatch_semaphore_wait(v10, v6);
  }

- (void).cxx_destruct
{
}

uint64_t __36__ReplayErrorTransport_notifyError___block_invoke(uint64_t a1)
{
  return 1LL;
}

@end