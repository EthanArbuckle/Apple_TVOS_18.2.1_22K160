@interface WiFiUsageLQMWindowAnalysis
+ (BOOL)isInCallAnalysisDue:(id)a3;
+ (BOOL)isKernerlParsingEnabled;
+ (id)config;
+ (unint64_t)canCreateAnalysisFor:(id)a3;
+ (unint64_t)maxConcurrentAnalysis;
+ (void)computeFeatures:(id)a3 For:(id)a4 WithLogLabel:(id)a5;
+ (void)initialize;
+ (void)updateConfig;
- (BOOL)canSubmitToCA;
- (BOOL)getBeforeKernelWindowWithLikelyhood;
- (BOOL)hasKernel;
- (BOOL)inA2dp;
- (BOOL)inCall;
- (BOOL)inEsco;
- (BOOL)isAnalysisTodo;
- (BOOL)isDone;
- (NSArray)preceedingTriggers;
- (NSDate)timestamp;
- (NSDictionary)summary;
- (NSMutableArray)subsequentTriggers;
- (NSMutableDictionary)lqmWindowsFeatures;
- (NSString)fgApp;
- (NSString)firstSubsequentLinkDownReason;
- (NSString)metricNameCDF;
- (NSString)metricNameSankey;
- (NSString)reason;
- (OS_dispatch_queue)analysisQueue;
- (OS_dispatch_source)analysisTimer;
- (WiFiUsageLQMRollingWindow)windowAfterTrigger;
- (WiFiUsageLQMRollingWindow)windowBeforeTrigger;
- (WiFiUsageLQMWindowAnalysis)initWithRollingWindow:(id)a3 andReason:(id)a4 andContext:(context)a5 andTimestamp:(id)a6 onQueue:(id)a7;
- (id)addDimensionsTo:(id)a3;
- (id)completionHandler;
- (id)description;
- (id)dumpAnalysis:(id)a3;
- (id)dumpDimensions:(id)a3;
- (id)fetchKernelLQMRollingWindowForInterface:(id)a3 into:(id)a4;
- (id)metricCallbackForMetric:(id)a3 AndField:(id)a4;
- (unint64_t)diceRoll;
- (void)computeBins:(id)a3 WithSampleKind:(Class)a4;
- (void)computeFeaturesFor:(id)a3 WithLogLabel:(id)a4;
- (void)dealloc;
- (void)performAnalysis;
- (void)setAnalysisQueue:(id)a3;
- (void)setAnalysisTimer:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDiceRoll:(unint64_t)a3;
- (void)setFgApp:(id)a3;
- (void)setFirstSubsequentLinkDownReason:(id)a3;
- (void)setHasKernel:(BOOL)a3;
- (void)setInA2dp:(BOOL)a3;
- (void)setInCall:(BOOL)a3;
- (void)setInEsco:(BOOL)a3;
- (void)setIsDone:(BOOL)a3;
- (void)setLqmWindowsFeatures:(id)a3;
- (void)setMetricNameCDF:(id)a3;
- (void)setMetricNameSankey:(id)a3;
- (void)setPreceedingTriggers:(id)a3;
- (void)setReason:(id)a3;
- (void)setSubsequentTriggers:(id)a3;
- (void)setSummary:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setWindowAfterTrigger:(id)a3;
- (void)setWindowBeforeTrigger:(id)a3;
- (void)updateWithLQMSample:(id)a3;
- (void)updateWithSubsequentTrigger:(id)a3;
@end

@implementation WiFiUsageLQMWindowAnalysis

+ (BOOL)isKernerlParsingEnabled
{
  return _isKernelParsingEnabled;
}

+ (unint64_t)maxConcurrentAnalysis
{
  return _maxConcurrentAnalysis;
}

+ (BOOL)isInCallAnalysisDue:(id)a3
{
  if (_inCallAnalysisIntervalSecEnabled != 1) {
    return 0;
  }
  [a3 timeIntervalSinceNow];
  return *(double *)&_inCallAnalysisIntervalSec <= -v3;
}

+ (id)config
{
  if (_isKernelParsingEnabled)
  {
    [NSString stringWithFormat:@"with likelyhood of fetching in-kernel LQM rolling window: %@", _fetchKernelWindowSamplingRates];
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v2 = &stru_18A170410;
  }

  if (_inCallAnalysisIntervalSecEnabled == 1)
  {
    double v3 = (void *)NSString;
    [MEMORY[0x189607968] numberWithDouble:*(double *)&_inCallAnalysisIntervalSec];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[WiFiUsagePrivacyFilter getHumanSecondsFromObject:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getHumanSecondsFromObject:",  v4);
    [v3 stringWithFormat:@"every %@", v5];
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v6 = &stru_18A170410;
  }

  v7 = @"YES";
  if (_isKernelParsingEnabled) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  if (!_inCallAnalysisIntervalSecEnabled) {
    v7 = @"NO";
  }
  objc_msgSend( NSString,  "stringWithFormat:",  @"metricPrefix set to '%@' ; cdfMetricName set to '%@' ; sankeyMetricName set to '%@' ; maxConcurrentAnalysis set to %u\nLikelyhood of creating an analsyis: %@\nLikelyhood of sending analsyis to CA: %@\nKernel window parsing enabled: %@ %@\nInCall LQMAnalysis enabled: %@ %@",
    _metricPrefix,
    _cdfMetricName,
    _sankeyMetricName,
    _maxConcurrentAnalysis,
    _createAnalysisSamplingRates,
    _submitToCASamplingRates,
    v8,
    v2,
    v7,
    v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (void)initialize
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    v4 = (void *)_metricPrefix;
    _metricPrefix = (uint64_t)@"com.apple.wifi.lqmanalysis";

    v5 = (void *)_cdfMetricName;
    _cdfMetricName = (uint64_t)@"featuresbyfield";

    v6 = (void *)_sankeyMetricName;
    _sankeyMetricName = (uint64_t)@"allfeatures";

    uint64_t v7 = objc_opt_new();
    v8 = (void *)_createAnalysisSamplingRates;
    _createAnalysisSamplingRates = v7;

    uint64_t v9 = objc_opt_new();
    v10 = (void *)_submitToCASamplingRates;
    _submitToCASamplingRates = v9;

    uint64_t v11 = objc_opt_new();
    v12 = (void *)_fetchKernelWindowSamplingRates;
    _fetchKernelWindowSamplingRates = v11;

    id v13 = objc_alloc_init(MEMORY[0x189607848]);
    v14 = (void *)_dateFormatter_1;
    _dateFormatter_1 = (uint64_t)v13;

    [(id)_dateFormatter_1 setDateFormat:@"HH:mm:ss"];
    _isKernelParsingEnabled = 0;
    _maxConcurrentAnalysis = 1LL;
    _inCallAnalysisIntervalSecEnabled = 0;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      [a1 config];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      int v16 = 136315394;
      v17 = "+[WiFiUsageLQMWindowAnalysis initialize]";
      __int16 v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v16, 0x16u);
    }
  }

