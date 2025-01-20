@interface WiFiUsageLQMWindowAnalysisJoin
- (NSString)joinReason;
- (WiFiUsageLQMWindowAnalysisJoin)initWithRollingWindow:(id)a3 andReasonString:(id)a4 andContext:(context)a5 andTimestamp:(id)a6 onQueue:(id)a7;
- (id)addDimensionsTo:(id)a3;
- (void)setJoinReason:(id)a3;
@end

@implementation WiFiUsageLQMWindowAnalysisJoin

- (WiFiUsageLQMWindowAnalysisJoin)initWithRollingWindow:(id)a3 andReasonString:(id)a4 andContext:(context)a5 andTimestamp:(id)a6 onQueue:(id)a7
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMWindowAnalysisJoin;
  uint64_t v10 = *(void *)&a5.var0 & 0xFFFFFFLL;
  id v11 = a4;
  v12 = -[WiFiUsageLQMWindowAnalysis initWithRollingWindow:andReason:andContext:andTimestamp:onQueue:]( &v14,  sel_initWithRollingWindow_andReason_andContext_andTimestamp_onQueue_,  a3,  @"Join",  v10,  a6,  a7);
  -[WiFiUsageLQMWindowAnalysisJoin setJoinReason:](v12, "setJoinReason:", v11, v14.receiver, v14.super_class);

  return v12;
}

- (id)addDimensionsTo:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMWindowAnalysisJoin;
  id v5 = -[WiFiUsageLQMWindowAnalysis addDimensionsTo:](&v7, sel_addDimensionsTo_, v4);
  [v4 setObject:self->_joinReason forKeyedSubscript:@"join_reason"];
  return v4;
}

- (NSString)joinReason
{
  return self->_joinReason;
}

- (void)setJoinReason:(id)a3
{
}

- (void).cxx_destruct
{
}

@end