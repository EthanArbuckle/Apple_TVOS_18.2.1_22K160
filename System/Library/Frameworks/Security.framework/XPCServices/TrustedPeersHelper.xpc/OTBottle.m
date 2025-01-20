@interface OTBottle
- (BOOL)hasBottleID;
- (BOOL)hasContents;
- (BOOL)hasEscrowedEncryptionSPKI;
- (BOOL)hasEscrowedSigningSPKI;
- (BOOL)hasPeerEncryptionSPKI;
- (BOOL)hasPeerID;
- (BOOL)hasPeerSigningSPKI;
- (BOOL)hasReserved3;
- (BOOL)hasReserved4;
- (BOOL)hasReserved5;
- (BOOL)hasReserved6;
- (BOOL)hasReserved7;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)escrowedEncryptionSPKI;
- (NSData)escrowedSigningSPKI;
- (NSData)peerEncryptionSPKI;
- (NSData)peerSigningSPKI;
- (NSData)reserved3;
- (NSData)reserved4;
- (NSData)reserved5;
- (NSData)reserved6;
- (NSData)reserved7;
- (NSString)bottleID;
- (NSString)peerID;
- (OTAuthenticatedCiphertext)contents;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBottleID:(id)a3;
- (void)setContents:(id)a3;
- (void)setEscrowedEncryptionSPKI:(id)a3;
- (void)setEscrowedSigningSPKI:(id)a3;
- (void)setPeerEncryptionSPKI:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setPeerSigningSPKI:(id)a3;
- (void)setReserved3:(id)a3;
- (void)setReserved4:(id)a3;
- (void)setReserved5:(id)a3;
- (void)setReserved6:(id)a3;
- (void)setReserved7:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTBottle

- (BOOL)hasPeerID
{
  return self->_peerID != 0LL;
}

- (BOOL)hasBottleID
{
  return self->_bottleID != 0LL;
}

- (BOOL)hasReserved3
{
  return self->_reserved3 != 0LL;
}

- (BOOL)hasReserved4
{
  return self->_reserved4 != 0LL;
}

- (BOOL)hasReserved5
{
  return self->_reserved5 != 0LL;
}

- (BOOL)hasReserved6
{
  return self->_reserved6 != 0LL;
}

- (BOOL)hasEscrowedSigningSPKI
{
  return self->_escrowedSigningSPKI != 0LL;
}

- (BOOL)hasEscrowedEncryptionSPKI
{
  return self->_escrowedEncryptionSPKI != 0LL;
}

- (BOOL)hasPeerSigningSPKI
{
  return self->_peerSigningSPKI != 0LL;
}

- (BOOL)hasPeerEncryptionSPKI
{
  return self->_peerEncryptionSPKI != 0LL;
}

- (BOOL)hasReserved7
{
  return self->_reserved7 != 0LL;
}

