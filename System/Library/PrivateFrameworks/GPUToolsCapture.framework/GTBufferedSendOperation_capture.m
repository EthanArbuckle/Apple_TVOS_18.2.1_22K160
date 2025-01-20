@interface GTBufferedSendOperation_capture
- (GTTransportMessage_capture)message;
- (GTTransportMessage_capture)replyTo;
- (OS_dispatch_queue)queue;
- (id)replyBlock;
- (unint64_t)timeout;
- (void)dealloc;
- (void)setMessage:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReplyBlock:(id)a3;
- (void)setReplyTo:(id)a3;
- (void)setTimeout:(unint64_t)a3;
@end

@implementation GTBufferedSendOperation_capture

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GTBufferedSendOperation_capture;
  -[GTBufferedSendOperation_capture dealloc](&v3, "dealloc");
}

- (GTTransportMessage_capture)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (GTTransportMessage_capture)replyTo
{
  return self->_replyTo;
}

- (void)setReplyTo:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(unint64_t)a3
{
  self->_timeout = a3;
}

- (id)replyBlock
{
  return self->_replyBlock;
}

- (void)setReplyBlock:(id)a3
{
  self->_replyBlock = a3;
}

@end