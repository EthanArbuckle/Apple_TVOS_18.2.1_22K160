@interface NEOnDemandRule
+ (BOOL)supportsSecureCoding;
+ (id)createOnDemandRulesFromLegacyDictionary:(uint64_t)a1;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NEOnDemandRule)initWithAction:(int64_t)a3;
- (NEOnDemandRule)initWithCoder:(id)a3;
- (NEOnDemandRuleAction)action;
- (NEOnDemandRuleInterfaceType)interfaceTypeMatch;
- (NSArray)DNSSearchDomainMatch;
- (NSArray)DNSServerAddressMatch;
- (NSArray)SSIDMatch;
- (NSURL)probeURL;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDNSSearchDomainMatch:(NSArray *)DNSSearchDomainMatch;
- (void)setDNSServerAddressMatch:(NSArray *)DNSServerAddressMatch;
- (void)setInterfaceTypeMatch:(NEOnDemandRuleInterfaceType)interfaceTypeMatch;
- (void)setProbeURL:(NSURL *)probeURL;
- (void)setSSIDMatch:(NSArray *)SSIDMatch;
@end

@implementation NEOnDemandRule

- (NEOnDemandRule)initWithAction:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NEOnDemandRule;
  result = -[NEOnDemandRule init](&v5, sel_init);
  if (result) {
    result->_action = a3;
  }
  return result;
}

