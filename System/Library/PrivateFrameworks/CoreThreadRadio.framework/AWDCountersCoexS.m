@interface AWDCountersCoexS
- (BOOL)hasCoexRxDeniedRequests;
- (BOOL)hasCoexRxGrantedRequests;
- (BOOL)hasCoexRxRequests;
- (BOOL)hasCoexTxDeniedRequests;
- (BOOL)hasCoexTxGrantedRequests;
- (BOOL)hasCoexTxRequests;
- (BOOL)hasCoexUnsolicitedGrants;
- (BOOL)hasRxDeniedReqPercentage;
- (BOOL)hasRxGrantedReqPercentage;
- (BOOL)hasTxDeniedReqPercentage;
- (BOOL)hasTxGrantedReqPercentage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)coexRxGrantTimeHistogramsCount;
- (unint64_t)coexTxGrantTimeHistogramsCount;
- (unint64_t)hash;
- (unsigned)coexRxDeniedRequests;
- (unsigned)coexRxGrantTimeHistogramAtIndex:(unint64_t)a3;
- (unsigned)coexRxGrantTimeHistograms;
- (unsigned)coexRxGrantedRequests;
- (unsigned)coexRxRequests;
- (unsigned)coexTxDeniedRequests;
- (unsigned)coexTxGrantTimeHistogramAtIndex:(unint64_t)a3;
- (unsigned)coexTxGrantTimeHistograms;
- (unsigned)coexTxGrantedRequests;
- (unsigned)coexTxRequests;
- (unsigned)coexUnsolicitedGrants;
- (unsigned)rxDeniedReqPercentage;
- (unsigned)rxGrantedReqPercentage;
- (unsigned)txDeniedReqPercentage;
- (unsigned)txGrantedReqPercentage;
- (void)addCoexRxGrantTimeHistogram:(unsigned int)a3;
- (void)addCoexTxGrantTimeHistogram:(unsigned int)a3;
- (void)clearCoexRxGrantTimeHistograms;
- (void)clearCoexTxGrantTimeHistograms;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCoexRxDeniedRequests:(unsigned int)a3;
- (void)setCoexRxGrantTimeHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setCoexRxGrantedRequests:(unsigned int)a3;
- (void)setCoexRxRequests:(unsigned int)a3;
- (void)setCoexTxDeniedRequests:(unsigned int)a3;
- (void)setCoexTxGrantTimeHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setCoexTxGrantedRequests:(unsigned int)a3;
- (void)setCoexTxRequests:(unsigned int)a3;
- (void)setCoexUnsolicitedGrants:(unsigned int)a3;
- (void)setHasCoexRxDeniedRequests:(BOOL)a3;
- (void)setHasCoexRxGrantedRequests:(BOOL)a3;
- (void)setHasCoexRxRequests:(BOOL)a3;
- (void)setHasCoexTxDeniedRequests:(BOOL)a3;
- (void)setHasCoexTxGrantedRequests:(BOOL)a3;
- (void)setHasCoexTxRequests:(BOOL)a3;
- (void)setHasCoexUnsolicitedGrants:(BOOL)a3;
- (void)setHasRxDeniedReqPercentage:(BOOL)a3;
- (void)setHasRxGrantedReqPercentage:(BOOL)a3;
- (void)setHasTxDeniedReqPercentage:(BOOL)a3;
- (void)setHasTxGrantedReqPercentage:(BOOL)a3;
- (void)setRxDeniedReqPercentage:(unsigned int)a3;
- (void)setRxGrantedReqPercentage:(unsigned int)a3;
- (void)setTxDeniedReqPercentage:(unsigned int)a3;
- (void)setTxGrantedReqPercentage:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCountersCoexS

- (void)dealloc
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AWDCountersCoexS;
  -[AWDCountersCoexS dealloc](&v4, "dealloc");
}

- (void)setCoexUnsolicitedGrants:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_coexUnsolicitedGrants = a3;
}

- (void)setHasCoexUnsolicitedGrants:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasCoexUnsolicitedGrants
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setCoexTxRequests:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_coexTxRequests = a3;
}

- (void)setHasCoexTxRequests:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasCoexTxRequests
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setCoexTxGrantedRequests:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_coexTxGrantedRequests = a3;
}

- (void)setHasCoexTxGrantedRequests:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasCoexTxGrantedRequests
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setCoexTxDeniedRequests:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_coexTxDeniedRequests = a3;
}

- (void)setHasCoexTxDeniedRequests:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasCoexTxDeniedRequests
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setCoexRxRequests:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_coexRxRequests = a3;
}

