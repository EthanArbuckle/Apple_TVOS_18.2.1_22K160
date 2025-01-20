@interface NEIPv4Route
+ (BOOL)supportsSecureCoding;
+ (NEIPv4Route)defaultRoute;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)isDefaultRoute;
- (NEIPv4Route)initWithCoder:(id)a3;
- (NEIPv4Route)initWithDestinationAddress:(NSString *)address subnetMask:(NSString *)subnetMask;
- (NSString)destinationAddress;
- (NSString)destinationSubnetMask;
- (NSString)gatewayAddress;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setGatewayAddress:(NSString *)gatewayAddress;
@end

@implementation NEIPv4Route

- (NEIPv4Route)initWithDestinationAddress:(NSString *)address subnetMask:(NSString *)subnetMask
{
  v7 = address;
  v8 = subnetMask;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NEIPv4Route;
  v9 = -[NEIPv4Route init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_destinationAddress, address);
    objc_storeStrong((id *)&v10->_destinationSubnetMask, subnetMask);
  }

  return v10;
}

- (BOOL)isDefaultRoute
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NEIPv4Route destinationAddress](self, "destinationAddress");
  [v3 destinationAddress];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v4 isEqualToString:v5])
  {
    v6 = -[NEIPv4Route destinationSubnetMask](self, "destinationSubnetMask");
    [v3 destinationSubnetMask];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    char v8 = [v6 isEqualToString:v7];
  }

  else
  {
    char v8 = 0;
  }

  return v8;
}

- (NEIPv4Route)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NEIPv4Route;
  v5 = -[NEIPv4Route init](&v13, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DestinationAddress"];
    destinationAddress = v5->_destinationAddress;
    v5->_destinationAddress = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DestinationSubnetMask"];
    destinationSubnetMask = v5->_destinationSubnetMask;
    v5->_destinationSubnetMask = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RouteGatewayAddress"];
    gatewayAddress = v5->_gatewayAddress;
    v5->_gatewayAddress = (NSString *)v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[NEIPv4Route destinationAddress](self, "destinationAddress");
  [v4 encodeObject:v5 forKey:@"DestinationAddress"];

  -[NEIPv4Route destinationSubnetMask](self, "destinationSubnetMask");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"DestinationSubnetMask"];

  -[NEIPv4Route gatewayAddress](self, "gatewayAddress");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"RouteGatewayAddress"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[NEIPv4Route allocWithZone:](&OBJC_CLASS___NEIPv4Route, "allocWithZone:", a3);
  v5 = -[NEIPv4Route destinationAddress](self, "destinationAddress");
  -[NEIPv4Route destinationSubnetMask](self, "destinationSubnetMask");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = -[NEIPv4Route initWithDestinationAddress:subnetMask:](v4, "initWithDestinationAddress:subnetMask:", v5, v6);

  -[NEIPv4Route gatewayAddress](self, "gatewayAddress");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIPv4Route setGatewayAddress:](v7, "setGatewayAddress:", v8);

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  v5 = -[NEIPv4Route destinationAddress](self, "destinationAddress");
  if (!v5)
  {
    +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Missing IPv4Route Destination address",  v4);
    goto LABEL_9;
  }

  id v6 = -[NEIPv4Route destinationAddress](self, "destinationAddress");
  int v7 = inet_pton(2, (const char *)[v6 UTF8String], v14);

  if (!v7)
  {
    uint64_t v8 = @"Invalid IPv4Route Destination address";
    goto LABEL_7;
  }

  if (v14[0] == 127)
  {
    uint64_t v8 = @"IPv4Route Destination address is loopback";
LABEL_7:
    +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, v8, v4);
    LOBYTE(v5) = 0;
    goto LABEL_9;
  }

  LOBYTE(v5) = 1;
LABEL_9:
  v9 = -[NEIPv4Route destinationSubnetMask](self, "destinationSubnetMask");
  if (!v9) {
    +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Missing IPv4Route Destination subnetmask",  v4);
  }
  -[NEIPv4Route gatewayAddress](self, "gatewayAddress");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    id v11 = -[NEIPv4Route gatewayAddress](self, "gatewayAddress");
    int v12 = inet_pton(2, (const char *)[v11 UTF8String], v14);

    if (!v12)
    {
      +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Invalid IPv4Route Gateway address",  v4);
      LOBYTE(v5) = 0;
    }
  }

  return (char)v5;
}

- (id)copyLegacyDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  -[NEIPv4Route destinationAddress](self, "destinationAddress");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[NEIPv4Route destinationAddress](self, "destinationAddress");
    [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x18960C6F8]];
  }

  -[NEIPv4Route destinationSubnetMask](self, "destinationSubnetMask");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NEIPv4Route destinationSubnetMask](self, "destinationSubnetMask");
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x18960C710]];
  }

  -[NEIPv4Route gatewayAddress](self, "gatewayAddress");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = -[NEIPv4Route gatewayAddress](self, "gatewayAddress");
    [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x18960C700]];
  }

  return v3;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4 = (const __CFDictionary *)a3;
  v5 = -[NEIPv4Route init](self, "init");
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = CFDICTIONARY_TYPE;
      if (CFGetTypeID(v4) == v6)
      {
        uint64_t v7 = NEGetValueWithType(v4, (const void *)*MEMORY[0x18960C6F8], CFSTRING_TYPE);
        destinationAddress = v5->_destinationAddress;
        v5->_destinationAddress = (NSString *)v7;

        uint64_t v9 = NEGetValueWithType(v4, (const void *)*MEMORY[0x18960C710], CFSTRING_TYPE);
        destinationSubnetMask = v5->_destinationSubnetMask;
        v5->_destinationSubnetMask = (NSString *)v9;

        uint64_t v11 = NEGetValueWithType(v4, (const void *)*MEMORY[0x18960C700], CFSTRING_TYPE);
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
  -[NEIPv4Route destinationAddress](self, "destinationAddress");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v9 = a4 | 1;
  [v7 appendPrettyObject:v8 withName:@"destinationAddress" andIndent:v5 options:a4 | 1];

  -[NEIPv4Route destinationSubnetMask](self, "destinationSubnetMask");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v10 withName:@"destinationSubnetMask" andIndent:v5 options:a4];

  -[NEIPv4Route gatewayAddress](self, "gatewayAddress");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v11 withName:@"gatewayAddress" andIndent:v5 options:v9];

  return v7;
}

- (NSString)destinationAddress
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSString)destinationSubnetMask
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
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

+ (NEIPv4Route)defaultRoute
{
  if (initGlobals_onceToken != -1) {
    dispatch_once(&initGlobals_onceToken, &__block_literal_global_14484);
  }
  return (NEIPv4Route *)(id)NEIPv4DefaultRoute;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __26__NEIPv4Route_initGlobals__block_invoke()
{
  v0 = -[NEIPv4Route initWithDestinationAddress:subnetMask:]( objc_alloc(&OBJC_CLASS___NEIPv4Route),  "initWithDestinationAddress:subnetMask:",  @"0.0.0.0",  @"0.0.0.0");
  v1 = (void *)NEIPv4DefaultRoute;
  NEIPv4DefaultRoute = (uint64_t)v0;
}

@end