@interface GTServiceObserver
- (GTServiceObserver)initWithMessage:(id)a3 notifyConnection:(id)a4;
- (GTXPCConnection)connection;
- (OS_xpc_object)replyPath;
- (unint64_t)replyStream;
@end

@implementation GTServiceObserver

- (GTServiceObserver)initWithMessage:(id)a3 notifyConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___GTServiceObserver;
  v8 = -[GTServiceObserver init](&v13, "init");
  if (v8)
  {
    v8->_replyStream = xpc_dictionary_get_uint64(v6, "_replyStreamId");
    xpc_object_t array = xpc_dictionary_get_array(v6, "_pathHistory");
    uint64_t v10 = objc_claimAutoreleasedReturnValue(array);
    replyPath = v8->_replyPath;
    v8->_replyPath = (OS_xpc_object *)v10;

    objc_storeStrong((id *)&v8->_connection, a4);
  }

  return v8;
}

- (unint64_t)replyStream
{
  return self->_replyStream;
}

- (OS_xpc_object)replyPath
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 16LL, 1);
}

- (GTXPCConnection)connection
{
  return (GTXPCConnection *)objc_getProperty(self, a2, 24LL, 1);
}

- (void).cxx_destruct
{
}

@end