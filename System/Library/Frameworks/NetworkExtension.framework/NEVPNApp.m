@interface NEVPNApp
+ (BOOL)compareAppRules:(id)a3 newAppRules:(id)a4 noExistingDomain:(BOOL *)a5;
+ (BOOL)supportsSecureCoding;
+ (id)findRuleWithSameDomains:(id)a3 matchSigningIdentifier:(id)a4 startIndex:(int64_t *)a5;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)installSigningIdentifiersWithFlowDivertControlSocket:(int)a3;
- (BOOL)noRestriction;
- (BOOL)removeAppRuleByID:(id)a3;
- (BOOL)restrictDomains;
- (NEVPNApp)init;
- (NEVPNApp)initWithCoder:(id)a3;
- (NSArray)appRules;
- (NSArray)excludedDomains;
- (id)copyAppRuleByID:(id)a3;
- (id)copyAppRuleIDs;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAppRules:(id)a3;
- (void)setExcludedDomains:(id)a3;
- (void)setNoRestriction:(BOOL)a3;
- (void)setRestrictDomains:(BOOL)a3;
- (void)updateAppRulesForUID:(unsigned int)a3;
@end

@implementation NEVPNApp

- (NEVPNApp)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NEVPNApp;
  v2 = -[NEVPN init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NEVPN setEnabled:](v2, "setEnabled:", 1LL);
    -[NEVPN setTunnelType:](v3, "setTunnelType:", 2LL);
    v3->_noRestriction = 1;
  }

  return v3;
}

- (NEVPNApp)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NEVPNApp;
  objc_super v5 = -[NEVPN initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x189604010];
    uint64_t v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Rules"];
    appRules = v5->_appRules;
    v5->_appRules = (NSArray *)v9;

    v11 = (void *)MEMORY[0x189604010];
    uint64_t v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"ExcludedDomains"];
    excludedDomains = v5->_excludedDomains;
    v5->_excludedDomains = (NSArray *)v14;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NEVPNApp;
  id v4 = a3;
  -[NEVPN encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[NEVPNApp appRules](self, "appRules", v7.receiver, v7.super_class);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"Rules"];
  v6 = -[NEVPNApp excludedDomains](self, "excludedDomains");
  [v4 encodeObject:v6 forKey:@"ExcludedDomains"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NEVPNApp;
  id v4 = -[NEVPN copyWithZone:](&v13, sel_copyWithZone_, a3);
  -[NEVPNApp appRules](self, "appRules");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x189603F18]);
    -[NEVPNApp appRules](self, "appRules");
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)[v6 initWithArray:v7 copyItems:1];
    [v4 setAppRules:v8];
  }

  id v9 = objc_alloc(MEMORY[0x189603F18]);
  v10 = -[NEVPNApp excludedDomains](self, "excludedDomains");
  v11 = (void *)[v9 initWithArray:v10 copyItems:1];
  [v4 setExcludedDomains:v11];

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v100 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v94.receiver = self;
  v94.super_class = (Class)&OBJC_CLASS___NEVPNApp;
  BOOL v5 = -[NEVPN checkValidityAndCollectErrors:](&v94, sel_checkValidityAndCollectErrors_, v4);
  -[NEVPNApp appRules](self, "appRules");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    __int128 v92 = 0u;
    __int128 v93 = 0u;
    __int128 v90 = 0u;
    __int128 v91 = 0u;
    v72 = self;
    -[NEVPNApp appRules](self, "appRules");
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v90 objects:v99 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v91;
      do
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          BOOL v12 = v5;
          if (*(void *)v91 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_super v13 = *(void **)(*((void *)&v90 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            else {
              BOOL v5 = 0;
            }
          }

          else
          {
            +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, @"Invalid app rule", v4);
            BOOL v5 = 0;
          }
        }

        uint64_t v9 = [v7 countByEnumeratingWithState:&v90 objects:v99 count:16];
      }

      while (v9);
    }

    LOBYTE(v5) = v5;
    self = v72;
  }

  -[NEVPNApp excludedDomains](self, "excludedDomains");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v14 count];

  if (v15)
  {
    __int128 v88 = 0u;
    __int128 v89 = 0u;
    __int128 v86 = 0u;
    __int128 v87 = 0u;
    v16 = -[NEVPNApp excludedDomains](self, "excludedDomains");
    uint64_t v17 = [v16 countByEnumeratingWithState:&v86 objects:v98 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      BOOL v19 = v5;
      uint64_t v20 = *(void *)v87;
      while (2)
      {
        for (uint64_t j = 0LL; j != v18; ++j)
        {
          if (*(void *)v87 != v20) {
            objc_enumerationMutation(v16);
          }
          v22 = *(void **)(*((void *)&v86 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || ![v22 length])
          {
            NEResourcesCopyLocalizedNSString( @"APP_VPN_EMPTY_EXCLUDED_DOMAIN",  @"APP_VPN_EMPTY_EXCLUDED_DOMAIN");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, v23, v4);

            LOBYTE(v5) = 0;
            goto LABEL_27;
          }
        }

        uint64_t v18 = [v16 countByEnumeratingWithState:&v86 objects:v98 count:16];
        if (v18) {
          continue;
        }
        break;
      }

      LOBYTE(v5) = v19;
    }

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc(MEMORY[0x189607940]);
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NEVPNApp;
  -[NEVPN descriptionWithIndent:options:](&v13, sel_descriptionWithIndent_options_, v5, a4);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = (void *)[v7 initWithString:v8];

  -[NEVPNApp appRules](self, "appRules");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 appendPrettyObject:v10 withName:@"appRules" andIndent:v5 options:a4];
  v11 = -[NEVPNApp excludedDomains](self, "excludedDomains");
  [v9 appendPrettyObject:v11 withName:@"excludedDomains" andIndent:v5 options:a4];

  return v9;
}

