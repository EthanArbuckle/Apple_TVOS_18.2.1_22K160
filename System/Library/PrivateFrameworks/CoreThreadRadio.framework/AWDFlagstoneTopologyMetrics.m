@interface AWDFlagstoneTopologyMetrics
- (AWDHeaderInfoS)header;
- (BOOL)hasHeader;
- (BOOL)hasMaxChangeinNodeCount;
- (BOOL)hasPercTopologyChangeTimeInstances;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)fEDCountsCount;
- (unint64_t)hash;
- (unint64_t)nodeCountsCount;
- (unint64_t)routerCountsCount;
- (unint64_t)sEDCountsCount;
- (unint64_t)timestamp;
- (unsigned)fEDCountAtIndex:(unint64_t)a3;
- (unsigned)fEDCounts;
- (unsigned)maxChangeinNodeCount;
- (unsigned)nodeCountAtIndex:(unint64_t)a3;
- (unsigned)nodeCounts;
- (unsigned)percTopologyChangeTimeInstances;
- (unsigned)routerCountAtIndex:(unint64_t)a3;
- (unsigned)routerCounts;
- (unsigned)sEDCountAtIndex:(unint64_t)a3;
- (unsigned)sEDCounts;
- (void)addFEDCount:(unsigned int)a3;
- (void)addNodeCount:(unsigned int)a3;
- (void)addRouterCount:(unsigned int)a3;
- (void)addSEDCount:(unsigned int)a3;
- (void)clearFEDCounts;
- (void)clearNodeCounts;
- (void)clearRouterCounts;
- (void)clearSEDCounts;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setFEDCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setHasMaxChangeinNodeCount:(BOOL)a3;
- (void)setHasPercTopologyChangeTimeInstances:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHeader:(id)a3;
- (void)setMaxChangeinNodeCount:(unsigned int)a3;
- (void)setNodeCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setPercTopologyChangeTimeInstances:(unsigned int)a3;
- (void)setRouterCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setSEDCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDFlagstoneTopologyMetrics

- (void)dealloc
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AWDFlagstoneTopologyMetrics;
  -[AWDFlagstoneTopologyMetrics dealloc](&v6, "dealloc");
}

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

- (unint64_t)nodeCountsCount
{
  return self->_nodeCounts.count;
}

- (unsigned)nodeCounts
{
  return self->_nodeCounts.list;
}

- (void)clearNodeCounts
{
}

- (void)addNodeCount:(unsigned int)a3
{
}

- (unsigned)nodeCountAtIndex:(unint64_t)a3
{
  p_nodeCounts = &self->_nodeCounts;
  unint64_t count = self->_nodeCounts.count;
  if (count <= a3)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idx (%lu) is out of range (%lu)",  a3,  count));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSRangeException,  v6,  0LL));
    [v7 raise];
  }

  return p_nodeCounts->list[a3];
}

- (void)setNodeCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)routerCountsCount
{
  return self->_routerCounts.count;
}

- (unsigned)routerCounts
{
  return self->_routerCounts.list;
}

- (void)clearRouterCounts
{
}

- (void)addRouterCount:(unsigned int)a3
{
}

- (unsigned)routerCountAtIndex:(unint64_t)a3
{
  p_routerCounts = &self->_routerCounts;
  unint64_t count = self->_routerCounts.count;
  if (count <= a3)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idx (%lu) is out of range (%lu)",  a3,  count));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSRangeException,  v6,  0LL));
    [v7 raise];
  }

  return p_routerCounts->list[a3];
}

- (void)setRouterCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)fEDCountsCount
{
  return self->_fEDCounts.count;
}

- (unsigned)fEDCounts
{
  return self->_fEDCounts.list;
}

- (void)clearFEDCounts
{
}

- (void)addFEDCount:(unsigned int)a3
{
}

- (unsigned)fEDCountAtIndex:(unint64_t)a3
{
  p_fEDCounts = &self->_fEDCounts;
  unint64_t count = self->_fEDCounts.count;
  if (count <= a3)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idx (%lu) is out of range (%lu)",  a3,  count));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSRangeException,  v6,  0LL));
    [v7 raise];
  }

  return p_fEDCounts->list[a3];
}

- (void)setFEDCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)sEDCountsCount
{
  return self->_sEDCounts.count;
}

- (unsigned)sEDCounts
{
  return self->_sEDCounts.list;
}

