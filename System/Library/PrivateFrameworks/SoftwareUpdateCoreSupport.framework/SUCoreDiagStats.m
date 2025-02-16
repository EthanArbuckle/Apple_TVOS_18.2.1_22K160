@interface SUCoreDiagStats
+ (BOOL)supportsSecureCoding;
- (BOOL)encounteredProblems;
- (SUCoreDiagStats)init;
- (SUCoreDiagStats)initWithBeginCount:(int64_t)a3 withEndSuccessCount:(int64_t)a4 withEndFailCount:(int64_t)a5 withEndFailIndicationsCount:(int64_t)a6 withEndFailAllIndications:(int64_t)a7 withErrorCount:(int64_t)a8 withErrorIndicationsCount:(int64_t)a9 withErrorAllIndications:(int64_t)a10 withAnomalyCount:(int64_t)a11 withAnomalyIndicationsCount:(int64_t)a12 withAnomalyAllIndications:(int64_t)a13 withFailureCount:(int64_t)a14 withFailureIndicationsCount:(int64_t)a15 withFailureAllIndications:(int64_t)a16 withFaultCount:(int64_t)a17 withFaultIndicationsCount:(int64_t)a18 withFaultAllIndications:(int64_t)a19 withStateEventCount:(int64_t)a20;
- (SUCoreDiagStats)initWithCoder:(id)a3;
- (id)copy;
- (id)description;
- (id)initByCombining:(id)a3 withAdditonal:(id)a4;
- (id)initByCombining:(id)a3 withBeginCount:(int64_t)a4 withEndSuccessCount:(int64_t)a5 withEndFailCount:(int64_t)a6 withEndFailIndicationsCount:(int64_t)a7 withEndFailAllIndications:(int64_t)a8 withErrorCount:(int64_t)a9 withErrorIndicationsCount:(int64_t)a10 withErrorAllIndications:(int64_t)a11 withAnomalyCount:(int64_t)a12 withAnomalyIndicationsCount:(int64_t)a13 withAnomalyAllIndications:(int64_t)a14 withFailureCount:(int64_t)a15 withFailureIndicationsCount:(int64_t)a16 withFailureAllIndications:(int64_t)a17 withFaultCount:(int64_t)a18 withFaultIndicationsCount:(int64_t)a19 withFaultAllIndications:(int64_t)a20 withStateEventCount:(int64_t)a21;
- (id)initIgnoringSuccessRelated;
- (id)summary;
- (id)summaryOfProblems;
- (int64_t)allIndications;
- (int64_t)anomalyAllIndications;
- (int64_t)anomalyCount;
- (int64_t)anomalyIndicationsCount;
- (int64_t)beginCount;
- (int64_t)endFailAllIndications;
- (int64_t)endFailCount;
- (int64_t)endFailIndicationsCount;
- (int64_t)endSuccessCount;
- (int64_t)errorAllIndications;
- (int64_t)errorCount;
- (int64_t)errorIndicationsCount;
- (int64_t)failureAllIndications;
- (int64_t)failureCount;
- (int64_t)failureIndicationsCount;
- (int64_t)faultAllIndications;
- (int64_t)faultCount;
- (int64_t)faultIndicationsCount;
- (int64_t)stateEventCount;
- (void)combineStartingFrom:(id)a3 endingWith:(id)a4;
- (void)combineWithStats:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAnomalyAllIndications:(int64_t)a3;
- (void)setAnomalyCount:(int64_t)a3;
- (void)setAnomalyIndicationsCount:(int64_t)a3;
- (void)setBeginCount:(int64_t)a3;
- (void)setEndFailAllIndications:(int64_t)a3;
- (void)setEndFailCount:(int64_t)a3;
- (void)setEndFailIndicationsCount:(int64_t)a3;
- (void)setEndSuccessCount:(int64_t)a3;
- (void)setErrorAllIndications:(int64_t)a3;
- (void)setErrorCount:(int64_t)a3;
- (void)setErrorIndicationsCount:(int64_t)a3;
- (void)setFailureAllIndications:(int64_t)a3;
- (void)setFailureCount:(int64_t)a3;
- (void)setFailureIndicationsCount:(int64_t)a3;
- (void)setFaultAllIndications:(int64_t)a3;
- (void)setFaultCount:(int64_t)a3;
- (void)setFaultIndicationsCount:(int64_t)a3;
- (void)setStateEventCount:(int64_t)a3;
@end

@implementation SUCoreDiagStats

- (SUCoreDiagStats)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SUCoreDiagStats;
  result = -[SUCoreDiagStats init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_faultAllIndications = 0u;
    *(_OWORD *)&result->_faultCount = 0u;
    *(_OWORD *)&result->_failureIndicationsCount = 0u;
    *(_OWORD *)&result->_anomalyAllIndications = 0u;
    *(_OWORD *)&result->_anomalyCount = 0u;
    *(_OWORD *)&result->_errorIndicationsCount = 0u;
    *(_OWORD *)&result->_endFailAllIndications = 0u;
    *(_OWORD *)&result->_endFailCount = 0u;
    *(_OWORD *)&result->_beginCount = 0u;
  }

  return result;
}

- (id)initIgnoringSuccessRelated
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SUCoreDiagStats;
  id result = -[SUCoreDiagStats init](&v3, sel_init);
  if (result)
  {
    *((void *)result + 1) = -1LL;
    *((void *)result + 2) = -1LL;
    *(_OWORD *)((char *)result + 24) = 0u;
    *(_OWORD *)((char *)result + 40) = 0u;
    *(_OWORD *)((char *)result + 56) = 0u;
    *(_OWORD *)((char *)result + 72) = 0u;
    *(_OWORD *)((char *)result + 88) = 0u;
    *(_OWORD *)((char *)result + 104) = 0u;
    *(_OWORD *)((char *)result + 120) = 0u;
    *((void *)result + 17) = 0LL;
    *((void *)result + 18) = -1LL;
  }

  return result;
}

