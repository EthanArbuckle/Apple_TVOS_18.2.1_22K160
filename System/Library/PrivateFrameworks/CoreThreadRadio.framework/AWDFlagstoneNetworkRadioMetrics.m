@interface AWDFlagstoneNetworkRadioMetrics
- (AWDCountersNetworkS)sCntrsNetwork;
- (AWDCountersRadioS)sCntrsRadio;
- (AWDHeaderInfoS)header;
- (BOOL)hasHeader;
- (BOOL)hasSCntrsNetwork;
- (BOOL)hasSCntrsRadio;
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
- (void)setSCntrsNetwork:(id)a3;
- (void)setSCntrsRadio:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDFlagstoneNetworkRadioMetrics

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

- (BOOL)hasSCntrsNetwork
{
  return self->_sCntrsNetwork != 0LL;
}

- (BOOL)hasSCntrsRadio
{
  return self->_sCntrsRadio != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AWDFlagstoneNetworkRadioMetrics;
  id v3 = -[AWDFlagstoneNetworkRadioMetrics description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AWDFlagstoneNetworkRadioMetrics dictionaryRepresentation](self, "dictionaryRepresentation"));
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

  sCntrsNetwork = self->_sCntrsNetwork;
  if (sCntrsNetwork)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[AWDCountersNetworkS dictionaryRepresentation](sCntrsNetwork, "dictionaryRepresentation"));
    [v3 setObject:v8 forKey:@"s_cntrs_network"];
  }

  sCntrsRadio = self->_sCntrsRadio;
  if (sCntrsRadio)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AWDCountersRadioS dictionaryRepresentation](sCntrsRadio, "dictionaryRepresentation"));
    [v3 setObject:v10 forKey:@"s_cntrs_radio"];
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
  id v8 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1LL);
    id v4 = v8;
  }

  header = self->_header;
  if (header)
  {
    PBDataWriterWriteSubmessage(v8, header, 2LL);
    id v4 = v8;
  }

  sCntrsNetwork = self->_sCntrsNetwork;
  if (sCntrsNetwork)
  {
    PBDataWriterWriteSubmessage(v8, sCntrsNetwork, 3LL);
    id v4 = v8;
  }

  sCntrsRadio = self->_sCntrsRadio;
  if (sCntrsRadio)
  {
    PBDataWriterWriteSubmessage(v8, sCntrsRadio, 4LL);
    id v4 = v8;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 40) |= 1u;
  }

  v5 = v4;
  if (self->_header)
  {
    objc_msgSend(v4, "setHeader:");
    id v4 = v5;
  }

  if (self->_sCntrsNetwork)
  {
    objc_msgSend(v5, "setSCntrsNetwork:");
    id v4 = v5;
  }

  if (self->_sCntrsRadio)
  {
    objc_msgSend(v5, "setSCntrsRadio:");
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
    *((_BYTE *)v5 + 40) |= 1u;
  }

  id v7 = -[AWDHeaderInfoS copyWithZone:](self->_header, "copyWithZone:", a3);
  id v8 = (void *)v6[2];
  v6[2] = v7;

  id v9 = -[AWDCountersNetworkS copyWithZone:](self->_sCntrsNetwork, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  id v11 = -[AWDCountersRadioS copyWithZone:](self->_sCntrsRadio, "copyWithZone:", a3);
  v12 = (void *)v6[4];
  v6[4] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_16;
    }
  }

  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_16:
    unsigned __int8 v9 = 0;
    goto LABEL_17;
  }

  header = self->_header;
  if ((header || *((void *)v4 + 2)) && !-[AWDHeaderInfoS isEqual:](header, "isEqual:", *((void *)v4 + 2))) {
    goto LABEL_16;
  }
  sCntrsNetwork = self->_sCntrsNetwork;
  if ((sCntrsNetwork || *((void *)v4 + 3))
    && !-[AWDCountersNetworkS isEqual:](sCntrsNetwork, "isEqual:", *((void *)v4 + 3)))
  {
    goto LABEL_16;
  }

  sCntrsRadio = self->_sCntrsRadio;
  if (sCntrsRadio || *((void *)v4 + 4)) {
    unsigned __int8 v9 = -[AWDCountersRadioS isEqual:](sCntrsRadio, "isEqual:", *((void *)v4 + 4));
  }
  else {
    unsigned __int8 v9 = 1;
  }
LABEL_17:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v2 = self;
  if ((*(_BYTE *)(self + 40) & 1) == 0)
  {
    uint64_t v3 = 0LL;
LABEL_5:
    unint64_t v5 = (unint64_t)[*(id *)(self + 16) hash];
    unint64_t v6 = (unint64_t)[*(id *)(v2 + 24) hash];
    return v5 ^ v3 ^ v6 ^ (unint64_t)[*(id *)(v2 + 32) hash];
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
  if ((v4[5] & 1) != 0)
  {
    self->_timestamp = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

  header = self->_header;
  uint64_t v7 = v5[2];
  v12 = v5;
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
    -[AWDFlagstoneNetworkRadioMetrics setHeader:](self, "setHeader:");
  }

  unint64_t v5 = v12;
LABEL_9:
  sCntrsNetwork = self->_sCntrsNetwork;
  uint64_t v9 = v5[3];
  if (sCntrsNetwork)
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[AWDCountersNetworkS mergeFrom:](sCntrsNetwork, "mergeFrom:");
  }

  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[AWDFlagstoneNetworkRadioMetrics setSCntrsNetwork:](self, "setSCntrsNetwork:");
  }

  unint64_t v5 = v12;
LABEL_15:
  sCntrsRadio = self->_sCntrsRadio;
  uint64_t v11 = v5[4];
  if (sCntrsRadio)
  {
    if (v11)
    {
      -[AWDCountersRadioS mergeFrom:](sCntrsRadio, "mergeFrom:");
LABEL_20:
      unint64_t v5 = v12;
    }
  }

  else if (v11)
  {
    -[AWDFlagstoneNetworkRadioMetrics setSCntrsRadio:](self, "setSCntrsRadio:");
    goto LABEL_20;
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

- (AWDCountersNetworkS)sCntrsNetwork
{
  return self->_sCntrsNetwork;
}

- (void)setSCntrsNetwork:(id)a3
{
}

- (AWDCountersRadioS)sCntrsRadio
{
  return self->_sCntrsRadio;
}

- (void)setSCntrsRadio:(id)a3
{
}

- (void).cxx_destruct
{
}

@end