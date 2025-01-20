@interface NEIKEv2TrafficSelector
+ (id)copyAllIPv4;
+ (id)copyAllIPv6;
+ (id)copyConstrainedTrafficSelectorsForRequest:(void *)a3 reply:;
- (NEIKEv2TrafficSelector)init;
- (NWAddressEndpoint)endAddress;
- (NWAddressEndpoint)startAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (uint64_t)type;
- (unsigned)endPort;
- (unsigned)ipProtocol;
- (unsigned)startPort;
- (void)setEndAddress:(id)a3;
- (void)setEndPort:(unsigned __int16)a3;
- (void)setIpProtocol:(unsigned __int8)a3;
- (void)setStartAddress:(id)a3;
- (void)setStartPort:(unsigned __int16)a3;
@end

@implementation NEIKEv2TrafficSelector

- (NEIKEv2TrafficSelector)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NEIKEv2TrafficSelector;
  v2 = -[NEIKEv2TrafficSelector init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }

  else
  {
    ne_log_obj();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_1876B1000, v6, OS_LOG_TYPE_FAULT, "[super init] failed", v7, 2u);
    }
  }

  return v3;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  v4 = -[NEIKEv2TrafficSelector startAddress](self, "startAddress");
  [v4 hostname];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v6 = -[NEIKEv2TrafficSelector startPort](self, "startPort");
  v7 = -[NEIKEv2TrafficSelector endAddress](self, "endAddress");
  [v7 hostname];
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)[v3 initWithFormat:@"%@ : %u -> %@ : %u (%u)", v5, v6, v8, -[NEIKEv2TrafficSelector endPort](self, "endPort"), -[NEIKEv2TrafficSelector ipProtocol](self, "ipProtocol")];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NEIKEv2TrafficSelector startAddress](self, "startAddress");
  unsigned int v6 = (void *)[v5 copy];
  [v4 setStartAddress:v6];
  v7 = -[NEIKEv2TrafficSelector endAddress](self, "endAddress");
  objc_super v8 = (void *)[v7 copy];
  [v4 setEndAddress:v8];

  objc_msgSend(v4, "setStartPort:", -[NEIKEv2TrafficSelector startPort](self, "startPort"));
  objc_msgSend(v4, "setEndPort:", -[NEIKEv2TrafficSelector endPort](self, "endPort"));
  objc_msgSend(v4, "setIpProtocol:", -[NEIKEv2TrafficSelector ipProtocol](self, "ipProtocol"));
  return v4;
}

- (NWAddressEndpoint)startAddress
{
  return (NWAddressEndpoint *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setStartAddress:(id)a3
{
}

- (NWAddressEndpoint)endAddress
{
  return (NWAddressEndpoint *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setEndAddress:(id)a3
{
}

- (unsigned)startPort
{
  return self->_startPort;
}

- (void)setStartPort:(unsigned __int16)a3
{
  self->_startPort = a3;
}

- (unsigned)endPort
{
  return self->_endPort;
}

- (void)setEndPort:(unsigned __int16)a3
{
  self->_endPort = a3;
}

- (unsigned)ipProtocol
{
  return self->_ipProtocol;
}

- (void)setIpProtocol:(unsigned __int8)a3
{
  self->_ipProtocol = a3;
}

- (void).cxx_destruct
{
}

+ (id)copyAllIPv6
{
  v2 = objc_alloc_init(&OBJC_CLASS___NEIKEv2TrafficSelector);
  [MEMORY[0x189608DE8] endpointWithHostname:@"::" port:@"0"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIKEv2TrafficSelector setStartAddress:](v2, "setStartAddress:", v3);

  [MEMORY[0x189608DE8] endpointWithHostname:@"ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff" port:@"0"];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIKEv2TrafficSelector setEndAddress:](v2, "setEndAddress:", v4);

  -[NEIKEv2TrafficSelector setStartPort:](v2, "setStartPort:", 0LL);
  -[NEIKEv2TrafficSelector setEndPort:](v2, "setEndPort:", 0xFFFFLL);
  -[NEIKEv2TrafficSelector setIpProtocol:](v2, "setIpProtocol:", 0LL);
  return v2;
}

+ (id)copyAllIPv4
{
  v2 = objc_alloc_init(&OBJC_CLASS___NEIKEv2TrafficSelector);
  [MEMORY[0x189608DE8] endpointWithHostname:@"0.0.0.0" port:@"0"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIKEv2TrafficSelector setStartAddress:](v2, "setStartAddress:", v3);

  [MEMORY[0x189608DE8] endpointWithHostname:@"255.255.255.255" port:@"0"];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIKEv2TrafficSelector setEndAddress:](v2, "setEndAddress:", v4);

  -[NEIKEv2TrafficSelector setStartPort:](v2, "setStartPort:", 0LL);
  -[NEIKEv2TrafficSelector setEndPort:](v2, "setEndPort:", 0xFFFFLL);
  -[NEIKEv2TrafficSelector setIpProtocol:](v2, "setIpProtocol:", 0LL);
  return v2;
}

- (uint64_t)type
{
  if (result)
  {
    v1 = (void *)result;
    uint64_t v2 = [(id)result startAddress];
    if (v2)
    {
      id v3 = (void *)v2;
      uint64_t v4 = [v1 endAddress];
      if (v4)
      {
        v5 = (void *)v4;
        [v1 startAddress];
        unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v7 = [v6 addressFamily];
        [v1 endAddress];
        objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v9 = [v8 addressFamily];

        if (v7 == v9)
        {
          [v1 startAddress];
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v11 = [v10 addressFamily];

          if (v11 == 2) {
            return 7LL;
          }
          [v1 startAddress];
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v13 = [v12 addressFamily];

          if (v13 == 30) {
            return 8LL;
          }
        }
      }

      else
      {
      }
    }

    return 0LL;
  }

  return result;
}

+ (id)copyConstrainedTrafficSelectorsForRequest:(void *)a3 reply:
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_opt_self();
  if (!a2)
  {
    ne_log_obj();
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_FAULT))
    {
LABEL_8:

      id v5 = 0LL;
      goto LABEL_4;
    }

    int v9 = 136315138;
    v10 = "+[NEIKEv2TrafficSelector copyConstrainedTrafficSelectorsForRequest:reply:]";
    objc_super v8 = "%s called with null request";
LABEL_10:
    _os_log_fault_impl(&dword_1876B1000, (os_log_t)v7, OS_LOG_TYPE_FAULT, v8, (uint8_t *)&v9, 0xCu);
    goto LABEL_8;
  }

  if (!v4)
  {
    ne_log_obj();
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_FAULT)) {
      goto LABEL_8;
    }
    int v9 = 136315138;
    v10 = "+[NEIKEv2TrafficSelector copyConstrainedTrafficSelectorsForRequest:reply:]";
    objc_super v8 = "%s called with null reply";
    goto LABEL_10;
  }

  id v5 = v4;
LABEL_4:

  return v5;
}

@end