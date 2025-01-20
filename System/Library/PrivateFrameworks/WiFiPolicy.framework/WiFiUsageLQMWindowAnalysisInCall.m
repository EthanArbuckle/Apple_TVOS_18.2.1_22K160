@interface WiFiUsageLQMWindowAnalysisInCall
- (NSString)status;
- (WiFiUsageLQMWindowAnalysisInCall)initWithRollingWindow:(id)a3 andCallStatus:(id)a4 andCallDuration:(double)a5 andContext:(context)a6 andTimestamp:(id)a7 onQueue:(id)a8;
- (double)duration;
- (id)addDimensionsTo:(id)a3;
- (void)setDuration:(double)a3;
- (void)setStatus:(id)a3;
@end

@implementation WiFiUsageLQMWindowAnalysisInCall

- (WiFiUsageLQMWindowAnalysisInCall)initWithRollingWindow:(id)a3 andCallStatus:(id)a4 andCallDuration:(double)a5 andContext:(context)a6 andTimestamp:(id)a7 onQueue:(id)a8
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMWindowAnalysisInCall;
  uint64_t v12 = *(void *)&a6.var0 & 0xFFFFFFLL;
  id v13 = a4;
  v14 = -[WiFiUsageLQMWindowAnalysis initWithRollingWindow:andReason:andContext:andTimestamp:onQueue:]( &v16,  sel_initWithRollingWindow_andReason_andContext_andTimestamp_onQueue_,  a3,  @"InCall",  v12,  a7,  a8);
  -[WiFiUsageLQMWindowAnalysisInCall setStatus:](v14, "setStatus:", v13, v16.receiver, v16.super_class);

  -[WiFiUsageLQMWindowAnalysisInCall setDuration:](v14, "setDuration:", a5);
  return v14;
}

- (id)addDimensionsTo:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMWindowAnalysisInCall;
  id v5 = -[WiFiUsageLQMWindowAnalysis addDimensionsTo:](&v8, sel_addDimensionsTo_, v4);
  [v4 setObject:self->_status forKeyedSubscript:@"call_status"];
  if (!-[NSString isEqualToString:](self->_status, "isEqualToString:", @"Call Start"))
  {
    v6 = +[WiFiUsageLQMTransformations getBinTimeIntervalUpTo12h:As:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "getBinTimeIntervalUpTo12h:As:",  1LL,  self->_duration);
    [v4 setObject:v6 forKeyedSubscript:@"call_duration"];
  }

  return v4;
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
}

@end