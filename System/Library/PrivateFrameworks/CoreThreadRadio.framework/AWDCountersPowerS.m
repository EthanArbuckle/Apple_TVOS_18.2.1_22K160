@interface AWDCountersPowerS
- (BOOL)hasHostWakeupsCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)hostWakeupsCountHistogramsCount;
- (unsigned)hostWakeupsCount;
- (unsigned)hostWakeupsCountHistogramAtIndex:(unint64_t)a3;
- (unsigned)hostWakeupsCountHistograms;
- (void)addHostWakeupsCountHistogram:(unsigned int)a3;
- (void)clearHostWakeupsCountHistograms;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasHostWakeupsCount:(BOOL)a3;
- (void)setHostWakeupsCount:(unsigned int)a3;
- (void)setHostWakeupsCountHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation AWDCountersPowerS

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AWDCountersPowerS;
  -[AWDCountersPowerS dealloc](&v3, "dealloc");
}

- (void)setHostWakeupsCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_hostWakeupsCount = a3;
}

- (void)setHasHostWakeupsCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHostWakeupsCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (unint64_t)hostWakeupsCountHistogramsCount
{
  return self->_hostWakeupsCountHistograms.count;
}

- (unsigned)hostWakeupsCountHistograms
{
  return self->_hostWakeupsCountHistograms.list;
}

- (void)clearHostWakeupsCountHistograms
{
}

- (void)addHostWakeupsCountHistogram:(unsigned int)a3
{
}

- (unsigned)hostWakeupsCountHistogramAtIndex:(unint64_t)a3
{
  p_hostWakeupsCountHistograms = &self->_hostWakeupsCountHistograms;
  unint64_t count = self->_hostWakeupsCountHistograms.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idx (%lu) is out of range (%lu)",  a3,  count));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSRangeException,  v6,  0LL));
    [v7 raise];
  }

  return p_hostWakeupsCountHistograms->list[a3];
}

- (void)setHostWakeupsCountHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AWDCountersPowerS;
  id v3 = -[AWDCountersPowerS description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AWDCountersPowerS dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_hostWakeupsCount));
    [v3 setObject:v4 forKey:@"host_wakeups_count"];
  }

  uint64_t v5 = PBRepeatedUInt32NSArray(&self->_hostWakeupsCountHistograms);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v3 setObject:v6 forKey:@"host_wakeups_count_histogram"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000D24BC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_hostWakeupsCount, 1LL);
    id v4 = v7;
  }

  p_hostWakeupsCountHistograms = &self->_hostWakeupsCountHistograms;
  if (p_hostWakeupsCountHistograms->count)
  {
    unint64_t v6 = 0LL;
    do
    {
      PBDataWriterWriteUint32Field(v7, p_hostWakeupsCountHistograms->list[v6], 2LL);
      id v4 = v7;
      ++v6;
    }

    while (v6 < p_hostWakeupsCountHistograms->count);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[8] = self->_hostWakeupsCount;
    *((_BYTE *)v4 + 36) |= 1u;
  }

  id v8 = v4;
  if (-[AWDCountersPowerS hostWakeupsCountHistogramsCount](self, "hostWakeupsCountHistogramsCount"))
  {
    [v8 clearHostWakeupsCountHistograms];
    unint64_t v5 = -[AWDCountersPowerS hostWakeupsCountHistogramsCount](self, "hostWakeupsCountHistogramsCount");
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0LL; i != v6; ++i)
        objc_msgSend( v8,  "addHostWakeupsCountHistogram:",  -[AWDCountersPowerS hostWakeupsCountHistogramAtIndex:](self, "hostWakeupsCountHistogramAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (char *)objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  unint64_t v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_hostWakeupsCount;
    v4[36] |= 1u;
  }

  PBRepeatedUInt32Copy(v4 + 8, &self->_hostWakeupsCountHistograms);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (char *)a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[36] & 1) == 0 || self->_hostWakeupsCount != *((_DWORD *)v4 + 8)) {
      goto LABEL_8;
    }
  }

  else if ((v4[36] & 1) != 0)
  {
LABEL_8:
    char IsEqual = 0;
    goto LABEL_9;
  }

  char IsEqual = PBRepeatedUInt32IsEqual(&self->_hostWakeupsCountHistograms, v4 + 8);
LABEL_9:

  return IsEqual;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v2 = 2654435761LL * self->_hostWakeupsCount;
  }
  else {
    uint64_t v2 = 0LL;
  }
  return PBRepeatedUInt32Hash(&self->_hostWakeupsCountHistograms, a2) ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((v4[9] & 1) != 0)
  {
    self->_hostWakeupsCount = v4[8];
    *(_BYTE *)&self->_has |= 1u;
  }

  id v8 = v4;
  uint64_t v5 = (char *)[v4 hostWakeupsCountHistogramsCount];
  if (v5)
  {
    unint64_t v6 = v5;
    for (uint64_t i = 0LL; i != v6; ++i)
      -[AWDCountersPowerS addHostWakeupsCountHistogram:]( self,  "addHostWakeupsCountHistogram:",  [v8 hostWakeupsCountHistogramAtIndex:i]);
  }
}

- (unsigned)hostWakeupsCount
{
  return self->_hostWakeupsCount;
}

@end