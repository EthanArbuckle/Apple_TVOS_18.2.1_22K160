@interface AWDCountersJoinerS
- (BOOL)hasJoinAttempts;
- (BOOL)hasJoinSuccessRate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)joinSuccessRate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)attachFailLatencyHistogramsCount;
- (unint64_t)attachLatencyHistogramsCount;
- (unint64_t)hash;
- (unint64_t)joinerFailLatencyHistogramsCount;
- (unint64_t)joinerLatencyHistogramsCount;
- (unsigned)attachFailLatencyHistogramAtIndex:(unint64_t)a3;
- (unsigned)attachFailLatencyHistograms;
- (unsigned)attachLatencyHistogramAtIndex:(unint64_t)a3;
- (unsigned)attachLatencyHistograms;
- (unsigned)joinAttempts;
- (unsigned)joinerFailLatencyHistogramAtIndex:(unint64_t)a3;
- (unsigned)joinerFailLatencyHistograms;
- (unsigned)joinerLatencyHistogramAtIndex:(unint64_t)a3;
- (unsigned)joinerLatencyHistograms;
- (void)addAttachFailLatencyHistogram:(unsigned int)a3;
- (void)addAttachLatencyHistogram:(unsigned int)a3;
- (void)addJoinerFailLatencyHistogram:(unsigned int)a3;
- (void)addJoinerLatencyHistogram:(unsigned int)a3;
- (void)clearAttachFailLatencyHistograms;
- (void)clearAttachLatencyHistograms;
- (void)clearJoinerFailLatencyHistograms;
- (void)clearJoinerLatencyHistograms;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAttachFailLatencyHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setAttachLatencyHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setHasJoinAttempts:(BOOL)a3;
- (void)setHasJoinSuccessRate:(BOOL)a3;
- (void)setJoinAttempts:(unsigned int)a3;
- (void)setJoinSuccessRate:(float)a3;
- (void)setJoinerFailLatencyHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setJoinerLatencyHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation AWDCountersJoinerS

- (void)dealloc
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AWDCountersJoinerS;
  -[AWDCountersJoinerS dealloc](&v6, "dealloc");
}

- (void)setJoinSuccessRate:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_joinSuccessRate = a3;
}

- (void)setHasJoinSuccessRate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasJoinSuccessRate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setJoinAttempts:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_joinAttempts = a3;
}

- (void)setHasJoinAttempts:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasJoinAttempts
{
  return *(_BYTE *)&self->_has & 1;
}

- (unint64_t)attachLatencyHistogramsCount
{
  return self->_attachLatencyHistograms.count;
}

- (unsigned)attachLatencyHistograms
{
  return self->_attachLatencyHistograms.list;
}

- (void)clearAttachLatencyHistograms
{
}

- (void)addAttachLatencyHistogram:(unsigned int)a3
{
}

- (unsigned)attachLatencyHistogramAtIndex:(unint64_t)a3
{
  p_attachLatencyHistograms = &self->_attachLatencyHistograms;
  unint64_t count = self->_attachLatencyHistograms.count;
  if (count <= a3)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idx (%lu) is out of range (%lu)",  a3,  count));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSRangeException,  v6,  0LL));
    [v7 raise];
  }

  return p_attachLatencyHistograms->list[a3];
}

- (void)setAttachLatencyHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)joinerLatencyHistogramsCount
{
  return self->_joinerLatencyHistograms.count;
}

- (unsigned)joinerLatencyHistograms
{
  return self->_joinerLatencyHistograms.list;
}

- (void)clearJoinerLatencyHistograms
{
}

- (void)addJoinerLatencyHistogram:(unsigned int)a3
{
}

- (unsigned)joinerLatencyHistogramAtIndex:(unint64_t)a3
{
  p_joinerLatencyHistograms = &self->_joinerLatencyHistograms;
  unint64_t count = self->_joinerLatencyHistograms.count;
  if (count <= a3)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idx (%lu) is out of range (%lu)",  a3,  count));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSRangeException,  v6,  0LL));
    [v7 raise];
  }

  return p_joinerLatencyHistograms->list[a3];
}

- (void)setJoinerLatencyHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)attachFailLatencyHistogramsCount
{
  return self->_attachFailLatencyHistograms.count;
}

- (unsigned)attachFailLatencyHistograms
{
  return self->_attachFailLatencyHistograms.list;
}

