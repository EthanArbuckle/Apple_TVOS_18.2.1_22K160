@interface WiFiUsageLQMWindowAnalysisLinkTest
- (NSString)linkTestReason;
- (WFMeasureResult)linkTestResults;
- (WiFiUsageLQMWindowAnalysisLinkTest)initWithRollingWindow:(id)a3 andReason:(id)a4 withWFMeasureResults:(id)a5 andContext:(context)a6 andTimestamp:(id)a7 onQueue:(id)a8;
- (id)addDimensionsTo:(id)a3;
- (void)setLinkTestReason:(id)a3;
- (void)setLinkTestResults:(id)a3;
@end

@implementation WiFiUsageLQMWindowAnalysisLinkTest

- (WiFiUsageLQMWindowAnalysisLinkTest)initWithRollingWindow:(id)a3 andReason:(id)a4 withWFMeasureResults:(id)a5 andContext:(context)a6 andTimestamp:(id)a7 onQueue:(id)a8
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMWindowAnalysisLinkTest;
  uint64_t v12 = *(void *)&a6.var0 & 0xFFFFFFLL;
  id v13 = a5;
  id v14 = a4;
  v15 = -[WiFiUsageLQMWindowAnalysis initWithRollingWindow:andReason:andContext:andTimestamp:onQueue:]( &v17,  sel_initWithRollingWindow_andReason_andContext_andTimestamp_onQueue_,  a3,  @"LinkTest",  v12,  a7,  a8);
  -[WiFiUsageLQMWindowAnalysisLinkTest setLinkTestResults:]( v15,  "setLinkTestResults:",  v13,  v17.receiver,  v17.super_class);

  -[WiFiUsageLQMWindowAnalysisLinkTest setLinkTestReason:](v15, "setLinkTestReason:", v14);
  return v15;
}

- (id)addDimensionsTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMWindowAnalysisLinkTest;
  id v5 = -[WiFiUsageLQMWindowAnalysis addDimensionsTo:](&v26, sel_addDimensionsTo_, v4);
  v6 = v4;
  [v4 setObject:self->_linkTestReason forKeyedSubscript:@"linktest_reason"];
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  v7 = self;
  -[WFMeasureResult allPrimitiveProperties](self->_linkTestResults, "allPrimitiveProperties");
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        -[WFMeasureResult binnedProperty:](self->_linkTestResults, "binnedProperty:", v12);
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        [NSString stringWithFormat:@"linktest_%@", v12];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 setObject:v13 forKeyedSubscript:v14];
      }

      uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }

    while (v9);
  }
  v15 = -[WFMeasureResult typeAsString](self->_linkTestResults, "typeAsString");
  v16 = v6;
  [v6 setObject:v15 forKeyedSubscript:@"linktest_type"];

  -[WFMeasureResult statusForLocal](v7->_linkTestResults, "statusForLocal");
  objc_super v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 setValue:v17 forKey:@"linktest_statusForLocal"];
  v18 = -[WFMeasureResult statusForInternet](v7->_linkTestResults, "statusForInternet");
  [v16 setValue:v18 forKey:@"linktest_statusForInternet"];
  v19 = -[WFMeasureResult statusForDNS](v7->_linkTestResults, "statusForDNS");
  [v16 setValue:v19 forKey:@"linktest_statusForDNS"];

  return v16;
}

- (WFMeasureResult)linkTestResults
{
  return self->_linkTestResults;
}

- (void)setLinkTestResults:(id)a3
{
}

- (NSString)linkTestReason
{
  return self->_linkTestReason;
}

- (void)setLinkTestReason:(id)a3
{
}

- (void).cxx_destruct
{
}

@end