@interface OTEscrowRecordMetadataClientMetadata
- (BOOL)hasDeviceColor;
- (BOOL)hasDeviceEnclosureColor;
- (BOOL)hasDeviceMid;
- (BOOL)hasDeviceModel;
- (BOOL)hasDeviceModelClass;
- (BOOL)hasDeviceModelVersion;
- (BOOL)hasDeviceName;
- (BOOL)hasDevicePlatform;
- (BOOL)hasSecureBackupMetadataTimestamp;
- (BOOL)hasSecureBackupNumericPassphraseLength;
- (BOOL)hasSecureBackupUsesComplexPassphrase;
- (BOOL)hasSecureBackupUsesNumericPassphrase;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)deviceColor;
- (NSString)deviceEnclosureColor;
- (NSString)deviceMid;
- (NSString)deviceModel;
- (NSString)deviceModelClass;
- (NSString)deviceModelVersion;
- (NSString)deviceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)devicePlatform;
- (unint64_t)hash;
- (unint64_t)secureBackupMetadataTimestamp;
- (unint64_t)secureBackupNumericPassphraseLength;
- (unint64_t)secureBackupUsesComplexPassphrase;
- (unint64_t)secureBackupUsesNumericPassphrase;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeviceColor:(id)a3;
- (void)setDeviceEnclosureColor:(id)a3;
- (void)setDeviceMid:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDeviceModelClass:(id)a3;
- (void)setDeviceModelVersion:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDevicePlatform:(unint64_t)a3;
- (void)setHasDevicePlatform:(BOOL)a3;
- (void)setHasSecureBackupMetadataTimestamp:(BOOL)a3;
- (void)setHasSecureBackupNumericPassphraseLength:(BOOL)a3;
- (void)setHasSecureBackupUsesComplexPassphrase:(BOOL)a3;
- (void)setHasSecureBackupUsesNumericPassphrase:(BOOL)a3;
- (void)setSecureBackupMetadataTimestamp:(unint64_t)a3;
- (void)setSecureBackupNumericPassphraseLength:(unint64_t)a3;
- (void)setSecureBackupUsesComplexPassphrase:(unint64_t)a3;
- (void)setSecureBackupUsesNumericPassphrase:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTEscrowRecordMetadataClientMetadata

- (void)setSecureBackupMetadataTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_secureBackupMetadataTimestamp = a3;
}

- (void)setHasSecureBackupMetadataTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSecureBackupMetadataTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSecureBackupNumericPassphraseLength:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_secureBackupNumericPassphraseLength = a3;
}

- (void)setHasSecureBackupNumericPassphraseLength:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSecureBackupNumericPassphraseLength
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSecureBackupUsesComplexPassphrase:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_secureBackupUsesComplexPassphrase = a3;
}

- (void)setHasSecureBackupUsesComplexPassphrase:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSecureBackupUsesComplexPassphrase
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSecureBackupUsesNumericPassphrase:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_secureBackupUsesNumericPassphrase = a3;
}

- (void)setHasSecureBackupUsesNumericPassphrase:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSecureBackupUsesNumericPassphrase
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasDeviceColor
{
  return self->_deviceColor != 0LL;
}

- (BOOL)hasDeviceEnclosureColor
{
  return self->_deviceEnclosureColor != 0LL;
}

- (BOOL)hasDeviceMid
{
  return self->_deviceMid != 0LL;
}

- (BOOL)hasDeviceModel
{
  return self->_deviceModel != 0LL;
}

- (BOOL)hasDeviceModelClass
{
  return self->_deviceModelClass != 0LL;
}

- (BOOL)hasDeviceModelVersion
{
  return self->_deviceModelVersion != 0LL;
}

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0LL;
}

- (void)setDevicePlatform:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_devicePlatform = a3;
}

