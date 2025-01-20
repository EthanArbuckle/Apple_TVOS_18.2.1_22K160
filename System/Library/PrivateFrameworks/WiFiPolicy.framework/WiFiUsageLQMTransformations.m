@interface WiFiUsageLQMTransformations
+ ($06626BA963112C91E7E52BBD3AECAE4D)ctrlFrmsPercentagesWithRxCtrlUcast:(SEL)a3 RTS:(unint64_t)a4 CTS:(unint64_t)a5 BACK:(unint64_t)a6 ACK:(unint64_t)a7;
+ ($3CC19D079FD0B010EE84973AA846B91B)decodingAttemptsWithRxCrsGlitch:(SEL)a3 rxBadPLCP:(unint64_t)a4 RxBphyCrsGlitch:(unint64_t)a5 rxBphyBadPLCP:(unint64_t)a6 rxStart:(unint64_t)a7;
+ ($3CC19D079FD0B010EE84973AA846B91B)rxUcastPercentagesWithRxData:(SEL)a3 rxMgmt:(unint64_t)a4 rxCtrl:(unint64_t)a5;
+ ($50828A08DC8D0425568E958C1030530A)ratePercentagesWithTxRate:(SEL)a3 rxRate:(unint64_t)a4 txFallbackRate:(unint64_t)a5 txFrames:(unint64_t)a6 rxFrames:(unint64_t)a7 nss:(unint64_t)a8 bw:(unint64_t)a9 phyMode:(unint64_t)a10 band:(int)a11 deviceMaxRate:(int)a12;
+ ($9D2DAF67E984336BD89D1161AD44CF98)txErrorsPercentagesWithtxSuccess:(SEL)a3 txDropped:(unint64_t)a4 txNoBuff:(unint64_t)a5 txNoRes:(unint64_t)a6 txNoAck:(unint64_t)a7 txChipModeErr:(unint64_t)a8 txExpired:(unint64_t)a9 txFail:(unint64_t)a10 txFwFree:(unint64_t)a11 txMaxRetries:(unint64_t)a12 txForceExpire:(unint64_t)a13;
+ ($AA6A45B2DFCED8527C3A0E9A46B0D48F)rxDecodingErrorsPercentagesWithRxFrmTooLong:(SEL)a3 rxFrmTooShrt:(unint64_t)a4 rxBadFCS:(unint64_t)a5 rxResponseTimeout:(unint64_t)a6 rxNoDelim:(unint64_t)a7 rxAnyErr:(unint64_t)a8 rxFifo0Ovfl:(unint64_t)a9 rxFifo1Ovfl:(unint64_t)a10;
+ ($F99D9A4FB75BC57F3386B8DC8EE08D7A)ccaStatsWithDuration:(SEL)a3 ccaSelf:(unint64_t)a4 ccaOther:(unint64_t)a5 interference:(unint64_t)a6;
+ (id)dateWithMachContinuousTime:(unint64_t)a3 WithRef:(id)a4 asNS:(unint64_t)a5;
+ (id)getBinBytesPerFrame:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinBytesPerPacket:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinDecodingAttempts:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinDesense:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinEvery10thOverRatioScale:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinForDouble:(double)a3 In:(id)a4 WithLowestEdge:(id)a5 As:(unint64_t)a6;
+ (id)getBinForRoamingLatency:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinFrames:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinMpduDensity:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinNetworkQualityResponsiveness:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinNoise:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinQueuedAmpdu:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinRTT:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinRetries:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinRssi:(int64_t)a3 As:(unint64_t)a4;
+ (id)getBinScannedChannels:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinSnr:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinThroughput:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinTimeIntervalUpTo12h:(double)a3 As:(unint64_t)a4;
+ (id)getBinTimeIntervalUpTo60s:(double)a3 As:(unint64_t)a4;
+ (id)getLabelPingPongStats:(id)a3;
+ (id)getLabelTrafficState:(unint64_t)a3;
+ (id)numberForKeyPath:(id)a3 ofObject:(id)a4;
+ (id)ofdmDesenseReason:(unint64_t)a3;
+ (id)scanClient:(unint64_t)a3;
+ (int)maxPhyModeFrom:(int)a3;
+ (unint64_t)byteScale;
+ (unint64_t)getMaxPhyrateWithNss:(unint64_t)a3 Bw:(unint64_t)a4 Phy:(int)a5;
+ (unint64_t)mpduDensityScale;
+ (unint64_t)rateFromRatePercentage:(int64_t)a3 linkMaxRate:(unint64_t)a4;
+ (unint64_t)ratioScale;
+ (unint64_t)ratioWithValue:(unint64_t)a3 Over:(unint64_t)a4 WithScale:(unint64_t)a5;
+ (unint64_t)validateRate:(unint64_t)a3 frames:(unint64_t)a4;
+ (void)initialize;
+ (void)updateConfig;
@end

