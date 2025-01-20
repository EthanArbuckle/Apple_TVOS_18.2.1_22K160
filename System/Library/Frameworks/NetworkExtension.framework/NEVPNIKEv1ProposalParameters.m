@interface NEVPNIKEv1ProposalParameters
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (NEVPNIKEv1ProposalParameters)init;
- (NEVPNIKEv1ProposalParameters)initWithCoder:(id)a3;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (int)diffieHellmanGroup;
- (int)lifetimeSeconds;
- (int64_t)encryptionAlgorithm;
- (int64_t)integrityAlgorithm;
- (void)encodeWithCoder:(id)a3;
- (void)setDiffieHellmanGroup:(int)a3;
- (void)setEncryptionAlgorithm:(int64_t)a3;
- (void)setIntegrityAlgorithm:(int64_t)a3;
- (void)setLifetimeSeconds:(int)a3;
@end

@implementation NEVPNIKEv1ProposalParameters

- (NEVPNIKEv1ProposalParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEVPNIKEv1ProposalParameters;
  result = -[NEVPNIKEv1ProposalParameters init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_encryptionAlgorithm = xmmword_1878732E0;
    *(void *)&result->_diffieHellmanGroup = 0xE1000000002LL;
  }

  return result;
}

- (NEVPNIKEv1ProposalParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[NEVPNIKEv1ProposalParameters init](self, "init");
  if (v5)
  {
    v5->_encryptionAlgorithm = (int)[v4 decodeInt32ForKey:@"LegacyEncryptionAlgorithm"];
    v5->_integrityAlgorithm = (int)[v4 decodeInt32ForKey:@"LegacyIntegrityAlgorithm"];
    v5->_diffieHellmanGroup = [v4 decodeInt32ForKey:@"LegacyDiffieHellmanGroup"];
    v5->_lifetimeSeconds = [v4 decodeInt32ForKey:@"LegacyLifeTime"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeInt32:forKey:",  -[NEVPNIKEv1ProposalParameters encryptionAlgorithm](self, "encryptionAlgorithm"),  @"LegacyEncryptionAlgorithm");
  objc_msgSend( v4,  "encodeInt32:forKey:",  -[NEVPNIKEv1ProposalParameters integrityAlgorithm](self, "integrityAlgorithm"),  @"LegacyIntegrityAlgorithm");
  objc_msgSend( v4,  "encodeInt32:forKey:",  -[NEVPNIKEv1ProposalParameters diffieHellmanGroup](self, "diffieHellmanGroup"),  @"LegacyDiffieHellmanGroup");
  objc_msgSend( v4,  "encodeInt32:forKey:",  -[NEVPNIKEv1ProposalParameters lifetimeSeconds](self, "lifetimeSeconds"),  @"LegacyLifeTime");
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x189607940]);
  if (-[NEVPNIKEv1ProposalParameters encryptionAlgorithm](self, "encryptionAlgorithm") == 1)
  {
    v8 = @"DES";
  }

  else if (-[NEVPNIKEv1ProposalParameters encryptionAlgorithm](self, "encryptionAlgorithm") == 2)
  {
    v8 = @"3DES";
  }

  else if (-[NEVPNIKEv1ProposalParameters encryptionAlgorithm](self, "encryptionAlgorithm") == 3)
  {
    v8 = @"AES";
  }

  else
  {
    if (-[NEVPNIKEv1ProposalParameters encryptionAlgorithm](self, "encryptionAlgorithm") != 4) {
      goto LABEL_10;
    }
    v8 = @"AES-256";
  }

  [v7 appendPrettyObject:v8 withName:@"encryptionAlgorithm" andIndent:v5 options:a4];
LABEL_10:
  if (-[NEVPNIKEv1ProposalParameters integrityAlgorithm](self, "integrityAlgorithm") == 1)
  {
    v9 = @"SHA1";
LABEL_14:
    [v7 appendPrettyObject:v9 withName:@"integrityAlgorithm" andIndent:v5 options:a4];
    goto LABEL_15;
  }

  if (-[NEVPNIKEv1ProposalParameters integrityAlgorithm](self, "integrityAlgorithm") == 2)
  {
    v9 = @"MD5";
    goto LABEL_14;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[NEVPNIKEv1ProposalParameters init]( +[NEVPNIKEv1ProposalParameters allocWithZone:]( &OBJC_CLASS___NEVPNIKEv1ProposalParameters,  "allocWithZone:",  a3),  "init");
  if (v4)
  {
    -[NEVPNIKEv1ProposalParameters setEncryptionAlgorithm:]( v4,  "setEncryptionAlgorithm:",  -[NEVPNIKEv1ProposalParameters encryptionAlgorithm](self, "encryptionAlgorithm"));
    -[NEVPNIKEv1ProposalParameters setIntegrityAlgorithm:]( v4,  "setIntegrityAlgorithm:",  -[NEVPNIKEv1ProposalParameters integrityAlgorithm](self, "integrityAlgorithm"));
    -[NEVPNIKEv1ProposalParameters setDiffieHellmanGroup:]( v4,  "setDiffieHellmanGroup:",  -[NEVPNIKEv1ProposalParameters diffieHellmanGroup](self, "diffieHellmanGroup"));
    -[NEVPNIKEv1ProposalParameters setLifetimeSeconds:]( v4,  "setLifetimeSeconds:",  -[NEVPNIKEv1ProposalParameters lifetimeSeconds](self, "lifetimeSeconds"));
  }

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  if (-[NEVPNIKEv1ProposalParameters lifetimeSeconds](self, "lifetimeSeconds") >= 600
    && -[NEVPNIKEv1ProposalParameters lifetimeSeconds](self, "lifetimeSeconds") <= 86400)
  {
    BOOL v6 = 1;
  }

  else
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"Invalid SA lifetime seconds (%d), valid range is %d to %d inclusive",  -[NEVPNIKEv1ProposalParameters lifetimeSeconds](self, "lifetimeSeconds"),  600,  86400);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, v5, v4);

    BOOL v6 = 0;
  }

  return v6;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___NEVPNIKEv1ProposalParameters;
  uint64_t v5 = -[NEVPNIKEv1ProposalParameters init](&v31, sel_init);
  if (!v5) {
    goto LABEL_22;
  }
  [v4 objectForKeyedSubscript:@"EncryptionAlgorithm"];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = isa_nsstring(v6);

  if (v7)
  {
    [v4 objectForKeyedSubscript:@"EncryptionAlgorithm"];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    char v9 = [@"DES" isEqualToString:v8];

    if ((v9 & 1) != 0)
    {
      uint64_t v10 = 1LL;
    }

    else
    {
      [v4 objectForKeyedSubscript:@"EncryptionAlgorithm"];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      char v12 = [@"3DES" isEqualToString:v11];

      if ((v12 & 1) != 0)
      {
        uint64_t v10 = 2LL;
      }

      else
      {
        [v4 objectForKeyedSubscript:@"EncryptionAlgorithm"];
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        char v14 = [@"AES" isEqualToString:v13];

        if ((v14 & 1) != 0)
        {
          uint64_t v10 = 3LL;
        }

        else
        {
          [v4 objectForKeyedSubscript:@"EncryptionAlgorithm"];
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          int v16 = [@"AES256" isEqualToString:v15];

          if (!v16) {
            goto LABEL_12;
          }
          uint64_t v10 = 4LL;
        }
      }
    }

    -[NEVPNIKEv1ProposalParameters setEncryptionAlgorithm:](v5, "setEncryptionAlgorithm:", v10);
  }

