@interface WiFiUsagePrivacyFilter
+ ($FEE1510A43A03BFC9F45CB2D5A0A197D)getModeCountersByCandidatesByBand:(SEL)a3;
+ ($FEE1510A43A03BFC9F45CB2D5A0A197D)getPercForFloatByBand:(SEL)a3 Over:(id *)a4;
+ ($FEE1510A43A03BFC9F45CB2D5A0A197D)getPercForIntegerByBand:(SEL)a3 Over:(id *)a4;
+ (BOOL)canPerformActionWithSampleRate:(unint64_t)a3;
+ (BOOL)isInternalInstall;
+ (BOOL)isLocallyAdministeredBitSetInBSSData:(id)a3;
+ (BOOL)isLocallyAdministeredBitSetInBSSString:(id)a3;
+ (double)timeSinceBootInSeconds;
+ (id)bandAsString:(int)a3;
+ (id)describeSampleRate:(unint64_t)a3;
+ (id)getBinEvery10Over100:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinFor:(int64_t)a3 In:(id)a4 WithLowestEdge:(id)a5 As:(unint64_t)a6;
+ (id)getBinTimeInterval:(double)a3 As:(unint64_t)a4;
+ (id)getHumanSecondsFromObject:(id)a3;
+ (id)getHumanSecondsFromTimeInterval:(double)a3;
+ (id)getLabelForBandUsageDuration:(id *)a3 overTotalDuration:(double)a4 binned:(BOOL)a5;
+ (id)getLabelForCoreRssiMode:(unint64_t)a3;
+ (id)getLabelForIntegerByBand:(id *)a3;
+ (id)getLabelForIntegerByBand:(id *)a3 In:(id)a4 WithLowestEdge:(id)a5 As:(unint64_t)a6;
+ (id)getLabelForIntegerByBand:(id *)a3 withCap:(BOOL)a4;
+ (id)getLabelForIntegerByBandTransition:(id *)a3 In:(id)a4 WithLowestEdge:(id)a5 As:(unint64_t)a6;
+ (id)getLabelForNeighborsByBand:(id)a3;
+ (id)getLabelForPercIntegerByBand:(id *)a3;
+ (id)getLabelForPhyModes:(int)a3;
+ (id)getLabelForRTCoexType:(unint64_t)a3;
+ (id)getLabelForRssiByBand:(id *)a3;
+ (id)getLabelForRssiDeltaByBand:(id *)a3;
+ (id)getLabelForRssiDeltaByBandTransition:(id *)a3;
+ (id)getLabelForSteeringRequest:(unint64_t)a3;
+ (id)getLabelForTDMode:(int)a3;
+ (id)getLabelForTDTrigger:(int)a3;
+ (id)getLabelForUsbVendor:(unint64_t)a3;
+ (id)getLabelsForNetworkProperties:(id)a3;
+ (id)getSumArrayCountAllBand:(id)a3;
+ (id)localTimestamp:(id)a3;
+ (id)macAddressData:(id)a3;
+ (id)numberWithByteCount:(unint64_t)a3;
+ (id)numberWithDuration:(double)a3;
+ (id)numberWithDurationMillisecond:(double)a3;
+ (id)numberWithFrameCount:(unint64_t)a3;
+ (id)numberWithInstances:(unint64_t)a3;
+ (id)oui:(id)a3;
+ (id)reformatMACAddress:(id)a3;
+ (id)sanitizedOUI:(id)a3;
+ (id)subBandForBSPAsStringFromChannel:(int64_t)a3 andBand:(int)a4;
+ (id)timePercentage:(double)a3 overTotalDuration:(double)a4;
+ (id)toBinString:(id)a3;
+ (id)toHEXString:(char *)a3 length:(unint64_t)a4;
+ (id)twoSigFig:(unint64_t)a3;
+ (int)bandFromAppleChannelSpec:(int)a3;
+ (int)bandFromChanInfo:(id)a3;
+ (int)bandFromChannel:(unint64_t)a3;
+ (int)bandFromFlags:(id)a3 OrChannel:(id)a4;
+ (int)bandFromFlags:(unint64_t)a3;
+ (int64_t)getSumAllBands:(id *)a3;
+ (unint64_t)channelWidthAppleChannelSpec:(int)a3;
+ (unint64_t)channelWidthFromFlags:(unint64_t)a3;
+ (void)initialize;
@end

