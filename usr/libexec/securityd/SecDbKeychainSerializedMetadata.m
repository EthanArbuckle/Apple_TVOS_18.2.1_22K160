@interface SecDbKeychainSerializedMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)ciphertext;
- (NSData)wrappedKey;
- (NSString)tamperCheck;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCiphertext:(id)a3;
- (void)setTamperCheck:(id)a3;
- (void)setWrappedKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SecDbKeychainSerializedMetadata

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SecDbKeychainSerializedMetadata;
  id v3 = -[SecDbKeychainSerializedMetadata description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedMetadata dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  ciphertext = self->_ciphertext;
  if (ciphertext) {
    [v3 setObject:ciphertext forKey:@"ciphertext"];
  }
  wrappedKey = self->_wrappedKey;
  if (wrappedKey) {
    [v4 setObject:wrappedKey forKey:@"wrappedKey"];
  }
  tamperCheck = self->_tamperCheck;
  if (tamperCheck) {
    [v4 setObject:tamperCheck forKey:@"tamperCheck"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
        return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
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
        if (v6++ >= 9)
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
        return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      unint64_t v13 = v7 >> 3;
      if ((_DWORD)v13 == 2)
      {
        uint64_t Data = PBReaderReadData(a3);
        uint64_t v15 = objc_claimAutoreleasedReturnValue(Data);
        uint64_t v16 = 24LL;
        goto LABEL_23;
      }

      if ((_DWORD)v13 == 1)
      {
        uint64_t v14 = PBReaderReadData(a3);
        uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
        uint64_t v16 = 8LL;
LABEL_23:
        v19 = *(void **)&self->PBCodable_opaque[v16];
        *(void *)&self->PBCodable_opaque[v16] = v15;

        goto LABEL_25;
      }

      if ((PBReaderSkipValueWithTag(a3) & 1) == 0) {
        return 0;
      }
LABEL_25:
      if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length))
        return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }

    uint64_t String = PBReaderReadString(a3);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(String);
    uint64_t v16 = 16LL;
    goto LABEL_23;
  }

  return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
}

- (void)writeTo:(id)a3
{
  ciphertext = self->_ciphertext;
  id v5 = a3;
  PBDataWriterWriteDataField(v5, ciphertext, 1LL);
  PBDataWriterWriteDataField(v5, self->_wrappedKey, 2LL);
  PBDataWriterWriteStringField(v5, self->_tamperCheck, 3LL);
}

- (void)copyTo:(id)a3
{
  ciphertext = self->_ciphertext;
  id v5 = a3;
  [v5 setCiphertext:ciphertext];
  [v5 setWrappedKey:self->_wrappedKey];
  [v5 setTamperCheck:self->_tamperCheck];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSData copyWithZone:](self->_ciphertext, "copyWithZone:", a3);
  unint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = -[NSData copyWithZone:](self->_wrappedKey, "copyWithZone:", a3);
  char v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = -[NSString copyWithZone:](self->_tamperCheck, "copyWithZone:", a3);
  int v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && ((ciphertext = self->_ciphertext, !((unint64_t)ciphertext | v4[1]))
     || -[NSData isEqual:](ciphertext, "isEqual:"))
    && ((wrappedKey = self->_wrappedKey, !((unint64_t)wrappedKey | v4[3]))
     || -[NSData isEqual:](wrappedKey, "isEqual:")))
  {
    tamperCheck = self->_tamperCheck;
    else {
      unsigned __int8 v9 = 1;
    }
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)-[NSData hash](self->_ciphertext, "hash");
  unint64_t v4 = (unint64_t)-[NSData hash](self->_wrappedKey, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_tamperCheck, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if (v4[1]) {
    -[SecDbKeychainSerializedMetadata setCiphertext:](self, "setCiphertext:");
  }
  if (v4[3]) {
    -[SecDbKeychainSerializedMetadata setWrappedKey:](self, "setWrappedKey:");
  }
  if (v4[2]) {
    -[SecDbKeychainSerializedMetadata setTamperCheck:](self, "setTamperCheck:");
  }
}

- (NSData)ciphertext
{
  return self->_ciphertext;
}

- (void)setCiphertext:(id)a3
{
}

- (NSData)wrappedKey
{
  return self->_wrappedKey;
}

- (void)setWrappedKey:(id)a3
{
}

- (NSString)tamperCheck
{
  return self->_tamperCheck;
}

- (void)setTamperCheck:(id)a3
{
}

- (void).cxx_destruct
{
}

@end