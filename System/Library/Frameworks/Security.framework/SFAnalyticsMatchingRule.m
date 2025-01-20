@interface SFAnalyticsMatchingRule
+ (id)armKeyForEventName:(id)a3;
- (BOOL)firstMatchArmed;
- (BOOL)isSubsetMatch:(id)a3 target:(id)a4;
- (BOOL)matchAttributes:(id)a3 eventClass:(int64_t)a4 processName:(id)a5 logger:(id)a6;
- (BOOL)valueMatch:(id)a3 target:(id)a4;
- (NSDate)lastMatch;
- (NSDictionary)matchingDictionary;
- (NSString)eventName;
- (SECSFAEventRule)rule;
- (SFAnalyticsMatchingRule)initWithSFARule:(id)a3 logger:(id)a4;
- (id)armKey;
- (id)cachedMatchDictionary;
- (id)description;
- (id)lastMatchTimeKey;
- (unsigned)doAction:(id)a3 attributes:(id)a4 logger:(id)a5;
- (void)setEventName:(id)a3;
- (void)setFirstMatchArmed:(BOOL)a3;
- (void)setLastMatch:(id)a3;
- (void)setMatchingDictionary:(id)a3;
- (void)setRule:(id)a3;
@end

@implementation SFAnalyticsMatchingRule

- (SFAnalyticsMatchingRule)initWithSFARule:(id)a3 logger:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SFAnalyticsMatchingRule;
  v8 = -[SFAnalyticsMatchingRule init](&v16, sel_init);
  if (v8)
  {
    [v6 eventType];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAnalyticsMatchingRule setEventName:](v8, "setEventName:", v9);

    -[SFAnalyticsMatchingRule setRule:](v8, "setRule:", v6);
    v10 = -[SFAnalyticsMatchingRule lastMatchTimeKey](v8, "lastMatchTimeKey");
    [v7 datePropertyForKey:v10];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAnalyticsMatchingRule setLastMatch:](v8, "setLastMatch:", v11);
    v12 = -[SFAnalyticsMatchingRule armKey](v8, "armKey");
    [v7 numberPropertyForKey:v12];
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13) {
      -[SFAnalyticsMatchingRule setFirstMatchArmed:](v8, "setFirstMatchArmed:", 1LL);
    }
    v14 = v8;
  }

  return v8;
}

- (id)description
{
  v3 = (void *)NSString;
  v4 = -[SFAnalyticsMatchingRule eventName](self, "eventName");
  v5 = -[SFAnalyticsMatchingRule cachedMatchDictionary](self, "cachedMatchDictionary");
  -[SFAnalyticsMatchingRule lastMatch](self, "lastMatch");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<SFAnalyticsMatchingRule: %@ match: %@ %@>", v4, v5, v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)valueMatch:(id)a3 target:(id)a4
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v8 = [v6 isEqual:v7];
LABEL_4:
    BOOL v9 = v8;
    goto LABEL_5;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    char v8 = -[SFAnalyticsMatchingRule isSubsetMatch:target:](self, "isSubsetMatch:target:", v6, v7);
    goto LABEL_4;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v11 = v6;
    id v23 = v7;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    obuint64_t j = v11;
    uint64_t v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v22)
    {
      uint64_t v21 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0LL; i != v22; ++i)
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          __int128 v24 = 0u;
          __int128 v25 = 0u;
          __int128 v26 = 0u;
          __int128 v27 = 0u;
          id v14 = v23;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (!v15)
          {

LABEL_28:
            BOOL v9 = 0;
            goto LABEL_29;
          }

          uint64_t v16 = v15;
          int v17 = 0;
          uint64_t v18 = *(void *)v25;
          do
          {
            for (uint64_t j = 0LL; j != v16; ++j)
            {
              if (*(void *)v25 != v18) {
                objc_enumerationMutation(v14);
              }
              v17 |= -[SFAnalyticsMatchingRule valueMatch:target:]( self,  "valueMatch:target:",  v13,  *(void *)(*((void *)&v24 + 1) + 8 * j));
            }

            uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }

          while (v16);

          if ((v17 & 1) == 0) {
            goto LABEL_28;
          }
        }

        BOOL v9 = 1;
        uint64_t v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }

    else
    {
      BOOL v9 = 1;
    }

