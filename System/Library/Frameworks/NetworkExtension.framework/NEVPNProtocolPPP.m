@interface NEVPNProtocolPPP
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)setServiceProtocolsInService:(__SCNetworkService *)a3;
- (BOOL)updateWithServiceProtocolsFromService:(__SCNetworkService *)a3;
- (BOOL)verboseLoggingEnabled;
- (NEIPv4Settings)IPv4Settings;
- (NEIPv6Settings)IPv6Settings;
- (NEVPNProtocolPPP)initWithCoder:(id)a3;
- (NEVPNProtocolPPP)initWithType:(int64_t)a3;
- (id)copyLegacyDictionary;
- (id)copyLegacyDictionaryComplete:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (int64_t)authenticationMethod;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthenticationMethod:(int64_t)a3;
- (void)setIPv4Settings:(id)a3;
- (void)setIPv6Settings:(id)a3;
- (void)setVerboseLoggingEnabled:(BOOL)a3;
@end

@implementation NEVPNProtocolPPP

- (NEVPNProtocolPPP)initWithType:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NEVPNProtocolPPP;
  v3 = -[NEVPNProtocol initWithType:](&v10, sel_initWithType_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_authenticationMethod = 1LL;
    v5 = -[NEIPv4Settings initWithConfigMethod:](objc_alloc(&OBJC_CLASS___NEIPv4Settings), "initWithConfigMethod:", 2LL);
    IPv4Settings = v4->_IPv4Settings;
    v4->_IPv4Settings = v5;

    v7 = -[NEIPv6Settings initWithConfigMethod:](objc_alloc(&OBJC_CLASS___NEIPv6Settings), "initWithConfigMethod:", 1LL);
    IPv6Settings = v4->_IPv6Settings;
    v4->_IPv6Settings = v7;
  }

  return v4;
}

- (NEVPNProtocolPPP)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NEVPNProtocolPPP;
  v5 = -[NEVPNProtocol initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_authenticationMethod = (int)[v4 decodeInt32ForKey:@"AuthenticationMethod"];
    v5->_verboseLoggingEnabled = [v4 decodeBoolForKey:@"VerboseLoggingEnabled"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IPv4Settings"];
    IPv4Settings = v5->_IPv4Settings;
    v5->_IPv4Settings = (NEIPv4Settings *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IPv6Settings"];
    IPv6Settings = v5->_IPv6Settings;
    v5->_IPv6Settings = (NEIPv6Settings *)v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NEVPNProtocolPPP;
  id v4 = a3;
  -[NEVPNProtocol encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend( v4,  "encodeInt32:forKey:",  -[NEVPNProtocolPPP authenticationMethod](self, "authenticationMethod", v7.receiver, v7.super_class),  @"AuthenticationMethod");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[NEVPNProtocolPPP verboseLoggingEnabled](self, "verboseLoggingEnabled"),  @"VerboseLoggingEnabled");
  v5 = -[NEVPNProtocolPPP IPv4Settings](self, "IPv4Settings");
  [v4 encodeObject:v5 forKey:@"IPv4Settings"];

  -[NEVPNProtocolPPP IPv6Settings](self, "IPv6Settings");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"IPv6Settings"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NEVPNProtocolPPP;
  id v4 = -[NEVPNProtocol copyWithZone:](&v8, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setAuthenticationMethod:", -[NEVPNProtocolPPP authenticationMethod](self, "authenticationMethod"));
  objc_msgSend( v4,  "setVerboseLoggingEnabled:",  -[NEVPNProtocolPPP verboseLoggingEnabled](self, "verboseLoggingEnabled"));
  v5 = -[NEVPNProtocolPPP IPv4Settings](self, "IPv4Settings");
  [v4 setIPv4Settings:v5];

  -[NEVPNProtocolPPP IPv6Settings](self, "IPv6Settings");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setIPv6Settings:v6];

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NEVPNProtocolPPP;
  if (objc_msgSend( -[NEVPNProtocolPPP class](&v17, sel_class),  "instancesRespondToSelector:",  sel_checkValidityAndCollectErrors_))
  {
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___NEVPNProtocolPPP;
    unsigned __int8 v5 = -[NEVPNProtocol checkValidityAndCollectErrors:](&v16, sel_checkValidityAndCollectErrors_, v4);
  }

  else
  {
    unsigned __int8 v5 = 1;
  }

  uint64_t v6 = -[NEVPNProtocolPPP IPv4Settings](self, "IPv4Settings");
  if (v6)
  {
    objc_super v7 = (void *)v6;
    -[NEVPNProtocolPPP IPv4Settings](self, "IPv4Settings");
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
    char v9 = [v8 checkValidityAndCollectErrors:v4];

    v5 &= v9;
  }

  uint64_t v10 = -[NEVPNProtocolPPP IPv6Settings](self, "IPv6Settings");
  if (v10)
  {
    objc_super v11 = (void *)v10;
    v12 = -[NEVPNProtocolPPP IPv6Settings](self, "IPv6Settings");
    char v13 = [v12 checkValidityAndCollectErrors:v4];

    v5 &= v13;
  }

  if (-[NEVPNProtocolPPP authenticationMethod](self, "authenticationMethod") == 3)
  {
    v14 = -[NEVPNProtocol identityReferenceInternal](self, "identityReferenceInternal");
    if (!v14)
    {
      +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, @"Missing identity", v4);
      unsigned __int8 v5 = 0;
    }
  }

  return v5;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc(MEMORY[0x189607940]);
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NEVPNProtocolPPP;
  -[NEVPNProtocol descriptionWithIndent:options:](&v13, sel_descriptionWithIndent_options_, v5, a4);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = (void *)[v7 initWithString:v8];

  objc_msgSend( v9,  "appendPrettyInt:withName:andIndent:options:",  -[NEVPNProtocolPPP authenticationMethod](self, "authenticationMethod"),  @"authenticationMethod",  v5,  a4);
  objc_msgSend( v9,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEVPNProtocolPPP verboseLoggingEnabled](self, "verboseLoggingEnabled"),  @"verboseLoggingEnabled",  v5,  a4);
  -[NEVPNProtocolPPP IPv4Settings](self, "IPv4Settings");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 appendPrettyObject:v10 withName:@"IPv4Settings" andIndent:v5 options:a4];

  -[NEVPNProtocolPPP IPv6Settings](self, "IPv6Settings");
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 appendPrettyObject:v11 withName:@"IPv6Settings" andIndent:v5 options:a4];

  return v9;
}