+ (void)updateConfig
{
  uint64_t v69 = *MEMORY[0x1895F89C0];
  id v3 = (void *)objc_opt_class();
  if ([v3 isEqual:objc_opt_class()])
  {
    v4 = +[WiFiUsageLQMConfiguration getConfigForKey:]( &OBJC_CLASS___WiFiUsageLQMConfiguration,  "getConfigForKey:",  @"LQMWindowAnalysis");
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        [v4 objectForKey:@"MetricPrefix"];
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && ([(id)_metricPrefix isEqualToString:v5] & 1) == 0) {
            objc_storeStrong((id *)&_metricPrefix, v5);
          }
        }

        [v4 objectForKey:@"CDFMetricName"];
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && ([(id)_cdfMetricName isEqualToString:v6] & 1) == 0)
          {
            objc_storeStrong((id *)&_cdfMetricName, v6);
          }
        }

        [v4 objectForKey:@"SanKeyMetricName"];
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && ([(id)_sankeyMetricName isEqualToString:v7] & 1) == 0)
          {
            objc_storeStrong((id *)&_sankeyMetricName, v7);
          }
        }

        [v4 objectForKey:@"MaxConcurrentAnalysis"];
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0) {
            _maxConcurrentAnalysis = [v8 unsignedIntValue];
          }
        }

        [v4 objectForKey:@"AnalysisCreationSampling"];
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

        v50 = v4;
        id v51 = a1;
        if (v9)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v47 = v9;
            id v10 = v9;
            __int128 v60 = 0u;
            __int128 v61 = 0u;
            __int128 v62 = 0u;
            __int128 v63 = 0u;
            [v10 allKeys];
            uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v12 = [v11 countByEnumeratingWithState:&v60 objects:v68 count:16];
            if (v12)
            {
              uint64_t v13 = v12;
              uint64_t v14 = *(void *)v61;
              do
              {
                for (uint64_t i = 0LL; i != v13; ++i)
                {
                  if (*(void *)v61 != v14) {
                    objc_enumerationMutation(v11);
                  }
                  uint64_t v16 = *(void *)(*((void *)&v60 + 1) + 8 * i);
                  [v10 objectForKeyedSubscript:v16];
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      __int16 v18 = -[WiFiUsageLQMAnalysisSamplingRate initWithValue:]( objc_alloc(&OBJC_CLASS___WiFiUsageLQMAnalysisSamplingRate),  "initWithValue:",  v17);
                      [(id)_createAnalysisSamplingRates setObject:v18 forKeyedSubscript:v16];
                    }
                  }
                }

                uint64_t v13 = [v11 countByEnumeratingWithState:&v60 objects:v68 count:16];
              }

              while (v13);
            }

            v4 = v50;
            a1 = v51;
            uint64_t v9 = v47;
          }
        }

        [v4 objectForKey:@"EventSubmissionSampling"];
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v48 = v19;
            id v20 = v19;
            __int128 v56 = 0u;
            __int128 v57 = 0u;
            __int128 v58 = 0u;
            __int128 v59 = 0u;
            [v20 allKeys];
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v22 = [v21 countByEnumeratingWithState:&v56 objects:v67 count:16];
            if (v22)
            {
              uint64_t v23 = v22;
              uint64_t v24 = *(void *)v57;
              do
              {
                for (uint64_t j = 0LL; j != v23; ++j)
                {
                  if (*(void *)v57 != v24) {
                    objc_enumerationMutation(v21);
                  }
                  uint64_t v26 = *(void *)(*((void *)&v56 + 1) + 8 * j);
                  [v20 objectForKeyedSubscript:v26];
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v28 = -[WiFiUsageLQMAnalysisSamplingRate initWithValue:]( objc_alloc(&OBJC_CLASS___WiFiUsageLQMAnalysisSamplingRate),  "initWithValue:",  v27);
                      [(id)_submitToCASamplingRates setObject:v28 forKeyedSubscript:v26];
                    }
                  }
                }

                uint64_t v23 = [v21 countByEnumeratingWithState:&v56 objects:v67 count:16];
              }

              while (v23);
            }

            v4 = v50;
            a1 = v51;
            v19 = v48;
          }
        }

        [v4 objectForKey:@"KernelWindowParsingEnabled"];
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0) {
            _isKernelParsingEnabled = [v29 BOOLValue];
          }
        }

        [v4 objectForKey:@"KernelWindowSamplingRatePercentages"];
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v49 = v30;
            id v31 = v30;
            __int128 v52 = 0u;
            __int128 v53 = 0u;
            __int128 v54 = 0u;
            __int128 v55 = 0u;
            [v31 allKeys];
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v33 = [v32 countByEnumeratingWithState:&v52 objects:v66 count:16];
            if (v33)
            {
              uint64_t v34 = v33;
              uint64_t v35 = *(void *)v53;
              do
              {
                for (uint64_t k = 0LL; k != v34; ++k)
                {
                  if (*(void *)v53 != v35) {
                    objc_enumerationMutation(v32);
                  }
                  uint64_t v37 = *(void *)(*((void *)&v52 + 1) + 8 * k);
                  [v31 objectForKeyedSubscript:v37];
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v39 = -[WiFiUsageLQMAnalysisSamplingRate initWithValue:]( objc_alloc(&OBJC_CLASS___WiFiUsageLQMAnalysisSamplingRate),  "initWithValue:",  v38);
                      [(id)_fetchKernelWindowSamplingRates setObject:v39 forKeyedSubscript:v37];
                    }
                  }
                }

                uint64_t v34 = [v32 countByEnumeratingWithState:&v52 objects:v66 count:16];
              }

              while (v34);
            }

            v4 = v50;
            a1 = v51;
            v30 = v49;
          }
        }

        [v4 objectForKey:@"InCallAnalysisIntervalSec"];
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            [v40 doubleValue];
            _inCallAnalysisIntervalSec = v41;
            _inCallAnalysisIntervalSecEnabled = 1;
          }
        }
      }
    }
  }

  v42 = (void *)NSString;
  [a1 config];
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  [v42 stringWithFormat:@"%s: %@", "+[WiFiUsageLQMWindowAnalysis updateConfig]", v43];
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    id v45 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v44, "UTF8String"));
    uint64_t v46 = [v45 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v65 = v46;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

- (WiFiUsageLQMWindowAnalysis)initWithRollingWindow:(id)a3 andReason:(id)a4 andContext:(context)a5 andTimestamp:(id)a6 onQueue:(id)a7
{
  int v9 = *(_DWORD *)&a5.var0;
  uint64_t v79 = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a4;
  id v72 = a6;
  uint64_t v14 = (dispatch_queue_s *)a7;
  uint64_t v15 = [(id)objc_opt_class() canCreateAnalysisFor:v13];
  if (!v15)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136315394;
      *(void *)&location[4] = "-[WiFiUsageLQMWindowAnalysis initWithRollingWindow:andReason:andContext:andTimestamp:onQueue:]";
      __int16 v77 = 2112;
      id v78 = v13;
      v66 = (os_log_s *)MEMORY[0x1895F8DA0];
      v67 = "%s - Won't Create Analysis (downsampling) for reason %@";
LABEL_11:
      _os_log_impl(&dword_187EBF000, v66, OS_LOG_TYPE_DEFAULT, v67, location, 0x16u);
    }

void __94__WiFiUsageLQMWindowAnalysis_initWithRollingWindow_andReason_andContext_andTimestamp_onQueue___block_invoke( uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
}

- (void)dealloc
{
  analysisTimer = self->_analysisTimer;
  if (analysisTimer)
  {
    dispatch_source_cancel((dispatch_source_t)analysisTimer);
    v4 = self->_analysisTimer;
  }

  else
  {
    v4 = 0LL;
  }

  self->_analysisTimer = 0LL;

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMWindowAnalysis;
  -[WiFiUsageLQMWindowAnalysis dealloc](&v5, sel_dealloc);
}

- (void)updateWithLQMSample:(id)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (v4)
  {
    -[WiFiUsageLQMRollingWindow samples](self->_windowAfterTrigger, "samples");
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = -[WiFiUsageLQMRollingWindow samples](self->_windowAfterTrigger, "samples");
      if ([v6 count])
      {
        -[WiFiUsageLQMRollingWindow samples](self->_windowAfterTrigger, "samples");
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 firstObject];
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 networkDetails];
        int v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 connectedBss];
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 bssid];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v11 = 0LL;
      }
    }

    else
    {
      uint64_t v11 = 0LL;
    }

    [v4 networkDetails];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 connectedBss];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 bssid];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && ([v11 isEqualToString:v14] & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136316418;
        uint64_t v16 = "-[WiFiUsageLQMWindowAnalysis updateWithLQMSample:]";
        __int16 v17 = 2112;
        id v18 = self;
        __int16 v19 = 2160;
        uint64_t v20 = 1752392040LL;
        __int16 v21 = 2112;
        uint64_t v22 = v11;
        __int16 v23 = 2160;
        uint64_t v24 = 1752392040LL;
        __int16 v25 = 2112;
        uint64_t v26 = v14;
        _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: performing LQM window analysis for reason %@ (ending this analysis early because the BSSID has changed (%{ mask.hash}@ -> %{mask.hash}@)",  (uint8_t *)&v15,  0x3Eu);
      }

      -[WiFiUsageLQMWindowAnalysis performAnalysis](self, "performAnalysis");
    }

    else
    {
      -[WiFiUsageLQMRollingWindow addSample:](self->_windowAfterTrigger, "addSample:", v4);
    }
  }
}

