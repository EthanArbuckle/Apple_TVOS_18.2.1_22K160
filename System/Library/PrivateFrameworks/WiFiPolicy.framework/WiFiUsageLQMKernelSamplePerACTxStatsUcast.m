@interface WiFiUsageLQMKernelSamplePerACTxStatsUcast
- (unint64_t)txBE;
- (unint64_t)txBEAllFailPerc;
- (unint64_t)txBEChipModeErrPerc;
- (unint64_t)txBEDroppedPerc;
- (unint64_t)txBEExpiredPerc;
- (unint64_t)txBEFailPerc;
- (unint64_t)txBEForceExpirePerc;
- (unint64_t)txBEFwFreePerc;
- (unint64_t)txBEMaxRetriesPerc;
- (unint64_t)txBENoAckPerc;
- (unint64_t)txBENoBuffPerc;
- (unint64_t)txBENoResPerc;
- (unint64_t)txBESuccessPerc;
- (unint64_t)txBK;
- (unint64_t)txBKAllFailPerc;
- (unint64_t)txBKChipModeErrPerc;
- (unint64_t)txBKDroppedPerc;
- (unint64_t)txBKExpiredPerc;
- (unint64_t)txBKFailPerc;
- (unint64_t)txBKForceExpirePerc;
- (unint64_t)txBKFwFreePerc;
- (unint64_t)txBKMaxRetriesPerc;
- (unint64_t)txBKNoAckPerc;
- (unint64_t)txBKNoBuffPerc;
- (unint64_t)txBKNoResPerc;
- (unint64_t)txBKSuccessPerc;
- (unint64_t)txVI;
- (unint64_t)txVIAllFailPerc;
- (unint64_t)txVIChipModeErrPerc;
- (unint64_t)txVIDroppedPerc;
- (unint64_t)txVIExpiredPerc;
- (unint64_t)txVIFailPerc;
- (unint64_t)txVIForceExpirePerc;
- (unint64_t)txVIFwFreePerc;
- (unint64_t)txVIMaxRetriesPerc;
- (unint64_t)txVINoAckPerc;
- (unint64_t)txVINoBuffPerc;
- (unint64_t)txVINoResPerc;
- (unint64_t)txVISuccessPerc;
- (unint64_t)txVO;
- (unint64_t)txVOAllFailPerc;
- (unint64_t)txVOChipModeErrPerc;
- (unint64_t)txVODroppedPerc;
- (unint64_t)txVOExpiredPerc;
- (unint64_t)txVOFailPerc;
- (unint64_t)txVOForceExpirePerc;
- (unint64_t)txVOFwFreePerc;
- (unint64_t)txVOMaxRetriesPerc;
- (unint64_t)txVONoAckPerc;
- (unint64_t)txVONoBuffPerc;
- (unint64_t)txVONoResPerc;
- (unint64_t)txVOSuccessPerc;
- (void)transformTXStats;
@end

@implementation WiFiUsageLQMKernelSamplePerACTxStatsUcast

