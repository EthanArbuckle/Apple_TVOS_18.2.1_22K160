@interface NERelayConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)isEnabled;
- (BOOL)overlapsWithAppVPNConfiguration:(id)a3;
- (BOOL)overlapsWithRelayConfiguration:(id)a3;
- (BOOL)overlapsWithVPNConfiguration:(id)a3;
- (NEPerApp)perApp;
- (NERelayConfiguration)init;
- (NERelayConfiguration)initWithCoder:(id)a3;
- (NSArray)excludedDomains;
- (NSArray)matchDomains;
- (NSArray)onDemandRules;
- (NSArray)relays;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (uint64_t)overlapsWithAppsFromOtherAppRules:(uint64_t)a1;
- (void)encodeWithCoder:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setExcludedDomains:(id)a3;
- (void)setMatchDomains:(id)a3;
- (void)setOnDemandRules:(id)a3;
- (void)setPerApp:(id)a3;
- (void)setRelays:(id)a3;
@end

@implementation NERelayConfiguration

- (NERelayConfiguration)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NERelayConfiguration;
  v2 = -[NERelayConfiguration init](&v5, sel_init);
  v3 = v2;
  if (v2) {
    -[NERelayConfiguration setEnabled:](v2, "setEnabled:", 0LL);
  }
  return v3;
}

