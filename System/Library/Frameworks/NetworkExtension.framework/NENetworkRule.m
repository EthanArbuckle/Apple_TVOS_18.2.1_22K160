@interface NENetworkRule
+ (BOOL)supportsSecureCoding;
- (BOOL)appliesToLoopback;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (NENetworkRule)initWithCoder:(id)a3;
- (NENetworkRule)initWithDestinationHost:(NWHostEndpoint *)hostEndpoint protocol:(NENetworkRuleProtocol)protocol;
- (NENetworkRule)initWithDestinationHostEndpoint:(id)a3 protocol:(int64_t)a4;
- (NENetworkRule)initWithDestinationNetwork:(NWHostEndpoint *)networkEndpoint prefix:(NSUInteger)destinationPrefix protocol:(NENetworkRuleProtocol)protocol;
- (NENetworkRule)initWithDestinationNetworkEndpoint:(id)a3 prefix:(unint64_t)a4 protocol:(int64_t)a5;
- (NENetworkRule)initWithRemoteNetwork:(NWHostEndpoint *)remoteNetwork remotePrefix:(NSUInteger)remotePrefix localNetwork:(NWHostEndpoint *)localNetwork localPrefix:(NSUInteger)localPrefix protocol:(NENetworkRuleProtocol)protocol direction:(NETrafficDirection)direction;
- (NENetworkRule)initWithRemoteNetworkEndpoint:(id)a3 remotePrefix:(unint64_t)a4 localNetworkEndpoint:(id)a5 localPrefix:(unint64_t)a6 protocol:(int64_t)a7 direction:(int64_t)a8;
- (NENetworkRuleProtocol)matchProtocol;
- (NETrafficDirection)matchDirection;
- (NSUInteger)matchLocalPrefix;
- (NSUInteger)matchRemotePrefix;
- (NWHostEndpoint)matchLocalNetwork;
- (NWHostEndpoint)matchRemoteEndpoint;
- (OS_nw_endpoint)matchLocalNetworkEndpoint;
- (OS_nw_endpoint)matchRemoteHostOrNetworkEndpoint;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NENetworkRule

- (NENetworkRule)initWithDestinationNetworkEndpoint:(id)a3 prefix:(unint64_t)a4 protocol:(int64_t)a5
{
  id v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NENetworkRule;
  v10 = -[NENetworkRule init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_matchRemoteHostOrNetworkEndpoint, a3);
    v11->_matchRemotePrefix = a4;
    v11->_matchLocalPrefix = 0x7FFFFFFFFFFFFFFFLL;
    v11->_matchProtocol = a5;
    v11->_matchDirection = 2LL;
    matchRemoteHostOrNetworkEndpoint = v11->_matchRemoteHostOrNetworkEndpoint;
    if (matchRemoteHostOrNetworkEndpoint)
    {
      if (nw_endpoint_get_type(matchRemoteHostOrNetworkEndpoint) == nw_endpoint_type_address)
      {
        address = (sockaddr *)nw_endpoint_get_address(v11->_matchRemoteHostOrNetworkEndpoint);
        BOOL v14 = NEIsLoopbackAddress(&address->sa_len);
      }

      else
      {
        BOOL v14 = 0;
      }

      v11->_appliesToLoopback = v14;
    }
  }

  return v11;
}

- (NENetworkRule)initWithDestinationNetwork:(NWHostEndpoint *)networkEndpoint prefix:(NSUInteger)destinationPrefix protocol:(NENetworkRuleProtocol)protocol
{
  v8 = (void *)-[NWHostEndpoint copyCEndpoint](networkEndpoint, "copyCEndpoint");
  id v9 = -[NENetworkRule initWithDestinationNetworkEndpoint:prefix:protocol:]( self,  "initWithDestinationNetworkEndpoint:prefix:protocol:",  v8,  destinationPrefix,  protocol);

  return v9;
}

- (NENetworkRule)initWithDestinationHostEndpoint:(id)a3 protocol:(int64_t)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___NENetworkRule;
  v8 = -[NENetworkRule init](&v14, sel_init);
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_matchRemoteHostOrNetworkEndpoint, a3);
    v9->_matchRemotePrefix = 0x7FFFFFFFFFFFFFFFLL;
    v9->_matchLocalPrefix = 0x7FFFFFFFFFFFFFFFLL;
    v9->_matchProtocol = a4;
    v9->_matchDirection = 2LL;
    matchRemoteHostOrNetworkEndpoint = v9->_matchRemoteHostOrNetworkEndpoint;
    if (matchRemoteHostOrNetworkEndpoint)
    {
      if (nw_endpoint_get_type(matchRemoteHostOrNetworkEndpoint) == nw_endpoint_type_address)
      {
        address = (sockaddr *)nw_endpoint_get_address(v9->_matchRemoteHostOrNetworkEndpoint);
        BOOL v12 = NEIsLoopbackAddress(&address->sa_len);
      }

      else
      {
        BOOL v12 = 0;
      }

      v9->_appliesToLoopback = v12;
    }
  }

  return v9;
}