- (SUCoreDiagStats)initWithBeginCount:(int64_t)a3 withEndSuccessCount:(int64_t)a4 withEndFailCount:(int64_t)a5 withEndFailIndicationsCount:(int64_t)a6 withEndFailAllIndications:(int64_t)a7 withErrorCount:(int64_t)a8 withErrorIndicationsCount:(int64_t)a9 withErrorAllIndications:(int64_t)a10 withAnomalyCount:(int64_t)a11 withAnomalyIndicationsCount:(int64_t)a12 withAnomalyAllIndications:(int64_t)a13 withFailureCount:(int64_t)a14 withFailureIndicationsCount:(int64_t)a15 withFailureAllIndications:(int64_t)a16 withFaultCount:(int64_t)a17 withFaultIndicationsCount:(int64_t)a18 withFaultAllIndications:(int64_t)a19 withStateEventCount:(int64_t)a20
{
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___SUCoreDiagStats;
  id result = -[SUCoreDiagStats init](&v27, sel_init);
  if (result)
  {
    result->_beginCount = a3;
    result->_endSuccessCount = a4;
    result->_endFailCount = a5;
    result->_endFailIndicationsCount = a6;
    result->_endFailAllIndications = a7;
    result->_errorCount = a8;
    result->_errorIndicationsCount = a9;
    result->_errorAllIndications = a10;
    result->_anomalyCount = a11;
    result->_anomalyIndicationsCount = a12;
    result->_anomalyAllIndications = a13;
    result->_failureCount = a14;
    result->_failureIndicationsCount = a15;
    result->_failureAllIndications = a16;
    result->_faultCount = a17;
    result->_faultIndicationsCount = a18;
    result->_faultAllIndications = a19;
    result->_stateEventCount = a20;
  }

  return result;
}

- (id)initByCombining:(id)a3 withBeginCount:(int64_t)a4 withEndSuccessCount:(int64_t)a5 withEndFailCount:(int64_t)a6 withEndFailIndicationsCount:(int64_t)a7 withEndFailAllIndications:(int64_t)a8 withErrorCount:(int64_t)a9 withErrorIndicationsCount:(int64_t)a10 withErrorAllIndications:(int64_t)a11 withAnomalyCount:(int64_t)a12 withAnomalyIndicationsCount:(int64_t)a13 withAnomalyAllIndications:(int64_t)a14 withFailureCount:(int64_t)a15 withFailureIndicationsCount:(int64_t)a16 withFailureAllIndications:(int64_t)a17 withFaultCount:(int64_t)a18 withFaultIndicationsCount:(int64_t)a19 withFaultAllIndications:(int64_t)a20 withStateEventCount:(int64_t)a21
{
  id v27 = a3;
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___SUCoreDiagStats;
  v28 = -[SUCoreDiagStats init](&v39, sel_init);
  if (v28)
  {
    if ((a4 & 0x8000000000000000LL) == 0) {
      a4 += [v27 beginCount];
    }
    v28->_beginCount = a4;
    if ((a5 & 0x8000000000000000LL) == 0) {
      a5 += [v27 endSuccessCount];
    }
    int64_t v29 = a9;
    v28->_endSuccessCount = a5;
    if ((a6 & 0x8000000000000000LL) == 0) {
      a6 += [v27 endFailCount];
    }
    int64_t v30 = a10;
    v28->_endFailCount = a6;
    if ((a7 & 0x8000000000000000LL) == 0) {
      a7 += [v27 endFailIndicationsCount];
    }
    int64_t v31 = a12;
    v28->_endFailIndicationsCount = a7;
    v28->_endFailAllIndications = [v27 endFailAllIndications] | a8;
    if ((a9 & 0x8000000000000000LL) == 0) {
      int64_t v29 = [v27 errorCount] + a9;
    }
    int64_t v32 = a13;
    v28->_errorCount = v29;
    if ((a10 & 0x8000000000000000LL) == 0) {
      int64_t v30 = [v27 errorIndicationsCount] + a10;
    }
    int64_t v33 = a15;
    v28->_errorIndicationsCount = v30;
    v28->_errorAllIndications = [v27 errorAllIndications] | a11;
    if ((a12 & 0x8000000000000000LL) == 0) {
      int64_t v31 = [v27 anomalyCount] + a12;
    }
    int64_t v34 = a16;
    v28->_anomalyCount = v31;
    if ((a13 & 0x8000000000000000LL) == 0) {
      int64_t v32 = [v27 anomalyIndicationsCount] + a13;
    }
    int64_t v35 = a18;
    v28->_anomalyIndicationsCount = v32;
    v28->_anomalyAllIndications = [v27 anomalyAllIndications] | a14;
    if ((a15 & 0x8000000000000000LL) == 0) {
      int64_t v33 = [v27 failureCount] + a15;
    }
    int64_t v36 = a19;
    v28->_failureCount = v33;
    if ((a16 & 0x8000000000000000LL) == 0) {
      int64_t v34 = [v27 failureIndicationsCount] + a16;
    }
    int64_t v37 = a21;
    v28->_failureIndicationsCount = v34;
    v28->_failureAllIndications = [v27 failureAllIndications] | a17;
    if ((a18 & 0x8000000000000000LL) == 0) {
      int64_t v35 = [v27 faultCount] + a18;
    }
    v28->_faultCount = v35;
    if ((a19 & 0x8000000000000000LL) == 0) {
      int64_t v36 = [v27 faultIndicationsCount] + a19;
    }
    v28->_faultIndicationsCount = v36;
    v28->_faultAllIndications = [v27 faultAllIndications] | a20;
    if ((a21 & 0x8000000000000000LL) == 0) {
      int64_t v37 = [v27 stateEventCount] + a21;
    }
    v28->_stateEventCount = v37;
  }

  return v28;
}

