@interface WiFiUsageLQMKernelRollingWindow
+ (BOOL)isOngoing;
+ (id)kernelLQMRollingWindow:(id)a3 withReferenceWindow:(id)a4 andLqmFeatures:(id)a5;
+ (unint64_t)parseKernelBlobInto:(id)a3;
+ (void)addSample:(id)a3 To:(id)a4;
+ (void)advanceReadingPointerOf:(unint64_t)a3;
+ (void)initialize;
@end

@implementation WiFiUsageLQMKernelRollingWindow

+ (void)initialize
{
  v2 = (void *)_lqmMetricsBlock;
  _lqmMetricsBlock = 0LL;

  id v3 = objc_alloc_init(MEMORY[0x189607848]);
  v4 = (void *)_dateFormatter_0;
  _dateFormatter_0 = (uint64_t)v3;

  [(id)_dateFormatter_0 setDateFormat:@"HH:mm:ss"];
}

+ (BOOL)isOngoing
{
  return _lqmMetricsBlock != 0;
}

+ (id)kernelLQMRollingWindow:(id)a3 withReferenceWindow:(id)a4 andLqmFeatures:(id)a5
{
  uint64_t v80 = *MEMORY[0x1895F89C0];
  id v53 = a3;
  id v50 = a4;
  id v55 = a4;
  id v54 = a5;
  v60 = (void *)MEMORY[0x189603F68];
  v58 = (void *)objc_opt_new();
  v66 = (void *)objc_opt_new();
  v64 = (void *)objc_opt_new();
  id v56 = (id)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  v12 = (void *)objc_opt_new();
  v13 = (void *)objc_opt_new();
  v14 = (void *)objc_opt_new();
  objc_msgSend( v60,  "dictionaryWithObjectsAndKeys:",  v58,  @"WiFiUsageLQMKernelSampleRxAmpdu",  v66,  @"WiFiUsageLQMKernelSampleInfraTXRX",  v64,  @"WiFiUsageLQMKernelSamplePerACTxStatsUcast",  v56,  @"WiFiUsageLQMKernelSamplePerACTxStatsMcast",  v7,  @"WiFiUsageLQMKernelSampleOfdmDesense",  v8,  @"WiFiUsageLQMKernelSampleBTCoex",  v9,  @"WiFiUsageLQMKernelSampleAWDLCoex",  v10,  @"WiFiUsageLQMKernelSampleRC1Coex",  v11,  @"WiFiUsageLQMKernelSampleRC2Coex",  v12,  @"WiFiUsageLQMKernelSampleCCA",  v13,  @"WiFiUsageLQMKernelSampleSecurityErrors",  v14,  @"WiFiUsageLQMKernelSampleScanSummary",  0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v54;
  v17 = v15;

  objc_storeStrong((id *)&_lqmMetricsBlock, a3);
  if (!v54 || !v55 || !_lqmMetricsBlock) {
    goto LABEL_31;
  }
  objc_storeStrong((id *)&_referenceWindow, v50);
  unint64_t v18 = [a1 parseKernelBlobInto:v15];
  [MEMORY[0x189607940] stringWithFormat:@"\n"];
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  [v15 allKeys];
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  obuint64_t j = (id)[v19 countByEnumeratingWithState:&v72 objects:v79 count:16];
  if (obj)
  {
    id v57 = v19;
    unint64_t v52 = v18;
    char v20 = 0;
    uint64_t v61 = *(void *)v73;
    do
    {
      for (i = 0LL; i != obj; i = (char *)i + 1)
      {
        if (*(void *)v73 != v61) {
          objc_enumerationMutation(v57);
        }
        uint64_t v22 = *(void *)(*((void *)&v72 + 1) + 8LL * (void)i);
        [v17 objectForKeyedSubscript:v22];
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v24 = [v23 count];

        if (v24)
        {
          v25 = (void *)_dateFormatter_0;
          [v17 objectForKeyedSubscript:v22];
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          [v67 firstObject];
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          [v65 timestamp];
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          [v25 stringFromDate:v26];
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)_dateFormatter_0;
          [v17 objectForKeyedSubscript:v22];
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          [v29 lastObject];
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          [v30 timestamp];
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          [v28 stringFromDate:v31];
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          [v17 objectForKeyedSubscript:v22];
          v33 = v17;
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          [v59 appendFormat:@" %@ : window %@ to %@ . samples: %lu\n", v22, v27, v32, objc_msgSend(v34, "count")];

          v17 = v33;
          char v20 = 1;
        }
      }

      obuint64_t j = (id)[v57 countByEnumeratingWithState:&v72 objects:v79 count:16];
    }

    while (obj);

    v16 = v54;
    unint64_t v18 = v52;
    if ((v20 & 1) == 0) {
      goto LABEL_17;
    }
    [NSString stringWithFormat:@"%s - Parsing results:%@", "+[WiFiUsageLQMKernelRollingWindow kernelLQMRollingWindow:withReferenceWindow:andLqmFeatures:]", v59];
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      v35 = (void *)NSString;
      id v19 = v19;
      id v36 = objc_msgSend(v35, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v19, "UTF8String"));
      uint64_t v37 = [v36 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v78 = v37;
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }

LABEL_17:
  [(id)_referenceWindow samples];
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18 >= [v38 count])
  {
  }

  else
  {
    [(id)_referenceWindow samples];
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v40 = [v39 count] - v18;

    if (v40 > 2) {
      goto LABEL_31;
    }
  }

  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  [v17 allValues];
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v42 = [v41 countByEnumeratingWithState:&v68 objects:v76 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v69;
    do
    {
      for (uint64_t j = 0LL; j != v43; ++j)
      {
        if (*(void *)v69 != v44) {
          objc_enumerationMutation(v41);
        }
        v46 = *(void **)(*((void *)&v68 + 1) + 8 * j);
        if ([v46 count])
        {
          [(id)_referenceWindow label];
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          +[WiFiUsageLQMWindowAnalysis computeFeatures:For:WithLogLabel:]( &OBJC_CLASS___WiFiUsageLQMWindowAnalysis,  "computeFeatures:For:WithLogLabel:",  v16,  v46,  v47);
        }
      }

      uint64_t v43 = [v41 countByEnumeratingWithState:&v68 objects:v76 count:16];
    }

    while (v43);
  }