- (void)clearSEDCounts
{
}

- (void)addSEDCount:(unsigned int)a3
{
}

- (unsigned)sEDCountAtIndex:(unint64_t)a3
{
  p_sEDCounts = &self->_sEDCounts;
  unint64_t count = self->_sEDCounts.count;
  if (count <= a3)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idx (%lu) is out of range (%lu)",  a3,  count));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSRangeException,  v6,  0LL));
    [v7 raise];
  }

  return p_sEDCounts->list[a3];
}

- (void)setSEDCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setMaxChangeinNodeCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_maxChangeinNodeCount = a3;
}

- (void)setHasMaxChangeinNodeCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMaxChangeinNodeCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setPercTopologyChangeTimeInstances:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_percTopologyChangeTimeInstances = a3;
}

- (void)setHasPercTopologyChangeTimeInstances:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPercTopologyChangeTimeInstances
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AWDFlagstoneTopologyMetrics;
  id v3 = -[AWDFlagstoneTopologyMetrics description](&v8, "description");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AWDFlagstoneTopologyMetrics dictionaryRepresentation](self, "dictionaryRepresentation"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_timestamp));
    [v3 setObject:v4 forKey:@"timestamp"];
  }

  header = self->_header;
  if (header)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[AWDHeaderInfoS dictionaryRepresentation](header, "dictionaryRepresentation"));
    [v3 setObject:v6 forKey:@"header"];
  }

  uint64_t v7 = PBRepeatedUInt32NSArray(&self->_nodeCounts);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v3 setObject:v8 forKey:@"node_count"];

  uint64_t v9 = PBRepeatedUInt32NSArray(&self->_routerCounts);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v3 setObject:v10 forKey:@"router_count"];

  uint64_t v11 = PBRepeatedUInt32NSArray(&self->_fEDCounts);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v3 setObject:v12 forKey:@"FED_count"];

  uint64_t v13 = PBRepeatedUInt32NSArray(&self->_sEDCounts);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v3 setObject:v14 forKey:@"SED_count"];

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_maxChangeinNodeCount));
    [v3 setObject:v16 forKey:@"maxChangeinNodeCount"];

    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_percTopologyChangeTimeInstances));
    [v3 setObject:v17 forKey:@"percTopologyChangeTimeInstances"];
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
  id v11 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1LL);
    id v4 = v11;
  }

  header = self->_header;
  if (header)
  {
    PBDataWriterWriteSubmessage(v11, header, 2LL);
    id v4 = v11;
  }

  if (self->_nodeCounts.count)
  {
    unint64_t v6 = 0LL;
    do
    {
      PBDataWriterWriteUint32Field(v11, self->_nodeCounts.list[v6], 3LL);
      id v4 = v11;
      ++v6;
    }

    while (v6 < self->_nodeCounts.count);
  }

  if (self->_routerCounts.count)
  {
    unint64_t v7 = 0LL;
    do
    {
      PBDataWriterWriteUint32Field(v11, self->_routerCounts.list[v7], 4LL);
      id v4 = v11;
      ++v7;
    }

    while (v7 < self->_routerCounts.count);
  }

  if (self->_fEDCounts.count)
  {
    unint64_t v8 = 0LL;
    do
    {
      PBDataWriterWriteUint32Field(v11, self->_fEDCounts.list[v8], 5LL);
      id v4 = v11;
      ++v8;
    }

    while (v8 < self->_fEDCounts.count);
  }

  if (self->_sEDCounts.count)
  {
    unint64_t v9 = 0LL;
    do
    {
      PBDataWriterWriteUint32Field(v11, self->_sEDCounts.list[v9], 6LL);
      id v4 = v11;
      ++v9;
    }

    while (v9 < self->_sEDCounts.count);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v11, self->_maxChangeinNodeCount, 7LL);
    id v4 = v11;
    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field(v11, self->_percTopologyChangeTimeInstances, 8LL);
    id v4 = v11;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[13] = self->_timestamp;
    *((_BYTE *)v4 + 128) |= 1u;
  }

  id v18 = v4;
  if (self->_header) {
    objc_msgSend(v4, "setHeader:");
  }
  if (-[AWDFlagstoneTopologyMetrics nodeCountsCount](self, "nodeCountsCount"))
  {
    [v18 clearNodeCounts];
    unint64_t v5 = -[AWDFlagstoneTopologyMetrics nodeCountsCount](self, "nodeCountsCount");
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0LL; i != v6; ++i)
        objc_msgSend( v18,  "addNodeCount:",  -[AWDFlagstoneTopologyMetrics nodeCountAtIndex:](self, "nodeCountAtIndex:", i));
    }
  }

  if (-[AWDFlagstoneTopologyMetrics routerCountsCount](self, "routerCountsCount"))
  {
    [v18 clearRouterCounts];
    unint64_t v8 = -[AWDFlagstoneTopologyMetrics routerCountsCount](self, "routerCountsCount");
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0LL; j != v9; ++j)
        objc_msgSend( v18,  "addRouterCount:",  -[AWDFlagstoneTopologyMetrics routerCountAtIndex:](self, "routerCountAtIndex:", j));
    }
  }

  if (-[AWDFlagstoneTopologyMetrics fEDCountsCount](self, "fEDCountsCount"))
  {
    [v18 clearFEDCounts];
    unint64_t v11 = -[AWDFlagstoneTopologyMetrics fEDCountsCount](self, "fEDCountsCount");
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0LL; k != v12; ++k)
        objc_msgSend(v18, "addFEDCount:", -[AWDFlagstoneTopologyMetrics fEDCountAtIndex:](self, "fEDCountAtIndex:", k));
    }
  }

  if (-[AWDFlagstoneTopologyMetrics sEDCountsCount](self, "sEDCountsCount"))
  {
    [v18 clearSEDCounts];
    unint64_t v14 = -[AWDFlagstoneTopologyMetrics sEDCountsCount](self, "sEDCountsCount");
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t m = 0LL; m != v15; ++m)
        objc_msgSend(v18, "addSEDCount:", -[AWDFlagstoneTopologyMetrics sEDCountAtIndex:](self, "sEDCountAtIndex:", m));
    }
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v18 + 30) = self->_maxChangeinNodeCount;
    *((_BYTE *)v18 + 128) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    *((_DWORD *)v18 + 31) = self->_percTopologyChangeTimeInstances;
    *((_BYTE *)v18 + 128) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[13] = self->_timestamp;
    *((_BYTE *)v5 + 128) |= 1u;
  }

  id v7 = -[AWDHeaderInfoS copyWithZone:](self->_header, "copyWithZone:", a3);
  unint64_t v8 = (void *)v6[14];
  v6[14] = v7;

  PBRepeatedUInt32Copy(v6 + 4, &self->_nodeCounts);
  PBRepeatedUInt32Copy(v6 + 7, &self->_routerCounts);
  PBRepeatedUInt32Copy(v6 + 1, &self->_fEDCounts);
  PBRepeatedUInt32Copy(v6 + 10, &self->_sEDCounts);
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v6 + 30) = self->_maxChangeinNodeCount;
    *((_BYTE *)v6 + 128) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    *((_DWORD *)v6 + 31) = self->_percTopologyChangeTimeInstances;
    *((_BYTE *)v6 + 128) |= 4u;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (char *)a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[128] & 1) == 0 || self->_timestamp != *((void *)v4 + 13)) {
      goto LABEL_23;
    }
  }

  else if ((v4[128] & 1) != 0)
  {
LABEL_23:
    BOOL v7 = 0;
    goto LABEL_24;
  }

  header = self->_header;
  if ((header || *((void *)v4 + 14)) && !-[AWDHeaderInfoS isEqual:](header, "isEqual:", *((void *)v4 + 14))
    || !PBRepeatedUInt32IsEqual(&self->_nodeCounts, v4 + 32)
    || !PBRepeatedUInt32IsEqual(&self->_routerCounts, v4 + 56)
    || !PBRepeatedUInt32IsEqual(&self->_fEDCounts, v4 + 8)
    || !PBRepeatedUInt32IsEqual(&self->_sEDCounts, v4 + 80))
  {
    goto LABEL_23;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[128] & 2) == 0 || self->_maxChangeinNodeCount != *((_DWORD *)v4 + 30)) {
      goto LABEL_23;
    }
  }

  else if ((v4[128] & 2) != 0)
  {
    goto LABEL_23;
  }

  BOOL v7 = (v4[128] & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[128] & 4) == 0 || self->_percTopologyChangeTimeInstances != *((_DWORD *)v4 + 31)) {
      goto LABEL_23;
    }
    BOOL v7 = 1;
  }