- (void)updateWithSubsequentTrigger:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v7 = v4;
    -[NSMutableArray addObject:](self->_subsequentTriggers, "addObject:", v4);
    id v4 = v7;
    if (!self->_firstSubsequentLinkDownReason)
    {
      [v7 trigger];
      objc_super v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      id v4 = v7;
      if (v5 == @"LinkDown")
      {
        [v7 reason];
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[WiFiUsageLQMWindowAnalysis setFirstSubsequentLinkDownReason:](self, "setFirstSubsequentLinkDownReason:", v6);

        id v4 = v7;
      }
    }
  }
}

- (void)computeFeaturesFor:(id)a3 WithLogLabel:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_opt_class();
  lqmWindowsFeatures = self->_lqmWindowsFeatures;
  [v7 samples];
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  [v8 computeFeatures:lqmWindowsFeatures For:v10 WithLogLabel:v6];
}

+ (void)computeFeatures:(id)a3 For:(id)a4 WithLogLabel:(id)a5
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v37 = a4;
  id v38 = a5;
  [v37 firstObject];
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_class();
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  [v8 allLQMProperties];
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [obj countByEnumeratingWithState:&v43 objects:v57 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v40 = *(void *)v44;
    unint64_t v11 = 0x189607000uLL;
    do
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v44 != v40) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v14 = [v8 isPerSecond:v13];
        [v8 featureFromFieldName:v13];
        int v15 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v16 = &stru_18A170410;
        if ((_DWORD)v14) {
          uint64_t v16 = @"PerSecond";
        }
        uint64_t v17 = [*(id *)(v11 + 2600) stringWithFormat:@"%@_%@%@", v15, v13, v16, v36];
        v42 = (void *)v17;
        if (v15)
        {
          uint64_t v18 = v17;
          else {
            __int16 v19 = @"%@IntegerValueForField:ScaledByDuration:OnSamples:";
          }
          objc_msgSend(*(id *)(v11 + 2600), "stringWithFormat:", v19, v15);
          uint64_t v20 = (NSString *)objc_claimAutoreleasedReturnValue();
          aSelector = NSSelectorFromString(v20);

          uint64_t v21 = [v7 objectForKeyedSubscript:v18];
          if (!v21) {
            goto LABEL_14;
          }
          uint64_t v22 = (void *)v21;
          [v7 objectForKeyedSubscript:v42];
          uint64_t v23 = v10;
          uint64_t v24 = v8;
          id v25 = v7;
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
          [v26 objectForKeyedSubscript:v38];
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();

          id v7 = v25;
          v8 = v24;
          uint64_t v10 = v23;

          if (!v27)
          {
LABEL_14:
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v28 = (void (*)(uint64_t, const char *, void *, uint64_t, id))+[WiFiUsageLQMRollingWindow methodForSelector:]( &OBJC_CLASS___WiFiUsageLQMRollingWindow,  "methodForSelector:",  aSelector);
              uint64_t v29 = objc_opt_class();
              uint64_t v30 = v28(v29, aSelector, v13, v14, v37);
              if (v30)
              {
                id v31 = (void *)v30;
                [v7 valueForKey:v42];
                uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v32)
                {
                  uint64_t v33 = (void *)objc_opt_new();
                  [v7 setObject:v33 forKeyedSubscript:v42];
                }

                [v7 objectForKeyedSubscript:v42];
                uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
                [v34 setObject:v31 forKeyedSubscript:v38];
              }
            }

            else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
            {
              NSStringFromSelector(aSelector);
              uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136316162;
              v48 = "+[WiFiUsageLQMWindowAnalysis computeFeatures:For:WithLogLabel:]";
              __int16 v49 = 2112;
              uint64_t v50 = v35;
              __int16 v51 = 2112;
              uint64_t v52 = v15;
              __int16 v53 = 2112;
              __int128 v54 = v13;
              __int16 v55 = 2112;
              __int128 v56 = v8;
              _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s - Undefined selector %@ for feature type %@ for %@ on sample %@",  buf,  0x34u);
            }
          }
        }

        else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v48 = "+[WiFiUsageLQMWindowAnalysis computeFeatures:For:WithLogLabel:]";
          __int16 v49 = 2112;
          uint64_t v50 = 0LL;
          __int16 v51 = 2112;
          uint64_t v52 = v13;
          __int16 v53 = 2112;
          __int128 v54 = v8;
          _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s - Undefined feature type %@ for %@ on sample %@",  buf,  0x2Au);
        }

        unint64_t v11 = 0x189607000LL;
      }

      uint64_t v10 = [obj countByEnumeratingWithState:&v43 objects:v57 count:16];
    }

    while (v10);
  }
}

- (void)computeBins:(id)a3 WithSampleKind:(Class)a4
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  [v4 allKeys];
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v37;
    *(void *)&__int128 v6 = 136315394LL;
    __int128 v23 = v6;
    uint64_t v24 = *(void *)v37;
    do
    {
      uint64_t v9 = 0LL;
      uint64_t v25 = v7;
      do
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v36 + 1) + 8 * v9);
        objc_msgSend(v10, "componentsSeparatedByString:", @"_", v23);
        unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)[v11 count] > 1)
        {
          uint64_t v27 = v11;
          uint64_t v28 = v9;
          [v11 objectAtIndex:1];
          id v31 = (void *)objc_claimAutoreleasedReturnValue();
          __int128 v32 = 0u;
          __int128 v33 = 0u;
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          [v4 objectForKeyedSubscript:v10];
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          [v12 allKeys];
          id v13 = (void *)objc_claimAutoreleasedReturnValue();

          id v29 = v13;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v33;
            do
            {
              for (uint64_t i = 0LL; i != v15; ++i)
              {
                if (*(void *)v33 != v16) {
                  objc_enumerationMutation(v29);
                }
                uint64_t v18 = *(void *)(*((void *)&v32 + 1) + 8 * i);
                [v4 objectForKeyedSubscript:v10];
                __int16 v19 = (void *)objc_claimAutoreleasedReturnValue();
                [v19 objectForKeyedSubscript:v18];
                uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
                -[objc_class binLabelfromFieldName:value:]( a4,  "binLabelfromFieldName:value:",  v31,  [v20 integerValue]);
                uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
                [v4 objectForKeyedSubscript:v10];
                uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
                [v22 setObject:v21 forKeyedSubscript:v18];
              }

              uint64_t v15 = [v29 countByEnumeratingWithState:&v32 objects:v40 count:16];
            }

            while (v15);
          }

          uint64_t v8 = v24;
          uint64_t v7 = v25;
          unint64_t v11 = v27;
          uint64_t v9 = v28;
        }

        else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v23;
          v42 = "-[WiFiUsageLQMWindowAnalysis computeBins:WithSampleKind:]";
          __int16 v43 = 2112;
          __int128 v44 = v10;
          _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s - FeatureFieldName:%@ Unable to extract binFieldName",  buf,  0x16u);
        }

        ++v9;
      }

      while (v9 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    }

    while (v7);
  }
}

- (BOOL)isAnalysisTodo
{
  return self->_summary == 0LL;
}