- (id)initByCombining:(id)a3 withAdditonal:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___SUCoreDiagStats;
  v8 = -[SUCoreDiagStats init](&v28, sel_init);
  if (v8)
  {
    uint64_t v9 = [v6 beginCount];
    v8->_beginCount = [v7 beginCount] + v9;
    uint64_t v10 = [v6 endSuccessCount];
    v8->_endSuccessCount = [v7 endSuccessCount] + v10;
    uint64_t v11 = [v6 endFailCount];
    v8->_endFailCount = [v7 endFailCount] + v11;
    uint64_t v12 = [v6 endFailIndicationsCount];
    v8->_endFailIndicationsCount = [v7 endFailIndicationsCount] + v12;
    uint64_t v13 = [v6 endFailAllIndications];
    v8->_endFailAllIndications = [v7 endFailAllIndications] | v13;
    uint64_t v14 = [v6 errorCount];
    v8->_errorCount = [v7 errorCount] + v14;
    uint64_t v15 = [v6 errorIndicationsCount];
    v8->_errorIndicationsCount = [v7 errorIndicationsCount] + v15;
    uint64_t v16 = [v6 errorAllIndications];
    v8->_errorAllIndications = [v7 errorAllIndications] | v16;
    uint64_t v17 = [v6 anomalyCount];
    v8->_anomalyCount = [v7 anomalyCount] + v17;
    uint64_t v18 = [v6 anomalyIndicationsCount];
    v8->_anomalyIndicationsCount = [v7 anomalyIndicationsCount] + v18;
    uint64_t v19 = [v6 anomalyAllIndications];
    v8->_anomalyAllIndications = [v7 anomalyAllIndications] | v19;
    uint64_t v20 = [v6 failureCount];
    v8->_failureCount = [v7 failureCount] + v20;
    uint64_t v21 = [v6 failureIndicationsCount];
    v8->_failureIndicationsCount = [v7 failureIndicationsCount] + v21;
    uint64_t v22 = [v6 failureAllIndications];
    v8->_failureAllIndications = [v7 failureAllIndications] | v22;
    uint64_t v23 = [v6 faultCount];
    v8->_faultCount = [v7 faultCount] + v23;
    uint64_t v24 = [v6 faultIndicationsCount];
    v8->_faultIndicationsCount = [v7 faultIndicationsCount] + v24;
    uint64_t v25 = [v6 faultAllIndications];
    v8->_faultAllIndications = [v7 faultAllIndications] | v25;
    uint64_t v26 = [v6 stateEventCount];
    v8->_stateEventCount = [v7 stateEventCount] + v26;
  }

  return v8;
}

