@interface AWDCountersNetworkS
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)channelSelectionsHistogramsCount;
- (unint64_t)frameTxpowerHistogramsCount;
- (unint64_t)hash;
- (unint64_t)nbrBatteryExtensionFactorHistogramsCount;
- (unint64_t)nbrTxpowerHistogramsCount;
- (unint64_t)packetLqiHistogramsCount;
- (unint64_t)packetRssiNbrAccessoryHistogramsCount;
- (unint64_t)packetRssiNbrRouterHistogramsCount;
- (unsigned)channelSelectionsHistogramAtIndex:(unint64_t)a3;
- (unsigned)channelSelectionsHistograms;
- (unsigned)frameTxpowerHistogramAtIndex:(unint64_t)a3;
- (unsigned)frameTxpowerHistograms;
- (unsigned)nbrBatteryExtensionFactorHistogramAtIndex:(unint64_t)a3;
- (unsigned)nbrBatteryExtensionFactorHistograms;
- (unsigned)nbrTxpowerHistogramAtIndex:(unint64_t)a3;
- (unsigned)nbrTxpowerHistograms;
- (unsigned)packetLqiHistogramAtIndex:(unint64_t)a3;
- (unsigned)packetLqiHistograms;
- (unsigned)packetRssiNbrAccessoryHistogramAtIndex:(unint64_t)a3;
- (unsigned)packetRssiNbrAccessoryHistograms;
- (unsigned)packetRssiNbrRouterHistogramAtIndex:(unint64_t)a3;
- (unsigned)packetRssiNbrRouterHistograms;
- (void)addChannelSelectionsHistogram:(unsigned int)a3;
- (void)addFrameTxpowerHistogram:(unsigned int)a3;
- (void)addNbrBatteryExtensionFactorHistogram:(unsigned int)a3;
- (void)addNbrTxpowerHistogram:(unsigned int)a3;
- (void)addPacketLqiHistogram:(unsigned int)a3;
- (void)addPacketRssiNbrAccessoryHistogram:(unsigned int)a3;
- (void)addPacketRssiNbrRouterHistogram:(unsigned int)a3;
- (void)clearChannelSelectionsHistograms;
- (void)clearFrameTxpowerHistograms;
- (void)clearNbrBatteryExtensionFactorHistograms;
- (void)clearNbrTxpowerHistograms;
- (void)clearPacketLqiHistograms;
- (void)clearPacketRssiNbrAccessoryHistograms;
- (void)clearPacketRssiNbrRouterHistograms;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setChannelSelectionsHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setFrameTxpowerHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setNbrBatteryExtensionFactorHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setNbrTxpowerHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setPacketLqiHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setPacketRssiNbrAccessoryHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setPacketRssiNbrRouterHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation AWDCountersNetworkS

- (void)dealloc
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AWDCountersNetworkS;
  -[AWDCountersNetworkS dealloc](&v9, "dealloc");
}

- (unint64_t)packetRssiNbrRouterHistogramsCount
{
  return self->_packetRssiNbrRouterHistograms.count;
}

- (unsigned)packetRssiNbrRouterHistograms
{
  return self->_packetRssiNbrRouterHistograms.list;
}

- (void)clearPacketRssiNbrRouterHistograms
{
}

- (void)addPacketRssiNbrRouterHistogram:(unsigned int)a3
{
}

- (unsigned)packetRssiNbrRouterHistogramAtIndex:(unint64_t)a3
{
  p_packetRssiNbrRouterHistograms = &self->_packetRssiNbrRouterHistograms;
  unint64_t count = self->_packetRssiNbrRouterHistograms.count;
  if (count <= a3)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idx (%lu) is out of range (%lu)",  a3,  count));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSRangeException,  v6,  0LL));
    [v7 raise];
  }

  return p_packetRssiNbrRouterHistograms->list[a3];
}

- (void)setPacketRssiNbrRouterHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)packetRssiNbrAccessoryHistogramsCount
{
  return self->_packetRssiNbrAccessoryHistograms.count;
}