- (void)performAnalysis
{
  uint64_t v79 = *MEMORY[0x1895F89C0];
  -[WiFiUsageLQMRollingWindow samples](self->_windowBeforeTrigger, "samples");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WiFiUsageLQMRollingWindow samples](self->_windowBeforeTrigger, "samples");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 firstObject];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  -[WiFiUsageLQMRollingWindow samples](self->_windowAfterTrigger, "samples");
  __int128 v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[WiFiUsageLQMRollingWindow samples](self->_windowAfterTrigger, "samples");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 lastObject];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  if (!v5) {
    goto LABEL_32;
  }
  __int128 v56 = v8;
  if (-[NSMutableDictionary count](self->_lqmWindowsFeatures, "count")
    && !+[WiFiUsageLQMKernelRollingWindow isOngoing](&OBJC_CLASS___WiFiUsageLQMKernelRollingWindow, "isOngoing"))
  {
    -[WiFiUsageLQMRollingWindow interfaceName](self->_windowAfterTrigger, "interfaceName");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    BOOL v10 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v10)
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v58 = (WiFiUsageLQMWindowAnalysis *)"-[WiFiUsageLQMWindowAnalysis performAnalysis]";
        __int16 v59 = 2112;
        __int128 v60 = self;
        _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Fetching after kernel rolling window for analysis: %@",  buf,  0x16u);
      }

      unint64_t v11 = (WiFiUsageLQMWindowAnalysis *)objc_opt_new();
      -[WiFiUsageLQMRollingWindow interfaceName](self->_windowAfterTrigger, "interfaceName");
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageLQMWindowAnalysis fetchKernelLQMRollingWindowForInterface:into:]( self,  "fetchKernelLQMRollingWindowForInterface:into:",  v12,  v11);
      id v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        +[WiFiUsageLQMKernelRollingWindow kernelLQMRollingWindow:withReferenceWindow:andLqmFeatures:]( &OBJC_CLASS___WiFiUsageLQMKernelRollingWindow,  "kernelLQMRollingWindow:withReferenceWindow:andLqmFeatures:",  v13,  self->_windowAfterTrigger,  self->_lqmWindowsFeatures);
        uint64_t v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        lqmWindowsFeatures = self->_lqmWindowsFeatures;
        self->_lqmWindowsFeatures = v14;
      }

      goto LABEL_18;
    }

    if (v10)
    {
      -[WiFiUsageLQMRollingWindow interfaceName](self->_windowAfterTrigger, "interfaceName");
      unint64_t v11 = (WiFiUsageLQMWindowAnalysis *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      uint64_t v58 = (WiFiUsageLQMWindowAnalysis *)"-[WiFiUsageLQMWindowAnalysis performAnalysis]";
      __int16 v59 = 2112;
      __int128 v60 = v11;
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s - Cannot fetch the kernel rolling window (invalid interface name on windowAfterTrigger: %@)",  buf,  0x16u);
LABEL_18:
    }
  }

  -[WiFiUsageLQMWindowAnalysis computeFeaturesFor:WithLogLabel:]( self,  "computeFeaturesFor:WithLogLabel:",  self->_windowBeforeTrigger,  @"before");
  -[WiFiUsageLQMWindowAnalysis computeFeaturesFor:WithLogLabel:]( self,  "computeFeaturesFor:WithLogLabel:",  self->_windowAfterTrigger,  @"after");
  uint64_t v16 = (NSMutableDictionary *)objc_opt_new();
  dimensions = self->dimensions;
  self->dimensions = v16;

  id v18 = -[WiFiUsageLQMWindowAnalysis addDimensionsTo:](self, "addDimensionsTo:", self->dimensions);
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v19 = (void *)_dateFormatter_1;
    [v5 timestamp];
    uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringFromDate:");
    __int16 v55 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = (void *)_dateFormatter_1;
    -[WiFiUsageLQMRollingWindow samples](self->_windowBeforeTrigger, "samples");
    __int16 v49 = (void *)objc_claimAutoreleasedReturnValue();
    [v49 lastObject];
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    [v48 timestamp];
    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringFromDate:");
    __int128 v54 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = (void *)_dateFormatter_1;
    -[WiFiUsageLQMRollingWindow samples](self->_windowAfterTrigger, "samples");
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
    [v46 firstObject];
    __int128 v45 = (void *)objc_claimAutoreleasedReturnValue();
    [v45 timestamp];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 stringFromDate:v22];
    __int16 v53 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v23 = (void *)_dateFormatter_1;
    -[WiFiUsageLQMRollingWindow samples](self->_windowAfterTrigger, "samples");
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 lastObject];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 timestamp];
    uint64_t v26 = v5;
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 stringFromDate:v27];
    __int16 v51 = v26;
    uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
    [v26 networkDetails];
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      [v56 networkDetails];
      id v29 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v29 = 0LL;
    }

    -[WiFiUsageLQMWindowAnalysis dumpDimensions:](self, "dumpDimensions:", self->dimensions);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageLQMWindowAnalysis dumpAnalysis:](self, "dumpAnalysis:", self->_lqmWindowsFeatures);
    id v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138414851;
    uint64_t v58 = self;
    __int16 v59 = 2112;
    __int128 v60 = (WiFiUsageLQMWindowAnalysis *)@"before";
    __int16 v61 = 2112;
    __int128 v62 = v55;
    __int16 v63 = 2112;
    dispatch_time_t v64 = v54;
    __int16 v65 = 2112;
    v66 = @"after";
    __int16 v67 = 2112;
    v68 = v53;
    __int16 v69 = 2112;
    v70 = v52;
    __int16 v71 = 2113;
    id v72 = v28;
    __int16 v73 = 2113;
    id v74 = v29;
    __int16 v75 = 2112;
    v76 = v30;
    __int16 v77 = 2112;
    id v78 = v31;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "LQM_RW - LQM window analysis for %@ (%@: %@ - %@ ; %@: %@ - %@)\n"
      " Network at trigger        : %{private}@\n"
      " Network at end of analysis: %{private}@\n"
      " Context:\n"
      "%@\n"
      " Features: %@",
      buf,
      0x70u);
    if (v56) {

    }
    uint64_t v5 = v51;
  }

  -[WiFiUsageLQMWindowAnalysis computeBins:WithSampleKind:]( self,  "computeBins:WithSampleKind:",  self->_lqmWindowsFeatures,  objc_opt_class());
  id v32 = objc_alloc(MEMORY[0x189603F68]);
  uint64_t v33 = 0x189603000uLL;
  __int128 v34 = (void *)MEMORY[0x189603FA8];
  -[NSMutableDictionary allKeys](self->_lqmWindowsFeatures, "allKeys");
  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue();
  [v34 arrayWithArray:v35];
  __int128 v36 = (void *)objc_claimAutoreleasedReturnValue();
  metricNameCDF = self->_metricNameCDF;
  -[NSMutableDictionary allKeys](self->_lqmWindowsFeatures, "allKeys");
  __int128 v38 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v39 = [v38 count];
  uint64_t v40 = (void *)MEMORY[0x189603FA8];
  if (v39)
  {
    uint64_t v33 = objc_opt_new();
    [v40 arrayWithObject:v33];
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v41 = (void *)objc_opt_new();
  }

  v42 = (NSDictionary *)objc_msgSend( v32,  "initWithObjectsAndKeys:",  v36,  metricNameCDF,  v41,  self->_metricNameSankey,  0);
  summary = self->_summary;
  self->_summary = v42;

  if (v39)
  {

    uint64_t v41 = (void *)v33;
  }

  uint64_t v8 = v56;
LABEL_32:
  if (!self->_isDone)
  {
    completionHandler = (void (**)(id, WiFiUsageLQMWindowAnalysis *))self->_completionHandler;
    if (completionHandler)
    {
      self->_isDone = 1;
      completionHandler[2](completionHandler, self);
    }
  }
}

+ (unint64_t)canCreateAnalysisFor:(id)a3
{
  id v3 = a3;
  if ([(id)_createAnalysisSamplingRates count])
  {
    [(id)_createAnalysisSamplingRates objectForKeyedSubscript:v3];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = arc4random_uniform([v4 samplingBase]);

    [(id)_createAnalysisSamplingRates objectForKeyedSubscript:v3];
    __int128 v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      [(id)_createAnalysisSamplingRates objectForKeyedSubscript:v3];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      else {
        unint64_t v5 = v5;
      }
    }

    else
    {
      unint64_t v5 = 0LL;
    }
  }

  else
  {
    unint64_t v5 = 1LL;
  }

  return v5;
}