@implementation WiFiUsagePrivacyFilter

+ (void)initialize
{
  _isInternalInstall = MGGetBoolAnswer();
}

+ (id)numberWithDuration:(double)a3
{
  if (a3 >= 0.0)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

+ (id)numberWithDurationMillisecond:(double)a3
{
  return (id)[MEMORY[0x189607968] numberWithUnsignedInteger:(unint64_t)(a3 * 1000.0)];
}

+ (id)timePercentage:(double)a3 overTotalDuration:(double)a4
{
  if (a4 <= 0.0) {
    return 0LL;
  }
  if (a3 > a4) {
    a3 = a4;
  }
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", (unint64_t)(a3 * 100.0 / a4 + 0.5), v4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)twoSigFig:(unint64_t)a3
{
  if (a3)
  {
    double v3 = (double)a3;
    double v4 = log10((double)a3);
    double v5 = __exp10(floor(v4) + -1.0);
    a3 = (unint64_t)(v5 * (double)(int)(v3 / v5));
  }

  return (id)[MEMORY[0x189607968] numberWithUnsignedInteger:a3];
}

+ (id)numberWithByteCount:(unint64_t)a3
{
  return +[WiFiUsagePrivacyFilter twoSigFig:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "twoSigFig:", a3);
}

+ (id)numberWithFrameCount:(unint64_t)a3
{
  return +[WiFiUsagePrivacyFilter twoSigFig:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "twoSigFig:", a3);
}

+ (id)numberWithInstances:(unint64_t)a3
{
  return (id)[MEMORY[0x189607968] numberWithUnsignedInteger:a3];
}

+ (id)localTimestamp:(id)a3
{
  double v3 = (void *)MEMORY[0x189604020];
  id v4 = a3;
  [v3 defaultTimeZone];
  double v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 secondsFromGMTForDate:v4];
  [MEMORY[0x189603F50] dateWithTimeInterval:v4 sinceDate:(double)v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)describeSampleRate:(unint64_t)a3
{
  if (a3 > 4) {
    return @"unknown";
  }
  else {
    return off_18A16EBA0[a3];
  }
}

+ (BOOL)canPerformActionWithSampleRate:(unint64_t)a3
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  switch(a3)
  {
    case 1uLL:
      goto LABEL_5;
    case 2uLL:
      a3 = 5LL;
      goto LABEL_5;
    case 3uLL:
      a3 = 10LL;
      goto LABEL_5;
    case 4uLL:
      v5[0] = MEMORY[0x1895F87A8];
      v5[1] = 3221225472LL;
      v5[2] = __57__WiFiUsagePrivacyFilter_canPerformActionWithSampleRate___block_invoke;
      v5[3] = &unk_18A16EB80;
      v5[4] = &v6;
      +[WCAFetchWiFiBehaviorParameters fetchWiFiBehaviorWithCompletion:]( &OBJC_CLASS___WCAFetchWiFiBehaviorParameters,  "fetchWiFiBehaviorWithCompletion:",  v5);
      goto LABEL_6;
    default:
      a3 = 49LL;
LABEL_5:
      unint64_t v9 = a3;
LABEL_6:
      BOOL v3 = v7[3] >= (unint64_t)arc4random_uniform(0x63u);
      _Block_object_dispose(&v6, 8);
      return v3;
  }

void __57__WiFiUsagePrivacyFilter_canPerformActionWithSampleRate___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    double v5 = v3;
    [v3 valueForKey:@"kWiFiUsagePrivacySampleRateNetworkName"];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (int)[v4 intValue];

    BOOL v3 = v5;
  }

  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1LL;
  }
}

+ (double)timeSinceBootInSeconds
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  *(void *)uint64_t v8 = 0x1500000001LL;
  size_t v5 = 16LL;
  int v2 = sysctl(v8, 2u, &v6, &v5, 0LL, 0LL);
  double result = 0.0;
  if (!v2)
  {
    double v4 = (double)v7 / 1000000.0 + (double)v6 - *MEMORY[0x189604DA8];
    return CFAbsoluteTimeGetCurrent() - (double)(unint64_t)v4;
  }

  return result;
}

