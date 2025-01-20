id sub_100001994(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  int v9;
  char **v11;
  uint64_t (*v12)(void);
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  NSMutableDictionary *v38;
  void *v39;
  unsigned int v40;
  _UNKNOWN **v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  _UNKNOWN **v50;
  char *v51;
  char **v52;
  uint64_t v53;
  v8 = a3;
  v9 = a2;
  v52 = 0LL;
  v53 = 0LL;
  v11 = (char **)qword_100091F28;
  if (qword_100091F28)
  {
    v52 = (char **)qword_100091F28;
  }

  else
  {
    if (!sub_100018E9C(&v52))
    {
      v13 = "gatherASPFTLData: Could not get nand_exporter_t";
      goto LABEL_19;
    }

    v11 = v52;
  }

  if (!*((_DWORD *)v11 + 4))
  {
    v13 = "gatherASPFTLData: No io_connection exist";
LABEL_19:
    sub_100018D50(v13, a2, a3, a4, a5, a6, a7, a8, (char)v52);
    v18 = 0LL;
    goto LABEL_42;
  }

  v53 = 0LL;
  if (!v9)
  {
    v12 = (uint64_t (*)(void))v11[6];
    if (v12) {
      goto LABEL_11;
    }
    v36 = "gatherASPFTLData: No getReadStatsSelectors exist";
LABEL_25:
    sub_100018D50(v36, a2, a3, a4, a5, a6, a7, a8, (char)v52);
    return 0LL;
  }

  v12 = (uint64_t (*)(void))v11[5];
  if (!v12)
  {
    v36 = "gatherASPFTLData: No getStatsSelectors exist";
    goto LABEL_25;
  }

  v8 = 0;
LABEL_11:
  v14 = v12();
  v15 = sub_10001A3EC(v52, *(_DWORD *)(v14 + 4), 0, v8, &v53, 0, 0);
  v16 = v15;
  if (v15) {
    v17 = v53 == 0;
  }
  else {
    v17 = 1;
  }
  if (v17)
  {
    v18 = 0LL;
    if (!v15) {
      goto LABEL_42;
    }
  }

  else
  {
    v19 = (uint64_t *)calloc(1uLL, 0x20uLL);
    if (v19)
    {
      v27 = v19;
      if (a1) {
        v28 = ((uint64_t (*)(uint64_t *, void *, void))v52[19])(v19, v16, v53);
      }
      else {
        v28 = ((uint64_t (*)(uint64_t *, void *, void))v52[18])(v19, v16, v53);
      }
      if (v28)
      {
        v38 = sub_100018B30(v27, 0LL);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", *v52));
        v40 = [v39 isEqualToString:@"ASPStorage"];

        if (v40) {
          v41 = &off_10008E758;
        }
        else {
          v41 = &off_10008E6B0;
        }
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v41, @"com.apple.NANDInfo.IsANS1Controller", v52);
        if (v18
          && (v49 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:@"magazineFWVersion_1"]),
              v49,
              v49))
        {
          v50 = &off_10008E758;
        }

        else
        {
          sub_100018D50("Stat Magazine not supported", v42, v43, v44, v45, v46, v47, v48, (char)v52);
          v50 = &off_10008E6B0;
        }

        [v18 setObject:v50 forKeyedSubscript:@"com.apple.NANDInfo.IsStatMagSupported"];
      }

      else
      {
        sub_100018D50("gatherASPFTLData: parseFTL failed", v29, v30, v31, v32, v33, v34, v35, (char)v52);
        v18 = 0LL;
      }

      v51 = v52[20];
      if (v51) {
        ((void (*)(uint64_t *))v51)(v27);
      }
      free(v27);
    }

    else
    {
      sub_100018D50( "gatherASPFTLData: Could not allocate memory for pcxt.ftlData",  v20,  v21,  v22,  v23,  v24,  v25,  v26,  (char)v52);
      v18 = 0LL;
    }
  }

  free(v16);
LABEL_42:
  if (!qword_100091F28)
  {
    if (v52) {
      sub_100018FE4((uint64_t)v52);
    }
  }

  return v18;
}

NSMutableDictionary *CopyAppleCareNANDInfo()
{
  v17[0] = @"com.apple.NANDInfo.Health.MaxPercentageNANDUsed";
  v17[1] = @"com.apple.NANDInfo.Health.HostReadErrors";
  v17[2] = @"com.apple.NANDInfo.Health.MaxE2EErrors";
  v17[3] = @"com.apple.NANDInfo.Health.NumGrownBadBlocks";
  v17[4] = @"com.apple.NANDInfo.Health.NumDieFailures";
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 5LL));
  v1 = sub_100001D30();
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v10 = v2;
  if (v2)
  {
    v11 = sub_100018C20(v2, v0);
    v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v11);
  }

  else
  {
    sub_100018D50("CopyAppleCareNANDInfo: Unable to get health API fields", v3, v4, v5, v6, v7, v8, v9, v17[0]);
    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }

  v13 = v12;
  v14 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", sub_100018E08());
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v15, off_100091A88);

  return v13;
}

NSMutableDictionary *sub_100001D30()
{
  v0 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v72[0] = @"numGrownBad";
  v72[1] = @"spareAvailablePercent";
  v73[0] = @"com.apple.NANDInfo.Health.NumGrownBadBlocks";
  v73[1] = @"com.apple.NANDInfo.Health.SpareAvailablePercent";
  v72[2] = @"numDieFailures";
  v73[2] = @"com.apple.NANDInfo.Health.NumDieFailures";
  v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v73,  v72,  3LL));
  id v7 = sub_100001994(0, 1LL, 0LL, v2, v3, v4, v5, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (!v15)
  {
    sub_100018D50("gatherNANDHealthInfo: Unable to get FTL fields", v8, v9, v10, v11, v12, v13, v14, v57);
    goto LABEL_44;
  }

  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  id v16 = [&off_10008E620 countByEnumeratingWithState:&v65 objects:v71 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = 0LL;
    uint64_t v19 = *(void *)v66;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v66 != v19) {
          objc_enumerationMutation(&off_10008E620);
        }
        uint64_t v21 = *(void *)(*((void *)&v65 + 1) + 8LL * (void)i);
        v22 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v21]);

        if (v22)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v21]);
          signed int v24 = [v23 intValue];

          if (v18 <= v24) {
            uint64_t v18 = v24;
          }
        }
      }

      id v17 = [&off_10008E620 countByEnumeratingWithState:&v65 objects:v71 count:16];
    }

    while (v17);
  }

  else
  {
    uint64_t v18 = 0LL;
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v18));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v0,  "setObject:forKeyedSubscript:",  v25,  @"com.apple.NANDInfo.Health.MaxPercentageNANDUsed");

  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  id v26 = [&off_10008E638 countByEnumeratingWithState:&v61 objects:v70 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = 0LL;
    uint64_t v29 = *(void *)v62;
    do
    {
      for (j = 0LL; j != v27; j = (char *)j + 1)
      {
        if (*(void *)v62 != v29) {
          objc_enumerationMutation(&off_10008E638);
        }
        uint64_t v31 = *(void *)(*((void *)&v61 + 1) + 8LL * (void)j);
        v32 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v31]);

        if (v32)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v31]);
          signed int v34 = [v33 intValue];

          if (v28 <= v34) {
            uint64_t v28 = v34;
          }
        }
      }

      id v27 = [&off_10008E638 countByEnumeratingWithState:&v61 objects:v70 count:16];
    }

    while (v27);
  }

  else
  {
    uint64_t v28 = 0LL;
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v28));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v0,  "setObject:forKeyedSubscript:",  v35,  @"com.apple.NANDInfo.Health.MaxE2EErrors");

  v36 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"com.apple.NANDInfo.IsANS1Controller"]);
  if (!v36) {
    goto LABEL_32;
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"com.apple.NANDInfo.IsANS1Controller"]);
  unsigned int v38 = [v37 intValue];

  if (!v38)
  {
    v39 = @"raidSmartErrors";
    v45 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"raidSmartErrors"]);

    if (v45) {
      goto LABEL_30;
    }
LABEL_32:
    uint64_t v44 = 0LL;
    goto LABEL_33;
  }

  v39 = @"ueccReads";
  v40 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"ueccReads"]);
  unsigned int v41 = [v40 intValue];

  if (!v41) {
    goto LABEL_32;
  }
LABEL_30:
  v42 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v39]);
  int v43 = [v42 intValue];

  uint64_t v44 = v43 & ~(v43 >> 31);
LABEL_33:
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v44));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v0,  "setObject:forKeyedSubscript:",  v46,  @"com.apple.NANDInfo.Health.HostReadErrors");

  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  id v47 = v1;
  id v48 = [v47 countByEnumeratingWithState:&v57 objects:v69 count:16];
  if (v48)
  {
    id v49 = v48;
    uint64_t v50 = *(void *)v58;
    do
    {
      for (k = 0LL; k != v49; k = (char *)k + 1)
      {
        if (*(void *)v58 != v50) {
          objc_enumerationMutation(v47);
        }
        uint64_t v52 = *(void *)(*((void *)&v57 + 1) + 8LL * (void)k);
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", v52, (void)v57));

        if (v53)
        {
          v54 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v52]);
          v55 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:v52]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v0, "setObject:forKeyedSubscript:", v54, v55);
        }

        else
        {
          v54 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:v52]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v0, "setObject:forKeyedSubscript:", &off_10008E7D0, v54);
        }
      }

      id v49 = [v47 countByEnumeratingWithState:&v57 objects:v69 count:16];
    }

    while (v49);
  }

LABEL_44:
  return v0;
}