- (NEOnDemandRule)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___NEOnDemandRule;
  objc_super v5 = -[NEOnDemandRule init](&v24, sel_init);
  if (v5)
  {
    v5->_action = (int)[v4 decodeInt32ForKey:@"Action"];
    v6 = (void *)MEMORY[0x189604010];
    uint64_t v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"DNSSearchDomainMatch"];
    DNSSearchDomainMatch = v5->_DNSSearchDomainMatch;
    v5->_DNSSearchDomainMatch = (NSArray *)v9;

    v11 = (void *)MEMORY[0x189604010];
    uint64_t v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"DNSServerAddressMatch"];
    DNSServerAddressMatch = v5->_DNSServerAddressMatch;
    v5->_DNSServerAddressMatch = (NSArray *)v14;

    v5->_interfaceTypeMatch = (int)[v4 decodeInt32ForKey:@"InterfaceTypeMatch"];
    v16 = (void *)MEMORY[0x189604010];
    uint64_t v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"SSIDMatch"];
    SSIDMatch = v5->_SSIDMatch;
    v5->_SSIDMatch = (NSArray *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProbeURL"];
    probeURL = v5->_probeURL;
    v5->_probeURL = (NSURL *)v21;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    NEOnDemandRuleAction v6 = -[NEOnDemandRule action](self, "action");
    if (v6 == [v5 action])
    {
      -[NEOnDemandRule DNSSearchDomainMatch](self, "DNSSearchDomainMatch");
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 DNSSearchDomainMatch];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[NEOnDemandRule DNSSearchDomainMatch](self, "DNSSearchDomainMatch");
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 DNSSearchDomainMatch];
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v9;
        if (!objc_msgSend(v9, "isEqualToArray:"))
        {
          char v10 = 0;
          goto LABEL_26;
        }
      }
      v11 = -[NEOnDemandRule DNSServerAddressMatch](self, "DNSServerAddressMatch");
      [v5 DNSServerAddressMatch];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12)
      {
        v3 = -[NEOnDemandRule DNSServerAddressMatch](self, "DNSServerAddressMatch");
        [v5 DNSServerAddressMatch];
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (![v3 isEqualToArray:v13])
        {
          char v10 = 0;
          goto LABEL_24;
        }

        v33 = v13;
      }

      NEOnDemandRuleInterfaceType v14 = -[NEOnDemandRule interfaceTypeMatch](self, "interfaceTypeMatch");
      if (v14 == [v5 interfaceTypeMatch])
      {
        uint64_t v15 = -[NEOnDemandRule SSIDMatch](self, "SSIDMatch");
        uint64_t v16 = [v5 SSIDMatch];
        uint64_t v17 = v15;
        BOOL v18 = v15 == v16;
        v13 = v33;
        v31 = (void *)v16;
        v32 = (void *)v17;
        if (v18
          || (-[NEOnDemandRule SSIDMatch](self, "SSIDMatch"),
              uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(),
              [v5 SSIDMatch],
              v29 = (void *)objc_claimAutoreleasedReturnValue(),
              v30 = v19,
              objc_msgSend(v19, "isEqualToArray:")))
        {
          v20 = -[NEOnDemandRule probeURL](self, "probeURL", v3);
          uint64_t v21 = [v5 probeURL];
          if (v20 == (void *)v21)
          {

            char v10 = 1;
          }

          else
          {
            v22 = (void *)v21;
            v23 = -[NEOnDemandRule probeURL](self, "probeURL");
            [v5 probeURL];
            objc_super v24 = (void *)objc_claimAutoreleasedReturnValue();
            char v10 = [v23 isEqual:v24];
          }

          v26 = v31;
          v25 = v32;
          v3 = v28;
          v13 = v33;
          if (v32 == v31)
          {
LABEL_23:

            if (v11 == v12) {
              goto LABEL_25;
            }
            goto LABEL_24;
          }
        }

        else
        {
          char v10 = 0;
          v26 = v31;
          v25 = v32;
        }

        goto LABEL_23;
      }

      char v10 = 0;
      v13 = v33;
      if (v11 == v12)
      {
LABEL_25:

        if (v7 == v8)
        {
LABEL_27:

          goto LABEL_28;
        }

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEOnDemandRule action](self, "action"), @"Action");
  -[NEOnDemandRule DNSSearchDomainMatch](self, "DNSSearchDomainMatch");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"DNSSearchDomainMatch"];

  -[NEOnDemandRule DNSServerAddressMatch](self, "DNSServerAddressMatch");
  NEOnDemandRuleAction v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"DNSServerAddressMatch"];

  objc_msgSend( v4,  "encodeInt32:forKey:",  -[NEOnDemandRule interfaceTypeMatch](self, "interfaceTypeMatch"),  @"InterfaceTypeMatch");
  -[NEOnDemandRule SSIDMatch](self, "SSIDMatch");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"SSIDMatch"];

  -[NEOnDemandRule probeURL](self, "probeURL");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"ProbeURL"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)objc_msgSend( (id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3),  "initWithAction:",  -[NEOnDemandRule action](self, "action"));
  -[NEOnDemandRule DNSSearchDomainMatch](self, "DNSSearchDomainMatch");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setDNSSearchDomainMatch:v5];

  -[NEOnDemandRule DNSServerAddressMatch](self, "DNSServerAddressMatch");
  NEOnDemandRuleAction v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setDNSServerAddressMatch:v6];

  objc_msgSend(v4, "setInterfaceTypeMatch:", -[NEOnDemandRule interfaceTypeMatch](self, "interfaceTypeMatch"));
  -[NEOnDemandRule SSIDMatch](self, "SSIDMatch");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setSSIDMatch:v7];

  -[NEOnDemandRule probeURL](self, "probeURL");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setProbeURL:v8];

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (-[NEOnDemandRule action](self, "action") >= NEOnDemandRuleActionConnect
    && -[NEOnDemandRule action](self, "action") < (NEOnDemandRuleActionIgnore|NEOnDemandRuleActionConnect))
  {
    char v5 = 1;
  }

  else
  {
    +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, @"Invalid action", v4);
    char v5 = 0;
  }

  -[NEOnDemandRule DNSSearchDomainMatch](self, "DNSSearchDomainMatch");
  NEOnDemandRuleAction v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    -[NEOnDemandRule DNSSearchDomainMatch](self, "DNSSearchDomainMatch");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          if ((isa_nsstring(*(void **)(*((void *)&v23 + 1) + 8 * v11)) & 1) == 0)
          {
            +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Invalid search domain",  v4);
            char v5 = 0;
          }

          ++v11;
        }

        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }

      while (v9);
    }
  }

  -[NEOnDemandRule DNSServerAddressMatch](self, "DNSServerAddressMatch");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    v13 = -[NEOnDemandRule DNSServerAddressMatch](self, "DNSServerAddressMatch", 0LL);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        uint64_t v17 = 0LL;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          if ((isa_nsstring(*(void **)(*((void *)&v19 + 1) + 8 * v17)) & 1) == 0)
          {
            +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, @"Invalid DNS server", v4);
            char v5 = 0;
          }

          ++v17;
        }

        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }

      while (v15);
    }
  }

  return v5 & 1;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  unint64_t v8 = -[NEOnDemandRule action](self, "action") - 1;
  if (v8 <= 3) {
    [v7 appendPrettyObject:off_18A08E7D8[v8] withName:@"action" andIndent:v5 options:a4];
  }
  -[NEOnDemandRule DNSSearchDomainMatch](self, "DNSSearchDomainMatch");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v10 = a4 | 1;
  [v7 appendPrettyObject:v9 withName:@"DNSSearchDomainMatch" andIndent:v5 options:a4 | 1];

  -[NEOnDemandRule DNSServerAddressMatch](self, "DNSServerAddressMatch");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v11 withName:@"DNSServerAddressMatch" andIndent:v5 options:a4 | 1];

  NEOnDemandRuleInterfaceType v12 = -[NEOnDemandRule interfaceTypeMatch](self, "interfaceTypeMatch");
  switch(v12)
  {
    case NEOnDemandRuleInterfaceTypeAny:
      v13 = @"any";
      goto LABEL_9;
    case NEOnDemandRuleInterfaceTypeWiFi:
      v13 = @"WiFi";
      goto LABEL_9;
    case NEOnDemandRuleInterfaceTypeCellular:
      v13 = @"cellular";
LABEL_9:
      [v7 appendPrettyObject:v13 withName:@"interfaceTypeMatch" andIndent:v5 options:a4];
      break;
  }

  -[NEOnDemandRule SSIDMatch](self, "SSIDMatch");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v14 withName:@"SSIDMatch" andIndent:v5 options:v10];

  -[NEOnDemandRule probeURL](self, "probeURL");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 absoluteString];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v16 withName:@"probeURL" andIndent:v5 options:v10];

  return v7;
}