+ (id)getBinFor:(int64_t)a3 In:(id)a4 WithLowestEdge:(id)a5 As:(unint64_t)a6
{
  id v10 = a4;
  v11 = (__CFString *)a5;
  if ([v10 count])
  {
    unint64_t v12 = 0LL;
    v13 = 0LL;
    while (1)
    {
      [v10 objectAtIndexedSubscript:v12];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      int64_t v15 = [v14 integerValue];

      if (v15 >= a3) {
        break;
      }
      [v10 objectAtIndexedSubscript:v12];
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      ++v12;
      v13 = v16;
      if ([v10 count] <= v12) {
        goto LABEL_8;
      }
    }

    v16 = v13;
  }

  else
  {
    v16 = 0LL;
    unint64_t v12 = 0LL;
  }

+ (id)getBinTimeInterval:(double)a3 As:(unint64_t)a4
{
  return (id)[a1 getBinFor:(unint64_t)a3 In:&unk_18A1B59F0 WithLowestEdge:@"0" As:a4];
}

+ (id)getHumanSecondsFromObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v4;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v6 = 0LL;
      goto LABEL_7;
    }

    objc_msgSend( a1,  "getHumanSecondsFromTimeInterval:",  (double)(unint64_t)objc_msgSend(v4, "unsignedIntegerValue"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v6 = v5;
LABEL_7:

  return v6;
}

+ (id)getHumanSecondsFromTimeInterval:(double)a3
{
  id v4 = (void *)objc_opt_new();
  id v5 = v4;
  if (a3 >= 86400.0)
  {
    objc_msgSend(v4, "appendFormat:", @"%lud", (unint64_t)(a3 / 86400.0));
    a3 = a3 - (double)(86400 * (unint64_t)(a3 / 86400.0));
  }

  if (a3 >= 3600.0)
  {
    objc_msgSend(v5, "appendFormat:", @"%luh", (unint64_t)(a3 / 3600.0));
    a3 = a3 - (double)(3600 * (unint64_t)(a3 / 3600.0));
  }

  if (a3 >= 60.0)
  {
    objc_msgSend(v5, "appendFormat:", @"%lum", (unint64_t)(a3 / 60.0));
    a3 = a3 - (double)(60 * (unint64_t)(a3 / 60.0));
  }

  if (a3 > 0.0) {
    objc_msgSend(v5, "appendFormat:", @"%lus", (unint64_t)a3);
  }
  [NSString stringWithString:v5];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)getBinEvery10Over100:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinFor:In:WithLowestEdge:As:",  a3,  &unk_18A1B5A08,  @"0",  a4);
}

+ (id)toHEXString:(char *)a3 length:(unint64_t)a4
{
  id v4 = (__CFString *)a4;
  if (a4)
  {
    uint64_t v6 = malloc((2 * a4) | 1);
    if (v6)
    {
      int v7 = v6;
      uint64_t v8 = v6;
      do
      {
        unsigned int v9 = *a3++;
        *uint64_t v8 = a0123456789abcd[(unint64_t)v9 >> 4];
        v8[1] = a0123456789abcd[v9 & 0xF];
        v8 += 2;
        id v4 = (__CFString *)((char *)v4 - 1);
      }

      while (v4);
      *uint64_t v8 = 0;
      [NSString stringWithUTF8String:v6];
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      free(v7);
    }

    else
    {
      id v4 = 0LL;
    }
  }

  if (v4) {
    id v10 = v4;
  }
  else {
    id v10 = &stru_18A170410;
  }
  v11 = v10;

  return v11;
}

+ (id)macAddressData:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3
    && (id v5 = v3, [v5 UTF8String])
    && (uint64_t v6 = ether_aton((const char *)[v5 UTF8String])) != 0)
  {
    [MEMORY[0x189603F48] dataWithBytes:v6 length:6];
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int v7 = 0LL;
  }

  return v7;
}

