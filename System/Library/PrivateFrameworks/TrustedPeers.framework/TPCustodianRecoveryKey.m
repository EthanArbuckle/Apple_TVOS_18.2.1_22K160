@interface TPCustodianRecoveryKey
+ (id)custodianRecoveryKeyWithData:(id)a3 sig:(id)a4 keyFactory:(id)a5;
+ (id)peerIDForData:(id)a3 sig:(id)a4 peerIDHashAlgo:(int64_t)a5;
- (NSData)data;
- (NSData)sig;
- (NSString)peerID;
- (NSUUID)uuid;
- (TPCustodianRecoveryKey)initWithUUID:(id)a3 signingPublicKey:(id)a4 encryptionPublicKey:(id)a5 kind:(int)a6 data:(id)a7 sig:(id)a8 peerID:(id)a9;
- (TPCustodianRecoveryKey)initWithUUID:(id)a3 signingPublicKey:(id)a4 encryptionPublicKey:(id)a5 signingKeyPair:(id)a6 kind:(int)a7 error:(id *)a8;
- (TPPublicKey)encryptionPublicKey;
- (TPPublicKey)signingPublicKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int)kind;
- (void)setEncryptionPublicKey:(id)a3;
- (void)setKind:(int)a3;
- (void)setPeerID:(id)a3;
- (void)setSigningPublicKey:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation TPCustodianRecoveryKey

- (TPCustodianRecoveryKey)initWithUUID:(id)a3 signingPublicKey:(id)a4 encryptionPublicKey:(id)a5 kind:(int)a6 data:(id)a7 sig:(id)a8 peerID:(id)a9
{
  id v31 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___TPCustodianRecoveryKey;
  v21 = -[TPCustodianRecoveryKey init](&v32, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_uuid, a3);
    objc_storeStrong((id *)&v22->_signingPublicKey, a4);
    objc_storeStrong((id *)&v22->_encryptionPublicKey, a5);
    v22->_kind = a6;
    uint64_t v23 = [v18 copy];
    data = v22->_data;
    v22->_data = (NSData *)v23;

    uint64_t v25 = [v19 copy];
    sig = v22->_sig;
    v22->_sig = (NSData *)v25;
    v27 = +[TPStringTable defaultTable](&OBJC_CLASS___TPStringTable, "defaultTable");
    uint64_t v28 = [v27 stringWithString:v20];
    peerID = v22->_peerID;
    v22->_peerID = (NSString *)v28;
  }

  return v22;
}

- (TPCustodianRecoveryKey)initWithUUID:(id)a3 signingPublicKey:(id)a4 encryptionPublicKey:(id)a5 signingKeyPair:(id)a6 kind:(int)a7 error:(id *)a8
{
  uint64_t v9 = *(void *)&a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = objc_alloc_init(&OBJC_CLASS___TPPBCustodianRecoveryKey);
  [v14 UUIDString];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPBCustodianRecoveryKey setUuid:](v18, "setUuid:", v19);

  [v15 spki];
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPBCustodianRecoveryKey setSigningPublicKey:](v18, "setSigningPublicKey:", v20);

  [v16 spki];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPBCustodianRecoveryKey setEncryptionPublicKey:](v18, "setEncryptionPublicKey:", v21);

  -[TPPBCustodianRecoveryKey setKind:](v18, "setKind:", v9);
  v22 = -[PBCodable data](v18, "data");
  typesafeSignature(v17, v22, @"TPPB.CustodianRecoveryKey", a8);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = +[TPCustodianRecoveryKey peerIDForData:sig:peerIDHashAlgo:]( &OBJC_CLASS___TPCustodianRecoveryKey,  "peerIDForData:sig:peerIDHashAlgo:",  v22,  v23,  1LL);
    self =  -[TPCustodianRecoveryKey initWithUUID:signingPublicKey:encryptionPublicKey:kind:data:sig:peerID:]( self,  "initWithUUID:signingPublicKey:encryptionPublicKey:kind:data:sig:peerID:",  v14,  v15,  v16,  v9,  v22,  v23,  v24);

    uint64_t v25 = self;
  }

  else
  {
    uint64_t v25 = 0LL;
  }

  return v25;
}