- (id)description
{
  return -[NEOnDemandRule descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 0LL);
}

- (id)copyLegacyDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  unint64_t v4 = -[NEOnDemandRule action](self, "action") - 1;
  if (v4 <= 3) {
    [v3 setObject:**((void **)&unk_18A08E7F8 + v4) forKeyedSubscript:*MEMORY[0x18960CA40]];
  }
  -[NEOnDemandRule DNSSearchDomainMatch](self, "DNSSearchDomainMatch");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NEOnDemandRule DNSSearchDomainMatch](self, "DNSSearchDomainMatch");
    NEOnDemandRuleAction v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x18960CA70]];
  }

  -[NEOnDemandRule DNSServerAddressMatch](self, "DNSServerAddressMatch");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NEOnDemandRule DNSServerAddressMatch](self, "DNSServerAddressMatch");
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x18960CA78]];
  }

  NEOnDemandRuleInterfaceType v9 = -[NEOnDemandRule interfaceTypeMatch](self, "interfaceTypeMatch");
  if (v9 == NEOnDemandRuleInterfaceTypeCellular)
  {
    uint64_t v11 = *MEMORY[0x18960CA80];
    unint64_t v10 = @"Cellular";
  }

  else
  {
    if (v9 != NEOnDemandRuleInterfaceTypeWiFi) {
      goto LABEL_12;
    }
    unint64_t v10 = (const __CFString *)*MEMORY[0x18960CC00];
    uint64_t v11 = *MEMORY[0x18960CA80];
  }

  [v3 setObject:v10 forKeyedSubscript:v11];
