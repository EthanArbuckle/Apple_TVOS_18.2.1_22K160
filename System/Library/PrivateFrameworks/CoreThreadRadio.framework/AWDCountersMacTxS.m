@interface AWDCountersMacTxS
- (BOOL)hasCslLossOfSyncDueToCslTimeout;
- (BOOL)hasCslLossOfSyncDueToMaxRetx;
- (BOOL)hasCslTxErrAbort;
- (BOOL)hasCslTxErrBusyChannel;
- (BOOL)hasCslTxErrCca;
- (BOOL)hasCslTxErrNoack;
- (BOOL)hasCslTxTotal;
- (BOOL)hasTxBroadcast;
- (BOOL)hasTxData;
- (BOOL)hasTxDirectMaxRetryExpiry;
- (BOOL)hasTxErrAbort;
- (BOOL)hasTxErrAbortPercentage;
- (BOOL)hasTxErrBusyChannel;
- (BOOL)hasTxErrBusyChannelPercentage;
- (BOOL)hasTxErrCca;
- (BOOL)hasTxErrCcaPercentage;
- (BOOL)hasTxErrPercentage;
- (BOOL)hasTxIndirectMaxRetryExpiry;
- (BOOL)hasTxTotal;
- (BOOL)hasTxUnicast;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)txCcaEnergyDetectedHistogramsCount;
- (unint64_t)txCsmaBackoffHistogramsCount;
- (unint64_t)txDirectChannelaccessfailureHistogramsCount;
- (unint64_t)txDirectNoackHistogramsCount;
- (unint64_t)txDirectRetryAttemptsHistogramsCount;
- (unint64_t)txIndirectRetryAttemptsHistogramsCount;
- (unint64_t)txPacketCountHistogramsCount;
- (unsigned)cslLossOfSyncDueToCslTimeout;
- (unsigned)cslLossOfSyncDueToMaxRetx;
- (unsigned)cslTxErrAbort;
- (unsigned)cslTxErrBusyChannel;
- (unsigned)cslTxErrCca;
- (unsigned)cslTxErrNoack;
- (unsigned)cslTxTotal;
- (unsigned)txBroadcast;
- (unsigned)txCcaEnergyDetectedHistogramAtIndex:(unint64_t)a3;
- (unsigned)txCcaEnergyDetectedHistograms;
- (unsigned)txCsmaBackoffHistogramAtIndex:(unint64_t)a3;
- (unsigned)txCsmaBackoffHistograms;
- (unsigned)txData;
- (unsigned)txDirectChannelaccessfailureHistogramAtIndex:(unint64_t)a3;
- (unsigned)txDirectChannelaccessfailureHistograms;
- (unsigned)txDirectMaxRetryExpiry;
- (unsigned)txDirectNoackHistogramAtIndex:(unint64_t)a3;
- (unsigned)txDirectNoackHistograms;
- (unsigned)txDirectRetryAttemptsHistogramAtIndex:(unint64_t)a3;
- (unsigned)txDirectRetryAttemptsHistograms;
- (unsigned)txErrAbort;
- (unsigned)txErrAbortPercentage;
- (unsigned)txErrBusyChannel;
- (unsigned)txErrBusyChannelPercentage;
- (unsigned)txErrCca;
- (unsigned)txErrCcaPercentage;
- (unsigned)txErrPercentage;
- (unsigned)txIndirectMaxRetryExpiry;
- (unsigned)txIndirectRetryAttemptsHistogramAtIndex:(unint64_t)a3;
- (unsigned)txIndirectRetryAttemptsHistograms;
- (unsigned)txPacketCountHistogramAtIndex:(unint64_t)a3;
- (unsigned)txPacketCountHistograms;
- (unsigned)txTotal;
- (unsigned)txUnicast;
- (void)addTxCcaEnergyDetectedHistogram:(unsigned int)a3;
- (void)addTxCsmaBackoffHistogram:(unsigned int)a3;
- (void)addTxDirectChannelaccessfailureHistogram:(unsigned int)a3;
- (void)addTxDirectNoackHistogram:(unsigned int)a3;
- (void)addTxDirectRetryAttemptsHistogram:(unsigned int)a3;
- (void)addTxIndirectRetryAttemptsHistogram:(unsigned int)a3;
- (void)addTxPacketCountHistogram:(unsigned int)a3;
- (void)clearTxCcaEnergyDetectedHistograms;
- (void)clearTxCsmaBackoffHistograms;
- (void)clearTxDirectChannelaccessfailureHistograms;
- (void)clearTxDirectNoackHistograms;
- (void)clearTxDirectRetryAttemptsHistograms;
- (void)clearTxIndirectRetryAttemptsHistograms;
- (void)clearTxPacketCountHistograms;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCslLossOfSyncDueToCslTimeout:(unsigned int)a3;
- (void)setCslLossOfSyncDueToMaxRetx:(unsigned int)a3;
- (void)setCslTxErrAbort:(unsigned int)a3;
- (void)setCslTxErrBusyChannel:(unsigned int)a3;
- (void)setCslTxErrCca:(unsigned int)a3;
- (void)setCslTxErrNoack:(unsigned int)a3;
- (void)setCslTxTotal:(unsigned int)a3;
- (void)setHasCslLossOfSyncDueToCslTimeout:(BOOL)a3;
- (void)setHasCslLossOfSyncDueToMaxRetx:(BOOL)a3;
- (void)setHasCslTxErrAbort:(BOOL)a3;
- (void)setHasCslTxErrBusyChannel:(BOOL)a3;
- (void)setHasCslTxErrCca:(BOOL)a3;
- (void)setHasCslTxErrNoack:(BOOL)a3;
- (void)setHasCslTxTotal:(BOOL)a3;
- (void)setHasTxBroadcast:(BOOL)a3;
- (void)setHasTxData:(BOOL)a3;
- (void)setHasTxDirectMaxRetryExpiry:(BOOL)a3;
- (void)setHasTxErrAbort:(BOOL)a3;
- (void)setHasTxErrAbortPercentage:(BOOL)a3;
- (void)setHasTxErrBusyChannel:(BOOL)a3;
- (void)setHasTxErrBusyChannelPercentage:(BOOL)a3;
- (void)setHasTxErrCca:(BOOL)a3;
- (void)setHasTxErrCcaPercentage:(BOOL)a3;
- (void)setHasTxErrPercentage:(BOOL)a3;
- (void)setHasTxIndirectMaxRetryExpiry:(BOOL)a3;
- (void)setHasTxTotal:(BOOL)a3;
- (void)setHasTxUnicast:(BOOL)a3;
- (void)setTxBroadcast:(unsigned int)a3;
- (void)setTxCcaEnergyDetectedHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTxCsmaBackoffHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTxData:(unsigned int)a3;
- (void)setTxDirectChannelaccessfailureHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTxDirectMaxRetryExpiry:(unsigned int)a3;
- (void)setTxDirectNoackHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTxDirectRetryAttemptsHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTxErrAbort:(unsigned int)a3;
- (void)setTxErrAbortPercentage:(unsigned int)a3;
- (void)setTxErrBusyChannel:(unsigned int)a3;
- (void)setTxErrBusyChannelPercentage:(unsigned int)a3;
- (void)setTxErrCca:(unsigned int)a3;
- (void)setTxErrCcaPercentage:(unsigned int)a3;
- (void)setTxErrPercentage:(unsigned int)a3;
- (void)setTxIndirectMaxRetryExpiry:(unsigned int)a3;
- (void)setTxIndirectRetryAttemptsHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTxPacketCountHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTxTotal:(unsigned int)a3;
- (void)setTxUnicast:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCountersMacTxS

