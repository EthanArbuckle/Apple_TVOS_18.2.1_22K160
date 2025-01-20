@interface AWDCountersRadioS
- (AWDRadioStatsS)sRadioStats;
- (BOOL)hasCcaFailedAttempts;
- (BOOL)hasEnergyDetectedEvents;
- (BOOL)hasEnergyDetectedRequests;
- (BOOL)hasListeningTime;
- (BOOL)hasRadioReceivedFrames;
- (BOOL)hasRadioStatusDoubleNotification;
- (BOOL)hasReceivedEnergyEvents;
- (BOOL)hasReceivedFrames;
- (BOOL)hasReceivedPreambles;
- (BOOL)hasReceivingTime;
- (BOOL)hasRetryInterval90perc;
- (BOOL)hasRetryIntervalAvg;
- (BOOL)hasRetryIntervalMax;
- (BOOL)hasRetryIntervalMin;
- (BOOL)hasRtt90perc;
- (BOOL)hasRttAvgVal;
- (BOOL)hasRttMaxVal;
- (BOOL)hasRttMinVal;
- (BOOL)hasRxErrorAborted;
- (BOOL)hasRxErrorAckAborted;
- (BOOL)hasRxErrorAckDenied;
- (BOOL)hasRxErrorAckFailedRadioDelay;
- (BOOL)hasRxErrorAckFailedRadioState;
- (BOOL)hasRxErrorDelayedTimeout;
- (BOOL)hasRxErrorDelayedTimeslotEnded;
- (BOOL)hasRxErrorDestAddrFiltered;
- (BOOL)hasRxErrorInvalidData;
- (BOOL)hasRxErrorInvalidFcs;
- (BOOL)hasRxErrorInvalidFrame;
- (BOOL)hasRxErrorInvalidLength;
- (BOOL)hasRxErrorReceiveFailed;
- (BOOL)hasRxErrorRuntimeDelay;
- (BOOL)hasRxErrorTimeslotEnded;
- (BOOL)hasSRadioStats;
- (BOOL)hasSleepState;
- (BOOL)hasTransmittedFrames;
- (BOOL)hasTransmittingTime;
- (BOOL)hasTxDelay90perc;
- (BOOL)hasTxDelayAvg;
- (BOOL)hasTxDelayMax;
- (BOOL)hasTxDelayMin;
- (BOOL)hasTxErrorAckNoMem;
- (BOOL)hasTxErrorBusyChannelCcaNotStarted;
- (BOOL)hasTxErrorChannelAccessCcaBusy;
- (BOOL)hasTxErrorChannelAccessFailure;
- (BOOL)hasTxErrorInvalidAck;
- (BOOL)hasTxErrorNoAck;
- (BOOL)hasTxErrorNotGranted;
- (BOOL)hasTxErrorTimeslotDenied;
- (BOOL)hasTxErrorTimeslotEnded;
- (BOOL)hasTxErrorTxAborted;
- (BOOL)hasTxErrorTxAbortedCcaTx;
- (BOOL)hasTxErrorTxAbortedCsmaBackoff;
- (BOOL)hasTxErrorTxAbortedCsmaCfgBackoff;
- (BOOL)hasTxErrorTxAbortedCsmaPrepare;
- (BOOL)hasTxErrorTxAbortedIfs;
- (BOOL)hasTxErrorTxAbortedRxAck;
- (BOOL)hasTxErrorTxAbortedTx;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)ccaFailedAttempts;
- (unsigned)energyDetectedEvents;
- (unsigned)energyDetectedRequests;
- (unsigned)listeningTime;
- (unsigned)radioReceivedFrames;
- (unsigned)radioStatusDoubleNotification;
- (unsigned)receivedEnergyEvents;
- (unsigned)receivedFrames;
- (unsigned)receivedPreambles;
- (unsigned)receivingTime;
- (unsigned)retryInterval90perc;
- (unsigned)retryIntervalAvg;
- (unsigned)retryIntervalMax;
- (unsigned)retryIntervalMin;
- (unsigned)rtt90perc;
- (unsigned)rttAvgVal;
- (unsigned)rttMaxVal;
- (unsigned)rttMinVal;
- (unsigned)rxErrorAborted;
- (unsigned)rxErrorAckAborted;
- (unsigned)rxErrorAckDenied;
- (unsigned)rxErrorAckFailedRadioDelay;
- (unsigned)rxErrorAckFailedRadioState;
- (unsigned)rxErrorDelayedTimeout;
- (unsigned)rxErrorDelayedTimeslotEnded;
- (unsigned)rxErrorDestAddrFiltered;
- (unsigned)rxErrorInvalidData;
- (unsigned)rxErrorInvalidFcs;
- (unsigned)rxErrorInvalidFrame;
- (unsigned)rxErrorInvalidLength;
- (unsigned)rxErrorReceiveFailed;
- (unsigned)rxErrorRuntimeDelay;
- (unsigned)rxErrorTimeslotEnded;
- (unsigned)sleepState;
- (unsigned)transmittedFrames;
- (unsigned)transmittingTime;
- (unsigned)txDelay90perc;
- (unsigned)txDelayAvg;
- (unsigned)txDelayMax;
- (unsigned)txDelayMin;
- (unsigned)txErrorAckNoMem;
- (unsigned)txErrorBusyChannelCcaNotStarted;
- (unsigned)txErrorChannelAccessCcaBusy;
- (unsigned)txErrorChannelAccessFailure;
- (unsigned)txErrorInvalidAck;
- (unsigned)txErrorNoAck;
- (unsigned)txErrorNotGranted;
- (unsigned)txErrorTimeslotDenied;
- (unsigned)txErrorTimeslotEnded;
- (unsigned)txErrorTxAborted;
- (unsigned)txErrorTxAbortedCcaTx;
- (unsigned)txErrorTxAbortedCsmaBackoff;
- (unsigned)txErrorTxAbortedCsmaCfgBackoff;
- (unsigned)txErrorTxAbortedCsmaPrepare;
- (unsigned)txErrorTxAbortedIfs;
- (unsigned)txErrorTxAbortedRxAck;
- (unsigned)txErrorTxAbortedTx;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCcaFailedAttempts:(unsigned int)a3;
- (void)setEnergyDetectedEvents:(unsigned int)a3;
- (void)setEnergyDetectedRequests:(unsigned int)a3;
- (void)setHasCcaFailedAttempts:(BOOL)a3;
- (void)setHasEnergyDetectedEvents:(BOOL)a3;
- (void)setHasEnergyDetectedRequests:(BOOL)a3;
- (void)setHasListeningTime:(BOOL)a3;
- (void)setHasRadioReceivedFrames:(BOOL)a3;
- (void)setHasRadioStatusDoubleNotification:(BOOL)a3;
- (void)setHasReceivedEnergyEvents:(BOOL)a3;
- (void)setHasReceivedFrames:(BOOL)a3;
- (void)setHasReceivedPreambles:(BOOL)a3;
- (void)setHasReceivingTime:(BOOL)a3;
- (void)setHasRetryInterval90perc:(BOOL)a3;
- (void)setHasRetryIntervalAvg:(BOOL)a3;
- (void)setHasRetryIntervalMax:(BOOL)a3;
- (void)setHasRetryIntervalMin:(BOOL)a3;
- (void)setHasRtt90perc:(BOOL)a3;
- (void)setHasRttAvgVal:(BOOL)a3;
- (void)setHasRttMaxVal:(BOOL)a3;
- (void)setHasRttMinVal:(BOOL)a3;
- (void)setHasRxErrorAborted:(BOOL)a3;
- (void)setHasRxErrorAckAborted:(BOOL)a3;
- (void)setHasRxErrorAckDenied:(BOOL)a3;
- (void)setHasRxErrorAckFailedRadioDelay:(BOOL)a3;
- (void)setHasRxErrorAckFailedRadioState:(BOOL)a3;
- (void)setHasRxErrorDelayedTimeout:(BOOL)a3;
- (void)setHasRxErrorDelayedTimeslotEnded:(BOOL)a3;
- (void)setHasRxErrorDestAddrFiltered:(BOOL)a3;
- (void)setHasRxErrorInvalidData:(BOOL)a3;
- (void)setHasRxErrorInvalidFcs:(BOOL)a3;
- (void)setHasRxErrorInvalidFrame:(BOOL)a3;
- (void)setHasRxErrorInvalidLength:(BOOL)a3;
- (void)setHasRxErrorReceiveFailed:(BOOL)a3;
- (void)setHasRxErrorRuntimeDelay:(BOOL)a3;
- (void)setHasRxErrorTimeslotEnded:(BOOL)a3;
- (void)setHasSleepState:(BOOL)a3;
- (void)setHasTransmittedFrames:(BOOL)a3;
- (void)setHasTransmittingTime:(BOOL)a3;
- (void)setHasTxDelay90perc:(BOOL)a3;
- (void)setHasTxDelayAvg:(BOOL)a3;
- (void)setHasTxDelayMax:(BOOL)a3;
- (void)setHasTxDelayMin:(BOOL)a3;
- (void)setHasTxErrorAckNoMem:(BOOL)a3;
- (void)setHasTxErrorBusyChannelCcaNotStarted:(BOOL)a3;
- (void)setHasTxErrorChannelAccessCcaBusy:(BOOL)a3;
- (void)setHasTxErrorChannelAccessFailure:(BOOL)a3;
- (void)setHasTxErrorInvalidAck:(BOOL)a3;
- (void)setHasTxErrorNoAck:(BOOL)a3;
- (void)setHasTxErrorNotGranted:(BOOL)a3;
- (void)setHasTxErrorTimeslotDenied:(BOOL)a3;
- (void)setHasTxErrorTimeslotEnded:(BOOL)a3;
- (void)setHasTxErrorTxAborted:(BOOL)a3;
- (void)setHasTxErrorTxAbortedCcaTx:(BOOL)a3;
- (void)setHasTxErrorTxAbortedCsmaBackoff:(BOOL)a3;
- (void)setHasTxErrorTxAbortedCsmaCfgBackoff:(BOOL)a3;
- (void)setHasTxErrorTxAbortedCsmaPrepare:(BOOL)a3;
- (void)setHasTxErrorTxAbortedIfs:(BOOL)a3;
- (void)setHasTxErrorTxAbortedRxAck:(BOOL)a3;
- (void)setHasTxErrorTxAbortedTx:(BOOL)a3;
- (void)setListeningTime:(unsigned int)a3;
- (void)setRadioReceivedFrames:(unsigned int)a3;
- (void)setRadioStatusDoubleNotification:(unsigned int)a3;
- (void)setReceivedEnergyEvents:(unsigned int)a3;
- (void)setReceivedFrames:(unsigned int)a3;
- (void)setReceivedPreambles:(unsigned int)a3;
- (void)setReceivingTime:(unsigned int)a3;
- (void)setRetryInterval90perc:(unsigned int)a3;
- (void)setRetryIntervalAvg:(unsigned int)a3;
- (void)setRetryIntervalMax:(unsigned int)a3;
- (void)setRetryIntervalMin:(unsigned int)a3;
- (void)setRtt90perc:(unsigned int)a3;
- (void)setRttAvgVal:(unsigned int)a3;
- (void)setRttMaxVal:(unsigned int)a3;
- (void)setRttMinVal:(unsigned int)a3;
- (void)setRxErrorAborted:(unsigned int)a3;
- (void)setRxErrorAckAborted:(unsigned int)a3;
- (void)setRxErrorAckDenied:(unsigned int)a3;
- (void)setRxErrorAckFailedRadioDelay:(unsigned int)a3;
- (void)setRxErrorAckFailedRadioState:(unsigned int)a3;
- (void)setRxErrorDelayedTimeout:(unsigned int)a3;
- (void)setRxErrorDelayedTimeslotEnded:(unsigned int)a3;
- (void)setRxErrorDestAddrFiltered:(unsigned int)a3;
- (void)setRxErrorInvalidData:(unsigned int)a3;
- (void)setRxErrorInvalidFcs:(unsigned int)a3;
- (void)setRxErrorInvalidFrame:(unsigned int)a3;
- (void)setRxErrorInvalidLength:(unsigned int)a3;
- (void)setRxErrorReceiveFailed:(unsigned int)a3;
- (void)setRxErrorRuntimeDelay:(unsigned int)a3;
- (void)setRxErrorTimeslotEnded:(unsigned int)a3;
- (void)setSRadioStats:(id)a3;
- (void)setSleepState:(unsigned int)a3;
- (void)setTransmittedFrames:(unsigned int)a3;
- (void)setTransmittingTime:(unsigned int)a3;
- (void)setTxDelay90perc:(unsigned int)a3;
- (void)setTxDelayAvg:(unsigned int)a3;
- (void)setTxDelayMax:(unsigned int)a3;
- (void)setTxDelayMin:(unsigned int)a3;
- (void)setTxErrorAckNoMem:(unsigned int)a3;
- (void)setTxErrorBusyChannelCcaNotStarted:(unsigned int)a3;
- (void)setTxErrorChannelAccessCcaBusy:(unsigned int)a3;
- (void)setTxErrorChannelAccessFailure:(unsigned int)a3;
- (void)setTxErrorInvalidAck:(unsigned int)a3;
- (void)setTxErrorNoAck:(unsigned int)a3;
- (void)setTxErrorNotGranted:(unsigned int)a3;
- (void)setTxErrorTimeslotDenied:(unsigned int)a3;
- (void)setTxErrorTimeslotEnded:(unsigned int)a3;
- (void)setTxErrorTxAborted:(unsigned int)a3;
- (void)setTxErrorTxAbortedCcaTx:(unsigned int)a3;
- (void)setTxErrorTxAbortedCsmaBackoff:(unsigned int)a3;
- (void)setTxErrorTxAbortedCsmaCfgBackoff:(unsigned int)a3;
- (void)setTxErrorTxAbortedCsmaPrepare:(unsigned int)a3;
- (void)setTxErrorTxAbortedIfs:(unsigned int)a3;
- (void)setTxErrorTxAbortedRxAck:(unsigned int)a3;
- (void)setTxErrorTxAbortedTx:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCountersRadioS

- (void)setCcaFailedAttempts:(unsigned int)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_ccaFailedAttempts = a3;
}

- (void)setHasCcaFailedAttempts:(BOOL)a3
{
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasCcaFailedAttempts
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setRadioReceivedFrames:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_radioReceivedFrames = a3;
}

- (void)setHasRadioReceivedFrames:(BOOL)a3
{
  uint64_t v3 = 16LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasRadioReceivedFrames
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setReceivedEnergyEvents:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_receivedEnergyEvents = a3;
}

- (void)setHasReceivedEnergyEvents:(BOOL)a3
{
  uint64_t v3 = 64LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasReceivedEnergyEvents
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setReceivedPreambles:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_receivedPreambles = a3;
}

- (void)setHasReceivedPreambles:(BOOL)a3
{
  uint64_t v3 = 256LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasReceivedPreambles
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (BOOL)hasSRadioStats
{
  return self->_sRadioStats != 0LL;
}

- (void)setRttMinVal:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_rttMinVal = a3;
}

- (void)setHasRttMinVal:(BOOL)a3
{
  uint64_t v3 = 0x20000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasRttMinVal
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setRttMaxVal:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_rttMaxVal = a3;
}

- (void)setHasRttMaxVal:(BOOL)a3
{
  uint64_t v3 = 0x10000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasRttMaxVal
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setRttAvgVal:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_rttAvgVal = a3;
}

