@interface WiFiUsageLQMKernelSampleInfraTXRX
+ (id)sampleWithStruct:(apple80211_infra_band_tx_rx_stats *)a3 WithReferenceDate:(id)a4 AsNsec:(unint64_t)a5;
- (NSDate)timestamp;
- (WiFiUsageLQMKernelSampleInfraTXRX)initWithStruct:(apple80211_infra_band_tx_rx_stats *)a3 WithReferenceDate:(id)a4 AsNsec:(unint64_t)a5;
- (double)duration;
- (unint64_t)decodingAttempts;
- (unint64_t)rxAnyErrOverDecodingErrors;
- (unint64_t)rxBACKOverRxCtrlFrmsPercentage;
- (unint64_t)rxBadFCSOverDecodingErrors;
- (unint64_t)rxBadPlcpOverDecodingAttemptsPercentage;
- (unint64_t)rxBeaconMbss;
- (unint64_t)rxBeaconObss;
- (unint64_t)rxBeaconOverRxStart;
- (unint64_t)rxCrsGlitchOverDecodingAttemptsPercentage;
- (unint64_t)rxDecodingErrorsOverRxStart;
- (unint64_t)rxFifo0OvflOverDecodingErrors;
- (unint64_t)rxFifo1OvflOverDecodingErrors;
- (unint64_t)rxFrmTooLongOverDecodingErrors;
- (unint64_t)rxFrmTooShrtOverDecodingErrors;
- (unint64_t)rxNoDelimOverDecodingErrors;
- (unint64_t)rxResponseTimeoutOverDecodingErrors;
- (unint64_t)rxStartOverDecodingAttemptsPercentage;
- (unint64_t)rxUcastACKOverRxCtrlFrmsPercentage;
- (unint64_t)rxUcastCTSOverRxCtrlFrmsPercentage;
- (unint64_t)rxUcastCtrlPercentage;
- (unint64_t)rxUcastDataPercentage;
- (unint64_t)rxUcastMgmtPercentage;
- (unint64_t)rxUcastOverRxStart;
- (unint64_t)rxUcastRTSOverRxCtrlFrmsPercentage;
- (unint64_t)txACKOverTxCtrlFrmsPercentage;
- (unint64_t)txAMPDUOverTxAllFrmPercentage;
- (unint64_t)txAllFrm;
- (unint64_t)txBACKOverTxCtrlFrmsPercentage;
- (unint64_t)txCTSOverTxCtrlFrmsPercentage;
- (unint64_t)txCtrlFrms;
- (unint64_t)txPhyErrorOverTxAllFrmPercentage;
- (unint64_t)txRTSFailOvertxRTS;
- (unint64_t)txRTSOverTxCtrlFrmsPercentage;
- (unint64_t)txUcastOverTxAllFrmPercentage;
- (void)setDecodingAttempts:(unint64_t)a3;
- (void)setDuration:(double)a3;
- (void)setRxAnyErrOverDecodingErrors:(unint64_t)a3;
- (void)setRxBACKOverRxCtrlFrmsPercentage:(unint64_t)a3;
- (void)setRxBadFCSOverDecodingErrors:(unint64_t)a3;
- (void)setRxBadPlcpOverDecodingAttemptsPercentage:(unint64_t)a3;
- (void)setRxBeaconMbss:(unint64_t)a3;
- (void)setRxBeaconObss:(unint64_t)a3;
- (void)setRxBeaconOverRxStart:(unint64_t)a3;
- (void)setRxCrsGlitchOverDecodingAttemptsPercentage:(unint64_t)a3;
- (void)setRxDecodingErrorsOverRxStart:(unint64_t)a3;
- (void)setRxFifo0OvflOverDecodingErrors:(unint64_t)a3;
- (void)setRxFifo1OvflOverDecodingErrors:(unint64_t)a3;
- (void)setRxFrmTooLongOverDecodingErrors:(unint64_t)a3;
- (void)setRxFrmTooShrtOverDecodingErrors:(unint64_t)a3;
- (void)setRxNoDelimOverDecodingErrors:(unint64_t)a3;
- (void)setRxResponseTimeoutOverDecodingErrors:(unint64_t)a3;
- (void)setRxStartOverDecodingAttemptsPercentage:(unint64_t)a3;
- (void)setRxUcastACKOverRxCtrlFrmsPercentage:(unint64_t)a3;
- (void)setRxUcastCTSOverRxCtrlFrmsPercentage:(unint64_t)a3;
- (void)setRxUcastCtrlPercentage:(unint64_t)a3;
- (void)setRxUcastDataPercentage:(unint64_t)a3;
- (void)setRxUcastMgmtPercentage:(unint64_t)a3;
- (void)setRxUcastOverRxStart:(unint64_t)a3;
- (void)setRxUcastRTSOverRxCtrlFrmsPercentage:(unint64_t)a3;
- (void)setTimestamp:(id)a3;
- (void)setTxACKOverTxCtrlFrmsPercentage:(unint64_t)a3;
- (void)setTxAMPDUOverTxAllFrmPercentage:(unint64_t)a3;
- (void)setTxAllFrm:(unint64_t)a3;
- (void)setTxBACKOverTxCtrlFrmsPercentage:(unint64_t)a3;
- (void)setTxCTSOverTxCtrlFrmsPercentage:(unint64_t)a3;
- (void)setTxCtrlFrms:(unint64_t)a3;
- (void)setTxPhyErrorOverTxAllFrmPercentage:(unint64_t)a3;
- (void)setTxRTSFailOvertxRTS:(unint64_t)a3;
- (void)setTxRTSOverTxCtrlFrmsPercentage:(unint64_t)a3;
- (void)setTxUcastOverTxAllFrmPercentage:(unint64_t)a3;
@end