- (unsigned)packetRssiNbrAccessoryHistograms
{
  return self->_packetRssiNbrAccessoryHistograms.list;
}

- (void)clearPacketRssiNbrAccessoryHistograms
{
}

- (void)addPacketRssiNbrAccessoryHistogram:(unsigned int)a3
{
}

- (unsigned)packetRssiNbrAccessoryHistogramAtIndex:(unint64_t)a3
{
  p_packetRssiNbrAccessoryHistograms = &self->_packetRssiNbrAccessoryHistograms;
  unint64_t count = self->_packetRssiNbrAccessoryHistograms.count;
  if (count <= a3)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idx (%lu) is out of range (%lu)",  a3,  count));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSRangeException,  v6,  0LL));
    [v7 raise];
  }

  return p_packetRssiNbrAccessoryHistograms->list[a3];
}

- (void)setPacketRssiNbrAccessoryHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)channelSelectionsHistogramsCount
{
  return self->_channelSelectionsHistograms.count;
}

- (unsigned)channelSelectionsHistograms
{
  return self->_channelSelectionsHistograms.list;
}

- (void)clearChannelSelectionsHistograms
{
}

- (void)addChannelSelectionsHistogram:(unsigned int)a3
{
}

- (unsigned)channelSelectionsHistogramAtIndex:(unint64_t)a3
{
  p_channelSelectionsHistograms = &self->_channelSelectionsHistograms;
  unint64_t count = self->_channelSelectionsHistograms.count;
  if (count <= a3)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idx (%lu) is out of range (%lu)",  a3,  count));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSRangeException,  v6,  0LL));
    [v7 raise];
  }

  return p_channelSelectionsHistograms->list[a3];
}

- (void)setChannelSelectionsHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)packetLqiHistogramsCount
{
  return self->_packetLqiHistograms.count;
}

- (unsigned)packetLqiHistograms
{
  return self->_packetLqiHistograms.list;
}

- (void)clearPacketLqiHistograms
{
}

- (void)addPacketLqiHistogram:(unsigned int)a3
{
}

- (unsigned)packetLqiHistogramAtIndex:(unint64_t)a3
{
  p_packetLqiHistograms = &self->_packetLqiHistograms;
  unint64_t count = self->_packetLqiHistograms.count;
  if (count <= a3)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idx (%lu) is out of range (%lu)",  a3,  count));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSRangeException,  v6,  0LL));
    [v7 raise];
  }

  return p_packetLqiHistograms->list[a3];
}

- (void)setPacketLqiHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)frameTxpowerHistogramsCount
{
  return self->_frameTxpowerHistograms.count;
}

- (unsigned)frameTxpowerHistograms
{
  return self->_frameTxpowerHistograms.list;
}

- (void)clearFrameTxpowerHistograms
{
}

- (void)addFrameTxpowerHistogram:(unsigned int)a3
{
}

- (unsigned)frameTxpowerHistogramAtIndex:(unint64_t)a3
{
  p_frameTxpowerHistograms = &self->_frameTxpowerHistograms;
  unint64_t count = self->_frameTxpowerHistograms.count;
  if (count <= a3)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idx (%lu) is out of range (%lu)",  a3,  count));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSRangeException,  v6,  0LL));
    [v7 raise];
  }

  return p_frameTxpowerHistograms->list[a3];
}

- (void)setFrameTxpowerHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)nbrTxpowerHistogramsCount
{
  return self->_nbrTxpowerHistograms.count;
}

- (unsigned)nbrTxpowerHistograms
{
  return self->_nbrTxpowerHistograms.list;
}

- (void)clearNbrTxpowerHistograms
{
}

- (void)addNbrTxpowerHistogram:(unsigned int)a3
{
}