- (void)setHasRttAvgVal:(BOOL)a3
{
  uint64_t v3 = 0x8000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasRttAvgVal
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setRtt90perc:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_rtt90perc = a3;
}

- (void)setHasRtt90perc:(BOOL)a3
{
  uint64_t v3 = 0x4000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasRtt90perc
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setRetryIntervalMin:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_retryIntervalMin = a3;
}

- (void)setHasRetryIntervalMin:(BOOL)a3
{
  uint64_t v3 = 0x2000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasRetryIntervalMin
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setRetryIntervalMax:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_retryIntervalMax = a3;
}

- (void)setHasRetryIntervalMax:(BOOL)a3
{
  uint64_t v3 = 4096LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasRetryIntervalMax
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setRetryIntervalAvg:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_retryIntervalAvg = a3;
}

- (void)setHasRetryIntervalAvg:(BOOL)a3
{
  uint64_t v3 = 2048LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasRetryIntervalAvg
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setRetryInterval90perc:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_retryInterval90perc = a3;
}

- (void)setHasRetryInterval90perc:(BOOL)a3
{
  uint64_t v3 = 1024LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasRetryInterval90perc
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setTxDelayMin:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_txDelayMin = a3;
}

- (void)setHasTxDelayMin:(BOOL)a3
{
  uint64_t v3 = 0x8000000000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasTxDelayMin
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setTxDelayMax:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_txDelayMax = a3;
}

- (void)setHasTxDelayMax:(BOOL)a3
{
  uint64_t v3 = 0x4000000000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasTxDelayMax
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setTxDelayAvg:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_txDelayAvg = a3;
}

- (void)setHasTxDelayAvg:(BOOL)a3
{
  uint64_t v3 = 0x2000000000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasTxDelayAvg
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setTxDelay90perc:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_txDelay90perc = a3;
}

- (void)setHasTxDelay90perc:(BOOL)a3
{
  uint64_t v3 = 0x1000000000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasTxDelay90perc
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setListeningTime:(unsigned int)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_listeningTime = a3;
}

- (void)setHasListeningTime:(BOOL)a3
{
  uint64_t v3 = 8LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFF7LL | v3);
}

- (BOOL)hasListeningTime
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setReceivingTime:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_receivingTime = a3;
}

- (void)setHasReceivingTime:(BOOL)a3
{
  uint64_t v3 = 512LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasReceivingTime
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setTransmittingTime:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_transmittingTime = a3;
}

- (void)setHasTransmittingTime:(BOOL)a3
{
  uint64_t v3 = 0x800000000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasTransmittingTime
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setTransmittedFrames:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_transmittedFrames = a3;
}

- (void)setHasTransmittedFrames:(BOOL)a3
{
  uint64_t v3 = 0x400000000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasTransmittedFrames
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setTxErrorTimeslotEnded:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000000000uLL;
  self->_txErrorTimeslotEnded = a3;
}

- (void)setHasTxErrorTimeslotEnded:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorTimeslotEnded
{
  return *((_BYTE *)&self->_has + 6) & 1;
}

- (void)setTxErrorTimeslotDenied:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000000000uLL;
  self->_txErrorTimeslotDenied = a3;
}

- (void)setHasTxErrorTimeslotDenied:(BOOL)a3
{
  uint64_t v3 = 0x800000000000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorTimeslotDenied
{
  return *((unsigned __int8 *)&self->_has + 5) >> 7;
}

- (void)setTxErrorBusyChannelCcaNotStarted:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000000000uLL;
  self->_txErrorBusyChannelCcaNotStarted = a3;
}

- (void)setHasTxErrorBusyChannelCcaNotStarted:(BOOL)a3
{
  uint64_t v3 = 0x20000000000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorBusyChannelCcaNotStarted
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setTxErrorChannelAccessCcaBusy:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000000000uLL;
  self->_txErrorChannelAccessCcaBusy = a3;
}

- (void)setHasTxErrorChannelAccessCcaBusy:(BOOL)a3
{
  uint64_t v3 = 0x40000000000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorChannelAccessCcaBusy
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setTxErrorChannelAccessFailure:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000000000uLL;
  self->_txErrorChannelAccessFailure = a3;
}

- (void)setHasTxErrorChannelAccessFailure:(BOOL)a3
{
  uint64_t v3 = 0x80000000000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorChannelAccessFailure
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setTxErrorTxAborted:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000000000uLL;
  self->_txErrorTxAborted = a3;
}

- (void)setHasTxErrorTxAborted:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorTxAborted
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 1) & 1;
}

- (void)setTxErrorTxAbortedCsmaCfgBackoff:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000000000000uLL;
  self->_txErrorTxAbortedCsmaCfgBackoff = a3;
}

- (void)setHasTxErrorTxAbortedCsmaCfgBackoff:(BOOL)a3
{
  uint64_t v3 = 0x10000000000000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFEFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorTxAbortedCsmaCfgBackoff
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 4) & 1;
}

