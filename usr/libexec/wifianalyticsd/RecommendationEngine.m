@interface RecommendationEngine
- (BOOL)canCaptureforDPS;
- (BOOL)canWDforDPS;
- (NSMutableDictionary)dpsWDBudgetDict;
- (RecommendationEngine)init;
- (RecommendationPreferences)preferences;
- (float)medianCCA:(id)a3;
- (void)addNumRecommendedCapture;
- (void)addNumRecommendedWD;
- (void)addNumSuppressedCapture;
- (void)addNumSuppressedWD;
- (void)isDatapathStudyShowingDPS:(id)a3 andReply:(id)a4;
- (void)recommendActionFromData:(id)a3 andReply:(id)a4;
- (void)setDpsWDBudgetDict:(id)a3;
- (void)setPreferences:(id)a3;
@end

@implementation RecommendationEngine

- (RecommendationEngine)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___RecommendationEngine;
  v2 = -[RecommendationEngine init](&v11, "init");
  if (!v2)
  {
    id v7 = WALogCategoryDefaultHandle();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v13 = "-[RecommendationEngine init]";
      __int16 v14 = 1024;
      int v15 = 35;
      v9 = "%{public}s::%d:Error super init";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v9, buf, 0x12u);
    }

- (BOOL)canWDforDPS
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_dpsWDBudgetDict, "valueForKey:", @"dps_lastWD"));

  if (v4)
  {
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_dpsWDBudgetDict, "valueForKey:", @"dps_lastWD"));
    [v3 timeIntervalSinceDate:v5];
    double v7 = v6;
    double v8 = (double)(60 * -[RecommendationPreferences minutes_between_dps_wd](self->_preferences, "minutes_between_dps_wd"));
    id v9 = WALogCategoryDefaultHandle();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    objc_super v11 = v10;
    BOOL v12 = v7 > v8;
    if (v7 <= v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 136446978;
        v19 = "-[RecommendationEngine canWDforDPS]";
        __int16 v20 = 1024;
        int v21 = 61;
        __int16 v22 = 2048;
        double v23 = v7;
        __int16 v24 = 2112;
        v25 = v5;
        v13 = "%{public}s::%d:DPS Not Allowed - Last DPS WD was %f seconds ago at %@";
        __int16 v14 = v11;
        os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_10;
      }
    }

    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136446978;
      v19 = "-[RecommendationEngine canWDforDPS]";
      __int16 v20 = 1024;
      int v21 = 58;
      __int16 v22 = 2048;
      double v23 = v7;
      __int16 v24 = 2112;
      v25 = v5;
      v13 = "%{public}s::%d:DPS Allowed - Last DPS WD was %f seconds ago at %@";
      __int16 v14 = v11;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v14, v15, v13, (uint8_t *)&v18, 0x26u);
    }

    goto LABEL_12;
  }

  id v16 = WALogCategoryDefaultHandle();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136446466;
    v19 = "-[RecommendationEngine canWDforDPS]";
    __int16 v20 = 1024;
    int v21 = 52;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:kDPSLastWD not yet populated",  (uint8_t *)&v18,  0x12u);
  }

  BOOL v12 = 1;
LABEL_12:

  return v12;
}

- (BOOL)canCaptureforDPS
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_dpsWDBudgetDict, "valueForKey:", @"dps_lastCapture"));

  if (v4)
  {
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary valueForKey:]( self->_dpsWDBudgetDict,  "valueForKey:",  @"dps_lastCapture"));
    [v3 timeIntervalSinceDate:v5];
    uint64_t v7 = v6;
    id v8 = WALogCategoryDefaultHandle();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446978;
      v13 = "-[RecommendationEngine canCaptureforDPS]";
      __int16 v14 = 1024;
      int v15 = 76;
      __int16 v16 = 2048;
      uint64_t v17 = v7;
      __int16 v18 = 2112;
      v19 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Capture Allowed - Last DPS WD was %f seconds ago at %@",  (uint8_t *)&v12,  0x26u);
    }
  }

  else
  {
    id v10 = WALogCategoryDefaultHandle();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136446466;
      v13 = "-[RecommendationEngine canCaptureforDPS]";
      __int16 v14 = 1024;
      int v15 = 71;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:kDPSLastCapture not yet populated",  (uint8_t *)&v12,  0x12u);
    }
  }

  return 1;
}

