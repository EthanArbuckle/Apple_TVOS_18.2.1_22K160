@interface NEVPN
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)isDisconnectOnDemandEnabled;
- (BOOL)isEnabled;
- (BOOL)isOnDemandEnabled;
- (BOOL)isOnDemandUserOverrideDisabled;
- (NEVPN)init;
- (NEVPN)initWithCoder:(id)a3;
- (NEVPNProtocol)protocol;
- (NSArray)exceptionApps;
- (NSArray)onDemandRules;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (int64_t)tunnelType;
- (void)encodeWithCoder:(id)a3;
- (void)setDisconnectOnDemandEnabled:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setExceptionApps:(id)a3;
- (void)setOnDemandEnabled:(BOOL)a3;
- (void)setOnDemandRules:(id)a3;
- (void)setOnDemandUserOverrideDisabled:(BOOL)a3;
- (void)setProtocol:(id)a3;
- (void)setTunnelType:(int64_t)a3;
@end

@implementation NEVPN

- (NEVPN)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEVPN;
  result = -[NEVPN init](&v3, sel_init);
  if (result) {
    result->_tunnelType = 1LL;
  }
  return result;
}

- (NEVPN)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[NEVPN init](self, "init");
  if (v5)
  {
    v5->_enabled = [v4 decodeBoolForKey:@"Enabled"];
    v5->_onDemandEnabled = [v4 decodeBoolForKey:@"OnDemandEnabled"];
    v5->_disconnectOnDemandEnabled = [v4 decodeBoolForKey:@"DisconnectOnDemandEnabled"];
    v5->_onDemandUserOverrideDisabled = [v4 decodeBoolForKey:@"OnDemandUserOverrideDisabled"];
    v6 = (void *)MEMORY[0x189604010];
    uint64_t v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"OnDemandRules"];
    onDemandRules = v5->_onDemandRules;
    v5->_onDemandRules = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Protocol"];
    protocol = v5->_protocol;
    v5->_protocol = (NEVPNProtocol *)v11;

    v13 = (void *)MEMORY[0x189604010];
    uint64_t v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"ExceptionApps"];
    exceptionApps = v5->_exceptionApps;
    v5->_exceptionApps = (NSArray *)v16;

    uint64_t v18 = [v4 decodeIntegerForKey:@"TunnelType"];
    v5->_tunnelType = v18;
    if (!v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (-[NEVPN protocol](v5, "protocol"),
            v19 = (void *)objc_claimAutoreleasedReturnValue(),
            uint64_t v20 = [v19 type],
            v19,
            v20 == 4))
      {
        uint64_t v21 = 2LL;
      }

      else
      {
        uint64_t v21 = 1LL;
      }

      v5->_tunnelType = v21;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  objc_msgSend(v7, "encodeBool:forKey:", -[NEVPN isEnabled](self, "isEnabled"), @"Enabled");
  objc_msgSend( v7,  "encodeBool:forKey:",  -[NEVPN isOnDemandEnabled](self, "isOnDemandEnabled"),  @"OnDemandEnabled");
  objc_msgSend( v7,  "encodeBool:forKey:",  -[NEVPN isDisconnectOnDemandEnabled](self, "isDisconnectOnDemandEnabled"),  @"DisconnectOnDemandEnabled");
  objc_msgSend( v7,  "encodeBool:forKey:",  -[NEVPN isOnDemandUserOverrideDisabled](self, "isOnDemandUserOverrideDisabled"),  @"OnDemandUserOverrideDisabled");
  -[NEVPN onDemandRules](self, "onDemandRules");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 encodeObject:v4 forKey:@"OnDemandRules"];
  v5 = -[NEVPN protocol](self, "protocol");
  [v7 encodeObject:v5 forKey:@"Protocol"];
  v6 = -[NEVPN exceptionApps](self, "exceptionApps");
  [v7 encodeObject:v6 forKey:@"ExceptionApps"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[NEVPN tunnelType](self, "tunnelType"), @"TunnelType");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setEnabled:", -[NEVPN isEnabled](self, "isEnabled"));
  objc_msgSend(v4, "setOnDemandEnabled:", -[NEVPN isOnDemandEnabled](self, "isOnDemandEnabled"));
  objc_msgSend( v4,  "setDisconnectOnDemandEnabled:",  -[NEVPN isDisconnectOnDemandEnabled](self, "isDisconnectOnDemandEnabled"));
  objc_msgSend( v4,  "setOnDemandUserOverrideDisabled:",  -[NEVPN isOnDemandUserOverrideDisabled](self, "isOnDemandUserOverrideDisabled"));
  v5 = -[NEVPN onDemandRules](self, "onDemandRules");
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x189603F18]);
    -[NEVPN onDemandRules](self, "onDemandRules");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)[v6 initWithArray:v7 copyItems:1];
    [v4 setOnDemandRules:v8];
  }

  -[NEVPN protocol](self, "protocol");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setProtocol:v9];
  v10 = -[NEVPN exceptionApps](self, "exceptionApps");
  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x189603F18]);
    v12 = -[NEVPN exceptionApps](self, "exceptionApps");
    v13 = (void *)[v11 initWithArray:v12 copyItems:1];
    [v4 setExceptionApps:v13];
  }

  objc_msgSend(v4, "setTunnelType:", -[NEVPN tunnelType](self, "tunnelType"));
  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = -[NEVPN onDemandRules](self, "onDemandRules");
  if (v5)
  {
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    v24 = self;
    -[NEVPN onDemandRules](self, "onDemandRules");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v26;
      char v10 = 1;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
          }

          else
          {
            +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Invalid on demand rule object",  v4);
            char v10 = 0;
          }
        }

        uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }

      while (v8);
    }

    else
    {
      char v10 = 1;
    }

    char v13 = v10 & 1;
    self = v24;
  }

  else
  {
    char v13 = 1;
  }

  -[NEVPN protocol](self, "protocol");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[NEVPN protocol](self, "protocol");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    char v15 = [v14 checkValidityAndCollectErrors:v4];

    LOBYTE(v14) = v15 & v13;
  }

  else
  {
    +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, @"Missing protocol", v4);
  }

  uint64_t v16 = -[NEVPN exceptionApps](self, "exceptionApps");
  if (v16)
  {
    v17 = (void *)v16;
    char v18 = ne_session_disable_restrictions();

    if ((v18 & 1) == 0)
    {
      +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Exception app rules are not allowed",  v4);
      LOBYTE(v14) = 0;
    }
  }

  if (-[NEVPN tunnelType](self, "tunnelType") == 2)
  {
    uint64_t v19 = -[NEVPN protocol](self, "protocol");
    if (v19)
    {
      uint64_t v20 = (void *)v19;
      -[NEVPN protocol](self, "protocol");
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = [v21 type];

      if (v22 != 4)
      {
        +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"App Proxy tunnel type can only be used with plugin-based configurations",  v4);
        LOBYTE(v14) = 0;
      }
    }
  }

  return (char)v14;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x189607940]);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEVPN isEnabled](self, "isEnabled"),  @"enabled",  v5,  a4);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEVPN isOnDemandEnabled](self, "isOnDemandEnabled"),  @"onDemandEnabled",  v5,  a4);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEVPN isDisconnectOnDemandEnabled](self, "isDisconnectOnDemandEnabled"),  @"disconnectOnDemandEnabled",  v5,  a4);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEVPN isOnDemandUserOverrideDisabled](self, "isOnDemandUserOverrideDisabled"),  @"onDemandUserOverrideDisabled",  v5,  a4);
  -[NEVPN onDemandRules](self, "onDemandRules");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v8 withName:@"onDemandRules" andIndent:v5 options:a4];

  -[NEVPN protocol](self, "protocol");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v9 withName:@"protocol" andIndent:v5 options:a4];

  -[NEVPN exceptionApps](self, "exceptionApps");
  char v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v10 withName:@"exceptionApps" andIndent:v5 options:a4];

  if (-[NEVPN tunnelType](self, "tunnelType") == 2) {
    id v11 = @"app-proxy";
  }
  else {
    id v11 = @"packet";
  }
  [v7 appendPrettyObject:v11 withName:@"tunnelType" andIndent:v5 options:a4];
  return v7;
}

