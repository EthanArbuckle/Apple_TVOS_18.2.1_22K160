@interface NEDNSSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)matchDomainsNoSearch;
- (BOOL)useForAllDomains;
- (NEDNSProtocol)dnsProtocol;
- (NEDNSSettings)initWithCoder:(id)a3;
- (NEDNSSettings)initWithServers:(NSArray *)servers;
- (NSArray)matchDomains;
- (NSArray)searchDomains;
- (NSArray)servers;
- (NSString)domainName;
- (NSUUID)proxyAgentUUID;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDomainName:(NSString *)domainName;
- (void)setMatchDomains:(NSArray *)matchDomains;
- (void)setMatchDomainsNoSearch:(BOOL)matchDomainsNoSearch;
- (void)setProxyAgentUUID:(id)a3;
- (void)setSearchDomains:(NSArray *)searchDomains;
@end

@implementation NEDNSSettings

- (NEDNSProtocol)dnsProtocol
{
  return 1LL;
}

- (NEDNSSettings)initWithServers:(NSArray *)servers
{
  v4 = servers;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NEDNSSettings;
  v5 = -[NEDNSSettings init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = -[NSArray copy](v4, "copy");
    v7 = v5->_servers;
    v5->_servers = (NSArray *)v6;
  }

  return v5;
}

- (NEDNSSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___NEDNSSettings;
  v5 = -[NEDNSSettings init](&v26, sel_init);
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x189604010];
    uint64_t v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Servers"];
    servers = v5->_servers;
    v5->_servers = (NSArray *)v9;

    v11 = (void *)MEMORY[0x189604010];
    uint64_t v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"SearchDomains"];
    searchDomains = v5->_searchDomains;
    v5->_searchDomains = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domainName"];
    domainName = v5->_domainName;
    v5->_domainName = (NSString *)v16;

    v18 = (void *)MEMORY[0x189604010];
    uint64_t v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"matchDomains"];
    matchDomains = v5->_matchDomains;
    v5->_matchDomains = (NSArray *)v21;

    v5->_matchDomainsNoSearch = [v4 decodeBoolForKey:@"matchDomainsNoSearch"];
    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProxyAgentUUID"];
    proxyAgentUUID = v5->_proxyAgentUUID;
    v5->_proxyAgentUUID = (NSUUID *)v23;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[NEDNSSettings servers](self, "servers");
  [v4 encodeObject:v5 forKey:@"Servers"];

  -[NEDNSSettings searchDomains](self, "searchDomains");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"SearchDomains"];

  -[NEDNSSettings domainName](self, "domainName");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"domainName"];
  v8 = -[NEDNSSettings matchDomains](self, "matchDomains");
  [v4 encodeObject:v8 forKey:@"matchDomains"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[NEDNSSettings matchDomainsNoSearch](self, "matchDomainsNoSearch"),  @"matchDomainsNoSearch");
  -[NEDNSSettings proxyAgentUUID](self, "proxyAgentUUID");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v9 forKey:@"ProxyAgentUUID"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = -[NEDNSSettings servers](self, "servers");
  uint64_t v6 = (void *)[v4 initWithServers:v5];

  [v6 setSearchDomains:self->_searchDomains];
  [v6 setDomainName:self->_domainName];
  [v6 setMatchDomains:self->_matchDomains];
  [v6 setMatchDomainsNoSearch:self->_matchDomainsNoSearch];
  [v6 setProxyAgentUUID:self->_proxyAgentUUID];
  return v6;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (-[NEDNSSettings isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[NEDNSSettings servers](self, "servers");
    if (v5)
    {
    }

    else
    {
      -[NEDNSSettings searchDomains](self, "searchDomains");
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Missing both DNS servers and DNS search domains",  v4);
        char v7 = 0;
        goto LABEL_6;
      }
    }
  }

  char v7 = 1;
LABEL_6:
  v8 = -[NEDNSSettings servers](self, "servers");
  if (!v8) {
    goto LABEL_21;
  }
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  v24 = self;
  -[NEDNSSettings servers](self, "servers");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (!v10) {
    goto LABEL_20;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v32;
  do
  {
    for (uint64_t i = 0LL; i != v11; ++i)
    {
      if (*(void *)v32 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
      if ((isa_nsstring(v14) & 1) == 0)
      {
        uint64_t v16 = @"Non-string for DNS server";
        goto LABEL_17;
      }

      id v15 = v14;
      if (!inet_pton(2, (const char *)[v15 UTF8String], v30)
        && !inet_pton(30, (const char *)[v15 UTF8String], v29))
      {
        uint64_t v16 = @"Invalid DNS server";
LABEL_17:
        +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, v16, v4);
        char v7 = 0;
        continue;
      }
    }

    uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
  }

  while (v11);
LABEL_20:

  self = v24;
LABEL_21:
  v17 = -[NEDNSSettings searchDomains](self, "searchDomains");
  if (v17)
  {
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    v18 = -[NEDNSSettings searchDomains](self, "searchDomains");
    uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v35 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v26;
      do
      {
        for (uint64_t j = 0LL; j != v20; ++j)
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v18);
          }
          if ((isa_nsstring(*(void **)(*((void *)&v25 + 1) + 8 * j)) & 1) == 0)
          {
            +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Non-string for DNS search domain",  v4);
            char v7 = 0;
          }
        }

        uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v35 count:16];
      }

      while (v20);
    }
  }

  return v7 & 1;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  char v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  unint64_t v8 = -[NEDNSSettings dnsProtocol](self, "dnsProtocol") - 1;
  if (v8 <= 2) {
    [v7 appendPrettyObject:off_18A08BB58[v8] withName:@"protocol" andIndent:v5 options:a4];
  }
  -[NEDNSSettings servers](self, "servers");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v9 withName:@"server" andIndent:v5 options:a4 | 1];

  -[NEDNSSettings domainName](self, "domainName");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v10 withName:@"domainName" andIndent:v5 options:a4 | 1];

  -[NEDNSSettings searchDomains](self, "searchDomains");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v11 withName:@"searchDomains" andIndent:v5 options:a4 | 1];

  -[NEDNSSettings matchDomains](self, "matchDomains");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v12 withName:@"matchDomains" andIndent:v5 options:a4 | 1];

  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEDNSSettings matchDomainsNoSearch](self, "matchDomainsNoSearch"),  @"matchDomainsNoSearch",  v5,  a4);
  return v7;
}