@implementation WiFiUsageLQMTransformations

+ (void)initialize
{
  _ratioScale = 100LL;
  _byteScale = 1;
  _decimalsScale = 10LL;
  _minFramesForRates = 20LL;
  _minDurationCCAms = 100LL;
  NSLog( @"%s: ratioScale set to %lu ; decimalScale set to %lu ; minFramesForRates set to %lu ; minDurationCCAms set to %lu",
    a2,
    "+[WiFiUsageLQMTransformations initialize]",
    100LL,
    10LL,
    20LL,
    100LL);
}

+ (void)updateConfig
{
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [v6 objectForKey:@"ratioScale"];
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (v2)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          _ratioScale = [v2 unsignedLongValue];
        }
      }

      [v6 objectForKey:@"decimalsScale"];
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          _decimalsScale = [v3 unsignedLongValue];
        }
      }

      [v6 objectForKey:@"minFramesForRates"];
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          _minFramesForRates = [v4 unsignedLongValue];
        }
      }

      [v6 objectForKey:@"minDurationForCCAms"];
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          _minDurationCCAms = [v5 unsignedLongValue];
        }
      }
    }
  }

  NSLog( @"%s: ratioScale set to %lu ; minFramesForRates set to %lu ; minDurationCCAms set to %lu",
    "+[WiFiUsageLQMTransformations updateConfig]",
    _ratioScale,
    _minFramesForRates,
    _minDurationCCAms);
}

+ (unint64_t)ratioScale
{
  return _ratioScale;
}

+ (unint64_t)byteScale
{
  return _byteScale;
}

+ (unint64_t)mpduDensityScale
{
  return _decimalsScale;
}

+ (id)numberForKeyPath:(id)a3 ofObject:(id)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v4;
    if ([v5 unsignedLongValue] == 0x7FFFFFFFFFFFFFFFLL) {
      id v6 = 0LL;
    }
    else {
      id v6 = v5;
    }
    id v7 = v6;
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

+ ($3CC19D079FD0B010EE84973AA846B91B)decodingAttemptsWithRxCrsGlitch:(SEL)a3 rxBadPLCP:(unint64_t)a4 RxBphyCrsGlitch:(unint64_t)a5 rxBphyBadPLCP:(unint64_t)a6 rxStart:(unint64_t)a7
{
  unint64_t v8 = a6 + a4 + a5 + a7 + a8;
  unint64_t v9 = (unint64_t)((double)(_ratioScale * (a6 + a4)) / (double)v8);
  unint64_t v10 = (unint64_t)((double)(_ratioScale * (a7 + a5)) / (double)v8);
  double v11 = (double)(_ratioScale * a8);
  retstr->var0 = v8;
  retstr->var1 = v9;
  retstr->var2 = v10;
  retstr->var3 = (unint64_t)(v11 / (double)v8);
  return result;
}

