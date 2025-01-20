@interface AWDRadioStatsS
- (BOOL)hasListeningTime;
- (BOOL)hasReceivingTime;
- (BOOL)hasRetryInterval90perc;
- (BOOL)hasRetryIntervalAvg;
- (BOOL)hasRetryIntervalMax;
- (BOOL)hasRetryIntervalMin;
- (BOOL)hasRtt90perc;
- (BOOL)hasRttAvgVal;
- (BOOL)hasRttMaxVal;
- (BOOL)hasRttMinVal;
- (BOOL)hasTransmittingTime;
- (BOOL)hasTxDelay90perc;
- (BOOL)hasTxDelayAvg;
- (BOOL)hasTxDelayMax;
- (BOOL)hasTxDelayMin;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)listeningTime;
- (unsigned)receivingTime;
- (unsigned)retryInterval90perc;
- (unsigned)retryIntervalAvg;
- (unsigned)retryIntervalMax;
- (unsigned)retryIntervalMin;
- (unsigned)rtt90perc;
- (unsigned)rttAvgVal;
- (unsigned)rttMaxVal;
- (unsigned)rttMinVal;
- (unsigned)transmittingTime;
- (unsigned)txDelay90perc;
- (unsigned)txDelayAvg;
- (unsigned)txDelayMax;
- (unsigned)txDelayMin;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasListeningTime:(BOOL)a3;
- (void)setHasReceivingTime:(BOOL)a3;
- (void)setHasRetryInterval90perc:(BOOL)a3;
- (void)setHasRetryIntervalAvg:(BOOL)a3;
- (void)setHasRetryIntervalMax:(BOOL)a3;
- (void)setHasRetryIntervalMin:(BOOL)a3;
- (void)setHasRtt90perc:(BOOL)a3;
- (void)setHasRttAvgVal:(BOOL)a3;
- (void)setHasRttMaxVal:(BOOL)a3;
- (void)setHasRttMinVal:(BOOL)a3;
- (void)setHasTransmittingTime:(BOOL)a3;
- (void)setHasTxDelay90perc:(BOOL)a3;
- (void)setHasTxDelayAvg:(BOOL)a3;
- (void)setHasTxDelayMax:(BOOL)a3;
- (void)setHasTxDelayMin:(BOOL)a3;
- (void)setListeningTime:(unsigned int)a3;
- (void)setReceivingTime:(unsigned int)a3;
- (void)setRetryInterval90perc:(unsigned int)a3;
- (void)setRetryIntervalAvg:(unsigned int)a3;
- (void)setRetryIntervalMax:(unsigned int)a3;
- (void)setRetryIntervalMin:(unsigned int)a3;
- (void)setRtt90perc:(unsigned int)a3;
- (void)setRttAvgVal:(unsigned int)a3;
- (void)setRttMaxVal:(unsigned int)a3;
- (void)setRttMinVal:(unsigned int)a3;
- (void)setTransmittingTime:(unsigned int)a3;
- (void)setTxDelay90perc:(unsigned int)a3;
- (void)setTxDelayAvg:(unsigned int)a3;
- (void)setTxDelayMax:(unsigned int)a3;
- (void)setTxDelayMin:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDRadioStatsS

- (void)setRttMinVal:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_rttMinVal = a3;
}

- (void)setHasRttMinVal:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRttMinVal
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setRttMaxVal:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_rttMaxVal = a3;
}

- (void)setHasRttMaxVal:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRttMaxVal
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setRttAvgVal:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_rttAvgVal = a3;
}

- (void)setHasRttAvgVal:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRttAvgVal
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setRtt90perc:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_rtt90perc = a3;
}

- (void)setHasRtt90perc:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasRtt90perc
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setRetryIntervalMin:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_retryIntervalMin = a3;
}

- (void)setHasRetryIntervalMin:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasRetryIntervalMin
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setRetryIntervalMax:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_retryIntervalMax = a3;
}