- (void)setTxErrorTxAbortedCsmaBackoff:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000000000000uLL;
  self->_txErrorTxAbortedCsmaBackoff = a3;
}

- (void)setHasTxErrorTxAbortedCsmaBackoff:(BOOL)a3
{
  uint64_t v3 = 0x8000000000000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorTxAbortedCsmaBackoff
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 3) & 1;
}

- (void)setTxErrorTxAbortedCsmaPrepare:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000000000000uLL;
  self->_txErrorTxAbortedCsmaPrepare = a3;
}

- (void)setHasTxErrorTxAbortedCsmaPrepare:(BOOL)a3
{
  uint64_t v3 = 0x20000000000000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFDFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorTxAbortedCsmaPrepare
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 5) & 1;
}

- (void)setTxErrorTxAbortedIfs:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000000000000uLL;
  self->_txErrorTxAbortedIfs = a3;
}

- (void)setHasTxErrorTxAbortedIfs:(BOOL)a3
{
  uint64_t v3 = 0x40000000000000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFBFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorTxAbortedIfs
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 6) & 1;
}

- (void)setTxErrorTxAbortedRxAck:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000000000000uLL;
  self->_txErrorTxAbortedRxAck = a3;
}

- (void)setHasTxErrorTxAbortedRxAck:(BOOL)a3
{
  uint64_t v3 = 0x80000000000000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFF7FFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorTxAbortedRxAck
{
  return *((unsigned __int8 *)&self->_has + 6) >> 7;
}

- (void)setTxErrorTxAbortedCcaTx:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000000000uLL;
  self->_txErrorTxAbortedCcaTx = a3;
}

- (void)setHasTxErrorTxAbortedCcaTx:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorTxAbortedCcaTx
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 2) & 1;
}

- (void)setTxErrorTxAbortedTx:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000000000000uLL;
  self->_txErrorTxAbortedTx = a3;
}

- (void)setHasTxErrorTxAbortedTx:(BOOL)a3
{
  uint64_t v3 = 0x100000000000000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFEFFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorTxAbortedTx
{
  return *((_BYTE *)&self->_has + 7) & 1;
}

- (void)setTxErrorNotGranted:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000000000uLL;
  self->_txErrorNotGranted = a3;
}

- (void)setHasTxErrorNotGranted:(BOOL)a3
{
  uint64_t v3 = 0x400000000000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorNotGranted
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 6) & 1;
}

- (void)setTxErrorInvalidAck:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000000000uLL;
  self->_txErrorInvalidAck = a3;
}

- (void)setHasTxErrorInvalidAck:(BOOL)a3
{
  uint64_t v3 = 0x100000000000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorInvalidAck
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 4) & 1;
}

- (void)setTxErrorNoAck:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000000000uLL;
  self->_txErrorNoAck = a3;
}

- (void)setHasTxErrorNoAck:(BOOL)a3
{
  uint64_t v3 = 0x200000000000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorNoAck
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 5) & 1;
}

- (void)setTxErrorAckNoMem:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000000000uLL;
  self->_txErrorAckNoMem = a3;
}

- (void)setHasTxErrorAckNoMem:(BOOL)a3
{
  uint64_t v3 = 0x10000000000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorAckNoMem
{
  return *((_BYTE *)&self->_has + 5) & 1;
}

- (void)setReceivedFrames:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_receivedFrames = a3;
}

- (void)setHasReceivedFrames:(BOOL)a3
{
  uint64_t v3 = 128LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasReceivedFrames
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setRxErrorReceiveFailed:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_rxErrorReceiveFailed = a3;
}

- (void)setHasRxErrorReceiveFailed:(BOOL)a3
{
  uint64_t v3 = 0x40000000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasRxErrorReceiveFailed
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setRxErrorInvalidFrame:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_rxErrorInvalidFrame = a3;
}

- (void)setHasRxErrorInvalidFrame:(BOOL)a3
{
  uint64_t v3 = 0x10000000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasRxErrorInvalidFrame
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setRxErrorDelayedTimeout:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_rxErrorDelayedTimeout = a3;
}

- (void)setHasRxErrorDelayedTimeout:(BOOL)a3
{
  uint64_t v3 = 0x800000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasRxErrorDelayedTimeout
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setRxErrorInvalidFcs:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_rxErrorInvalidFcs = a3;
}

- (void)setHasRxErrorInvalidFcs:(BOOL)a3
{
  uint64_t v3 = 0x8000000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasRxErrorInvalidFcs
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setRxErrorDestAddrFiltered:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_rxErrorDestAddrFiltered = a3;
}

- (void)setHasRxErrorDestAddrFiltered:(BOOL)a3
{
  uint64_t v3 = 0x2000000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasRxErrorDestAddrFiltered
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setRxErrorRuntimeDelay:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_rxErrorRuntimeDelay = a3;
}

- (void)setHasRxErrorRuntimeDelay:(BOOL)a3
{
  uint64_t v3 = 0x80000000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasRxErrorRuntimeDelay
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setRxErrorTimeslotEnded:(unsigned int)a3
{
  *(void *)&self->_has |= (unint64_t)&_mh_execute_header;
  self->_rxErrorTimeslotEnded = a3;
}

- (void)setHasRxErrorTimeslotEnded:(BOOL)a3
{
  uint64_t v3 = &_mh_execute_header;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | (unint64_t)v3);
}

- (BOOL)hasRxErrorTimeslotEnded
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (void)setRxErrorAborted:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_rxErrorAborted = a3;
}

- (void)setHasRxErrorAborted:(BOOL)a3
{
  uint64_t v3 = 0x40000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasRxErrorAborted
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setRxErrorDelayedTimeslotEnded:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_rxErrorDelayedTimeslotEnded = a3;
}

- (void)setHasRxErrorDelayedTimeslotEnded:(BOOL)a3
{
  uint64_t v3 = 0x1000000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasRxErrorDelayedTimeslotEnded
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setRxErrorInvalidLength:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_rxErrorInvalidLength = a3;
}

- (void)setHasRxErrorInvalidLength:(BOOL)a3
{
  uint64_t v3 = 0x20000000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasRxErrorInvalidLength
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setRxErrorInvalidData:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_rxErrorInvalidData = a3;
}

- (void)setHasRxErrorInvalidData:(BOOL)a3
{
  uint64_t v3 = 0x4000000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasRxErrorInvalidData
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setRxErrorAckFailedRadioState:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_rxErrorAckFailedRadioState = a3;
}

- (void)setHasRxErrorAckFailedRadioState:(BOOL)a3
{
  uint64_t v3 = 0x400000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasRxErrorAckFailedRadioState
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setRxErrorAckFailedRadioDelay:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_rxErrorAckFailedRadioDelay = a3;
}

