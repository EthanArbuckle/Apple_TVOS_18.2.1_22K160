@interface NEPacketTunnelNetworkSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (NEIPv4Settings)IPv4Settings;
- (NEIPv6Settings)IPv6Settings;
- (NEPacketTunnelNetworkSettings)initWithCoder:(id)a3;
- (NSNumber)MTU;
- (NSNumber)tunnelOverheadBytes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIPv4Settings:(NEIPv4Settings *)IPv4Settings;
- (void)setIPv6Settings:(NEIPv6Settings *)IPv6Settings;
- (void)setMTU:(NSNumber *)MTU;
- (void)setTunnelOverheadBytes:(NSNumber *)tunnelOverheadBytes;
@end

@implementation NEPacketTunnelNetworkSettings

- (NEPacketTunnelNetworkSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NEPacketTunnelNetworkSettings;
  v5 = -[NETunnelNetworkSettings initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IPv4Settings"];
    IPv4Settings = v5->_IPv4Settings;
    v5->_IPv4Settings = (NEIPv4Settings *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IPv6Settings"];
    IPv6Settings = v5->_IPv6Settings;
    v5->_IPv6Settings = (NEIPv6Settings *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TunnelOverheadBytes"];
    tunnelOverheadBytes = v5->_tunnelOverheadBytes;
    v5->_tunnelOverheadBytes = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTU"];
    MTU = v5->_MTU;
    v5->_MTU = (NSNumber *)v12;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NEPacketTunnelNetworkSettings;
  id v4 = a3;
  -[NETunnelNetworkSettings encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  v5 = -[NEPacketTunnelNetworkSettings IPv4Settings](self, "IPv4Settings", v9.receiver, v9.super_class);
  [v4 encodeObject:v5 forKey:@"IPv4Settings"];

  -[NEPacketTunnelNetworkSettings IPv6Settings](self, "IPv6Settings");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"IPv6Settings"];
  v7 = -[NEPacketTunnelNetworkSettings tunnelOverheadBytes](self, "tunnelOverheadBytes");
  [v4 encodeObject:v7 forKey:@"TunnelOverheadBytes"];

  -[NEPacketTunnelNetworkSettings MTU](self, "MTU");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"MTU"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NEPacketTunnelNetworkSettings;
  id v4 = -[NETunnelNetworkSettings copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NEPacketTunnelNetworkSettings IPv4Settings](self, "IPv4Settings");
  [v4 setIPv4Settings:v5];

  -[NEPacketTunnelNetworkSettings IPv6Settings](self, "IPv6Settings");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setIPv6Settings:v6];
  v7 = -[NEPacketTunnelNetworkSettings tunnelOverheadBytes](self, "tunnelOverheadBytes");
  [v4 setTunnelOverheadBytes:v7];

  -[NEPacketTunnelNetworkSettings MTU](self, "MTU");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setMTU:v8];

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NEPacketTunnelNetworkSettings;
  unsigned __int8 v5 = -[NETunnelNetworkSettings checkValidityAndCollectErrors:](&v15, sel_checkValidityAndCollectErrors_, v4);
  uint64_t v6 = -[NEPacketTunnelNetworkSettings IPv4Settings](self, "IPv4Settings");
  if (v6)
  {
    v7 = (void *)v6;
    -[NEPacketTunnelNetworkSettings IPv4Settings](self, "IPv4Settings");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    char v9 = [v8 checkValidityAndCollectErrors:v4];

    v5 &= v9;
  }

  uint64_t v10 = -[NEPacketTunnelNetworkSettings IPv6Settings](self, "IPv6Settings");
  if (v10)
  {
    v11 = (void *)v10;
    -[NEPacketTunnelNetworkSettings IPv6Settings](self, "IPv6Settings");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    char v13 = [v12 checkValidityAndCollectErrors:v4];

    v5 &= v13;
  }

  return v5;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc(MEMORY[0x189607940]);
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NEPacketTunnelNetworkSettings;
  -[NETunnelNetworkSettings descriptionWithIndent:options:](&v15, sel_descriptionWithIndent_options_, v5, a4);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = (void *)[v7 initWithString:v8];

  -[NEPacketTunnelNetworkSettings IPv4Settings](self, "IPv4Settings");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 appendPrettyObject:v10 withName:@"IPv4Settings" andIndent:v5 options:a4];
  v11 = -[NEPacketTunnelNetworkSettings IPv6Settings](self, "IPv6Settings");
  [v9 appendPrettyObject:v11 withName:@"IPv6Settings" andIndent:v5 options:a4];

  -[NEPacketTunnelNetworkSettings tunnelOverheadBytes](self, "tunnelOverheadBytes");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 appendPrettyObject:v12 withName:@"tunnelOverheadBytes" andIndent:v5 options:a4];

  -[NEPacketTunnelNetworkSettings MTU](self, "MTU");
  char v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 appendPrettyObject:v13 withName:@"MTU" andIndent:v5 options:a4];

  return v9;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x189607940]);
  [v3 appendString:@"{"];
  -[NEPacketTunnelNetworkSettings descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 appendString:v4];

  [v3 appendString:@"\n}"];
  return v3;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4 = (const __CFDictionary *)a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___NEPacketTunnelNetworkSettings;
  uint64_t v5 = -[NETunnelNetworkSettings initFromLegacyDictionary:](&v29, sel_initFromLegacyDictionary_, v4);
  if (!v5)
  {
LABEL_13:
    v18 = 0LL;
    goto LABEL_22;
  }

  uint64_t v6 = (const __CFDictionary *)NEGetValueWithType(v4, (const void *)*MEMORY[0x18960C5B0], CFDICTIONARY_TYPE);
  if (!v6)
  {
    ne_log_obj();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v28 = 0;
      _os_log_error_impl( &dword_1876B1000,  v17,  OS_LOG_TYPE_ERROR,  "legacy dictionary is missing a VPN dictionary",  v28,  2u);
    }

    goto LABEL_13;
  }

  id v7 = v6;
  uint64_t v8 = (const void *)*MEMORY[0x18960CA10];
  if (NEGetValueWithType(v6, (const void *)*MEMORY[0x18960CA10], CFNUMBER_TYPE))
  {
    uint64_t v9 = NEGetValueWithType(v7, v8, CFNUMBER_TYPE);
    uint64_t v10 = (void *)v5[7];
    v5[7] = v9;
  }

  v11 = (const __CFDictionary *)NEGetValueWithType(v4, (const void *)*MEMORY[0x18960C588], CFDICTIONARY_TYPE);
  if (v11)
  {
    uint64_t v12 = v11;
    if (CFDictionaryGetCount(v11) >= 1)
    {
      char v13 = (const void *)*MEMORY[0x18960C6D0];
      if (CFDictionaryContainsKey(v12, (const void *)*MEMORY[0x18960C6D0]))
      {
        MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, v12);
        if (MutableCopy)
        {
          objc_super v15 = MutableCopy;
          CFDictionaryRemoveValue(MutableCopy, v13);
          id v16 = -[NEIPv4Settings initFromLegacyDictionary:]( objc_alloc(&OBJC_CLASS___NEIPv4Settings),  "initFromLegacyDictionary:",  v15);
          [v5 setIPv4Settings:v16];

          CFRelease(v15);
        }
      }

      else
      {
        id v19 = -[NEIPv4Settings initFromLegacyDictionary:]( objc_alloc(&OBJC_CLASS___NEIPv4Settings),  "initFromLegacyDictionary:",  v12);
        [v5 setIPv4Settings:v19];
      }
    }
  }

  v20 = (const __CFDictionary *)NEGetValueWithType(v4, (const void *)*MEMORY[0x18960C590], CFDICTIONARY_TYPE);
  if (v20)
  {
    v21 = v20;
    if (CFDictionaryGetCount(v20) >= 1)
    {
      v22 = (const void *)*MEMORY[0x18960C738];
      if (CFDictionaryContainsKey(v21, (const void *)*MEMORY[0x18960C738]))
      {
        v23 = CFDictionaryCreateMutableCopy(0LL, 0LL, v21);
        if (v23)
        {
          v24 = v23;
          CFDictionaryRemoveValue(v23, v22);
          id v25 = -[NEIPv6Settings initFromLegacyDictionary:]( objc_alloc(&OBJC_CLASS___NEIPv6Settings),  "initFromLegacyDictionary:",  v24);
          [v5 setIPv6Settings:v25];

          CFRelease(v24);
        }
      }

      else
      {
        id v26 = -[NEIPv6Settings initFromLegacyDictionary:]( objc_alloc(&OBJC_CLASS___NEIPv6Settings),  "initFromLegacyDictionary:",  v21);
        [v5 setIPv6Settings:v26];
      }
    }
  }

  v18 = v5;
LABEL_22:

  return v18;
}

- (NEIPv4Settings)IPv4Settings
{
  return (NEIPv4Settings *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setIPv4Settings:(NEIPv4Settings *)IPv4Settings
{
}

- (NEIPv6Settings)IPv6Settings
{
  return (NEIPv6Settings *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setIPv6Settings:(NEIPv6Settings *)IPv6Settings
{
}

- (NSNumber)tunnelOverheadBytes
{
  return (NSNumber *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setTunnelOverheadBytes:(NSNumber *)tunnelOverheadBytes
{
}

- (NSNumber)MTU
{
  return (NSNumber *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setMTU:(NSNumber *)MTU
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