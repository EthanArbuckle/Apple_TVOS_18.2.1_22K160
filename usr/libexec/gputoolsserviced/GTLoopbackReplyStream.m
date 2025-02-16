@interface GTLoopbackReplyStream
- (GTLoopbackReplyStream)initWithCallback:(id)a3;
- (unint64_t)dispatcherId;
- (void)dispatchMessage:(id)a3 replyConnection:(id)a4;
- (void)setDispatcherId:(unint64_t)a3;
@end

@implementation GTLoopbackReplyStream

- (GTLoopbackReplyStream)initWithCallback:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___GTLoopbackReplyStream;
  v5 = -[GTLoopbackReplyStream init](&v9, "init");
  if (v5)
  {
    id v6 = objc_retainBlock(v4);
    id callback = v5->_callback;
    v5->_id callback = v6;
  }

  return v5;
}

- (void)dispatchMessage:(id)a3 replyConnection:(id)a4
{
  xpc_object_t xdict = a3;
  id v6 = a4;
  id nsdictionary_any = xpc_dictionary_get_nsdictionary_any(xdict, "data");
  (*((void (**)(void))self->_callback + 2))();
  if (MessageHasReply(xdict))
  {
    xpc_object_t reply = gt_xpc_dictionary_create_reply(xdict);
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(reply);
    [v6 sendMessage:v9];
  }

  if (xpc_dictionary_get_BOOL(xdict, "_endOfStream")) {
    [v6 deregisterDispatcher:self->dispatcherId];
  }
}

- (unint64_t)dispatcherId
{
  return self->dispatcherId;
}

- (void)setDispatcherId:(unint64_t)a3
{
  self->dispatcherId = a3;
}

- (void).cxx_destruct
{
}

@end