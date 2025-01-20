@interface SecDbKeychainSerializedMetadataKey
- (BOOL)hasActualKeyclass;
- (BOOL)hasAkswrappedkey;
- (BOOL)hasBackupwrappedkey;
- (BOOL)hasBaguuid;
- (BOOL)hasKeyclass;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)akswrappedkey;
- (NSData)backupwrappedkey;
- (NSData)baguuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)actualKeyclass;
- (int)keyclass;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActualKeyclass:(int)a3;
- (void)setAkswrappedkey:(id)a3;
- (void)setBackupwrappedkey:(id)a3;
- (void)setBaguuid:(id)a3;
- (void)setHasActualKeyclass:(BOOL)a3;
- (void)setHasKeyclass:(BOOL)a3;
- (void)setKeyclass:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SecDbKeychainSerializedMetadataKey

- (void)setKeyclass:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_keyclass = a3;
}

- (void)setHasKeyclass:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasKeyclass
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setActualKeyclass:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_actualKeyclass = a3;
}

- (void)setHasActualKeyclass:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActualKeyclass
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasBaguuid
{
  return self->_baguuid != 0LL;
}

- (BOOL)hasAkswrappedkey
{
  return self->_akswrappedkey != 0LL;
}

- (BOOL)hasBackupwrappedkey
{
  return self->_backupwrappedkey != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SecDbKeychainSerializedMetadataKey;
  id v3 = -[SecDbKeychainSerializedMetadataKey description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedMetadataKey dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_keyclass));
    [v3 setObject:v5 forKey:@"keyclass"];

    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->_actualKeyclass));
    [v3 setObject:v6 forKey:@"actualKeyclass"];
  }

  baguuid = self->_baguuid;
  if (baguuid) {
    [v3 setObject:baguuid forKey:@"baguuid"];
  }
  akswrappedkey = self->_akswrappedkey;
  if (akswrappedkey) {
    [v3 setObject:akswrappedkey forKey:@"akswrappedkey"];
  }
  backupwrappedkey = self->_backupwrappedkey;
  if (backupwrappedkey) {
    [v3 setObject:backupwrappedkey forKey:@"backupwrappedkey"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  while (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                              + OBJC_IVAR___PBDataReader__length))
  {
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v5 = 0;
    unsigned int v6 = 0;
    unint64_t v7 = 0LL;
    while (1)
    {
      unint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      char v9 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
      v7 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v5 += 7;
      BOOL v10 = v6++ >= 9;
      if (v10)
      {
        unint64_t v7 = 0LL;
        int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }

    *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v7 = 0LL;
    }
LABEL_13:
    if (v11 || (v7 & 7) == 4) {
      break;
    }
    switch((v7 >> 3))
    {
      case 1u:
        char v13 = 0;
        unsigned int v14 = 0;
        uint64_t v15 = 0LL;
        *(_BYTE *)&self->_has |= 2u;
        while (1)
        {
          unint64_t v16 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          char v17 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v16);
          *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v16 + 1;
          v15 |= (unint64_t)(v17 & 0x7F) << v13;
          if ((v17 & 0x80) == 0) {
            goto LABEL_39;
          }
          v13 += 7;
          BOOL v10 = v14++ >= 9;
          if (v10)
          {
            LODWORD(v15) = 0;
            goto LABEL_41;
          }
        }

        *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_39:
        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v15) = 0;
        }
LABEL_41:
        uint64_t v29 = 40LL;
        goto LABEL_46;
      case 2u:
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v15 = 0LL;
        *(_BYTE *)&self->_has |= 1u;
        break;
      case 3u:
        uint64_t Data = PBReaderReadData(a3);
        uint64_t v24 = objc_claimAutoreleasedReturnValue(Data);
        uint64_t v25 = 32LL;
        goto LABEL_37;
      case 4u:
        uint64_t v26 = PBReaderReadData(a3);
        uint64_t v24 = objc_claimAutoreleasedReturnValue(v26);
        uint64_t v25 = 16LL;
        goto LABEL_37;
      case 5u:
        uint64_t v27 = PBReaderReadData(a3);
        uint64_t v24 = objc_claimAutoreleasedReturnValue(v27);
        uint64_t v25 = 24LL;
LABEL_37:
        v28 = *(void **)&self->PBCodable_opaque[v25];
        *(void *)&self->PBCodable_opaque[v25] = v24;

        continue;
      default:
        int v18 = PBReaderSkipValueWithTag(a3);
        if (!v18) {
          return v18;
        }
        continue;
    }

    while (1)
    {
      unint64_t v21 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      char v22 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v21);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v21 + 1;
      v15 |= (unint64_t)(v22 & 0x7F) << v19;
      if ((v22 & 0x80) == 0) {
        goto LABEL_43;
      }
      v19 += 7;
      BOOL v10 = v20++ >= 9;
      if (v10)
      {
        LODWORD(v15) = 0;
        goto LABEL_45;
      }
    }

    *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_43:
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v15) = 0;
    }
