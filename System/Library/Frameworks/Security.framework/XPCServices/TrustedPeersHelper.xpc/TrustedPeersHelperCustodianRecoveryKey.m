@interface TrustedPeersHelperCustodianRecoveryKey
+ (BOOL)supportsSecureCoding;
- (NSData)encryptionKey;
- (NSData)signingKey;
- (NSString)recoveryString;
- (NSString)salt;
- (NSString)uuid;
- (TrustedPeersHelperCustodianRecoveryKey)initWithCoder:(id)a3;
- (TrustedPeersHelperCustodianRecoveryKey)initWithUUID:(id)a3 encryptionKey:(id)a4 signingKey:(id)a5 recoveryString:(id)a6 salt:(id)a7 kind:(int)a8;
- (id)description;
- (int)kind;
- (void)encodeWithCoder:(id)a3;
- (void)setEncryptionKey:(id)a3;
- (void)setKind:(int)a3;
- (void)setRecoveryString:(id)a3;
- (void)setSalt:(id)a3;
- (void)setSigningKey:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation TrustedPeersHelperCustodianRecoveryKey

- (TrustedPeersHelperCustodianRecoveryKey)initWithUUID:(id)a3 encryptionKey:(id)a4 signingKey:(id)a5 recoveryString:(id)a6 salt:(id)a7 kind:(int)a8
{
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___TrustedPeersHelperCustodianRecoveryKey;
  v18 = -[TrustedPeersHelperCustodianRecoveryKey init](&v23, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_uuid, a3);
    objc_storeStrong((id *)&v19->_encryptionKey, a4);
    objc_storeStrong((id *)&v19->_signingKey, a5);
    objc_storeStrong((id *)&v19->_recoveryString, a6);
    objc_storeStrong((id *)&v19->_salt, a7);
    v19->_kind = a8;
  }

  return v19;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperCustodianRecoveryKey uuid](self, "uuid"));
  uint64_t v4 = -[TrustedPeersHelperCustodianRecoveryKey kind](self, "kind");
  if (v4 >= 3) {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  v4));
  }
  else {
    v5 = *(&off_10023DC20 + v4);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<CustodianRecoveryKey: %@, (%@)>",  v3,  v5));

  return v6;
}

- (TrustedPeersHelperCustodianRecoveryKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___TrustedPeersHelperCustodianRecoveryKey;
  v5 = -[TrustedPeersHelperCustodianRecoveryKey init](&v22, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"uuid"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"encryptionKey"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    encryptionKey = v5->_encryptionKey;
    v5->_encryptionKey = (NSData *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"signingKey"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    signingKey = v5->_signingKey;
    v5->_signingKey = (NSData *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"recoveryString"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    recoveryString = v5->_recoveryString;
    v5->_recoveryString = (NSString *)v16;

    id v18 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"salt"];
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    salt = v5->_salt;
    v5->_salt = (NSString *)v19;

    v5->_kind = [v4 decodeInt32ForKey:@"kind"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperCustodianRecoveryKey uuid](self, "uuid"));
  [v9 encodeObject:v4 forKey:@"uuid"];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperCustodianRecoveryKey encryptionKey](self, "encryptionKey"));
  [v9 encodeObject:v5 forKey:@"encryptionKey"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperCustodianRecoveryKey signingKey](self, "signingKey"));
  [v9 encodeObject:v6 forKey:@"signingKey"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperCustodianRecoveryKey recoveryString](self, "recoveryString"));
  [v9 encodeObject:v7 forKey:@"recoveryString"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperCustodianRecoveryKey salt](self, "salt"));
  [v9 encodeObject:v8 forKey:@"salt"];

  objc_msgSend(v9, "encodeInt32:forKey:", -[TrustedPeersHelperCustodianRecoveryKey kind](self, "kind"), @"kind");
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setUuid:(id)a3
{
}

- (NSData)encryptionKey
{
  return (NSData *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setEncryptionKey:(id)a3
{
}

- (NSData)signingKey
{
  return (NSData *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setSigningKey:(id)a3
{
}

- (NSString)recoveryString
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setRecoveryString:(id)a3
{
}

- (NSString)salt
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setSalt:(id)a3
{
}

- (int)kind
{
  return self->_kind;
}

- (void)setKind:(int)a3
{
  self->_kind = a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end