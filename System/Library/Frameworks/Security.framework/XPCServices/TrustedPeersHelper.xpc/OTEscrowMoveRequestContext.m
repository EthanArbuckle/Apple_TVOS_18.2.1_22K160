@interface OTEscrowMoveRequestContext
- (BOOL)hasCurrentFederation;
- (BOOL)hasEscrowRecordLabel;
- (BOOL)hasIntendedFederation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)currentFederation;
- (NSString)escrowRecordLabel;
- (NSString)intendedFederation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCurrentFederation:(id)a3;
- (void)setEscrowRecordLabel:(id)a3;
- (void)setIntendedFederation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTEscrowMoveRequestContext

- (BOOL)hasEscrowRecordLabel
{
  return self->_escrowRecordLabel != 0LL;
}

- (BOOL)hasCurrentFederation
{
  return self->_currentFederation != 0LL;
}

- (BOOL)hasIntendedFederation
{
  return self->_intendedFederation != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OTEscrowMoveRequestContext;
  id v3 = -[OTEscrowMoveRequestContext description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTEscrowMoveRequestContext dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  escrowRecordLabel = self->_escrowRecordLabel;
  if (escrowRecordLabel) {
    [v3 setObject:escrowRecordLabel forKey:@"escrowRecordLabel"];
  }
  currentFederation = self->_currentFederation;
  if (currentFederation) {
    [v4 setObject:currentFederation forKey:@"currentFederation"];
  }
  intendedFederation = self->_intendedFederation;
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
        uint64_t String = PBReaderReadString(a3);
        uint64_t v15 = objc_claimAutoreleasedReturnValue(String);
        uint64_t v16 = 8LL;
        goto LABEL_23;
      }

      if ((_DWORD)v13 == 1)
      {
        uint64_t v14 = PBReaderReadString(a3);
        uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
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

    uint64_t v17 = PBReaderReadString(a3);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v17);
    uint64_t v16 = 24LL;
    goto LABEL_23;
  }

  return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  escrowRecordLabel = self->_escrowRecordLabel;
  id v8 = v4;
  if (escrowRecordLabel)
  {
    PBDataWriterWriteStringField(v4, escrowRecordLabel, 1LL);
    id v4 = v8;
  }

  currentFederation = self->_currentFederation;
  if (currentFederation)
  {
    PBDataWriterWriteStringField(v8, currentFederation, 2LL);
    id v4 = v8;
  }

  intendedFederation = self->_intendedFederation;
  if (intendedFederation)
  {
    PBDataWriterWriteStringField(v8, intendedFederation, 3LL);
    id v4 = v8;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_escrowRecordLabel)
  {
    objc_msgSend(v4, "setEscrowRecordLabel:");
    id v4 = v5;
  }

  if (self->_currentFederation)
  {
    objc_msgSend(v5, "setCurrentFederation:");
    id v4 = v5;
  }

  if (self->_intendedFederation)
  {
    objc_msgSend(v5, "setIntendedFederation:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_escrowRecordLabel, "copyWithZone:", a3);
  unint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = -[NSString copyWithZone:](self->_currentFederation, "copyWithZone:", a3);
  char v9 = (void *)v5[1];
  v5[1] = v8;

  id v10 = -[NSString copyWithZone:](self->_intendedFederation, "copyWithZone:", a3);
  int v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class(self)]
    && ((escrowRecordLabel = self->_escrowRecordLabel, !((unint64_t)escrowRecordLabel | v4[2]))
     || -[NSString isEqual:](escrowRecordLabel, "isEqual:"))
    && ((currentFederation = self->_currentFederation, !((unint64_t)currentFederation | v4[1]))
     || -[NSString isEqual:](currentFederation, "isEqual:")))
  {
    intendedFederation = self->_intendedFederation;
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
  NSUInteger v3 = -[NSString hash](self->_escrowRecordLabel, "hash");
  unint64_t v4 = -[NSString hash](self->_currentFederation, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_intendedFederation, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if (v4[2]) {
    -[OTEscrowMoveRequestContext setEscrowRecordLabel:](self, "setEscrowRecordLabel:");
  }
  if (v4[1]) {
    -[OTEscrowMoveRequestContext setCurrentFederation:](self, "setCurrentFederation:");
  }
  if (v4[3]) {
    -[OTEscrowMoveRequestContext setIntendedFederation:](self, "setIntendedFederation:");
  }
}

- (NSString)escrowRecordLabel
{
  return self->_escrowRecordLabel;
}

- (void)setEscrowRecordLabel:(id)a3
{
}

- (NSString)currentFederation
{
  return self->_currentFederation;
}

- (void)setCurrentFederation:(id)a3
{
}

- (NSString)intendedFederation
{
  return self->_intendedFederation;
}

- (void)setIntendedFederation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end