- (void)dealloc
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AWDCountersMacTxS;
  -[AWDCountersMacTxS dealloc](&v9, "dealloc");
}

- (void)setTxTotal:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_txTotal = a3;
}

- (void)setHasTxTotal:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasTxTotal
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setTxData:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_txData = a3;
}

- (void)setHasTxData:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasTxData
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setTxUnicast:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_txUnicast = a3;
}

- (void)setHasTxUnicast:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasTxUnicast
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setTxBroadcast:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_txBroadcast = a3;
}

- (void)setHasTxBroadcast:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasTxBroadcast
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setTxErrCca:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_txErrCca = a3;
}

- (void)setHasTxErrCca:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasTxErrCca
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setTxErrAbort:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_txErrAbort = a3;
}

- (void)setHasTxErrAbort:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasTxErrAbort
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setTxErrBusyChannel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_txErrBusyChannel = a3;
}

- (void)setHasTxErrBusyChannel:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasTxErrBusyChannel
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setTxDirectMaxRetryExpiry:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_txDirectMaxRetryExpiry = a3;
}

- (void)setHasTxDirectMaxRetryExpiry:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasTxDirectMaxRetryExpiry
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setTxIndirectMaxRetryExpiry:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_txIndirectMaxRetryExpiry = a3;
}

