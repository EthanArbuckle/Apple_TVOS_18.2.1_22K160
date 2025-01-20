@interface NEEthernetTunnelNetworkSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (NEEthernetTunnelNetworkSettings)initWithCoder:(id)a3;
- (NEEthernetTunnelNetworkSettings)initWithTunnelRemoteAddress:(NSString *)address ethernetAddress:(NSString *)ethernetAddress mtu:(NSInteger)mtu;
- (NSString)ethernetAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setEthernetAddress:(id)a3;
@end

@implementation NEEthernetTunnelNetworkSettings

- (NEEthernetTunnelNetworkSettings)initWithTunnelRemoteAddress:(NSString *)address ethernetAddress:(NSString *)ethernetAddress mtu:(NSInteger)mtu
{
  v9 = ethernetAddress;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___NEEthernetTunnelNetworkSettings;
  v10 = -[NETunnelNetworkSettings initWithTunnelRemoteAddress:](&v14, sel_initWithTunnelRemoteAddress_, address);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_ethernetAddress, ethernetAddress);
    [MEMORY[0x189607968] numberWithInteger:mtu];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEPacketTunnelNetworkSettings setMTU:](v11, "setMTU:", v12);
  }

  return v11;
}

- (NEEthernetTunnelNetworkSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NEEthernetTunnelNetworkSettings;
  v5 = -[NEPacketTunnelNetworkSettings initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ethernetAddress"];
    ethernetAddress = v5->_ethernetAddress;
    v5->_ethernetAddress = (NSString *)v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NEEthernetTunnelNetworkSettings;
  id v4 = a3;
  -[NEPacketTunnelNetworkSettings encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  v5 = -[NEEthernetTunnelNetworkSettings ethernetAddress](self, "ethernetAddress", v6.receiver, v6.super_class);
  [v4 encodeObject:v5 forKey:@"ethernetAddress"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NEEthernetTunnelNetworkSettings;
  id v4 = -[NEPacketTunnelNetworkSettings copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = -[NEEthernetTunnelNetworkSettings ethernetAddress](self, "ethernetAddress");
  [v4 setEthernetAddress:v5];

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NEEthernetTunnelNetworkSettings;
  BOOL v5 = -[NEPacketTunnelNetworkSettings checkValidityAndCollectErrors:](&v13, sel_checkValidityAndCollectErrors_, v4);
  -[NEEthernetTunnelNetworkSettings ethernetAddress](self, "ethernetAddress");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"No MAC address was specified",  v4);
    BOOL v5 = 0;
  }

  -[NEEthernetTunnelNetworkSettings ethernetAddress](self, "ethernetAddress");
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
  createEthernetAddressFromString(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, @"Invalid ethernet address", v4);
    BOOL v5 = 0;
  }

  -[NEPacketTunnelNetworkSettings MTU](self, "MTU");
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, @"No MTU was specified", v4);
    BOOL v5 = 0;
  }
  v10 = -[NEPacketTunnelNetworkSettings MTU](self, "MTU");
  int v11 = [v10 unsignedIntValue];

  if (!v11)
  {
    +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Invalid MTU, the MTU must be greater than 0",  v4);
    BOOL v5 = 0;
  }

  return v5;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc(MEMORY[0x189607940]);
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NEEthernetTunnelNetworkSettings;
  v8 = -[NEPacketTunnelNetworkSettings descriptionWithIndent:options:](&v12, sel_descriptionWithIndent_options_, v5, a4);
  objc_super v9 = (void *)[v7 initWithString:v8];
  v10 = -[NEEthernetTunnelNetworkSettings ethernetAddress](self, "ethernetAddress");
  [v9 appendPrettyObject:v10 withName:@"ethernetAddress" andIndent:v5 options:a4];

  return v9;
}

- (NSString)ethernetAddress
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setEthernetAddress:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end