- (float)medianCCA:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fieldForKey:@"DPSR_dpsCounterSamples"]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 repeatableValues]);
  uint64_t v6 = (const char *)[v5 count];

  if ((unint64_t)v6 > 1)
  {
    unint64_t v56 = 0LL;
    v57 = v6 - 1;
    unsigned int v15 = 0;
    v55 = 0LL;
    for (i = v3; ; id v3 = i)
    {
      __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v3 fieldForKey:@"DPSR_dpsCounterSamples"]);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 repeatableValues]);
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndex:0]);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 fieldForKey:@"DPSCS_peerStats"]);
      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 subMessageValue]);
      int v21 = (void *)objc_claimAutoreleasedReturnValue([v20 fieldForKey:@"NWAPS_ccas"]);
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 repeatableValues]);
      id v23 = [v22 count];

      uint64_t v24 = v15;
      v67 = (void *)objc_claimAutoreleasedReturnValue([v3 fieldForKey:@"DPSR_dpsCounterSamples"]);
      v66 = (void *)objc_claimAutoreleasedReturnValue([v67 repeatableValues]);
      v65 = (void *)objc_claimAutoreleasedReturnValue([v66 objectAtIndex:v57]);
      v64 = (void *)objc_claimAutoreleasedReturnValue([v65 fieldForKey:@"DPSCS_peerStats"]);
      v63 = (void *)objc_claimAutoreleasedReturnValue([v64 subMessageValue]);
      v62 = (void *)objc_claimAutoreleasedReturnValue([v63 fieldForKey:@"NWAPS_ccas"]);
      v61 = (void *)objc_claimAutoreleasedReturnValue([v62 repeatableValues]);
      v60 = (void *)objc_claimAutoreleasedReturnValue([v61 objectAtIndex:v15]);
      v59 = (void *)objc_claimAutoreleasedReturnValue([v60 fieldForKey:@"NWASB_residentTime"]);
      v25 = [v59 uint64Value];
      v26 = (void *)objc_claimAutoreleasedReturnValue([v3 fieldForKey:@"DPSR_dpsCounterSamples"]);
      v27 = (void *)objc_claimAutoreleasedReturnValue([v26 repeatableValues]);
      v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectAtIndex:0]);
      v29 = (void *)objc_claimAutoreleasedReturnValue([v28 fieldForKey:@"DPSCS_peerStats"]);
      v30 = (void *)objc_claimAutoreleasedReturnValue([v29 subMessageValue]);
      v31 = (void *)objc_claimAutoreleasedReturnValue([v30 fieldForKey:@"NWAPS_ccas"]);
      v32 = (void *)objc_claimAutoreleasedReturnValue([v31 repeatableValues]);
      uint64_t v69 = v24;
      v33 = (void *)objc_claimAutoreleasedReturnValue([v32 objectAtIndex:v24]);
      v34 = (void *)objc_claimAutoreleasedReturnValue([v33 fieldForKey:@"NWASB_residentTime"]);
      unint64_t v35 = v25 - (_BYTE *)[v34 uint64Value];

      if (v35 > v56)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue([i fieldForKey:@"DPSR_dpsCounterSamples"]);
        v37 = (void *)objc_claimAutoreleasedReturnValue([v36 repeatableValues]);
        v38 = (void *)objc_claimAutoreleasedReturnValue([v37 objectAtIndex:v57]);
        v39 = (void *)objc_claimAutoreleasedReturnValue([v38 fieldForKey:@"DPSCS_peerStats"]);
        v40 = (void *)objc_claimAutoreleasedReturnValue([v39 subMessageValue]);
        v41 = (void *)objc_claimAutoreleasedReturnValue([v40 fieldForKey:@"NWAPS_ccas"]);
        unint64_t v68 = v35;
        v42 = (void *)objc_claimAutoreleasedReturnValue([v41 repeatableValues]);
        v43 = (void *)objc_claimAutoreleasedReturnValue([v42 objectAtIndex:v69]);
        v44 = (void *)objc_claimAutoreleasedReturnValue([v43 fieldForKey:@"NWASB_state"]);
        uint64_t v45 = objc_claimAutoreleasedReturnValue([v44 stringValue]);

        v55 = (void *)v45;
        unint64_t v56 = v68;
      }

      unsigned int v15 = v69 + 1;
    }

    id v10 = (os_log_s *)v55;
    if (v55)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", v55));
      v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet decimalDigitCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "decimalDigitCharacterSet"));
      [v46 scanUpToCharactersFromSet:v47 intoString:0];

      v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet decimalDigitCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "decimalDigitCharacterSet"));
      id v70 = 0LL;
      [v46 scanCharactersFromSet:v48 intoString:&v70];
      id v49 = v70;

      [v49 floatValue];
      float v11 = v50;
      id v51 = WALogCategoryDefaultHandle();
      v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446978;
        v72 = "-[RecommendationEngine medianCCA:]";
        __int16 v73 = 1024;
        int v74 = 121;
        __int16 v75 = 2112;
        v76 = (const char *)v55;
        __int16 v77 = 2048;
        double v78 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:CCA %@ floatCCA %f",  buf,  0x26u);
      }
    }

    else
    {
      id v53 = WALogCategoryDefaultHandle();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
      float v11 = 65535.0;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        int v12 = "Instances populated with the same values, CCA not found (slowDPS)";
        v13 = v10;
        uint32_t v14 = 2;
        goto LABEL_18;
      }
    }
  }

  else
  {
    id v7 = WALogCategoryDefaultHandle();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v72 = "-[RecommendationEngine medianCCA:]";
      __int16 v73 = 1024;
      int v74 = 90;
      __int16 v75 = 2048;
      v76 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Not enough DPSR_dpsCounterSamples %lu",  buf,  0x1Cu);
    }

    id v9 = WALogCategoryDefaultHandle();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    float v11 = 0.0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      v72 = v6;
      int v12 = "Not enough DPSR_dpsCounterSamples %lu";
      v13 = v10;
      uint32_t v14 = 12;