- (void)clearAttachFailLatencyHistograms
{
}

- (void)addAttachFailLatencyHistogram:(unsigned int)a3
{
}

- (unsigned)attachFailLatencyHistogramAtIndex:(unint64_t)a3
{
  p_attachFailLatencyHistograms = &self->_attachFailLatencyHistograms;
  unint64_t count = self->_attachFailLatencyHistograms.count;
  if (count <= a3)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idx (%lu) is out of range (%lu)",  a3,  count));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSRangeException,  v6,  0LL));
    [v7 raise];
  }

  return p_attachFailLatencyHistograms->list[a3];
}

- (void)setAttachFailLatencyHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)joinerFailLatencyHistogramsCount
{
  return self->_joinerFailLatencyHistograms.count;
}

- (unsigned)joinerFailLatencyHistograms
{
  return self->_joinerFailLatencyHistograms.list;
}

- (void)clearJoinerFailLatencyHistograms
{
}

- (void)addJoinerFailLatencyHistogram:(unsigned int)a3
{
}

- (unsigned)joinerFailLatencyHistogramAtIndex:(unint64_t)a3
{
  p_joinerFailLatencyHistograms = &self->_joinerFailLatencyHistograms;
  unint64_t count = self->_joinerFailLatencyHistograms.count;
  if (count <= a3)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idx (%lu) is out of range (%lu)",  a3,  count));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSRangeException,  v6,  0LL));
    [v7 raise];
  }

  return p_joinerFailLatencyHistograms->list[a3];
}

