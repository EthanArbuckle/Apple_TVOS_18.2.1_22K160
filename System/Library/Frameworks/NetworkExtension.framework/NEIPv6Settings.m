@interface NEIPv6Settings
+ (BOOL)supportsSecureCoding;
+ (NEIPv6Settings)settingsWithAutomaticAddressing;
+ (NEIPv6Settings)settingsWithLinkLocalAddressing;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)hasDefaultRoute;
- (NEIPv6Settings)init;
- (NEIPv6Settings)initWithAddresses:(NSArray *)addresses networkPrefixLengths:(NSArray *)networkPrefixLengths;
- (NEIPv6Settings)initWithCoder:(id)a3;
- (NEIPv6Settings)initWithConfigMethod:(int64_t)a3;
- (NSArray)addresses;
- (NSArray)excludedRoutes;
- (NSArray)includedRoutes;
- (NSArray)networkPrefixLengths;
- (NSString)router;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (int64_t)configMethod;
- (void)encodeWithCoder:(id)a3;
- (void)setConfigMethod:(int64_t)a3;
- (void)setExcludedRoutes:(NSArray *)excludedRoutes;
- (void)setIncludedRoutes:(NSArray *)includedRoutes;
- (void)setRouter:(id)a3;
@end

@implementation NEIPv6Settings

- (NEIPv6Settings)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NEIPv6Settings;
  v2 = -[NEIPv6Settings init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_configMethod = 2LL;
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x189603F18]);
    addresses = v3->_addresses;
    v3->_addresses = v4;

    v6 = (NSArray *)objc_alloc_init(MEMORY[0x189603F18]);
    networkPrefixLengths = v3->_networkPrefixLengths;
    v3->_networkPrefixLengths = v6;
  }

  return v3;
}

- (NEIPv6Settings)initWithAddresses:(NSArray *)addresses networkPrefixLengths:(NSArray *)networkPrefixLengths
{
  v6 = addresses;
  v7 = networkPrefixLengths;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NEIPv6Settings;
  v8 = -[NEIPv6Settings init](&v15, sel_init);
  objc_super v9 = v8;
  if (v8)
  {
    v8->_configMethod = 2LL;
    uint64_t v10 = -[NSArray copy](v6, "copy");
    v11 = v9->_addresses;
    v9->_addresses = (NSArray *)v10;

    uint64_t v12 = -[NSArray copy](v7, "copy");
    v13 = v9->_networkPrefixLengths;
    v9->_networkPrefixLengths = (NSArray *)v12;
  }

  return v9;
}

- (NEIPv6Settings)initWithConfigMethod:(int64_t)a3
{
  result = -[NEIPv6Settings init](self, "init");
  if (result) {
    result->_configMethod = a3;
  }
  return result;
}

