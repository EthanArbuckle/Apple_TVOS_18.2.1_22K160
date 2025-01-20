@interface TPPBPeerStableInfo
+ (Class)custodianRecoveryKeysType;
+ (Class)policySecretsType;
- (BOOL)hasClock;
- (BOOL)hasDeviceName;
- (BOOL)hasFlexiblePolicyHash;
- (BOOL)hasFlexiblePolicyVersion;
- (BOOL)hasFrozenPolicyHash;
- (BOOL)hasFrozenPolicyVersion;
- (BOOL)hasIsInheritedAccount;
- (BOOL)hasOsVersion;
- (BOOL)hasRecoveryEncryptionPublicKey;
- (BOOL)hasRecoverySigningPublicKey;
- (BOOL)hasSecureElementIdentity;
- (BOOL)hasSerialNumber;
- (BOOL)hasUserControllableViewStatus;
- (BOOL)hasWalrus;
- (BOOL)hasWebAccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInheritedAccount;
- (BOOL)readFrom:(id)a3;
- (NSData)recoveryEncryptionPublicKey;
- (NSData)recoverySigningPublicKey;
- (NSMutableArray)custodianRecoveryKeys;
- (NSMutableArray)policySecrets;
- (NSString)deviceName;
- (NSString)flexiblePolicyHash;
- (NSString)frozenPolicyHash;
- (NSString)osVersion;
- (NSString)serialNumber;
- (TPPBPeerStableInfoSetting)walrus;
- (TPPBPeerStableInfoSetting)webAccess;
- (TPPBSecureElementIdentity)secureElementIdentity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)custodianRecoveryKeysAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)policySecretsAtIndex:(unint64_t)a3;
- (id)userControllableViewStatusAsString:(int)a3;
- (int)StringAsUserControllableViewStatus:(id)a3;
- (int)userControllableViewStatus;
- (unint64_t)clock;
- (unint64_t)custodianRecoveryKeysCount;
- (unint64_t)flexiblePolicyVersion;
- (unint64_t)frozenPolicyVersion;
- (unint64_t)hash;
- (unint64_t)policySecretsCount;
- (void)addCustodianRecoveryKeys:(id)a3;
- (void)addPolicySecrets:(id)a3;
- (void)clearCustodianRecoveryKeys;
- (void)clearPolicySecrets;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClock:(unint64_t)a3;
- (void)setCustodianRecoveryKeys:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setFlexiblePolicyHash:(id)a3;
- (void)setFlexiblePolicyVersion:(unint64_t)a3;
- (void)setFrozenPolicyHash:(id)a3;
- (void)setFrozenPolicyVersion:(unint64_t)a3;
- (void)setHasClock:(BOOL)a3;
- (void)setHasFlexiblePolicyVersion:(BOOL)a3;
- (void)setHasFrozenPolicyVersion:(BOOL)a3;
- (void)setHasIsInheritedAccount:(BOOL)a3;
- (void)setHasUserControllableViewStatus:(BOOL)a3;
- (void)setIsInheritedAccount:(BOOL)a3;
- (void)setOsVersion:(id)a3;
- (void)setPolicySecrets:(id)a3;
- (void)setRecoveryEncryptionPublicKey:(id)a3;
- (void)setRecoverySigningPublicKey:(id)a3;
- (void)setSecureElementIdentity:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setUserControllableViewStatus:(int)a3;
- (void)setWalrus:(id)a3;
- (void)setWebAccess:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBPeerStableInfo

- (void)setClock:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_clock = a3;
}

- (void)setHasClock:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClock
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setFrozenPolicyVersion:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_frozenPolicyVersion = a3;
}

- (void)setHasFrozenPolicyVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFrozenPolicyVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasFrozenPolicyHash
{
  return self->_frozenPolicyHash != 0LL;
}

- (BOOL)hasOsVersion
{
  return self->_osVersion != 0LL;
}

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0LL;
}

- (BOOL)hasRecoverySigningPublicKey
{
  return self->_recoverySigningPublicKey != 0LL;
}

- (BOOL)hasRecoveryEncryptionPublicKey
{
  return self->_recoveryEncryptionPublicKey != 0LL;
}

- (BOOL)hasSerialNumber
{
  return self->_serialNumber != 0LL;
}

- (void)setFlexiblePolicyVersion:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_flexiblePolicyVersion = a3;
}

- (void)setHasFlexiblePolicyVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFlexiblePolicyVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasFlexiblePolicyHash
{
  return self->_flexiblePolicyHash != 0LL;
}

- (void)clearPolicySecrets
{
}

- (void)addPolicySecrets:(id)a3
{
  id v4 = a3;
  policySecrets = self->_policySecrets;
  id v8 = v4;
  if (!policySecrets)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v7 = self->_policySecrets;
    self->_policySecrets = v6;

    id v4 = v8;
    policySecrets = self->_policySecrets;
  }

  -[NSMutableArray addObject:](policySecrets, "addObject:", v4);
}

- (unint64_t)policySecretsCount
{
  return -[NSMutableArray count](self->_policySecrets, "count");
}

- (id)policySecretsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_policySecrets, "objectAtIndex:", a3);
}

- (int)userControllableViewStatus
{
  if ((*(_BYTE *)&self->_has & 8) != 0) {
    return self->_userControllableViewStatus;
  }
  else {
    return 0;
  }
}

- (void)setUserControllableViewStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_userControllableViewStatus = a3;
}

- (void)setHasUserControllableViewStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUserControllableViewStatus
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)userControllableViewStatusAsString:(int)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsUserControllableViewStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"DISABLED"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"ENABLED"])
  {
    int v4 = 2;
  }

  else if ([v3 isEqualToString:@"FOLLOWING"])
  {
    int v4 = 3;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearCustodianRecoveryKeys
{
}

- (void)addCustodianRecoveryKeys:(id)a3
{
  id v4 = a3;
  custodianRecoveryKeys = self->_custodianRecoveryKeys;
  id v8 = v4;
  if (!custodianRecoveryKeys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v7 = self->_custodianRecoveryKeys;
    self->_custodianRecoveryKeys = v6;

    id v4 = v8;
    custodianRecoveryKeys = self->_custodianRecoveryKeys;
  }

  -[NSMutableArray addObject:](custodianRecoveryKeys, "addObject:", v4);
}

- (unint64_t)custodianRecoveryKeysCount
{
  return -[NSMutableArray count](self->_custodianRecoveryKeys, "count");
}

- (id)custodianRecoveryKeysAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_custodianRecoveryKeys, "objectAtIndex:", a3);
}

- (BOOL)hasSecureElementIdentity
{
  return self->_secureElementIdentity != 0LL;
}

- (BOOL)hasWalrus
{
  return self->_walrus != 0LL;
}

- (BOOL)hasWebAccess
{
  return self->_webAccess != 0LL;
}

- (void)setIsInheritedAccount:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isInheritedAccount = a3;
}