- (id)description
{
  return -[NEVPN descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 0LL);
}

- (id)copyLegacyDictionary
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  -[NEVPN protocol](self, "protocol");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NEVPN protocol](self, "protocol");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = (id)[v4 copyLegacyDictionary];
  }

  else
  {
    id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
  }

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[NEVPN isOnDemandEnabled](self, "isOnDemandEnabled"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x18960CA18]];

  -[NEVPN onDemandRules](self, "onDemandRules");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    -[NEVPN onDemandRules](self, "onDemandRules");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (!v9)
    {
      id v11 = v8;
      goto LABEL_17;
    }

    uint64_t v10 = v9;
    id v11 = 0LL;
    uint64_t v12 = *(void *)v29;
    do
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = (void *)[*(id *)(*((void *)&v28 + 1) + 8 * i) copyLegacyDictionary];
        if (!v11) {
          id v11 = objc_alloc_init(MEMORY[0x189603FA8]);
        }
        [v11 addObject:v14];
      }

      uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }

    while (v10);

    if (v11)
    {
      [v5 setObject:v11 forKeyedSubscript:*MEMORY[0x18960CA98]];
LABEL_17:
    }
  }

  -[NEVPN exceptionApps](self, "exceptionApps");
  char v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    id v16 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    v17 = -[NEVPN exceptionApps](self, "exceptionApps", 0LL);
    uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        for (uint64_t j = 0LL; j != v19; ++j)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v24 + 1) + 8 * j) matchSigningIdentifier];
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
          [v16 addObject:v22];
        }

        uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }

      while (v19);
    }

    [v5 setObject:v16 forKeyedSubscript:@"ExceptionApps"];
  }

  return v5;
}

