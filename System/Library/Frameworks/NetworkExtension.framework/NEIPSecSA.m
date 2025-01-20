@interface NEIPSecSA
- (BOOL)isEqual:(id)a3;
- (BOOL)natDetectedOnPeer;
- (BOOL)natKeepaliveEnabled;
- (BOOL)natKeepaliveOffloadEnabled;
- (BOOL)natTraversalEnabled;
- (BOOL)sequencePerTrafficClass;
- (NSData)authenticationKey;
- (NSData)encryptionKey;
- (NSString)boundInterfaceName;
- (NSString)tunnelInterfaceName;
- (NWAddressEndpoint)localAddress;
- (NWAddressEndpoint)remoteAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createDictionary;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initInboundSA;
- (id)initInboundSAWithSPI:(unsigned int)a3;
- (id)initOutboundSAWithSPI:(unsigned int)a3;
- (int)authenticationAlgorithm;
- (int)direction;
- (int)encryptionAlgorithm;
- (int)mode;
- (int)protocol;
- (unint64_t)hash;
- (unint64_t)lifetimeSeconds;
- (unint64_t)natKeepaliveIntervalSeconds;
- (unint64_t)natKeepaliveOffloadIntervalSeconds;
- (unsigned)natTraversalPort;
- (unsigned)natTraversalSrcPort;
- (unsigned)replayWindowSize;
- (unsigned)spi;
- (void)dealloc;
- (void)invalidate;
- (void)setAuthenticationAlgorithm:(int)a3;
- (void)setAuthenticationKey:(id)a3;
- (void)setBoundInterfaceName:(id)a3;
- (void)setEncryptionAlgorithm:(int)a3;
- (void)setEncryptionKey:(id)a3;
- (void)setLifetimeSeconds:(unint64_t)a3;
- (void)setLocalAddress:(id)a3;
- (void)setMode:(int)a3;
- (void)setNatDetectedOnPeer:(BOOL)a3;
- (void)setNatKeepaliveEnabled:(BOOL)a3;
- (void)setNatKeepaliveIntervalSeconds:(unint64_t)a3;
- (void)setNatKeepaliveOffloadEnabled:(BOOL)a3;
- (void)setNatKeepaliveOffloadIntervalSeconds:(unint64_t)a3;
- (void)setNatTraversalEnabled:(BOOL)a3;
- (void)setNatTraversalPort:(unsigned __int16)a3;
- (void)setNatTraversalSrcPort:(unsigned __int16)a3;
- (void)setProtocol:(int)a3;
- (void)setRemoteAddress:(id)a3;
- (void)setReplayWindowSize:(unsigned int)a3;
- (void)setSequencePerTrafficClass:(BOOL)a3;
- (void)setTunnelInterfaceName:(id)a3;
@end

@implementation NEIPSecSA

- (id)initOutboundSAWithSPI:(unsigned int)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NEIPSecSA;
  v4 = -[NEIPSecSA init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_spi = a3;
    v4->_direction = 1;
    v6 = v4;
  }

  else
  {
    ne_log_obj();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_1876B1000, v8, OS_LOG_TYPE_FAULT, "[super init] failed", v9, 2u);
    }
  }

  return v5;
}

- (id)initInboundSAWithSPI:(unsigned int)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NEIPSecSA;
  v4 = -[NEIPSecSA init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_spi = a3;
    v4->_direction = 2;
    v6 = v4;
  }

  else
  {
    ne_log_obj();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_1876B1000, v8, OS_LOG_TYPE_FAULT, "[super init] failed", v9, 2u);
    }
  }

  return v5;
}