- (void)setJoinerFailLatencyHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AWDCountersJoinerS;
  id v3 = -[AWDCountersJoinerS description](&v8, "description");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AWDCountersJoinerS dictionaryRepresentation](self, "dictionaryRepresentation"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(float *)&double v4 = self->_joinSuccessRate;
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v4));
    [v3 setObject:v6 forKey:@"join_success_rate"];

    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_joinAttempts));
    [v3 setObject:v7 forKey:@"join_attempts"];
  }

  uint64_t v8 = PBRepeatedUInt32NSArray(&self->_attachLatencyHistograms);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v3 setObject:v9 forKey:@"attach_latency_histogram"];

  uint64_t v10 = PBRepeatedUInt32NSArray(&self->_joinerLatencyHistograms);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  [v3 setObject:v11 forKey:@"joiner_latency_histogram"];

  uint64_t v12 = PBRepeatedUInt32NSArray(&self->_attachFailLatencyHistograms);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [v3 setObject:v13 forKey:@"attach_fail_latency_histogram"];

  uint64_t v14 = PBRepeatedUInt32NSArray(&self->_joinerFailLatencyHistograms);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  [v3 setObject:v15 forKey:@"joiner_fail_latency_histogram"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000FB730((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v11 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField(v4, 1LL, self->_joinSuccessRate);
    id v4 = v11;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v11, self->_joinAttempts, 2LL);
    id v4 = v11;
  }

  if (self->_attachLatencyHistograms.count)
  {
    unint64_t v6 = 0LL;
    do
    {
      PBDataWriterWriteUint32Field(v11, self->_attachLatencyHistograms.list[v6], 3LL);
      id v4 = v11;
      ++v6;
    }

    while (v6 < self->_attachLatencyHistograms.count);
  }

  if (self->_joinerLatencyHistograms.count)
  {
    unint64_t v7 = 0LL;
    do
    {
      PBDataWriterWriteUint32Field(v11, self->_joinerLatencyHistograms.list[v7], 4LL);
      id v4 = v11;
      ++v7;
    }

    while (v7 < self->_joinerLatencyHistograms.count);
  }

  if (self->_attachFailLatencyHistograms.count)
  {
    unint64_t v8 = 0LL;
    do
    {
      PBDataWriterWriteUint32Field(v11, self->_attachFailLatencyHistograms.list[v8], 5LL);
      id v4 = v11;
      ++v8;
    }

    while (v8 < self->_attachFailLatencyHistograms.count);
  }

  p_joinerFailLatencyHistograms = &self->_joinerFailLatencyHistograms;
  if (p_joinerFailLatencyHistograms->count)
  {
    unint64_t v10 = 0LL;
    do
    {
      PBDataWriterWriteUint32Field(v11, p_joinerFailLatencyHistograms->list[v10], 6LL);
      id v4 = v11;
      ++v10;
    }

    while (v10 < p_joinerFailLatencyHistograms->count);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[27] = LODWORD(self->_joinSuccessRate);
    *((_BYTE *)v4 + 112) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v4[26] = self->_joinAttempts;
    *((_BYTE *)v4 + 112) |= 1u;
  }

  id v18 = v4;
  if (-[AWDCountersJoinerS attachLatencyHistogramsCount](self, "attachLatencyHistogramsCount"))
  {
    [v18 clearAttachLatencyHistograms];
    unint64_t v6 = -[AWDCountersJoinerS attachLatencyHistogramsCount](self, "attachLatencyHistogramsCount");
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0LL; i != v7; ++i)
        objc_msgSend( v18,  "addAttachLatencyHistogram:",  -[AWDCountersJoinerS attachLatencyHistogramAtIndex:](self, "attachLatencyHistogramAtIndex:", i));
    }
  }

  if (-[AWDCountersJoinerS joinerLatencyHistogramsCount](self, "joinerLatencyHistogramsCount"))
  {
    [v18 clearJoinerLatencyHistograms];
    unint64_t v9 = -[AWDCountersJoinerS joinerLatencyHistogramsCount](self, "joinerLatencyHistogramsCount");
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0LL; j != v10; ++j)
        objc_msgSend( v18,  "addJoinerLatencyHistogram:",  -[AWDCountersJoinerS joinerLatencyHistogramAtIndex:](self, "joinerLatencyHistogramAtIndex:", j));
    }
  }

  if (-[AWDCountersJoinerS attachFailLatencyHistogramsCount](self, "attachFailLatencyHistogramsCount"))
  {
    [v18 clearAttachFailLatencyHistograms];
    unint64_t v12 = -[AWDCountersJoinerS attachFailLatencyHistogramsCount](self, "attachFailLatencyHistogramsCount");
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0LL; k != v13; ++k)
        objc_msgSend( v18,  "addAttachFailLatencyHistogram:",  -[AWDCountersJoinerS attachFailLatencyHistogramAtIndex:](self, "attachFailLatencyHistogramAtIndex:", k));
    }
  }

  if (-[AWDCountersJoinerS joinerFailLatencyHistogramsCount](self, "joinerFailLatencyHistogramsCount"))
  {
    [v18 clearJoinerFailLatencyHistograms];
    unint64_t v15 = -[AWDCountersJoinerS joinerFailLatencyHistogramsCount](self, "joinerFailLatencyHistogramsCount");
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t m = 0LL; m != v16; ++m)
        objc_msgSend( v18,  "addJoinerFailLatencyHistogram:",  -[AWDCountersJoinerS joinerFailLatencyHistogramAtIndex:](self, "joinerFailLatencyHistogramAtIndex:", m));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (char *)objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 27) = LODWORD(self->_joinSuccessRate);
    v4[112] |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 26) = self->_joinAttempts;
    v4[112] |= 1u;
  }

  PBRepeatedUInt32Copy(v4 + 32, &self->_attachLatencyHistograms);
  PBRepeatedUInt32Copy(v5 + 80, &self->_joinerLatencyHistograms);
  PBRepeatedUInt32Copy(v5 + 8, &self->_attachFailLatencyHistograms);
  PBRepeatedUInt32Copy(v5 + 56, &self->_joinerFailLatencyHistograms);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (char *)a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
  }

  else if ((v4[112] & 2) != 0)
  {
LABEL_16:
    char IsEqual = 0;
    goto LABEL_17;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[112] & 1) == 0 || self->_joinAttempts != *((_DWORD *)v4 + 26)) {
      goto LABEL_16;
    }
  }

  else if ((v4[112] & 1) != 0)
  {
    goto LABEL_16;
  }

  if (!PBRepeatedUInt32IsEqual(&self->_attachLatencyHistograms, v4 + 32)
    || !PBRepeatedUInt32IsEqual(&self->_joinerLatencyHistograms, v4 + 80)
    || !PBRepeatedUInt32IsEqual(&self->_attachFailLatencyHistograms, v4 + 8))
  {
    goto LABEL_16;
  }

  char IsEqual = PBRepeatedUInt32IsEqual(&self->_joinerFailLatencyHistograms, v4 + 56);