@implementation WiFiUsageLQMKernelSampleInfraTXRX

+ (id)sampleWithStruct:(apple80211_infra_band_tx_rx_stats *)a3 WithReferenceDate:(id)a4 AsNsec:(unint64_t)a5
{
  id v7 = a4;
  uint64_t var0 = a3->var0;
  if ((_DWORD)var0)
  {
    NSLog( @"%s - Unknown version: %u",  "+[WiFiUsageLQMKernelSampleInfraTXRX sampleWithStruct:WithReferenceDate:AsNsec:]",  var0);
    v9 = 0LL;
  }

  else
  {
    v9 = -[WiFiUsageLQMKernelSampleInfraTXRX initWithStruct:WithReferenceDate:AsNsec:]( objc_alloc(&OBJC_CLASS___WiFiUsageLQMKernelSampleInfraTXRX),  "initWithStruct:WithReferenceDate:AsNsec:",  a3,  v7,  a5);
  }

  return v9;
}

- (WiFiUsageLQMKernelSampleInfraTXRX)initWithStruct:(apple80211_infra_band_tx_rx_stats *)a3 WithReferenceDate:(id)a4 AsNsec:(unint64_t)a5
{
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMKernelSampleInfraTXRX;
  id v7 = a4;
  v8 = -[WiFiUsageLQMKernelSampleInfraTXRX init](&v41, sel_init);
  uint64_t v9 = +[WiFiUsageLQMTransformations dateWithMachContinuousTime:WithRef:asNS:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "dateWithMachContinuousTime:WithRef:asNS:",  *(void *)(&a3->var0 + 1),  v7,  a5);

  timestamp = v8->_timestamp;
  v8->_timestamp = (NSDate *)v9;

  +[WiFiUsageLQMTransformations decodingAttemptsWithRxCrsGlitch:rxBadPLCP:RxBphyCrsGlitch:rxBphyBadPLCP:rxStart:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "decodingAttemptsWithRxCrsGlitch:rxBadPLCP:RxBphyCrsGlitch:rxBphyBadPLCP:rxStart:",  a3->var7,  a3->var6,  a3->var21,  a3->var22,  a3->var5);
  v8->_decodingAttempts = v37;
  v8->_rxStartOverDecodingAttemptsPercentage = v40;
  v8->_rxBadPlcpOverDecodingAttemptsPercentage = v39;
  v8->_rxCrsGlitchOverDecodingAttemptsPercentage = v38;
  +[WiFiUsageLQMTransformations rxDecodingErrorsPercentagesWithRxFrmTooLong:rxFrmTooShrt:rxBadFCS:rxResponseTimeout:rxNoDelim:rxAnyErr:rxFifo0Ovfl:rxFifo1Ovfl:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "rxDecodingErrorsPercentagesWithRxFrmTooLong:rxFrmTooShrt:rxBadFCS:rxResponseTimeout:rxNoDelim:rxAnyErr:rxFifo0Ovfl:rxFifo1Ovfl:",  HIDWORD(a3->var1),  a3->var2,  a3->var4,  a3->var14,  a3->var15,  a3->var3,  a3->var16,  a3->var17);
  v8->_rxDecodingErrorsOverRxStart = +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "ratioWithValue:Over:WithScale:",  v28,  a3->var5,  +[WiFiUsageLQMTransformations ratioScale]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "ratioScale"));
  v8->_rxFrmTooLongOverDecodingErrors = v30;
  v8->_rxFrmTooShrtOverDecodingErrors = v29;
  v8->_rxAnyErrOverDecodingErrors = v36;
  v8->_rxBadFCSOverDecodingErrors = v31;
  v8->_rxResponseTimeoutOverDecodingErrors = v32;
  v8->_rxNoDelimOverDecodingErrors = v33;
  v8->_rxFifo0OvflOverDecodingErrors = v34;
  v8->_rxFifo1OvflOverDecodingErrors = v35;
  +[WiFiUsageLQMTransformations rxUcastPercentagesWithRxData:rxMgmt:rxCtrl:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "rxUcastPercentagesWithRxData:rxMgmt:rxCtrl:",  a3->var8,  a3->var9,  a3->var10);
  v8->_rxUcastOverRxStart = +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "ratioWithValue:Over:WithScale:",  v24,  a3->var5,  +[WiFiUsageLQMTransformations ratioScale]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "ratioScale"));
  v8->_rxUcastDataPercentage = v25;
  v8->_rxUcastMgmtPercentage = v26;
  v8->_rxUcastCtrlPercentage = v27;
  +[WiFiUsageLQMTransformations ctrlFrmsPercentagesWithRxCtrlUcast:RTS:CTS:BACK:ACK:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "ctrlFrmsPercentagesWithRxCtrlUcast:RTS:CTS:BACK:ACK:",  a3->var10,  a3->var11,  a3->var12,  a3->var13,  a3->var18);
  v8->_rxUcastRTSOverRxCtrlFrmsPercentage = v20;
  v8->_rxUcastCTSOverRxCtrlFrmsPercentage = v21;
  v8->_rxUcastACKOverRxCtrlFrmsPercentage = v23;
  v8->_rxBACKOverRxCtrlFrmsPercentage = v22;
  unint64_t var19 = a3->var19;
  v8->_rxBeaconMbss = var19;
  unint64_t var20 = a3->var20;
  v8->_rxBeaconObss = var20;
  v8->_rxBeaconOverRxStart = +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "ratioWithValue:Over:WithScale:",  (var20 + var19),  a3->var5,  +[WiFiUsageLQMTransformations ratioScale]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "ratioScale"));
  +[WiFiUsageLQMTransformations ctrlFrmsPercentagesWithRxCtrlUcast:RTS:CTS:BACK:ACK:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "ctrlFrmsPercentagesWithRxCtrlUcast:RTS:CTS:BACK:ACK:",  a3->var25 + a3->var24 + a3->var32 + a3->var26);
  v8->_txCtrlFrms = v15;
  v8->_txRTSOverTxCtrlFrmsPercentage = v16;
  v8->_txCTSOverTxCtrlFrmsPercentage = v17;
  v8->_txACKOverTxCtrlFrmsPercentage = v19;
  v8->_txBACKOverTxCtrlFrmsPercentage = v18;
  v8->_txRTSFailOvertxRTS = +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "ratioWithValue:Over:WithScale:",  a3->var24,  a3->var30,  +[WiFiUsageLQMTransformations ratioScale]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "ratioScale"));
  unint64_t var23 = a3->var23;
  v8->_txAllFrm = var23;
  v8->_txPhyErrorOverTxAllFrmPercentage = +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "ratioWithValue:Over:WithScale:",  a3->var29,  var23,  +[WiFiUsageLQMTransformations ratioScale]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "ratioScale"));
  v8->_txAMPDUOverTxAllFrmPercentage = +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "ratioWithValue:Over:WithScale:",  a3->var27,  v8->_txAllFrm,  +[WiFiUsageLQMTransformations ratioScale]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "ratioScale"));
  v8->_txUcastOverTxAllFrmPercentage = +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "ratioWithValue:Over:WithScale:",  a3->var31,  v8->_txAllFrm,  +[WiFiUsageLQMTransformations ratioScale]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "ratioScale"));
  return v8;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (unint64_t)decodingAttempts
{
  return self->_decodingAttempts;
}

