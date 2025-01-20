@interface TCCDCodeIdentity
+ (id)shortStringForAuthority:(int64_t)a3;
- (NSData)verifierData;
- (NSString)verifierDescription;
- (TCCDAccessIdentity)accessIdentity;
- (TCCDCodeIdentity)initWithAccessIdentity:(id)a3;
- (TCCDCodeIdentity)initWithIdentifier:(id)a3 authority:(int64_t)a4 displayNamePolicyIdentifier:(int64_t)a5 verifierType:(int64_t)a6 verifierData:(id)a7;
- (id)description;
- (int64_t)displayNamePolicyIdentifier;
- (int64_t)identifierAuthority;
- (int64_t)verifierType;
- (void)setDisplayNamePolicyIdentifier:(int64_t)a3;
- (void)setIdentifierAuthority:(int64_t)a3;
- (void)setVerifierData:(id)a3;
- (void)setVerifierType:(int64_t)a3;
@end

@implementation TCCDCodeIdentity

+ (id)shortStringForAuthority:(int64_t)a3
{
  else {
    return *(&off_100065238 + a3);
  }
}

- (TCCDCodeIdentity)initWithIdentifier:(id)a3 authority:(int64_t)a4 displayNamePolicyIdentifier:(int64_t)a5 verifierType:(int64_t)a6 verifierData:(id)a7
{
  id v12 = a7;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TCCDCodeIdentity;
  v13 = -[TCCDIdentity initWithIdentifier:type:](&v16, "initWithIdentifier:type:", a3, 0LL);
  v14 = v13;
  if (v13)
  {
    -[TCCDCodeIdentity setIdentifierAuthority:](v13, "setIdentifierAuthority:", a4);
    if ((id)-[TCCDCodeIdentity identifierAuthority](v14, "identifierAuthority") == (id)2) {
      -[TCCDCodeIdentity setDisplayNamePolicyIdentifier:](v14, "setDisplayNamePolicyIdentifier:", a5);
    }
    -[TCCDCodeIdentity setVerifierType:](v14, "setVerifierType:", a6);
    -[TCCDCodeIdentity setVerifierData:](v14, "setVerifierData:", v12);
  }

  return v14;
}

- (TCCDCodeIdentity)initWithAccessIdentity:(id)a3
{
  id v5 = a3;
  uint64_t v6 = (int)objc_msgSend(v5, "client_type");
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "policy_id"));
  v9 = -[TCCDCodeIdentity initWithIdentifier:authority:displayNamePolicyIdentifier:verifierType:verifierData:]( self,  "initWithIdentifier:authority:displayNamePolicyIdentifier:verifierType:verifierData:",  v7,  v6,  [v8 unsignedLongLongValue],  0,  0);

  if (v9) {
    objc_storeStrong((id *)&v9->_resolvedAccessIdentity, a3);
  }

  return v9;
}

- (TCCDAccessIdentity)accessIdentity
{
  v2 = self;
  objc_sync_enter(v2);
  resolvedAccessIdentity = v2->_resolvedAccessIdentity;
  if (!resolvedAccessIdentity)
  {
    v4 = objc_alloc(&OBJC_CLASS___TCCDAccessIdentity);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDIdentity identifier](v2, "identifier"));
    uint64_t v6 = -[TCCDAccessIdentity initWithIdentifier:type:executableURL:SDKVersion:platformType:]( v4,  "initWithIdentifier:type:executableURL:SDKVersion:platformType:",  v5,  -[TCCDCodeIdentity identifierAuthority](v2, "identifierAuthority"),  0LL,  0LL,  0LL);
    v7 = v2->_resolvedAccessIdentity;
    v2->_resolvedAccessIdentity = v6;

    resolvedAccessIdentity = v2->_resolvedAccessIdentity;
  }

  v8 = resolvedAccessIdentity;
  objc_sync_exit(v2);

  return v8;
}

- (NSString)verifierDescription
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_verifierDescription)
  {
    if (-[TCCDCodeIdentity verifierType](v2, "verifierType")) {
      v3 = (const __CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unexpected verifier tyype (%ld) on iOS",  -[TCCDCodeIdentity verifierType](v2, "verifierType")));
    }
    else {
      v3 = @"None";
    }
    verifierDescription = v2->_verifierDescription;
    v2->_verifierDescription = &v3->isa;
  }

  objc_sync_exit(v2);

  return v2->_verifierDescription;
}

- (id)description
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDCodeIdentity shortStringForAuthority:]( &OBJC_CLASS___TCCDCodeIdentity,  "shortStringForAuthority:",  -[TCCDCodeIdentity identifierAuthority](self, "identifierAuthority")));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDIdentity identifier](self, "identifier"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"%@:%@", v4, v5);

  if (-[TCCDCodeIdentity verifierType](self, "verifierType"))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDCodeIdentity verifierDescription](self, "verifierDescription"));
    -[NSMutableString appendFormat:](v3, "appendFormat:", @", V:'%@'", v6);
  }

  if ((id)-[TCCDCodeIdentity identifierAuthority](self, "identifierAuthority") == (id)2) {
    -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @", ID:%lld",  -[TCCDCodeIdentity displayNamePolicyIdentifier](self, "displayNamePolicyIdentifier"));
  }
  id v7 = -[NSMutableString copy](v3, "copy");

  return v7;
}

- (int64_t)identifierAuthority
{
  return self->_identifierAuthority;
}

- (void)setIdentifierAuthority:(int64_t)a3
{
  self->_identifierAuthority = a3;
}

- (int64_t)displayNamePolicyIdentifier
{
  return self->_displayNamePolicyIdentifier;
}

- (void)setDisplayNamePolicyIdentifier:(int64_t)a3
{
  self->_displayNamePolicyIdentifier = a3;
}

- (int64_t)verifierType
{
  return self->_verifierType;
}

- (void)setVerifierType:(int64_t)a3
{
  self->_verifierType = a3;
}

- (NSData)verifierData
{
  return (NSData *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setVerifierData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end