- (NENetworkRule)initWithDestinationHost:(NWHostEndpoint *)hostEndpoint protocol:(NENetworkRuleProtocol)protocol
{
  v6 = (void *)-[NWHostEndpoint copyCEndpoint](hostEndpoint, "copyCEndpoint");
  id v7 = -[NENetworkRule initWithDestinationHostEndpoint:protocol:]( self,  "initWithDestinationHostEndpoint:protocol:",  v6,  protocol);

  return v7;
}

- (NENetworkRule)initWithRemoteNetworkEndpoint:(id)a3 remotePrefix:(unint64_t)a4 localNetworkEndpoint:(id)a5 localPrefix:(unint64_t)a6 protocol:(int64_t)a7 direction:(int64_t)a8
{
  id v15 = a5;
  objc_super v16 = -[NENetworkRule initWithDestinationNetworkEndpoint:prefix:protocol:]( self,  "initWithDestinationNetworkEndpoint:prefix:protocol:",  a3,  a4,  a7);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_matchLocalNetworkEndpoint, a5);
    matchLocalNetworkEndpoint = v17->_matchLocalNetworkEndpoint;
    if (matchLocalNetworkEndpoint)
    {
      v17->_matchLocalPrefix = a6;
      if (!v17->_appliesToLoopback)
      {
        if (nw_endpoint_get_type(matchLocalNetworkEndpoint) == nw_endpoint_type_address)
        {
          address = (sockaddr *)nw_endpoint_get_address(v17->_matchLocalNetworkEndpoint);
          BOOL v20 = NEIsLoopbackAddress(&address->sa_len);
        }

        else
        {
          BOOL v20 = 0;
        }

        v17->_appliesToLoopback = v20;
      }
    }

    v17->_matchDirection = a8;
  }

  return v17;
}

- (NENetworkRule)initWithRemoteNetwork:(NWHostEndpoint *)remoteNetwork remotePrefix:(NSUInteger)remotePrefix localNetwork:(NWHostEndpoint *)localNetwork localPrefix:(NSUInteger)localPrefix protocol:(NENetworkRuleProtocol)protocol direction:(NETrafficDirection)direction
{
  objc_super v14 = localNetwork;
  id v15 = (void *)-[NWHostEndpoint copyCEndpoint](remoteNetwork, "copyCEndpoint");
  objc_super v16 = (void *)-[NWHostEndpoint copyCEndpoint](v14, "copyCEndpoint");

  v17 = -[NENetworkRule initWithRemoteNetworkEndpoint:remotePrefix:localNetworkEndpoint:localPrefix:protocol:direction:]( self,  "initWithRemoteNetworkEndpoint:remotePrefix:localNetworkEndpoint:localPrefix:protocol:direction:",  v15,  remotePrefix,  v16,  localPrefix,  protocol,  direction);
  return v17;
}

- (NWHostEndpoint)matchRemoteEndpoint
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x189608DF0];
    v5 = -[NENetworkRule matchRemoteHostOrNetworkEndpoint](self, "matchRemoteHostOrNetworkEndpoint");
    [v4 endpointWithCEndpoint:v5];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v6 = 0LL;
  }

  return (NWHostEndpoint *)v6;
}