- (void)transformTXStats
{
  self->_txBE = v16;
  self->_txBESuccessPerc = v17;
  self->_txBEAllFailPerc = v18;
  self->_txBEDroppedPerc = v19;
  self->_txBENoBuffPerc = v20;
  self->_txBENoResPerc = v21;
  self->_txBENoAckPerc = v22;
  self->_txBEChipModeErrPerc = v23;
  self->_txBEExpiredPerc = v24;
  self->_txBEFailPerc = v25;
  self->_txBEFwFreePerc = v26;
  self->_txBEMaxRetriesPerc = v27;
  self->_txBEForceExpirePerc = v28;
  +[WiFiUsageLQMTransformations txErrorsPercentagesWithtxSuccess:txDropped:txNoBuff:txNoRes:txNoAck:txChipModeErr:txExpired:txFail:txFwFree:txMaxRetries:txForceExpire:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "txErrorsPercentagesWithtxSuccess:txDropped:txNoBuff:txNoRes:txNoAck:txChipModeErr:txExpired:txFail:txFwFree:txMaxRet ries:txForceExpire:",  self->_txBKSuccessPerc,  self->_txBKDroppedPerc,  self->_txBKNoBuffPerc,  self->_txBKNoResPerc,  self->_txBKNoAckPerc,  self->_txBKChipModeErrPerc,  self->_txBKExpiredPerc,  self->_txBKFailPerc,  self->_txBKFwFreePerc,  self->_txBKMaxRetriesPerc,  self->_txBKForceExpirePerc);
  self->_txBK = v3;
  self->_txBKSuccessPerc = v4;
  self->_txBKAllFailPerc = v5;
  self->_txBKDroppedPerc = v6;
  self->_txBKNoBuffPerc = v7;
  self->_txBKNoResPerc = v8;
  self->_txBKNoAckPerc = v9;
  self->_txBKChipModeErrPerc = v10;
  self->_txBKExpiredPerc = v11;
  self->_txBKFailPerc = v12;
  self->_txBKFwFreePerc = v13;
  self->_txBKMaxRetriesPerc = v14;
  self->_txBKForceExpirePerc = v15;
  +[WiFiUsageLQMTransformations txErrorsPercentagesWithtxSuccess:txDropped:txNoBuff:txNoRes:txNoAck:txChipModeErr:txExpired:txFail:txFwFree:txMaxRetries:txForceExpire:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "txErrorsPercentagesWithtxSuccess:txDropped:txNoBuff:txNoRes:txNoAck:txChipModeErr:txExpired:txFail:txFwFree:txMaxRet ries:txForceExpire:",  self->_txVISuccessPerc,  self->_txVIDroppedPerc,  self->_txVINoBuffPerc,  self->_txVINoResPerc,  self->_txVINoAckPerc,  self->_txVIChipModeErrPerc,  self->_txVIExpiredPerc,  self->_txVIFailPerc,  self->_txVIFwFreePerc,  self->_txVIMaxRetriesPerc,  self->_txVIForceExpirePerc);
  self->_txVI = v3;
  self->_txVISuccessPerc = v4;
  self->_txVIAllFailPerc = v5;
  self->_txVIDroppedPerc = v6;
  self->_txVINoBuffPerc = v7;
  self->_txVINoResPerc = v8;
  self->_txVINoAckPerc = v9;
  self->_txVIChipModeErrPerc = v10;
  self->_txVIExpiredPerc = v11;
  self->_txVIFailPerc = v12;
  self->_txVIFwFreePerc = v13;
  self->_txVIMaxRetriesPerc = v14;
  self->_txVIForceExpirePerc = v15;
  +[WiFiUsageLQMTransformations txErrorsPercentagesWithtxSuccess:txDropped:txNoBuff:txNoRes:txNoAck:txChipModeErr:txExpired:txFail:txFwFree:txMaxRetries:txForceExpire:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "txErrorsPercentagesWithtxSuccess:txDropped:txNoBuff:txNoRes:txNoAck:txChipModeErr:txExpired:txFail:txFwFree:txMaxRet ries:txForceExpire:",  self->_txVOSuccessPerc,  self->_txVODroppedPerc,  self->_txVONoBuffPerc,  self->_txVONoResPerc,  self->_txVONoAckPerc,  self->_txVOChipModeErrPerc,  self->_txVOExpiredPerc,  self->_txVOFailPerc,  self->_txVOFwFreePerc,  self->_txVOMaxRetriesPerc,  self->_txVOForceExpirePerc);
  self->_txVO = v3;
  self->_txVOSuccessPerc = v4;
  self->_txVOAllFailPerc = v5;
  self->_txVODroppedPerc = v6;
  self->_txVONoBuffPerc = v7;
  self->_txVONoResPerc = v8;
  self->_txVONoAckPerc = v9;
  self->_txVOChipModeErrPerc = v10;
  self->_txVOExpiredPerc = v11;
  self->_txVOFailPerc = v12;
  self->_txVOFwFreePerc = v13;
  self->_txVOMaxRetriesPerc = v14;
  self->_txVOForceExpirePerc = v15;
}

- (unint64_t)txBE
{
  return self->_txBE;
}

- (unint64_t)txBESuccessPerc
{
  return self->_txBESuccessPerc;
}

- (unint64_t)txBEAllFailPerc
{
  return self->_txBEAllFailPerc;
}

- (unint64_t)txBEDroppedPerc
{
  return self->_txBEDroppedPerc;
}

- (unint64_t)txBENoBuffPerc
{
  return self->_txBENoBuffPerc;
}

- (unint64_t)txBENoResPerc
{
  return self->_txBENoResPerc;
}

- (unint64_t)txBENoAckPerc
{
  return self->_txBENoAckPerc;
}

- (unint64_t)txBEChipModeErrPerc
{
  return self->_txBEChipModeErrPerc;
}

