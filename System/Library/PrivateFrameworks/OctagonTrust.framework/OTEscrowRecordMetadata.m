@interface OTEscrowRecordMetadata
- (BOOL)hasBackupKeybagDigest;
- (BOOL)hasBottleId;
- (BOOL)hasBottleValidity;
- (BOOL)hasBuild;
- (BOOL)hasClientMetadata;
- (BOOL)hasEscrowedSpki;
- (BOOL)hasPasscodeGeneration;
- (BOOL)hasPeerInfo;
- (BOOL)hasSecureBackupTimestamp;
- (BOOL)hasSecureBackupUsesMultipleIcscs;
- (BOOL)hasSerial;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)backupKeybagDigest;
- (NSData)escrowedSpki;
- (NSData)peerInfo;
- (NSString)bottleId;
- (NSString)bottleValidity;
- (NSString)build;
- (NSString)serial;
- (OTEscrowRecordMetadataClientMetadata)clientMetadata;
- (OTEscrowRecordMetadataPasscodeGeneration)passcodeGeneration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)secureBackupTimestamp;
- (unint64_t)secureBackupUsesMultipleIcscs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBackupKeybagDigest:(id)a3;
- (void)setBottleId:(id)a3;
- (void)setBottleValidity:(id)a3;
- (void)setBuild:(id)a3;
- (void)setClientMetadata:(id)a3;
- (void)setEscrowedSpki:(id)a3;
- (void)setHasSecureBackupTimestamp:(BOOL)a3;
- (void)setHasSecureBackupUsesMultipleIcscs:(BOOL)a3;
- (void)setPasscodeGeneration:(id)a3;
- (void)setPeerInfo:(id)a3;
- (void)setSecureBackupTimestamp:(unint64_t)a3;
- (void)setSecureBackupUsesMultipleIcscs:(unint64_t)a3;
- (void)setSerial:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTEscrowRecordMetadata

- (BOOL)hasBackupKeybagDigest
{
  return self->_backupKeybagDigest != 0LL;
}

- (BOOL)hasClientMetadata
{
  return self->_clientMetadata != 0LL;
}

- (void)setSecureBackupUsesMultipleIcscs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_secureBackupUsesMultipleIcscs = a3;
}

- (void)setHasSecureBackupUsesMultipleIcscs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSecureBackupUsesMultipleIcscs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasBottleId
{
  return self->_bottleId != 0LL;
}

- (void)setSecureBackupTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_secureBackupTimestamp = a3;
}

- (void)setHasSecureBackupTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSecureBackupTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasEscrowedSpki
{
  return self->_escrowedSpki != 0LL;
}

- (BOOL)hasPeerInfo
{
  return self->_peerInfo != 0LL;
}

- (BOOL)hasBottleValidity
{
  return self->_bottleValidity != 0LL;
}

- (BOOL)hasSerial
{
  return self->_serial != 0LL;
}

- (BOOL)hasBuild
{
  return self->_build != 0LL;
}

- (BOOL)hasPasscodeGeneration
{
  return self->_passcodeGeneration != 0LL;
}