- (void)setDecodingAttempts:(unint64_t)a3
{
  self->_decodingAttempts = a3;
}

- (unint64_t)rxStartOverDecodingAttemptsPercentage
{
  return self->_rxStartOverDecodingAttemptsPercentage;
}

- (void)setRxStartOverDecodingAttemptsPercentage:(unint64_t)a3
{
  self->_rxStartOverDecodingAttemptsPercentage = a3;
}

- (unint64_t)rxBadPlcpOverDecodingAttemptsPercentage
{
  return self->_rxBadPlcpOverDecodingAttemptsPercentage;
}

- (void)setRxBadPlcpOverDecodingAttemptsPercentage:(unint64_t)a3
{
  self->_rxBadPlcpOverDecodingAttemptsPercentage = a3;
}

- (unint64_t)rxCrsGlitchOverDecodingAttemptsPercentage
{
  return self->_rxCrsGlitchOverDecodingAttemptsPercentage;
}

- (void)setRxCrsGlitchOverDecodingAttemptsPercentage:(unint64_t)a3
{
  self->_rxCrsGlitchOverDecodingAttemptsPercentage = a3;
}

- (unint64_t)rxDecodingErrorsOverRxStart
{
  return self->_rxDecodingErrorsOverRxStart;
}

- (void)setRxDecodingErrorsOverRxStart:(unint64_t)a3
{
  self->_rxDecodingErrorsOverRxStart = a3;
}