- (void)setHasRxErrorAckFailedRadioDelay:(BOOL)a3
{
  uint64_t v3 = 0x200000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasRxErrorAckFailedRadioDelay
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setRxErrorAckDenied:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_rxErrorAckDenied = a3;
}

- (void)setHasRxErrorAckDenied:(BOOL)a3
{
  uint64_t v3 = 0x100000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasRxErrorAckDenied
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setRxErrorAckAborted:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_rxErrorAckAborted = a3;
}

- (void)setHasRxErrorAckAborted:(BOOL)a3
{
  uint64_t v3 = 0x80000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasRxErrorAckAborted
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setSleepState:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_sleepState = a3;
}

- (void)setHasSleepState:(BOOL)a3
{
  uint64_t v3 = 0x200000000LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasSleepState
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setEnergyDetectedRequests:(unsigned int)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_energyDetectedRequests = a3;
}

- (void)setHasEnergyDetectedRequests:(BOOL)a3
{
  uint64_t v3 = 4LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasEnergyDetectedRequests
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setEnergyDetectedEvents:(unsigned int)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_energyDetectedEvents = a3;
}

- (void)setHasEnergyDetectedEvents:(BOOL)a3
{
  uint64_t v3 = 2LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasEnergyDetectedEvents
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setRadioStatusDoubleNotification:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_radioStatusDoubleNotification = a3;
}

- (void)setHasRadioStatusDoubleNotification:(BOOL)a3
{
  uint64_t v3 = 32LL;
  if (!a3) {
    uint64_t v3 = 0LL;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasRadioStatusDoubleNotification
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AWDCountersRadioS;
  id v3 = -[AWDCountersRadioS description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AWDCountersRadioS dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  $2059B406CAF625EF4BB33881A00C687A has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_ccaFailedAttempts));
    [v3 setObject:v12 forKey:@"cca_failed_attempts"];

    $2059B406CAF625EF4BB33881A00C687A has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_65;
    }
  }

  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_radioReceivedFrames));
  [v3 setObject:v13 forKey:@"radio_received_frames"];

  $2059B406CAF625EF4BB33881A00C687A has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

- (BOOL)readFrom:(id)a3
{
  return result;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  $2059B406CAF625EF4BB33881A00C687A has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v7, self->_ccaFailedAttempts, 1LL);
    $2059B406CAF625EF4BB33881A00C687A has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_65;
    }
  }

  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteUint32Field(v7, self->_radioReceivedFrames, 2LL);
  $2059B406CAF625EF4BB33881A00C687A has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