- (SUCoreDiagStats)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SUCoreDiagStats;
  v5 = -[SUCoreDiagStats init](&v7, sel_init);
  if (v5)
  {
    v5->_beginCount = [v4 decodeInt64ForKey:@"beginCount"];
    v5->_endSuccessCount = [v4 decodeInt64ForKey:@"endSuccessCount"];
    v5->_endFailCount = [v4 decodeInt64ForKey:@"endFailCount"];
    v5->_endFailIndicationsCount = [v4 decodeInt64ForKey:@"endFailIndicationsCount"];
    v5->_endFailAllIndications = [v4 decodeInt64ForKey:@"endFailAllIndications"];
    v5->_errorCount = [v4 decodeInt64ForKey:@"errorCount"];
    v5->_errorIndicationsCount = [v4 decodeInt64ForKey:@"errorIndicationsCount"];
    v5->_errorAllIndications = [v4 decodeInt64ForKey:@"errorAllIndications"];
    v5->_anomalyCount = [v4 decodeInt64ForKey:@"anomalyCount"];
    v5->_anomalyIndicationsCount = [v4 decodeInt64ForKey:@"anomalyIndicationsCount"];
    v5->_anomalyAllIndications = [v4 decodeInt64ForKey:@"anomalyAllIndications"];
    v5->_failureCount = [v4 decodeInt64ForKey:@"failureCount"];
    v5->_failureIndicationsCount = [v4 decodeInt64ForKey:@"failureIndicationsCount"];
    v5->_failureAllIndications = [v4 decodeInt64ForKey:@"failureAllIndications"];
    v5->_faultCount = [v4 decodeInt64ForKey:@"faultCount"];
    v5->_faultIndicationsCount = [v4 decodeInt64ForKey:@"faultIndicationsCount"];
    v5->_faultAllIndications = [v4 decodeInt64ForKey:@"faultAllIndications"];
    v5->_stateEventCount = [v4 decodeInt64ForKey:@"stateEventCount"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t beginCount = self->_beginCount;
  id v5 = a3;
  [v5 encodeInt64:beginCount forKey:@"beginCount"];
  [v5 encodeInt64:self->_endSuccessCount forKey:@"endSuccessCount"];
  [v5 encodeInt64:self->_endFailCount forKey:@"endFailCount"];
  [v5 encodeInt64:self->_endFailIndicationsCount forKey:@"endFailIndicationsCount"];
  [v5 encodeInt64:self->_endFailAllIndications forKey:@"endFailAllIndications"];
  [v5 encodeInt64:self->_errorCount forKey:@"errorCount"];
  [v5 encodeInt64:self->_errorIndicationsCount forKey:@"errorIndicationsCount"];
  [v5 encodeInt64:self->_errorAllIndications forKey:@"errorAllIndications"];
  [v5 encodeInt64:self->_anomalyCount forKey:@"anomalyCount"];
  [v5 encodeInt64:self->_anomalyIndicationsCount forKey:@"anomalyIndicationsCount"];
  [v5 encodeInt64:self->_anomalyAllIndications forKey:@"anomalyAllIndications"];
  [v5 encodeInt64:self->_failureCount forKey:@"failureCount"];
  [v5 encodeInt64:self->_failureIndicationsCount forKey:@"failureIndicationsCount"];
  [v5 encodeInt64:self->_failureAllIndications forKey:@"failureAllIndications"];
  [v5 encodeInt64:self->_faultCount forKey:@"faultCount"];
  [v5 encodeInt64:self->_faultIndicationsCount forKey:@"faultIndicationsCount"];
  [v5 encodeInt64:self->_faultAllIndications forKey:@"faultAllIndications"];
  [v5 encodeInt64:self->_stateEventCount forKey:@"stateEventCount"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___SUCoreDiagStats);
  -[SUCoreDiagStats setBeginCount:](v3, "setBeginCount:", -[SUCoreDiagStats beginCount](self, "beginCount"));
  -[SUCoreDiagStats setEndSuccessCount:]( v3,  "setEndSuccessCount:",  -[SUCoreDiagStats endSuccessCount](self, "endSuccessCount"));
  -[SUCoreDiagStats setEndFailCount:](v3, "setEndFailCount:", -[SUCoreDiagStats endFailCount](self, "endFailCount"));
  -[SUCoreDiagStats setEndFailIndicationsCount:]( v3,  "setEndFailIndicationsCount:",  -[SUCoreDiagStats endFailIndicationsCount](self, "endFailIndicationsCount"));
  -[SUCoreDiagStats setEndFailAllIndications:]( v3,  "setEndFailAllIndications:",  -[SUCoreDiagStats endFailAllIndications](self, "endFailAllIndications"));
  -[SUCoreDiagStats setErrorCount:](v3, "setErrorCount:", -[SUCoreDiagStats errorCount](self, "errorCount"));
  -[SUCoreDiagStats setErrorIndicationsCount:]( v3,  "setErrorIndicationsCount:",  -[SUCoreDiagStats errorIndicationsCount](self, "errorIndicationsCount"));
  -[SUCoreDiagStats setErrorAllIndications:]( v3,  "setErrorAllIndications:",  -[SUCoreDiagStats errorAllIndications](self, "errorAllIndications"));
  -[SUCoreDiagStats setAnomalyCount:](v3, "setAnomalyCount:", -[SUCoreDiagStats anomalyCount](self, "anomalyCount"));
  -[SUCoreDiagStats setAnomalyIndicationsCount:]( v3,  "setAnomalyIndicationsCount:",  -[SUCoreDiagStats anomalyIndicationsCount](self, "anomalyIndicationsCount"));
  -[SUCoreDiagStats setAnomalyAllIndications:]( v3,  "setAnomalyAllIndications:",  -[SUCoreDiagStats anomalyAllIndications](self, "anomalyAllIndications"));
  -[SUCoreDiagStats setFailureCount:](v3, "setFailureCount:", -[SUCoreDiagStats failureCount](self, "failureCount"));
  -[SUCoreDiagStats setFailureIndicationsCount:]( v3,  "setFailureIndicationsCount:",  -[SUCoreDiagStats failureIndicationsCount](self, "failureIndicationsCount"));
  -[SUCoreDiagStats setFailureAllIndications:]( v3,  "setFailureAllIndications:",  -[SUCoreDiagStats failureAllIndications](self, "failureAllIndications"));
  -[SUCoreDiagStats setFaultCount:](v3, "setFaultCount:", -[SUCoreDiagStats faultCount](self, "faultCount"));
  -[SUCoreDiagStats setFaultIndicationsCount:]( v3,  "setFaultIndicationsCount:",  -[SUCoreDiagStats faultIndicationsCount](self, "faultIndicationsCount"));
  -[SUCoreDiagStats setFaultAllIndications:]( v3,  "setFaultAllIndications:",  -[SUCoreDiagStats faultAllIndications](self, "faultAllIndications"));
  -[SUCoreDiagStats setStateEventCount:]( v3,  "setStateEventCount:",  -[SUCoreDiagStats stateEventCount](self, "stateEventCount"));
  return v3;
}

- (void)combineWithStats:(id)a3
{
  id v30 = a3;
  if ([v30 beginCount] >= 1)
  {
    int64_t v4 = -[SUCoreDiagStats beginCount](self, "beginCount");
    uint64_t v5 = [v30 beginCount];
    if ((v4 & 0x8000000000000000LL) == 0) {
      v5 += -[SUCoreDiagStats beginCount](self, "beginCount");
    }
    -[SUCoreDiagStats setBeginCount:](self, "setBeginCount:", v5);
  }

  if ([v30 endSuccessCount] >= 1)
  {
    int64_t v6 = -[SUCoreDiagStats endSuccessCount](self, "endSuccessCount");
    uint64_t v7 = [v30 endSuccessCount];
    if ((v6 & 0x8000000000000000LL) == 0) {
      v7 += -[SUCoreDiagStats endSuccessCount](self, "endSuccessCount");
    }
    -[SUCoreDiagStats setEndSuccessCount:](self, "setEndSuccessCount:", v7);
  }

  if ([v30 endFailCount] >= 1)
  {
    int64_t v8 = -[SUCoreDiagStats endFailCount](self, "endFailCount");
    uint64_t v9 = [v30 endFailCount];
    if ((v8 & 0x8000000000000000LL) == 0) {
      v9 += -[SUCoreDiagStats endFailCount](self, "endFailCount");
    }
    -[SUCoreDiagStats setEndFailCount:](self, "setEndFailCount:", v9);
  }

  if ([v30 endFailIndicationsCount] >= 1)
  {
    int64_t v10 = -[SUCoreDiagStats endFailIndicationsCount](self, "endFailIndicationsCount");
    uint64_t v11 = [v30 endFailIndicationsCount];
    if ((v10 & 0x8000000000000000LL) == 0) {
      v11 += -[SUCoreDiagStats endFailIndicationsCount](self, "endFailIndicationsCount");
    }
    -[SUCoreDiagStats setEndFailIndicationsCount:](self, "setEndFailIndicationsCount:", v11);
  }

  -[SUCoreDiagStats setEndFailAllIndications:]( self,  "setEndFailAllIndications:",  -[SUCoreDiagStats endFailAllIndications](self, "endFailAllIndications") | [v30 endFailAllIndications]);
  if ([v30 errorCount] >= 1)
  {
    int64_t v12 = -[SUCoreDiagStats errorCount](self, "errorCount");
    uint64_t v13 = [v30 errorCount];
    if ((v12 & 0x8000000000000000LL) == 0) {
      v13 += -[SUCoreDiagStats errorCount](self, "errorCount");
    }
    -[SUCoreDiagStats setErrorCount:](self, "setErrorCount:", v13);
  }

  if ([v30 errorIndicationsCount] >= 1)
  {
    int64_t v14 = -[SUCoreDiagStats errorIndicationsCount](self, "errorIndicationsCount");
    uint64_t v15 = [v30 errorIndicationsCount];
    if ((v14 & 0x8000000000000000LL) == 0) {
      v15 += -[SUCoreDiagStats errorIndicationsCount](self, "errorIndicationsCount");
    }
    -[SUCoreDiagStats setErrorIndicationsCount:](self, "setErrorIndicationsCount:", v15);
  }

  -[SUCoreDiagStats setErrorAllIndications:]( self,  "setErrorAllIndications:",  -[SUCoreDiagStats errorAllIndications](self, "errorAllIndications") | [v30 errorAllIndications]);
  if ([v30 anomalyCount] >= 1)
  {
    int64_t v16 = -[SUCoreDiagStats anomalyCount](self, "anomalyCount");
    uint64_t v17 = [v30 anomalyCount];
    if ((v16 & 0x8000000000000000LL) == 0) {
      v17 += -[SUCoreDiagStats anomalyCount](self, "anomalyCount");
    }
    -[SUCoreDiagStats setAnomalyCount:](self, "setAnomalyCount:", v17);
  }

  if ([v30 anomalyIndicationsCount] >= 1)
  {
    int64_t v18 = -[SUCoreDiagStats anomalyIndicationsCount](self, "anomalyIndicationsCount");
    uint64_t v19 = [v30 anomalyIndicationsCount];
    if ((v18 & 0x8000000000000000LL) == 0) {
      v19 += -[SUCoreDiagStats anomalyIndicationsCount](self, "anomalyIndicationsCount");
    }
    -[SUCoreDiagStats setAnomalyIndicationsCount:](self, "setAnomalyIndicationsCount:", v19);
  }

  -[SUCoreDiagStats setAnomalyAllIndications:]( self,  "setAnomalyAllIndications:",  -[SUCoreDiagStats anomalyAllIndications](self, "anomalyAllIndications") | [v30 anomalyAllIndications]);
  if ([v30 failureCount] >= 1)
  {
    int64_t v20 = -[SUCoreDiagStats failureCount](self, "failureCount");
    uint64_t v21 = [v30 failureCount];
    if ((v20 & 0x8000000000000000LL) == 0) {
      v21 += -[SUCoreDiagStats failureCount](self, "failureCount");
    }
    -[SUCoreDiagStats setFailureCount:](self, "setFailureCount:", v21);
  }

  if ([v30 failureIndicationsCount] >= 1)
  {
    int64_t v22 = -[SUCoreDiagStats failureIndicationsCount](self, "failureIndicationsCount");
    uint64_t v23 = [v30 failureIndicationsCount];
    if ((v22 & 0x8000000000000000LL) == 0) {
      v23 += -[SUCoreDiagStats failureIndicationsCount](self, "failureIndicationsCount");
    }
    -[SUCoreDiagStats setFailureIndicationsCount:](self, "setFailureIndicationsCount:", v23);
  }

  -[SUCoreDiagStats setFailureAllIndications:]( self,  "setFailureAllIndications:",  -[SUCoreDiagStats failureAllIndications](self, "failureAllIndications") | [v30 failureAllIndications]);
  if ([v30 faultCount] >= 1)
  {
    int64_t v24 = -[SUCoreDiagStats faultCount](self, "faultCount");
    uint64_t v25 = [v30 faultCount];
    if ((v24 & 0x8000000000000000LL) == 0) {
      v25 += -[SUCoreDiagStats faultCount](self, "faultCount");
    }
    -[SUCoreDiagStats setFaultCount:](self, "setFaultCount:", v25);
  }

  if ([v30 faultIndicationsCount] >= 1)
  {
    int64_t v26 = -[SUCoreDiagStats faultIndicationsCount](self, "faultIndicationsCount");
    uint64_t v27 = [v30 faultIndicationsCount];
    if ((v26 & 0x8000000000000000LL) == 0) {
      v27 += -[SUCoreDiagStats faultIndicationsCount](self, "faultIndicationsCount");
    }
    -[SUCoreDiagStats setFaultIndicationsCount:](self, "setFaultIndicationsCount:", v27);
  }

  -[SUCoreDiagStats setFaultAllIndications:]( self,  "setFaultAllIndications:",  -[SUCoreDiagStats faultAllIndications](self, "faultAllIndications") | [v30 faultAllIndications]);
  if ([v30 stateEventCount] >= 1)
  {
    int64_t v28 = -[SUCoreDiagStats stateEventCount](self, "stateEventCount");
    uint64_t v29 = [v30 stateEventCount];
    if ((v28 & 0x8000000000000000LL) == 0) {
      v29 += -[SUCoreDiagStats stateEventCount](self, "stateEventCount");
    }
    -[SUCoreDiagStats setStateEventCount:](self, "setStateEventCount:", v29);
  }
}

- (void)combineStartingFrom:(id)a3 endingWith:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[SUCoreDiagStats setBeginCount:]( self,  "setBeginCount:",  [v6 beginCount] - objc_msgSend(v7, "beginCount") + -[SUCoreDiagStats beginCount](self, "beginCount"));
  -[SUCoreDiagStats setEndSuccessCount:]( self,  "setEndSuccessCount:",  [v6 endSuccessCount]
  - [v7 endSuccessCount]
  + -[SUCoreDiagStats endSuccessCount](self, "endSuccessCount"));
  -[SUCoreDiagStats setEndFailCount:]( self,  "setEndFailCount:",  [v6 endFailCount]
  - [v7 endFailCount]
  + -[SUCoreDiagStats endFailCount](self, "endFailCount"));
  -[SUCoreDiagStats setEndFailIndicationsCount:]( self,  "setEndFailIndicationsCount:",  [v6 endFailIndicationsCount]
  - [v7 endFailIndicationsCount]
  + -[SUCoreDiagStats endFailIndicationsCount](self, "endFailIndicationsCount"));
  -[SUCoreDiagStats setEndFailAllIndications:]( self,  "setEndFailAllIndications:",  [v6 endFailAllIndications] | objc_msgSend(v7, "endFailAllIndications") | -[SUCoreDiagStats endFailAllIndications]( self,  "endFailAllIndications"));
  -[SUCoreDiagStats setErrorCount:]( self,  "setErrorCount:",  [v6 errorCount] - objc_msgSend(v7, "errorCount") + -[SUCoreDiagStats errorCount](self, "errorCount"));
  -[SUCoreDiagStats setErrorIndicationsCount:]( self,  "setErrorIndicationsCount:",  [v6 errorIndicationsCount]
  - [v7 errorIndicationsCount]
  + -[SUCoreDiagStats errorIndicationsCount](self, "errorIndicationsCount"));
  -[SUCoreDiagStats setErrorAllIndications:]( self,  "setErrorAllIndications:",  [v6 errorAllIndications] | objc_msgSend(v7, "errorAllIndications") | -[SUCoreDiagStats errorAllIndications]( self,  "errorAllIndications"));
  -[SUCoreDiagStats setAnomalyCount:]( self,  "setAnomalyCount:",  [v6 anomalyCount]
  - [v7 anomalyCount]
  + -[SUCoreDiagStats anomalyCount](self, "anomalyCount"));
  -[SUCoreDiagStats setAnomalyIndicationsCount:]( self,  "setAnomalyIndicationsCount:",  [v6 anomalyIndicationsCount]
  - [v7 anomalyIndicationsCount]
  + -[SUCoreDiagStats anomalyIndicationsCount](self, "anomalyIndicationsCount"));
  -[SUCoreDiagStats setAnomalyAllIndications:]( self,  "setAnomalyAllIndications:",  [v6 anomalyAllIndications] | objc_msgSend(v7, "anomalyAllIndications") | -[SUCoreDiagStats anomalyAllIndications]( self,  "anomalyAllIndications"));
  -[SUCoreDiagStats setFailureCount:]( self,  "setFailureCount:",  [v6 failureCount]
  - [v7 failureCount]
  + -[SUCoreDiagStats failureCount](self, "failureCount"));
  -[SUCoreDiagStats setFailureIndicationsCount:]( self,  "setFailureIndicationsCount:",  [v6 failureIndicationsCount]
  - [v7 failureIndicationsCount]
  + -[SUCoreDiagStats failureIndicationsCount](self, "failureIndicationsCount"));
  -[SUCoreDiagStats setFailureAllIndications:]( self,  "setFailureAllIndications:",  [v6 failureAllIndications] | objc_msgSend(v7, "failureAllIndications") | -[SUCoreDiagStats failureAllIndications]( self,  "failureAllIndications"));
  -[SUCoreDiagStats setFaultCount:]( self,  "setFaultCount:",  [v6 faultCount] - objc_msgSend(v7, "faultCount") + -[SUCoreDiagStats faultCount](self, "faultCount"));
  -[SUCoreDiagStats setFaultIndicationsCount:]( self,  "setFaultIndicationsCount:",  [v6 faultIndicationsCount]
  - [v7 faultIndicationsCount]
  + -[SUCoreDiagStats faultIndicationsCount](self, "faultIndicationsCount"));
  -[SUCoreDiagStats setFaultAllIndications:]( self,  "setFaultAllIndications:",  [v6 faultAllIndications] | objc_msgSend(v7, "faultAllIndications") | -[SUCoreDiagStats faultAllIndications]( self,  "faultAllIndications"));
  uint64_t v8 = [v6 stateEventCount];

  uint64_t v9 = [v7 stateEventCount];
  -[SUCoreDiagStats setStateEventCount:]( self,  "setStateEventCount:",  v8 - v9 + -[SUCoreDiagStats stateEventCount](self, "stateEventCount"));
}