- (unint64_t)rxUcastOverRxStart
{
  return self->_rxUcastOverRxStart;
}

- (void)setRxUcastOverRxStart:(unint64_t)a3
{
  self->_rxUcastOverRxStart = a3;
}

- (unint64_t)rxBeaconOverRxStart
{
  return self->_rxBeaconOverRxStart;
}

- (void)setRxBeaconOverRxStart:(unint64_t)a3
{
  self->_rxBeaconOverRxStart = a3;
}

- (unint64_t)rxFrmTooLongOverDecodingErrors
{
  return self->_rxFrmTooLongOverDecodingErrors;
}

- (void)setRxFrmTooLongOverDecodingErrors:(unint64_t)a3
{
  self->_rxFrmTooLongOverDecodingErrors = a3;
}

- (unint64_t)rxFrmTooShrtOverDecodingErrors
{
  return self->_rxFrmTooShrtOverDecodingErrors;
}

- (void)setRxFrmTooShrtOverDecodingErrors:(unint64_t)a3
{
  self->_rxFrmTooShrtOverDecodingErrors = a3;
}

- (unint64_t)rxAnyErrOverDecodingErrors
{
  return self->_rxAnyErrOverDecodingErrors;
}

- (void)setRxAnyErrOverDecodingErrors:(unint64_t)a3
{
  self->_rxAnyErrOverDecodingErrors = a3;
}

- (unint64_t)rxBadFCSOverDecodingErrors
{
  return self->_rxBadFCSOverDecodingErrors;
}

- (void)setRxBadFCSOverDecodingErrors:(unint64_t)a3
{
  self->_rxBadFCSOverDecodingErrors = a3;
}

- (unint64_t)rxResponseTimeoutOverDecodingErrors
{
  return self->_rxResponseTimeoutOverDecodingErrors;
}

- (void)setRxResponseTimeoutOverDecodingErrors:(unint64_t)a3
{
  self->_rxResponseTimeoutOverDecodingErrors = a3;
}

- (unint64_t)rxNoDelimOverDecodingErrors
{
  return self->_rxNoDelimOverDecodingErrors;
}

- (void)setRxNoDelimOverDecodingErrors:(unint64_t)a3
{
  self->_rxNoDelimOverDecodingErrors = a3;
}

- (unint64_t)rxFifo0OvflOverDecodingErrors
{
  return self->_rxFifo0OvflOverDecodingErrors;
}

- (void)setRxFifo0OvflOverDecodingErrors:(unint64_t)a3
{
  self->_rxFifo0OvflOverDecodingErrors = a3;
}

- (unint64_t)rxFifo1OvflOverDecodingErrors
{
  return self->_rxFifo1OvflOverDecodingErrors;
}

- (void)setRxFifo1OvflOverDecodingErrors:(unint64_t)a3
{
  self->_rxFifo1OvflOverDecodingErrors = a3;
}

- (unint64_t)rxUcastDataPercentage
{
  return self->_rxUcastDataPercentage;
}

- (void)setRxUcastDataPercentage:(unint64_t)a3
{
  self->_rxUcastDataPercentage = a3;
}

- (unint64_t)rxUcastMgmtPercentage
{
  return self->_rxUcastMgmtPercentage;
}

- (void)setRxUcastMgmtPercentage:(unint64_t)a3
{
  self->_rxUcastMgmtPercentage = a3;
}

- (unint64_t)rxUcastCtrlPercentage
{
  return self->_rxUcastCtrlPercentage;
}

- (void)setRxUcastCtrlPercentage:(unint64_t)a3
{
  self->_rxUcastCtrlPercentage = a3;
}

- (unint64_t)rxUcastRTSOverRxCtrlFrmsPercentage
{
  return self->_rxUcastRTSOverRxCtrlFrmsPercentage;
}