- (void)copyTo:(id)a3
{
  v4 = a3;
  $2059B406CAF625EF4BB33881A00C687A has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v4[2] = self->_ccaFailedAttempts;
    *((void *)v4 + 31) |= 1uLL;
    $2059B406CAF625EF4BB33881A00C687A has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_65;
    }
  }

  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }

  v4[6] = self->_radioReceivedFrames;
  *((void *)v4 + 31) |= 0x10uLL;
  $2059B406CAF625EF4BB33881A00C687A has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  $2059B406CAF625EF4BB33881A00C687A v6 = v5;
  $2059B406CAF625EF4BB33881A00C687A has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v5[2] = self->_ccaFailedAttempts;
    *((void *)v5 + 31) |= 1uLL;
    $2059B406CAF625EF4BB33881A00C687A has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_63;
    }
  }

  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }

  v5[6] = self->_radioReceivedFrames;
  *((void *)v5 + 31) |= 0x10uLL;
  $2059B406CAF625EF4BB33881A00C687A has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  $2059B406CAF625EF4BB33881A00C687A has = self->_has;
  uint64_t v7 = *((void *)v4 + 31);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_ccaFailedAttempts != *((_DWORD *)v4 + 2)) {
      goto LABEL_291;
    }
  }

  else if ((v7 & 1) != 0)
  {
    goto LABEL_291;
  }

  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_radioReceivedFrames != *((_DWORD *)v4 + 6)) {
      goto LABEL_291;
    }
  }

  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_291;
  }

  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_receivedEnergyEvents != *((_DWORD *)v4 + 8)) {
      goto LABEL_291;
    }
  }

  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_291;
  }

  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_receivedPreambles != *((_DWORD *)v4 + 10)) {
      goto LABEL_291;
    }
  }

  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_291;
  }

  sRadioStats = self->_sRadioStats;
  if (sRadioStats || *((void *)v4 + 18))
  {
    if (!-[AWDRadioStatsS isEqual:](sRadioStats, "isEqual:", *((void *)v4 + 18))) {
      goto LABEL_291;
    }
    $2059B406CAF625EF4BB33881A00C687A has = self->_has;
  }

  uint64_t v9 = *((void *)v4 + 31);
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v9 & 0x20000) == 0 || self->_rttMinVal != *((_DWORD *)v4 + 19)) {
      goto LABEL_291;
    }
  }

  else if ((v9 & 0x20000) != 0)
  {
    goto LABEL_291;
  }

  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v9 & 0x10000) == 0 || self->_rttMaxVal != *((_DWORD *)v4 + 18)) {
      goto LABEL_291;
    }
  }

  else if ((v9 & 0x10000) != 0)
  {
    goto LABEL_291;
  }

  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v9 & 0x8000) == 0 || self->_rttAvgVal != *((_DWORD *)v4 + 17)) {
      goto LABEL_291;
    }
  }

  else if ((v9 & 0x8000) != 0)
  {
    goto LABEL_291;
  }

  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v9 & 0x4000) == 0 || self->_rtt90perc != *((_DWORD *)v4 + 16)) {
      goto LABEL_291;
    }
  }

  else if ((v9 & 0x4000) != 0)
  {
    goto LABEL_291;
  }

  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v9 & 0x2000) == 0 || self->_retryIntervalMin != *((_DWORD *)v4 + 15)) {
      goto LABEL_291;
    }
  }

  else if ((v9 & 0x2000) != 0)
  {
    goto LABEL_291;
  }

  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v9 & 0x1000) == 0 || self->_retryIntervalMax != *((_DWORD *)v4 + 14)) {
      goto LABEL_291;
    }
  }

  else if ((v9 & 0x1000) != 0)
  {
    goto LABEL_291;
  }

  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v9 & 0x800) == 0 || self->_retryIntervalAvg != *((_DWORD *)v4 + 13)) {
      goto LABEL_291;
    }
  }

  else if ((v9 & 0x800) != 0)
  {
    goto LABEL_291;
  }

  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v9 & 0x400) == 0 || self->_retryInterval90perc != *((_DWORD *)v4 + 12)) {
      goto LABEL_291;
    }
  }

  else if ((v9 & 0x400) != 0)
  {
    goto LABEL_291;
  }

  if ((*(void *)&has & 0x8000000000LL) != 0)
  {
    if ((v9 & 0x8000000000LL) == 0 || self->_txDelayMin != *((_DWORD *)v4 + 44)) {
      goto LABEL_291;
    }
  }

  else if ((v9 & 0x8000000000LL) != 0)
  {
    goto LABEL_291;
  }

  if ((*(void *)&has & 0x4000000000LL) != 0)
  {
    if ((v9 & 0x4000000000LL) == 0 || self->_txDelayMax != *((_DWORD *)v4 + 43)) {
      goto LABEL_291;
    }
  }

  else if ((v9 & 0x4000000000LL) != 0)
  {
    goto LABEL_291;
  }

  if ((*(void *)&has & 0x2000000000LL) != 0)
  {
    if ((v9 & 0x2000000000LL) == 0 || self->_txDelayAvg != *((_DWORD *)v4 + 42)) {
      goto LABEL_291;
    }
  }

  else if ((v9 & 0x2000000000LL) != 0)
  {
    goto LABEL_291;
  }

  if ((*(void *)&has & 0x1000000000LL) != 0)
  {
    if ((v9 & 0x1000000000LL) == 0 || self->_txDelay90perc != *((_DWORD *)v4 + 41)) {
      goto LABEL_291;
    }
  }

  else if ((v9 & 0x1000000000LL) != 0)
  {
    goto LABEL_291;
  }

  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_listeningTime != *((_DWORD *)v4 + 5)) {
      goto LABEL_291;
    }
  }

  else if ((v9 & 8) != 0)
  {
    goto LABEL_291;
  }

  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v9 & 0x200) == 0 || self->_receivingTime != *((_DWORD *)v4 + 11)) {
      goto LABEL_291;
    }
  }

  else if ((v9 & 0x200) != 0)
  {
    goto LABEL_291;
  }

  if ((*(void *)&has & 0x800000000LL) != 0)
  {
    if ((v9 & 0x800000000LL) == 0 || self->_transmittingTime != *((_DWORD *)v4 + 40)) {
      goto LABEL_291;
    }
  }

  else if ((v9 & 0x800000000LL) != 0)
  {
    goto LABEL_291;
  }

  if ((*(void *)&has & 0x400000000LL) != 0)
  {
    if ((v9 & 0x400000000LL) == 0 || self->_transmittedFrames != *((_DWORD *)v4 + 39)) {
      goto LABEL_291;
    }
  }

  else if ((v9 & 0x400000000LL) != 0)
  {
    goto LABEL_291;
  }

  if ((*(void *)&has & 0x1000000000000LL) != 0)
  {
    if ((v9 & 0x1000000000000LL) == 0 || self->_txErrorTimeslotEnded != *((_DWORD *)v4 + 53)) {
      goto LABEL_291;
    }
  }

  else if ((v9 & 0x1000000000000LL) != 0)
  {
    goto LABEL_291;
  }

  if ((*(void *)&has & 0x800000000000LL) != 0)
  {
    if ((v9 & 0x800000000000LL) == 0 || self->_txErrorTimeslotDenied != *((_DWORD *)v4 + 52)) {
      goto LABEL_291;
    }
  }

  else if ((v9 & 0x800000000000LL) != 0)
  {
    goto LABEL_291;
  }

  if ((*(void *)&has & 0x20000000000LL) != 0)
  {
    if ((v9 & 0x20000000000LL) == 0 || self->_txErrorBusyChannelCcaNotStarted != *((_DWORD *)v4 + 46)) {
      goto LABEL_291;
    }
  }

  else if ((v9 & 0x20000000000LL) != 0)
  {
    goto LABEL_291;
  }

  if ((*(void *)&has & 0x40000000000LL) != 0)
  {
    if ((v9 & 0x40000000000LL) == 0 || self->_txErrorChannelAccessCcaBusy != *((_DWORD *)v4 + 47)) {
      goto LABEL_291;
    }
  }

  else if ((v9 & 0x40000000000LL) != 0)
  {
    goto LABEL_291;
  }

  if ((*(void *)&has & 0x80000000000LL) != 0)
  {
    if ((v9 & 0x80000000000LL) == 0 || self->_txErrorChannelAccessFailure != *((_DWORD *)v4 + 48)) {
      goto LABEL_291;
    }
  }

  else if ((v9 & 0x80000000000LL) != 0)
  {
    goto LABEL_291;
  }

  if ((*(void *)&has & 0x2000000000000LL) != 0)
  {
    if ((v9 & 0x2000000000000LL) == 0 || self->_txErrorTxAborted != *((_DWORD *)v4 + 54)) {
      goto LABEL_291;
    }
  }

  else if ((v9 & 0x2000000000000LL) != 0)
  {
    goto LABEL_291;
  }

  if ((*(void *)&has & 0x10000000000000LL) != 0)
  {
    if ((v9 & 0x10000000000000LL) == 0 || self->_txErrorTxAbortedCsmaCfgBackoff != *((_DWORD *)v4 + 57)) {
      goto LABEL_291;
    }
  }

  else if ((v9 & 0x10000000000000LL) != 0)
  {
    goto LABEL_291;
  }

  if ((*(void *)&has & 0x8000000000000LL) != 0)
  {
    if ((v9 & 0x8000000000000LL) == 0 || self->_txErrorTxAbortedCsmaBackoff != *((_DWORD *)v4 + 56)) {
      goto LABEL_291;
    }
  }

  else if ((v9 & 0x8000000000000LL) != 0)
  {
    goto LABEL_291;
  }

  if ((*(void *)&has & 0x20000000000000LL) != 0)
  {
    if ((v9 & 0x20000000000000LL) == 0 || self->_txErrorTxAbortedCsmaPrepare != *((_DWORD *)v4 + 58)) {
      goto LABEL_291;
    }
  }

  else if ((v9 & 0x20000000000000LL) != 0)
  {
    goto LABEL_291;
  }

  if ((*(void *)&has & 0x40000000000000LL) != 0)
  {
    if ((v9 & 0x40000000000000LL) == 0 || self->_txErrorTxAbortedIfs != *((_DWORD *)v4 + 59)) {
      goto LABEL_291;
    }
  }

  else if ((v9 & 0x40000000000000LL) != 0)
  {
    goto LABEL_291;
  }

  uint64_t v10 = *((void *)v4 + 31);
  if ((*(void *)&has & 0x80000000000000LL) != 0)
  {
    if ((v10 & 0x80000000000000LL) == 0 || self->_txErrorTxAbortedRxAck != *((_DWORD *)v4 + 60)) {
      goto LABEL_291;
    }
  }

  else if ((v10 & 0x80000000000000LL) != 0)
  {
    goto LABEL_291;
  }

  if ((*(void *)&has & 0x4000000000000LL) != 0)
  {
    if ((v10 & 0x4000000000000LL) == 0 || self->_txErrorTxAbortedCcaTx != *((_DWORD *)v4 + 55)) {
      goto LABEL_291;
    }
  }

  else if ((v10 & 0x4000000000000LL) != 0)
  {
    goto LABEL_291;
  }

  if ((*(void *)&has & 0x100000000000000LL) != 0)
  {
    if ((v10 & 0x100000000000000LL) == 0 || self->_txErrorTxAbortedTx != *((_DWORD *)v4 + 61)) {
      goto LABEL_291;
    }
  }

  else if ((v10 & 0x100000000000000LL) != 0)
  {
    goto LABEL_291;
  }

  if ((*(void *)&has & 0x400000000000LL) != 0)
  {
    if ((v10 & 0x400000000000LL) == 0 || self->_txErrorNotGranted != *((_DWORD *)v4 + 51)) {
      goto LABEL_291;
    }
  }

  else if ((v10 & 0x400000000000LL) != 0)
  {
    goto LABEL_291;
  }

  if ((*(void *)&has & 0x100000000000LL) != 0)
  {
    if ((v10 & 0x100000000000LL) == 0 || self->_txErrorInvalidAck != *((_DWORD *)v4 + 49)) {
      goto LABEL_291;
    }
  }

  else if ((v10 & 0x100000000000LL) != 0)
  {
    goto LABEL_291;
  }

  if ((*(void *)&has & 0x200000000000LL) != 0)
  {
    if ((v10 & 0x200000000000LL) == 0 || self->_txErrorNoAck != *((_DWORD *)v4 + 50)) {
      goto LABEL_291;
    }
  }

  else if ((v10 & 0x200000000000LL) != 0)
  {
    goto LABEL_291;
  }

  if ((*(void *)&has & 0x10000000000LL) != 0)
  {
    if ((v10 & 0x10000000000LL) == 0 || self->_txErrorAckNoMem != *((_DWORD *)v4 + 45)) {
      goto LABEL_291;
    }
  }

  else if ((v10 & 0x10000000000LL) != 0)
  {
    goto LABEL_291;
  }

  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0 || self->_receivedFrames != *((_DWORD *)v4 + 9)) {
      goto LABEL_291;
    }
  }

  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_291;
  }

  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v10 & 0x40000000) == 0 || self->_rxErrorReceiveFailed != *((_DWORD *)v4 + 32)) {
      goto LABEL_291;
    }
  }

  else if ((v10 & 0x40000000) != 0)
  {
    goto LABEL_291;
  }

  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v10 & 0x10000000) == 0 || self->_rxErrorInvalidFrame != *((_DWORD *)v4 + 30)) {
      goto LABEL_291;
    }
  }

  else if ((v10 & 0x10000000) != 0)
  {
    goto LABEL_291;
  }

  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v10 & 0x800000) == 0 || self->_rxErrorDelayedTimeout != *((_DWORD *)v4 + 25)) {
      goto LABEL_291;
    }
  }

  else if ((v10 & 0x800000) != 0)
  {
    goto LABEL_291;
  }

  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v10 & 0x8000000) == 0 || self->_rxErrorInvalidFcs != *((_DWORD *)v4 + 29)) {
      goto LABEL_291;
    }
  }

  else if ((v10 & 0x8000000) != 0)
  {
    goto LABEL_291;
  }

  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v10 & 0x2000000) == 0 || self->_rxErrorDestAddrFiltered != *((_DWORD *)v4 + 27)) {
      goto LABEL_291;
    }
  }

  else if ((v10 & 0x2000000) != 0)
  {
    goto LABEL_291;
  }

  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v10 & 0x80000000) == 0 || self->_rxErrorRuntimeDelay != *((_DWORD *)v4 + 33)) {
      goto LABEL_291;
    }
  }

  else if ((v10 & 0x80000000) != 0)
  {
    goto LABEL_291;
  }

  if ((*(void *)&has & 0x100000000LL) != 0)
  {
    if ((v10 & 0x100000000LL) == 0 || self->_rxErrorTimeslotEnded != *((_DWORD *)v4 + 34)) {
      goto LABEL_291;
    }
  }

  else if ((v10 & 0x100000000LL) != 0)
  {
    goto LABEL_291;
  }

  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v10 & 0x40000) == 0 || self->_rxErrorAborted != *((_DWORD *)v4 + 20)) {
      goto LABEL_291;
    }
  }

  else if ((v10 & 0x40000) != 0)
  {
    goto LABEL_291;
  }

  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v10 & 0x1000000) == 0 || self->_rxErrorDelayedTimeslotEnded != *((_DWORD *)v4 + 26)) {
      goto LABEL_291;
    }
  }

  else if ((v10 & 0x1000000) != 0)
  {
    goto LABEL_291;
  }

  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v10 & 0x20000000) == 0 || self->_rxErrorInvalidLength != *((_DWORD *)v4 + 31)) {
      goto LABEL_291;
    }
  }

  else if ((v10 & 0x20000000) != 0)
  {
    goto LABEL_291;
  }

  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v10 & 0x4000000) == 0 || self->_rxErrorInvalidData != *((_DWORD *)v4 + 28)) {
      goto LABEL_291;
    }
  }

  else if ((v10 & 0x4000000) != 0)
  {
    goto LABEL_291;
  }

  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v10 & 0x400000) == 0 || self->_rxErrorAckFailedRadioState != *((_DWORD *)v4 + 24)) {
      goto LABEL_291;
    }
  }

  else if ((v10 & 0x400000) != 0)
  {
    goto LABEL_291;
  }

  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v10 & 0x200000) == 0 || self->_rxErrorAckFailedRadioDelay != *((_DWORD *)v4 + 23)) {
      goto LABEL_291;
    }
  }

  else if ((v10 & 0x200000) != 0)
  {
    goto LABEL_291;
  }

  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v10 & 0x100000) == 0 || self->_rxErrorAckDenied != *((_DWORD *)v4 + 22)) {
      goto LABEL_291;
    }
  }

  else if ((v10 & 0x100000) != 0)
  {
    goto LABEL_291;
  }

  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v10 & 0x80000) == 0 || self->_rxErrorAckAborted != *((_DWORD *)v4 + 21)) {
      goto LABEL_291;
    }
  }

  else if ((v10 & 0x80000) != 0)
  {
    goto LABEL_291;
  }

  if ((*(void *)&has & 0x200000000LL) != 0)
  {
    if ((v10 & 0x200000000LL) == 0 || self->_sleepState != *((_DWORD *)v4 + 38)) {
      goto LABEL_291;
    }
  }

  else if ((v10 & 0x200000000LL) != 0)
  {
    goto LABEL_291;
  }

  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_energyDetectedRequests != *((_DWORD *)v4 + 4)) {
      goto LABEL_291;
    }
  }

  else if ((v10 & 4) != 0)
  {
    goto LABEL_291;
  }

  if ((*(_BYTE *)&has & 2) == 0)
  {
    if ((v10 & 2) == 0) {
      goto LABEL_286;
    }
LABEL_291:
    BOOL v11 = 0;
    goto LABEL_292;
  }

  if ((v10 & 2) == 0 || self->_energyDetectedEvents != *((_DWORD *)v4 + 3)) {
    goto LABEL_291;
  }