- (void)setHasTxIndirectMaxRetryExpiry:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasTxIndirectMaxRetryExpiry
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (unint64_t)txPacketCountHistogramsCount
{
  return self->_txPacketCountHistograms.count;
}

- (unsigned)txPacketCountHistograms
{
  return self->_txPacketCountHistograms.list;
}

- (void)clearTxPacketCountHistograms
{
}

- (void)addTxPacketCountHistogram:(unsigned int)a3
{
}

- (unsigned)txPacketCountHistogramAtIndex:(unint64_t)a3
{
  p_txPacketCountHistograms = &self->_txPacketCountHistograms;
  unint64_t count = self->_txPacketCountHistograms.count;
  if (count <= a3)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idx (%lu) is out of range (%lu)",  a3,  count));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSRangeException,  v6,  0LL));
    [v7 raise];
  }

  return p_txPacketCountHistograms->list[a3];
}

- (void)setTxPacketCountHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)txDirectRetryAttemptsHistogramsCount
{
  return self->_txDirectRetryAttemptsHistograms.count;
}

- (unsigned)txDirectRetryAttemptsHistograms
{
  return self->_txDirectRetryAttemptsHistograms.list;
}

- (void)clearTxDirectRetryAttemptsHistograms
{
}

- (void)addTxDirectRetryAttemptsHistogram:(unsigned int)a3
{
}

- (unsigned)txDirectRetryAttemptsHistogramAtIndex:(unint64_t)a3
{
  p_txDirectRetryAttemptsHistograms = &self->_txDirectRetryAttemptsHistograms;
  unint64_t count = self->_txDirectRetryAttemptsHistograms.count;
  if (count <= a3)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idx (%lu) is out of range (%lu)",  a3,  count));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSRangeException,  v6,  0LL));
    [v7 raise];
  }

  return p_txDirectRetryAttemptsHistograms->list[a3];
}

- (void)setTxDirectRetryAttemptsHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)txIndirectRetryAttemptsHistogramsCount
{
  return self->_txIndirectRetryAttemptsHistograms.count;
}

- (unsigned)txIndirectRetryAttemptsHistograms
{
  return self->_txIndirectRetryAttemptsHistograms.list;
}

- (void)clearTxIndirectRetryAttemptsHistograms
{
}

- (void)addTxIndirectRetryAttemptsHistogram:(unsigned int)a3
{
}

- (unsigned)txIndirectRetryAttemptsHistogramAtIndex:(unint64_t)a3
{
  p_txIndirectRetryAttemptsHistograms = &self->_txIndirectRetryAttemptsHistograms;
  unint64_t count = self->_txIndirectRetryAttemptsHistograms.count;
  if (count <= a3)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idx (%lu) is out of range (%lu)",  a3,  count));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSRangeException,  v6,  0LL));
    [v7 raise];
  }

  return p_txIndirectRetryAttemptsHistograms->list[a3];
}

- (void)setTxIndirectRetryAttemptsHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)txCcaEnergyDetectedHistogramsCount
{
  return self->_txCcaEnergyDetectedHistograms.count;
}

- (unsigned)txCcaEnergyDetectedHistograms
{
  return self->_txCcaEnergyDetectedHistograms.list;
}

- (void)clearTxCcaEnergyDetectedHistograms
{
}

- (void)addTxCcaEnergyDetectedHistogram:(unsigned int)a3
{
}

- (unsigned)txCcaEnergyDetectedHistogramAtIndex:(unint64_t)a3
{
  p_txCcaEnergyDetectedHistograms = &self->_txCcaEnergyDetectedHistograms;
  unint64_t count = self->_txCcaEnergyDetectedHistograms.count;
  if (count <= a3)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idx (%lu) is out of range (%lu)",  a3,  count));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSRangeException,  v6,  0LL));
    [v7 raise];
  }

  return p_txCcaEnergyDetectedHistograms->list[a3];
}

- (void)setTxCcaEnergyDetectedHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)txDirectNoackHistogramsCount
{
  return self->_txDirectNoackHistograms.count;
}

- (unsigned)txDirectNoackHistograms
{
  return self->_txDirectNoackHistograms.list;
}

- (void)clearTxDirectNoackHistograms
{
}

- (void)addTxDirectNoackHistogram:(unsigned int)a3
{
}

