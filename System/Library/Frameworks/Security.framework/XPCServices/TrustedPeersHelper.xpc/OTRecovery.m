@interface OTRecovery
- (BOOL)hasEncryptionSPKI;
- (BOOL)hasPeerID;
- (BOOL)hasSigningSPKI;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)encryptionSPKI;
- (NSData)signingSPKI;
- (NSString)peerID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEncryptionSPKI:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setSigningSPKI:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTRecovery

- (BOOL)hasPeerID
{
  return self->_peerID != 0LL;
}

- (BOOL)hasSigningSPKI
{
  return self->_signingSPKI != 0LL;
}

- (BOOL)hasEncryptionSPKI
{
  return self->_encryptionSPKI != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OTRecovery;
  id v3 = -[OTRecovery description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTRecovery dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  peerID = self->_peerID;
  if (peerID) {
    [v3 setObject:peerID forKey:@"peerID"];
  }
  signingSPKI = self->_signingSPKI;
  if (signingSPKI) {
    [v4 setObject:signingSPKI forKey:@"signingSPKI"];
  }
  encryptionSPKI = self->_encryptionSPKI;
  if (encryptionSPKI) {
    [v4 setObject:encryptionSPKI forKey:@"encryptionSPKI"];
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
        uint64_t String = PBReaderReadString(a3);
        uint64_t v15 = objc_claimAutoreleasedReturnValue(String);
        uint64_t v16 = 16LL;
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

    uint64_t v17 = PBReaderReadData(a3);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v17);
    uint64_t v16 = 8LL;
    goto LABEL_23;
  }

  return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  peerID = self->_peerID;
  id v8 = v4;
  if (peerID)
  {
    PBDataWriterWriteStringField(v4, peerID, 1LL);
    id v4 = v8;
  }

  signingSPKI = self->_signingSPKI;
  if (signingSPKI)
  {
    PBDataWriterWriteDataField(v8, signingSPKI, 2LL);
    id v4 = v8;
  }

  encryptionSPKI = self->_encryptionSPKI;
  if (encryptionSPKI)
  {
    PBDataWriterWriteDataField(v8, encryptionSPKI, 3LL);
    id v4 = v8;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_peerID)
  {
    objc_msgSend(v4, "setPeerID:");
    id v4 = v5;
  }

  if (self->_signingSPKI)
  {
    objc_msgSend(v5, "setSigningSPKI:");
    id v4 = v5;
  }

  if (self->_encryptionSPKI)
  {
    objc_msgSend(v5, "setEncryptionSPKI:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_peerID, "copyWithZone:", a3);
  unint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = -[NSData copyWithZone:](self->_signingSPKI, "copyWithZone:", a3);
  char v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = -[NSData copyWithZone:](self->_encryptionSPKI, "copyWithZone:", a3);
  int v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class(self)]
    && ((peerID = self->_peerID, !((unint64_t)peerID | v4[2]))
     || -[NSString isEqual:](peerID, "isEqual:"))
    && ((signingSPKI = self->_signingSPKI, !((unint64_t)signingSPKI | v4[3]))
     || -[NSData isEqual:](signingSPKI, "isEqual:")))
  {
    encryptionSPKI = self->_encryptionSPKI;
    else {
      unsigned __int8 v8 = 1;
    }
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_peerID, "hash");
  unint64_t v4 = (unint64_t)-[NSData hash](self->_signingSPKI, "hash") ^ v3;
  return v4 ^ (unint64_t)-[NSData hash](self->_encryptionSPKI, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if (v4[2]) {
    -[OTRecovery setPeerID:](self, "setPeerID:");
  }
  if (v4[3]) {
    -[OTRecovery setSigningSPKI:](self, "setSigningSPKI:");
  }
  if (v4[1]) {
    -[OTRecovery setEncryptionSPKI:](self, "setEncryptionSPKI:");
  }
}

- (NSString)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
}

- (NSData)signingSPKI
{
  return self->_signingSPKI;
}

- (void)setSigningSPKI:(id)a3
{
}

- (NSData)encryptionSPKI
{
  return self->_encryptionSPKI;
}

- (void)setEncryptionSPKI:(id)a3
{
}

- (void).cxx_destruct
{
}

@end