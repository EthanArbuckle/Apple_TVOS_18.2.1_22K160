@interface WiFiUsageLQMKernelSamplePerACTxStatsMcast
- (unint64_t)txMcast;
- (unint64_t)txMcastAllFailPerc;
- (unint64_t)txMcastChipModeErrPerc;
- (unint64_t)txMcastDroppedPerc;
- (unint64_t)txMcastExpiredPerc;
- (unint64_t)txMcastFailPerc;
- (unint64_t)txMcastForceExpirePerc;
- (unint64_t)txMcastFwFreePerc;
- (unint64_t)txMcastMaxRetriesPerc;
- (unint64_t)txMcastNoAckPerc;
- (unint64_t)txMcastNoBuffPerc;
- (unint64_t)txMcastNoResPerc;
- (unint64_t)txMcastSuccessPerc;
- (void)transformTXStats;
@end

@implementation WiFiUsageLQMKernelSamplePerACTxStatsMcast

- (void)transformTXStats
{
  self->_txMcast = v3;
  self->_txMcastSuccessPerc = v4;
  self->_txMcastAllFailPerc = v5;
  self->_txMcastDroppedPerc = v6;
  self->_txMcastNoBuffPerc = v7;
  self->_txMcastNoResPerc = v8;
  self->_txMcastNoAckPerc = v9;
  self->_txMcastChipModeErrPerc = v10;
  self->_txMcastExpiredPerc = v11;
  self->_txMcastFailPerc = v12;
  self->_txMcastFwFreePerc = v13;
  self->_txMcastMaxRetriesPerc = v14;
  self->_txMcastForceExpirePerc = v15;
}

- (unint64_t)txMcast
{
  return self->_txMcast;
}

- (unint64_t)txMcastSuccessPerc
{
  return self->_txMcastSuccessPerc;
}

- (unint64_t)txMcastAllFailPerc
{
  return self->_txMcastAllFailPerc;
}

- (unint64_t)txMcastDroppedPerc
{
  return self->_txMcastDroppedPerc;
}

- (unint64_t)txMcastNoBuffPerc
{
  return self->_txMcastNoBuffPerc;
}

- (unint64_t)txMcastNoResPerc
{
  return self->_txMcastNoResPerc;
}

- (unint64_t)txMcastNoAckPerc
{
  return self->_txMcastNoAckPerc;
}

- (unint64_t)txMcastChipModeErrPerc
{
  return self->_txMcastChipModeErrPerc;
}

- (unint64_t)txMcastExpiredPerc
{
  return self->_txMcastExpiredPerc;
}

- (unint64_t)txMcastFailPerc
{
  return self->_txMcastFailPerc;
}

- (unint64_t)txMcastFwFreePerc
{
  return self->_txMcastFwFreePerc;
}

- (unint64_t)txMcastMaxRetriesPerc
{
  return self->_txMcastMaxRetriesPerc;
}

- (unint64_t)txMcastForceExpirePerc
{
  return self->_txMcastForceExpirePerc;
}

@end