- (id)initInboundSA
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NEIPSecSA;
  v2 = -[NEIPSecSA init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_direction = 2;
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

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (int v5 = [v4 spi], v5 == -[NEIPSecSA spi](self, "spi"))
    && (int v6 = [v4 direction], v6 == -[NEIPSecSA direction](self, "direction"))
    && (int v7 = [v4 mode], v7 == -[NEIPSecSA mode](self, "mode")))
  {
    int v8 = [v4 protocol];
    BOOL v9 = v8 == -[NEIPSecSA protocol](self, "protocol");
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  return -[NEIPSecSA spi](self, "spi");
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = -[NEIPSecSA direction](self, "direction");
  int v6 = +[NEIPSecSA allocWithZone:](&OBJC_CLASS___NEIPSecSA, "allocWithZone:", a3);
  uint64_t v7 = -[NEIPSecSA spi](self, "spi");
  if (v5 == 1) {
    uint64_t v8 = -[NEIPSecSA initOutboundSAWithSPI:](v6, "initOutboundSAWithSPI:", v7);
  }
  else {
    uint64_t v8 = -[NEIPSecSA initInboundSAWithSPI:](v6, "initInboundSAWithSPI:", v7);
  }
  BOOL v9 = (void *)v8;
  if (!self)
  {
    unsigned int internalSAID = 0;
    if (v8) {
      goto LABEL_6;
    }
LABEL_9:
    -[NEIPSecSA spi](self, "spi");
    goto LABEL_7;
  }

  unsigned int internalSAID = self->_internalSAID;
  if (!v8) {
    goto LABEL_9;
  }
LABEL_6:
  *(_DWORD *)(v8 + 48) = internalSAID;
  *(_DWORD *)(v8 + 20) = -[NEIPSecSA spi](self, "spi");
LABEL_7:
  objc_msgSend(v9, "setMode:", -[NEIPSecSA mode](self, "mode"));
  objc_msgSend(v9, "setProtocol:", -[NEIPSecSA protocol](self, "protocol"));
  v11 = -[NEIPSecSA localAddress](self, "localAddress");
  [v9 setLocalAddress:v11];
  v12 = -[NEIPSecSA remoteAddress](self, "remoteAddress");
  [v9 setRemoteAddress:v12];
  v13 = -[NEIPSecSA boundInterfaceName](self, "boundInterfaceName");
  v14 = (void *)[v13 copyWithZone:a3];
  [v9 setBoundInterfaceName:v14];
  v15 = -[NEIPSecSA tunnelInterfaceName](self, "tunnelInterfaceName");
  v16 = (void *)[v15 copyWithZone:a3];
  [v9 setTunnelInterfaceName:v16];

  objc_msgSend(v9, "setReplayWindowSize:", -[NEIPSecSA replayWindowSize](self, "replayWindowSize"));
  objc_msgSend(v9, "setLifetimeSeconds:", -[NEIPSecSA lifetimeSeconds](self, "lifetimeSeconds"));
  objc_msgSend(v9, "setEncryptionAlgorithm:", -[NEIPSecSA encryptionAlgorithm](self, "encryptionAlgorithm"));
  v17 = -[NEIPSecSA encryptionKey](self, "encryptionKey");
  v18 = (void *)[v17 copyWithZone:a3];
  [v9 setEncryptionKey:v18];

  objc_msgSend(v9, "setAuthenticationAlgorithm:", -[NEIPSecSA authenticationAlgorithm](self, "authenticationAlgorithm"));
  v19 = -[NEIPSecSA authenticationKey](self, "authenticationKey");
  v20 = (void *)[v19 copyWithZone:a3];
  [v9 setAuthenticationKey:v20];

  objc_msgSend(v9, "setNatTraversalEnabled:", -[NEIPSecSA natTraversalEnabled](self, "natTraversalEnabled"));
  objc_msgSend(v9, "setNatDetectedOnPeer:", -[NEIPSecSA natDetectedOnPeer](self, "natDetectedOnPeer"));
  objc_msgSend(v9, "setNatKeepaliveEnabled:", -[NEIPSecSA natKeepaliveEnabled](self, "natKeepaliveEnabled"));
  objc_msgSend( v9,  "setNatKeepaliveOffloadEnabled:",  -[NEIPSecSA natKeepaliveOffloadEnabled](self, "natKeepaliveOffloadEnabled"));
  objc_msgSend( v9,  "setNatKeepaliveIntervalSeconds:",  -[NEIPSecSA natKeepaliveIntervalSeconds](self, "natKeepaliveIntervalSeconds"));
  objc_msgSend( v9,  "setNatKeepaliveOffloadIntervalSeconds:",  -[NEIPSecSA natKeepaliveOffloadIntervalSeconds](self, "natKeepaliveOffloadIntervalSeconds"));
  objc_msgSend(v9, "setNatTraversalPort:", -[NEIPSecSA natTraversalPort](self, "natTraversalPort"));
  objc_msgSend(v9, "setNatTraversalSrcPort:", -[NEIPSecSA natTraversalSrcPort](self, "natTraversalSrcPort"));
  objc_msgSend(v9, "setSequencePerTrafficClass:", -[NEIPSecSA sequencePerTrafficClass](self, "sequencePerTrafficClass"));
  return v9;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x189607940]);
  uint64_t v8 = v7;
  if (self) {

  }
    uint64_t internalSAID = self->_internalSAID;
  else {
    uint64_t internalSAID = 0LL;
  }
  [v7 appendPrettyInt:internalSAID withName:@"Internal SAID" andIndent:v5 options:a4];
  objc_super v10 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%08X",  bswap32(-[NEIPSecSA spi](self, "spi")));
  [v8 appendPrettyObject:v10 withName:@"SPI" andIndent:v5 options:a4];

  unsigned int v11 = -[NEIPSecSA direction](self, "direction");
  if (v11 == 1)
  {
    v12 = @"Outbound";
  }

  else if (v11 == 2)
  {
    v12 = @"Inbound";
  }

  else
  {
    v12 = (__CFString *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"Unknown[%lld]", v11);
  }

  [v8 appendPrettyObject:v12 withName:@"Direction" andIndent:v5 options:a4];

  unsigned int v13 = -[NEIPSecSA mode](self, "mode");
  if (v13 == 1)
  {
    v14 = @"Transport";
  }

  else if (v13 == 2)
  {
    v14 = @"Tunnel";
  }

  else
  {
    v14 = (__CFString *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"Unknown[%lld]", v13);
  }

  [v8 appendPrettyObject:v14 withName:@"Mode" andIndent:v5 options:a4];

  unsigned int v15 = -[NEIPSecSA protocol](self, "protocol");
  if (v15 == 1)
  {
    v16 = @"ESP";
  }

  else if (v15 == 2)
  {
    v16 = @"AH";
  }

  else
  {
    v16 = (__CFString *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"Unknown[%lld]", v15);
  }

  [v8 appendPrettyObject:v16 withName:@"Protocol" andIndent:v5 options:a4];
  v17 = -[NEIPSecSA localAddress](self, "localAddress");
  [v8 appendPrettyObject:v17 withName:@"Local" andIndent:v5 options:a4];
  v18 = -[NEIPSecSA remoteAddress](self, "remoteAddress");
  [v8 appendPrettyObject:v18 withName:@"Remote" andIndent:v5 options:a4];
  v19 = -[NEIPSecSA boundInterfaceName](self, "boundInterfaceName");
  [v8 appendPrettyObject:v19 withName:@"Bound Interface" andIndent:v5 options:a4];
  v20 = -[NEIPSecSA tunnelInterfaceName](self, "tunnelInterfaceName");
  [v8 appendPrettyObject:v20 withName:@"Tunnel Interface" andIndent:v5 options:a4];

  objc_msgSend( v8,  "appendPrettyInt:withName:andIndent:options:",  -[NEIPSecSA replayWindowSize](self, "replayWindowSize"),  @"Replay Window Size",  v5,  a4);
  objc_msgSend( v8,  "appendPrettyInt:withName:andIndent:options:",  -[NEIPSecSA lifetimeSeconds](self, "lifetimeSeconds"),  @"Lifetime Seconds",  v5,  a4);
  objc_msgSend( v8,  "appendPrettyInt:withName:andIndent:options:",  -[NEIPSecSA encryptionAlgorithm](self, "encryptionAlgorithm"),  @"Encryption Algorithm",  v5,  a4);
  v21 = -[NEIPSecSA encryptionKey](self, "encryptionKey");
  objc_msgSend( v8,  "appendPrettyInt:withName:andIndent:options:",  objc_msgSend(v21, "length"),  @"Encryption Key Length",  v5,  a4);

  objc_msgSend( v8,  "appendPrettyInt:withName:andIndent:options:",  -[NEIPSecSA authenticationAlgorithm](self, "authenticationAlgorithm"),  @"Authentication Algorithm",  v5,  a4);
  v22 = -[NEIPSecSA authenticationKey](self, "authenticationKey");
  objc_msgSend( v8,  "appendPrettyInt:withName:andIndent:options:",  objc_msgSend(v22, "length"),  @"Authentication Key Length",  v5,  a4);

  objc_msgSend( v8,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEIPSecSA natTraversalEnabled](self, "natTraversalEnabled"),  @"NAT Traversal Enabled",  v5,  a4);
  objc_msgSend( v8,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEIPSecSA natDetectedOnPeer](self, "natDetectedOnPeer"),  @"NAT Detected on Peer",  v5,  a4);
  objc_msgSend( v8,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEIPSecSA natKeepaliveEnabled](self, "natKeepaliveEnabled"),  @"NAT Keepalive Enabled",  v5,  a4);
  objc_msgSend( v8,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEIPSecSA natKeepaliveOffloadEnabled](self, "natKeepaliveOffloadEnabled"),  @"NAT Keepalive Offload Enabled",  v5,  a4);
  objc_msgSend( v8,  "appendPrettyInt:withName:andIndent:options:",  -[NEIPSecSA natKeepaliveIntervalSeconds](self, "natKeepaliveIntervalSeconds"),  @"NAT Keepalive Interval Seconds",  v5,  a4);
  objc_msgSend( v8,  "appendPrettyInt:withName:andIndent:options:",  -[NEIPSecSA natKeepaliveOffloadIntervalSeconds](self, "natKeepaliveOffloadIntervalSeconds"),  @"NAT Keepalive Offload Interval Seconds",  v5,  a4);
  objc_msgSend( v8,  "appendPrettyInt:withName:andIndent:options:",  -[NEIPSecSA natTraversalPort](self, "natTraversalPort"),  @"NAT Traversal Port",  v5,  a4);
  objc_msgSend( v8,  "appendPrettyInt:withName:andIndent:options:",  -[NEIPSecSA natTraversalSrcPort](self, "natTraversalSrcPort"),  @"NAT Traversal Source Port",  v5,  a4);
  objc_msgSend( v8,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEIPSecSA sequencePerTrafficClass](self, "sequencePerTrafficClass"),  @"Sequence Per Traffic Class",  v5,  a4);
  return v8;
}