uint64_t sub_100002258(uint64_t a1, uint64_t *a2, unsigned int a3)
{
  *(_DWORD *)(a1 + 36) = -1;
  if (a3 < 8) {
    return 0LL;
  }
  unsigned int v6 = a3 >> 3;
  while (2)
  {
    unint64_t v9 = *a2;
    uint64_t v8 = a2 + 1;
    int v7 = v9;
    unint64_t v10 = HIDWORD(v9);
    unsigned int v11 = v6 - 1;
    if (v9 <= 0x30000000 && v11 >= v10)
    {
      uint64_t v13 = (v7 - 1);
      if (v13 <= 0x47) {
        __asm { BR              X10 }
      }

      uint64_t v17 = (v7 - 73);
      if (v17 <= 0x46) {
        __asm { BR              X10 }
      }

      switch(v7)
      {
        case 144:
          uint64_t v18 = *v8;
          uint64_t v19 = "numMemExtreme";
          goto LABEL_13;
        case 145:
          uint64_t v18 = *v8;
          uint64_t v19 = "maxMemExtremeDuration";
          goto LABEL_13;
        case 146:
          uint64_t v18 = *v8;
          uint64_t v19 = "memExtremeDuration";
          goto LABEL_13;
        case 147:
          uint64_t v18 = *v8;
          uint64_t v19 = "bandGetsExtreme";
          goto LABEL_13;
        case 148:
          uint64_t v18 = *v8;
          uint64_t v19 = "bandGetsLow";
          goto LABEL_13;
        case 149:
          uint64_t v18 = *v8;
          uint64_t v19 = "numHostChoke";
          goto LABEL_13;
        case 152:
          uint64_t v18 = *v8;
          uint64_t v19 = "AbortSkip_ProgramError";
          goto LABEL_13;
        case 153:
          uint64_t v18 = *v8;
          uint64_t v19 = "AbortSkip_ReadErrorOpenBand";
          goto LABEL_13;
        case 154:
          uint64_t v18 = *v8;
          uint64_t v19 = "AbortSkip_FailedRebuildingParity";
          goto LABEL_13;
        case 155:
          uint64_t v18 = *v8;
          uint64_t v19 = "AbortPad_OpenRefreshBand";
          goto LABEL_13;
        case 156:
          uint64_t v18 = *v8;
          uint64_t v19 = "AbortPad_CloseBands";
          goto LABEL_13;
        case 157:
          uint64_t v18 = *v8;
          uint64_t v19 = "AbortPad_SetPhoto";
          goto LABEL_13;
        case 158:
          uint64_t v18 = *v8;
          uint64_t v19 = "AbortPad_GcNoSource";
          goto LABEL_13;
        case 159:
          uint64_t v18 = *v8;
          uint64_t v19 = "AbortPad_Format";
          goto LABEL_13;
        case 160:
          uint64_t v18 = *v8;
          uint64_t v19 = "nandDiscoveryDuration";
          goto LABEL_13;
        case 161:
          uint64_t v18 = *v8;
          uint64_t v19 = "coreCCEnableDuration";
          goto LABEL_13;
        case 163:
          uint64_t v18 = *v8;
          uint64_t v19 = "coreOpenDuration";
          goto LABEL_13;
        case 164:
          uint64_t v18 = *v8;
          uint64_t v19 = "coreWritableDuration";
          goto LABEL_13;
        case 165:
          uint64_t v18 = *v8;
          uint64_t v19 = "coreClogLoadDuration";
          goto LABEL_13;
        case 167:
          uint64_t v18 = *v8;
          uint64_t v19 = "bulkPFail";
          goto LABEL_13;
        case 169:
          uint64_t v18 = *v8;
          uint64_t v19 = "bulkRFail";
          goto LABEL_13;
        case 172:
          uint64_t v18 = *v8;
          uint64_t v19 = "raidSmartErrors";
          goto LABEL_13;
        case 182:
          uint64_t v18 = *v8;
          uint64_t v19 = "internalUeccs";
          goto LABEL_13;
        case 183:
          uint64_t v18 = *v8;
          uint64_t v19 = "e2eFail";
          goto LABEL_13;
        case 184:
          uint64_t v18 = *v8;
          uint64_t v19 = "TempSensorMax";
          goto LABEL_13;
        case 185:
          uint64_t v18 = *v8;
          uint64_t v19 = "TempSensorMin";
          goto LABEL_13;
        case 186:
          uint64_t v18 = *v8;
          uint64_t v19 = "powerUpFromDDR";
          goto LABEL_13;
        case 187:
          uint64_t v18 = *v8;
          uint64_t v19 = "numMemLow";
          goto LABEL_13;
        case 188:
          uint64_t v18 = *v8;
          uint64_t v19 = "maxMemLowDuration";
          goto LABEL_13;
        case 189:
          uint64_t v18 = *v8;
          uint64_t v19 = "memLowDuration";
          goto LABEL_13;
        case 190:
          uint64_t v18 = *v8;
          uint64_t v19 = "numFences";
          goto LABEL_13;
        case 191:
          uint64_t v18 = *v8;
          uint64_t v19 = "hostPassiveIO";
          goto LABEL_13;
        case 192:
          uint64_t v18 = *v8;
          uint64_t v19 = "odtsMax";
          goto LABEL_13;
        case 193:
          uint64_t v18 = *v8;
          uint64_t v19 = "defragMFromOrphans";
          goto LABEL_13;
        case 194:
          uint64_t v18 = *v8;
          uint64_t v19 = "defragMFromFragments";
          goto LABEL_13;
        case 195:
          uint64_t v18 = *v8;
          uint64_t v19 = "defragMTime";
          goto LABEL_13;
        case 196:
          uint64_t v18 = *v8;
          uint64_t v19 = "defragMMaxTime";
          goto LABEL_13;
        case 197:
          uint64_t v18 = *v8;
          uint64_t v19 = "raidFailedLbaMismatch";
          goto LABEL_13;
        case 198:
          uint64_t v18 = *v8;
          uint64_t v19 = "numSyscfgWrites";
          goto LABEL_13;
        case 199:
          uint64_t v18 = *v8;
          uint64_t v19 = "indmbUnitsXfer";
          goto LABEL_13;
        case 200:
          uint64_t v18 = *v8;
          uint64_t v19 = "indmbUnitsCache";
          goto LABEL_13;
        case 201:
          uint64_t v18 = *v8;
          uint64_t v19 = "indmbUnitsInd";
          goto LABEL_13;
        case 202:
          uint64_t v18 = *v8;
          uint64_t v19 = "wcacheFS_Mbytes";
          goto LABEL_13;
        case 203:
          uint64_t v18 = *v8;
          uint64_t v19 = "wcacheDS_Mbytes";
          goto LABEL_13;
        case 204:
          uint64_t v18 = *v8;
          uint64_t v19 = "powerOnSeconds";
          goto LABEL_13;
        case 205:
          uint64_t v18 = *v8;
          uint64_t v19 = "numUnknownTokenHostRead";
          goto LABEL_13;
        case 206:
          uint64_t v18 = *v8;
          uint64_t v19 = "numUnmmapedTokenHostRead";
          goto LABEL_13;
        case 207:
          v20 = "numOfThrottlingEntriesPerLevel";
          uint64_t v21 = a1;
          int v22 = 207;
LABEL_85:
          uint64_t v14 = v8;
          unsigned int v15 = 16;
          goto LABEL_12;
        case 208:
          uint64_t v18 = *v8;
          uint64_t v19 = "wcacheFS_MbytesMin";
          goto LABEL_13;
        case 209:
          uint64_t v18 = *v8;
          uint64_t v19 = "wcacheFS_MbytesMax";
          goto LABEL_13;
        case 210:
          uint64_t v18 = *v8;
          uint64_t v19 = "prepareForShutdownFailCounter";
          goto LABEL_13;
        case 211:
          uint64_t v18 = *v8;
          uint64_t v19 = "lpsrEntry";
          goto LABEL_13;
        case 212:
          uint64_t v18 = *v8;
          uint64_t v19 = "lpsrExit";
          goto LABEL_13;
        case 213:
          v20 = "crcInternalReadFail";
          uint64_t v21 = a1;
          int v22 = 213;
LABEL_23:
          uint64_t v14 = v8;
          unsigned int v15 = 8;
          goto LABEL_12;
        case 214:
          uint64_t v18 = *v8;
          uint64_t v19 = "wcacheFSEvictCnt";
          goto LABEL_13;
        case 215:
          uint64_t v18 = *v8;
          uint64_t v19 = "wcacheFSEvictSize";
          goto LABEL_13;
        case 216:
          uint64_t v18 = *v8;
          uint64_t v19 = "wcacheFSWr";
          goto LABEL_13;
        case 217:
          uint64_t v18 = *v8;
          uint64_t v19 = "wcacheDSWr";
          goto LABEL_13;
        case 218:
          v20 = "wcacheFSEvictSizeLogDist";
          uint64_t v21 = a1;
          int v22 = 218;
LABEL_11:
          uint64_t v14 = v8;
          unsigned int v15 = 10;
          goto LABEL_12;
        case 219:
          uint64_t v18 = *v8;
          uint64_t v19 = "prepareForShutdownTimeoutCounter";
          goto LABEL_13;
        case 220:
          uint64_t v18 = *v8;
          uint64_t v19 = "prepareForShutdownCancelCounter";
          goto LABEL_13;
        case 221:
          uint64_t v18 = *v8;
          uint64_t v19 = "RD_openBandCount";
          goto LABEL_13;
        case 222:
          uint64_t v18 = *v8;
          uint64_t v19 = "RD_openBandNops";
          goto LABEL_13;
        case 223:
          uint64_t v18 = *v8;
          uint64_t v19 = "RD_closedBandEvictCount";
LABEL_13:
          id v16 = (void *)a1;
          goto LABEL_14;
        default:
          switch(v7)
          {
            case 224:
              uint64_t v18 = *v8;
              uint64_t v19 = "RD_closedBandEvictSectors";
              goto LABEL_13;
            case 225:
              uint64_t v18 = *v8;
              uint64_t v19 = "RD_closedBandFragmentCount";
              goto LABEL_13;
            case 226:
              uint64_t v18 = *v8;
              uint64_t v19 = "RD_closedBandFragmentSectors";
              goto LABEL_13;
            case 227:
              v20 = "wcacheFSOverWrLogSizeCnts";
              uint64_t v21 = a1;
              int v22 = 227;
              goto LABEL_11;
            case 228:
              v20 = "wcacheFSOverWrSizeByFlow";
              uint64_t v21 = a1;
              int v22 = 228;
              goto LABEL_22;
            case 229:
              v20 = "indmbXferCountTo";
              uint64_t v21 = a1;
              int v22 = 229;
              goto LABEL_20;
            case 230:
              v20 = "indmbAccumulatedTimeBetweenXfers";
              uint64_t v21 = a1;
              int v22 = 230;
LABEL_20:
              uint64_t v14 = v8;
              unsigned int v15 = 2;
              goto LABEL_12;
            case 231:
              uint64_t v18 = *v8;
              uint64_t v19 = "maxGracefulBootTimeMs";
              goto LABEL_13;
            case 232:
              uint64_t v18 = *v8;
              uint64_t v19 = "maxUngracefulBootTimeMs";
              goto LABEL_13;
            case 233:
              uint64_t v18 = *v8;
              uint64_t v19 = "averageGracefulBootTimeMs";
              goto LABEL_13;
            case 234:
              uint64_t v18 = *v8;
              uint64_t v19 = "averageUngracefulBootTimeMs";
              goto LABEL_13;
            case 235:
              v20 = "gracefulBootTimeLogMs";
              uint64_t v21 = a1;
              int v22 = 235;
              goto LABEL_23;
            case 236:
              v20 = "ungracefulBootTimeLogMs";
              uint64_t v21 = a1;
              int v22 = 236;
              goto LABEL_23;
            case 237:
              v20 = "CalibrationCount";
              uint64_t v21 = a1;
              int v22 = 237;
              goto LABEL_22;
            case 238:
              uint64_t v18 = *v8;
              uint64_t v19 = "CalibrationLastTmp";
              goto LABEL_13;
            case 239:
              uint64_t v18 = *v8;
              uint64_t v19 = "CalibrationMaxTmp";
              goto LABEL_13;
            case 240:
              uint64_t v18 = *v8;
              uint64_t v19 = "CalibrationMinTmp";
              goto LABEL_13;
            case 241:
              uint64_t v18 = *v8;
              uint64_t v19 = "ungracefulBootWorstIndicator";
              goto LABEL_13;
            case 242:
              uint64_t v18 = *v8;
              uint64_t v19 = "metaMismatchReread";
              goto LABEL_13;
            case 243:
              uint64_t v18 = *v8;
              uint64_t v19 = "numS3SleepOps";
              goto LABEL_13;
            case 244:
              uint64_t v18 = *v8;
              uint64_t v19 = "odtsCurrent";
              goto LABEL_13;
            case 245:
              uint64_t v18 = *v8;
              uint64_t v19 = "prefetchReads";
              goto LABEL_13;
            case 246:
              uint64_t v18 = *v8;
              uint64_t v19 = "prefetchHits";
              goto LABEL_13;
            case 247:
              uint64_t v18 = *v8;
              uint64_t v19 = "prefetchWritesInvalidation";
              goto LABEL_13;
            case 248:
              uint64_t v18 = *v8;
              uint64_t v19 = "indmbUnitsTotal";
              goto LABEL_13;
            case 249:
              uint64_t v18 = *v8;
              uint64_t v19 = "selfThrottlingEngage";
              goto LABEL_13;
            case 250:
              uint64_t v18 = *v8;
              uint64_t v19 = "selfThrottlingDisengage";
              goto LABEL_13;
            case 252:
              uint64_t v18 = *v8;
              uint64_t v19 = "AbortSkip_WlpMode";
              goto LABEL_13;
            case 253:
              uint64_t v18 = *v8;
              uint64_t v19 = "hostWritesWlpMode";
              goto LABEL_13;
            case 254:
              uint64_t v18 = *v8;
              uint64_t v19 = "numClogDoubleUnc";
              goto LABEL_13;
            case 256:
              uint64_t v18 = *v8;
              uint64_t v19 = "AbortPad_WlpMode";
              goto LABEL_13;
            case 257:
              uint64_t v18 = *v8;
              uint64_t v19 = "bonfireIntermediateBandErases";
              goto LABEL_13;
            case 258:
              uint64_t v18 = *v8;
              uint64_t v19 = "bonfireUserBandErases";
              goto LABEL_13;
            case 259:
              uint64_t v18 = *v8;
              uint64_t v19 = "bonfireIntermediateBandProgs";
              goto LABEL_13;
            case 260:
              uint64_t v18 = *v8;
              uint64_t v19 = "bonfireUserBandProgs";
              goto LABEL_13;
            case 261:
              uint64_t v18 = *v8;
              uint64_t v19 = "bonfireIntermediatePageReads";
              goto LABEL_13;
            case 262:
              uint64_t v18 = *v8;
              uint64_t v19 = "bonfireUserPageReads";
              goto LABEL_13;
            case 263:
              uint64_t v18 = *v8;
              uint64_t v19 = "refreshUtil00";
              goto LABEL_13;
            case 264:
              uint64_t v18 = *v8;
              uint64_t v19 = "failToReadUtil00";
              goto LABEL_13;
            case 265:
              v20 = "readCountHisto";
              uint64_t v21 = a1;
              int v22 = 265;
LABEL_19:
              uint64_t v14 = v8;
              unsigned int v15 = 5;
              goto LABEL_12;
            case 266:
              v20 = "readAmpHisto";
              uint64_t v21 = a1;
              int v22 = 266;
              goto LABEL_85;
            case 267:
              uint64_t v18 = *v8;
              uint64_t v19 = "totalReadAmp";
              goto LABEL_13;
            case 268:
              v20 = "nvmeModeSelect";
              uint64_t v21 = a1;
              int v22 = 268;
              goto LABEL_22;
            case 269:
              v20 = "numBootBlockRefreshSuccess";
              uint64_t v21 = a1;
              int v22 = 269;
              goto LABEL_23;
            case 270:
              v20 = "numBootBlockRefreshFail";
              uint64_t v21 = a1;
              int v22 = 270;
              goto LABEL_23;
            case 271:
              uint64_t v18 = *v8;
              uint64_t v19 = "numUnsupportedAsi";
              goto LABEL_13;
            case 272:
              uint64_t v18 = *v8;
              uint64_t v19 = "NumTerminatedProgramSegs";
              goto LABEL_13;
            case 273:
              uint64_t v18 = *v8;
              uint64_t v19 = "indParityPagesDrops";
              goto LABEL_13;
            case 274:
              uint64_t v18 = *v8;
              uint64_t v19 = "indFlowPrograms";
              goto LABEL_13;
            case 277:
              v20 = "powerBudgetSelect";
              uint64_t v21 = a1;
              int v22 = 277;
LABEL_22:
              uint64_t v14 = v8;
              unsigned int v15 = 4;
              goto LABEL_12;
            case 279:
              uint64_t v18 = *v8;
              uint64_t v19 = "RxBurnNandWrites";
              goto LABEL_13;
            case 280:
              v20 = "E2EDPErrorCounters";
              uint64_t v21 = a1;
              int v22 = 280;
LABEL_153:
              uint64_t v14 = v8;
              unsigned int v15 = 12;
              goto LABEL_12;
            case 281:
              uint64_t v18 = *v8;
              uint64_t v19 = "wcacheSectorsMax";
              goto LABEL_13;
            case 282:
              uint64_t v18 = *v8;
              uint64_t v19 = "wcacheSectorsMin";
              goto LABEL_13;
            case 283:
              uint64_t v18 = *v8;
              uint64_t v19 = "wcacheSectorsCur";
              goto LABEL_13;
            case 284:
              uint64_t v18 = *v8;
              uint64_t v19 = "wcacheDS_SectorsMax";
              goto LABEL_13;
            case 285:
              uint64_t v18 = *v8;
              uint64_t v19 = "wcacheDS_SectorsMin";
              goto LABEL_13;
            case 286:
              uint64_t v18 = *v8;
              uint64_t v19 = "wcacheDS_SectorsCur";
              goto LABEL_13;
            case 287:
              uint64_t v18 = *v8;
              uint64_t v19 = "wcacheFS_Reads";
              goto LABEL_13;
            case 288:
              uint64_t v18 = *v8;
              uint64_t v19 = "wcacheDS_Reads";
              goto LABEL_13;
            case 289:
              v20 = "mspBootBlockReadFail";
              uint64_t v21 = a1;
              int v22 = 289;
              goto LABEL_155;
            case 290:
              v20 = "mspBootBlockProgFail";
              uint64_t v21 = a1;
              int v22 = 290;
              goto LABEL_155;
            case 291:
              v20 = "mspBootBlockEraseFail";
              uint64_t v21 = a1;
              int v22 = 291;
              goto LABEL_155;
            case 292:
              uint64_t v18 = *v8;
              uint64_t v19 = "bandsRefreshedOnError";
              goto LABEL_13;
            default:
              switch(v7)
              {
                case 298:
                  v20 = "perHostReads";
                  uint64_t v21 = a1;
                  int v22 = 298;
                  goto LABEL_20;
                case 299:
                  v20 = "perHostReadXacts";
                  uint64_t v21 = a1;
                  int v22 = 299;
                  goto LABEL_20;
                case 300:
                  v20 = "perHostWrites";
                  uint64_t v21 = a1;
                  int v22 = 300;
                  goto LABEL_20;
                case 301:
                  v20 = "perHostWriteXacts";
                  uint64_t v21 = a1;
                  int v22 = 301;
                  goto LABEL_20;
                case 302:
                  v20 = "perHostNumFlushes";
                  uint64_t v21 = a1;
                  int v22 = 302;
                  goto LABEL_20;
                case 303:
                  v20 = "perHostNumFences";
                  uint64_t v21 = a1;
                  int v22 = 303;
                  goto LABEL_20;
                case 304:
                  v20 = "commitPadSectorsPerFlow";
                  uint64_t v21 = a1;
                  int v22 = 304;
                  goto LABEL_11;
                case 305:
                  v20 = "wcacheDSOverWrLogSizeCnts";
                  uint64_t v21 = a1;
                  int v22 = 305;
                  goto LABEL_11;
                case 306:
                  v20 = "wcacheDSOverWrSizeByFlow";
                  uint64_t v21 = a1;
                  int v22 = 306;
                  goto LABEL_22;
                case 307:
                  v20 = "CmdRaisePrioiryEvents";
                  uint64_t v21 = a1;
                  int v22 = 307;
                  goto LABEL_11;
                case 308:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "utilNumVerification";
                  goto LABEL_13;
                case 309:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "utilRefreshes";
                  goto LABEL_13;
                case 310:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "utilBDRErrors";
                  goto LABEL_13;
                case 311:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "indBandsPerFlow";
                  goto LABEL_13;
                case 312:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "secsPerIndFlow";
                  goto LABEL_13;
                case 313:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "indDecodedECC";
                  goto LABEL_13;
                case 314:
                  v20 = "numBootBlockValidateSuccess";
                  uint64_t v21 = a1;
                  int v22 = 314;
                  goto LABEL_23;
                case 315:
                  v20 = "numBootBlockValidateFail";
                  uint64_t v21 = a1;
                  int v22 = 315;
                  goto LABEL_23;
                case 316:
                  v20 = "clogPagesFillingPercentage";
                  uint64_t v21 = a1;
                  int v22 = 316;
                  goto LABEL_22;
                case 317:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "bdrCalTimeAccFactor";
                  goto LABEL_13;
                case 318:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "bootChainRdError";
                  goto LABEL_13;
                case 319:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "bootChainBlankError";
                  goto LABEL_13;
                case 320:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "bootChainRefreshError";
                  goto LABEL_13;
                case 321:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "bootChainVersionError";
                  goto LABEL_13;
                case 322:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "mspBootBlockMismatch";
                  goto LABEL_13;
                case 323:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "mspBootBlockMismatchErr";
                  goto LABEL_13;
                case 324:
                  v20 = "bitflipAddr";
                  uint64_t v21 = a1;
                  int v22 = 324;
                  goto LABEL_19;
                case 325:
                  v20 = "bitflipCount";
                  uint64_t v21 = a1;
                  int v22 = 325;
                  goto LABEL_19;
                case 326:
                  v20 = "bitflipDupes";
                  uint64_t v21 = a1;
                  int v22 = 326;
                  goto LABEL_19;
                case 327:
                  v20 = "bandsMaxTempHisto";
                  uint64_t v21 = a1;
                  int v22 = 327;
                  goto LABEL_196;
                case 328:
                  v20 = "bandsMinTempHisto";
                  uint64_t v21 = a1;
                  int v22 = 328;
                  goto LABEL_196;
                case 329:
                  v20 = "bandsLifeTimeTempHisto";
                  uint64_t v21 = a1;
                  int v22 = 329;
LABEL_196:
                  uint64_t v14 = v8;
                  unsigned int v15 = 30;
                  goto LABEL_12;
                case 330:
                  v20 = "bandsDeltaTempHisto";
                  uint64_t v21 = a1;
                  int v22 = 330;
                  uint64_t v14 = v8;
                  unsigned int v15 = 22;
                  goto LABEL_12;
                case 331:
                  v20 = "bandsCrossTempHisto";
                  uint64_t v21 = a1;
                  int v22 = 331;
                  uint64_t v14 = v8;
                  unsigned int v15 = 45;
                  goto LABEL_12;
                case 332:
                  v20 = "wcacheWaitLogMs";
                  uint64_t v21 = a1;
                  int v22 = 332;
                  goto LABEL_11;
                case 333:
                  v20 = "wcacheDS_segsSortedLogSize";
                  uint64_t v21 = a1;
                  int v22 = 333;
                  goto LABEL_11;
                case 334:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "numFirmwareWrites";
                  goto LABEL_13;
                case 335:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "numBisWrites";
                  goto LABEL_13;
                case 336:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "numBootChainUpdates";
                  goto LABEL_13;
                case 337:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "cntCalTimeWentBackWard";
                  goto LABEL_13;
                case 338:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "indBoRecoveries";
                  goto LABEL_13;
                case 340:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "numCrossTempUecc";
                  goto LABEL_13;
                case 341:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "latencyMonitorError";
                  goto LABEL_13;
                case 343:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "utilUeccReads";
                  goto LABEL_13;
                case 344:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "numOfAvoidedGCDueToTemp";
                  goto LABEL_13;
                case 345:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "forceShutdowns";
                  goto LABEL_13;
                case 346:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "gcSlcDestinations";
                  goto LABEL_13;
                case 347:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "indReplayExtUsed";
                  goto LABEL_13;
                case 348:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "defectsPerPackageOverflow";
                  goto LABEL_13;
                case 349:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "RxBurnIntBandsProgrammed";
                  goto LABEL_13;
                case 350:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "RxBurnUsrBandsProgrammed";
                  goto LABEL_13;
                case 351:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "RxBurnIntNandWrites";
                  goto LABEL_13;
                case 352:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "RxBurnUsrNandWrites";
                  goto LABEL_13;
                case 353:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "clogLastStripeUeccs";
                  goto LABEL_13;
                case 354:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "GC_MidDestSrcSwitchSLC2TLC";
                  goto LABEL_13;
                case 355:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "GC_MidDestSrcSwitchTLC2SLC";
                  goto LABEL_13;
                case 356:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "nvme_stats_shutdown_count_host0_normal";
                  goto LABEL_13;
                case 357:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "nvme_stats_shutdown_count_host1_normal";
                  goto LABEL_13;
                case 358:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "nvme_stats_shutdown_count_host0_s2r";
                  goto LABEL_13;
                case 359:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "nvme_stats_shutdown_count_host1_s2r";
                  goto LABEL_13;
                case 360:
                  v20 = "gcPDusterIntrSrcValidityHisto";
                  uint64_t v21 = a1;
                  int v22 = 360;
                  goto LABEL_85;
                case 361:
                  v20 = "gcPDusterUserSrcValidityHisto";
                  uint64_t v21 = a1;
                  int v22 = 361;
                  goto LABEL_85;
                case 362:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "raidFailedReadParity";
                  goto LABEL_13;
                case 364:
                  uint64_t v18 = *v8;
                  uint64_t v19 = "lhotNumSkipes";
                  goto LABEL_13;
                default:
                  switch(v7)
                  {
                    case 365:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "lhotNumIsHotCalls";
                      goto LABEL_13;
                    case 366:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "lhotFullLap";
                      goto LABEL_13;
                    case 367:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "lhotSkipPrecent";
                      goto LABEL_13;
                    case 368:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "eraseSuspendEvents";
                      goto LABEL_13;
                    case 369:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "eraseSuspendedStatuses";
                      goto LABEL_13;
                    case 370:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "eraseSuspendedBands";
                      goto LABEL_13;
                    case 371:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "eraseSuspendSituationsBelowThreshold";
                      goto LABEL_13;
                    case 372:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "eraseSuspendSituationsAboveThreshold";
                      goto LABEL_13;
                    case 373:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "eraseSuspendReadChainsProcessed";
                      goto LABEL_13;
                    case 374:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "bdrLastDoneHr";
                      goto LABEL_13;
                    case 375:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "bdrBackupThreshHrs";
                      goto LABEL_13;
                    case 376:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "clogPortableProgBufs";
                      goto LABEL_13;
                    case 377:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "clogPortableDropBufs";
                      goto LABEL_13;
                    case 378:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "clogPortablePadSectors";
                      goto LABEL_13;
                    case 379:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "numRetiredBlocks";
                      goto LABEL_13;
                    case 381:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "numRefreshOnErrNandRefreshPerf";
                      goto LABEL_13;
                    case 382:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "raidReconstructReads";
                      goto LABEL_13;
                    case 383:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "gcReadsNoBlog";
                      goto LABEL_13;
                    case 384:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "AbortSkip_MPBXReadVerifyClosedBand";
                      goto LABEL_13;
                    case 385:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "openBandReadFail";
                      goto LABEL_13;
                    case 386:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "AbortSkip_MPBXReadVerifyOpenBand";
                      goto LABEL_13;
                    case 387:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "AbortSkip_MBPXFailedRebuildingParity";
                      goto LABEL_13;
                    case 388:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "raidSuccessfulPMXReconstructionInternal";
                      goto LABEL_13;
                    case 389:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "raidSuccessfulPMXReconstructionHost";
                      goto LABEL_13;
                    case 390:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "raidFailedPMXReconstructionInternal";
                      goto LABEL_13;
                    case 391:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "raidFailedPMXReconstructionHost";
                      goto LABEL_13;
                    case 392:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "raidSuccessfulRMXReconstructionInternal";
                      goto LABEL_13;
                    case 393:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "raidSuccessfulRMXReconstructionHost";
                      goto LABEL_13;
                    case 394:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "raidFailedRMXReconstructionInternal";
                      goto LABEL_13;
                    case 395:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "raidFailedRMXReconstructionHost";
                      goto LABEL_13;
                    case 396:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "raidFailedReadParityInternal";
                      goto LABEL_13;
                    case 397:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "raidFailedReadQParityInternal";
                      goto LABEL_13;
                    case 398:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "raidFailedReadQParity";
                      goto LABEL_13;
                    case 399:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "raidFailedReadQCopy";
                      goto LABEL_13;
                    case 400:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "raidFailedReconstructionQParity";
                      goto LABEL_13;
                    case 401:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "offlineBlocksCnt";
                      goto LABEL_13;
                    case 402:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "bork0Revectors";
                      goto LABEL_13;
                    case 403:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "raidFailedReadBlog";
                      goto LABEL_13;
                    case 404:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "numReliabilityRefreshes";
                      goto LABEL_13;
                    case 405:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "raidFailedReadQCopyInternal";
                      goto LABEL_13;
                    case 406:
                      v20 = "raidReconstructSuccessFlow";
                      uint64_t v21 = a1;
                      int v22 = 406;
                      goto LABEL_19;
                    case 407:
                      v20 = "raidReconstructFailFlow";
                      uint64_t v21 = a1;
                      int v22 = 407;
                      goto LABEL_19;
                    case 408:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "raidReconstructFailP";
                      goto LABEL_13;
                    case 409:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "raidReconstructFailQ";
                      goto LABEL_13;
                    case 410:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "raidReconstructFailUECC";
                      goto LABEL_13;
                    case 411:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "raidReconstructFailUnsupp";
                      goto LABEL_13;
                    case 412:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "raidUECCOpenBand";
                      goto LABEL_13;
                    case 414:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "ueccReads";
                      goto LABEL_13;
                    case 416:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "raidSuccessfulVerify";
                      goto LABEL_13;
                    case 417:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "raidFailedVerify";
                      goto LABEL_13;
                    case 418:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "numBandsVerified";
                      goto LABEL_13;
                    case 419:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "cache_heads";
                      goto LABEL_13;
                    case 420:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "AbortSkip_RMXtoMPBX";
                      goto LABEL_13;
                    case 421:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "s3eFwVer";
                      goto LABEL_13;
                    case 422:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "readVerifyNative";
                      goto LABEL_13;
                    case 423:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "reducedReadVerifyNative";
                      goto LABEL_13;
                    case 424:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "readVerifySlc";
                      goto LABEL_13;
                    case 425:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "reducedReadVerifySlc";
                      goto LABEL_13;
                    case 426:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "RxBurnEvictions";
                      goto LABEL_13;
                    case 427:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "directToTLCBands";
                      goto LABEL_13;
                    case 428:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "nandDesc";
                      goto LABEL_13;
                    case 429:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "fwUpdatesPercentUsed";
                      goto LABEL_13;
                    case 430:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "slcPercentUsed";
                      goto LABEL_13;
                    case 431:
                      uint64_t v18 = *v8;
                      uint64_t v19 = "percentUsed";
                      goto LABEL_13;
                    default:
                      switch(v7)
                      {
                        case 432:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "hostAutoWrites";
                          goto LABEL_13;
                        case 433:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "hostAutoWriteXacts";
                          goto LABEL_13;
                        case 434:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "gcDestDynamic";
                          goto LABEL_13;
                        case 435:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "gcDestStatic";
                          goto LABEL_13;
                        case 436:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "gcDestWearlevel";
                          goto LABEL_13;
                        case 437:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "gcDestParity";
                          goto LABEL_13;
                        case 438:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "AbortSkip_Format";
                          goto LABEL_13;
                        case 440:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "raidSLCPadding";
                          goto LABEL_13;
                        case 441:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "raidGCBands";
                          goto LABEL_13;
                        case 442:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "raidGCSectors";
                          goto LABEL_13;
                        case 443:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "raidGCPadding";
                          goto LABEL_13;
                        case 444:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "raidSLCBandsPerHostFlow";
                          goto LABEL_13;
                        case 445:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "raidSLCSecsPerHostFlow";
                          goto LABEL_13;
                        case 446:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "rxBurnMinCycleRuns";
                          goto LABEL_13;
                        case 447:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "clogNumFastCxt";
                          goto LABEL_13;
                        case 448:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "clogNumRapidReboots";
                          goto LABEL_13;
                        case 449:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "clogFastCxtAbvThr";
                          goto LABEL_13;
                        case 450:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "rxBurnDiffModeRuns";
                          goto LABEL_13;
                        case 452:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "indReadVerifyFail";
                          goto LABEL_13;
                        case 453:
                          v20 = "numOfThrottlingEntriesPerReadLevel";
                          uint64_t v21 = a1;
                          int v22 = 453;
                          goto LABEL_85;
                        case 454:
                          v20 = "numOfThrottlingEntriesPerWriteLevel";
                          uint64_t v21 = a1;
                          int v22 = 454;
                          goto LABEL_85;
                        case 456:
                          v20 = "slcFifoDepth";
                          uint64_t v21 = a1;
                          int v22 = 456;
                          goto LABEL_11;
                        case 457:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "wcacheSectorsDirtyIdle";
                          goto LABEL_13;
                        case 458:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "wcacheDS_SectorsDirtyIdle";
                          goto LABEL_13;
                        case 459:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "wcacheFS_MbytesDirtyIdle";
                          goto LABEL_13;
                        case 460:
                          v20 = "CacheDepthVsThroughput";
                          uint64_t v21 = a1;
                          int v22 = 460;
                          uint64_t v14 = v8;
                          unsigned int v15 = 256;
                          goto LABEL_12;
                        case 461:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "directToTLCSectors";
                          goto LABEL_13;
                        case 462:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "fallbackToWaterfall";
                          goto LABEL_13;
                        case 463:
                          v20 = "balanceProportionBucketsHistogram";
                          uint64_t v21 = a1;
                          int v22 = 463;
LABEL_320:
                          uint64_t v14 = v8;
                          unsigned int v15 = 11;
                          goto LABEL_12;
                        case 464:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "lockToTlc";
                          goto LABEL_13;
                        case 465:
                          v20 = "burstSizeHistogram";
                          uint64_t v21 = a1;
                          int v22 = 465;
                          goto LABEL_11;
                        case 466:
                          v20 = "qosDirectToTLC";
                          uint64_t v21 = a1;
                          int v22 = 466;
                          goto LABEL_342;
                        case 467:
                          v20 = "maxQosDirectToTLC";
                          uint64_t v21 = a1;
                          int v22 = 467;
                          goto LABEL_22;
                        case 468:
                          v20 = "wcacheDirtyAtFlush";
                          uint64_t v21 = a1;
                          int v22 = 468;
                          goto LABEL_85;
                        case 469:
                          v20 = "raidReconstructSuccessPartition";
                          uint64_t v21 = a1;
                          int v22 = 469;
                          goto LABEL_20;
                        case 470:
                          v20 = "raidReconstructFailPartition";
                          uint64_t v21 = a1;
                          int v22 = 470;
                          goto LABEL_20;
                        case 471:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "raidUncleanBootBandFail";
                          goto LABEL_13;
                        case 472:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "raidReconstructFailBandFlowHost";
                          goto LABEL_13;
                        case 473:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "raidReconstructFailBandFlowGC";
                          goto LABEL_13;
                        case 476:
                          v20 = "raidSuccessfulRecoLbaRange";
                          uint64_t v21 = a1;
                          int v22 = 476;
                          goto LABEL_20;
                        case 477:
                          v20 = "raidFailedRecoLbaRange";
                          uint64_t v21 = a1;
                          int v22 = 477;
                          goto LABEL_20;
                        case 481:
                          v20 = "skinnyBandErases_481";
                          uint64_t v21 = a1;
                          int v22 = 481;
                          goto LABEL_155;
                        case 483:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "tlcOverHeatWaterfall";
                          goto LABEL_13;
                        case 484:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "skinnyCyclesConvert";
                          goto LABEL_13;
                        case 485:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "non_proportional_directToTLCSectors";
                          goto LABEL_13;
                        case 486:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "maxFailedFastCxtSync";
                          goto LABEL_13;
                        case 487:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "numFormatUserArea";
                          goto LABEL_13;
                        case 488:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "clogFastCxtSyncAborted";
                          goto LABEL_13;
                        case 489:
                          v20 = "clogOccupationSectors";
                          uint64_t v21 = a1;
                          int v22 = 489;
                          goto LABEL_19;
                        case 490:
                          v20 = "bdrTmpHist";
                          uint64_t v21 = a1;
                          int v22 = 490;
LABEL_342:
                          uint64_t v14 = v8;
                          unsigned int v15 = 64;
                          goto LABEL_12;
                        case 491:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "numFWUpdates";
                          goto LABEL_13;
                        case 492:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "numClogLoadFails";
                          goto LABEL_13;
                        case 493:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "rxBurnNumForcedDiffMode";
                          goto LABEL_13;
                        case 494:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "RD_numSaves";
                          goto LABEL_13;
                        case 495:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "eanCompressWrites";
                          goto LABEL_13;
                        case 496:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "eanHostWrites";
                          goto LABEL_13;
                        case 497:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "bandPreErases";
                          goto LABEL_13;
                        case 498:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "eanHostUnmaps";
                          goto LABEL_13;
                        case 499:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "eanHostFlushes";
                          goto LABEL_13;
                        case 500:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "eanFastWrites";
                          goto LABEL_13;
                        case 501:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "autowriteDS2FSCollisions";
                          goto LABEL_13;
                        case 502:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "autowriteWaitTransferTaskBlocks";
                          goto LABEL_13;
                        case 503:
                          v20 = "avgCycle";
                          uint64_t v21 = a1;
                          int v22 = 503;
                          goto LABEL_20;
                        case 504:
                          uint64_t v18 = *v8;
                          uint64_t v19 = "RD_DeferredClearsOverflowCnt";
                          goto LABEL_13;
                        default:
                          switch(v7)
                          {
                            case 505:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "maxVerticsInBand";
                              goto LABEL_13;
                            case 506:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "numVertics";
                              goto LABEL_13;
                            case 507:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "exceededCVertics";
                              goto LABEL_13;
                            case 510:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "raidReconstructFailMismatch";
                              goto LABEL_13;
                            case 511:
                              v20 = "mspbootBlockRefreshCnt";
                              uint64_t v21 = a1;
                              int v22 = 511;
                              goto LABEL_155;
                            case 516:
                              v20 = "mspBootBlockRefreshTime";
                              uint64_t v21 = a1;
                              int v22 = 516;
                              goto LABEL_155;
                            case 517:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "mspBootBlockCountPerMsp";
                              goto LABEL_13;
                            case 518:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "skinnyRevectorSLC";
                              goto LABEL_13;
                            case 519:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "skinnyRevectorTLC";
                              goto LABEL_13;
                            case 520:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "perfSetupAttempts";
                              goto LABEL_13;
                            case 521:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "perfSetupSuccesses";
                              goto LABEL_13;
                            case 522:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "perfWriteAttempts";
                              goto LABEL_13;
                            case 523:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "perfWriteSuccesses";
                              goto LABEL_13;
                            case 524:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "perfReadAttempts";
                              goto LABEL_13;
                            case 525:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "perfReadSuccesses";
                              goto LABEL_13;
                            case 526:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "perfCleanupAttempts";
                              goto LABEL_13;
                            case 527:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "perfCleanupSuccesses";
                              goto LABEL_13;
                            case 530:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "firstFailedDieId";
                              goto LABEL_13;
                            case 531:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "numDieFailures";
                              goto LABEL_13;
                            case 532:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "spareAvailablePercent";
                              goto LABEL_13;
                            case 533:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "dataFabricErr";
                              goto LABEL_13;
                            case 534:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "downlinkFabricErr";
                              goto LABEL_13;
                            case 535:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "prpAccTimeoutErr";
                              goto LABEL_13;
                            case 537:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "uplinkFabricErr";
                              goto LABEL_13;
                            case 538:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "skinnyBandsGBB";
                              goto LABEL_13;
                            case 539:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "AbortPad_GcMustPadBand";
                              goto LABEL_13;
                            case 540:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "AbortPad_GcMustPadSkinny";
                              goto LABEL_13;
                            case 541:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "bdrHostPingInitial";
                              goto LABEL_13;
                            case 542:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "bdrHostPingMoreNeeded";
                              goto LABEL_13;
                            case 543:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "bandParityAllocationFailed";
                              goto LABEL_13;
                            case 544:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "fastHwBurstToSlc";
                              goto LABEL_13;
                            case 545:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "slowHwToTlc";
                              goto LABEL_13;
                            case 546:
                              v20 = "slcDemandBurstSizeDetected";
                              uint64_t v21 = a1;
                              int v22 = 546;
                              goto LABEL_11;
                            case 547:
                              v20 = "slcDemandBurstDur";
                              uint64_t v21 = a1;
                              int v22 = 547;
                              goto LABEL_11;
                            case 548:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "fastHwToTlcBurst";
                              goto LABEL_13;
                            case 549:
                              v20 = "slcDemandBurstSizeSlc";
                              uint64_t v21 = a1;
                              int v22 = 549;
                              goto LABEL_11;
                            case 551:
                              v20 = "balanceProportionBucketsHistogramTlc";
                              uint64_t v21 = a1;
                              int v22 = 551;
                              goto LABEL_320;
                            case 553:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "slowHwFlushToSlc";
                              goto LABEL_13;
                            case 557:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "slowHwToSlc";
                              goto LABEL_13;
                            case 558:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "flushNwToSlc";
                              goto LABEL_13;
                            case 559:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "flushNwToTlc";
                              goto LABEL_13;
                            case 560:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "oslcHw";
                              goto LABEL_13;
                            case 561:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "oslcTransitions";
                              goto LABEL_13;
                            case 563:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "slcDemandFlushCount";
                              goto LABEL_13;
                            case 564:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "slcDemandBurstCount";
                              goto LABEL_13;
                            case 565:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "oslcBaseAvgPE";
                              goto LABEL_13;
                            case 566:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "raidReconstructFailNoSPBX";
                              goto LABEL_13;
                            case 567:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "raidReconstructFailDouble";
                              goto LABEL_13;
                            case 568:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "oslcFastWAmpUOnOff";
                              goto LABEL_13;
                            case 569:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "oslcSlowWAmpUOnOff";
                              goto LABEL_13;
                            case 570:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "raidReconstructFailInvalid";
                              goto LABEL_13;
                            case 572:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "oslcLastWAmpUx10";
                              goto LABEL_13;
                            case 573:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "raidFailedReadNoBlog";
                              goto LABEL_13;
                            case 574:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "raidReconstructFailBlank";
                              goto LABEL_13;
                            case 575:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "oslcHotTLCOnOff";
                              goto LABEL_13;
                            case 576:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "gcVPackDestinations";
                              goto LABEL_13;
                            case 581:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "averageTLCPECycles";
                              goto LABEL_13;
                            case 582:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "averageSLCPECycles";
                              goto LABEL_13;
                            case 583:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "numAtomicBoots";
                              goto LABEL_13;
                            case 584:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "clogMinorMismatch";
                              goto LABEL_13;
                            case 586:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "raidExpectedFailRMXReconstructionInternal";
                              goto LABEL_13;
                            case 587:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "raidExpectedFailRMXReconstructionHost";
                              goto LABEL_13;
                            case 588:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "oslcGCinvalidations";
                              goto LABEL_13;
                            case 589:
                              uint64_t v18 = *v8;
                              uint64_t v19 = "oslcGCActivateReason";
                              goto LABEL_13;
                            default:
                              switch(v7)
                              {
                                case 590:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "oslcLowCleanBandsUOnOff";
                                  goto LABEL_13;
                                case 591:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "oslcTooManyGCMustOnOff";
                                  goto LABEL_13;
                                case 592:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "oslcBaseHostWrites";
                                  goto LABEL_13;
                                case 593:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "oslcBaseBandErases";
                                  goto LABEL_13;
                                case 594:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "oslcBdrBands";
                                  goto LABEL_13;
                                case 595:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "oslcBdrValid";
                                  goto LABEL_13;
                                case 596:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "unexpectedBlanksInternal";
                                  goto LABEL_13;
                                case 597:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "unexpectedBlanksOnRV";
                                  goto LABEL_13;
                                case 601:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "waterfallLockSectors";
                                  goto LABEL_13;
                                case 602:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "oslcGCActiveWrites";
                                  goto LABEL_13;
                                case 603:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "chipIdTemperatureSample";
                                  goto LABEL_13;
                                case 604:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "gcVPackWrites";
                                  goto LABEL_13;
                                case 605:
                                  v20 = "gcActiveReasons";
                                  uint64_t v21 = a1;
                                  int v22 = 605;
                                  goto LABEL_11;
                                case 606:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "eanMaxInitTimeMs";
                                  goto LABEL_13;
                                case 607:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "eanMinToFirstReadTimeMs";
                                  goto LABEL_13;
                                case 608:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "skinnyAPGMRetire";
                                  goto LABEL_13;
                                case 609:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "unexpectedBlanksHost";
                                  goto LABEL_13;
                                case 610:
                                  v20 = "pcieAerCounters";
                                  uint64_t v21 = a1;
                                  int v22 = 610;
                                  goto LABEL_342;
                                case 611:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "fastHwToTlcBalance";
                                  goto LABEL_13;
                                case 612:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "perfOSLCRuns";
                                  goto LABEL_13;
                                case 613:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "slcDemandBurstWritesInGC";
                                  goto LABEL_13;
                                case 614:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "slcDemandBurstWritesInTT";
                                  goto LABEL_13;
                                case 615:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "slcDemandBurstWritesInNRP";
                                  goto LABEL_13;
                                case 616:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "perfTotalDmaMb";
                                  goto LABEL_13;
                                case 617:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "eanAvgInitTimeMs";
                                  goto LABEL_13;
                                case 618:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "eanAvgToFirstReadTimeMs";
                                  goto LABEL_13;
                                case 619:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "eanMaxBootReadTimeMs";
                                  goto LABEL_13;
                                case 620:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "eanAvgBootReadTimeMs";
                                  goto LABEL_13;
                                case 621:
                                  v20 = "eanBootReadsHist";
                                  uint64_t v21 = a1;
                                  int v22 = 621;
                                  goto LABEL_11;
                                case 622:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "maxBgInitTimeMs";
                                  goto LABEL_13;
                                case 623:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "avgBgInitTimeMs";
                                  goto LABEL_13;
                                case 624:
                                  v20 = "clogFailReason";
                                  uint64_t v21 = a1;
                                  int v22 = 624;
                                  goto LABEL_85;
                                case 625:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "eanMinBootReadMBPerSec";
                                  goto LABEL_13;
                                case 626:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "eanAvgBootReadMBPerSec";
                                  goto LABEL_13;
                                case 627:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "minSkinnyPECycles";
                                  goto LABEL_13;
                                case 628:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "maxSkinnyPECycles";
                                  goto LABEL_13;
                                case 629:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "averageSkinnyPECycles";
                                  goto LABEL_13;
                                case 630:
                                  v20 = "raidSuccessfulRecoEAN";
                                  uint64_t v21 = a1;
                                  int v22 = 630;
                                  goto LABEL_463;
                                case 631:
                                  v20 = "raidFailedRecoEAN";
                                  uint64_t v21 = a1;
                                  int v22 = 631;
                                  goto LABEL_463;
                                case 632:
                                  v20 = "eanFirstReadMode";
                                  uint64_t v21 = a1;
                                  int v22 = 632;
LABEL_463:
                                  uint64_t v14 = v8;
                                  unsigned int v15 = 6;
                                  goto LABEL_12;
                                case 635:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "oslcHwGC";
                                  goto LABEL_13;
                                case 636:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "oslcHwTT";
                                  goto LABEL_13;
                                case 637:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "oslcHwNRP";
                                  goto LABEL_13;
                                case 638:
                                  v20 = "oslcDemandBurstSize";
                                  uint64_t v21 = a1;
                                  int v22 = 638;
                                  goto LABEL_11;
                                case 639:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "raidReconstructSuccessBandFlowOslc";
                                  goto LABEL_13;
                                case 640:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "raidReconstructFailBandFlowOslc";
                                  goto LABEL_13;
                                case 641:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "raidFailSectors";
                                  goto LABEL_13;
                                case 642:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "eanFailSectors";
                                  goto LABEL_13;
                                case 643:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "bdrTimeMode";
                                  goto LABEL_13;
                                case 644:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "raidParityNotSavedP";
                                  goto LABEL_13;
                                case 645:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "raidParityNotSavedQ";
                                  goto LABEL_13;
                                case 646:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "raidParityInvalid";
                                  goto LABEL_13;
                                case 647:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "raidParityUnknown";
                                  goto LABEL_13;
                                case 648:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "raidParityUnmapped";
                                  goto LABEL_13;
                                case 649:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "raidParityGCUnc";
                                  goto LABEL_13;
                                case 657:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "AbortSkip_MPBXProbational";
                                  goto LABEL_13;
                                case 659:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "raidVerificationReads";
                                  goto LABEL_13;
                                case 666:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "nofDies";
                                  goto LABEL_13;
                                case 671:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "skinnyBandsNum";
                                  goto LABEL_13;
                                case 672:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "skinnyBandsNumDips";
                                  goto LABEL_13;
                                case 674:
                                  v20 = "oslcNoVotesHw";
                                  uint64_t v21 = a1;
                                  int v22 = 674;
                                  goto LABEL_23;
                                case 675:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "totalLbas";
                                  goto LABEL_13;
                                case 676:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "bdrHostPingExtra";
                                  goto LABEL_13;
                                case 677:
                                  uint64_t v18 = *v8;
                                  uint64_t v19 = "magazineInstanceMeta";
                                  goto LABEL_13;
                                default:
                                  switch(v7)
                                  {
                                    case 680:
                                      v20 = "magazineFWVersion";
                                      uint64_t v21 = a1;
                                      int v22 = 680;
                                      goto LABEL_21;
                                    case 681:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "raidReconstructFailPMXUnsup";
                                      goto LABEL_13;
                                    case 682:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "raidReconstructFailBMXUnsup";
                                      goto LABEL_13;
                                    case 683:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "iBootNANDResets";
                                      goto LABEL_13;
                                    case 684:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "pcieClkreqHighTimeout";
                                      goto LABEL_13;
                                    case 687:
                                      v20 = "cbdrInitSent";
                                      uint64_t v21 = a1;
                                      int v22 = 687;
LABEL_21:
                                      uint64_t v14 = v8;
                                      unsigned int v15 = 3;
                                      goto LABEL_12;
                                    case 688:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "cbdrPauseSent";
                                      goto LABEL_13;
                                    case 689:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "cbdrResumeSent";
                                      goto LABEL_13;
                                    case 690:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "cbdrGetResultSent";
                                      goto LABEL_13;
                                    case 691:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "cbdrEarlyExits";
                                      goto LABEL_13;
                                    case 694:
                                      v20 = "cbdrRefreshGrades";
                                      uint64_t v21 = a1;
                                      int v22 = 694;
                                      goto LABEL_11;
                                    case 695:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "cbdrNotEnoughReads";
                                      goto LABEL_13;
                                    case 696:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "cbdrAborts";
                                      goto LABEL_13;
                                    case 697:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "TurboRaidHostClassifications";
                                      goto LABEL_13;
                                    case 698:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "TurboRaidInternalClassifications";
                                      goto LABEL_13;
                                    case 699:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "cbdrFullyDone";
                                      goto LABEL_13;
                                    case 702:
                                      v20 = "vcurve";
                                      uint64_t v21 = a1;
                                      int v22 = 702;
                                      goto LABEL_155;
                                    case 703:
                                      v20 = "injDepth";
                                      uint64_t v21 = a1;
                                      int v22 = 703;
                                      goto LABEL_153;
                                    case 704:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "logical_disk_occupied_promiles";
                                      goto LABEL_13;
                                    case 711:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "raidPrevFailedReconstructSkip";
                                      goto LABEL_13;
                                    case 712:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "TurboRaidSuccessfulHostAuxReads";
                                      goto LABEL_13;
                                    case 713:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "TurboRaidSuccessfulInternalAuxReads";
                                      goto LABEL_13;
                                    case 714:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "turboRaidClassificationReliabilityHost";
                                      goto LABEL_13;
                                    case 715:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "turboRaidClassificationReliabilityInternal";
                                      goto LABEL_13;
                                    case 716:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "turboRaidClassificationQualityHost";
                                      goto LABEL_13;
                                    case 717:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "turboRaidClassificationQualityInternal";
                                      goto LABEL_13;
                                    case 719:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "skinnyBandErases";
                                      goto LABEL_13;
                                    case 721:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "gcPDusterDestinations";
                                      goto LABEL_13;
                                    case 722:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "gcPDusterWrites";
                                      goto LABEL_13;
                                    case 730:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "rvFails";
                                      goto LABEL_13;
                                    case 737:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "TurboRaidFailedHostAuxReads";
                                      goto LABEL_13;
                                    case 738:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "TurboRaidFailedInternalAuxReads";
                                      goto LABEL_13;
                                    case 741:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "autoSkipTriggers";
                                      goto LABEL_13;
                                    case 742:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "autoSkipPlanes";
                                      goto LABEL_13;
                                    case 744:
                                      v20 = "raidReconstructDurationHisto";
                                      uint64_t v21 = a1;
                                      int v22 = 744;
                                      goto LABEL_23;
                                    case 745:
                                      v20 = "failsOnReconstructHisto";
                                      uint64_t v21 = a1;
                                      int v22 = 745;
                                      goto LABEL_23;
                                    case 746:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "bandKill_userFlattenExcessive";
                                      goto LABEL_13;
                                    case 747:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "bandKill_IntFlattenExcessive";
                                      goto LABEL_13;
                                    case 748:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "bandKill_userFlattenBalance";
                                      goto LABEL_13;
                                    case 749:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "bandKill_intFlattenBalance";
                                      goto LABEL_13;
                                    case 750:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "bandKill_formatVertExcessive";
                                      goto LABEL_13;
                                    case 751:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "bandKill_formatVertBalance";
                                      goto LABEL_13;
                                    case 753:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "cbdrNumSlowRefreshes";
                                      goto LABEL_13;
                                    case 754:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "cbdrNumFastRefreshes";
                                      goto LABEL_13;
                                    case 755:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "cbdrTotalRefreshValidity";
                                      goto LABEL_13;
                                    case 756:
                                      v20 = "cbdrRefreshedAges";
                                      uint64_t v21 = a1;
                                      int v22 = 756;
                                      goto LABEL_545;
                                    case 758:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "cbdrSkippedBlocks";
                                      goto LABEL_13;
                                    case 759:
                                      v20 = "cbdrScanPct";
                                      uint64_t v21 = a1;
                                      int v22 = 759;
                                      goto LABEL_19;
                                    case 760:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "raidSuccessfulBMXReconstructionInternal";
                                      goto LABEL_13;
                                    case 761:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "raidSuccessfulBMXReconstructionHost";
                                      goto LABEL_13;
                                    case 762:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "raidFailedBMXReconstructionInternal";
                                      goto LABEL_13;
                                    case 763:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "raidFailedBMXReconstructionHost";
                                      goto LABEL_13;
                                    case 764:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "ricSPRVFail";
                                      goto LABEL_13;
                                    case 765:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "ricMPRVFail";
                                      goto LABEL_13;
                                    case 767:
                                      v20 = "cbdrRefreshGradesSLC";
                                      uint64_t v21 = a1;
                                      int v22 = 767;
                                      goto LABEL_11;
                                    case 768:
                                      v20 = "cbdrRefreshedAgesSLC";
                                      uint64_t v21 = a1;
                                      int v22 = 768;
LABEL_545:
                                      uint64_t v14 = v8;
                                      unsigned int v15 = 9;
                                      goto LABEL_12;
                                    case 769:
                                      v20 = "cbdrScanPctSLC";
                                      uint64_t v21 = a1;
                                      int v22 = 769;
                                      goto LABEL_19;
                                    case 770:
                                      v20 = "cpuBurstLength";
                                      uint64_t v21 = a1;
                                      int v22 = 770;
                                      goto LABEL_23;
                                    case 771:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "autoSkipRaidRecoFail";
                                      goto LABEL_13;
                                    case 772:
                                      v20 = "dmReasonsSlc";
                                      uint64_t v21 = a1;
                                      int v22 = 772;
                                      goto LABEL_155;
                                    case 773:
                                      v20 = "dmReasonsTlc";
                                      uint64_t v21 = a1;
                                      int v22 = 773;
                                      goto LABEL_155;
                                    case 774:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "raidReconstructFailBMXAbort";
                                      goto LABEL_13;
                                    case 775:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "bandKill_fatBindingNoBlocks";
                                      goto LABEL_13;
                                    case 776:
                                      uint64_t v18 = *v8;
                                      uint64_t v19 = "bandKill_fatBindingFewBlocks";
                                      goto LABEL_13;
                                    default:
                                      switch(v7)
                                      {
                                        case 777:
                                          uint64_t v18 = *v8;
                                          uint64_t v19 = "numBadBootBlocks";
                                          goto LABEL_13;
                                        case 778:
                                          uint64_t v18 = *v8;
                                          uint64_t v19 = "snapshotCPUHigh";
                                          goto LABEL_13;
                                        case 779:
                                          uint64_t v18 = *v8;
                                          uint64_t v19 = "snapshotCPULow";
                                          goto LABEL_13;
                                        case 780:
                                          uint64_t v18 = *v8;
                                          uint64_t v19 = "gcWithoutBMs";
                                          goto LABEL_13;
                                        case 781:
                                          v20 = "gcSearchTimeHistory";
                                          uint64_t v21 = a1;
                                          int v22 = 781;
                                          goto LABEL_11;
                                        case 785:
                                          v20 = "gcSearchPortion";
                                          uint64_t v21 = a1;
                                          int v22 = 785;
                                          goto LABEL_85;
                                        case 786:
                                          uint64_t v18 = *v8;
                                          uint64_t v19 = "raidReconstructFailBmxMp";
                                          goto LABEL_13;
                                        case 787:
                                          uint64_t v18 = *v8;
                                          uint64_t v19 = "raidReconstructFailBmx";
                                          goto LABEL_13;
                                        case 788:
                                          uint64_t v18 = *v8;
                                          uint64_t v19 = "raidReconstructFailBMXUECC";
                                          goto LABEL_13;
                                        case 789:
                                          uint64_t v18 = *v8;
                                          uint64_t v19 = "raidReconstructFailBMXBlank";
                                          goto LABEL_13;
                                        case 790:
                                          uint64_t v18 = *v8;
                                          uint64_t v19 = "raidPrevFailedReconstructBmxMpSkip";
                                          goto LABEL_13;
                                        case 792:
                                          uint64_t v18 = *v8;
                                          uint64_t v19 = "numTLCFatBands";
                                          goto LABEL_13;
                                        case 793:
                                          uint64_t v18 = *v8;
                                          uint64_t v19 = "fatValidity";
                                          goto LABEL_13;
                                        case 794:
                                          uint64_t v18 = *v8;
                                          uint64_t v19 = "fatTotal";
                                          goto LABEL_13;
                                        case 798:
                                          v20 = "raidBMXFailP";
                                          uint64_t v21 = a1;
                                          int v22 = 798;
                                          goto LABEL_22;
                                        case 799:
                                          v20 = "raidBMXFailUECC";
                                          uint64_t v21 = a1;
                                          int v22 = 799;
                                          goto LABEL_22;
                                        case 804:
                                          v20 = "raidBMXFailNoSPBX";
                                          uint64_t v21 = a1;
                                          int v22 = 804;
                                          goto LABEL_22;
                                        case 806:
                                          v20 = "raidBMXFailBlank";
                                          uint64_t v21 = a1;
                                          int v22 = 806;
                                          goto LABEL_22;
                                        case 809:
                                          v20 = "raidBMXFailUnsup";
                                          uint64_t v21 = a1;
                                          int v22 = 809;
                                          goto LABEL_22;
                                        case 811:
                                          v20 = "raidBMXFailMpSkip";
                                          uint64_t v21 = a1;
                                          int v22 = 811;
                                          goto LABEL_22;
                                        case 812:
                                          v20 = "raidBMXFailAbort";
                                          uint64_t v21 = a1;
                                          int v22 = 812;
                                          goto LABEL_22;
                                        case 813:
                                          uint64_t v18 = *v8;
                                          uint64_t v19 = "TurboRaidIsEnabled";
                                          goto LABEL_13;
                                        case 814:
                                          v20 = "raidBMXFailOther";
                                          uint64_t v21 = a1;
                                          int v22 = 814;
                                          goto LABEL_22;
                                        case 815:
                                          v20 = "raidBMXSuccess";
                                          uint64_t v21 = a1;
                                          int v22 = 815;
                                          goto LABEL_22;
                                        case 816:
                                          uint64_t v18 = *v8;
                                          uint64_t v19 = "skinnyBandsExtraDip";
                                          goto LABEL_13;
                                        case 821:
                                          uint64_t v18 = *v8;
                                          uint64_t v19 = "writeAmp";
                                          goto LABEL_13;
                                        case 822:
                                          uint64_t v18 = *v8;
                                          uint64_t v19 = "ricMaxClogOnlyPages";
                                          goto LABEL_13;
                                        case 823:
                                          v20 = "readClassifyStatusesHisto";
                                          uint64_t v21 = a1;
                                          int v22 = 823;
                                          goto LABEL_21;
                                        case 824:
                                          v20 = "readWithAuxStatusesHisto";
                                          uint64_t v21 = a1;
                                          int v22 = 824;
                                          goto LABEL_11;
                                        case 825:
                                          v20 = "readReconstructStatusesHisto";
                                          uint64_t v21 = a1;
                                          int v22 = 825;
                                          goto LABEL_11;
                                        case 826:
                                          uint64_t v18 = *v8;
                                          uint64_t v19 = "bdrBackupChecks";
                                          goto LABEL_13;
                                        case 827:
                                          uint64_t v18 = *v8;
                                          uint64_t v19 = "ricExceedClogOnlyPagesTH";
                                          goto LABEL_13;
                                        case 828:
                                          uint64_t v18 = *v8;
                                          uint64_t v19 = "numDipFailures";
                                          goto LABEL_13;
                                        case 831:
                                          uint64_t v18 = *v8;
                                          uint64_t v19 = "prefetchNextRange";
                                          goto LABEL_13;
                                        case 862:
                                          uint64_t v18 = *v8;
                                          uint64_t v19 = "raidSuccessfulSkip";
                                          goto LABEL_13;
                                        case 863:
                                          uint64_t v18 = *v8;
                                          uint64_t v19 = "raidFailedSkip";
                                          goto LABEL_13;
                                        case 864:
                                          uint64_t v18 = *v8;
                                          uint64_t v19 = "raidSkipAttempts";
                                          goto LABEL_13;
                                        case 865:
                                          v20 = "timeOfThrottlingPerLevel";
                                          uint64_t v21 = a1;
                                          int v22 = 865;
                                          goto LABEL_85;
                                        case 866:
                                          v20 = "timeOfThrottlingPerReadLevel";
                                          uint64_t v21 = a1;
                                          int v22 = 866;
                                          goto LABEL_85;
                                        case 867:
                                          v20 = "timeOfThrottlingPerWriteLevel";
                                          uint64_t v21 = a1;
                                          int v22 = 867;
                                          goto LABEL_85;
                                        case 868:
                                          v20 = "dmReasonsSlc_1bc";
                                          uint64_t v21 = a1;
                                          int v22 = 868;
                                          goto LABEL_155;
                                        case 869:
                                          v20 = "dmReasonsTlc_1bc";
                                          uint64_t v21 = a1;
                                          int v22 = 869;
                                          goto LABEL_155;
                                        case 870:
                                          v20 = "dmReasonsSlc_1bc_he";
                                          uint64_t v21 = a1;
                                          int v22 = 870;
                                          goto LABEL_155;
                                        case 871:
                                          v20 = "dmReasonsTlc_1bc_he";
                                          uint64_t v21 = a1;
                                          int v22 = 871;
                                          goto LABEL_155;
                                        case 876:
                                          v20 = "dmReasonsSlc_mbc";
                                          uint64_t v21 = a1;
                                          int v22 = 876;
                                          goto LABEL_155;
                                        case 877:
                                          v20 = "dmReasonsTlc_mbc";
                                          uint64_t v21 = a1;
                                          int v22 = 877;
                                          goto LABEL_155;
                                        case 883:
                                          uint64_t v18 = *v8;
                                          uint64_t v19 = "clogEmptyProgramms";
                                          goto LABEL_13;
                                        case 884:
                                          uint64_t v18 = *v8;
                                          uint64_t v19 = "oslcHwCloseBand";
                                          goto LABEL_13;
                                        case 891:
                                          v20 = "turboRaidSuccessAuxPartition";
                                          uint64_t v21 = a1;
                                          int v22 = 891;
                                          goto LABEL_20;
                                        case 892:
                                          v20 = "turboRaidFailAuxPartition";
                                          uint64_t v21 = a1;
                                          int v22 = 892;
                                          goto LABEL_20;
                                        case 893:
                                          v20 = "turboRaidClassifyQualPartition";
                                          uint64_t v21 = a1;
                                          int v22 = 893;
                                          goto LABEL_20;
                                        case 894:
                                          v20 = "turboRaidClassifyRelPartition";
                                          uint64_t v21 = a1;
                                          int v22 = 894;
                                          goto LABEL_20;
                                        case 895:
                                          uint64_t v18 = *v8;
                                          uint64_t v19 = "IND_pool_freeMinSilo";
                                          goto LABEL_13;
                                        case 896:
                                          uint64_t v18 = *v8;
                                          uint64_t v19 = "autoSweepBlocks";
                                          goto LABEL_13;
                                        case 897:
                                          v20 = "wcWrFragSizes";
                                          uint64_t v21 = a1;
                                          int v22 = 897;
                                          goto LABEL_85;
                                        case 898:
                                          v20 = "indStateAcrossGcDidNoL";
                                          uint64_t v21 = a1;
                                          int v22 = 898;
                                          goto LABEL_85;
                                        case 899:
                                          v20 = "indStateAcrossGcDidL";
                                          uint64_t v21 = a1;
                                          int v22 = 899;
                                          goto LABEL_85;
                                        case 900:
                                          uint64_t v18 = *v8;
                                          uint64_t v19 = "turboRaidNoClassifyDueToWasRetire";
                                          goto LABEL_13;
                                        case 901:
                                          uint64_t v18 = *v8;
                                          uint64_t v19 = "turboRaidNoClassifyDueToOpenBand";
                                          goto LABEL_13;
                                        case 902:
                                          uint64_t v18 = *v8;
                                          uint64_t v19 = "turboRaidNoClassifyDueToQualityBlock";
                                          goto LABEL_13;
                                        case 903:
                                          uint64_t v18 = *v8;
                                          uint64_t v19 = "turboRaidGbbOpenBand";
                                          goto LABEL_13;
                                        case 904:
                                          uint64_t v18 = *v8;
                                          uint64_t v19 = "turboRaidGbbShouldRetireOnRefresh";
                                          goto LABEL_13;
                                        case 905:
                                          v20 = "turboRaidRelPerBlock";
                                          uint64_t v21 = a1;
                                          int v22 = 905;
                                          goto LABEL_85;
                                        case 906:
                                          v20 = "turboRaidRelBetweenRefreshesPerBlock";
                                          uint64_t v21 = a1;
                                          int v22 = 906;
                                          goto LABEL_85;
                                        default:
                                          if (v7 <= 1039)
                                          {
                                            switch(v7)
                                            {
                                              case 907:
                                                v20 = "turboRaidMaxRelBetweenRefreshesPerBlock";
                                                uint64_t v21 = a1;
                                                int v22 = 907;
                                                goto LABEL_85;
                                              case 908:
                                                v20 = "turboRaidMinRelBetweenRefreshesPerBlock";
                                                uint64_t v21 = a1;
                                                int v22 = 908;
                                                goto LABEL_85;
                                              case 909:
                                              case 910:
                                              case 911:
                                              case 912:
                                              case 913:
                                              case 914:
                                              case 915:
                                              case 916:
                                              case 917:
                                              case 924:
                                              case 925:
                                              case 926:
                                              case 927:
                                              case 928:
                                              case 929:
                                              case 936:
                                              case 941:
                                              case 945:
                                              case 946:
                                              case 947:
                                              case 949:
                                              case 950:
                                              case 952:
                                              case 954:
                                              case 955:
                                              case 956:
                                              case 957:
                                              case 958:
                                              case 959:
                                              case 960:
                                              case 963:
                                              case 964:
                                              case 965:
                                              case 966:
                                              case 968:
                                              case 969:
                                              case 970:
                                                goto LABEL_696;
                                              case 918:
                                                v20 = "turboRaidMaxCyclesBetweenRel";
                                                uint64_t v21 = a1;
                                                int v22 = 918;
                                                goto LABEL_85;
                                              case 919:
                                                v20 = "turboRaidMinCyclesBetweenRel";
                                                uint64_t v21 = a1;
                                                int v22 = 919;
                                                goto LABEL_85;
                                              case 920:
                                                v20 = "turboRaidAuxPerBlock";
                                                uint64_t v21 = a1;
                                                int v22 = 920;
                                                goto LABEL_85;
                                              case 921:
                                                v20 = "turboRaidAuxBetweenRefreshesPerBlock";
                                                uint64_t v21 = a1;
                                                int v22 = 921;
                                                goto LABEL_85;
                                              case 922:
                                                uint64_t v18 = *v8;
                                                uint64_t v19 = "turboRaidRelLockMark";
                                                goto LABEL_13;
                                              case 923:
                                                uint64_t v18 = *v8;
                                                uint64_t v19 = "turboRaidAuxLockMark";
                                                goto LABEL_13;
                                              case 930:
                                                v20 = "turboRaidMaxCyclesBetweenAux";
                                                uint64_t v21 = a1;
                                                int v22 = 930;
                                                goto LABEL_85;
                                              case 931:
                                                v20 = "turboRaidMinCyclesBetweenAux";
                                                uint64_t v21 = a1;
                                                int v22 = 931;
                                                goto LABEL_85;
                                              case 932:
                                                v20 = "turboRaidLastRelPECycles";
                                                uint64_t v21 = a1;
                                                int v22 = 932;
                                                goto LABEL_85;
                                              case 933:
                                                v20 = "turboRaidRelQualPECycles";
                                                uint64_t v21 = a1;
                                                int v22 = 933;
                                                goto LABEL_85;
                                              case 934:
                                                v20 = "turboRaidLastAuxPECycles";
                                                uint64_t v21 = a1;
                                                int v22 = 934;
                                                goto LABEL_85;
                                              case 935:
                                                v20 = "turboRaidAuxQualPECycles";
                                                uint64_t v21 = a1;
                                                int v22 = 935;
                                                goto LABEL_85;
                                              case 937:
                                                uint64_t v18 = *v8;
                                                uint64_t v19 = "turboRaidPEFailAfterRel";
                                                goto LABEL_13;
                                              case 938:
                                                uint64_t v18 = *v8;
                                                uint64_t v19 = "turboRaidPEFailAfterAux";
                                                goto LABEL_13;
                                              case 939:
                                                uint64_t v18 = *v8;
                                                uint64_t v19 = "dvfmVotesCPU";
                                                goto LABEL_13;
                                              case 940:
                                                uint64_t v18 = *v8;
                                                uint64_t v19 = "dvfmVotesBandwidth";
                                                goto LABEL_13;
                                              case 942:
                                                uint64_t v18 = *v8;
                                                uint64_t v19 = "maxSLCEndurance";
                                                goto LABEL_13;
                                              case 943:
                                                uint64_t v18 = *v8;
                                                uint64_t v19 = "maxMixedEndurance";
                                                goto LABEL_13;
                                              case 944:
                                                uint64_t v18 = *v8;
                                                uint64_t v19 = "maxNativeEndurance";
                                                goto LABEL_13;
                                              case 948:
                                                v20 = "assertHistory";
                                                uint64_t v21 = a1;
                                                int v22 = 948;
                                                uint64_t v14 = v8;
                                                unsigned int v15 = 40;
                                                goto LABEL_12;
                                              case 951:
                                                uint64_t v18 = *v8;
                                                uint64_t v19 = "asp3Support";
                                                goto LABEL_13;
                                              case 953:
                                                uint64_t v18 = *v8;
                                                uint64_t v19 = "numCrossTempRaidUecc";
                                                goto LABEL_13;
                                              case 961:
                                                uint64_t v18 = *v8;
                                                uint64_t v19 = "osBuildStr";
                                                goto LABEL_13;
                                              case 962:
                                                uint64_t v18 = *v8;
                                                uint64_t v19 = "raidConfig";
                                                goto LABEL_13;
                                              case 967:
                                                v20 = "indTrimFrags";
                                                uint64_t v21 = a1;
                                                int v22 = 967;
                                                goto LABEL_153;
                                              case 971:
                                                v20 = "indUsedFrags";
                                                uint64_t v21 = a1;
                                                int v22 = 971;
                                                goto LABEL_153;
                                              default:
                                                switch(v7)
                                                {
                                                  case 996:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    uint64_t v19 = "clogFindFail";
                                                    goto LABEL_14;
                                                  case 997:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    uint64_t v19 = "clogFindBlank";
                                                    goto LABEL_14;
                                                  case 998:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    uint64_t v19 = "clogFindUnc";
                                                    goto LABEL_14;
                                                  case 999:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    uint64_t v19 = "clogFindUnexpected";
                                                    goto LABEL_14;
                                                  case 1001:
                                                    uint64_t v21 = a1;
                                                    int v22 = 1001;
                                                    v20 = "clogReplayFailReason";
                                                    goto LABEL_23;
                                                  case 1002:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    uint64_t v19 = "clogReplayTransientError";
                                                    goto LABEL_14;
                                                  case 1003:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    uint64_t v19 = "clogReplaySpfError";
                                                    goto LABEL_14;
                                                  case 1015:
                                                    uint64_t v21 = a1;
                                                    int v22 = 1015;
                                                    v20 = "eanEarlyBootUeccPage";
                                                    goto LABEL_22;
                                                  case 1016:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    uint64_t v19 = "eanEarlyBootNumUeccPages";
                                                    goto LABEL_14;
                                                  case 1017:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    uint64_t v19 = "eanEarlyBootUeccMultiplane";
                                                    goto LABEL_14;
                                                  default:
                                                    goto LABEL_696;
                                                }
                                            }
                                          }

                                          if (v7 <= 1137)
                                          {
                                            if (v7 > 1104)
                                            {
                                              if (v7 > 1115)
                                              {
                                                if (v7 == 1116)
                                                {
                                                  uint64_t v21 = a1;
                                                  int v22 = 1116;
                                                  v20 = "gcwamp";
LABEL_155:
                                                  uint64_t v14 = v8;
                                                  unsigned int v15 = 32;
                                                  goto LABEL_12;
                                                }

                                                if (v7 == 1137)
                                                {
                                                  uint64_t v18 = *v8;
                                                  id v16 = (void *)a1;
                                                  uint64_t v19 = "numOfToUnhappySwitches";
                                                  goto LABEL_14;
                                                }
                                              }

                                              else
                                              {
                                                if (v7 == 1105)
                                                {
                                                  uint64_t v21 = a1;
                                                  int v22 = 1105;
                                                  v20 = "hostReadSequential";
                                                  goto LABEL_703;
                                                }

                                                if (v7 == 1106)
                                                {
                                                  uint64_t v21 = a1;
                                                  int v22 = 1106;
                                                  v20 = "GCReadSequential";
LABEL_703:
                                                  uint64_t v14 = v8;
                                                  unsigned int v15 = 14;
                                                  goto LABEL_12;
                                                }
                                              }
                                            }

                                            else
                                            {
                                              if (v7 <= 1041)
                                              {
                                                uint64_t v21 = a1;
                                                if (v7 == 1040)
                                                {
                                                  int v22 = 1040;
                                                  v20 = "bandsAgeBinsV2";
                                                }

                                                else
                                                {
                                                  int v22 = 1041;
                                                  v20 = "bandsAgeBinsSnapshot";
                                                }

                                                uint64_t v14 = v8;
                                                unsigned int v15 = 31;
                                                goto LABEL_12;
                                              }

                                              if (v7 == 1042)
                                              {
                                                uint64_t v21 = a1;
                                                int v22 = 1042;
                                                v20 = "bandsAgeBinsReadSectors";
                                                uint64_t v14 = v8;
                                                unsigned int v15 = 15;
LABEL_12:
                                                sub_100006DD4(v21, v22, v20, v14, v15);
                                                goto LABEL_15;
                                              }

                                              if (v7 == 1080)
                                              {
                                                uint64_t v18 = *v8;
                                                id v16 = (void *)a1;
                                                uint64_t v19 = "raidForceClogLoad";
                                                goto LABEL_14;
                                              }
                                            }

LABEL_696:
                                            switch(v7)
                                            {
                                              case 1196:
                                                uint64_t v21 = a1;
                                                int v22 = 1196;
                                                v20 = "poDetectGBBedTotalCost";
                                                goto LABEL_19;
                                              case 1197:
                                                uint64_t v21 = a1;
                                                int v22 = 1197;
                                                v20 = "poDetectGBBedAge";
                                                goto LABEL_11;
                                              case 1198:
                                                uint64_t v21 = a1;
                                                int v22 = 1198;
                                                v20 = "poDetectPERemovalMostSevereCost";
                                                goto LABEL_21;
                                              case 1199:
                                                uint64_t v18 = *v8;
                                                id v16 = (void *)a1;
                                                uint64_t v19 = "poDetectCurrentSize";
                                                goto LABEL_14;
                                              case 1200:
                                              case 1203:
                                              case 1204:
                                              case 1205:
                                              case 1206:
                                              case 1207:
                                              case 1208:
                                              case 1209:
                                              case 1210:
                                              case 1212:
                                              case 1213:
                                              case 1214:
                                              case 1219:
                                              case 1220:
                                              case 1221:
                                              case 1222:
                                              case 1223:
                                                break;
                                              case 1201:
                                                uint64_t v21 = a1;
                                                int v22 = 1201;
                                                v20 = "gcVerticalSuccssfulAlignments";
                                                goto LABEL_22;
                                              case 1202:
                                                uint64_t v21 = a1;
                                                int v22 = 1202;
                                                v20 = "gcVerticalNoAlignmentDueToMissingSegs";
                                                goto LABEL_22;
                                              case 1211:
                                                uint64_t v21 = a1;
                                                int v22 = 1211;
                                                v20 = "forcedAllocationSmallEraseQ";
                                                goto LABEL_716;
                                              case 1215:
                                                uint64_t v21 = a1;
                                                int v22 = 1215;
                                                v20 = "hostWritesPerThrottleZone";
                                                goto LABEL_19;
                                              case 1216:
                                                uint64_t v21 = a1;
                                                int v22 = 1216;
                                                v20 = "tlcWLPerDipAvgPEC";
                                                goto LABEL_716;
                                              case 1217:
                                                uint64_t v21 = a1;
                                                int v22 = 1217;
                                                v20 = "tlcWLPerDipMaxPEC";
                                                goto LABEL_716;
                                              case 1218:
                                                uint64_t v21 = a1;
                                                int v22 = 1218;
                                                v20 = "tlcWLPerDipMinPEC";
                                                goto LABEL_716;
                                              case 1224:
                                                uint64_t v21 = a1;
                                                int v22 = 1224;
                                                v20 = "apfsValidLbaOvershoot";
                                                uint64_t v14 = v8;
                                                unsigned int v15 = 20;
                                                goto LABEL_12;
                                              default:
                                                switch(v7)
                                                {
                                                  case 1232:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    uint64_t v19 = "eanFastSize";
                                                    goto LABEL_14;
                                                  case 1233:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    uint64_t v19 = "eanNumSlcEvictions";
                                                    goto LABEL_14;
                                                  case 1234:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    uint64_t v19 = "eanNumForcedCompress";
                                                    goto LABEL_14;
                                                  case 1235:
                                                  case 1236:
                                                  case 1237:
                                                  case 1238:
                                                  case 1239:
                                                  case 1240:
                                                  case 1242:
                                                  case 1243:
                                                  case 1245:
                                                    goto LABEL_15;
                                                  case 1241:
                                                    uint64_t v21 = a1;
                                                    int v22 = 1241;
                                                    v20 = "s2rTimeHisto";
                                                    goto LABEL_11;
                                                  case 1244:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    uint64_t v19 = "calendarTimeWentBackward";
                                                    goto LABEL_14;
                                                  case 1246:
                                                    uint64_t v21 = a1;
                                                    int v22 = 1246;
                                                    v20 = "bandsUeccCrossTempHisto";
                                                    goto LABEL_23;
                                                  default:
                                                    if (v7 != 1190) {
                                                      goto LABEL_15;
                                                    }
                                                    uint64_t v21 = a1;
                                                    int v22 = 1190;
                                                    v20 = "powerDownTime";
                                                    break;
                                                }

                                                goto LABEL_153;
                                            }
                                          }

                                          else
                                          {
                                            switch(v7)
                                            {
                                              case 1147:
                                                uint64_t v21 = a1;
                                                int v22 = 1147;
                                                v20 = "gc_concurrent_dw_gc12";
                                                goto LABEL_716;
                                              case 1148:
                                                uint64_t v21 = a1;
                                                int v22 = 1148;
                                                v20 = "gc_concurrent_dw_gc1";
                                                goto LABEL_716;
                                              case 1149:
                                                uint64_t v21 = a1;
                                                int v22 = 1149;
                                                v20 = "gc_concurrent_dw_gc2";
LABEL_716:
                                                uint64_t v14 = v8;
                                                unsigned int v15 = 24;
                                                goto LABEL_12;
                                              case 1150:
                                              case 1151:
                                              case 1152:
                                              case 1153:
                                              case 1154:
                                              case 1155:
                                              case 1156:
                                              case 1159:
                                              case 1160:
                                              case 1161:
                                              case 1162:
                                              case 1163:
                                              case 1164:
                                              case 1165:
                                              case 1166:
                                              case 1167:
                                              case 1170:
                                              case 1173:
                                              case 1174:
                                              case 1175:
                                              case 1176:
                                              case 1177:
                                              case 1178:
                                                goto LABEL_696;
                                              case 1157:
                                                uint64_t v18 = *v8;
                                                id v16 = (void *)a1;
                                                uint64_t v19 = "eanMaxForceROTimeMs";
                                                break;
                                              case 1158:
                                                uint64_t v18 = *v8;
                                                id v16 = (void *)a1;
                                                uint64_t v19 = "eanMaxForceRORecoTimeMs";
                                                break;
                                              case 1168:
                                                uint64_t v21 = a1;
                                                int v22 = 1168;
                                                v20 = "poDetectPERemovalTotalCost";
                                                goto LABEL_20;
                                              case 1169:
                                                uint64_t v21 = a1;
                                                int v22 = 1169;
                                                v20 = "poDetectEmptySpotRemovalTotalCost";
                                                goto LABEL_20;
                                              case 1171:
                                                uint64_t v21 = a1;
                                                int v22 = 1171;
                                                v20 = "poDetectEmptySpotRemovalAge";
                                                goto LABEL_11;
                                              case 1172:
                                                uint64_t v21 = a1;
                                                int v22 = 1172;
                                                v20 = "poDetectGBBedMostSevereCost";
                                                goto LABEL_21;
                                              case 1179:
                                                uint64_t v21 = a1;
                                                int v22 = 1179;
                                                v20 = "gc_cur_dw_gc1";
                                                goto LABEL_22;
                                              case 1180:
                                                uint64_t v21 = a1;
                                                int v22 = 1180;
                                                v20 = "gc_cur_dw_gc2";
                                                goto LABEL_22;
                                              case 1181:
                                                uint64_t v21 = a1;
                                                int v22 = 1181;
                                                v20 = "gc_cur_dw_gc3";
                                                goto LABEL_22;
                                              case 1182:
                                                uint64_t v21 = a1;
                                                int v22 = 1182;
                                                v20 = "gc_tot_dw_gc1";
                                                goto LABEL_22;
                                              case 1183:
                                                uint64_t v21 = a1;
                                                int v22 = 1183;
                                                v20 = "gc_tot_dw_gc2";
                                                goto LABEL_22;
                                              case 1184:
                                                uint64_t v18 = *v8;
                                                id v16 = (void *)a1;
                                                uint64_t v19 = "unhappy_state";
                                                break;
                                              case 1185:
                                                uint64_t v18 = *v8;
                                                id v16 = (void *)a1;
                                                uint64_t v19 = "unhappy_level";
                                                break;
                                              default:
                                                if (v7 == 1138)
                                                {
                                                  uint64_t v18 = *v8;
                                                  id v16 = (void *)a1;
                                                  uint64_t v19 = "numOfToHappySwitches";
                                                }

                                                else
                                                {
                                                  if (v7 != 1189) {
                                                    goto LABEL_696;
                                                  }
                                                  uint64_t v18 = *v8;
                                                  id v16 = (void *)a1;
                                                  uint64_t v19 = "lastLbaFormatTime";
                                                }

                                                break;
                                            }

LABEL_14:
                                            sub_100018A64(v16, "", v19, v18);
                                          }

  if (v21) {
    sub_100018FE4((uint64_t)v21);
  }
  return v19;
}

  id v16 = IORegistryCreateIterator(kIOMainPortDefault, (const char *)plane, 1u, &iterator);
  if ((_DWORD)v16) {
    return v16;
  }
  uint64_t v18 = kCFAllocatorSystemDefault;
  uint64_t v19 = CFStringCreateWithCString(kCFAllocatorSystemDefault, cStr, 0);
  if (!v19)
  {
    id v16 = 0LL;
    goto LABEL_53;
  }

  v20 = v19;
  uint64_t v44 = a2;
  uint64_t v21 = IOIteratorNext(iterator);
  if (!v21)
  {
    id v16 = 0LL;
    v23 = 0;
    goto LABEL_52;
  }

  int v22 = v21;
  v23 = 0;
  id v16 = 0LL;
  v45 = v20;
  while (1)
  {
    while (!IOIteratorIsValid(iterator))
    {
      IOIteratorReset(iterator);
      signed int v24 = IOIteratorNext(iterator);
      if (!v24) {
        goto LABEL_52;
      }
      int v22 = v24;
    }

    CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v22, v20, v18, 0);
    if (!CFProperty) {
      goto LABEL_48;
    }
    id v26 = CFProperty;
    id v27 = sub_10001B090(CFProperty);
    if (!v27) {
      break;
    }
    uint64_t v28 = v27;
    uint64_t v29 = v27;
    v30 = (UInt8 *)malloc(v27);
    v30[v28 - 1] = 0;
    uint64_t v31 = sub_10001B090(v26);
    if (v31 > v28)
    {
      v32 = DiagnosticLogHandleForCategory(6LL);
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "Could not convert CFTypeRef to value",  buf,  2u);
      }

LABEL_27:
      id v16 = 1LL;
      v20 = v45;
      goto LABEL_47;
    }

    signed int v34 = v31;
    v35 = CFGetTypeID(v26);
    if (v35 == CFBooleanGetTypeID())
    {
      *v30 = CFBooleanGetValue((CFBooleanRef)v26);
LABEL_37:
      v20 = v45;
LABEL_38:
      if (v44 && v34)
      {
        v37 = v34;
        unsigned int v38 = v30;
        v39 = v44;
        while (1)
        {
          unsigned int v41 = *v39++;
          v40 = v41;
          v42 = *v38++;
          if (v40 != v42) {
            break;
          }
          if (!--v37) {
            goto LABEL_43;
          }
        }

        id v16 = 0LL;
      }

      else
      {
LABEL_43:
        if (v23 < a4) {
          *(_DWORD *)(a3 + 4LL * v23) = v22;
        }
        id v16 = 0LL;
        ++v23;
      }

      goto LABEL_47;
    }

    if (v35 != CFNumberGetTypeID())
    {
      if (v35 == CFStringGetTypeID())
      {
        v57.length = v34;
        v57.location = 0LL;
        CFStringGetBytes(v26, v57, 0, 0, 0, v30, v29, 0LL);
        goto LABEL_37;
      }

      if (v35 == CFDataGetTypeID())
      {
        v58.length = v34;
        v58.location = 0LL;
        CFDataGetBytes((CFDataRef)v26, v58, v30);
        goto LABEL_37;
      }

      goto LABEL_27;
    }

    Type = CFNumberGetType((CFNumberRef)v26);
    v20 = v45;
    if (CFNumberGetValue((CFNumberRef)v26, Type, v30)) {
      goto LABEL_38;
    }
    id v16 = 1LL;
LABEL_47:
    free(v30);
    CFRelease(v26);
    uint64_t v18 = kCFAllocatorSystemDefault;
LABEL_48:
    int v22 = IOIteratorNext(iterator);
    if (!v22) {
      goto LABEL_52;
    }
  }

  CFRelease(v26);
LABEL_52:
  *a5 = v23;
  CFRelease(v20);
LABEL_53:
  IOObjectRelease(iterator);
  return v16;
}

LABEL_15:
                                          a2 = &v8[v10];
                                          unsigned int v6 = v11 - v10;
                                          if (v11 != (_DWORD)v10) {
                                            continue;
                                          }
                                          uint64_t result = 1LL;
                                          break;
                                      }

                                      break;
                                  }

                                  break;
                              }

                              break;
                          }

                          break;
                      }

                      break;
                  }

                  break;
              }

              break;
          }

          break;
      }
    }

    else
    {
      uint64_t result = 0LL;
      *(_DWORD *)(a1 + 32) = 0;
    }

    return result;
  }

                                        sub_100018D50(v19, a2, a3, a4, a5, a6, a7, a8, v23);
                                        goto LABEL_16;
                                      }

                                      if (v12 <= 1104)
                                      {
                                        if (v12 <= 1041)
                                        {
                                          if (v12 == 1040)
                                          {
                                            if ((_DWORD)v14 != 31) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: bandsAgeBinsV2(1040): (#31) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              v20 = v14;
                                            }
                                            if ((sub_100011E74(a1, "bandsAgeBinsV2_", (uint64_t)v8, 8u, v20) & 1) == 0)
                                            {
                                              int v22 = "ASPFTLParseBufferToCxt: bandsAgeBinsV2(1040): Cannot add 31 elements to context";
                                              goto LABEL_2247;
                                            }
                                          }

                                          else
                                          {
                                            if ((_DWORD)v14 != 31) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: bandsAgeBinsSnapshot(1041): (#31) cfg elements ! = (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              v20 = v14;
                                            }
                                            if ((sub_100011E74(a1, "bandsAgeBinsSnapshot_", (uint64_t)v8, 8u, v20) & 1) == 0)
                                            {
                                              int v22 = "ASPFTLParseBufferToCxt: bandsAgeBinsSnapshot(1041): Cannot add 31 el"
                                                    "ements to context";
                                              goto LABEL_2247;
                                            }
                                          }

                                          goto LABEL_14;
                                        }

                                        if (v12 == 1042)
                                        {
                                          if ((_DWORD)v14 != 15) {
                                            sub_100018D50( "ASPFTLParseBufferToCxt: bandsAgeBinsReadSectors(1042): (#15) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                          }
                                          else {
                                            v20 = v14;
                                          }
                                          if ((sub_100011E74(a1, "bandsAgeBinsReadSectors_", (uint64_t)v8, 8u, v20) & 1) == 0)
                                          {
                                            int v22 = "ASPFTLParseBufferToCxt: bandsAgeBinsReadSectors(1042): Cannot add 15 e"
                                                  "lements to context";
                                            goto LABEL_2247;
                                          }

                                          goto LABEL_14;
                                        }

                                        if (v12 == 1080)
                                        {
                                          if ((sub_100011E74(a1, "raidForceClogLoad", (uint64_t)v8, 8u, 1u) & 1) == 0)
                                          {
                                            uint64_t v19 = "ASPFTLParseBufferToCxt: raidForceClogLoad(1080) cannot add 1 element to context";
                                            goto LABEL_15;
                                          }
}

uint64_t sub_100006DD4(uint64_t result, int a2, const char *a3, uint64_t *a4, unsigned int a5)
{
  int v7 = (void *)result;
  uint64_t v8 = *a4;
  if (a2 <= 44)
  {
    switch(a2)
    {
      case 4:
        *(void *)(result + 72) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 5:
      case 6:
      case 8:
      case 9:
      case 10:
      case 11:
      case 14:
      case 15:
      case 16:
        goto LABEL_41;
      case 7:
        *(void *)(result + 64) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 12:
        *(void *)(result + 144) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 13:
        *(void *)(result + 152) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 17:
        *(void *)(result + 88) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 18:
        *(void *)(result + 104) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 19:
        *(void *)(result + 96) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 20:
        *(void *)(result + 112) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      default:
        if (a2 != 28) {
          goto LABEL_41;
        }
        *(void *)(result + 168) = v8;
        if (!a5) {
          return result;
        }
        goto LABEL_42;
    }
  }

  switch(a2)
  {
    case '-':
      *(void *)(result + 176) = v8;
      if (a5) {
        goto LABEL_42;
      }
      return result;
    case '.':
    case '/':
    case '6':
    case '7':
      goto LABEL_41;
    case '0':
      *(void *)(result + 80) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    case '1':
      *(_DWORD *)(result + 56) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    case '2':
      *(_DWORD *)(result + 52) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    case '3':
      *(_DWORD *)(result + 48) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    case '4':
      *(_DWORD *)(result + 44) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    case '5':
      *(_DWORD *)(result + 32) = v8;
      goto LABEL_41;
    case '8':
      *(void *)(result + 160) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    default:
      if (a2 != 265) {
        goto LABEL_41;
      }
      if (a5)
      {
        uint64_t v9 = a5;
        unint64_t v10 = (void *)(result + 184);
        unsigned int v11 = a4;
        do
        {
          uint64_t v12 = *v11++;
          *v10++ = v12;
          --v9;
        }

        while (v9);
LABEL_41:
        if (a5)
        {
LABEL_42:
          if (a5 == 1)
          {
            return sub_100018A64((void *)result, "", a3, v8);
          }

          else
          {
            uint64_t v13 = 0LL;
            uint64_t v14 = a5;
            do
            {
              snprintf(__str, 0x64uLL, "%d", v13);
              __str[100] = 0;
              uint64_t result = sub_100018A64(v7, a3, __str, a4[v13++]);
            }

            while (v14 != v13);
          }
        }
      }

      return result;
  }

double sub_10000701C(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)v2[14];
      free(v2);
      uint64_t v2 = v3;
    }

    while (v3);
  }

  uint64_t v4 = *(void **)(a1 + 16);
  if (v4)
  {
    do
    {
      uint64_t v5 = (void *)v4[14];
      free(v4);
      uint64_t v4 = v5;
    }

    while (v5);
  }

  double result = 0.0;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t sub_10000708C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = (unint64_t *)a2;
  uint64_t v10 = 0LL;
  unsigned int v11 = a3 >> 3;
  *(_OWORD *)__str = 0u;
  __int128 v25 = 0u;
  do
  {
LABEL_2:
    if (!v11) {
      return v10;
    }
    unint64_t v13 = *v8++;
    int v12 = v13;
    unint64_t v14 = HIDWORD(v13);
    --v11;
  }

  while (!HIDWORD(v13));
  uint64_t v17 = (v12 - 1);
  if (v17 <= 0x47) {
    __asm { BR              X9 }
  }

  uint64_t v18 = (v12 - 73);
  if (v18 <= 0x46) {
    __asm { BR              X9 }
  }

  switch(v12)
  {
    case 144:
      uint64_t v19 = "ASPFTLParseBufferToCxt: numMemExtreme(144) cannot add 1 element to context";
      goto LABEL_15;
    case 145:
      uint64_t v19 = "ASPFTLParseBufferToCxt: maxMemExtremeDuration(145) cannot add 1 element to context";
      goto LABEL_15;
    case 146:
      uint64_t v19 = "ASPFTLParseBufferToCxt: memExtremeDuration(146) cannot add 1 element to context";
      goto LABEL_15;
    case 147:
      uint64_t v19 = "ASPFTLParseBufferToCxt: bandGetsExtreme(147) cannot add 1 element to context";
      goto LABEL_15;
    case 148:
      uint64_t v19 = "ASPFTLParseBufferToCxt: bandGetsLow(148) cannot add 1 element to context";
      goto LABEL_15;
    case 149:
      uint64_t v19 = "ASPFTLParseBufferToCxt: numHostChoke(149) cannot add 1 element to context";
      goto LABEL_15;
    case 152:
      uint64_t v19 = "ASPFTLParseBufferToCxt: AbortSkip_ProgramError(152) cannot add 1 element to context";
      goto LABEL_15;
    case 153:
      uint64_t v19 = "ASPFTLParseBufferToCxt: AbortSkip_ReadErrorOpenBand(153) cannot add 1 element to context";
      goto LABEL_15;
    case 154:
      uint64_t v19 = "ASPFTLParseBufferToCxt: AbortSkip_FailedRebuildingParity(154) cannot add 1 element to context";
      goto LABEL_15;
    case 155:
      uint64_t v19 = "ASPFTLParseBufferToCxt: AbortPad_OpenRefreshBand(155) cannot add 1 element to context";
      goto LABEL_15;
    case 156:
      uint64_t v19 = "ASPFTLParseBufferToCxt: AbortPad_CloseBands(156) cannot add 1 element to context";
      goto LABEL_15;
    case 157:
      uint64_t v19 = "ASPFTLParseBufferToCxt: AbortPad_SetPhoto(157) cannot add 1 element to context";
      goto LABEL_15;
    case 158:
      uint64_t v19 = "ASPFTLParseBufferToCxt: AbortPad_GcNoSource(158) cannot add 1 element to context";
      goto LABEL_15;
    case 159:
      uint64_t v19 = "ASPFTLParseBufferToCxt: AbortPad_Format(159) cannot add 1 element to context";
      goto LABEL_15;
    case 160:
      uint64_t v19 = "ASPFTLParseBufferToCxt: nandDiscoveryDuration(160) cannot add 1 element to context";
      goto LABEL_15;
    case 161:
      uint64_t v19 = "ASPFTLParseBufferToCxt: coreCCEnableDuration(161) cannot add 1 element to context";
      goto LABEL_15;
    case 163:
      uint64_t v19 = "ASPFTLParseBufferToCxt: coreOpenDuration(163) cannot add 1 element to context";
      goto LABEL_15;
    case 164:
      uint64_t v19 = "ASPFTLParseBufferToCxt: coreWritableDuration(164) cannot add 1 element to context";
      goto LABEL_15;
    case 165:
      uint64_t v19 = "ASPFTLParseBufferToCxt: coreClogLoadDuration(165) cannot add 1 element to context";
      goto LABEL_15;
    case 167:
      uint64_t v19 = "ASPFTLParseBufferToCxt: bulkPFail(167) cannot add 1 element to context";
      goto LABEL_15;
    case 169:
      uint64_t v19 = "ASPFTLParseBufferToCxt: bulkRFail(169) cannot add 1 element to context";
      goto LABEL_15;
    case 172:
      uint64_t v19 = "ASPFTLParseBufferToCxt: raidSmartErrors(172) cannot add 1 element to context";
      goto LABEL_15;
    case 182:
      uint64_t v19 = "ASPFTLParseBufferToCxt: internalUeccs(182) cannot add 1 element to context";
      goto LABEL_15;
    case 183:
      uint64_t v19 = "ASPFTLParseBufferToCxt: e2eFail(183) cannot add 1 element to context";
      goto LABEL_15;
    case 184:
      uint64_t v19 = "ASPFTLParseBufferToCxt: TempSensorMax(184) cannot add 1 element to context";
      goto LABEL_15;
    case 185:
      uint64_t v19 = "ASPFTLParseBufferToCxt: TempSensorMin(185) cannot add 1 element to context";
      goto LABEL_15;
    case 186:
      uint64_t v19 = "ASPFTLParseBufferToCxt: powerUpFromDDR(186) cannot add 1 element to context";
      goto LABEL_15;
    case 187:
      uint64_t v19 = "ASPFTLParseBufferToCxt: numMemLow(187) cannot add 1 element to context";
      goto LABEL_15;
    case 188:
      uint64_t v19 = "ASPFTLParseBufferToCxt: maxMemLowDuration(188) cannot add 1 element to context";
      goto LABEL_15;
    case 189:
      uint64_t v19 = "ASPFTLParseBufferToCxt: memLowDuration(189) cannot add 1 element to context";
      goto LABEL_15;
    case 190:
      uint64_t v19 = "ASPFTLParseBufferToCxt: numFences(190) cannot add 1 element to context";
      goto LABEL_15;
    case 191:
      uint64_t v19 = "ASPFTLParseBufferToCxt: hostPassiveIO(191) cannot add 1 element to context";
      goto LABEL_15;
    case 192:
      uint64_t v19 = "ASPFTLParseBufferToCxt: odtsMax(192) cannot add 1 element to context";
      goto LABEL_15;
    case 193:
      uint64_t v19 = "ASPFTLParseBufferToCxt: defragMFromOrphans(193) cannot add 1 element to context";
      goto LABEL_15;
    case 194:
      uint64_t v19 = "ASPFTLParseBufferToCxt: defragMFromFragments(194) cannot add 1 element to context";
      goto LABEL_15;
    case 195:
      uint64_t v19 = "ASPFTLParseBufferToCxt: defragMTime(195) cannot add 1 element to context";
      goto LABEL_15;
    case 196:
      uint64_t v19 = "ASPFTLParseBufferToCxt: defragMMaxTime(196) cannot add 1 element to context";
      goto LABEL_15;
    case 197:
      uint64_t v19 = "ASPFTLParseBufferToCxt: raidFailedLbaMismatch(197) cannot add 1 element to context";
      goto LABEL_15;
    case 198:
      uint64_t v19 = "ASPFTLParseBufferToCxt: numSyscfgWrites(198) cannot add 1 element to context";
      goto LABEL_15;
    case 199:
      uint64_t v19 = "ASPFTLParseBufferToCxt: indmbUnitsXfer(199) cannot add 1 element to context";
      goto LABEL_15;
    case 200:
      uint64_t v19 = "ASPFTLParseBufferToCxt: indmbUnitsCache(200) cannot add 1 element to context";
      goto LABEL_15;
    case 201:
      uint64_t v19 = "ASPFTLParseBufferToCxt: indmbUnitsInd(201) cannot add 1 element to context";
      goto LABEL_15;
    case 202:
      uint64_t v19 = "ASPFTLParseBufferToCxt: wcacheFS_Mbytes(202) cannot add 1 element to context";
      goto LABEL_15;
    case 203:
      uint64_t v19 = "ASPFTLParseBufferToCxt: wcacheDS_Mbytes(203) cannot add 1 element to context";
      goto LABEL_15;
    case 204:
      uint64_t v19 = "ASPFTLParseBufferToCxt: powerOnSeconds(204) cannot add 1 element to context";
      goto LABEL_15;
    case 205:
      uint64_t v19 = "ASPFTLParseBufferToCxt: numUnknownTokenHostRead(205) cannot add 1 element to context";
      goto LABEL_15;
    case 206:
      uint64_t v19 = "ASPFTLParseBufferToCxt: numUnmmapedTokenHostRead(206) cannot add 1 element to context";
      goto LABEL_15;
    case 207:
      if ((_DWORD)v14 != 16) {
        sub_100018D50( "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerLevel(207): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
      }
      else {
        unsigned int v20 = v14;
      }
      int v22 = "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerLevel(207): Cannot add 16 elements to context";
      goto LABEL_2247;
    case 208:
      uint64_t v19 = "ASPFTLParseBufferToCxt: wcacheFS_MbytesMin(208) cannot add 1 element to context";
      goto LABEL_15;
    case 209:
      uint64_t v19 = "ASPFTLParseBufferToCxt: wcacheFS_MbytesMax(209) cannot add 1 element to context";
      goto LABEL_15;
    case 210:
      uint64_t v19 = "ASPFTLParseBufferToCxt: prepareForShutdownFailCounter(210) cannot add 1 element to context";
      goto LABEL_15;
    case 211:
      uint64_t v19 = "ASPFTLParseBufferToCxt: lpsrEntry(211) cannot add 1 element to context";
      goto LABEL_15;
    case 212:
      uint64_t v19 = "ASPFTLParseBufferToCxt: lpsrExit(212) cannot add 1 element to context";
      goto LABEL_15;
    case 213:
      if ((_DWORD)v14 != 8) {
        sub_100018D50( "ASPFTLParseBufferToCxt: crcInternalReadFail(213): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
      }
      else {
        unsigned int v20 = v14;
      }
      int v22 = "ASPFTLParseBufferToCxt: crcInternalReadFail(213): Cannot add 8 elements to context";
      goto LABEL_2247;
    case 214:
      uint64_t v19 = "ASPFTLParseBufferToCxt: wcacheFSEvictCnt(214) cannot add 1 element to context";
      goto LABEL_15;
    case 215:
      uint64_t v19 = "ASPFTLParseBufferToCxt: wcacheFSEvictSize(215) cannot add 1 element to context";
      goto LABEL_15;
    case 216:
      uint64_t v19 = "ASPFTLParseBufferToCxt: wcacheFSWr(216) cannot add 1 element to context";
      goto LABEL_15;
    case 217:
      uint64_t v19 = "ASPFTLParseBufferToCxt: wcacheDSWr(217) cannot add 1 element to context";
      goto LABEL_15;
    case 218:
      if ((_DWORD)v14 != 10) {
        sub_100018D50( "ASPFTLParseBufferToCxt: wcacheFSEvictSizeLogDist(218): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
      }
      else {
        unsigned int v20 = v14;
      }
      int v22 = "ASPFTLParseBufferToCxt: wcacheFSEvictSizeLogDist(218): Cannot add 10 elements to context";
      goto LABEL_2247;
    case 219:
      uint64_t v19 = "ASPFTLParseBufferToCxt: prepareForShutdownTimeoutCounter(219) cannot add 1 element to context";
      goto LABEL_15;
    case 220:
      uint64_t v19 = "ASPFTLParseBufferToCxt: prepareForShutdownCancelCounter(220) cannot add 1 element to context";
      goto LABEL_15;
    case 221:
      uint64_t v19 = "ASPFTLParseBufferToCxt: RD_openBandCount(221) cannot add 1 element to context";
      goto LABEL_15;
    case 222:
      uint64_t v19 = "ASPFTLParseBufferToCxt: RD_openBandNops(222) cannot add 1 element to context";
      goto LABEL_15;
    case 223:
      uint64_t v19 = "ASPFTLParseBufferToCxt: RD_closedBandEvictCount(223) cannot add 1 element to context";
      goto LABEL_15;
    default:
      switch(v12)
      {
        case 224:
          uint64_t v19 = "ASPFTLParseBufferToCxt: RD_closedBandEvictSectors(224) cannot add 1 element to context";
          goto LABEL_15;
        case 225:
          uint64_t v19 = "ASPFTLParseBufferToCxt: RD_closedBandFragmentCount(225) cannot add 1 element to context";
          goto LABEL_15;
        case 226:
          uint64_t v19 = "ASPFTLParseBufferToCxt: RD_closedBandFragmentSectors(226) cannot add 1 element to context";
          goto LABEL_15;
        case 227:
          if ((_DWORD)v14 != 10) {
            sub_100018D50( "ASPFTLParseBufferToCxt: wcacheFSOverWrLogSizeCnts(227): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: wcacheFSOverWrLogSizeCnts(227): Cannot add 10 elements to context";
          goto LABEL_2247;
        case 228:
          if ((_DWORD)v14 != 4) {
            sub_100018D50( "ASPFTLParseBufferToCxt: wcacheFSOverWrSizeByFlow(228): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: wcacheFSOverWrSizeByFlow(228): Cannot add 4 elements to context";
          goto LABEL_2247;
        case 229:
          if ((_DWORD)v14 != 2) {
            sub_100018D50( "ASPFTLParseBufferToCxt: indmbXferCountTo(229): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: indmbXferCountTo(229): Cannot add 2 elements to context";
          goto LABEL_2247;
        case 230:
          if ((_DWORD)v14 != 2) {
            sub_100018D50( "ASPFTLParseBufferToCxt: indmbAccumulatedTimeBetweenXfers(230): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: indmbAccumulatedTimeBetweenXfers(230): Cannot add 2 elements to context";
          goto LABEL_2247;
        case 231:
          uint64_t v19 = "ASPFTLParseBufferToCxt: maxGracefulBootTimeMs(231) cannot add 1 element to context";
          goto LABEL_15;
        case 232:
          uint64_t v19 = "ASPFTLParseBufferToCxt: maxUngracefulBootTimeMs(232) cannot add 1 element to context";
          goto LABEL_15;
        case 233:
          uint64_t v19 = "ASPFTLParseBufferToCxt: averageGracefulBootTimeMs(233) cannot add 1 element to context";
          goto LABEL_15;
        case 234:
          uint64_t v19 = "ASPFTLParseBufferToCxt: averageUngracefulBootTimeMs(234) cannot add 1 element to context";
          goto LABEL_15;
        case 235:
          if ((_DWORD)v14 != 8) {
            sub_100018D50( "ASPFTLParseBufferToCxt: gracefulBootTimeLogMs(235): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: gracefulBootTimeLogMs(235): Cannot add 8 elements to context";
          goto LABEL_2247;
        case 236:
          if ((_DWORD)v14 != 8) {
            sub_100018D50( "ASPFTLParseBufferToCxt: ungracefulBootTimeLogMs(236): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: ungracefulBootTimeLogMs(236): Cannot add 8 elements to context";
          goto LABEL_2247;
        case 237:
          if ((_DWORD)v14 != 4) {
            sub_100018D50( "ASPFTLParseBufferToCxt: CalibrationCount(237): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: CalibrationCount(237): Cannot add 4 elements to context";
          goto LABEL_2247;
        case 238:
          uint64_t v19 = "ASPFTLParseBufferToCxt: CalibrationLastTmp(238) cannot add 1 element to context";
          goto LABEL_15;
        case 239:
          uint64_t v19 = "ASPFTLParseBufferToCxt: CalibrationMaxTmp(239) cannot add 1 element to context";
          goto LABEL_15;
        case 240:
          uint64_t v19 = "ASPFTLParseBufferToCxt: CalibrationMinTmp(240) cannot add 1 element to context";
          goto LABEL_15;
        case 241:
          uint64_t v19 = "ASPFTLParseBufferToCxt: ungracefulBootWorstIndicator(241) cannot add 1 element to context";
          goto LABEL_15;
        case 242:
          uint64_t v19 = "ASPFTLParseBufferToCxt: metaMismatchReread(242) cannot add 1 element to context";
          goto LABEL_15;
        case 243:
          uint64_t v19 = "ASPFTLParseBufferToCxt: numS3SleepOps(243) cannot add 1 element to context";
          goto LABEL_15;
        case 244:
          uint64_t v19 = "ASPFTLParseBufferToCxt: odtsCurrent(244) cannot add 1 element to context";
          goto LABEL_15;
        case 245:
          uint64_t v19 = "ASPFTLParseBufferToCxt: prefetchReads(245) cannot add 1 element to context";
          goto LABEL_15;
        case 246:
          uint64_t v19 = "ASPFTLParseBufferToCxt: prefetchHits(246) cannot add 1 element to context";
          goto LABEL_15;
        case 247:
          uint64_t v19 = "ASPFTLParseBufferToCxt: prefetchWritesInvalidation(247) cannot add 1 element to context";
          goto LABEL_15;
        case 248:
          uint64_t v19 = "ASPFTLParseBufferToCxt: indmbUnitsTotal(248) cannot add 1 element to context";
          goto LABEL_15;
        case 249:
          uint64_t v19 = "ASPFTLParseBufferToCxt: selfThrottlingEngage(249) cannot add 1 element to context";
          goto LABEL_15;
        case 250:
          uint64_t v19 = "ASPFTLParseBufferToCxt: selfThrottlingDisengage(250) cannot add 1 element to context";
          goto LABEL_15;
        case 252:
          uint64_t v19 = "ASPFTLParseBufferToCxt: AbortSkip_WlpMode(252) cannot add 1 element to context";
          goto LABEL_15;
        case 253:
          uint64_t v19 = "ASPFTLParseBufferToCxt: hostWritesWlpMode(253) cannot add 1 element to context";
          goto LABEL_15;
        case 254:
          uint64_t v19 = "ASPFTLParseBufferToCxt: numClogDoubleUnc(254) cannot add 1 element to context";
          goto LABEL_15;
        case 256:
          uint64_t v19 = "ASPFTLParseBufferToCxt: AbortPad_WlpMode(256) cannot add 1 element to context";
          goto LABEL_15;
        case 257:
          uint64_t v19 = "ASPFTLParseBufferToCxt: bonfireIntermediateBandErases(257) cannot add 1 element to context";
          goto LABEL_15;
        case 258:
          uint64_t v19 = "ASPFTLParseBufferToCxt: bonfireUserBandErases(258) cannot add 1 element to context";
          goto LABEL_15;
        case 259:
          uint64_t v19 = "ASPFTLParseBufferToCxt: bonfireIntermediateBandProgs(259) cannot add 1 element to context";
          goto LABEL_15;
        case 260:
          uint64_t v19 = "ASPFTLParseBufferToCxt: bonfireUserBandProgs(260) cannot add 1 element to context";
          goto LABEL_15;
        case 261:
          uint64_t v19 = "ASPFTLParseBufferToCxt: bonfireIntermediatePageReads(261) cannot add 1 element to context";
          goto LABEL_15;
        case 262:
          uint64_t v19 = "ASPFTLParseBufferToCxt: bonfireUserPageReads(262) cannot add 1 element to context";
          goto LABEL_15;
        case 263:
          uint64_t v19 = "ASPFTLParseBufferToCxt: refreshUtil00(263) cannot add 1 element to context";
          goto LABEL_15;
        case 264:
          uint64_t v19 = "ASPFTLParseBufferToCxt: failToReadUtil00(264) cannot add 1 element to context";
          goto LABEL_15;
        case 265:
          if ((_DWORD)v14 != 5) {
            sub_100018D50( "ASPFTLParseBufferToCxt: readCountHisto(265): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: readCountHisto(265): Cannot add 5 elements to context";
          goto LABEL_2247;
        case 266:
          if ((_DWORD)v14 != 16) {
            sub_100018D50( "ASPFTLParseBufferToCxt: readAmpHisto(266): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: readAmpHisto(266): Cannot add 16 elements to context";
          goto LABEL_2247;
        case 267:
          uint64_t v19 = "ASPFTLParseBufferToCxt: totalReadAmp(267) cannot add 1 element to context";
          goto LABEL_15;
        case 268:
          if ((_DWORD)v14 != 4) {
            sub_100018D50( "ASPFTLParseBufferToCxt: nvmeModeSelect(268): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: nvmeModeSelect(268): Cannot add 4 elements to context";
          goto LABEL_2247;
        case 269:
          if ((_DWORD)v14 != 8) {
            sub_100018D50( "ASPFTLParseBufferToCxt: numBootBlockRefreshSuccess(269): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: numBootBlockRefreshSuccess(269): Cannot add 8 elements to context";
          goto LABEL_2247;
        case 270:
          if ((_DWORD)v14 != 8) {
            sub_100018D50( "ASPFTLParseBufferToCxt: numBootBlockRefreshFail(270): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: numBootBlockRefreshFail(270): Cannot add 8 elements to context";
          goto LABEL_2247;
        case 271:
          uint64_t v19 = "ASPFTLParseBufferToCxt: numUnsupportedAsi(271) cannot add 1 element to context";
          goto LABEL_15;
        case 272:
          uint64_t v19 = "ASPFTLParseBufferToCxt: NumTerminatedProgramSegs(272) cannot add 1 element to context";
          goto LABEL_15;
        case 273:
          uint64_t v19 = "ASPFTLParseBufferToCxt: indParityPagesDrops(273) cannot add 1 element to context";
          goto LABEL_15;
        case 274:
          uint64_t v19 = "ASPFTLParseBufferToCxt: indFlowPrograms(274) cannot add 1 element to context";
          goto LABEL_15;
        case 277:
          if ((_DWORD)v14 != 4) {
            sub_100018D50( "ASPFTLParseBufferToCxt: powerBudgetSelect(277): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: powerBudgetSelect(277): Cannot add 4 elements to context";
          goto LABEL_2247;
        case 279:
          uint64_t v19 = "ASPFTLParseBufferToCxt: RxBurnNandWrites(279) cannot add 1 element to context";
          goto LABEL_15;
        case 280:
          if ((_DWORD)v14 != 12) {
            sub_100018D50( "ASPFTLParseBufferToCxt: E2EDPErrorCounters(280): (#12) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: E2EDPErrorCounters(280): Cannot add 12 elements to context";
          goto LABEL_2247;
        case 281:
          uint64_t v19 = "ASPFTLParseBufferToCxt: wcacheSectorsMax(281) cannot add 1 element to context";
          goto LABEL_15;
        case 282:
          uint64_t v19 = "ASPFTLParseBufferToCxt: wcacheSectorsMin(282) cannot add 1 element to context";
          goto LABEL_15;
        case 283:
          uint64_t v19 = "ASPFTLParseBufferToCxt: wcacheSectorsCur(283) cannot add 1 element to context";
          goto LABEL_15;
        case 284:
          uint64_t v19 = "ASPFTLParseBufferToCxt: wcacheDS_SectorsMax(284) cannot add 1 element to context";
          goto LABEL_15;
        case 285:
          uint64_t v19 = "ASPFTLParseBufferToCxt: wcacheDS_SectorsMin(285) cannot add 1 element to context";
          goto LABEL_15;
        case 286:
          uint64_t v19 = "ASPFTLParseBufferToCxt: wcacheDS_SectorsCur(286) cannot add 1 element to context";
          goto LABEL_15;
        case 287:
          uint64_t v19 = "ASPFTLParseBufferToCxt: wcacheFS_Reads(287) cannot add 1 element to context";
          goto LABEL_15;
        case 288:
          uint64_t v19 = "ASPFTLParseBufferToCxt: wcacheDS_Reads(288) cannot add 1 element to context";
          goto LABEL_15;
        case 289:
          if ((_DWORD)v14 != 32) {
            sub_100018D50( "ASPFTLParseBufferToCxt: mspBootBlockReadFail(289): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: mspBootBlockReadFail(289): Cannot add 32 elements to context";
          goto LABEL_2247;
        case 290:
          if ((_DWORD)v14 != 32) {
            sub_100018D50( "ASPFTLParseBufferToCxt: mspBootBlockProgFail(290): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: mspBootBlockProgFail(290): Cannot add 32 elements to context";
          goto LABEL_2247;
        case 291:
          if ((_DWORD)v14 != 32) {
            sub_100018D50( "ASPFTLParseBufferToCxt: mspBootBlockEraseFail(291): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: mspBootBlockEraseFail(291): Cannot add 32 elements to context";
          goto LABEL_2247;
        case 292:
          uint64_t v19 = "ASPFTLParseBufferToCxt: bandsRefreshedOnError(292) cannot add 1 element to context";
          goto LABEL_15;
        default:
          switch(v12)
          {
            case 298:
              if ((_DWORD)v14 != 2) {
                sub_100018D50( "ASPFTLParseBufferToCxt: perHostReads(298): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: perHostReads(298): Cannot add 2 elements to context";
              goto LABEL_2247;
            case 299:
              if ((_DWORD)v14 != 2) {
                sub_100018D50( "ASPFTLParseBufferToCxt: perHostReadXacts(299): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: perHostReadXacts(299): Cannot add 2 elements to context";
              goto LABEL_2247;
            case 300:
              if ((_DWORD)v14 != 2) {
                sub_100018D50( "ASPFTLParseBufferToCxt: perHostWrites(300): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: perHostWrites(300): Cannot add 2 elements to context";
              goto LABEL_2247;
            case 301:
              if ((_DWORD)v14 != 2) {
                sub_100018D50( "ASPFTLParseBufferToCxt: perHostWriteXacts(301): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: perHostWriteXacts(301): Cannot add 2 elements to context";
              goto LABEL_2247;
            case 302:
              if ((_DWORD)v14 != 2) {
                sub_100018D50( "ASPFTLParseBufferToCxt: perHostNumFlushes(302): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: perHostNumFlushes(302): Cannot add 2 elements to context";
              goto LABEL_2247;
            case 303:
              if ((_DWORD)v14 != 2) {
                sub_100018D50( "ASPFTLParseBufferToCxt: perHostNumFences(303): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: perHostNumFences(303): Cannot add 2 elements to context";
              goto LABEL_2247;
            case 304:
              if ((_DWORD)v14 != 10) {
                sub_100018D50( "ASPFTLParseBufferToCxt: commitPadSectorsPerFlow(304): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: commitPadSectorsPerFlow(304): Cannot add 10 elements to context";
              goto LABEL_2247;
            case 305:
              if ((_DWORD)v14 != 10) {
                sub_100018D50( "ASPFTLParseBufferToCxt: wcacheDSOverWrLogSizeCnts(305): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: wcacheDSOverWrLogSizeCnts(305): Cannot add 10 elements to context";
              goto LABEL_2247;
            case 306:
              if ((_DWORD)v14 != 4) {
                sub_100018D50( "ASPFTLParseBufferToCxt: wcacheDSOverWrSizeByFlow(306): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: wcacheDSOverWrSizeByFlow(306): Cannot add 4 elements to context";
              goto LABEL_2247;
            case 307:
              if ((_DWORD)v14 != 10) {
                sub_100018D50( "ASPFTLParseBufferToCxt: CmdRaisePrioiryEvents(307): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: CmdRaisePrioiryEvents(307): Cannot add 10 elements to context";
              goto LABEL_2247;
            case 308:
              uint64_t v19 = "ASPFTLParseBufferToCxt: utilNumVerification(308) cannot add 1 element to context";
              goto LABEL_15;
            case 309:
              uint64_t v19 = "ASPFTLParseBufferToCxt: utilRefreshes(309) cannot add 1 element to context";
              goto LABEL_15;
            case 310:
              uint64_t v19 = "ASPFTLParseBufferToCxt: utilBDRErrors(310) cannot add 1 element to context";
              goto LABEL_15;
            case 311:
              uint64_t v19 = "ASPFTLParseBufferToCxt: indBandsPerFlow(311) cannot add 1 element to context";
              goto LABEL_15;
            case 312:
              uint64_t v19 = "ASPFTLParseBufferToCxt: secsPerIndFlow(312) cannot add 1 element to context";
              goto LABEL_15;
            case 313:
              uint64_t v19 = "ASPFTLParseBufferToCxt: indDecodedECC(313) cannot add 1 element to context";
              goto LABEL_15;
            case 314:
              if ((_DWORD)v14 != 8) {
                sub_100018D50( "ASPFTLParseBufferToCxt: numBootBlockValidateSuccess(314): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: numBootBlockValidateSuccess(314): Cannot add 8 elements to context";
              goto LABEL_2247;
            case 315:
              if ((_DWORD)v14 != 8) {
                sub_100018D50( "ASPFTLParseBufferToCxt: numBootBlockValidateFail(315): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: numBootBlockValidateFail(315): Cannot add 8 elements to context";
              goto LABEL_2247;
            case 316:
              if ((_DWORD)v14 != 4) {
                sub_100018D50( "ASPFTLParseBufferToCxt: clogPagesFillingPercentage(316): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: clogPagesFillingPercentage(316): Cannot add 4 elements to context";
              goto LABEL_2247;
            case 317:
              uint64_t v19 = "ASPFTLParseBufferToCxt: bdrCalTimeAccFactor(317) cannot add 1 element to context";
              goto LABEL_15;
            case 318:
              uint64_t v19 = "ASPFTLParseBufferToCxt: bootChainRdError(318) cannot add 1 element to context";
              goto LABEL_15;
            case 319:
              uint64_t v19 = "ASPFTLParseBufferToCxt: bootChainBlankError(319) cannot add 1 element to context";
              goto LABEL_15;
            case 320:
              uint64_t v19 = "ASPFTLParseBufferToCxt: bootChainRefreshError(320) cannot add 1 element to context";
              goto LABEL_15;
            case 321:
              uint64_t v19 = "ASPFTLParseBufferToCxt: bootChainVersionError(321) cannot add 1 element to context";
              goto LABEL_15;
            case 322:
              uint64_t v19 = "ASPFTLParseBufferToCxt: mspBootBlockMismatch(322) cannot add 1 element to context";
              goto LABEL_15;
            case 323:
              uint64_t v19 = "ASPFTLParseBufferToCxt: mspBootBlockMismatchErr(323) cannot add 1 element to context";
              goto LABEL_15;
            case 324:
              if ((_DWORD)v14 != 5) {
                sub_100018D50( "ASPFTLParseBufferToCxt: bitflipAddr(324): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bitflipAddr(324): Cannot add 5 elements to context";
              goto LABEL_2247;
            case 325:
              if ((_DWORD)v14 != 5) {
                sub_100018D50( "ASPFTLParseBufferToCxt: bitflipCount(325): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bitflipCount(325): Cannot add 5 elements to context";
              goto LABEL_2247;
            case 326:
              if ((_DWORD)v14 != 5) {
                sub_100018D50( "ASPFTLParseBufferToCxt: bitflipDupes(326): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bitflipDupes(326): Cannot add 5 elements to context";
              goto LABEL_2247;
            case 327:
              if ((_DWORD)v14 != 30) {
                sub_100018D50( "ASPFTLParseBufferToCxt: bandsMaxTempHisto(327): (#30) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bandsMaxTempHisto(327): Cannot add 30 elements to context";
              goto LABEL_2247;
            case 328:
              if ((_DWORD)v14 != 30) {
                sub_100018D50( "ASPFTLParseBufferToCxt: bandsMinTempHisto(328): (#30) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bandsMinTempHisto(328): Cannot add 30 elements to context";
              goto LABEL_2247;
            case 329:
              if ((_DWORD)v14 != 30) {
                sub_100018D50( "ASPFTLParseBufferToCxt: bandsLifeTimeTempHisto(329): (#30) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bandsLifeTimeTempHisto(329): Cannot add 30 elements to context";
              goto LABEL_2247;
            case 330:
              if ((_DWORD)v14 != 22) {
                sub_100018D50( "ASPFTLParseBufferToCxt: bandsDeltaTempHisto(330): (#22) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bandsDeltaTempHisto(330): Cannot add 22 elements to context";
              goto LABEL_2247;
            case 331:
              if ((_DWORD)v14 != 45) {
                sub_100018D50( "ASPFTLParseBufferToCxt: bandsCrossTempHisto(331): (#45) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bandsCrossTempHisto(331): Cannot add 45 elements to context";
              goto LABEL_2247;
            case 332:
              if ((_DWORD)v14 != 10) {
                sub_100018D50( "ASPFTLParseBufferToCxt: wcacheWaitLogMs(332): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: wcacheWaitLogMs(332): Cannot add 10 elements to context";
              goto LABEL_2247;
            case 333:
              if ((_DWORD)v14 != 10) {
                sub_100018D50( "ASPFTLParseBufferToCxt: wcacheDS_segsSortedLogSize(333): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: wcacheDS_segsSortedLogSize(333): Cannot add 10 elements to context";
              goto LABEL_2247;
            case 334:
              uint64_t v19 = "ASPFTLParseBufferToCxt: numFirmwareWrites(334) cannot add 1 element to context";
              goto LABEL_15;
            case 335:
              uint64_t v19 = "ASPFTLParseBufferToCxt: numBisWrites(335) cannot add 1 element to context";
              goto LABEL_15;
            case 336:
              uint64_t v19 = "ASPFTLParseBufferToCxt: numBootChainUpdates(336) cannot add 1 element to context";
              goto LABEL_15;
            case 337:
              uint64_t v19 = "ASPFTLParseBufferToCxt: cntCalTimeWentBackWard(337) cannot add 1 element to context";
              goto LABEL_15;
            case 338:
              uint64_t v19 = "ASPFTLParseBufferToCxt: indBoRecoveries(338) cannot add 1 element to context";
              goto LABEL_15;
            case 340:
              uint64_t v19 = "ASPFTLParseBufferToCxt: numCrossTempUecc(340) cannot add 1 element to context";
              goto LABEL_15;
            case 341:
              uint64_t v19 = "ASPFTLParseBufferToCxt: latencyMonitorError(341) cannot add 1 element to context";
              goto LABEL_15;
            case 343:
              uint64_t v19 = "ASPFTLParseBufferToCxt: utilUeccReads(343) cannot add 1 element to context";
              goto LABEL_15;
            case 344:
              uint64_t v19 = "ASPFTLParseBufferToCxt: numOfAvoidedGCDueToTemp(344) cannot add 1 element to context";
              goto LABEL_15;
            case 345:
              uint64_t v19 = "ASPFTLParseBufferToCxt: forceShutdowns(345) cannot add 1 element to context";
              goto LABEL_15;
            case 346:
              uint64_t v19 = "ASPFTLParseBufferToCxt: gcSlcDestinations(346) cannot add 1 element to context";
              goto LABEL_15;
            case 347:
              uint64_t v19 = "ASPFTLParseBufferToCxt: indReplayExtUsed(347) cannot add 1 element to context";
              goto LABEL_15;
            case 348:
              uint64_t v19 = "ASPFTLParseBufferToCxt: defectsPerPackageOverflow(348) cannot add 1 element to context";
              goto LABEL_15;
            case 349:
              uint64_t v19 = "ASPFTLParseBufferToCxt: RxBurnIntBandsProgrammed(349) cannot add 1 element to context";
              goto LABEL_15;
            case 350:
              uint64_t v19 = "ASPFTLParseBufferToCxt: RxBurnUsrBandsProgrammed(350) cannot add 1 element to context";
              goto LABEL_15;
            case 351:
              uint64_t v19 = "ASPFTLParseBufferToCxt: RxBurnIntNandWrites(351) cannot add 1 element to context";
              goto LABEL_15;
            case 352:
              uint64_t v19 = "ASPFTLParseBufferToCxt: RxBurnUsrNandWrites(352) cannot add 1 element to context";
              goto LABEL_15;
            case 353:
              uint64_t v19 = "ASPFTLParseBufferToCxt: clogLastStripeUeccs(353) cannot add 1 element to context";
              goto LABEL_15;
            case 354:
              uint64_t v19 = "ASPFTLParseBufferToCxt: GC_MidDestSrcSwitchSLC2TLC(354) cannot add 1 element to context";
              goto LABEL_15;
            case 355:
              uint64_t v19 = "ASPFTLParseBufferToCxt: GC_MidDestSrcSwitchTLC2SLC(355) cannot add 1 element to context";
              goto LABEL_15;
            case 356:
              uint64_t v19 = "ASPFTLParseBufferToCxt: nvme_stats_shutdown_count_host0_normal(356) cannot add 1 element to context";
              goto LABEL_15;
            case 357:
              uint64_t v19 = "ASPFTLParseBufferToCxt: nvme_stats_shutdown_count_host1_normal(357) cannot add 1 element to context";
              goto LABEL_15;
            case 358:
              uint64_t v19 = "ASPFTLParseBufferToCxt: nvme_stats_shutdown_count_host0_s2r(358) cannot add 1 element to context";
              goto LABEL_15;
            case 359:
              uint64_t v19 = "ASPFTLParseBufferToCxt: nvme_stats_shutdown_count_host1_s2r(359) cannot add 1 element to context";
              goto LABEL_15;
            case 360:
              if ((_DWORD)v14 != 16) {
                sub_100018D50( "ASPFTLParseBufferToCxt: gcPDusterIntrSrcValidityHisto(360): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: gcPDusterIntrSrcValidityHisto(360): Cannot add 16 elements to context";
              goto LABEL_2247;
            case 361:
              if ((_DWORD)v14 != 16) {
                sub_100018D50( "ASPFTLParseBufferToCxt: gcPDusterUserSrcValidityHisto(361): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: gcPDusterUserSrcValidityHisto(361): Cannot add 16 elements to context";
              goto LABEL_2247;
            case 362:
              uint64_t v19 = "ASPFTLParseBufferToCxt: raidFailedReadParity(362) cannot add 1 element to context";
              goto LABEL_15;
            case 364:
              uint64_t v19 = "ASPFTLParseBufferToCxt: lhotNumSkipes(364) cannot add 1 element to context";
              goto LABEL_15;
            default:
              switch(v12)
              {
                case 365:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: lhotNumIsHotCalls(365) cannot add 1 element to context";
                  goto LABEL_15;
                case 366:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: lhotFullLap(366) cannot add 1 element to context";
                  goto LABEL_15;
                case 367:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: lhotSkipPrecent(367) cannot add 1 element to context";
                  goto LABEL_15;
                case 368:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: eraseSuspendEvents(368) cannot add 1 element to context";
                  goto LABEL_15;
                case 369:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: eraseSuspendedStatuses(369) cannot add 1 element to context";
                  goto LABEL_15;
                case 370:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: eraseSuspendedBands(370) cannot add 1 element to context";
                  goto LABEL_15;
                case 371:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: eraseSuspendSituationsBelowThreshold(371) cannot add 1 element to context";
                  goto LABEL_15;
                case 372:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: eraseSuspendSituationsAboveThreshold(372) cannot add 1 element to context";
                  goto LABEL_15;
                case 373:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: eraseSuspendReadChainsProcessed(373) cannot add 1 element to context";
                  goto LABEL_15;
                case 374:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: bdrLastDoneHr(374) cannot add 1 element to context";
                  goto LABEL_15;
                case 375:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: bdrBackupThreshHrs(375) cannot add 1 element to context";
                  goto LABEL_15;
                case 376:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: clogPortableProgBufs(376) cannot add 1 element to context";
                  goto LABEL_15;
                case 377:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: clogPortableDropBufs(377) cannot add 1 element to context";
                  goto LABEL_15;
                case 378:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: clogPortablePadSectors(378) cannot add 1 element to context";
                  goto LABEL_15;
                case 379:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: numRetiredBlocks(379) cannot add 1 element to context";
                  goto LABEL_15;
                case 381:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: numRefreshOnErrNandRefreshPerf(381) cannot add 1 element to context";
                  goto LABEL_15;
                case 382:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: raidReconstructReads(382) cannot add 1 element to context";
                  goto LABEL_15;
                case 383:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: gcReadsNoBlog(383) cannot add 1 element to context";
                  goto LABEL_15;
                case 384:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: AbortSkip_MPBXReadVerifyClosedBand(384) cannot add 1 element to context";
                  goto LABEL_15;
                case 385:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: openBandReadFail(385) cannot add 1 element to context";
                  goto LABEL_15;
                case 386:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: AbortSkip_MPBXReadVerifyOpenBand(386) cannot add 1 element to context";
                  goto LABEL_15;
                case 387:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: AbortSkip_MBPXFailedRebuildingParity(387) cannot add 1 element to context";
                  goto LABEL_15;
                case 388:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: raidSuccessfulPMXReconstructionInternal(388) cannot add 1 element to context";
                  goto LABEL_15;
                case 389:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: raidSuccessfulPMXReconstructionHost(389) cannot add 1 element to context";
                  goto LABEL_15;
                case 390:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: raidFailedPMXReconstructionInternal(390) cannot add 1 element to context";
                  goto LABEL_15;
                case 391:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: raidFailedPMXReconstructionHost(391) cannot add 1 element to context";
                  goto LABEL_15;
                case 392:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: raidSuccessfulRMXReconstructionInternal(392) cannot add 1 element to context";
                  goto LABEL_15;
                case 393:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: raidSuccessfulRMXReconstructionHost(393) cannot add 1 element to context";
                  goto LABEL_15;
                case 394:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: raidFailedRMXReconstructionInternal(394) cannot add 1 element to context";
                  goto LABEL_15;
                case 395:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: raidFailedRMXReconstructionHost(395) cannot add 1 element to context";
                  goto LABEL_15;
                case 396:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: raidFailedReadParityInternal(396) cannot add 1 element to context";
                  goto LABEL_15;
                case 397:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: raidFailedReadQParityInternal(397) cannot add 1 element to context";
                  goto LABEL_15;
                case 398:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: raidFailedReadQParity(398) cannot add 1 element to context";
                  goto LABEL_15;
                case 399:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: raidFailedReadQCopy(399) cannot add 1 element to context";
                  goto LABEL_15;
                case 400:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: raidFailedReconstructionQParity(400) cannot add 1 element to context";
                  goto LABEL_15;
                case 401:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: offlineBlocksCnt(401) cannot add 1 element to context";
                  goto LABEL_15;
                case 402:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: bork0Revectors(402) cannot add 1 element to context";
                  goto LABEL_15;
                case 403:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: raidFailedReadBlog(403) cannot add 1 element to context";
                  goto LABEL_15;
                case 404:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: numReliabilityRefreshes(404) cannot add 1 element to context";
                  goto LABEL_15;
                case 405:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: raidFailedReadQCopyInternal(405) cannot add 1 element to context";
                  goto LABEL_15;
                case 406:
                  if ((_DWORD)v14 != 5) {
                    sub_100018D50( "ASPFTLParseBufferToCxt: raidReconstructSuccessFlow(406): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                  }
                  else {
                    unsigned int v20 = v14;
                  }
                  int v22 = "ASPFTLParseBufferToCxt: raidReconstructSuccessFlow(406): Cannot add 5 elements to context";
                  goto LABEL_2247;
                case 407:
                  if ((_DWORD)v14 != 5) {
                    sub_100018D50( "ASPFTLParseBufferToCxt: raidReconstructFailFlow(407): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                  }
                  else {
                    unsigned int v20 = v14;
                  }
                  int v22 = "ASPFTLParseBufferToCxt: raidReconstructFailFlow(407): Cannot add 5 elements to context";
                  goto LABEL_2247;
                case 408:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailP(408) cannot add 1 element to context";
                  goto LABEL_15;
                case 409:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailQ(409) cannot add 1 element to context";
                  goto LABEL_15;
                case 410:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailUECC(410) cannot add 1 element to context";
                  goto LABEL_15;
                case 411:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailUnsupp(411) cannot add 1 element to context";
                  goto LABEL_15;
                case 412:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: raidUECCOpenBand(412) cannot add 1 element to context";
                  goto LABEL_15;
                case 414:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: ueccReads(414) cannot add 1 element to context";
                  goto LABEL_15;
                case 416:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: raidSuccessfulVerify(416) cannot add 1 element to context";
                  goto LABEL_15;
                case 417:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: raidFailedVerify(417) cannot add 1 element to context";
                  goto LABEL_15;
                case 418:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: numBandsVerified(418) cannot add 1 element to context";
                  goto LABEL_15;
                case 419:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: cache_heads(419) cannot add 1 element to context";
                  goto LABEL_15;
                case 420:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: AbortSkip_RMXtoMPBX(420) cannot add 1 element to context";
                  goto LABEL_15;
                case 421:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: s3eFwVer(421) cannot add 1 element to context";
                  goto LABEL_15;
                case 422:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: readVerifyNative(422) cannot add 1 element to context";
                  goto LABEL_15;
                case 423:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: reducedReadVerifyNative(423) cannot add 1 element to context";
                  goto LABEL_15;
                case 424:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: readVerifySlc(424) cannot add 1 element to context";
                  goto LABEL_15;
                case 425:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: reducedReadVerifySlc(425) cannot add 1 element to context";
                  goto LABEL_15;
                case 426:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: RxBurnEvictions(426) cannot add 1 element to context";
                  goto LABEL_15;
                case 427:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: directToTLCBands(427) cannot add 1 element to context";
                  goto LABEL_15;
                case 428:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: nandDesc(428) cannot add 1 element to context";
                  goto LABEL_15;
                case 429:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: fwUpdatesPercentUsed(429) cannot add 1 element to context";
                  goto LABEL_15;
                case 430:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: slcPercentUsed(430) cannot add 1 element to context";
                  goto LABEL_15;
                case 431:
                  uint64_t v19 = "ASPFTLParseBufferToCxt: percentUsed(431) cannot add 1 element to context";
                  goto LABEL_15;
                default:
                  switch(v12)
                  {
                    case 432:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: hostAutoWrites(432) cannot add 1 element to context";
                      goto LABEL_15;
                    case 433:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: hostAutoWriteXacts(433) cannot add 1 element to context";
                      goto LABEL_15;
                    case 434:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: gcDestDynamic(434) cannot add 1 element to context";
                      goto LABEL_15;
                    case 435:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: gcDestStatic(435) cannot add 1 element to context";
                      goto LABEL_15;
                    case 436:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: gcDestWearlevel(436) cannot add 1 element to context";
                      goto LABEL_15;
                    case 437:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: gcDestParity(437) cannot add 1 element to context";
                      goto LABEL_15;
                    case 438:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: AbortSkip_Format(438) cannot add 1 element to context";
                      goto LABEL_15;
                    case 440:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: raidSLCPadding(440) cannot add 1 element to context";
                      goto LABEL_15;
                    case 441:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: raidGCBands(441) cannot add 1 element to context";
                      goto LABEL_15;
                    case 442:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: raidGCSectors(442) cannot add 1 element to context";
                      goto LABEL_15;
                    case 443:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: raidGCPadding(443) cannot add 1 element to context";
                      goto LABEL_15;
                    case 444:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: raidSLCBandsPerHostFlow(444) cannot add 1 element to context";
                      goto LABEL_15;
                    case 445:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: raidSLCSecsPerHostFlow(445) cannot add 1 element to context";
                      goto LABEL_15;
                    case 446:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: rxBurnMinCycleRuns(446) cannot add 1 element to context";
                      goto LABEL_15;
                    case 447:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: clogNumFastCxt(447) cannot add 1 element to context";
                      goto LABEL_15;
                    case 448:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: clogNumRapidReboots(448) cannot add 1 element to context";
                      goto LABEL_15;
                    case 449:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: clogFastCxtAbvThr(449) cannot add 1 element to context";
                      goto LABEL_15;
                    case 450:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: rxBurnDiffModeRuns(450) cannot add 1 element to context";
                      goto LABEL_15;
                    case 452:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: indReadVerifyFail(452) cannot add 1 element to context";
                      goto LABEL_15;
                    case 453:
                      if ((_DWORD)v14 != 16) {
                        sub_100018D50( "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerReadLevel(453): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerReadLevel(453): Cannot add 16 elements to context";
                      goto LABEL_2247;
                    case 454:
                      if ((_DWORD)v14 != 16) {
                        sub_100018D50( "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerWriteLevel(454): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerWriteLevel(454): Cannot add 16 elements to context";
                      goto LABEL_2247;
                    case 456:
                      if ((_DWORD)v14 != 10) {
                        sub_100018D50( "ASPFTLParseBufferToCxt: slcFifoDepth(456): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: slcFifoDepth(456): Cannot add 10 elements to context";
                      goto LABEL_2247;
                    case 457:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: wcacheSectorsDirtyIdle(457) cannot add 1 element to context";
                      goto LABEL_15;
                    case 458:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: wcacheDS_SectorsDirtyIdle(458) cannot add 1 element to context";
                      goto LABEL_15;
                    case 459:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: wcacheFS_MbytesDirtyIdle(459) cannot add 1 element to context";
                      goto LABEL_15;
                    case 460:
                      if ((_DWORD)v14 != 256) {
                        sub_100018D50( "ASPFTLParseBufferToCxt: CacheDepthVsThroughput(460): (#256) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: CacheDepthVsThroughput(460): Cannot add 256 elements to context";
                      goto LABEL_2247;
                    case 461:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: directToTLCSectors(461) cannot add 1 element to context";
                      goto LABEL_15;
                    case 462:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: fallbackToWaterfall(462) cannot add 1 element to context";
                      goto LABEL_15;
                    case 463:
                      if ((_DWORD)v14 != 11) {
                        sub_100018D50( "ASPFTLParseBufferToCxt: balanceProportionBucketsHistogram(463): (#11) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: balanceProportionBucketsHistogram(463): Cannot add 11 elements to context";
                      goto LABEL_2247;
                    case 464:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: lockToTlc(464) cannot add 1 element to context";
                      goto LABEL_15;
                    case 465:
                      if ((_DWORD)v14 != 10) {
                        sub_100018D50( "ASPFTLParseBufferToCxt: burstSizeHistogram(465): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: burstSizeHistogram(465): Cannot add 10 elements to context";
                      goto LABEL_2247;
                    case 466:
                      if ((_DWORD)v14 != 64) {
                        sub_100018D50( "ASPFTLParseBufferToCxt: qosDirectToTLC(466): (#64) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: qosDirectToTLC(466): Cannot add 64 elements to context";
                      goto LABEL_2247;
                    case 467:
                      if ((_DWORD)v14 != 4) {
                        sub_100018D50( "ASPFTLParseBufferToCxt: maxQosDirectToTLC(467): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: maxQosDirectToTLC(467): Cannot add 4 elements to context";
                      goto LABEL_2247;
                    case 468:
                      if ((_DWORD)v14 != 16) {
                        sub_100018D50( "ASPFTLParseBufferToCxt: wcacheDirtyAtFlush(468): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: wcacheDirtyAtFlush(468): Cannot add 16 elements to context";
                      goto LABEL_2247;
                    case 469:
                      if ((_DWORD)v14 != 2) {
                        sub_100018D50( "ASPFTLParseBufferToCxt: raidReconstructSuccessPartition(469): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: raidReconstructSuccessPartition(469): Cannot add 2 elements to context";
                      goto LABEL_2247;
                    case 470:
                      if ((_DWORD)v14 != 2) {
                        sub_100018D50( "ASPFTLParseBufferToCxt: raidReconstructFailPartition(470): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: raidReconstructFailPartition(470): Cannot add 2 elements to context";
                      goto LABEL_2247;
                    case 471:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: raidUncleanBootBandFail(471) cannot add 1 element to context";
                      goto LABEL_15;
                    case 472:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBandFlowHost(472) cannot add 1 element to context";
                      goto LABEL_15;
                    case 473:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBandFlowGC(473) cannot add 1 element to context";
                      goto LABEL_15;
                    case 476:
                      if ((_DWORD)v14 != 2) {
                        sub_100018D50( "ASPFTLParseBufferToCxt: raidSuccessfulRecoLbaRange(476): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: raidSuccessfulRecoLbaRange(476): Cannot add 2 elements to context";
                      goto LABEL_2247;
                    case 477:
                      if ((_DWORD)v14 != 2) {
                        sub_100018D50( "ASPFTLParseBufferToCxt: raidFailedRecoLbaRange(477): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: raidFailedRecoLbaRange(477): Cannot add 2 elements to context";
                      goto LABEL_2247;
                    case 481:
                      if ((_DWORD)v14 != 32) {
                        sub_100018D50( "ASPFTLParseBufferToCxt: skinnyBandErases_481(481): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: skinnyBandErases_481(481): Cannot add 32 elements to context";
                      goto LABEL_2247;
                    case 483:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: tlcOverHeatWaterfall(483) cannot add 1 element to context";
                      goto LABEL_15;
                    case 484:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: skinnyCyclesConvert(484) cannot add 1 element to context";
                      goto LABEL_15;
                    case 485:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: non_proportional_directToTLCSectors(485) cannot add 1 element to context";
                      goto LABEL_15;
                    case 486:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: maxFailedFastCxtSync(486) cannot add 1 element to context";
                      goto LABEL_15;
                    case 487:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: numFormatUserArea(487) cannot add 1 element to context";
                      goto LABEL_15;
                    case 488:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: clogFastCxtSyncAborted(488) cannot add 1 element to context";
                      goto LABEL_15;
                    case 489:
                      if ((_DWORD)v14 != 5) {
                        sub_100018D50( "ASPFTLParseBufferToCxt: clogOccupationSectors(489): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: clogOccupationSectors(489): Cannot add 5 elements to context";
                      goto LABEL_2247;
                    case 490:
                      if ((_DWORD)v14 != 64) {
                        sub_100018D50( "ASPFTLParseBufferToCxt: bdrTmpHist(490): (#64) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: bdrTmpHist(490): Cannot add 64 elements to context";
                      goto LABEL_2247;
                    case 491:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: numFWUpdates(491) cannot add 1 element to context";
                      goto LABEL_15;
                    case 492:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: numClogLoadFails(492) cannot add 1 element to context";
                      goto LABEL_15;
                    case 493:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: rxBurnNumForcedDiffMode(493) cannot add 1 element to context";
                      goto LABEL_15;
                    case 494:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: RD_numSaves(494) cannot add 1 element to context";
                      goto LABEL_15;
                    case 495:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: eanCompressWrites(495) cannot add 1 element to context";
                      goto LABEL_15;
                    case 496:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: eanHostWrites(496) cannot add 1 element to context";
                      goto LABEL_15;
                    case 497:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: bandPreErases(497) cannot add 1 element to context";
                      goto LABEL_15;
                    case 498:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: eanHostUnmaps(498) cannot add 1 element to context";
                      goto LABEL_15;
                    case 499:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: eanHostFlushes(499) cannot add 1 element to context";
                      goto LABEL_15;
                    case 500:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: eanFastWrites(500) cannot add 1 element to context";
                      goto LABEL_15;
                    case 501:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: autowriteDS2FSCollisions(501) cannot add 1 element to context";
                      goto LABEL_15;
                    case 502:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: autowriteWaitTransferTaskBlocks(502) cannot add 1 element to context";
                      goto LABEL_15;
                    case 503:
                      if ((_DWORD)v14 != 2) {
                        sub_100018D50( "ASPFTLParseBufferToCxt: avgCycle(503): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: avgCycle(503): Cannot add 2 elements to context";
                      goto LABEL_2247;
                    case 504:
                      uint64_t v19 = "ASPFTLParseBufferToCxt: RD_DeferredClearsOverflowCnt(504) cannot add 1 element to context";
                      goto LABEL_15;
                    default:
                      switch(v12)
                      {
                        case 505:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: maxVerticsInBand(505) cannot add 1 element to context";
                          goto LABEL_15;
                        case 506:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: numVertics(506) cannot add 1 element to context";
                          goto LABEL_15;
                        case 507:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: exceededCVertics(507) cannot add 1 element to context";
                          goto LABEL_15;
                        case 510:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailMismatch(510) cannot add 1 element to context";
                          goto LABEL_15;
                        case 511:
                          if ((_DWORD)v14 != 32) {
                            sub_100018D50( "ASPFTLParseBufferToCxt: mspbootBlockRefreshCnt(511): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                          }
                          else {
                            unsigned int v20 = v14;
                          }
                          int v22 = "ASPFTLParseBufferToCxt: mspbootBlockRefreshCnt(511): Cannot add 32 elements to context";
                          goto LABEL_2247;
                        case 516:
                          if ((_DWORD)v14 != 32) {
                            sub_100018D50( "ASPFTLParseBufferToCxt: mspBootBlockRefreshTime(516): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                          }
                          else {
                            unsigned int v20 = v14;
                          }
                          int v22 = "ASPFTLParseBufferToCxt: mspBootBlockRefreshTime(516): Cannot add 32 elements to context";
                          goto LABEL_2247;
                        case 517:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: mspBootBlockCountPerMsp(517) cannot add 1 element to context";
                          goto LABEL_15;
                        case 518:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: skinnyRevectorSLC(518) cannot add 1 element to context";
                          goto LABEL_15;
                        case 519:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: skinnyRevectorTLC(519) cannot add 1 element to context";
                          goto LABEL_15;
                        case 520:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: perfSetupAttempts(520) cannot add 1 element to context";
                          goto LABEL_15;
                        case 521:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: perfSetupSuccesses(521) cannot add 1 element to context";
                          goto LABEL_15;
                        case 522:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: perfWriteAttempts(522) cannot add 1 element to context";
                          goto LABEL_15;
                        case 523:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: perfWriteSuccesses(523) cannot add 1 element to context";
                          goto LABEL_15;
                        case 524:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: perfReadAttempts(524) cannot add 1 element to context";
                          goto LABEL_15;
                        case 525:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: perfReadSuccesses(525) cannot add 1 element to context";
                          goto LABEL_15;
                        case 526:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: perfCleanupAttempts(526) cannot add 1 element to context";
                          goto LABEL_15;
                        case 527:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: perfCleanupSuccesses(527) cannot add 1 element to context";
                          goto LABEL_15;
                        case 530:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: firstFailedDieId(530) cannot add 1 element to context";
                          goto LABEL_15;
                        case 531:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: numDieFailures(531) cannot add 1 element to context";
                          goto LABEL_15;
                        case 532:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: spareAvailablePercent(532) cannot add 1 element to context";
                          goto LABEL_15;
                        case 533:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: dataFabricErr(533) cannot add 1 element to context";
                          goto LABEL_15;
                        case 534:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: downlinkFabricErr(534) cannot add 1 element to context";
                          goto LABEL_15;
                        case 535:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: prpAccTimeoutErr(535) cannot add 1 element to context";
                          goto LABEL_15;
                        case 537:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: uplinkFabricErr(537) cannot add 1 element to context";
                          goto LABEL_15;
                        case 538:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: skinnyBandsGBB(538) cannot add 1 element to context";
                          goto LABEL_15;
                        case 539:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: AbortPad_GcMustPadBand(539) cannot add 1 element to context";
                          goto LABEL_15;
                        case 540:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: AbortPad_GcMustPadSkinny(540) cannot add 1 element to context";
                          goto LABEL_15;
                        case 541:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: bdrHostPingInitial(541) cannot add 1 element to context";
                          goto LABEL_15;
                        case 542:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: bdrHostPingMoreNeeded(542) cannot add 1 element to context";
                          goto LABEL_15;
                        case 543:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: bandParityAllocationFailed(543) cannot add 1 element to context";
                          goto LABEL_15;
                        case 544:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: fastHwBurstToSlc(544) cannot add 1 element to context";
                          goto LABEL_15;
                        case 545:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: slowHwToTlc(545) cannot add 1 element to context";
                          goto LABEL_15;
                        case 546:
                          if ((_DWORD)v14 != 10) {
                            sub_100018D50( "ASPFTLParseBufferToCxt: slcDemandBurstSizeDetected(546): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                          }
                          else {
                            unsigned int v20 = v14;
                          }
                          int v22 = "ASPFTLParseBufferToCxt: slcDemandBurstSizeDetected(546): Cannot add 10 elements to context";
                          goto LABEL_2247;
                        case 547:
                          if ((_DWORD)v14 != 10) {
                            sub_100018D50( "ASPFTLParseBufferToCxt: slcDemandBurstDur(547): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                          }
                          else {
                            unsigned int v20 = v14;
                          }
                          int v22 = "ASPFTLParseBufferToCxt: slcDemandBurstDur(547): Cannot add 10 elements to context";
                          goto LABEL_2247;
                        case 548:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: fastHwToTlcBurst(548) cannot add 1 element to context";
                          goto LABEL_15;
                        case 549:
                          if ((_DWORD)v14 != 10) {
                            sub_100018D50( "ASPFTLParseBufferToCxt: slcDemandBurstSizeSlc(549): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                          }
                          else {
                            unsigned int v20 = v14;
                          }
                          int v22 = "ASPFTLParseBufferToCxt: slcDemandBurstSizeSlc(549): Cannot add 10 elements to context";
                          goto LABEL_2247;
                        case 551:
                          if ((_DWORD)v14 != 11) {
                            sub_100018D50( "ASPFTLParseBufferToCxt: balanceProportionBucketsHistogramTlc(551): (#11) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                          }
                          else {
                            unsigned int v20 = v14;
                          }
                          int v22 = "ASPFTLParseBufferToCxt: balanceProportionBucketsHistogramTlc(551): Cannot add 11 elements to context";
                          goto LABEL_2247;
                        case 553:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: slowHwFlushToSlc(553) cannot add 1 element to context";
                          goto LABEL_15;
                        case 557:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: slowHwToSlc(557) cannot add 1 element to context";
                          goto LABEL_15;
                        case 558:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: flushNwToSlc(558) cannot add 1 element to context";
                          goto LABEL_15;
                        case 559:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: flushNwToTlc(559) cannot add 1 element to context";
                          goto LABEL_15;
                        case 560:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: oslcHw(560) cannot add 1 element to context";
                          goto LABEL_15;
                        case 561:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: oslcTransitions(561) cannot add 1 element to context";
                          goto LABEL_15;
                        case 563:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: slcDemandFlushCount(563) cannot add 1 element to context";
                          goto LABEL_15;
                        case 564:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: slcDemandBurstCount(564) cannot add 1 element to context";
                          goto LABEL_15;
                        case 565:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: oslcBaseAvgPE(565) cannot add 1 element to context";
                          goto LABEL_15;
                        case 566:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailNoSPBX(566) cannot add 1 element to context";
                          goto LABEL_15;
                        case 567:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailDouble(567) cannot add 1 element to context";
                          goto LABEL_15;
                        case 568:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: oslcFastWAmpUOnOff(568) cannot add 1 element to context";
                          goto LABEL_15;
                        case 569:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: oslcSlowWAmpUOnOff(569) cannot add 1 element to context";
                          goto LABEL_15;
                        case 570:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailInvalid(570) cannot add 1 element to context";
                          goto LABEL_15;
                        case 572:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: oslcLastWAmpUx10(572) cannot add 1 element to context";
                          goto LABEL_15;
                        case 573:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: raidFailedReadNoBlog(573) cannot add 1 element to context";
                          goto LABEL_15;
                        case 574:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBlank(574) cannot add 1 element to context";
                          goto LABEL_15;
                        case 575:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: oslcHotTLCOnOff(575) cannot add 1 element to context";
                          goto LABEL_15;
                        case 576:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: gcVPackDestinations(576) cannot add 1 element to context";
                          goto LABEL_15;
                        case 581:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: averageTLCPECycles(581) cannot add 1 element to context";
                          goto LABEL_15;
                        case 582:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: averageSLCPECycles(582) cannot add 1 element to context";
                          goto LABEL_15;
                        case 583:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: numAtomicBoots(583) cannot add 1 element to context";
                          goto LABEL_15;
                        case 584:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: clogMinorMismatch(584) cannot add 1 element to context";
                          goto LABEL_15;
                        case 586:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: raidExpectedFailRMXReconstructionInternal(586) cannot add 1 element to context";
                          goto LABEL_15;
                        case 587:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: raidExpectedFailRMXReconstructionHost(587) cannot add 1 element to context";
                          goto LABEL_15;
                        case 588:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: oslcGCinvalidations(588) cannot add 1 element to context";
                          goto LABEL_15;
                        case 589:
                          uint64_t v19 = "ASPFTLParseBufferToCxt: oslcGCActivateReason(589) cannot add 1 element to context";
                          goto LABEL_15;
                        default:
                          switch(v12)
                          {
                            case 590:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: oslcLowCleanBandsUOnOff(590) cannot add 1 element to context";
                              goto LABEL_15;
                            case 591:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: oslcTooManyGCMustOnOff(591) cannot add 1 element to context";
                              goto LABEL_15;
                            case 592:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: oslcBaseHostWrites(592) cannot add 1 element to context";
                              goto LABEL_15;
                            case 593:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: oslcBaseBandErases(593) cannot add 1 element to context";
                              goto LABEL_15;
                            case 594:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: oslcBdrBands(594) cannot add 1 element to context";
                              goto LABEL_15;
                            case 595:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: oslcBdrValid(595) cannot add 1 element to context";
                              goto LABEL_15;
                            case 596:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: unexpectedBlanksInternal(596) cannot add 1 element to context";
                              goto LABEL_15;
                            case 597:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: unexpectedBlanksOnRV(597) cannot add 1 element to context";
                              goto LABEL_15;
                            case 601:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: waterfallLockSectors(601) cannot add 1 element to context";
                              goto LABEL_15;
                            case 602:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: oslcGCActiveWrites(602) cannot add 1 element to context";
                              goto LABEL_15;
                            case 603:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: chipIdTemperatureSample(603) cannot add 1 element to context";
                              goto LABEL_15;
                            case 604:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: gcVPackWrites(604) cannot add 1 element to context";
                              goto LABEL_15;
                            case 605:
                              if ((_DWORD)v14 != 10) {
                                sub_100018D50( "ASPFTLParseBufferToCxt: gcActiveReasons(605): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: gcActiveReasons(605): Cannot add 10 elements to context";
                              goto LABEL_2247;
                            case 606:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: eanMaxInitTimeMs(606) cannot add 1 element to context";
                              goto LABEL_15;
                            case 607:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: eanMinToFirstReadTimeMs(607) cannot add 1 element to context";
                              goto LABEL_15;
                            case 608:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: skinnyAPGMRetire(608) cannot add 1 element to context";
                              goto LABEL_15;
                            case 609:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: unexpectedBlanksHost(609) cannot add 1 element to context";
                              goto LABEL_15;
                            case 610:
                              if ((_DWORD)v14 != 64) {
                                sub_100018D50( "ASPFTLParseBufferToCxt: pcieAerCounters(610): (#64) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: pcieAerCounters(610): Cannot add 64 elements to context";
                              goto LABEL_2247;
                            case 611:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: fastHwToTlcBalance(611) cannot add 1 element to context";
                              goto LABEL_15;
                            case 612:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: perfOSLCRuns(612) cannot add 1 element to context";
                              goto LABEL_15;
                            case 613:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: slcDemandBurstWritesInGC(613) cannot add 1 element to context";
                              goto LABEL_15;
                            case 614:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: slcDemandBurstWritesInTT(614) cannot add 1 element to context";
                              goto LABEL_15;
                            case 615:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: slcDemandBurstWritesInNRP(615) cannot add 1 element to context";
                              goto LABEL_15;
                            case 616:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: perfTotalDmaMb(616) cannot add 1 element to context";
                              goto LABEL_15;
                            case 617:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: eanAvgInitTimeMs(617) cannot add 1 element to context";
                              goto LABEL_15;
                            case 618:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: eanAvgToFirstReadTimeMs(618) cannot add 1 element to context";
                              goto LABEL_15;
                            case 619:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: eanMaxBootReadTimeMs(619) cannot add 1 element to context";
                              goto LABEL_15;
                            case 620:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: eanAvgBootReadTimeMs(620) cannot add 1 element to context";
                              goto LABEL_15;
                            case 621:
                              if ((_DWORD)v14 != 10) {
                                sub_100018D50( "ASPFTLParseBufferToCxt: eanBootReadsHist(621): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: eanBootReadsHist(621): Cannot add 10 elements to context";
                              goto LABEL_2247;
                            case 622:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: maxBgInitTimeMs(622) cannot add 1 element to context";
                              goto LABEL_15;
                            case 623:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: avgBgInitTimeMs(623) cannot add 1 element to context";
                              goto LABEL_15;
                            case 624:
                              if ((_DWORD)v14 != 16) {
                                sub_100018D50( "ASPFTLParseBufferToCxt: clogFailReason(624): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: clogFailReason(624): Cannot add 16 elements to context";
                              goto LABEL_2247;
                            case 625:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: eanMinBootReadMBPerSec(625) cannot add 1 element to context";
                              goto LABEL_15;
                            case 626:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: eanAvgBootReadMBPerSec(626) cannot add 1 element to context";
                              goto LABEL_15;
                            case 627:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: minSkinnyPECycles(627) cannot add 1 element to context";
                              goto LABEL_15;
                            case 628:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: maxSkinnyPECycles(628) cannot add 1 element to context";
                              goto LABEL_15;
                            case 629:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: averageSkinnyPECycles(629) cannot add 1 element to context";
                              goto LABEL_15;
                            case 630:
                              if ((_DWORD)v14 != 6) {
                                sub_100018D50( "ASPFTLParseBufferToCxt: raidSuccessfulRecoEAN(630): (#6) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: raidSuccessfulRecoEAN(630): Cannot add 6 elements to context";
                              goto LABEL_2247;
                            case 631:
                              if ((_DWORD)v14 != 6) {
                                sub_100018D50( "ASPFTLParseBufferToCxt: raidFailedRecoEAN(631): (#6) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: raidFailedRecoEAN(631): Cannot add 6 elements to context";
                              goto LABEL_2247;
                            case 632:
                              if ((_DWORD)v14 != 6) {
                                sub_100018D50( "ASPFTLParseBufferToCxt: eanFirstReadMode(632): (#6) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: eanFirstReadMode(632): Cannot add 6 elements to context";
                              goto LABEL_2247;
                            case 635:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: oslcHwGC(635) cannot add 1 element to context";
                              goto LABEL_15;
                            case 636:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: oslcHwTT(636) cannot add 1 element to context";
                              goto LABEL_15;
                            case 637:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: oslcHwNRP(637) cannot add 1 element to context";
                              goto LABEL_15;
                            case 638:
                              if ((_DWORD)v14 != 10) {
                                sub_100018D50( "ASPFTLParseBufferToCxt: oslcDemandBurstSize(638): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: oslcDemandBurstSize(638): Cannot add 10 elements to context";
                              goto LABEL_2247;
                            case 639:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: raidReconstructSuccessBandFlowOslc(639) cannot add 1 element to context";
                              goto LABEL_15;
                            case 640:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBandFlowOslc(640) cannot add 1 element to context";
                              goto LABEL_15;
                            case 641:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: raidFailSectors(641) cannot add 1 element to context";
                              goto LABEL_15;
                            case 642:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: eanFailSectors(642) cannot add 1 element to context";
                              goto LABEL_15;
                            case 643:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: bdrTimeMode(643) cannot add 1 element to context";
                              goto LABEL_15;
                            case 644:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: raidParityNotSavedP(644) cannot add 1 element to context";
                              goto LABEL_15;
                            case 645:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: raidParityNotSavedQ(645) cannot add 1 element to context";
                              goto LABEL_15;
                            case 646:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: raidParityInvalid(646) cannot add 1 element to context";
                              goto LABEL_15;
                            case 647:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: raidParityUnknown(647) cannot add 1 element to context";
                              goto LABEL_15;
                            case 648:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: raidParityUnmapped(648) cannot add 1 element to context";
                              goto LABEL_15;
                            case 649:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: raidParityGCUnc(649) cannot add 1 element to context";
                              goto LABEL_15;
                            case 657:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: AbortSkip_MPBXProbational(657) cannot add 1 element to context";
                              goto LABEL_15;
                            case 659:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: raidVerificationReads(659) cannot add 1 element to context";
                              goto LABEL_15;
                            case 666:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: nofDies(666) cannot add 1 element to context";
                              goto LABEL_15;
                            case 671:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: skinnyBandsNum(671) cannot add 1 element to context";
                              goto LABEL_15;
                            case 672:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: skinnyBandsNumDips(672) cannot add 1 element to context";
                              goto LABEL_15;
                            case 674:
                              if ((_DWORD)v14 != 8) {
                                sub_100018D50( "ASPFTLParseBufferToCxt: oslcNoVotesHw(674): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: oslcNoVotesHw(674): Cannot add 8 elements to context";
                              goto LABEL_2247;
                            case 675:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: totalLbas(675) cannot add 1 element to context";
                              goto LABEL_15;
                            case 676:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: bdrHostPingExtra(676) cannot add 1 element to context";
                              goto LABEL_15;
                            case 677:
                              uint64_t v19 = "ASPFTLParseBufferToCxt: magazineInstanceMeta(677) cannot add 1 element to context";
                              goto LABEL_15;
                            default:
                              switch(v12)
                              {
                                case 680:
                                  if ((_DWORD)v14 != 3) {
                                    sub_100018D50( "ASPFTLParseBufferToCxt: magazineFWVersion(680): (#3) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: magazineFWVersion(680): Cannot add 3 elements to context";
                                  goto LABEL_2247;
                                case 681:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailPMXUnsup(681) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 682:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBMXUnsup(682) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 683:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: iBootNANDResets(683) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 684:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: pcieClkreqHighTimeout(684) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 687:
                                  if ((_DWORD)v14 != 3) {
                                    sub_100018D50( "ASPFTLParseBufferToCxt: cbdrInitSent(687): (#3) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrInitSent(687): Cannot add 3 elements to context";
                                  goto LABEL_2247;
                                case 688:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: cbdrPauseSent(688) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 689:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: cbdrResumeSent(689) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 690:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: cbdrGetResultSent(690) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 691:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: cbdrEarlyExits(691) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 694:
                                  if ((_DWORD)v14 != 10) {
                                    sub_100018D50( "ASPFTLParseBufferToCxt: cbdrRefreshGrades(694): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrRefreshGrades(694): Cannot add 10 elements to context";
                                  goto LABEL_2247;
                                case 695:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: cbdrNotEnoughReads(695) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 696:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: cbdrAborts(696) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 697:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: TurboRaidHostClassifications(697) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 698:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: TurboRaidInternalClassifications(698) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 699:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: cbdrFullyDone(699) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 702:
                                  if ((_DWORD)v14 != 32) {
                                    sub_100018D50( "ASPFTLParseBufferToCxt: vcurve(702): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: vcurve(702): Cannot add 32 elements to context";
                                  goto LABEL_2247;
                                case 703:
                                  if ((_DWORD)v14 != 12) {
                                    sub_100018D50( "ASPFTLParseBufferToCxt: injDepth(703): (#12) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: injDepth(703): Cannot add 12 elements to context";
                                  goto LABEL_2247;
                                case 704:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: logical_disk_occupied_promiles(704) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 711:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: raidPrevFailedReconstructSkip(711) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 712:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: TurboRaidSuccessfulHostAuxReads(712) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 713:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: TurboRaidSuccessfulInternalAuxReads(713) cannot add 1 el"
                                        "ement to context";
                                  goto LABEL_15;
                                case 714:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: turboRaidClassificationReliabilityHost(714) cannot add 1"
                                        " element to context";
                                  goto LABEL_15;
                                case 715:
                                  if ((sub_100011E74( a1,  "turboRaidClassificationReliabilityInternal",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: turboRaidClassificationReliabilityInternal(715) cannot a"
                                        "dd 1 element to context";
                                  goto LABEL_15;
                                case 716:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: turboRaidClassificationQualityHost(716) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 717:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: turboRaidClassificationQualityInternal(717) cannot add 1"
                                        " element to context";
                                  goto LABEL_15;
                                case 719:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: skinnyBandErases(719) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 721:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: gcPDusterDestinations(721) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 722:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: gcPDusterWrites(722) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 730:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: rvFails(730) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 737:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: TurboRaidFailedHostAuxReads(737) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 738:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: TurboRaidFailedInternalAuxReads(738) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 741:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: autoSkipTriggers(741) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 742:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: autoSkipPlanes(742) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 744:
                                  if ((_DWORD)v14 != 8) {
                                    sub_100018D50( "ASPFTLParseBufferToCxt: raidReconstructDurationHisto(744): (#8) cfg elements != (% d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: raidReconstructDurationHisto(744): Cannot add 8 elements to context";
                                  goto LABEL_2247;
                                case 745:
                                  if ((_DWORD)v14 != 8) {
                                    sub_100018D50( "ASPFTLParseBufferToCxt: failsOnReconstructHisto(745): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: failsOnReconstructHisto(745): Cannot add 8 elements to context";
                                  goto LABEL_2247;
                                case 746:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: bandKill_userFlattenExcessive(746) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 747:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: bandKill_IntFlattenExcessive(747) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 748:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: bandKill_userFlattenBalance(748) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 749:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: bandKill_intFlattenBalance(749) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 750:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: bandKill_formatVertExcessive(750) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 751:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: bandKill_formatVertBalance(751) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 753:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: cbdrNumSlowRefreshes(753) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 754:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: cbdrNumFastRefreshes(754) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 755:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: cbdrTotalRefreshValidity(755) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 756:
                                  if ((_DWORD)v14 != 9) {
                                    sub_100018D50( "ASPFTLParseBufferToCxt: cbdrRefreshedAges(756): (#9) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrRefreshedAges(756): Cannot add 9 elements to context";
                                  goto LABEL_2247;
                                case 758:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: cbdrSkippedBlocks(758) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 759:
                                  if ((_DWORD)v14 != 5) {
                                    sub_100018D50( "ASPFTLParseBufferToCxt: cbdrScanPct(759): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrScanPct(759): Cannot add 5 elements to context";
                                  goto LABEL_2247;
                                case 760:
                                  if ((sub_100011E74( a1,  "raidSuccessfulBMXReconstructionInternal",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: raidSuccessfulBMXReconstructionInternal(760) cannot add "
                                        "1 element to context";
                                  goto LABEL_15;
                                case 761:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: raidSuccessfulBMXReconstructionHost(761) cannot add 1 el"
                                        "ement to context";
                                  goto LABEL_15;
                                case 762:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: raidFailedBMXReconstructionInternal(762) cannot add 1 el"
                                        "ement to context";
                                  goto LABEL_15;
                                case 763:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: raidFailedBMXReconstructionHost(763) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 764:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: ricSPRVFail(764) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 765:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: ricMPRVFail(765) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 767:
                                  if ((_DWORD)v14 != 10) {
                                    sub_100018D50( "ASPFTLParseBufferToCxt: cbdrRefreshGradesSLC(767): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrRefreshGradesSLC(767): Cannot add 10 elements to context";
                                  goto LABEL_2247;
                                case 768:
                                  if ((_DWORD)v14 != 9) {
                                    sub_100018D50( "ASPFTLParseBufferToCxt: cbdrRefreshedAgesSLC(768): (#9) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrRefreshedAgesSLC(768): Cannot add 9 elements to context";
                                  goto LABEL_2247;
                                case 769:
                                  if ((_DWORD)v14 != 5) {
                                    sub_100018D50( "ASPFTLParseBufferToCxt: cbdrScanPctSLC(769): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrScanPctSLC(769): Cannot add 5 elements to context";
                                  goto LABEL_2247;
                                case 770:
                                  if ((_DWORD)v14 != 8) {
                                    sub_100018D50( "ASPFTLParseBufferToCxt: cpuBurstLength(770): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cpuBurstLength(770): Cannot add 8 elements to context";
                                  goto LABEL_2247;
                                case 771:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: autoSkipRaidRecoFail(771) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 772:
                                  if ((_DWORD)v14 != 32) {
                                    sub_100018D50( "ASPFTLParseBufferToCxt: dmReasonsSlc(772): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: dmReasonsSlc(772): Cannot add 32 elements to context";
                                  goto LABEL_2247;
                                case 773:
                                  if ((_DWORD)v14 != 32) {
                                    sub_100018D50( "ASPFTLParseBufferToCxt: dmReasonsTlc(773): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: dmReasonsTlc(773): Cannot add 32 elements to context";
                                  goto LABEL_2247;
                                case 774:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBMXAbort(774) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 775:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: bandKill_fatBindingNoBlocks(775) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 776:
                                  uint64_t v19 = "ASPFTLParseBufferToCxt: bandKill_fatBindingFewBlocks(776) cannot add 1 element to context";
                                  goto LABEL_15;
                                default:
                                  switch(v12)
                                  {
                                    case 777:
                                      uint64_t v19 = "ASPFTLParseBufferToCxt: numBadBootBlocks(777) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 778:
                                      uint64_t v19 = "ASPFTLParseBufferToCxt: snapshotCPUHigh(778) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 779:
                                      uint64_t v19 = "ASPFTLParseBufferToCxt: snapshotCPULow(779) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 780:
                                      uint64_t v19 = "ASPFTLParseBufferToCxt: gcWithoutBMs(780) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 781:
                                      if ((_DWORD)v14 != 10) {
                                        sub_100018D50( "ASPFTLParseBufferToCxt: gcSearchTimeHistory(781): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: gcSearchTimeHistory(781): Cannot add 10 elements to context";
                                      goto LABEL_2247;
                                    case 785:
                                      if ((_DWORD)v14 != 16) {
                                        sub_100018D50( "ASPFTLParseBufferToCxt: gcSearchPortion(785): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: gcSearchPortion(785): Cannot add 16 elements to context";
                                      goto LABEL_2247;
                                    case 786:
                                      uint64_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBmxMp(786) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 787:
                                      uint64_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBmx(787) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 788:
                                      uint64_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBMXUECC(788) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 789:
                                      uint64_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBMXBlank(789) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 790:
                                      uint64_t v19 = "ASPFTLParseBufferToCxt: raidPrevFailedReconstructBmxMpSkip(790) cannot add 1"
                                            " element to context";
                                      goto LABEL_15;
                                    case 792:
                                      uint64_t v19 = "ASPFTLParseBufferToCxt: numTLCFatBands(792) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 793:
                                      uint64_t v19 = "ASPFTLParseBufferToCxt: fatValidity(793) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 794:
                                      uint64_t v19 = "ASPFTLParseBufferToCxt: fatTotal(794) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 798:
                                      if ((_DWORD)v14 != 4) {
                                        sub_100018D50( "ASPFTLParseBufferToCxt: raidBMXFailP(798): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailP(798): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 799:
                                      if ((_DWORD)v14 != 4) {
                                        sub_100018D50( "ASPFTLParseBufferToCxt: raidBMXFailUECC(799): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailUECC(799): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 804:
                                      if ((_DWORD)v14 != 4) {
                                        sub_100018D50( "ASPFTLParseBufferToCxt: raidBMXFailNoSPBX(804): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailNoSPBX(804): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 806:
                                      if ((_DWORD)v14 != 4) {
                                        sub_100018D50( "ASPFTLParseBufferToCxt: raidBMXFailBlank(806): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailBlank(806): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 809:
                                      if ((_DWORD)v14 != 4) {
                                        sub_100018D50( "ASPFTLParseBufferToCxt: raidBMXFailUnsup(809): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailUnsup(809): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 811:
                                      if ((_DWORD)v14 != 4) {
                                        sub_100018D50( "ASPFTLParseBufferToCxt: raidBMXFailMpSkip(811): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailMpSkip(811): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 812:
                                      if ((_DWORD)v14 != 4) {
                                        sub_100018D50( "ASPFTLParseBufferToCxt: raidBMXFailAbort(812): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailAbort(812): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 813:
                                      uint64_t v19 = "ASPFTLParseBufferToCxt: TurboRaidIsEnabled(813) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 814:
                                      if ((_DWORD)v14 != 4) {
                                        sub_100018D50( "ASPFTLParseBufferToCxt: raidBMXFailOther(814): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailOther(814): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 815:
                                      if ((_DWORD)v14 != 4) {
                                        sub_100018D50( "ASPFTLParseBufferToCxt: raidBMXSuccess(815): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXSuccess(815): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 816:
                                      uint64_t v19 = "ASPFTLParseBufferToCxt: skinnyBandsExtraDip(816) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 821:
                                      uint64_t v19 = "ASPFTLParseBufferToCxt: writeAmp(821) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 822:
                                      uint64_t v19 = "ASPFTLParseBufferToCxt: ricMaxClogOnlyPages(822) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 823:
                                      if ((_DWORD)v14 != 3) {
                                        sub_100018D50( "ASPFTLParseBufferToCxt: readClassifyStatusesHisto(823): (#3) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: readClassifyStatusesHisto(823): Cannot add 3 elements to context";
                                      goto LABEL_2247;
                                    case 824:
                                      if ((_DWORD)v14 != 10) {
                                        sub_100018D50( "ASPFTLParseBufferToCxt: readWithAuxStatusesHisto(824): (#10) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: readWithAuxStatusesHisto(824): Cannot add 10 elements to context";
                                      goto LABEL_2247;
                                    case 825:
                                      if ((_DWORD)v14 != 10) {
                                        sub_100018D50( "ASPFTLParseBufferToCxt: readReconstructStatusesHisto(825): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: readReconstructStatusesHisto(825): Cannot add 10 ele"
                                            "ments to context";
                                      goto LABEL_2247;
                                    case 826:
                                      uint64_t v19 = "ASPFTLParseBufferToCxt: bdrBackupChecks(826) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 827:
                                      uint64_t v19 = "ASPFTLParseBufferToCxt: ricExceedClogOnlyPagesTH(827) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 828:
                                      uint64_t v19 = "ASPFTLParseBufferToCxt: numDipFailures(828) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 831:
                                      uint64_t v19 = "ASPFTLParseBufferToCxt: prefetchNextRange(831) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 862:
                                      uint64_t v19 = "ASPFTLParseBufferToCxt: raidSuccessfulSkip(862) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 863:
                                      uint64_t v19 = "ASPFTLParseBufferToCxt: raidFailedSkip(863) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 864:
                                      uint64_t v19 = "ASPFTLParseBufferToCxt: raidSkipAttempts(864) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 865:
                                      if ((_DWORD)v14 != 16) {
                                        sub_100018D50( "ASPFTLParseBufferToCxt: timeOfThrottlingPerLevel(865): (#16) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: timeOfThrottlingPerLevel(865): Cannot add 16 elements to context";
                                      goto LABEL_2247;
                                    case 866:
                                      if ((_DWORD)v14 != 16) {
                                        sub_100018D50( "ASPFTLParseBufferToCxt: timeOfThrottlingPerReadLevel(866): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: timeOfThrottlingPerReadLevel(866): Cannot add 16 ele"
                                            "ments to context";
                                      goto LABEL_2247;
                                    case 867:
                                      if ((_DWORD)v14 != 16) {
                                        sub_100018D50( "ASPFTLParseBufferToCxt: timeOfThrottlingPerWriteLevel(867): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: timeOfThrottlingPerWriteLevel(867): Cannot add 16 el"
                                            "ements to context";
                                      goto LABEL_2247;
                                    case 868:
                                      if ((_DWORD)v14 != 32) {
                                        sub_100018D50( "ASPFTLParseBufferToCxt: dmReasonsSlc_1bc(868): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: dmReasonsSlc_1bc(868): Cannot add 32 elements to context";
                                      goto LABEL_2247;
                                    case 869:
                                      if ((_DWORD)v14 != 32) {
                                        sub_100018D50( "ASPFTLParseBufferToCxt: dmReasonsTlc_1bc(869): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: dmReasonsTlc_1bc(869): Cannot add 32 elements to context";
                                      goto LABEL_2247;
                                    case 870:
                                      if ((_DWORD)v14 != 32) {
                                        sub_100018D50( "ASPFTLParseBufferToCxt: dmReasonsSlc_1bc_he(870): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: dmReasonsSlc_1bc_he(870): Cannot add 32 elements to context";
                                      goto LABEL_2247;
                                    case 871:
                                      if ((_DWORD)v14 != 32) {
                                        sub_100018D50( "ASPFTLParseBufferToCxt: dmReasonsTlc_1bc_he(871): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: dmReasonsTlc_1bc_he(871): Cannot add 32 elements to context";
                                      goto LABEL_2247;
                                    case 876:
                                      if ((_DWORD)v14 != 32) {
                                        sub_100018D50( "ASPFTLParseBufferToCxt: dmReasonsSlc_mbc(876): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: dmReasonsSlc_mbc(876): Cannot add 32 elements to context";
                                      goto LABEL_2247;
                                    case 877:
                                      if ((_DWORD)v14 != 32) {
                                        sub_100018D50( "ASPFTLParseBufferToCxt: dmReasonsTlc_mbc(877): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: dmReasonsTlc_mbc(877): Cannot add 32 elements to context";
                                      goto LABEL_2247;
                                    case 883:
                                      uint64_t v19 = "ASPFTLParseBufferToCxt: clogEmptyProgramms(883) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 884:
                                      uint64_t v19 = "ASPFTLParseBufferToCxt: oslcHwCloseBand(884) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 891:
                                      if ((_DWORD)v14 != 2) {
                                        sub_100018D50( "ASPFTLParseBufferToCxt: turboRaidSuccessAuxPartition(891): (#2) cfg elements ! = (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: turboRaidSuccessAuxPartition(891): Cannot add 2 elements to context";
                                      goto LABEL_2247;
                                    case 892:
                                      if ((_DWORD)v14 != 2) {
                                        sub_100018D50( "ASPFTLParseBufferToCxt: turboRaidFailAuxPartition(892): (#2) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: turboRaidFailAuxPartition(892): Cannot add 2 elements to context";
                                      goto LABEL_2247;
                                    case 893:
                                      if ((_DWORD)v14 != 2) {
                                        sub_100018D50( "ASPFTLParseBufferToCxt: turboRaidClassifyQualPartition(893): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: turboRaidClassifyQualPartition(893): Cannot add 2 el"
                                            "ements to context";
                                      goto LABEL_2247;
                                    case 894:
                                      if ((_DWORD)v14 != 2) {
                                        sub_100018D50( "ASPFTLParseBufferToCxt: turboRaidClassifyRelPartition(894): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: turboRaidClassifyRelPartition(894): Cannot add 2 ele"
                                            "ments to context";
                                      goto LABEL_2247;
                                    case 895:
                                      uint64_t v19 = "ASPFTLParseBufferToCxt: IND_pool_freeMinSilo(895) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 896:
                                      uint64_t v19 = "ASPFTLParseBufferToCxt: autoSweepBlocks(896) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 897:
                                      if ((_DWORD)v14 != 16) {
                                        sub_100018D50( "ASPFTLParseBufferToCxt: wcWrFragSizes(897): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: wcWrFragSizes(897): Cannot add 16 elements to context";
                                      goto LABEL_2247;
                                    case 898:
                                      if ((_DWORD)v14 != 16) {
                                        sub_100018D50( "ASPFTLParseBufferToCxt: indStateAcrossGcDidNoL(898): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: indStateAcrossGcDidNoL(898): Cannot add 16 elements to context";
                                      goto LABEL_2247;
                                    case 899:
                                      if ((_DWORD)v14 != 16) {
                                        sub_100018D50( "ASPFTLParseBufferToCxt: indStateAcrossGcDidL(899): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: indStateAcrossGcDidL(899): Cannot add 16 elements to context";
                                      goto LABEL_2247;
                                    case 900:
                                      uint64_t v19 = "ASPFTLParseBufferToCxt: turboRaidNoClassifyDueToWasRetire(900) cannot add 1 "
                                            "element to context";
                                      goto LABEL_15;
                                    case 901:
                                      uint64_t v19 = "ASPFTLParseBufferToCxt: turboRaidNoClassifyDueToOpenBand(901) cannot add 1 e"
                                            "lement to context";
                                      goto LABEL_15;
                                    case 902:
                                      if ((sub_100011E74( a1,  "turboRaidNoClassifyDueToQualityBlock",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                        goto LABEL_16;
                                      }
                                      uint64_t v19 = "ASPFTLParseBufferToCxt: turboRaidNoClassifyDueToQualityBlock(902) cannot add"
                                            " 1 element to context";
                                      goto LABEL_15;
                                    case 903:
                                      uint64_t v19 = "ASPFTLParseBufferToCxt: turboRaidGbbOpenBand(903) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 904:
                                      uint64_t v19 = "ASPFTLParseBufferToCxt: turboRaidGbbShouldRetireOnRefresh(904) cannot add 1 "
                                            "element to context";
                                      goto LABEL_15;
                                    case 905:
                                      if ((_DWORD)v14 != 16) {
                                        sub_100018D50( "ASPFTLParseBufferToCxt: turboRaidRelPerBlock(905): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: turboRaidRelPerBlock(905): Cannot add 16 elements to context";
                                      goto LABEL_2247;
                                    case 906:
                                      if ((_DWORD)v14 != 16) {
                                        sub_100018D50( "ASPFTLParseBufferToCxt: turboRaidRelBetweenRefreshesPerBlock(906): (#16) cfg e lements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((sub_100011E74( a1,  "turboRaidRelBetweenRefreshesPerBlock_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: turboRaidRelBetweenRefreshesPerBlock(906): Cannot ad"
                                            "d 16 elements to context";
                                      goto LABEL_2247;
                                    default:
                                      if (v12 <= 1039)
                                      {
                                        switch(v12)
                                        {
                                          case 907:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: turboRaidMaxRelBetweenRefreshesPerBlock(907): (# 16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100011E74( a1,  "turboRaidMaxRelBetweenRefreshesPerBlock_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidMaxRelBetweenRefreshesPerBlock(907): "
                                                  "Cannot add 16 elements to context";
                                            goto LABEL_2247;
                                          case 908:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: turboRaidMinRelBetweenRefreshesPerBlock(908): (# 16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100011E74( a1,  "turboRaidMinRelBetweenRefreshesPerBlock_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidMinRelBetweenRefreshesPerBlock(908): "
                                                  "Cannot add 16 elements to context";
                                            goto LABEL_2247;
                                          case 909:
                                          case 910:
                                          case 911:
                                          case 912:
                                          case 913:
                                          case 914:
                                          case 915:
                                          case 916:
                                          case 917:
                                          case 924:
                                          case 925:
                                          case 926:
                                          case 927:
                                          case 928:
                                          case 929:
                                          case 936:
                                          case 941:
                                          case 945:
                                          case 946:
                                          case 947:
                                          case 949:
                                          case 950:
                                          case 952:
                                          case 954:
                                          case 955:
                                          case 956:
                                          case 957:
                                          case 958:
                                          case 959:
                                          case 960:
                                          case 963:
                                          case 964:
                                          case 965:
                                          case 966:
                                          case 968:
                                          case 969:
                                          case 970:
                                            goto LABEL_2110;
                                          case 918:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: turboRaidMaxCyclesBetweenRel(918): (#16) cfg ele ments != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100011E74( a1,  "turboRaidMaxCyclesBetweenRel_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidMaxCyclesBetweenRel(918): Cannot add "
                                                  "16 elements to context";
                                            goto LABEL_2247;
                                          case 919:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: turboRaidMinCyclesBetweenRel(919): (#16) cfg ele ments != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100011E74( a1,  "turboRaidMinCyclesBetweenRel_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidMinCyclesBetweenRel(919): Cannot add "
                                                  "16 elements to context";
                                            goto LABEL_2247;
                                          case 920:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: turboRaidAuxPerBlock(920): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidAuxPerBlock(920): Cannot add 16 elements to context";
                                            goto LABEL_2247;
                                          case 921:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: turboRaidAuxBetweenRefreshesPerBlock(921): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100011E74( a1,  "turboRaidAuxBetweenRefreshesPerBlock_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidAuxBetweenRefreshesPerBlock(921): Can"
                                                  "not add 16 elements to context";
                                            goto LABEL_2247;
                                          case 922:
                                            uint64_t v19 = "ASPFTLParseBufferToCxt: turboRaidRelLockMark(922) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 923:
                                            uint64_t v19 = "ASPFTLParseBufferToCxt: turboRaidAuxLockMark(923) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 930:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: turboRaidMaxCyclesBetweenAux(930): (#16) cfg ele ments != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100011E74( a1,  "turboRaidMaxCyclesBetweenAux_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidMaxCyclesBetweenAux(930): Cannot add "
                                                  "16 elements to context";
                                            goto LABEL_2247;
                                          case 931:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: turboRaidMinCyclesBetweenAux(931): (#16) cfg ele ments != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100011E74( a1,  "turboRaidMinCyclesBetweenAux_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidMinCyclesBetweenAux(931): Cannot add "
                                                  "16 elements to context";
                                            goto LABEL_2247;
                                          case 932:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: turboRaidLastRelPECycles(932): (#16) cfg element s != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidLastRelPECycles(932): Cannot add 16 e"
                                                  "lements to context";
                                            goto LABEL_2247;
                                          case 933:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: turboRaidRelQualPECycles(933): (#16) cfg element s != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidRelQualPECycles(933): Cannot add 16 e"
                                                  "lements to context";
                                            goto LABEL_2247;
                                          case 934:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: turboRaidLastAuxPECycles(934): (#16) cfg element s != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidLastAuxPECycles(934): Cannot add 16 e"
                                                  "lements to context";
                                            goto LABEL_2247;
                                          case 935:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: turboRaidAuxQualPECycles(935): (#16) cfg element s != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidAuxQualPECycles(935): Cannot add 16 e"
                                                  "lements to context";
                                            goto LABEL_2247;
                                          case 937:
                                            uint64_t v19 = "ASPFTLParseBufferToCxt: turboRaidPEFailAfterRel(937) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 938:
                                            uint64_t v19 = "ASPFTLParseBufferToCxt: turboRaidPEFailAfterAux(938) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 939:
                                            uint64_t v19 = "ASPFTLParseBufferToCxt: dvfmVotesCPU(939) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 940:
                                            uint64_t v19 = "ASPFTLParseBufferToCxt: dvfmVotesBandwidth(940) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 942:
                                            uint64_t v19 = "ASPFTLParseBufferToCxt: maxSLCEndurance(942) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 943:
                                            uint64_t v19 = "ASPFTLParseBufferToCxt: maxMixedEndurance(943) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 944:
                                            uint64_t v19 = "ASPFTLParseBufferToCxt: maxNativeEndurance(944) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 948:
                                            if ((_DWORD)v14 != 40) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: assertHistory(948): (#40) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: assertHistory(948): Cannot add 40 elements to context";
                                            goto LABEL_2247;
                                          case 951:
                                            uint64_t v19 = "ASPFTLParseBufferToCxt: asp3Support(951) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 953:
                                            uint64_t v19 = "ASPFTLParseBufferToCxt: numCrossTempRaidUecc(953) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 961:
                                            uint64_t v19 = "ASPFTLParseBufferToCxt: osBuildStr(961) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 962:
                                            uint64_t v19 = "ASPFTLParseBufferToCxt: raidConfig(962) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 967:
                                            if ((_DWORD)v14 != 12) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: indTrimFrags(967): (#12) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: indTrimFrags(967): Cannot add 12 elements to context";
                                            goto LABEL_2247;
                                          case 971:
                                            if ((_DWORD)v14 != 12) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: indUsedFrags(971): (#12) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: indUsedFrags(971): Cannot add 12 elements to context";
                                            goto LABEL_2247;
                                          default:
                                            switch(v12)
                                            {
                                              case 996:
                                                uint64_t v19 = "ASPFTLParseBufferToCxt: clogFindFail(996) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 997:
                                                uint64_t v19 = "ASPFTLParseBufferToCxt: clogFindBlank(997) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 998:
                                                uint64_t v19 = "ASPFTLParseBufferToCxt: clogFindUnc(998) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 999:
                                                uint64_t v19 = "ASPFTLParseBufferToCxt: clogFindUnexpected(999) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 1001:
                                                if ((_DWORD)v14 != 8) {
                                                  sub_100018D50( "ASPFTLParseBufferToCxt: clogReplayFailReason(1001): (#8) cfg element s != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                                }
                                                else {
                                                  unsigned int v20 = v14;
                                                }
                                                int v22 = "ASPFTLParseBufferToCxt: clogReplayFailReason(1001): Cannot add 8 e"
                                                      "lements to context";
                                                goto LABEL_2247;
                                              case 1002:
                                                uint64_t v19 = "ASPFTLParseBufferToCxt: clogReplayTransientError(1002) cannot add "
                                                      "1 element to context";
                                                goto LABEL_15;
                                              case 1003:
                                                uint64_t v19 = "ASPFTLParseBufferToCxt: clogReplaySpfError(1003) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 1015:
                                                if ((_DWORD)v14 != 4) {
                                                  sub_100018D50( "ASPFTLParseBufferToCxt: eanEarlyBootUeccPage(1015): (#4) cfg element s != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                                }
                                                else {
                                                  unsigned int v20 = v14;
                                                }
                                                int v22 = "ASPFTLParseBufferToCxt: eanEarlyBootUeccPage(1015): Cannot add 4 e"
                                                      "lements to context";
                                                goto LABEL_2247;
                                              case 1016:
                                                uint64_t v19 = "ASPFTLParseBufferToCxt: eanEarlyBootNumUeccPages(1016) cannot add "
                                                      "1 element to context";
                                                goto LABEL_15;
                                              case 1017:
                                                if ((sub_100011E74( a1,  "eanEarlyBootUeccMultiplane",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                                  goto LABEL_16;
                                                }
                                                uint64_t v19 = "ASPFTLParseBufferToCxt: eanEarlyBootUeccMultiplane(1017) cannot ad"
                                                      "d 1 element to context";
                                                goto LABEL_15;
                                              default:
                                                goto LABEL_2110;
                                            }
                                        }
                                      }

                                      if (v12 > 1137)
                                      {
                                        switch(v12)
                                        {
                                          case 1147:
                                            if ((_DWORD)v14 != 24) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc12(1147): (#24) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc12(1147): Cannot add 24 ele"
                                                  "ments to context";
                                            goto LABEL_2247;
                                          case 1148:
                                            if ((_DWORD)v14 != 24) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc1(1148): (#24) cfg elements ! = (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc1(1148): Cannot add 24 elements to context";
                                            goto LABEL_2247;
                                          case 1149:
                                            if ((_DWORD)v14 != 24) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc2(1149): (#24) cfg elements ! = (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc2(1149): Cannot add 24 elements to context";
                                            goto LABEL_2247;
                                          case 1150:
                                          case 1151:
                                          case 1152:
                                          case 1153:
                                          case 1154:
                                          case 1155:
                                          case 1156:
                                          case 1159:
                                          case 1160:
                                          case 1161:
                                          case 1162:
                                          case 1163:
                                          case 1164:
                                          case 1165:
                                          case 1166:
                                          case 1167:
                                          case 1170:
                                          case 1173:
                                          case 1174:
                                          case 1175:
                                          case 1176:
                                          case 1177:
                                          case 1178:
                                            goto LABEL_2110;
                                          case 1157:
                                            uint64_t v19 = "ASPFTLParseBufferToCxt: eanMaxForceROTimeMs(1157) cannot add 1 element to context";
                                            break;
                                          case 1158:
                                            uint64_t v19 = "ASPFTLParseBufferToCxt: eanMaxForceRORecoTimeMs(1158) cannot add 1 element to context";
                                            break;
                                          case 1168:
                                            if ((_DWORD)v14 != 2) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: poDetectPERemovalTotalCost(1168): (#2) cfg eleme nts != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectPERemovalTotalCost(1168): Cannot add 2"
                                                  " elements to context";
                                            goto LABEL_2247;
                                          case 1169:
                                            if ((_DWORD)v14 != 2) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: poDetectEmptySpotRemovalTotalCost(1169): (#2) cf g elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100011E74( a1,  "poDetectEmptySpotRemovalTotalCost_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectEmptySpotRemovalTotalCost(1169): Canno"
                                                  "t add 2 elements to context";
                                            goto LABEL_2247;
                                          case 1171:
                                            if ((_DWORD)v14 != 10) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: poDetectEmptySpotRemovalAge(1171): (#10) cfg ele ments != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100011E74( a1,  "poDetectEmptySpotRemovalAge_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectEmptySpotRemovalAge(1171): Cannot add "
                                                  "10 elements to context";
                                            goto LABEL_2247;
                                          case 1172:
                                            if ((_DWORD)v14 != 3) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: poDetectGBBedMostSevereCost(1172): (#3) cfg elem ents != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100011E74( a1,  "poDetectGBBedMostSevereCost_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectGBBedMostSevereCost(1172): Cannot add "
                                                  "3 elements to context";
                                            goto LABEL_2247;
                                          case 1179:
                                            if ((_DWORD)v14 != 4) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: gc_cur_dw_gc1(1179): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_cur_dw_gc1(1179): Cannot add 4 elements to context";
                                            goto LABEL_2247;
                                          case 1180:
                                            if ((_DWORD)v14 != 4) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: gc_cur_dw_gc2(1180): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_cur_dw_gc2(1180): Cannot add 4 elements to context";
                                            goto LABEL_2247;
                                          case 1181:
                                            if ((_DWORD)v14 != 4) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: gc_cur_dw_gc3(1181): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_cur_dw_gc3(1181): Cannot add 4 elements to context";
                                            goto LABEL_2247;
                                          case 1182:
                                            if ((_DWORD)v14 != 4) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: gc_tot_dw_gc1(1182): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_tot_dw_gc1(1182): Cannot add 4 elements to context";
                                            goto LABEL_2247;
                                          case 1183:
                                            if ((_DWORD)v14 != 4) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: gc_tot_dw_gc2(1183): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_tot_dw_gc2(1183): Cannot add 4 elements to context";
                                            goto LABEL_2247;
                                          case 1184:
                                            uint64_t v19 = "ASPFTLParseBufferToCxt: unhappy_state(1184) cannot add 1 element to context";
                                            break;
                                          case 1185:
                                            uint64_t v19 = "ASPFTLParseBufferToCxt: unhappy_level(1185) cannot add 1 element to context";
                                            break;
                                          default:
                                            if (v12 != 1138)
                                            {
                                              if (v12 != 1189) {
                                                goto LABEL_2110;
                                              }
                                              if ((sub_100011E74(a1, "lastLbaFormatTime", (uint64_t)v8, 8u, 1u) & 1) == 0)
                                              {
                                                uint64_t v19 = "ASPFTLParseBufferToCxt: lastLbaFormatTime(1189) cannot add 1 element to context";
                                                break;
                                              }

                                              goto LABEL_16;
                                            }

                                            uint64_t v19 = "ASPFTLParseBufferToCxt: numOfToHappySwitches(1138) cannot add 1 element to context";
                                            break;
                                        }

LABEL_16:
                                          uint64_t v10 = (v10 + 1);
                                          goto LABEL_17;
                                        }

                                        goto LABEL_2110;
                                      }

                                      if (v12 > 1115)
                                      {
                                        if (v12 == 1116)
                                        {
                                          if ((_DWORD)v14 != 32) {
                                            sub_100018D50( "ASPFTLParseBufferToCxt: gcwamp(1116): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                          }
                                          else {
                                            unsigned int v20 = v14;
                                          }
                                          if ((sub_100011E74(a1, "gcwamp_", (uint64_t)v8, 8u, v20) & 1) == 0)
                                          {
                                            int v22 = "ASPFTLParseBufferToCxt: gcwamp(1116): Cannot add 32 elements to context";
                                            goto LABEL_2247;
                                          }

                                          goto LABEL_14;
                                        }

                                        if (v12 == 1137)
                                        {
                                          uint64_t v19 = "ASPFTLParseBufferToCxt: numOfToUnhappySwitches(1137) cannot add 1 element to context";
                                          goto LABEL_15;
                                        }

LABEL_2110:
                                        switch(v12)
                                        {
                                          case 1196:
                                            if ((_DWORD)v14 != 5) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: poDetectGBBedTotalCost(1196): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectGBBedTotalCost(1196): Cannot add 5 ele"
                                                  "ments to context";
                                            goto LABEL_2247;
                                          case 1197:
                                            if ((_DWORD)v14 != 10) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: poDetectGBBedAge(1197): (#10) cfg elements != (% d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectGBBedAge(1197): Cannot add 10 elements to context";
                                            goto LABEL_2247;
                                          case 1198:
                                            if ((_DWORD)v14 != 3) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: poDetectPERemovalMostSevereCost(1198): (#3) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100011E74( a1,  "poDetectPERemovalMostSevereCost_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectPERemovalMostSevereCost(1198): Cannot "
                                                  "add 3 elements to context";
                                            goto LABEL_2247;
                                          case 1199:
                                            uint64_t v19 = "ASPFTLParseBufferToCxt: poDetectCurrentSize(1199) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 1200:
                                          case 1203:
                                          case 1204:
                                          case 1205:
                                          case 1206:
                                          case 1207:
                                          case 1208:
                                          case 1209:
                                          case 1210:
                                          case 1212:
                                          case 1213:
                                          case 1214:
                                          case 1219:
                                          case 1220:
                                          case 1221:
                                          case 1222:
                                          case 1223:
LABEL_2242:
                                            else {
                                              snprintf(__str, 0x20uLL, "Stat_%d_");
                                            }
                                            if ((sub_100011E74(a1, __str, (uint64_t)v8, 8u, v14) & 1) == 0)
                                            {
                                              sub_100018D50( "ASPFTLParseBufferToCxt %d: Cannot add %d elements to context",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v12);
                                              return v10;
                                            }

                                            uint64_t v10 = (v10 + v14);
                                            break;
                                          case 1201:
                                            if ((_DWORD)v14 != 4) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: gcVerticalSuccssfulAlignments(1201): (#4) cfg el ements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100011E74( a1,  "gcVerticalSuccssfulAlignments_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gcVerticalSuccssfulAlignments(1201): Cannot ad"
                                                  "d 4 elements to context";
                                            goto LABEL_2247;
                                          case 1202:
                                            if ((_DWORD)v14 != 4) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: gcVerticalNoAlignmentDueToMissingSegs(1202): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100011E74( a1,  "gcVerticalNoAlignmentDueToMissingSegs_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gcVerticalNoAlignmentDueToMissingSegs(1202): C"
                                                  "annot add 4 elements to context";
                                            goto LABEL_2247;
                                          case 1211:
                                            if ((_DWORD)v14 != 24) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: forcedAllocationSmallEraseQ(1211): (#24) cfg ele ments != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100011E74( a1,  "forcedAllocationSmallEraseQ_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: forcedAllocationSmallEraseQ(1211): Cannot add "
                                                  "24 elements to context";
                                            goto LABEL_2247;
                                          case 1215:
                                            if ((_DWORD)v14 != 5) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: hostWritesPerThrottleZone(1215): (#5) cfg elemen ts != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: hostWritesPerThrottleZone(1215): Cannot add 5 "
                                                  "elements to context";
                                            goto LABEL_2247;
                                          case 1216:
                                            if ((_DWORD)v14 != 24) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: tlcWLPerDipAvgPEC(1216): (#24) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: tlcWLPerDipAvgPEC(1216): Cannot add 24 elements to context";
                                            goto LABEL_2247;
                                          case 1217:
                                            if ((_DWORD)v14 != 24) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: tlcWLPerDipMaxPEC(1217): (#24) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: tlcWLPerDipMaxPEC(1217): Cannot add 24 elements to context";
                                            goto LABEL_2247;
                                          case 1218:
                                            if ((_DWORD)v14 != 24) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: tlcWLPerDipMinPEC(1218): (#24) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: tlcWLPerDipMinPEC(1218): Cannot add 24 elements to context";
                                            goto LABEL_2247;
                                          case 1224:
                                            if ((_DWORD)v14 != 20) {
                                              sub_100018D50( "ASPFTLParseBufferToCxt: apfsValidLbaOvershoot(1224): (#20) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: apfsValidLbaOvershoot(1224): Cannot add 20 ele"
                                                  "ments to context";
                                            goto LABEL_2247;
                                          default:
                                            switch(v12)
                                            {
                                              case 1232:
                                                uint64_t v19 = "ASPFTLParseBufferToCxt: eanFastSize(1232) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 1233:
                                                uint64_t v19 = "ASPFTLParseBufferToCxt: eanNumSlcEvictions(1233) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 1234:
                                                uint64_t v19 = "ASPFTLParseBufferToCxt: eanNumForcedCompress(1234) cannot add 1 el"
                                                      "ement to context";
                                                goto LABEL_15;
                                              case 1235:
                                              case 1236:
                                              case 1237:
                                              case 1238:
                                              case 1239:
                                              case 1240:
                                              case 1242:
                                              case 1243:
                                              case 1245:
                                                goto LABEL_2242;
                                              case 1241:
                                                if ((_DWORD)v14 != 10) {
                                                  sub_100018D50( "ASPFTLParseBufferToCxt: s2rTimeHisto(1241): (#10) cfg elements != (% d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                                }
                                                else {
                                                  unsigned int v20 = v14;
                                                }
                                                int v22 = "ASPFTLParseBufferToCxt: s2rTimeHisto(1241): Cannot add 10 elements to context";
                                                goto LABEL_2247;
                                              case 1244:
                                                uint64_t v19 = "ASPFTLParseBufferToCxt: calendarTimeWentBackward(1244) cannot add "
                                                      "1 element to context";
                                                goto LABEL_15;
                                              case 1246:
                                                if ((_DWORD)v14 != 8) {
                                                  sub_100018D50( "ASPFTLParseBufferToCxt: bandsUeccCrossTempHisto(1246): (#8) cfg elem ents != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                                }
                                                else {
                                                  unsigned int v20 = v14;
                                                }
                                                if ((sub_100011E74( a1,  "bandsUeccCrossTempHisto_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                                  goto LABEL_14;
                                                }
                                                int v22 = "ASPFTLParseBufferToCxt: bandsUeccCrossTempHisto(1246): Cannot add "
                                                      "8 elements to context";
                                                goto LABEL_2247;
                                              default:
                                                if (v12 != 1190) {
                                                  goto LABEL_2242;
                                                }
                                                if ((_DWORD)v14 != 12) {
                                                  sub_100018D50( "ASPFTLParseBufferToCxt: powerDownTime(1190): (#12) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                                }
                                                else {
                                                  unsigned int v20 = v14;
                                                }
                                                int v22 = "ASPFTLParseBufferToCxt: powerDownTime(1190): Cannot add 12 elements to context";
                                                break;
                                            }

                                            goto LABEL_2247;
                                        }

LABEL_17:
                                        v8 += v14;
                                        v11 -= v14;
                                        goto LABEL_2;
                                      }

                                      if (v12 == 1105)
                                      {
                                        if ((_DWORD)v14 != 14) {
                                          sub_100018D50( "ASPFTLParseBufferToCxt: hostReadSequential(1105): (#14) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                        }
                                        else {
                                          unsigned int v20 = v14;
                                        }
                                        if ((sub_100011E74(a1, "hostReadSequential_", (uint64_t)v8, 8u, v20) & 1) == 0)
                                        {
                                          int v22 = "ASPFTLParseBufferToCxt: hostReadSequential(1105): Cannot add 14 elements to context";
                                          goto LABEL_2247;
                                        }

                                        goto LABEL_14;
                                      }

                                      if (v12 != 1106) {
                                        goto LABEL_2110;
                                      }
                                      if ((_DWORD)v14 != 14) {
                                        sub_100018D50( "ASPFTLParseBufferToCxt: GCReadSequential(1106): (#14) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((sub_100011E74(a1, "GCReadSequential_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                      {
LABEL_14:
                                        uint64_t v10 = v20 + v10;
                                        goto LABEL_17;
                                      }

                                      int v22 = "ASPFTLParseBufferToCxt: GCReadSequential(1106): Cannot add 14 elements to context";
LABEL_2247:
                                      sub_100018D50(v22, a2, a3, a4, a5, a6, a7, a8, v23);
                                      return v10;
                                  }
                              }
                          }
                      }
                  }
              }
          }
      }
  }

uint64_t sub_100011E74(uint64_t a1, const char *a2, uint64_t a3, unsigned int a4, unsigned int a5)
{
  uint64_t v14 = 0LL;
  uint64_t v5 = 1LL;
  if (a4 && a5)
  {
    if (a5 == 1)
    {
      if (a4 <= 8)
      {
        __memmove_chk(&v14, a3, a4, 8LL);
        return sub_100018908(a1, "", a2, v14);
      }

      else
      {
        return 0LL;
      }
    }

    else
    {
      int v11 = 0;
      int v12 = 0;
      do
      {
        uint64_t v14 = 0LL;
        if (a4 <= 8)
        {
          __memmove_chk(&v14, a3 + v11 * a4, a4, 8LL);
          snprintf(__str, 0x64uLL, "%d", v11);
          __str[100] = 0;
          uint64_t v5 = sub_100018908(a1, a2, __str, v14) & v5;
        }

        else
        {
          uint64_t v5 = 0LL;
        }

        int v11 = (unsigned __int16)++v12;
      }

      while ((unsigned __int16)v12 < a5);
    }
  }

  return v5;
}

uint64_t sub_100011FD4(uint64_t a1, unint64_t *a2, unsigned int a3)
{
  uint64_t v5 = 0LL;
  unsigned int v6 = a3 >> 3;
  *(_OWORD *)__str = 0u;
  __int128 v22 = 0u;
LABEL_2:
  int v7 = -v6;
  while (v7)
  {
    unint64_t v9 = *a2++;
    unsigned int v8 = v9;
    unint64_t v10 = HIDWORD(v9);
    ++v7;
    if (HIDWORD(v9))
    {
      if (v8 != 0xFFFF && v8 <= 0x30000000 && -v7 >= v10)
      {
        else {
          snprintf(__str, 0x20uLL, "Stat_%d_");
        }
        if ((sub_100011E74(a1, __str, (uint64_t)a2, 8u, v10) & 1) != 0)
        {
          uint64_t v5 = (v5 + v10);
          a2 += v10;
          unsigned int v6 = -v7 - v10;
          goto LABEL_2;
        }

        sub_100018D50( "ASPFTLParseBufferToCxt %d: Cannot add %d elements to context",  v13,  v14,  v15,  v16,  v17,  v18,  v19,  v8);
      }

      return v5;
    }
  }

  return v5;
}

uint64_t sub_1000120FC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = 0LL;
  unint64_t v9 = "ASPMSPParseBufferToCxt: Passed in invalid buffer or empty buffer";
  if (!a2) {
    goto LABEL_1981;
  }
  unsigned int v10 = a3;
  if (!(_DWORD)a3) {
    goto LABEL_1981;
  }
  uint64_t v11 = a2;
  uint64_t v8 = 0LL;
  uint64_t v13 = &jpt_100016250;
  uint64_t v14 = "ASPMSPParseBufferToCxt: fs1_4b_fail(4279): Error adding 4 elements to context";
  unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_5(4256): Error adding 10 elements to context";
  while (1)
  {
    do
    {
      if (!v10) {
        return v8;
      }
      uint64_t v15 = (unsigned __int16 *)v11;
      uint64_t v16 = *(unsigned __int16 *)(v11 + 2);
      v11 += 4LL;
      v10 -= 4;
    }

    while (!(_DWORD)v16);
    int v17 = *v15;
    if (v17 != 12286) {
      break;
    }
LABEL_461:
    v11 += v16;
    v10 -= v16;
  }

  switch(v17)
  {
    case 4096:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: passWithTmodeHard(4096): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeHard(4096): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4097:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: passWithTmodeFS1_2b(4097): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeFS1_2b(4097): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4098:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: passWithTmodeFS1_4b(4098): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeFS1_4b(4098): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4099:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: passWithTmodeHard_fast(4099): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeHard_fast(4099): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4100:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: passWithTmodeFS1_2b_fast(4100): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeFS1_2b_fast(4100): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4101:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: passWithTmodeFS1_4b_fast(4101): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeFS1_4b_fast(4101): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4102:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: numOfCwFailedInTmodeFS2_EOL(4102): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: numOfCwFailedInTmodeFS2_EOL(4102): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4103:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: numOfCwFailedInTmodeFS2_DSP_EOL(4103): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: numOfCwFailedInTmodeFS2_DSP_EOL(4103): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4104:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterAcq(4104): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterAcq(4104): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4105:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: firstReadWasHardWithDefaultBDBFastRead(4105): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: firstReadWasHardWithDefaultBDBFastRead(4105): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4106:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readalgoPassWithDS1(4106): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDS1(4106): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4107:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readalgoPassWithDYCE1(4107): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDYCE1(4107): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4108:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readalgoPassWithDS2(4108): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDS2(4108): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4109:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readalgoPassWithDYCE2(4109): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDYCE2(4109): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4110:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: firstReadWasHardWithAcq(4110): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: firstReadWasHardWithAcq(4110): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4111:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_LSB(4111): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_LSB(4111): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4112:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_MSB(4112): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_MSB(4112): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4113:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_USB(4113): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_USB(4113): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4114:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_LSB(4114): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_LSB(4114): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4115:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_MSB(4115): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_MSB(4115): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4116:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_USB(4116): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_USB(4116): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4117:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: firstReadWasHardWithDefaultBDB(4117): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: firstReadWasHardWithDefaultBDB(4117): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4118:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readAlgoPassedThroughSyndSumAcquisition(4118): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughSyndSumAcquisition(4118): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4119:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readAlgoPassedThroughSlip(4119): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughSlip(4119): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4120:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 44) {
        sub_100018D50( "ASPMSPParseBufferToCxt: FS2decodedBitFlips(4120): cfg 11 elements; (11*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: FS2decodedBitFlips(4120): Error adding 11 elements to context";
      goto LABEL_1981;
    case 4121:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 16) {
        sub_100018D50( "ASPMSPParseBufferToCxt: slipTrackingAfterFs1ForceFailChangedVthInTicksHist(4121): cfg 4 elements; (4*4) cfg by"
      }
          "tes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: slipTrackingAfterFs1ForceFailChangedVthInTicksHist(4121): Error adding 4 elements to context";
      goto LABEL_1981;
    case 4122:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readAlgoPassWithFS2_4b_fast(4122): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS2_4b_fast(4122): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4123:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterSlip_fast(4123): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterSlip_fast(4123): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4124:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterSlip_fast(4124): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterSlip_fast(4124): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4125:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterSlip_fast(4125): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterSlip_fast(4125): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4126:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readAlgoPassWithFS3_fast(4126): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS3_fast(4126): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4127:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 40) {
        sub_100018D50( "ASPMSPParseBufferToCxt: deepSoft1Decoded(4127): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: deepSoft1Decoded(4127): Error adding 10 elements to context";
      goto LABEL_1981;
    case 4128:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 40) {
        sub_100018D50( "ASPMSPParseBufferToCxt: deepSoft2Decoded(4128): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: deepSoft2Decoded(4128): Error adding 10 elements to context";
      goto LABEL_1981;
    case 4129:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_2b_fast(4129): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_2b_fast(4129): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4130:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_4b_fast(4130): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_4b_fast(4130): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4131:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readAlgoPassedThroughSlip_fast(4131): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughSlip_fast(4131): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4132:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS3_fast(4132): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS3_fast(4132): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4133:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readalgoPassWithEXH(4133): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithEXH(4133): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4134:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 44) {
        sub_100018D50( "ASPMSPParseBufferToCxt: FS1decodedbitflips(4134): cfg 11 elements; (11*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: FS1decodedbitflips(4134): Error adding 11 elements to context";
      goto LABEL_1981;
    case 4135:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readZeroPage(4135): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readZeroPage(4135): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4136:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readErasedPage(4136): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readErasedPage(4136): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4137:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readFail(4137): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readFail(4137): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4138:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 20) {
        sub_100018D50( "ASPMSPParseBufferToCxt: numOfSensesWereSentDuringSyndSumAcq(4138): cfg 5 elements; (5*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: numOfSensesWereSentDuringSyndSumAcq(4138): Error adding 5 elements to context";
      goto LABEL_1981;
    case 4139:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 12) {
        sub_100018D50( "ASPMSPParseBufferToCxt: numOfSensesWereSentDuringMiniAcq(4139): cfg 3 elements; (3*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: numOfSensesWereSentDuringMiniAcq(4139): Error adding 3 elements to context";
      goto LABEL_1981;
    case 4140:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: bdbDefaultMoveFastToNormal(4140): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDefaultMoveFastToNormal(4140): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4141:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: bdbDefaultMoveNormalToFast(4141): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDefaultMoveNormalToFast(4141): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4142:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readalgoPassWithEXH_DSP(4142): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithEXH_DSP(4142): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4143:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readalgoPassWithDS1_DSP(4143): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDS1_DSP(4143): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4144:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readalgoPassWithDYCE1_DSP(4144): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDYCE1_DSP(4144): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4145:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: firstReadWasFS2EOL_DSP(4145): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: firstReadWasFS2EOL_DSP(4145): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4146:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: firstReadWasFS2EOL(4146): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: firstReadWasFS2EOL(4146): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4147:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_4b(4147): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_4b(4147): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4148:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readAlgoPassWithFS2_4b(4148): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS2_4b(4148): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4149:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_2b(4149): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_2b(4149): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4150:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS3(4150): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS3(4150): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4151:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS1(4151): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS1(4151): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4152:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS2(4152): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS2(4152): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4153:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterSlip(4153): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterSlip(4153): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4154:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterSlip(4154): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterSlip(4154): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4155:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterSlip(4155): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterSlip(4155): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4156:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readAlgoPassWithFS3(4156): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS3(4156): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4157:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readAlgoPassedThroughSyndSumAcquisition_DSP(4157): cfg 1 elements; (1*4) cfg bytes != "
      }
          "(%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughSyndSumAcquisition_DSP(4157): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4158:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterAcq(4158): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterAcq(4158): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4159:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100018D50( "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterAcq(4159): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      if (sub_100011E74(a1, "readAlgoPassWithFS14BitAfterAcq", v11, 4u, v21))
      {
LABEL_460:
        uint64_t v8 = v8 + v21;
        uint64_t v13 = v20;
        uint64_t v14 = v19;
        goto LABEL_461;
      }

      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterAcq(4159): Error adding 1 elements to context";
LABEL_1981:
      sub_100018D50(v9, a2, a3, a4, a5, a6, a7, a8, v24);
      return v8;
    default:
      switch(v17)
      {
        case 4160:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100018D50( "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS1_DSP(4160): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS1_DSP(4160): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4161:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100018D50( "ASPMSPParseBufferToCxt: numOfSlipTracking(4161): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: numOfSlipTracking(4161): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4162:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100018D50( "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_QSB(4162): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_QSB(4162): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4163:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100018D50( "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_QSB(4163): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_QSB(4163): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4196:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100018D50( "ASPMSPParseBufferToCxt: readStageNumOfFails100(4196): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails100(4196): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4197:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100018D50( "ASPMSPParseBufferToCxt: readStageNumOfFails101(4197): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails101(4197): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4198:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100018D50( "ASPMSPParseBufferToCxt: readStage100(4198): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage100(4198): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4199:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100018D50( "ASPMSPParseBufferToCxt: readStage101(4199): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage101(4199): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4200:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100018D50( "ASPMSPParseBufferToCxt: initialReadStage100(4200): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage100(4200): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4201:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100018D50( "ASPMSPParseBufferToCxt: readStage102(4201): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage102(4201): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4202:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100018D50( "ASPMSPParseBufferToCxt: initialReadStage101(4202): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage101(4202): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4203:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100018D50( "ASPMSPParseBufferToCxt: nandStageOfLife100(4203): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: nandStageOfLife100(4203): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4204:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100018D50( "ASPMSPParseBufferToCxt: nandStageOfLife101(4204): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: nandStageOfLife101(4204): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4205:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100018D50( "ASPMSPParseBufferToCxt: readStageNumOfFails102(4205): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails102(4205): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4206:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100018D50( "ASPMSPParseBufferToCxt: initialReadStage102(4206): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage102(4206): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4207:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100018D50( "ASPMSPParseBufferToCxt: readStage103(4207): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage103(4207): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4208:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100018D50( "ASPMSPParseBufferToCxt: readStage104(4208): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage104(4208): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4209:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100018D50( "ASPMSPParseBufferToCxt: readStage105(4209): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage105(4209): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4210:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100018D50( "ASPMSPParseBufferToCxt: readStage106(4210): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage106(4210): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4211:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter100(4211): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter100(4211): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4212:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter101(4212): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter101(4212): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4213:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100018D50( "ASPMSPParseBufferToCxt: initialReadStage103(4213): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage103(4213): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4214:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100018D50( "ASPMSPParseBufferToCxt: initialReadStage104(4214): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage104(4214): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4215:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100018D50( "ASPMSPParseBufferToCxt: readStage107(4215): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage107(4215): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4216:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100018D50( "ASPMSPParseBufferToCxt: readStage108(4216): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage108(4216): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4217:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100018D50( "ASPMSPParseBufferToCxt: nandStageOfLife102(4217): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: nandStageOfLife102(4217): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4218:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100018D50( "ASPMSPParseBufferToCxt: nandStageOfLife103(4218): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: nandStageOfLife103(4218): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4219:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100018D50( "ASPMSPParseBufferToCxt: nandStageOfLife104(4219): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: nandStageOfLife104(4219): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4220:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter102(4220): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter102(4220): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4221:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter103(4221): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter103(4221): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4222:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter104(4222): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter104(4222): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4223:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter105(4223): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter105(4223): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4224:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter106(4224): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter106(4224): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4225:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter107(4225): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter107(4225): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4226:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter108(4226): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter108(4226): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4227:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter109(4227): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter109(4227): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4228:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter110(4228): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter110(4228): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4229:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter111(4229): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter111(4229): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4230:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter112(4230): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter112(4230): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4231:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter113(4231): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter113(4231): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4232:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 256) {
            sub_100018D50( "ASPMSPParseBufferToCxt: readStageNumOfFails108(4232): cfg 64 elements; (64*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails108(4232): Error adding 64 elements to context";
          goto LABEL_1981;
        case 4233:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 256) {
            sub_100018D50( "ASPMSPParseBufferToCxt: readStageNumOfFails103(4233): cfg 64 elements; (64*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails103(4233): Error adding 64 elements to context";
          goto LABEL_1981;
        case 4234:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100018D50( "ASPMSPParseBufferToCxt: readStageNumOfFails104(4234): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails104(4234): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4235:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100018D50( "ASPMSPParseBufferToCxt: readStageNumOfFails105(4235): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails105(4235): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4236:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100018D50( "ASPMSPParseBufferToCxt: readStageNumOfFails106(4236): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails106(4236): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4237:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100018D50( "ASPMSPParseBufferToCxt: readStageNumOfFails107(4237): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails107(4237): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4238:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100018D50( "ASPMSPParseBufferToCxt: readStage109(4238): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage109(4238): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4239:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100018D50( "ASPMSPParseBufferToCxt: readStage110(4239): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage110(4239): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4240:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 80) {
            sub_100018D50( "ASPMSPParseBufferToCxt: readStageNumOfErrorsBin100(4240): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfErrorsBin100(4240): Error adding 20 elements to context";
          goto LABEL_1981;
        case 4241:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 80) {
            sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter114(4241): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter114(4241): Error adding 20 elements to context";
          goto LABEL_1981;
        case 4242:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter115(4242): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter115(4242): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4243:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter116(4243): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter116(4243): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4244:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter117(4244): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter117(4244): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4245:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter118(4245): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter118(4245): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4246:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter119(4246): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter119(4246): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4247:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter120(4247): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter120(4247): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4248:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter121(4248): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter121(4248): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4249:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100018D50( "ASPMSPParseBufferToCxt: cbdr_ref_1(4249): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_ref_1(4249): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4250:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100018D50( "ASPMSPParseBufferToCxt: cbdr_ref_2(4250): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_ref_2(4250): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4251:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100018D50( "ASPMSPParseBufferToCxt: cbdr_outlier(4251): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_outlier(4251): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4252:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 40) {
            sub_100018D50( "ASPMSPParseBufferToCxt: cbdr_step_1(4252): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_1(4252): Error adding 10 elements to context";
          goto LABEL_1981;
        case 4253:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 40) {
            sub_100018D50( "ASPMSPParseBufferToCxt: cbdr_step_2(4253): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_2(4253): Error adding 10 elements to context";
          goto LABEL_1981;
        case 4254:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 40) {
            sub_100018D50( "ASPMSPParseBufferToCxt: cbdr_step_3(4254): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_3(4254): Error adding 10 elements to context";
          goto LABEL_1981;
        case 4255:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 40) {
            sub_100018D50( "ASPMSPParseBufferToCxt: cbdr_step_4(4255): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_4(4255): Error adding 10 elements to context";
          goto LABEL_1981;
        default:
          switch(v17)
          {
            case 12288:
              if ((_DWORD)v16 != 8) {
                sub_100018D50( "ASPMSPParseBufferToCxt: readStageNumOfFails200(12288): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails200(12288): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12289:
              if ((_DWORD)v16 != 8) {
                sub_100018D50( "ASPMSPParseBufferToCxt: initialReadStage200(12289): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage200(12289): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12290:
              if ((_DWORD)v16 != 8) {
                sub_100018D50( "ASPMSPParseBufferToCxt: initialReadStage201(12290): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage201(12290): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12291:
              if ((_DWORD)v16 != 8) {
                sub_100018D50( "ASPMSPParseBufferToCxt: readStageNumOfFails201(12291): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails201(12291): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12292:
              if ((_DWORD)v16 != 8) {
                sub_100018D50( "ASPMSPParseBufferToCxt: initialReadStage202(12292): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage202(12292): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12293:
              if ((_DWORD)v16 != 8) {
                sub_100018D50( "ASPMSPParseBufferToCxt: initialReadStage203(12293): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage203(12293): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12294:
              if ((_DWORD)v16 != 8) {
                sub_100018D50( "ASPMSPParseBufferToCxt: readStageNumOfFails202(12294): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails202(12294): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12295:
              if ((_DWORD)v16 != 8) {
                sub_100018D50( "ASPMSPParseBufferToCxt: readStageNumOfFails203(12295): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails203(12295): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12296:
              if ((_DWORD)v16 != 8) {
                sub_100018D50( "ASPMSPParseBufferToCxt: initialReadStage204(12296): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage204(12296): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12297:
              if ((_DWORD)v16 != 8) {
                sub_100018D50( "ASPMSPParseBufferToCxt: initialReadStage205(12297): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage205(12297): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12298:
              if ((_DWORD)v16 != 8) {
                sub_100018D50( "ASPMSPParseBufferToCxt: initialReadStage206(12298): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage206(12298): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12299:
              if ((_DWORD)v16 != 8) {
                sub_100018D50( "ASPMSPParseBufferToCxt: initialReadStage207(12299): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage207(12299): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12300:
              if ((_DWORD)v16 != 8) {
                sub_100018D50( "ASPMSPParseBufferToCxt: initialReadStage208(12300): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage208(12300): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12301:
              if ((_DWORD)v16 != 8) {
                sub_100018D50( "ASPMSPParseBufferToCxt: initialReadStage209(12301): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage209(12301): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12302:
              if ((_DWORD)v16 != 8) {
                sub_100018D50( "ASPMSPParseBufferToCxt: readStage200(12302): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage200(12302): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12303:
              if ((_DWORD)v16 != 32) {
                sub_100018D50( "ASPMSPParseBufferToCxt: readStage201(12303): cfg 4 elements; (4*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage201(12303): Error adding 4 elements to context";
              goto LABEL_1981;
            case 12304:
              if ((_DWORD)v16 != 32) {
                sub_100018D50( "ASPMSPParseBufferToCxt: readStage202(12304): cfg 4 elements; (4*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage202(12304): Error adding 4 elements to context";
              goto LABEL_1981;
            case 12305:
              if ((_DWORD)v16 != 8) {
                sub_100018D50( "ASPMSPParseBufferToCxt: initialReadStage210(12305): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage210(12305): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12306:
              if ((_DWORD)v16 != 8) {
                sub_100018D50( "ASPMSPParseBufferToCxt: initialReadStage211(12306): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage211(12306): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12307:
              if ((_DWORD)v16 != 8) {
                sub_100018D50( "ASPMSPParseBufferToCxt: readStage203(12307): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage203(12307): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12308:
              if ((_DWORD)v16 != 8) {
                sub_100018D50( "ASPMSPParseBufferToCxt: readStage204(12308): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage204(12308): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12309:
              if ((_DWORD)v16 != 8) {
                sub_100018D50( "ASPMSPParseBufferToCxt: readStage205(12309): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage205(12309): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12310:
              if ((_DWORD)v16 != 8) {
                sub_100018D50( "ASPMSPParseBufferToCxt: readStage206(12310): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage206(12310): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12311:
              if ((_DWORD)v16 != 8) {
                sub_100018D50( "ASPMSPParseBufferToCxt: readStage207(12311): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage207(12311): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12312:
              if ((_DWORD)v16 != 8) {
                sub_100018D50( "ASPMSPParseBufferToCxt: readStage208(12312): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage208(12312): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12313:
              if ((_DWORD)v16 != 32) {
                sub_100018D50( "ASPMSPParseBufferToCxt: readStage209(12313): cfg 4 elements; (4*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage209(12313): Error adding 4 elements to context";
              goto LABEL_1981;
            case 12314:
              if ((_DWORD)v16 != 32) {
                sub_100018D50( "ASPMSPParseBufferToCxt: readStage210(12314): cfg 4 elements; (4*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage210(12314): Error adding 4 elements to context";
              goto LABEL_1981;
            case 12315:
              if ((_DWORD)v16 != 8) {
                sub_100018D50( "ASPMSPParseBufferToCxt: initialReadStage212(12315): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage212(12315): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12316:
              if ((_DWORD)v16 != 8) {
                sub_100018D50( "ASPMSPParseBufferToCxt: initialReadStage213(12316): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage213(12316): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12317:
              if ((_DWORD)v16 != 8) {
                sub_100018D50( "ASPMSPParseBufferToCxt: readStage211(12317): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage211(12317): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12318:
              if ((_DWORD)v16 != 8) {
                sub_100018D50( "ASPMSPParseBufferToCxt: readStage212(12318): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage212(12318): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12319:
              if ((_DWORD)v16 != 8) {
                sub_100018D50( "ASPMSPParseBufferToCxt: readStage213(12319): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage213(12319): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12320:
              if ((_DWORD)v16 != 8) {
                sub_100018D50( "ASPMSPParseBufferToCxt: readStage214(12320): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage214(12320): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12321:
              if ((_DWORD)v16 != 8) {
                sub_100018D50( "ASPMSPParseBufferToCxt: readStage215(12321): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage215(12321): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12322:
              if ((_DWORD)v16 != 8) {
                sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter142(12322): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter142(12322): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12323:
              if ((_DWORD)v16 != 8) {
                sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter143(12323): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter143(12323): Error adding 1 elements to context";
              goto LABEL_1981;
            default:
              switch(v17)
              {
                case 4256:
                  if ((_DWORD)v16 != 40) {
                    sub_100018D50( "ASPMSPParseBufferToCxt: cbdr_step_5(4256): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  goto LABEL_1372;
                case 4257:
                  if ((_DWORD)v16 != 40) {
                    sub_100018D50( "ASPMSPParseBufferToCxt: cbdr_step_6(4257): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_6(4257): Error adding 10 elements to context";
                  goto LABEL_1981;
                case 4258:
                  if ((_DWORD)v16 != 40) {
                    sub_100018D50( "ASPMSPParseBufferToCxt: cbdr_step_7(4258): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_7(4258): Error adding 10 elements to context";
                  goto LABEL_1981;
                case 4259:
                  if ((_DWORD)v16 != 80) {
                    sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter122(4259): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter122(4259): Error adding 20 elements to context";
                  goto LABEL_1981;
                case 4260:
                  if ((_DWORD)v16 != 32) {
                    sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter123(4260): cfg 8 elements; (8*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter123(4260): Error adding 8 elements to context";
                  goto LABEL_1981;
                case 4261:
                  if ((_DWORD)v16 != 4) {
                    sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter124(4261): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter124(4261): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4262:
                  if ((_DWORD)v16 != 4) {
                    sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter125(4262): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter125(4262): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4263:
                  if ((_DWORD)v16 != 4) {
                    sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter126(4263): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter126(4263): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4264:
                  if ((_DWORD)v16 != 16) {
                    sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter127(4264): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter127(4264): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4265:
                  if ((_DWORD)v16 != 16) {
                    sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter128(4265): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter128(4265): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4266:
                  if ((_DWORD)v16 != 16) {
                    sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter129(4266): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter129(4266): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4267:
                  if ((_DWORD)v16 != 16) {
                    sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter130(4267): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter130(4267): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4268:
                  if ((_DWORD)v16 != 16) {
                    sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter131(4268): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter131(4268): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4269:
                  if ((_DWORD)v16 != 40) {
                    sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter132(4269): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter132(4269): Error adding 10 elements to context";
                  goto LABEL_1981;
                case 4270:
                  if ((_DWORD)v16 != 40) {
                    sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter133(4270): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter133(4270): Error adding 10 elements to context";
                  goto LABEL_1981;
                case 4271:
                  if ((_DWORD)v16 != 4) {
                    sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter134(4271): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter134(4271): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4272:
                  if ((_DWORD)v16 != 4) {
                    sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter135(4272): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter135(4272): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4273:
                  if ((_DWORD)v16 != 4) {
                    sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter136(4273): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter136(4273): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4274:
                  if ((_DWORD)v16 != 4) {
                    sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter137(4274): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter137(4274): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4275:
                  if ((_DWORD)v16 != 4) {
                    sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter138(4275): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter138(4275): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4276:
                  if ((_DWORD)v16 != 16) {
                    sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter139(4276): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter139(4276): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4277:
                  if ((_DWORD)v16 != 4) {
                    sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter140(4277): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter140(4277): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4278:
                  if ((_DWORD)v16 != 4) {
                    sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter141(4278): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter141(4278): Error adding 1 elements to context";
                  goto LABEL_1981;
                default:
                  switch(v17)
                  {
                    case 4164:
                      if ((_DWORD)v16 != 4) {
                        sub_100018D50( "ASPMSPParseBufferToCxt: syndSumAcqConvergedToStaticWalls(4164): cfg 1 elements; (1*4) cfg byte"
                      }
                          "s != (%d) buffer bytes",
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v16);
                      else {
                        unsigned int v22 = v16 >> 2;
                      }
                      unint64_t v9 = "ASPMSPParseBufferToCxt: syndSumAcqConvergedToStaticWalls(4164): Error adding 1 elements to context";
                      goto LABEL_1981;
                    case 4165:
                      if ((_DWORD)v16 != 60) {
                        sub_100018D50( "ASPMSPParseBufferToCxt: DYCE1_Decoded_Bitflips(4165): cfg 15 elements; (15*4) cfg bytes != (%d) buffer bytes",
                      }
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v16);
                      else {
                        unsigned int v22 = v16 >> 2;
                      }
                      unint64_t v9 = "ASPMSPParseBufferToCxt: DYCE1_Decoded_Bitflips(4165): Error adding 15 elements to context";
                      goto LABEL_1981;
                    case 4166:
                      if ((_DWORD)v16 != 80) {
                        sub_100018D50( "ASPMSPParseBufferToCxt: DYCE1_Target_Bitflips(4166): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
                      }
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v16);
                      else {
                        unsigned int v22 = v16 >> 2;
                      }
                      unint64_t v9 = "ASPMSPParseBufferToCxt: DYCE1_Target_Bitflips(4166): Error adding 20 elements to context";
                      goto LABEL_1981;
                    case 4167:
                      if ((_DWORD)v16 != 60) {
                        sub_100018D50( "ASPMSPParseBufferToCxt: DYCE2_Decoded_Bitflips(4167): cfg 15 elements; (15*4) cfg bytes != (%d) buffer bytes",
                      }
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v16);
                      else {
                        unsigned int v22 = v16 >> 2;
                      }
                      unint64_t v9 = "ASPMSPParseBufferToCxt: DYCE2_Decoded_Bitflips(4167): Error adding 15 elements to context";
                      goto LABEL_1981;
                    case 4168:
                      if ((_DWORD)v16 != 80) {
                        sub_100018D50( "ASPMSPParseBufferToCxt: DYCE2_Target_Bitflips(4168): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
                      }
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v16);
                      else {
                        unsigned int v22 = v16 >> 2;
                      }
                      unint64_t v9 = "ASPMSPParseBufferToCxt: DYCE2_Target_Bitflips(4168): Error adding 20 elements to context";
                      goto LABEL_1981;
                    default:
                      if (v17 <= 12323)
                      {
                        switch(v17)
                        {
                          case 8193:
                            if ((_DWORD)v16 != 20) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: avg_rd_window_size(8193): cfg 5 elements; (5*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: avg_rd_window_size(8193): Error adding 5 elements to context";
                            break;
                          case 8194:
                            if ((_DWORD)v16 != 4) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: num_zq_failures(8194): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: num_zq_failures(8194): Error adding 1 elements to context";
                            break;
                          case 8195:
                            if ((_DWORD)v16 != 64) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: lower_die_temperature(8195): cfg 16 elements; (16*4) cfg bytes !"
                            }
                                "= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: lower_die_temperature(8195): Error adding 16 elements to context";
                            break;
                          case 8196:
                            if ((_DWORD)v16 != 64) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: higher_die_temperature(8196): cfg 16 elements; (16*4) cfg bytes "
                            }
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: higher_die_temperature(8196): Error adding 16 elements to context";
                            break;
                          case 8197:
                            if ((_DWORD)v16 != 4) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: number_of_sram_flips(8197): cfg 1 elements; (1*4) cfg bytes != ("
                            }
                                "%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_sram_flips(8197): Error adding 1 elements to context";
                            break;
                          case 8198:
                            if ((_DWORD)v16 != 4) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: number_of_reset_failures(8198): cfg 1 elements; (1*4) cfg bytes "
                            }
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_reset_failures(8198): Error adding 1 elements to context";
                            break;
                          case 8199:
                            if ((_DWORD)v16 != 4) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: device_config(8199): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: device_config(8199): Error adding 1 elements to context";
                            break;
                          case 8200:
                            if ((_DWORD)v16 != 4) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: number_of_throttling_events(8200): cfg 1 elements; (1*4) cfg byt"
                            }
                                "es != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_throttling_events(8200): Error adding 1 elements to context";
                            break;
                          case 8201:
                            if ((_DWORD)v16 != 4) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: link_speed_recoveries(8201): cfg 1 elements; (1*4) cfg bytes != "
                            }
                                "(%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: link_speed_recoveries(8201): Error adding 1 elements to context";
                            break;
                          case 8202:
                            if ((_DWORD)v16 != 4) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: fw_updates(8202): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: fw_updates(8202): Error adding 1 elements to context";
                            break;
                          case 8203:
                            if ((_DWORD)v16 != 4) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: maintenance_backup_to_main(8203): cfg 1 elements; (1*4) cfg byte"
                            }
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: maintenance_backup_to_main(8203): Error adding 1 elements to context";
                            break;
                          case 8204:
                            if ((_DWORD)v16 != 4) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: maintenance_main_to_backup(8204): cfg 1 elements; (1*4) cfg byte"
                            }
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: maintenance_main_to_backup(8204): Error adding 1 elements to context";
                            break;
                          case 8205:
                            if ((_DWORD)v16 != 4) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: boot_block_erase_failures(8205): cfg 1 elements; (1*4) cfg bytes"
                            }
                                " != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_erase_failures(8205): Error adding 1 elements to context";
                            break;
                          case 8206:
                            if ((_DWORD)v16 != 4) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: boot_block_program_failures(8206): cfg 1 elements; (1*4) cfg byt"
                            }
                                "es != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_program_failures(8206): Error adding 1 elements to context";
                            break;
                          case 8207:
                            if ((_DWORD)v16 != 4) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: boot_block_read_verify_failures(8207): cfg 1 elements; (1*4) cfg"
                            }
                                " bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_read_verify_failures(8207): Error adding 1 elements to context";
                            break;
                          case 8208:
                            if ((_DWORD)v16 != 4) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: boot_block_read_failures(8208): cfg 1 elements; (1*4) cfg bytes "
                            }
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_read_failures(8208): Error adding 1 elements to context";
                            break;
                          case 8209:
                            if ((_DWORD)v16 != 4) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: boot_block_refresh(8209): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_refresh(8209): Error adding 1 elements to context";
                            break;
                          case 8210:
                            if ((_DWORD)v16 != 4) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: boot_block_convert_to_main(8210): cfg 1 elements; (1*4) cfg byte"
                            }
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_convert_to_main(8210): Error adding 1 elements to context";
                            break;
                          case 8211:
                            if ((_DWORD)v16 != 4) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: boot_block_read_source_changed(8211): cfg 1 elements; (1*4) cfg "
                            }
                                "bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_read_source_changed(8211): Error adding 1 elements to context";
                            break;
                          case 8212:
                            if ((_DWORD)v16 != 16) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: open_blocks_hist(8212): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: open_blocks_hist(8212): Error adding 4 elements to context";
                            break;
                          case 8213:
                            if ((_DWORD)v16 != 24) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: random_read_hit_ratio_hist(8213): cfg 6 elements; (6*4) cfg byte"
                            }
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: random_read_hit_ratio_hist(8213): Error adding 6 elements to context";
                            break;
                          case 8214:
                            if ((_DWORD)v16 != 20) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: active_time_hist(8214): cfg 5 elements; (5*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_hist(8214): Error adding 5 elements to context";
                            break;
                          case 8215:
                            if ((_DWORD)v16 != 8) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: rd_retraining_failures(8215): cfg 2 elements; (2*4) cfg bytes !="
                            }
                                " (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: rd_retraining_failures(8215): Error adding 2 elements to context";
                            break;
                          case 8216:
                            if ((_DWORD)v16 != 8) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: wr_retraining_failures(8216): cfg 2 elements; (2*4) cfg bytes !="
                            }
                                " (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: wr_retraining_failures(8216): Error adding 2 elements to context";
                            break;
                          case 8217:
                            if ((_DWORD)v16 != 20) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: auto_skip(8217): cfg 5 elements; (5*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: auto_skip(8217): Error adding 5 elements to context";
                            break;
                          case 8218:
                            if ((_DWORD)v16 != 4) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: number_of_dcc_pass_after_retry(8218): cfg 1 elements; (1*4) cfg "
                            }
                                "bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_dcc_pass_after_retry(8218): Error adding 1 elements to context";
                            break;
                          case 8219:
                            if ((_DWORD)v16 != 4) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: number_of_dcc_failures(8219): cfg 1 elements; (1*4) cfg bytes !="
                            }
                                " (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_dcc_failures(8219): Error adding 1 elements to context";
                            break;
                          case 8220:
                            if ((_DWORD)v16 != 28) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: open_blocks_hist(8220): cfg 7 elements; (7*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: open_blocks_hist(8220): Error adding 7 elements to context";
                            break;
                          case 8221:
                            if ((_DWORD)v16 != 4) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: max_size_open_blocks_list(8221): cfg 1 elements; (1*4) cfg bytes"
                            }
                                " != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: max_size_open_blocks_list(8221): Error adding 1 elements to context";
                            break;
                          case 8222:
                            if ((_DWORD)v16 != 4) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: gps_max_num_of_failures(8222): cfg 1 elements; (1*4) cfg bytes !"
                            }
                                "= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: gps_max_num_of_failures(8222): Error adding 1 elements to context";
                            break;
                          case 8223:
                            if ((_DWORD)v16 != 4) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: gps_num_of_failures_max_overflow(8223): cfg 1 elements; (1*4) cf"
                            }
                                "g bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: gps_num_of_failures_max_overflow(8223): Error adding 1 elements to context";
                            break;
                          case 8224:
                            if ((_DWORD)v16 != 32) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: active_time_hist(8224): cfg 8 elements; (8*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_hist(8224): Error adding 8 elements to context";
                            break;
                          case 8225:
                            if ((_DWORD)v16 != 4) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: num_auto_program_cache_terminations(8225): cfg 1 elements; (1*4)"
                            }
                                " cfg bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: num_auto_program_cache_terminations(8225): Error adding 1 elements to context";
                            break;
                          case 8226:
                            if ((_DWORD)v16 != 4) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: number_of_read_cache_auto_terminations(8226): cfg 1 elements; (1"
                            }
                                "*4) cfg bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_read_cache_auto_terminations(8226): Error adding 1 el"
                                 "ements to context";
                            break;
                          case 8227:
                            if ((_DWORD)v16 != 28) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: external_etags_usage_hist(8227): cfg 7 elements; (7*4) cfg bytes"
                            }
                                " != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: external_etags_usage_hist(8227): Error adding 7 elements to context";
                            break;
                          case 8228:
                            if ((_DWORD)v16 != 16) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: internal_etags_usage_hist(8228): cfg 4 elements; (4*4) cfg bytes"
                            }
                                " != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: internal_etags_usage_hist(8228): Error adding 4 elements to context";
                            break;
                          case 8229:
                            if ((_DWORD)v16 != 4) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: max_heap_usage(8229): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: max_heap_usage(8229): Error adding 1 elements to context";
                            break;
                          case 8230:
                            if ((_DWORD)v16 != 24) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: rom_num_hard_resets(8230): cfg 6 elements; (6*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: rom_num_hard_resets(8230): Error adding 6 elements to context";
                            break;
                          case 8231:
                            if ((_DWORD)v16 != 64) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: lower_die_temperature(8231): cfg 16 elements; (16*4) cfg bytes !"
                            }
                                "= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: lower_die_temperature(8231): Error adding 16 elements to context";
                            break;
                          case 8232:
                            if ((_DWORD)v16 != 64) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: higher_die_temperature(8232): cfg 16 elements; (16*4) cfg bytes "
                            }
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: higher_die_temperature(8232): Error adding 16 elements to context";
                            break;
                          case 8233:
                            if ((_DWORD)v16 != 24) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: random_read_hit_ratio_hist(8233): cfg 6 elements; (6*4) cfg byte"
                            }
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: random_read_hit_ratio_hist(8233): Error adding 6 elements to context";
                            break;
                          case 8234:
                            if ((_DWORD)v16 != 4) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: msp_number_sram_flips(8234): cfg 1 elements; (1*4) cfg bytes != "
                            }
                                "(%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: msp_number_sram_flips(8234): Error adding 1 elements to context";
                            break;
                          case 8235:
                            if ((_DWORD)v16 != 28) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: boot_time_normal_power(8235): cfg 7 elements; (7*4) cfg bytes !="
                            }
                                " (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_time_normal_power(8235): Error adding 7 elements to context";
                            break;
                          case 8236:
                            if ((_DWORD)v16 != 28) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: boot_time_low_power(8236): cfg 7 elements; (7*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_time_low_power(8236): Error adding 7 elements to context";
                            break;
                          case 8237:
                            if ((_DWORD)v16 != 40) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: active_time_bw_pg_hist(8237): cfg 10 elements; (10*4) cfg bytes "
                            }
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_bw_pg_hist(8237): Error adding 10 elements to context";
                            break;
                          case 8238:
                            if ((_DWORD)v16 != 4) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: active_time_bw_pg_min(8238): cfg 1 elements; (1*4) cfg bytes != "
                            }
                                "(%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_bw_pg_min(8238): Error adding 1 elements to context";
                            break;
                          case 8239:
                            if ((_DWORD)v16 != 4) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: active_time_bw_pg_max(8239): cfg 1 elements; (1*4) cfg bytes != "
                            }
                                "(%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_bw_pg_max(8239): Error adding 1 elements to context";
                            break;
                          case 8240:
                            if ((_DWORD)v16 != 20) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: mdll_relative_offset(8240): cfg 5 elements; (5*4) cfg bytes != ("
                            }
                                "%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: mdll_relative_offset(8240): Error adding 5 elements to context";
                            break;
                          case 8241:
                            if ((_DWORD)v16 != 4) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: num_pg_regrets(8241): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: num_pg_regrets(8241): Error adding 1 elements to context";
                            break;
                          case 8242:
                            if ((_DWORD)v16 != 4) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: spi_image_overall_duration_acc(8242): cfg 1 elements; (1*4) cfg "
                            }
                                "bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: spi_image_overall_duration_acc(8242): Error adding 1 elements to context";
                            break;
                          case 8243:
                            if ((_DWORD)v16 != 4) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: spi_image_cw_fetch_duration_acc(8243): cfg 1 elements; (1*4) cfg"
                            }
                                " bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: spi_image_cw_fetch_duration_acc(8243): Error adding 1 elements to context";
                            break;
                          case 8244:
                            if ((_DWORD)v16 != 20) {
                              sub_100018D50( "ASPMSPParseBufferToCxt: spi_image_cw_fetch_duration_hist(8244): cfg 5 elements; (5*4) cf"
                            }
                                "g bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: spi_image_cw_fetch_duration_hist(8244): Error adding 5 elements to context";
                            break;
                          default:
                            switch(v17)
                            {
                              case 4279:
                                if ((_DWORD)v16 != 16) {
                                  sub_100018D50( "ASPMSPParseBufferToCxt: fs1_4b_fail(4279): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                                }
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = v14;
                                break;
                              case 4280:
                                if ((_DWORD)v16 != 16) {
                                  sub_100018D50( "ASPMSPParseBufferToCxt: fs1_4b_fast_fail(4280): cfg 4 elements; (4*4) cfg bytes != ("
                                }
                                    "%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: fs1_4b_fast_fail(4280): Error adding 4 elements to context";
                                break;
                              case 4281:
                                if ((_DWORD)v16 != 40) {
                                  sub_100018D50( "ASPMSPParseBufferToCxt: dyce_decoded_bit_flips(4281): cfg 10 elements; (10*4) cfg by"
                                }
                                    "tes != (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: dyce_decoded_bit_flips(4281): Error adding 10 elements to context";
                                break;
                              case 4282:
                                if ((_DWORD)v16 != 60) {
                                  sub_100018D50( "ASPMSPParseBufferToCxt: slip_bch(4282): cfg 15 elements; (15*4) cfg bytes != (%d) buffer bytes",
                                }
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: slip_bch(4282): Error adding 15 elements to context";
                                break;
                              case 4283:
                                if ((_DWORD)v16 != 40) {
                                  sub_100018D50( "ASPMSPParseBufferToCxt: read_fail(4283): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                                }
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: read_fail(4283): Error adding 10 elements to context";
                                break;
                              case 4284:
                                if ((_DWORD)v16 != 40) {
                                  sub_100018D50( "ASPMSPParseBufferToCxt: tr_read_fail(4284): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                                }
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: tr_read_fail(4284): Error adding 10 elements to context";
                                break;
                              case 4285:
                                if ((_DWORD)v16 != 40) {
                                  sub_100018D50( "ASPMSPParseBufferToCxt: tr_aux_bfs_percent(4285): cfg 10 elements; (10*4) cfg bytes "
                                }
                                    "!= (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: tr_aux_bfs_percent(4285): Error adding 10 elements to context";
                                break;
                              case 4286:
                                if ((_DWORD)v16 != 20) {
                                  sub_100018D50( "ASPMSPParseBufferToCxt: tr_reconstruct_pass_step(4286): cfg 5 elements; (5*4) cfg by"
                                }
                                    "tes != (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: tr_reconstruct_pass_step(4286): Error adding 5 elements to context";
                                break;
                              case 4287:
                                if ((_DWORD)v16 != 4) {
                                  sub_100018D50( "ASPMSPParseBufferToCxt: tr_reconstruct_num(4287): cfg 1 elements; (1*4) cfg bytes !="
                                }
                                    " (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: tr_reconstruct_num(4287): Error adding 1 elements to context";
                                break;
                              default:
                                goto LABEL_1404;
                            }

                            goto LABEL_1981;
                        }

                        goto LABEL_1981;
                      }

                      switch(v17)
                      {
                        case 12326:
                          if ((_DWORD)v16 != 8) {
                            sub_100018D50( "ASPMSPParseBufferToCxt: initialReadStageParameter2(12326): cfg 1 elements; (1*8) cfg bytes"
                          }
                              " != (%d) buffer bytes",
                              a2,
                              a3,
                              a4,
                              a5,
                              a6,
                              a7,
                              a8,
                              v16);
                          else {
                            unsigned int v22 = v16 >> 3;
                          }
                          if (!sub_100011E74(a1, "initialReadStageParameter2", v11, 8u, v22))
                          {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStageParameter2(12326): Error adding 1 elements to context";
                            goto LABEL_1981;
                          }

                          break;
                        case 12325:
                          if ((_DWORD)v16 != 8) {
                            sub_100018D50( "ASPMSPParseBufferToCxt: initialReadStageParameter1(12325): cfg 1 elements; (1*8) cfg bytes"
                          }
                              " != (%d) buffer bytes",
                              a2,
                              a3,
                              a4,
                              a5,
                              a6,
                              a7,
                              a8,
                              v16);
                          else {
                            unsigned int v22 = v16 >> 3;
                          }
                          if (!sub_100011E74(a1, "initialReadStageParameter1", v11, 8u, v22))
                          {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStageParameter1(12325): Error adding 1 elements to context";
                            goto LABEL_1981;
                          }

                          break;
                        case 12324:
                          if ((_DWORD)v16 != 8) {
                            sub_100018D50( "ASPMSPParseBufferToCxt: dspExceptionParameter144(12324): cfg 1 elements; (1*8) cfg bytes !"
                          }
                              "= (%d) buffer bytes",
                              a2,
                              a3,
                              a4,
                              a5,
                              a6,
                              a7,
                              a8,
                              v16);
                          else {
                            unsigned int v22 = v16 >> 3;
                          }
                          if (!sub_100011E74(a1, "dspExceptionParameter144", v11, 8u, v22))
                          {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter144(12324): Error adding 1 elements to context";
                            goto LABEL_1981;
                          }

                          break;
                        default:
LABEL_1404:
                          switch(v17)
                          {
                            case 8245:
                              if ((_DWORD)v16 != 4) {
                                sub_100018D50( "ASPMSPParseBufferToCxt: spi_num_uses(8245): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                              }
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: spi_num_uses(8245): Error adding 1 elements to context";
                              break;
                            case 8246:
                              if ((_DWORD)v16 != 20) {
                                sub_100018D50( "ASPMSPParseBufferToCxt: e2e_error_count_tmode(8246): cfg 5 elements; (5*4) cfg bytes !"
                              }
                                  "= (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: e2e_error_count_tmode(8246): Error adding 5 elements to context";
                              break;
                            case 8247:
                              if ((_DWORD)v16 != 36) {
                                sub_100018D50( "ASPMSPParseBufferToCxt: rd_window_dist(8247): cfg 9 elements; (9*4) cfg bytes != (%d) buffer bytes",
                              }
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: rd_window_dist(8247): Error adding 9 elements to context";
                              break;
                            case 8248:
                              if ((_DWORD)v16 != 36) {
                                sub_100018D50( "ASPMSPParseBufferToCxt: extended_rd_window_diff_dist(8248): cfg 9 elements; (9*4) cfg "
                              }
                                  "bytes != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: extended_rd_window_diff_dist(8248): Error adding 9 elements to context";
                              break;
                            case 8249:
                              if ((_DWORD)v16 != 8) {
                                sub_100018D50( "ASPMSPParseBufferToCxt: rd_retraining_failures_v2(8249): cfg 2 elements; (2*4) cfg byt"
                              }
                                  "es != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: rd_retraining_failures_v2(8249): Error adding 2 elements to context";
                              break;
                            case 8250:
                              if ((_DWORD)v16 != 120) {
                                sub_100018D50( "ASPMSPParseBufferToCxt: lower_die_temperature(8250): cfg 30 elements; (30*4) cfg bytes"
                              }
                                  " != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: lower_die_temperature(8250): Error adding 30 elements to context";
                              break;
                            case 8251:
                              if ((_DWORD)v16 != 120) {
                                sub_100018D50( "ASPMSPParseBufferToCxt: higher_die_temperature(8251): cfg 30 elements; (30*4) cfg byte"
                              }
                                  "s != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: higher_die_temperature(8251): Error adding 30 elements to context";
                              break;
                            case 8252:
                              if ((_DWORD)v16 != 36) {
                                sub_100018D50( "ASPMSPParseBufferToCxt: rd_window_dist_single_die(8252): cfg 9 elements; (9*4) cfg byt"
                              }
                                  "es != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: rd_window_dist_single_die(8252): Error adding 9 elements to context";
                              break;
                            case 8253:
                              if ((_DWORD)v16 != 16) {
                                sub_100018D50( "ASPMSPParseBufferToCxt: parallel_slip_drops_hist(8253): cfg 4 elements; (4*4) cfg byte"
                              }
                                  "s != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: parallel_slip_drops_hist(8253): Error adding 4 elements to context";
                              break;
                            case 8254:
                              if ((_DWORD)v16 != 4) {
                                sub_100018D50( "ASPMSPParseBufferToCxt: sys_halt_max_latency(8254): cfg 1 elements; (1*4) cfg bytes !="
                              }
                                  " (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: sys_halt_max_latency(8254): Error adding 1 elements to context";
                              break;
                            case 8255:
                              if ((_DWORD)v16 != 4) {
                                sub_100018D50( "ASPMSPParseBufferToCxt: sys_halt_max_latency_opcode(8255): cfg 1 elements; (1*4) cfg b"
                              }
                                  "ytes != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: sys_halt_max_latency_opcode(8255): Error adding 1 elements to context";
                              break;
                            case 8256:
                              if ((_DWORD)v16 != 4) {
                                sub_100018D50( "ASPMSPParseBufferToCxt: channel_halt_max_latency(8256): cfg 1 elements; (1*4) cfg byte"
                              }
                                  "s != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: channel_halt_max_latency(8256): Error adding 1 elements to context";
                              break;
                            case 8257:
                              if ((_DWORD)v16 != 8) {
                                sub_100018D50( "ASPMSPParseBufferToCxt: max_heap_usage_v2(8257): cfg 2 elements; (2*4) cfg bytes != (%d) buffer bytes",
                              }
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: max_heap_usage_v2(8257): Error adding 2 elements to context";
                              break;
                            default:
                              switch(v17)
                              {
                                case 16384:
                                  if ((_DWORD)v16 != 8) {
                                    sub_100018D50( "ASPMSPParseBufferToCxt: fw_version_identifier(16384): cfg 1 elements; (1*8) cfg by"
                                  }
                                      "tes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: fw_version_identifier(16384): Error adding 1 elements to context";
                                  break;
                                case 16385:
                                  if ((_DWORD)v16 != 40) {
                                    sub_100018D50( "ASPMSPParseBufferToCxt: random_read_size_ratio(16385): cfg 5 elements; (5*8) cfg b"
                                  }
                                      "ytes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: random_read_size_ratio(16385): Error adding 5 elements to context";
                                  break;
                                case 16386:
                                  if ((_DWORD)v16 != 8) {
                                    sub_100018D50( "ASPMSPParseBufferToCxt: number_gracefull_read_terminations(16386): cfg 1 elements;"
                                  }
                                      " (1*8) cfg bytes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  if (sub_100011E74( a1,  "number_gracefull_read_terminations",  v11,  8u,  v22)) {
                                    goto LABEL_1372;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: number_gracefull_read_terminations(16386): Error adding 1"
                                       " elements to context";
                                  break;
                                case 16387:
                                  if ((_DWORD)v16 != 8) {
                                    sub_100018D50( "ASPMSPParseBufferToCxt: active_time_bw_pg_acc(16387): cfg 1 elements; (1*8) cfg by"
                                  }
                                      "tes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_bw_pg_acc(16387): Error adding 1 elements to context";
                                  break;
                                case 16388:
                                  if ((_DWORD)v16 != 8) {
                                    sub_100018D50( "ASPMSPParseBufferToCxt: num_pg_events(16388): cfg 1 elements; (1*8) cfg bytes != ("
                                  }
                                      "%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: num_pg_events(16388): Error adding 1 elements to context";
                                  break;
                                case 16389:
                                  if ((_DWORD)v16 != 128) {
                                    sub_100018D50( "ASPMSPParseBufferToCxt: algo_queue_depth(16389): cfg 16 elements; (16*8) cfg bytes"
                                  }
                                      " != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: algo_queue_depth(16389): Error adding 16 elements to context";
                                  break;
                                case 16390:
                                  if ((_DWORD)v16 != 128) {
                                    sub_100018D50( "ASPMSPParseBufferToCxt: parallel_slip_hist(16390): cfg 16 elements; (16*8) cfg byt"
                                  }
                                      "es != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: parallel_slip_hist(16390): Error adding 16 elements to context";
                                  break;
                                case 16391:
                                  if ((_DWORD)v16 != 48) {
                                    sub_100018D50( "ASPMSPParseBufferToCxt: sys_halt_latency_hist(16391): cfg 6 elements; (6*8) cfg by"
                                  }
                                      "tes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: sys_halt_latency_hist(16391): Error adding 6 elements to context";
                                  break;
                                case 16392:
                                  if ((_DWORD)v16 != 48) {
                                    sub_100018D50( "ASPMSPParseBufferToCxt: channel_halt_latency_hist(16392): cfg 6 elements; (6*8) cf"
                                  }
                                      "g bytes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: channel_halt_latency_hist(16392): Error adding 6 elements to context";
                                  break;
                                case 16393:
                                  if ((_DWORD)v16 != 8) {
                                    sub_100018D50( "ASPMSPParseBufferToCxt: num_idle_die_read_cache_terminate(16393): cfg 1 elements; "
                                  }
                                      "(1*8) cfg bytes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  if (sub_100011E74( a1,  "num_idle_die_read_cache_terminate",  v11,  8u,  v22)) {
                                    goto LABEL_1372;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: num_idle_die_read_cache_terminate(16393): Error adding 1 "
                                       "elements to context";
                                  break;
                                default:
                                  goto LABEL_1373;
                              }

                              goto LABEL_1981;
                          }

                          goto LABEL_1981;
                      }

LABEL_1372:
                      uint64_t v8 = v8 + v22;
LABEL_1373:
                      uint64_t v13 = &jpt_100016250;
                      break;
                  }

                  break;
              }

              break;
          }

          break;
      }

      goto LABEL_461;
  }

uint64_t sub_100018908(uint64_t result, const char *a2, const char *a3, uint64_t a4)
{
  if (result)
  {
    int v7 = (void *)result;
    uint64_t v8 = (char *)calloc(1uLL, 0x78uLL);
    unint64_t v9 = calloc(1uLL, 0x78uLL);
    unsigned int v10 = v9;
    if (v8 && v9)
    {
      uint64_t v11 = v7[1];
      if (v11 && (uint64_t v12 = v7[3]) != 0)
      {
        *(void *)(v11 + 112) = v9;
        uint64_t v13 = (char **)(v12 + 112);
      }

      else
      {
        *int v7 = v9;
        uint64_t v13 = (char **)(v7 + 2);
      }

      __int16 *v13 = v8;
      v7[1] = v9;
      v7[3] = v8;
      *((void *)v8 + 14) = 0LL;
      *((void *)v9 + 14) = 0LL;
      snprintf(v9, 0x63uLL, "%s%s", a2, a3);
      v10[99] = 0;
      snprintf(v8, 0x63uLL, "%llu", a4);
      v8[99] = 0;
      *((void *)v8 + 13) = a4;
      return 1LL;
    }

    else
    {
      if (v8) {
        free(v8);
      }
      if (v10) {
        free(v10);
      }
      return 0LL;
    }
  }

  return result;
}

double sub_100018A0C(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(void **)a1;
    if (v2)
    {
      do
      {
        uint64_t v3 = (void *)v2[14];
        free(v2);
        uint64_t v2 = v3;
      }

      while (v3);
    }

    uint64_t v4 = *(void **)(a1 + 16);
    if (v4)
    {
      do
      {
        uint64_t v5 = (void *)v4[14];
        free(v4);
        uint64_t v4 = v5;
      }

      while (v5);
    }

    double result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }

  return result;
}

uint64_t sub_100018A64(void *a1, const char *a2, const char *a3, uint64_t a4)
{
  uint64_t v8 = (char *)malloc(0x78uLL);
  unint64_t v9 = malloc(0x78uLL);
  unsigned int v10 = v9;
  uint64_t v11 = a1[1];
  if (v11 && (uint64_t v12 = a1[3]) != 0)
  {
    *(void *)(v11 + 112) = v9;
    uint64_t v13 = (char **)(v12 + 112);
  }

  else
  {
    *a1 = v9;
    uint64_t v13 = (char **)(a1 + 2);
  }

  __int16 *v13 = v8;
  a1[1] = v9;
  a1[3] = v8;
  *((void *)v8 + 14) = 0LL;
  v9[14] = 0LL;
  snprintf((char *)v9, 0x63uLL, "%s%s", a2, a3);
  *((_BYTE *)v10 + 99) = 0;
  uint64_t result = snprintf(v8, 0x63uLL, "%llu", a4);
  v8[99] = 0;
  *((void *)v8 + 13) = a4;
  return result;
}

NSMutableDictionary *sub_100018B30(uint64_t *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v5 = *a1;
  uint64_t v6 = a1[2];
  if (*a1) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    do
    {
      if (!v3
        || (uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v5)),
            unsigned int v9 = [v3 containsObject:v8],
            v8,
            v9))
      {
        unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(v6 + 104)));
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v5));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v10, v11);
      }

      uint64_t v5 = *(void *)(v5 + 112);
      if (!v5) {
        break;
      }
      uint64_t v6 = *(void *)(v6 + 112);
    }

    while (v6);
  }

  return v4;
}

NSMutableDictionary *sub_100018C20(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100018CF0;
    v10[3] = &unk_100060590;
    id v11 = v4;
    uint64_t v6 = v5;
    uint64_t v12 = v6;
    [v3 enumerateKeysAndObjectsUsingBlock:v10];
    BOOL v7 = v12;
    uint64_t v8 = v6;
  }

  else
  {
    uint64_t v8 = (NSMutableDictionary *)v3;
  }

  return v8;
}

void sub_100018CF0(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
}

void sub_100018D50( const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (!qword_100091F58)
  {
    qword_100091F58 = (uint64_t)calloc(0x400uLL, 1uLL);
    vsnprintf(__str, 0x400uLL, a1, &a9);
    snprintf((char *)qword_100091F58, 0x400uLL, "%s", __str);
  }

const char *sub_100018E08()
{
  if (qword_100091F58) {
    return (const char *)qword_100091F58;
  }
  else {
    return "NA";
  }
}

void *sub_100018E24()
{
  return &unk_100091A90;
}

void *sub_100018E30()
{
  return &unk_100091A98;
}

void *sub_100018E3C()
{
  return &unk_100091AA0;
}

void *sub_100018E48()
{
  return &unk_100091AB0;
}

void *sub_100018E54()
{
  return &unk_100091AB8;
}

void *sub_100018E60()
{
  return &unk_100091AC0;
}

void *sub_100018E6C()
{
  return &unk_100091AC8;
}

void *sub_100018E78()
{
  return &unk_100091AD0;
}

void *sub_100018E84()
{
  return &unk_100091AA8;
}

void *sub_100018E90()
{
  return &unk_100091AD8;
}

char *sub_100018E9C(char ***a1)
{
  io_connect_t connect = 0;
  *a1 = 0LL;
  int v2 = pthread_mutex_trylock(&stru_100091AE0);
  if (v2)
  {
    if (v2 != 16
      || (syslog(4, "Warning: NANDInfo: NANDExporter: serializeAccess already locked. waiting for lock !\n"),
          pthread_mutex_lock(&stru_100091AE0)))
    {
      id v3 = __error();
      syslog(3, "Error: NANDInfo: NANDExporter: pthread_mutex_trylock() (%d) failed \n", *v3);
      return 0LL;
    }
  }

  syslog(5, "NANDInfo: NANDExporter object locked ! \n");
  id v5 = &off_100091B20;
  uint64_t result = off_100091B20;
  if (!off_100091B20)
  {
LABEL_11:
    io_object_t v8 = 0;
    goto LABEL_12;
  }

  while (1)
  {
    id v6 = IOServiceMatching(result);
    if (!v6) {
      goto LABEL_10;
    }
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v6);
    if (!MatchingService) {
      goto LABEL_10;
    }
    io_object_t v8 = MatchingService;
    if (!IOServiceOpen(MatchingService, mach_task_self_, 0, &connect)) {
      break;
    }
    IOServiceClose(connect);
    io_connect_t connect = 0;
    IOObjectRelease(v8);
LABEL_10:
    unsigned int v9 = v5[21];
    v5 += 21;
    uint64_t result = (char *)v9;
    if (!v9) {
      goto LABEL_11;
    }
  }

  syslog(5, "NANDInfo: findNandExporter_tunnel: Controller found: %s\n", *v5);
  uint64_t result = (char *)1;
LABEL_12:
  *((_DWORD *)v5 + 4) = connect;
  *((_DWORD *)v5 + 5) = v8;
  *a1 = v5;
  return result;
}

uint64_t sub_100018FE4(uint64_t a1)
{
  io_connect_t v2 = *(_DWORD *)(a1 + 16);
  if (v2)
  {
    IOServiceClose(v2);
    *(_DWORD *)(a1 + 16) = 0;
  }

  io_object_t v3 = *(_DWORD *)(a1 + 20);
  if (v3)
  {
    IOObjectRelease(v3);
    *(_DWORD *)(a1 + 20) = 0;
  }

  syslog(5, "NANDInfo: NANDExporter object unlocked ! \n");
  return pthread_mutex_unlock(&stru_100091AE0);
}

void *sub_10001A3EC(char **a1, int a2, int a3, int a4, void *a5, char a6, char a7)
{
  uint64_t v13 = a1;
  unsigned int v21 = 0LL;
  *a5 = 0LL;
  if (!a1 && (!sub_100018E9C(&v21) || (uint64_t v13 = v21) == 0LL || !*((_DWORD *)v21 + 4)))
  {
    fwrite("Err: Finding internal NAND exporter failed for fetch tunnel buffer.\n", 0x44uLL, 1uLL, __stderrp);
LABEL_11:
    uint64_t v19 = 0LL;
    goto LABEL_14;
  }

  int v14 = a3;
  unsigned int v15 = sub_10001A588((uint64_t)v13, a2, a3, a4, a7);
  if (!v15)
  {
    fprintf(__stderrp, "failed to get data size for cmd option %d\n", a2);
    goto LABEL_11;
  }

  uint64_t v16 = v15;
  size_t v17 = (vm_page_size + v15 - 1) / vm_page_size * vm_page_size;
  uint64_t v18 = valloc(v17);
  uint64_t v19 = v18;
  if (v18)
  {
    bzero(v18, v17);
    if ((sub_10001A64C((uint64_t)v13, a2, v14, a4, v19, v17, a6, a7) & 1) != 0)
    {
      *a5 = v16;
    }

    else
    {
      free(v19);
      uint64_t v19 = 0LL;
      *a5 = 0LL;
    }
  }

  else
  {
    fwrite("can't allocate buffer!\n", 0x17uLL, 1uLL, __stderrp);
  }

uint64_t sub_10001A588(uint64_t a1, int a2, int a3, int a4, char a5)
{
  kern_return_t v7;
  uint64_t result;
  size_t outputStructCnt;
  unsigned int outputStruct;
  _DWORD inputStruct[3];
  uint64_t v12;
  int v13;
  uint64_t v13 = 0;
  uint64_t v12 = 0LL;
  outputStructCnt = 4LL;
  inputStruct[0] = a2;
  inputStruct[1] = a3 | 1;
  inputStruct[2] = a4;
  BOOL v7 = IOConnectCallStructMethod( *(_DWORD *)(a1 + 16),  *(_DWORD *)(a1 + 28),  inputStruct,  0x18uLL,  &outputStruct,  &outputStructCnt);
  if (v7)
  {
    if ((a5 & 1) == 0) {
      fprintf(__stderrp, "Error calling CoreDebugTunnel method! - 0x%X\n", v7);
    }
    return 0LL;
  }

  else
  {
    uint64_t result = outputStruct;
    if (!outputStruct && (a5 & 1) == 0)
    {
      fprintf(__stderrp, "SizeOnly for tunnel command 0x%x returned 0\n", a2);
      return outputStruct;
    }
  }

  return result;
}

uint64_t sub_10001A64C(uint64_t a1, int a2, int a3, int a4, void *outputStruct, size_t a6, char a7, char a8)
{
  kern_return_t v15;
  size_t v16;
  _DWORD inputStruct[3];
  uint64_t v19;
  int v20;
  size_t outputStructCnt;
  LOBYTE(v9) = a7;
  outputStructCnt = a6;
  unsigned int v20 = 0;
  uint64_t v19 = 0LL;
  while (1)
  {
    inputStruct[0] = a2;
    inputStruct[1] = a3;
    inputStruct[2] = a4;
    unsigned int v15 = IOConnectCallStructMethod( *(_DWORD *)(a1 + 16),  *(_DWORD *)(a1 + 28),  inputStruct,  0x18uLL,  outputStruct,  &outputStructCnt);
    if (v15 != -536870211) {
      break;
    }
    if ((v9 & 1) == 0) {
      goto LABEL_10;
    }
    if ((a8 & 1) == 0) {
      fprintf(__stderrp, "CoreDebugTunnel 0x%x returned kIOReturnNoMemory\n", a2);
    }
    uint64_t v16 = outputStructCnt;
    outputStructCnt = vm_page_size;
    uint64_t v9 = 1LL;
    if (vm_page_size == v16) {
      return v9;
    }
  }

  if (!v15) {
    return 1LL;
  }
LABEL_10:
  if ((a8 & 1) == 0) {
    fprintf(__stderrp, "Error calling CoreDebugTunnel method! - 0x%X\n", v15);
  }
  return 0LL;
}

id stringOrNull(void *a1)
{
  id v1 = a1;
  io_connect_t v2 = v1;
  if (v1) {
    id v3 = v1;
  }
  else {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v4 = v3;

  return v4;
}

id numberOrNull(void *a1)
{
  id v1 = a1;
  io_connect_t v2 = v1;
  if (v1) {
    id v3 = v1;
  }
  else {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v4 = v3;

  return v4;
}

BOOL isValidSerialNumber(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSString);
  BOOL v3 = (objc_opt_isKindOfClass(v1, v2) & 1) != 0 && (unint64_t)[v1 length] > 3;

  return v3;
}

void sub_10001A8E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10001A8F8(uint64_t result, int a2)
{
  if (a2) {
    *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
  }
  return result;
}

void sub_10001AB50(uint64_t a1, io_service_t service)
{
  kern_return_t v3;
  kern_return_t v4;
  uint64_t v5;
  os_log_s *v6;
  kern_return_t v7;
  kern_return_t v8;
  uint64_t v9;
  os_log_s *v10;
  io_connect_t connect;
  uint8_t buf[4];
  kern_return_t v13;
  io_connect_t connect = 0;
  if (service)
  {
    BOOL v3 = IOServiceOpen(service, mach_task_self_, 0, &connect);
    if (v3)
    {
      id v4 = v3;
      id v5 = DiagnosticLogHandleForCategory(6LL);
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        uint64_t v13 = v4;
        _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Failed to open connection (err = %d).",  buf,  8u);
      }
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  if (connect)
  {
    BOOL v7 = IOServiceClose(connect);
    if (v7)
    {
      io_object_t v8 = v7;
      uint64_t v9 = DiagnosticLogHandleForCategory(6LL);
      unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        uint64_t v13 = v8;
        _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Failed to close connection (err = %d).",  buf,  8u);
      }
    }
  }

void sub_10001AD58( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10001AD70(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001AD80(uint64_t a1)
{
}

void sub_10001AD88(uint64_t a1, mach_port_t connection)
{
  kern_return_t v3;
  kern_return_t v4;
  uint64_t v5;
  os_log_s *v6;
  uint64_t v7;
  uint64_t v8;
  uint32_t outputCnt;
  uint64_t output;
  uint8_t buf[4];
  kern_return_t v12;
  if (connection)
  {
    output = 0LL;
    outputCnt = 1;
    BOOL v3 = IOConnectCallScalarMethod(connection, 1u, 0LL, 0, &output, &outputCnt);
    if (v3)
    {
      id v4 = v3;
      id v5 = DiagnosticLogHandleForCategory(6LL);
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        uint64_t v12 = v4;
        _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "PMPThermal fan speed retrieval failed (err = %d).",  buf,  8u);
      }
    }

    else
    {
      BOOL v7 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", output));
      io_object_t v8 = *(void *)(*(void *)(a1 + 32) + 8LL);
      id v6 = *(os_log_s **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
  }

CFIndex sub_10001B090(const __CFString *a1)
{
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 == CFBooleanGetTypeID()) {
    return 1LL;
  }
  if (v2 == CFNumberGetTypeID()) {
    return CFNumberGetByteSize((CFNumberRef)a1);
  }
  if (v2 == CFStringGetTypeID()) {
    return CFStringGetLength(a1);
  }
  if (v2 == CFDataGetTypeID()) {
    return CFDataGetLength((CFDataRef)a1);
  }
  return 0LL;
}

BOOL findDeviceWithName(unsigned __int8 *a1)
{
  int v9 = 0;
  BOOL v2 = 0LL;
  if (!FindDevicesWithProp("IOService:name", a1, (uint64_t)v12, 10, &v9))
  {
    int v3 = v9;
    BOOL v2 = v9 != 0;
    uint64_t v4 = DiagnosticLogHandleForCategory(6LL);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v6)
      {
        *(_DWORD *)buf = 136315138;
        id v11 = a1;
        BOOL v7 = "%s found.";
LABEL_9:
        _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, v7, buf, 0xCu);
      }
    }

    else if (v6)
    {
      *(_DWORD *)buf = 136315138;
      id v11 = a1;
      BOOL v7 = "%s not found.";
      goto LABEL_9;
    }
  }

  return v2;
}

uint64_t FindDevicesWithProp(const char *a1, unsigned __int8 *a2, uint64_t a3, int a4, int *a5)
{
  if (!a5 || !a1 || !a3 || a4 <= 0)
  {
    uint64_t v14 = DiagnosticLogHandleForCategory(6LL);
    unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)cStr = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Could not find devices with property.",  (uint8_t *)cStr,  2u);
    }

    return 1LL;
  }

  strcpy((char *)plane, "IODeviceTree");
  __strcpy_chk(cStr, a1, 128LL);
  size_t v10 = strlen(a1);
  if (v10)
  {
    uint64_t v11 = 0LL;
    unsigned int v12 = 1;
    while (a1[v11] != 58)
    {
      uint64_t v11 = v12;
      if (v10 <= v12++) {
        goto LABEL_14;
      }
    }

    memset(plane, 0, sizeof(plane));
    *(_OWORD *)cStr = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __strncpy_chk(plane, a1);
    size_t v17 = &a1[v12];
    strlen(v17);
    __strncpy_chk(cStr, v17);
  }

void sub_10001B6D0(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  BOOL v2 = (void *)qword_100091F38;
  qword_100091F38 = (uint64_t)v1;
}

void sub_10001D61C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10001D63C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001D64C(uint64_t a1)
{
}

void sub_10001D654(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  uint64_t v2 = objc_claimAutoreleasedReturnValue([v5 systemVersion]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10001E87C(id a1)
{
  id v1 = (id)MGCopyAnswer(@"ReleaseType", 0LL);
}

void sub_10001E908(id a1)
{
  byte_100091F41 = os_variant_has_internal_content("com.apple.DiagnosticsService.SystemReport");
}

LABEL_12:
  return 0LL;
}

LABEL_10:
}

id objc_msgSend_wifiDeviceCount(void *a1, const char *a2, ...)
{
  return [a1 wifiDeviceCount];
}