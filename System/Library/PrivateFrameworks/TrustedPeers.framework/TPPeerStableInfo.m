@interface TPPeerStableInfo
+ (id)flexiblePolicyVersionFromPb:(id)a3;
+ (id)policySecretsFromPb:(id)a3;
- (BOOL)checkSignatureWithKey:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPeerStableInfo:(id)a3;
- (BOOL)isInheritedAccount;
- (NSData)data;
- (NSData)recoveryEncryptionPublicKey;
- (NSData)recoverySigningPublicKey;
- (NSData)sig;
- (NSDictionary)policySecrets;
- (NSString)deviceName;
- (NSString)osVersion;
- (NSString)serialNumber;
- (TPPBPeerStableInfoSetting)walrusSetting;
- (TPPBPeerStableInfoSetting)webAccess;
- (TPPBSecureElementIdentity)secureElementIdentity;
- (TPPeerStableInfo)initWithClock:(unint64_t)a3 frozenPolicyVersion:(id)a4 flexiblePolicyVersion:(id)a5 policySecrets:(id)a6 syncUserControllableViews:(int)a7 secureElementIdentity:(id)a8 walrusSetting:(id)a9 webAccess:(id)a10 deviceName:(id)a11 serialNumber:(id)a12 osVersion:(id)a13 signingKeyPair:(id)a14 recoverySigningPubKey:(id)a15 recoveryEncryptionPubKey:(id)a16 isInheritedAccount:(BOOL)a17 error:(id *)a18;
- (TPPeerStableInfo)initWithData:(id)a3 sig:(id)a4;
- (TPPeerStableInfo)initWithData:(id)a3 signingKeyPair:(id)a4 error:(id *)a5;
- (TPPolicyVersion)flexiblePolicyVersion;
- (TPPolicyVersion)frozenPolicyVersion;
- (TPTypedSignedData)tsd;
- (id)bestPolicyVersion;
- (id)description;
- (id)dictionaryRepresentation;
- (id)pb;
- (int)syncUserControllableViews;
- (unint64_t)clock;
- (void)setTsd:(id)a3;
@end

@implementation TPPeerStableInfo