+ (id)toBinString:(id)a3
{
  id v3 = a3;
  id v4 = (unsigned __int8 *)[v3 bytes];
  if (![v3 length] && objc_msgSend(v3, "length") != 6)
  {
    NSLog(@"%s %@ is not a mac address", "+[WiFiUsagePrivacyFilter toBinString:]", v3);
    goto LABEL_11;
  }

  id v5 = malloc((8 * [v3 length]) | 1);
  if (!v5)
  {
LABEL_11:
    v11 = 0LL;
    goto LABEL_12;
  }

  uint64_t v6 = v5;
  int v7 = v5;
  if ([v3 length])
  {
    unint64_t v8 = 0LL;
    int v7 = v6;
    do
    {
      uint64_t v9 = 0LL;
      unsigned __int8 v10 = *v4;
      do
      {
        v7[v9] = v10 & 1 | 0x30;
        v10 >>= 1;
        ++v9;
      }

      while ((_DWORD)v9 != 8);
      ++v4;
      ++v8;
      v7 += v9;
    }

    while ([v3 length] > v8);
  }

  _BYTE *v7 = 0;
  [NSString stringWithUTF8String:v6];
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  free(v6);
LABEL_12:
  if (v11) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = &stru_18A170410;
  }
  v13 = v12;

  return v13;
}

+ (BOOL)isLocallyAdministeredBitSetInBSSData:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  BOOL v5 = v3
    && (unint64_t)[v3 length] >= 2
    && [v4 characterAtIndex:1] == 49;

  return v5;
}

+ (BOOL)isLocallyAdministeredBitSetInBSSString:(id)a3
{
  id v3 = a1;
  [a1 macAddressData:a3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = [v3 isLocallyAdministeredBitSetInBSSData:v4];

  return (char)v3;
}

+ (id)reformatMACAddress:(id)a3
{
  id v3 = a3;
  if (v3
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (id v4 = v3, [v4 UTF8String])
    && (BOOL v5 = ether_aton((const char *)[v4 UTF8String])) != 0)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%02x:%02x:%02x:%02x:%02x:%02x",  v5->octet[0],  v5->octet[1],  v5->octet[2],  v5->octet[3],  v5->octet[4],  v5->octet[5]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6;
}

+ (id)oui:(id)a3
{
  id v3 = a3;
  if (v3
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (id v4 = v3, [v4 UTF8String])
    && (BOOL v5 = ether_aton((const char *)[v4 UTF8String])) != 0)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%02x:%02x:%02x",  v5->octet[0],  v5->octet[1],  v5->octet[2]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6;
}

+ (id)sanitizedOUI:(id)a3
{
  id v3 = a3;
  if (v3
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (id v4 = v3, [v4 UTF8String])
    && (BOOL v5 = ether_aton((const char *)[v4 UTF8String])) != 0)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%02x:%02x:%02x",  v5->octet[0] & 0xFC,  v5->octet[1],  v5->octet[2]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6;
}

+ (BOOL)isInternalInstall
{
  return _isInternalInstall;
}

+ (int64_t)getSumAllBands:(id *)a3
{
  uint64_t v3 = 0LL;
  int64_t result = 0LL;
  do
  {
    if (a3->var1[v3]) {
      result += a3->var0[v3];
    }
    ++v3;
  }

  while (v3 != 3);
  return result;
}

+ ($FEE1510A43A03BFC9F45CB2D5A0A197D)getPercForIntegerByBand:(SEL)a3 Over:(id *)a4
{
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[2] = 0u;
  if (a5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    __int128 v7 = *(_OWORD *)&a4->var0[2];
    v9[0] = *(_OWORD *)a4->var0;
    v9[1] = v7;
    int64_t result = ($FEE1510A43A03BFC9F45CB2D5A0A197D *)-[$FEE1510A43A03BFC9F45CB2D5A0A197D getSumAllBands:]( result,  "getSumAllBands:",  v9);
    a5 = (unint64_t)result;
  }

  for (uint64_t i = 0LL; i != 3; ++i)
  {
    if (a4->var1[i])
    {
      retstr->var0[i] = (unint64_t)((double)a4->var0[i] * 100.0 / (double)a5 + 0.5);
      retstr->var1[i] = 1;
    }
  }

  return result;
}

+ ($FEE1510A43A03BFC9F45CB2D5A0A197D)getPercForFloatByBand:(SEL)a3 Over:(id *)a4
{
  uint64_t v5 = 0LL;
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[2] = 0u;
  do
  {
    if (a4->var1[v5])
    {
      retstr->var0[v5] = (unint64_t)(a4->var0[v5] * 100.0 / a5 + 0.5);
      retstr->var1[v5] = 1;
    }

    ++v5;
  }

  while (v5 != 3);
  return result;
}

+ (id)getSumArrayCountAllBand:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (!a3) {
    return 0LL;
  }
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  objc_msgSend(a3, "allValues", 0);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0LL;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += [*(id *)(*((void *)&v10 + 1) + 8 * i) count];
      }

      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v5);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  [MEMORY[0x189607968] numberWithInteger:v6];
  return (id)objc_claimAutoreleasedReturnValue();
}

