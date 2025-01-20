@interface TPPBCustodianRecoveryKey
- (BOOL)hasEncryptionPublicKey;
- (BOOL)hasKind;
- (BOOL)hasSigningPublicKey;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)encryptionPublicKey;
- (NSData)signingPublicKey;
- (NSString)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)kindAsString:(int)a3;
- (int)StringAsKind:(id)a3;
- (int)kind;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEncryptionPublicKey:(id)a3;
- (void)setHasKind:(BOOL)a3;
- (void)setKind:(int)a3;
- (void)setSigningPublicKey:(id)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBCustodianRecoveryKey

- (BOOL)hasUuid
{
  return self->_uuid != 0LL;
}

- (BOOL)hasSigningPublicKey
{
  return self->_signingPublicKey != 0LL;
}

- (BOOL)hasEncryptionPublicKey
{
  return self->_encryptionPublicKey != 0LL;
}

- (int)kind
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return self->_kind;
  }
  else {
    return 0;
  }
}

- (void)setKind:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_kind = a3;
}

- (void)setHasKind:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasKind
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)kindAsString:(int)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsKind:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"RECOVERY_KEY"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"INHERITANCE_KEY"])
  {
    int v4 = 2;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TPPBCustodianRecoveryKey;
  -[TPPBCustodianRecoveryKey description](&v8, sel_description);
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TPPBCustodianRecoveryKey dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = v3;
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  signingPublicKey = self->_signingPublicKey;
  if (signingPublicKey) {
    [v4 setObject:signingPublicKey forKey:@"signing_public_key"];
  }
  encryptionPublicKey = self->_encryptionPublicKey;
  if (encryptionPublicKey) {
    [v4 setObject:encryptionPublicKey forKey:@"encryption_public_key"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t kind = self->_kind;
    if (kind >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_kind);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v9 = off_18A22C050[kind];
    }

    [v4 setObject:v9 forKey:@"kind"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBCustodianRecoveryKeyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uuid)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }

  if (self->_signingPublicKey)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }

  if (self->_encryptionPublicKey)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    id v4 = v5;
  }

  if (self->_signingPublicKey)
  {
    objc_msgSend(v5, "setSigningPublicKey:");
    id v4 = v5;
  }

  if (self->_encryptionPublicKey)
  {
    objc_msgSend(v5, "setEncryptionPublicKey:");
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_kind;
    *((_BYTE *)v4 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = -[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = -[NSData copyWithZone:](self->_signingPublicKey, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = -[NSData copyWithZone:](self->_encryptionPublicKey, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_kind;
    *(_BYTE *)(v5 + 40) |= 1u;
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 4))
  {
  }

  signingPublicKey = self->_signingPublicKey;
  if ((unint64_t)signingPublicKey | *((void *)v4 + 3))
  {
  }

  encryptionPublicKey = self->_encryptionPublicKey;
  if ((unint64_t)encryptionPublicKey | *((void *)v4 + 1))
  {
  }

  BOOL v8 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) != 0 && self->_kind == *((_DWORD *)v4 + 4))
    {
      BOOL v8 = 1;
      goto LABEL_13;
    }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_uuid, "hash");
  uint64_t v4 = -[NSData hash](self->_signingPublicKey, "hash");
  uint64_t v5 = -[NSData hash](self->_encryptionPublicKey, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v6 = 2654435761LL * self->_kind;
  }
  else {
    uint64_t v6 = 0LL;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 4))
  {
    -[TPPBCustodianRecoveryKey setUuid:](self, "setUuid:");
    uint64_t v4 = v5;
  }

  if (*((void *)v4 + 3))
  {
    -[TPPBCustodianRecoveryKey setSigningPublicKey:](self, "setSigningPublicKey:");
    uint64_t v4 = v5;
  }

  if (*((void *)v4 + 1))
  {
    -[TPPBCustodianRecoveryKey setEncryptionPublicKey:](self, "setEncryptionPublicKey:");
    uint64_t v4 = v5;
  }

  if ((v4[10] & 1) != 0)
  {
    self->_uint64_t kind = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSData)signingPublicKey
{
  return self->_signingPublicKey;
}

- (void)setSigningPublicKey:(id)a3
{
}

- (NSData)encryptionPublicKey
{
  return self->_encryptionPublicKey;
}

- (void)setEncryptionPublicKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end