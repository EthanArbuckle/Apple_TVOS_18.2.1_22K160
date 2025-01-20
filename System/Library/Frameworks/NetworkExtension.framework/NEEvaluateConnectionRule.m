@interface NEEvaluateConnectionRule
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NEEvaluateConnectionRule)initWithCoder:(id)a3;
- (NEEvaluateConnectionRule)initWithMatchDomains:(NSArray *)domains andAction:(NEEvaluateConnectionRuleAction)action;
- (NEEvaluateConnectionRuleAction)action;
- (NSArray)matchDomains;
- (NSArray)useDNSServers;
- (NSURL)probeURL;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setProbeURL:(NSURL *)probeURL;
- (void)setUseDNSServers:(NSArray *)useDNSServers;
@end

@implementation NEEvaluateConnectionRule

- (NEEvaluateConnectionRule)initWithMatchDomains:(NSArray *)domains andAction:(NEEvaluateConnectionRuleAction)action
{
  v6 = domains;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NEEvaluateConnectionRule;
  v7 = -[NEEvaluateConnectionRule init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_action = action;
    uint64_t v9 = -[NSArray copy](v6, "copy");
    matchDomains = v8->_matchDomains;
    v8->_matchDomains = (NSArray *)v9;
  }

  return v8;
}

- (NEEvaluateConnectionRule)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NEEvaluateConnectionRule;
  v5 = -[NEEvaluateConnectionRule init](&v19, sel_init);
  if (v5)
  {
    v5->_action = (int)[v4 decodeInt32ForKey:@"Action"];
    v6 = (void *)MEMORY[0x189604010];
    uint64_t v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"MatchDomains"];
    matchDomains = v5->_matchDomains;
    v5->_matchDomains = (NSArray *)v9;

    v11 = (void *)MEMORY[0x189604010];
    uint64_t v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"UseDNSServers"];
    useDNSServers = v5->_useDNSServers;
    v5->_useDNSServers = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProbeURL"];
    probeURL = v5->_probeURL;
    v5->_probeURL = (NSURL *)v16;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (NEEvaluateConnectionRuleAction v5 = -[NEEvaluateConnectionRule action](self, "action"), v5 == [v4 action]))
  {
    v6 = -[NEEvaluateConnectionRule matchDomains](self, "matchDomains");
    [v4 matchDomains];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v6 isEqualToArray:v7])
    {
      v8 = -[NEEvaluateConnectionRule useDNSServers](self, "useDNSServers");
      [v4 useDNSServers];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v8 isEqualToArray:v9])
      {
        v10 = -[NEEvaluateConnectionRule probeURL](self, "probeURL");
        [v4 probeURL];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        char v12 = [v10 isEqual:v11];
      }

      else
      {
        char v12 = 0;
      }
    }

    else
    {
      char v12 = 0;
    }
  }

  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[NEEvaluateConnectionRule allocWithZone:](&OBJC_CLASS___NEEvaluateConnectionRule, "allocWithZone:", a3);
  -[NEEvaluateConnectionRule matchDomains](self, "matchDomains");
  NEEvaluateConnectionRuleAction v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NEEvaluateConnectionRule initWithMatchDomains:andAction:]( v4,  "initWithMatchDomains:andAction:",  v5,  -[NEEvaluateConnectionRule action](self, "action"));

  -[NEEvaluateConnectionRule useDNSServers](self, "useDNSServers");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEEvaluateConnectionRule setUseDNSServers:](v6, "setUseDNSServers:", v7);
  v8 = -[NEEvaluateConnectionRule probeURL](self, "probeURL");
  -[NEEvaluateConnectionRule setProbeURL:](v6, "setProbeURL:", v8);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEEvaluateConnectionRule action](self, "action"), @"Action");
  -[NEEvaluateConnectionRule matchDomains](self, "matchDomains");
  NEEvaluateConnectionRuleAction v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"MatchDomains"];
  v6 = -[NEEvaluateConnectionRule useDNSServers](self, "useDNSServers");
  [v4 encodeObject:v6 forKey:@"UseDNSServers"];

  -[NEEvaluateConnectionRule probeURL](self, "probeURL");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"ProbeURL"];
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (-[NEEvaluateConnectionRule action](self, "action") >= NEEvaluateConnectionRuleActionConnectIfNeeded
    && -[NEEvaluateConnectionRule action](self, "action") < (NEEvaluateConnectionRuleActionNeverConnect|NEEvaluateConnectionRuleActionConnectIfNeeded))
  {
    char v5 = 1;
  }

  else
  {
    +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Invalid connection rule action",  v4);
    char v5 = 0;
  }

  uint64_t v6 = -[NEEvaluateConnectionRule matchDomains](self, "matchDomains");
  if (v6
    && (id v7 = (void *)v6,
        -[NEEvaluateConnectionRule matchDomains](self, "matchDomains"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 count],
        v8,
        v7,
        v9))
  {
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    v10 = -[NEEvaluateConnectionRule matchDomains](self, "matchDomains");
    uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v27;
      do
      {
        uint64_t v14 = 0LL;
        do
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v10);
          }
          if ((isa_nsstring(*(void **)(*((void *)&v26 + 1) + 8 * v14)) & 1) == 0)
          {
            +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Invalid connection rule domain",  v4);
            char v5 = 0;
          }

          ++v14;
        }

        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }

      while (v12);
    }
  }

  else
  {
    +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Missing connection rule match domains",  v4);
    char v5 = 0;
  }
  v15 = -[NEEvaluateConnectionRule useDNSServers](self, "useDNSServers");
  if (v15)
  {
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    -[NEEvaluateConnectionRule useDNSServers](self, "useDNSServers", 0LL);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v23;
      do
      {
        uint64_t v20 = 0LL;
        do
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v16);
          }
          if ((isa_nsstring(*(void **)(*((void *)&v22 + 1) + 8 * v20)) & 1) == 0)
          {
            +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Invalid connection rule required DNS server",  v4);
            char v5 = 0;
          }

          ++v20;
        }

        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }

      while (v18);
    }
  }

  return v5 & 1;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  NEEvaluateConnectionRuleAction v8 = -[NEEvaluateConnectionRule action](self, "action");
  if (v8 == NEEvaluateConnectionRuleActionConnectIfNeeded)
  {
    uint64_t v9 = @"connect-if-needed";
    goto LABEL_5;
  }

  if (v8 == NEEvaluateConnectionRuleActionNeverConnect)
  {
    uint64_t v9 = @"never-connect";
LABEL_5:
    [v7 appendPrettyObject:v9 withName:@"action" andIndent:v5 options:a4];
  }
  v10 = -[NEEvaluateConnectionRule matchDomains](self, "matchDomains");
  unint64_t v11 = a4 | 1;
  [v7 appendPrettyObject:v10 withName:@"matchDomains" andIndent:v5 options:v11];

  -[NEEvaluateConnectionRule useDNSServers](self, "useDNSServers");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v12 withName:@"useDNSServers" andIndent:v5 options:v11];

  -[NEEvaluateConnectionRule probeURL](self, "probeURL");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 absoluteString];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v14 withName:@"probeURL" andIndent:v5 options:v11];

  return v7;
}