+ ($FEE1510A43A03BFC9F45CB2D5A0A197D)getModeCountersByCandidatesByBand:(SEL)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v5 = a4;
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[2] = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  [v5 allKeys];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0LL;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        __int128 v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v12, v17, v18);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t v14 = [v13 count];

        if (v14 > v9)
        {
          [v5 objectForKeyedSubscript:v12];
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          unint64_t v9 = [v15 count];

          if (v12)
          {
            [v12 candidateSet];
          }

          else
          {
            __int128 v17 = 0u;
            __int128 v18 = 0u;
          }

          *(_OWORD *)retstr->var0 = v17;
          *(_OWORD *)&retstr->var0[2] = v18;
        }
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v8);
  }

  return result;
}

+ (id)getLabelForIntegerByBand:(id *)a3 withCap:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (void *)objc_opt_new();
  for (uint64_t i = 0LL; i != 3; ++i)
  {
    if (a3->var1[i])
    {
      if (v4 && a3->var0[i] > 5)
      {
        +[WiFiUsagePrivacyFilter bandAsString:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "bandAsString:", i);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 appendFormat:@"%@GHz>%d ", v8, 5];
      }

      else
      {
        +[WiFiUsagePrivacyFilter bandAsString:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "bandAsString:", i);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 appendFormat:@"%@GHz:%lu ", v8, a3->var0[i]];
      }
    }
  }

  if ([v6 isEqualToString:&stru_18A170410])
  {
    unint64_t v9 = 0LL;
  }

  else
  {
    [NSString stringWithString:v6];
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)getLabelForIntegerByBand:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0[2];
  v5[0] = *(_OWORD *)a3->var0;
  v5[1] = v3;
  [a1 getLabelForIntegerByBand:v5 withCap:0];
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)getLabelForIntegerByBand:(id *)a3 In:(id)a4 WithLowestEdge:(id)a5 As:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a5;
  __int128 v12 = (void *)objc_opt_new();
  uint64_t v13 = 0LL;
  if (a6 == 2) {
    unint64_t v14 = @"<=";
  }
  else {
    unint64_t v14 = @":";
  }
  do
  {
    if (a3->var1[v13])
    {
      [a1 bandAsString:v13];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      [a1 getBinFor:a3->var0[v13] In:v10 WithLowestEdge:v11 As:a6];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 appendFormat:@"%@GHz%@%@ ", v15, v14, v16];
    }

    ++v13;
  }

  while (v13 != 3);
  [NSString stringWithString:v12];
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)getLabelForIntegerByBandTransition:(id *)a3 In:(id)a4 WithLowestEdge:(id)a5 As:(unint64_t)a6
{
  id v22 = a4;
  id v21 = a5;
  __int128 v20 = (void *)objc_opt_new();
  uint64_t v10 = 0LL;
  unint64_t v11 = a6;
  if (a6 == 2) {
    __int128 v12 = @"<=";
  }
  else {
    __int128 v12 = @":";
  }
  var1 = a3->var1;
  do
  {
    for (uint64_t i = 0LL; i != 3; ++i)
    {
      if ((*var1)[i])
      {
        [a1 bandAsString:v10];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        [a1 bandAsString:i];
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        [a1 getBinFor:a3->var0[0][i] In:v22 WithLowestEdge:v21 As:v11];
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v20 appendFormat:@"%@GHz->%@GHz%@%@ ", v15, v16, v12, v17];
      }
    }

    ++v10;
    ++var1;
    a3 = ($13477CEFC6EEA4B326536BBEC35DF1AE *)((char *)a3 + 24);
  }

  while (v10 != 3);
  [NSString stringWithString:v20];
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)getLabelForPercIntegerByBand:(id *)a3
{
  __int128 v4 = *(_OWORD *)&a3->var0[2];
  v6[0] = *(_OWORD *)a3->var0;
  v6[1] = v4;
  [a1 getPercForIntegerByBand:v6 Over:0x7FFFFFFFFFFFFFFFLL];
  [a1 getLabelForIntegerByBand:v7 In:&unk_18A1B5A20 WithLowestEdge:@"0" As:2];
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)getLabelForNeighborsByBand:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  if (v3)
  {
    __int128 v4 = (void *)objc_opt_new();
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    [v3 allKeys];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          [v3 objectForKeyedSubscript:v10];
          unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
          unint64_t v12 = [v11 count];

          uint64_t v13 = +[WiFiUsagePrivacyFilter bandAsString:]( WiFiUsagePrivacyFilter,  "bandAsString:",  [v10 unsignedIntValue]);
          unint64_t v14 = (void *)v13;
          if (v12 > 5) {
            [v4 appendFormat:@"%@GHz>%d ", v13, 5];
          }
          else {
            [v4 appendFormat:@"%@GHz:%lu ", v13, v12];
          }
        }

        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }

      while (v7);
    }

    if ([v4 isEqualToString:&stru_18A170410])
    {
      uint64_t v15 = 0LL;
    }

    else
    {
      [NSString stringWithString:v4];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  return v15;
}