- (NERelayConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___NERelayConfiguration;
  objc_super v5 = -[NERelayConfiguration init](&v29, sel_init);
  if (v5)
  {
    v5->_enabled = [v4 decodeBoolForKey:@"Enabled"];
    v6 = (void *)MEMORY[0x189604010];
    uint64_t v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Relays"];
    relays = v5->_relays;
    v5->_relays = (NSArray *)v9;

    v11 = (void *)MEMORY[0x189604010];
    uint64_t v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"MatchDomains"];
    matchDomains = v5->_matchDomains;
    v5->_matchDomains = (NSArray *)v14;

    v16 = (void *)MEMORY[0x189604010];
    uint64_t v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"ExcludedDomains"];
    excludedDomains = v5->_excludedDomains;
    v5->_excludedDomains = (NSArray *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PerApp"];
    perApp = v5->_perApp;
    v5->_perApp = (NEPerApp *)v21;

    v23 = (void *)MEMORY[0x189604010];
    uint64_t v24 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"OnDemandRules"];
    onDemandRules = v5->_onDemandRules;
    v5->_onDemandRules = (NSArray *)v26;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[NERelayConfiguration isEnabled](self, "isEnabled"), @"Enabled");
  -[NERelayConfiguration relays](self, "relays");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"Relays"];
  v6 = -[NERelayConfiguration matchDomains](self, "matchDomains");
  [v4 encodeObject:v6 forKey:@"MatchDomains"];

  -[NERelayConfiguration excludedDomains](self, "excludedDomains");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"ExcludedDomains"];
  v8 = -[NERelayConfiguration perApp](self, "perApp");
  [v4 encodeObject:v8 forKey:@"PerApp"];

  -[NERelayConfiguration onDemandRules](self, "onDemandRules");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v9 forKey:@"OnDemandRules"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[NERelayConfiguration init]( +[NERelayConfiguration allocWithZone:](&OBJC_CLASS___NERelayConfiguration, "allocWithZone:", a3),  "init");
  -[NERelayConfiguration setEnabled:](v4, "setEnabled:", -[NERelayConfiguration isEnabled](self, "isEnabled"));
  -[NERelayConfiguration relays](self, "relays");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NERelayConfiguration setRelays:](v4, "setRelays:", v5);
  v6 = -[NERelayConfiguration matchDomains](self, "matchDomains");
  -[NERelayConfiguration setMatchDomains:](v4, "setMatchDomains:", v6);

  -[NERelayConfiguration excludedDomains](self, "excludedDomains");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NERelayConfiguration setExcludedDomains:](v4, "setExcludedDomains:", v7);
  v8 = -[NERelayConfiguration perApp](self, "perApp");
  -[NERelayConfiguration setPerApp:](v4, "setPerApp:", v8);

  -[NERelayConfiguration onDemandRules](self, "onDemandRules");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x189603F18]);
    v11 = -[NERelayConfiguration onDemandRules](self, "onDemandRules");
    uint64_t v12 = (void *)[v10 initWithArray:v11 copyItems:1];
    -[NERelayConfiguration setOnDemandRules:](v4, "setOnDemandRules:", v12);
  }

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v107 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[NERelayConfiguration relays](self, "relays");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 count];
  int v7 = v6 != 0;

  if (!v6) {
    +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, @"Missing relays", v4);
  }
  __int128 v98 = 0u;
  __int128 v99 = 0u;
  __int128 v96 = 0u;
  __int128 v97 = 0u;
  v8 = -[NERelayConfiguration relays](self, "relays");
  uint64_t v9 = [v8 countByEnumeratingWithState:&v96 objects:v106 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v97;
    do
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v97 != v11) {
          objc_enumerationMutation(v8);
        }
        v7 &= [*(id *)(*((void *)&v96 + 1) + 8 * i) checkValidityAndCollectErrors:v4];
      }

      uint64_t v10 = [v8 countByEnumeratingWithState:&v96 objects:v106 count:16];
    }

    while (v10);
  }

  __int128 v94 = 0u;
  __int128 v95 = 0u;
  __int128 v92 = 0u;
  __int128 v93 = 0u;
  v13 = -[NERelayConfiguration matchDomains](self, "matchDomains");
  uint64_t v14 = [v13 countByEnumeratingWithState:&v92 objects:v105 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v93;
    do
    {
      for (uint64_t j = 0LL; j != v15; ++j)
      {
        if (*(void *)v93 != v16) {
          objc_enumerationMutation(v13);
        }
        if ((isa_nsstring(*(void **)(*((void *)&v92 + 1) + 8 * j)) & 1) == 0)
        {
          +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, @"Invalid match domain", v4);
          int v7 = 0;
        }
      }

      uint64_t v15 = [v13 countByEnumeratingWithState:&v92 objects:v105 count:16];
    }

    while (v15);
  }

  __int128 v90 = 0u;
  __int128 v91 = 0u;
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  v18 = -[NERelayConfiguration excludedDomains](self, "excludedDomains");
  uint64_t v19 = [v18 countByEnumeratingWithState:&v88 objects:v104 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v89;
    do
    {
      for (uint64_t k = 0LL; k != v20; ++k)
      {
        if (*(void *)v89 != v21) {
          objc_enumerationMutation(v18);
        }
        if ((isa_nsstring(*(void **)(*((void *)&v88 + 1) + 8 * k)) & 1) == 0)
        {
          +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Invalid excluded domain",  v4);
          int v7 = 0;
        }
      }

      uint64_t v20 = [v18 countByEnumeratingWithState:&v88 objects:v104 count:16];
    }

    while (v20);
  }

  uint64_t v23 = -[NERelayConfiguration perApp](self, "perApp");
  if (v23)
  {
    uint64_t v24 = (void *)v23;
    v25 = -[NERelayConfiguration perApp](self, "perApp");
    int v26 = [v25 checkValidityAndCollectErrors:v4];

    if ((v26 & v7) == 1) {
      goto LABEL_30;
    }
LABEL_68:
    int v56 = 0;
    goto LABEL_74;
  }

  if ((v7 & 1) == 0) {
    goto LABEL_68;
  }
