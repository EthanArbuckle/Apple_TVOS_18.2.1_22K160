@interface _ADPBProxyTCPInfoMetrics
- (BOOL)hasInterfaceName;
- (BOOL)hasRttBest;
- (BOOL)hasRttCurrent;
- (BOOL)hasRttSmoothed;
- (BOOL)hasRttVariance;
- (BOOL)hasRxBytes;
- (BOOL)hasRxDuplicateBytes;
- (BOOL)hasRxOooBytes;
- (BOOL)hasRxPackets;
- (BOOL)hasSndBandwidth;
- (BOOL)hasSynRetransmits;
- (BOOL)hasTfoSynDataAcked;
- (BOOL)hasTxBytes;
- (BOOL)hasTxPackets;
- (BOOL)hasTxRetransmitBytes;
- (BOOL)hasTxUnacked;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)interfaceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)rxBytes;
- (unint64_t)rxDuplicateBytes;
- (unint64_t)rxOooBytes;
- (unint64_t)rxPackets;
- (unint64_t)sndBandwidth;
- (unint64_t)txBytes;
- (unint64_t)txPackets;
- (unint64_t)txRetransmitBytes;
- (unint64_t)txUnacked;
- (unsigned)rttBest;
- (unsigned)rttCurrent;
- (unsigned)rttSmoothed;
- (unsigned)rttVariance;
- (unsigned)synRetransmits;
- (unsigned)tfoSynDataAcked;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRttBest:(BOOL)a3;
- (void)setHasRttCurrent:(BOOL)a3;
- (void)setHasRttSmoothed:(BOOL)a3;
- (void)setHasRttVariance:(BOOL)a3;
- (void)setHasRxBytes:(BOOL)a3;
- (void)setHasRxDuplicateBytes:(BOOL)a3;
- (void)setHasRxOooBytes:(BOOL)a3;
- (void)setHasRxPackets:(BOOL)a3;
- (void)setHasSndBandwidth:(BOOL)a3;
- (void)setHasSynRetransmits:(BOOL)a3;
- (void)setHasTfoSynDataAcked:(BOOL)a3;
- (void)setHasTxBytes:(BOOL)a3;
- (void)setHasTxPackets:(BOOL)a3;
- (void)setHasTxRetransmitBytes:(BOOL)a3;
- (void)setHasTxUnacked:(BOOL)a3;
- (void)setInterfaceName:(id)a3;
- (void)setRttBest:(unsigned int)a3;
- (void)setRttCurrent:(unsigned int)a3;
- (void)setRttSmoothed:(unsigned int)a3;
- (void)setRttVariance:(unsigned int)a3;
- (void)setRxBytes:(unint64_t)a3;
- (void)setRxDuplicateBytes:(unint64_t)a3;
- (void)setRxOooBytes:(unint64_t)a3;
- (void)setRxPackets:(unint64_t)a3;
- (void)setSndBandwidth:(unint64_t)a3;
- (void)setSynRetransmits:(unsigned int)a3;
- (void)setTfoSynDataAcked:(unsigned int)a3;
- (void)setTxBytes:(unint64_t)a3;
- (void)setTxPackets:(unint64_t)a3;
- (void)setTxRetransmitBytes:(unint64_t)a3;
- (void)setTxUnacked:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _ADPBProxyTCPInfoMetrics

- (BOOL)hasInterfaceName
{
  return self->_interfaceName != 0LL;
}

- (void)setRttCurrent:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_rttCurrent = a3;
}

- (void)setHasRttCurrent:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasRttCurrent
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setRttSmoothed:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_rttSmoothed = a3;
}

- (void)setHasRttSmoothed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasRttSmoothed
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setRttVariance:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_rttVariance = a3;
}

- (void)setHasRttVariance:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasRttVariance
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setRttBest:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_rttBest = a3;
}

- (void)setHasRttBest:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRttBest
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setTxPackets:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_txPackets = a3;
}

- (void)setHasTxPackets:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTxPackets
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setTxBytes:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_txBytes = a3;
}

- (void)setHasTxBytes:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasTxBytes
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setTxRetransmitBytes:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_txRetransmitBytes = a3;
}

- (void)setHasTxRetransmitBytes:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTxRetransmitBytes
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setTxUnacked:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_txUnacked = a3;
}

- (void)setHasTxUnacked:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTxUnacked
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setRxPackets:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_rxPackets = a3;
}

