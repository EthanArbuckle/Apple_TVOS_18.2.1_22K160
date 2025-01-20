@interface NENexusPathFlow
- (id)clientIdentifier;
- (id)endpoint;
- (id)initWithPath:(id *)a1;
- (id)parameters;
@end

@implementation NENexusPathFlow

- (id)endpoint
{
  if (self) {
    self = (NENexusPathFlow *)objc_getProperty(self, a2, 40LL, 1);
  }
  return -[NENexusPathFlow endpoint](self, "endpoint");
}

- (id)parameters
{
  if (self) {
    self = (NENexusPathFlow *)objc_getProperty(self, a2, 40LL, 1);
  }
  return -[NENexusPathFlow parameters](self, "parameters");
}

- (id)clientIdentifier
{
  if (self) {
    self = (NENexusPathFlow *)objc_getProperty(self, a2, 40LL, 1);
  }
  return (id)-[NENexusPathFlow clientID](self, "clientID");
}

- (void).cxx_destruct
{
}

- (id)initWithPath:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_CLASS___NENexusPathFlow;
    v5 = (id *)objc_msgSendSuper2(&v9, sel_init);
    if (v5)
    {
      a1 = v5;
      objc_storeStrong(v5 + 5, a2);
      [v4 clientID];
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NENexusFlow setupFlowProtocolWithUUID:](a1, v6);
    }

    else
    {
      ne_log_obj();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_FAULT))
      {
        v8[0] = 0;
        _os_log_fault_impl(&dword_1876B1000, (os_log_t)v6, OS_LOG_TYPE_FAULT, "[super init] failed", (uint8_t *)v8, 2u);
      }

      a1 = 0LL;
    }
  }

  return a1;
}

@end