LABEL_12:
  -[NEOnDemandRule SSIDMatch](self, "SSIDMatch");
  NEOnDemandRuleInterfaceType v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = -[NEOnDemandRule SSIDMatch](self, "SSIDMatch");
    [v3 setObject:v13 forKeyedSubscript:*MEMORY[0x18960CA88]];
  }

  -[NEOnDemandRule probeURL](self, "probeURL");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[NEOnDemandRule probeURL](self, "probeURL");
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 absoluteString];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v16 forKeyedSubscript:*MEMORY[0x18960CA90]];
  }

  return v3;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___NEOnDemandRule;
  uint64_t v5 = -[NEOnDemandRule init](&v37, sel_init);
  if (!v5) {
    goto LABEL_29;
  }
  [v4 objectForKeyedSubscript:*MEMORY[0x18960CA40]];
  NEOnDemandRuleAction v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (isa_nsstring(v6))
  {
    if ([v6 isEqualToString:*MEMORY[0x18960CBE0]])
    {
      uint64_t v7 = 4LL;
LABEL_12:
      v5->_action = v7;
      goto LABEL_13;
    }

    if ([v6 isEqualToString:*MEMORY[0x18960CBC8]])
    {
      uint64_t v7 = 1LL;
      goto LABEL_12;
    }

    if ([v6 isEqualToString:*MEMORY[0x18960CBD0]])
    {
      uint64_t v7 = 2LL;
      goto LABEL_12;
    }

    if (([v6 isEqualToString:*MEMORY[0x18960CBD8]] & 1) != 0
      || [v6 isEqualToString:*MEMORY[0x18960CBC0]])
    {
      uint64_t v7 = 3LL;
      goto LABEL_12;
    }
  }

- (NEOnDemandRuleAction)action
{
  return self->_action;
}

