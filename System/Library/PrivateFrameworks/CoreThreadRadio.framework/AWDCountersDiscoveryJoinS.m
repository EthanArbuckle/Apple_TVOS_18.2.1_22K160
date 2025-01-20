@interface AWDCountersDiscoveryJoinS
- (AWDCountersJoinerS)sCntrsJoiner;
- (BOOL)hasSCntrsJoiner;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)accessoryNodesCountHistogramsCount;
- (unint64_t)hash;
- (unsigned)accessoryNodesCountHistogramAtIndex:(unint64_t)a3;
- (unsigned)accessoryNodesCountHistograms;
- (void)addAccessoryNodesCountHistogram:(unsigned int)a3;
- (void)clearAccessoryNodesCountHistograms;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAccessoryNodesCountHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setSCntrsJoiner:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCountersDiscoveryJoinS

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AWDCountersDiscoveryJoinS;
  -[AWDCountersDiscoveryJoinS dealloc](&v3, "dealloc");
}

- (unint64_t)accessoryNodesCountHistogramsCount
{
  return self->_accessoryNodesCountHistograms.count;
}

- (unsigned)accessoryNodesCountHistograms
{
  return self->_accessoryNodesCountHistograms.list;
}

- (void)clearAccessoryNodesCountHistograms
{
}

- (void)addAccessoryNodesCountHistogram:(unsigned int)a3
{
}

- (unsigned)accessoryNodesCountHistogramAtIndex:(unint64_t)a3
{
  p_accessoryNodesCountHistograms = &self->_accessoryNodesCountHistograms;
  unint64_t count = self->_accessoryNodesCountHistograms.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idx (%lu) is out of range (%lu)",  a3,  count));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSRangeException,  v6,  0LL));
    [v7 raise];
  }

  return p_accessoryNodesCountHistograms->list[a3];
}

- (void)setAccessoryNodesCountHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (BOOL)hasSCntrsJoiner
{
  return self->_sCntrsJoiner != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AWDCountersDiscoveryJoinS;
  id v3 = -[AWDCountersDiscoveryJoinS description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AWDCountersDiscoveryJoinS dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v4 = PBRepeatedUInt32NSArray(&self->_accessoryNodesCountHistograms);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 setObject:v5 forKey:@"accessory_nodes_count_histogram"];

  sCntrsJoiner = self->_sCntrsJoiner;
  if (sCntrsJoiner)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AWDCountersJoinerS dictionaryRepresentation](sCntrsJoiner, "dictionaryRepresentation"));
    [v3 setObject:v7 forKey:@"s_cntrs_joiner"];
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
  if (self->_accessoryNodesCountHistograms.count)
  {
    unint64_t v5 = 0LL;
    do
    {
      PBDataWriterWriteUint32Field(v7, self->_accessoryNodesCountHistograms.list[v5], 1LL);
      id v4 = v7;
      ++v5;
    }

    while (v5 < self->_accessoryNodesCountHistograms.count);
  }

  sCntrsJoiner = self->_sCntrsJoiner;
  if (sCntrsJoiner)
  {
    PBDataWriterWriteSubmessage(v7, sCntrsJoiner, 2LL);
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v7 = a3;
  if (-[AWDCountersDiscoveryJoinS accessoryNodesCountHistogramsCount](self, "accessoryNodesCountHistogramsCount"))
  {
    [v7 clearAccessoryNodesCountHistograms];
    unint64_t v4 = -[AWDCountersDiscoveryJoinS accessoryNodesCountHistogramsCount](self, "accessoryNodesCountHistogramsCount");
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0LL; i != v5; ++i)
        objc_msgSend( v7,  "addAccessoryNodesCountHistogram:",  -[AWDCountersDiscoveryJoinS accessoryNodesCountHistogramAtIndex:]( self,  "accessoryNodesCountHistogramAtIndex:",  i));
    }
  }

  if (self->_sCntrsJoiner) {
    objc_msgSend(v7, "setSCntrsJoiner:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  PBRepeatedUInt32Copy(v5 + 1, &self->_accessoryNodesCountHistograms);
  id v6 = -[AWDCountersJoinerS copyWithZone:](self->_sCntrsJoiner, "copyWithZone:", a3);
  id v7 = (void *)v5[4];
  v5[4] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && PBRepeatedUInt32IsEqual(&self->_accessoryNodesCountHistograms, v4 + 1))
  {
    sCntrsJoiner = self->_sCntrsJoiner;
    if (sCntrsJoiner || v4[4]) {
      unsigned __int8 v7 = -[AWDCountersJoinerS isEqual:](sCntrsJoiner, "isEqual:", v4[4]);
    }
    else {
      unsigned __int8 v7 = 1;
    }
  }

  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = PBRepeatedUInt32Hash(&self->_accessoryNodesCountHistograms, a2);
  return -[AWDCountersJoinerS hash](self->_sCntrsJoiner, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  v10 = a3;
  unint64_t v4 = (char *)[v10 accessoryNodesCountHistogramsCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0LL; i != v5; ++i)
      -[AWDCountersDiscoveryJoinS addAccessoryNodesCountHistogram:]( self,  "addAccessoryNodesCountHistogram:",  [v10 accessoryNodesCountHistogramAtIndex:i]);
  }

  sCntrsJoiner = self->_sCntrsJoiner;
  objc_super v8 = v10;
  uint64_t v9 = v10[4];
  if (sCntrsJoiner)
  {
    if (v9)
    {
      -[AWDCountersJoinerS mergeFrom:](sCntrsJoiner, "mergeFrom:");
LABEL_9:
      objc_super v8 = v10;
    }
  }

  else if (v9)
  {
    -[AWDCountersDiscoveryJoinS setSCntrsJoiner:](self, "setSCntrsJoiner:");
    goto LABEL_9;
  }
}

- (AWDCountersJoinerS)sCntrsJoiner
{
  return self->_sCntrsJoiner;
}

- (void)setSCntrsJoiner:(id)a3
{
}

- (void).cxx_destruct
{
}

@end