- (id)copyLegacyDictionary
{
  return -[NEVPNProtocolPPP copyLegacyDictionaryComplete:](self, "copyLegacyDictionaryComplete:", 1LL);
}

- (id)copyLegacyDictionaryComplete:(BOOL)a3
{
  BOOL v3 = a3;
  v27[1] = *MEMORY[0x1895F89C0];
  id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
  -[NEVPNProtocol serverAddress](self, "serverAddress");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NEVPNProtocol serverAddress](self, "serverAddress");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x18960C810]];
  }

  -[NEVPNProtocol username](self, "username");
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NEVPNProtocol username](self, "username");
    char v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v9 forKeyedSubscript:*MEMORY[0x18960C7D0]];
  }

  if (-[NEVPNProtocolPPP authenticationMethod](self, "authenticationMethod") == 1
    && (-[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem"),
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 password];
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
    {
      uint64_t v15 = [v13 password];
    }

    else
    {
      [v13 identifier];
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21) {
        goto LABEL_22;
      }
      v14 = -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
      uint64_t v15 = [v14 identifier];
    }

    v22 = (void *)v15;

    if (v22)
    {
      [v5 setObject:v22 forKeyedSubscript:*MEMORY[0x18960C7D8]];
      [v5 setObject:*MEMORY[0x18960CB50] forKeyedSubscript:*MEMORY[0x18960C7E0]];
    }
  }

  else
  {
    if (-[NEVPNProtocolPPP authenticationMethod](self, "authenticationMethod") == 2)
    {
      v27[0] = *MEMORY[0x18960CB58];
      [MEMORY[0x189603F18] arrayWithObjects:v27 count:1];
      objc_super v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setObject:v16 forKeyedSubscript:*MEMORY[0x18960C7E8]];

      objc_super v17 = (const __CFString *)*MEMORY[0x18960C7C8];
      v18 = &unk_18A0CFDD8;
    }

    else if (-[NEVPNProtocolPPP authenticationMethod](self, "authenticationMethod") == 3)
    {
      uint64_t v26 = *MEMORY[0x18960CB58];
      [MEMORY[0x189603F18] arrayWithObjects:&v26 count:1];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setObject:v19 forKeyedSubscript:*MEMORY[0x18960C7E8]];

      objc_super v17 = (const __CFString *)*MEMORY[0x18960C7C8];
      v18 = &unk_18A0CFDF0;
    }

    else if (-[NEVPNProtocolPPP authenticationMethod](self, "authenticationMethod") == 4)
    {
      uint64_t v25 = *MEMORY[0x18960CB58];
      [MEMORY[0x189603F18] arrayWithObjects:&v25 count:1];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setObject:v20 forKeyedSubscript:*MEMORY[0x18960C7E8]];

      objc_super v17 = (const __CFString *)*MEMORY[0x18960C7C8];
      v18 = &unk_18A0CFE08;
    }

    else
    {
      if (-[NEVPNProtocolPPP authenticationMethod](self, "authenticationMethod") != 5) {
        goto LABEL_22;
      }
      v18 = &unk_18A0CFB70;
      objc_super v17 = @"TokenCard";
    }

    [v5 setObject:v18 forKeyedSubscript:v17];
  }

