@interface NEIPv4Settings
+ (BOOL)supportsSecureCoding;
+ (NEIPv4Settings)settingsWithAutomaticAddressing;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)hasDefaultRoute;
- (BOOL)overridePrimary;
- (NEIPv4Settings)init;
- (NEIPv4Settings)initWithAddresses:(NSArray *)addresses subnetMasks:(NSArray *)subnetMasks;
- (NEIPv4Settings)initWithCoder:(id)a3;
- (NEIPv4Settings)initWithConfigMethod:(int64_t)a3;
- (NSArray)addresses;
- (NSArray)excludedRoutes;
- (NSArray)includedRoutes;
- (NSArray)subnetMasks;
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
- (void)setOverridePrimary:(BOOL)a3;
- (void)setRouter:(NSString *)router;
@end

@implementation NEIPv4Settings

- (NEIPv4Settings)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NEIPv4Settings;
  v2 = -[NEIPv4Settings init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_configMethod = 3LL;
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x189603F18]);
    addresses = v3->_addresses;
    v3->_addresses = v4;

    v6 = (NSArray *)objc_alloc_init(MEMORY[0x189603F18]);
    subnetMasks = v3->_subnetMasks;
    v3->_subnetMasks = v6;
  }

  return v3;
}

- (NEIPv4Settings)initWithAddresses:(NSArray *)addresses subnetMasks:(NSArray *)subnetMasks
{
  v6 = addresses;
  v7 = subnetMasks;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NEIPv4Settings;
  v8 = -[NEIPv4Settings init](&v15, sel_init);
  objc_super v9 = v8;
  if (v8)
  {
    v8->_configMethod = 3LL;
    uint64_t v10 = -[NSArray copy](v6, "copy");
    v11 = v9->_addresses;
    v9->_addresses = (NSArray *)v10;

    uint64_t v12 = -[NSArray copy](v7, "copy");
    v13 = v9->_subnetMasks;
    v9->_subnetMasks = (NSArray *)v12;
  }

  return v9;
}

- (NEIPv4Settings)initWithConfigMethod:(int64_t)a3
{
  result = -[NEIPv4Settings init](self, "init");
  if (result) {
    result->_configMethod = a3;
  }
  return result;
}

- (NEIPv4Settings)initWithCoder:(id)a3
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___NEIPv4Settings;
  v5 = -[NEIPv4Settings init](&v39, sel_init);
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
          v37 = v5->_addresses;
          *(_DWORD *)buf = 138412290;
          v41 = v37;
          _os_log_debug_impl( &dword_1876B1000,  v14,  OS_LOG_TYPE_DEBUG,  "initwithcoder single router IPv4address %@",  buf,  0xCu);
        }
      }
    }

    objc_super v15 = (void *)MEMORY[0x189604010];
    uint64_t v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"SubnetMaskArray"];
    subnetMasks = v5->_subnetMasks;
    v5->_subnetMasks = (NSArray *)v18;

    if (!v5->_subnetMasks)
    {
      [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SubnetMask"];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x189603F18]), "initWithObjects:", v20, 0);
        v22 = v5->_subnetMasks;
        v5->_subnetMasks = (NSArray *)v21;

        ne_log_obj();
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          v38 = v5->_subnetMasks;
          *(_DWORD *)buf = 138412290;
          v41 = v38;
          _os_log_debug_impl(&dword_1876B1000, v23, OS_LOG_TYPE_DEBUG, "initwithcoder subnet mask %@", buf, 0xCu);
        }
      }
    }

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Router"];
    router = v5->_router;
    v5->_router = (NSString *)v24;

    v26 = (void *)MEMORY[0x189604010];
    uint64_t v27 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"IncludeRoutes"];
    includedRoutes = v5->_includedRoutes;
    v5->_includedRoutes = (NSArray *)v29;

    v31 = (void *)MEMORY[0x189604010];
    uint64_t v32 = objc_opt_class();
    objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v34 = [v4 decodeObjectOfClasses:v33 forKey:@"ExcludeRoutes"];
    excludedRoutes = v5->_excludedRoutes;
    v5->_excludedRoutes = (NSArray *)v34;

    v5->_overridePrimary = [v4 decodeBoolForKey:@"OverridePrimary"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  objc_msgSend(v9, "encodeInt32:forKey:", -[NEIPv4Settings configMethod](self, "configMethod"), @"ConfigMethod");
  -[NEIPv4Settings addresses](self, "addresses");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 encodeObject:v4 forKey:@"AddressArray"];
  v5 = -[NEIPv4Settings subnetMasks](self, "subnetMasks");
  [v9 encodeObject:v5 forKey:@"SubnetMaskArray"];
  v6 = -[NEIPv4Settings router](self, "router");
  [v9 encodeObject:v6 forKey:@"Router"];

  -[NEIPv4Settings includedRoutes](self, "includedRoutes");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 encodeObject:v7 forKey:@"IncludeRoutes"];
  v8 = -[NEIPv4Settings excludedRoutes](self, "excludedRoutes");
  [v9 encodeObject:v8 forKey:@"ExcludeRoutes"];

  objc_msgSend( v9,  "encodeBool:forKey:",  -[NEIPv4Settings overridePrimary](self, "overridePrimary"),  @"OverridePrimary");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[NEIPv4Settings allocWithZone:](&OBJC_CLASS___NEIPv4Settings, "allocWithZone:", a3);
  v5 = -[NEIPv4Settings addresses](self, "addresses");
  v6 = -[NEIPv4Settings subnetMasks](self, "subnetMasks");
  uint64_t v7 = -[NEIPv4Settings initWithAddresses:subnetMasks:](v4, "initWithAddresses:subnetMasks:", v5, v6);

  -[NEIPv4Settings setConfigMethod:](v7, "setConfigMethod:", -[NEIPv4Settings configMethod](self, "configMethod"));
  v8 = -[NEIPv4Settings router](self, "router");
  -[NEIPv4Settings setRouter:](v7, "setRouter:", v8);

  -[NEIPv4Settings includedRoutes](self, "includedRoutes");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIPv4Settings setIncludedRoutes:](v7, "setIncludedRoutes:", v9);

  -[NEIPv4Settings excludedRoutes](self, "excludedRoutes");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIPv4Settings setExcludedRoutes:](v7, "setExcludedRoutes:", v10);

  -[NEIPv4Settings setOverridePrimary:]( v7,  "setOverridePrimary:",  -[NEIPv4Settings overridePrimary](self, "overridePrimary"));
  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  if (-[NEIPv4Settings configMethod](self, "configMethod", a3) != 3) {
    return 1;
  }
  -[NEIPv4Settings addresses](self, "addresses");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 count];

  if (v5)
  {
    v6 = -[NEIPv4Settings addresses](self, "addresses");
    id v7 = [v6 objectAtIndexedSubscript:0];
    int v8 = inet_pton(2, (const char *)[v7 UTF8String], v46);

    if (v8) {
      goto LABEL_8;
    }
    ne_log_obj();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v10 = "Invalid IPv4 address";
LABEL_43:
      _os_log_error_impl(&dword_1876B1000, v9, OS_LOG_TYPE_ERROR, v10, buf, 2u);
    }
  }

  else
  {
    ne_log_obj();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v10 = "Missing IPv4 address";
      goto LABEL_43;
    }
  }