- (unint64_t)txBEExpiredPerc
{
  return self->_txBEExpiredPerc;
}

- (unint64_t)txBEFailPerc
{
  return self->_txBEFailPerc;
}

- (unint64_t)txBEFwFreePerc
{
  return self->_txBEFwFreePerc;
}

- (unint64_t)txBEMaxRetriesPerc
{
  return self->_txBEMaxRetriesPerc;
}

- (unint64_t)txBEForceExpirePerc
{
  return self->_txBEForceExpirePerc;
}

- (unint64_t)txBK
{
  return self->_txBK;
}

- (unint64_t)txBKSuccessPerc
{
  return self->_txBKSuccessPerc;
}

- (unint64_t)txBKAllFailPerc
{
  return self->_txBKAllFailPerc;
}

- (unint64_t)txBKDroppedPerc
{
  return self->_txBKDroppedPerc;
}

- (unint64_t)txBKNoBuffPerc
{
  return self->_txBKNoBuffPerc;
}

- (unint64_t)txBKNoResPerc
{
  return self->_txBKNoResPerc;
}

- (unint64_t)txBKNoAckPerc
{
  return self->_txBKNoAckPerc;
}

- (unint64_t)txBKChipModeErrPerc
{
  return self->_txBKChipModeErrPerc;
}

- (unint64_t)txBKExpiredPerc
{
  return self->_txBKExpiredPerc;
}

- (unint64_t)txBKFailPerc
{
  return self->_txBKFailPerc;
}

- (unint64_t)txBKFwFreePerc
{
  return self->_txBKFwFreePerc;
}

- (unint64_t)txBKMaxRetriesPerc
{
  return self->_txBKMaxRetriesPerc;
}

- (unint64_t)txBKForceExpirePerc
{
  return self->_txBKForceExpirePerc;
}

- (unint64_t)txVI
{
  return self->_txVI;
}

- (unint64_t)txVISuccessPerc
{
  return self->_txVISuccessPerc;
}

- (unint64_t)txVIAllFailPerc
{
  return self->_txVIAllFailPerc;
}

- (unint64_t)txVIDroppedPerc
{
  return self->_txVIDroppedPerc;
}

- (unint64_t)txVINoBuffPerc
{
  return self->_txVINoBuffPerc;
}

- (unint64_t)txVINoResPerc
{
  return self->_txVINoResPerc;
}

- (unint64_t)txVINoAckPerc
{
  return self->_txVINoAckPerc;
}

- (unint64_t)txVIChipModeErrPerc
{
  return self->_txVIChipModeErrPerc;
}

- (unint64_t)txVIExpiredPerc
{
  return self->_txVIExpiredPerc;
}

- (unint64_t)txVIFailPerc
{
  return self->_txVIFailPerc;
}

- (unint64_t)txVIFwFreePerc
{
  return self->_txVIFwFreePerc;
}

- (unint64_t)txVIMaxRetriesPerc
{
  return self->_txVIMaxRetriesPerc;
}

- (unint64_t)txVIForceExpirePerc
{
  return self->_txVIForceExpirePerc;
}

- (unint64_t)txVO
{
  return self->_txVO;
}

- (unint64_t)txVOSuccessPerc
{
  return self->_txVOSuccessPerc;
}

- (unint64_t)txVOAllFailPerc
{
  return self->_txVOAllFailPerc;
}

- (unint64_t)txVODroppedPerc
{
  return self->_txVODroppedPerc;
}

- (unint64_t)txVONoBuffPerc
{
  return self->_txVONoBuffPerc;
}

- (unint64_t)txVONoResPerc
{
  return self->_txVONoResPerc;
}

- (unint64_t)txVONoAckPerc
{
  return self->_txVONoAckPerc;
}

- (unint64_t)txVOChipModeErrPerc
{
  return self->_txVOChipModeErrPerc;
}

- (unint64_t)txVOExpiredPerc
{
  return self->_txVOExpiredPerc;
}

- (unint64_t)txVOFailPerc
{
  return self->_txVOFailPerc;
}

- (unint64_t)txVOFwFreePerc
{
  return self->_txVOFwFreePerc;
}

- (unint64_t)txVOMaxRetriesPerc
{
  return self->_txVOMaxRetriesPerc;
}

- (unint64_t)txVOForceExpirePerc
{
  return self->_txVOForceExpirePerc;
}

@end