LABEL_18:
      _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, v12, buf, v14);
    }
  }

  return v11;
}

- (void)isDatapathStudyShowingDPS:(id)a3 andReply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, const __CFString *))a4;
  int v125 = 0;
  uint64_t v140 = 0LL;
  uint64_t v141 = 0LL;
  uint64_t v138 = 0LL;
  uint64_t v139 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 fieldForKey:@"DPSR_dpsCounterSamples"]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 repeatableValues]);
  id v10 = (char *)[v9 count];

  id v11 = WALogCategoryDefaultHandle();
  int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  uint32_t v14 = v10 - 1;
  if ((unint64_t)v10 <= 1)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v127 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
      __int16 v128 = 1024;
      int v129 = 147;
      __int16 v130 = 2048;
      *(void *)v131 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Not enough samples %lu",  buf,  0x1Cu);
    }

    v7[2](v7, 0LL, &stru_1000CF610);
    goto LABEL_64;
  }

  v113 = v7;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v127 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
    __int16 v128 = 1024;
    int v129 = 152;
    __int16 v130 = 2048;
    *(void *)v131 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Called with countOfSamples %lu",  buf,  0x1Cu);
  }

  v111 = v10;

  v123 = v6;
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v6 fieldForKey:@"DPSR_dpsCounterSamples"]);
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 repeatableValues]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectAtIndex:0]);
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 fieldForKey:@"DPSCS_peerStats"]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 subMessageValue]);
  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 fieldForKey:@"NWAPS_acCompletions"]);
  int v21 = (void *)objc_claimAutoreleasedReturnValue([v20 repeatableValues]);
  unint64_t v22 = (unint64_t)[v21 count];

  v121 = self;
  if (v22 < 5)
  {
    v25 = v123;
    if (!v22) {
      goto LABEL_26;
    }
  }

  else
  {
    id v23 = WALogCategoryDefaultHandle();
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      v127 = (const char *)v22;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_FAULT,  "Out of range acCount found in NWAPS_acCompletions: %lu",  buf,  0xCu);
    }

    unint64_t v22 = 4LL;
    v25 = v123;
  }

  uint64_t v26 = 0LL;
  v122 = v14;
  unint64_t v114 = v22;
  do
  {
    uint64_t v124 = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "fieldForKey:", @"DPSR_dpsCounterSamples", v111));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 repeatableValues]);
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectAtIndex:v14]);
    v30 = (void *)objc_claimAutoreleasedReturnValue([v29 fieldForKey:@"DPSCS_peerStats"]);
    v31 = (void *)objc_claimAutoreleasedReturnValue([v30 subMessageValue]);
    v32 = (void *)objc_claimAutoreleasedReturnValue([v31 fieldForKey:@"NWAPS_acCompletions"]);
    v33 = (void *)objc_claimAutoreleasedReturnValue([v32 repeatableValues]);
    v34 = (void *)objc_claimAutoreleasedReturnValue([v33 objectAtIndex:v26]);
    unint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 fieldForKey:@"NWAPACTC_success"]);
    unsigned int v117 = [v35 uint32Value];

    v36 = (void *)objc_claimAutoreleasedReturnValue([v25 fieldForKey:@"DPSR_dpsCounterSamples"]);
    v37 = (void *)objc_claimAutoreleasedReturnValue([v36 repeatableValues]);
    v38 = (void *)objc_claimAutoreleasedReturnValue([v37 objectAtIndex:0]);
    v39 = (void *)objc_claimAutoreleasedReturnValue([v38 fieldForKey:@"DPSCS_peerStats"]);
    v40 = (void *)objc_claimAutoreleasedReturnValue([v39 subMessageValue]);
    v41 = (void *)objc_claimAutoreleasedReturnValue([v40 fieldForKey:@"NWAPS_acCompletions"]);
    v42 = (void *)objc_claimAutoreleasedReturnValue([v41 repeatableValues]);
    v43 = (void *)objc_claimAutoreleasedReturnValue([v42 objectAtIndex:v124]);
    v44 = (void *)objc_claimAutoreleasedReturnValue([v43 fieldForKey:@"NWAPACTC_success"]);
    unsigned int v45 = [v44 uint32Value];

    id v46 = WALogCategoryDefaultHandle();
    v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136447234;
      v127 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
      __int16 v128 = 1024;
      int v129 = 169;
      __int16 v130 = 2048;
      *(void *)v131 = v122;
      *(_WORD *)&v131[8] = 1024;
      *(_DWORD *)v132 = v117;
      *(_WORD *)&v132[4] = 1024;
      *(_DWORD *)v133 = v45;
      _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:NWAPACTC_success[%lu] %u NWAPACTC_success[0] %u ",  buf,  0x28u);
    }

    *((_DWORD *)&v140 + v124) = v117 - v45;
    v48 = (void *)objc_claimAutoreleasedReturnValue([v123 fieldForKey:@"DPSR_dpsCounterSamples"]);
    id v49 = (void *)objc_claimAutoreleasedReturnValue([v48 repeatableValues]);
    float v50 = (void *)objc_claimAutoreleasedReturnValue([v49 objectAtIndex:v122]);
    id v51 = (void *)objc_claimAutoreleasedReturnValue([v50 fieldForKey:@"DPSCS_peerStats"]);
    v52 = (void *)objc_claimAutoreleasedReturnValue([v51 subMessageValue]);
    id v53 = (void *)objc_claimAutoreleasedReturnValue([v52 fieldForKey:@"NWAPS_acCompletions"]);
    v54 = (void *)objc_claimAutoreleasedReturnValue([v53 repeatableValues]);
    v55 = (void *)objc_claimAutoreleasedReturnValue([v54 objectAtIndex:v124]);
    unint64_t v56 = (void *)objc_claimAutoreleasedReturnValue([v55 fieldForKey:@"NWAPACTC_qeuedPackets"]);
    unsigned int v118 = [v56 uint32Value];

    v57 = (void *)objc_claimAutoreleasedReturnValue([v123 fieldForKey:@"DPSR_dpsCounterSamples"]);
    v58 = (void *)objc_claimAutoreleasedReturnValue([v57 repeatableValues]);
    v59 = (void *)objc_claimAutoreleasedReturnValue([v58 objectAtIndex:0]);
    v60 = (void *)objc_claimAutoreleasedReturnValue([v59 fieldForKey:@"DPSCS_peerStats"]);
    v61 = (void *)objc_claimAutoreleasedReturnValue([v60 subMessageValue]);
    v62 = (void *)objc_claimAutoreleasedReturnValue([v61 fieldForKey:@"NWAPS_acCompletions"]);
    v63 = (void *)objc_claimAutoreleasedReturnValue([v62 repeatableValues]);
    v64 = (void *)objc_claimAutoreleasedReturnValue([v63 objectAtIndex:v124]);
    v65 = (void *)objc_claimAutoreleasedReturnValue([v64 fieldForKey:@"NWAPACTC_qeuedPackets"]);
    unsigned int v66 = [v65 uint32Value];

    id v67 = WALogCategoryDefaultHandle();
    unint64_t v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136447234;
      v127 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
      __int16 v128 = 1024;
      int v129 = 177;
      __int16 v130 = 2048;
      *(void *)v131 = v122;
      *(_WORD *)&v131[8] = 1024;
      *(_DWORD *)v132 = v118;
      *(_WORD *)&v132[4] = 1024;
      *(_DWORD *)v133 = v66;
      _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:NWAPACTC_qeuedPackets[%lu] %u NWAPACTC_qeuedPackets[0] %u ",  buf,  0x28u);
    }

    if (v118) {
      BOOL v69 = v66 == 0;
    }
    else {
      BOOL v69 = 1;
    }
    uint8_t v70 = !v69;
    buf[v124 - 4] = v70;
    v119 = (void *)objc_claimAutoreleasedReturnValue([v123 fieldForKey:@"DPSR_dpsCounterSamples"]);
    v71 = (void *)objc_claimAutoreleasedReturnValue([v119 repeatableValues]);
    v72 = (void *)objc_claimAutoreleasedReturnValue([v71 objectAtIndex:v122]);
    __int16 v73 = (void *)objc_claimAutoreleasedReturnValue([v72 fieldForKey:@"DPSCS_peerStats"]);
    int v74 = (void *)objc_claimAutoreleasedReturnValue([v73 subMessageValue]);
    __int16 v75 = (void *)objc_claimAutoreleasedReturnValue([v74 fieldForKey:@"NWAPS_acCompletions"]);
    v76 = (void *)objc_claimAutoreleasedReturnValue([v75 repeatableValues]);
    __int16 v77 = (void *)objc_claimAutoreleasedReturnValue([v76 objectAtIndex:v124]);
    double v78 = (void *)objc_claimAutoreleasedReturnValue([v77 fieldForKey:@"NWAPACTC_durSinceLastEnqueueAtLastCheck"]);
    unsigned int v79 = [v78 uint32Value];
    *((_DWORD *)&v138 + v124) = v79;

    uint32_t v14 = v122;
    id v80 = WALogCategoryDefaultHandle();
    v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      v127 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
      __int16 v128 = 1024;
      int v129 = 183;
      __int16 v130 = 2048;
      *(void *)v131 = v122;
      *(_WORD *)&v131[8] = 1024;
      *(_DWORD *)v132 = v79;
      _os_log_impl( (void *)&_mh_execute_header,  v81,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:NWAPACTC_durSinceLastEnqueueAtLastCheck[%lu] %u",  buf,  0x22u);
    }

    v25 = v123;
    uint64_t v26 = v124 + 1;
  }

  while (v114 != v124 + 1);