- (BOOL)canSubmitToCA
{
  unint64_t diceRoll = self->_diceRoll;
  if (![(id)_submitToCASamplingRates count]) {
    return 1;
  }
  [(id)_createAnalysisSamplingRates objectForKeyedSubscript:self->_reason];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = [v4 samplingBase];
  [(id)_submitToCASamplingRates objectForKeyedSubscript:self->_reason];
  __int128 v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = [v6 samplingBase];

  if (v5 != v7)
  {
    [(id)_submitToCASamplingRates objectForKeyedSubscript:self->_reason];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t diceRoll = arc4random_uniform([v8 samplingBase]);
  }

  [(id)_submitToCASamplingRates objectForKeyedSubscript:self->_reason];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    [(id)_submitToCASamplingRates objectForKeyedSubscript:self->_reason];
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v11 = diceRoll < [v10 samplingRate];
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)metricCallbackForMetric:(id)a3 AndField:(id)a4
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_opt_new();
  if ([v6 hasPrefix:self->_metricNameSankey])
  {
    id v27 = v7;
    id v28 = v6;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    obuint64_t j = self->_lqmWindowsFeatures;
    uint64_t v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v31,  v35,  16LL);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v30 = *(void *)v32;
      do
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v32 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_lqmWindowsFeatures, "objectForKeyedSubscript:", v12);
          id v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 objectForKeyedSubscript:@"before"];
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
          [NSString stringWithFormat:@"%@_%@", v12, @"before"];
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          [v8 setObject:v14 forKeyedSubscript:v15];

          -[NSMutableDictionary objectForKeyedSubscript:](self->_lqmWindowsFeatures, "objectForKeyedSubscript:", v12);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          [v16 objectForKeyedSubscript:@"after"];
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          [NSString stringWithFormat:@"%@_%@", v12, @"after"];
          id v18 = (void *)objc_claimAutoreleasedReturnValue();
          [v8 setObject:v17 forKeyedSubscript:v18];
        }

        uint64_t v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v31,  v35,  16LL);
      }

      while (v10);
    }

    id v7 = v27;
    id v6 = v28;
  }

  else
  {
    int v19 = [v6 hasPrefix:self->_metricNameCDF];
    if (v7 && v19)
    {
      [v8 setObject:v7 forKeyedSubscript:@"fieldName"];
      -[NSMutableDictionary objectForKeyedSubscript:](self->_lqmWindowsFeatures, "objectForKeyedSubscript:", v7);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 objectForKeyedSubscript:@"before"];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 setObject:v21 forKeyedSubscript:@"before"];

      -[NSMutableDictionary objectForKeyedSubscript:](self->_lqmWindowsFeatures, "objectForKeyedSubscript:", v7);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 objectForKeyedSubscript:@"after"];
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 setObject:v23 forKeyedSubscript:@"after"];
    }
  }

  [v8 allKeys];
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = [v24 count];

  if (v25) {
    [v8 addEntriesFromDictionary:self->dimensions];
  }

  return v8;
}