- (id)initFromLegacyDictionary:(id)a3
{
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"__NEVPNProtocolIdentifier"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = isa_nsuuid(v5);

  if (v6)
  {
    [v4 objectForKeyedSubscript:@"__NEVPNProtocolIdentifier"];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_super v8 = -[NEVPNProtocol initWithProtocolIdentifier:](self, "initWithProtocolIdentifier:", v7);

    if (!v8) {
      goto LABEL_25;
    }
  }

  else
  {
    objc_super v8 = -[NEVPNProtocolPPP init](self, "init");
    if (!v8) {
      goto LABEL_25;
    }
  }

  [v4 objectForKeyedSubscript:@"__NEVPNKeychainDomain"];
  char v9 = (void *)objc_claimAutoreleasedReturnValue();
  int v10 = isa_nsnumber(v9);

  if (v10)
  {
    [v4 objectForKeyedSubscript:@"__NEVPNKeychainDomain"];
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8->super._int64_t keychainDomain = (int)[v11 intValue];
  }

  uint64_t v12 = *MEMORY[0x18960C810];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C810]];
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();
  int v14 = isa_nsstring(v13);

  if (v14)
  {
    [v4 objectForKeyedSubscript:v12];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEVPNProtocol setServerAddress:](v8, "setServerAddress:", v15);
  }

  uint64_t v16 = *MEMORY[0x18960C7D0];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C7D0]];
  objc_super v17 = (void *)objc_claimAutoreleasedReturnValue();
  int v18 = isa_nsstring(v17);

  if (v18)
  {
    [v4 objectForKeyedSubscript:v16];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEVPNProtocol setUsername:](v8, "setUsername:", v19);
  }

  v8->_authenticationMethod = 1LL;
  uint64_t v20 = *MEMORY[0x18960C7D8];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C7D8]];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  int v22 = isa_nsstring(v21);

  if (v22)
  {
    v23 = objc_alloc(&OBJC_CLASS___NEKeychainItem);
    [v4 objectForKeyedSubscript:v20];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    int64_t keychainDomain = v8->super._keychainDomain;
    id v27 = objc_getProperty(v8, v26, 88LL, 1);
    v28 = -[NEKeychainItem initWithLegacyIdentifier:domain:accessGroup:]( v23,  "initWithLegacyIdentifier:domain:accessGroup:",  v24,  keychainDomain,  v27);
    -[NEVPNProtocol setPasswordKeychainItem:](v8, "setPasswordKeychainItem:", v28);
    goto LABEL_13;
  }

  [v4 objectForKeyedSubscript:*MEMORY[0x18960C7E8]];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C7C8]];
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  if (isa_nsarray(v27) && [v27 count])
  {
    [v27 objectAtIndexedSubscript:0];
    v28 = (NEKeychainItem *)objc_claimAutoreleasedReturnValue();
    if (isa_nsstring(v28))
    {
      if ((-[NEKeychainItem isEqualToString:](v28, "isEqualToString:", @"EAP-RSA") & 1) != 0)
      {
        uint64_t v29 = 2LL;
      }

      else if ((-[NEKeychainItem isEqualToString:](v28, "isEqualToString:", @"EAP-TLS") & 1) != 0)
      {
        uint64_t v29 = 3LL;
      }

      else
      {
        uint64_t v29 = 4LL;
      }

      v8->_authenticationMethod = v29;
    }

- (BOOL)setServiceProtocolsInService:(__SCNetworkService *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NEVPNProtocolPPP;
  if (!-[NEVPNProtocol setServiceProtocolsInService:](&v13, sel_setServiceProtocolsInService_)) {
    return 0;
  }
  -[NEVPNProtocolPPP IPv4Settings](self, "IPv4Settings");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NEVPNProtocolPPP IPv4Settings](self, "IPv4Settings");
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = (void *)[v6 copyLegacyDictionary];
  }

  int v7 = +[NEConfiguration setConfiguration:forProtocol:inService:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  (const __CFDictionary *)v5,  (const __CFString *)*MEMORY[0x18960C5E8],  a3);
  if (v5) {
    CFRelease(v5);
  }
  if (!v7) {
    return 0;
  }
  -[NEVPNProtocolPPP IPv6Settings](self, "IPv6Settings");
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NEVPNProtocolPPP IPv6Settings](self, "IPv6Settings");
    char v9 = (void *)objc_claimAutoreleasedReturnValue();
    int v10 = (const __CFDictionary *)[v9 copyLegacyDictionary];
  }

  else
  {
    int v10 = 0LL;
  }

  char v11 = +[NEConfiguration setConfiguration:forProtocol:inService:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  v10,  (const __CFString *)*MEMORY[0x18960C5F0],  a3);
  if (v10) {
    CFRelease(v10);
  }
  return v11;
}