LABEL_8:
  v11 = -[NEIPv4Settings subnetMasks](self, "subnetMasks");
  uint64_t v12 = [v11 count];
  v13 = -[NEIPv4Settings addresses](self, "addresses");
  uint64_t v14 = [v13 count];

  if (v12 != v14)
  {
    ne_log_obj();
    objc_super v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1876B1000, v15, OS_LOG_TYPE_ERROR, "Missing IPv4 subnet mask", buf, 2u);
    }
  }

  -[NEIPv4Settings subnetMasks](self, "subnetMasks");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v16 count])
  {
    v17 = -[NEIPv4Settings subnetMasks](self, "subnetMasks");
    id v18 = [v17 objectAtIndexedSubscript:0];
    int v19 = inet_pton(2, (const char *)[v18 UTF8String], v46);

    if (v19) {
      goto LABEL_17;
    }
    ne_log_obj();
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1876B1000, (os_log_t)v16, OS_LOG_TYPE_ERROR, "Invalid IPv4 subnet mask", buf, 2u);
    }
  }

LABEL_17:
  uint64_t v20 = -[NEIPv4Settings router](self, "router");
  if (v20)
  {
    uint64_t v21 = (void *)v20;
    id v22 = -[NEIPv4Settings router](self, "router");
    int v23 = inet_pton(2, (const char *)[v22 UTF8String], v46);

    if (!v23)
    {
      ne_log_obj();
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1876B1000, v24, OS_LOG_TYPE_ERROR, "Invalid IPv4 router", buf, 2u);
      }
    }
  }

  id v25 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  v26 = -[NEIPv4Settings includedRoutes](self, "includedRoutes");
  uint64_t v27 = [v26 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v43;
    do
    {
      for (uint64_t i = 0LL; i != v28; ++i)
      {
        if (*(void *)v43 != v29) {
          objc_enumerationMutation(v26);
        }
        [*(id *)(*((void *)&v42 + 1) + 8 * i) checkValidityAndCollectErrors:v25];
      }

      uint64_t v28 = [v26 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }

    while (v28);
  }

  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  v31 = -[NEIPv4Settings excludedRoutes](self, "excludedRoutes", 0LL);
  uint64_t v32 = [v31 countByEnumeratingWithState:&v38 objects:v49 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v39;
    do
    {
      for (uint64_t j = 0LL; j != v33; ++j)
      {
        if (*(void *)v39 != v34) {
          objc_enumerationMutation(v31);
        }
        [*(id *)(*((void *)&v38 + 1) + 8 * j) checkValidityAndCollectErrors:v25];
      }

      uint64_t v33 = [v31 countByEnumeratingWithState:&v38 objects:v49 count:16];
    }

    while (v33);
  }

  if ([v25 count])
  {
    ne_log_obj();
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v48 = v25;
      _os_log_error_impl(&dword_1876B1000, v36, OS_LOG_TYPE_ERROR, "IPv4 routes are invalid: %@", buf, 0xCu);
    }
  }

  return 1;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  unint64_t v8 = a4 & 0xFFFFFFFFFFFFFFF7LL;
  unint64_t v9 = -[NEIPv4Settings configMethod](self, "configMethod") - 1;
  if (v9 <= 2) {
    [v7 appendPrettyObject:off_18A08E460[v9] withName:@"configMethod" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];
  }
  -[NEIPv4Settings addresses](self, "addresses");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v11 = a4 | 9;
  [v7 appendPrettyObject:v10 withName:@"addresses" andIndent:v5 options:a4 | 9];

  -[NEIPv4Settings subnetMasks](self, "subnetMasks");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v13 = a4 | 8;
  [v7 appendPrettyObject:v12 withName:@"subnetMasks" andIndent:v5 options:v13];

  -[NEIPv4Settings router](self, "router");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v14 withName:@"router" andIndent:v5 options:v11];

  -[NEIPv4Settings includedRoutes](self, "includedRoutes");
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v15 withName:@"includedRoutes" andIndent:v5 options:v13];

  -[NEIPv4Settings excludedRoutes](self, "excludedRoutes");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v16 withName:@"excludedRoutes" andIndent:v5 options:v13];

  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEIPv4Settings overridePrimary](self, "overridePrimary"),  @"overridePrimary",  v5,  v8);
  return v7;
}