- (int64_t)allIndications
{
  int64_t v3 = -[SUCoreDiagStats endFailAllIndications](self, "endFailAllIndications");
  int64_t v4 = -[SUCoreDiagStats errorAllIndications](self, "errorAllIndications") | v3;
  int64_t v5 = -[SUCoreDiagStats anomalyAllIndications](self, "anomalyAllIndications");
  int64_t v6 = v4 | v5 | -[SUCoreDiagStats failureAllIndications](self, "failureAllIndications");
  return v6 | -[SUCoreDiagStats faultAllIndications](self, "faultAllIndications");
}

- (id)description
{
  int64_t v31 = (void *)NSString;
  int64_t v30 = -[SUCoreDiagStats beginCount](self, "beginCount");
  int64_t v29 = -[SUCoreDiagStats endSuccessCount](self, "endSuccessCount");
  int64_t v28 = -[SUCoreDiagStats endFailCount](self, "endFailCount");
  int64_t v27 = -[SUCoreDiagStats endFailIndicationsCount](self, "endFailIndicationsCount");
  int64_t v33 = -[SUCoreDiagStats endFailAllIndications](self, "endFailAllIndications");
  if (v33)
  {
    +[SUCoreErrorInformation summaryOfIndications:]( &OBJC_CLASS___SUCoreErrorInformation,  "summaryOfIndications:",  -[SUCoreDiagStats endFailAllIndications](self, "endFailAllIndications"));
    int64_t v3 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int64_t v3 = @"None";
  }

  int64_t v25 = -[SUCoreDiagStats errorCount](self, "errorCount");
  int64_t v24 = -[SUCoreDiagStats errorIndicationsCount](self, "errorIndicationsCount");
  int64_t v26 = -[SUCoreDiagStats errorAllIndications](self, "errorAllIndications");
  if (v26)
  {
    +[SUCoreErrorInformation summaryOfIndications:]( &OBJC_CLASS___SUCoreErrorInformation,  "summaryOfIndications:",  -[SUCoreDiagStats errorAllIndications](self, "errorAllIndications"));
    int64_t v4 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int64_t v4 = @"None";
  }

  int64_t v22 = -[SUCoreDiagStats anomalyCount](self, "anomalyCount");
  int64_t v21 = -[SUCoreDiagStats anomalyIndicationsCount](self, "anomalyIndicationsCount");
  int64_t v23 = -[SUCoreDiagStats anomalyAllIndications](self, "anomalyAllIndications");
  if (v23)
  {
    +[SUCoreErrorInformation summaryOfIndications:]( &OBJC_CLASS___SUCoreErrorInformation,  "summaryOfIndications:",  -[SUCoreDiagStats anomalyAllIndications](self, "anomalyAllIndications"));
    int64_t v5 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int64_t v5 = @"None";
  }

  int64_t v32 = (__CFString *)v3;
  int64_t v20 = -[SUCoreDiagStats failureCount](self, "failureCount");
  int64_t v6 = -[SUCoreDiagStats failureIndicationsCount](self, "failureIndicationsCount");
  int64_t v7 = -[SUCoreDiagStats failureAllIndications](self, "failureAllIndications");
  uint64_t v8 = v4;
  if (v7)
  {
    +[SUCoreErrorInformation summaryOfIndications:]( &OBJC_CLASS___SUCoreErrorInformation,  "summaryOfIndications:",  -[SUCoreDiagStats failureAllIndications](self, "failureAllIndications"));
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v9 = @"None";
  }

  int64_t v10 = -[SUCoreDiagStats faultCount](self, "faultCount");
  int64_t v11 = -[SUCoreDiagStats faultIndicationsCount](self, "faultIndicationsCount");
  int64_t v12 = -[SUCoreDiagStats faultAllIndications](self, "faultAllIndications");
  if (v12)
  {
    +[SUCoreErrorInformation summaryOfIndications:]( &OBJC_CLASS___SUCoreErrorInformation,  "summaryOfIndications:",  -[SUCoreDiagStats faultAllIndications](self, "faultAllIndications"));
    uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v13 = @"None";
  }

  int64_t v19 = v11;
  int64_t v18 = v5;
  int64_t v14 = (__CFString *)v5;
  uint64_t v15 = (__CFString *)v8;
  [v31 stringWithFormat:@"\n[>>>\n                beginCount: %ld\n           endSuccessCount: %ld\n\n              endFailCount: %ld\n   endFailIndicationsCount: %ld\n     endFailAllIndications: %@\n\n                errorCount: %ld\n     errorIndicationsCount: %ld\n       errorAllIndications: %@\n\n              anomalyCount: %ld\n   anomalyIndicationsCount: %ld\n     anomalyAllIndications: %@\n\n              failureCount: %ld\n   failureIndicationsCount: %ld\n     failureAllIndications: %@\n\n                faultCount: %ld\n     faultIndicationsCount: %ld\n       faultAllIndications: %@\n\n           stateEventCount: %ld\n<<<]", v30, v29, v28, v27, v32, v25, v24, v8, v22, v21, v18, v20, v6, v9, v10, v19, v13, -[SUCoreDiagStats stateEventCount](self, "stateEventCount")];
  int64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12) {

  }
  if (v7) {
  if (v23)
  }

  if (v26) {
  if (v33)
  }

  return v16;
}

