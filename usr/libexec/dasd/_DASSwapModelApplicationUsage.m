@interface _DASSwapModelApplicationUsage
- (BOOL)prewarmDisabled;
- (NSDate)transitionDate;
- (NSDictionary)currentProbabilities;
- (NSDictionary)nextProbabilities;
- (OS_os_log)log;
- (_DASSwapModelApplicationUsage)init;
- (_DKKnowledgeQuerying)knowledgeStore;
- (double)scoreForApplication:(id)a3 atDate:(id)a4;
- (id)scoresForAllApplicationsAtDate:(id)a3;
- (void)setCurrentProbabilities:(id)a3;
- (void)setKnowledgeStore:(id)a3;
- (void)setLog:(id)a3;
- (void)setNextProbabilities:(id)a3;
- (void)setPrewarmDisabled:(BOOL)a3;
- (void)setTransitionDate:(id)a3;
- (void)updateScores;
- (void)updateTimeline;
@end

@implementation _DASSwapModelApplicationUsage

- (_DASSwapModelApplicationUsage)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS____DASSwapModelApplicationUsage;
  v2 = -[_DASSwapModelApplicationUsage init](&v13, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[_DASPredictionManager sharedKnowledgeStore](&OBJC_CLASS____DASPredictionManager, "sharedKnowledgeStore"));
    knowledgeStore = v2->_knowledgeStore;
    v2->_knowledgeStore = (_DKKnowledgeQuerying *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"swap.appUsageModel"));
    log = v2->_log;
    v2->_log = (OS_os_log *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DASTrialManager sharedInstance](&OBJC_CLASS____DASTrialManager, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 factorWithName:@"APRS_PrewarmDisabled"]);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        unsigned int v11 = [v8 BOOLeanValue];
        *(_DWORD *)buf = 67109120;
        unsigned int v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Trial: Prewarm disabled set to %d", buf, 8u);
      }

      v2->_prewarmDisabled = [v8 BOOLeanValue];
    }

    else
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Trial: Failed to load prewarmDisabled",  buf,  2u);
      }
    }
  }

  return v2;
}

- (void)updateTimeline
{
  uint64_t v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams appUsageStream](&OBJC_CLASS____DKSystemEventStreams, "appUsageStream"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[_DKPredictionQuery topNPredictionQueryForStream:withPredicate:withTopN:withMinLikelihood:]( &OBJC_CLASS____DKPredictionQuery,  "topNPredictionQueryForStream:withPredicate:withTopN:withMinLikelihood:",  v4,  0LL,  50LL,  0.0));

  [v5 setSlotDuration:7200];
  [v5 setMinimumDaysOfHistory:1];
  knowledgeStore = self->_knowledgeStore;
  id v11 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DKKnowledgeQuerying executeQuery:error:](knowledgeStore, "executeQuery:error:", v5, &v11));
  id v8 = v11;
  if (v8)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      sub_1000B0ED8(log);
    }
  }

  BOOL v10 = self->_log;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    objc_super v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Updating timeline: %@", buf, 0xCu);
  }

  -[_DASSwapModelApplicationUsage convertTimelineToApplicationDictionaries:]( self,  "convertTimelineToApplicationDictionaries:",  v7);

  objc_autoreleasePoolPop(v3);
}

- (double)scoreForApplication:(id)a3 atDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelApplicationUsage transitionDate](self, "transitionDate"));
  [v6 timeIntervalSinceDate:v8];
  double v10 = v9;

  if (v10 <= 0.0) {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelApplicationUsage currentProbabilities](self, "currentProbabilities"));
  }
  else {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelApplicationUsage nextProbabilities](self, "nextProbabilities"));
  }
  v12 = v11;
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v7]);

  [v13 doubleValue];
  double v15 = v14;

  return v15;
}

- (id)scoresForAllApplicationsAtDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelApplicationUsage transitionDate](self, "transitionDate"));
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  if (v7 <= 0.0) {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelApplicationUsage currentProbabilities](self, "currentProbabilities"));
  }
  else {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelApplicationUsage nextProbabilities](self, "nextProbabilities"));
  }
  return v8;
}

- (void)updateScores
{
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (BOOL)prewarmDisabled
{
  return self->_prewarmDisabled;
}

- (void)setPrewarmDisabled:(BOOL)a3
{
  self->_prewarmDisabled = a3;
}

- (NSDictionary)currentProbabilities
{
  return (NSDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setCurrentProbabilities:(id)a3
{
}

- (NSDate)transitionDate
{
  return (NSDate *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setTransitionDate:(id)a3
{
}

- (NSDictionary)nextProbabilities
{
  return (NSDictionary *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setNextProbabilities:(id)a3
{
}

- (void).cxx_destruct
{
}

@end