LABEL_26:
  uint64_t v82 = 0LL;
  char v83 = 0;
  v84 = 0LL;
  do
  {
    char v115 = v83;
    v120 = v84;
    uint64_t v85 = v82;
    while (1)
    {
      id v86 = WALogCategoryDefaultHandle();
      v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
      {
        int v88 = *((_DWORD *)&v140 + v85);
        int v89 = buf[v85 - 4];
        int v90 = *((_DWORD *)&v138 + v85);
        *(_DWORD *)buf = 136448002;
        v127 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
        __int16 v128 = 1024;
        int v129 = 188;
        __int16 v130 = 1024;
        *(_DWORD *)v131 = v85;
        *(_WORD *)&v131[4] = 1024;
        *(_DWORD *)&v131[6] = v88;
        *(_WORD *)v132 = 1024;
        *(_DWORD *)&v132[2] = v85;
        *(_WORD *)v133 = 1024;
        *(_DWORD *)&v133[2] = v89;
        __int16 v134 = 1024;
        int v135 = v85;
        __int16 v136 = 1024;
        int v137 = v90;
        _os_log_impl( (void *)&_mh_execute_header,  v87,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Evaluating deltaSuccessPerAC[%d] %d queuedPendingAtBeginningAndEnd[%d] %d durSinceLastEnqueueAt LastCheck[%d] %d",  buf,  0x36u);
      }

      if (-[RecommendationPreferences force_dps_recommend_always](v121->_preferences, "force_dps_recommend_always"))
      {
        id v91 = WALogCategoryDefaultHandle();
        v92 = (os_log_s *)objc_claimAutoreleasedReturnValue(v91);
        if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v127 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
          __int16 v128 = 1024;
          int v129 = 191;
          _os_log_impl( (void *)&_mh_execute_header,  v92,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:force_dps_recommend_always is true, faking 0 success, pending data, and a a long stall",  buf,  0x12u);
        }

        LODWORD(v141) = 0;
        BYTE2(v125) = 1;
        LODWORD(v139) = 4000
                      * -[RecommendationPreferences dps_stall_dur_for_wd]( v121->_preferences,  "dps_stall_dur_for_wd");
      }

      if (!*((_DWORD *)&v140 + v85))
      {
        if (buf[v85 - 4])
        {
          unint64_t v93 = *((unsigned int *)&v138 + v85);
          if (1000 {
        }
          }
      }

      if (++v85 == 4)
      {
        if ((v115 & 1) != 0)
        {
          v84 = v120;
          goto LABEL_51;
        }

        id v105 = WALogCategoryDefaultHandle();
        v106 = (os_log_s *)objc_claimAutoreleasedReturnValue(v105);
        id v6 = v123;
        id v7 = (void (**)(id, void, const __CFString *))v113;
        if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v127 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
          __int16 v128 = 1024;
          int v129 = 227;
          _os_log_impl( (void *)&_mh_execute_header,  v106,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:sDPS: Recommending WARecommendNull",  buf,  0x12u);
        }

        v102 = (void (*)(void *, uint64_t, void *))v113[2];
        v103 = v113;
        uint64_t v104 = 0LL;
        v84 = v120;
LABEL_62:
        v102(v103, v104, v84);
        goto LABEL_63;
      }
    }

    -[RecommendationEngine medianCCA:](v121, "medianCCA:", v123);
    if (v94 >= 35.0)
    {
      -[RecommendationEngine medianCCA:](v121, "medianCCA:", v123);
      else {
        v95 = @"Data Path Stuck~Med CCA";
      }
    }

    else
    {
      v95 = @"Data Path Stuck~Low CCA";
    }

    uint64_t v116 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v95, v111));

    id v97 = WALogCategoryDefaultHandle();
    v98 = (os_log_s *)objc_claimAutoreleasedReturnValue(v97);
    if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v127 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
      __int16 v128 = 1024;
      int v129 = 210;
      __int16 v130 = 2112;
      *(void *)v131 = v116;
      _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%@", buf, 0x1Cu);
    }

    uint64_t v82 = v85 + 1;
    char v83 = 1;
    BOOL v69 = v85 == 3;
    v84 = (void *)v116;
  }

  while (!v69);