- (id)addDimensionsTo:(id)a3
{
  uint64_t v159 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 setObject:self->_reason forKeyedSubscript:@"trigger"];
  int v5 = (void *)NSString;
  -[WiFiUsageLQMRollingWindow duration](self->_windowBeforeTrigger, "duration");
  objc_msgSend(v5, "stringWithFormat:", @"%lu", (uint64_t)v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v7 forKeyedSubscript:@"duration"];

  [v4 setObject:self->_fgApp forKeyedSubscript:@"fgApp"];
  uint64_t v8 = (void *)NSString;
  -[WiFiUsageLQMRollingWindow capabilities](self->_windowBeforeTrigger, "capabilities");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", @"%lu", objc_msgSend(v9, "maxInterfacePHYRate"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v10 forKeyedSubscript:@"deviceTheoreticalMaxRate"];

  [MEMORY[0x189607968] numberWithBool:self->_inCall];
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v11 forKeyedSubscript:@"inCall"];

  [MEMORY[0x189607968] numberWithBool:self->_hasKernel];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v12 forKeyedSubscript:@"hasKernelStats"];

  [MEMORY[0x189607968] numberWithBool:self->_inA2dp];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v13 forKeyedSubscript:@"inA2DP"];

  [MEMORY[0x189607968] numberWithBool:self->_inEsco];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v14 forKeyedSubscript:@"ineSCO"];

  -[WiFiUsageLQMRollingWindow samples](self->_windowBeforeTrigger, "samples");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 lastObject];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 networkDetails];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

  id v18 = (void *)NSString;
  [v17 connectedBss];
  int v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", @"%ld", objc_msgSend(v19, "channel"));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v20 forKeyedSubscript:@"channel"];

  [v17 connectedBss];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiUsagePrivacyFilter bandAsString:]( WiFiUsagePrivacyFilter,  "bandAsString:",  [v21 band]);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v22 forKeyedSubscript:@"band"];

  __int128 v23 = (void *)NSString;
  [v17 connectedBss];
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", @"%ld", objc_msgSend(v24, "channelWidth"));
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v25 forKeyedSubscript:@"channelWidth"];

  [v17 connectedBss];
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 apProfile];
  id v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v27 forKeyedSubscript:@"apProfile"];

  [v17 connectedBss];
  id v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v28 bssid];
  id v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiUsagePrivacyFilter sanitizedOUI:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "sanitizedOUI:", v29);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v30 forKeyedSubscript:@"oui"];

  v146 = v17;
  [v17 connectedBss];
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue();
  [v31 bssid];
  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageLQMRollingWindow samples](self->_windowAfterTrigger, "samples");
  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v33 lastObject];
  __int128 v34 = (void *)objc_claimAutoreleasedReturnValue();
  [v34 networkDetails];
  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue();
  [v35 connectedBss];
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  [v36 bssid];
  __int128 v37 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v38 = [v32 isEqualToString:v37];
  [MEMORY[0x189607968] numberWithBool:v38];
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v39 forKeyedSubscript:@"sameBSSID"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[WiFiUsageLQMRollingWindow hasChanged:]( self->_windowBeforeTrigger,  "hasChanged:",  @"networkDetails.connectedBss.channel"));
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v40 forKeyedSubscript:@"channel_hasChanged_inBefore"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[WiFiUsageLQMRollingWindow hasChanged:]( self->_windowAfterTrigger,  "hasChanged:",  @"networkDetails.connectedBss.channel"));
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v41 forKeyedSubscript:@"channel_hasChanged_inAfter"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[WiFiUsageLQMRollingWindow hasChanged:]( self->_windowBeforeTrigger,  "hasChanged:",  @"networkDetails.connectedBss.band"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v42 forKeyedSubscript:@"band_hasChanged_inBefore"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[WiFiUsageLQMRollingWindow hasChanged:]( self->_windowAfterTrigger,  "hasChanged:",  @"networkDetails.connectedBss.band"));
  __int16 v43 = (void *)objc_claimAutoreleasedReturnValue();
  v147 = v4;
  [v4 setObject:v43 forKeyedSubscript:@"band_hasChanged_inAfter"];

  __int128 v44 = (void *)objc_opt_new();
  __int128 v153 = 0u;
  __int128 v154 = 0u;
  __int128 v155 = 0u;
  __int128 v156 = 0u;
  __int128 v45 = self->_preceedingTriggers;
  uint64_t v46 = -[NSArray countByEnumeratingWithState:objects:count:]( v45,  "countByEnumeratingWithState:objects:count:",  &v153,  v158,  16LL);
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v154;
    do
    {
      for (uint64_t i = 0LL; i != v47; ++i)
      {
        if (*(void *)v154 != v48) {
          objc_enumerationMutation(v45);
        }
        [*(id *)(*((void *)&v153 + 1) + 8 * i) trigger];
        uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
        [v44 appendFormat:@"&%@", v50];
      }

      uint64_t v47 = -[NSArray countByEnumeratingWithState:objects:count:]( v45,  "countByEnumeratingWithState:objects:count:",  &v153,  v158,  16LL);
    }

    while (v47);
  }

  v145 = v44;
  [v4 setObject:v44 forKeyedSubscript:@"preceedingTriggers"];
  v148 = (void *)objc_opt_new();
  __int128 v149 = 0u;
  __int128 v150 = 0u;
  __int128 v151 = 0u;
  __int128 v152 = 0u;
  __int16 v51 = self->_subsequentTriggers;
  uint64_t v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v51,  "countByEnumeratingWithState:objects:count:",  &v149,  v157,  16LL);
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v150;
    do
    {
      for (uint64_t j = 0LL; j != v53; ++j)
      {
        if (*(void *)v150 != v54) {
          objc_enumerationMutation(v51);
        }
        __int128 v56 = *(void **)(*((void *)&v149 + 1) + 8 * j);
        [v56 timestamp];
        uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
        timestamp = self->_timestamp;
        -[WiFiUsageLQMRollingWindow duration](self->_windowAfterTrigger, "duration");
        -[NSDate dateByAddingTimeInterval:](timestamp, "dateByAddingTimeInterval:");
        __int16 v59 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v60 = [v57 compare:v59];

        if (v60 != 1)
        {
          [v56 trigger];
          __int16 v61 = (void *)objc_claimAutoreleasedReturnValue();
          [v148 appendFormat:@"&%@", v61];
        }
      }

      uint64_t v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v51,  "countByEnumeratingWithState:objects:count:",  &v149,  v157,  16LL);
    }

    while (v53);
  }

  [v147 setObject:v148 forKeyedSubscript:@"subsequentTriggers"];
  [v147 setObject:self->_firstSubsequentLinkDownReason forKeyedSubscript:@"firstSubsequentLinkDownReason"];
  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(v146, "hasEnterpriseSecurity"));
  __int128 v62 = (void *)objc_claimAutoreleasedReturnValue();
  [v147 setObject:v62 forKeyedSubscript:@"isEnterprise"];

  +[WiFiUsagePrivacyFilter getLabelsForNetworkProperties:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelsForNetworkProperties:",  v146);
  __int16 v63 = (void *)objc_claimAutoreleasedReturnValue();
  [v147 addEntriesFromDictionary:v63];

  [v146 bssEnvironment];
  dispatch_time_t v64 = (void *)objc_claimAutoreleasedReturnValue();
  [v147 setObject:v64 forKeyedSubscript:@"bssEnvironment"];

  [v146 privateMacType];
  __int16 v65 = (void *)objc_claimAutoreleasedReturnValue();
  [v147 setObject:v65 forKeyedSubscript:@"privateMacType"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(v146, "privateRelayEnabled"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  [v147 setObject:v66 forKeyedSubscript:@"privacyProxyEnabled"];

  -[WiFiUsageLQMRollingWindow samples](self->_windowBeforeTrigger, "samples");
  __int16 v67 = (void *)objc_claimAutoreleasedReturnValue();
  [v67 lastObject];
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  [v68 motionState];
  __int16 v69 = (void *)objc_claimAutoreleasedReturnValue();
  [v147 setObject:v69 forKeyedSubscript:@"motionStatus"];

  v70 = (void *)MEMORY[0x189607968];
  -[WiFiUsageLQMRollingWindow samples](self->_windowBeforeTrigger, "samples");
  __int16 v71 = (void *)objc_claimAutoreleasedReturnValue();
  [v71 lastObject];
  id v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "numberWithBool:", objc_msgSend(v72, "isAnyAppInFG"));
  __int16 v73 = (void *)objc_claimAutoreleasedReturnValue();
  [v147 setObject:v73 forKeyedSubscript:@"isAnyAppInFG"];

  id v74 = (void *)MEMORY[0x189607968];
  -[WiFiUsageLQMRollingWindow samples](self->_windowBeforeTrigger, "samples");
  __int16 v75 = (void *)objc_claimAutoreleasedReturnValue();
  [v75 lastObject];
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "numberWithBool:", objc_msgSend(v76, "isFTactive"));
  __int16 v77 = (void *)objc_claimAutoreleasedReturnValue();
  [v147 setObject:v77 forKeyedSubscript:@"isFTactive"];

  id v78 = (void *)MEMORY[0x189607968];
  -[WiFiUsageLQMRollingWindow samples](self->_windowBeforeTrigger, "samples");
  uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue();
  [v79 lastObject];
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "numberWithBool:", objc_msgSend(v80, "isTimeSensitiveAppRunning"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  [v147 setObject:v81 forKeyedSubscript:@"isTimeSensitiveAppRunning"];
  v82 = -[WiFiUsageLQMRollingWindow samples](self->_windowBeforeTrigger, "samples");
  [v82 lastObject];
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = +[WiFiUsageLQMTransformations getLabelTrafficState:]( WiFiUsageLQMTransformations,  "getLabelTrafficState:",  [v83 trafficState]);
  [v147 setObject:v84 forKeyedSubscript:@"last_trafficState_before"];

  if (+[WiFiUsagePrivacyFilter isInternalInstall](&OBJC_CLASS___WiFiUsagePrivacyFilter, "isInternalInstall")
    && [v146 isInternal])
  {
    [v146 networkName];
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    [v147 setObject:v85 forKeyedSubscript:@"NetworkName"];

    [v146 connectedBss];
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    [v86 bssid];
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = +[WiFiUsageAccessPointProfile apNameForBSSID:](&OBJC_CLASS___WiFiUsageAccessPointProfile, "apNameForBSSID:", v87);
    v89 = -[WiFiUsageAppleWiFiNameBlocks initWithAPName:]( objc_alloc(&OBJC_CLASS___WiFiUsageAppleWiFiNameBlocks),  "initWithAPName:",  v88);
    [v147 setObject:v88 forKeyedSubscript:@"apName"];
    if (v89)
    {
      v90 = -[WiFiUsageAppleWiFiNameBlocks building](v89, "building");
      [v147 setObject:v90 forKeyedSubscript:@"apNamePortionA"];
      v91 = -[WiFiUsageAppleWiFiNameBlocks section](v89, "section");
      [v147 setObject:v91 forKeyedSubscript:@"apNamePortionB"];
      v92 = -[WiFiUsageAppleWiFiNameBlocks floor](v89, "floor");
      [v147 setObject:v92 forKeyedSubscript:@"apNamePortionC"];
      v93 = -[WiFiUsageAppleWiFiNameBlocks pod](v89, "pod");
      [v147 setObject:v93 forKeyedSubscript:@"apNamePortionD"];
      v94 = -[WiFiUsageAppleWiFiNameBlocks other](v89, "other");
      [v147 setObject:v94 forKeyedSubscript:@"apNamePortionE"];
    }
  }
  v95 = -[WiFiUsageLQMRollingWindow samples](self->_windowBeforeTrigger, "samples");
  [v95 lastObject];
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  [v96 timestamp];
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = -[WiFiUsageLQMRollingWindow samples](self->_windowBeforeTrigger, "samples");
  [v98 firstObject];
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  [v99 timestamp];
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  [v97 timeIntervalSinceDate:v100];
  v102 = +[WiFiUsagePrivacyFilter getBinEvery10Over100:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinEvery10Over100:As:",  (unint64_t)v101,  0LL);
  [v147 setObject:v102 forKeyedSubscript:@"windowSpan_before"];
  v103 = -[WiFiUsageLQMRollingWindow samples](self->_windowAfterTrigger, "samples");
  [v103 lastObject];
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  [v104 timestamp];
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = -[WiFiUsageLQMRollingWindow samples](self->_windowAfterTrigger, "samples");
  [v106 firstObject];
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  [v107 timestamp];
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  [v105 timeIntervalSinceDate:v108];
  v110 = +[WiFiUsagePrivacyFilter getBinEvery10Over100:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinEvery10Over100:As:",  (unint64_t)v109,  0LL);
  [v147 setObject:v110 forKeyedSubscript:@"windowSpan_after"];
  v111 = -[WiFiUsageLQMRollingWindow samples](self->_windowBeforeTrigger, "samples");
  v112 = +[WiFiUsagePrivacyFilter getBinEvery10Over100:As:]( WiFiUsagePrivacyFilter,  "getBinEvery10Over100:As:",  [v111 count],  0);
  [v147 setObject:v112 forKeyedSubscript:@"samplesCount_before"];
  v113 = -[WiFiUsageLQMRollingWindow samples](self->_windowAfterTrigger, "samples");
  v114 = +[WiFiUsagePrivacyFilter getBinEvery10Over100:As:]( WiFiUsagePrivacyFilter,  "getBinEvery10Over100:As:",  [v113 count],  0);
  [v147 setObject:v114 forKeyedSubscript:@"samplesCount_after"];
  v115 = -[WiFiUsageLQMRollingWindow samples](self->_windowAfterTrigger, "samples");
  [v115 lastObject];
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  [v116 networkDetails];
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  v118 = (void *)NSString;
  [v117 connectedBss];
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "stringWithFormat:", @"%ld", objc_msgSend(v119, "channel"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  [v147 setObject:v120 forKeyedSubscript:@"channel_after"];

  [v117 connectedBss];
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = +[WiFiUsagePrivacyFilter bandAsString:]( WiFiUsagePrivacyFilter,  "bandAsString:",  [v121 band]);
  [v147 setObject:v122 forKeyedSubscript:@"band_after"];

  v123 = (void *)NSString;
  [v117 connectedBss];
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "stringWithFormat:", @"%ld", objc_msgSend(v124, "channelWidth"));
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  [v147 setObject:v125 forKeyedSubscript:@"channelWidth_after"];

  [v117 connectedBss];
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  [v126 apProfile];
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  [v147 setObject:v127 forKeyedSubscript:@"apProfile_after"];

  [v117 connectedBss];
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  [v128 bssid];
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = +[WiFiUsagePrivacyFilter sanitizedOUI:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "sanitizedOUI:", v129);
  [v147 setObject:v130 forKeyedSubscript:@"oui_after"];
  v131 = +[WiFiUsagePrivacyFilter getLabelsForNetworkProperties:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelsForNetworkProperties:",  v117);
  [v147 addEntriesFromDictionary:v131];

  [v117 bssEnvironment];
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  [v147 setObject:v132 forKeyedSubscript:@"bssEnvironment_after"];

  [v117 privateMacType];
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  [v147 setObject:v133 forKeyedSubscript:@"privateMacType_after"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(v117, "privateRelayEnabled"));
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  [v147 setObject:v134 forKeyedSubscript:@"privacyProxyEnabled_after"];

  if (+[WiFiUsagePrivacyFilter isInternalInstall](&OBJC_CLASS___WiFiUsagePrivacyFilter, "isInternalInstall")
    && [v117 isInternal])
  {
    [v117 connectedBss];
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    [v135 bssid];
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = +[WiFiUsageAccessPointProfile apNameForBSSID:](&OBJC_CLASS___WiFiUsageAccessPointProfile, "apNameForBSSID:", v136);
    v138 = -[WiFiUsageAppleWiFiNameBlocks initWithAPName:]( objc_alloc(&OBJC_CLASS___WiFiUsageAppleWiFiNameBlocks),  "initWithAPName:",  v137);
    [v147 setObject:v137 forKeyedSubscript:@"apName_after"];
    if (v138)
    {
      v139 = -[WiFiUsageAppleWiFiNameBlocks building](v138, "building");
      [v147 setObject:v139 forKeyedSubscript:@"apNamePortionA_after"];
      v140 = -[WiFiUsageAppleWiFiNameBlocks section](v138, "section");
      [v147 setObject:v140 forKeyedSubscript:@"apNamePortionB_after"];
      v141 = -[WiFiUsageAppleWiFiNameBlocks floor](v138, "floor");
      [v147 setObject:v141 forKeyedSubscript:@"apNamePortionC_after"];
      v142 = -[WiFiUsageAppleWiFiNameBlocks pod](v138, "pod");
      [v147 setObject:v142 forKeyedSubscript:@"apNamePortionD_after"];
      v143 = -[WiFiUsageAppleWiFiNameBlocks other](v138, "other");
      [v147 setObject:v143 forKeyedSubscript:@"apNamePortionE_after"];
    }
  }

  return v147;
}

- (id)dumpAnalysis:(id)a3
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  [MEMORY[0x189607940] stringWithFormat:@"(format: fieldName=<feature %@>|<feature %@>|<median change>)\n", @"before", @"after"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  [v3 allKeys];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];
  double v6 = (void *)objc_claimAutoreleasedReturnValue();

  obuint64_t j = v6;
  uint64_t v27 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v31;
    id v22 = v3;
    do
    {
      for (uint64_t i = 0LL; i != v27; ++i)
      {
        if (*(void *)v31 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        [v4 appendFormat:@"%@=", v8];
        [v3 objectForKeyedSubscript:v8];
        id v29 = (void *)objc_claimAutoreleasedReturnValue();
        [v29 objectForKeyedSubscript:@"before"];
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 objectForKeyedSubscript:v8];
        id v28 = (void *)objc_claimAutoreleasedReturnValue();
        [v28 objectForKeyedSubscript:@"after"];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 objectForKeyedSubscript:v8];
        BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 objectForKeyedSubscript:@"after"];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          uint64_t v24 = (void *)MEMORY[0x189607968];
          [v3 objectForKeyedSubscript:v8];
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
          [v25 objectForKeyedSubscript:@"after"];
          id v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 doubleValue];
          double v15 = v14;
          [v3 objectForKeyedSubscript:v8];
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          [v16 objectForKeyedSubscript:@"before"];
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          [v17 doubleValue];
          [v24 numberWithDouble:v15 - v18];
          int v19 = v4;
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
          [v19 appendFormat:@"%@|%@|%@", v9, v10, v20];

          id v4 = v19;
          id v3 = v22;
        }

        else
        {
          [v4 appendFormat:@"%@|%@|%@", v9, v10, &stru_18A170410];
        }

        [v4 appendString:@";"];
      }

      uint64_t v27 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }

    while (v27);
  }

  return v4;
}

