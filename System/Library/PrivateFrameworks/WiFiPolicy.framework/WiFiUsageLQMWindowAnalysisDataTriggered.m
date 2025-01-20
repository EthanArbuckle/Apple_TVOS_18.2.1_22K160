@interface WiFiUsageLQMWindowAnalysisDataTriggered
- (NSArray)triggerCriteriaList;
- (NSString)dataTriggerReason;
- (WiFiUsageLQMWindowAnalysisDataTriggered)initWithRollingWindow:(id)a3 andSubReason:(id)a4 andContext:(context)a5 andTimestamp:(id)a6 onQueue:(id)a7;
- (id)addDimensionsTo:(id)a3;
- (void)performAnalysis;
- (void)setDataTriggerReason:(id)a3;
@end

@implementation WiFiUsageLQMWindowAnalysisDataTriggered

- (WiFiUsageLQMWindowAnalysisDataTriggered)initWithRollingWindow:(id)a3 andSubReason:(id)a4 andContext:(context)a5 andTimestamp:(id)a6 onQueue:(id)a7
{
  int v9 = *(_DWORD *)&a5.var0;
  uint64_t v57 = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = (id)[v12 evaluateCriteriaWithStopUponFirstMatch:0];
  v55.receiver = self;
  v55.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMWindowAnalysisDataTriggered;
  v17 = -[WiFiUsageLQMWindowAnalysis initWithRollingWindow:andReason:andContext:andTimestamp:onQueue:]( &v55,  sel_initWithRollingWindow_andReason_andContext_andTimestamp_onQueue_,  v12,  @"DataTriggered",  *(void *)&v9 & 0xFFFFFFLL,  v14,  v15);
  v18 = v17;
  if (v17)
  {
    id v43 = v15;
    id v44 = v14;
    id v45 = v13;
    p_dataTriggerReason = &v17->_dataTriggerReason;
    objc_storeStrong((id *)&v17->_dataTriggerReason, a4);
    uint64_t v19 = [v12 getTriggerCriteriaList];
    triggerCriteriaList = v18->_triggerCriteriaList;
    v18->_triggerCriteriaList = (NSArray *)v19;

    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    id v46 = v12;
    [v12 features];
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v52;
      do
      {
        for (uint64_t i = 0LL; i != v22; ++i)
        {
          if (*(void *)v52 != v23) {
            objc_enumerationMutation(obj);
          }
          v25 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          v26 = (void *)NSString;
          [v25 fieldName];
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          int v28 = [v25 isPerSecond];
          v29 = &stru_18A170410;
          if (v28) {
            v29 = @"PerSecond";
          }
          [v26 stringWithFormat:@"median_%@%@", v27, v29];
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v31 = (void *)objc_opt_new();
          v50.receiver = v18;
          v50.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMWindowAnalysisDataTriggered;
          v32 = -[WiFiUsageLQMWindowAnalysis lqmWindowsFeatures](&v50, sel_lqmWindowsFeatures);
          [v32 setObject:v31 forKeyedSubscript:v30];

          [v25 median];
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v49.receiver = v18;
          v49.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMWindowAnalysisDataTriggered;
          v34 = -[WiFiUsageLQMWindowAnalysis lqmWindowsFeatures](&v49, sel_lqmWindowsFeatures);
          [v34 objectForKeyedSubscript:v30];
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          [v35 setObject:v33 forKeyedSubscript:@"before"];
        }

        uint64_t v22 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
      }

      while (v22);
    }

    v48.receiver = v18;
    v48.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMWindowAnalysisDataTriggered;
    v36 = -[WiFiUsageLQMWindowAnalysis reason](&v48, sel_reason);
    v37 = *p_dataTriggerReason;
    v38 = v18->_triggerCriteriaList;
    [MEMORY[0x1896079C8] predicateWithFormat:@"matched == YES OR lastTriggered != NIL"];
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = -[NSArray filteredArrayUsingPredicate:](v38, "filteredArrayUsingPredicate:", v39);
    NSLog( @"%s: LQM window analysis triggered by %@ (%@) with matched or match-ended criterias: %@",  "-[WiFiUsageLQMWindowAnalysisDataTriggered initWithRollingWindow:andSubReason:andContext:andTimestamp:onQueue:]",  v36,  v37,  v40);

    id v13 = v45;
    id v12 = v46;
    id v15 = v43;
    id v14 = v44;
  }

  return v18;
}

- (void)performAnalysis
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMWindowAnalysisDataTriggered;
  v3 = -[WiFiUsageLQMWindowAnalysis reason](&v9, sel_reason);
  dataTriggerReason = self->_dataTriggerReason;
  triggerCriteriaList = self->_triggerCriteriaList;
  [MEMORY[0x1896079C8] predicateWithFormat:@"matched == YES OR lastTriggered != NIL"];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NSArray filteredArrayUsingPredicate:](triggerCriteriaList, "filteredArrayUsingPredicate:", v6);
  NSLog( @"%s: Performing LQM window analysis triggered by %@ (%@) with matched or match-ended criterias: %@",  "-[WiFiUsageLQMWindowAnalysisDataTriggered performAnalysis]",  v3,  dataTriggerReason,  v7);

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMWindowAnalysisDataTriggered;
  -[WiFiUsageLQMWindowAnalysis performAnalysis](&v8, sel_performAnalysis);
}

- (id)addDimensionsTo:(id)a3
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMWindowAnalysisDataTriggered;
  id v5 = -[WiFiUsageLQMWindowAnalysis addDimensionsTo:](&v27, sel_addDimensionsTo_, v4);
  uint64_t v21 = v4;
  [v4 setObject:self->_dataTriggerReason forKeyedSubscript:@"datatriggeredReason"];
  v6 = (void *)objc_opt_new();
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obj = self->_triggerCriteriaList;
  uint64_t v7 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v23,  v28,  16LL);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (([v11 valid] & 1) != 0
          || !-[NSString isEqualToString:](self->_dataTriggerReason, "isEqualToString:", @"Match Start"))
        {
          [v11 shortPredicateNoSpaces];
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          int v13 = [v11 matched];
          id v14 = @"false";
          if (v13) {
            id v14 = @"true";
          }
          [v6 appendFormat:@"%@:%@&", v12, v14];

          [v11 lastTriggered];
          id v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            [v11 lastTriggered];
            id v16 = (void *)objc_claimAutoreleasedReturnValue();
            [v11 firstTriggered];
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            [v16 timeIntervalSinceDate:v17];
            v18 = +[WiFiUsageLQMTransformations getBinTimeIntervalUpTo12h:As:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "getBinTimeIntervalUpTo12h:As:",  1LL);
            objc_msgSend( NSString,  "stringWithFormat:",  @"datatriggered_criteria%lu_duration",  -[NSArray indexOfObject:](self->_triggerCriteriaList, "indexOfObject:", v11));
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
            [v21 setObject:v18 forKeyedSubscript:v19];
          }
        }
      }

      uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v23,  v28,  16LL);
    }

    while (v8);
  }

  [v21 setObject:v6 forKeyedSubscript:@"datatriggeredCriteria"];
  return v21;
}

- (NSArray)triggerCriteriaList
{
  return self->_triggerCriteriaList;
}

- (NSString)dataTriggerReason
{
  return self->_dataTriggerReason;
}

- (void)setDataTriggerReason:(id)a3
{
}

- (void).cxx_destruct
{
}

@end