- (BOOL)hasContents
{
  return self->_contents != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OTBottle;
  id v3 = -[OTBottle description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTBottle dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  bottleID = self->_bottleID;
  if (bottleID) {
    [v4 setObject:bottleID forKey:@"bottleID"];
  }
  reserved3 = self->_reserved3;
  if (reserved3) {
    [v4 setObject:reserved3 forKey:@"reserved3"];
  }
  reserved4 = self->_reserved4;
  if (reserved4) {
    [v4 setObject:reserved4 forKey:@"reserved4"];
  }
  reserved5 = self->_reserved5;
  if (reserved5) {
    [v4 setObject:reserved5 forKey:@"reserved5"];
  }
  reserved6 = self->_reserved6;
  if (reserved6) {
    [v4 setObject:reserved6 forKey:@"reserved6"];
  }
  escrowedSigningSPKI = self->_escrowedSigningSPKI;
  if (escrowedSigningSPKI) {
    [v4 setObject:escrowedSigningSPKI forKey:@"escrowedSigningSPKI"];
  }
  escrowedEncryptionSPKI = self->_escrowedEncryptionSPKI;
  if (escrowedEncryptionSPKI) {
    [v4 setObject:escrowedEncryptionSPKI forKey:@"escrowedEncryptionSPKI"];
  }
  peerSigningSPKI = self->_peerSigningSPKI;
  if (peerSigningSPKI) {
    [v4 setObject:peerSigningSPKI forKey:@"peerSigningSPKI"];
  }
  peerEncryptionSPKI = self->_peerEncryptionSPKI;
  if (peerEncryptionSPKI) {
    [v4 setObject:peerEncryptionSPKI forKey:@"peerEncryptionSPKI"];
  }
  reserved7 = self->_reserved7;
  if (reserved7) {
    [v4 setObject:reserved7 forKey:@"reserved7"];
  }
  contents = self->_contents;
  if (contents)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTAuthenticatedCiphertext dictionaryRepresentation](contents, "dictionaryRepresentation"));
    [v4 setObject:v17 forKey:@"contents"];
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
        uint64_t String = PBReaderReadString(a3);
        uint64_t v14 = objc_claimAutoreleasedReturnValue(String);
        uint64_t v15 = 48LL;
        goto LABEL_31;
      case 2u:
        uint64_t v16 = PBReaderReadString(a3);
        uint64_t v14 = objc_claimAutoreleasedReturnValue(v16);
        uint64_t v15 = 8LL;
        goto LABEL_31;
      case 3u:
        uint64_t Data = PBReaderReadData(a3);
        uint64_t v14 = objc_claimAutoreleasedReturnValue(Data);
        uint64_t v15 = 64LL;
        goto LABEL_31;
      case 4u:
        uint64_t v18 = PBReaderReadData(a3);
        uint64_t v14 = objc_claimAutoreleasedReturnValue(v18);
        uint64_t v15 = 72LL;
        goto LABEL_31;
      case 5u:
        uint64_t v19 = PBReaderReadData(a3);
        uint64_t v14 = objc_claimAutoreleasedReturnValue(v19);
        uint64_t v15 = 80LL;
        goto LABEL_31;
      case 6u:
        uint64_t v20 = PBReaderReadData(a3);
        uint64_t v14 = objc_claimAutoreleasedReturnValue(v20);
        uint64_t v15 = 88LL;
        goto LABEL_31;
      case 7u:
        uint64_t v21 = PBReaderReadData(a3);
        uint64_t v14 = objc_claimAutoreleasedReturnValue(v21);
        uint64_t v15 = 96LL;
        goto LABEL_31;
      case 8u:
        uint64_t v22 = PBReaderReadData(a3);
        uint64_t v14 = objc_claimAutoreleasedReturnValue(v22);
        uint64_t v15 = 32LL;
        goto LABEL_31;
      case 9u:
        uint64_t v23 = PBReaderReadData(a3);
        uint64_t v14 = objc_claimAutoreleasedReturnValue(v23);
        uint64_t v15 = 24LL;
        goto LABEL_31;
      case 0xAu:
        uint64_t v24 = PBReaderReadData(a3);
        uint64_t v14 = objc_claimAutoreleasedReturnValue(v24);
        uint64_t v15 = 56LL;
        goto LABEL_31;
      case 0xBu:
        uint64_t v25 = PBReaderReadData(a3);
        uint64_t v14 = objc_claimAutoreleasedReturnValue(v25);
        uint64_t v15 = 40LL;
LABEL_31:
        v26 = *(OTAuthenticatedCiphertext **)&self->PBCodable_opaque[v15];
        *(void *)&self->PBCodable_opaque[v15] = v14;
        goto LABEL_32;
      case 0xCu:
        v26 = objc_alloc_init(&OBJC_CLASS___OTAuthenticatedCiphertext);
        objc_storeStrong((id *)&self->_contents, v26);
        v28[0] = 0xAAAAAAAAAAAAAAAALL;
        v28[1] = 0xAAAAAAAAAAAAAAAALL;
        if (PBReaderPlaceMark(a3, v28) && sub_1001C67A0((uint64_t)v26, (uint64_t)a3))
        {
          PBReaderRecallMark(a3, v28);
LABEL_32:

LABEL_33:
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
        goto LABEL_33;
    }
  }