LABEL_31:
  v48 = (void *)_lqmMetricsBlock;
  _lqmMetricsBlock = 0LL;

  return v16;
}

+ (void)addSample:(id)a3 To:(id)a4
{
  if (a3) {
    objc_msgSend(a4, "addObject:");
  }
}

+ (void)advanceReadingPointerOf:(unint64_t)a3
{
  _readingAt += a3;
}

+ (unint64_t)parseKernelBlobInto:(id)a3
{
  v76[22] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  p_cache = &OBJC_CLASS___TBNetworkRemoteFetchResponse.cache;
  _buffer = [(id)_lqmMetricsBlock bytes];
  _ringheader = 0LL;
  v6 = &OBJC_CLASS___TBNetworkRemoteFetchResponse.cache;
  _readingAt = 0LL;
  v7 = &OBJC_CLASS___TBNetworkRemoteFetchResponse.cache;
  _endOfBuffer = 0LL;
  v75[0] = &unk_18A1B4500;
  v75[1] = &unk_18A1B4518;
  v76[0] = @"TAG_CTLQM_RX_AMPDU_STATS";
  v76[1] = @"TAG_CTLQM_INFRA_BAND_TX_RX_STATS";
  v75[2] = &unk_18A1B4530;
  v75[3] = &unk_18A1B4548;
  v76[2] = @"TAG_CTLQM_TX_DATA_PATH_PER_AC_STATS";
  v76[3] = @"TAG_CTLQM_SLOW_WIFI_LINK_RECOVERY_INFO";
  v75[4] = &unk_18A1B4560;
  v75[5] = &unk_18A1B4578;
  v76[4] = @"TAG_CTLQM_DPS_SYMPTOMS_INPUT";
  v76[5] = @"TAG_CTLQM_TX_DPS";
  v75[6] = &unk_18A1B4590;
  v75[7] = &unk_18A1B45A8;
  v76[6] = @"TAG_CTLQM_IPS_TRIGGER_REASON";
  v76[7] = @"TAG_CTLQM_PHY_RX_DESENSE";
  v75[8] = &unk_18A1B45C0;
  v75[9] = &unk_18A1B45D8;
  v76[8] = @"TAG_CTLQM_WPS_INFO";
  v76[9] = @"TAG_CTLQM_IP_INFO";
  v75[10] = &unk_18A1B45F0;
  v75[11] = &unk_18A1B4608;
  v76[10] = @"TAG_CTLQM_CHIP_INFO";
  v76[11] = @"TAG_CTLQM_BT";
  v75[12] = &unk_18A1B4620;
  v75[13] = &unk_18A1B4638;
  v76[12] = @"TAG_CTLQM_RC1";
  v76[13] = @"TAG_CTLQM_RC2";
  v75[14] = &unk_18A1B4650;
  v75[15] = &unk_18A1B4668;
  v76[14] = @"TAG_CTLQM_AWDL";
  v76[15] = @"TAG_CTLQM_SCAN";
  v75[16] = &unk_18A1B4680;
  v75[17] = &unk_18A1B4698;
  v76[16] = @"TAG_CTLQM_NOISE";
  v76[17] = @"TAG_CTLQM_RX_SECURITY";
  v75[18] = &unk_18A1B46B0;
  v75[19] = &unk_18A1B46C8;
  v76[18] = @"TAG_CTLQM_CCA";
  v76[19] = @"TAG_CTLQM_WEIGHT_AVG_LQM";
  v75[20] = &unk_18A1B46E0;
  v75[21] = &unk_18A1B46F8;
  v76[20] = @"TAG_CTLQM_INFRA_CHAN_INFO";
  v76[21] = @"TAG_CTLQM_RSSI_CHANGE_LQM_INFO";
  [MEMORY[0x189603F68] dictionaryWithObjects:v76 forKeys:v75 count:22];
  __int128 v68 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = _buffer;
  _ringheader = _buffer;
  uint64_t v9 = *(unsigned int *)(_buffer + 40);
  if ((_DWORD)v9 == 1)
  {
    v65 = v4;
    _buffer += 56LL;
    _endOfBuffer = v8 + 56 + *(unsigned int *)(v8 + 44);
    _readingAt = v8 + 56 + *(unsigned int *)(v8 + 48);
    [MEMORY[0x189603F50] now];
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    __uint64_t v66 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    v10 = &OBJC_CLASS___TBNetworkRemoteFetchResponse.cache;
    id v69 = a1;
    while (1)
    {
      v11 = (char *)v6[340];
      v12 = (char *)p_cache[342];
      if (v11 >= &v12[*(unsigned int *)(_ringheader + 52)]
        && (*(_DWORD *)(_ringheader + 48) < *(_DWORD *)(_ringheader + 52)
         || v11 < &v12[*(unsigned int *)(_ringheader + 48)]))
      {
        break;
      }

      [a1 advanceReadingPointerOf:24];
      unint64_t v13 = (unint64_t)v7[341];
      if ((unint64_t)(v11 + 24) > v13)
      {
        NSLog( @"%s - ERROR while Parsing LQM stats from kernel. readStart:%p readEnd:%p endOfBuffer:%p readingAt:%p header + sizeof(logHeader_t):%p which is past endOfBuffer - Aborting",  "+[WiFiUsageLQMKernelRollingWindow parseKernelBlobInto:]",  (char *)p_cache[342] + *(unsigned int *)(_ringheader + 48),  (char *)p_cache[342] + *(unsigned int *)(_ringheader + 52),  v13,  v6[340],  v11 + 24);
        break;
      }

      v14 = v6[340];
      if ((unint64_t)v14 + *((unsigned int *)v11 + 4) <= v13)
      {
        v21 = v6;
        +[WiFiUsageLQMTransformations dateWithMachContinuousTime:WithRef:asNS:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "dateWithMachContinuousTime:WithRef:asNS:",  *(void *)(v11 + 4),  v67,  v66);
        id v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v10[339] samples];
        uint64_t v22 = v10;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v23 firstObject];
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v24 timestamp];
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v19 compare:v25] == 1)
        {
          [v22[339] samples];
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          [v26 lastObject];
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          [v27 timestamp];
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v29 = [v19 compare:v28];

          if (v29 == -1)
          {
            v6 = v21;
            a1 = v69;
            p_cache = (void **)(&OBJC_CLASS___TBNetworkRemoteFetchResponse + 16);
            v10 = (void **)(&OBJC_CLASS___TBNetworkRemoteFetchResponse + 16);
            switch(*((_DWORD *)v11 + 3))
            {
              case 0:
                if (*((_DWORD *)v11 + 4) == 64)
                {
                  v30 = +[WiFiUsageLQMKernelSampleRxAmpdu sampleWithStruct:WithReferenceDate:AsNsec:]( &OBJC_CLASS___WiFiUsageLQMKernelSampleRxAmpdu,  "sampleWithStruct:WithReferenceDate:AsNsec:",  v21[340],  v67,  v66);
                  v31 = v65;
                  v32 = @"WiFiUsageLQMKernelSampleRxAmpdu";
                  goto LABEL_40;
                }

                [MEMORY[0x189607968] numberWithUnsignedInt:0];
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v37 = [v68 objectForKeyedSubscript:v30];
                id v36 = (void *)v37;
                uint64_t v38 = *((unsigned int *)v11 + 4);
                uint64_t v39 = 64LL;
                goto LABEL_49;
              case 1:
                if (*((_DWORD *)v11 + 4) == 140)
                {
                  v30 = +[WiFiUsageLQMKernelSampleInfraTXRX sampleWithStruct:WithReferenceDate:AsNsec:]( &OBJC_CLASS___WiFiUsageLQMKernelSampleInfraTXRX,  "sampleWithStruct:WithReferenceDate:AsNsec:",  v21[340],  v67,  v66);
                  v31 = v65;
                  v32 = @"WiFiUsageLQMKernelSampleInfraTXRX";
                  goto LABEL_40;
                }

                [MEMORY[0x189607968] numberWithUnsignedInt:1];
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v37 = [v68 objectForKeyedSubscript:v30];
                id v36 = (void *)v37;
                uint64_t v38 = *((unsigned int *)v11 + 4);
                uint64_t v39 = 140LL;
                goto LABEL_49;
              case 2:
                v35 = (unsigned int *)v21[340];
                if (*v35)
                {
                  NSLog( @"%s - Unknown version %u for TAG_CTLQM_TX_DATA_PATH_PER_AC_STATS. Skipping tag",  "+[WiFiUsageLQMKernelRollingWindow parseKernelBlobInto:]",  *v35);
                  break;
                }

                uint64_t v42 = *((unsigned int *)v11 + 4);
                if (v42 >= 0xC)
                {
                  uint64_t v44 = 0LL;
                  uint64_t v43 = 0LL;
                  unint64_t v45 = (unint64_t)v35 + v42;
                  v46 = v35 + 3;
                  v47 = v35 + 1;
                  do
                  {
                    uint64_t v48 = v47[1];
                    v49 = (unsigned int *)((char *)v46 + v48);
                    if (v48 >= 8)
                    {
                      id v50 = v46 + 2;
                      do
                      {
                        if (*v47 == 4)
                        {
                          v51 = +[WiFiUsageLQMKernelSamplePerACTxStats sampleWithTimestamp:]( &OBJC_CLASS___WiFiUsageLQMKernelSamplePerACTxStatsMcast,  "sampleWithTimestamp:",  v19);
                          unint64_t v52 = v43;
                          uint64_t v43 = v51;
                        }

                        else
                        {
                          v51 = +[WiFiUsageLQMKernelSamplePerACTxStats sampleWithTimestamp:]( &OBJC_CLASS___WiFiUsageLQMKernelSamplePerACTxStatsUcast,  "sampleWithTimestamp:",  v19);
                          unint64_t v52 = v44;
                          uint64_t v44 = v51;
                        }

                        [v51 populateTXStats:*(v50 - 2) With:*(v50 - 1) ForQueue:*v47];
                        v50 += 2;
                      }

                      while (v50 <= v49);
                    }

                    v46 = v49 + 2;
                    v47 = v49;
                  }

                  while ((unint64_t)(v49 + 2) <= v45);
                  if (v44)
                  {
                    [v44 transformTXStats];
                    [v65 objectForKeyedSubscript:@"WiFiUsageLQMKernelSamplePerACTxStatsUcast"];
                    id v53 = (void *)objc_claimAutoreleasedReturnValue();
                    a1 = v69;
                    [v69 addSample:v44 To:v53];
                    p_cache = (void **)(&OBJC_CLASS___TBNetworkRemoteFetchResponse + 16);
                    goto LABEL_68;
                  }

                  a1 = v69;
                  p_cache = (void **)(&OBJC_CLASS___TBNetworkRemoteFetchResponse + 16);
                }

                else
                {
                  uint64_t v43 = 0LL;
                }

                [v43 transformTXStats];
                [v65 objectForKeyedSubscript:@"WiFiUsageLQMKernelSamplePerACTxStatsMcast"];
                id v53 = (void *)objc_claimAutoreleasedReturnValue();
                [a1 addSample:v43 To:v53];
                uint64_t v44 = 0LL;
LABEL_68:

                v6 = v21;
                goto LABEL_13;
              case 3:
              case 4:
              case 5:
              case 6:
              case 8:
              case 9:
              case 0xA:
              case 0x10:
              case 0x13:
              case 0x14:
              case 0x15:
                break;
              case 7:
                if (*((_DWORD *)v11 + 4) == 16)
                {
                  v30 = +[WiFiUsageLQMKernelSampleOfdmDesense sampleWithStruct:andTimestamp:]( &OBJC_CLASS___WiFiUsageLQMKernelSampleOfdmDesense,  "sampleWithStruct:andTimestamp:",  v21[340],  v19);
                  v31 = v65;
                  v32 = @"WiFiUsageLQMKernelSampleOfdmDesense";
                  goto LABEL_40;
                }

                [MEMORY[0x189607968] numberWithUnsignedInt:7];
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v37 = [v68 objectForKeyedSubscript:v30];
                id v36 = (void *)v37;
                uint64_t v38 = *((unsigned int *)v11 + 4);
                uint64_t v39 = 16LL;
                goto LABEL_49;
              case 0xB:
                if (*((_DWORD *)v11 + 4) == 12)
                {
                  v30 = +[WiFiUsageLQMKernelSampleBTCoex sampleWithStruct:andTimestamp:]( &OBJC_CLASS___WiFiUsageLQMKernelSampleBTCoex,  "sampleWithStruct:andTimestamp:",  v21[340],  v19);
                  v31 = v65;
                  v32 = @"WiFiUsageLQMKernelSampleBTCoex";
                  goto LABEL_40;
                }

                unint64_t v40 = (void *)MEMORY[0x189607968];
                uint64_t v41 = 11LL;
                goto LABEL_48;
              case 0xC:
                if (*((_DWORD *)v11 + 4) == 12)
                {
                  v30 = +[WiFiUsageLQMKernelSampleRC1Coex sampleWithStruct:andTimestamp:]( &OBJC_CLASS___WiFiUsageLQMKernelSampleRC1Coex,  "sampleWithStruct:andTimestamp:",  v21[340],  v19);
                  v31 = v65;
                  v32 = @"WiFiUsageLQMKernelSampleRC1Coex";
                  goto LABEL_40;
                }

                unint64_t v40 = (void *)MEMORY[0x189607968];
                uint64_t v41 = 12LL;
                goto LABEL_48;
              case 0xD:
                if (*((_DWORD *)v11 + 4) == 12)
                {
                  v30 = +[WiFiUsageLQMKernelSampleRC2Coex sampleWithStruct:andTimestamp:]( &OBJC_CLASS___WiFiUsageLQMKernelSampleRC2Coex,  "sampleWithStruct:andTimestamp:",  v21[340],  v19);
                  v31 = v65;
                  v32 = @"WiFiUsageLQMKernelSampleRC2Coex";
                  goto LABEL_40;
                }

                unint64_t v40 = (void *)MEMORY[0x189607968];
                uint64_t v41 = 13LL;
                goto LABEL_48;
              case 0xE:
                if (*((_DWORD *)v11 + 4) == 12)
                {
                  v30 = +[WiFiUsageLQMKernelSampleAWDLCoex sampleWithStruct:andTimestamp:]( &OBJC_CLASS___WiFiUsageLQMKernelSampleAWDLCoex,  "sampleWithStruct:andTimestamp:",  v21[340],  v19);
                  v31 = v65;
                  v32 = @"WiFiUsageLQMKernelSampleAWDLCoex";
                  goto LABEL_40;
                }

                unint64_t v40 = (void *)MEMORY[0x189607968];
                uint64_t v41 = 14LL;
LABEL_48:
                [v40 numberWithUnsignedInt:v41];
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v37 = [v68 objectForKeyedSubscript:v30];
                id v36 = (void *)v37;
                uint64_t v38 = *((unsigned int *)v11 + 4);
                uint64_t v39 = 12LL;
                goto LABEL_49;
              case 0xF:
                if (*((_DWORD *)v11 + 4) == 24)
                {
                  v30 = +[WiFiUsageLQMKernelSampleScanSummary sampleWithStruct:andTimestamp:]( &OBJC_CLASS___WiFiUsageLQMKernelSampleScanSummary,  "sampleWithStruct:andTimestamp:",  v21[340],  v19);
                  v31 = v65;
                  v32 = @"WiFiUsageLQMKernelSampleScanSummary";
                  goto LABEL_40;
                }

                [MEMORY[0x189607968] numberWithUnsignedInt:15];
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v37 = [v68 objectForKeyedSubscript:v30];
                id v36 = (void *)v37;
                uint64_t v38 = *((unsigned int *)v11 + 4);
                uint64_t v39 = 24LL;
                goto LABEL_49;
              case 0x11:
                if (*((_DWORD *)v11 + 4) == 20)
                {
                  v30 = +[WiFiUsageLQMKernelSampleSecurityErrors sampleWithStruct:andTimestamp:]( &OBJC_CLASS___WiFiUsageLQMKernelSampleSecurityErrors,  "sampleWithStruct:andTimestamp:",  v21[340],  v19);
                  v31 = v65;
                  v32 = @"WiFiUsageLQMKernelSampleSecurityErrors";
                  goto LABEL_40;
                }

                [MEMORY[0x189607968] numberWithUnsignedInt:17];
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v37 = [v68 objectForKeyedSubscript:v30];
                id v36 = (void *)v37;
                uint64_t v38 = *((unsigned int *)v11 + 4);
                uint64_t v39 = 20LL;
                goto LABEL_49;
              case 0x12:
                if (*((_DWORD *)v11 + 4) == 28)
                {
                  v30 = +[WiFiUsageLQMKernelSampleCCA sampleWithStruct:andTimestamp:]( &OBJC_CLASS___WiFiUsageLQMKernelSampleCCA,  "sampleWithStruct:andTimestamp:",  v21[340],  v19);
                  v31 = v65;
                  v32 = @"WiFiUsageLQMKernelSampleCCA";
LABEL_40:
                  [v31 objectForKeyedSubscript:v32];
                  id v36 = (void *)objc_claimAutoreleasedReturnValue();
                  [v69 addSample:v30 To:v36];
                }

                else
                {
                  [MEMORY[0x189607968] numberWithUnsignedInt:18];
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  uint64_t v37 = [v68 objectForKeyedSubscript:v30];
                  id v36 = (void *)v37;
                  uint64_t v38 = *((unsigned int *)v11 + 4);
                  uint64_t v39 = 28LL;
LABEL_49:
                  NSLog( @"%s - Failed to parse LQM stats from kernel. Found %@ with payload len %u rather than %lu",  "+[WiFiUsageLQMKernelRollingWindow parseKernelBlobInto:]",  v37,  v38,  v39);
                }

                break;
              default:
                [MEMORY[0x189607968] numberWithUnsignedInt:0x18C4D6000];
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                [v68 objectForKeyedSubscript:v33];
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                NSLog( @"%s - Unrecognized header tag %u (%@) while parsing sample",  "+[WiFiUsageLQMKernelRollingWindow parseKernelBlobInto:]",  0x18C4D6000LL,  v34);

                goto LABEL_12;
            }
          }

          else
          {
            v6 = v21;
            a1 = v69;
LABEL_12:
            p_cache = (void **)(&OBJC_CLASS___TBNetworkRemoteFetchResponse + 16);
LABEL_13:
            v10 = (void **)(&OBJC_CLASS___TBNetworkRemoteFetchResponse + 16);
          }
        }

        else
        {

          v6 = v21;
          v10 = v22;
        }
      }

      else
      {
        v15 = (char *)p_cache[342];
        v16 = &v15[*(unsigned int *)(_ringheader + 48)];
        v17 = &v15[*(unsigned int *)(_ringheader + 52)];
        uint64_t v18 = *((unsigned int *)v11 + 3);
        [MEMORY[0x189607968] numberWithUnsignedInt:v18];
        id v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v68 objectForKeyedSubscript:v19];
        char v20 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v64 = v18;
        v10 = (void **)(&OBJC_CLASS___TBNetworkRemoteFetchResponse + 16);
        v62 = v16;
        v63 = v17;
        p_cache = (void **)(&OBJC_CLASS___TBNetworkRemoteFetchResponse + 16);
        a1 = v69;
        NSLog( @"%s - ERROR while Parsing LQM stats from kernel. readStart:%p readEnd:%p endOfBuffer:%p readingAt:%p (moved pa st logHeader_t) tag:%04X(%@) length:%04X readingAt+length:%p which is past endOfBuffer - Skipping",  "+[WiFiUsageLQMKernelRollingWindow parseKernelBlobInto:]",  v62,  v63,  v13,  v14,  v64,  v20,  *((unsigned int *)v11 + 4),  (char *)v6[340] + *((unsigned int *)v11 + 4));
      }

      [a1 advanceReadingPointerOf:*((unsigned int *)v11 + 4)];
      [a1 advanceReadingPointerOf:*((unsigned int *)v11 + 5)];
      v7 = (void **)(&OBJC_CLASS___TBNetworkRemoteFetchResponse + 16);
    }

    __int128 v72 = 0u;
    __int128 v73 = 0u;
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    [v65 allValues];
    id v55 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v56 = [v55 countByEnumeratingWithState:&v70 objects:v74 count:16];
    if (v56)
    {
      uint64_t v57 = v56;
      unint64_t v54 = 0LL;
      uint64_t v58 = *(void *)v71;
      do
      {
        for (uint64_t i = 0LL; i != v57; ++i)
        {
          if (*(void *)v71 != v58) {
            objc_enumerationMutation(v55);
          }
          v60 = *(void **)(*((void *)&v70 + 1) + 8 * i);
          if (v54 <= [v60 count]) {
            unint64_t v54 = [v60 count];
          }
        }

        uint64_t v57 = [v55 countByEnumeratingWithState:&v70 objects:v74 count:16];
      }

      while (v57);
    }

    else
    {
      unint64_t v54 = 0LL;
    }

    id v4 = v65;
  }

  else
  {
    NSLog( @"%s - Failed to parse LQM stats from kernel. Ringbuffer version is %u rather than %u",  "+[WiFiUsageLQMKernelRollingWindow parseKernelBlobInto:]",  v9,  1LL);
    unint64_t v54 = 0LL;
  }

  return v54;
}

@end