- (void)setHasRxPackets:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasRxPackets
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setRxBytes:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_rxBytes = a3;
}

- (void)setHasRxBytes:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasRxBytes
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setRxDuplicateBytes:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_rxDuplicateBytes = a3;
}

- (void)setHasRxDuplicateBytes:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasRxDuplicateBytes
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setRxOooBytes:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_rxOooBytes = a3;
}

- (void)setHasRxOooBytes:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasRxOooBytes
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setSndBandwidth:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_sndBandwidth = a3;
}

- (void)setHasSndBandwidth:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasSndBandwidth
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setSynRetransmits:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_synRetransmits = a3;
}

- (void)setHasSynRetransmits:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasSynRetransmits
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setTfoSynDataAcked:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_tfoSynDataAcked = a3;
}

- (void)setHasTfoSynDataAcked:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasTfoSynDataAcked
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____ADPBProxyTCPInfoMetrics;
  id v3 = -[_ADPBProxyTCPInfoMetrics description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBProxyTCPInfoMetrics dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  interfaceName = self->_interfaceName;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_rttCurrent));
    [v4 setObject:v9 forKey:@"rtt_current"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_5:
      if ((has & 0x1000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_22;
    }
  }

  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_5;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_rttSmoothed));
  [v4 setObject:v10 forKey:@"rtt_smoothed"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }

