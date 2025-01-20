@interface AWDFlagstoneCTCSStabilityMetrics
- (AWDCtcsReadWriteStabilityS)sCntrsStability;
- (AWDHeaderInfoS)header;
- (BOOL)hasHeader;
- (BOOL)hasSCntrsStability;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHeader:(id)a3;
- (void)setSCntrsStability:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDFlagstoneCTCSStabilityMetrics

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

- (BOOL)hasSCntrsStability
{
  return self->_sCntrsStability != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AWDFlagstoneCTCSStabilityMetrics;
  id v3 = -[AWDFlagstoneCTCSStabilityMetrics description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AWDFlagstoneCTCSStabilityMetrics dictionaryRepresentation](self, "dictionaryRepresentation"));
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

  sCntrsStability = self->_sCntrsStability;
  if (sCntrsStability)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[AWDCtcsReadWriteStabilityS dictionaryRepresentation](sCntrsStability, "dictionaryRepresentation"));
    [v3 setObject:v8 forKey:@"s_cntrs_stability"];
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
  id v7 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1LL);
    id v4 = v7;
  }

  header = self->_header;
  if (header)
  {
    PBDataWriterWriteSubmessage(v7, header, 2LL);
    id v4 = v7;
  }

  sCntrsStability = self->_sCntrsStability;
  if (sCntrsStability)
  {
    PBDataWriterWriteSubmessage(v7, sCntrsStability, 3LL);
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 32) |= 1u;
  }

  v5 = v4;
  if (self->_header)
  {
    objc_msgSend(v4, "setHeader:");
    id v4 = v5;
  }

  if (self->_sCntrsStability)
  {
    objc_msgSend(v5, "setSCntrsStability:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_BYTE *)v5 + 32) |= 1u;
  }

  id v7 = -[AWDHeaderInfoS copyWithZone:](self->_header, "copyWithZone:", a3);
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  id v9 = -[AWDCtcsReadWriteStabilityS copyWithZone:](self->_sCntrsStability, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_13;
    }
  }

  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_13:
    unsigned __int8 v8 = 0;
    goto LABEL_14;
  }

  header = self->_header;
  if ((header || *((void *)v4 + 2)) && !-[AWDHeaderInfoS isEqual:](header, "isEqual:", *((void *)v4 + 2))) {
    goto LABEL_13;
  }
  sCntrsStability = self->_sCntrsStability;
  if (sCntrsStability || *((void *)v4 + 3)) {
    unsigned __int8 v8 = -[AWDCtcsReadWriteStabilityS isEqual:](sCntrsStability, "isEqual:", *((void *)v4 + 3));
  }
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v2 = self;
  if ((*(_BYTE *)(self + 32) & 1) == 0)
  {
    uint64_t v3 = 0LL;
LABEL_5:
    unint64_t v5 = (unint64_t)[*(id *)(self + 16) hash] ^ v3;
    return v5 ^ (unint64_t)[*(id *)(v2 + 24) hash];
  }

  unint64_t v4 = *(void *)(self + 8);
  if (is_mul_ok(v4, 0x9E3779B1uLL))
  {
    uint64_t v3 = 2654435761u * v4;
    goto LABEL_5;
  }

  __break(0x550Cu);
  return self;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  unint64_t v5 = v4;
  if ((v4[4] & 1) != 0)
  {
    self->_timestamp = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

  header = self->_header;
  uint64_t v7 = v5[2];
  v10 = v5;
  if (header)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[AWDHeaderInfoS mergeFrom:](header, "mergeFrom:");
  }

  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[AWDFlagstoneCTCSStabilityMetrics setHeader:](self, "setHeader:");
  }

  unint64_t v5 = v10;
LABEL_9:
  sCntrsStability = self->_sCntrsStability;
  uint64_t v9 = v5[3];
  if (sCntrsStability)
  {
    if (v9)
    {
      -[AWDCtcsReadWriteStabilityS mergeFrom:](sCntrsStability, "mergeFrom:");
LABEL_14:
      unint64_t v5 = v10;
    }
  }

  else if (v9)
  {
    -[AWDFlagstoneCTCSStabilityMetrics setSCntrsStability:](self, "setSCntrsStability:");
    goto LABEL_14;
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

- (AWDCtcsReadWriteStabilityS)sCntrsStability
{
  return self->_sCntrsStability;
}

- (void)setSCntrsStability:(id)a3
{
}

- (void).cxx_destruct
{
}

@end