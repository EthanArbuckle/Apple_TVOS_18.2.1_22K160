@interface NEAppRule
+ (BOOL)supportsSecureCoding;
- (BOOL)allowEmptyDesignatedRequirement;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)noDivertDNS;
- (BOOL)noRestriction;
- (BOOL)overlapsWithRule:(id)a3;
- (BOOL)signingIdentifierAllowed:(id)a3 domainsOrAccountsRequired:(BOOL *)a4;
- (NEAppRule)initWithCoder:(id)a3;
- (NEAppRule)initWithSigningIdentifier:(NSString *)signingIdentifier;
- (NSArray)cachedMachOUUIDs;
- (NSArray)matchAccountIdentifiers;
- (NSArray)matchDomains;
- (NSArray)matchTools;
- (NSString)matchDesignatedRequirement;
- (NSString)matchPath;
- (NSString)matchSigningIdentifier;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowEmptyDesignatedRequirement:(BOOL)a3;
- (void)setCachedMachOUUIDs:(id)a3;
- (void)setMatchAccountIdentifiers:(id)a3;
- (void)setMatchDomains:(NSArray *)matchDomains;
- (void)setMatchPath:(NSString *)matchPath;
- (void)setMatchTools:(NSArray *)matchTools;
- (void)setNoDivertDNS:(BOOL)a3;
- (void)setNoRestriction:(BOOL)a3;
@end

@implementation NEAppRule

- (NEAppRule)initWithSigningIdentifier:(NSString *)signingIdentifier
{
  v4 = signingIdentifier;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NEAppRule;
  v5 = -[NEAppRule init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = -[NSString copy](v4, "copy");
    matchSigningIdentifier = v5->_matchSigningIdentifier;
    v5->_matchSigningIdentifier = (NSString *)v6;

    v5->_noRestriction = 1;
  }

  return v5;
}

- (NEAppRule)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___NEAppRule;
  v5 = -[NEAppRule init](&v21, sel_init);
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x189604010];
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
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"MatchAccountIdentifiers"];
    matchAccountIdentifiers = v5->_matchAccountIdentifiers;
    v5->_matchAccountIdentifiers = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SigningIdentifier"];
    matchSigningIdentifier = v5->_matchSigningIdentifier;
    v5->_matchSigningIdentifier = (NSString *)v16;

    v5->_allowEmptyDesignatedRequirement = [v4 decodeBoolForKey:@"AllowEmptyDesignatedRequirement"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Path"];
    matchPath = v5->_matchPath;
    v5->_matchPath = (NSString *)v18;

    v5->_noDivertDNS = [v4 decodeBoolForKey:@"NoDivertDNS"];
  }

  return v5;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___NEAppRule;
  -[NEAppRule dealloc](&v2, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  -[NEAppRule matchDomains](self, "matchDomains");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 encodeObject:v4 forKey:@"MatchDomains"];
  v5 = -[NEAppRule matchAccountIdentifiers](self, "matchAccountIdentifiers");
  [v8 encodeObject:v5 forKey:@"MatchAccountIdentifiers"];

  -[NEAppRule matchSigningIdentifier](self, "matchSigningIdentifier");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 encodeObject:v6 forKey:@"SigningIdentifier"];

  objc_msgSend( v8,  "encodeBool:forKey:",  -[NEAppRule allowEmptyDesignatedRequirement](self, "allowEmptyDesignatedRequirement"),  @"AllowEmptyDesignatedRequirement");
  -[NEAppRule matchPath](self, "matchPath");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 encodeObject:v7 forKey:@"Path"];

  objc_msgSend(v8, "encodeBool:forKey:", -[NEAppRule noDivertDNS](self, "noDivertDNS"), @"NoDivertDNS");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = -[NEAppRule matchSigningIdentifier](self, "matchSigningIdentifier");
  uint64_t v6 = (void *)[v4 initWithSigningIdentifier:v5];

  -[NEAppRule matchPath](self, "matchPath");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setMatchPath:v7];

  -[NEAppRule matchDomains](self, "matchDomains");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setMatchDomains:v8];

  -[NEAppRule matchAccountIdentifiers](self, "matchAccountIdentifiers");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setMatchAccountIdentifiers:v9];

  objc_msgSend(v6, "setNoDivertDNS:", -[NEAppRule noDivertDNS](self, "noDivertDNS"));
  objc_msgSend( v6,  "setAllowEmptyDesignatedRequirement:",  -[NEAppRule allowEmptyDesignatedRequirement](self, "allowEmptyDesignatedRequirement"));
  return v6;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  char v36 = 0;
  v5 = -[NEAppRule matchSigningIdentifier](self, "matchSigningIdentifier");
  if (v5)
  {
    -[NEAppRule matchSigningIdentifier](self, "matchSigningIdentifier");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v7 = -[NEAppRule signingIdentifierAllowed:domainsOrAccountsRequired:]( self,  "signingIdentifierAllowed:domainsOrAccountsRequired:",  v6,  &v36);

    if (v7)
    {
      char v8 = 1;
      goto LABEL_7;
    }

    uint64_t v9 = (void *)NSString;
    v10 = -[NEAppRule matchSigningIdentifier](self, "matchSigningIdentifier");
    [v9 stringWithFormat:@"Dis-allowed app rule signing identifier (starts with com.apple): %@", v10];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, v11, v4);
  }

  else
  {
    +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Missing signing identifier in app rule match executable",  v4);
  }

  char v8 = 0;