- (unsigned)txDirectNoackHistogramAtIndex:(unint64_t)a3
{
  p_txDirectNoackHistograms = &self->_txDirectNoackHistograms;
  unint64_t count = self->_txDirectNoackHistograms.count;
  if (count <= a3)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idx (%lu) is out of range (%lu)",  a3,  count));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSRangeException,  v6,  0LL));
    [v7 raise];
  }

  return p_txDirectNoackHistograms->list[a3];
}

- (void)setTxDirectNoackHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)txDirectChannelaccessfailureHistogramsCount
{
  return self->_txDirectChannelaccessfailureHistograms.count;
}

- (unsigned)txDirectChannelaccessfailureHistograms
{
  return self->_txDirectChannelaccessfailureHistograms.list;
}

- (void)clearTxDirectChannelaccessfailureHistograms
{
}

- (void)addTxDirectChannelaccessfailureHistogram:(unsigned int)a3
{
}

- (unsigned)txDirectChannelaccessfailureHistogramAtIndex:(unint64_t)a3
{
  p_txDirectChannelaccessfailureHistograms = &self->_txDirectChannelaccessfailureHistograms;
  unint64_t count = self->_txDirectChannelaccessfailureHistograms.count;
  if (count <= a3)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idx (%lu) is out of range (%lu)",  a3,  count));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSRangeException,  v6,  0LL));
    [v7 raise];
  }

  return p_txDirectChannelaccessfailureHistograms->list[a3];
}

- (void)setTxDirectChannelaccessfailureHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)txCsmaBackoffHistogramsCount
{
  return self->_txCsmaBackoffHistograms.count;
}

- (unsigned)txCsmaBackoffHistograms
{
  return self->_txCsmaBackoffHistograms.list;
}

- (void)clearTxCsmaBackoffHistograms
{
}

- (void)addTxCsmaBackoffHistogram:(unsigned int)a3
{
}

- (unsigned)txCsmaBackoffHistogramAtIndex:(unint64_t)a3
{
  p_txCsmaBackoffHistograms = &self->_txCsmaBackoffHistograms;
  unint64_t count = self->_txCsmaBackoffHistograms.count;
  if (count <= a3)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idx (%lu) is out of range (%lu)",  a3,  count));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSRangeException,  v6,  0LL));
    [v7 raise];
  }

  return p_txCsmaBackoffHistograms->list[a3];
}

- (void)setTxCsmaBackoffHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setCslTxTotal:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_cslTxTotal = a3;
}

- (void)setHasCslTxTotal:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasCslTxTotal
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setCslTxErrNoack:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_cslTxErrNoack = a3;
}

- (void)setHasCslTxErrNoack:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasCslTxErrNoack
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setCslTxErrCca:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_cslTxErrCca = a3;
}

- (void)setHasCslTxErrCca:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasCslTxErrCca
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setCslTxErrAbort:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_cslTxErrAbort = a3;
}

- (void)setHasCslTxErrAbort:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasCslTxErrAbort
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCslTxErrBusyChannel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_cslTxErrBusyChannel = a3;
}

- (void)setHasCslTxErrBusyChannel:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasCslTxErrBusyChannel
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setCslLossOfSyncDueToCslTimeout:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_cslLossOfSyncDueToCslTimeout = a3;
}

- (void)setHasCslLossOfSyncDueToCslTimeout:(BOOL)a3
{
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasCslLossOfSyncDueToCslTimeout
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setCslLossOfSyncDueToMaxRetx:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_cslLossOfSyncDueToMaxRetx = a3;
}

- (void)setHasCslLossOfSyncDueToMaxRetx:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasCslLossOfSyncDueToMaxRetx
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTxErrCcaPercentage:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_txErrCcaPercentage = a3;
}

- (void)setHasTxErrCcaPercentage:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasTxErrCcaPercentage
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setTxErrAbortPercentage:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_txErrAbortPercentage = a3;
}

- (void)setHasTxErrAbortPercentage:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasTxErrAbortPercentage
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setTxErrBusyChannelPercentage:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_txErrBusyChannelPercentage = a3;
}

- (void)setHasTxErrBusyChannelPercentage:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasTxErrBusyChannelPercentage
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setTxErrPercentage:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_txErrPercentage = a3;
}

- (void)setHasTxErrPercentage:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasTxErrPercentage
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AWDCountersMacTxS;
  id v3 = -[AWDCountersMacTxS description](&v8, "description");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AWDCountersMacTxS dictionaryRepresentation](self, "dictionaryRepresentation"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_txTotal));
    [v3 setObject:v23 forKey:@"tx_total"];

    $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x80000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }

  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_txData));
  [v3 setObject:v24 forKey:@"tx_data"];

  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }

- (BOOL)readFrom:(id)a3
{
  return sub_100038978((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  id v14 = v4;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_txTotal, 1LL);
    id v4 = v14;
    $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x80000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_47;
    }
  }

  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteUint32Field(v14, self->_txData, 2LL);
  id v4 = v14;
  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_48;
  }

- (void)copyTo:(id)a3
{
  id v4 = a3;
  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    v4[62] = self->_txTotal;
    v4[64] |= 0x40000u;
    $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x80000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_54;
    }
  }

  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }

  v4[52] = self->_txData;
  v4[64] |= 0x100u;
  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_55;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    v4[62] = self->_txTotal;
    v4[64] |= 0x40000u;
    $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x80000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }

  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }

  v4[52] = self->_txData;
  v4[64] |= 0x100u;
  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  int v7 = v4[64];
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_txTotal != v4[62]) {
      goto LABEL_109;
    }
  }

  else if ((v7 & 0x40000) != 0)
  {
LABEL_109:
    BOOL v10 = 0;
    goto LABEL_110;
  }

  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_txData != v4[52]) {
      goto LABEL_109;
    }
  }

  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_109;
  }

  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v7 & 0x80000) == 0 || self->_txUnicast != v4[63]) {
      goto LABEL_109;
    }
  }

  else if ((v7 & 0x80000) != 0)
  {
    goto LABEL_109;
  }

  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_txBroadcast != v4[51]) {
      goto LABEL_109;
    }
  }

  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_109;
  }

  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_txErrCca != v4[58]) {
      goto LABEL_109;
    }
  }

  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_109;
  }

  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_txErrAbort != v4[54]) {
      goto LABEL_109;
    }
  }

  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_109;
  }

  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_txErrBusyChannel != v4[56]) {
      goto LABEL_109;
    }
  }

  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_109;
  }

  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_txDirectMaxRetryExpiry != v4[53]) {
      goto LABEL_109;
    }
  }

  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_109;
  }

  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_txIndirectMaxRetryExpiry != v4[61]) {
      goto LABEL_109;
    }
  }

  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_109;
  }

  if (!PBRepeatedUInt32IsEqual(&self->_txPacketCountHistograms, v4 + 38)
    || !PBRepeatedUInt32IsEqual(&self->_txDirectRetryAttemptsHistograms, v4 + 26)
    || !PBRepeatedUInt32IsEqual(&self->_txIndirectRetryAttemptsHistograms, v4 + 32)
    || !PBRepeatedUInt32IsEqual(&self->_txCcaEnergyDetectedHistograms, v4 + 2)
    || !PBRepeatedUInt32IsEqual(&self->_txDirectNoackHistograms, v4 + 20)
    || !PBRepeatedUInt32IsEqual(&self->_txDirectChannelaccessfailureHistograms, v4 + 14)
    || !PBRepeatedUInt32IsEqual(&self->_txCsmaBackoffHistograms, v4 + 8))
  {
    goto LABEL_109;
  }

  $415C8CA3583A475FE8FFF238EB099507 v8 = self->_has;
  int v9 = v4[64];
  if ((*(_BYTE *)&v8 & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_cslTxTotal != v4[50]) {
      goto LABEL_109;
    }
  }

  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_109;
  }

  if ((*(_BYTE *)&v8 & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_cslTxErrNoack != v4[49]) {
      goto LABEL_109;
    }
  }

  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_109;
  }

  if ((*(_BYTE *)&v8 & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_cslTxErrCca != v4[48]) {
      goto LABEL_109;
    }
  }

  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_109;
  }

  if ((*(_BYTE *)&v8 & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_cslTxErrAbort != v4[46]) {
      goto LABEL_109;
    }
  }

  else if ((v9 & 4) != 0)
  {
    goto LABEL_109;
  }

  if ((*(_BYTE *)&v8 & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_cslTxErrBusyChannel != v4[47]) {
      goto LABEL_109;
    }
  }

  else if ((v9 & 8) != 0)
  {
    goto LABEL_109;
  }

  if ((*(_BYTE *)&v8 & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_cslLossOfSyncDueToCslTimeout != v4[44]) {
      goto LABEL_109;
    }
  }

  else if ((v9 & 1) != 0)
  {
    goto LABEL_109;
  }

  if ((*(_BYTE *)&v8 & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_cslLossOfSyncDueToMaxRetx != v4[45]) {
      goto LABEL_109;
    }
  }

  else if ((v9 & 2) != 0)
  {
    goto LABEL_109;
  }

  if ((*(_WORD *)&v8 & 0x8000) != 0)
  {
    if ((v9 & 0x8000) == 0 || self->_txErrCcaPercentage != v4[59]) {
      goto LABEL_109;
    }
  }

  else if ((v9 & 0x8000) != 0)
  {
    goto LABEL_109;
  }

  if ((*(_WORD *)&v8 & 0x800) != 0)
  {
    if ((v9 & 0x800) == 0 || self->_txErrAbortPercentage != v4[55]) {
      goto LABEL_109;
    }
  }

  else if ((v9 & 0x800) != 0)
  {
    goto LABEL_109;
  }

  if ((*(_WORD *)&v8 & 0x2000) != 0)
  {
    if ((v9 & 0x2000) == 0 || self->_txErrBusyChannelPercentage != v4[57]) {
      goto LABEL_109;
    }
  }

  else if ((v9 & 0x2000) != 0)
  {
    goto LABEL_109;
  }

  if ((*(_DWORD *)&v8 & 0x10000) != 0)
  {
    if ((v9 & 0x10000) == 0 || self->_txErrPercentage != v4[60]) {
      goto LABEL_109;
    }
    BOOL v10 = 1;
  }

  else
  {
    BOOL v10 = (v9 & 0x10000) == 0;
  }

