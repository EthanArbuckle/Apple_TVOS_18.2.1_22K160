@interface NEDNSProxyProvider
- (BOOL)handleNewFlow:(NEAppProxyFlow *)flow;
- (BOOL)handleNewUDPFlow:(id)a3 initialRemoteFlowEndpoint:(id)a4;
- (NSArray)systemDNSSettings;
- (void)cancelProxyWithError:(NSError *)error;
- (void)setSystemDNSSettings:(id)a3;
- (void)startProxyWithOptions:(NSDictionary *)options completionHandler:(void *)completionHandler;
- (void)stopProxyWithReason:(NEProviderStopReason)reason completionHandler:(void *)completionHandler;
@end

@implementation NEDNSProxyProvider

- (void)startProxyWithOptions:(NSDictionary *)options completionHandler:(void *)completionHandler
{
  v11[1] = *MEMORY[0x1895F89C0];
  v5 = (void *)MEMORY[0x189607870];
  uint64_t v10 = *MEMORY[0x1896075E0];
  v11[0] = @"startProxyWithOptions:completionHandler: not implemented";
  v6 = (void *)MEMORY[0x189603F68];
  v7 = completionHandler;
  [v6 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 errorWithDomain:@"NEDNSProxyProviderDefaultErrorDomain" code:1 userInfo:v8];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(void *, void *))completionHandler + 2))(v7, v9);
}

- (void)stopProxyWithReason:(NEProviderStopReason)reason completionHandler:(void *)completionHandler
{
}

- (void)cancelProxyWithError:(NSError *)error
{
  v4 = error;
  -[NEProvider context](self, "context");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 cancelWithError:v4];
}

- (BOOL)handleNewFlow:(NEAppProxyFlow *)flow
{
  return 0;
}

- (BOOL)handleNewUDPFlow:(id)a3 initialRemoteFlowEndpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = -[NEProvider _callSwiftHandleNewUDPFlow:initialRemoteFlowEndpoint:]( self,  "_callSwiftHandleNewUDPFlow:initialRemoteFlowEndpoint:",  v6,  v7);
  if (v8 == -1)
  {
    [MEMORY[0x189608DF0] endpointWithCEndpoint:v7];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v9 = -[NEDNSProxyProvider handleNewUDPFlow:initialRemoteEndpoint:]( self,  "handleNewUDPFlow:initialRemoteEndpoint:",  v6,  v10);
  }

  else
  {
    BOOL v9 = v8 != 0;
  }

  return v9;
}

- (NSArray)systemDNSSettings
{
  return (NSArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setSystemDNSSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end