LABEL_7:
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  -[NEAppRule matchDomains](self, "matchDomains");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v38 count:16];
  uint64_t v27 = v13;
  if (v13)
  {
    uint64_t v14 = *(void *)v33;
    uint64_t v15 = v13;
    do
    {
      for (uint64_t i = 0LL; i != v15; ++i)
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(v12);
        }
        if ((isa_nsstring(*(void **)(*((void *)&v32 + 1) + 8 * i)) & 1) == 0)
        {
          +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Invalid app rule match domain",  v4);
          char v8 = 0;
        }
      }

      uint64_t v15 = [v12 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }

    while (v15);
  }

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  v17 = -[NEAppRule matchAccountIdentifiers](self, "matchAccountIdentifiers");
  uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v37 count:16];
  uint64_t v19 = v18;
  if (v18)
  {
    uint64_t v20 = *(void *)v29;
    uint64_t v21 = v18;
    do
    {
      for (uint64_t j = 0LL; j != v21; ++j)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v17);
        }
        if ((isa_nsstring(*(void **)(*((void *)&v28 + 1) + 8 * j)) & 1) == 0)
        {
          +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Invalid account identifier",  v4);
          char v8 = 0;
        }
      }

      uint64_t v21 = [v17 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }

    while (v21);
  }

  if ((ne_session_disable_restrictions() & 1) == 0)
  {
    if (!(v19 | v27) && v36)
    {
      +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"At least one match domain or match account identifier is required for this app rule",  v4);
LABEL_32:
      char v8 = 0;
      goto LABEL_33;
    }

    if (v19 | v27 && !v36)
    {
      v23 = (void *)NSString;
      v24 = -[NEAppRule matchSigningIdentifier](self, "matchSigningIdentifier");
      [v23 stringWithFormat:@"App rule matching %@ cannot have matchDomains or matchAccountIdentifiers", v24];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, v25, v4);

      goto LABEL_32;
    }
  }

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  BOOL v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  unint64_t v8 = a4 & 0xFFFFFFFFFFFFFFF7LL;
  -[NEAppRule matchSigningIdentifier](self, "matchSigningIdentifier");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  a4 |= 8uLL;
  [v7 appendPrettyObject:v9 withName:@"matchSigningIdentifier" andIndent:v5 options:a4];
  v10 = -[NEAppRule matchPath](self, "matchPath");
  [v7 appendPrettyObject:v10 withName:@"matchPath" andIndent:v5 options:a4];
  v11 = -[NEAppRule matchDomains](self, "matchDomains");
  [v7 appendPrettyObject:v11 withName:@"matchDomains" andIndent:v5 options:a4];

  -[NEAppRule matchAccountIdentifiers](self, "matchAccountIdentifiers");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v12 withName:@"accountIdentifiers" andIndent:v5 options:v8];

  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEAppRule allowEmptyDesignatedRequirement](self, "allowEmptyDesignatedRequirement"),  @"allowEmptyDesignatedRequirement",  v5,  v8);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEAppRule noDivertDNS](self, "noDivertDNS"),  @"noDivertDNS",  v5,  v8);
  return v7;
}