- (TPPeerStableInfo)initWithClock:(unint64_t)a3 frozenPolicyVersion:(id)a4 flexiblePolicyVersion:(id)a5 policySecrets:(id)a6 syncUserControllableViews:(int)a7 secureElementIdentity:(id)a8 walrusSetting:(id)a9 webAccess:(id)a10 deviceName:(id)a11 serialNumber:(id)a12 osVersion:(id)a13 signingKeyPair:(id)a14 recoverySigningPubKey:(id)a15 recoveryEncryptionPubKey:(id)a16 isInheritedAccount:(BOOL)a17 error:(id *)a18
{
  id v44 = a4;
  id v21 = a5;
  id v22 = a6;
  id v40 = a8;
  id v39 = a9;
  id v38 = a10;
  id v23 = a11;
  id v36 = a12;
  id v24 = a13;
  id v41 = a14;
  id v25 = a15;
  id v26 = a16;
  context = (void *)MEMORY[0x1895C3FC8]();
  v27 = objc_alloc_init(&OBJC_CLASS___TPPBPeerStableInfo);
  -[TPPBPeerStableInfo setClock:](v27, "setClock:", a3);
  -[TPPBPeerStableInfo setFrozenPolicyVersion:](v27, "setFrozenPolicyVersion:", [v44 versionNumber]);
  [v44 policyHash];
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPBPeerStableInfo setFrozenPolicyHash:](v27, "setFrozenPolicyHash:", v28);

  -[TPPBPeerStableInfo setFlexiblePolicyVersion:](v27, "setFlexiblePolicyVersion:", [v21 versionNumber]);
  [v21 policyHash];
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPBPeerStableInfo setFlexiblePolicyHash:](v27, "setFlexiblePolicyHash:", v29);

  objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v22, "count"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPBPeerStableInfo setPolicySecrets:](v27, "setPolicySecrets:", v30);

  v45[0] = MEMORY[0x1895F87A8];
  v45[1] = 3221225472LL;
  v45[2] = __283__TPPeerStableInfo_initWithClock_frozenPolicyVersion_flexiblePolicyVersion_policySecrets_syncUserControllableViews_secureElementIdentity_walrusSetting_webAccess_deviceName_serialNumber_osVersion_signingKeyPair_recoverySigningPubKey_recoveryEncryptionPubKey_isInheritedAccount_error___block_invoke;
  v45[3] = &unk_18A22BF88;
  v46 = v27;
  v31 = v27;
  [v22 enumerateKeysAndObjectsUsingBlock:v45];
  -[TPPBPeerStableInfo setDeviceName:](v31, "setDeviceName:", v23);
  -[TPPBPeerStableInfo setUserControllableViewStatus:](v31, "setUserControllableViewStatus:", a7);
  -[TPPBPeerStableInfo setSerialNumber:](v31, "setSerialNumber:", v36);
  -[TPPBPeerStableInfo setOsVersion:](v31, "setOsVersion:", v24);
  -[TPPBPeerStableInfo setRecoveryEncryptionPublicKey:](v31, "setRecoveryEncryptionPublicKey:", v26);
  -[TPPBPeerStableInfo setRecoverySigningPublicKey:](v31, "setRecoverySigningPublicKey:", v25);
  -[TPPBPeerStableInfo setSecureElementIdentity:](v31, "setSecureElementIdentity:", v40);
  -[TPPBPeerStableInfo setWalrus:](v31, "setWalrus:", v39);
  -[TPPBPeerStableInfo setWebAccess:](v31, "setWebAccess:", v38);
  -[TPPBPeerStableInfo setIsInheritedAccount:](v31, "setIsInheritedAccount:", a17);
  v32 = -[PBCodable data](v31, "data");
  objc_autoreleasePoolPop(context);
  v33 = -[TPPeerStableInfo initWithData:signingKeyPair:error:]( self,  "initWithData:signingKeyPair:error:",  v32,  v41,  a18);

  return v33;
}