- (BOOL)isSubsetMatch:(id)a3 target:(id)a4
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 count];
  if (v8 <= [v7 count])
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0LL; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          objc_msgSend(v7, "objectForKeyedSubscript:", v15, (void)v20);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          [v10 objectForKeyedSubscript:v15];
          int v17 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v18 = -[SFAnalyticsMatchingRule valueMatch:target:](self, "valueMatch:target:", v17, v16);

          if (!v18)
          {
            BOOL v9 = 0;
            goto LABEL_13;
          }
        }

        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    BOOL v9 = 1;
LABEL_13:
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)lastMatchTimeKey
{
  v2 = (void *)NSString;
  v3 = -[SFAnalyticsMatchingRule rule](self, "rule");
  [v3 eventType];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 stringWithFormat:@"SFA-LastMatchRule-%@-", v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)cachedMatchDictionary
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  v2 = self;
  objc_sync_enter(v2);
  v3 = -[SFAnalyticsMatchingRule matchingDictionary](v2, "matchingDictionary");
  if (v3) {
    goto LABEL_2;
  }
  v5 = (void *)MEMORY[0x1896079E8];
  -[SFAnalyticsMatchingRule rule](v2, "rule");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 match];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = 0LL;
  [v5 propertyListWithData:v7 options:0 format:0 error:&v15];
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v15;

  if (!v8 || v9)
  {
    getOSLog();
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

      objc_sync_exit(v2);
      v4 = 0LL;
      return v4;
    }

    *(_DWORD *)buf = 138412290;
    id v17 = v9;
    uint64_t v11 = "SFAnalyticsMatchingRule match dictionary wrong: %@";
    uint64_t v12 = (os_log_s *)v10;
    uint32_t v13 = 12;
LABEL_13:
    _os_log_error_impl(&dword_1804F4000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    goto LABEL_10;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    getOSLog();
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    uint64_t v11 = "SFAnalyticsMatchingRule match not dictionary";
    uint64_t v12 = (os_log_s *)v10;
    uint32_t v13 = 2;
    goto LABEL_13;
  }

  -[SFAnalyticsMatchingRule setMatchingDictionary:](v2, "setMatchingDictionary:", v8);

LABEL_2:
  objc_sync_exit(v2);
  v4 = -[SFAnalyticsMatchingRule matchingDictionary](v2, "matchingDictionary");
  return v4;
}

