@interface AWDCountersIpv6S
- (BOOL)hasRxFailure;
- (BOOL)hasRxSuccess;
- (BOOL)hasRxSuccessRate;
- (BOOL)hasTxAppPktSucess;
- (BOOL)hasTxDelayavg;
- (BOOL)hasTxDelaymax;
- (BOOL)hasTxDelaymin;
- (BOOL)hasTxFailure;
- (BOOL)hasTxSuccess;
- (BOOL)hasTxSuccessRate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)rxFailure;
- (unsigned)rxSuccess;
- (unsigned)rxSuccessRate;
- (unsigned)txAppPktSucess;
- (unsigned)txDelayavg;
- (unsigned)txDelaymax;
- (unsigned)txDelaymin;
- (unsigned)txFailure;
- (unsigned)txSuccess;
- (unsigned)txSuccessRate;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRxFailure:(BOOL)a3;
- (void)setHasRxSuccess:(BOOL)a3;
- (void)setHasRxSuccessRate:(BOOL)a3;
- (void)setHasTxAppPktSucess:(BOOL)a3;
- (void)setHasTxDelayavg:(BOOL)a3;
- (void)setHasTxDelaymax:(BOOL)a3;
- (void)setHasTxDelaymin:(BOOL)a3;
- (void)setHasTxFailure:(BOOL)a3;
- (void)setHasTxSuccess:(BOOL)a3;
- (void)setHasTxSuccessRate:(BOOL)a3;
- (void)setRxFailure:(unsigned int)a3;
- (void)setRxSuccess:(unsigned int)a3;
- (void)setRxSuccessRate:(unsigned int)a3;
- (void)setTxAppPktSucess:(unsigned int)a3;
- (void)setTxDelayavg:(unsigned int)a3;
- (void)setTxDelaymax:(unsigned int)a3;
- (void)setTxDelaymin:(unsigned int)a3;
- (void)setTxFailure:(unsigned int)a3;
- (void)setTxSuccess:(unsigned int)a3;
- (void)setTxSuccessRate:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCountersIpv6S

- (void)setTxSuccess:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_txSuccess = a3;
}

- (void)setHasTxSuccess:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTxSuccess
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setTxFailure:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_txFailure = a3;
}

- (void)setHasTxFailure:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTxFailure
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setRxSuccess:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_rxSuccess = a3;
}

- (void)setHasRxSuccess:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasRxSuccess
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setRxFailure:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_rxFailure = a3;
}

- (void)setHasRxFailure:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasRxFailure
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setTxAppPktSucess:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_txAppPktSucess = a3;
}

- (void)setHasTxAppPktSucess:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasTxAppPktSucess
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setTxDelaymin:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_txDelaymin = a3;
}

- (void)setHasTxDelaymin:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTxDelaymin
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setTxDelaymax:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_txDelaymax = a3;
}

- (void)setHasTxDelaymax:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasTxDelaymax
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setTxDelayavg:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_txDelayavg = a3;
}

- (void)setHasTxDelayavg:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasTxDelayavg
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setTxSuccessRate:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_txSuccessRate = a3;
}

- (void)setHasTxSuccessRate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTxSuccessRate
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setRxSuccessRate:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_rxSuccessRate = a3;
}

- (void)setHasRxSuccessRate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasRxSuccessRate
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AWDCountersIpv6S;
  id v3 = -[AWDCountersIpv6S description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AWDCountersIpv6S dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_txSuccess));
    [v3 setObject:v7 forKey:@"tx_success"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }

  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_txFailure));
  [v3 setObject:v8 forKey:@"tx_failure"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }

- (BOOL)readFrom:(id)a3
{
  return sub_10007CE14((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_txSuccess, 1LL);
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }

  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteUint32Field(v5, self->_txFailure, 2LL);
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }

- (void)copyTo:(id)a3
{
  v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v4[10] = self->_txSuccess;
    *((_WORD *)v4 + 24) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }

  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }

  v4[9] = self->_txFailure;
  *((_WORD *)v4 + 24) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((_DWORD *)result + 10) = self->_txSuccess;
    *((_WORD *)result + 24) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }

  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)result + 9) = self->_txFailure;
  *((_WORD *)result + 24) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)v4 + 24);
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 24) & 0x100) == 0 || self->_txSuccess != *((_DWORD *)v4 + 10)) {
      goto LABEL_52;
    }
  }

  else if ((*((_WORD *)v4 + 24) & 0x100) != 0)
  {
LABEL_52:
    BOOL v8 = 0;
    goto LABEL_53;
  }

  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_txFailure != *((_DWORD *)v4 + 9)) {
      goto LABEL_52;
    }
  }

  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_52;
  }

  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_rxSuccess != *((_DWORD *)v4 + 3)) {
      goto LABEL_52;
    }
  }

  else if ((v7 & 2) != 0)
  {
    goto LABEL_52;
  }

  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_rxFailure != *((_DWORD *)v4 + 2)) {
      goto LABEL_52;
    }
  }

  else if ((v7 & 1) != 0)
  {
    goto LABEL_52;
  }

  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_txAppPktSucess != *((_DWORD *)v4 + 5)) {
      goto LABEL_52;
    }
  }

  else if ((v7 & 8) != 0)
  {
    goto LABEL_52;
  }

  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_txDelaymin != *((_DWORD *)v4 + 8)) {
      goto LABEL_52;
    }
  }

  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_52;
  }

  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_txDelaymax != *((_DWORD *)v4 + 7)) {
      goto LABEL_52;
    }
  }

  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_52;
  }

  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_txDelayavg != *((_DWORD *)v4 + 6)) {
      goto LABEL_52;
    }
  }

  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_52;
  }

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 24) & 0x200) == 0 || self->_txSuccessRate != *((_DWORD *)v4 + 11)) {
      goto LABEL_52;
    }
  }

  else if ((*((_WORD *)v4 + 24) & 0x200) != 0)
  {
    goto LABEL_52;
  }

  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_rxSuccessRate != *((_DWORD *)v4 + 4)) {
      goto LABEL_52;
    }
    BOOL v8 = 1;
  }

  else
  {
    BOOL v8 = (v7 & 4) == 0;
  }

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    uint64_t v3 = 2654435761LL * self->_txSuccess;
    if ((has & 0x80) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761LL * self->_txFailure;
      if ((has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }

  else
  {
    uint64_t v3 = 0LL;
    if ((has & 0x80) != 0) {
      goto LABEL_3;
    }
  }

  uint64_t v4 = 0LL;
  if ((has & 2) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761LL * self->_rxSuccess;
    if ((has & 1) != 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x100) != 0)
  {
    self->_txSuccess = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v5 = *((_WORD *)v4 + 24);
    if ((v5 & 0x80) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }

  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_3;
  }

  self->_txFailure = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }

- (unsigned)txSuccess
{
  return self->_txSuccess;
}

- (unsigned)txFailure
{
  return self->_txFailure;
}

- (unsigned)rxSuccess
{
  return self->_rxSuccess;
}

- (unsigned)rxFailure
{
  return self->_rxFailure;
}

- (unsigned)txAppPktSucess
{
  return self->_txAppPktSucess;
}

- (unsigned)txDelaymin
{
  return self->_txDelaymin;
}

- (unsigned)txDelaymax
{
  return self->_txDelaymax;
}

- (unsigned)txDelayavg
{
  return self->_txDelayavg;
}

- (unsigned)txSuccessRate
{
  return self->_txSuccessRate;
}

- (unsigned)rxSuccessRate
{
  return self->_rxSuccessRate;
}

@end