LABEL_286:
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((*((void *)v4 + 31) & 0x20) == 0 || self->_radioStatusDoubleNotification != *((_DWORD *)v4 + 7)) {
      goto LABEL_291;
    }
    BOOL v11 = 1;
  }

  else
  {
    BOOL v11 = (*((void *)v4 + 31) & 0x20LL) == 0;
  }

- (unint64_t)hash
{
  $2059B406CAF625EF4BB33881A00C687A has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    uint64_t v63 = 2654435761LL * self->_ccaFailedAttempts;
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v62 = 2654435761LL * self->_radioReceivedFrames;
      if ((*(_BYTE *)&has & 0x40) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v61 = 0LL;
      if ((*(_WORD *)&has & 0x100) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }

  else
  {
    uint64_t v63 = 0LL;
    if ((*(_BYTE *)&has & 0x10) != 0) {
      goto LABEL_3;
    }
  }

  uint64_t v62 = 0LL;
  if ((*(_BYTE *)&has & 0x40) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v61 = 2654435761LL * self->_receivedEnergyEvents;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_5:
    uint64_t v60 = 2654435761LL * self->_receivedPreambles;
    goto LABEL_10;
  }

- (void)mergeFrom:(id)a3
{
  $2059B406CAF625EF4BB33881A00C687A v4 = (unsigned int *)a3;
  uint64_t v5 = v4;
  uint64_t v6 = *((void *)v4 + 31);
  if ((v6 & 1) != 0)
  {
    self->_ccaFailedAttempts = v4[2];
    *(void *)&self->_has |= 1uLL;
    uint64_t v6 = *((void *)v4 + 31);
    if ((v6 & 0x10) == 0)
    {
LABEL_3:
      if ((v6 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }

  else if ((v6 & 0x10) == 0)
  {
    goto LABEL_3;
  }

  self->_radioReceivedFrames = v4[6];
  *(void *)&self->_has |= 0x10uLL;
  uint64_t v6 = *((void *)v4 + 31);
  if ((v6 & 0x40) == 0)
  {
LABEL_4:
    if ((v6 & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

- (unsigned)ccaFailedAttempts
{
  return self->_ccaFailedAttempts;
}

- (unsigned)radioReceivedFrames
{
  return self->_radioReceivedFrames;
}

- (unsigned)receivedEnergyEvents
{
  return self->_receivedEnergyEvents;
}

- (unsigned)receivedPreambles
{
  return self->_receivedPreambles;
}

- (AWDRadioStatsS)sRadioStats
{
  return self->_sRadioStats;
}

- (void)setSRadioStats:(id)a3
{
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

- (unsigned)transmittedFrames
{
  return self->_transmittedFrames;
}

- (unsigned)txErrorTimeslotEnded
{
  return self->_txErrorTimeslotEnded;
}

- (unsigned)txErrorTimeslotDenied
{
  return self->_txErrorTimeslotDenied;
}

- (unsigned)txErrorBusyChannelCcaNotStarted
{
  return self->_txErrorBusyChannelCcaNotStarted;
}

- (unsigned)txErrorChannelAccessCcaBusy
{
  return self->_txErrorChannelAccessCcaBusy;
}

- (unsigned)txErrorChannelAccessFailure
{
  return self->_txErrorChannelAccessFailure;
}

- (unsigned)txErrorTxAborted
{
  return self->_txErrorTxAborted;
}

- (unsigned)txErrorTxAbortedCsmaCfgBackoff
{
  return self->_txErrorTxAbortedCsmaCfgBackoff;
}

- (unsigned)txErrorTxAbortedCsmaBackoff
{
  return self->_txErrorTxAbortedCsmaBackoff;
}

- (unsigned)txErrorTxAbortedCsmaPrepare
{
  return self->_txErrorTxAbortedCsmaPrepare;
}

- (unsigned)txErrorTxAbortedIfs
{
  return self->_txErrorTxAbortedIfs;
}

- (unsigned)txErrorTxAbortedRxAck
{
  return self->_txErrorTxAbortedRxAck;
}

- (unsigned)txErrorTxAbortedCcaTx
{
  return self->_txErrorTxAbortedCcaTx;
}

- (unsigned)txErrorTxAbortedTx
{
  return self->_txErrorTxAbortedTx;
}

- (unsigned)txErrorNotGranted
{
  return self->_txErrorNotGranted;
}

- (unsigned)txErrorInvalidAck
{
  return self->_txErrorInvalidAck;
}

- (unsigned)txErrorNoAck
{
  return self->_txErrorNoAck;
}

- (unsigned)txErrorAckNoMem
{
  return self->_txErrorAckNoMem;
}

- (unsigned)receivedFrames
{
  return self->_receivedFrames;
}

- (unsigned)rxErrorReceiveFailed
{
  return self->_rxErrorReceiveFailed;
}

- (unsigned)rxErrorInvalidFrame
{
  return self->_rxErrorInvalidFrame;
}

- (unsigned)rxErrorDelayedTimeout
{
  return self->_rxErrorDelayedTimeout;
}

- (unsigned)rxErrorInvalidFcs
{
  return self->_rxErrorInvalidFcs;
}

- (unsigned)rxErrorDestAddrFiltered
{
  return self->_rxErrorDestAddrFiltered;
}

- (unsigned)rxErrorRuntimeDelay
{
  return self->_rxErrorRuntimeDelay;
}

- (unsigned)rxErrorTimeslotEnded
{
  return self->_rxErrorTimeslotEnded;
}

- (unsigned)rxErrorAborted
{
  return self->_rxErrorAborted;
}

- (unsigned)rxErrorDelayedTimeslotEnded
{
  return self->_rxErrorDelayedTimeslotEnded;
}

- (unsigned)rxErrorInvalidLength
{
  return self->_rxErrorInvalidLength;
}

- (unsigned)rxErrorInvalidData
{
  return self->_rxErrorInvalidData;
}

- (unsigned)rxErrorAckFailedRadioState
{
  return self->_rxErrorAckFailedRadioState;
}

- (unsigned)rxErrorAckFailedRadioDelay
{
  return self->_rxErrorAckFailedRadioDelay;
}

- (unsigned)rxErrorAckDenied
{
  return self->_rxErrorAckDenied;
}

- (unsigned)rxErrorAckAborted
{
  return self->_rxErrorAckAborted;
}

- (unsigned)sleepState
{
  return self->_sleepState;
}

- (unsigned)energyDetectedRequests
{
  return self->_energyDetectedRequests;
}

- (unsigned)energyDetectedEvents
{
  return self->_energyDetectedEvents;
}

- (unsigned)radioStatusDoubleNotification
{
  return self->_radioStatusDoubleNotification;
}

- (void).cxx_destruct
{
}

@end