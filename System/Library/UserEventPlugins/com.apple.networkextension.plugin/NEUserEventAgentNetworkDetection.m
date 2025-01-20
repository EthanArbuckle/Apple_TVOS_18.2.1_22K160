@interface NEUserEventAgentNetworkDetection
- (NEUserEventAgentNetworkDetection)init;
@end

@implementation NEUserEventAgentNetworkDetection

- (NEUserEventAgentNetworkDetection)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NEUserEventAgentNetworkDetection;
  v2 = -[NEUserEventAgentNetworkDetection init](&v6, "init");
  if (v2)
  {
    v3 = (OS_xpc_object *)xpc_array_create(0LL, 0LL);
    notifyTokens = v2->_notifyTokens;
    v2->_notifyTokens = v3;
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end