+ (id)getLabelForBandUsageDuration:(id *)a3 overTotalDuration:(double)a4 binned:(BOOL)a5
{
  __int128 v9 = *(_OWORD *)&a3->var0[2];
  v26[0] = *(_OWORD *)a3->var0;
  v26[1] = v9;
  [a1 getPercForFloatByBand:v26 Over:a4];
  if (a5)
  {
    if (a4 == 0.0)
    {
      uint64_t v10 = 0LL;
    }

    else
    {
      v25[0] = v27;
      v25[1] = v28;
      [a1 getLabelForIntegerByBand:v25 In:&unk_18A1B5A38 WithLowestEdge:@"0" As:2];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    unint64_t v11 = (void *)NSString;
    +[WiFiUsagePrivacyFilter bandAsString:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "bandAsString:", 0LL);
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    double v13 = 0.0;
    double v14 = 0.0;
    if (a3->var1[0]) {
      double v14 = a3->var0[0];
    }
    if (BYTE8(v28)) {
      uint64_t v15 = v27;
    }
    else {
      uint64_t v15 = 0LL;
    }
    v16 = +[WiFiUsagePrivacyFilter bandAsString:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "bandAsString:", 1LL);
    if (a3->var1[1]) {
      double v13 = a3->var0[1];
    }
    if (BYTE9(v28)) {
      uint64_t v17 = *((void *)&v27 + 1);
    }
    else {
      uint64_t v17 = 0LL;
    }
    __int128 v18 = (void *)NSString;
    uint64_t v19 = +[WiFiUsagePrivacyFilter bandAsString:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "bandAsString:", 2LL);
    __int128 v20 = (void *)v19;
    if (a3->var1[2]) {
      double v21 = a3->var0[2];
    }
    else {
      double v21 = 0.0;
    }
    if (BYTE10(v28)) {
      uint64_t v22 = v28;
    }
    else {
      uint64_t v22 = 0LL;
    }
    [v18 stringWithFormat:@"%@:%fs/%fs(%lu%%)", v19, *(void *)&v21, *(void *)&a4, v22];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 stringWithFormat:@"%@:%fs/%fs(%ld%%) %@:%fs/%fs(%lu%%) %@", v12, *(void *)&v14, *(void *)&a4, v15, v16, *(void *)&v13, *(void *)&a4, v17, v23];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

+ (id)getLabelForRssiByBand:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0[2];
  v5[0] = *(_OWORD *)a3->var0;
  v5[1] = v3;
  [a1 getLabelForIntegerByBand:v5 In:&unk_18A1B5A50 WithLowestEdge:@"-inf" As:0];
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)getLabelForRssiDeltaByBand:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0[2];
  v5[0] = *(_OWORD *)a3->var0;
  v5[1] = v3;
  [a1 getLabelForIntegerByBand:v5 In:&unk_18A1B5A68 WithLowestEdge:@"-inf" As:0];
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)getLabelForRssiDeltaByBandTransition:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0[2][0];
  _OWORD v6[2] = *(_OWORD *)&a3->var0[1][1];
  v6[3] = v3;
  v6[4] = *(_OWORD *)&a3->var0[2][2];
  uint64_t v7 = *(void *)&a3->var1[2][2];
  __int128 v4 = *(_OWORD *)&a3->var0[0][2];
  v6[0] = *(_OWORD *)&a3->var0[0][0];
  v6[1] = v4;
  [a1 getLabelForIntegerByBandTransition:v6 In:&unk_18A1B5A80 WithLowestEdge:@"-inf" As:0];
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)getLabelForRTCoexType:(unint64_t)a3
{
  if (a3) {
    return @"Unknown";
  }
  else {
    return @"AWDL RealTime";
  }
}