LABEL_30:
  -[NERelayConfiguration perApp](self, "perApp");
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  if ([v27 restrictDomains])
  {
    v28 = -[NERelayConfiguration matchDomains](self, "matchDomains");
    uint64_t v29 = [v28 count];

    if (!v29)
    {
      int v56 = 1;
      goto LABEL_74;
    }

    v69 = v4;
    id v27 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v84 = 0u;
    __int128 v85 = 0u;
    __int128 v86 = 0u;
    __int128 v87 = 0u;
    v65 = self;
    v30 = -[NERelayConfiguration relays](self, "relays");
    uint64_t v31 = [v30 countByEnumeratingWithState:&v84 objects:v103 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v85;
      do
      {
        for (uint64_t m = 0LL; m != v32; ++m)
        {
          if (*(void *)v85 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = *(void **)(*((void *)&v84 + 1) + 8 * m);
          [v35 HTTP3RelayURL];
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          [v36 host];
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          NECopyETLDPlusOne(v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (v38) {
            [v27 addObject:v38];
          }
          [v35 HTTP2RelayURL];
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          [v39 host];
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          NECopyETLDPlusOne(v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (v41) {
            [v27 addObject:v41];
          }
        }

        uint64_t v32 = [v30 countByEnumeratingWithState:&v84 objects:v103 count:16];
      }

      while (v32);
    }

    if ([v27 count])
    {
      id v66 = objc_alloc_init(MEMORY[0x189603FA8]);
      __int128 v80 = 0u;
      __int128 v81 = 0u;
      __int128 v82 = 0u;
      __int128 v83 = 0u;
      -[NERelayConfiguration matchDomains](v65, "matchDomains");
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
      id v4 = v69;
      uint64_t v71 = [obj countByEnumeratingWithState:&v80 objects:v102 count:16];
      if (v71)
      {
        uint64_t v42 = *(void *)v81;
        uint64_t v67 = *(void *)v81;
        id v68 = v27;
        do
        {
          for (uint64_t n = 0LL; n != v71; ++n)
          {
            if (*(void *)v81 != v42) {
              objc_enumerationMutation(obj);
            }
            v44 = *(void **)(*((void *)&v80 + 1) + 8 * n);
            [MEMORY[0x189607810] characterSetWithCharactersInString:@"*."];
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            [v44 stringByTrimmingCharactersInSet:v45];
            v46 = (void *)objc_claimAutoreleasedReturnValue();

            if (([v27 containsObject:v46] & 1) == 0)
            {
              __int128 v78 = 0u;
              __int128 v79 = 0u;
              __int128 v76 = 0u;
              __int128 v77 = 0u;
              id v47 = v27;
              uint64_t v48 = [v47 countByEnumeratingWithState:&v76 objects:v101 count:16];
              if (v48)
              {
                uint64_t v49 = v48;
                uint64_t v50 = *(void *)v77;
                while (2)
                {
                  for (iuint64_t i = 0LL; ii != v49; ++ii)
                  {
                    if (*(void *)v77 != v50) {
                      objc_enumerationMutation(v47);
                    }
                    v52 = *(void **)(*((void *)&v76 + 1) + 8 * ii);
                    [@"." stringByAppendingString:v52];
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    unint64_t v54 = [v46 length];
                    if (v54 > [v52 length] && (objc_msgSend(v46, "hasSuffix:", v53) & 1) == 0)
                    {

                      goto LABEL_61;
                    }
                  }

                  uint64_t v49 = [v47 countByEnumeratingWithState:&v76 objects:v101 count:16];
                  if (v49) {
                    continue;
                  }
                  break;
                }
              }

              [v66 addObject:v46];
LABEL_61:
              id v27 = v68;
              id v4 = v69;
              uint64_t v42 = v67;
            }
          }

          uint64_t v71 = [obj countByEnumeratingWithState:&v80 objects:v102 count:16];
        }

        while (v71);
      }

      uint64_t v55 = [v66 count];
      int v56 = v55 == 0;
      if (v55) {
        +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Invalid match domains, do not match relay domains",  v4);
      }
    }

    else
    {
      id v4 = v69;
      +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, @"Invalid relay domains", v69);
      int v56 = 0;
    }

    self = v65;
  }

  else
  {
    int v56 = 1;
  }

LABEL_74:
  v57 = -[NERelayConfiguration onDemandRules](self, "onDemandRules");
  if (v57)
  {
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    v58 = -[NERelayConfiguration onDemandRules](self, "onDemandRules");
    uint64_t v59 = [v58 countByEnumeratingWithState:&v72 objects:v100 count:16];
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v73;
      do
      {
        for (juint64_t j = 0LL; jj != v60; ++jj)
        {
          if (*(void *)v73 != v61) {
            objc_enumerationMutation(v58);
          }
          v63 = *(void **)(*((void *)&v72 + 1) + 8 * jj);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v56 &= [v63 checkValidityAndCollectErrors:v4];
          }

          else
          {
            +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Invalid on demand rule object",  v4);
            int v56 = 0;
          }
        }

        uint64_t v60 = [v58 countByEnumeratingWithState:&v72 objects:v100 count:16];
      }

      while (v60);
    }
  }

  return v56;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x189607940]);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NERelayConfiguration isEnabled](self, "isEnabled"),  @"enabled",  v5,  a4);
  v8 = -[NERelayConfiguration relays](self, "relays");
  [v7 appendPrettyObject:v8 withName:@"relays" andIndent:v5 options:a4];

  -[NERelayConfiguration matchDomains](self, "matchDomains");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v9 withName:@"matchDomains" andIndent:v5 options:a4];

  -[NERelayConfiguration excludedDomains](self, "excludedDomains");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v10 withName:@"excludedDomains" andIndent:v5 options:a4];

  -[NERelayConfiguration perApp](self, "perApp");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v11 withName:@"perApp" andIndent:v5 options:a4];

  -[NERelayConfiguration onDemandRules](self, "onDemandRules");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v12 withName:@"onDemandRules" andIndent:v5 options:a4];

  return v7;
}