- (id)initFromLegacyDictionary:(id)a3
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___NEVPNApp;
  id v5 = -[NEVPN initFromLegacyDictionary:](&v27, sel_initFromLegacyDictionary_, v4);
  if (v5)
  {
    uint64_t v6 = *MEMORY[0x18960CA20];
    [v4 objectForKeyedSubscript:*MEMORY[0x18960CA20]];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    char v8 = isa_nsnumber(v7);

    if ((v8 & 1) != 0
      || (uint64_t v6 = *MEMORY[0x18960CA18],
          [v4 objectForKeyedSubscript:*MEMORY[0x18960CA18]],
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(),
          int v10 = isa_nsnumber(v9),
          v9,
          v10))
    {
      [v4 objectForKeyedSubscript:v6];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setOnDemandEnabled:", objc_msgSend(v11, "BOOLValue"));
    }

    [v4 objectForKeyedSubscript:*MEMORY[0x18960C988]];
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsarray(v12))
    {
      id v13 = objc_alloc_init(MEMORY[0x189603FA8]);
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      id v14 = v12;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v24;
        do
        {
          for (uint64_t i = 0LL; i != v16; ++i)
          {
            if (*(void *)v24 != v17) {
              objc_enumerationMutation(v14);
            }
            BOOL v19 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            if (isa_nsdictionary(v19))
            {
              uint64_t v20 = objc_alloc(&OBJC_CLASS___NEAppRule);
              id v21 = -[NEAppRule initFromLegacyDictionary:](v20, "initFromLegacyDictionary:", v19, (void)v23);
              if (v21) {
                [v13 addObject:v21];
              }
            }
          }

          uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }

        while (v16);
      }

      if ([v13 count]) {
        [v5 setAppRules:v13];
      }
    }
  }

  return v5;
}

- (id)copyLegacyDictionary
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NEVPNApp;
  id v3 = -[NEVPN copyLegacyDictionary](&v6, sel_copyLegacyDictionary);
  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[NEVPN isOnDemandEnabled](self, "isOnDemandEnabled"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x18960CA20]];

  return v3;
}

- (id)copyAppRuleByID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  objc_super v6 = v5->_appRules;
  id v7 = (void *)-[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        int v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        objc_msgSend(v10, "matchSigningIdentifier", (void)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v7 = (void *)[v10 copy];
          goto LABEL_11;
        }
      }

      id v7 = (void *)-[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

- (BOOL)removeAppRuleByID:(id)a3
{
  id v4 = a3;
  p_appRules = &self->_appRules;
  objc_super v6 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithArray:self->_appRules];
  if ([v6 count])
  {
    uint64_t v7 = 0LL;
    while (1)
    {
      [v6 objectAtIndex:v7];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 matchSigningIdentifier];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      int v10 = [v9 isEqualToString:v4];

      if (v10) {
        break;
      }
    }

    [v6 removeObjectAtIndex:v7];
    objc_storeStrong((id *)p_appRules, v6);

    BOOL v11 = 1;
  }

  else
  {
LABEL_5:
    BOOL v11 = 0;
  }

  return v11;
}

