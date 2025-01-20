@interface SecDbKeychainSerializedItemV7
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)encryptedMetadata;
- (NSData)encryptedSecretData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)keyclassAsString:(int)a3;
- (int)StringAsKeyclass:(id)a3;
- (int)keyclass;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEncryptedMetadata:(id)a3;
- (void)setEncryptedSecretData:(id)a3;
- (void)setKeyclass:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SecDbKeychainSerializedItemV7

- (id)keyclassAsString:(int)a3
{
  if ((a3 - 6) >= 7) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return off_100290D90[a3 - 6];
  }
}

- (int)StringAsKeyclass:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"KEYCLASS_AK"])
  {
    int v4 = 6;
  }

  else if ([v3 isEqualToString:@"KEYCLASS_CK"])
  {
    int v4 = 7;
  }

  else if ([v3 isEqualToString:@"KEYCLASS_DK"])
  {
    int v4 = 8;
  }

  else if ([v3 isEqualToString:@"KEYCLASS_AKU"])
  {
    int v4 = 9;
  }

  else if ([v3 isEqualToString:@"KEYCLASS_CKU"])
  {
    int v4 = 10;
  }

  else if ([v3 isEqualToString:@"KEYCLASS_DKU"])
  {
    int v4 = 11;
  }

  else if ([v3 isEqualToString:@"KEYCLASS_AKPU"])
  {
    int v4 = 12;
  }

  else
  {
    int v4 = 6;
  }

  return v4;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SecDbKeychainSerializedItemV7;
  id v3 = -[SecDbKeychainSerializedItemV7 description](&v8, "description");
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedItemV7 dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  int v4 = v3;
  encryptedSecretData = self->_encryptedSecretData;
  if (encryptedSecretData) {
    [v3 setObject:encryptedSecretData forKey:@"encryptedSecretData"];
  }
  encryptedMetadata = self->_encryptedMetadata;
  if (encryptedMetadata) {
    [v4 setObject:encryptedMetadata forKey:@"encryptedMetadata"];
  }
  unsigned int v7 = self->_keyclass - 6;
  if (v7 >= 7) {
    objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_keyclass));
  }
  else {
    objc_super v8 = off_100290D90[v7];
  }
  [v4 setObject:v8 forKey:@"keyclass"];

  return v4;
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
    unint64_t v13 = v7 >> 3;
    if ((v7 >> 3) == 1)
    {
      uint64_t Data = PBReaderReadData(a3);
      uint64_t v20 = objc_claimAutoreleasedReturnValue(Data);
      uint64_t v21 = 16LL;
    }

    else
    {
      if ((_DWORD)v13 != 2)
      {
        if ((_DWORD)v13 == 3)
        {
          char v14 = 0;
          unsigned int v15 = 0;
          uint64_t v16 = 0LL;
          while (1)
          {
            unint64_t v17 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            char v18 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v17);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v17 + 1;
            v16 |= (unint64_t)(v18 & 0x7F) << v14;
            if ((v18 & 0x80) == 0) {
              goto LABEL_33;
            }
            v14 += 7;
            BOOL v10 = v15++ >= 9;
            if (v10)
            {
              LODWORD(v16) = 0;
              goto LABEL_35;
            }
          }

          *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_33:
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v16) = 0;
          }
LABEL_35:
          self->_keyclass = v16;
        }

        else
        {
          int v24 = PBReaderSkipValueWithTag(a3);
          if (!v24) {
            return v24;
          }
        }

        continue;
      }

      uint64_t v22 = PBReaderReadData(a3);
      uint64_t v20 = objc_claimAutoreleasedReturnValue(v22);
      uint64_t v21 = 8LL;
    }

    v23 = *(void **)&self->PBCodable_opaque[v21];
    *(void *)&self->PBCodable_opaque[v21] = v20;
  }

  LOBYTE(v24) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v24;
}

- (void)writeTo:(id)a3
{
  encryptedSecretuint64_t Data = self->_encryptedSecretData;
  id v5 = a3;
  PBDataWriterWriteDataField(v5, encryptedSecretData, 1LL);
  PBDataWriterWriteDataField(v5, self->_encryptedMetadata, 2LL);
  PBDataWriterWriteInt32Field(v5, self->_keyclass, 3LL);
}

- (void)copyTo:(id)a3
{
  encryptedSecretuint64_t Data = self->_encryptedSecretData;
  id v5 = a3;
  [v5 setEncryptedSecretData:encryptedSecretData];
  [v5 setEncryptedMetadata:self->_encryptedMetadata];
  v5[6] = self->_keyclass;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  id v6 = -[NSData copyWithZone:](self->_encryptedSecretData, "copyWithZone:", a3);
  unint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = -[NSData copyWithZone:](self->_encryptedMetadata, "copyWithZone:", a3);
  char v9 = (void *)v5[1];
  v5[1] = v8;

  *((_DWORD *)v5 + 6) = self->_keyclass;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v7 = [v4 isMemberOfClass:objc_opt_class(self)]
    && ((encryptedSecretuint64_t Data = self->_encryptedSecretData, !((unint64_t)encryptedSecretData | *((void *)v4 + 2)))
     || -[NSData isEqual:](encryptedSecretData, "isEqual:"))
    && ((encryptedMetadata = self->_encryptedMetadata, !((unint64_t)encryptedMetadata | *((void *)v4 + 1)))

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)-[NSData hash](self->_encryptedSecretData, "hash");
  return (unint64_t)-[NSData hash](self->_encryptedMetadata, "hash") ^ v3 ^ (2654435761LL * self->_keyclass);
}

- (void)mergeFrom:(id)a3
{
  id v4 = (int *)a3;
  id v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[SecDbKeychainSerializedItemV7 setEncryptedSecretData:](self, "setEncryptedSecretData:");
    id v4 = v5;
  }

  if (*((void *)v4 + 1))
  {
    -[SecDbKeychainSerializedItemV7 setEncryptedMetadata:](self, "setEncryptedMetadata:");
    id v4 = v5;
  }

  self->_keyclass = v4[6];
}

- (NSData)encryptedSecretData
{
  return self->_encryptedSecretData;
}

- (void)setEncryptedSecretData:(id)a3
{
}

- (NSData)encryptedMetadata
{
  return self->_encryptedMetadata;
}

- (void)setEncryptedMetadata:(id)a3
{
}

- (int)keyclass
{
  return self->_keyclass;
}

- (void)setKeyclass:(int)a3
{
  self->_keyclass = a3;
}

- (void).cxx_destruct
{
}

@end