- (NEIPv6Settings)initWithCoder:(id)a3
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___NEIPv6Settings;
  v5 = -[NEIPv6Settings init](&v41, sel_init);
  if (v5)
  {
    v5->_configMethod = (int)[v4 decodeInt32ForKey:@"ConfigMethod"];
    v6 = (void *)MEMORY[0x189604010];
    uint64_t v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"AddressArray"];
    addresses = v5->_addresses;
    v5->_addresses = (NSArray *)v9;

    if (!v5->_addresses)
    {
      [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Address"];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x189603F18]), "initWithObjects:", v11, 0);
        v13 = v5->_addresses;
        v5->_addresses = (NSArray *)v12;

        ne_log_obj();
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v39 = v5->_addresses;
          *(_DWORD *)buf = 138412290;
          v43 = v39;
          _os_log_debug_impl( &dword_1876B1000,  v14,  OS_LOG_TYPE_DEBUG,  "initwithcoder single router IPv6address %@",  buf,  0xCu);
        }
      }
    }

    objc_super v15 = (void *)MEMORY[0x189604010];
    uint64_t v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"PrefixLengthArray"];
    networkPrefixLengths = v5->_networkPrefixLengths;
    v5->_networkPrefixLengths = (NSArray *)v18;

    if (!v5->_networkPrefixLengths)
    {
      [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrefixLength"];
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if ((_DWORD)v20)
      {
        id v21 = objc_alloc(MEMORY[0x189603F18]);
        [MEMORY[0x189607968] numberWithInt:v20];
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v23 = objc_msgSend(v21, "initWithObjects:", v22, 0);
        v24 = v5->_networkPrefixLengths;
        v5->_networkPrefixLengths = (NSArray *)v23;

        ne_log_obj();
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          v40 = v5->_networkPrefixLengths;
          *(_DWORD *)buf = 138412290;
          v43 = v40;
          _os_log_debug_impl( &dword_1876B1000,  v25,  OS_LOG_TYPE_DEBUG,  "initwithcoder single prefixLength %@",  buf,  0xCu);
        }
      }
    }

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Router"];
    router = v5->_router;
    v5->_router = (NSString *)v26;

    v28 = (void *)MEMORY[0x189604010];
    uint64_t v29 = objc_opt_class();
    objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"IncludeRoutes"];
    includedRoutes = v5->_includedRoutes;
    v5->_includedRoutes = (NSArray *)v31;

    v33 = (void *)MEMORY[0x189604010];
    uint64_t v34 = objc_opt_class();
    objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v36 = [v4 decodeObjectOfClasses:v35 forKey:@"ExcludeRoutes"];
    excludedRoutes = v5->_excludedRoutes;
    v5->_excludedRoutes = (NSArray *)v36;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEIPv6Settings configMethod](self, "configMethod"), @"ConfigMethod");
  v5 = -[NEIPv6Settings addresses](self, "addresses");
  [v4 encodeObject:v5 forKey:@"AddressArray"];
  v6 = -[NEIPv6Settings router](self, "router");
  [v4 encodeObject:v6 forKey:@"Router"];

  -[NEIPv6Settings networkPrefixLengths](self, "networkPrefixLengths");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"PrefixLengthArray"];
  v8 = -[NEIPv6Settings includedRoutes](self, "includedRoutes");
  [v4 encodeObject:v8 forKey:@"IncludeRoutes"];

  -[NEIPv6Settings excludedRoutes](self, "excludedRoutes");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v9 forKey:@"ExcludeRoutes"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[NEIPv6Settings allocWithZone:](&OBJC_CLASS___NEIPv6Settings, "allocWithZone:", a3);
  v5 = -[NEIPv6Settings addresses](self, "addresses");
  v6 = -[NEIPv6Settings networkPrefixLengths](self, "networkPrefixLengths");
  uint64_t v7 = -[NEIPv6Settings initWithAddresses:networkPrefixLengths:](v4, "initWithAddresses:networkPrefixLengths:", v5, v6);

  -[NEIPv6Settings setConfigMethod:](v7, "setConfigMethod:", -[NEIPv6Settings configMethod](self, "configMethod"));
  v8 = -[NEIPv6Settings router](self, "router");
  -[NEIPv6Settings setRouter:](v7, "setRouter:", v8);

  -[NEIPv6Settings includedRoutes](self, "includedRoutes");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIPv6Settings setIncludedRoutes:](v7, "setIncludedRoutes:", v9);

  -[NEIPv6Settings excludedRoutes](self, "excludedRoutes");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIPv6Settings setExcludedRoutes:](v7, "setExcludedRoutes:", v10);

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  if (-[NEIPv6Settings configMethod](self, "configMethod", a3) != 2) {
    return 1;
  }
  -[NEIPv6Settings addresses](self, "addresses");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 count];

  if (!v5)
  {
    ne_log_obj();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v10 = "Missing IPv6 address";
      goto LABEL_43;
    }

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  unint64_t v8 = -[NEIPv6Settings configMethod](self, "configMethod") - 1;
  if (v8 <= 2) {
    [v7 appendPrettyObject:off_18A08E498[v8] withName:@"configMethod" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];
  }
  -[NEIPv6Settings addresses](self, "addresses");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v10 = a4 | 9;
  [v7 appendPrettyObject:v9 withName:@"addresses" andIndent:v5 options:a4 | 9];

  -[NEIPv6Settings networkPrefixLengths](self, "networkPrefixLengths");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v12 = a4 | 8;
  [v7 appendPrettyObject:v11 withName:@"networkPrefixLengths" andIndent:v5 options:v12];

  -[NEIPv6Settings router](self, "router");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v13 withName:@"router" andIndent:v5 options:v10];

  -[NEIPv6Settings includedRoutes](self, "includedRoutes");
  int v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v14 withName:@"includedRoutes" andIndent:v5 options:v12];

  -[NEIPv6Settings excludedRoutes](self, "excludedRoutes");
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v15 withName:@"excludedRoutes" andIndent:v5 options:v12];

  return v7;
}