- (void)setHasIsInheritedAccount:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsInheritedAccount
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)description
{
  char v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TPPBPeerStableInfo;
  -[TPPBPeerStableInfo description](&v8, sel_description);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TPPBPeerStableInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FC8] dictionary];
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_clock];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v5 forKey:@"clock"];

    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_frozenPolicyVersion];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v6 forKey:@"frozen_policy_version"];
  }

  frozenPolicyHash = self->_frozenPolicyHash;
  if (frozenPolicyHash) {
    [v3 setObject:frozenPolicyHash forKey:@"frozen_policy_hash"];
  }
  osVersion = self->_osVersion;
  if (osVersion) {
    [v3 setObject:osVersion forKey:@"os_version"];
  }
  deviceName = self->_deviceName;
  if (deviceName) {
    [v3 setObject:deviceName forKey:@"device_name"];
  }
  recoverySigningPublicKey = self->_recoverySigningPublicKey;
  if (recoverySigningPublicKey) {
    [v3 setObject:recoverySigningPublicKey forKey:@"recovery_signing_public_key"];
  }
  recoveryEncryptionPublicKey = self->_recoveryEncryptionPublicKey;
  if (recoveryEncryptionPublicKey) {
    [v3 setObject:recoveryEncryptionPublicKey forKey:@"recovery_encryption_public_key"];
  }
  serialNumber = self->_serialNumber;
  if (serialNumber) {
    [v3 setObject:serialNumber forKey:@"serial_number"];
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_flexiblePolicyVersion];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v13 forKey:@"flexible_policy_version"];
  }

  flexiblePolicyHash = self->_flexiblePolicyHash;
  if (flexiblePolicyHash) {
    [v3 setObject:flexiblePolicyHash forKey:@"flexible_policy_hash"];
  }
  if (-[NSMutableArray count](self->_policySecrets, "count"))
  {
    v15 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  -[NSMutableArray count](self->_policySecrets, "count"));
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    v16 = self->_policySecrets;
    uint64_t v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v43,  v48,  16LL);
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v44;
      do
      {
        for (uint64_t i = 0LL; i != v18; ++i)
        {
          if (*(void *)v44 != v19) {
            objc_enumerationMutation(v16);
          }
          [*(id *)(*((void *)&v43 + 1) + 8 * i) dictionaryRepresentation];
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          [v15 addObject:v21];
        }

        uint64_t v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v43,  v48,  16LL);
      }

      while (v18);
    }

    [v3 setObject:v15 forKey:@"policy_secrets"];
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    uint64_t userControllableViewStatus = self->_userControllableViewStatus;
    if (userControllableViewStatus >= 4)
    {
      objc_msgSend( NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_userControllableViewStatus);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v23 = off_18A22C068[userControllableViewStatus];
    }

    [v3 setObject:v23 forKey:@"user_controllable_view_status"];
  }

  if (-[NSMutableArray count](self->_custodianRecoveryKeys, "count"))
  {
    v24 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  -[NSMutableArray count](self->_custodianRecoveryKeys, "count"));
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    v25 = self->_custodianRecoveryKeys;
    uint64_t v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v39,  v47,  16LL);
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v40;
      do
      {
        for (uint64_t j = 0LL; j != v27; ++j)
        {
          if (*(void *)v40 != v28) {
            objc_enumerationMutation(v25);
          }
          [*(id *)(*((void *)&v39 + 1) + 8 * j) dictionaryRepresentation];
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          [v24 addObject:v30];
        }

        uint64_t v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v39,  v47,  16LL);
      }

      while (v27);
    }

    [v3 setObject:v24 forKey:@"custodian_recovery_keys"];
  }

  secureElementIdentity = self->_secureElementIdentity;
  if (secureElementIdentity)
  {
    v32 = -[TPPBSecureElementIdentity dictionaryRepresentation](secureElementIdentity, "dictionaryRepresentation");
    [v3 setObject:v32 forKey:@"secureElementIdentity"];
  }

  walrus = self->_walrus;
  if (walrus)
  {
    v34 = -[TPPBPeerStableInfoSetting dictionaryRepresentation](walrus, "dictionaryRepresentation");
    [v3 setObject:v34 forKey:@"walrus"];
  }

  webAccess = self->_webAccess;
  if (webAccess)
  {
    v36 = -[TPPBPeerStableInfoSetting dictionaryRepresentation](webAccess, "dictionaryRepresentation");
    [v3 setObject:v36 forKey:@"web_access"];
  }

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    [MEMORY[0x189607968] numberWithBool:self->_isInheritedAccount];
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v37 forKey:@"isInheritedAccount"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBPeerStableInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }

  if ((has & 4) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_frozenPolicyHash) {
    PBDataWriterWriteStringField();
  }
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v6 = self->_policySecrets;
  uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }

      uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
    }

    while (v8);
  }

  if (self->_osVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceName) {
    PBDataWriterWriteStringField();
  }
  if (self->_recoverySigningPublicKey) {
    PBDataWriterWriteDataField();
  }
  if (self->_recoveryEncryptionPublicKey) {
    PBDataWriterWriteDataField();
  }
  if (self->_serialNumber) {
    PBDataWriterWriteStringField();
  }
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_flexiblePolicyHash) {
    PBDataWriterWriteStringField();
  }
  if ((*(_BYTE *)&self->_has & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v11 = self->_custodianRecoveryKeys;
  uint64_t v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v16,  v24,  16LL);
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0LL; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }

      uint64_t v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v16,  v24,  16LL);
    }

    while (v13);
  }

  if (self->_secureElementIdentity) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_walrus) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_webAccess) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_clock;
    *((_BYTE *)v4 + 140) |= 1u;
    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    v4[3] = self->_frozenPolicyVersion;
    *((_BYTE *)v4 + 140) |= 4u;
  }

  id v16 = v4;
  if (self->_frozenPolicyHash) {
    objc_msgSend(v4, "setFrozenPolicyHash:");
  }
  if (-[TPPBPeerStableInfo policySecretsCount](self, "policySecretsCount"))
  {
    [v16 clearPolicySecrets];
    unint64_t v6 = -[TPPBPeerStableInfo policySecretsCount](self, "policySecretsCount");
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        -[TPPBPeerStableInfo policySecretsAtIndex:](self, "policySecretsAtIndex:", i);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v16 addPolicySecrets:v9];
      }
    }
  }

  if (self->_osVersion) {
    objc_msgSend(v16, "setOsVersion:");
  }
  v10 = v16;
  if (self->_deviceName)
  {
    objc_msgSend(v16, "setDeviceName:");
    v10 = v16;
  }

  if (self->_recoverySigningPublicKey)
  {
    objc_msgSend(v16, "setRecoverySigningPublicKey:");
    v10 = v16;
  }

  if (self->_recoveryEncryptionPublicKey)
  {
    objc_msgSend(v16, "setRecoveryEncryptionPublicKey:");
    v10 = v16;
  }

  if (self->_serialNumber)
  {
    objc_msgSend(v16, "setSerialNumber:");
    v10 = v16;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v10[2] = self->_flexiblePolicyVersion;
    *((_BYTE *)v10 + 140) |= 2u;
  }

  if (self->_flexiblePolicyHash)
  {
    objc_msgSend(v16, "setFlexiblePolicyHash:");
    v10 = v16;
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v10 + 28) = self->_userControllableViewStatus;
    *((_BYTE *)v10 + 140) |= 8u;
  }

  if (-[TPPBPeerStableInfo custodianRecoveryKeysCount](self, "custodianRecoveryKeysCount"))
  {
    [v16 clearCustodianRecoveryKeys];
    unint64_t v11 = -[TPPBPeerStableInfo custodianRecoveryKeysCount](self, "custodianRecoveryKeysCount");
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t j = 0LL; j != v12; ++j)
      {
        -[TPPBPeerStableInfo custodianRecoveryKeysAtIndex:](self, "custodianRecoveryKeysAtIndex:", j);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v16 addCustodianRecoveryKeys:v14];
      }
    }
  }

  if (self->_secureElementIdentity) {
    objc_msgSend(v16, "setSecureElementIdentity:");
  }
  v15 = v16;
  if (self->_walrus)
  {
    objc_msgSend(v16, "setWalrus:");
    v15 = v16;
  }

  if (self->_webAccess)
  {
    objc_msgSend(v16, "setWebAccess:");
    v15 = v16;
  }

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v15[136] = self->_isInheritedAccount;
    v15[140] |= 0x10u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(void *)(v5 + 8) = self->_clock;
    *(_BYTE *)(v5 + 140) |= 1u;
    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_frozenPolicyVersion;
    *(_BYTE *)(v5 + 140) |= 4u;
  }

  uint64_t v8 = -[NSString copyWithZone:](self->_frozenPolicyHash, "copyWithZone:", a3);
  uint64_t v9 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v8;

  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  v10 = self->_policySecrets;
  uint64_t v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v45,  v50,  16LL);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v46;
    do
    {
      for (uint64_t i = 0LL; i != v12; ++i)
      {
        if (*(void *)v46 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = (void *)[*(id *)(*((void *)&v45 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addPolicySecrets:v15];
      }

      uint64_t v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v45,  v50,  16LL);
    }

    while (v12);
  }

  uint64_t v16 = -[NSString copyWithZone:](self->_osVersion, "copyWithZone:", a3);
  __int128 v17 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v16;

  uint64_t v18 = -[NSString copyWithZone:](self->_deviceName, "copyWithZone:", a3);
  __int128 v19 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v18;

  uint64_t v20 = -[NSData copyWithZone:](self->_recoverySigningPublicKey, "copyWithZone:", a3);
  __int128 v21 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v20;

  uint64_t v22 = -[NSData copyWithZone:](self->_recoveryEncryptionPublicKey, "copyWithZone:", a3);
  __int128 v23 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v22;

  uint64_t v24 = -[NSString copyWithZone:](self->_serialNumber, "copyWithZone:", a3);
  v25 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v24;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(void *)(v6 + 16) = self->_flexiblePolicyVersion;
    *(_BYTE *)(v6 + 140) |= 2u;
  }

  uint64_t v26 = -[NSString copyWithZone:](self->_flexiblePolicyHash, "copyWithZone:", a3);
  uint64_t v27 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v26;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v6 + 112) = self->_userControllableViewStatus;
    *(_BYTE *)(v6 + 140) |= 8u;
  }

  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  uint64_t v28 = self->_custodianRecoveryKeys;
  uint64_t v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v41,  v49,  16LL);
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v42;
    do
    {
      for (uint64_t j = 0LL; j != v30; ++j)
      {
        if (*(void *)v42 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = (void *)objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * j), "copyWithZone:", a3, (void)v41);
        [(id)v6 addCustodianRecoveryKeys:v33];
      }

      uint64_t v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v41,  v49,  16LL);
    }

    while (v30);
  }

  id v34 = -[TPPBSecureElementIdentity copyWithZone:](self->_secureElementIdentity, "copyWithZone:", a3);
  v35 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v34;

  id v36 = -[TPPBPeerStableInfoSetting copyWithZone:](self->_walrus, "copyWithZone:", a3);
  v37 = *(void **)(v6 + 120);
  *(void *)(v6 + 120) = v36;

  id v38 = -[TPPBPeerStableInfoSetting copyWithZone:](self->_webAccess, "copyWithZone:", a3);
  __int128 v39 = *(void **)(v6 + 128);
  *(void *)(v6 + 128) = v38;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_BYTE *)(v6 + 136) = self->_isInheritedAccount;
    *(_BYTE *)(v6 + 140) |= 0x10u;
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 140) & 1) == 0 || self->_clock != *((void *)v4 + 1)) {
      goto LABEL_49;
    }
  }

  else if ((*((_BYTE *)v4 + 140) & 1) != 0)
  {
    goto LABEL_49;
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 140) & 4) == 0 || self->_frozenPolicyVersion != *((void *)v4 + 3)) {
      goto LABEL_49;
    }
  }

  else if ((*((_BYTE *)v4 + 140) & 4) != 0)
  {
    goto LABEL_49;
  }

  frozenPolicyHash = self->_frozenPolicyHash;
  if ((unint64_t)frozenPolicyHash | *((void *)v4 + 7)
    && !-[NSString isEqual:](frozenPolicyHash, "isEqual:"))
  {
    goto LABEL_49;
  }

  policySecrets = self->_policySecrets;
  if ((unint64_t)policySecrets | *((void *)v4 + 9))
  {
  }

  osVersion = self->_osVersion;
  if ((unint64_t)osVersion | *((void *)v4 + 8))
  {
  }

  deviceName = self->_deviceName;
  if ((unint64_t)deviceName | *((void *)v4 + 5))
  {
  }

  recoverySigningPublicKey = self->_recoverySigningPublicKey;
  if ((unint64_t)recoverySigningPublicKey | *((void *)v4 + 11))
  {
  }

  recoveryEncryptionPublicKey = self->_recoveryEncryptionPublicKey;
  if ((unint64_t)recoveryEncryptionPublicKey | *((void *)v4 + 10))
  {
  }

  serialNumber = self->_serialNumber;
  if ((unint64_t)serialNumber | *((void *)v4 + 13))
  {
  }

  char has = (char)self->_has;
  char v13 = *((_BYTE *)v4 + 140);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 140) & 2) == 0 || self->_flexiblePolicyVersion != *((void *)v4 + 2)) {
      goto LABEL_49;
    }
  }

  else if ((*((_BYTE *)v4 + 140) & 2) != 0)
  {
    goto LABEL_49;
  }

  flexiblePolicyHash = self->_flexiblePolicyHash;
  if ((unint64_t)flexiblePolicyHash | *((void *)v4 + 6))
  {
    char has = (char)self->_has;
    char v13 = *((_BYTE *)v4 + 140);
  }

  if ((has & 8) != 0)
  {
    if ((v13 & 8) == 0 || self->_userControllableViewStatus != *((_DWORD *)v4 + 28)) {
      goto LABEL_49;
    }
  }

  else if ((v13 & 8) != 0)
  {
    goto LABEL_49;
  }

  custodianRecoveryKeys = self->_custodianRecoveryKeys;
  if ((unint64_t)custodianRecoveryKeys | *((void *)v4 + 4)
    && !-[NSMutableArray isEqual:](custodianRecoveryKeys, "isEqual:"))
  {
    goto LABEL_49;
  }

  secureElementIdentity = self->_secureElementIdentity;
  if ((unint64_t)secureElementIdentity | *((void *)v4 + 12))
  {
    if (!-[TPPBSecureElementIdentity isEqual:](secureElementIdentity, "isEqual:")) {
      goto LABEL_49;
    }
  }

  walrus = self->_walrus;
  if ((unint64_t)walrus | *((void *)v4 + 15))
  {
    if (!-[TPPBPeerStableInfoSetting isEqual:](walrus, "isEqual:")) {
      goto LABEL_49;
    }
  }

  webAccess = self->_webAccess;
  if ((unint64_t)webAccess | *((void *)v4 + 16))
  {
    if (!-[TPPBPeerStableInfoSetting isEqual:](webAccess, "isEqual:")) {
      goto LABEL_49;
    }
  }

  BOOL v19 = (*((_BYTE *)v4 + 140) & 0x10) == 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 140) & 0x10) != 0)
    {
      if (self->_isInheritedAccount)
      {
        if (!*((_BYTE *)v4 + 136)) {
          goto LABEL_49;
        }
      }

      else if (*((_BYTE *)v4 + 136))
      {
        goto LABEL_49;
      }

      BOOL v19 = 1;
      goto LABEL_50;
    }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    unint64_t v20 = 2654435761u * self->_clock;
    if ((*(_BYTE *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }

  else
  {
    unint64_t v20 = 0LL;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      unint64_t v19 = 2654435761u * self->_frozenPolicyVersion;
      goto LABEL_6;
    }
  }

  unint64_t v19 = 0LL;
LABEL_6:
  NSUInteger v18 = -[NSString hash](self->_frozenPolicyHash, "hash");
  uint64_t v17 = -[NSMutableArray hash](self->_policySecrets, "hash");
  NSUInteger v16 = -[NSString hash](self->_osVersion, "hash");
  NSUInteger v15 = -[NSString hash](self->_deviceName, "hash");
  uint64_t v14 = -[NSData hash](self->_recoverySigningPublicKey, "hash");
  uint64_t v13 = -[NSData hash](self->_recoveryEncryptionPublicKey, "hash");
  NSUInteger v3 = -[NSString hash](self->_serialNumber, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    unint64_t v4 = 2654435761u * self->_flexiblePolicyVersion;
  }
  else {
    unint64_t v4 = 0LL;
  }
  NSUInteger v5 = -[NSString hash](self->_flexiblePolicyHash, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0) {
    uint64_t v6 = 2654435761LL * self->_userControllableViewStatus;
  }
  else {
    uint64_t v6 = 0LL;
  }
  uint64_t v7 = -[NSMutableArray hash](self->_custodianRecoveryKeys, "hash");
  unint64_t v8 = -[TPPBSecureElementIdentity hash](self->_secureElementIdentity, "hash");
  unint64_t v9 = -[TPPBPeerStableInfoSetting hash](self->_walrus, "hash");
  unint64_t v10 = -[TPPBPeerStableInfoSetting hash](self->_webAccess, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0) {
    uint64_t v11 = 2654435761LL * self->_isInheritedAccount;
  }
  else {
    uint64_t v11 = 0LL;
  }
  return v19 ^ v20 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  unint64_t v4 = (unint64_t *)a3;
  NSUInteger v5 = v4;
  char v6 = *((_BYTE *)v4 + 140);
  if ((v6 & 1) != 0)
  {
    self->_clock = v4[1];
    *(_BYTE *)&self->_has |= 1u;
    char v6 = *((_BYTE *)v4 + 140);
  }

  if ((v6 & 4) != 0)
  {
    self->_frozenPolicyVersion = v4[3];
    *(_BYTE *)&self->_has |= 4u;
  }

  if (v4[7]) {
    -[TPPBPeerStableInfo setFrozenPolicyHash:](self, "setFrozenPolicyHash:");
  }
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v7 = (id)v5[9];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        -[TPPBPeerStableInfo addPolicySecrets:](self, "addPolicySecrets:", *(void *)(*((void *)&v27 + 1) + 8 * i));
      }

      uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }

    while (v9);
  }

  if (v5[8]) {
    -[TPPBPeerStableInfo setOsVersion:](self, "setOsVersion:");
  }
  if (v5[5]) {
    -[TPPBPeerStableInfo setDeviceName:](self, "setDeviceName:");
  }
  if (v5[11]) {
    -[TPPBPeerStableInfo setRecoverySigningPublicKey:](self, "setRecoverySigningPublicKey:");
  }
  if (v5[10]) {
    -[TPPBPeerStableInfo setRecoveryEncryptionPublicKey:](self, "setRecoveryEncryptionPublicKey:");
  }
  if (v5[13]) {
    -[TPPBPeerStableInfo setSerialNumber:](self, "setSerialNumber:");
  }
  if ((*((_BYTE *)v5 + 140) & 2) != 0)
  {
    self->_flexiblePolicyVersion = v5[2];
    *(_BYTE *)&self->_has |= 2u;
  }

  if (v5[6]) {
    -[TPPBPeerStableInfo setFlexiblePolicyHash:](self, "setFlexiblePolicyHash:");
  }
  if ((*((_BYTE *)v5 + 140) & 8) != 0)
  {
    self->_uint64_t userControllableViewStatus = *((_DWORD *)v5 + 28);
    *(_BYTE *)&self->_has |= 8u;
  }

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v12 = (id)v5[4];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t j = 0LL; j != v14; ++j)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        -[TPPBPeerStableInfo addCustodianRecoveryKeys:]( self,  "addCustodianRecoveryKeys:",  *(void *)(*((void *)&v23 + 1) + 8 * j),  (void)v23);
      }

      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }

    while (v14);
  }

  secureElementIdentity = self->_secureElementIdentity;
  unint64_t v18 = v5[12];
  if (secureElementIdentity)
  {
    if (v18) {
      -[TPPBSecureElementIdentity mergeFrom:](secureElementIdentity, "mergeFrom:");
    }
  }

  else if (v18)
  {
    -[TPPBPeerStableInfo setSecureElementIdentity:](self, "setSecureElementIdentity:");
  }

  walrus = self->_walrus;
  unint64_t v20 = v5[15];
  if (walrus)
  {
    if (v20) {
      -[TPPBPeerStableInfoSetting mergeFrom:](walrus, "mergeFrom:");
    }
  }

  else if (v20)
  {
    -[TPPBPeerStableInfo setWalrus:](self, "setWalrus:");
  }

  webAccess = self->_webAccess;
  unint64_t v22 = v5[16];
  if (webAccess)
  {
    if (v22) {
      -[TPPBPeerStableInfoSetting mergeFrom:](webAccess, "mergeFrom:");
    }
  }

  else if (v22)
  {
    -[TPPBPeerStableInfo setWebAccess:](self, "setWebAccess:");
  }

  if ((*((_BYTE *)v5 + 140) & 0x10) != 0)
  {
    self->_isInheritedAccount = *((_BYTE *)v5 + 136);
    *(_BYTE *)&self->_has |= 0x10u;
  }
}