- (id)dictionaryRepresentation
{
  v3 = objc_alloc(&OBJC_CLASS___TPPBCustodianRecoveryKey);
  v4 = -[TPCustodianRecoveryKey data](self, "data");
  v5 = -[PBCodable initWithData:](v3, "initWithData:", v4);

  id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
  v7 = -[TPPBCustodianRecoveryKey dictionaryRepresentation](v5, "dictionaryRepresentation");
  [v6 addEntriesFromDictionary:v7];
  v8 = -[TPCustodianRecoveryKey peerID](self, "peerID");
  [v6 setObject:v8 forKeyedSubscript:@"peerID"];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)-[NSUUID copyWithZone:](self->_uuid, "copyWithZone:", a3);
  [v5 setUuid:v6];

  [v5 setSigningPublicKey:self->_signingPublicKey];
  [v5 setEncryptionPublicKey:self->_encryptionPublicKey];
  v7 = (void *)-[NSString copyWithZone:](self->_peerID, "copyWithZone:", a3);
  [v5 setPeerID:v7];

  [v5 setKind:self->_kind];
  return v5;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
}

- (TPPublicKey)signingPublicKey
{
  return self->_signingPublicKey;
}

- (void)setSigningPublicKey:(id)a3
{
}

- (TPPublicKey)encryptionPublicKey
{
  return self->_encryptionPublicKey;
}

- (void)setEncryptionPublicKey:(id)a3
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

- (NSData)data
{
  return self->_data;
}

- (NSData)sig
{
  return self->_sig;
}

- (void).cxx_destruct
{
}

+ (id)peerIDForData:(id)a3 sig:(id)a4 peerIDHashAlgo:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = -[TPHashBuilder initWithAlgo:](objc_alloc(&OBJC_CLASS___TPHashBuilder), "initWithAlgo:", a5);
  -[TPHashBuilder updateWithData:](v9, "updateWithData:", v8);

  -[TPHashBuilder updateWithData:](v9, "updateWithData:", v7);
  v10 = -[TPHashBuilder finalHash](v9, "finalHash");
  return v10;
}

+ (id)custodianRecoveryKeyWithData:(id)a3 sig:(id)a4 keyFactory:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = -[PBCodable initWithData:](objc_alloc(&OBJC_CLASS___TPPBCustodianRecoveryKey), "initWithData:", v7);
  v11 = v10;
  if (v10)
  {
    v12 = -[TPPBCustodianRecoveryKey signingPublicKey](v10, "signingPublicKey");
    [v9 keyFromSPKI:v12];
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 && checkTypesafeSignature(v13, v8, v7, @"TPPB.CustodianRecoveryKey"))
    {
      -[TPPBCustodianRecoveryKey encryptionPublicKey](v11, "encryptionPublicKey");
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 keyFromSPKI:v14];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        +[TPCustodianRecoveryKey peerIDForData:sig:peerIDHashAlgo:]( &OBJC_CLASS___TPCustodianRecoveryKey,  "peerIDForData:sig:peerIDHashAlgo:",  v7,  v8,  1LL);
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
        id v17 = objc_alloc(&OBJC_CLASS___TPCustodianRecoveryKey);
        id v18 = objc_alloc(MEMORY[0x189607AB8]);
        -[TPPBCustodianRecoveryKey uuid](v11, "uuid");
        id v19 = (void *)objc_claimAutoreleasedReturnValue();
        id v20 = (void *)[v18 initWithUUIDString:v19];
        v21 = -[TPCustodianRecoveryKey initWithUUID:signingPublicKey:encryptionPublicKey:kind:data:sig:peerID:]( v17,  "initWithUUID:signingPublicKey:encryptionPublicKey:kind:data:sig:peerID:",  v20,  v13,  v15,  -[TPPBCustodianRecoveryKey kind](v11, "kind"),  v7,  v8,  v16);
      }

      else
      {
        v21 = 0LL;
      }
    }

    else
    {
      v21 = 0LL;
    }
  }

  else
  {
    v21 = 0LL;
  }

  return v21;
}

@end