- (NWHostEndpoint)matchLocalNetwork
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x189608DF0];
    v5 = -[NENetworkRule matchLocalNetworkEndpoint](self, "matchLocalNetworkEndpoint");
    [v4 endpointWithCEndpoint:v5];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v6 = 0LL;
  }

  return (NWHostEndpoint *)v6;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  matchLocalNetworkEndpoint = self->_matchLocalNetworkEndpoint;
  if (matchLocalNetworkEndpoint)
  {
    nw_endpoint_type_t type = nw_endpoint_get_type(matchLocalNetworkEndpoint);
    BOOL v7 = type == nw_endpoint_type_address;
    if (type != nw_endpoint_type_address)
    {
      id v8 = objc_alloc(NSString);
      NEResourcesCopyLocalizedNSString( @"NETWORK_RULE_ERROR_INVALID_LOCAL_NETWORK_ADDRESS",  @"NETWORK_RULE_ERROR_INVALID_LOCAL_NETWORK_ADDRESS");
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      [NSString stringWithUTF8String:nw_endpoint_get_hostname(self->_matchLocalNetworkEndpoint)];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v8, "initWithFormat:", v9, v10);
      [v4 addObject:v11];
    }

    matchRemoteHostOrNetworkEndpoint = self->_matchRemoteHostOrNetworkEndpoint;
    if (matchRemoteHostOrNetworkEndpoint
      && nw_endpoint_get_type(matchRemoteHostOrNetworkEndpoint) != nw_endpoint_type_address)
    {
      id v13 = objc_alloc(NSString);
      NEResourcesCopyLocalizedNSString( @"NETWORK_RULE_ERROR_INVALID_REMOTE_NETWORK_ADDRESS",  @"NETWORK_RULE_ERROR_INVALID_REMOTE_NETWORK_ADDRESS");
      objc_super v14 = (void *)objc_claimAutoreleasedReturnValue();
      [NSString stringWithUTF8String:nw_endpoint_get_hostname(self->_matchRemoteHostOrNetworkEndpoint)];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_super v16 = (void *)objc_msgSend(v13, "initWithFormat:", v14, v15);
      [v4 addObject:v16];

      BOOL v7 = 0;
    }
  }

  else
  {
    BOOL v7 = 1;
  }

  v17 = self->_matchRemoteHostOrNetworkEndpoint;
  if (v17 && nw_endpoint_get_type(v17) == nw_endpoint_type_host)
  {
    [MEMORY[0x189607810] characterSetWithCharactersInString:@"*."];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:nw_endpoint_get_hostname(self->_matchRemoteHostOrNetworkEndpoint)];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 stringByTrimmingCharactersInSet:v18];
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (![v20 length])
    {
      id v21 = objc_alloc(NSString);
      NEResourcesCopyLocalizedNSString( @"NETWORK_RULE_ERROR_INVALID_DOMAIN",  @"NETWORK_RULE_ERROR_INVALID_DOMAIN");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      [NSString stringWithUTF8String:nw_endpoint_get_hostname(self->_matchRemoteHostOrNetworkEndpoint)];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v21, "initWithFormat:", v22, v23);
      [v4 addObject:v24];

      BOOL v7 = 0;
    }
  }

  if (self->_matchProtocol >= 3uLL)
  {
    id v25 = objc_alloc(NSString);
    NEResourcesCopyLocalizedNSString( @"NETWORK_RULE_ERROR_INVALID_PROTOCOL",  @"NETWORK_RULE_ERROR_INVALID_PROTOCOL");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v25, "initWithFormat:", v26, self->_matchProtocol);
    [v4 addObject:v27];

    BOOL v7 = 0;
  }

  v28 = self->_matchRemoteHostOrNetworkEndpoint;
  if (v28 && nw_endpoint_get_type(v28) == nw_endpoint_type_address)
  {
    int sa_family = nw_endpoint_get_address(self->_matchRemoteHostOrNetworkEndpoint)->sa_family;
    unint64_t v30 = sa_family == 2 ? 32LL : (unint64_t)(sa_family == 30) << 7;
    unint64_t matchRemotePrefix = self->_matchRemotePrefix;
    if (matchRemotePrefix == 0x7FFFFFFFFFFFFFFFLL || matchRemotePrefix > v30)
    {
      id v32 = objc_alloc(NSString);
      NEResourcesCopyLocalizedNSString( @"NETWORK_RULE_ERROR_INVALID_PREFIX",  @"NETWORK_RULE_ERROR_INVALID_PREFIX");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v32, "initWithFormat:", v33, self->_matchRemotePrefix, v30);
      [v4 addObject:v34];

      BOOL v7 = 0;
    }
  }

  if (self->_matchDirection >= 3uLL)
  {
    id v35 = objc_alloc(NSString);
    NEResourcesCopyLocalizedNSString( @"NETWORK_RULE_ERROR_INVALID_DIRECTION",  @"NETWORK_RULE_ERROR_INVALID_DIRECTION");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v35, "initWithFormat:", v36, self->_matchDirection);
    [v4 addObject:v37];

    BOOL v7 = 0;
  }

  return v7;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  BOOL v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  id v8 = v7;
  unint64_t v9 = a4 & 0xFFFFFFFFFFFFFFF7LL;
  matchRemoteHostOrNetworkEndpoint = self->_matchRemoteHostOrNetworkEndpoint;
  if (matchRemoteHostOrNetworkEndpoint) {
    [v7 appendPrettyObject:matchRemoteHostOrNetworkEndpoint withName:@"matchRemoteEndpoint" andIndent:v5 options:v9];
  }
  unint64_t matchRemotePrefix = self->_matchRemotePrefix;
  if (matchRemotePrefix != 0x7FFFFFFFFFFFFFFFLL) {
    [v8 appendPrettyInt:matchRemotePrefix withName:@"matchRemotePrefix" andIndent:v5 options:v9];
  }
  matchLocalNetworkEndpoint = self->_matchLocalNetworkEndpoint;
  if (matchLocalNetworkEndpoint) {
    [v8 appendPrettyObject:matchLocalNetworkEndpoint withName:@"matchLocalNetwork" andIndent:v5 options:v9];
  }
  unint64_t matchLocalPrefix = self->_matchLocalPrefix;
  if (matchLocalPrefix != 0x7FFFFFFFFFFFFFFFLL) {
    [v8 appendPrettyInt:matchLocalPrefix withName:@"matchLocalPrefix" andIndent:v5 options:v9];
  }
  unint64_t matchProtocol = self->_matchProtocol;
  if (matchProtocol > 2) {
    objc_msgSend(v8, "appendPrettyInt:withName:andIndent:options:");
  }
  else {
    [v8 appendPrettyObject:off_18A08B0A0[matchProtocol] withName:@"matchProtocol" andIndent:v5 options:v9];
  }
  unint64_t matchDirection = self->_matchDirection;
  if (matchDirection > 2) {
    objc_super v16 = 0LL;
  }
  else {
    objc_super v16 = off_18A08B0B8[matchDirection];
  }
  [v8 appendPrettyObject:v16 withName:@"matchDirection" andIndent:v5 options:v9];
  [v8 appendPrettyBOOL:self->_appliesToLoopback withName:@"appliesToLoopback" andIndent:v5 options:v9];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  if (self->_matchRemoteHostOrNetworkEndpoint)
  {
    objc_msgSend(MEMORY[0x189608DF0], "endpointWithCEndpoint:");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 encodeObject:v4 forKey:@"destinationEndpoint"];
  }

  [v6 encodeInteger:self->_matchRemotePrefix forKey:@"destinationPrefix"];
  if (self->_matchLocalNetworkEndpoint)
  {
    objc_msgSend(MEMORY[0x189608DF0], "endpointWithCEndpoint:");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 encodeObject:v5 forKey:@"localNetwork"];
  }

  [v6 encodeInteger:self->_matchLocalPrefix forKey:@"localPrefix"];
  [v6 encodeInteger:self->_matchProtocol forKey:@"protocol"];
  [v6 encodeInteger:self->_matchDirection forKey:@"direction"];
  [v6 encodeBool:self->_appliesToLoopback forKey:@"loopback"];
}