+ (unint64_t)validateRate:(unint64_t)a3 frames:(unint64_t)a4
{
  unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 && a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (_minFramesForRates <= a4) {
      return a3;
    }
    else {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return result;
}

+ ($50828A08DC8D0425568E958C1030530A)ratePercentagesWithTxRate:(SEL)a3 rxRate:(unint64_t)a4 txFallbackRate:(unint64_t)a5 txFrames:(unint64_t)a6 rxFrames:(unint64_t)a7 nss:(unint64_t)a8 bw:(unint64_t)a9 phyMode:(unint64_t)a10 band:(int)a11 deviceMaxRate:(int)a12
{
  if (a12) {
    BOOL v19 = 0;
  }
  else {
    BOOL v19 = a11 == 256;
  }
  if (v19) {
    int v20 = 128;
  }
  else {
    int v20 = a11;
  }
  int64x2_t v21 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  *(int64x2_t *)&retstr->var0 = v21;
  *(int64x2_t *)&retstr->var2 = v21;
  *(int64x2_t *)&retstr->var4 = v21;
  if (a9 != 0x7FFFFFFFFFFFFFFFLL && a10 != 0x7FFFFFFFFFFFFFFFLL && v20 != 0)
  {
    unint64_t result = +[WiFiUsageLQMTransformations getMaxPhyrateWithNss:Bw:Phy:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "getMaxPhyrateWithNss:Bw:Phy:",  a9);
    unint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
    if (result && result != ($50828A08DC8D0425568E958C1030530A *)0x7FFFFFFFFFFFFFFFLL)
    {
      else {
        unint64_t v25 = (unint64_t)result;
      }
      if (a4 != 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v23 = _ratioScale * a4 / v25;
      }
      retstr->var0 = v23;
      unint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
      if (a5 != 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v26 = _ratioScale * a5 / v25;
      }
      retstr->var1 = v26;
      if (_minFramesForRates <= a7) {
        unint64_t v27 = _ratioScale * a6 / v25;
      }
      else {
        unint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
      }
      retstr->var4 = v27;
      retstr->var5 = v25;
    }
  }

  if (a13) {
    BOOL v28 = a13 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v28 = 1;
  }
  if (!v28)
  {
    unint64_t v29 = _minFramesForRates;
    unint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
    if (a4 != 0x7FFFFFFFFFFFFFFFLL && _minFramesForRates <= a7) {
      unint64_t v31 = _ratioScale * a4 / a13;
    }
    retstr->var2 = v31;
    if (a5 != 0x7FFFFFFFFFFFFFFFLL && v29 <= a8) {
      unint64_t v30 = _ratioScale * a5 / a13;
    }
    retstr->var3 = v30;
  }

  return result;
}

+ (unint64_t)rateFromRatePercentage:(int64_t)a3 linkMaxRate:(unint64_t)a4
{
  unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && a4 == 0x7FFFFFFFFFFFFFFFLL) {
    return a3;
  }
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && a4 != 0x7FFFFFFFFFFFFFFFLL) {
    return (unint64_t)((double)a3 / (double)(unint64_t)_ratioScale * (double)a4);
  }
  return result;
}

+ (unint64_t)ratioWithValue:(unint64_t)a3 Over:(unint64_t)a4 WithScale:(unint64_t)a5
{
  unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && a4 && a4 != 0x7FFFFFFFFFFFFFFFLL) {
    return a5 * a3 / a4;
  }
  return result;
}

+ ($06626BA963112C91E7E52BBD3AECAE4D)ctrlFrmsPercentagesWithRxCtrlUcast:(SEL)a3 RTS:(unint64_t)a4 CTS:(unint64_t)a5 BACK:(unint64_t)a6 ACK:(unint64_t)a7
{
  retstr->var0 = a4;
  if (a4)
  {
    unint64_t v8 = _ratioScale * a5 / a4;
    unint64_t v9 = _ratioScale * a6 / a4;
    unint64_t v10 = _ratioScale * a7 / a4;
    unint64_t v11 = _ratioScale * a8 / a4;
  }

  else
  {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }

  retstr->var1 = v8;
  retstr->var2 = v9;
  retstr->var3 = v10;
  retstr->var4 = v11;
  return result;
}

