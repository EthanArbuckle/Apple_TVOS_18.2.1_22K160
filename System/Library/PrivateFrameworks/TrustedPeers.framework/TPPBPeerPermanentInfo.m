@interface TPPBPeerPermanentInfo
- (BOOL)hasCreationTime;
- (BOOL)hasEncryptionPubKey;
- (BOOL)hasEpoch;
- (BOOL)hasMachineId;
- (BOOL)hasModelId;
- (BOOL)hasSigningPubKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)encryptionPubKey;
- (NSData)signingPubKey;
- (NSString)machineId;
- (NSString)modelId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)creationTime;
- (unint64_t)epoch;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCreationTime:(unint64_t)a3;
- (void)setEncryptionPubKey:(id)a3;
- (void)setEpoch:(unint64_t)a3;
- (void)setHasCreationTime:(BOOL)a3;
- (void)setHasEpoch:(BOOL)a3;
- (void)setMachineId:(id)a3;
- (void)setModelId:(id)a3;
- (void)setSigningPubKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBPeerPermanentInfo

- (void)setEpoch:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_epoch = a3;
}

- (void)setHasEpoch:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEpoch
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasSigningPubKey
{
  return self->_signingPubKey != 0LL;
}

- (BOOL)hasEncryptionPubKey
{
  return self->_encryptionPubKey != 0LL;
}

- (BOOL)hasMachineId
{
  return self->_machineId != 0LL;
}

- (BOOL)hasModelId
{
  return self->_modelId != 0LL;
}

- (void)setCreationTime:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_creationTime = a3;
}

- (void)setHasCreationTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreationTime
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  char v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TPPBPeerPermanentInfo;
  v4 = -[TPPBPeerPermanentInfo description](&v8, sel_description);
  v5 = -[TPPBPeerPermanentInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_epoch];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v4 forKey:@"epoch"];
  }

  signingPubKey = self->_signingPubKey;
  if (signingPubKey) {
    [v3 setObject:signingPubKey forKey:@"signing_pub_key"];
  }
  encryptionPubKey = self->_encryptionPubKey;
  if (encryptionPubKey) {
    [v3 setObject:encryptionPubKey forKey:@"encryption_pub_key"];
  }
  machineId = self->_machineId;
  if (machineId) {
    [v3 setObject:machineId forKey:@"machine_id"];
  }
  modelId = self->_modelId;
  if (modelId) {
    [v3 setObject:modelId forKey:@"model_id"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_creationTime];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v9 forKey:@"creation_time"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBPeerPermanentInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_signingPubKey) {
    PBDataWriterWriteDataField();
  }
  if (self->_encryptionPubKey) {
    PBDataWriterWriteDataField();
  }
  if (self->_machineId) {
    PBDataWriterWriteStringField();
  }
  if (self->_modelId) {
    PBDataWriterWriteStringField();
  }
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[2] = self->_epoch;
    *((_BYTE *)v4 + 56) |= 2u;
  }

  v5 = v4;
  if (self->_signingPubKey)
  {
    objc_msgSend(v4, "setSigningPubKey:");
    id v4 = v5;
  }

  if (self->_encryptionPubKey)
  {
    objc_msgSend(v5, "setEncryptionPubKey:");
    id v4 = v5;
  }

  if (self->_machineId)
  {
    objc_msgSend(v5, "setMachineId:");
    id v4 = v5;
  }

  if (self->_modelId)
  {
    objc_msgSend(v5, "setModelId:");
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_creationTime;
    *((_BYTE *)v4 + 56) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_epoch;
    *(_BYTE *)(v5 + 56) |= 2u;
  }

  uint64_t v7 = -[NSData copyWithZone:](self->_signingPubKey, "copyWithZone:", a3);
  objc_super v8 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v7;

  uint64_t v9 = -[NSData copyWithZone:](self->_encryptionPubKey, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v9;

  uint64_t v11 = -[NSString copyWithZone:](self->_machineId, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v11;

  uint64_t v13 = -[NSString copyWithZone:](self->_modelId, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v13;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(void *)(v6 + 8) = self->_creationTime;
    *(_BYTE *)(v6 + 56) |= 1u;
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_epoch != *((void *)v4 + 2)) {
      goto LABEL_19;
    }
  }

  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
LABEL_19:
    BOOL v9 = 0;
    goto LABEL_20;
  }

  signingPubKey = self->_signingPubKey;
  if ((unint64_t)signingPubKey | *((void *)v4 + 6)
    && !-[NSData isEqual:](signingPubKey, "isEqual:"))
  {
    goto LABEL_19;
  }

  encryptionPubKey = self->_encryptionPubKey;
  if ((unint64_t)encryptionPubKey | *((void *)v4 + 3))
  {
  }

  machineId = self->_machineId;
  if ((unint64_t)machineId | *((void *)v4 + 4))
  {
  }

  modelId = self->_modelId;
  if ((unint64_t)modelId | *((void *)v4 + 5))
  {
  }

  BOOL v9 = (*((_BYTE *)v4 + 56) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_creationTime != *((void *)v4 + 1)) {
      goto LABEL_19;
    }
    BOOL v9 = 1;
  }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    unint64_t v3 = 2654435761u * self->_epoch;
  }
  else {
    unint64_t v3 = 0LL;
  }
  uint64_t v4 = -[NSData hash](self->_signingPubKey, "hash");
  uint64_t v5 = -[NSData hash](self->_encryptionPubKey, "hash");
  NSUInteger v6 = -[NSString hash](self->_machineId, "hash");
  NSUInteger v7 = -[NSString hash](self->_modelId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    unint64_t v8 = 2654435761u * self->_creationTime;
  }
  else {
    unint64_t v8 = 0LL;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if ((v4[7] & 2) != 0)
  {
    self->_epoch = v4[2];
    *(_BYTE *)&self->_has |= 2u;
  }

  uint64_t v5 = v4;
  if (v4[6])
  {
    -[TPPBPeerPermanentInfo setSigningPubKey:](self, "setSigningPubKey:");
    uint64_t v4 = v5;
  }

  if (v4[3])
  {
    -[TPPBPeerPermanentInfo setEncryptionPubKey:](self, "setEncryptionPubKey:");
    uint64_t v4 = v5;
  }

  if (v4[4])
  {
    -[TPPBPeerPermanentInfo setMachineId:](self, "setMachineId:");
    uint64_t v4 = v5;
  }

  if (v4[5])
  {
    -[TPPBPeerPermanentInfo setModelId:](self, "setModelId:");
    uint64_t v4 = v5;
  }

  if ((v4[7] & 1) != 0)
  {
    self->_creationTime = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (unint64_t)epoch
{
  return self->_epoch;
}

- (NSData)signingPubKey
{
  return self->_signingPubKey;
}

- (void)setSigningPubKey:(id)a3
{
}

- (NSData)encryptionPubKey
{
  return self->_encryptionPubKey;
}

- (void)setEncryptionPubKey:(id)a3
{
}

- (NSString)machineId
{
  return self->_machineId;
}

- (void)setMachineId:(id)a3
{
}

- (NSString)modelId
{
  return self->_modelId;
}

- (void)setModelId:(id)a3
{
}

- (unint64_t)creationTime
{
  return self->_creationTime;
}

- (void).cxx_destruct
{
}

@end