- (id)description
{
  return -[NEIPSecSA descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 14LL);
}

- (void)invalidate
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    uint64_t v5 = self;
    _os_log_impl(&dword_1876B1000, v3, OS_LOG_TYPE_INFO, "Invalidate %@", (uint8_t *)&v4, 0xCu);
  }

  -[NEIPSecSA setEncryptionKey:](self, "setEncryptionKey:", 0LL);
  -[NEIPSecSA setAuthenticationKey:](self, "setAuthenticationKey:", 0LL);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEIPSecSA;
  -[NEIPSecSA dealloc](&v3, sel_dealloc);
}

- (unsigned)spi
{
  return self->_spi;
}

- (int)direction
{
  return self->_direction;
}

- (int)mode
{
  return self->_mode;
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
}

- (int)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(int)a3
{
  self->_protocol = a3;
}

- (NWAddressEndpoint)localAddress
{
  return (NWAddressEndpoint *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setLocalAddress:(id)a3
{
}

- (NWAddressEndpoint)remoteAddress
{
  return (NWAddressEndpoint *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setRemoteAddress:(id)a3
{
}

- (NSString)boundInterfaceName
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setBoundInterfaceName:(id)a3
{
}

- (NSString)tunnelInterfaceName
{
  return (NSString *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setTunnelInterfaceName:(id)a3
{
}

- (unsigned)replayWindowSize
{
  return self->_replayWindowSize;
}

- (void)setReplayWindowSize:(unsigned int)a3
{
  self->_replayWindowSize = a3;
}

- (unint64_t)lifetimeSeconds
{
  return self->_lifetimeSeconds;
}

- (void)setLifetimeSeconds:(unint64_t)a3
{
  self->_lifetimeSeconds = a3;
}

- (int)encryptionAlgorithm
{
  return self->_encryptionAlgorithm;
}

- (void)setEncryptionAlgorithm:(int)a3
{
  self->_encryptionAlgorithm = a3;
}

- (NSData)encryptionKey
{
  return (NSData *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setEncryptionKey:(id)a3
{
}

- (int)authenticationAlgorithm
{
  return self->_authenticationAlgorithm;
}

- (void)setAuthenticationAlgorithm:(int)a3
{
  self->_authenticationAlgorithm = a3;
}

- (NSData)authenticationKey
{
  return (NSData *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setAuthenticationKey:(id)a3
{
}

- (BOOL)natTraversalEnabled
{
  return self->_natTraversalEnabled;
}

- (void)setNatTraversalEnabled:(BOOL)a3
{
  self->_natTraversalEnabled = a3;
}

- (BOOL)natDetectedOnPeer
{
  return self->_natDetectedOnPeer;
}

- (void)setNatDetectedOnPeer:(BOOL)a3
{
  self->_natDetectedOnPeer = a3;
}

- (BOOL)natKeepaliveEnabled
{
  return self->_natKeepaliveEnabled;
}

- (void)setNatKeepaliveEnabled:(BOOL)a3
{
  self->_natKeepaliveEnabled = a3;
}

- (BOOL)natKeepaliveOffloadEnabled
{
  return self->_natKeepaliveOffloadEnabled;
}

- (void)setNatKeepaliveOffloadEnabled:(BOOL)a3
{
  self->_natKeepaliveOffloadEnabled = a3;
}

- (unint64_t)natKeepaliveIntervalSeconds
{
  return self->_natKeepaliveIntervalSeconds;
}

- (void)setNatKeepaliveIntervalSeconds:(unint64_t)a3
{
  self->_natKeepaliveIntervalSeconds = a3;
}

- (unint64_t)natKeepaliveOffloadIntervalSeconds
{
  return self->_natKeepaliveOffloadIntervalSeconds;
}

- (void)setNatKeepaliveOffloadIntervalSeconds:(unint64_t)a3
{
  self->_natKeepaliveOffloadIntervalSeconds = a3;
}

- (unsigned)natTraversalPort
{
  return self->_natTraversalPort;
}

- (void)setNatTraversalPort:(unsigned __int16)a3
{
  self->_natTraversalPort = a3;
}

- (unsigned)natTraversalSrcPort
{
  return self->_natTraversalSrcPort;
}

- (void)setNatTraversalSrcPort:(unsigned __int16)a3
{
  self->_natTraversalSrcPort = a3;
}

- (BOOL)sequencePerTrafficClass
{
  return self->_sequencePerTrafficClass;
}

- (void)setSequencePerTrafficClass:(BOOL)a3
{
  self->_sequencePerTrafficClass = a3;
}

- (void).cxx_destruct
{
}

- (id)createDictionary
{
  if (!a1)
  {
    id v2 = 0LL;
    return v2;
  }

  id v2 = objc_alloc_init(MEMORY[0x189603FC8]);
  if ([a1 spi])
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", bswap32(objc_msgSend(a1, "spi")));
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v3 forKeyedSubscript:@"SPIValue"];
  }

  [a1 localAddress];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    [a1 localAddress];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 hostname];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v6 forKeyedSubscript:@"LocalAddress"];

    id v7 = (void *)MEMORY[0x189607968];
    [a1 localAddress];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 port];
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v9, "integerValue"));
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v10 forKeyedSubscript:@"LocalPort"];
  }

  [a1 remoteAddress];
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    [a1 remoteAddress];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 hostname];
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v13 forKeyedSubscript:@"RemoteAddress"];

    v14 = (void *)MEMORY[0x189607968];
    [a1 remoteAddress];
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 port];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v16, "integerValue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v17 forKeyedSubscript:@"RemotePort"];
  }

  [a1 boundInterfaceName];
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    [a1 boundInterfaceName];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v19 forKeyedSubscript:@"OutgoingInterface"];
  }

  [a1 tunnelInterfaceName];
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    [a1 tunnelInterfaceName];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v21 forKeyedSubscript:@"IPSecInterface"];
  }

  if ([a1 mode] == 1)
  {
    v22 = @"Transport";
  }

  else
  {
    v22 = @"Tunnel";
  }

  [v2 setObject:v22 forKeyedSubscript:@"Mode"];