+ ($3CC19D079FD0B010EE84973AA846B91B)rxUcastPercentagesWithRxData:(SEL)a3 rxMgmt:(unint64_t)a4 rxCtrl:(unint64_t)a5
{
  unint64_t v6 = a5 + a4 + a6;
  retstr->var0 = v6;
  if (v6)
  {
    unint64_t v7 = _ratioScale * a4 / v6;
    unint64_t v8 = _ratioScale * a5 / v6;
    unint64_t v9 = _ratioScale * a6 / v6;
  }

  else
  {
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  retstr->var1 = v7;
  retstr->var2 = v8;
  retstr->var3 = v9;
  return result;
}

+ ($AA6A45B2DFCED8527C3A0E9A46B0D48F)rxDecodingErrorsPercentagesWithRxFrmTooLong:(SEL)a3 rxFrmTooShrt:(unint64_t)a4 rxBadFCS:(unint64_t)a5 rxResponseTimeout:(unint64_t)a6 rxNoDelim:(unint64_t)a7 rxAnyErr:(unint64_t)a8 rxFifo0Ovfl:(unint64_t)a9 rxFifo1Ovfl:(unint64_t)a10
{
  unint64_t v11 = a5 + a4 + a6 + a7 + a8 + a9 + a10 + a11;
  retstr->var0 = v11;
  if (v11)
  {
    unint64_t result = ($AA6A45B2DFCED8527C3A0E9A46B0D48F *)_ratioScale;
    unint64_t v12 = _ratioScale * a4 / v11;
    unint64_t v13 = _ratioScale * a5 / v11;
    unint64_t v14 = _ratioScale * a6 / v11;
    unint64_t v15 = _ratioScale * a7 / v11;
    unint64_t v16 = _ratioScale * a8 / v11;
    unint64_t v17 = _ratioScale * a9 / v11;
    unint64_t v18 = _ratioScale * a10 / v11;
    unint64_t v19 = _ratioScale * a11 / v11;
  }

  else
  {
    unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  }

  retstr->var1 = v12;
  retstr->var2 = v13;
  retstr->var3 = v14;
  retstr->var4 = v15;
  retstr->var5 = v16;
  retstr->var6 = v18;
  retstr->var7 = v19;
  retstr->var8 = v17;
  return result;
}

+ (id)dateWithMachContinuousTime:(unint64_t)a3 WithRef:(id)a4 asNS:(unint64_t)a5
{
  return (id)[MEMORY[0x189603F50] dateWithTimeInterval:a4 sinceDate:(double)(a5 - a3) / -1000000000.0];
}

+ ($9D2DAF67E984336BD89D1161AD44CF98)txErrorsPercentagesWithtxSuccess:(SEL)a3 txDropped:(unint64_t)a4 txNoBuff:(unint64_t)a5 txNoRes:(unint64_t)a6 txNoAck:(unint64_t)a7 txChipModeErr:(unint64_t)a8 txExpired:(unint64_t)a9 txFail:(unint64_t)a10 txFwFree:(unint64_t)a11 txMaxRetries:(unint64_t)a12 txForceExpire:(unint64_t)a13
{
  unint64_t v14 = a5 + a4 + a6 + a7 + a8 + a9 + a10 + a11 + a12 + a13 + a14;
  retstr->var0 = v14;
  if (v14)
  {
    unint64_t result = ($9D2DAF67E984336BD89D1161AD44CF98 *)_ratioScale;
    unint64_t v15 = _ratioScale * (a6 + a5 + a7 + a8 + a9 + a10 + a11 + a12 + a13 + a14) / v14;
    retstr->var1 = _ratioScale * a4 / v14;
    retstr->var2 = v15;
    retstr->var3 = (unint64_t)result * a5 / v14;
    retstr->var4 = (unint64_t)result * a6 / v14;
    retstr->var5 = (unint64_t)result * a7 / v14;
    retstr->var6 = (unint64_t)result * a8 / v14;
    retstr->var7 = (unint64_t)result * a9 / v14;
    unint64_t v16 = (unint64_t)result * a10 / v14;
    unint64_t v17 = (unint64_t)result * a11 / v14;
    unint64_t v18 = (unint64_t)result * a12 / v14;
    unint64_t v19 = (unint64_t)result * a13 / v14;
    unint64_t v20 = (unint64_t)result * a14 / v14;
  }

  else
  {
    unint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    int64x2_t v21 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    *(int64x2_t *)&retstr->var1 = v21;
    *(int64x2_t *)&retstr->var3 = v21;
    *(int64x2_t *)&retstr->var5 = v21;
    retstr->var7 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
  }

  retstr->var8 = v16;
  retstr->var9 = v17;
  retstr->var10 = v18;
  retstr->var11 = v19;
  retstr->var12 = v20;
  return result;
}

+ ($F99D9A4FB75BC57F3386B8DC8EE08D7A)ccaStatsWithDuration:(SEL)a3 ccaSelf:(unint64_t)a4 ccaOther:(unint64_t)a5 interference:(unint64_t)a6
{
  unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (_minDurationCCAms <= a4) {
    unint64_t v8 = a5;
  }
  else {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (_minDurationCCAms <= a4) {
    unint64_t v9 = a6;
  }
  else {
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (_minDurationCCAms <= a4) {
    unint64_t v7 = a7;
  }
  retstr->var0 = v8;
  retstr->var1 = v9;
  retstr->var2 = v7;
  return result;
}

+ (id)ofdmDesenseReason:(unint64_t)a3
{
  v24[8] = *MEMORY[0x1895F89C0];
  v23[0] = &unk_18A1B3CA8;
  v23[1] = &unk_18A1B3CC0;
  v24[0] = @"GDB(bPhy)";
  v24[1] = @"GDB(ofdm)";
  v23[2] = &unk_18A1B3CD8;
  v23[3] = &unk_18A1B3CF0;
  v24[2] = @"BTCoex(bPhy)";
  v24[3] = @"BTCoex(ofdm)";
  v23[4] = &unk_18A1B3D08;
  v23[5] = &unk_18A1B3D20;
  v24[4] = @"LTECoex(bPhy)";
  v24[5] = @"LTECoex(ofdm)";
  v23[6] = &unk_18A1B3D38;
  v23[7] = &unk_18A1B3D50;
  v24[6] = @"InitGainOrCRS(bPhy)";
  v24[7] = @"initGainOrCRS(ofdm)";
  [MEMORY[0x189603F68] dictionaryWithObjects:v24 forKeys:v23 count:8];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = (void *)objc_opt_new();
  if ((a3 & 1) != 0)
  {
    [MEMORY[0x189607968] numberWithUnsignedLong:a3];
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:v9];
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 appendFormat:@"%@&", v10];

    if ((a3 & 2) == 0)
    {
LABEL_3:
      if ((a3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }

  else if ((a3 & 2) == 0)
  {
    goto LABEL_3;
  }

  [MEMORY[0x189607968] numberWithUnsignedLong:a3];
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:v11];
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 appendFormat:@"%@&", v12];

  if ((a3 & 4) == 0)
  {
LABEL_4:
    if ((a3 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }

+ (id)scanClient:(unint64_t)a3
{
  v9[2] = *MEMORY[0x1895F89C0];
  v8[0] = &unk_18A1B3D68;
  v8[1] = &unk_18A1B3CA8;
  v9[0] = @"AWDL";
  v9[1] = @"NAN";
  [MEMORY[0x189603F68] dictionaryWithObjects:v9 forKeys:v8 count:2];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithUnsignedLong:a3];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:v5];
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)getBinForDouble:(double)a3 In:(id)a4 WithLowestEdge:(id)a5 As:(unint64_t)a6
{
  id v9 = a4;
  unint64_t v10 = (__CFString *)a5;
  if ([v9 count])
  {
    unint64_t v11 = 0LL;
    unint64_t v12 = 0LL;
    while (1)
    {
      [v9 objectAtIndexedSubscript:v11];
      unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 doubleValue];
      double v15 = v14;

      if (v15 >= a3) {
        break;
      }
      [v9 objectAtIndexedSubscript:v11];
      unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

      ++v11;
      unint64_t v12 = v16;
      if ([v9 count] <= v11) {
        goto LABEL_8;
      }
    }

    unint64_t v16 = v12;
  }

  else
  {
    unint64_t v16 = 0LL;
    unint64_t v11 = 0LL;
  }

+ (id)getBinEvery10thOverRatioScale:(unint64_t)a3 As:(unint64_t)a4
{
  v19[11] = *MEMORY[0x1895F89C0];
  v19[0] = &unk_18A1B3D68;
  [MEMORY[0x189607968] numberWithDouble:(double)(unint64_t)_ratioScale * 0.1];
  unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v16;
  [MEMORY[0x189607968] numberWithDouble:(double)(unint64_t)_ratioScale * 0.2];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v4;
  [MEMORY[0x189607968] numberWithDouble:(double)(unint64_t)_ratioScale * 0.3];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v5;
  [MEMORY[0x189607968] numberWithDouble:(double)(unint64_t)_ratioScale * 0.4];
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v6;
  [MEMORY[0x189607968] numberWithDouble:(double)(unint64_t)_ratioScale * 0.5];
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v7;
  [MEMORY[0x189607968] numberWithDouble:(double)(unint64_t)_ratioScale * 0.6];
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v8;
  [MEMORY[0x189607968] numberWithDouble:(double)(unint64_t)_ratioScale * 0.7];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[7] = v9;
  [MEMORY[0x189607968] numberWithDouble:(double)(unint64_t)_ratioScale * 0.8];
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[8] = v10;
  [MEMORY[0x189607968] numberWithDouble:(double)(unint64_t)_ratioScale * 0.9];
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[9] = v11;
  [MEMORY[0x189607968] numberWithUnsignedInteger:_ratioScale];
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[10] = v12;
  [MEMORY[0x189603F18] arrayWithObjects:v19 count:11];
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinFor:In:WithLowestEdge:As:",  a3,  v13,  @"0",  a4);
  double v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)getBinRssi:(int64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinFor:In:WithLowestEdge:As:",  a3,  &unk_18A1B57F8,  @"-inf",  a4);
}

+ (id)getBinNoise:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinFor:In:WithLowestEdge:As:",  a3,  &unk_18A1B5810,  @"-inf",  a4);
}

+ (id)getBinSnr:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinFor:In:WithLowestEdge:As:",  a3,  &unk_18A1B5828,  @"0",  a4);
}

+ (id)getBinDecodingAttempts:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinFor:In:WithLowestEdge:As:",  a3,  &unk_18A1B5840,  @"0",  a4);
}