LABEL_51:
  id v99 = -[RecommendationPreferences dps_capture_evaluated_at_sample]( v121->_preferences,  "dps_capture_evaluated_at_sample",  v111);
  if (v112 == v99)
  {
    id v100 = WALogCategoryDefaultHandle();
    v101 = (os_log_s *)objc_claimAutoreleasedReturnValue(v100);
    id v6 = v123;
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v127 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
      __int16 v128 = 1024;
      int v129 = 218;
      _os_log_impl( (void *)&_mh_execute_header,  v101,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:sDPS: Recommending WARecommendFullCapture",  buf,  0x12u);
    }

    id v7 = (void (**)(id, void, const __CFString *))v113;
    v102 = (void (*)(void *, uint64_t, void *))v113[2];
    v103 = v113;
    uint64_t v104 = 1LL;
    goto LABEL_62;
  }

  id v107 = -[RecommendationPreferences dps_trap_evaluated_at_sample](v121->_preferences, "dps_trap_evaluated_at_sample");
  id v108 = WALogCategoryDefaultHandle();
  v109 = (os_log_s *)objc_claimAutoreleasedReturnValue(v108);
  v110 = v109;
  id v6 = v123;
  if (v112 == v107)
  {
    if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v127 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
      __int16 v128 = 1024;
      int v129 = 222;
      _os_log_impl( (void *)&_mh_execute_header,  v110,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:sDPS: Recommending WARecommendTrapWatchdog",  buf,  0x12u);
    }

    id v7 = (void (**)(id, void, const __CFString *))v113;
    v102 = (void (*)(void *, uint64_t, void *))v113[2];
    v103 = v113;
    uint64_t v104 = 2LL;
    goto LABEL_62;
  }

  if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v127 = "-[RecommendationEngine isDatapathStudyShowingDPS:andReply:]";
    __int16 v128 = 1024;
    int v129 = 232;
    _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Returning", buf, 0x12u);
  }

  id v7 = (void (**)(id, void, const __CFString *))v113;
  ((void (*)(void *, void, const __CFString *))v113[2])(v113, 0LL, &stru_1000CF610);