- (id)copyLegacyDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (-[NEVPNIKEv1ProposalParameters encryptionAlgorithm](self, "encryptionAlgorithm") == 1)
  {
    id v4 = &kNEIKEv1EncryptionAlgorithmDESValue;
  }

  else if (-[NEVPNIKEv1ProposalParameters encryptionAlgorithm](self, "encryptionAlgorithm") == 2)
  {
    id v4 = &kNEIKEv1EncryptionAlgorithm3DESValue;
  }

  else if (-[NEVPNIKEv1ProposalParameters encryptionAlgorithm](self, "encryptionAlgorithm") == 3)
  {
    id v4 = &kNEIKEv1EncryptionAlgorithmAESValue;
  }

  else
  {
    if (-[NEVPNIKEv1ProposalParameters encryptionAlgorithm](self, "encryptionAlgorithm") != 4) {
      goto LABEL_10;
    }
    id v4 = &kNEIKEv1EncryptionAlgorithmAES256Value;
  }

  [v3 setObject:*v4 forKeyedSubscript:@"EncryptionAlgorithm"];
LABEL_10:
  if (-[NEVPNIKEv1ProposalParameters integrityAlgorithm](self, "integrityAlgorithm") == 1)
  {
    uint64_t v5 = &kNEIKEv1IntegrityAlgorithmSHA1Value;
LABEL_14:
    [v3 setObject:*v5 forKeyedSubscript:@"HashAlgorithm"];
    goto LABEL_15;
  }

  if (-[NEVPNIKEv1ProposalParameters integrityAlgorithm](self, "integrityAlgorithm") == 2)
  {
    uint64_t v5 = &kNEIKEv1IntegrityAlgorithmMD5Value;
    goto LABEL_14;
  }

- (int64_t)encryptionAlgorithm
{
  return self->_encryptionAlgorithm;
}

- (void)setEncryptionAlgorithm:(int64_t)a3
{
  self->_encryptionAlgorithm = a3;
}

- (int64_t)integrityAlgorithm
{
  return self->_integrityAlgorithm;
}

- (void)setIntegrityAlgorithm:(int64_t)a3
{
  self->_integrityAlgorithm = a3;
}

- (int)diffieHellmanGroup
{
  return self->_diffieHellmanGroup;
}

- (void)setDiffieHellmanGroup:(int)a3
{
  self->_diffieHellmanGroup = a3;
}

- (int)lifetimeSeconds
{
  return self->_lifetimeSeconds;
}

- (void)setLifetimeSeconds:(int)a3
{
  self->_lifetimeSeconds = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end