LABEL_17:

  return IsEqual;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    float joinSuccessRate = self->_joinSuccessRate;
    if (joinSuccessRate >= 0.0) {
      float v6 = self->_joinSuccessRate;
    }
    else {
      float v6 = -joinSuccessRate;
    }
    float v7 = floorf(v6 + 0.5);
    unint64_t v9 = (unint64_t)fmodf(v7, 1.8447e19);
    if (!is_mul_ok(v9, 0x9E3779B1uLL))
    {
      __break(0x550Cu);
      goto LABEL_18;
    }

    float v10 = (float)(v6 - v7) * 1.8447e19;
    uint64_t v4 = 2654435761u * v9;
    BOOL v11 = v10 <= 0.0;
    if (v10 < 0.0)
    {
      float v10 = fabsf(v10);
      uint64_t v12 = -(uint64_t)(unint64_t)v10;
      BOOL v11 = ((unint64_t)v10 & 0x8000000000000000LL) == 0LL;
      if (!(unint64_t)v10)
      {
LABEL_12:
        BOOL v13 = __CFADD__(v4, v12);
        v4 += v12;
        if (!v13) {
          goto LABEL_13;
        }
LABEL_18:
        __break(0x5500u);
        return result;
      }

      __break(0x550Du);
    }

    if (v11) {
      goto LABEL_13;
    }
    uint64_t v12 = (unint64_t)v10;
    goto LABEL_12;
  }

  uint64_t v4 = 0LL;
LABEL_13:
  if ((has & 1) != 0) {
    uint64_t v14 = 2654435761LL * self->_joinAttempts;
  }
  else {
    uint64_t v14 = 0LL;
  }
  uint64_t v15 = v14 ^ v4 ^ PBRepeatedUInt32Hash(&self->_attachLatencyHistograms, a2);
  uint64_t v17 = PBRepeatedUInt32Hash(&self->_joinerLatencyHistograms, v16);
  uint64_t v19 = v15 ^ v17 ^ PBRepeatedUInt32Hash(&self->_attachFailLatencyHistograms, v18);
  return v19 ^ PBRepeatedUInt32Hash(&self->_joinerFailLatencyHistograms, v20);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((_BYTE *)v4 + 112);
  if ((v5 & 2) != 0)
  {
    self->_float joinSuccessRate = *((float *)v4 + 27);
    *(_BYTE *)&self->_has |= 2u;
    char v5 = *((_BYTE *)v4 + 112);
  }

  if ((v5 & 1) != 0)
  {
    self->_joinAttempts = *((_DWORD *)v4 + 26);
    *(_BYTE *)&self->_has |= 1u;
  }

  id v18 = v4;
  float v6 = (char *)[v4 attachLatencyHistogramsCount];
  if (v6)
  {
    float v7 = v6;
    for (uint64_t i = 0LL; i != v7; ++i)
      -[AWDCountersJoinerS addAttachLatencyHistogram:]( self,  "addAttachLatencyHistogram:",  [v18 attachLatencyHistogramAtIndex:i]);
  }

  unint64_t v9 = (char *)[v18 joinerLatencyHistogramsCount];
  if (v9)
  {
    float v10 = v9;
    for (uint64_t j = 0LL; j != v10; ++j)
      -[AWDCountersJoinerS addJoinerLatencyHistogram:]( self,  "addJoinerLatencyHistogram:",  [v18 joinerLatencyHistogramAtIndex:j]);
  }

  uint64_t v12 = (char *)[v18 attachFailLatencyHistogramsCount];
  if (v12)
  {
    BOOL v13 = v12;
    for (uint64_t k = 0LL; k != v13; ++k)
      -[AWDCountersJoinerS addAttachFailLatencyHistogram:]( self,  "addAttachFailLatencyHistogram:",  [v18 attachFailLatencyHistogramAtIndex:k]);
  }

  uint64_t v15 = (char *)[v18 joinerFailLatencyHistogramsCount];
  if (v15)
  {
    uint64_t v16 = v15;
    for (uint64_t m = 0LL; m != v16; ++m)
      -[AWDCountersJoinerS addJoinerFailLatencyHistogram:]( self,  "addJoinerFailLatencyHistogram:",  [v18 joinerFailLatencyHistogramAtIndex:m]);
  }
}

- (float)joinSuccessRate
{
  return self->_joinSuccessRate;
}

- (unsigned)joinAttempts
{
  return self->_joinAttempts;
}

@end