LABEL_17:
  if ([a1 protocol] == 2)
  {
    v23 = @"AH";
  }

  else
  {
    v23 = @"ESP";
  }

  [v2 setObject:v23 forKeyedSubscript:@"IPSecProtocol"];
LABEL_22:
  if ([a1 encryptionAlgorithm] == 1)
  {
    v24 = @"NULL";
  }

  else if ([a1 encryptionAlgorithm] == 2)
  {
    v24 = @"DES";
  }

  else if ([a1 encryptionAlgorithm] == 3)
  {
    v24 = @"3DES";
  }

  else if ([a1 encryptionAlgorithm] == 4)
  {
    v24 = @"AES-128";
  }

  else if ([a1 encryptionAlgorithm] == 5)
  {
    v24 = @"AES-256";
  }

  else if ([a1 encryptionAlgorithm] == 6)
  {
    v24 = @"AES-128-GCM";
  }

  else if ([a1 encryptionAlgorithm] == 7)
  {
    v24 = @"AES-256-GCM";
  }

  else if ([a1 encryptionAlgorithm] == 8)
  {
    v24 = @"ChaCha20-Poly1305";
  }

  else if ([a1 encryptionAlgorithm] == 9)
  {
    v24 = @"ChaCha20-Poly1305-IIV";
  }

  else if ([a1 encryptionAlgorithm] == 10)
  {
    v24 = @"AES-128-GCM-IIV";
  }

  else if ([a1 encryptionAlgorithm] == 11)
  {
    v24 = @"AES-256-GCM-IIV";
  }

  else if ([a1 encryptionAlgorithm] == 12)
  {
    v24 = @"NULL-With-AES-128-GMAC";
  }

  else
  {
    v24 = @"NULL-With-AES-256-GMAC";
  }

  [v2 setObject:v24 forKeyedSubscript:@"EncryptionAlgorithm"];
LABEL_49:
  [a1 encryptionKey];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 setObject:v25 forKeyedSubscript:@"EncryptionKey"];

  if ([a1 authenticationAlgorithm] == 1)
  {
    v26 = @"MD5-96";
LABEL_59:
    [v2 setObject:v26 forKeyedSubscript:@"AuthAlgorithm"];
    goto LABEL_60;
  }

  if ([a1 authenticationAlgorithm] == 2)
  {
    v26 = @"SHA1-96";
    goto LABEL_59;
  }

  if ([a1 authenticationAlgorithm] == 3)
  {
    v26 = @"SHA2-256";
    goto LABEL_59;
  }

  if ([a1 authenticationAlgorithm] == 4)
  {
    v26 = @"SHA2-384";
    goto LABEL_59;
  }

  if ([a1 authenticationAlgorithm] == 5)
  {
    v26 = @"SHA2-512";
    goto LABEL_59;
  }

@end