- (unint64_t)hash
{
  unint64_t v2 = self;
  if ((*(_BYTE *)(self + 128) & 1) == 0)
  {
    uint64_t v3 = 0LL;
    goto LABEL_5;
  }

  unint64_t v4 = *(void *)(self + 104);
  if (is_mul_ok(v4, 0x9E3779B1uLL))
  {
    uint64_t v3 = 2654435761u * v4;
LABEL_5:
    unint64_t v5 = (unint64_t)[*(id *)(self + 112) hash];
    uint64_t v7 = PBRepeatedUInt32Hash(v2 + 32, v6);
    uint64_t v9 = PBRepeatedUInt32Hash(v2 + 56, v8);
    uint64_t v11 = PBRepeatedUInt32Hash(v2 + 8, v10);
    uint64_t v13 = PBRepeatedUInt32Hash(v2 + 80, v12);
    if ((*(_BYTE *)(v2 + 128) & 2) != 0)
    {
      uint64_t v14 = 2654435761LL * *(unsigned int *)(v2 + 120);
      if ((*(_BYTE *)(v2 + 128) & 4) != 0) {
        goto LABEL_7;
      }
    }

    else
    {
      uint64_t v14 = 0LL;
      if ((*(_BYTE *)(v2 + 128) & 4) != 0)
      {
LABEL_7:
        uint64_t v15 = 2654435761LL * *(unsigned int *)(v2 + 124);
        return v5 ^ v3 ^ v7 ^ v9 ^ v11 ^ v13 ^ v14 ^ v15;
      }
    }

    uint64_t v15 = 0LL;
    return v5 ^ v3 ^ v7 ^ v9 ^ v11 ^ v13 ^ v14 ^ v15;
  }

  __break(0x550Cu);
  return self;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  unint64_t v5 = v4;
  if ((v4[16] & 1) != 0)
  {
    self->_timestamp = v4[13];
    *(_BYTE *)&self->_has |= 1u;
  }

  header = self->_header;
  uint64_t v7 = v5[14];
  id v21 = v5;
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
    -[AWDFlagstoneTopologyMetrics setHeader:](self, "setHeader:");
  }

  unint64_t v5 = v21;