- (id)summary
{
  int64_t v3 = -[SUCoreDiagStats allIndications](self, "allIndications");
  int64_t v4 = (void *)NSString;
  int64_t v5 = -[SUCoreDiagStats beginCount](self, "beginCount");
  int64_t v6 = -[SUCoreDiagStats endSuccessCount](self, "endSuccessCount");
  int64_t v7 = -[SUCoreDiagStats endFailCount](self, "endFailCount");
  int64_t v8 = -[SUCoreDiagStats errorCount](self, "errorCount");
  int64_t v9 = -[SUCoreDiagStats anomalyCount](self, "anomalyCount");
  int64_t v10 = -[SUCoreDiagStats failureCount](self, "failureCount");
  int64_t v11 = -[SUCoreDiagStats faultCount](self, "faultCount");
  int64_t v12 = -[SUCoreDiagStats stateEventCount](self, "stateEventCount");
  int64_t v13 = v12;
  if (v3)
  {
    +[SUCoreErrorInformation summaryOfIndications:](&OBJC_CLASS___SUCoreErrorInformation, "summaryOfIndications:", v3);
    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 stringWithFormat:@"beginCount:%ld,endSuccessCount:%ld,endFailCount:%ld,errorCount:%ld,anomalyCount:%ld,failureCount:%ld,faultCount:%ld,stateEventCount:%ld,allIndications:%@", v5, v6, v7, v8, v9, v10, v11, v13, v14];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [v4 stringWithFormat:@"beginCount:%ld,endSuccessCount:%ld,endFailCount:%ld,errorCount:%ld,anomalyCount:%ld,failureCount:%ld,faultCount:%ld,stateEventCount:%ld,allIndications:%@", v5, v6, v7, v8, v9, v10, v11, v12, @"None"];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)summaryOfProblems
{
  int64_t v3 = -[SUCoreDiagStats allIndications](self, "allIndications");
  if (v3
    || -[SUCoreDiagStats endFailCount](self, "endFailCount") > 0
    || -[SUCoreDiagStats errorCount](self, "errorCount") > 0
    || -[SUCoreDiagStats anomalyCount](self, "anomalyCount") > 0
    || -[SUCoreDiagStats failureCount](self, "failureCount") > 0
    || -[SUCoreDiagStats faultCount](self, "faultCount") >= 1)
  {
    [MEMORY[0x189607940] stringWithString:@"|"];
    int64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      +[SUCoreErrorInformation summaryOfIndications:](&OBJC_CLASS___SUCoreErrorInformation, "summaryOfIndications:", v3);
      int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString appendFormat:](v4, "appendFormat:", @"%@|", v5);
    }

    if (-[SUCoreDiagStats endFailCount](self, "endFailCount") >= 1) {
      -[__CFString appendFormat:]( v4,  "appendFormat:",  @"endFail:%ld|",  -[SUCoreDiagStats endFailCount](self, "endFailCount"));
    }
    if (-[SUCoreDiagStats errorCount](self, "errorCount") >= 1) {
      -[__CFString appendFormat:]( v4,  "appendFormat:",  @"error:%ld|",  -[SUCoreDiagStats errorCount](self, "errorCount"));
    }
    if (-[SUCoreDiagStats anomalyCount](self, "anomalyCount") >= 1) {
      -[__CFString appendFormat:]( v4,  "appendFormat:",  @"anomaly:%ld|",  -[SUCoreDiagStats anomalyCount](self, "anomalyCount"));
    }
    if (-[SUCoreDiagStats failureCount](self, "failureCount") >= 1) {
      -[__CFString appendFormat:]( v4,  "appendFormat:",  @"failure:%ld|",  -[SUCoreDiagStats failureCount](self, "failureCount"));
    }
    if (-[SUCoreDiagStats faultCount](self, "faultCount") >= 1) {
      -[__CFString appendFormat:]( v4,  "appendFormat:",  @"fault:%ld|",  -[SUCoreDiagStats faultCount](self, "faultCount"));
    }
  }

  else
  {
    int64_t v4 = @"no-issues";
  }

  return v4;
}