- (id)description
{
  return -[NERelayConfiguration descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 0LL);
}

- (BOOL)overlapsWithRelayConfiguration:(id)a3
{
  uint64_t v109 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  __int128 v83 = self;
  -[NERelayConfiguration perApp](self, "perApp");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 appRules];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 count];

  [v5 perApp];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 appRules];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v11 = [v10 count] == 0;

  if ((v8 != 0) == v11) {
    goto LABEL_58;
  }
  -[NERelayConfiguration matchDomains](v83, "matchDomains");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v80 = [v12 count];

  [v5 matchDomains];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v14 = [v13 count] == 0;

  if ((v80 != 0) == v14) {
    goto LABEL_58;
  }
  [v5 onDemandRules];
  id v81 = (id)objc_claimAutoreleasedReturnValue();
  if (!v83) {
    goto LABEL_57;
  }
  -[NERelayConfiguration onDemandRules](v83, "onDemandRules");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v15 count] || !objc_msgSend(v81, "count"))
  {

    goto LABEL_60;
  }

  -[NERelayConfiguration onDemandRules](v83, "onDemandRules");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v16 count];
  uint64_t v18 = [v81 count];

  if (v17 != v18) {
    goto LABEL_60;
  }
  __int128 v105 = 0u;
  __int128 v106 = 0u;
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  -[NERelayConfiguration onDemandRules](v83, "onDemandRules");
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v74 = [obj countByEnumeratingWithState:&v103 objects:v108 count:16];
  if (!v74) {
    goto LABEL_56;
  }
  uint64_t v75 = *(void *)v104;
  id v78 = v5;
  uint64_t v72 = v8;
  while (2)
  {
    uint64_t v19 = 0LL;
    do
    {
      if (*(void *)v104 != v75) {
        objc_enumerationMutation(obj);
      }
      uint64_t v20 = *(void **)(*((void *)&v103 + 1) + 8 * v19);
      uint64_t v76 = v19;
      BOOL v21 = [v20 action] == 2 || objc_msgSend(v20, "action") == 4;
      BOOL v77 = v21;
      __int128 v101 = 0u;
      __int128 v102 = 0u;
      __int128 v99 = 0u;
      __int128 v100 = 0u;
      id v93 = v81;
      uint64_t v22 = [v93 countByEnumeratingWithState:&v99 objects:v107 count:16];
      if (!v22)
      {
LABEL_89:

LABEL_90:
        id v5 = v78;
        uint64_t v8 = v72;
LABEL_60:

        [v5 perApp];
        uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
        [v48 appRules];
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
        char v50 = -[NERelayConfiguration overlapsWithAppsFromOtherAppRules:]((uint64_t)v83, v49);

        id v51 = v5;
        v52 = -[NERelayConfiguration matchDomains](v83, "matchDomains");
        if ([v52 count])
        {
          [v51 matchDomains];
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v54 = [v53 count];

          if (!v54) {
            goto LABEL_79;
          }
          __int128 v105 = 0u;
          __int128 v106 = 0u;
          __int128 v103 = 0u;
          __int128 v104 = 0u;
          v52 = -[NERelayConfiguration matchDomains](v83, "matchDomains");
          uint64_t v55 = [v52 countByEnumeratingWithState:&v103 objects:v108 count:16];
          if (v55)
          {
            uint64_t v56 = v55;
            uint64_t v57 = *(void *)v104;
            id v79 = v5;
            uint64_t v73 = v8;
            uint64_t v96 = *(void *)v104;
            do
            {
              for (uint64_t i = 0LL; i != v56; ++i)
              {
                if (*(void *)v104 != v57) {
                  objc_enumerationMutation(v52);
                }
                uint64_t v59 = *(void **)(*((void *)&v103 + 1) + 8 * i);
                __int128 v99 = 0u;
                __int128 v100 = 0u;
                __int128 v101 = 0u;
                __int128 v102 = 0u;
                [v51 matchDomains];
                uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v61 = [v60 countByEnumeratingWithState:&v99 objects:v107 count:16];
                if (v61)
                {
                  uint64_t v62 = v61;
                  uint64_t v63 = *(void *)v100;
                  uint64_t v98 = v56;
                  while (2)
                  {
                    for (uint64_t j = 0LL; j != v62; ++j)
                    {
                      if (*(void *)v100 != v63) {
                        objc_enumerationMutation(v60);
                      }
                      v65 = *(void **)(*((void *)&v99 + 1) + 8 * j);
                      if (([v59 hasSuffix:v65] & 1) != 0
                        || [v65 hasSuffix:v59])
                      {

                        char v66 = 0;
                        id v5 = v79;
                        uint64_t v8 = v73;
                        goto LABEL_81;
                      }
                    }

                    uint64_t v62 = [v60 countByEnumeratingWithState:&v99 objects:v107 count:16];
                    uint64_t v57 = v96;
                    uint64_t v56 = v98;
                    if (v62) {
                      continue;
                    }
                    break;
                  }
                }

                id v5 = v79;
                uint64_t v8 = v73;
              }

              uint64_t v56 = [v52 countByEnumeratingWithState:&v103 objects:v108 count:16];
            }

            while (v56);
          }
        }

LABEL_79:
        char v66 = 1;
LABEL_81:

        if (v80) {
          char v67 = v66;
        }
        else {
          char v67 = 0;
        }
        char v68 = v67 | ~v50;
        if (v8) {
          char v69 = 1;
        }
        else {
          char v69 = v66;
        }
        char v47 = v68 & v69 ^ 1;
        goto LABEL_88;
      }

      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v100;
      __int128 v89 = v20;
      uint64_t v90 = *(void *)v100;
LABEL_17:
      uint64_t v25 = 0LL;
      uint64_t v91 = v23;
      while (1)
      {
        if (*(void *)v100 != v24) {
          objc_enumerationMutation(v93);
        }
        int v26 = *(void **)(*((void *)&v99 + 1) + 8 * v25);
        id v27 = v20;
        if (!v26) {
          goto LABEL_36;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_36;
        }
        [v26 DNSSearchDomainMatch];
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        [v27 DNSSearchDomainMatch];
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28 != v29)
        {
          [v26 DNSSearchDomainMatch];
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          [v27 DNSSearchDomainMatch];
          __int128 v95 = (void *)objc_claimAutoreleasedReturnValue();
          __int128 v97 = v30;
        }

        [v26 DNSServerAddressMatch];
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
        [v27 DNSServerAddressMatch];
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31 == v32
          || ([v26 DNSServerAddressMatch],
              uint64_t v33 = objc_claimAutoreleasedReturnValue(),
              [v27 DNSServerAddressMatch],
              uint64_t v34 = objc_claimAutoreleasedReturnValue(),
              __int128 v92 = (void *)v33,
              v35 = (void *)v33,
              v3 = (void *)v34,
              [v35 isEqualToArray:v34]))
        {
          uint64_t v36 = [v26 interfaceTypeMatch];
          if (v36 == [v27 interfaceTypeMatch])
          {
            uint64_t v37 = [v26 SSIDMatch];
            [v27 SSIDMatch];
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            __int128 v88 = (void *)v37;
            if ((void *)v37 == v38
              || ([v26 SSIDMatch],
                  v39 = (void *)objc_claimAutoreleasedReturnValue(),
                  [v27 SSIDMatch],
                  __int128 v84 = (void *)objc_claimAutoreleasedReturnValue(),
                  __int128 v85 = v39,
                  objc_msgSend(v39, "isEqualToArray:")))
            {
              __int128 v86 = v38;
              __int128 v87 = v3;
              [v26 probeURL];
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v41 = [v27 probeURL];
              if (v40 == (void *)v41)
              {

                int v94 = 1;
              }

              else
              {
                __int128 v82 = (void *)v41;
                [v26 probeURL];
                uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
                [v27 probeURL];
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                int v94 = [v42 isEqual:v43];
              }

              v3 = v87;
              v45 = v88;
              v38 = v86;
              if (v88 == v86)
              {
LABEL_41:

                uint64_t v20 = v89;
                if (v31 == v32) {
                  goto LABEL_43;
                }
                goto LABEL_42;
              }
            }

            else
            {
              int v94 = 0;
              v45 = v88;
            }

            goto LABEL_41;
          }

          uint64_t v20 = v89;
          if (v31 == v32)
          {

            v44 = v28;
            uint64_t v24 = v90;
            uint64_t v23 = v91;
            if (v28 != v29)
            {
LABEL_34:

              v44 = v29;
            }

LABEL_36:
            goto LABEL_47;
          }
        }

        int v94 = 0;
LABEL_42:

LABEL_43:
        if (v28 == v29) {
          break;
        }

        uint64_t v24 = v90;
        uint64_t v23 = v91;
        if ((v94 & 1) != 0) {
          goto LABEL_50;
        }
LABEL_47:
        if (v23 == ++v25)
        {
          uint64_t v23 = [v93 countByEnumeratingWithState:&v99 objects:v107 count:16];
          if (v23) {
            goto LABEL_17;
          }
          goto LABEL_89;
        }
      }

      uint64_t v24 = v90;
      uint64_t v23 = v91;
      if (!v94) {
        goto LABEL_47;
      }