- (id)copyLegacyDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  -[NEDNSSettings servers](self, "servers");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NEDNSSettings servers](self, "servers");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x18960C620]];
  }

  -[NEDNSSettings searchDomains](self, "searchDomains");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NEDNSSettings searchDomains](self, "searchDomains");
    char v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x18960C618]];
  }

  -[NEDNSSettings domainName](self, "domainName");
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NEDNSSettings domainName](self, "domainName");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x18960C610]];
  }

  -[NEDNSSettings matchDomains](self, "matchDomains");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NEDNSSettings matchDomains](self, "matchDomains");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v11 forKeyedSubscript:*MEMORY[0x18960C638]];
  }

  if (-[NEDNSSettings matchDomainsNoSearch](self, "matchDomainsNoSearch")) {
    [v3 setObject:&unk_18A0CF888 forKeyedSubscript:*MEMORY[0x18960C640]];
  }
  return v3;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___NEDNSSettings;
  uint64_t v5 = -[NEDNSSettings init](&v34, sel_init);
  if (v5)
  {
    uint64_t v6 = *MEMORY[0x18960C620];
    [v4 objectForKeyedSubscript:*MEMORY[0x18960C620]];
    char v7 = (void *)objc_claimAutoreleasedReturnValue();
    int v8 = isa_nsarray(v7);

    if (v8)
    {
      [v4 objectForKeyedSubscript:v6];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = [v9 copy];
      servers = v5->_servers;
      v5->_servers = (NSArray *)v10;
    }

    uint64_t v12 = *MEMORY[0x18960C618];
    [v4 objectForKeyedSubscript:*MEMORY[0x18960C618]];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    int v14 = isa_nsarray(v13);

    if (v14)
    {
      [v4 objectForKeyedSubscript:v12];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = [v15 copy];
      searchDomains = v5->_searchDomains;
      v5->_searchDomains = (NSArray *)v16;
    }

    uint64_t v18 = *MEMORY[0x18960C610];
    [v4 objectForKeyedSubscript:*MEMORY[0x18960C610]];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    int v20 = isa_nsstring(v19);

    if (v20)
    {
      uint64_t v21 = [v4 objectForKeyedSubscript:v18];
      domainName = v5->_domainName;
      v5->_domainName = (NSString *)v21;
    }

    uint64_t v23 = *MEMORY[0x18960C638];
    [v4 objectForKeyedSubscript:*MEMORY[0x18960C638]];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    int v25 = isa_nsarray(v24);

    if (v25)
    {
      [v4 objectForKeyedSubscript:v23];
      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = [v26 copy];
      matchDomains = v5->_matchDomains;
      v5->_matchDomains = (NSArray *)v27;
    }

    uint64_t v29 = *MEMORY[0x18960C640];
    [v4 objectForKeyedSubscript:*MEMORY[0x18960C640]];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    int v31 = isa_nsnumber(v30);

    if (v31)
    {
      [v4 objectForKeyedSubscript:v29];
      __int128 v32 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_matchDomainsNoSearch = [v32 BOOLValue];
    }
  }

  return v5;
}

- (BOOL)useForAllDomains
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NEDNSSettings matchDomains](self, "matchDomains");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v4 count])
    {
      -[NEDNSSettings matchDomains](self, "matchDomains");
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v5 count] == 1)
      {
        -[NEDNSSettings matchDomains](self, "matchDomains");
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 objectAtIndexedSubscript:0];
        char v7 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v8 = [v7 length] == 0;
      }

      else
      {
        BOOL v8 = 0;
      }
    }

    else
    {
      BOOL v8 = 1;
    }
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (NSArray)servers
{
  return (NSArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSArray)searchDomains
{
  return (NSArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setSearchDomains:(NSArray *)searchDomains
{
}

- (NSString)domainName
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setDomainName:(NSString *)domainName
{
}

- (NSArray)matchDomains
{
  return (NSArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setMatchDomains:(NSArray *)matchDomains
{
}

- (BOOL)matchDomainsNoSearch
{
  return self->_matchDomainsNoSearch;
}

- (void)setMatchDomainsNoSearch:(BOOL)matchDomainsNoSearch
{
  self->_matchDomainsNoSearch = matchDomainsNoSearch;
}

- (NSUUID)proxyAgentUUID
{
  return self->_proxyAgentUUID;
}

- (void)setProxyAgentUUID:(id)a3
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