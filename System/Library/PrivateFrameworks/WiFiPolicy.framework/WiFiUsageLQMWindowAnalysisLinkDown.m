@interface WiFiUsageLQMWindowAnalysisLinkDown
- (BOOL)isInvoluntary;
- (NSString)linkDownReason;
- (WiFiUsageLQMWindowAnalysisLinkDown)initWithRollingWindow:(id)a3 WithIsInvoluntary:(BOOL)a4 AndLinkChangeReason:(int64_t)a5 AndLinkChangeSubreason:(int64_t)a6 AndDuration:(unint64_t)a7 andContext:(context)a8 AndTimestamp:(id)a9 onQueue:(id)a10;
- (id)addDimensionsTo:(id)a3;
- (int64_t)linkDownSubreason;
- (unint64_t)linkUpDuration;
- (void)setIsInvoluntary:(BOOL)a3;
- (void)setLinkDownReason:(id)a3;
- (void)setLinkDownSubreason:(int64_t)a3;
- (void)setLinkUpDuration:(unint64_t)a3;
@end

@implementation WiFiUsageLQMWindowAnalysisLinkDown

- (WiFiUsageLQMWindowAnalysisLinkDown)initWithRollingWindow:(id)a3 WithIsInvoluntary:(BOOL)a4 AndLinkChangeReason:(int64_t)a5 AndLinkChangeSubreason:(int64_t)a6 AndDuration:(unint64_t)a7 andContext:(context)a8 AndTimestamp:(id)a9 onQueue:(id)a10
{
  BOOL v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMWindowAnalysisLinkDown;
  v14 = -[WiFiUsageLQMWindowAnalysis initWithRollingWindow:andReason:andContext:andTimestamp:onQueue:]( &v17,  sel_initWithRollingWindow_andReason_andContext_andTimestamp_onQueue_,  a3,  @"LinkDown",  *(void *)&a8.var0 & 0xFFFFFFLL,  a9,  a10);
  -[WiFiUsageLQMWindowAnalysisLinkDown setIsInvoluntary:](v14, "setIsInvoluntary:", v13);
  v15 = +[WiFiUsageSession disconnectReasonString:](&OBJC_CLASS___WiFiUsageSession, "disconnectReasonString:", a5);
  -[WiFiUsageLQMWindowAnalysisLinkDown setLinkDownReason:](v14, "setLinkDownReason:", v15);

  -[WiFiUsageLQMWindowAnalysisLinkDown setLinkDownSubreason:](v14, "setLinkDownSubreason:", a6);
  -[WiFiUsageLQMWindowAnalysisLinkDown setLinkUpDuration:](v14, "setLinkUpDuration:", a7);
  return v14;
}

- (id)addDimensionsTo:(id)a3
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMWindowAnalysisLinkDown;
  id v5 = -[WiFiUsageLQMWindowAnalysis addDimensionsTo:](&v44, sel_addDimensionsTo_, v4);
  objc_msgSend(NSString, "stringWithFormat:", @"%u", self->_isInvoluntary);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v6 forKeyedSubscript:@"linkdownIsInVoluntary"];

  [v4 setObject:self->_linkDownReason forKeyedSubscript:@"linkdownReason"];
  objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->_linkDownSubreason);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v7 forKeyedSubscript:@"linkdownSubReason"];

  unint64_t linkUpDuration = self->_linkUpDuration;
  if (linkUpDuration == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v4 setObject:0 forKeyedSubscript:@"linkupDuration"];
  }

  else
  {
    v9 = +[WiFiUsageLQMTransformations getBinTimeIntervalUpTo12h:As:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "getBinTimeIntervalUpTo12h:As:",  1LL,  (double)linkUpDuration);
    [v4 setObject:v9 forKeyedSubscript:@"linkupDuration"];
  }

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMWindowAnalysisLinkDown;
  v10 = -[WiFiUsageLQMWindowAnalysis subsequentTriggers](&v39, sel_subsequentTriggers);
  v11 = (void *)MEMORY[0x189603F18];
  [MEMORY[0x189607A20] sortDescriptorWithKey:@"timestamp" ascending:1];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 arrayWithObject:v12];
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 sortedArrayUsingDescriptors:v13];
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v15 = [v14 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v41;
    while (2)
    {
      for (uint64_t i = 0LL; i != v16; ++i)
      {
        if (*(void *)v41 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        [v19 reason];
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (v20 == @"Join")
        {
          v38.receiver = self;
          v38.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMWindowAnalysisLinkDown;
          v21 = -[WiFiUsageLQMWindowAnalysis timestamp](&v38, sel_timestamp);
          [v19 timestamp];
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          [v21 timeIntervalSinceDate:v22];
          v23 = +[WiFiUsageLQMTransformations getBinTimeIntervalUpTo60s:As:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "getBinTimeIntervalUpTo60s:As:",  1LL);
          [v4 setObject:v23 forKeyedSubscript:@"timeToJoin"];

          goto LABEL_14;
        }
      }

      uint64_t v16 = [v14 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

- (BOOL)isInvoluntary
{
  return self->_isInvoluntary;
}

- (void)setIsInvoluntary:(BOOL)a3
{
  self->_isInvoluntary = a3;
}

- (NSString)linkDownReason
{
  return self->_linkDownReason;
}

- (void)setLinkDownReason:(id)a3
{
}

- (int64_t)linkDownSubreason
{
  return self->_linkDownSubreason;
}

- (void)setLinkDownSubreason:(int64_t)a3
{
  self->_linkDownSubreason = a3;
}

- (unint64_t)linkUpDuration
{
  return self->_linkUpDuration;
}

- (void)setLinkUpDuration:(unint64_t)a3
{
  self->_unint64_t linkUpDuration = a3;
}

- (void).cxx_destruct
{
}

@end