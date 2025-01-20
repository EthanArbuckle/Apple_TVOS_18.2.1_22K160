@interface NEDNSOverTLSSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NEDNSOverTLSSettings)initWithCoder:(id)a3;
- (NSData)identityReference;
- (NSString)serverName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (int64_t)dnsProtocol;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentityReference:(NSData *)identityReference;
- (void)setServerName:(NSString *)serverName;
@end

@implementation NEDNSOverTLSSettings

- (int64_t)dnsProtocol
{
  return 2LL;
}

- (NEDNSOverTLSSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NEDNSOverTLSSettings;
  v5 = -[NEDNSSettings initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x189604010], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"ServerName"];
    serverName = v5->_serverName;
    v5->_serverName = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IdentityReference"];
    identityReference = v5->_identityReference;
    v5->_identityReference = (NSData *)v9;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NEDNSOverTLSSettings;
  if (-[NEDNSOverTLSSettings isEqual:](&v17, sel_isEqual_, v4))
  {
    id v5 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = -[NEDNSOverTLSSettings serverName](self, "serverName");
      [v5 serverName];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      char v8 = [v6 isEqualToString:v7];
    }

    else
    {
      char v8 = 0;
    }
    v10 = -[NEDNSOverTLSSettings identityReference](self, "identityReference");
    if (v10 || ([v5 identityReference], (v15 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v11 = -[NEDNSOverTLSSettings identityReference](self, "identityReference");
      if (v11)
      {
        -[NEDNSOverTLSSettings identityReference](self, "identityReference");
        objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 identityReference];
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        int v14 = [v12 isEqualToData:v13] ^ 1;
      }

      else
      {
        LOBYTE(v14) = 0;
      }

      if (v10) {
        goto LABEL_15;
      }
      v15 = 0LL;
    }

    else
    {
      LOBYTE(v14) = 1;
    }

LABEL_15:
    char v9 = v8 & ~(_BYTE)v14;

    goto LABEL_16;
  }

  char v9 = 0;
LABEL_16:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NEDNSOverTLSSettings;
  id v4 = a3;
  -[NEDNSSettings encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[NEDNSOverTLSSettings serverName](self, "serverName", v7.receiver, v7.super_class);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"ServerName"];
  v6 = -[NEDNSOverTLSSettings identityReference](self, "identityReference");
  [v4 encodeObject:v6 forKey:@"IdentityReference"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NEDNSOverTLSSettings;
  id v4 = -[NEDNSSettings copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[NEDNSOverTLSSettings serverName](self, "serverName");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setServerName:v5];
  v6 = -[NEDNSOverTLSSettings identityReference](self, "identityReference");
  [v4 setIdentityReference:v6];

  return v4;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc(MEMORY[0x189607940]);
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NEDNSOverTLSSettings;
  -[NEDNSSettings descriptionWithIndent:options:](&v13, sel_descriptionWithIndent_options_, v5, a4);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = (void *)[v7 initWithString:v8];
  v10 = -[NEDNSOverTLSSettings serverName](self, "serverName");
  [v9 appendPrettyObject:v10 withName:@"serverName" andIndent:v5 options:a4];
  v11 = -[NEDNSOverTLSSettings identityReference](self, "identityReference");
  [v9 appendPrettyObject:v11 withName:@"identityReference" andIndent:v5 options:a4];

  return v9;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NEDNSOverTLSSettings;
  uint64_t v5 = -[NEDNSSettings initFromLegacyDictionary:](&v10, sel_initFromLegacyDictionary_, v4);
  if (v5)
  {
    [v4 objectForKeyedSubscript:@"ServerName"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!isa_nsstring(v6))
    {

      objc_super v8 = 0LL;
      goto LABEL_6;
    }

    id v7 = (void *)v5[7];
    v5[7] = v6;
  }

  objc_super v8 = v5;
LABEL_6:

  return v8;
}

- (NSString)serverName
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setServerName:(NSString *)serverName
{
}

- (NSData)identityReference
{
  return (NSData *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setIdentityReference:(NSData *)identityReference
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