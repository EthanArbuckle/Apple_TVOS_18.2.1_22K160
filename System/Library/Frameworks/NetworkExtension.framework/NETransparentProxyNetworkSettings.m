@interface NETransparentProxyNetworkSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)isFullyTransparent;
- (NETransparentProxyNetworkSettings)initWithCoder:(id)a3;
- (NSArray)excludedNetworkRules;
- (NSArray)includedNetworkRules;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (uint64_t)validateNetworkRule:(void *)a3 collectErrors:;
- (void)encodeWithCoder:(id)a3;
- (void)setExcludedNetworkRules:(NSArray *)excludedNetworkRules;
- (void)setIncludedNetworkRules:(NSArray *)includedNetworkRules;
- (void)setIsFullyTransparent:(BOOL)a3;
@end

@implementation NETransparentProxyNetworkSettings

- (NETransparentProxyNetworkSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NETransparentProxyNetworkSettings;
  v5 = -[NETunnelNetworkSettings initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x189604010];
    uint64_t v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"included-rules"];
    includedNetworkRules = v5->_includedNetworkRules;
    v5->_includedNetworkRules = (NSArray *)v9;

    v11 = (void *)MEMORY[0x189604010];
    uint64_t v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"excluded-rules"];
    excludedNetworkRules = v5->_excludedNetworkRules;
    v5->_excludedNetworkRules = (NSArray *)v14;

    v5->_isFullyTransparent = [v4 decodeBoolForKey:@"is-fully-transparent"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NETransparentProxyNetworkSettings;
  id v4 = a3;
  -[NETunnelNetworkSettings encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  v5 = -[NETransparentProxyNetworkSettings includedNetworkRules](self, "includedNetworkRules", v7.receiver, v7.super_class);
  [v4 encodeObject:v5 forKey:@"included-rules"];
  v6 = -[NETransparentProxyNetworkSettings excludedNetworkRules](self, "excludedNetworkRules");
  [v4 encodeObject:v6 forKey:@"excluded-rules"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[NETransparentProxyNetworkSettings isFullyTransparent](self, "isFullyTransparent"),  @"is-fully-transparent");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NETransparentProxyNetworkSettings;
  id v4 = -[NETunnelNetworkSettings copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[NETransparentProxyNetworkSettings includedNetworkRules](self, "includedNetworkRules");
  [v4 setIncludedNetworkRules:v5];
  v6 = -[NETransparentProxyNetworkSettings excludedNetworkRules](self, "excludedNetworkRules");
  [v4 setExcludedNetworkRules:v6];

  objc_msgSend( v4,  "setIsFullyTransparent:",  -[NETransparentProxyNetworkSettings isFullyTransparent](self, "isFullyTransparent"));
  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___NETransparentProxyNetworkSettings;
  unsigned int v5 = -[NETunnelNetworkSettings checkValidityAndCollectErrors:](&v25, sel_checkValidityAndCollectErrors_, v4);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  v6 = -[NETransparentProxyNetworkSettings includedNetworkRules](self, "includedNetworkRules");
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        v5 &= -[NETransparentProxyNetworkSettings validateNetworkRule:collectErrors:]( (uint64_t)self,  *(void **)(*((void *)&v21 + 1) + 8 * i),  v4);
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }

    while (v8);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v11 = -[NETransparentProxyNetworkSettings excludedNetworkRules](self, "excludedNetworkRules", 0LL);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0LL; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        v5 &= -[NETransparentProxyNetworkSettings validateNetworkRule:collectErrors:]( (uint64_t)self,  *(void **)(*((void *)&v17 + 1) + 8 * j),  v4);
      }

      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v26 count:16];
    }

    while (v13);
  }

  return v5;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc(MEMORY[0x189607940]);
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NETransparentProxyNetworkSettings;
  -[NETunnelNetworkSettings descriptionWithIndent:options:](&v13, sel_descriptionWithIndent_options_, v5, a4);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = (void *)[v7 initWithString:v8];
  v10 = -[NETransparentProxyNetworkSettings includedNetworkRules](self, "includedNetworkRules");
  [v9 appendPrettyObject:v10 withName:@"includedNetworkRules" andIndent:v5 options:a4 | 1];
  v11 = -[NETransparentProxyNetworkSettings excludedNetworkRules](self, "excludedNetworkRules");
  [v9 appendPrettyObject:v11 withName:@"excludedNetworkRules" andIndent:v5 options:a4 | 1];

  objc_msgSend( v9,  "appendPrettyBOOL:withName:andIndent:options:",  -[NETransparentProxyNetworkSettings isFullyTransparent](self, "isFullyTransparent"),  @"isFullyTransparent",  v5,  a4 | 8);
  return v9;
}

