@interface OTCustodianRecoveryKey
+ (BOOL)supportsSecureCoding;
- (BOOL)generateWrappingWithError:(id *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCustodianRecoveryKey:(id)a3;
- (BOOL)unwrapWithError:(id *)a3;
- (NSData)wrappedKey;
- (NSData)wrappingKey;
- (NSString)recoveryString;
- (NSUUID)uuid;
- (OTCustodianRecoveryKey)initWithCoder:(id)a3;
- (OTCustodianRecoveryKey)initWithUUID:(id)a3 recoveryString:(id)a4 error:(id *)a5;
- (OTCustodianRecoveryKey)initWithWrappedKey:(id)a3 wrappingKey:(id)a4 uuid:(id)a5 error:(id *)a6;
- (id)dictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation OTCustodianRecoveryKey

- (BOOL)generateWrappingWithError:(id *)a3
{
  v5 = (void *)[objc_alloc(MEMORY[0x1896126F8]) initWithBitSize:2];
  v6 = (void *)[objc_alloc(MEMORY[0x1896126F0]) initRandomKeyWithSpecifier:v5 error:a3];
  v7 = v6;
  if (v6)
  {
    [v6 keyData];
    v8 = (NSData *)objc_claimAutoreleasedReturnValue();
    wrappingKey = self->_wrappingKey;
    self->_wrappingKey = v8;

    v10 = (void *)[objc_alloc(MEMORY[0x189612708]) initWithKeySpecifier:v5];
    v11 = -[NSString dataUsingEncoding:](self->_recoveryString, "dataUsingEncoding:", 4LL);
    [MEMORY[0x189603F48] data];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 encrypt:v11 withKey:v7 additionalAuthenticatedData:v12 error:a3];
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      [MEMORY[0x1896078F8] archivedDataWithRootObject:v13 requiringSecureCoding:1 error:a3];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v15 = v14 != 0LL;
      if (v14) {
        objc_storeStrong((id *)&self->_wrappedKey, v14);
      }
    }

    else
    {
      BOOL v15 = 0;
    }
  }

  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (OTCustodianRecoveryKey)initWithUUID:(id)a3 recoveryString:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___OTCustodianRecoveryKey;
  v11 = -[OTCustodianRecoveryKey init](&v19, sel_init);
  p_isa = (id *)&v11->super.isa;
  if (!v11) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v11->_uuid, a3);
  objc_storeStrong(p_isa + 4, a4);
  id v18 = 0LL;
  char v13 = [p_isa generateWrappingWithError:&v18];
  id v14 = v18;
  BOOL v15 = v14;
  if ((v13 & 1) != 0)
  {

LABEL_4:
    v16 = p_isa;
    goto LABEL_8;
  }

  if (a5) {
    *a5 = v14;
  }

  v16 = 0LL;
LABEL_8:

  return v16;
}

- (BOOL)unwrapWithError:(id *)a3
{
  v5 = (void *)[objc_alloc(MEMORY[0x1896126F8]) initWithBitSize:2];
  v6 = (void *)[objc_alloc(MEMORY[0x1896126F0]) initWithData:self->_wrappingKey specifier:v5 error:a3];
  if (v6)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x189612708]) initWithKeySpecifier:v5];
    [MEMORY[0x189607908] unarchivedObjectOfClass:objc_opt_class() fromData:self->_wrappedKey error:a3];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      [v7 decrypt:v8 withKey:v6 error:a3];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v10 = v9 != 0LL;
      if (v9)
      {
        v11 = (NSString *)[objc_alloc(NSString) initWithData:v9 encoding:4];
        recoveryString = self->_recoveryString;
        self->_recoveryString = v11;
      }
    }

    else
    {
      BOOL v10 = 0;
    }
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (OTCustodianRecoveryKey)initWithWrappedKey:(id)a3 wrappingKey:(id)a4 uuid:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___OTCustodianRecoveryKey;
  id v14 = -[OTCustodianRecoveryKey init](&v18, sel_init);
  p_isa = (id *)&v14->super.isa;
  if (v14
    && (objc_storeStrong((id *)&v14->_uuid, a5),
        objc_storeStrong(p_isa + 3, a3),
        objc_storeStrong(p_isa + 2, a4),
        ![p_isa unwrapWithError:a6]))
  {
    v16 = 0LL;
  }

  else
  {
    v16 = p_isa;
  }

  return v16;
}

- (BOOL)isEqualToCustodianRecoveryKey:(id)a3
{
  v4 = (OTCustodianRecoveryKey *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }

  else
  {
    v5 = -[OTCustodianRecoveryKey uuid](self, "uuid");
    v6 = -[OTCustodianRecoveryKey uuid](v4, "uuid");
    if ([v5 isEqual:v6])
    {
      v7 = -[OTCustodianRecoveryKey wrappingKey](self, "wrappingKey");
      v8 = -[OTCustodianRecoveryKey wrappingKey](v4, "wrappingKey");
      if ([v7 isEqualToData:v8])
      {
        -[OTCustodianRecoveryKey wrappedKey](self, "wrappedKey");
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[OTCustodianRecoveryKey wrappedKey](v4, "wrappedKey");
        BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v9 isEqualToData:v10])
        {
          -[OTCustodianRecoveryKey recoveryString](self, "recoveryString");
          id v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[OTCustodianRecoveryKey recoveryString](v4, "recoveryString");
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          char v13 = [v11 isEqualToString:v12];
        }

        else
        {
          char v13 = 0;
        }
      }

      else
      {
        char v13 = 0;
      }
    }

    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (OTCustodianRecoveryKey *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }

  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[OTCustodianRecoveryKey isEqualToCustodianRecoveryKey:](self, "isEqualToCustodianRecoveryKey:", v4);
  }

  return v5;
}

- (id)dictionary
{
  v13[4] = *MEMORY[0x1895F89C0];
  v12[0] = @"uuid";
  v3 = -[OTCustodianRecoveryKey uuid](self, "uuid");
  [v3 description];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = @"recoveryString";
  -[OTCustodianRecoveryKey recoveryString](self, "recoveryString");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  v12[2] = @"wrappingKey";
  v6 = -[OTCustodianRecoveryKey wrappingKey](self, "wrappingKey");
  [v6 base64EncodedStringWithOptions:0];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v7;
  v12[3] = @"wrappedKey";
  v8 = -[OTCustodianRecoveryKey wrappedKey](self, "wrappedKey");
  [v8 base64EncodedStringWithOptions:0];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v9;
  [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:v12 count:4];
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (OTCustodianRecoveryKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___OTCustodianRecoveryKey;
  BOOL v5 = -[OTCustodianRecoveryKey init](&v15, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wrappingKey"];
    wrappingKey = v5->_wrappingKey;
    v5->_wrappingKey = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wrappedKey"];
    wrappedKey = v5->_wrappedKey;
    v5->_wrappedKey = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recoveryString"];
    recoveryString = v5->_recoveryString;
    v5->_recoveryString = (NSString *)v12;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uuid = self->_uuid;
  id v5 = a3;
  [v5 encodeObject:uuid forKey:@"uuid"];
  [v5 encodeObject:self->_wrappingKey forKey:@"wrappingKey"];
  [v5 encodeObject:self->_wrappedKey forKey:@"wrappedKey"];
  [v5 encodeObject:self->_recoveryString forKey:@"recoveryString"];
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSData)wrappingKey
{
  return self->_wrappingKey;
}

- (NSData)wrappedKey
{
  return self->_wrappedKey;
}

- (NSString)recoveryString
{
  return self->_recoveryString;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end