- (void)setHasRetryIntervalMax:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasRetryIntervalMax
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setRetryIntervalAvg:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_retryIntervalAvg = a3;
}

- (void)setHasRetryIntervalAvg:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasRetryIntervalAvg
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setRetryInterval90perc:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_retryInterval90perc = a3;
}

- (void)setHasRetryInterval90perc:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasRetryInterval90perc
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setTxDelayMin:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_txDelayMin = a3;
}

- (void)setHasTxDelayMin:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasTxDelayMin
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setTxDelayMax:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_txDelayMax = a3;
}

- (void)setHasTxDelayMax:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasTxDelayMax
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setTxDelayAvg:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_txDelayAvg = a3;
}

- (void)setHasTxDelayAvg:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasTxDelayAvg
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setTxDelay90perc:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_txDelay90perc = a3;
}

- (void)setHasTxDelay90perc:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasTxDelay90perc
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setListeningTime:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_listeningTime = a3;
}

- (void)setHasListeningTime:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasListeningTime
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setReceivingTime:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_receivingTime = a3;
}

- (void)setHasReceivingTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasReceivingTime
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setTransmittingTime:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_transmittingTime = a3;
}

- (void)setHasTransmittingTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasTransmittingTime
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AWDRadioStatsS;
  id v3 = -[AWDRadioStatsS description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AWDRadioStatsS dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_rttMinVal));
    [v3 setObject:v7 forKey:@"rtt_min_val"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }

  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_rttMaxVal));
  [v3 setObject:v8 forKey:@"rtt_max_val"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }

- (BOOL)readFrom:(id)a3
{
  return sub_1000B1E80((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_rttMinVal, 1LL);
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }

  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteUint32Field(v5, self->_rttMaxVal, 2LL);
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }

- (void)copyTo:(id)a3
{
  v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v4[11] = self->_rttMinVal;
    *((_WORD *)v4 + 34) |= 0x200u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }

  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }

  v4[10] = self->_rttMaxVal;
  *((_WORD *)v4 + 34) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *((_DWORD *)result + 11) = self->_rttMinVal;
    *((_WORD *)result + 34) |= 0x200u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }

  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)result + 10) = self->_rttMaxVal;
  *((_WORD *)result + 34) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)v4 + 34);
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 34) & 0x200) == 0 || self->_rttMinVal != *((_DWORD *)v4 + 11)) {
      goto LABEL_77;
    }
  }

  else if ((*((_WORD *)v4 + 34) & 0x200) != 0)
  {
LABEL_77:
    BOOL v8 = 0;
    goto LABEL_78;
  }

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 34) & 0x100) == 0 || self->_rttMaxVal != *((_DWORD *)v4 + 10)) {
      goto LABEL_77;
    }
  }

  else if ((*((_WORD *)v4 + 34) & 0x100) != 0)
  {
    goto LABEL_77;
  }

  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_rttAvgVal != *((_DWORD *)v4 + 9)) {
      goto LABEL_77;
    }
  }

  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_77;
  }

  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_rtt90perc != *((_DWORD *)v4 + 8)) {
      goto LABEL_77;
    }
  }

  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_77;
  }

  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_retryIntervalMin != *((_DWORD *)v4 + 7)) {
      goto LABEL_77;
    }
  }

  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_77;
  }

  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_retryIntervalMax != *((_DWORD *)v4 + 6)) {
      goto LABEL_77;
    }
  }

  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_77;
  }

  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_retryIntervalAvg != *((_DWORD *)v4 + 5)) {
      goto LABEL_77;
    }
  }

  else if ((v7 & 8) != 0)
  {
    goto LABEL_77;
  }

  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_retryInterval90perc != *((_DWORD *)v4 + 4)) {
      goto LABEL_77;
    }
  }

  else if ((v7 & 4) != 0)
  {
    goto LABEL_77;
  }

  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 34) & 0x4000) == 0 || self->_txDelayMin != *((_DWORD *)v4 + 16)) {
      goto LABEL_77;
    }
  }

  else if ((*((_WORD *)v4 + 34) & 0x4000) != 0)
  {
    goto LABEL_77;
  }

  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 34) & 0x2000) == 0 || self->_txDelayMax != *((_DWORD *)v4 + 15)) {
      goto LABEL_77;
    }
  }

  else if ((*((_WORD *)v4 + 34) & 0x2000) != 0)
  {
    goto LABEL_77;
  }

  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 34) & 0x1000) == 0 || self->_txDelayAvg != *((_DWORD *)v4 + 14)) {
      goto LABEL_77;
    }
  }

  else if ((*((_WORD *)v4 + 34) & 0x1000) != 0)
  {
    goto LABEL_77;
  }

  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 34) & 0x800) == 0 || self->_txDelay90perc != *((_DWORD *)v4 + 13)) {
      goto LABEL_77;
    }
  }

  else if ((*((_WORD *)v4 + 34) & 0x800) != 0)
  {
    goto LABEL_77;
  }

  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_listeningTime != *((_DWORD *)v4 + 2)) {
      goto LABEL_77;
    }
  }

  else if ((v7 & 1) != 0)
  {
    goto LABEL_77;
  }

  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_receivingTime != *((_DWORD *)v4 + 3)) {
      goto LABEL_77;
    }
  }

  else if ((v7 & 2) != 0)
  {
    goto LABEL_77;
  }

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 34) & 0x400) == 0 || self->_transmittingTime != *((_DWORD *)v4 + 12)) {
      goto LABEL_77;
    }
    BOOL v8 = 1;
  }

  else
  {
    BOOL v8 = (v7 & 0x400) == 0;
  }

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    uint64_t v3 = 2654435761LL * self->_rttMinVal;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761LL * self->_rttMaxVal;
      if ((has & 0x80) != 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }

  else
  {
    uint64_t v3 = 0LL;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_3;
    }
  }

  uint64_t v4 = 0LL;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761LL * self->_rttAvgVal;
    if ((has & 0x40) != 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 34);
  if ((v5 & 0x200) != 0)
  {
    self->_rttMinVal = *((_DWORD *)v4 + 11);
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v5 = *((_WORD *)v4 + 34);
    if ((v5 & 0x100) == 0)
    {
LABEL_3:
      if ((v5 & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }

  else if ((*((_WORD *)v4 + 34) & 0x100) == 0)
  {
    goto LABEL_3;
  }

  self->_rttMaxVal = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 34);
  if ((v5 & 0x80) == 0)
  {
LABEL_4:
    if ((v5 & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }

- (unsigned)rttMinVal
{
  return self->_rttMinVal;
}

- (unsigned)rttMaxVal
{
  return self->_rttMaxVal;
}

- (unsigned)rttAvgVal
{
  return self->_rttAvgVal;
}

- (unsigned)rtt90perc
{
  return self->_rtt90perc;
}

- (unsigned)retryIntervalMin
{
  return self->_retryIntervalMin;
}

- (unsigned)retryIntervalMax
{
  return self->_retryIntervalMax;
}

- (unsigned)retryIntervalAvg
{
  return self->_retryIntervalAvg;
}

- (unsigned)retryInterval90perc
{
  return self->_retryInterval90perc;
}

- (unsigned)txDelayMin
{
  return self->_txDelayMin;
}

- (unsigned)txDelayMax
{
  return self->_txDelayMax;
}

- (unsigned)txDelayAvg
{
  return self->_txDelayAvg;
}

- (unsigned)txDelay90perc
{
  return self->_txDelay90perc;
}

- (unsigned)listeningTime
{
  return self->_listeningTime;
}

- (unsigned)receivingTime
{
  return self->_receivingTime;
}

- (unsigned)transmittingTime
{
  return self->_transmittingTime;
}

@end