@interface AWDCountersMacRxS
- (BOOL)hasRxBroadcast;
- (BOOL)hasRxData;
- (BOOL)hasRxErrDuplicated;
- (BOOL)hasRxErrFcs;
- (BOOL)hasRxErrInvalidSrcAddr;
- (BOOL)hasRxErrNoframe;
- (BOOL)hasRxErrOther;
- (BOOL)hasRxErrPercentage;
- (BOOL)hasRxErrSecurity;
- (BOOL)hasRxErrUnknownNeighbor;
- (BOOL)hasRxTotal;
- (BOOL)hasRxUnicast;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)rxPacketCountHistogramsCount;
- (unsigned)rxBroadcast;
- (unsigned)rxData;
- (unsigned)rxErrDuplicated;
- (unsigned)rxErrFcs;
- (unsigned)rxErrInvalidSrcAddr;
- (unsigned)rxErrNoframe;
- (unsigned)rxErrOther;
- (unsigned)rxErrPercentage;
- (unsigned)rxErrSecurity;
- (unsigned)rxErrUnknownNeighbor;
- (unsigned)rxPacketCountHistogramAtIndex:(unint64_t)a3;
- (unsigned)rxPacketCountHistograms;
- (unsigned)rxTotal;
- (unsigned)rxUnicast;
- (void)addRxPacketCountHistogram:(unsigned int)a3;
- (void)clearRxPacketCountHistograms;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasRxBroadcast:(BOOL)a3;
- (void)setHasRxData:(BOOL)a3;
- (void)setHasRxErrDuplicated:(BOOL)a3;
- (void)setHasRxErrFcs:(BOOL)a3;
- (void)setHasRxErrInvalidSrcAddr:(BOOL)a3;
- (void)setHasRxErrNoframe:(BOOL)a3;
- (void)setHasRxErrOther:(BOOL)a3;
- (void)setHasRxErrPercentage:(BOOL)a3;
- (void)setHasRxErrSecurity:(BOOL)a3;
- (void)setHasRxErrUnknownNeighbor:(BOOL)a3;
- (void)setHasRxTotal:(BOOL)a3;
- (void)setHasRxUnicast:(BOOL)a3;
- (void)setRxBroadcast:(unsigned int)a3;
- (void)setRxData:(unsigned int)a3;
- (void)setRxErrDuplicated:(unsigned int)a3;
- (void)setRxErrFcs:(unsigned int)a3;
- (void)setRxErrInvalidSrcAddr:(unsigned int)a3;
- (void)setRxErrNoframe:(unsigned int)a3;
- (void)setRxErrOther:(unsigned int)a3;
- (void)setRxErrPercentage:(unsigned int)a3;
- (void)setRxErrSecurity:(unsigned int)a3;
- (void)setRxErrUnknownNeighbor:(unsigned int)a3;
- (void)setRxPacketCountHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setRxTotal:(unsigned int)a3;
- (void)setRxUnicast:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCountersMacRxS

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AWDCountersMacRxS;
  -[AWDCountersMacRxS dealloc](&v3, "dealloc");
}

- (void)setRxTotal:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_rxTotal = a3;
}

- (void)setHasRxTotal:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasRxTotal
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setRxData:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_rxData = a3;
}

- (void)setHasRxData:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasRxData
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setRxUnicast:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_rxUnicast = a3;
}

- (void)setHasRxUnicast:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasRxUnicast
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setRxBroadcast:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_rxBroadcast = a3;
}

- (void)setHasRxBroadcast:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasRxBroadcast
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setRxErrFcs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_rxErrFcs = a3;
}

- (void)setHasRxErrFcs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasRxErrFcs
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setRxErrUnknownNeighbor:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_rxErrUnknownNeighbor = a3;
}

- (void)setHasRxErrUnknownNeighbor:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRxErrUnknownNeighbor
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setRxErrInvalidSrcAddr:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_rxErrInvalidSrcAddr = a3;
}

- (void)setHasRxErrInvalidSrcAddr:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasRxErrInvalidSrcAddr
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setRxErrSecurity:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_rxErrSecurity = a3;
}

- (void)setHasRxErrSecurity:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRxErrSecurity
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setRxErrNoframe:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_rxErrNoframe = a3;
}

- (void)setHasRxErrNoframe:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasRxErrNoframe
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setRxErrDuplicated:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_rxErrDuplicated = a3;
}

- (void)setHasRxErrDuplicated:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasRxErrDuplicated
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setRxErrOther:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_rxErrOther = a3;
}

- (void)setHasRxErrOther:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasRxErrOther
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (unint64_t)rxPacketCountHistogramsCount
{
  return self->_rxPacketCountHistograms.count;
}

- (unsigned)rxPacketCountHistograms
{
  return self->_rxPacketCountHistograms.list;
}

- (void)clearRxPacketCountHistograms
{
}

- (void)addRxPacketCountHistogram:(unsigned int)a3
{
}

- (unsigned)rxPacketCountHistogramAtIndex:(unint64_t)a3
{
  p_rxPacketCountHistograms = &self->_rxPacketCountHistograms;
  unint64_t count = self->_rxPacketCountHistograms.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idx (%lu) is out of range (%lu)",  a3,  count));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSRangeException,  v6,  0LL));
    [v7 raise];
  }

  return p_rxPacketCountHistograms->list[a3];
}

- (void)setRxPacketCountHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setRxErrPercentage:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_rxErrPercentage = a3;
}