- (id)copyAppRuleIDs
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  -[NSArray count](self->_appRules, "count"));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = self->_appRules;
  uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v8), "matchSigningIdentifier", (void)v12);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 addObject:v9];

        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v6);
  }

  int v10 = (void *)[v3 copy];
  return v10;
}

- (BOOL)installSigningIdentifiersWithFlowDivertControlSocket:(int)a3
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  int v51 = 0;
  uint64_t v50 = 0LL;
  if (self)
  {
    id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    -[NEVPNApp appRules](self, "appRules");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v52 objects:buf count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v53;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v53 != v8) {
            objc_enumerationMutation(v5);
          }
          int v10 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          uint64_t v11 = [v10 matchSigningIdentifier];
          if (v11)
          {
            __int128 v12 = (void *)v11;
            [v10 matchSigningIdentifier];
            __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
            [v4 objectForKeyedSubscript:v13];
            __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v14)
            {
              [v10 matchSigningIdentifier];
              __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
              [v10 matchSigningIdentifier];
              __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
              [v4 setObject:v15 forKeyedSubscript:v16];
            }
          }
        }

        uint64_t v7 = [v5 countByEnumeratingWithState:&v52 objects:buf count:16];
      }

      while (v7);
    }

    [MEMORY[0x189603F68] dictionaryWithDictionary:v4];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  if (-[NEVPN tunnelType](self, "tunnelType") == 2)
  {
    if ([v17 count])
    {
      uint64_t v18 = (void *)NEFlowTLVMsgCreate();
      NEFlowTLVAdd();
      ssize_t v19 = send(a3, v18, v50 - *((void *)&v52 + 1), 0);
      uint64_t v20 = (CFAllocatorRef *)MEMORY[0x189604DB0];
      if (v19 < 0)
      {
        ne_log_obj();
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v40 = __error();
          uint64_t v41 = strerror(*v40);
          *(_DWORD *)buf = 136315138;
          v58 = v41;
          _os_log_error_impl( &dword_1876B1000,  v34,  OS_LOG_TYPE_ERROR,  "Failed to send a FLOW_DIVERT_PKT_APP_MAP_CREATE message: %s",  buf,  0xCu);
        }

        id v32 = 0LL;
        id v21 = 0LL;
      }

      else
      {
        CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x189604DB0], v18);
        id v21 = objc_alloc_init(MEMORY[0x189603FC8]);
        [v17 allKeys];
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v22 count])
        {
          uint64_t v23 = 0LL;
          uint64_t v24 = 0LL;
          unsigned int v25 = 0;
          do
          {
            if ([v22 count])
            {
              uint64_t v26 = 0LL;
              unsigned int v27 = 0;
              do
              {
                if (v25 != v27)
                {
                  [v22 objectAtIndexedSubscript:v23];
                  id v28 = (void *)objc_claimAutoreleasedReturnValue();
                  [v22 objectAtIndexedSubscript:v26];
                  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
                  [v28 commonPrefixWithString:v29 options:2];
                  v30 = (void *)objc_claimAutoreleasedReturnValue();

                  if ([v30 length]) {
                    [v21 setObject:v30 forKeyedSubscript:v30];
                  }
                }

                uint64_t v26 = ++v27;
              }

              while ([v22 count] > (unint64_t)v27);
            }

            id v31 = [v22 objectAtIndexedSubscript:v23];
            v24 += strlen((const char *)[v31 cStringUsingEncoding:1]);

            uint64_t v23 = ++v25;
          }

          while ([v22 count] > (unint64_t)v25);
          uint64_t v20 = (CFAllocatorRef *)MEMORY[0x189604DB0];
        }

        int v51 = [v21 count];
        [v22 count];
        uint64_t v18 = (void *)NEFlowTLVMsgCreate();
        NEFlowTLVAdd();
        __int128 v48 = 0u;
        __int128 v49 = 0u;
        __int128 v46 = 0u;
        __int128 v47 = 0u;
        id v32 = v22;
        uint64_t v35 = [v32 countByEnumeratingWithState:&v46 objects:v56 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = *(void *)v47;
          do
          {
            for (uint64_t j = 0LL; j != v36; ++j)
            {
              if (*(void *)v47 != v37) {
                objc_enumerationMutation(v32);
              }
              strlen((const char *)[*(id *)(*((void *)&v46 + 1) + 8 * j) cStringUsingEncoding:1]);
              NEFlowTLVAdd();
            }

            uint64_t v36 = [v32 countByEnumeratingWithState:&v46 objects:v56 count:16];
          }

          while (v36);
        }

        if ((send(a3, v18, v50 - *((void *)&v52 + 1), 0) & 0x8000000000000000LL) == 0)
        {
          BOOL v33 = 1;
          if (!v18) {
            goto LABEL_46;
          }
          goto LABEL_45;
        }

        ne_log_obj();
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          uint64_t v42 = (char *)(v50 - *((void *)&v52 + 1));
          uint64_t v43 = __error();
          v44 = strerror(*v43);
          *(_DWORD *)buf = 134218242;
          v58 = v42;
          __int16 v59 = 2080;
          v60 = v44;
          _os_log_error_impl( &dword_1876B1000,  v34,  OS_LOG_TYPE_ERROR,  "Failed to send a FLOW_DIVERT_PKT_APP_MAP_CREATE with size %lu bytes: %s",  buf,  0x16u);
        }
      }

      BOOL v33 = 0;
      if (v18) {
LABEL_45:
      }
        CFAllocatorDeallocate(*v20, v18);
    }

    else
    {
      id v32 = 0LL;
      id v21 = 0LL;
      BOOL v33 = 1;
    }
  }

  else
  {
    id v32 = 0LL;
    id v21 = 0LL;
    BOOL v33 = 0;
  }