- (void)setRxUcastRTSOverRxCtrlFrmsPercentage:(unint64_t)a3
{
  self->_rxUcastRTSOverRxCtrlFrmsPercentage = a3;
}

- (unint64_t)rxUcastCTSOverRxCtrlFrmsPercentage
{
  return self->_rxUcastCTSOverRxCtrlFrmsPercentage;
}

- (void)setRxUcastCTSOverRxCtrlFrmsPercentage:(unint64_t)a3
{
  self->_rxUcastCTSOverRxCtrlFrmsPercentage = a3;
}

- (unint64_t)rxBACKOverRxCtrlFrmsPercentage
{
  return self->_rxBACKOverRxCtrlFrmsPercentage;
}

- (void)setRxBACKOverRxCtrlFrmsPercentage:(unint64_t)a3
{
  self->_rxBACKOverRxCtrlFrmsPercentage = a3;
}

- (unint64_t)rxUcastACKOverRxCtrlFrmsPercentage
{
  return self->_rxUcastACKOverRxCtrlFrmsPercentage;
}

- (void)setRxUcastACKOverRxCtrlFrmsPercentage:(unint64_t)a3
{
  self->_rxUcastACKOverRxCtrlFrmsPercentage = a3;
}

- (unint64_t)rxBeaconMbss
{
  return self->_rxBeaconMbss;
}

- (void)setRxBeaconMbss:(unint64_t)a3
{
  self->_rxBeaconMbss = a3;
}

- (unint64_t)rxBeaconObss
{
  return self->_rxBeaconObss;
}

- (void)setRxBeaconObss:(unint64_t)a3
{
  self->_rxBeaconObss = a3;
}

- (unint64_t)txAllFrm
{
  return self->_txAllFrm;
}

- (void)setTxAllFrm:(unint64_t)a3
{
  self->_txAllFrm = a3;
}

- (unint64_t)txPhyErrorOverTxAllFrmPercentage
{
  return self->_txPhyErrorOverTxAllFrmPercentage;
}

- (void)setTxPhyErrorOverTxAllFrmPercentage:(unint64_t)a3
{
  self->_txPhyErrorOverTxAllFrmPercentage = a3;
}

- (unint64_t)txAMPDUOverTxAllFrmPercentage
{
  return self->_txAMPDUOverTxAllFrmPercentage;
}

- (void)setTxAMPDUOverTxAllFrmPercentage:(unint64_t)a3
{
  self->_txAMPDUOverTxAllFrmPercentage = a3;
}

- (unint64_t)txUcastOverTxAllFrmPercentage
{
  return self->_txUcastOverTxAllFrmPercentage;
}

- (void)setTxUcastOverTxAllFrmPercentage:(unint64_t)a3
{
  self->_txUcastOverTxAllFrmPercentage = a3;
}

- (unint64_t)txCtrlFrms
{
  return self->_txCtrlFrms;
}

- (void)setTxCtrlFrms:(unint64_t)a3
{
  self->_txCtrlFrms = a3;
}

- (unint64_t)txRTSOverTxCtrlFrmsPercentage
{
  return self->_txRTSOverTxCtrlFrmsPercentage;
}

- (void)setTxRTSOverTxCtrlFrmsPercentage:(unint64_t)a3
{
  self->_txRTSOverTxCtrlFrmsPercentage = a3;
}

- (unint64_t)txCTSOverTxCtrlFrmsPercentage
{
  return self->_txCTSOverTxCtrlFrmsPercentage;
}

- (void)setTxCTSOverTxCtrlFrmsPercentage:(unint64_t)a3
{
  self->_txCTSOverTxCtrlFrmsPercentage = a3;
}

- (unint64_t)txBACKOverTxCtrlFrmsPercentage
{
  return self->_txBACKOverTxCtrlFrmsPercentage;
}

- (void)setTxBACKOverTxCtrlFrmsPercentage:(unint64_t)a3
{
  self->_txBACKOverTxCtrlFrmsPercentage = a3;
}

- (unint64_t)txACKOverTxCtrlFrmsPercentage
{
  return self->_txACKOverTxCtrlFrmsPercentage;
}

- (void)setTxACKOverTxCtrlFrmsPercentage:(unint64_t)a3
{
  self->_txACKOverTxCtrlFrmsPercentage = a3;
}

- (unint64_t)txRTSFailOvertxRTS
{
  return self->_txRTSFailOvertxRTS;
}

- (void)setTxRTSFailOvertxRTS:(unint64_t)a3
{
  self->_txRTSFailOvertxRTS = a3;
}

- (void).cxx_destruct
{
}

@end