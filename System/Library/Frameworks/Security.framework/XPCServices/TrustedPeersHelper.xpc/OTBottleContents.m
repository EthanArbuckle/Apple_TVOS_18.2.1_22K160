@interface OTBottleContents
- (BOOL)hasPeerEncryptionPrivKey;
- (BOOL)hasPeerSigningPrivKey;
- (BOOL)hasReserved1;
- (BOOL)hasReserved2;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)reserved1;
- (NSData)reserved2;
- (OTPrivateKey)peerEncryptionPrivKey;
- (OTPrivateKey)peerSigningPrivKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPeerEncryptionPrivKey:(id)a3;
- (void)setPeerSigningPrivKey:(id)a3;
- (void)setReserved1:(id)a3;
- (void)setReserved2:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTBottleContents

- (BOOL)hasReserved1
{
  return self->_reserved1 != 0LL;
}

- (BOOL)hasReserved2
{
  return self->_reserved2 != 0LL;
}

- (BOOL)hasPeerSigningPrivKey
{
  return self->_peerSigningPrivKey != 0LL;
}

- (BOOL)hasPeerEncryptionPrivKey
{
  return self->_peerEncryptionPrivKey != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OTBottleContents;
  id v3 = -[OTBottleContents description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTBottleContents dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  reserved1 = self->_reserved1;
  if (reserved1) {
    [v3 setObject:reserved1 forKey:@"reserved1"];
  }
  reserved2 = self->_reserved2;
  if (reserved2) {
    [v4 setObject:reserved2 forKey:@"reserved2"];
  }
  peerSigningPrivKey = self->_peerSigningPrivKey;
  if (peerSigningPrivKey)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrivateKey dictionaryRepresentation](peerSigningPrivKey, "dictionaryRepresentation"));
    [v4 setObject:v8 forKey:@"peerSigningPrivKey"];
  }

  peerEncryptionPrivKey = self->_peerEncryptionPrivKey;
  if (peerEncryptionPrivKey)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrivateKey dictionaryRepresentation](peerEncryptionPrivKey, "dictionaryRepresentation"));
    [v4 setObject:v10 forKey:@"peerEncryptionPrivKey"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                            + OBJC_IVAR___PBDataReader__length))
    return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  while (2)
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
    switch((v7 >> 3))
    {
      case 1u:
        uint64_t Data = PBReaderReadData(a3);
        uint64_t v14 = objc_claimAutoreleasedReturnValue(Data);
        uint64_t v15 = 24LL;
        goto LABEL_22;
      case 2u:
        uint64_t v16 = PBReaderReadData(a3);
        uint64_t v14 = objc_claimAutoreleasedReturnValue(v16);
        uint64_t v15 = 32LL;
LABEL_22:
        v17 = *(OTPrivateKey **)&self->PBCodable_opaque[v15];
        *(void *)&self->PBCodable_opaque[v15] = v14;
        goto LABEL_28;
      case 3u:
        v17 = objc_alloc_init(&OBJC_CLASS___OTPrivateKey);
        uint64_t v18 = 16LL;
        goto LABEL_25;
      case 4u:
        v17 = objc_alloc_init(&OBJC_CLASS___OTPrivateKey);
        uint64_t v18 = 8LL;
LABEL_25:
        objc_storeStrong((id *)&self->PBCodable_opaque[v18], v17);
        v20[0] = 0xAAAAAAAAAAAAAAAALL;
        v20[1] = 0xAAAAAAAAAAAAAAAALL;
        if (PBReaderPlaceMark(a3, v20) && (sub_1001CD850((uint64_t)v17, (uint64_t)a3) & 1) != 0)
        {
          PBReaderRecallMark(a3, v20);
LABEL_28:

LABEL_29:
          if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                    + OBJC_IVAR___PBDataReader__length))
            return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
          continue;
        }

        return 0;
      default:
        if ((PBReaderSkipValueWithTag(a3) & 1) == 0) {
          return 0;
        }
        goto LABEL_29;
    }
  }