- (TPPeerStableInfo)initWithData:(id)a3 sig:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1895C3FC8]();
  v9 = -[PBCodable initWithData:](objc_alloc(&OBJC_CLASS___TPPBPeerStableInfo), "initWithData:", v6);

  objc_autoreleasePoolPop(v8);
  if (v9)
  {
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___TPPeerStableInfo;
    v10 = -[TPPeerStableInfo init](&v15, sel_init);
    if (v10)
    {
      v11 = -[TPTypedSignedData initWithData:sig:signatureTypeName:]( objc_alloc(&OBJC_CLASS___TPTypedSignedData),  "initWithData:sig:signatureTypeName:",  v6,  v7,  @"TPPB.PeerStableInfo");
      tsd = v10->_tsd;
      v10->_tsd = v11;
    }

    self = v10;
    v13 = self;
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

- (TPPeerStableInfo)initWithData:(id)a3 signingKeyPair:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = -[TPTypedSignedData initWithData:key:signatureTypeName:error:]( objc_alloc(&OBJC_CLASS___TPTypedSignedData),  "initWithData:key:signatureTypeName:error:",  v9,  v8,  @"TPPB.PeerStableInfo",  a5);

  if (v10)
  {
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___TPPeerStableInfo;
    v11 = -[TPPeerStableInfo init](&v15, sel_init);
    v12 = v11;
    if (v11) {
      objc_storeStrong((id *)&v11->_tsd, v10);
    }
    self = v12;
    v13 = self;
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

- (id)pb
{
  v3 = objc_alloc(&OBJC_CLASS___TPPBPeerStableInfo);
  v4 = -[TPPeerStableInfo data](self, "data");
  v5 = -[PBCodable initWithData:](v3, "initWithData:", v4);

  return v5;
}

- (unint64_t)clock
{
  v3 = (void *)MEMORY[0x1895C3FC8](self, a2);
  v4 = -[TPPeerStableInfo pb](self, "pb");
  unint64_t v5 = [v4 clock];

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (TPPolicyVersion)frozenPolicyVersion
{
  v3 = (void *)MEMORY[0x1895C3FC8](self, a2);
  v4 = -[TPPeerStableInfo pb](self, "pb");
  unint64_t v5 = objc_alloc(&OBJC_CLASS___TPPolicyVersion);
  uint64_t v6 = [v4 frozenPolicyVersion];
  [v4 frozenPolicyHash];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = -[TPPolicyVersion initWithVersion:hash:](v5, "initWithVersion:hash:", v6, v7);

  objc_autoreleasePoolPop(v3);
  return v8;
}

- (TPPolicyVersion)flexiblePolicyVersion
{
  v3 = (void *)MEMORY[0x1895C3FC8](self, a2);
  v4 = -[TPPeerStableInfo pb](self, "pb");
  +[TPPeerStableInfo flexiblePolicyVersionFromPb:](&OBJC_CLASS___TPPeerStableInfo, "flexiblePolicyVersionFromPb:", v4);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return (TPPolicyVersion *)v5;
}

- (NSDictionary)policySecrets
{
  v3 = (void *)MEMORY[0x1895C3FC8](self, a2);
  v4 = -[TPPeerStableInfo pb](self, "pb");
  +[TPPeerStableInfo policySecretsFromPb:](&OBJC_CLASS___TPPeerStableInfo, "policySecretsFromPb:", v4);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return (NSDictionary *)v5;
}

- (NSString)deviceName
{
  v3 = (void *)MEMORY[0x1895C3FC8](self, a2);
  v4 = -[TPPeerStableInfo pb](self, "pb");
  [v4 deviceName];
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 pbToNullable];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return (NSString *)v6;
}

- (NSString)serialNumber
{
  v3 = (void *)MEMORY[0x1895C3FC8](self, a2);
  v4 = -[TPPeerStableInfo pb](self, "pb");
  [v4 serialNumber];
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 pbToNullable];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return (NSString *)v6;
}

- (NSString)osVersion
{
  v3 = (void *)MEMORY[0x1895C3FC8](self, a2);
  v4 = -[TPPeerStableInfo pb](self, "pb");
  [v4 osVersion];
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return (NSString *)v5;
}

- (NSData)recoverySigningPublicKey
{
  v3 = (void *)MEMORY[0x1895C3FC8](self, a2);
  v4 = -[TPPeerStableInfo pb](self, "pb");
  [v4 recoverySigningPublicKey];
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 pbToNullable];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return (NSData *)v6;
}

- (NSData)recoveryEncryptionPublicKey
{
  v3 = (void *)MEMORY[0x1895C3FC8](self, a2);
  v4 = -[TPPeerStableInfo pb](self, "pb");
  [v4 recoveryEncryptionPublicKey];
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 pbToNullable];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return (NSData *)v6;
}