- (unint64_t)hash
{
  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    uint64_t v38 = 2654435761LL * self->_txTotal;
    if ((*(_WORD *)&has & 0x100) != 0)
    {
LABEL_3:
      uint64_t v37 = 2654435761LL * self->_txData;
      if ((*(_DWORD *)&has & 0x80000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }

  else
  {
    uint64_t v38 = 0LL;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_3;
    }
  }

  uint64_t v37 = 0LL;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_4:
    uint64_t v36 = 2654435761LL * self->_txUnicast;
    if ((*(_BYTE *)&has & 0x80) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (unsigned int *)a3;
  unsigned int v5 = v4[64];
  if ((v5 & 0x40000) != 0)
  {
    self->_txTotal = v4[62];
    *(_DWORD *)&self->_has |= 0x40000u;
    unsigned int v5 = v4[64];
    if ((v5 & 0x100) == 0)
    {
LABEL_3:
      if ((v5 & 0x80000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_47;
    }
  }

  else if ((v5 & 0x100) == 0)
  {
    goto LABEL_3;
  }

  self->_txData = v4[52];
  *(_DWORD *)&self->_has |= 0x100u;
  unsigned int v5 = v4[64];
  if ((v5 & 0x80000) == 0)
  {
LABEL_4:
    if ((v5 & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_48;
  }

- (unsigned)txTotal
{
  return self->_txTotal;
}

- (unsigned)txData
{
  return self->_txData;
}

- (unsigned)txUnicast
{
  return self->_txUnicast;
}

- (unsigned)txBroadcast
{
  return self->_txBroadcast;
}

- (unsigned)txErrCca
{
  return self->_txErrCca;
}

- (unsigned)txErrAbort
{
  return self->_txErrAbort;
}

- (unsigned)txErrBusyChannel
{
  return self->_txErrBusyChannel;
}

- (unsigned)txDirectMaxRetryExpiry
{
  return self->_txDirectMaxRetryExpiry;
}

- (unsigned)txIndirectMaxRetryExpiry
{
  return self->_txIndirectMaxRetryExpiry;
}

- (unsigned)cslTxTotal
{
  return self->_cslTxTotal;
}

- (unsigned)cslTxErrNoack
{
  return self->_cslTxErrNoack;
}

- (unsigned)cslTxErrCca
{
  return self->_cslTxErrCca;
}

- (unsigned)cslTxErrAbort
{
  return self->_cslTxErrAbort;
}

- (unsigned)cslTxErrBusyChannel
{
  return self->_cslTxErrBusyChannel;
}

- (unsigned)cslLossOfSyncDueToCslTimeout
{
  return self->_cslLossOfSyncDueToCslTimeout;
}

- (unsigned)cslLossOfSyncDueToMaxRetx
{
  return self->_cslLossOfSyncDueToMaxRetx;
}

- (unsigned)txErrCcaPercentage
{
  return self->_txErrCcaPercentage;
}

- (unsigned)txErrAbortPercentage
{
  return self->_txErrAbortPercentage;
}

- (unsigned)txErrBusyChannelPercentage
{
  return self->_txErrBusyChannelPercentage;
}

- (unsigned)txErrPercentage
{
  return self->_txErrPercentage;
}

@end