+ (id)getLabelForSteeringRequest:(unint64_t)a3
{
  if (a3 > 3) {
    return @"Unknown";
  }
  else {
    return off_18A16EBC8[a3];
  }
}

+ (id)getLabelForTDMode:(int)a3
{
  else {
    return off_18A16EBE8[a3 - 1];
  }
}

+ (id)getLabelForTDTrigger:(int)a3
{
  else {
    return off_18A16EC00[a3];
  }
}

+ (id)getLabelForCoreRssiMode:(unint64_t)a3
{
  if (a3 > 2) {
    return @"Unknown";
  }
  else {
    return off_18A16EC78[a3];
  }
}

+ (id)getLabelForUsbVendor:(unint64_t)a3
{
  if ((uint64_t)a3 <= 1920)
  {
    if ((uint64_t)a3 > 1438)
    {
      switch(a3)
      {
        case 0x59FuLL:
          return @"LaCie";
        case 0x5ACuLL:
          return @"Apple";
        case 0x5DCuLL:
          return @"Lexar";
      }
    }

    else
    {
      switch(a3)
      {
        case 0uLL:
          return @"DeviceMode";
        case 0x477uLL:
          return @"Seagate";
        case 0x4E8uLL:
          return @"Samsung";
      }
    }
  }

  else if ((uint64_t)a3 <= 5420)
  {
    switch(a3)
    {
      case 0x781uLL:
        return @"SanDisk";
      case 0x951uLL:
        return @"Kingston";
      case 0x1058uLL:
        return @"Western Digital";
    }
  }

  else if ((uint64_t)a3 > 18320)
  {
    if (a3 == 18321) {
      return @"G-Technology";
    }
    if (a3 == 0xFFFF) {
      return @"DisplayPort";
    }
  }

  else
  {
    if (a3 == 5421) {
      return @"Sabrent";
    }
    if (a3 == 8201) {
      return @"iStorage";
    }
  }

  return @"Other";
}