- (void)setHasRxErrPercentage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRxErrPercentage
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AWDCountersMacRxS;
  id v3 = -[AWDCountersMacRxS description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AWDCountersMacRxS dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_rxTotal));
    [v3 setObject:v10 forKey:@"rx_total"];

    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }

  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_rxData));
  [v3 setObject:v11 forKey:@"rx_data"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }

- (BOOL)readFrom:(id)a3
{
  return sub_100106838((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  id v7 = v4;
  if ((has & 0x400) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_rxTotal, 1LL);
    id v4 = v7;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }

  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteUint32Field(v7, self->_rxData, 2LL);
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    v4[18] = self->_rxTotal;
    *((_WORD *)v4 + 40) |= 0x400u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }

  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }

  v4[9] = self->_rxData;
  *((_WORD *)v4 + 40) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5 = v4;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    v4[18] = self->_rxTotal;
    *((_WORD *)v4 + 40) |= 0x400u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }

  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }

  v4[9] = self->_rxData;
  *((_WORD *)v4 + 40) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = (char *)a3;
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)v4 + 40);
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x400) == 0 || self->_rxTotal != *((_DWORD *)v4 + 18)) {
      goto LABEL_63;
    }
  }

  else if ((*((_WORD *)v4 + 40) & 0x400) != 0)
  {
    goto LABEL_63;
  }

  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_rxData != *((_DWORD *)v4 + 9)) {
      goto LABEL_63;
    }
  }

  else if ((v7 & 2) != 0)
  {
    goto LABEL_63;
  }

  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x800) == 0 || self->_rxUnicast != *((_DWORD *)v4 + 19)) {
      goto LABEL_63;
    }
  }

  else if ((*((_WORD *)v4 + 40) & 0x800) != 0)
  {
    goto LABEL_63;
  }

  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_rxBroadcast != *((_DWORD *)v4 + 8)) {
      goto LABEL_63;
    }
  }

  else if ((v7 & 1) != 0)
  {
    goto LABEL_63;
  }

  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_rxErrFcs != *((_DWORD *)v4 + 11)) {
      goto LABEL_63;
    }
  }

  else if ((v7 & 8) != 0)
  {
    goto LABEL_63;
  }

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x200) == 0 || self->_rxErrUnknownNeighbor != *((_DWORD *)v4 + 17)) {
      goto LABEL_63;
    }
  }

  else if ((*((_WORD *)v4 + 40) & 0x200) != 0)
  {
    goto LABEL_63;
  }

  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_rxErrInvalidSrcAddr != *((_DWORD *)v4 + 12)) {
      goto LABEL_63;
    }
  }

  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_63;
  }

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x100) == 0 || self->_rxErrSecurity != *((_DWORD *)v4 + 16)) {
      goto LABEL_63;
    }
  }

  else if ((*((_WORD *)v4 + 40) & 0x100) != 0)
  {
    goto LABEL_63;
  }

  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_rxErrNoframe != *((_DWORD *)v4 + 13)) {
      goto LABEL_63;
    }
  }

  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_63;
  }

  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_rxErrDuplicated != *((_DWORD *)v4 + 10)) {
      goto LABEL_63;
    }
  }

  else if ((v7 & 4) != 0)
  {
    goto LABEL_63;
  }

  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_rxErrOther != *((_DWORD *)v4 + 14)) {
      goto LABEL_63;
    }
  }

  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_63;
  }

  if (!PBRepeatedUInt32IsEqual(&self->_rxPacketCountHistograms, v4 + 8))
  {
LABEL_63:
    BOOL v9 = 0;
    goto LABEL_64;
  }

  __int16 v8 = *((_WORD *)v4 + 40);
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_rxErrPercentage != *((_DWORD *)v4 + 15)) {
      goto LABEL_63;
    }
    BOOL v9 = 1;
  }

  else
  {
    BOOL v9 = (v8 & 0x80) == 0;
  }

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    uint64_t v17 = 2654435761LL * self->_rxTotal;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v16 = 2654435761LL * self->_rxData;
      if ((*(_WORD *)&self->_has & 0x800) != 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }

  else
  {
    uint64_t v17 = 0LL;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }

  uint64_t v16 = 0LL;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_4:
    uint64_t v15 = 2654435761LL * self->_rxUnicast;
    if ((has & 1) != 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x400) != 0)
  {
    self->_rxTotal = *((_DWORD *)v4 + 18);
    *(_WORD *)&self->_has |= 0x400u;
    __int16 v5 = *((_WORD *)v4 + 40);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }

  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }

  self->_rxData = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x800) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }

- (unsigned)rxTotal
{
  return self->_rxTotal;
}

- (unsigned)rxData
{
  return self->_rxData;
}

- (unsigned)rxUnicast
{
  return self->_rxUnicast;
}

- (unsigned)rxBroadcast
{
  return self->_rxBroadcast;
}

- (unsigned)rxErrFcs
{
  return self->_rxErrFcs;
}

- (unsigned)rxErrUnknownNeighbor
{
  return self->_rxErrUnknownNeighbor;
}

- (unsigned)rxErrInvalidSrcAddr
{
  return self->_rxErrInvalidSrcAddr;
}

- (unsigned)rxErrSecurity
{
  return self->_rxErrSecurity;
}

- (unsigned)rxErrNoframe
{
  return self->_rxErrNoframe;
}

- (unsigned)rxErrDuplicated
{
  return self->_rxErrDuplicated;
}

- (unsigned)rxErrOther
{
  return self->_rxErrOther;
}

- (unsigned)rxErrPercentage
{
  return self->_rxErrPercentage;
}

@end