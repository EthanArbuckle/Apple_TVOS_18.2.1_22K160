@interface SecDbKeychainSerializedAKSWrappedKey
- (BOOL)hasRefKeyBlob;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)refKeyBlob;
- (NSData)wrappedKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)type;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setRefKeyBlob:(id)a3;
- (void)setType:(unsigned int)a3;
- (void)setWrappedKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SecDbKeychainSerializedAKSWrappedKey

- (BOOL)hasRefKeyBlob
{
  return self->_refKeyBlob != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SecDbKeychainSerializedAKSWrappedKey;
  id v3 = -[SecDbKeychainSerializedAKSWrappedKey description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedAKSWrappedKey dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  wrappedKey = self->_wrappedKey;
  if (wrappedKey) {
    [v3 setObject:wrappedKey forKey:@"wrappedKey"];
  }
  refKeyBlob = self->_refKeyBlob;
  if (refKeyBlob) {
    [v4 setObject:refKeyBlob forKey:@"refKeyBlob"];
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_type));
  [v4 setObject:v7 forKey:@"type"];

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
      uint64_t v21 = 24LL;
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
          self->_type = v16;
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
  id v5 = a3;
  PBDataWriterWriteDataField(v5, self->_wrappedKey, 1LL);
  refKeyBlob = self->_refKeyBlob;
  if (refKeyBlob) {
    PBDataWriterWriteDataField(v5, refKeyBlob, 2LL);
  }
  PBDataWriterWriteUint32Field(v5, self->_type, 3LL);
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  [v4 setWrappedKey:self->_wrappedKey];
  if (self->_refKeyBlob) {
    objc_msgSend(v4, "setRefKeyBlob:");
  }
  v4[4] = self->_type;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  id v6 = -[NSData copyWithZone:](self->_wrappedKey, "copyWithZone:", a3);
  unint64_t v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = -[NSData copyWithZone:](self->_refKeyBlob, "copyWithZone:", a3);
  char v9 = (void *)v5[1];
  v5[1] = v8;

  *((_DWORD *)v5 + 4) = self->_type;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v7 = [v4 isMemberOfClass:objc_opt_class(self)]
    && ((wrappedKey = self->_wrappedKey, !((unint64_t)wrappedKey | *((void *)v4 + 3)))
     || -[NSData isEqual:](wrappedKey, "isEqual:"))
    && ((refKeyBlob = self->_refKeyBlob, !((unint64_t)refKeyBlob | *((void *)v4 + 1)))

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)-[NSData hash](self->_wrappedKey, "hash");
  return (unint64_t)-[NSData hash](self->_refKeyBlob, "hash") ^ v3 ^ (2654435761LL * self->_type);
}

- (void)mergeFrom:(id)a3
{
  id v4 = (unsigned int *)a3;
  id v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[SecDbKeychainSerializedAKSWrappedKey setWrappedKey:](self, "setWrappedKey:");
    id v4 = v5;
  }

  if (*((void *)v4 + 1))
  {
    -[SecDbKeychainSerializedAKSWrappedKey setRefKeyBlob:](self, "setRefKeyBlob:");
    id v4 = v5;
  }

  self->_type = v4[4];
}

- (NSData)wrappedKey
{
  return self->_wrappedKey;
}

- (void)setWrappedKey:(id)a3
{
}

- (NSData)refKeyBlob
{
  return self->_refKeyBlob;
}

- (void)setRefKeyBlob:(id)a3
{
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
}

@end