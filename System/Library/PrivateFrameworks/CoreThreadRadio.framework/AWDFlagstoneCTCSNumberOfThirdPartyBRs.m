@interface AWDFlagstoneCTCSNumberOfThirdPartyBRs
- (AWDHeaderInfoS)header;
- (BOOL)hasHeader;
- (BOOL)hasNumberOfThirdPartyBorderRouters;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)numberOfThirdPartyBorderRouters;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasNumberOfThirdPartyBorderRouters:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHeader:(id)a3;
- (void)setNumberOfThirdPartyBorderRouters:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDFlagstoneCTCSNumberOfThirdPartyBRs

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasHeader
{
  return self->_header != 0LL;
}

- (void)setNumberOfThirdPartyBorderRouters:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numberOfThirdPartyBorderRouters = a3;
}

- (void)setHasNumberOfThirdPartyBorderRouters:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumberOfThirdPartyBorderRouters
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AWDFlagstoneCTCSNumberOfThirdPartyBRs;
  id v3 = -[AWDFlagstoneCTCSNumberOfThirdPartyBRs description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AWDFlagstoneCTCSNumberOfThirdPartyBRs dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_timestamp));
    [v3 setObject:v4 forKey:@"timestamp"];
  }

  header = self->_header;
  if (header)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AWDHeaderInfoS dictionaryRepresentation](header, "dictionaryRepresentation"));
    [v3 setObject:v6 forKey:@"header"];
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_numberOfThirdPartyBorderRouters));
    [v3 setObject:v7 forKey:@"number_of_third_party_border_routers"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return result;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1LL);
    id v4 = v6;
  }

  header = self->_header;
  if (header)
  {
    PBDataWriterWriteSubmessage(v6, header, 2LL);
    id v4 = v6;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v6, self->_numberOfThirdPartyBorderRouters, 3LL);
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 28) |= 1u;
  }

  if (self->_header)
  {
    v5 = v4;
    objc_msgSend(v4, "setHeader:");
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_numberOfThirdPartyBorderRouters;
    *((_BYTE *)v4 + 28) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_BYTE *)v5 + 28) |= 1u;
  }

  id v7 = -[AWDHeaderInfoS copyWithZone:](self->_header, "copyWithZone:", a3);
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v6 + 6) = self->_numberOfThirdPartyBorderRouters;
    *((_BYTE *)v6 + 28) |= 2u;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_15;
    }
  }

  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_15;
  }

  header = self->_header;
  if (header || *((void *)v4 + 2))
  {
    if (!-[AWDHeaderInfoS isEqual:](header, "isEqual:", *((void *)v4 + 2)))
    {
LABEL_15:
      BOOL v8 = 0;
      goto LABEL_16;
    }

    char has = (char)self->_has;
  }

  BOOL v8 = (*((_BYTE *)v4 + 28) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_numberOfThirdPartyBorderRouters != *((_DWORD *)v4 + 6)) {
      goto LABEL_15;
    }
    BOOL v8 = 1;
  }

- (unint64_t)hash
{
  unint64_t v2 = self;
  if ((*(_BYTE *)(self + 28) & 1) != 0)
  {
    unint64_t v4 = *(void *)(self + 8);
    if (!is_mul_ok(v4, 0x9E3779B1uLL))
    {
      __break(0x550Cu);
      return self;
    }

    uint64_t v3 = 2654435761u * v4;
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  unint64_t v5 = (unint64_t)[*(id *)(self + 16) hash];
  if ((*(_BYTE *)(v2 + 28) & 2) != 0) {
    uint64_t v6 = 2654435761LL * *(unsigned int *)(v2 + 24);
  }
  else {
    uint64_t v6 = 0LL;
  }
  return v5 ^ v3 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  id v5 = v4;
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    self->_timestamp = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

  header = self->_header;
  uint64_t v7 = *((void *)v5 + 2);
  if (header)
  {
    if (!v7) {
      goto LABEL_9;
    }
    id v8 = v5;
    -[AWDHeaderInfoS mergeFrom:](header, "mergeFrom:");
  }

  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    id v8 = v5;
    -[AWDFlagstoneCTCSNumberOfThirdPartyBRs setHeader:](self, "setHeader:");
  }

  id v5 = v8;
LABEL_9:
  if ((*((_BYTE *)v5 + 28) & 2) != 0)
  {
    self->_numberOfThirdPartyBorderRouters = *((_DWORD *)v5 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (AWDHeaderInfoS)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (unsigned)numberOfThirdPartyBorderRouters
{
  return self->_numberOfThirdPartyBorderRouters;
}

- (void).cxx_destruct
{
}

@end