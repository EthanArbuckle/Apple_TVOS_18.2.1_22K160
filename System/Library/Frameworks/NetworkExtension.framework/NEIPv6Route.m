@interface NEIPv6Route
+ (BOOL)supportsSecureCoding;
+ (NEIPv6Route)defaultRoute;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)isDefaultRoute;
- (NEIPv6Route)initWithCoder:(id)a3;
- (NEIPv6Route)initWithDestinationAddress:(NSString *)address networkPrefixLength:(NSNumber *)networkPrefixLength;
- (NSNumber)destinationNetworkPrefixLength;
- (NSString)destinationAddress;
- (NSString)gatewayAddress;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setGatewayAddress:(NSString *)gatewayAddress;
@end

@implementation NEIPv6Route

- (NEIPv6Route)initWithDestinationAddress:(NSString *)address networkPrefixLength:(NSNumber *)networkPrefixLength
{
  v7 = address;
  v8 = networkPrefixLength;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NEIPv6Route;
  v9 = -[NEIPv6Route init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_destinationAddress, address);
    objc_storeStrong((id *)&v10->_destinationNetworkPrefixLength, networkPrefixLength);
  }

  return v10;
}

- (BOOL)isDefaultRoute
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NEIPv6Route destinationAddress](self, "destinationAddress");
  [v3 destinationAddress];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v4 isEqualToString:v5])
  {
    v6 = -[NEIPv6Route destinationNetworkPrefixLength](self, "destinationNetworkPrefixLength");
    [v3 destinationNetworkPrefixLength];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    char v8 = [v6 isEqualToNumber:v7];
  }

  else
  {
    char v8 = 0;
  }

  return v8;
}

- (NEIPv6Route)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NEIPv6Route;
  v5 = -[NEIPv6Route init](&v13, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DestinationAddress"];
    destinationAddress = v5->_destinationAddress;
    v5->_destinationAddress = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DestinationPrefixLength"];
    destinationNetworkPrefixLength = v5->_destinationNetworkPrefixLength;
    v5->_destinationNetworkPrefixLength = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RouteGatewayAddress"];
    gatewayAddress = v5->_gatewayAddress;
    v5->_gatewayAddress = (NSString *)v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[NEIPv6Route destinationAddress](self, "destinationAddress");
  [v4 encodeObject:v5 forKey:@"DestinationAddress"];

  -[NEIPv6Route destinationNetworkPrefixLength](self, "destinationNetworkPrefixLength");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"DestinationPrefixLength"];

  -[NEIPv6Route gatewayAddress](self, "gatewayAddress");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"RouteGatewayAddress"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[NEIPv6Route allocWithZone:](&OBJC_CLASS___NEIPv6Route, "allocWithZone:", a3);
  v5 = -[NEIPv6Route destinationAddress](self, "destinationAddress");
  -[NEIPv6Route destinationNetworkPrefixLength](self, "destinationNetworkPrefixLength");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = -[NEIPv6Route initWithDestinationAddress:networkPrefixLength:]( v4,  "initWithDestinationAddress:networkPrefixLength:",  v5,  v6);

  -[NEIPv6Route gatewayAddress](self, "gatewayAddress");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIPv6Route setGatewayAddress:](v7, "setGatewayAddress:", v8);

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  v5 = -[NEIPv6Route destinationAddress](self, "destinationAddress");
  if (!v5)
  {
    +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Missing NEIPv6Route Destination address",  v4);
    goto LABEL_9;
  }

  id v6 = -[NEIPv6Route destinationAddress](self, "destinationAddress");
  int v7 = inet_pton(30, (const char *)[v6 UTF8String], &v17);

  if (!v7)
  {
    uint64_t v8 = @"Invalid NEIPv6Route Destination address";
LABEL_8:
    +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, v8, v4);
    LOBYTE(v5) = 0;
    goto LABEL_9;
  }

  if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqq_s32(v17, (int32x4_t)xmmword_187873260)))) & 1) == 0)
  {
    uint64_t v8 = @"IPv6Route Destination address in loopback";
    goto LABEL_8;
  }

  LOBYTE(v5) = 1;