LABEL_50:
      if ([v26 action] == 2)
      {

        if (v77) {
          goto LABEL_90;
        }
      }

      else
      {
        char v46 = v77 ^ ([v26 action] == 4);

        if ((v46 & 1) == 0) {
          goto LABEL_90;
        }
      }

      uint64_t v19 = v76 + 1;
      id v5 = v78;
    }

    while (v76 + 1 != v74);
    uint64_t v74 = [obj countByEnumeratingWithState:&v103 objects:v108 count:16];
    if (v74) {
      continue;
    }
    break;
  }

- (BOOL)overlapsWithVPNConfiguration:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 appRules];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 count];

  -[NERelayConfiguration matchDomains](self, "matchDomains");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = v6 | [v7 count];

  return v8 == 0;
}

- (BOOL)overlapsWithAppVPNConfiguration:(id)a3
{
  id v4 = a3;
  -[NERelayConfiguration perApp](self, "perApp");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 appRules];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 count];

  if (v7)
  {
    [v4 appRules];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    char v9 = -[NERelayConfiguration overlapsWithAppsFromOtherAppRules:]((uint64_t)self, v8);
  }

  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSArray)relays
{
  return (NSArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setRelays:(id)a3
{
}

- (NSArray)matchDomains
{
  return (NSArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setMatchDomains:(id)a3
{
}

- (NSArray)excludedDomains
{
  return (NSArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setExcludedDomains:(id)a3
{
}

- (NEPerApp)perApp
{
  return (NEPerApp *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setPerApp:(id)a3
{
}

- (NSArray)onDemandRules
{
  return (NSArray *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setOnDemandRules:(id)a3
{
}

- (void).cxx_destruct
{
}

- (uint64_t)overlapsWithAppsFromOtherAppRules:(uint64_t)a1
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (a1)
  {
    [(id)a1 perApp];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 appRules];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v5 count])
    {
      uint64_t v6 = [v3 count];

      if (v6)
      {
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        [(id)a1 perApp];
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 appRules];
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

        uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v25;
          do
          {
            uint64_t v12 = 0LL;
            do
            {
              if (*(void *)v25 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v24 + 1) + 8 * v12);
              __int128 v20 = 0u;
              __int128 v21 = 0u;
              __int128 v22 = 0u;
              __int128 v23 = 0u;
              id v14 = v3;
              uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
              if (v15)
              {
                uint64_t v16 = v15;
                uint64_t v17 = *(void *)v21;
                while (2)
                {
                  uint64_t v18 = 0LL;
                  do
                  {
                    if (*(void *)v21 != v17) {
                      objc_enumerationMutation(v14);
                    }
                    if ([v13 overlapsWithRule:*(void *)(*((void *)&v20 + 1) + 8 * v18)])
                    {

                      a1 = 1LL;
                      goto LABEL_23;
                    }

                    ++v18;
                  }

                  while (v16 != v18);
                  uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
                  if (v16) {
                    continue;
                  }
                  break;
                }
              }

              ++v12;
            }

            while (v12 != v10);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
          }

          while (v10);
        }
      }
    }

    else
    {
    }

    a1 = 0LL;
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end