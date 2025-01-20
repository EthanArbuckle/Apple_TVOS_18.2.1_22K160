@interface GTServiceVendor
- (GTServiceVendor)initWithConnectionProvider:(id)a3;
- (id)_connectionForServicePort:(unint64_t)a3;
- (id)getSimulatorDeviceBrowserService:(id)a3;
- (void)addLocalService:(id)a3 forPort:(unint64_t)a4;
- (void)setServiceDaemonConnection:(id)a3;
@end

@implementation GTServiceVendor

- (GTServiceVendor)initWithConnectionProvider:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___GTServiceVendor;
    v6 = -[GTServiceVendor init](&v12, "init");
    if (v6)
    {
      v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      portToService = v6->_portToService;
      v6->_portToService = v7;

      objc_storeStrong((id *)&v6->_connectionProvider, a3);
      serviceDaemonConnection = v6->_serviceDaemonConnection;
      v6->_serviceDaemonConnection = 0LL;
    }

    self = v6;
    v10 = self;
  }

  else
  {
    v10 = 0LL;
  }

  return v10;
}

- (void)setServiceDaemonConnection:(id)a3
{
}

- (void)addLocalService:(id)a3 forPort:(unint64_t)a4
{
  if (a3)
  {
    portToService = self->_portToService;
    id v6 = a3;
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
    -[NSMutableDictionary setObject:forKeyedSubscript:](portToService, "setObject:forKeyedSubscript:", v6, v7);
  }

- (id)_connectionForServicePort:(unint64_t)a3
{
  v4 = (GTXPCConnection *)objc_claimAutoreleasedReturnValue( -[GTConnectionProvider connectionForServicePort:]( self->_connectionProvider,  "connectionForServicePort:",  a3));
  serviceDaemonConnection = v4;
  if (!v4) {
    serviceDaemonConnection = self->_serviceDaemonConnection;
  }
  id v6 = serviceDaemonConnection;

  return v6;
}

- (id)getSimulatorDeviceBrowserService:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    portToService = self->_portToService;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v4 servicePort]));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](portToService, "objectForKeyedSubscript:", v7));

    if (v8)
    {
      v9 = v8;
    }

    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue( -[GTServiceVendor _connectionForServicePort:]( self,  "_connectionForServicePort:",  [v5 servicePort]));
      v9 = -[GTSimulatorDeviceBrowserXPCProxy initWithConnection:remoteProperties:]( objc_alloc(&OBJC_CLASS___GTSimulatorDeviceBrowserXPCProxy),  "initWithConnection:remoteProperties:",  v10,  v5);
    }
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

- (void).cxx_destruct
{
}

@end