- (BOOL)readFrom:(id)a3
{
  return sub_10006CC70((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  interfaceName = self->_interfaceName;
  id v7 = v4;
  if (interfaceName)
  {
    PBDataWriterWriteStringField(v4, interfaceName, 1LL);
    id v4 = v7;
  }

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    PBDataWriterWriteUint32Field(v7, self->_rttCurrent, 10LL);
    id v4 = v7;
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_5:
      if ((has & 0x1000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_22;
    }
  }

  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_5;
  }

  PBDataWriterWriteUint32Field(v7, self->_rttSmoothed, 11LL);
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_interfaceName)
  {
    id v6 = v4;
    objc_msgSend(v4, "setInterfaceName:");
    id v4 = v6;
  }

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    *((_DWORD *)v4 + 23) = self->_rttCurrent;
    *((_WORD *)v4 + 56) |= 0x400u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_5:
      if ((has & 0x1000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_22;
    }
  }

  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_5;
  }

  *((_DWORD *)v4 + 24) = self->_rttSmoothed;
  *((_WORD *)v4 + 56) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_interfaceName, "copyWithZone:", a3);
  id v7 = (void *)v5[10];
  v5[10] = v6;

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    *((_DWORD *)v5 + 23) = self->_rttCurrent;
    *((_WORD *)v5 + 56) |= 0x400u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }

  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)v5 + 24) = self->_rttSmoothed;
  *((_WORD *)v5 + 56) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  interfaceName = self->_interfaceName;
  if ((unint64_t)interfaceName | *((void *)v4 + 10))
  {
  }

  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)v4 + 56);
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x400) == 0 || self->_rttCurrent != *((_DWORD *)v4 + 23)) {
      goto LABEL_79;
    }
  }

  else if ((*((_WORD *)v4 + 56) & 0x400) != 0)
  {
LABEL_79:
    BOOL v8 = 0;
    goto LABEL_80;
  }

  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x800) == 0 || self->_rttSmoothed != *((_DWORD *)v4 + 24)) {
      goto LABEL_79;
    }
  }

  else if ((*((_WORD *)v4 + 56) & 0x800) != 0)
  {
    goto LABEL_79;
  }

  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x1000) == 0 || self->_rttVariance != *((_DWORD *)v4 + 25)) {
      goto LABEL_79;
    }
  }

  else if ((*((_WORD *)v4 + 56) & 0x1000) != 0)
  {
    goto LABEL_79;
  }

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x200) == 0 || self->_rttBest != *((_DWORD *)v4 + 22)) {
      goto LABEL_79;
    }
  }

  else if ((*((_WORD *)v4 + 56) & 0x200) != 0)
  {
    goto LABEL_79;
  }

  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_txPackets != *((void *)v4 + 7)) {
      goto LABEL_79;
    }
  }

  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_79;
  }

  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_txBytes != *((void *)v4 + 6)) {
      goto LABEL_79;
    }
  }

  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_79;
  }

  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_txRetransmitBytes != *((void *)v4 + 8)) {
      goto LABEL_79;
    }
  }

  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_79;
  }

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x100) == 0 || self->_txUnacked != *((void *)v4 + 9)) {
      goto LABEL_79;
    }
  }

  else if ((*((_WORD *)v4 + 56) & 0x100) != 0)
  {
    goto LABEL_79;
  }

  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_rxPackets != *((void *)v4 + 4)) {
      goto LABEL_79;
    }
  }

  else if ((v7 & 8) != 0)
  {
    goto LABEL_79;
  }

  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_rxBytes != *((void *)v4 + 1)) {
      goto LABEL_79;
    }
  }

  else if ((v7 & 1) != 0)
  {
    goto LABEL_79;
  }

  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_rxDuplicateBytes != *((void *)v4 + 2)) {
      goto LABEL_79;
    }
  }

  else if ((v7 & 2) != 0)
  {
    goto LABEL_79;
  }

  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_rxOooBytes != *((void *)v4 + 3)) {
      goto LABEL_79;
    }
  }

  else if ((v7 & 4) != 0)
  {
    goto LABEL_79;
  }

  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_sndBandwidth != *((void *)v4 + 5)) {
      goto LABEL_79;
    }
  }

  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_79;
  }

  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x2000) == 0 || self->_synRetransmits != *((_DWORD *)v4 + 26)) {
      goto LABEL_79;
    }
  }

  else if ((*((_WORD *)v4 + 56) & 0x2000) != 0)
  {
    goto LABEL_79;
  }

  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x4000) == 0 || self->_tfoSynDataAcked != *((_DWORD *)v4 + 27)) {
      goto LABEL_79;
    }
    BOOL v8 = 1;
  }

  else
  {
    BOOL v8 = (v7 & 0x4000) == 0;
  }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_interfaceName, "hash");
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    uint64_t v5 = 2654435761LL * self->_rttCurrent;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761LL * self->_rttSmoothed;
      if ((*(_WORD *)&self->_has & 0x1000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }

  else
  {
    uint64_t v5 = 0LL;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_3;
    }
  }

  uint64_t v6 = 0LL;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_4:
    uint64_t v7 = 2654435761LL * self->_rttVariance;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 10))
  {
    id v6 = v4;
    -[_ADPBProxyTCPInfoMetrics setInterfaceName:](self, "setInterfaceName:");
    id v4 = v6;
  }

  __int16 v5 = *((_WORD *)v4 + 56);
  if ((v5 & 0x400) != 0)
  {
    self->_rttCurrent = *((_DWORD *)v4 + 23);
    *(_WORD *)&self->_has |= 0x400u;
    __int16 v5 = *((_WORD *)v4 + 56);
    if ((v5 & 0x800) == 0)
    {
LABEL_5:
      if ((v5 & 0x1000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_22;
    }
  }

  else if ((*((_WORD *)v4 + 56) & 0x800) == 0)
  {
    goto LABEL_5;
  }

  self->_rttSmoothed = *((_DWORD *)v4 + 24);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)v4 + 56);
  if ((v5 & 0x1000) == 0)
  {
LABEL_6:
    if ((v5 & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (unsigned)rttCurrent
{
  return self->_rttCurrent;
}

- (unsigned)rttSmoothed
{
  return self->_rttSmoothed;
}

- (unsigned)rttVariance
{
  return self->_rttVariance;
}

- (unsigned)rttBest
{
  return self->_rttBest;
}

- (unint64_t)txPackets
{
  return self->_txPackets;
}

- (unint64_t)txBytes
{
  return self->_txBytes;
}

- (unint64_t)txRetransmitBytes
{
  return self->_txRetransmitBytes;
}

- (unint64_t)txUnacked
{
  return self->_txUnacked;
}

- (unint64_t)rxPackets
{
  return self->_rxPackets;
}

- (unint64_t)rxBytes
{
  return self->_rxBytes;
}

- (unint64_t)rxDuplicateBytes
{
  return self->_rxDuplicateBytes;
}

- (unint64_t)rxOooBytes
{
  return self->_rxOooBytes;
}

- (unint64_t)sndBandwidth
{
  return self->_sndBandwidth;
}

- (unsigned)synRetransmits
{
  return self->_synRetransmits;
}

- (unsigned)tfoSynDataAcked
{
  return self->_tfoSynDataAcked;
}

- (void).cxx_destruct
{
}

@end