- (NSArray)DNSSearchDomainMatch
{
  return (NSArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setDNSSearchDomainMatch:(NSArray *)DNSSearchDomainMatch
{
}

- (NSArray)DNSServerAddressMatch
{
  return (NSArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setDNSServerAddressMatch:(NSArray *)DNSServerAddressMatch
{
}

- (NEOnDemandRuleInterfaceType)interfaceTypeMatch
{
  return self->_interfaceTypeMatch;
}

- (void)setInterfaceTypeMatch:(NEOnDemandRuleInterfaceType)interfaceTypeMatch
{
  self->_interfaceTypeMatch = interfaceTypeMatch;
}

- (NSArray)SSIDMatch
{
  return (NSArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setSSIDMatch:(NSArray *)SSIDMatch
{
}

- (NSURL)probeURL
{
  return (NSURL *)objc_getProperty(self, a2, 48LL, 1);
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

+ (id)createOnDemandRulesFromLegacyDictionary:(uint64_t)a1
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  objc_opt_self();
  [v2 objectForKeyedSubscript:*MEMORY[0x18960CA30]];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (isa_nsarray(v3) && [v3 count])
  {
    id v4 = -[NEEvaluateConnectionRule initWithMatchDomains:andAction:]( objc_alloc(&OBJC_CLASS___NEEvaluateConnectionRule),  "initWithMatchDomains:andAction:",  v3,  2LL);
    id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
    [v5 addObject:v4];
  }

  else
  {
    id v5 = 0LL;
  }

  [v2 objectForKeyedSubscript:*MEMORY[0x18960CA28]];
  NEOnDemandRuleAction v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (isa_nsarray(v6) && [v6 count])
  {
    uint64_t v7 = -[NEEvaluateConnectionRule initWithMatchDomains:andAction:]( objc_alloc(&OBJC_CLASS___NEEvaluateConnectionRule),  "initWithMatchDomains:andAction:",  v6,  1LL);
    if (!v5) {
      id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
    }
    [v5 addObject:v7];
  }

  [v2 objectForKeyedSubscript:*MEMORY[0x18960CA38]];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (isa_nsarray(v8) && [v8 count])
  {
    NEOnDemandRuleInterfaceType v9 = -[NEEvaluateConnectionRule initWithMatchDomains:andAction:]( objc_alloc(&OBJC_CLASS___NEEvaluateConnectionRule),  "initWithMatchDomains:andAction:",  v8,  1LL);
    if (!v5) {
      id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
    }
    [v5 addObject:v9];
  }

  [v2 objectForKeyedSubscript:*MEMORY[0x18960CA98]];
  int v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (isa_nsarray(v10))
  {
    id v34 = v5;
    v31 = v10;
    id v32 = v2;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (!v12)
    {
      id v14 = 0LL;
      LOBYTE(v33) = 0;
      goto LABEL_58;
    }

    uint64_t v13 = v12;
    id v14 = 0LL;
    int v33 = 0;
    uint64_t v15 = *(void *)v40;
    uint64_t v16 = *MEMORY[0x18960CA40];
    uint64_t v17 = *MEMORY[0x18960CBE0];
    uint64_t v18 = *MEMORY[0x18960CBC8];
    uint64_t v38 = *MEMORY[0x18960CBD0];
    uint64_t v36 = *MEMORY[0x18960CBD8];
    uint64_t v35 = *MEMORY[0x18960CBC0];
    uint64_t v37 = *MEMORY[0x18960CBC8];
    while (1)
    {
      uint64_t v19 = 0LL;
      do
      {
        if (*(void *)v40 != v15) {
          objc_enumerationMutation(v11);
        }
        __int128 v20 = *(void **)(*((void *)&v39 + 1) + 8 * v19);
        if (isa_nsdictionary(v20))
        {
          [v20 objectForKeyedSubscript:v16];
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (isa_nsstring(v21))
          {
            if ([v21 isEqualToString:v17])
            {
              uint64_t v22 = &OBJC_CLASS___NEOnDemandRuleIgnore;
              goto LABEL_31;
            }

            if ([v21 isEqualToString:v18])
            {
              uint64_t v22 = &OBJC_CLASS___NEOnDemandRuleConnect;
              goto LABEL_31;
            }

            if ([v21 isEqualToString:v38])
            {
              uint64_t v22 = &OBJC_CLASS___NEOnDemandRuleDisconnect;
              goto LABEL_31;
            }

            if ([v21 isEqualToString:v36])
            {
              uint64_t v22 = &OBJC_CLASS___NEOnDemandRuleEvaluateConnection;
LABEL_31:
              id v23 = (id)[[v22 alloc] initFromLegacyDictionary:v20];
              if (v23)
              {
LABEL_32:
                objc_msgSend(v23, "DNSSearchDomainMatch", v31, v32);
                int v24 = (void *)objc_claimAutoreleasedReturnValue();
                if (v24
                  || ([v23 DNSServerAddressMatch],
                      (int v24 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
                {

                  if (!v14) {
                    goto LABEL_35;
                  }
                }

                else
                {
                  [v23 SSIDMatch];
                  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v25 || [v23 interfaceTypeMatch])
                  {
                  }

                  else
                  {
                    [v23 probeURL];
                    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v26) {
                      int v27 = v33;
                    }
                    else {
                      int v27 = 1;
                    }
                    int v33 = v27;
                  }

                  uint64_t v18 = v37;
                  if (!v14) {
LABEL_35:
                  }
                    id v14 = objc_alloc_init(MEMORY[0x189603FA8]);
                }

                [v14 addObject:v23];
              }
            }

            else if ([v21 isEqualToString:v35])
            {
              if (v34)
              {
                id v23 = -[NEOnDemandRuleEvaluateConnection initFromLegacyDictionary:]( objc_alloc(&OBJC_CLASS___NEOnDemandRuleEvaluateConnection),  "initFromLegacyDictionary:",  v20);
                [v23 setConnectionRules:v34];
                uint64_t v18 = v37;
                if (v23) {
                  goto LABEL_32;
                }
              }

              else
              {
                uint64_t v18 = v37;
              }
            }
          }
        }

        ++v19;
      }

      while (v13 != v19);
      uint64_t v28 = [v11 countByEnumeratingWithState:&v39 objects:v43 count:16];
      uint64_t v13 = v28;
      if (!v28)
      {
LABEL_58:

        int v10 = v31;
        id v2 = v32;
        id v5 = v34;
        if ((v33 & 1) == 0) {
          goto LABEL_59;
        }
        goto LABEL_63;
      }
    }
  }

  id v14 = 0LL;
LABEL_59:
  if (v5)
  {
    uint64_t v29 = objc_alloc_init(&OBJC_CLASS___NEOnDemandRuleEvaluateConnection);
    -[NEOnDemandRuleEvaluateConnection setConnectionRules:](v29, "setConnectionRules:", v5);
    if (!v14) {
      id v14 = objc_alloc_init(MEMORY[0x189603FA8]);
    }
    objc_msgSend(v14, "addObject:", v29, v31, v32);
  }

@end