- (id)dumpDimensions:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  id v4 = (void *)objc_opt_new();
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  [v3 allKeys];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];
  double v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        [v3 objectForKeyedSubscript:v11];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 appendFormat:@"%@=%@;", v11, v12];
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@ @ %@", self->_reason, self->_timestamp];
}

- (id)fetchKernelLQMRollingWindowForInterface:(id)a3 into:(id)a4
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  int v7 = Apple80211Open();
  if (v7)
  {
    int v13 = v7;
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v20 = "-[WiFiUsageLQMWindowAnalysis fetchKernelLQMRollingWindowForInterface:into:]";
    __int16 v21 = 1024;
    *(_DWORD *)id v22 = v13;
    *(_WORD *)&v22[4] = 2080;
    *(void *)&v22[6] = strerror(v13);
    __int128 v14 = (os_log_s *)MEMORY[0x1895F8DA0];
    __int128 v15 = "%s: Apple80211Open returned err %d (%s)";
    goto LABEL_13;
  }

  int v8 = Apple80211BindToInterface();
  if (v8)
  {
    int v16 = v8;
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136315906;
    uint64_t v20 = "-[WiFiUsageLQMWindowAnalysis fetchKernelLQMRollingWindowForInterface:into:]";
    __int16 v21 = 2112;
    *(void *)id v22 = v5;
    *(_WORD *)&v22[8] = 1024;
    *(_DWORD *)&v22[10] = v16;
    __int16 v23 = 2080;
    uint64_t v24 = strerror(v16);
    __int128 v14 = (os_log_s *)MEMORY[0x1895F8DA0];
    __int128 v15 = "%s: Apple80211BindToInterface on (%@) returned err %d (%s)";
    uint32_t v17 = 38;
LABEL_16:
    _os_log_impl(&dword_187EBF000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
    goto LABEL_17;
  }

  int v9 = Apple80211Get();
  if (v9)
  {
    int v18 = v9;
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v20 = "-[WiFiUsageLQMWindowAnalysis fetchKernelLQMRollingWindowForInterface:into:]";
    __int16 v21 = 1024;
    *(_DWORD *)id v22 = v18;
    *(_WORD *)&v22[4] = 2080;
    *(void *)&v22[6] = strerror(v18);
    __int128 v14 = (os_log_s *)MEMORY[0x1895F8DA0];
    __int128 v15 = "%s: Apple80211Get(APPLE80211_IOC_LQM_RING_BUFFER_DATA) failed: %d (%s)";
LABEL_13:
    uint32_t v17 = 28;
    goto LABEL_16;
  }

  uint64_t v10 = [v6 objectForKeyedSubscript:&unk_18A1B47D0];
  if (!v10)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v20 = "-[WiFiUsageLQMWindowAnalysis fetchKernelLQMRollingWindowForInterface:into:]";
      __int128 v14 = (os_log_s *)MEMORY[0x1895F8DA0];
      __int128 v15 = "%s - No LQM binary tag represented in APPLE80211_IOC_LQM_RING_BUFFER_DATA dictionary, skipping.";
      uint32_t v17 = 12;
      goto LABEL_16;
    }