- (BOOL)encounteredProblems
{
  return -[SUCoreDiagStats allIndications](self, "allIndications")
      || -[SUCoreDiagStats endFailCount](self, "endFailCount") > 0
      || -[SUCoreDiagStats errorCount](self, "errorCount") > 0
      || -[SUCoreDiagStats anomalyCount](self, "anomalyCount") > 0
      || -[SUCoreDiagStats failureCount](self, "failureCount") > 0
      || -[SUCoreDiagStats faultCount](self, "faultCount") > 0;
}

- (int64_t)beginCount
{
  return self->_beginCount;
}

- (void)setBeginCount:(int64_t)a3
{
  self->_int64_t beginCount = a3;
}

- (int64_t)endSuccessCount
{
  return self->_endSuccessCount;
}

- (void)setEndSuccessCount:(int64_t)a3
{
  self->_endSuccessCount = a3;
}

- (int64_t)endFailCount
{
  return self->_endFailCount;
}

- (void)setEndFailCount:(int64_t)a3
{
  self->_endFailCount = a3;
}

- (int64_t)endFailIndicationsCount
{
  return self->_endFailIndicationsCount;
}

- (void)setEndFailIndicationsCount:(int64_t)a3
{
  self->_endFailIndicationsCount = a3;
}

- (int64_t)endFailAllIndications
{
  return self->_endFailAllIndications;
}

