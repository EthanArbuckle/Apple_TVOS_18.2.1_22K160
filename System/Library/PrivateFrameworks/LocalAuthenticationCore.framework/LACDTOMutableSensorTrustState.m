@interface LACDTOMutableSensorTrustState
+ (id)nullInstance;
- (BOOL)_containsDisapprovedSensorIDFlag:(id)a3;
- (BOOL)isDisapproved;
- (BOOL)isEqual:(id)a3;
- (LACDTOMutableSensorTrustState)initWithTrustState:(id)a3;
- (NSData)installedSensorID;
- (NSData)trustedSensorID;
- (NSString)description;
- (id)_disapprovedSensorIDFlag;
- (void)disapprove;
- (void)setInstalledSensorID:(id)a3;
- (void)setTrustedSensorID:(id)a3;
@end

@implementation LACDTOMutableSensorTrustState

- (LACDTOMutableSensorTrustState)initWithTrustState:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LACDTOMutableSensorTrustState;
  v5 = -[LACDTOMutableSensorTrustState init](&v9, sel_init);
  if (v5)
  {
    [v4 installedSensorID];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LACDTOMutableSensorTrustState setInstalledSensorID:](v5, "setInstalledSensorID:", v6);

    [v4 trustedSensorID];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LACDTOMutableSensorTrustState setTrustedSensorID:](v5, "setTrustedSensorID:", v7);
  }

  return v5;
}

+ (id)nullInstance
{
  v2 = objc_alloc_init(&OBJC_CLASS___LACDTOMutableSensorTrustState);
  -[LACDTOMutableSensorTrustState setInstalledSensorID:](v2, "setInstalledSensorID:", 0LL);
  -[LACDTOMutableSensorTrustState setTrustedSensorID:](v2, "setTrustedSensorID:", 0LL);
  return v2;
}

- (BOOL)isDisapproved
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 length];

  if (!v4) {
    return 0;
  }
  v5 = -[LACDTOMutableSensorTrustState trustedSensorID](self, "trustedSensorID");
  BOOL v6 = -[LACDTOMutableSensorTrustState _containsDisapprovedSensorIDFlag:](self, "_containsDisapprovedSensorIDFlag:", v5);

  return v6;
}

- (void)disapprove
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  -[LACDTOMutableSensorTrustState setTrustedSensorID:](self, "setTrustedSensorID:", v3);
}

- (BOOL)_containsDisapprovedSensorIDFlag:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    objc_msgSend(MEMORY[0x189603FB8], "dataWithLength:", objc_msgSend(v3, "length"));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resetBytesInRange:", 0, objc_msgSend(v4, "length"));
    char v5 = [v3 isEqual:v4];
  }

  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)_disapprovedSensorIDFlag
{
  char v3 = 0;
  [MEMORY[0x189603F48] dataWithBytes:&v3 length:1];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)description
{
  v18[3] = *MEMORY[0x1895F89C0];
  v17 = (void *)NSString;
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = (void *)NSString;
  -[LACDTOMutableSensorTrustState installedSensorID](self, "installedSensorID");
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringWithFormat:@"installedSensorID: %@", v5];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  v7 = (void *)NSString;
  v8 = -[LACDTOMutableSensorTrustState trustedSensorID](self, "trustedSensorID");
  [v7 stringWithFormat:@"trustedSensorID: %@", v8];
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  v10 = (void *)NSString;
  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[LACDTOMutableSensorTrustState isDisapproved](self, "isDisapproved"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 stringWithFormat:@"isDisapproved: %@", v11];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v12;
  [MEMORY[0x189603F18] arrayWithObjects:v18 count:3];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 componentsJoinedByString:@"; "];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 stringWithFormat:@"<%@ %p; %@>", v3, self, v14];
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_18C798138])
  {
    id v5 = v4;
    -[LACDTOMutableSensorTrustState installedSensorID](self, "installedSensorID");
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v5 installedSensorID];
    if (v6 == (void *)v7)
    {
    }

    else
    {
      v8 = (void *)v7;
      -[LACDTOMutableSensorTrustState installedSensorID](self, "installedSensorID");
      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 installedSensorID];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_9;
      }
    }
    v13 = -[LACDTOMutableSensorTrustState trustedSensorID](self, "trustedSensorID");
    uint64_t v14 = [v5 trustedSensorID];
    if (v13 == (void *)v14)
    {
    }

    else
    {
      v15 = (void *)v14;
      v16 = -[LACDTOMutableSensorTrustState trustedSensorID](self, "trustedSensorID");
      [v5 trustedSensorID];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      int v18 = [v16 isEqual:v17];

      if (!v18)
      {
LABEL_9:
        LOBYTE(v12) = 0;
LABEL_12:

        goto LABEL_13;
      }
    }

    BOOL v19 = -[LACDTOMutableSensorTrustState isDisapproved](self, "isDisapproved");
    int v12 = v19 ^ [v5 isDisapproved] ^ 1;
    goto LABEL_12;
  }

  LOBYTE(v12) = 0;
LABEL_13:

  return v12;
}

- (NSData)installedSensorID
{
  return self->_installedSensorID;
}

- (void)setInstalledSensorID:(id)a3
{
}

- (NSData)trustedSensorID
{
  return self->_trustedSensorID;
}

- (void)setTrustedSensorID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end