LABEL_45:
    uint64_t v29 = 8LL;
LABEL_46:
    *(_DWORD *)&self->PBCodable_opaque[v29] = v15;
  }

  LOBYTE(v18) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v18;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v9 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field(v4, self->_keyclass, 1LL);
    id v4 = v9;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(v9, self->_actualKeyclass, 2LL);
    id v4 = v9;
  }

  baguuid = self->_baguuid;
  if (baguuid)
  {
    PBDataWriterWriteDataField(v9, baguuid, 3LL);
    id v4 = v9;
  }

  akswrappedkey = self->_akswrappedkey;
  if (akswrappedkey)
  {
    PBDataWriterWriteDataField(v9, akswrappedkey, 4LL);
    id v4 = v9;
  }

  backupwrappedkey = self->_backupwrappedkey;
  if (backupwrappedkey)
  {
    PBDataWriterWriteDataField(v9, backupwrappedkey, 5LL);
    id v4 = v9;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[10] = self->_keyclass;
    *((_BYTE *)v4 + 44) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v4[2] = self->_actualKeyclass;
    *((_BYTE *)v4 + 44) |= 1u;
  }

  unsigned int v6 = v4;
  if (self->_baguuid)
  {
    objc_msgSend(v4, "setBaguuid:");
    id v4 = v6;
  }

  if (self->_akswrappedkey)
  {
    objc_msgSend(v6, "setAkswrappedkey:");
    id v4 = v6;
  }

  if (self->_backupwrappedkey)
  {
    objc_msgSend(v6, "setBackupwrappedkey:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  unsigned int v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 10) = self->_keyclass;
    *((_BYTE *)v5 + 44) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    *((_DWORD *)v5 + 2) = self->_actualKeyclass;
    *((_BYTE *)v5 + 44) |= 1u;
  }

  id v8 = -[NSData copyWithZone:](self->_baguuid, "copyWithZone:", a3);
  id v9 = (void *)v6[4];
  v6[4] = v8;

  id v10 = -[NSData copyWithZone:](self->_akswrappedkey, "copyWithZone:", a3);
  int v11 = (void *)v6[2];
  v6[2] = v10;

  id v12 = -[NSData copyWithZone:](self->_backupwrappedkey, "copyWithZone:", a3);
  char v13 = (void *)v6[3];
  v6[3] = v12;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_keyclass != *((_DWORD *)v4 + 10)) {
      goto LABEL_18;
    }
  }

  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
LABEL_18:
    unsigned __int8 v8 = 0;
    goto LABEL_19;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_actualKeyclass != *((_DWORD *)v4 + 2)) {
      goto LABEL_18;
    }
  }

  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_18;
  }

  baguuid = self->_baguuid;
  akswrappedkey = self->_akswrappedkey;
  if ((unint64_t)akswrappedkey | *((void *)v4 + 2))
  {
  }

  backupwrappedkey = self->_backupwrappedkey;
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761LL * self->_keyclass;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0LL;
    goto LABEL_6;
  }

  uint64_t v3 = 0LL;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761LL * self->_actualKeyclass;
LABEL_6:
  unint64_t v5 = v4 ^ v3 ^ (unint64_t)-[NSData hash](self->_baguuid, "hash");
  unint64_t v6 = (unint64_t)-[NSData hash](self->_akswrappedkey, "hash");
  return v5 ^ v6 ^ (unint64_t)-[NSData hash](self->_backupwrappedkey, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 2) != 0)
  {
    self->_keyclass = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 2u;
    char v5 = *((_BYTE *)v4 + 44);
  }

  if ((v5 & 1) != 0)
  {
    self->_actualKeyclass = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }

  id v6 = v4;
  if (*((void *)v4 + 4))
  {
    -[SecDbKeychainSerializedMetadataKey setBaguuid:](self, "setBaguuid:");
    id v4 = v6;
  }

  if (*((void *)v4 + 2))
  {
    -[SecDbKeychainSerializedMetadataKey setAkswrappedkey:](self, "setAkswrappedkey:");
    id v4 = v6;
  }

  if (*((void *)v4 + 3))
  {
    -[SecDbKeychainSerializedMetadataKey setBackupwrappedkey:](self, "setBackupwrappedkey:");
    id v4 = v6;
  }
}

- (int)keyclass
{
  return self->_keyclass;
}

- (int)actualKeyclass
{
  return self->_actualKeyclass;
}

- (NSData)baguuid
{
  return self->_baguuid;
}

- (void)setBaguuid:(id)a3
{
}

- (NSData)akswrappedkey
{
  return self->_akswrappedkey;
}

- (void)setAkswrappedkey:(id)a3
{
}

- (NSData)backupwrappedkey
{
  return self->_backupwrappedkey;
}

- (void)setBackupwrappedkey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end