- (NENetworkRule)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NENetworkRule;
  uint64_t v5 = -[NENetworkRule init](&v13, sel_init);
  if (v5)
  {
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"destinationEndpoint"];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 copyCEndpoint];
    matchRemoteHostOrNetworkEndpoint = v5->_matchRemoteHostOrNetworkEndpoint;
    v5->_matchRemoteHostOrNetworkEndpoint = (OS_nw_endpoint *)v7;

    v5->_unint64_t matchRemotePrefix = [v4 decodeIntegerForKey:@"destinationPrefix"];
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localNetwork"];
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 copyCEndpoint];
    matchLocalNetworkEndpoint = v5->_matchLocalNetworkEndpoint;
    v5->_matchLocalNetworkEndpoint = (OS_nw_endpoint *)v10;

    v5->_unint64_t matchLocalPrefix = [v4 decodeIntegerForKey:@"localPrefix"];
    v5->_unint64_t matchProtocol = [v4 decodeIntegerForKey:@"protocol"];
    v5->_unint64_t matchDirection = [v4 decodeIntegerForKey:@"direction"];
    v5->_appliesToLoopback = [v4 decodeBoolForKey:@"loopback"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[NENetworkRule init](+[NENetworkRule allocWithZone:](&OBJC_CLASS___NENetworkRule, "allocWithZone:", a3), "init");
  objc_storeStrong((id *)&v4->_matchRemoteHostOrNetworkEndpoint, self->_matchRemoteHostOrNetworkEndpoint);
  v4->_unint64_t matchRemotePrefix = self->_matchRemotePrefix;
  objc_storeStrong((id *)&v4->_matchLocalNetworkEndpoint, self->_matchLocalNetworkEndpoint);
  v4->_unint64_t matchLocalPrefix = self->_matchLocalPrefix;
  v4->_unint64_t matchProtocol = self->_matchProtocol;
  v4->_unint64_t matchDirection = self->_matchDirection;
  v4->_appliesToLoopback = self->_appliesToLoopback;
  return v4;
}

- (OS_nw_endpoint)matchRemoteHostOrNetworkEndpoint
{
  return (OS_nw_endpoint *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSUInteger)matchRemotePrefix
{
  return self->_matchRemotePrefix;
}

- (OS_nw_endpoint)matchLocalNetworkEndpoint
{
  return (OS_nw_endpoint *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSUInteger)matchLocalPrefix
{
  return self->_matchLocalPrefix;
}

- (NENetworkRuleProtocol)matchProtocol
{
  return self->_matchProtocol;
}

- (NETrafficDirection)matchDirection
{
  return self->_matchDirection;
}

- (BOOL)appliesToLoopback
{
  return self->_appliesToLoopback;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end