- (void)setEndFailAllIndications:(int64_t)a3
{
  self->_endFailAllIndications = a3;
}

- (int64_t)errorCount
{
  return self->_errorCount;
}

- (void)setErrorCount:(int64_t)a3
{
  self->_errorCount = a3;
}

- (int64_t)errorIndicationsCount
{
  return self->_errorIndicationsCount;
}

- (void)setErrorIndicationsCount:(int64_t)a3
{
  self->_errorIndicationsCount = a3;
}

- (int64_t)errorAllIndications
{
  return self->_errorAllIndications;
}

- (void)setErrorAllIndications:(int64_t)a3
{
  self->_errorAllIndications = a3;
}

- (int64_t)anomalyCount
{
  return self->_anomalyCount;
}

- (void)setAnomalyCount:(int64_t)a3
{
  self->_anomalyCount = a3;
}

- (int64_t)anomalyIndicationsCount
{
  return self->_anomalyIndicationsCount;
}

- (void)setAnomalyIndicationsCount:(int64_t)a3
{
  self->_anomalyIndicationsCount = a3;
}

- (int64_t)anomalyAllIndications
{
  return self->_anomalyAllIndications;
}

- (void)setAnomalyAllIndications:(int64_t)a3
{
  self->_anomalyAllIndications = a3;
}

- (int64_t)failureCount
{
  return self->_failureCount;
}

- (void)setFailureCount:(int64_t)a3
{
  self->_failureCount = a3;
}

- (int64_t)failureIndicationsCount
{
  return self->_failureIndicationsCount;
}

- (void)setFailureIndicationsCount:(int64_t)a3
{
  self->_failureIndicationsCount = a3;
}

- (int64_t)failureAllIndications
{
  return self->_failureAllIndications;
}

- (void)setFailureAllIndications:(int64_t)a3
{
  self->_failureAllIndications = a3;
}

- (int64_t)faultCount
{
  return self->_faultCount;
}

- (void)setFaultCount:(int64_t)a3
{
  self->_faultCount = a3;
}

- (int64_t)faultIndicationsCount
{
  return self->_faultIndicationsCount;
}

- (void)setFaultIndicationsCount:(int64_t)a3
{
  self->_faultIndicationsCount = a3;
}

- (int64_t)faultAllIndications
{
  return self->_faultAllIndications;
}

- (void)setFaultAllIndications:(int64_t)a3
{
  self->_faultAllIndications = a3;
}

- (int64_t)stateEventCount
{
  return self->_stateEventCount;
}

- (void)setStateEventCount:(int64_t)a3
{
  self->_stateEventCount = a3;
}

@end