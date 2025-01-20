@interface NEFilterRule
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (NEAppRule)appRule;
- (NEFilterAction)action;
- (NEFilterRule)initWithCoder:(id)a3;
- (NEFilterRule)initWithNetworkRule:(NENetworkRule *)networkRule action:(NEFilterAction)action;
- (NENetworkRule)networkRule;
- (NSUUID)effectiveUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NEFilterRule

- (NEFilterRule)initWithNetworkRule:(NENetworkRule *)networkRule action:(NEFilterAction)action
{
  v6 = networkRule;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NEFilterRule;
  v7 = -[NEFilterRule init](&v11, sel_init);
  if (v7)
  {
    uint64_t v8 = -[NENetworkRule copy](v6, "copy");
    v9 = v7->_networkRule;
    v7->_networkRule = (NENetworkRule *)v8;

    v7->_action = action;
  }

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[NENetworkRule checkValidityAndCollectErrors:](self->_networkRule, "checkValidityAndCollectErrors:", v4);
  uint64_t v6 = -[NENetworkRule matchRemoteHostOrNetworkEndpoint](self->_networkRule, "matchRemoteHostOrNetworkEndpoint");
  if (v6)
  {
    v7 = (void *)v6;
    -[NENetworkRule matchRemoteHostOrNetworkEndpoint](self->_networkRule, "matchRemoteHostOrNetworkEndpoint");
    uint64_t v8 = (nw_endpoint *)objc_claimAutoreleasedReturnValue();
    nw_endpoint_type_t type = nw_endpoint_get_type(v8);

    if (type == nw_endpoint_type_address)
    {
      -[NENetworkRule matchRemoteHostOrNetworkEndpoint](self->_networkRule, "matchRemoteHostOrNetworkEndpoint");
      v10 = (nw_endpoint *)objc_claimAutoreleasedReturnValue();
      int port = nw_endpoint_get_port(v10);

      if (!port)
      {
        -[NENetworkRule matchRemoteHostOrNetworkEndpoint](self->_networkRule, "matchRemoteHostOrNetworkEndpoint");
        v12 = (nw_endpoint *)objc_claimAutoreleasedReturnValue();
        address = (sockaddr *)nw_endpoint_get_address(v12);
        if (NEIsWildcardAddress(&address->sa_len)
          && -[NENetworkRule matchProtocol](self->_networkRule, "matchProtocol") == NENetworkRuleProtocolAny)
        {
          NETrafficDirection v15 = -[NENetworkRule matchDirection](self->_networkRule, "matchDirection");

          if (v15) {
            goto LABEL_7;
          }
          NEResourcesCopyLocalizedNSString( @"FILTER_RULE_INVALID_NETWORK_RULE",  @"FILTER_RULE_INVALID_NETWORK_RULE");
          v12 = (nw_endpoint *)objc_claimAutoreleasedReturnValue();
          [v4 addObject:v12];
          BOOL v5 = 0;
        }
      }
    }
  }

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x189607940]);
  [v7 appendPrettyObject:self->_networkRule withName:@"networkRule" andIndent:v5 options:a4];
  +[NEFilterProvider descriptionForAction:]((uint64_t)&OBJC_CLASS___NEFilterProvider, self->_action);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v8 withName:@"action" andIndent:v5 options:a4];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  networkRule = self->_networkRule;
  id v5 = a3;
  [v5 encodeObject:networkRule forKey:@"rule"];
  [v5 encodeInteger:self->_action forKey:@"action"];
}

- (NEFilterRule)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NEFilterRule;
  id v5 = -[NEFilterRule init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rule"];
    networkRule = v5->_networkRule;
    v5->_networkRule = (NENetworkRule *)v6;

    v5->_action = [v4 decodeIntegerForKey:@"action"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NEFilterRule initWithNetworkRule:action:]( +[NEFilterRule allocWithZone:](&OBJC_CLASS___NEFilterRule, "allocWithZone:", a3),  "initWithNetworkRule:action:",  self->_networkRule,  self->_action);
}

- (NENetworkRule)networkRule
{
  return (NENetworkRule *)objc_getProperty(self, a2, 8LL, 1);
}

- (NEFilterAction)action
{
  return self->_action;
}

- (NEAppRule)appRule
{
  return (NEAppRule *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSUUID)effectiveUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end