- (void)setHasCoexRxRequests:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCoexRxRequests
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setCoexRxGrantedRequests:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_coexRxGrantedRequests = a3;
}

- (void)setHasCoexRxGrantedRequests:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCoexRxGrantedRequests
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setCoexRxDeniedRequests:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_coexRxDeniedRequests = a3;
}

- (void)setHasCoexRxDeniedRequests:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCoexRxDeniedRequests
{
  return *(_WORD *)&self->_has & 1;
}

- (unint64_t)coexRxGrantTimeHistogramsCount
{
  return self->_coexRxGrantTimeHistograms.count;
}

- (unsigned)coexRxGrantTimeHistograms
{
  return self->_coexRxGrantTimeHistograms.list;
}

- (void)clearCoexRxGrantTimeHistograms
{
}

- (void)addCoexRxGrantTimeHistogram:(unsigned int)a3
{
}

- (unsigned)coexRxGrantTimeHistogramAtIndex:(unint64_t)a3
{
  p_coexRxGrantTimeHistograms = &self->_coexRxGrantTimeHistograms;
  unint64_t count = self->_coexRxGrantTimeHistograms.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idx (%lu) is out of range (%lu)",  a3,  count));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSRangeException,  v6,  0LL));
    [v7 raise];
  }

  return p_coexRxGrantTimeHistograms->list[a3];
}

- (void)setCoexRxGrantTimeHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)coexTxGrantTimeHistogramsCount
{
  return self->_coexTxGrantTimeHistograms.count;
}

- (unsigned)coexTxGrantTimeHistograms
{
  return self->_coexTxGrantTimeHistograms.list;
}

- (void)clearCoexTxGrantTimeHistograms
{
}

- (void)addCoexTxGrantTimeHistogram:(unsigned int)a3
{
}

- (unsigned)coexTxGrantTimeHistogramAtIndex:(unint64_t)a3
{
  p_coexTxGrantTimeHistograms = &self->_coexTxGrantTimeHistograms;
  unint64_t count = self->_coexTxGrantTimeHistograms.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idx (%lu) is out of range (%lu)",  a3,  count));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSRangeException,  v6,  0LL));
    [v7 raise];
  }

  return p_coexTxGrantTimeHistograms->list[a3];
}

- (void)setCoexTxGrantTimeHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setTxGrantedReqPercentage:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_txGrantedReqPercentage = a3;
}

- (void)setHasTxGrantedReqPercentage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasTxGrantedReqPercentage
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setRxGrantedReqPercentage:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_rxGrantedReqPercentage = a3;
}

- (void)setHasRxGrantedReqPercentage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRxGrantedReqPercentage
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setTxDeniedReqPercentage:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_txDeniedReqPercentage = a3;
}

- (void)setHasTxDeniedReqPercentage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTxDeniedReqPercentage
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setRxDeniedReqPercentage:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_rxDeniedReqPercentage = a3;
}

- (void)setHasRxDeniedReqPercentage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRxDeniedReqPercentage
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AWDCountersCoexS;
  id v3 = -[AWDCountersCoexS description](&v8, "description");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AWDCountersCoexS dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_coexUnsolicitedGrants));
    [v3 setObject:v13 forKey:@"coex_unsolicited_grants"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }

  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_coexTxRequests));
  [v3 setObject:v14 forKey:@"coex_tx_requests"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }

- (BOOL)readFrom:(id)a3
{
  return sub_1000FEF48((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  id v9 = v4;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_coexUnsolicitedGrants, 1LL);
    id v4 = v9;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }

  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteUint32Field(v9, self->_coexTxRequests, 2LL);
  id v4 = v9;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v4[20] = self->_coexUnsolicitedGrants;
    *((_WORD *)v4 + 50) |= 0x40u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }

  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }

  v4[19] = self->_coexTxRequests;
  *((_WORD *)v4 + 50) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5 = v4;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v4[20] = self->_coexUnsolicitedGrants;
    *((_WORD *)v4 + 50) |= 0x40u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }

  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }

  v4[19] = self->_coexTxRequests;
  *((_WORD *)v4 + 50) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = (char *)a3;
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)v4 + 50);
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_coexUnsolicitedGrants != *((_DWORD *)v4 + 20)) {
      goto LABEL_59;
    }
  }

  else if ((v7 & 0x40) != 0)
  {
LABEL_59:
    BOOL v10 = 0;
    goto LABEL_60;
  }

  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_coexTxRequests != *((_DWORD *)v4 + 19)) {
      goto LABEL_59;
    }
  }

  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_59;
  }

  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_coexTxGrantedRequests != *((_DWORD *)v4 + 18)) {
      goto LABEL_59;
    }
  }

  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_59;
  }

  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_coexTxDeniedRequests != *((_DWORD *)v4 + 17)) {
      goto LABEL_59;
    }
  }

  else if ((v7 & 8) != 0)
  {
    goto LABEL_59;
  }

  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_coexRxRequests != *((_DWORD *)v4 + 16)) {
      goto LABEL_59;
    }
  }

  else if ((v7 & 4) != 0)
  {
    goto LABEL_59;
  }

  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_coexRxGrantedRequests != *((_DWORD *)v4 + 15)) {
      goto LABEL_59;
    }
  }

  else if ((v7 & 2) != 0)
  {
    goto LABEL_59;
  }

  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_coexRxDeniedRequests != *((_DWORD *)v4 + 14)) {
      goto LABEL_59;
    }
  }

  else if ((v7 & 1) != 0)
  {
    goto LABEL_59;
  }

  if (!PBRepeatedUInt32IsEqual(&self->_coexRxGrantTimeHistograms, v4 + 8)
    || !PBRepeatedUInt32IsEqual(&self->_coexTxGrantTimeHistograms, v4 + 32))
  {
    goto LABEL_59;
  }

  __int16 v8 = (__int16)self->_has;
  __int16 v9 = *((_WORD *)v4 + 50);
  if ((v8 & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 50) & 0x400) == 0 || self->_txGrantedReqPercentage != *((_DWORD *)v4 + 24)) {
      goto LABEL_59;
    }
  }

  else if ((*((_WORD *)v4 + 50) & 0x400) != 0)
  {
    goto LABEL_59;
  }

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 50) & 0x100) == 0 || self->_rxGrantedReqPercentage != *((_DWORD *)v4 + 22)) {
      goto LABEL_59;
    }
  }

  else if ((*((_WORD *)v4 + 50) & 0x100) != 0)
  {
    goto LABEL_59;
  }

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 50) & 0x200) == 0 || self->_txDeniedReqPercentage != *((_DWORD *)v4 + 23)) {
      goto LABEL_59;
    }
  }

  else if ((*((_WORD *)v4 + 50) & 0x200) != 0)
  {
    goto LABEL_59;
  }

  if ((v8 & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_rxDeniedReqPercentage != *((_DWORD *)v4 + 21)) {
      goto LABEL_59;
    }
    BOOL v10 = 1;
  }

  else
  {
    BOOL v10 = (v9 & 0x80) == 0;
  }

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    uint64_t v19 = 2654435761LL * self->_coexUnsolicitedGrants;
    if ((has & 0x20) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761LL * self->_coexTxRequests;
      if ((has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }

  else
  {
    uint64_t v19 = 0LL;
    if ((has & 0x20) != 0) {
      goto LABEL_3;
    }
  }

  uint64_t v4 = 0LL;
  if ((has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761LL * self->_coexTxGrantedRequests;
    if ((has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 50);
  if ((v5 & 0x40) != 0)
  {
    self->_coexUnsolicitedGrants = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v5 = *((_WORD *)v4 + 50);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }

  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_3;
  }

  self->_coexTxRequests = *((_DWORD *)v4 + 19);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 50);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }

- (unsigned)coexUnsolicitedGrants
{
  return self->_coexUnsolicitedGrants;
}

- (unsigned)coexTxRequests
{
  return self->_coexTxRequests;
}

- (unsigned)coexTxGrantedRequests
{
  return self->_coexTxGrantedRequests;
}

- (unsigned)coexTxDeniedRequests
{
  return self->_coexTxDeniedRequests;
}

- (unsigned)coexRxRequests
{
  return self->_coexRxRequests;
}

- (unsigned)coexRxGrantedRequests
{
  return self->_coexRxGrantedRequests;
}

- (unsigned)coexRxDeniedRequests
{
  return self->_coexRxDeniedRequests;
}

- (unsigned)txGrantedReqPercentage
{
  return self->_txGrantedReqPercentage;
}

- (unsigned)rxGrantedReqPercentage
{
  return self->_rxGrantedReqPercentage;
}

- (unsigned)txDeniedReqPercentage
{
  return self->_txDeniedReqPercentage;
}

- (unsigned)rxDeniedReqPercentage
{
  return self->_rxDeniedReqPercentage;
}

@end