- (unsigned)nbrTxpowerHistogramAtIndex:(unint64_t)a3
{
  p_nbrTxpowerHistograms = &self->_nbrTxpowerHistograms;
  unint64_t count = self->_nbrTxpowerHistograms.count;
  if (count <= a3)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idx (%lu) is out of range (%lu)",  a3,  count));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSRangeException,  v6,  0LL));
    [v7 raise];
  }

  return p_nbrTxpowerHistograms->list[a3];
}

- (void)setNbrTxpowerHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)nbrBatteryExtensionFactorHistogramsCount
{
  return self->_nbrBatteryExtensionFactorHistograms.count;
}

- (unsigned)nbrBatteryExtensionFactorHistograms
{
  return self->_nbrBatteryExtensionFactorHistograms.list;
}

- (void)clearNbrBatteryExtensionFactorHistograms
{
}

- (void)addNbrBatteryExtensionFactorHistogram:(unsigned int)a3
{
}

- (unsigned)nbrBatteryExtensionFactorHistogramAtIndex:(unint64_t)a3
{
  p_nbrBatteryExtensionFactorHistograms = &self->_nbrBatteryExtensionFactorHistograms;
  unint64_t count = self->_nbrBatteryExtensionFactorHistograms.count;
  if (count <= a3)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idx (%lu) is out of range (%lu)",  a3,  count));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSRangeException,  v6,  0LL));
    [v7 raise];
  }

  return p_nbrBatteryExtensionFactorHistograms->list[a3];
}

- (void)setNbrBatteryExtensionFactorHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AWDCountersNetworkS;
  id v3 = -[AWDCountersNetworkS description](&v8, "description");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AWDCountersNetworkS dictionaryRepresentation](self, "dictionaryRepresentation"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v4 = PBRepeatedUInt32NSArray(&self->_packetRssiNbrRouterHistograms);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 setObject:v5 forKey:@"packet_rssi_nbr_router_histogram"];

  uint64_t v6 = PBRepeatedUInt32NSArray(&self->_packetRssiNbrAccessoryHistograms);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v3 setObject:v7 forKey:@"packet_rssi_nbr_accessory_histogram"];

  uint64_t v8 = PBRepeatedUInt32NSArray(&self->_channelSelectionsHistograms);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v3 setObject:v9 forKey:@"channel_selections_histogram"];

  uint64_t v10 = PBRepeatedUInt32NSArray(&self->_packetLqiHistograms);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  [v3 setObject:v11 forKey:@"packet_lqi_histogram"];

  uint64_t v12 = PBRepeatedUInt32NSArray(&self->_frameTxpowerHistograms);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [v3 setObject:v13 forKey:@"frame_txpower_histogram"];

  uint64_t v14 = PBRepeatedUInt32NSArray(&self->_nbrTxpowerHistograms);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  [v3 setObject:v15 forKey:@"nbr_txpower_histogram"];

  uint64_t v16 = PBRepeatedUInt32NSArray(&self->_nbrBatteryExtensionFactorHistograms);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  [v3 setObject:v17 forKey:@"nbr_battery_extension_factor_histogram"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100140C0C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v13 = v4;
  if (self->_packetRssiNbrRouterHistograms.count)
  {
    unint64_t v5 = 0LL;
    do
    {
      PBDataWriterWriteUint32Field(v13, self->_packetRssiNbrRouterHistograms.list[v5], 1LL);
      id v4 = v13;
      ++v5;
    }

    while (v5 < self->_packetRssiNbrRouterHistograms.count);
  }

  if (self->_packetRssiNbrAccessoryHistograms.count)
  {
    unint64_t v6 = 0LL;
    do
    {
      PBDataWriterWriteUint32Field(v13, self->_packetRssiNbrAccessoryHistograms.list[v6], 2LL);
      id v4 = v13;
      ++v6;
    }

    while (v6 < self->_packetRssiNbrAccessoryHistograms.count);
  }

  if (self->_channelSelectionsHistograms.count)
  {
    unint64_t v7 = 0LL;
    do
    {
      PBDataWriterWriteUint32Field(v13, self->_channelSelectionsHistograms.list[v7], 3LL);
      id v4 = v13;
      ++v7;
    }

    while (v7 < self->_channelSelectionsHistograms.count);
  }

  if (self->_packetLqiHistograms.count)
  {
    unint64_t v8 = 0LL;
    do
    {
      PBDataWriterWriteUint32Field(v13, self->_packetLqiHistograms.list[v8], 4LL);
      id v4 = v13;
      ++v8;
    }

    while (v8 < self->_packetLqiHistograms.count);
  }

  if (self->_frameTxpowerHistograms.count)
  {
    unint64_t v9 = 0LL;
    do
    {
      PBDataWriterWriteUint32Field(v13, self->_frameTxpowerHistograms.list[v9], 5LL);
      id v4 = v13;
      ++v9;
    }

    while (v9 < self->_frameTxpowerHistograms.count);
  }

  if (self->_nbrTxpowerHistograms.count)
  {
    unint64_t v10 = 0LL;
    do
    {
      PBDataWriterWriteUint32Field(v13, self->_nbrTxpowerHistograms.list[v10], 6LL);
      id v4 = v13;
      ++v10;
    }

    while (v10 < self->_nbrTxpowerHistograms.count);
  }

  p_nbrBatteryExtensionFactorHistograms = &self->_nbrBatteryExtensionFactorHistograms;
  if (p_nbrBatteryExtensionFactorHistograms->count)
  {
    unint64_t v12 = 0LL;
    do
    {
      PBDataWriterWriteUint32Field(v13, p_nbrBatteryExtensionFactorHistograms->list[v12], 7LL);
      id v4 = v13;
      ++v12;
    }

    while (v12 < p_nbrBatteryExtensionFactorHistograms->count);
  }
}

