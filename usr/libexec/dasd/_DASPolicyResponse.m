@interface _DASPolicyResponse
+ (BOOL)isPolicyDecisionProceedable:(int64_t)a3;
+ (BOOL)isScoreBlocking:(double)a3;
+ (id)abbreviatedDecision:(int64_t)a3;
+ (id)policyResponseWithDecision:(int64_t)a3 validityDuration:(double)a4 rationale:(id)a5;
+ (id)policyResponseWithScore:(double)a3 validityDuration:(double)a4 rationale:(id)a5;
+ (id)prettyDecisionDescription:(int64_t)a3;
- (_DASPolicyResponse)initWithScore:(double)a3 decision:(int64_t)a4 validityDuration:(double)a5 rationale:(id)a6;
- (_DASPolicyResponseRationale)rationale;
- (double)score;
- (double)validityDuration;
- (id)description;
- (int64_t)policyDecision;
- (void)setPolicyDecision:(int64_t)a3;
- (void)setRationale:(id)a3;
- (void)setValidityDuration:(double)a3;
@end

@implementation _DASPolicyResponse

+ (id)prettyDecisionDescription:(int64_t)a3
{
  if (a3 <= 66)
  {
    if (!a3) {
      return @"Can Proceed";
    }
    if (a3 == 33) {
      return @"Must Not Proceed";
    }
  }

  else
  {
    switch(a3)
    {
      case 67LL:
        return @"Must Proceed";
      case 100LL:
        return @"Absolutely Must Not Proceed";
      case 200LL:
        return @"Absolutely Must Proceed";
    }
  }

  return @"Unknown Decision (Proceed)";
}

+ (id)abbreviatedDecision:(int64_t)a3
{
  if (a3 <= 66)
  {
    if (!a3) {
      return @"CP";
    }
    if (a3 == 33) {
      return @"MNP";
    }
  }

  else
  {
    switch(a3)
    {
      case 67LL:
        return @"MP";
      case 100LL:
        return @"AMNP";
      case 200LL:
        return @"AMP";
    }
  }

  return @"UD(P)";
}

- (id)description
{
  int64_t policyDecision = self->_policyDecision;
  double score = self->_score;
  if (self->_rationale)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @", %@",  self->_rationale));
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{%ld, %2.2lf%@}",  policyDecision,  *(void *)&score,  v4));
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{%ld, %2.2lf%@}",  policyDecision,  *(void *)&score,  &stru_100118C98));
  }

  return v5;
}

- (_DASPolicyResponse)initWithScore:(double)a3 decision:(int64_t)a4 validityDuration:(double)a5 rationale:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS____DASPolicyResponse;
  v12 = -[_DASPolicyResponse init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    v12->_double score = a3;
    v12->_int64_t policyDecision = a4;
    v12->_validityDuration = a5;
    objc_storeStrong((id *)&v12->_rationale, a6);
  }

  return v13;
}

+ (id)policyResponseWithDecision:(int64_t)a3 validityDuration:(double)a4 rationale:(id)a5
{
  if (a3 == 100 || a3 == 33) {
    double v8 = 0.0;
  }
  else {
    double v8 = 1.0;
  }
  id v9 = a5;
  v10 = -[_DASPolicyResponse initWithScore:decision:validityDuration:rationale:]( objc_alloc(&OBJC_CLASS____DASPolicyResponse),  "initWithScore:decision:validityDuration:rationale:",  a3,  v9,  v8,  a4);

  return v10;
}

+ (id)policyResponseWithScore:(double)a3 validityDuration:(double)a4 rationale:(id)a5
{
  id v7 = a5;
  double v8 = objc_alloc(&OBJC_CLASS____DASPolicyResponse);
  if (a3 <= 0.0) {
    uint64_t v9 = 33LL;
  }
  else {
    uint64_t v9 = 0LL;
  }
  v10 = -[_DASPolicyResponse initWithScore:decision:validityDuration:rationale:]( v8,  "initWithScore:decision:validityDuration:rationale:",  v9,  v7,  a3,  a4);

  return v10;
}

+ (BOOL)isScoreBlocking:(double)a3
{
  return a3 < 0.00000999999975;
}

+ (BOOL)isPolicyDecisionProceedable:(int64_t)a3
{
  BOOL v3 = a3 == 200;
  if (a3 == 67) {
    BOOL v3 = 1;
  }
  return !a3 || v3;
}

- (double)score
{
  return self->_score;
}

- (int64_t)policyDecision
{
  return self->_policyDecision;
}

- (void)setPolicyDecision:(int64_t)a3
{
  self->_int64_t policyDecision = a3;
}

- (double)validityDuration
{
  return self->_validityDuration;
}

- (void)setValidityDuration:(double)a3
{
  self->_validityDuration = a3;
}

- (_DASPolicyResponseRationale)rationale
{
  return self->_rationale;
}

- (void)setRationale:(id)a3
{
}

- (void).cxx_destruct
{
}

@end