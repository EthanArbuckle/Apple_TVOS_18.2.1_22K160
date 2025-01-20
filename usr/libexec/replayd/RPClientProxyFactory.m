@interface RPClientProxyFactory
+ (id)clientProxyWithNewConnection:(id)a3 currentState:(id)a4;
@end

@implementation RPClientProxyFactory

+ (id)clientProxyWithNewConnection:(id)a3 currentState:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForEntitlement:@"com.apple.private.replay-kit"]);
  unsigned __int8 v8 = [v7 BOOLValue];

  if ((v8 & 1) != 0)
  {
    v9 = (RPClientProxy *)objc_claimAutoreleasedReturnValue(+[RPMultipleClientProxy clientProxy](&OBJC_CLASS___RPMultipleClientProxy, "clientProxy"));
    -[RPClientProxy handleNewConnection:currentState:](v9, "handleNewConnection:currentState:", v6, v5);
  }

  else
  {
    v9 = -[RPClientProxy initWithConnection:](objc_alloc(&OBJC_CLASS___RPClientProxy), "initWithConnection:", v6);
  }

  return v9;
}

@end