+ (id)getBinRetries:(unint64_t)a3 As:(unint64_t)a4
{
  return @"TODO: Find a valid range for RetriesPerFrames and define bins";
}

+ (id)getBinBytesPerFrame:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinFor:In:WithLowestEdge:As:",  a3,  &unk_18A1B5858,  @"0",  a4);
}

+ (id)getBinBytesPerPacket:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinFor:In:WithLowestEdge:As:",  a3,  &unk_18A1B5870,  @"0",  a4);
}

+ (id)getBinMpduDensity:(unint64_t)a3 As:(unint64_t)a4
{
  return (id)[a1 getBinForDouble:&unk_18A1B5888 In:@"0" WithLowestEdge:a4 As:(double)a3 / (double)(unint64_t)_decimalsScale];
}

+ (id)getBinFrames:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinFor:In:WithLowestEdge:As:",  a3,  &unk_18A1B58A0,  @"0",  a4);
}

+ (id)getBinForRoamingLatency:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinFor:In:WithLowestEdge:As:",  a3,  &unk_18A1B58B8,  @"0",  a4);
}

+ (id)getBinTimeIntervalUpTo12h:(double)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinFor:In:WithLowestEdge:As:",  (unint64_t)a3,  &unk_18A1B58D0,  @"0",  a4);
}