- (void)writeTo:(id)a3
{
  id v4 = a3;
  peerID = self->_peerID;
  id v17 = v4;
  if (peerID)
  {
    PBDataWriterWriteStringField(v4, peerID, 1LL);
    id v4 = v17;
  }

  bottleID = self->_bottleID;
  if (bottleID)
  {
    PBDataWriterWriteStringField(v17, bottleID, 2LL);
    id v4 = v17;
  }

  reserved3 = self->_reserved3;
  if (reserved3)
  {
    PBDataWriterWriteDataField(v17, reserved3, 3LL);
    id v4 = v17;
  }

  reserved4 = self->_reserved4;
  if (reserved4)
  {
    PBDataWriterWriteDataField(v17, reserved4, 4LL);
    id v4 = v17;
  }

  reserved5 = self->_reserved5;
  if (reserved5)
  {
    PBDataWriterWriteDataField(v17, reserved5, 5LL);
    id v4 = v17;
  }

  reserved6 = self->_reserved6;
  if (reserved6)
  {
    PBDataWriterWriteDataField(v17, reserved6, 6LL);
    id v4 = v17;
  }

  reserved7 = self->_reserved7;
  if (reserved7)
  {
    PBDataWriterWriteDataField(v17, reserved7, 7LL);
    id v4 = v17;
  }

  escrowedSigningSPKI = self->_escrowedSigningSPKI;
  if (escrowedSigningSPKI)
  {
    PBDataWriterWriteDataField(v17, escrowedSigningSPKI, 8LL);
    id v4 = v17;
  }

  escrowedEncryptionSPKI = self->_escrowedEncryptionSPKI;
  if (escrowedEncryptionSPKI)
  {
    PBDataWriterWriteDataField(v17, escrowedEncryptionSPKI, 9LL);
    id v4 = v17;
  }

  peerSigningSPKI = self->_peerSigningSPKI;
  if (peerSigningSPKI)
  {
    PBDataWriterWriteDataField(v17, peerSigningSPKI, 10LL);
    id v4 = v17;
  }

  peerEncryptionSPKI = self->_peerEncryptionSPKI;
  if (peerEncryptionSPKI)
  {
    PBDataWriterWriteDataField(v17, peerEncryptionSPKI, 11LL);
    id v4 = v17;
  }

  contents = self->_contents;
  if (contents)
  {
    PBDataWriterWriteSubmessage(v17, contents, 12LL);
    id v4 = v17;
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

  if (self->_bottleID)
  {
    objc_msgSend(v5, "setBottleID:");
    id v4 = v5;
  }

  if (self->_reserved3)
  {
    objc_msgSend(v5, "setReserved3:");
    id v4 = v5;
  }

  if (self->_reserved4)
  {
    objc_msgSend(v5, "setReserved4:");
    id v4 = v5;
  }

  if (self->_reserved5)
  {
    objc_msgSend(v5, "setReserved5:");
    id v4 = v5;
  }

  if (self->_reserved6)
  {
    objc_msgSend(v5, "setReserved6:");
    id v4 = v5;
  }

  if (self->_reserved7)
  {
    objc_msgSend(v5, "setReserved7:");
    id v4 = v5;
  }

  if (self->_escrowedSigningSPKI)
  {
    objc_msgSend(v5, "setEscrowedSigningSPKI:");
    id v4 = v5;
  }

  if (self->_escrowedEncryptionSPKI)
  {
    objc_msgSend(v5, "setEscrowedEncryptionSPKI:");
    id v4 = v5;
  }

  if (self->_peerSigningSPKI)
  {
    objc_msgSend(v5, "setPeerSigningSPKI:");
    id v4 = v5;
  }

  if (self->_peerEncryptionSPKI)
  {
    objc_msgSend(v5, "setPeerEncryptionSPKI:");
    id v4 = v5;
  }

  if (self->_contents)
  {
    objc_msgSend(v5, "setContents:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_peerID, "copyWithZone:", a3);
  unint64_t v7 = (void *)v5[6];
  v5[6] = v6;

  id v8 = -[NSString copyWithZone:](self->_bottleID, "copyWithZone:", a3);
  char v9 = (void *)v5[1];
  v5[1] = v8;

  id v10 = -[NSData copyWithZone:](self->_reserved3, "copyWithZone:", a3);
  int v11 = (void *)v5[8];
  v5[8] = v10;

  id v12 = -[NSData copyWithZone:](self->_reserved4, "copyWithZone:", a3);
  v13 = (void *)v5[9];
  v5[9] = v12;

  id v14 = -[NSData copyWithZone:](self->_reserved5, "copyWithZone:", a3);
  uint64_t v15 = (void *)v5[10];
  v5[10] = v14;

  id v16 = -[NSData copyWithZone:](self->_reserved6, "copyWithZone:", a3);
  id v17 = (void *)v5[11];
  v5[11] = v16;

  id v18 = -[NSData copyWithZone:](self->_reserved7, "copyWithZone:", a3);
  uint64_t v19 = (void *)v5[12];
  v5[12] = v18;

  id v20 = -[NSData copyWithZone:](self->_escrowedSigningSPKI, "copyWithZone:", a3);
  uint64_t v21 = (void *)v5[4];
  v5[4] = v20;

  id v22 = -[NSData copyWithZone:](self->_escrowedEncryptionSPKI, "copyWithZone:", a3);
  uint64_t v23 = (void *)v5[3];
  v5[3] = v22;

  id v24 = -[NSData copyWithZone:](self->_peerSigningSPKI, "copyWithZone:", a3);
  uint64_t v25 = (void *)v5[7];
  v5[7] = v24;

  id v26 = -[NSData copyWithZone:](self->_peerEncryptionSPKI, "copyWithZone:", a3);
  v27 = (void *)v5[5];
  v5[5] = v26;

  id v28 = -[OTAuthenticatedCiphertext copyWithZone:](self->_contents, "copyWithZone:", a3);
  v29 = (void *)v5[2];
  v5[2] = v28;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  peerID = self->_peerID;
  if ((unint64_t)peerID | v4[6])
  {
  }

  bottleID = self->_bottleID;
  reserved3 = self->_reserved3;
  reserved4 = self->_reserved4;
  if (((reserved5 = self->_reserved5, !((unint64_t)reserved5 | v4[10]))
     || -[NSData isEqual:](reserved5, "isEqual:"))
    && ((reserved6 = self->_reserved6, !((unint64_t)reserved6 | v4[11]))
     || -[NSData isEqual:](reserved6, "isEqual:"))
    && ((reserved7 = self->_reserved7, !((unint64_t)reserved7 | v4[12]))
     || -[NSData isEqual:](reserved7, "isEqual:"))
    && ((escrowedSigningSPKI = self->_escrowedSigningSPKI, !((unint64_t)escrowedSigningSPKI | v4[4]))
     || -[NSData isEqual:](escrowedSigningSPKI, "isEqual:"))
    && ((escrowedEncryptionSPKI = self->_escrowedEncryptionSPKI, !((unint64_t)escrowedEncryptionSPKI | v4[3]))
     || -[NSData isEqual:](escrowedEncryptionSPKI, "isEqual:"))
    && ((peerSigningSPKI = self->_peerSigningSPKI, !((unint64_t)peerSigningSPKI | v4[7]))
     || -[NSData isEqual:](peerSigningSPKI, "isEqual:"))
    && ((peerEncryptionSPKI = self->_peerEncryptionSPKI, !((unint64_t)peerEncryptionSPKI | v4[5]))
     || -[NSData isEqual:](peerEncryptionSPKI, "isEqual:")))
  {
    contents = self->_contents;
    else {
      unsigned __int8 v17 = 1;
    }
  }

  else
  {
LABEL_26:
    unsigned __int8 v17 = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_peerID, "hash");
  unint64_t v4 = -[NSString hash](self->_bottleID, "hash") ^ v3;
  unint64_t v5 = (unint64_t)-[NSData hash](self->_reserved3, "hash");
  unint64_t v6 = v4 ^ v5 ^ (unint64_t)-[NSData hash](self->_reserved4, "hash");
  unint64_t v7 = (unint64_t)-[NSData hash](self->_reserved5, "hash");
  unint64_t v8 = v7 ^ (unint64_t)-[NSData hash](self->_reserved6, "hash");
  unint64_t v9 = v6 ^ v8 ^ (unint64_t)-[NSData hash](self->_reserved7, "hash");
  unint64_t v10 = (unint64_t)-[NSData hash](self->_escrowedSigningSPKI, "hash");
  unint64_t v11 = v10 ^ (unint64_t)-[NSData hash](self->_escrowedEncryptionSPKI, "hash");
  unint64_t v12 = v11 ^ (unint64_t)-[NSData hash](self->_peerSigningSPKI, "hash");
  unint64_t v13 = v9 ^ v12 ^ (unint64_t)-[NSData hash](self->_peerEncryptionSPKI, "hash");
  return v13 ^ -[OTAuthenticatedCiphertext hash](self->_contents, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t v6 = a3;
  if (v6[6]) {
    -[OTBottle setPeerID:](self, "setPeerID:");
  }
  if (v6[1]) {
    -[OTBottle setBottleID:](self, "setBottleID:");
  }
  if (v6[8]) {
    -[OTBottle setReserved3:](self, "setReserved3:");
  }
  if (v6[9]) {
    -[OTBottle setReserved4:](self, "setReserved4:");
  }
  if (v6[10]) {
    -[OTBottle setReserved5:](self, "setReserved5:");
  }
  if (v6[11]) {
    -[OTBottle setReserved6:](self, "setReserved6:");
  }
  if (v6[12]) {
    -[OTBottle setReserved7:](self, "setReserved7:");
  }
  if (v6[4]) {
    -[OTBottle setEscrowedSigningSPKI:](self, "setEscrowedSigningSPKI:");
  }
  if (v6[3]) {
    -[OTBottle setEscrowedEncryptionSPKI:](self, "setEscrowedEncryptionSPKI:");
  }
  if (v6[7]) {
    -[OTBottle setPeerSigningSPKI:](self, "setPeerSigningSPKI:");
  }
  if (v6[5]) {
    -[OTBottle setPeerEncryptionSPKI:](self, "setPeerEncryptionSPKI:");
  }
  contents = self->_contents;
  uint64_t v5 = v6[2];
  if (contents)
  {
    if (v5) {
      -[OTAuthenticatedCiphertext mergeFrom:](contents, "mergeFrom:");
    }
  }

  else if (v5)
  {
    -[OTBottle setContents:](self, "setContents:");
  }
}

- (NSString)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
}

- (NSString)bottleID
{
  return self->_bottleID;
}

- (void)setBottleID:(id)a3
{
}

- (NSData)reserved3
{
  return self->_reserved3;
}

- (void)setReserved3:(id)a3
{
}

- (NSData)reserved4
{
  return self->_reserved4;
}

- (void)setReserved4:(id)a3
{
}

- (NSData)reserved5
{
  return self->_reserved5;
}

- (void)setReserved5:(id)a3
{
}

- (NSData)reserved6
{
  return self->_reserved6;
}

- (void)setReserved6:(id)a3
{
}

- (NSData)escrowedSigningSPKI
{
  return self->_escrowedSigningSPKI;
}

- (void)setEscrowedSigningSPKI:(id)a3
{
}

- (NSData)escrowedEncryptionSPKI
{
  return self->_escrowedEncryptionSPKI;
}

- (void)setEscrowedEncryptionSPKI:(id)a3
{
}

- (NSData)peerSigningSPKI
{
  return self->_peerSigningSPKI;
}

- (void)setPeerSigningSPKI:(id)a3
{
}

- (NSData)peerEncryptionSPKI
{
  return self->_peerEncryptionSPKI;
}

- (void)setPeerEncryptionSPKI:(id)a3
{
}

- (NSData)reserved7
{
  return self->_reserved7;
}

- (void)setReserved7:(id)a3
{
}

- (OTAuthenticatedCiphertext)contents
{
  return self->_contents;
}

- (void)setContents:(id)a3
{
}

- (void).cxx_destruct
{
}

@end