LABEL_9:
  uint64_t v9 = -[NEIPv6Route destinationNetworkPrefixLength](self, "destinationNetworkPrefixLength");
  if (!v9
    || (uint64_t v10 = (void *)v9,
        -[NEIPv6Route destinationNetworkPrefixLength](self, "destinationNetworkPrefixLength"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = [v11 integerValue],
        v11,
        v10,
        v12 >= 129))
  {
    +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Missing NEIPv6Route Destination Network Prefix Length",  v4);
  }

  -[NEIPv6Route gatewayAddress](self, "gatewayAddress");
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    id v14 = -[NEIPv6Route gatewayAddress](self, "gatewayAddress");
    int v15 = inet_pton(30, (const char *)[v14 UTF8String], &v17);

    if (!v15)
    {
      +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Invalid NEIPv6Route Gateway address",  v4);
      LOBYTE(v5) = 0;
    }
  }

  return (char)v5;
}

- (id)copyLegacyDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  -[NEIPv6Route destinationAddress](self, "destinationAddress");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[NEIPv6Route destinationAddress](self, "destinationAddress");
    [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x18960C768]];
  }

  -[NEIPv6Route destinationNetworkPrefixLength](self, "destinationNetworkPrefixLength");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NEIPv6Route destinationNetworkPrefixLength](self, "destinationNetworkPrefixLength");
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x18960C780]];
  }

  -[NEIPv6Route gatewayAddress](self, "gatewayAddress");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NEIPv6Route gatewayAddress](self, "gatewayAddress");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x18960C770]];
  }

  return v3;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4 = (const __CFDictionary *)a3;
  v5 = -[NEIPv6Route init](self, "init");
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = CFDICTIONARY_TYPE;
      if (CFGetTypeID(v4) == v6)
      {
        uint64_t v7 = NEGetValueWithType(v4, (const void *)*MEMORY[0x18960C768], CFSTRING_TYPE);
        destinationAddress = v5->_destinationAddress;
        v5->_destinationAddress = (NSString *)v7;

        uint64_t v9 = NEGetValueWithType(v4, (const void *)*MEMORY[0x18960C780], CFNUMBER_TYPE);
        destinationNetworkPrefixLength = v5->_destinationNetworkPrefixLength;
        v5->_destinationNetworkPrefixLength = (NSNumber *)v9;

        uint64_t v11 = NEGetValueWithType(v4, (const void *)*MEMORY[0x18960C770], CFSTRING_TYPE);
        gatewayAddress = v5->_gatewayAddress;
        v5->_gatewayAddress = (NSString *)v11;
      }
    }
  }

  return v5;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  -[NEIPv6Route destinationAddress](self, "destinationAddress");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v9 = a4 | 1;
  [v7 appendPrettyObject:v8 withName:@"destinationAddress" andIndent:v5 options:a4 | 1];

  -[NEIPv6Route destinationNetworkPrefixLength](self, "destinationNetworkPrefixLength");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v10 withName:@"destinationNetworkPrefixLength" andIndent:v5 options:a4];

  -[NEIPv6Route gatewayAddress](self, "gatewayAddress");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v11 withName:@"gatewayAddress" andIndent:v5 options:v9];

  return v7;
}

- (NSString)destinationAddress
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSNumber)destinationNetworkPrefixLength
{
  return (NSNumber *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSString)gatewayAddress
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setGatewayAddress:(NSString *)gatewayAddress
{
}

- (void).cxx_destruct
{
}

+ (NEIPv6Route)defaultRoute
{
  if (initGlobals_onceToken_14691 != -1) {
    dispatch_once(&initGlobals_onceToken_14691, &__block_literal_global_14692);
  }
  return (NEIPv6Route *)(id)NEIPv6DefaultRoute;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __26__NEIPv6Route_initGlobals__block_invoke()
{
  v0 = -[NEIPv6Route initWithDestinationAddress:networkPrefixLength:]( objc_alloc(&OBJC_CLASS___NEIPv6Route),  "initWithDestinationAddress:networkPrefixLength:",  @"::",  &unk_18A0CF9D8);
  v1 = (void *)NEIPv6DefaultRoute;
  NEIPv6DefaultRoute = (uint64_t)v0;
}

@end