- (id)copyLegacyDictionary
{
  v14[1] = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
  -[NEAppRule matchSigningIdentifier](self, "matchSigningIdentifier");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NEAppRule matchSigningIdentifier](self, "matchSigningIdentifier");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x18960CBA0]];

    -[NEAppRule matchSigningIdentifier](self, "matchSigningIdentifier");
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x18960CB98]];
  }

  v14[0] = v4;
  [MEMORY[0x189603F18] arrayWithObjects:v14 count:1];
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x18960CB90]];

  -[NEAppRule matchDomains](self, "matchDomains");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = -[NEAppRule matchDomains](self, "matchDomains");
    [v3 setObject:v10 forKeyedSubscript:*MEMORY[0x18960CB88]];
  }
  v11 = -[NEAppRule matchAccountIdentifiers](self, "matchAccountIdentifiers");
  if (v11)
  {
    -[NEAppRule matchAccountIdentifiers](self, "matchAccountIdentifiers");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v12 forKeyedSubscript:*MEMORY[0x18960CB80]];
  }

  return v3;
}

- (id)initFromLegacyDictionary:(id)a3
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)&OBJC_CLASS___NEAppRule;
  uint64_t v5 = -[NEAppRule init](&v47, sel_init);
  if (v5)
  {
    uint64_t v6 = *MEMORY[0x18960CB90];
    [v4 objectForKeyedSubscript:*MEMORY[0x18960CB90]];
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    int v8 = isa_nsarray(v7);

    if (v8)
    {
      [v4 objectForKeyedSubscript:v6];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v9 count])
      {
        [v9 objectAtIndexedSubscript:0];
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v11 = *MEMORY[0x18960CB98];
        [v10 objectForKeyedSubscript:*MEMORY[0x18960CB98]];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        int v13 = isa_nsstring(v12);

        if (v13)
        {
          [v10 objectForKeyedSubscript:v11];
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v15 = [v14 copy];
          matchSigningIdentifier = v5->_matchSigningIdentifier;
          v5->_matchSigningIdentifier = (NSString *)v15;
        }
      }
    }

    uint64_t v17 = *MEMORY[0x18960CB88];
    [v4 objectForKeyedSubscript:*MEMORY[0x18960CB88]];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    int v19 = isa_nsarray(v18);

    if (v19)
    {
      [v4 objectForKeyedSubscript:v17];
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      uint64_t v20 = (NSArray *)(id)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = -[NSArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v43,  v49,  16LL);
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v44;
        while (2)
        {
          uint64_t v24 = 0LL;
          do
          {
            if (*(void *)v44 != v23) {
              objc_enumerationMutation(v20);
            }
            if (!isa_nsstring(*(void **)(*((void *)&v43 + 1) + 8 * v24)))
            {
              matchDomains = v20;
              goto LABEL_19;
            }

            ++v24;
          }

          while (v22 != v24);
          uint64_t v22 = -[NSArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v43,  v49,  16LL);
          if (v22) {
            continue;
          }
          break;
        }
      }

      uint64_t v25 = -[NSArray copy](v20, "copy");
      matchDomains = v5->_matchDomains;
      v5->_matchDomains = (NSArray *)v25;
LABEL_19:
    }

    uint64_t v27 = *MEMORY[0x18960CB80];
    [v4 objectForKeyedSubscript:*MEMORY[0x18960CB80]];
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue();
    int v29 = isa_nsarray(v28);

    if (v29)
    {
      [v4 objectForKeyedSubscript:v27];
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      __int128 v30 = (NSArray *)(id)objc_claimAutoreleasedReturnValue();
      uint64_t v31 = -[NSArray countByEnumeratingWithState:objects:count:]( v30,  "countByEnumeratingWithState:objects:count:",  &v39,  v48,  16LL);
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v40;
        while (2)
        {
          uint64_t v34 = 0LL;
          do
          {
            if (*(void *)v40 != v33) {
              objc_enumerationMutation(v30);
            }
            if (!isa_nsstring(*(void **)(*((void *)&v39 + 1) + 8 * v34)))
            {
              matchAccountIdentifiers = v30;
              goto LABEL_31;
            }

            ++v34;
          }

          while (v32 != v34);
          uint64_t v32 = -[NSArray countByEnumeratingWithState:objects:count:]( v30,  "countByEnumeratingWithState:objects:count:",  &v39,  v48,  16LL);
          if (v32) {
            continue;
          }
          break;
        }
      }

      uint64_t v35 = -[NSArray copy](v30, "copy", (void)v39);
      matchAccountIdentifiers = v5->_matchAccountIdentifiers;
      v5->_matchAccountIdentifiers = (NSArray *)v35;