- (BOOL)getBeforeKernelWindowWithLikelyhood
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  unint64_t diceRoll = self->_diceRoll;
  [(id)_createAnalysisSamplingRates objectForKeyedSubscript:self->_reason];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = [v4 samplingBase];
  [(id)_fetchKernelWindowSamplingRates objectForKeyedSubscript:self->_reason];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = [v6 samplingBase];

  if (v5 != v7)
  {
    [(id)_fetchKernelWindowSamplingRates objectForKeyedSubscript:self->_reason];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t diceRoll = arc4random_uniform([v8 samplingBase]);
  }

  uint64_t v9 = [(id)_fetchKernelWindowSamplingRates objectForKeyedSubscript:self->_reason];
  if (!v9)
  {
    BOOL v13 = 0;
    goto LABEL_9;
  }

  uint64_t v10 = (void *)v9;
  [(id)_fetchKernelWindowSamplingRates objectForKeyedSubscript:self->_reason];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v12 = [v11 samplingRate];
  BOOL v13 = diceRoll < v12;

  if (!_isKernelParsingEnabled || diceRoll >= v12)
  {
LABEL_9:
    BOOL v14 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT);
    LOBYTE(v15) = 0;
    if (v14)
    {
      if (_isKernelParsingEnabled) {
        int v16 = @"YES";
      }
      else {
        int v16 = @"NO";
      }
      if (v13) {
        uint32_t v17 = @"YES";
      }
      else {
        uint32_t v17 = @"NO";
      }
      unint64_t v18 = self->_diceRoll;
      [(id)_fetchKernelWindowSamplingRates objectForKeyedSubscript:self->_reason];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      int v20 = [v19 samplingRate];
      int v31 = 136316674;
      __int128 v32 = "-[WiFiUsageLQMWindowAnalysis getBeforeKernelWindowWithLikelyhood]";
      if (+[WiFiUsageLQMKernelRollingWindow isOngoing](&OBJC_CLASS___WiFiUsageLQMKernelRollingWindow, "isOngoing")) {
        __int16 v21 = @"YES";
      }
      else {
        __int16 v21 = @"NO";
      }
      __int16 v33 = 2112;
      __int128 v34 = self;
      __int16 v35 = 2112;
      uint64_t v36 = v16;
      __int16 v37 = 2112;
      uint64_t v38 = v17;
      __int16 v39 = 2048;
      unint64_t v40 = v18;
      __int16 v41 = 1024;
      int v42 = v20;
      __int16 v43 = 2112;
      __int128 v44 = v21;
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s - Not fetching before kernel rolling window for analysis: %@ (enabled: %@ - sampling:%@(%lu>=%u) - ongoin g kernel window parsing:%@)",  (uint8_t *)&v31,  0x44u);

LABEL_20:
      LOBYTE(v15) = 0;
      return v15;
    }

    return v15;
  }

  if (+[WiFiUsageLQMKernelRollingWindow isOngoing](&OBJC_CLASS___WiFiUsageLQMKernelRollingWindow, "isOngoing"))
  {
    BOOL v13 = 1;
    goto LABEL_9;
  }

  -[WiFiUsageLQMRollingWindow interfaceName](self->_windowBeforeTrigger, "interfaceName");
  id v22 = (void *)objc_claimAutoreleasedReturnValue();

  BOOL v15 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT);
  if (!v22)
  {
    if (!v15) {
      return v15;
    }
    -[WiFiUsageLQMRollingWindow interfaceName](self->_windowBeforeTrigger, "interfaceName");
    id v29 = (WiFiUsageLQMWindowAnalysis *)objc_claimAutoreleasedReturnValue();
    int v31 = 136315394;
    __int128 v32 = "-[WiFiUsageLQMWindowAnalysis getBeforeKernelWindowWithLikelyhood]";
    __int16 v33 = 2112;
    __int128 v34 = v29;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s - Cannot fetch the kernel rolling window (invalid interface name on windowBeforeTrigger: %@)",  (uint8_t *)&v31,  0x16u);

    goto LABEL_20;
  }

  if (v15)
  {
    -[WiFiUsageLQMRollingWindow interfaceName](self->_windowBeforeTrigger, "interfaceName");
    __int16 v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v31 = 136315650;
    __int128 v32 = "-[WiFiUsageLQMWindowAnalysis getBeforeKernelWindowWithLikelyhood]";
    __int16 v33 = 2112;
    __int128 v34 = self;
    __int16 v35 = 2112;
    uint64_t v36 = v23;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Fetching before kernel rolling window for analysis %@ on interface %@",  (uint8_t *)&v31,  0x20u);
  }

  uint64_t v24 = (void *)objc_opt_new();
  -[WiFiUsageLQMRollingWindow interfaceName](self->_windowBeforeTrigger, "interfaceName");
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageLQMWindowAnalysis fetchKernelLQMRollingWindowForInterface:into:]( self,  "fetchKernelLQMRollingWindowForInterface:into:",  v25,  v24);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    +[WiFiUsageLQMKernelRollingWindow kernelLQMRollingWindow:withReferenceWindow:andLqmFeatures:]( &OBJC_CLASS___WiFiUsageLQMKernelRollingWindow,  "kernelLQMRollingWindow:withReferenceWindow:andLqmFeatures:",  v26,  self->_windowBeforeTrigger,  self->_lqmWindowsFeatures);
    uint64_t v27 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    lqmWindowsFeatures = self->_lqmWindowsFeatures;
    self->_lqmWindowsFeatures = v27;
  }

  if (-[NSMutableDictionary count](self->_lqmWindowsFeatures, "count")) {
    self->_hasKernel = 1;
  }

  LOBYTE(v15) = 1;
  return v15;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (BOOL)isDone
{
  return self->_isDone;
}

- (void)setIsDone:(BOOL)a3
{
  self->_isDone = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSDictionary)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
}

- (NSMutableArray)subsequentTriggers
{
  return self->_subsequentTriggers;
}

- (void)setSubsequentTriggers:(id)a3
{
}

- (NSString)firstSubsequentLinkDownReason
{
  return self->_firstSubsequentLinkDownReason;
}

- (void)setFirstSubsequentLinkDownReason:(id)a3
{
  self->_firstSubsequentLinkDownReason = (NSString *)a3;
}

- (NSArray)preceedingTriggers
{
  return self->_preceedingTriggers;
}

- (void)setPreceedingTriggers:(id)a3
{
}

- (NSString)fgApp
{
  return self->_fgApp;
}

- (void)setFgApp:(id)a3
{
}

- (BOOL)inCall
{
  return self->_inCall;
}

- (void)setInCall:(BOOL)a3
{
  self->_inCall = a3;
}

- (NSString)metricNameCDF
{
  return self->_metricNameCDF;
}

- (void)setMetricNameCDF:(id)a3
{
}

- (NSString)metricNameSankey
{
  return self->_metricNameSankey;
}

- (void)setMetricNameSankey:(id)a3
{
}

- (NSMutableDictionary)lqmWindowsFeatures
{
  return self->_lqmWindowsFeatures;
}

- (void)setLqmWindowsFeatures:(id)a3
{
}

- (unint64_t)diceRoll
{
  return self->_diceRoll;
}

- (void)setDiceRoll:(unint64_t)a3
{
  self->_unint64_t diceRoll = a3;
}

- (BOOL)hasKernel
{
  return self->_hasKernel;
}

- (void)setHasKernel:(BOOL)a3
{
  self->_hasKernel = a3;
}

- (BOOL)inA2dp
{
  return self->_inA2dp;
}

- (void)setInA2dp:(BOOL)a3
{
  self->_inA2dp = a3;
}

- (BOOL)inEsco
{
  return self->_inEsco;
}

- (void)setInEsco:(BOOL)a3
{
  self->_inEsco = a3;
}

- (OS_dispatch_source)analysisTimer
{
  return self->_analysisTimer;
}

- (void)setAnalysisTimer:(id)a3
{
}

- (OS_dispatch_queue)analysisQueue
{
  return self->_analysisQueue;
}

- (void)setAnalysisQueue:(id)a3
{
}

- (WiFiUsageLQMRollingWindow)windowBeforeTrigger
{
  return self->_windowBeforeTrigger;
}

- (void)setWindowBeforeTrigger:(id)a3
{
}

- (WiFiUsageLQMRollingWindow)windowAfterTrigger
{
  return self->_windowAfterTrigger;
}

- (void)setWindowAfterTrigger:(id)a3
{
}

- (void).cxx_destruct
{
}

@end