- (id)copyLegacyDictionary
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (-[NEIPv4Settings configMethod](self, "configMethod") == 2)
  {
    id v4 = (void *)MEMORY[0x18960CB18];
LABEL_5:
    [v3 setObject:*v4 forKeyedSubscript:*MEMORY[0x18960C6D0]];
    goto LABEL_6;
  }

  if (-[NEIPv4Settings configMethod](self, "configMethod") == 1)
  {
    id v4 = (void *)MEMORY[0x18960CAF8];
    goto LABEL_5;
  }

  if (-[NEIPv4Settings configMethod](self, "configMethod") == 3)
  {
    [v3 setObject:*MEMORY[0x18960CB10] forKeyedSubscript:*MEMORY[0x18960CB10]];
    -[NEIPv4Settings addresses](self, "addresses");
    id v25 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = [v25 count];

    if (v26)
    {
      -[NEIPv4Settings addresses](self, "addresses");
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 setObject:v27 forKeyedSubscript:*MEMORY[0x18960C6C0]];
    }

    -[NEIPv4Settings subnetMasks](self, "subnetMasks");
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v29 = [v28 count];

    if (v29)
    {
      v30 = -[NEIPv4Settings subnetMasks](self, "subnetMasks");
      [v3 setObject:v30 forKeyedSubscript:*MEMORY[0x18960C720]];
    }
    v31 = -[NEIPv4Settings router](self, "router");
    if (v31)
    {
      -[NEIPv4Settings router](self, "router");
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 setObject:v32 forKeyedSubscript:*MEMORY[0x18960C718]];
    }
  }

- (id)initFromLegacyDictionary:(id)a3
{
  uint64_t v75 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = -[NEIPv4Settings initWithConfigMethod:](self, "initWithConfigMethod:", 2LL);
  if (!v6) {
    goto LABEL_54;
  }
  [v5 objectForKeyedSubscript:*MEMORY[0x18960C6D0]];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (isa_nsstring(v7))
  {
    if ([v7 isEqualToString:*MEMORY[0x18960CB18]])
    {
      uint64_t v8 = 2LL;
LABEL_9:
      v6->_configMethod = v8;
      goto LABEL_10;
    }

    if ([v7 isEqualToString:*MEMORY[0x18960CAF8]])
    {
      uint64_t v8 = 1LL;
      goto LABEL_9;
    }

    if ([v7 isEqualToString:*MEMORY[0x18960CB10]])
    {
      uint64_t v8 = 3LL;
      goto LABEL_9;
    }

    if ([v7 isEqualToString:@"Off"])
    {

      id v6 = 0LL;
      goto LABEL_54;
    }
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
  return (NSArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSArray)subnetMasks
{
  return (NSArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSString)router
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setRouter:(NSString *)router
{
}

- (NSArray)includedRoutes
{
  return (NSArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setIncludedRoutes:(NSArray *)includedRoutes
{
}

- (NSArray)excludedRoutes
{
  return (NSArray *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setExcludedRoutes:(NSArray *)excludedRoutes
{
}

- (BOOL)overridePrimary
{
  return self->_overridePrimary;
}

- (void)setOverridePrimary:(BOOL)a3
{
  self->_overridePrimary = a3;
}

- (int64_t)configMethod
{
  return self->_configMethod;
}

- (void)setConfigMethod:(int64_t)a3
{
  self->_configMethod = a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NEIPv4Settings)settingsWithAutomaticAddressing
{
  return  -[NEIPv4Settings initWithConfigMethod:]( objc_alloc(&OBJC_CLASS___NEIPv4Settings),  "initWithConfigMethod:",  1LL);
}

@end