LABEL_63:

LABEL_64:
}

- (void)addNumRecommendedWD
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary valueForKey:]( self->_dpsWDBudgetDict,  "valueForKey:",  @"dps_numRecommendedWD"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary valueForKey:]( self->_dpsWDBudgetDict,  "valueForKey:",  @"dps_numRecommendedWD"));
    id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v4 intValue] + 1));
  }

  else
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
  }

  -[NSMutableDictionary setObject:forKey:]( self->_dpsWDBudgetDict,  "setObject:forKey:",  v5,  @"dps_numRecommendedWD");
}

- (void)addNumSuppressedWD
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary valueForKey:]( self->_dpsWDBudgetDict,  "valueForKey:",  @"dps_numSuppressedWD"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary valueForKey:]( self->_dpsWDBudgetDict,  "valueForKey:",  @"dps_numSuppressedWD"));
    id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v4 intValue] + 1));
  }

  else
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
  }

  -[NSMutableDictionary setObject:forKey:]( self->_dpsWDBudgetDict,  "setObject:forKey:",  v5,  @"dps_numSuppressedWD");
}

- (void)addNumRecommendedCapture
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary valueForKey:]( self->_dpsWDBudgetDict,  "valueForKey:",  @"dps_numRecommendedCapture"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary valueForKey:]( self->_dpsWDBudgetDict,  "valueForKey:",  @"dps_numRecommendedCapture"));
    id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v4 intValue] + 1));
  }

  else
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
  }

  -[NSMutableDictionary setObject:forKey:]( self->_dpsWDBudgetDict,  "setObject:forKey:",  v5,  @"dps_numRecommendedCapture");
}