- (id)initFromLegacyDictionary:(id)a3
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___NEVPN;
  id v5 = -[NEVPN init](&v30, sel_init);
  if (v5)
  {
    [v4 objectForKeyedSubscript:@"__NEVPNProtocolType"];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    switch([v6 intValue])
    {
      case 1u:
        id v7 = &OBJC_CLASS___NEVPNProtocolIPSec;
        goto LABEL_10;
      case 2u:
        id v7 = &OBJC_CLASS___NEVPNProtocolL2TP;
        goto LABEL_10;
      case 3u:
        ne_log_obj();
        uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1876B1000, v9, OS_LOG_TYPE_ERROR, "PPTP is not supported", buf, 2u);
        }

        uint64_t v8 = 0LL;
        uint64_t v10 = v6;
        goto LABEL_28;
      case 4u:
        id v7 = &OBJC_CLASS___NETunnelProviderProtocol;
LABEL_10:
        uint64_t v11 = [[v7 alloc] initFromLegacyDictionary:v4];
        protocol = v5->_protocol;
        v5->_protocol = (NEVPNProtocol *)v11;

        break;
      default:
        break;
    }

    [v4 objectForKeyedSubscript:*MEMORY[0x18960CA18]];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10) {
      v5->_onDemandEnabled = [v10 BOOLValue];
    }
    uint64_t v13 = +[NEOnDemandRule createOnDemandRulesFromLegacyDictionary:]((uint64_t)&OBJC_CLASS___NEOnDemandRule, v4);
    onDemandRules = v5->_onDemandRules;
    v5->_onDemandRules = (NSArray *)v13;

    [v4 objectForKeyedSubscript:@"ExceptionApps"];
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (isa_nsarray(v9) && -[os_log_s count](v9, "count"))
    {
      __int128 v24 = v10;
      [MEMORY[0x189603FA8] array];
      char v15 = (void *)objc_claimAutoreleasedReturnValue();
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      id v16 = v9;
      uint64_t v17 = -[os_log_s countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v25,  v31,  16LL);
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v26;
        do
        {
          for (uint64_t i = 0LL; i != v18; ++i)
          {
            if (*(void *)v26 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            if (isa_nsstring(v21))
            {
              uint64_t v22 = -[NEAppRule initWithSigningIdentifier:]( objc_alloc(&OBJC_CLASS___NEAppRule),  "initWithSigningIdentifier:",  v21);
              if (v22) {
                [v15 addObject:v22];
              }
            }
          }

          uint64_t v18 = -[os_log_s countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v25,  v31,  16LL);
        }

        while (v18);
      }

      uint64_t v10 = v24;
    }

    uint64_t v8 = v5;
LABEL_28:
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isOnDemandEnabled
{
  return self->_onDemandEnabled;
}

- (void)setOnDemandEnabled:(BOOL)a3
{
  self->_onDemandEnabled = a3;
}

- (BOOL)isDisconnectOnDemandEnabled
{
  return self->_disconnectOnDemandEnabled;
}

- (void)setDisconnectOnDemandEnabled:(BOOL)a3
{
  self->_disconnectOnDemandEnabled = a3;
}

- (BOOL)isOnDemandUserOverrideDisabled
{
  return self->_onDemandUserOverrideDisabled;
}

- (void)setOnDemandUserOverrideDisabled:(BOOL)a3
{
  self->_onDemandUserOverrideDisabled = a3;
}

- (NSArray)onDemandRules
{
  return (NSArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setOnDemandRules:(id)a3
{
}

- (NEVPNProtocol)protocol
{
  return (NEVPNProtocol *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setProtocol:(id)a3
{
}

- (int64_t)tunnelType
{
  return self->_tunnelType;
}

- (void)setTunnelType:(int64_t)a3
{
  self->_tunnelType = a3;
}

- (NSArray)exceptionApps
{
  return (NSArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setExceptionApps:(id)a3
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