LABEL_9:
  uint64_t v8 = (char *)[v5 nodeCountsCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t i = 0LL; i != v9; ++i)
      -[AWDFlagstoneTopologyMetrics addNodeCount:](self, "addNodeCount:", [v21 nodeCountAtIndex:i]);
  }

  uint64_t v11 = (char *)[v21 routerCountsCount];
  if (v11)
  {
    uint64_t v12 = v11;
    for (uint64_t j = 0LL; j != v12; ++j)
      -[AWDFlagstoneTopologyMetrics addRouterCount:]( self,  "addRouterCount:",  [v21 routerCountAtIndex:j]);
  }

  uint64_t v14 = (char *)[v21 fEDCountsCount];
  if (v14)
  {
    uint64_t v15 = v14;
    for (uint64_t k = 0LL; k != v15; ++k)
      -[AWDFlagstoneTopologyMetrics addFEDCount:](self, "addFEDCount:", [v21 fEDCountAtIndex:k]);
  }

  v17 = (char *)[v21 sEDCountsCount];
  if (v17)
  {
    id v18 = v17;
    for (uint64_t m = 0LL; m != v18; ++m)
      -[AWDFlagstoneTopologyMetrics addSEDCount:](self, "addSEDCount:", [v21 sEDCountAtIndex:m]);
  }

  char v20 = *((_BYTE *)v21 + 128);
  if ((v20 & 2) != 0)
  {
    self->_maxChangeinNodeCount = *((_DWORD *)v21 + 30);
    *(_BYTE *)&self->_has |= 2u;
    char v20 = *((_BYTE *)v21 + 128);
  }

  if ((v20 & 4) != 0)
  {
    self->_percTopologyChangeTimeInstances = *((_DWORD *)v21 + 31);
    *(_BYTE *)&self->_has |= 4u;
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

- (unsigned)maxChangeinNodeCount
{
  return self->_maxChangeinNodeCount;
}

- (unsigned)percTopologyChangeTimeInstances
{
  return self->_percTopologyChangeTimeInstances;
}

- (void).cxx_destruct
{
}

@end