LABEL_31:
    }

    v37 = v5;
  }

  return v5;
}

- (BOOL)overlapsWithRule:(id)a3
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[NEAppRule matchSigningIdentifier](self, "matchSigningIdentifier");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 matchSigningIdentifier];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = [v5 isEqualToString:v6];

  if (!v7) {
    goto LABEL_46;
  }
  -[NEAppRule matchDomains](self, "matchDomains");
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v8 count])
  {
  }

  else
  {
    [v4 matchDomains];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 count];

    if (!v10)
    {
      int v30 = 0;
      char v16 = 0;
      goto LABEL_24;
    }
  }

  -[NEAppRule matchDomains](self, "matchDomains");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v11 count])
  {

    goto LABEL_21;
  }

  [v4 matchDomains];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 count];

  if (!v13)
  {
LABEL_21:
    int v30 = 1;
    char v16 = 1;
    goto LABEL_24;
  }

  -[NEAppRule matchDomains](self, "matchDomains");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v14 count];

  char v16 = 0;
  if (v15)
  {
    unint64_t v17 = 0LL;
    do
    {
      -[NEAppRule matchDomains](self, "matchDomains");
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 objectAtIndexedSubscript:v17];
      int v19 = (void *)objc_claimAutoreleasedReturnValue();

      [v4 matchDomains];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = [v20 count];
      int v22 = v16 & 1;

      if (v21 && (v16 & 1) == 0)
      {
        unint64_t v23 = 1LL;
        do
        {
          [v4 matchDomains];
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
          [v24 objectAtIndexedSubscript:v23 - 1];
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();

          [v4 matchDomains];
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          unint64_t v27 = [v26 count];
          int v22 = v16 & 1;

          if (v23 >= v27) {
            break;
          }
          ++v23;
        }

        while ((v16 & 1) == 0);
      }

      ++v17;
      -[NEAppRule matchDomains](self, "matchDomains");
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v29 = [v28 count];

      int v30 = 1;
    }

    while (v17 < v29 && !v22);
  }

  else
  {
    int v30 = 1;
  }

- (BOOL)signingIdentifierAllowed:(id)a3 domainsOrAccountsRequired:(BOOL *)a4
{
  id v5 = a3;
  *a4 = 0;
  if ([v5 hasPrefix:@"com.apple."])
  {
    uint64_t v6 = 0LL;
    while (strcmp( (const char *)[v5 UTF8String], (&signingIdentifierAllowed_domainsOrAccountsRequired__com_apple_exceptions)[v6]))
    {
      v6 += 2LL;
      if (v6 == 24) {
        goto LABEL_7;
      }
    }

    *a4 = 1;
  }

- (NSString)matchSigningIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSString)matchDesignatedRequirement
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSString)matchPath
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setMatchPath:(NSString *)matchPath
{
}

- (NSArray)matchDomains
{
  return (NSArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setMatchDomains:(NSArray *)matchDomains
{
}

- (NSArray)matchTools
{
  return (NSArray *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setMatchTools:(NSArray *)matchTools
{
}

- (BOOL)noRestriction
{
  return self->_noRestriction;
}

- (void)setNoRestriction:(BOOL)a3
{
  self->_noRestriction = a3;
}

- (NSArray)cachedMachOUUIDs
{
  return (NSArray *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setCachedMachOUUIDs:(id)a3
{
}

- (NSArray)matchAccountIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setMatchAccountIdentifiers:(id)a3
{
}

- (BOOL)noDivertDNS
{
  return self->_noDivertDNS;
}

- (void)setNoDivertDNS:(BOOL)a3
{
  self->_noDivertDNS = a3;
}

- (BOOL)allowEmptyDesignatedRequirement
{
  return self->_allowEmptyDesignatedRequirement;
}

- (void)setAllowEmptyDesignatedRequirement:(BOOL)a3
{
  self->_allowEmptyDesignatedRequirement = a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end