- (id)description
{
  char v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OTEscrowRecordMetadata;
  v4 = -[OTEscrowRecordMetadata description](&v8, sel_description);
  v5 = -[OTEscrowRecordMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  backupKeybagDigest = self->_backupKeybagDigest;
  if (backupKeybagDigest) {
    [v3 setObject:backupKeybagDigest forKey:@"backup_keybag_digest"];
  }
  clientMetadata = self->_clientMetadata;
  if (clientMetadata)
  {
    v7 = -[OTEscrowRecordMetadataClientMetadata dictionaryRepresentation](clientMetadata, "dictionaryRepresentation");
    [v4 setObject:v7 forKey:@"client_metadata"];
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_secureBackupUsesMultipleIcscs];
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v8 forKey:@"secure_backup_uses_multiple_icscs"];
  }

  bottleId = self->_bottleId;
  if (bottleId) {
    [v4 setObject:bottleId forKey:@"bottle_id"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_secureBackupTimestamp];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v10 forKey:@"secure_backup_timestamp"];
  }

  escrowedSpki = self->_escrowedSpki;
  if (escrowedSpki) {
    [v4 setObject:escrowedSpki forKey:@"escrowed_spki"];
  }
  peerInfo = self->_peerInfo;
  if (peerInfo) {
    [v4 setObject:peerInfo forKey:@"peer_info"];
  }
  bottleValidity = self->_bottleValidity;
  if (bottleValidity) {
    [v4 setObject:bottleValidity forKey:@"bottle_validity"];
  }
  serial = self->_serial;
  if (serial) {
    [v4 setObject:serial forKey:@"serial"];
  }
  build = self->_build;
  if (build) {
    [v4 setObject:build forKey:@"build"];
  }
  passcodeGeneration = self->_passcodeGeneration;
  if (passcodeGeneration)
  {
    v17 = -[OTEscrowRecordMetadataPasscodeGeneration dictionaryRepresentation](passcodeGeneration, "dictionaryRepresentation");
    [v4 setObject:v17 forKey:@"passcodeGeneration"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return OTEscrowRecordMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_backupKeybagDigest)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }

  if (self->_clientMetadata)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }

  if (self->_bottleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }

  if (self->_escrowedSpki)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }

  if (self->_peerInfo)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }

  if (self->_bottleValidity)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }

  if (self->_serial)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }

  if (self->_build)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }

  if (self->_passcodeGeneration)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_backupKeybagDigest)
  {
    objc_msgSend(v4, "setBackupKeybagDigest:");
    id v4 = v5;
  }

  if (self->_clientMetadata)
  {
    objc_msgSend(v5, "setClientMetadata:");
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_secureBackupUsesMultipleIcscs;
    *((_BYTE *)v4 + 96) |= 2u;
  }

  if (self->_bottleId)
  {
    objc_msgSend(v5, "setBottleId:");
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((void *)v4 + 1) = self->_secureBackupTimestamp;
    *((_BYTE *)v4 + 96) |= 1u;
  }

  if (self->_escrowedSpki)
  {
    objc_msgSend(v5, "setEscrowedSpki:");
    id v4 = v5;
  }

  if (self->_peerInfo)
  {
    objc_msgSend(v5, "setPeerInfo:");
    id v4 = v5;
  }

  if (self->_bottleValidity)
  {
    objc_msgSend(v5, "setBottleValidity:");
    id v4 = v5;
  }

  if (self->_serial)
  {
    objc_msgSend(v5, "setSerial:");
    id v4 = v5;
  }

  if (self->_build)
  {
    objc_msgSend(v5, "setBuild:");
    id v4 = v5;
  }

  if (self->_passcodeGeneration)
  {
    objc_msgSend(v5, "setPasscodeGeneration:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = -[NSData copyWithZone:](self->_backupKeybagDigest, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  id v8 = -[OTEscrowRecordMetadataClientMetadata copyWithZone:](self->_clientMetadata, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_secureBackupUsesMultipleIcscs;
    *(_BYTE *)(v5 + 96) |= 2u;
  }

  uint64_t v10 = -[NSString copyWithZone:](self->_bottleId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(void *)(v5 + 8) = self->_secureBackupTimestamp;
    *(_BYTE *)(v5 + 96) |= 1u;
  }

  uint64_t v12 = -[NSData copyWithZone:](self->_escrowedSpki, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v12;

  uint64_t v14 = -[NSData copyWithZone:](self->_peerInfo, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v14;

  uint64_t v16 = -[NSString copyWithZone:](self->_bottleValidity, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v16;

  uint64_t v18 = -[NSString copyWithZone:](self->_serial, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v18;

  uint64_t v20 = -[NSString copyWithZone:](self->_build, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v20;

  id v22 = -[OTEscrowRecordMetadataPasscodeGeneration copyWithZone:](self->_passcodeGeneration, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v22;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  backupKeybagDigest = self->_backupKeybagDigest;
  if ((unint64_t)backupKeybagDigest | *((void *)v4 + 3))
  {
  }

  clientMetadata = self->_clientMetadata;
  if ((unint64_t)clientMetadata | *((void *)v4 + 7))
  {
    if (!-[OTEscrowRecordMetadataClientMetadata isEqual:](clientMetadata, "isEqual:")) {
      goto LABEL_31;
    }
  }

  char has = (char)self->_has;
  char v8 = *((_BYTE *)v4 + 96);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 2) == 0 || self->_secureBackupUsesMultipleIcscs != *((void *)v4 + 2)) {
      goto LABEL_31;
    }
  }

  else if ((*((_BYTE *)v4 + 96) & 2) != 0)
  {
    goto LABEL_31;
  }

  bottleId = self->_bottleId;
  if ((unint64_t)bottleId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](bottleId, "isEqual:"))
    {
LABEL_31:
      char v16 = 0;
      goto LABEL_32;
    }

    char has = (char)self->_has;
    char v8 = *((_BYTE *)v4 + 96);
  }

  if ((has & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_secureBackupTimestamp != *((void *)v4 + 1)) {
      goto LABEL_31;
    }
  }

  else if ((v8 & 1) != 0)
  {
    goto LABEL_31;
  }

  escrowedSpki = self->_escrowedSpki;
  if ((unint64_t)escrowedSpki | *((void *)v4 + 8)
    && !-[NSData isEqual:](escrowedSpki, "isEqual:"))
  {
    goto LABEL_31;
  }

  peerInfo = self->_peerInfo;
  if ((unint64_t)peerInfo | *((void *)v4 + 10))
  {
  }

  bottleValidity = self->_bottleValidity;
  if ((unint64_t)bottleValidity | *((void *)v4 + 5))
  {
  }

  serial = self->_serial;
  if ((unint64_t)serial | *((void *)v4 + 11))
  {
  }

  build = self->_build;
  if ((unint64_t)build | *((void *)v4 + 6))
  {
  }

  passcodeGeneration = self->_passcodeGeneration;
  else {
    char v16 = 1;
  }
LABEL_32:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3 = -[NSData hash](self->_backupKeybagDigest, "hash");
  unint64_t v4 = -[OTEscrowRecordMetadataClientMetadata hash](self->_clientMetadata, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    unint64_t v5 = 2654435761u * self->_secureBackupUsesMultipleIcscs;
  }
  else {
    unint64_t v5 = 0LL;
  }
  NSUInteger v6 = -[NSString hash](self->_bottleId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    unint64_t v7 = 2654435761u * self->_secureBackupTimestamp;
  }
  else {
    unint64_t v7 = 0LL;
  }
  unint64_t v8 = v4 ^ v3 ^ v5 ^ v6;
  uint64_t v9 = v7 ^ -[NSData hash](self->_escrowedSpki, "hash");
  uint64_t v10 = v8 ^ v9 ^ -[NSData hash](self->_peerInfo, "hash");
  NSUInteger v11 = -[NSString hash](self->_bottleValidity, "hash");
  NSUInteger v12 = v11 ^ -[NSString hash](self->_serial, "hash");
  NSUInteger v13 = v12 ^ -[NSString hash](self->_build, "hash");
  return v10 ^ v13 ^ -[OTEscrowRecordMetadataPasscodeGeneration hash](self->_passcodeGeneration, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  uint64_t v9 = v4;
  if (v4[3])
  {
    -[OTEscrowRecordMetadata setBackupKeybagDigest:](self, "setBackupKeybagDigest:");
    unint64_t v4 = v9;
  }

  clientMetadata = self->_clientMetadata;
  uint64_t v6 = v4[7];
  if (clientMetadata)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[OTEscrowRecordMetadataClientMetadata mergeFrom:](clientMetadata, "mergeFrom:");
  }

  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[OTEscrowRecordMetadata setClientMetadata:](self, "setClientMetadata:");
  }

  unint64_t v4 = v9;
LABEL_9:
  if ((v4[12] & 2) != 0)
  {
    self->_secureBackupUsesMultipleIcscs = v4[2];
    *(_BYTE *)&self->_has |= 2u;
  }

  if (v4[4])
  {
    -[OTEscrowRecordMetadata setBottleId:](self, "setBottleId:");
    unint64_t v4 = v9;
  }

  if ((v4[12] & 1) != 0)
  {
    self->_secureBackupTimestamp = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

  if (v4[8])
  {
    -[OTEscrowRecordMetadata setEscrowedSpki:](self, "setEscrowedSpki:");
    unint64_t v4 = v9;
  }

  if (v4[10])
  {
    -[OTEscrowRecordMetadata setPeerInfo:](self, "setPeerInfo:");
    unint64_t v4 = v9;
  }

  if (v4[5])
  {
    -[OTEscrowRecordMetadata setBottleValidity:](self, "setBottleValidity:");
    unint64_t v4 = v9;
  }

  if (v4[11])
  {
    -[OTEscrowRecordMetadata setSerial:](self, "setSerial:");
    unint64_t v4 = v9;
  }

  if (v4[6])
  {
    -[OTEscrowRecordMetadata setBuild:](self, "setBuild:");
    unint64_t v4 = v9;
  }

  passcodeGeneration = self->_passcodeGeneration;
  uint64_t v8 = v4[9];
  if (passcodeGeneration)
  {
    if (v8)
    {
      -[OTEscrowRecordMetadataPasscodeGeneration mergeFrom:](passcodeGeneration, "mergeFrom:");
LABEL_30:
      unint64_t v4 = v9;
    }
  }

  else if (v8)
  {
    -[OTEscrowRecordMetadata setPasscodeGeneration:](self, "setPasscodeGeneration:");
    goto LABEL_30;
  }
}

- (NSData)backupKeybagDigest
{
  return self->_backupKeybagDigest;
}

- (void)setBackupKeybagDigest:(id)a3
{
}

- (OTEscrowRecordMetadataClientMetadata)clientMetadata
{
  return self->_clientMetadata;
}

- (void)setClientMetadata:(id)a3
{
}

- (unint64_t)secureBackupUsesMultipleIcscs
{
  return self->_secureBackupUsesMultipleIcscs;
}

- (NSString)bottleId
{
  return self->_bottleId;
}

- (void)setBottleId:(id)a3
{
}

- (unint64_t)secureBackupTimestamp
{
  return self->_secureBackupTimestamp;
}

- (NSData)escrowedSpki
{
  return self->_escrowedSpki;
}

- (void)setEscrowedSpki:(id)a3
{
}

- (NSData)peerInfo
{
  return self->_peerInfo;
}

- (void)setPeerInfo:(id)a3
{
}

- (NSString)bottleValidity
{
  return self->_bottleValidity;
}

- (void)setBottleValidity:(id)a3
{
}

- (NSString)serial
{
  return self->_serial;
}

- (void)setSerial:(id)a3
{
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
}

- (OTEscrowRecordMetadataPasscodeGeneration)passcodeGeneration
{
  return self->_passcodeGeneration;
}

- (void)setPasscodeGeneration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end