- (void)setHasDevicePlatform:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDevicePlatform
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OTEscrowRecordMetadataClientMetadata;
  id v3 = -[OTEscrowRecordMetadataClientMetadata description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTEscrowRecordMetadataClientMetadata dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_secureBackupMetadataTimestamp));
    [v3 setObject:v15 forKey:@"secure_backup_metadata_timestamp"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_secureBackupNumericPassphraseLength));
  [v3 setObject:v16 forKey:@"secure_backup_numeric_passphrase_length"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

- (BOOL)readFrom:(id)a3
{
  return sub_1001D0D7C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field(v12, self->_secureBackupMetadataTimestamp, 1LL);
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteUint64Field(v12, self->_secureBackupNumericPassphraseLength, 2LL);
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_secureBackupMetadataTimestamp;
    *((_BYTE *)v4 + 104) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }

  v4[3] = self->_secureBackupNumericPassphraseLength;
  *((_BYTE *)v4 + 104) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[2] = self->_secureBackupMetadataTimestamp;
    *((_BYTE *)v5 + 104) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }

  v5[3] = self->_secureBackupNumericPassphraseLength;
  *((_BYTE *)v5 + 104) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 2) == 0 || self->_secureBackupMetadataTimestamp != *((void *)v4 + 2)) {
      goto LABEL_40;
    }
  }

  else if ((*((_BYTE *)v4 + 104) & 2) != 0)
  {
LABEL_40:
    BOOL v12 = 0;
    goto LABEL_41;
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 4) == 0 || self->_secureBackupNumericPassphraseLength != *((void *)v4 + 3)) {
      goto LABEL_40;
    }
  }

  else if ((*((_BYTE *)v4 + 104) & 4) != 0)
  {
    goto LABEL_40;
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 8) == 0 || self->_secureBackupUsesComplexPassphrase != *((void *)v4 + 4)) {
      goto LABEL_40;
    }
  }

  else if ((*((_BYTE *)v4 + 104) & 8) != 0)
  {
    goto LABEL_40;
  }

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 0x10) == 0 || self->_secureBackupUsesNumericPassphrase != *((void *)v4 + 5)) {
      goto LABEL_40;
    }
  }

  else if ((*((_BYTE *)v4 + 104) & 0x10) != 0)
  {
    goto LABEL_40;
  }

  deviceColor = self->_deviceColor;
  if ((unint64_t)deviceColor | *((void *)v4 + 6)
    && !-[NSString isEqual:](deviceColor, "isEqual:"))
  {
    goto LABEL_40;
  }

  deviceEnclosureColor = self->_deviceEnclosureColor;
  if ((unint64_t)deviceEnclosureColor | *((void *)v4 + 7))
  {
  }

  deviceMid = self->_deviceMid;
  if ((unint64_t)deviceMid | *((void *)v4 + 8))
  {
  }

  deviceModel = self->_deviceModel;
  if ((unint64_t)deviceModel | *((void *)v4 + 9))
  {
  }

  deviceModelClass = self->_deviceModelClass;
  if ((unint64_t)deviceModelClass | *((void *)v4 + 10))
  {
  }

  deviceModelVersion = self->_deviceModelVersion;
  if ((unint64_t)deviceModelVersion | *((void *)v4 + 11))
  {
  }

  deviceName = self->_deviceName;
  if ((unint64_t)deviceName | *((void *)v4 + 12))
  {
  }

  BOOL v12 = (*((_BYTE *)v4 + 104) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 1) == 0 || self->_devicePlatform != *((void *)v4 + 1)) {
      goto LABEL_40;
    }
    BOOL v12 = 1;
  }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    unint64_t v16 = 2654435761u * self->_secureBackupMetadataTimestamp;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      unint64_t v14 = 2654435761u * self->_secureBackupNumericPassphraseLength;
      if ((*(_BYTE *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      unint64_t v3 = 0LL;
      if ((*(_BYTE *)&self->_has & 0x10) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }

  else
  {
    unint64_t v16 = 0LL;
    if ((*(_BYTE *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }

  unint64_t v14 = 0LL;
  if ((*(_BYTE *)&self->_has & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  unint64_t v3 = 2654435761u * self->_secureBackupUsesComplexPassphrase;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    unint64_t v4 = 2654435761u * self->_secureBackupUsesNumericPassphrase;
    goto LABEL_10;
  }

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((_BYTE *)v4 + 104);
  if ((v5 & 2) != 0)
  {
    self->_secureBackupMetadataTimestamp = *((void *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    char v5 = *((_BYTE *)v4 + 104);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }

  else if ((*((_BYTE *)v4 + 104) & 4) == 0)
  {
    goto LABEL_3;
  }

  self->_secureBackupNumericPassphraseLength = *((void *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  char v5 = *((_BYTE *)v4 + 104);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

- (unint64_t)secureBackupMetadataTimestamp
{
  return self->_secureBackupMetadataTimestamp;
}

- (unint64_t)secureBackupNumericPassphraseLength
{
  return self->_secureBackupNumericPassphraseLength;
}

- (unint64_t)secureBackupUsesComplexPassphrase
{
  return self->_secureBackupUsesComplexPassphrase;
}

- (unint64_t)secureBackupUsesNumericPassphrase
{
  return self->_secureBackupUsesNumericPassphrase;
}

- (NSString)deviceColor
{
  return self->_deviceColor;
}

- (void)setDeviceColor:(id)a3
{
}

- (NSString)deviceEnclosureColor
{
  return self->_deviceEnclosureColor;
}

- (void)setDeviceEnclosureColor:(id)a3
{
}

- (NSString)deviceMid
{
  return self->_deviceMid;
}

- (void)setDeviceMid:(id)a3
{
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
}

- (NSString)deviceModelClass
{
  return self->_deviceModelClass;
}

- (void)setDeviceModelClass:(id)a3
{
}

- (NSString)deviceModelVersion
{
  return self->_deviceModelVersion;
}

- (void)setDeviceModelVersion:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (unint64_t)devicePlatform
{
  return self->_devicePlatform;
}

- (void).cxx_destruct
{
}

@end