- (void)addNumSuppressedCapture
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary valueForKey:]( self->_dpsWDBudgetDict,  "valueForKey:",  @"dps_numSuppressedCapture"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary valueForKey:]( self->_dpsWDBudgetDict,  "valueForKey:",  @"dps_numSuppressedCapture"));
    id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v4 intValue] + 1));
  }

  else
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
  }

  -[NSMutableDictionary setObject:forKey:]( self->_dpsWDBudgetDict,  "setObject:forKey:",  v5,  @"dps_numSuppressedCapture");
}

- (void)recommendActionFromData:(id)a3 andReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!-[RecommendationPreferences disable_dps_wd](self->_preferences, "disable_dps_wd"))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 fieldForKey:@"DPSR_dpsCounterSamples"]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 repeatableValues]);
    id v12 = [v11 count];
    if (v12 == (id)-[RecommendationPreferences dps_capture_evaluated_at_sample]( self->_preferences,  "dps_capture_evaluated_at_sample"))
    {
    }

    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v6 fieldForKey:@"DPSR_dpsCounterSamples"]);
      uint32_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 repeatableValues]);
      id v15 = [v14 count];
      unint64_t v16 = -[RecommendationPreferences dps_trap_evaluated_at_sample]( self->_preferences,  "dps_trap_evaluated_at_sample");

      if (v15 != (id)v16) {
        goto LABEL_9;
      }
    }

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000424F8;
    v17[3] = &unk_1000CD120;
    v17[4] = self;
    id v19 = v7;
    id v18 = v6;
    -[RecommendationEngine isDatapathStudyShowingDPS:andReply:](self, "isDatapathStudyShowingDPS:andReply:", v18, v17);

    goto LABEL_9;
  }

  id v8 = WALogCategoryDefaultHandle();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    int v21 = "-[RecommendationEngine recommendActionFromData:andReply:]";
    __int16 v22 = 1024;
    int v23 = 290;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:WARecommendNull disable_dps_wd",  buf,  0x12u);
  }

  (*((void (**)(id, void, const __CFString *))v7 + 2))(v7, 0LL, @"disable_dps_wd");
LABEL_9:
}

- (NSMutableDictionary)dpsWDBudgetDict
{
  return self->_dpsWDBudgetDict;
}

- (void)setDpsWDBudgetDict:(id)a3
{
}

- (RecommendationPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (void).cxx_destruct
{
}

@end