- (BOOL)updateWithServiceProtocolsFromService:(__SCNetworkService *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NEVPNProtocolPPP;
  BOOL v5 = -[NEVPNProtocol updateWithServiceProtocolsFromService:](&v13, sel_updateWithServiceProtocolsFromService_);
  if (v5)
  {
    CFDictionaryRef v6 = +[NEConfiguration copyConfigurationForProtocol:inService:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  (const __CFString *)*MEMORY[0x18960C5E8],  a3);
    if (v6)
    {
      CFDictionaryRef v7 = v6;
      id v8 = -[NEIPv4Settings initFromLegacyDictionary:]( objc_alloc(&OBJC_CLASS___NEIPv4Settings),  "initFromLegacyDictionary:",  v6);
      -[NEVPNProtocolPPP setIPv4Settings:](self, "setIPv4Settings:", v8);

      CFRelease(v7);
    }

    CFDictionaryRef v9 = +[NEConfiguration copyConfigurationForProtocol:inService:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  (const __CFString *)*MEMORY[0x18960C5F0],  a3);
    if (v9)
    {
      CFDictionaryRef v10 = v9;
      id v11 = -[NEIPv6Settings initFromLegacyDictionary:]( objc_alloc(&OBJC_CLASS___NEIPv6Settings),  "initFromLegacyDictionary:",  v9);
      -[NEVPNProtocolPPP setIPv6Settings:](self, "setIPv6Settings:", v11);

      CFRelease(v10);
    }
  }

  return v5;
}

- (int64_t)authenticationMethod
{
  return self->_authenticationMethod;
}

- (void)setAuthenticationMethod:(int64_t)a3
{
  self->_authenticationMethod = a3;
}

- (BOOL)verboseLoggingEnabled
{
  return self->_verboseLoggingEnabled;
}

- (void)setVerboseLoggingEnabled:(BOOL)a3
{
  self->_verboseLoggingEnabled = a3;
}

- (NEIPv4Settings)IPv4Settings
{
  return (NEIPv4Settings *)objc_getProperty(self, a2, 192LL, 1);
}

- (void)setIPv4Settings:(id)a3
{
}

- (NEIPv6Settings)IPv6Settings
{
  return (NEIPv6Settings *)objc_getProperty(self, a2, 200LL, 1);
}

- (void)setIPv6Settings:(id)a3
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