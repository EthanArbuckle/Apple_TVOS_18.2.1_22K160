@interface GTXPCDispatcher
- (GTXPCDispatcher)initWithProtocolMethods:(id)a3;
- (void)dispatchMessage:(id)a3 replyConnection:(id)a4;
@end

@implementation GTXPCDispatcher

- (GTXPCDispatcher)initWithProtocolMethods:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___GTXPCDispatcher;
  v5 = -[GTXPCDispatcher init](&v11, "init");
  if (v5)
  {
    os_log_t v6 = os_log_create("com.apple.gputools.transport", "GTXPCDispatcher");
    log = v5->_log;
    v5->_log = v6;

    v8 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v4);
    protocolMethods = v5->_protocolMethods;
    v5->_protocolMethods = v8;
  }

  return v5;
}

- (void)dispatchMessage:(id)a3 replyConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  string = xpc_dictionary_get_string(v6, "_cmd");
  if (string)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
    if (-[NSSet containsObject:](self->_protocolMethods, "containsObject:", v9))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByReplacingOccurrencesOfString:@":" withString:@"_"]);
      objc_super v11 = (NSString *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingString:@":replyConnection:"]);

      -[GTXPCDispatcher performSelector:withObject:withObject:]( self,  "performSelector:withObject:withObject:",  NSSelectorFromString(v11),  v6,  v7);
    }
  }

  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
      sub_1000031D4(log);
    }
  }
}

- (void).cxx_destruct
{
}

@end