- (id)copyLegacyDictionary
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (-[NEIPv6Settings configMethod](self, "configMethod") == 3)
  {
    id v4 = (void *)MEMORY[0x18960CB28];
LABEL_5:
    [v3 setObject:*v4 forKeyedSubscript:*MEMORY[0x18960C738]];
    goto LABEL_6;
  }

  if (-[NEIPv6Settings configMethod](self, "configMethod") == 1)
  {
    id v4 = (void *)MEMORY[0x18960CB20];
    goto LABEL_5;
  }

  if (-[NEIPv6Settings configMethod](self, "configMethod") == 2)
  {
    [v3 setObject:*MEMORY[0x18960CB30] forKeyedSubscript:*MEMORY[0x18960C738]];
    -[NEIPv6Settings addresses](self, "addresses");
    id v25 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = [v25 count];

    if (v26)
    {
      -[NEIPv6Settings addresses](self, "addresses");
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 setObject:v27 forKeyedSubscript:*MEMORY[0x18960C730]];
    }

    -[NEIPv6Settings networkPrefixLengths](self, "networkPrefixLengths");
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v29 = [v28 count];

    if (v29)
    {
      v30 = -[NEIPv6Settings networkPrefixLengths](self, "networkPrefixLengths");
      [v3 setObject:v30 forKeyedSubscript:*MEMORY[0x18960C760]];
    }

    -[NEIPv6Settings router](self, "router");
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      -[NEIPv6Settings router](self, "router");
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 setObject:v32 forKeyedSubscript:*MEMORY[0x18960C788]];
    }
  }

- (id)initFromLegacyDictionary:(id)a3
{
  uint64_t v74 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = -[NEIPv6Settings initWithConfigMethod:](self, "initWithConfigMethod:", 1LL);
  if (!v6) {
    goto LABEL_55;
  }
  [v5 objectForKeyedSubscript:*MEMORY[0x18960C738]];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (isa_nsstring(v7))
  {
    if ([v7 isEqualToString:*MEMORY[0x18960CB28]])
    {
      uint64_t v8 = 3LL;
    }

    else if ([v7 isEqualToString:*MEMORY[0x18960CB30]])
    {
      uint64_t v8 = 2LL;
    }

    else
    {
      uint64_t v8 = 1LL;
    }

    v6->_configMethod = v8;
  }

- (BOOL)hasDefaultRoute
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  v2 = self->_includedRoutes;
  uint64_t v3 = -[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0LL; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "isDefaultRoute", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }

      uint64_t v3 = -[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
      if (v3) {
        continue;
      }
      break;
    }
  }

- (NSArray)addresses
{
  return (NSArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSArray)networkPrefixLengths
{
  return (NSArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSArray)includedRoutes
{
  return (NSArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setIncludedRoutes:(NSArray *)includedRoutes
{
}

- (NSArray)excludedRoutes
{
  return (NSArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setExcludedRoutes:(NSArray *)excludedRoutes
{
}

- (int64_t)configMethod
{
  return self->_configMethod;
}

- (void)setConfigMethod:(int64_t)a3
{
  self->_configMethod = a3;
}

- (NSString)router
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setRouter:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NEIPv6Settings)settingsWithAutomaticAddressing
{
  return  -[NEIPv6Settings initWithConfigMethod:]( objc_alloc(&OBJC_CLASS___NEIPv6Settings),  "initWithConfigMethod:",  1LL);
}

+ (NEIPv6Settings)settingsWithLinkLocalAddressing
{
  return  -[NEIPv6Settings initWithConfigMethod:]( objc_alloc(&OBJC_CLASS___NEIPv6Settings),  "initWithConfigMethod:",  3LL);
}

@end