- (id)copyLegacyDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  NEEvaluateConnectionRuleAction v4 = -[NEEvaluateConnectionRule action](self, "action");
  if (v4 == NEEvaluateConnectionRuleActionConnectIfNeeded)
  {
    uint64_t v5 = (void *)MEMORY[0x18960CBE8];
  }

  else
  {
    if (v4 != NEEvaluateConnectionRuleActionNeverConnect) {
      goto LABEL_6;
    }
    uint64_t v5 = (void *)MEMORY[0x18960CBF0];
  }

  [v3 setObject:*v5 forKeyedSubscript:*MEMORY[0x18960CA50]];
LABEL_6:
  -[NEEvaluateConnectionRule matchDomains](self, "matchDomains");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NEEvaluateConnectionRule matchDomains](self, "matchDomains");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x18960CA58]];
  }

  -[NEEvaluateConnectionRule useDNSServers](self, "useDNSServers");
  NEEvaluateConnectionRuleAction v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NEEvaluateConnectionRule useDNSServers](self, "useDNSServers");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x18960CA60]];
  }
  v10 = -[NEEvaluateConnectionRule probeURL](self, "probeURL");
  if (v10)
  {
    -[NEEvaluateConnectionRule probeURL](self, "probeURL");
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 absoluteString];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v12 forKeyedSubscript:*MEMORY[0x18960CA68]];
  }

  return v3;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___NEEvaluateConnectionRule;
  uint64_t v5 = -[NEEvaluateConnectionRule init](&v27, sel_init);
  if (!v5) {
    goto LABEL_15;
  }
  [v4 objectForKeyedSubscript:*MEMORY[0x18960CA50]];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (isa_nsstring(v6))
  {
    if ([v6 isEqualToString:*MEMORY[0x18960CBE8]])
    {
      uint64_t v7 = 1LL;
LABEL_7:
      v5->_action = v7;
      goto LABEL_8;
    }

    if ([v6 isEqualToString:*MEMORY[0x18960CBF0]])
    {
      uint64_t v7 = 2LL;
      goto LABEL_7;
    }
  }

- (NEEvaluateConnectionRuleAction)action
{
  return self->_action;
}

- (NSArray)matchDomains
{
  return (NSArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSArray)useDNSServers
{
  return (NSArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setUseDNSServers:(NSArray *)useDNSServers
{
}

- (NSURL)probeURL
{
  return (NSURL *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setProbeURL:(NSURL *)probeURL
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