- (int)syncUserControllableViews
{
  v3 = (void *)MEMORY[0x1895C3FC8](self, a2);
  v4 = -[TPPeerStableInfo pb](self, "pb");
  int v5 = [v4 userControllableViewStatus];

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (TPPBSecureElementIdentity)secureElementIdentity
{
  v3 = (void *)MEMORY[0x1895C3FC8](self, a2);
  v4 = -[TPPeerStableInfo pb](self, "pb");
  [v4 secureElementIdentity];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return (TPPBSecureElementIdentity *)v5;
}

- (TPPBPeerStableInfoSetting)walrusSetting
{
  v3 = (void *)MEMORY[0x1895C3FC8](self, a2);
  v4 = -[TPPeerStableInfo pb](self, "pb");
  [v4 walrus];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return (TPPBPeerStableInfoSetting *)v5;
}

- (TPPBPeerStableInfoSetting)webAccess
{
  v3 = (void *)MEMORY[0x1895C3FC8](self, a2);
  v4 = -[TPPeerStableInfo pb](self, "pb");
  [v4 webAccess];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return (TPPBPeerStableInfoSetting *)v5;
}

- (BOOL)isInheritedAccount
{
  v3 = (void *)MEMORY[0x1895C3FC8](self, a2);
  v4 = -[TPPeerStableInfo pb](self, "pb");
  char v5 = [v4 isInheritedAccount];

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (BOOL)checkSignatureWithKey:(id)a3
{
  id v4 = a3;
  -[TPPeerStableInfo tsd](self, "tsd");
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v6 = [v5 checkSignatureWithKey:v4];

  return v6;
}

- (BOOL)isEqualToPeerStableInfo:(id)a3
{
  id v4 = (TPPeerStableInfo *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }

  else
  {
    -[TPPeerStableInfo data](self, "data");
    char v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPPeerStableInfo data](v4, "data");
    char v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v5 isEqualToData:v6])
    {
      -[TPPeerStableInfo sig](self, "sig");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPPeerStableInfo sig](v4, "sig");
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      char v9 = [v7 isEqualToData:v8];
    }

    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)MEMORY[0x1895C3FC8](self, a2);
  -[TPPeerStableInfo pb](self, "pb");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 dictionaryRepresentation];
  char v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1895C3FC8](self, a2);
  -[TPPeerStableInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 description];
  char v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (NSData)data
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 data];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSData)sig
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 sig];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)bestPolicyVersion
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }

  else
  {
    -[TPPeerStableInfo frozenPolicyVersion](self, "frozenPolicyVersion");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  char v6 = v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TPPeerStableInfo *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }

  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TPPeerStableInfo isEqualToPeerStableInfo:](self, "isEqualToPeerStableInfo:", v4);
  }

  return v5;
}

- (TPTypedSignedData)tsd
{
  return self->_tsd;
}

- (void)setTsd:(id)a3
{
}

- (void).cxx_destruct
{
}

void __283__TPPeerStableInfo_initWithClock_frozenPolicyVersion_flexiblePolicyVersion_policySecrets_syncUserControllableViews_secureElementIdentity_walrusSetting_webAccess_deviceName_serialNumber_osVersion_signingKeyPair_recoverySigningPubKey_recoveryEncryptionPubKey_isInheritedAccount_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v8 = objc_alloc_init(&OBJC_CLASS___TPPBPolicySecret);
  -[TPPBPolicySecret setName:](v8, "setName:", v6);

  -[TPPBPolicySecret setSecret:](v8, "setSecret:", v5);
  [*(id *)(a1 + 32) policySecrets];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 addObject:v8];
}

+ (id)flexiblePolicyVersionFromPb:(id)a3
{
  id v3 = a3;
  [v3 flexiblePolicyHash];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v4 length] || objc_msgSend(v3, "flexiblePolicyVersion"))
  {
    id v5 = objc_alloc(&OBJC_CLASS___TPPolicyVersion);
    uint64_t v6 = [v3 flexiblePolicyVersion];
    [v3 flexiblePolicyHash];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = -[TPPolicyVersion initWithVersion:hash:](v5, "initWithVersion:hash:", v6, v7);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

+ (id)policySecretsFromPb:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  [v3 policySecrets];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 count];

  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x189603FC8];
    [v3 policySecrets];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    objc_msgSend(v3, "policySecrets", 0);
    char v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0LL; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          [v14 secret];
          objc_super v15 = (void *)objc_claimAutoreleasedReturnValue();
          [v14 name];
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          [v8 setObject:v15 forKeyedSubscript:v16];
        }

        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v11);
    }
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

@end