- (void)updateAppRulesForUID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v48 = *MEMORY[0x1895F89C0];
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  obuint64_t j = self->_appRules;
  uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v42,  v47,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0LL;
    uint64_t v8 = *(void *)v43;
    uint64_t v9 = &off_18A087000;
    unsigned int v31 = v3;
    uint64_t v30 = *(void *)v43;
    do
    {
      uint64_t v10 = 0LL;
      uint64_t v32 = v6;
      do
      {
        if (*(void *)v43 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v42 + 1) + 8 * v10);
        [v11 matchSigningIdentifier];
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          __int128 v13 = v9[423];
          [v11 matchSigningIdentifier];
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
          id v41 = 0LL;
          [v13 bundleProxyForIdentifier:v14 uid:v3 plugins:&v41];
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
          id v16 = v41;

          uint64_t v36 = v16;
          if (v15 && [v16 count])
          {
            BOOL v33 = v15;
            uint64_t v34 = v10;
            __int128 v39 = 0u;
            __int128 v40 = 0u;
            __int128 v37 = 0u;
            __int128 v38 = 0u;
            id v17 = v16;
            uint64_t v18 = [v17 countByEnumeratingWithState:&v37 objects:v46 count:16];
            if (v18)
            {
              uint64_t v19 = v18;
              uint64_t v20 = *(void *)v38;
              do
              {
                for (uint64_t i = 0LL; i != v19; ++i)
                {
                  if (*(void *)v38 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  v22 = *(void **)(*((void *)&v37 + 1) + 8 * i);
                  [v22 identifier];
                  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
                  id v24 = -[NEVPNApp copyAppRuleByID:](self, "copyAppRuleByID:", v23);

                  if (!v24)
                  {
                    unsigned int v25 = objc_alloc(&OBJC_CLASS___NEAppRule);
                    [v22 identifier];
                    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
                    unsigned int v27 = -[NEAppRule initWithSigningIdentifier:](v25, "initWithSigningIdentifier:", v26);

                    if (v27)
                    {
                      if (!v7) {
                        id v7 = objc_alloc_init(MEMORY[0x189603FA8]);
                      }
                      [v7 addObject:v27];
                    }
                  }
                }

                uint64_t v19 = [v17 countByEnumeratingWithState:&v37 objects:v46 count:16];
              }

              while (v19);
            }

            uint64_t v3 = v31;
            uint64_t v8 = v30;
            uint64_t v6 = v32;
            __int128 v15 = v33;
            uint64_t v9 = &off_18A087000;
            uint64_t v10 = v34;
          }
        }

        ++v10;
      }

      while (v10 != v6);
      uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v42,  v47,  16LL);
    }

    while (v6);
  }

  else
  {
    id v7 = 0LL;
  }

  if ([v7 count])
  {
    -[NEVPNApp appRules](self, "appRules");
    id v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v28 arrayByAddingObjectsFromArray:v7];
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEVPNApp setAppRules:](self, "setAppRules:", v29);
  }
}