- (void)copyTo:(id)a3
{
  id v25 = a3;
  if (-[AWDCountersNetworkS packetRssiNbrRouterHistogramsCount](self, "packetRssiNbrRouterHistogramsCount"))
  {
    [v25 clearPacketRssiNbrRouterHistograms];
    unint64_t v4 = -[AWDCountersNetworkS packetRssiNbrRouterHistogramsCount](self, "packetRssiNbrRouterHistogramsCount");
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0LL; i != v5; ++i)
        objc_msgSend( v25,  "addPacketRssiNbrRouterHistogram:",  -[AWDCountersNetworkS packetRssiNbrRouterHistogramAtIndex:](self, "packetRssiNbrRouterHistogramAtIndex:", i));
    }
  }

  if (-[AWDCountersNetworkS packetRssiNbrAccessoryHistogramsCount](self, "packetRssiNbrAccessoryHistogramsCount"))
  {
    [v25 clearPacketRssiNbrAccessoryHistograms];
    unint64_t v7 = -[AWDCountersNetworkS packetRssiNbrAccessoryHistogramsCount](self, "packetRssiNbrAccessoryHistogramsCount");
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0LL; j != v8; ++j)
        objc_msgSend( v25,  "addPacketRssiNbrAccessoryHistogram:",  -[AWDCountersNetworkS packetRssiNbrAccessoryHistogramAtIndex:]( self,  "packetRssiNbrAccessoryHistogramAtIndex:",  j));
    }
  }

  if (-[AWDCountersNetworkS channelSelectionsHistogramsCount](self, "channelSelectionsHistogramsCount"))
  {
    [v25 clearChannelSelectionsHistograms];
    unint64_t v10 = -[AWDCountersNetworkS channelSelectionsHistogramsCount](self, "channelSelectionsHistogramsCount");
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t k = 0LL; k != v11; ++k)
        objc_msgSend( v25,  "addChannelSelectionsHistogram:",  -[AWDCountersNetworkS channelSelectionsHistogramAtIndex:](self, "channelSelectionsHistogramAtIndex:", k));
    }
  }

  if (-[AWDCountersNetworkS packetLqiHistogramsCount](self, "packetLqiHistogramsCount"))
  {
    [v25 clearPacketLqiHistograms];
    unint64_t v13 = -[AWDCountersNetworkS packetLqiHistogramsCount](self, "packetLqiHistogramsCount");
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t m = 0LL; m != v14; ++m)
        objc_msgSend( v25,  "addPacketLqiHistogram:",  -[AWDCountersNetworkS packetLqiHistogramAtIndex:](self, "packetLqiHistogramAtIndex:", m));
    }
  }

  if (-[AWDCountersNetworkS frameTxpowerHistogramsCount](self, "frameTxpowerHistogramsCount"))
  {
    [v25 clearFrameTxpowerHistograms];
    unint64_t v16 = -[AWDCountersNetworkS frameTxpowerHistogramsCount](self, "frameTxpowerHistogramsCount");
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t n = 0LL; n != v17; ++n)
        objc_msgSend( v25,  "addFrameTxpowerHistogram:",  -[AWDCountersNetworkS frameTxpowerHistogramAtIndex:](self, "frameTxpowerHistogramAtIndex:", n));
    }
  }

  if (-[AWDCountersNetworkS nbrTxpowerHistogramsCount](self, "nbrTxpowerHistogramsCount"))
  {
    [v25 clearNbrTxpowerHistograms];
    unint64_t v19 = -[AWDCountersNetworkS nbrTxpowerHistogramsCount](self, "nbrTxpowerHistogramsCount");
    if (v19)
    {
      unint64_t v20 = v19;
      for (iuint64_t i = 0LL; ii != v20; ++ii)
        objc_msgSend( v25,  "addNbrTxpowerHistogram:",  -[AWDCountersNetworkS nbrTxpowerHistogramAtIndex:](self, "nbrTxpowerHistogramAtIndex:", ii));
    }
  }

  if (-[AWDCountersNetworkS nbrBatteryExtensionFactorHistogramsCount](self, "nbrBatteryExtensionFactorHistogramsCount"))
  {
    [v25 clearNbrBatteryExtensionFactorHistograms];
    unint64_t v22 = -[AWDCountersNetworkS nbrBatteryExtensionFactorHistogramsCount]( self,  "nbrBatteryExtensionFactorHistogramsCount");
    if (v22)
    {
      unint64_t v23 = v22;
      for (juint64_t j = 0LL; jj != v23; ++jj)
        objc_msgSend( v25,  "addNbrBatteryExtensionFactorHistogram:",  -[AWDCountersNetworkS nbrBatteryExtensionFactorHistogramAtIndex:]( self,  "nbrBatteryExtensionFactorHistogramAtIndex:",  jj));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = (char *)objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  PBRepeatedUInt32Copy(v4 + 152, &self->_packetRssiNbrRouterHistograms);
  PBRepeatedUInt32Copy(v4 + 128, &self->_packetRssiNbrAccessoryHistograms);
  PBRepeatedUInt32Copy(v4 + 8, &self->_channelSelectionsHistograms);
  PBRepeatedUInt32Copy(v4 + 104, &self->_packetLqiHistograms);
  PBRepeatedUInt32Copy(v4 + 32, &self->_frameTxpowerHistograms);
  PBRepeatedUInt32Copy(v4 + 80, &self->_nbrTxpowerHistograms);
  PBRepeatedUInt32Copy(v4 + 56, &self->_nbrBatteryExtensionFactorHistograms);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (char *)a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && PBRepeatedUInt32IsEqual(&self->_packetRssiNbrRouterHistograms, v4 + 152)
    && PBRepeatedUInt32IsEqual(&self->_packetRssiNbrAccessoryHistograms, v4 + 128)
    && PBRepeatedUInt32IsEqual(&self->_channelSelectionsHistograms, v4 + 8)
    && PBRepeatedUInt32IsEqual(&self->_packetLqiHistograms, v4 + 104)
    && PBRepeatedUInt32IsEqual(&self->_frameTxpowerHistograms, v4 + 32)
    && PBRepeatedUInt32IsEqual(&self->_nbrTxpowerHistograms, v4 + 80))
  {
    char IsEqual = PBRepeatedUInt32IsEqual(&self->_nbrBatteryExtensionFactorHistograms, v4 + 56);
  }

  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3 = PBRepeatedUInt32Hash(&self->_packetRssiNbrRouterHistograms, a2);
  uint64_t v5 = PBRepeatedUInt32Hash(&self->_packetRssiNbrAccessoryHistograms, v4) ^ v3;
  uint64_t v7 = PBRepeatedUInt32Hash(&self->_channelSelectionsHistograms, v6);
  uint64_t v9 = v5 ^ v7 ^ PBRepeatedUInt32Hash(&self->_packetLqiHistograms, v8);
  uint64_t v11 = PBRepeatedUInt32Hash(&self->_frameTxpowerHistograms, v10);
  uint64_t v13 = v11 ^ PBRepeatedUInt32Hash(&self->_nbrTxpowerHistograms, v12);
  return v9 ^ v13 ^ PBRepeatedUInt32Hash(&self->_nbrBatteryExtensionFactorHistograms, v14);
}