+ (id)getLabelForPhyModes:(int)a3
{
  __int16 v3 = a3;
  __int128 v4 = (void *)objc_opt_new();
  id v5 = v4;
  if ((v3 & 0x400) != 0)
  {
    [v4 addObject:@"6Ghz"];
    if ((v3 & 0x200) == 0)
    {
LABEL_3:
      if ((v3 & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }

  else if ((v3 & 0x200) == 0)
  {
    goto LABEL_3;
  }

  [v5 addObject:@"11BE"];
  if ((v3 & 0x100) == 0)
  {
LABEL_4:
    if ((v3 & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }

+ (id)getLabelsForNetworkProperties:(id)a3
{
  v20[2] = *MEMORY[0x1895F89C0];
  id v3 = a3;
  [MEMORY[0x189607940] stringWithString:&stru_18A170410];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607940] stringWithString:&stru_18A170410];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v4 = (objc_class *)objc_opt_class();
  id v5 = class_copyPropertyList(v4, &outCount);
  uint64_t v6 = v5;
  if (outCount)
  {
    unint64_t v7 = 0LL;
    uint64_t v8 = MEMORY[0x189604A88];
    do
    {
      objc_msgSend( NSString,  "stringWithCString:encoding:",  property_getName(v6[v7]),  objc_msgSend(NSString, "defaultCStringEncoding"));
      __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v9 hasPrefix:@"is"])
      {
        [v3 valueForKey:v9];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v10 isEqual:v8]
          && ![v9 isEqualToString:@"isWork"])
        {
          char v13 = [v9 isEqualToString:@"isHome"];

          if ((v13 & 1) == 0) {
            [v16 appendFormat:@"%@&", v9];
          }
        }

        else
        {
        }
      }

      if (([v9 hasPrefix:@"has"] & 1) != 0
        || [v9 hasPrefix:@"requires"])
      {
        [v3 valueForKey:v9];
        unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        int v12 = [v11 isEqual:v8];

        if (v12) {
          [v17 appendFormat:@"%@&", v9];
        }
      }

      ++v7;
    }

    while (v7 < outCount);
  }

  else if (!v5)
  {
    goto LABEL_17;
  }

  free(v6);
LABEL_17:
  if ([v3 captiveStatus] == 2) {
    [v16 appendFormat:@"%@&", @"isCaptive"];
  }
  v19[0] = @"networkType";
  v19[1] = @"networkProperties";
  v20[0] = v16;
  v20[1] = v17;
  [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:2];
  double v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)bandAsString:(int)a3
{
  else {
    return off_18A16EC90[a3];
  }
}

+ (id)subBandForBSPAsStringFromChannel:(int64_t)a3 andBand:(int)a4
{
  if (a4 != 1)
  {
LABEL_8:
    objc_msgSend(a1, "bandAsString:", *(void *)&a4, v4, v5);
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v6;
  }

  if ((unint64_t)(a3 - 32) >= 0x25)
  {
    goto LABEL_8;
  }

  uint64_t v6 = @"5low";
  return v6;
}

+ (int)bandFromFlags:(id)a3 OrChannel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 integerValue] >= 1)
  {
    int v8 = objc_msgSend(a1, "bandFromFlags:", objc_msgSend(v6, "integerValue"));
    if (!v7) {
      goto LABEL_10;
    }
  }

  else
  {
    int v8 = 3;
    if (!v7) {
      goto LABEL_10;
    }
  }

  if (v8 == 3)
  {
    if ([v7 unsignedIntegerValue]) {
      int v8 = objc_msgSend(a1, "bandFromChannel:", objc_msgSend(v7, "unsignedIntegerValue"));
    }
    else {
      int v8 = 3;
    }
  }

+ (unint64_t)channelWidthFromFlags:(unint64_t)a3
{
  unint64_t v3 = 80LL;
  uint64_t v4 = 40LL;
  if ((a3 & 4) == 0) {
    uint64_t v4 = 20LL;
  }
  if ((a3 & 0x400) == 0) {
    unint64_t v3 = v4;
  }
  if ((a3 & 0x800) != 0) {
    return 160LL;
  }
  else {
    return v3;
  }
}

+ (int)bandFromFlags:(unint64_t)a3
{
  if ((a3 & 0x2000) != 0) {
    int v3 = 2;
  }
  else {
    int v3 = 3;
  }
  if ((a3 & 0x10) != 0) {
    int v4 = 1;
  }
  else {
    int v4 = v3;
  }
  if ((a3 & 8) != 0) {
    return 0;
  }
  else {
    return v4;
  }
}

+ (int)bandFromChannel:(unint64_t)a3
{
  if (a3 - 36 < 0x86) {
    int v3 = 1;
  }
  else {
    int v3 = 3;
  }
  if (a3 >= 0xF) {
    return v3;
  }
  else {
    return 0;
  }
}

+ (int)bandFromChanInfo:(id)a3
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = v3;
  else {
    int v6 = 3;
  }

  return v6;
}

+ (int)bandFromAppleChannelSpec:(int)a3
{
  else {
    return dword_187F83D40[a3];
  }
}

+ (unint64_t)channelWidthAppleChannelSpec:(int)a3
{
  else {
    return qword_187F83D18[a3 - 1];
  }
}

@end