+ (id)getBinTimeIntervalUpTo60s:(double)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinFor:In:WithLowestEdge:As:",  (unint64_t)a3,  &unk_18A1B58E8,  @"0",  a4);
}

+ (id)getBinQueuedAmpdu:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinFor:In:WithLowestEdge:As:",  a3,  &unk_18A1B5900,  @"0",  a4);
}

+ (id)getBinNetworkQualityResponsiveness:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinFor:In:WithLowestEdge:As:",  a3,  &unk_18A1B5918,  @"0",  a4);
}

+ (id)getBinThroughput:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinFor:In:WithLowestEdge:As:",  a3,  &unk_18A1B5930,  @"0",  a4);
}

+ (id)getBinRTT:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinFor:In:WithLowestEdge:As:",  a3,  &unk_18A1B5948,  @"0",  a4);
}

+ (id)getBinScannedChannels:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinFor:In:WithLowestEdge:As:",  a3,  &unk_18A1B5960,  @"0",  a4);
}

+ (id)getBinDesense:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinFor:In:WithLowestEdge:As:",  a3,  &unk_18A1B5978,  @"0",  a4);
}

+ (id)getLabelTrafficState:(unint64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0LL;
  }

  else
  {
    unint64_t v6 = @"VO|";
    unint64_t v7 = &stru_18A170410;
    if ((a3 & 8) == 0) {
      unint64_t v6 = &stru_18A170410;
    }
    unint64_t v8 = @"VI|";
    if ((a3 & 4) == 0) {
      unint64_t v8 = &stru_18A170410;
    }
    id v9 = @"BE|";
    if ((a3 & 1) == 0) {
      id v9 = &stru_18A170410;
    }
    if ((a3 & 2) != 0) {
      unint64_t v7 = @"BK";
    }
    [NSString stringWithFormat:@"%@%@%@%@", v6, v8, v9, v7, v3, v4];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)getLabelPingPongStats:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = (void *)objc_opt_new();
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    [v3 sequence];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          [v4 appendFormat:@"%@|", *(void *)(*((void *)&v12 + 1) + 8 * i)];
        }

        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v7);
    }

    if ([v4 isEqualToString:&stru_18A170410])
    {
      unint64_t v10 = 0LL;
    }

    else
    {
      [NSString stringWithString:v4];
      unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    unint64_t v10 = 0LL;
  }

  return v10;
}