- (id)armKey
{
  v3 = (void *)objc_opt_class();
  v4 = -[SFAnalyticsMatchingRule eventName](self, "eventName");
  [v3 armKeyForEventName:v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)matchAttributes:(id)a3 eventClass:(int64_t)a4 processName:(id)a5 logger:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  -[SFAnalyticsMatchingRule rule](self, "rule");
  uint32_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 processName];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[SFAnalyticsMatchingRule rule](self, "rule");
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 processName];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    int v17 = [v11 isEqual:v16];

    if (!v17) {
      goto LABEL_18;
    }
  }

  -[SFAnalyticsMatchingRule rule](self, "rule");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  int v19 = [v18 matchOnFirstFailure];

  if (!a4 && v19 && !-[SFAnalyticsMatchingRule firstMatchArmed](self, "firstMatchArmed"))
  {
    -[SFAnalyticsMatchingRule armKey](self, "armKey");
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 setNumberProperty:MEMORY[0x189604A88] forKey:v20];

    -[SFAnalyticsMatchingRule setFirstMatchArmed:](self, "setFirstMatchArmed:", 1LL);
  }

  -[SFAnalyticsMatchingRule rule](self, "rule");
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
  int v22 = [v21 hasMatch];

  if (v22)
  {
    uint64_t v23 = -[SFAnalyticsMatchingRule cachedMatchDictionary](self, "cachedMatchDictionary");
    if (!v23) {
      goto LABEL_18;
    }
    __int128 v24 = (void *)v23;
    BOOL v25 = -[SFAnalyticsMatchingRule isSubsetMatch:target:](self, "isSubsetMatch:target:", v23, v10);

    if (!v25) {
      goto LABEL_18;
    }
  }

  -[SFAnalyticsMatchingRule rule](self, "rule");
  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue();
  int v27 = [v26 matchOnFirstFailure];

  if ((unint64_t)(a4 - 1) <= 1 && v27)
  {
    -[SFAnalyticsMatchingRule armKey](self, "armKey");
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SFAnalyticsMatchingRule firstMatchArmed](self, "firstMatchArmed"))
    {
      [v12 setNumberProperty:0 forKey:v28];
      -[SFAnalyticsMatchingRule setFirstMatchArmed:](self, "setFirstMatchArmed:", 0LL);

      goto LABEL_14;
    }

LABEL_18:
    BOOL v31 = 0;
    goto LABEL_19;
  }

- (unsigned)doAction:(id)a3 attributes:(id)a4 logger:(id)a5
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  -[SFAnalyticsMatchingRule rule](self, "rule");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 action];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if ([v12 hasTtr])
    {
      int v13 = [v8 shouldRatelimit:v10 rule:self];
      getOSLog();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      id v15 = v14;
      if (!v13)
      {
        id v47 = v10;
        id v48 = v9;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          -[SFAnalyticsMatchingRule rule](self, "rule");
          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue();
          [v26 eventType];
          int v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFAnalyticsMatchingRule cachedMatchDictionary](self, "cachedMatchDictionary");
          __int128 v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v50 = v27;
          __int16 v51 = 2112;
          v52 = v28;
          _os_log_impl( &dword_1804F4000,  v15,  OS_LOG_TYPE_DEFAULT,  "SFACollection action trigger ttr: %@: %@",  buf,  0x16u);
        }

        [v12 ttr];
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        -[os_log_s alert](v15, "alert");
        __int128 v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[os_log_s description](v15, "description");
        int v30 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 radarnumber];
        BOOL v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = -[os_log_s componentName](v15, "componentName");
        v33 = -[os_log_s componentVersion](v15, "componentVersion");
        -[os_log_s componentID](v15, "componentID");
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
        id v9 = v48;
        [v8 tapToRadar:v29 description:v30 radar:v31 componentName:v32 componentVersion:v33 componentID:v34 attributes:v48];

        unsigned int v18 = 0;
        id v10 = v47;
        goto LABEL_31;
      }

      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        -[SFAnalyticsMatchingRule rule](self, "rule");
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v16 eventType];
        int v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v50 = v17;
        _os_log_impl(&dword_1804F4000, v15, OS_LOG_TYPE_INFO, "SFACollection ratelimit ttr: %@", buf, 0xCu);
      }

- (NSString)eventName
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setEventName:(id)a3
{
}

- (SECSFAEventRule)rule
{
  return (SECSFAEventRule *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setRule:(id)a3
{
}

- (NSDictionary)matchingDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setMatchingDictionary:(id)a3
{
}

- (NSDate)lastMatch
{
  return (NSDate *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setLastMatch:(id)a3
{
}

- (BOOL)firstMatchArmed
{
  return self->_firstMatchArmed;
}

- (void)setFirstMatchArmed:(BOOL)a3
{
  self->_firstMatchArmed = a3;
}

- (void).cxx_destruct
{
}

+ (id)armKeyForEventName:(id)a3
{
  return (id)[NSString stringWithFormat:@"SFAColl-%@-armed", a3];
}

@end