- (void)mergeFrom:(id)a3
{
  id v25 = a3;
  uint64_t v4 = (char *)[v25 packetRssiNbrRouterHistogramsCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0LL; i != v5; ++i)
      -[AWDCountersNetworkS addPacketRssiNbrRouterHistogram:]( self,  "addPacketRssiNbrRouterHistogram:",  [v25 packetRssiNbrRouterHistogramAtIndex:i]);
  }

  uint64_t v7 = (char *)[v25 packetRssiNbrAccessoryHistogramsCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t j = 0LL; j != v8; ++j)
      -[AWDCountersNetworkS addPacketRssiNbrAccessoryHistogram:]( self,  "addPacketRssiNbrAccessoryHistogram:",  [v25 packetRssiNbrAccessoryHistogramAtIndex:j]);
  }

  uint64_t v10 = (char *)[v25 channelSelectionsHistogramsCount];
  if (v10)
  {
    uint64_t v11 = v10;
    for (uint64_t k = 0LL; k != v11; ++k)
      -[AWDCountersNetworkS addChannelSelectionsHistogram:]( self,  "addChannelSelectionsHistogram:",  [v25 channelSelectionsHistogramAtIndex:k]);
  }

  uint64_t v13 = (char *)[v25 packetLqiHistogramsCount];
  if (v13)
  {
    uint64_t v14 = v13;
    for (uint64_t m = 0LL; m != v14; ++m)
      -[AWDCountersNetworkS addPacketLqiHistogram:]( self,  "addPacketLqiHistogram:",  [v25 packetLqiHistogramAtIndex:m]);
  }

  unint64_t v16 = (char *)[v25 frameTxpowerHistogramsCount];
  if (v16)
  {
    unint64_t v17 = v16;
    for (uint64_t n = 0LL; n != v17; ++n)
      -[AWDCountersNetworkS addFrameTxpowerHistogram:]( self,  "addFrameTxpowerHistogram:",  [v25 frameTxpowerHistogramAtIndex:n]);
  }

  unint64_t v19 = (char *)[v25 nbrTxpowerHistogramsCount];
  if (v19)
  {
    unint64_t v20 = v19;
    for (iuint64_t i = 0LL; ii != v20; ++ii)
      -[AWDCountersNetworkS addNbrTxpowerHistogram:]( self,  "addNbrTxpowerHistogram:",  [v25 nbrTxpowerHistogramAtIndex:ii]);
  }

  unint64_t v22 = (char *)[v25 nbrBatteryExtensionFactorHistogramsCount];
  if (v22)
  {
    unint64_t v23 = v22;
    for (juint64_t j = 0LL; jj != v23; ++jj)
      -[AWDCountersNetworkS addNbrBatteryExtensionFactorHistogram:]( self,  "addNbrBatteryExtensionFactorHistogram:",  [v25 nbrBatteryExtensionFactorHistogramAtIndex:jj]);
  }
}

@end