+ (int)maxPhyModeFrom:(int)a3
{
  int v3 = a3 & 4;
  if ((a3 & 0x22) != 0) {
    int v3 = 2;
  }
  if ((a3 & 0x48) != 0) {
    int v4 = 8;
  }
  else {
    int v4 = v3;
  }
  if ((a3 & 0x10) != 0) {
    int v5 = 16;
  }
  else {
    int v5 = v4;
  }
  if ((a3 & 0x80) != 0) {
    int v6 = 128;
  }
  else {
    int v6 = v5;
  }
  if ((a3 & 0x100) != 0) {
    int v7 = 256;
  }
  else {
    int v7 = v6;
  }
  if ((a3 & 0x200) != 0) {
    return 512;
  }
  else {
    return v7;
  }
}

+ (unint64_t)getMaxPhyrateWithNss:(unint64_t)a3 Bw:(unint64_t)a4 Phy:(int)a5
{
  if (!a5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v5 = *(void *)&a5;
  int v8 = [a1 maxPhyModeFrom:*(void *)&a5];
  if (v8 == 512) {
    int v9 = 256;
  }
  else {
    int v9 = v8;
  }
  uint64_t v10 = (v9 - 2);
  if (v10 <= 0x3E)
  {
    if (v10 == 2) {
      return 11000LL;
    }
    if (v10 == 14)
    {
      uint64_t v12 = 0LL;
      goto LABEL_17;
    }
  }

  if (v9 == 128)
  {
    uint64_t v12 = 1LL;
LABEL_17:
    if ((uint64_t)a4 > 79)
    {
      if (a4 == 80)
      {
        uint64_t v13 = 2LL;
      }

      else
      {
        if (a4 != 160) {
          goto LABEL_28;
        }
        uint64_t v13 = 3LL;
      }
    }

    else
    {
      if (a4 != 20)
      {
        if (a4 == 40)
        {
          uint64_t v13 = 1LL;
          goto LABEL_26;
        }

@end