- (void)writeTo:(id)a3
{
  id v4 = a3;
  reserved1 = self->_reserved1;
  id v9 = v4;
  if (reserved1)
  {
    PBDataWriterWriteDataField(v4, reserved1, 1LL);
    id v4 = v9;
  }

  reserved2 = self->_reserved2;
  if (reserved2)
  {
    PBDataWriterWriteDataField(v9, reserved2, 2LL);
    id v4 = v9;
  }

  peerSigningPrivKey = self->_peerSigningPrivKey;
  if (peerSigningPrivKey)
  {
    PBDataWriterWriteSubmessage(v9, peerSigningPrivKey, 3LL);
    id v4 = v9;
  }

  peerEncryptionPrivKey = self->_peerEncryptionPrivKey;
  if (peerEncryptionPrivKey)
  {
    PBDataWriterWriteSubmessage(v9, peerEncryptionPrivKey, 4LL);
    id v4 = v9;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_reserved1)
  {
    objc_msgSend(v4, "setReserved1:");
    id v4 = v5;
  }

  if (self->_reserved2)
  {
    objc_msgSend(v5, "setReserved2:");
    id v4 = v5;
  }

  if (self->_peerSigningPrivKey)
  {
    objc_msgSend(v5, "setPeerSigningPrivKey:");
    id v4 = v5;
  }

  if (self->_peerEncryptionPrivKey)
  {
    objc_msgSend(v5, "setPeerEncryptionPrivKey:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  id v6 = -[NSData copyWithZone:](self->_reserved1, "copyWithZone:", a3);
  unint64_t v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = -[NSData copyWithZone:](self->_reserved2, "copyWithZone:", a3);
  id v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = -[OTPrivateKey copyWithZone:](self->_peerSigningPrivKey, "copyWithZone:", a3);
  int v11 = (void *)v5[2];
  v5[2] = v10;

  id v12 = -[OTPrivateKey copyWithZone:](self->_peerEncryptionPrivKey, "copyWithZone:", a3);
  v13 = (void *)v5[1];
  v5[1] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class(self)]
    && ((reserved1 = self->_reserved1, !((unint64_t)reserved1 | v4[3]))
     || -[NSData isEqual:](reserved1, "isEqual:"))
    && ((reserved2 = self->_reserved2, !((unint64_t)reserved2 | v4[4]))
     || -[NSData isEqual:](reserved2, "isEqual:"))
    && ((peerSigningPrivKey = self->_peerSigningPrivKey, !((unint64_t)peerSigningPrivKey | v4[2]))
     || -[OTPrivateKey isEqual:](peerSigningPrivKey, "isEqual:")))
  {
    peerEncryptionPrivKey = self->_peerEncryptionPrivKey;
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
  unint64_t v3 = (unint64_t)-[NSData hash](self->_reserved1, "hash");
  unint64_t v4 = (unint64_t)-[NSData hash](self->_reserved2, "hash") ^ v3;
  unint64_t v5 = -[OTPrivateKey hash](self->_peerSigningPrivKey, "hash");
  return v4 ^ v5 ^ -[OTPrivateKey hash](self->_peerEncryptionPrivKey, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  unsigned __int8 v9 = v4;
  if (v4[3])
  {
    -[OTBottleContents setReserved1:](self, "setReserved1:");
    unint64_t v4 = v9;
  }

  if (v4[4])
  {
    -[OTBottleContents setReserved2:](self, "setReserved2:");
    unint64_t v4 = v9;
  }

  peerSigningPrivKey = self->_peerSigningPrivKey;
  uint64_t v6 = v4[2];
  if (peerSigningPrivKey)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[OTPrivateKey mergeFrom:](peerSigningPrivKey, "mergeFrom:");
  }

  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[OTBottleContents setPeerSigningPrivKey:](self, "setPeerSigningPrivKey:");
  }

  unint64_t v4 = v9;
LABEL_11:
  peerEncryptionPrivKey = self->_peerEncryptionPrivKey;
  uint64_t v8 = v4[1];
  if (peerEncryptionPrivKey)
  {
    if (v8)
    {
      -[OTPrivateKey mergeFrom:](peerEncryptionPrivKey, "mergeFrom:");
LABEL_16:
      unint64_t v4 = v9;
    }
  }

  else if (v8)
  {
    -[OTBottleContents setPeerEncryptionPrivKey:](self, "setPeerEncryptionPrivKey:");
    goto LABEL_16;
  }
}

- (NSData)reserved1
{
  return self->_reserved1;
}

- (void)setReserved1:(id)a3
{
}

- (NSData)reserved2
{
  return self->_reserved2;
}

- (void)setReserved2:(id)a3
{
}

- (OTPrivateKey)peerSigningPrivKey
{
  return self->_peerSigningPrivKey;
}

- (void)setPeerSigningPrivKey:(id)a3
{
}

- (OTPrivateKey)peerEncryptionPrivKey
{
  return self->_peerEncryptionPrivKey;
}

- (void)setPeerEncryptionPrivKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end