- (NSArray)appRules
{
  return (NSArray *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setAppRules:(id)a3
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

- (BOOL)restrictDomains
{
  return self->_restrictDomains;
}

- (void)setRestrictDomains:(BOOL)a3
{
  self->_restrictDomains = a3;
}

- (NSArray)excludedDomains
{
  return (NSArray *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setExcludedDomains:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)compareAppRules:(id)a3 newAppRules:(id)a4 noExistingDomain:(BOOL *)a5
{
  uint64_t v88 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (!v7 || ![v7 count])
  {
LABEL_53:
    BOOL v53 = 0;
    if (a5) {
      *a5 = 1;
    }
    goto LABEL_60;
  }

  __int128 v81 = 0u;
  __int128 v82 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v79 objects:v87 count:16];
  if (!v10)
  {

    goto LABEL_53;
  }

  uint64_t v11 = v10;
  id v60 = v7;
  int v12 = 0;
  uint64_t v13 = *(void *)v80;
  do
  {
    for (uint64_t i = 0LL; i != v11; ++i)
    {
      if (*(void *)v80 != v13) {
        objc_enumerationMutation(v9);
      }
      [*(id *)(*((void *)&v79 + 1) + 8 * i) matchDomains];
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 += [v15 count];
    }

    uint64_t v11 = [v9 countByEnumeratingWithState:&v79 objects:v87 count:16];
  }

  while (v11);

  id v7 = v60;
  if (!v12) {
    goto LABEL_53;
  }
  if (v8 && [v8 count])
  {
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    obuint64_t j = v9;
    id v61 = v8;
    uint64_t v58 = [obj countByEnumeratingWithState:&v75 objects:v86 count:16];
    if (v58)
    {
      id v56 = *(id *)v76;
      while (2)
      {
        for (uint64_t j = 0LL; j != v58; ++j)
        {
          if (*(id *)v76 != v56) {
            objc_enumerationMutation(obj);
          }
          id v17 = *(void **)(*((void *)&v75 + 1) + 8 * j);
          [v17 matchDomains];
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v19 = [v18 count];

          if (v19)
          {
            __int128 v73 = 0u;
            __int128 v74 = 0u;
            __int128 v71 = 0u;
            __int128 v72 = 0u;
            id v20 = v8;
            uint64_t v21 = [v20 countByEnumeratingWithState:&v71 objects:v85 count:16];
            if (v21)
            {
              uint64_t v22 = v21;
              uint64_t v23 = *(void *)v72;
LABEL_21:
              uint64_t v24 = 0LL;
              while (1)
              {
                if (*(void *)v72 != v23) {
                  objc_enumerationMutation(v20);
                }
                unsigned int v25 = *(void **)(*((void *)&v71 + 1) + 8 * v24);
                [v17 matchSigningIdentifier];
                uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
                [v25 matchSigningIdentifier];
                unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue();
                int v28 = [v26 isEqualToString:v27];

                if (v28) {
                  break;
                }
                if (v22 == ++v24)
                {
                  uint64_t v22 = [v20 countByEnumeratingWithState:&v71 objects:v85 count:16];
                  if (v22) {
                    goto LABEL_21;
                  }
                  goto LABEL_57;
                }
              }

              [v17 matchDomains];
              uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v30 = [v29 count];
              [v25 matchDomains];
              unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v32 = [v31 count];

              if (v30 == v32)
              {
                BOOL v33 = (void *)MEMORY[0x189604010];
                [v17 matchDomains];
                uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
                [v33 setWithArray:v34];
                uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();

                uint64_t v36 = (void *)MEMORY[0x189604010];
                uint64_t v37 = [v25 matchDomains];
                [v36 setWithArray:v37];
                __int128 v38 = (void *)objc_claimAutoreleasedReturnValue();

                LOBYTE(v37) = [v35 isEqualToSet:v38];
                if ((v37 & 1) != 0)
                {

                  id v8 = v61;
                  continue;
                }
              }
            }

+ (id)findRuleWithSameDomains:(id)a3 matchSigningIdentifier:(id)a4 startIndex:(int64_t *)a5
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v45 = a4;
  if (!v7) {
    goto LABEL_14;
  }
  uint64_t v8 = [v7 count];
  id v9 = 0LL;
  if (!a5 || !v8) {
    goto LABEL_15;
  }
  uint64_t v10 = a5;
  int64_t v11 = *a5;
  if (v11 >= [v7 count])
  {
LABEL_14:
    id v9 = 0LL;
    goto LABEL_15;
  }

  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  id v12 = v7;
  id v9 = (void *)[v12 countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v9)
  {
    uint64_t v46 = v10;
    id v43 = v7;
    id v13 = 0LL;
    uint64_t v14 = *(void *)v53;
LABEL_7:
    __int128 v15 = 0LL;
    id v16 = v13;
    while (1)
    {
      if (*(void *)v53 != v14) {
        objc_enumerationMutation(v12);
      }
      id v13 = *(id *)(*((void *)&v52 + 1) + 8LL * (void)v15);

      [v13 matchSigningIdentifier];
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      char v18 = [v17 isEqualToString:v45];

      if ((v18 & 1) != 0) {
        break;
      }
      __int128 v15 = (char *)v15 + 1;
      id v16 = v13;
      if (v9 == v15)
      {
        id v9 = (void *)[v12 countByEnumeratingWithState:&v52 objects:v57 count:16];
        if (v9) {
          goto LABEL_7;
        }

        id v13 = v12;
        id v7 = v43;
        goto LABEL_37;
      }
    }

    if (!v13)
    {
      id v9 = 0LL;
      id v7 = v43;
      goto LABEL_15;
    }

    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    obuint64_t j = v12;
    uint64_t v20 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      int64_t v22 = 0LL;
      uint64_t v44 = 0LL;
      uint64_t v23 = *(void *)v49;
      uint64_t v24 = v46;
      do
      {
        for (uint64_t i = 0LL; i != v21; ++i)
        {
          if (*(void *)v49 != v23) {
            objc_enumerationMutation(obj);
          }
          if (v22 + i >= *v24)
          {
            uint64_t v26 = *(void **)(*((void *)&v48 + 1) + 8 * i);
            [v26 matchSigningIdentifier];
            unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue();
            [v13 matchSigningIdentifier];
            int v28 = (void *)objc_claimAutoreleasedReturnValue();
            char v29 = [v27 isEqualToString:v28];

            if ((v29 & 1) == 0)
            {
              [v26 matchDomains];
              uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v31 = [v30 count];

              if (v31)
              {
                [v26 matchDomains];
                uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v33 = [v32 count];
                [v13 matchDomains];
                uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v35 = [v34 count];

                if (v33 == v35)
                {
                  uint64_t v36 = (void *)MEMORY[0x189604010];
                  [v26 matchDomains];
                  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
                  [v36 setWithArray:v37];
                  __int128 v38 = (void *)objc_claimAutoreleasedReturnValue();

                  uint64_t v39 = (void *)MEMORY[0x189604010];
                  [v13 matchDomains];
                  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
                  [v39 setWithArray:v40];
                  id v41 = (void *)objc_claimAutoreleasedReturnValue();

                  if ([v38 isEqualToSet:v41])
                  {
                    uint64_t v42 = [v26 matchSigningIdentifier];

                    uint64_t v44 = (void *)v42;
                  }

                  uint64_t v24 = v46;
                }

                else
                {
                  uint64_t v24 = v46;
                }
              }
            }
          }
        }

        v22 += v21;
        uint64_t v21 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
      }

      while (v21);
    }

    else
    {
      int64_t v22 = 0LL;
      uint64_t v44 = 0LL;
      uint64_t v24 = v46;
    }

    int64_t *v24 = v22;
    id v7 = v43;
    id v9 = v44;
  }

  else
  {
    id v13 = v12;
  }

@end