- (unint64_t)clock
{
  return self->_clock;
}

- (unint64_t)frozenPolicyVersion
{
  return self->_frozenPolicyVersion;
}

- (NSString)frozenPolicyHash
{
  return self->_frozenPolicyHash;
}

- (void)setFrozenPolicyHash:(id)a3
{
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (void)setOsVersion:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSData)recoverySigningPublicKey
{
  return self->_recoverySigningPublicKey;
}

- (void)setRecoverySigningPublicKey:(id)a3
{
}

- (NSData)recoveryEncryptionPublicKey
{
  return self->_recoveryEncryptionPublicKey;
}

- (void)setRecoveryEncryptionPublicKey:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (unint64_t)flexiblePolicyVersion
{
  return self->_flexiblePolicyVersion;
}

- (NSString)flexiblePolicyHash
{
  return self->_flexiblePolicyHash;
}

- (void)setFlexiblePolicyHash:(id)a3
{
}

- (NSMutableArray)policySecrets
{
  return self->_policySecrets;
}

- (void)setPolicySecrets:(id)a3
{
}

- (NSMutableArray)custodianRecoveryKeys
{
  return self->_custodianRecoveryKeys;
}

- (void)setCustodianRecoveryKeys:(id)a3
{
}

- (TPPBSecureElementIdentity)secureElementIdentity
{
  return self->_secureElementIdentity;
}

- (void)setSecureElementIdentity:(id)a3
{
}

- (TPPBPeerStableInfoSetting)walrus
{
  return self->_walrus;
}

- (void)setWalrus:(id)a3
{
}

- (TPPBPeerStableInfoSetting)webAccess
{
  return self->_webAccess;
}

- (void)setWebAccess:(id)a3
{
}

- (BOOL)isInheritedAccount
{
  return self->_isInheritedAccount;
}

- (void).cxx_destruct
{
}

+ (Class)policySecretsType
{
  return (Class)objc_opt_class();
}

+ (Class)custodianRecoveryKeysType
{
  return (Class)objc_opt_class();
}

@end