- (NSArray)includedNetworkRules
{
  return (NSArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setIncludedNetworkRules:(NSArray *)includedNetworkRules
{
}

- (NSArray)excludedNetworkRules
{
  return (NSArray *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setExcludedNetworkRules:(NSArray *)excludedNetworkRules
{
}

- (BOOL)isFullyTransparent
{
  return self->_isFullyTransparent;
}

- (void)setIsFullyTransparent:(BOOL)a3
{
  self->_isFullyTransparent = a3;
}

- (void).cxx_destruct
{
}

- (uint64_t)validateNetworkRule:(void *)a3 collectErrors:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    a1 = [v5 checkValidityAndCollectErrors:v6];
    uint64_t v7 = [v5 matchRemoteHostOrNetworkEndpoint];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      [v5 matchRemoteHostOrNetworkEndpoint];
      uint64_t v9 = (nw_endpoint *)objc_claimAutoreleasedReturnValue();
      nw_endpoint_type_t type = nw_endpoint_get_type(v9);

      if (type == nw_endpoint_type_address)
      {
        [v5 matchRemoteHostOrNetworkEndpoint];
        v11 = (nw_endpoint *)objc_claimAutoreleasedReturnValue();
        int port = nw_endpoint_get_port(v11);

        if (!port)
        {
          [v5 matchRemoteHostOrNetworkEndpoint];
          objc_super v13 = (nw_endpoint *)objc_claimAutoreleasedReturnValue();
          address = (sockaddr *)nw_endpoint_get_address(v13);
          BOOL v15 = NEIsWildcardAddress(&address->sa_len);

          if (v15)
          {
            NEResourcesCopyLocalizedNSString( @"NETWORK_RULE_ERROR_INVALID_ADDRESS",  @"NETWORK_RULE_ERROR_INVALID_ADDRESS");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            [v6 addObject:v16];

            a1 = 0LL;
          }
        }

        [v5 matchRemoteHostOrNetworkEndpoint];
        __int128 v17 = (nw_endpoint *)objc_claimAutoreleasedReturnValue();
        int v18 = nw_endpoint_get_port(v17);

        if (v18 == 53)
        {
          NEResourcesCopyLocalizedNSString( @"NETWORK_RULE_ERROR_INVALID_PORT",  @"NETWORK_RULE_ERROR_INVALID_PORT");
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
          [v6 addObject:v19];

          a1 = 0LL;
        }
      }
    }

    [v5 matchLocalNetworkEndpoint];
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      NEResourcesCopyLocalizedNSString( @"NETWORK_RULE_ERROR_INVALID_LOCAL_NETWORK",  @"NETWORK_RULE_ERROR_INVALID_LOCAL_NETWORK");
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 addObject:v21];

      a1 = 0LL;
    }

    if ([v5 matchDirection] != 2)
    {
      NEResourcesCopyLocalizedNSString( @"NETWORK_RULE_ERROR_UNSUPPORTED_DIRECTION",  @"NETWORK_RULE_ERROR_UNSUPPORTED_DIRECTION");
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 addObject:v22];

      a1 = 0LL;
    }
  }

  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end