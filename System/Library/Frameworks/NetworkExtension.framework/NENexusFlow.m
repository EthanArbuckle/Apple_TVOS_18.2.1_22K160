@interface NENexusFlow
- (NSUUID)clientIdentifier;
- (NWEndpoint)endpoint;
- (NWParameters)parameters;
- (nw_protocol)protocol;
- (unint64_t)state;
- (void)dealloc;
- (void)setProtocol:(nw_protocol *)a3;
- (void)setState:(unint64_t)a3;
- (void)setupFlowProtocolWithUUID:(void *)a1;
@end

@implementation NENexusFlow

- (void)dealloc
{
  if (-[NENexusFlow protocol](self, "protocol"))
  {
    free(-[NENexusFlow protocol](self, "protocol"));
    -[NENexusFlow setProtocol:](self, "setProtocol:", 0LL);
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NENexusFlow;
  -[NENexusFlow dealloc](&v3, sel_dealloc);
}

- (NWEndpoint)endpoint
{
  return 0LL;
}

- (NWParameters)parameters
{
  return 0LL;
}

- (NSUUID)clientIdentifier
{
  return 0LL;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (nw_protocol)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(nw_protocol *)a3
{
  self->_protocol = a3;
}

- (void).cxx_destruct
{
}

- (void)setupFlowProtocolWithUUID:(void *)a1
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  v4 = calloc(1uLL, 0x40uLL);
  if (v4)
  {
    v5 = v4;
    v4[2] = &NENexusFlowIdentifier;
    v4[3] = &NENexusFlowCallbacks;
    [v3 getUUIDBytes:v4];
    v5[5] = a1;
    [a1 setProtocol:v5];
  }

  else
  {
    ne_log_obj();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v7 = 134217984;
      uint64_t v8 = 64LL;
      _os_log_fault_impl(&dword_1876B1000, v6, OS_LOG_TYPE_FAULT, "calloc(%zu) failed", (uint8_t *)&v7, 0xCu);
    }
  }
}

@end