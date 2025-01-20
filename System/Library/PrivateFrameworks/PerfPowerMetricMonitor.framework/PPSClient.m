@interface PPSClient
- (NSXPCConnection)connection;
- (PPSClient)initWithConnection:(id)a3 remoteProxy:(id)a4;
- (PPSMetricMonitorClientInterface)remoteProxy;
- (PPSMetricMonitorConfiguration)config;
- (void)setConfig:(id)a3;
- (void)setConnection:(id)a3;
- (void)setRemoteProxy:(id)a3;
@end

@implementation PPSClient

- (PPSClient)initWithConnection:(id)a3 remoteProxy:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PPSClient;
  v9 = -[PPSClient init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong((id *)&v10->_remoteProxy, a4);
  }

  return v10;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setConnection:(id)a3
{
}

- (PPSMetricMonitorClientInterface)remoteProxy
{
  return (PPSMetricMonitorClientInterface *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setRemoteProxy:(id)a3
{
}

- (PPSMetricMonitorConfiguration)config
{
  return (PPSMetricMonitorConfiguration *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setConfig:(id)a3
{
}

- (void).cxx_destruct
{
}

@end